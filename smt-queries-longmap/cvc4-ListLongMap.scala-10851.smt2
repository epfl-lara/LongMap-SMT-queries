; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127022 () Bool)

(assert start!127022)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!99732 0))(
  ( (array!99733 (arr!48136 (Array (_ BitVec 32) (_ BitVec 64))) (size!48686 (_ BitVec 32))) )
))
(declare-fun lt!650843 () array!99732)

(declare-fun b!1493005 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12376 0))(
  ( (MissingZero!12376 (index!51896 (_ BitVec 32))) (Found!12376 (index!51897 (_ BitVec 32))) (Intermediate!12376 (undefined!13188 Bool) (index!51898 (_ BitVec 32)) (x!133484 (_ BitVec 32))) (Undefined!12376) (MissingVacant!12376 (index!51899 (_ BitVec 32))) )
))
(declare-fun lt!650839 () SeekEntryResult!12376)

(declare-fun lt!650840 () (_ BitVec 64))

(declare-fun e!836378 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99732 (_ BitVec 32)) SeekEntryResult!12376)

(assert (=> b!1493005 (= e!836378 (= lt!650839 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650840 lt!650843 mask!2687)))))

(declare-fun b!1493006 () Bool)

(declare-fun e!836383 () Bool)

(declare-fun e!836384 () Bool)

(assert (=> b!1493006 (= e!836383 (not e!836384))))

(declare-fun res!1015770 () Bool)

(assert (=> b!1493006 (=> res!1015770 e!836384)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99732)

(assert (=> b!1493006 (= res!1015770 (or (and (= (select (arr!48136 a!2862) index!646) (select (store (arr!48136 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48136 a!2862) index!646) (select (arr!48136 a!2862) j!93))) (= (select (arr!48136 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!836377 () Bool)

(assert (=> b!1493006 e!836377))

(declare-fun res!1015774 () Bool)

(assert (=> b!1493006 (=> (not res!1015774) (not e!836377))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99732 (_ BitVec 32)) Bool)

(assert (=> b!1493006 (= res!1015774 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50092 0))(
  ( (Unit!50093) )
))
(declare-fun lt!650844 () Unit!50092)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99732 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50092)

(assert (=> b!1493006 (= lt!650844 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1493007 () Bool)

(declare-fun res!1015778 () Bool)

(declare-fun e!836382 () Bool)

(assert (=> b!1493007 (=> (not res!1015778) (not e!836382))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1493007 (= res!1015778 (validKeyInArray!0 (select (arr!48136 a!2862) j!93)))))

(declare-fun b!1493008 () Bool)

(declare-fun res!1015771 () Bool)

(assert (=> b!1493008 (=> (not res!1015771) (not e!836382))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1493008 (= res!1015771 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48686 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48686 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48686 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1493009 () Bool)

(declare-fun res!1015779 () Bool)

(assert (=> b!1493009 (=> (not res!1015779) (not e!836382))))

(assert (=> b!1493009 (= res!1015779 (validKeyInArray!0 (select (arr!48136 a!2862) i!1006)))))

(declare-fun b!1493010 () Bool)

(declare-fun e!836381 () Bool)

(assert (=> b!1493010 (= e!836382 e!836381)))

(declare-fun res!1015782 () Bool)

(assert (=> b!1493010 (=> (not res!1015782) (not e!836381))))

(assert (=> b!1493010 (= res!1015782 (= (select (store (arr!48136 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1493010 (= lt!650843 (array!99733 (store (arr!48136 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48686 a!2862)))))

(declare-fun b!1493011 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99732 (_ BitVec 32)) SeekEntryResult!12376)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99732 (_ BitVec 32)) SeekEntryResult!12376)

(assert (=> b!1493011 (= e!836378 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650840 lt!650843 mask!2687) (seekEntryOrOpen!0 lt!650840 lt!650843 mask!2687)))))

(declare-fun b!1493012 () Bool)

(declare-fun e!836380 () Bool)

(assert (=> b!1493012 (= e!836381 e!836380)))

(declare-fun res!1015775 () Bool)

(assert (=> b!1493012 (=> (not res!1015775) (not e!836380))))

(declare-fun lt!650841 () SeekEntryResult!12376)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493012 (= res!1015775 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48136 a!2862) j!93) mask!2687) (select (arr!48136 a!2862) j!93) a!2862 mask!2687) lt!650841))))

(assert (=> b!1493012 (= lt!650841 (Intermediate!12376 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1493013 () Bool)

(declare-fun res!1015773 () Bool)

(assert (=> b!1493013 (=> (not res!1015773) (not e!836383))))

(assert (=> b!1493013 (= res!1015773 e!836378)))

(declare-fun c!138147 () Bool)

(assert (=> b!1493013 (= c!138147 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1493014 () Bool)

(assert (=> b!1493014 (= e!836377 (or (= (select (arr!48136 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48136 a!2862) intermediateBeforeIndex!19) (select (arr!48136 a!2862) j!93))))))

(declare-fun b!1493015 () Bool)

(declare-fun res!1015780 () Bool)

(assert (=> b!1493015 (=> (not res!1015780) (not e!836377))))

(assert (=> b!1493015 (= res!1015780 (= (seekEntryOrOpen!0 (select (arr!48136 a!2862) j!93) a!2862 mask!2687) (Found!12376 j!93)))))

(declare-fun b!1493016 () Bool)

(declare-fun res!1015783 () Bool)

(assert (=> b!1493016 (=> (not res!1015783) (not e!836382))))

(declare-datatypes ((List!34637 0))(
  ( (Nil!34634) (Cons!34633 (h!36019 (_ BitVec 64)) (t!49331 List!34637)) )
))
(declare-fun arrayNoDuplicates!0 (array!99732 (_ BitVec 32) List!34637) Bool)

(assert (=> b!1493016 (= res!1015783 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34634))))

(declare-fun b!1493017 () Bool)

(assert (=> b!1493017 (= e!836380 e!836383)))

(declare-fun res!1015772 () Bool)

(assert (=> b!1493017 (=> (not res!1015772) (not e!836383))))

(assert (=> b!1493017 (= res!1015772 (= lt!650839 (Intermediate!12376 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1493017 (= lt!650839 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650840 mask!2687) lt!650840 lt!650843 mask!2687))))

(assert (=> b!1493017 (= lt!650840 (select (store (arr!48136 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!1015781 () Bool)

(assert (=> start!127022 (=> (not res!1015781) (not e!836382))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127022 (= res!1015781 (validMask!0 mask!2687))))

(assert (=> start!127022 e!836382))

(assert (=> start!127022 true))

(declare-fun array_inv!37164 (array!99732) Bool)

(assert (=> start!127022 (array_inv!37164 a!2862)))

(declare-fun b!1493018 () Bool)

(declare-fun lt!650842 () (_ BitVec 32))

(assert (=> b!1493018 (= e!836384 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (and (bvsge lt!650842 #b00000000000000000000000000000000) (bvslt lt!650842 (size!48686 a!2862)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493018 (= lt!650842 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1493019 () Bool)

(declare-fun res!1015768 () Bool)

(assert (=> b!1493019 (=> (not res!1015768) (not e!836382))))

(assert (=> b!1493019 (= res!1015768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1493020 () Bool)

(declare-fun res!1015777 () Bool)

(assert (=> b!1493020 (=> (not res!1015777) (not e!836380))))

(assert (=> b!1493020 (= res!1015777 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48136 a!2862) j!93) a!2862 mask!2687) lt!650841))))

(declare-fun b!1493021 () Bool)

(declare-fun res!1015776 () Bool)

(assert (=> b!1493021 (=> (not res!1015776) (not e!836382))))

(assert (=> b!1493021 (= res!1015776 (and (= (size!48686 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48686 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48686 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1493022 () Bool)

(declare-fun res!1015769 () Bool)

(assert (=> b!1493022 (=> (not res!1015769) (not e!836383))))

(assert (=> b!1493022 (= res!1015769 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!127022 res!1015781) b!1493021))

(assert (= (and b!1493021 res!1015776) b!1493009))

(assert (= (and b!1493009 res!1015779) b!1493007))

(assert (= (and b!1493007 res!1015778) b!1493019))

(assert (= (and b!1493019 res!1015768) b!1493016))

(assert (= (and b!1493016 res!1015783) b!1493008))

(assert (= (and b!1493008 res!1015771) b!1493010))

(assert (= (and b!1493010 res!1015782) b!1493012))

(assert (= (and b!1493012 res!1015775) b!1493020))

(assert (= (and b!1493020 res!1015777) b!1493017))

(assert (= (and b!1493017 res!1015772) b!1493013))

(assert (= (and b!1493013 c!138147) b!1493005))

(assert (= (and b!1493013 (not c!138147)) b!1493011))

(assert (= (and b!1493013 res!1015773) b!1493022))

(assert (= (and b!1493022 res!1015769) b!1493006))

(assert (= (and b!1493006 res!1015774) b!1493015))

(assert (= (and b!1493015 res!1015780) b!1493014))

(assert (= (and b!1493006 (not res!1015770)) b!1493018))

(declare-fun m!1376937 () Bool)

(assert (=> b!1493019 m!1376937))

(declare-fun m!1376939 () Bool)

(assert (=> b!1493014 m!1376939))

(declare-fun m!1376941 () Bool)

(assert (=> b!1493014 m!1376941))

(declare-fun m!1376943 () Bool)

(assert (=> b!1493006 m!1376943))

(declare-fun m!1376945 () Bool)

(assert (=> b!1493006 m!1376945))

(declare-fun m!1376947 () Bool)

(assert (=> b!1493006 m!1376947))

(declare-fun m!1376949 () Bool)

(assert (=> b!1493006 m!1376949))

(declare-fun m!1376951 () Bool)

(assert (=> b!1493006 m!1376951))

(assert (=> b!1493006 m!1376941))

(declare-fun m!1376953 () Bool)

(assert (=> b!1493009 m!1376953))

(assert (=> b!1493009 m!1376953))

(declare-fun m!1376955 () Bool)

(assert (=> b!1493009 m!1376955))

(assert (=> b!1493020 m!1376941))

(assert (=> b!1493020 m!1376941))

(declare-fun m!1376957 () Bool)

(assert (=> b!1493020 m!1376957))

(assert (=> b!1493012 m!1376941))

(assert (=> b!1493012 m!1376941))

(declare-fun m!1376959 () Bool)

(assert (=> b!1493012 m!1376959))

(assert (=> b!1493012 m!1376959))

(assert (=> b!1493012 m!1376941))

(declare-fun m!1376961 () Bool)

(assert (=> b!1493012 m!1376961))

(declare-fun m!1376963 () Bool)

(assert (=> b!1493005 m!1376963))

(declare-fun m!1376965 () Bool)

(assert (=> start!127022 m!1376965))

(declare-fun m!1376967 () Bool)

(assert (=> start!127022 m!1376967))

(declare-fun m!1376969 () Bool)

(assert (=> b!1493016 m!1376969))

(assert (=> b!1493010 m!1376945))

(declare-fun m!1376971 () Bool)

(assert (=> b!1493010 m!1376971))

(assert (=> b!1493015 m!1376941))

(assert (=> b!1493015 m!1376941))

(declare-fun m!1376973 () Bool)

(assert (=> b!1493015 m!1376973))

(declare-fun m!1376975 () Bool)

(assert (=> b!1493011 m!1376975))

(declare-fun m!1376977 () Bool)

(assert (=> b!1493011 m!1376977))

(declare-fun m!1376979 () Bool)

(assert (=> b!1493018 m!1376979))

(declare-fun m!1376981 () Bool)

(assert (=> b!1493017 m!1376981))

(assert (=> b!1493017 m!1376981))

(declare-fun m!1376983 () Bool)

(assert (=> b!1493017 m!1376983))

(assert (=> b!1493017 m!1376945))

(declare-fun m!1376985 () Bool)

(assert (=> b!1493017 m!1376985))

(assert (=> b!1493007 m!1376941))

(assert (=> b!1493007 m!1376941))

(declare-fun m!1376987 () Bool)

(assert (=> b!1493007 m!1376987))

(push 1)

(assert (not b!1493018))

(assert (not b!1493020))

(assert (not start!127022))

(assert (not b!1493015))

(assert (not b!1493009))

(assert (not b!1493012))

(assert (not b!1493011))

(assert (not b!1493007))

(assert (not b!1493006))

(assert (not b!1493017))

(assert (not b!1493005))

(assert (not b!1493016))

(assert (not b!1493019))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!156951 () Bool)

(assert (=> d!156951 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!127022 d!156951))

(declare-fun d!156955 () Bool)

(assert (=> d!156955 (= (array_inv!37164 a!2862) (bvsge (size!48686 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!127022 d!156955))

(declare-fun b!1493161 () Bool)

(declare-fun lt!650892 () SeekEntryResult!12376)

(assert (=> b!1493161 (and (bvsge (index!51898 lt!650892) #b00000000000000000000000000000000) (bvslt (index!51898 lt!650892) (size!48686 a!2862)))))

(declare-fun res!1015817 () Bool)

(assert (=> b!1493161 (= res!1015817 (= (select (arr!48136 a!2862) (index!51898 lt!650892)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!836465 () Bool)

(assert (=> b!1493161 (=> res!1015817 e!836465)))

(declare-fun b!1493162 () Bool)

(declare-fun e!836462 () SeekEntryResult!12376)

(assert (=> b!1493162 (= e!836462 (Intermediate!12376 true (toIndex!0 (select (arr!48136 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun d!156957 () Bool)

(declare-fun e!836466 () Bool)

(assert (=> d!156957 e!836466))

(declare-fun c!138203 () Bool)

(assert (=> d!156957 (= c!138203 (and (is-Intermediate!12376 lt!650892) (undefined!13188 lt!650892)))))

(assert (=> d!156957 (= lt!650892 e!836462)))

(declare-fun c!138202 () Bool)

(assert (=> d!156957 (= c!138202 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!650891 () (_ BitVec 64))

(assert (=> d!156957 (= lt!650891 (select (arr!48136 a!2862) (toIndex!0 (select (arr!48136 a!2862) j!93) mask!2687)))))

(assert (=> d!156957 (validMask!0 mask!2687)))

(assert (=> d!156957 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48136 a!2862) j!93) mask!2687) (select (arr!48136 a!2862) j!93) a!2862 mask!2687) lt!650892)))

(declare-fun b!1493163 () Bool)

(assert (=> b!1493163 (= e!836466 (bvsge (x!133484 lt!650892) #b01111111111111111111111111111110))))

(declare-fun b!1493164 () Bool)

(declare-fun e!836463 () SeekEntryResult!12376)

(assert (=> b!1493164 (= e!836462 e!836463)))

(declare-fun c!138204 () Bool)

(assert (=> b!1493164 (= c!138204 (or (= lt!650891 (select (arr!48136 a!2862) j!93)) (= (bvadd lt!650891 lt!650891) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1493165 () Bool)

(assert (=> b!1493165 (and (bvsge (index!51898 lt!650892) #b00000000000000000000000000000000) (bvslt (index!51898 lt!650892) (size!48686 a!2862)))))

(declare-fun res!1015816 () Bool)

(assert (=> b!1493165 (= res!1015816 (= (select (arr!48136 a!2862) (index!51898 lt!650892)) (select (arr!48136 a!2862) j!93)))))

(assert (=> b!1493165 (=> res!1015816 e!836465)))

(declare-fun e!836464 () Bool)

(assert (=> b!1493165 (= e!836464 e!836465)))

(declare-fun b!1493166 () Bool)

(assert (=> b!1493166 (= e!836463 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48136 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!48136 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1493167 () Bool)

(assert (=> b!1493167 (= e!836466 e!836464)))

(declare-fun res!1015815 () Bool)

(assert (=> b!1493167 (= res!1015815 (and (is-Intermediate!12376 lt!650892) (not (undefined!13188 lt!650892)) (bvslt (x!133484 lt!650892) #b01111111111111111111111111111110) (bvsge (x!133484 lt!650892) #b00000000000000000000000000000000) (bvsge (x!133484 lt!650892) #b00000000000000000000000000000000)))))

(assert (=> b!1493167 (=> (not res!1015815) (not e!836464))))

(declare-fun b!1493168 () Bool)

(assert (=> b!1493168 (= e!836463 (Intermediate!12376 false (toIndex!0 (select (arr!48136 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1493169 () Bool)

(assert (=> b!1493169 (and (bvsge (index!51898 lt!650892) #b00000000000000000000000000000000) (bvslt (index!51898 lt!650892) (size!48686 a!2862)))))

(assert (=> b!1493169 (= e!836465 (= (select (arr!48136 a!2862) (index!51898 lt!650892)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!156957 c!138202) b!1493162))

(assert (= (and d!156957 (not c!138202)) b!1493164))

(assert (= (and b!1493164 c!138204) b!1493168))

(assert (= (and b!1493164 (not c!138204)) b!1493166))

(assert (= (and d!156957 c!138203) b!1493163))

(assert (= (and d!156957 (not c!138203)) b!1493167))

(assert (= (and b!1493167 res!1015815) b!1493165))

(assert (= (and b!1493165 (not res!1015816)) b!1493161))

(assert (= (and b!1493161 (not res!1015817)) b!1493169))

(declare-fun m!1377053 () Bool)

(assert (=> b!1493165 m!1377053))

(assert (=> b!1493169 m!1377053))

(assert (=> d!156957 m!1376959))

(declare-fun m!1377055 () Bool)

(assert (=> d!156957 m!1377055))

(assert (=> d!156957 m!1376965))

(assert (=> b!1493166 m!1376959))

(declare-fun m!1377057 () Bool)

(assert (=> b!1493166 m!1377057))

(assert (=> b!1493166 m!1377057))

(assert (=> b!1493166 m!1376941))

(declare-fun m!1377059 () Bool)

(assert (=> b!1493166 m!1377059))

(assert (=> b!1493161 m!1377053))

(assert (=> b!1493012 d!156957))

(declare-fun d!156975 () Bool)

(declare-fun lt!650913 () (_ BitVec 32))

(declare-fun lt!650912 () (_ BitVec 32))

(assert (=> d!156975 (= lt!650913 (bvmul (bvxor lt!650912 (bvlshr lt!650912 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156975 (= lt!650912 ((_ extract 31 0) (bvand (bvxor (select (arr!48136 a!2862) j!93) (bvlshr (select (arr!48136 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156975 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1015818 (let ((h!36021 ((_ extract 31 0) (bvand (bvxor (select (arr!48136 a!2862) j!93) (bvlshr (select (arr!48136 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133490 (bvmul (bvxor h!36021 (bvlshr h!36021 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133490 (bvlshr x!133490 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1015818 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1015818 #b00000000000000000000000000000000))))))

(assert (=> d!156975 (= (toIndex!0 (select (arr!48136 a!2862) j!93) mask!2687) (bvand (bvxor lt!650913 (bvlshr lt!650913 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1493012 d!156975))

(declare-fun b!1493225 () Bool)

(declare-fun e!836499 () SeekEntryResult!12376)

(assert (=> b!1493225 (= e!836499 (MissingVacant!12376 intermediateAfterIndex!19))))

(declare-fun b!1493226 () Bool)

(declare-fun c!138229 () Bool)

(declare-fun lt!650933 () (_ BitVec 64))

(assert (=> b!1493226 (= c!138229 (= lt!650933 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!836500 () SeekEntryResult!12376)

(assert (=> b!1493226 (= e!836500 e!836499)))

(declare-fun b!1493227 () Bool)

(assert (=> b!1493227 (= e!836499 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!650840 lt!650843 mask!2687))))

(declare-fun b!1493228 () Bool)

(declare-fun e!836501 () SeekEntryResult!12376)

(assert (=> b!1493228 (= e!836501 Undefined!12376)))

(declare-fun b!1493229 () Bool)

(assert (=> b!1493229 (= e!836500 (Found!12376 index!646))))

(declare-fun b!1493230 () Bool)

(assert (=> b!1493230 (= e!836501 e!836500)))

(declare-fun c!138228 () Bool)

(assert (=> b!1493230 (= c!138228 (= lt!650933 lt!650840))))

(declare-fun d!156977 () Bool)

(declare-fun lt!650932 () SeekEntryResult!12376)

(assert (=> d!156977 (and (or (is-Undefined!12376 lt!650932) (not (is-Found!12376 lt!650932)) (and (bvsge (index!51897 lt!650932) #b00000000000000000000000000000000) (bvslt (index!51897 lt!650932) (size!48686 lt!650843)))) (or (is-Undefined!12376 lt!650932) (is-Found!12376 lt!650932) (not (is-MissingVacant!12376 lt!650932)) (not (= (index!51899 lt!650932) intermediateAfterIndex!19)) (and (bvsge (index!51899 lt!650932) #b00000000000000000000000000000000) (bvslt (index!51899 lt!650932) (size!48686 lt!650843)))) (or (is-Undefined!12376 lt!650932) (ite (is-Found!12376 lt!650932) (= (select (arr!48136 lt!650843) (index!51897 lt!650932)) lt!650840) (and (is-MissingVacant!12376 lt!650932) (= (index!51899 lt!650932) intermediateAfterIndex!19) (= (select (arr!48136 lt!650843) (index!51899 lt!650932)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!156977 (= lt!650932 e!836501)))

(declare-fun c!138227 () Bool)

(assert (=> d!156977 (= c!138227 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156977 (= lt!650933 (select (arr!48136 lt!650843) index!646))))

(assert (=> d!156977 (validMask!0 mask!2687)))

(assert (=> d!156977 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650840 lt!650843 mask!2687) lt!650932)))

(assert (= (and d!156977 c!138227) b!1493228))

(assert (= (and d!156977 (not c!138227)) b!1493230))

(assert (= (and b!1493230 c!138228) b!1493229))

(assert (= (and b!1493230 (not c!138228)) b!1493226))

(assert (= (and b!1493226 c!138229) b!1493225))

(assert (= (and b!1493226 (not c!138229)) b!1493227))

(assert (=> b!1493227 m!1376979))

(assert (=> b!1493227 m!1376979))

(declare-fun m!1377093 () Bool)

(assert (=> b!1493227 m!1377093))

(declare-fun m!1377095 () Bool)

(assert (=> d!156977 m!1377095))

(declare-fun m!1377097 () Bool)

(assert (=> d!156977 m!1377097))

(declare-fun m!1377099 () Bool)

(assert (=> d!156977 m!1377099))

(assert (=> d!156977 m!1376965))

(assert (=> b!1493011 d!156977))

(declare-fun b!1493255 () Bool)

(declare-fun e!836519 () SeekEntryResult!12376)

(declare-fun lt!650952 () SeekEntryResult!12376)

(assert (=> b!1493255 (= e!836519 (Found!12376 (index!51898 lt!650952)))))

(declare-fun b!1493256 () Bool)

(declare-fun e!836517 () SeekEntryResult!12376)

(assert (=> b!1493256 (= e!836517 (seekKeyOrZeroReturnVacant!0 (x!133484 lt!650952) (index!51898 lt!650952) (index!51898 lt!650952) lt!650840 lt!650843 mask!2687))))

(declare-fun b!1493257 () Bool)

(declare-fun c!138240 () Bool)

(declare-fun lt!650954 () (_ BitVec 64))

(assert (=> b!1493257 (= c!138240 (= lt!650954 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1493257 (= e!836519 e!836517)))

(declare-fun b!1493258 () Bool)

(declare-fun e!836518 () SeekEntryResult!12376)

(assert (=> b!1493258 (= e!836518 e!836519)))

(assert (=> b!1493258 (= lt!650954 (select (arr!48136 lt!650843) (index!51898 lt!650952)))))

(declare-fun c!138241 () Bool)

(assert (=> b!1493258 (= c!138241 (= lt!650954 lt!650840))))

(declare-fun b!1493259 () Bool)

(assert (=> b!1493259 (= e!836517 (MissingZero!12376 (index!51898 lt!650952)))))

(declare-fun b!1493260 () Bool)

(assert (=> b!1493260 (= e!836518 Undefined!12376)))

(declare-fun d!156997 () Bool)

(declare-fun lt!650953 () SeekEntryResult!12376)

(assert (=> d!156997 (and (or (is-Undefined!12376 lt!650953) (not (is-Found!12376 lt!650953)) (and (bvsge (index!51897 lt!650953) #b00000000000000000000000000000000) (bvslt (index!51897 lt!650953) (size!48686 lt!650843)))) (or (is-Undefined!12376 lt!650953) (is-Found!12376 lt!650953) (not (is-MissingZero!12376 lt!650953)) (and (bvsge (index!51896 lt!650953) #b00000000000000000000000000000000) (bvslt (index!51896 lt!650953) (size!48686 lt!650843)))) (or (is-Undefined!12376 lt!650953) (is-Found!12376 lt!650953) (is-MissingZero!12376 lt!650953) (not (is-MissingVacant!12376 lt!650953)) (and (bvsge (index!51899 lt!650953) #b00000000000000000000000000000000) (bvslt (index!51899 lt!650953) (size!48686 lt!650843)))) (or (is-Undefined!12376 lt!650953) (ite (is-Found!12376 lt!650953) (= (select (arr!48136 lt!650843) (index!51897 lt!650953)) lt!650840) (ite (is-MissingZero!12376 lt!650953) (= (select (arr!48136 lt!650843) (index!51896 lt!650953)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12376 lt!650953) (= (select (arr!48136 lt!650843) (index!51899 lt!650953)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156997 (= lt!650953 e!836518)))

(declare-fun c!138239 () Bool)

(assert (=> d!156997 (= c!138239 (and (is-Intermediate!12376 lt!650952) (undefined!13188 lt!650952)))))

(assert (=> d!156997 (= lt!650952 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650840 mask!2687) lt!650840 lt!650843 mask!2687))))

(assert (=> d!156997 (validMask!0 mask!2687)))

(assert (=> d!156997 (= (seekEntryOrOpen!0 lt!650840 lt!650843 mask!2687) lt!650953)))

(assert (= (and d!156997 c!138239) b!1493260))

(assert (= (and d!156997 (not c!138239)) b!1493258))

(assert (= (and b!1493258 c!138241) b!1493255))

(assert (= (and b!1493258 (not c!138241)) b!1493257))

(assert (= (and b!1493257 c!138240) b!1493259))

(assert (= (and b!1493257 (not c!138240)) b!1493256))

(declare-fun m!1377115 () Bool)

(assert (=> b!1493256 m!1377115))

(declare-fun m!1377117 () Bool)

(assert (=> b!1493258 m!1377117))

(declare-fun m!1377119 () Bool)

(assert (=> d!156997 m!1377119))

(assert (=> d!156997 m!1376965))

(assert (=> d!156997 m!1376981))

(declare-fun m!1377121 () Bool)

(assert (=> d!156997 m!1377121))

(assert (=> d!156997 m!1376981))

(assert (=> d!156997 m!1376983))

(declare-fun m!1377123 () Bool)

(assert (=> d!156997 m!1377123))

(assert (=> b!1493011 d!156997))

(declare-fun b!1493261 () Bool)

(declare-fun lt!650956 () SeekEntryResult!12376)

(assert (=> b!1493261 (and (bvsge (index!51898 lt!650956) #b00000000000000000000000000000000) (bvslt (index!51898 lt!650956) (size!48686 a!2862)))))

(declare-fun res!1015838 () Bool)

(assert (=> b!1493261 (= res!1015838 (= (select (arr!48136 a!2862) (index!51898 lt!650956)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!836523 () Bool)

(assert (=> b!1493261 (=> res!1015838 e!836523)))

(declare-fun b!1493262 () Bool)

(declare-fun e!836520 () SeekEntryResult!12376)

(assert (=> b!1493262 (= e!836520 (Intermediate!12376 true index!646 x!665))))

(declare-fun d!157003 () Bool)

(declare-fun e!836524 () Bool)

(assert (=> d!157003 e!836524))

(declare-fun c!138243 () Bool)

(assert (=> d!157003 (= c!138243 (and (is-Intermediate!12376 lt!650956) (undefined!13188 lt!650956)))))

(assert (=> d!157003 (= lt!650956 e!836520)))

(declare-fun c!138242 () Bool)

(assert (=> d!157003 (= c!138242 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!650955 () (_ BitVec 64))

(assert (=> d!157003 (= lt!650955 (select (arr!48136 a!2862) index!646))))

(assert (=> d!157003 (validMask!0 mask!2687)))

(assert (=> d!157003 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48136 a!2862) j!93) a!2862 mask!2687) lt!650956)))

(declare-fun b!1493263 () Bool)

(assert (=> b!1493263 (= e!836524 (bvsge (x!133484 lt!650956) #b01111111111111111111111111111110))))

(declare-fun b!1493264 () Bool)

(declare-fun e!836521 () SeekEntryResult!12376)

(assert (=> b!1493264 (= e!836520 e!836521)))

(declare-fun c!138244 () Bool)

(assert (=> b!1493264 (= c!138244 (or (= lt!650955 (select (arr!48136 a!2862) j!93)) (= (bvadd lt!650955 lt!650955) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1493265 () Bool)

(assert (=> b!1493265 (and (bvsge (index!51898 lt!650956) #b00000000000000000000000000000000) (bvslt (index!51898 lt!650956) (size!48686 a!2862)))))

(declare-fun res!1015837 () Bool)

(assert (=> b!1493265 (= res!1015837 (= (select (arr!48136 a!2862) (index!51898 lt!650956)) (select (arr!48136 a!2862) j!93)))))

(assert (=> b!1493265 (=> res!1015837 e!836523)))

(declare-fun e!836522 () Bool)

(assert (=> b!1493265 (= e!836522 e!836523)))

(declare-fun b!1493266 () Bool)

(assert (=> b!1493266 (= e!836521 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!48136 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1493267 () Bool)

(assert (=> b!1493267 (= e!836524 e!836522)))

(declare-fun res!1015836 () Bool)

(assert (=> b!1493267 (= res!1015836 (and (is-Intermediate!12376 lt!650956) (not (undefined!13188 lt!650956)) (bvslt (x!133484 lt!650956) #b01111111111111111111111111111110) (bvsge (x!133484 lt!650956) #b00000000000000000000000000000000) (bvsge (x!133484 lt!650956) x!665)))))

(assert (=> b!1493267 (=> (not res!1015836) (not e!836522))))

(declare-fun b!1493268 () Bool)

(assert (=> b!1493268 (= e!836521 (Intermediate!12376 false index!646 x!665))))

(declare-fun b!1493269 () Bool)

(assert (=> b!1493269 (and (bvsge (index!51898 lt!650956) #b00000000000000000000000000000000) (bvslt (index!51898 lt!650956) (size!48686 a!2862)))))

(assert (=> b!1493269 (= e!836523 (= (select (arr!48136 a!2862) (index!51898 lt!650956)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!157003 c!138242) b!1493262))

(assert (= (and d!157003 (not c!138242)) b!1493264))

(assert (= (and b!1493264 c!138244) b!1493268))

(assert (= (and b!1493264 (not c!138244)) b!1493266))

(assert (= (and d!157003 c!138243) b!1493263))

(assert (= (and d!157003 (not c!138243)) b!1493267))

(assert (= (and b!1493267 res!1015836) b!1493265))

(assert (= (and b!1493265 (not res!1015837)) b!1493261))

(assert (= (and b!1493261 (not res!1015838)) b!1493269))

(declare-fun m!1377125 () Bool)

(assert (=> b!1493265 m!1377125))

(assert (=> b!1493269 m!1377125))

(assert (=> d!157003 m!1376949))

(assert (=> d!157003 m!1376965))

(assert (=> b!1493266 m!1376979))

(assert (=> b!1493266 m!1376979))

(assert (=> b!1493266 m!1376941))

(declare-fun m!1377127 () Bool)

(assert (=> b!1493266 m!1377127))

(assert (=> b!1493261 m!1377125))

(assert (=> b!1493020 d!157003))

(declare-fun d!157005 () Bool)

(assert (=> d!157005 (= (validKeyInArray!0 (select (arr!48136 a!2862) i!1006)) (and (not (= (select (arr!48136 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48136 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1493009 d!157005))

(declare-fun b!1493296 () Bool)

(declare-fun e!836541 () Bool)

(declare-fun e!836543 () Bool)

(assert (=> b!1493296 (= e!836541 e!836543)))

(declare-fun c!138253 () Bool)

(assert (=> b!1493296 (= c!138253 (validKeyInArray!0 (select (arr!48136 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1493297 () Bool)

(declare-fun call!67970 () Bool)

(assert (=> b!1493297 (= e!836543 call!67970)))

(declare-fun b!1493298 () Bool)

(declare-fun e!836542 () Bool)

(assert (=> b!1493298 (= e!836543 e!836542)))

(declare-fun lt!650969 () (_ BitVec 64))

(assert (=> b!1493298 (= lt!650969 (select (arr!48136 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!650967 () Unit!50092)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99732 (_ BitVec 64) (_ BitVec 32)) Unit!50092)

(assert (=> b!1493298 (= lt!650967 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!650969 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99732 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1493298 (arrayContainsKey!0 a!2862 lt!650969 #b00000000000000000000000000000000)))

(declare-fun lt!650968 () Unit!50092)

(assert (=> b!1493298 (= lt!650968 lt!650967)))

(declare-fun res!1015850 () Bool)

(assert (=> b!1493298 (= res!1015850 (= (seekEntryOrOpen!0 (select (arr!48136 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12376 #b00000000000000000000000000000000)))))

(assert (=> b!1493298 (=> (not res!1015850) (not e!836542))))

(declare-fun d!157007 () Bool)

(declare-fun res!1015849 () Bool)

(assert (=> d!157007 (=> res!1015849 e!836541)))

(assert (=> d!157007 (= res!1015849 (bvsge #b00000000000000000000000000000000 (size!48686 a!2862)))))

(assert (=> d!157007 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!836541)))

(declare-fun b!1493299 () Bool)

(assert (=> b!1493299 (= e!836542 call!67970)))

(declare-fun bm!67967 () Bool)

(assert (=> bm!67967 (= call!67970 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(assert (= (and d!157007 (not res!1015849)) b!1493296))

(assert (= (and b!1493296 c!138253) b!1493298))

(assert (= (and b!1493296 (not c!138253)) b!1493297))

(assert (= (and b!1493298 res!1015850) b!1493299))

(assert (= (or b!1493299 b!1493297) bm!67967))

(declare-fun m!1377129 () Bool)

(assert (=> b!1493296 m!1377129))

(assert (=> b!1493296 m!1377129))

(declare-fun m!1377131 () Bool)

(assert (=> b!1493296 m!1377131))

(assert (=> b!1493298 m!1377129))

(declare-fun m!1377133 () Bool)

(assert (=> b!1493298 m!1377133))

(declare-fun m!1377135 () Bool)

(assert (=> b!1493298 m!1377135))

(assert (=> b!1493298 m!1377129))

(declare-fun m!1377137 () Bool)

(assert (=> b!1493298 m!1377137))

(declare-fun m!1377139 () Bool)

(assert (=> bm!67967 m!1377139))

(assert (=> b!1493019 d!157007))

(declare-fun d!157009 () Bool)

(declare-fun lt!650972 () (_ BitVec 32))

(assert (=> d!157009 (and (bvsge lt!650972 #b00000000000000000000000000000000) (bvslt lt!650972 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!157009 (= lt!650972 (choose!52 index!646 x!665 mask!2687))))

(assert (=> d!157009 (validMask!0 mask!2687)))

(assert (=> d!157009 (= (nextIndex!0 index!646 x!665 mask!2687) lt!650972)))

(declare-fun bs!42878 () Bool)

(assert (= bs!42878 d!157009))

(declare-fun m!1377141 () Bool)

(assert (=> bs!42878 m!1377141))

(assert (=> bs!42878 m!1376965))

(assert (=> b!1493018 d!157009))

(declare-fun d!157011 () Bool)

(assert (=> d!157011 (= (validKeyInArray!0 (select (arr!48136 a!2862) j!93)) (and (not (= (select (arr!48136 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48136 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1493007 d!157011))

(declare-fun b!1493300 () Bool)

(declare-fun e!836544 () Bool)

(declare-fun e!836546 () Bool)

(assert (=> b!1493300 (= e!836544 e!836546)))

(declare-fun c!138254 () Bool)

(assert (=> b!1493300 (= c!138254 (validKeyInArray!0 (select (arr!48136 a!2862) j!93)))))

(declare-fun b!1493301 () Bool)

(declare-fun call!67971 () Bool)

(assert (=> b!1493301 (= e!836546 call!67971)))

(declare-fun b!1493302 () Bool)

(declare-fun e!836545 () Bool)

(assert (=> b!1493302 (= e!836546 e!836545)))

(declare-fun lt!650975 () (_ BitVec 64))

(assert (=> b!1493302 (= lt!650975 (select (arr!48136 a!2862) j!93))))

(declare-fun lt!650973 () Unit!50092)

(assert (=> b!1493302 (= lt!650973 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!650975 j!93))))

(assert (=> b!1493302 (arrayContainsKey!0 a!2862 lt!650975 #b00000000000000000000000000000000)))

(declare-fun lt!650974 () Unit!50092)

(assert (=> b!1493302 (= lt!650974 lt!650973)))

(declare-fun res!1015852 () Bool)

(assert (=> b!1493302 (= res!1015852 (= (seekEntryOrOpen!0 (select (arr!48136 a!2862) j!93) a!2862 mask!2687) (Found!12376 j!93)))))

(assert (=> b!1493302 (=> (not res!1015852) (not e!836545))))

(declare-fun d!157013 () Bool)

(declare-fun res!1015851 () Bool)

(assert (=> d!157013 (=> res!1015851 e!836544)))

(assert (=> d!157013 (= res!1015851 (bvsge j!93 (size!48686 a!2862)))))

(assert (=> d!157013 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!836544)))

(declare-fun b!1493303 () Bool)

(assert (=> b!1493303 (= e!836545 call!67971)))

(declare-fun bm!67968 () Bool)

(assert (=> bm!67968 (= call!67971 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(assert (= (and d!157013 (not res!1015851)) b!1493300))

(assert (= (and b!1493300 c!138254) b!1493302))

(assert (= (and b!1493300 (not c!138254)) b!1493301))

(assert (= (and b!1493302 res!1015852) b!1493303))

(assert (= (or b!1493303 b!1493301) bm!67968))

(assert (=> b!1493300 m!1376941))

(assert (=> b!1493300 m!1376941))

(assert (=> b!1493300 m!1376987))

(assert (=> b!1493302 m!1376941))

(declare-fun m!1377143 () Bool)

(assert (=> b!1493302 m!1377143))

(declare-fun m!1377145 () Bool)

(assert (=> b!1493302 m!1377145))

(assert (=> b!1493302 m!1376941))

(assert (=> b!1493302 m!1376973))

(declare-fun m!1377147 () Bool)

(assert (=> bm!67968 m!1377147))

(assert (=> b!1493006 d!157013))

(declare-fun d!157015 () Bool)

(assert (=> d!157015 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!650983 () Unit!50092)

(declare-fun choose!38 (array!99732 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50092)

(assert (=> d!157015 (= lt!650983 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!157015 (validMask!0 mask!2687)))

(assert (=> d!157015 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!650983)))

(declare-fun bs!42879 () Bool)

(assert (= bs!42879 d!157015))

(assert (=> bs!42879 m!1376951))

(declare-fun m!1377159 () Bool)

(assert (=> bs!42879 m!1377159))

(assert (=> bs!42879 m!1376965))

(assert (=> b!1493006 d!157015))

(declare-fun b!1493317 () Bool)

(declare-fun lt!650985 () SeekEntryResult!12376)

(assert (=> b!1493317 (and (bvsge (index!51898 lt!650985) #b00000000000000000000000000000000) (bvslt (index!51898 lt!650985) (size!48686 lt!650843)))))

(declare-fun res!1015860 () Bool)

(assert (=> b!1493317 (= res!1015860 (= (select (arr!48136 lt!650843) (index!51898 lt!650985)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!836558 () Bool)

(assert (=> b!1493317 (=> res!1015860 e!836558)))

(declare-fun b!1493318 () Bool)

(declare-fun e!836555 () SeekEntryResult!12376)

(assert (=> b!1493318 (= e!836555 (Intermediate!12376 true (toIndex!0 lt!650840 mask!2687) #b00000000000000000000000000000000))))

(declare-fun d!157021 () Bool)

(declare-fun e!836559 () Bool)

(assert (=> d!157021 e!836559))

(declare-fun c!138260 () Bool)

(assert (=> d!157021 (= c!138260 (and (is-Intermediate!12376 lt!650985) (undefined!13188 lt!650985)))))

(assert (=> d!157021 (= lt!650985 e!836555)))

(declare-fun c!138259 () Bool)

(assert (=> d!157021 (= c!138259 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!650984 () (_ BitVec 64))

(assert (=> d!157021 (= lt!650984 (select (arr!48136 lt!650843) (toIndex!0 lt!650840 mask!2687)))))

(assert (=> d!157021 (validMask!0 mask!2687)))

(assert (=> d!157021 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650840 mask!2687) lt!650840 lt!650843 mask!2687) lt!650985)))

(declare-fun b!1493319 () Bool)

(assert (=> b!1493319 (= e!836559 (bvsge (x!133484 lt!650985) #b01111111111111111111111111111110))))

(declare-fun b!1493320 () Bool)

(declare-fun e!836556 () SeekEntryResult!12376)

(assert (=> b!1493320 (= e!836555 e!836556)))

(declare-fun c!138261 () Bool)

(assert (=> b!1493320 (= c!138261 (or (= lt!650984 lt!650840) (= (bvadd lt!650984 lt!650984) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1493321 () Bool)

(assert (=> b!1493321 (and (bvsge (index!51898 lt!650985) #b00000000000000000000000000000000) (bvslt (index!51898 lt!650985) (size!48686 lt!650843)))))

(declare-fun res!1015859 () Bool)

(assert (=> b!1493321 (= res!1015859 (= (select (arr!48136 lt!650843) (index!51898 lt!650985)) lt!650840))))

(assert (=> b!1493321 (=> res!1015859 e!836558)))

(declare-fun e!836557 () Bool)

(assert (=> b!1493321 (= e!836557 e!836558)))

(declare-fun b!1493322 () Bool)

(assert (=> b!1493322 (= e!836556 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!650840 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!650840 lt!650843 mask!2687))))

(declare-fun b!1493323 () Bool)

(assert (=> b!1493323 (= e!836559 e!836557)))

(declare-fun res!1015858 () Bool)

(assert (=> b!1493323 (= res!1015858 (and (is-Intermediate!12376 lt!650985) (not (undefined!13188 lt!650985)) (bvslt (x!133484 lt!650985) #b01111111111111111111111111111110) (bvsge (x!133484 lt!650985) #b00000000000000000000000000000000) (bvsge (x!133484 lt!650985) #b00000000000000000000000000000000)))))

(assert (=> b!1493323 (=> (not res!1015858) (not e!836557))))

(declare-fun b!1493324 () Bool)

(assert (=> b!1493324 (= e!836556 (Intermediate!12376 false (toIndex!0 lt!650840 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1493325 () Bool)

(assert (=> b!1493325 (and (bvsge (index!51898 lt!650985) #b00000000000000000000000000000000) (bvslt (index!51898 lt!650985) (size!48686 lt!650843)))))

(assert (=> b!1493325 (= e!836558 (= (select (arr!48136 lt!650843) (index!51898 lt!650985)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!157021 c!138259) b!1493318))

(assert (= (and d!157021 (not c!138259)) b!1493320))

(assert (= (and b!1493320 c!138261) b!1493324))

(assert (= (and b!1493320 (not c!138261)) b!1493322))

(assert (= (and d!157021 c!138260) b!1493319))

(assert (= (and d!157021 (not c!138260)) b!1493323))

(assert (= (and b!1493323 res!1015858) b!1493321))

(assert (= (and b!1493321 (not res!1015859)) b!1493317))

(assert (= (and b!1493317 (not res!1015860)) b!1493325))

(declare-fun m!1377161 () Bool)

(assert (=> b!1493321 m!1377161))

(assert (=> b!1493325 m!1377161))

(assert (=> d!157021 m!1376981))

(declare-fun m!1377163 () Bool)

(assert (=> d!157021 m!1377163))

(assert (=> d!157021 m!1376965))

(assert (=> b!1493322 m!1376981))

(declare-fun m!1377165 () Bool)

(assert (=> b!1493322 m!1377165))

(assert (=> b!1493322 m!1377165))

(declare-fun m!1377167 () Bool)

(assert (=> b!1493322 m!1377167))

(assert (=> b!1493317 m!1377161))

(assert (=> b!1493017 d!157021))

(declare-fun d!157023 () Bool)

(declare-fun lt!650987 () (_ BitVec 32))

(declare-fun lt!650986 () (_ BitVec 32))

(assert (=> d!157023 (= lt!650987 (bvmul (bvxor lt!650986 (bvlshr lt!650986 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!157023 (= lt!650986 ((_ extract 31 0) (bvand (bvxor lt!650840 (bvlshr lt!650840 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!157023 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1015818 (let ((h!36021 ((_ extract 31 0) (bvand (bvxor lt!650840 (bvlshr lt!650840 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133490 (bvmul (bvxor h!36021 (bvlshr h!36021 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133490 (bvlshr x!133490 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1015818 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1015818 #b00000000000000000000000000000000))))))

(assert (=> d!157023 (= (toIndex!0 lt!650840 mask!2687) (bvand (bvxor lt!650987 (bvlshr lt!650987 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1493017 d!157023))

(declare-fun b!1493345 () Bool)

(declare-fun e!836574 () Bool)

(declare-fun e!836576 () Bool)

(assert (=> b!1493345 (= e!836574 e!836576)))

(declare-fun c!138267 () Bool)

(assert (=> b!1493345 (= c!138267 (validKeyInArray!0 (select (arr!48136 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1493346 () Bool)

(declare-fun e!836573 () Bool)

(declare-fun contains!9929 (List!34637 (_ BitVec 64)) Bool)

(assert (=> b!1493346 (= e!836573 (contains!9929 Nil!34634 (select (arr!48136 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1493347 () Bool)

(declare-fun call!67975 () Bool)

(assert (=> b!1493347 (= e!836576 call!67975)))

(declare-fun bm!67972 () Bool)

(assert (=> bm!67972 (= call!67975 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!138267 (Cons!34633 (select (arr!48136 a!2862) #b00000000000000000000000000000000) Nil!34634) Nil!34634)))))

(declare-fun d!157025 () Bool)

(declare-fun res!1015871 () Bool)

(declare-fun e!836575 () Bool)

(assert (=> d!157025 (=> res!1015871 e!836575)))

(assert (=> d!157025 (= res!1015871 (bvsge #b00000000000000000000000000000000 (size!48686 a!2862)))))

(assert (=> d!157025 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34634) e!836575)))

(declare-fun b!1493348 () Bool)

(assert (=> b!1493348 (= e!836576 call!67975)))

(declare-fun b!1493349 () Bool)

(assert (=> b!1493349 (= e!836575 e!836574)))

(declare-fun res!1015872 () Bool)

(assert (=> b!1493349 (=> (not res!1015872) (not e!836574))))

(assert (=> b!1493349 (= res!1015872 (not e!836573))))

(declare-fun res!1015873 () Bool)

(assert (=> b!1493349 (=> (not res!1015873) (not e!836573))))

(assert (=> b!1493349 (= res!1015873 (validKeyInArray!0 (select (arr!48136 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!157025 (not res!1015871)) b!1493349))

(assert (= (and b!1493349 res!1015873) b!1493346))

(assert (= (and b!1493349 res!1015872) b!1493345))

(assert (= (and b!1493345 c!138267) b!1493348))

(assert (= (and b!1493345 (not c!138267)) b!1493347))

(assert (= (or b!1493348 b!1493347) bm!67972))

(assert (=> b!1493345 m!1377129))

(assert (=> b!1493345 m!1377129))

(assert (=> b!1493345 m!1377131))

(assert (=> b!1493346 m!1377129))

(assert (=> b!1493346 m!1377129))

(declare-fun m!1377179 () Bool)

(assert (=> b!1493346 m!1377179))

(assert (=> bm!67972 m!1377129))

(declare-fun m!1377181 () Bool)

(assert (=> bm!67972 m!1377181))

(assert (=> b!1493349 m!1377129))

(assert (=> b!1493349 m!1377129))

(assert (=> b!1493349 m!1377131))

(assert (=> b!1493016 d!157025))

(declare-fun b!1493350 () Bool)

(declare-fun lt!650994 () SeekEntryResult!12376)

(assert (=> b!1493350 (and (bvsge (index!51898 lt!650994) #b00000000000000000000000000000000) (bvslt (index!51898 lt!650994) (size!48686 lt!650843)))))

(declare-fun res!1015876 () Bool)

(assert (=> b!1493350 (= res!1015876 (= (select (arr!48136 lt!650843) (index!51898 lt!650994)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!836580 () Bool)

(assert (=> b!1493350 (=> res!1015876 e!836580)))

(declare-fun b!1493351 () Bool)

(declare-fun e!836577 () SeekEntryResult!12376)

(assert (=> b!1493351 (= e!836577 (Intermediate!12376 true index!646 x!665))))

(declare-fun d!157031 () Bool)

(declare-fun e!836581 () Bool)

(assert (=> d!157031 e!836581))

(declare-fun c!138269 () Bool)

(assert (=> d!157031 (= c!138269 (and (is-Intermediate!12376 lt!650994) (undefined!13188 lt!650994)))))

(assert (=> d!157031 (= lt!650994 e!836577)))

(declare-fun c!138268 () Bool)

(assert (=> d!157031 (= c!138268 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!650993 () (_ BitVec 64))

(assert (=> d!157031 (= lt!650993 (select (arr!48136 lt!650843) index!646))))

(assert (=> d!157031 (validMask!0 mask!2687)))

(assert (=> d!157031 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650840 lt!650843 mask!2687) lt!650994)))

(declare-fun b!1493352 () Bool)

(assert (=> b!1493352 (= e!836581 (bvsge (x!133484 lt!650994) #b01111111111111111111111111111110))))

(declare-fun b!1493353 () Bool)

(declare-fun e!836578 () SeekEntryResult!12376)

(assert (=> b!1493353 (= e!836577 e!836578)))

(declare-fun c!138270 () Bool)

(assert (=> b!1493353 (= c!138270 (or (= lt!650993 lt!650840) (= (bvadd lt!650993 lt!650993) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1493354 () Bool)

(assert (=> b!1493354 (and (bvsge (index!51898 lt!650994) #b00000000000000000000000000000000) (bvslt (index!51898 lt!650994) (size!48686 lt!650843)))))

(declare-fun res!1015875 () Bool)

(assert (=> b!1493354 (= res!1015875 (= (select (arr!48136 lt!650843) (index!51898 lt!650994)) lt!650840))))

(assert (=> b!1493354 (=> res!1015875 e!836580)))

(declare-fun e!836579 () Bool)

(assert (=> b!1493354 (= e!836579 e!836580)))

(declare-fun b!1493355 () Bool)

(assert (=> b!1493355 (= e!836578 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!650840 lt!650843 mask!2687))))

(declare-fun b!1493356 () Bool)

(assert (=> b!1493356 (= e!836581 e!836579)))

(declare-fun res!1015874 () Bool)

(assert (=> b!1493356 (= res!1015874 (and (is-Intermediate!12376 lt!650994) (not (undefined!13188 lt!650994)) (bvslt (x!133484 lt!650994) #b01111111111111111111111111111110) (bvsge (x!133484 lt!650994) #b00000000000000000000000000000000) (bvsge (x!133484 lt!650994) x!665)))))

(assert (=> b!1493356 (=> (not res!1015874) (not e!836579))))

(declare-fun b!1493357 () Bool)

(assert (=> b!1493357 (= e!836578 (Intermediate!12376 false index!646 x!665))))

(declare-fun b!1493358 () Bool)

(assert (=> b!1493358 (and (bvsge (index!51898 lt!650994) #b00000000000000000000000000000000) (bvslt (index!51898 lt!650994) (size!48686 lt!650843)))))

(assert (=> b!1493358 (= e!836580 (= (select (arr!48136 lt!650843) (index!51898 lt!650994)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!157031 c!138268) b!1493351))

(assert (= (and d!157031 (not c!138268)) b!1493353))

(assert (= (and b!1493353 c!138270) b!1493357))

(assert (= (and b!1493353 (not c!138270)) b!1493355))

(assert (= (and d!157031 c!138269) b!1493352))

(assert (= (and d!157031 (not c!138269)) b!1493356))

(assert (= (and b!1493356 res!1015874) b!1493354))

(assert (= (and b!1493354 (not res!1015875)) b!1493350))

(assert (= (and b!1493350 (not res!1015876)) b!1493358))

(declare-fun m!1377183 () Bool)

(assert (=> b!1493354 m!1377183))

(assert (=> b!1493358 m!1377183))

(assert (=> d!157031 m!1377099))

(assert (=> d!157031 m!1376965))

(assert (=> b!1493355 m!1376979))

(assert (=> b!1493355 m!1376979))

(declare-fun m!1377185 () Bool)

(assert (=> b!1493355 m!1377185))

(assert (=> b!1493350 m!1377183))

(assert (=> b!1493005 d!157031))

(declare-fun b!1493359 () Bool)

(declare-fun e!836584 () SeekEntryResult!12376)

(declare-fun lt!650995 () SeekEntryResult!12376)

(assert (=> b!1493359 (= e!836584 (Found!12376 (index!51898 lt!650995)))))

(declare-fun b!1493360 () Bool)

(declare-fun e!836582 () SeekEntryResult!12376)

(assert (=> b!1493360 (= e!836582 (seekKeyOrZeroReturnVacant!0 (x!133484 lt!650995) (index!51898 lt!650995) (index!51898 lt!650995) (select (arr!48136 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1493361 () Bool)

(declare-fun c!138272 () Bool)

(declare-fun lt!650997 () (_ BitVec 64))

(assert (=> b!1493361 (= c!138272 (= lt!650997 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1493361 (= e!836584 e!836582)))

(declare-fun b!1493362 () Bool)

(declare-fun e!836583 () SeekEntryResult!12376)

(assert (=> b!1493362 (= e!836583 e!836584)))

(assert (=> b!1493362 (= lt!650997 (select (arr!48136 a!2862) (index!51898 lt!650995)))))

(declare-fun c!138273 () Bool)

(assert (=> b!1493362 (= c!138273 (= lt!650997 (select (arr!48136 a!2862) j!93)))))

(declare-fun b!1493363 () Bool)

(assert (=> b!1493363 (= e!836582 (MissingZero!12376 (index!51898 lt!650995)))))

(declare-fun b!1493364 () Bool)

(assert (=> b!1493364 (= e!836583 Undefined!12376)))

(declare-fun d!157033 () Bool)

(declare-fun lt!650996 () SeekEntryResult!12376)

(assert (=> d!157033 (and (or (is-Undefined!12376 lt!650996) (not (is-Found!12376 lt!650996)) (and (bvsge (index!51897 lt!650996) #b00000000000000000000000000000000) (bvslt (index!51897 lt!650996) (size!48686 a!2862)))) (or (is-Undefined!12376 lt!650996) (is-Found!12376 lt!650996) (not (is-MissingZero!12376 lt!650996)) (and (bvsge (index!51896 lt!650996) #b00000000000000000000000000000000) (bvslt (index!51896 lt!650996) (size!48686 a!2862)))) (or (is-Undefined!12376 lt!650996) (is-Found!12376 lt!650996) (is-MissingZero!12376 lt!650996) (not (is-MissingVacant!12376 lt!650996)) (and (bvsge (index!51899 lt!650996) #b00000000000000000000000000000000) (bvslt (index!51899 lt!650996) (size!48686 a!2862)))) (or (is-Undefined!12376 lt!650996) (ite (is-Found!12376 lt!650996) (= (select (arr!48136 a!2862) (index!51897 lt!650996)) (select (arr!48136 a!2862) j!93)) (ite (is-MissingZero!12376 lt!650996) (= (select (arr!48136 a!2862) (index!51896 lt!650996)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12376 lt!650996) (= (select (arr!48136 a!2862) (index!51899 lt!650996)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!157033 (= lt!650996 e!836583)))

(declare-fun c!138271 () Bool)

(assert (=> d!157033 (= c!138271 (and (is-Intermediate!12376 lt!650995) (undefined!13188 lt!650995)))))

(assert (=> d!157033 (= lt!650995 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48136 a!2862) j!93) mask!2687) (select (arr!48136 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!157033 (validMask!0 mask!2687)))

(assert (=> d!157033 (= (seekEntryOrOpen!0 (select (arr!48136 a!2862) j!93) a!2862 mask!2687) lt!650996)))

(assert (= (and d!157033 c!138271) b!1493364))

(assert (= (and d!157033 (not c!138271)) b!1493362))

(assert (= (and b!1493362 c!138273) b!1493359))

(assert (= (and b!1493362 (not c!138273)) b!1493361))

(assert (= (and b!1493361 c!138272) b!1493363))

(assert (= (and b!1493361 (not c!138272)) b!1493360))

(assert (=> b!1493360 m!1376941))

(declare-fun m!1377187 () Bool)

(assert (=> b!1493360 m!1377187))

(declare-fun m!1377189 () Bool)

(assert (=> b!1493362 m!1377189))

(declare-fun m!1377191 () Bool)

(assert (=> d!157033 m!1377191))

(assert (=> d!157033 m!1376965))

(assert (=> d!157033 m!1376941))

(assert (=> d!157033 m!1376959))

(declare-fun m!1377193 () Bool)

(assert (=> d!157033 m!1377193))

(assert (=> d!157033 m!1376959))

(assert (=> d!157033 m!1376941))

(assert (=> d!157033 m!1376961))

(declare-fun m!1377195 () Bool)

(assert (=> d!157033 m!1377195))

(assert (=> b!1493015 d!157033))

(push 1)

