; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121972 () Bool)

(assert start!121972)

(declare-fun b!1415544 () Bool)

(declare-fun res!951592 () Bool)

(declare-fun e!801164 () Bool)

(assert (=> b!1415544 (=> (not res!951592) (not e!801164))))

(declare-datatypes ((array!96658 0))(
  ( (array!96659 (arr!46660 (Array (_ BitVec 32) (_ BitVec 64))) (size!47210 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96658)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96658 (_ BitVec 32)) Bool)

(assert (=> b!1415544 (= res!951592 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1415545 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun e!801160 () Bool)

(declare-datatypes ((SeekEntryResult!10971 0))(
  ( (MissingZero!10971 (index!46276 (_ BitVec 32))) (Found!10971 (index!46277 (_ BitVec 32))) (Intermediate!10971 (undefined!11783 Bool) (index!46278 (_ BitVec 32)) (x!127882 (_ BitVec 32))) (Undefined!10971) (MissingVacant!10971 (index!46279 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96658 (_ BitVec 32)) SeekEntryResult!10971)

(assert (=> b!1415545 (= e!801160 (= (seekEntryOrOpen!0 (select (arr!46660 a!2901) j!112) a!2901 mask!2840) (Found!10971 j!112)))))

(declare-fun b!1415546 () Bool)

(declare-fun res!951586 () Bool)

(assert (=> b!1415546 (=> (not res!951586) (not e!801164))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1415546 (= res!951586 (and (= (size!47210 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47210 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47210 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1415547 () Bool)

(declare-fun e!801163 () Bool)

(assert (=> b!1415547 (= e!801163 true)))

(declare-fun e!801162 () Bool)

(assert (=> b!1415547 e!801162))

(declare-fun res!951588 () Bool)

(assert (=> b!1415547 (=> (not res!951588) (not e!801162))))

(declare-fun lt!624219 () SeekEntryResult!10971)

(declare-fun lt!624220 () SeekEntryResult!10971)

(assert (=> b!1415547 (= res!951588 (and (not (undefined!11783 lt!624219)) (= (index!46278 lt!624219) i!1037) (bvslt (x!127882 lt!624219) (x!127882 lt!624220)) (= (select (store (arr!46660 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46278 lt!624219)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47916 0))(
  ( (Unit!47917) )
))
(declare-fun lt!624218 () Unit!47916)

(declare-fun lt!624221 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96658 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47916)

(assert (=> b!1415547 (= lt!624218 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624221 (x!127882 lt!624220) (index!46278 lt!624220) (x!127882 lt!624219) (index!46278 lt!624219) (undefined!11783 lt!624219) mask!2840))))

(declare-fun res!951595 () Bool)

(assert (=> start!121972 (=> (not res!951595) (not e!801164))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121972 (= res!951595 (validMask!0 mask!2840))))

(assert (=> start!121972 e!801164))

(assert (=> start!121972 true))

(declare-fun array_inv!35688 (array!96658) Bool)

(assert (=> start!121972 (array_inv!35688 a!2901)))

(declare-fun b!1415548 () Bool)

(declare-fun e!801161 () Bool)

(assert (=> b!1415548 (= e!801161 e!801163)))

(declare-fun res!951593 () Bool)

(assert (=> b!1415548 (=> res!951593 e!801163)))

(assert (=> b!1415548 (= res!951593 (or (= lt!624220 lt!624219) (not (is-Intermediate!10971 lt!624219))))))

(declare-fun lt!624216 () (_ BitVec 64))

(declare-fun lt!624217 () array!96658)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96658 (_ BitVec 32)) SeekEntryResult!10971)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415548 (= lt!624219 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624216 mask!2840) lt!624216 lt!624217 mask!2840))))

(assert (=> b!1415548 (= lt!624216 (select (store (arr!46660 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415548 (= lt!624217 (array!96659 (store (arr!46660 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47210 a!2901)))))

(declare-fun b!1415549 () Bool)

(declare-fun res!951590 () Bool)

(assert (=> b!1415549 (=> (not res!951590) (not e!801164))))

(declare-datatypes ((List!33179 0))(
  ( (Nil!33176) (Cons!33175 (h!34462 (_ BitVec 64)) (t!47873 List!33179)) )
))
(declare-fun arrayNoDuplicates!0 (array!96658 (_ BitVec 32) List!33179) Bool)

(assert (=> b!1415549 (= res!951590 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33176))))

(declare-fun b!1415550 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96658 (_ BitVec 32)) SeekEntryResult!10971)

(assert (=> b!1415550 (= e!801162 (= (seekEntryOrOpen!0 lt!624216 lt!624217 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127882 lt!624219) (index!46278 lt!624219) (index!46278 lt!624219) (select (arr!46660 a!2901) j!112) lt!624217 mask!2840)))))

(declare-fun b!1415551 () Bool)

(declare-fun res!951589 () Bool)

(assert (=> b!1415551 (=> (not res!951589) (not e!801164))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415551 (= res!951589 (validKeyInArray!0 (select (arr!46660 a!2901) i!1037)))))

(declare-fun b!1415552 () Bool)

(declare-fun res!951594 () Bool)

(assert (=> b!1415552 (=> (not res!951594) (not e!801164))))

(assert (=> b!1415552 (= res!951594 (validKeyInArray!0 (select (arr!46660 a!2901) j!112)))))

(declare-fun b!1415553 () Bool)

(assert (=> b!1415553 (= e!801164 (not e!801161))))

(declare-fun res!951591 () Bool)

(assert (=> b!1415553 (=> res!951591 e!801161)))

(assert (=> b!1415553 (= res!951591 (or (not (is-Intermediate!10971 lt!624220)) (undefined!11783 lt!624220)))))

(assert (=> b!1415553 e!801160))

(declare-fun res!951587 () Bool)

(assert (=> b!1415553 (=> (not res!951587) (not e!801160))))

(assert (=> b!1415553 (= res!951587 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!624222 () Unit!47916)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96658 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47916)

(assert (=> b!1415553 (= lt!624222 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1415553 (= lt!624220 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624221 (select (arr!46660 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1415553 (= lt!624221 (toIndex!0 (select (arr!46660 a!2901) j!112) mask!2840))))

(assert (= (and start!121972 res!951595) b!1415546))

(assert (= (and b!1415546 res!951586) b!1415551))

(assert (= (and b!1415551 res!951589) b!1415552))

(assert (= (and b!1415552 res!951594) b!1415544))

(assert (= (and b!1415544 res!951592) b!1415549))

(assert (= (and b!1415549 res!951590) b!1415553))

(assert (= (and b!1415553 res!951587) b!1415545))

(assert (= (and b!1415553 (not res!951591)) b!1415548))

(assert (= (and b!1415548 (not res!951593)) b!1415547))

(assert (= (and b!1415547 res!951588) b!1415550))

(declare-fun m!1305867 () Bool)

(assert (=> b!1415551 m!1305867))

(assert (=> b!1415551 m!1305867))

(declare-fun m!1305869 () Bool)

(assert (=> b!1415551 m!1305869))

(declare-fun m!1305871 () Bool)

(assert (=> b!1415553 m!1305871))

(declare-fun m!1305873 () Bool)

(assert (=> b!1415553 m!1305873))

(assert (=> b!1415553 m!1305871))

(assert (=> b!1415553 m!1305871))

(declare-fun m!1305875 () Bool)

(assert (=> b!1415553 m!1305875))

(declare-fun m!1305877 () Bool)

(assert (=> b!1415553 m!1305877))

(declare-fun m!1305879 () Bool)

(assert (=> b!1415553 m!1305879))

(declare-fun m!1305881 () Bool)

(assert (=> b!1415550 m!1305881))

(assert (=> b!1415550 m!1305871))

(assert (=> b!1415550 m!1305871))

(declare-fun m!1305883 () Bool)

(assert (=> b!1415550 m!1305883))

(declare-fun m!1305885 () Bool)

(assert (=> b!1415547 m!1305885))

(declare-fun m!1305887 () Bool)

(assert (=> b!1415547 m!1305887))

(declare-fun m!1305889 () Bool)

(assert (=> b!1415547 m!1305889))

(declare-fun m!1305891 () Bool)

(assert (=> b!1415549 m!1305891))

(assert (=> b!1415545 m!1305871))

(assert (=> b!1415545 m!1305871))

(declare-fun m!1305893 () Bool)

(assert (=> b!1415545 m!1305893))

(declare-fun m!1305895 () Bool)

(assert (=> start!121972 m!1305895))

(declare-fun m!1305897 () Bool)

(assert (=> start!121972 m!1305897))

(declare-fun m!1305899 () Bool)

(assert (=> b!1415544 m!1305899))

(assert (=> b!1415552 m!1305871))

(assert (=> b!1415552 m!1305871))

(declare-fun m!1305901 () Bool)

(assert (=> b!1415552 m!1305901))

(declare-fun m!1305903 () Bool)

(assert (=> b!1415548 m!1305903))

(assert (=> b!1415548 m!1305903))

(declare-fun m!1305905 () Bool)

(assert (=> b!1415548 m!1305905))

(assert (=> b!1415548 m!1305885))

(declare-fun m!1305907 () Bool)

(assert (=> b!1415548 m!1305907))

(push 1)

