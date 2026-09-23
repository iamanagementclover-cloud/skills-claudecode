import SwiftUI

// Same "Overview" SaaS dashboard as the web mockup, rebuilt with the
// real iOS 26 Liquid Glass APIs from the `liquid-glass-design` skill —
// for comparison against the CSS version in `index.html`.
// Requires Xcode 16+ / iOS 26 SDK to compile and preview.

struct OverviewView: View {
    @State private var translucidite = true
    @State private var frost = true
    @State private var refletsSpeculaires = true
    @State private var showVerification = false
    @Namespace private var glassNamespace

    var body: some View {
        NavigationSplitView {
            sidebar
        } detail: {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    header

                    GlassEffectContainer(spacing: 20) {
                        HStack(alignment: .top, spacing: 20) {
                            statCard(label: "Revenu (30j)", value: "$36,204", meta: "▲ 12.4%") {
                                Button("+ Choisir un plan") {}
                                    .buttonStyle(.glass)
                            }
                            statCard(label: "Utilisateurs actifs", value: "3,527", meta: "▲ 5.8% ce mois")
                            profileCard
                        }
                    }

                    HStack(alignment: .top, spacing: 20) {
                        glassRowsCard
                        buttonsCard
                    }
                }
                .padding(24)
            }
        }
        .confirmationDialog("", isPresented: $showVerification) {
            Button("Confirmer") { showVerification = false }
            Button("Annuler", role: .cancel) { showVerification = false }
        } message: {
            Text("Votre compte est confirmé. La vérification reste valable 12 mois et s'applique à l'ensemble de vos actions.")
        }
    }

    // MARK: - Sidebar

    private var sidebar: some View {
        List {
            Label("Overview", systemImage: "square.grid.2x2")
                .fontWeight(.semibold)
            Label("Analytics", systemImage: "chart.bar")
            Label("Dashboard", systemImage: "rectangle.grid.1x2")
            Label("Projects", systemImage: "clock")
            Label("Team", systemImage: "person.2")
            Spacer()
            Label("Settings", systemImage: "gearshape")
        }
        .navigationTitle("Nimbus")
        // The sidebar's own glass background is applied by the system
        // via NavigationSplitView — no manual .glassEffect() needed here.
    }

    // MARK: - Header

    private var header: some View {
        HStack {
            Text("Overview")
                .font(.largeTitle.bold())
            Spacer()
            GlassEffectContainer(spacing: 12) {
                HStack(spacing: 12) {
                    Button {} label: {
                        Image(systemName: "bell")
                    }
                    .buttonStyle(.glass)

                    Button {} label: {
                        Label("Salemian", systemImage: "chevron.down")
                            .labelStyle(.titleAndIcon)
                    }
                    .buttonStyle(.glass)
                }
            }
        }
    }

    // MARK: - Cards

    private func statCard<Extra: View>(
        label: String, value: String, meta: String, @ViewBuilder extra: () -> Extra = { EmptyView() }
    ) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label).font(.subheadline).foregroundStyle(.secondary)
            Text(value).font(.system(size: 32, weight: .bold))
            Text(meta).font(.caption).foregroundStyle(.green)
            extra()
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .glassEffect(.regular, in: .rect(cornerRadius: 20))
    }

    private var profileCard: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Profil").font(.headline)
            TextField("Prénom", text: .constant(""))
                .textFieldStyle(.plain)
                .padding(10)
                .glassEffect(.regular, in: .rect(cornerRadius: 12))
            SecureField("Statut", text: .constant("verified"))
                .textFieldStyle(.plain)
                .padding(10)
                .glassEffect(.regular, in: .rect(cornerRadius: 12))
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .glassEffect(.regular, in: .rect(cornerRadius: 20))
    }

    // MARK: - Glass settings rows

    private var glassRowsCard: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Apparence du verre").font(.headline).padding(.bottom, 8)

            glassRow(icon: "rectangle.portrait", title: "Translucidité",
                     desc: "Légère teinte colorée sur toutes les surfaces", isOn: $translucidite)
            glassRow(icon: "drop", title: "Frost",
                     desc: "Réfraction douce de l'arrière-plan", isOn: $frost)
            glassRow(icon: "sparkles", title: "Reflets spéculaires",
                     desc: "Halo lumineux fin sur les bords supérieurs", isOn: $refletsSpeculaires)

            HStack {
                Image(systemName: "square.grid.2x2")
                    .frame(width: 34, height: 34)
                    .glassEffect(.regular, in: .rect(cornerRadius: 10))
                VStack(alignment: .leading) {
                    Text("Bordures nettes").font(.subheadline.weight(.semibold))
                    Text("Contour très fin, capte la lumière").font(.caption).foregroundStyle(.secondary)
                }
                Spacer()
                Text("Premium")
                    .font(.caption.weight(.semibold))
                    .padding(.horizontal, 12).padding(.vertical, 4)
                    .glassEffect(.regular.tint(.green), in: .capsule)
            }
            .padding(.vertical, 8)
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .glassEffect(.regular, in: .rect(cornerRadius: 24))
    }

    private func glassRow(icon: String, title: String, desc: String, isOn: Binding<Bool>) -> some View {
        HStack {
            Image(systemName: icon)
                .frame(width: 34, height: 34)
                .glassEffect(.regular, in: .rect(cornerRadius: 10))
            VStack(alignment: .leading) {
                Text(title).font(.subheadline.weight(.semibold))
                Text(desc).font(.caption).foregroundStyle(.secondary)
            }
            Spacer()
            Toggle("", isOn: isOn)
                .labelsHidden()
                .tint(.green)
        }
        .padding(.vertical, 8)
    }

    // MARK: - Buttons

    private var buttonsCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Boutons").font(.headline)

            GlassEffectContainer(spacing: 12) {
                VStack(spacing: 12) {
                    Button("Glass Button") {}
                        .buttonStyle(.glass)
                        .frame(maxWidth: .infinity)

                    Button("Elevated Glass Button") {}
                        .buttonStyle(.glass)
                        .glassEffect(.regular.interactive(), in: .capsule)
                        .frame(maxWidth: .infinity)

                    Button("Primary Glass Button") { showVerification = true }
                        .buttonStyle(.glassProminent)
                        .frame(maxWidth: .infinity)
                }
            }
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .glassEffect(.regular, in: .rect(cornerRadius: 20))
    }
}

#Preview {
    OverviewView()
}
