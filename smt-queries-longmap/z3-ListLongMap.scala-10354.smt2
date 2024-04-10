; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121874 () Bool)

(assert start!121874)

(declare-fun e!800677 () Bool)

(declare-datatypes ((array!96623 0))(
  ( (array!96624 (arr!46644 (Array (_ BitVec 32) (_ BitVec 64))) (size!47194 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96623)

(declare-datatypes ((SeekEntryResult!10955 0))(
  ( (MissingZero!10955 (index!46209 (_ BitVec 32))) (Found!10955 (index!46210 (_ BitVec 32))) (Intermediate!10955 (undefined!11767 Bool) (index!46211 (_ BitVec 32)) (x!127814 (_ BitVec 32))) (Undefined!10955) (MissingVacant!10955 (index!46212 (_ BitVec 32))) )
))
(declare-fun lt!623728 () SeekEntryResult!10955)

(declare-fun lt!623729 () (_ BitVec 32))

(declare-fun b!1414737 () Bool)

(declare-fun lt!623726 () SeekEntryResult!10955)

(assert (=> b!1414737 (= e!800677 (or (bvslt (x!127814 lt!623726) #b00000000000000000000000000000000) (bvsgt (x!127814 lt!623726) #b01111111111111111111111111111110) (bvslt (x!127814 lt!623728) #b00000000000000000000000000000000) (bvsgt (x!127814 lt!623728) #b01111111111111111111111111111110) (bvslt lt!623729 #b00000000000000000000000000000000) (bvsge lt!623729 (size!47194 a!2901)) (and (bvsge (index!46211 lt!623726) #b00000000000000000000000000000000) (bvslt (index!46211 lt!623726) (size!47194 a!2901)))))))

(declare-fun e!800678 () Bool)

(assert (=> b!1414737 e!800678))

(declare-fun res!951025 () Bool)

(assert (=> b!1414737 (=> (not res!951025) (not e!800678))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1414737 (= res!951025 (and (not (undefined!11767 lt!623728)) (= (index!46211 lt!623728) i!1037) (bvslt (x!127814 lt!623728) (x!127814 lt!623726)) (= (select (store (arr!46644 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46211 lt!623728)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((Unit!47884 0))(
  ( (Unit!47885) )
))
(declare-fun lt!623727 () Unit!47884)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96623 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47884)

(assert (=> b!1414737 (= lt!623727 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623729 (x!127814 lt!623726) (index!46211 lt!623726) (x!127814 lt!623728) (index!46211 lt!623728) (undefined!11767 lt!623728) mask!2840))))

(declare-fun b!1414738 () Bool)

(declare-fun lt!623725 () (_ BitVec 64))

(declare-fun lt!623730 () array!96623)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96623 (_ BitVec 32)) SeekEntryResult!10955)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96623 (_ BitVec 32)) SeekEntryResult!10955)

(assert (=> b!1414738 (= e!800678 (= (seekEntryOrOpen!0 lt!623725 lt!623730 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127814 lt!623728) (index!46211 lt!623728) (index!46211 lt!623728) (select (arr!46644 a!2901) j!112) lt!623730 mask!2840)))))

(declare-fun b!1414739 () Bool)

(declare-fun e!800679 () Bool)

(declare-fun e!800676 () Bool)

(assert (=> b!1414739 (= e!800679 (not e!800676))))

(declare-fun res!951018 () Bool)

(assert (=> b!1414739 (=> res!951018 e!800676)))

(get-info :version)

(assert (=> b!1414739 (= res!951018 (or (not ((_ is Intermediate!10955) lt!623726)) (undefined!11767 lt!623726)))))

(declare-fun e!800681 () Bool)

(assert (=> b!1414739 e!800681))

(declare-fun res!951022 () Bool)

(assert (=> b!1414739 (=> (not res!951022) (not e!800681))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96623 (_ BitVec 32)) Bool)

(assert (=> b!1414739 (= res!951022 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!623724 () Unit!47884)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96623 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47884)

(assert (=> b!1414739 (= lt!623724 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96623 (_ BitVec 32)) SeekEntryResult!10955)

(assert (=> b!1414739 (= lt!623726 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623729 (select (arr!46644 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1414739 (= lt!623729 (toIndex!0 (select (arr!46644 a!2901) j!112) mask!2840))))

(declare-fun res!951016 () Bool)

(assert (=> start!121874 (=> (not res!951016) (not e!800679))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121874 (= res!951016 (validMask!0 mask!2840))))

(assert (=> start!121874 e!800679))

(assert (=> start!121874 true))

(declare-fun array_inv!35672 (array!96623) Bool)

(assert (=> start!121874 (array_inv!35672 a!2901)))

(declare-fun b!1414740 () Bool)

(assert (=> b!1414740 (= e!800681 (= (seekEntryOrOpen!0 (select (arr!46644 a!2901) j!112) a!2901 mask!2840) (Found!10955 j!112)))))

(declare-fun b!1414741 () Bool)

(declare-fun res!951021 () Bool)

(assert (=> b!1414741 (=> (not res!951021) (not e!800679))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1414741 (= res!951021 (validKeyInArray!0 (select (arr!46644 a!2901) j!112)))))

(declare-fun b!1414742 () Bool)

(assert (=> b!1414742 (= e!800676 e!800677)))

(declare-fun res!951024 () Bool)

(assert (=> b!1414742 (=> res!951024 e!800677)))

(assert (=> b!1414742 (= res!951024 (or (= lt!623726 lt!623728) (not ((_ is Intermediate!10955) lt!623728))))))

(assert (=> b!1414742 (= lt!623728 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623725 mask!2840) lt!623725 lt!623730 mask!2840))))

(assert (=> b!1414742 (= lt!623725 (select (store (arr!46644 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1414742 (= lt!623730 (array!96624 (store (arr!46644 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47194 a!2901)))))

(declare-fun b!1414743 () Bool)

(declare-fun res!951019 () Bool)

(assert (=> b!1414743 (=> (not res!951019) (not e!800679))))

(declare-datatypes ((List!33163 0))(
  ( (Nil!33160) (Cons!33159 (h!34443 (_ BitVec 64)) (t!47857 List!33163)) )
))
(declare-fun arrayNoDuplicates!0 (array!96623 (_ BitVec 32) List!33163) Bool)

(assert (=> b!1414743 (= res!951019 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33160))))

(declare-fun b!1414744 () Bool)

(declare-fun res!951020 () Bool)

(assert (=> b!1414744 (=> (not res!951020) (not e!800679))))

(assert (=> b!1414744 (= res!951020 (validKeyInArray!0 (select (arr!46644 a!2901) i!1037)))))

(declare-fun b!1414745 () Bool)

(declare-fun res!951017 () Bool)

(assert (=> b!1414745 (=> (not res!951017) (not e!800679))))

(assert (=> b!1414745 (= res!951017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1414746 () Bool)

(declare-fun res!951023 () Bool)

(assert (=> b!1414746 (=> (not res!951023) (not e!800679))))

(assert (=> b!1414746 (= res!951023 (and (= (size!47194 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47194 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47194 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121874 res!951016) b!1414746))

(assert (= (and b!1414746 res!951023) b!1414744))

(assert (= (and b!1414744 res!951020) b!1414741))

(assert (= (and b!1414741 res!951021) b!1414745))

(assert (= (and b!1414745 res!951017) b!1414743))

(assert (= (and b!1414743 res!951019) b!1414739))

(assert (= (and b!1414739 res!951022) b!1414740))

(assert (= (and b!1414739 (not res!951018)) b!1414742))

(assert (= (and b!1414742 (not res!951024)) b!1414737))

(assert (= (and b!1414737 res!951025) b!1414738))

(declare-fun m!1304973 () Bool)

(assert (=> b!1414741 m!1304973))

(assert (=> b!1414741 m!1304973))

(declare-fun m!1304975 () Bool)

(assert (=> b!1414741 m!1304975))

(declare-fun m!1304977 () Bool)

(assert (=> b!1414743 m!1304977))

(assert (=> b!1414740 m!1304973))

(assert (=> b!1414740 m!1304973))

(declare-fun m!1304979 () Bool)

(assert (=> b!1414740 m!1304979))

(declare-fun m!1304981 () Bool)

(assert (=> b!1414737 m!1304981))

(declare-fun m!1304983 () Bool)

(assert (=> b!1414737 m!1304983))

(declare-fun m!1304985 () Bool)

(assert (=> b!1414737 m!1304985))

(declare-fun m!1304987 () Bool)

(assert (=> b!1414745 m!1304987))

(declare-fun m!1304989 () Bool)

(assert (=> b!1414744 m!1304989))

(assert (=> b!1414744 m!1304989))

(declare-fun m!1304991 () Bool)

(assert (=> b!1414744 m!1304991))

(declare-fun m!1304993 () Bool)

(assert (=> start!121874 m!1304993))

(declare-fun m!1304995 () Bool)

(assert (=> start!121874 m!1304995))

(assert (=> b!1414739 m!1304973))

(declare-fun m!1304997 () Bool)

(assert (=> b!1414739 m!1304997))

(declare-fun m!1304999 () Bool)

(assert (=> b!1414739 m!1304999))

(declare-fun m!1305001 () Bool)

(assert (=> b!1414739 m!1305001))

(assert (=> b!1414739 m!1304973))

(declare-fun m!1305003 () Bool)

(assert (=> b!1414739 m!1305003))

(assert (=> b!1414739 m!1304973))

(declare-fun m!1305005 () Bool)

(assert (=> b!1414742 m!1305005))

(assert (=> b!1414742 m!1305005))

(declare-fun m!1305007 () Bool)

(assert (=> b!1414742 m!1305007))

(assert (=> b!1414742 m!1304981))

(declare-fun m!1305009 () Bool)

(assert (=> b!1414742 m!1305009))

(declare-fun m!1305011 () Bool)

(assert (=> b!1414738 m!1305011))

(assert (=> b!1414738 m!1304973))

(assert (=> b!1414738 m!1304973))

(declare-fun m!1305013 () Bool)

(assert (=> b!1414738 m!1305013))

(check-sat (not b!1414739) (not b!1414744) (not b!1414741) (not b!1414743) (not start!121874) (not b!1414737) (not b!1414745) (not b!1414742) (not b!1414740) (not b!1414738))
(check-sat)
(get-model)

(declare-fun d!152415 () Bool)

(assert (=> d!152415 (= (validKeyInArray!0 (select (arr!46644 a!2901) i!1037)) (and (not (= (select (arr!46644 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46644 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1414744 d!152415))

(declare-fun e!800706 () SeekEntryResult!10955)

(declare-fun lt!623759 () SeekEntryResult!10955)

(declare-fun b!1414789 () Bool)

(assert (=> b!1414789 (= e!800706 (seekKeyOrZeroReturnVacant!0 (x!127814 lt!623759) (index!46211 lt!623759) (index!46211 lt!623759) lt!623725 lt!623730 mask!2840))))

(declare-fun b!1414790 () Bool)

(declare-fun e!800707 () SeekEntryResult!10955)

(declare-fun e!800708 () SeekEntryResult!10955)

(assert (=> b!1414790 (= e!800707 e!800708)))

(declare-fun lt!623758 () (_ BitVec 64))

(assert (=> b!1414790 (= lt!623758 (select (arr!46644 lt!623730) (index!46211 lt!623759)))))

(declare-fun c!131344 () Bool)

(assert (=> b!1414790 (= c!131344 (= lt!623758 lt!623725))))

(declare-fun b!1414791 () Bool)

(assert (=> b!1414791 (= e!800706 (MissingZero!10955 (index!46211 lt!623759)))))

(declare-fun b!1414792 () Bool)

(assert (=> b!1414792 (= e!800707 Undefined!10955)))

(declare-fun b!1414793 () Bool)

(assert (=> b!1414793 (= e!800708 (Found!10955 (index!46211 lt!623759)))))

(declare-fun b!1414794 () Bool)

(declare-fun c!131345 () Bool)

(assert (=> b!1414794 (= c!131345 (= lt!623758 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1414794 (= e!800708 e!800706)))

(declare-fun d!152417 () Bool)

(declare-fun lt!623760 () SeekEntryResult!10955)

(assert (=> d!152417 (and (or ((_ is Undefined!10955) lt!623760) (not ((_ is Found!10955) lt!623760)) (and (bvsge (index!46210 lt!623760) #b00000000000000000000000000000000) (bvslt (index!46210 lt!623760) (size!47194 lt!623730)))) (or ((_ is Undefined!10955) lt!623760) ((_ is Found!10955) lt!623760) (not ((_ is MissingZero!10955) lt!623760)) (and (bvsge (index!46209 lt!623760) #b00000000000000000000000000000000) (bvslt (index!46209 lt!623760) (size!47194 lt!623730)))) (or ((_ is Undefined!10955) lt!623760) ((_ is Found!10955) lt!623760) ((_ is MissingZero!10955) lt!623760) (not ((_ is MissingVacant!10955) lt!623760)) (and (bvsge (index!46212 lt!623760) #b00000000000000000000000000000000) (bvslt (index!46212 lt!623760) (size!47194 lt!623730)))) (or ((_ is Undefined!10955) lt!623760) (ite ((_ is Found!10955) lt!623760) (= (select (arr!46644 lt!623730) (index!46210 lt!623760)) lt!623725) (ite ((_ is MissingZero!10955) lt!623760) (= (select (arr!46644 lt!623730) (index!46209 lt!623760)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10955) lt!623760) (= (select (arr!46644 lt!623730) (index!46212 lt!623760)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!152417 (= lt!623760 e!800707)))

(declare-fun c!131346 () Bool)

(assert (=> d!152417 (= c!131346 (and ((_ is Intermediate!10955) lt!623759) (undefined!11767 lt!623759)))))

(assert (=> d!152417 (= lt!623759 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623725 mask!2840) lt!623725 lt!623730 mask!2840))))

(assert (=> d!152417 (validMask!0 mask!2840)))

(assert (=> d!152417 (= (seekEntryOrOpen!0 lt!623725 lt!623730 mask!2840) lt!623760)))

(assert (= (and d!152417 c!131346) b!1414792))

(assert (= (and d!152417 (not c!131346)) b!1414790))

(assert (= (and b!1414790 c!131344) b!1414793))

(assert (= (and b!1414790 (not c!131344)) b!1414794))

(assert (= (and b!1414794 c!131345) b!1414791))

(assert (= (and b!1414794 (not c!131345)) b!1414789))

(declare-fun m!1305057 () Bool)

(assert (=> b!1414789 m!1305057))

(declare-fun m!1305059 () Bool)

(assert (=> b!1414790 m!1305059))

(declare-fun m!1305061 () Bool)

(assert (=> d!152417 m!1305061))

(assert (=> d!152417 m!1305005))

(assert (=> d!152417 m!1304993))

(declare-fun m!1305063 () Bool)

(assert (=> d!152417 m!1305063))

(declare-fun m!1305065 () Bool)

(assert (=> d!152417 m!1305065))

(assert (=> d!152417 m!1305005))

(assert (=> d!152417 m!1305007))

(assert (=> b!1414738 d!152417))

(declare-fun d!152419 () Bool)

(declare-fun lt!623766 () SeekEntryResult!10955)

(assert (=> d!152419 (and (or ((_ is Undefined!10955) lt!623766) (not ((_ is Found!10955) lt!623766)) (and (bvsge (index!46210 lt!623766) #b00000000000000000000000000000000) (bvslt (index!46210 lt!623766) (size!47194 lt!623730)))) (or ((_ is Undefined!10955) lt!623766) ((_ is Found!10955) lt!623766) (not ((_ is MissingVacant!10955) lt!623766)) (not (= (index!46212 lt!623766) (index!46211 lt!623728))) (and (bvsge (index!46212 lt!623766) #b00000000000000000000000000000000) (bvslt (index!46212 lt!623766) (size!47194 lt!623730)))) (or ((_ is Undefined!10955) lt!623766) (ite ((_ is Found!10955) lt!623766) (= (select (arr!46644 lt!623730) (index!46210 lt!623766)) (select (arr!46644 a!2901) j!112)) (and ((_ is MissingVacant!10955) lt!623766) (= (index!46212 lt!623766) (index!46211 lt!623728)) (= (select (arr!46644 lt!623730) (index!46212 lt!623766)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!800716 () SeekEntryResult!10955)

(assert (=> d!152419 (= lt!623766 e!800716)))

(declare-fun c!131355 () Bool)

(assert (=> d!152419 (= c!131355 (bvsge (x!127814 lt!623728) #b01111111111111111111111111111110))))

(declare-fun lt!623765 () (_ BitVec 64))

(assert (=> d!152419 (= lt!623765 (select (arr!46644 lt!623730) (index!46211 lt!623728)))))

(assert (=> d!152419 (validMask!0 mask!2840)))

(assert (=> d!152419 (= (seekKeyOrZeroReturnVacant!0 (x!127814 lt!623728) (index!46211 lt!623728) (index!46211 lt!623728) (select (arr!46644 a!2901) j!112) lt!623730 mask!2840) lt!623766)))

(declare-fun b!1414807 () Bool)

(declare-fun e!800717 () SeekEntryResult!10955)

(assert (=> b!1414807 (= e!800717 (Found!10955 (index!46211 lt!623728)))))

(declare-fun b!1414808 () Bool)

(assert (=> b!1414808 (= e!800716 e!800717)))

(declare-fun c!131353 () Bool)

(assert (=> b!1414808 (= c!131353 (= lt!623765 (select (arr!46644 a!2901) j!112)))))

(declare-fun b!1414809 () Bool)

(declare-fun e!800715 () SeekEntryResult!10955)

(assert (=> b!1414809 (= e!800715 (MissingVacant!10955 (index!46211 lt!623728)))))

(declare-fun b!1414810 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1414810 (= e!800715 (seekKeyOrZeroReturnVacant!0 (bvadd (x!127814 lt!623728) #b00000000000000000000000000000001) (nextIndex!0 (index!46211 lt!623728) (x!127814 lt!623728) mask!2840) (index!46211 lt!623728) (select (arr!46644 a!2901) j!112) lt!623730 mask!2840))))

(declare-fun b!1414811 () Bool)

(declare-fun c!131354 () Bool)

(assert (=> b!1414811 (= c!131354 (= lt!623765 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1414811 (= e!800717 e!800715)))

(declare-fun b!1414812 () Bool)

(assert (=> b!1414812 (= e!800716 Undefined!10955)))

(assert (= (and d!152419 c!131355) b!1414812))

(assert (= (and d!152419 (not c!131355)) b!1414808))

(assert (= (and b!1414808 c!131353) b!1414807))

(assert (= (and b!1414808 (not c!131353)) b!1414811))

(assert (= (and b!1414811 c!131354) b!1414809))

(assert (= (and b!1414811 (not c!131354)) b!1414810))

(declare-fun m!1305067 () Bool)

(assert (=> d!152419 m!1305067))

(declare-fun m!1305069 () Bool)

(assert (=> d!152419 m!1305069))

(declare-fun m!1305071 () Bool)

(assert (=> d!152419 m!1305071))

(assert (=> d!152419 m!1304993))

(declare-fun m!1305073 () Bool)

(assert (=> b!1414810 m!1305073))

(assert (=> b!1414810 m!1305073))

(assert (=> b!1414810 m!1304973))

(declare-fun m!1305075 () Bool)

(assert (=> b!1414810 m!1305075))

(assert (=> b!1414738 d!152419))

(declare-fun d!152425 () Bool)

(assert (=> d!152425 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121874 d!152425))

(declare-fun d!152429 () Bool)

(assert (=> d!152429 (= (array_inv!35672 a!2901) (bvsge (size!47194 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121874 d!152429))

(declare-fun b!1414857 () Bool)

(declare-fun e!800748 () Bool)

(declare-fun e!800747 () Bool)

(assert (=> b!1414857 (= e!800748 e!800747)))

(declare-fun c!131370 () Bool)

(assert (=> b!1414857 (= c!131370 (validKeyInArray!0 (select (arr!46644 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1414858 () Bool)

(declare-fun call!67165 () Bool)

(assert (=> b!1414858 (= e!800747 call!67165)))

(declare-fun b!1414859 () Bool)

(assert (=> b!1414859 (= e!800747 call!67165)))

(declare-fun bm!67162 () Bool)

(assert (=> bm!67162 (= call!67165 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131370 (Cons!33159 (select (arr!46644 a!2901) #b00000000000000000000000000000000) Nil!33160) Nil!33160)))))

(declare-fun b!1414860 () Bool)

(declare-fun e!800749 () Bool)

(assert (=> b!1414860 (= e!800749 e!800748)))

(declare-fun res!951073 () Bool)

(assert (=> b!1414860 (=> (not res!951073) (not e!800748))))

(declare-fun e!800750 () Bool)

(assert (=> b!1414860 (= res!951073 (not e!800750))))

(declare-fun res!951072 () Bool)

(assert (=> b!1414860 (=> (not res!951072) (not e!800750))))

(assert (=> b!1414860 (= res!951072 (validKeyInArray!0 (select (arr!46644 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1414856 () Bool)

(declare-fun contains!9822 (List!33163 (_ BitVec 64)) Bool)

(assert (=> b!1414856 (= e!800750 (contains!9822 Nil!33160 (select (arr!46644 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!152433 () Bool)

(declare-fun res!951071 () Bool)

(assert (=> d!152433 (=> res!951071 e!800749)))

(assert (=> d!152433 (= res!951071 (bvsge #b00000000000000000000000000000000 (size!47194 a!2901)))))

(assert (=> d!152433 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33160) e!800749)))

(assert (= (and d!152433 (not res!951071)) b!1414860))

(assert (= (and b!1414860 res!951072) b!1414856))

(assert (= (and b!1414860 res!951073) b!1414857))

(assert (= (and b!1414857 c!131370) b!1414859))

(assert (= (and b!1414857 (not c!131370)) b!1414858))

(assert (= (or b!1414859 b!1414858) bm!67162))

(declare-fun m!1305095 () Bool)

(assert (=> b!1414857 m!1305095))

(assert (=> b!1414857 m!1305095))

(declare-fun m!1305097 () Bool)

(assert (=> b!1414857 m!1305097))

(assert (=> bm!67162 m!1305095))

(declare-fun m!1305099 () Bool)

(assert (=> bm!67162 m!1305099))

(assert (=> b!1414860 m!1305095))

(assert (=> b!1414860 m!1305095))

(assert (=> b!1414860 m!1305097))

(assert (=> b!1414856 m!1305095))

(assert (=> b!1414856 m!1305095))

(declare-fun m!1305101 () Bool)

(assert (=> b!1414856 m!1305101))

(assert (=> b!1414743 d!152433))

(declare-fun d!152435 () Bool)

(assert (=> d!152435 (and (not (undefined!11767 lt!623728)) (= (index!46211 lt!623728) i!1037) (bvslt (x!127814 lt!623728) (x!127814 lt!623726)))))

(declare-fun lt!623778 () Unit!47884)

(declare-fun choose!62 (array!96623 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47884)

(assert (=> d!152435 (= lt!623778 (choose!62 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623729 (x!127814 lt!623726) (index!46211 lt!623726) (x!127814 lt!623728) (index!46211 lt!623728) (undefined!11767 lt!623728) mask!2840))))

(assert (=> d!152435 (validMask!0 mask!2840)))

(assert (=> d!152435 (= (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623729 (x!127814 lt!623726) (index!46211 lt!623726) (x!127814 lt!623728) (index!46211 lt!623728) (undefined!11767 lt!623728) mask!2840) lt!623778)))

(declare-fun bs!41243 () Bool)

(assert (= bs!41243 d!152435))

(declare-fun m!1305103 () Bool)

(assert (=> bs!41243 m!1305103))

(assert (=> bs!41243 m!1304993))

(assert (=> b!1414737 d!152435))

(declare-fun e!800787 () SeekEntryResult!10955)

(declare-fun b!1414927 () Bool)

(assert (=> b!1414927 (= e!800787 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!623725 mask!2840) #b00000000000000000000000000000000 mask!2840) lt!623725 lt!623730 mask!2840))))

(declare-fun b!1414928 () Bool)

(declare-fun lt!623803 () SeekEntryResult!10955)

(assert (=> b!1414928 (and (bvsge (index!46211 lt!623803) #b00000000000000000000000000000000) (bvslt (index!46211 lt!623803) (size!47194 lt!623730)))))

(declare-fun res!951082 () Bool)

(assert (=> b!1414928 (= res!951082 (= (select (arr!46644 lt!623730) (index!46211 lt!623803)) lt!623725))))

(declare-fun e!800786 () Bool)

(assert (=> b!1414928 (=> res!951082 e!800786)))

(declare-fun e!800789 () Bool)

(assert (=> b!1414928 (= e!800789 e!800786)))

(declare-fun b!1414929 () Bool)

(declare-fun e!800785 () Bool)

(assert (=> b!1414929 (= e!800785 e!800789)))

(declare-fun res!951080 () Bool)

(assert (=> b!1414929 (= res!951080 (and ((_ is Intermediate!10955) lt!623803) (not (undefined!11767 lt!623803)) (bvslt (x!127814 lt!623803) #b01111111111111111111111111111110) (bvsge (x!127814 lt!623803) #b00000000000000000000000000000000) (bvsge (x!127814 lt!623803) #b00000000000000000000000000000000)))))

(assert (=> b!1414929 (=> (not res!951080) (not e!800789))))

(declare-fun b!1414930 () Bool)

(assert (=> b!1414930 (and (bvsge (index!46211 lt!623803) #b00000000000000000000000000000000) (bvslt (index!46211 lt!623803) (size!47194 lt!623730)))))

(assert (=> b!1414930 (= e!800786 (= (select (arr!46644 lt!623730) (index!46211 lt!623803)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1414931 () Bool)

(assert (=> b!1414931 (= e!800785 (bvsge (x!127814 lt!623803) #b01111111111111111111111111111110))))

(declare-fun b!1414932 () Bool)

(declare-fun e!800788 () SeekEntryResult!10955)

(assert (=> b!1414932 (= e!800788 (Intermediate!10955 true (toIndex!0 lt!623725 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1414933 () Bool)

(assert (=> b!1414933 (= e!800788 e!800787)))

(declare-fun c!131401 () Bool)

(declare-fun lt!623802 () (_ BitVec 64))

(assert (=> b!1414933 (= c!131401 (or (= lt!623802 lt!623725) (= (bvadd lt!623802 lt!623802) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!152437 () Bool)

(assert (=> d!152437 e!800785))

(declare-fun c!131403 () Bool)

(assert (=> d!152437 (= c!131403 (and ((_ is Intermediate!10955) lt!623803) (undefined!11767 lt!623803)))))

(assert (=> d!152437 (= lt!623803 e!800788)))

(declare-fun c!131402 () Bool)

(assert (=> d!152437 (= c!131402 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!152437 (= lt!623802 (select (arr!46644 lt!623730) (toIndex!0 lt!623725 mask!2840)))))

(assert (=> d!152437 (validMask!0 mask!2840)))

(assert (=> d!152437 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623725 mask!2840) lt!623725 lt!623730 mask!2840) lt!623803)))

(declare-fun b!1414934 () Bool)

(assert (=> b!1414934 (and (bvsge (index!46211 lt!623803) #b00000000000000000000000000000000) (bvslt (index!46211 lt!623803) (size!47194 lt!623730)))))

(declare-fun res!951081 () Bool)

(assert (=> b!1414934 (= res!951081 (= (select (arr!46644 lt!623730) (index!46211 lt!623803)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1414934 (=> res!951081 e!800786)))

(declare-fun b!1414935 () Bool)

(assert (=> b!1414935 (= e!800787 (Intermediate!10955 false (toIndex!0 lt!623725 mask!2840) #b00000000000000000000000000000000))))

(assert (= (and d!152437 c!131402) b!1414932))

(assert (= (and d!152437 (not c!131402)) b!1414933))

(assert (= (and b!1414933 c!131401) b!1414935))

(assert (= (and b!1414933 (not c!131401)) b!1414927))

(assert (= (and d!152437 c!131403) b!1414931))

(assert (= (and d!152437 (not c!131403)) b!1414929))

(assert (= (and b!1414929 res!951080) b!1414928))

(assert (= (and b!1414928 (not res!951082)) b!1414934))

(assert (= (and b!1414934 (not res!951081)) b!1414930))

(declare-fun m!1305125 () Bool)

(assert (=> b!1414934 m!1305125))

(assert (=> b!1414928 m!1305125))

(assert (=> b!1414930 m!1305125))

(assert (=> b!1414927 m!1305005))

(declare-fun m!1305127 () Bool)

(assert (=> b!1414927 m!1305127))

(assert (=> b!1414927 m!1305127))

(declare-fun m!1305129 () Bool)

(assert (=> b!1414927 m!1305129))

(assert (=> d!152437 m!1305005))

(declare-fun m!1305131 () Bool)

(assert (=> d!152437 m!1305131))

(assert (=> d!152437 m!1304993))

(assert (=> b!1414742 d!152437))

(declare-fun d!152443 () Bool)

(declare-fun lt!623815 () (_ BitVec 32))

(declare-fun lt!623814 () (_ BitVec 32))

(assert (=> d!152443 (= lt!623815 (bvmul (bvxor lt!623814 (bvlshr lt!623814 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152443 (= lt!623814 ((_ extract 31 0) (bvand (bvxor lt!623725 (bvlshr lt!623725 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152443 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!951083 (let ((h!34445 ((_ extract 31 0) (bvand (bvxor lt!623725 (bvlshr lt!623725 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127822 (bvmul (bvxor h!34445 (bvlshr h!34445 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127822 (bvlshr x!127822 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!951083 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!951083 #b00000000000000000000000000000000))))))

(assert (=> d!152443 (= (toIndex!0 lt!623725 mask!2840) (bvand (bvxor lt!623815 (bvlshr lt!623815 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1414742 d!152443))

(declare-fun d!152447 () Bool)

(assert (=> d!152447 (= (validKeyInArray!0 (select (arr!46644 a!2901) j!112)) (and (not (= (select (arr!46644 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46644 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1414741 d!152447))

(declare-fun lt!623819 () SeekEntryResult!10955)

(declare-fun b!1414969 () Bool)

(declare-fun e!800808 () SeekEntryResult!10955)

(assert (=> b!1414969 (= e!800808 (seekKeyOrZeroReturnVacant!0 (x!127814 lt!623819) (index!46211 lt!623819) (index!46211 lt!623819) (select (arr!46644 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1414970 () Bool)

(declare-fun e!800809 () SeekEntryResult!10955)

(declare-fun e!800810 () SeekEntryResult!10955)

(assert (=> b!1414970 (= e!800809 e!800810)))

(declare-fun lt!623818 () (_ BitVec 64))

(assert (=> b!1414970 (= lt!623818 (select (arr!46644 a!2901) (index!46211 lt!623819)))))

(declare-fun c!131416 () Bool)

(assert (=> b!1414970 (= c!131416 (= lt!623818 (select (arr!46644 a!2901) j!112)))))

(declare-fun b!1414971 () Bool)

(assert (=> b!1414971 (= e!800808 (MissingZero!10955 (index!46211 lt!623819)))))

(declare-fun b!1414972 () Bool)

(assert (=> b!1414972 (= e!800809 Undefined!10955)))

(declare-fun b!1414973 () Bool)

(assert (=> b!1414973 (= e!800810 (Found!10955 (index!46211 lt!623819)))))

(declare-fun b!1414974 () Bool)

(declare-fun c!131417 () Bool)

(assert (=> b!1414974 (= c!131417 (= lt!623818 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1414974 (= e!800810 e!800808)))

(declare-fun d!152449 () Bool)

(declare-fun lt!623820 () SeekEntryResult!10955)

(assert (=> d!152449 (and (or ((_ is Undefined!10955) lt!623820) (not ((_ is Found!10955) lt!623820)) (and (bvsge (index!46210 lt!623820) #b00000000000000000000000000000000) (bvslt (index!46210 lt!623820) (size!47194 a!2901)))) (or ((_ is Undefined!10955) lt!623820) ((_ is Found!10955) lt!623820) (not ((_ is MissingZero!10955) lt!623820)) (and (bvsge (index!46209 lt!623820) #b00000000000000000000000000000000) (bvslt (index!46209 lt!623820) (size!47194 a!2901)))) (or ((_ is Undefined!10955) lt!623820) ((_ is Found!10955) lt!623820) ((_ is MissingZero!10955) lt!623820) (not ((_ is MissingVacant!10955) lt!623820)) (and (bvsge (index!46212 lt!623820) #b00000000000000000000000000000000) (bvslt (index!46212 lt!623820) (size!47194 a!2901)))) (or ((_ is Undefined!10955) lt!623820) (ite ((_ is Found!10955) lt!623820) (= (select (arr!46644 a!2901) (index!46210 lt!623820)) (select (arr!46644 a!2901) j!112)) (ite ((_ is MissingZero!10955) lt!623820) (= (select (arr!46644 a!2901) (index!46209 lt!623820)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10955) lt!623820) (= (select (arr!46644 a!2901) (index!46212 lt!623820)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!152449 (= lt!623820 e!800809)))

(declare-fun c!131418 () Bool)

(assert (=> d!152449 (= c!131418 (and ((_ is Intermediate!10955) lt!623819) (undefined!11767 lt!623819)))))

(assert (=> d!152449 (= lt!623819 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46644 a!2901) j!112) mask!2840) (select (arr!46644 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!152449 (validMask!0 mask!2840)))

(assert (=> d!152449 (= (seekEntryOrOpen!0 (select (arr!46644 a!2901) j!112) a!2901 mask!2840) lt!623820)))

(assert (= (and d!152449 c!131418) b!1414972))

(assert (= (and d!152449 (not c!131418)) b!1414970))

(assert (= (and b!1414970 c!131416) b!1414973))

(assert (= (and b!1414970 (not c!131416)) b!1414974))

(assert (= (and b!1414974 c!131417) b!1414971))

(assert (= (and b!1414974 (not c!131417)) b!1414969))

(assert (=> b!1414969 m!1304973))

(declare-fun m!1305149 () Bool)

(assert (=> b!1414969 m!1305149))

(declare-fun m!1305153 () Bool)

(assert (=> b!1414970 m!1305153))

(declare-fun m!1305155 () Bool)

(assert (=> d!152449 m!1305155))

(assert (=> d!152449 m!1304973))

(assert (=> d!152449 m!1304997))

(assert (=> d!152449 m!1304993))

(declare-fun m!1305157 () Bool)

(assert (=> d!152449 m!1305157))

(declare-fun m!1305159 () Bool)

(assert (=> d!152449 m!1305159))

(assert (=> d!152449 m!1304997))

(assert (=> d!152449 m!1304973))

(declare-fun m!1305161 () Bool)

(assert (=> d!152449 m!1305161))

(assert (=> b!1414740 d!152449))

(declare-fun bm!67169 () Bool)

(declare-fun call!67172 () Bool)

(assert (=> bm!67169 (= call!67172 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1415001 () Bool)

(declare-fun e!800835 () Bool)

(assert (=> b!1415001 (= e!800835 call!67172)))

(declare-fun b!1415002 () Bool)

(declare-fun e!800833 () Bool)

(assert (=> b!1415002 (= e!800835 e!800833)))

(declare-fun lt!623846 () (_ BitVec 64))

(assert (=> b!1415002 (= lt!623846 (select (arr!46644 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!623847 () Unit!47884)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96623 (_ BitVec 64) (_ BitVec 32)) Unit!47884)

(assert (=> b!1415002 (= lt!623847 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!623846 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1415002 (arrayContainsKey!0 a!2901 lt!623846 #b00000000000000000000000000000000)))

(declare-fun lt!623845 () Unit!47884)

(assert (=> b!1415002 (= lt!623845 lt!623847)))

(declare-fun res!951108 () Bool)

(assert (=> b!1415002 (= res!951108 (= (seekEntryOrOpen!0 (select (arr!46644 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10955 #b00000000000000000000000000000000)))))

(assert (=> b!1415002 (=> (not res!951108) (not e!800833))))

(declare-fun b!1415003 () Bool)

(declare-fun e!800834 () Bool)

(assert (=> b!1415003 (= e!800834 e!800835)))

(declare-fun c!131425 () Bool)

(assert (=> b!1415003 (= c!131425 (validKeyInArray!0 (select (arr!46644 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1415004 () Bool)

(assert (=> b!1415004 (= e!800833 call!67172)))

(declare-fun d!152453 () Bool)

(declare-fun res!951109 () Bool)

(assert (=> d!152453 (=> res!951109 e!800834)))

(assert (=> d!152453 (= res!951109 (bvsge #b00000000000000000000000000000000 (size!47194 a!2901)))))

(assert (=> d!152453 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!800834)))

(assert (= (and d!152453 (not res!951109)) b!1415003))

(assert (= (and b!1415003 c!131425) b!1415002))

(assert (= (and b!1415003 (not c!131425)) b!1415001))

(assert (= (and b!1415002 res!951108) b!1415004))

(assert (= (or b!1415004 b!1415001) bm!67169))

(declare-fun m!1305177 () Bool)

(assert (=> bm!67169 m!1305177))

(assert (=> b!1415002 m!1305095))

(declare-fun m!1305179 () Bool)

(assert (=> b!1415002 m!1305179))

(declare-fun m!1305181 () Bool)

(assert (=> b!1415002 m!1305181))

(assert (=> b!1415002 m!1305095))

(declare-fun m!1305183 () Bool)

(assert (=> b!1415002 m!1305183))

(assert (=> b!1415003 m!1305095))

(assert (=> b!1415003 m!1305095))

(assert (=> b!1415003 m!1305097))

(assert (=> b!1414745 d!152453))

(declare-fun call!67175 () Bool)

(declare-fun bm!67172 () Bool)

(assert (=> bm!67172 (= call!67175 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1415013 () Bool)

(declare-fun e!800842 () Bool)

(assert (=> b!1415013 (= e!800842 call!67175)))

(declare-fun b!1415014 () Bool)

(declare-fun e!800840 () Bool)

(assert (=> b!1415014 (= e!800842 e!800840)))

(declare-fun lt!623849 () (_ BitVec 64))

(assert (=> b!1415014 (= lt!623849 (select (arr!46644 a!2901) j!112))))

(declare-fun lt!623850 () Unit!47884)

(assert (=> b!1415014 (= lt!623850 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!623849 j!112))))

(assert (=> b!1415014 (arrayContainsKey!0 a!2901 lt!623849 #b00000000000000000000000000000000)))

(declare-fun lt!623848 () Unit!47884)

(assert (=> b!1415014 (= lt!623848 lt!623850)))

(declare-fun res!951114 () Bool)

(assert (=> b!1415014 (= res!951114 (= (seekEntryOrOpen!0 (select (arr!46644 a!2901) j!112) a!2901 mask!2840) (Found!10955 j!112)))))

(assert (=> b!1415014 (=> (not res!951114) (not e!800840))))

(declare-fun b!1415015 () Bool)

(declare-fun e!800841 () Bool)

(assert (=> b!1415015 (= e!800841 e!800842)))

(declare-fun c!131428 () Bool)

(assert (=> b!1415015 (= c!131428 (validKeyInArray!0 (select (arr!46644 a!2901) j!112)))))

(declare-fun b!1415016 () Bool)

(assert (=> b!1415016 (= e!800840 call!67175)))

(declare-fun d!152465 () Bool)

(declare-fun res!951115 () Bool)

(assert (=> d!152465 (=> res!951115 e!800841)))

(assert (=> d!152465 (= res!951115 (bvsge j!112 (size!47194 a!2901)))))

(assert (=> d!152465 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!800841)))

(assert (= (and d!152465 (not res!951115)) b!1415015))

(assert (= (and b!1415015 c!131428) b!1415014))

(assert (= (and b!1415015 (not c!131428)) b!1415013))

(assert (= (and b!1415014 res!951114) b!1415016))

(assert (= (or b!1415016 b!1415013) bm!67172))

(declare-fun m!1305185 () Bool)

(assert (=> bm!67172 m!1305185))

(assert (=> b!1415014 m!1304973))

(declare-fun m!1305187 () Bool)

(assert (=> b!1415014 m!1305187))

(declare-fun m!1305189 () Bool)

(assert (=> b!1415014 m!1305189))

(assert (=> b!1415014 m!1304973))

(assert (=> b!1415014 m!1304979))

(assert (=> b!1415015 m!1304973))

(assert (=> b!1415015 m!1304973))

(assert (=> b!1415015 m!1304975))

(assert (=> b!1414739 d!152465))

(declare-fun d!152467 () Bool)

(assert (=> d!152467 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!623856 () Unit!47884)

(declare-fun choose!38 (array!96623 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47884)

(assert (=> d!152467 (= lt!623856 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!152467 (validMask!0 mask!2840)))

(assert (=> d!152467 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!623856)))

(declare-fun bs!41245 () Bool)

(assert (= bs!41245 d!152467))

(assert (=> bs!41245 m!1305001))

(declare-fun m!1305201 () Bool)

(assert (=> bs!41245 m!1305201))

(assert (=> bs!41245 m!1304993))

(assert (=> b!1414739 d!152467))

(declare-fun e!800849 () SeekEntryResult!10955)

(declare-fun b!1415022 () Bool)

(assert (=> b!1415022 (= e!800849 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!623729 #b00000000000000000000000000000000 mask!2840) (select (arr!46644 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1415023 () Bool)

(declare-fun lt!623858 () SeekEntryResult!10955)

(assert (=> b!1415023 (and (bvsge (index!46211 lt!623858) #b00000000000000000000000000000000) (bvslt (index!46211 lt!623858) (size!47194 a!2901)))))

(declare-fun res!951121 () Bool)

(assert (=> b!1415023 (= res!951121 (= (select (arr!46644 a!2901) (index!46211 lt!623858)) (select (arr!46644 a!2901) j!112)))))

(declare-fun e!800848 () Bool)

(assert (=> b!1415023 (=> res!951121 e!800848)))

(declare-fun e!800851 () Bool)

(assert (=> b!1415023 (= e!800851 e!800848)))

(declare-fun b!1415024 () Bool)

(declare-fun e!800847 () Bool)

(assert (=> b!1415024 (= e!800847 e!800851)))

(declare-fun res!951119 () Bool)

(assert (=> b!1415024 (= res!951119 (and ((_ is Intermediate!10955) lt!623858) (not (undefined!11767 lt!623858)) (bvslt (x!127814 lt!623858) #b01111111111111111111111111111110) (bvsge (x!127814 lt!623858) #b00000000000000000000000000000000) (bvsge (x!127814 lt!623858) #b00000000000000000000000000000000)))))

(assert (=> b!1415024 (=> (not res!951119) (not e!800851))))

(declare-fun b!1415025 () Bool)

(assert (=> b!1415025 (and (bvsge (index!46211 lt!623858) #b00000000000000000000000000000000) (bvslt (index!46211 lt!623858) (size!47194 a!2901)))))

(assert (=> b!1415025 (= e!800848 (= (select (arr!46644 a!2901) (index!46211 lt!623858)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1415026 () Bool)

(assert (=> b!1415026 (= e!800847 (bvsge (x!127814 lt!623858) #b01111111111111111111111111111110))))

(declare-fun b!1415027 () Bool)

(declare-fun e!800850 () SeekEntryResult!10955)

(assert (=> b!1415027 (= e!800850 (Intermediate!10955 true lt!623729 #b00000000000000000000000000000000))))

(declare-fun b!1415028 () Bool)

(assert (=> b!1415028 (= e!800850 e!800849)))

(declare-fun c!131430 () Bool)

(declare-fun lt!623857 () (_ BitVec 64))

(assert (=> b!1415028 (= c!131430 (or (= lt!623857 (select (arr!46644 a!2901) j!112)) (= (bvadd lt!623857 lt!623857) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!152473 () Bool)

(assert (=> d!152473 e!800847))

(declare-fun c!131432 () Bool)

(assert (=> d!152473 (= c!131432 (and ((_ is Intermediate!10955) lt!623858) (undefined!11767 lt!623858)))))

(assert (=> d!152473 (= lt!623858 e!800850)))

(declare-fun c!131431 () Bool)

(assert (=> d!152473 (= c!131431 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!152473 (= lt!623857 (select (arr!46644 a!2901) lt!623729))))

(assert (=> d!152473 (validMask!0 mask!2840)))

(assert (=> d!152473 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623729 (select (arr!46644 a!2901) j!112) a!2901 mask!2840) lt!623858)))

(declare-fun b!1415029 () Bool)

(assert (=> b!1415029 (and (bvsge (index!46211 lt!623858) #b00000000000000000000000000000000) (bvslt (index!46211 lt!623858) (size!47194 a!2901)))))

(declare-fun res!951120 () Bool)

(assert (=> b!1415029 (= res!951120 (= (select (arr!46644 a!2901) (index!46211 lt!623858)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1415029 (=> res!951120 e!800848)))

(declare-fun b!1415030 () Bool)

(assert (=> b!1415030 (= e!800849 (Intermediate!10955 false lt!623729 #b00000000000000000000000000000000))))

(assert (= (and d!152473 c!131431) b!1415027))

(assert (= (and d!152473 (not c!131431)) b!1415028))

(assert (= (and b!1415028 c!131430) b!1415030))

(assert (= (and b!1415028 (not c!131430)) b!1415022))

(assert (= (and d!152473 c!131432) b!1415026))

(assert (= (and d!152473 (not c!131432)) b!1415024))

(assert (= (and b!1415024 res!951119) b!1415023))

(assert (= (and b!1415023 (not res!951121)) b!1415029))

(assert (= (and b!1415029 (not res!951120)) b!1415025))

(declare-fun m!1305203 () Bool)

(assert (=> b!1415029 m!1305203))

(assert (=> b!1415023 m!1305203))

(assert (=> b!1415025 m!1305203))

(declare-fun m!1305205 () Bool)

(assert (=> b!1415022 m!1305205))

(assert (=> b!1415022 m!1305205))

(assert (=> b!1415022 m!1304973))

(declare-fun m!1305207 () Bool)

(assert (=> b!1415022 m!1305207))

(declare-fun m!1305209 () Bool)

(assert (=> d!152473 m!1305209))

(assert (=> d!152473 m!1304993))

(assert (=> b!1414739 d!152473))

(declare-fun d!152475 () Bool)

(declare-fun lt!623860 () (_ BitVec 32))

(declare-fun lt!623859 () (_ BitVec 32))

(assert (=> d!152475 (= lt!623860 (bvmul (bvxor lt!623859 (bvlshr lt!623859 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152475 (= lt!623859 ((_ extract 31 0) (bvand (bvxor (select (arr!46644 a!2901) j!112) (bvlshr (select (arr!46644 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152475 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!951083 (let ((h!34445 ((_ extract 31 0) (bvand (bvxor (select (arr!46644 a!2901) j!112) (bvlshr (select (arr!46644 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127822 (bvmul (bvxor h!34445 (bvlshr h!34445 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127822 (bvlshr x!127822 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!951083 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!951083 #b00000000000000000000000000000000))))))

(assert (=> d!152475 (= (toIndex!0 (select (arr!46644 a!2901) j!112) mask!2840) (bvand (bvxor lt!623860 (bvlshr lt!623860 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1414739 d!152475))

(check-sat (not b!1414860) (not b!1415014) (not b!1414789) (not bm!67172) (not b!1415015) (not b!1414969) (not b!1414856) (not d!152419) (not d!152417) (not d!152437) (not bm!67162) (not b!1415002) (not d!152473) (not d!152467) (not bm!67169) (not b!1414857) (not b!1414927) (not b!1414810) (not b!1415003) (not d!152435) (not d!152449) (not b!1415022))
(check-sat)
