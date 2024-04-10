; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121970 () Bool)

(assert start!121970)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96656 0))(
  ( (array!96657 (arr!46659 (Array (_ BitVec 32) (_ BitVec 64))) (size!47209 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96656)

(declare-fun b!1415514 () Bool)

(declare-fun lt!624201 () array!96656)

(declare-datatypes ((SeekEntryResult!10970 0))(
  ( (MissingZero!10970 (index!46272 (_ BitVec 32))) (Found!10970 (index!46273 (_ BitVec 32))) (Intermediate!10970 (undefined!11782 Bool) (index!46274 (_ BitVec 32)) (x!127881 (_ BitVec 32))) (Undefined!10970) (MissingVacant!10970 (index!46275 (_ BitVec 32))) )
))
(declare-fun lt!624195 () SeekEntryResult!10970)

(declare-fun lt!624198 () (_ BitVec 64))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun e!801145 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96656 (_ BitVec 32)) SeekEntryResult!10970)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96656 (_ BitVec 32)) SeekEntryResult!10970)

(assert (=> b!1415514 (= e!801145 (= (seekEntryOrOpen!0 lt!624198 lt!624201 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127881 lt!624195) (index!46274 lt!624195) (index!46274 lt!624195) (select (arr!46659 a!2901) j!112) lt!624201 mask!2840)))))

(declare-fun b!1415515 () Bool)

(declare-fun e!801143 () Bool)

(declare-fun e!801142 () Bool)

(assert (=> b!1415515 (= e!801143 (not e!801142))))

(declare-fun res!951558 () Bool)

(assert (=> b!1415515 (=> res!951558 e!801142)))

(declare-fun lt!624199 () SeekEntryResult!10970)

(get-info :version)

(assert (=> b!1415515 (= res!951558 (or (not ((_ is Intermediate!10970) lt!624199)) (undefined!11782 lt!624199)))))

(declare-fun e!801141 () Bool)

(assert (=> b!1415515 e!801141))

(declare-fun res!951556 () Bool)

(assert (=> b!1415515 (=> (not res!951556) (not e!801141))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96656 (_ BitVec 32)) Bool)

(assert (=> b!1415515 (= res!951556 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47914 0))(
  ( (Unit!47915) )
))
(declare-fun lt!624197 () Unit!47914)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96656 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47914)

(assert (=> b!1415515 (= lt!624197 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!624200 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96656 (_ BitVec 32)) SeekEntryResult!10970)

(assert (=> b!1415515 (= lt!624199 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624200 (select (arr!46659 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415515 (= lt!624200 (toIndex!0 (select (arr!46659 a!2901) j!112) mask!2840))))

(declare-fun b!1415516 () Bool)

(declare-fun res!951561 () Bool)

(assert (=> b!1415516 (=> (not res!951561) (not e!801143))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1415516 (= res!951561 (and (= (size!47209 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47209 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47209 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1415517 () Bool)

(declare-fun res!951565 () Bool)

(assert (=> b!1415517 (=> (not res!951565) (not e!801143))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415517 (= res!951565 (validKeyInArray!0 (select (arr!46659 a!2901) i!1037)))))

(declare-fun b!1415518 () Bool)

(assert (=> b!1415518 (= e!801141 (= (seekEntryOrOpen!0 (select (arr!46659 a!2901) j!112) a!2901 mask!2840) (Found!10970 j!112)))))

(declare-fun res!951562 () Bool)

(assert (=> start!121970 (=> (not res!951562) (not e!801143))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121970 (= res!951562 (validMask!0 mask!2840))))

(assert (=> start!121970 e!801143))

(assert (=> start!121970 true))

(declare-fun array_inv!35687 (array!96656) Bool)

(assert (=> start!121970 (array_inv!35687 a!2901)))

(declare-fun b!1415519 () Bool)

(declare-fun res!951557 () Bool)

(assert (=> b!1415519 (=> (not res!951557) (not e!801143))))

(declare-datatypes ((List!33178 0))(
  ( (Nil!33175) (Cons!33174 (h!34461 (_ BitVec 64)) (t!47872 List!33178)) )
))
(declare-fun arrayNoDuplicates!0 (array!96656 (_ BitVec 32) List!33178) Bool)

(assert (=> b!1415519 (= res!951557 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33175))))

(declare-fun b!1415520 () Bool)

(declare-fun e!801144 () Bool)

(assert (=> b!1415520 (= e!801144 true)))

(assert (=> b!1415520 e!801145))

(declare-fun res!951559 () Bool)

(assert (=> b!1415520 (=> (not res!951559) (not e!801145))))

(assert (=> b!1415520 (= res!951559 (and (not (undefined!11782 lt!624195)) (= (index!46274 lt!624195) i!1037) (bvslt (x!127881 lt!624195) (x!127881 lt!624199)) (= (select (store (arr!46659 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46274 lt!624195)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!624196 () Unit!47914)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96656 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47914)

(assert (=> b!1415520 (= lt!624196 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624200 (x!127881 lt!624199) (index!46274 lt!624199) (x!127881 lt!624195) (index!46274 lt!624195) (undefined!11782 lt!624195) mask!2840))))

(declare-fun b!1415521 () Bool)

(declare-fun res!951564 () Bool)

(assert (=> b!1415521 (=> (not res!951564) (not e!801143))))

(assert (=> b!1415521 (= res!951564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1415522 () Bool)

(assert (=> b!1415522 (= e!801142 e!801144)))

(declare-fun res!951560 () Bool)

(assert (=> b!1415522 (=> res!951560 e!801144)))

(assert (=> b!1415522 (= res!951560 (or (= lt!624199 lt!624195) (not ((_ is Intermediate!10970) lt!624195))))))

(assert (=> b!1415522 (= lt!624195 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624198 mask!2840) lt!624198 lt!624201 mask!2840))))

(assert (=> b!1415522 (= lt!624198 (select (store (arr!46659 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415522 (= lt!624201 (array!96657 (store (arr!46659 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47209 a!2901)))))

(declare-fun b!1415523 () Bool)

(declare-fun res!951563 () Bool)

(assert (=> b!1415523 (=> (not res!951563) (not e!801143))))

(assert (=> b!1415523 (= res!951563 (validKeyInArray!0 (select (arr!46659 a!2901) j!112)))))

(assert (= (and start!121970 res!951562) b!1415516))

(assert (= (and b!1415516 res!951561) b!1415517))

(assert (= (and b!1415517 res!951565) b!1415523))

(assert (= (and b!1415523 res!951563) b!1415521))

(assert (= (and b!1415521 res!951564) b!1415519))

(assert (= (and b!1415519 res!951557) b!1415515))

(assert (= (and b!1415515 res!951556) b!1415518))

(assert (= (and b!1415515 (not res!951558)) b!1415522))

(assert (= (and b!1415522 (not res!951560)) b!1415520))

(assert (= (and b!1415520 res!951559) b!1415514))

(declare-fun m!1305825 () Bool)

(assert (=> b!1415520 m!1305825))

(declare-fun m!1305827 () Bool)

(assert (=> b!1415520 m!1305827))

(declare-fun m!1305829 () Bool)

(assert (=> b!1415520 m!1305829))

(declare-fun m!1305831 () Bool)

(assert (=> b!1415519 m!1305831))

(declare-fun m!1305833 () Bool)

(assert (=> b!1415517 m!1305833))

(assert (=> b!1415517 m!1305833))

(declare-fun m!1305835 () Bool)

(assert (=> b!1415517 m!1305835))

(declare-fun m!1305837 () Bool)

(assert (=> start!121970 m!1305837))

(declare-fun m!1305839 () Bool)

(assert (=> start!121970 m!1305839))

(declare-fun m!1305841 () Bool)

(assert (=> b!1415523 m!1305841))

(assert (=> b!1415523 m!1305841))

(declare-fun m!1305843 () Bool)

(assert (=> b!1415523 m!1305843))

(assert (=> b!1415515 m!1305841))

(declare-fun m!1305845 () Bool)

(assert (=> b!1415515 m!1305845))

(assert (=> b!1415515 m!1305841))

(declare-fun m!1305847 () Bool)

(assert (=> b!1415515 m!1305847))

(assert (=> b!1415515 m!1305841))

(declare-fun m!1305849 () Bool)

(assert (=> b!1415515 m!1305849))

(declare-fun m!1305851 () Bool)

(assert (=> b!1415515 m!1305851))

(declare-fun m!1305853 () Bool)

(assert (=> b!1415522 m!1305853))

(assert (=> b!1415522 m!1305853))

(declare-fun m!1305855 () Bool)

(assert (=> b!1415522 m!1305855))

(assert (=> b!1415522 m!1305825))

(declare-fun m!1305857 () Bool)

(assert (=> b!1415522 m!1305857))

(assert (=> b!1415518 m!1305841))

(assert (=> b!1415518 m!1305841))

(declare-fun m!1305859 () Bool)

(assert (=> b!1415518 m!1305859))

(declare-fun m!1305861 () Bool)

(assert (=> b!1415514 m!1305861))

(assert (=> b!1415514 m!1305841))

(assert (=> b!1415514 m!1305841))

(declare-fun m!1305863 () Bool)

(assert (=> b!1415514 m!1305863))

(declare-fun m!1305865 () Bool)

(assert (=> b!1415521 m!1305865))

(check-sat (not b!1415519) (not b!1415518) (not start!121970) (not b!1415522) (not b!1415515) (not b!1415521) (not b!1415517) (not b!1415520) (not b!1415523) (not b!1415514))
(check-sat)
