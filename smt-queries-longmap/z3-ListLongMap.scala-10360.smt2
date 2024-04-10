; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121976 () Bool)

(assert start!121976)

(declare-fun res!951648 () Bool)

(declare-fun e!801199 () Bool)

(assert (=> start!121976 (=> (not res!951648) (not e!801199))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121976 (= res!951648 (validMask!0 mask!2840))))

(assert (=> start!121976 e!801199))

(assert (=> start!121976 true))

(declare-datatypes ((array!96662 0))(
  ( (array!96663 (arr!46662 (Array (_ BitVec 32) (_ BitVec 64))) (size!47212 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96662)

(declare-fun array_inv!35690 (array!96662) Bool)

(assert (=> start!121976 (array_inv!35690 a!2901)))

(declare-fun b!1415604 () Bool)

(declare-fun res!951650 () Bool)

(assert (=> b!1415604 (=> (not res!951650) (not e!801199))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1415604 (= res!951650 (and (= (size!47212 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47212 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47212 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1415605 () Bool)

(declare-fun res!951651 () Bool)

(assert (=> b!1415605 (=> (not res!951651) (not e!801199))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415605 (= res!951651 (validKeyInArray!0 (select (arr!46662 a!2901) i!1037)))))

(declare-fun b!1415606 () Bool)

(declare-fun res!951653 () Bool)

(assert (=> b!1415606 (=> (not res!951653) (not e!801199))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96662 (_ BitVec 32)) Bool)

(assert (=> b!1415606 (= res!951653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!801200 () Bool)

(declare-fun b!1415607 () Bool)

(declare-datatypes ((SeekEntryResult!10973 0))(
  ( (MissingZero!10973 (index!46284 (_ BitVec 32))) (Found!10973 (index!46285 (_ BitVec 32))) (Intermediate!10973 (undefined!11785 Bool) (index!46286 (_ BitVec 32)) (x!127892 (_ BitVec 32))) (Undefined!10973) (MissingVacant!10973 (index!46287 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96662 (_ BitVec 32)) SeekEntryResult!10973)

(assert (=> b!1415607 (= e!801200 (= (seekEntryOrOpen!0 (select (arr!46662 a!2901) j!112) a!2901 mask!2840) (Found!10973 j!112)))))

(declare-fun b!1415608 () Bool)

(declare-fun res!951649 () Bool)

(assert (=> b!1415608 (=> (not res!951649) (not e!801199))))

(assert (=> b!1415608 (= res!951649 (validKeyInArray!0 (select (arr!46662 a!2901) j!112)))))

(declare-fun b!1415609 () Bool)

(declare-fun e!801196 () Bool)

(declare-fun e!801195 () Bool)

(assert (=> b!1415609 (= e!801196 e!801195)))

(declare-fun res!951646 () Bool)

(assert (=> b!1415609 (=> res!951646 e!801195)))

(declare-fun lt!624264 () SeekEntryResult!10973)

(declare-fun lt!624258 () SeekEntryResult!10973)

(get-info :version)

(assert (=> b!1415609 (= res!951646 (or (= lt!624264 lt!624258) (not ((_ is Intermediate!10973) lt!624258))))))

(declare-fun lt!624263 () array!96662)

(declare-fun lt!624259 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96662 (_ BitVec 32)) SeekEntryResult!10973)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415609 (= lt!624258 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624259 mask!2840) lt!624259 lt!624263 mask!2840))))

(assert (=> b!1415609 (= lt!624259 (select (store (arr!46662 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415609 (= lt!624263 (array!96663 (store (arr!46662 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47212 a!2901)))))

(declare-fun b!1415610 () Bool)

(assert (=> b!1415610 (= e!801199 (not e!801196))))

(declare-fun res!951652 () Bool)

(assert (=> b!1415610 (=> res!951652 e!801196)))

(assert (=> b!1415610 (= res!951652 (or (not ((_ is Intermediate!10973) lt!624264)) (undefined!11785 lt!624264)))))

(assert (=> b!1415610 e!801200))

(declare-fun res!951654 () Bool)

(assert (=> b!1415610 (=> (not res!951654) (not e!801200))))

(assert (=> b!1415610 (= res!951654 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47920 0))(
  ( (Unit!47921) )
))
(declare-fun lt!624261 () Unit!47920)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96662 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47920)

(assert (=> b!1415610 (= lt!624261 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!624262 () (_ BitVec 32))

(assert (=> b!1415610 (= lt!624264 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624262 (select (arr!46662 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1415610 (= lt!624262 (toIndex!0 (select (arr!46662 a!2901) j!112) mask!2840))))

(declare-fun b!1415611 () Bool)

(declare-fun res!951655 () Bool)

(assert (=> b!1415611 (=> (not res!951655) (not e!801199))))

(declare-datatypes ((List!33181 0))(
  ( (Nil!33178) (Cons!33177 (h!34464 (_ BitVec 64)) (t!47875 List!33181)) )
))
(declare-fun arrayNoDuplicates!0 (array!96662 (_ BitVec 32) List!33181) Bool)

(assert (=> b!1415611 (= res!951655 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33178))))

(declare-fun e!801197 () Bool)

(declare-fun b!1415612 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96662 (_ BitVec 32)) SeekEntryResult!10973)

(assert (=> b!1415612 (= e!801197 (= (seekEntryOrOpen!0 lt!624259 lt!624263 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127892 lt!624258) (index!46286 lt!624258) (index!46286 lt!624258) (select (arr!46662 a!2901) j!112) lt!624263 mask!2840)))))

(declare-fun b!1415613 () Bool)

(assert (=> b!1415613 (= e!801195 (or (bvslt (x!127892 lt!624264) #b00000000000000000000000000000000) (bvsgt (x!127892 lt!624264) #b01111111111111111111111111111110) (bvslt (x!127892 lt!624258) #b00000000000000000000000000000000) (bvsgt (x!127892 lt!624258) #b01111111111111111111111111111110) (bvslt lt!624262 #b00000000000000000000000000000000) (bvsge lt!624262 (size!47212 a!2901)) (bvslt (index!46286 lt!624264) #b00000000000000000000000000000000) (bvsge (index!46286 lt!624264) (size!47212 a!2901)) (bvslt (index!46286 lt!624258) #b00000000000000000000000000000000) (bvsge (index!46286 lt!624258) (size!47212 a!2901)) (not (= lt!624264 (Intermediate!10973 false (index!46286 lt!624264) (x!127892 lt!624264)))) (= lt!624258 (Intermediate!10973 false (index!46286 lt!624258) (x!127892 lt!624258)))))))

(assert (=> b!1415613 e!801197))

(declare-fun res!951647 () Bool)

(assert (=> b!1415613 (=> (not res!951647) (not e!801197))))

(assert (=> b!1415613 (= res!951647 (and (not (undefined!11785 lt!624258)) (= (index!46286 lt!624258) i!1037) (bvslt (x!127892 lt!624258) (x!127892 lt!624264)) (= (select (store (arr!46662 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46286 lt!624258)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!624260 () Unit!47920)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96662 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47920)

(assert (=> b!1415613 (= lt!624260 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624262 (x!127892 lt!624264) (index!46286 lt!624264) (x!127892 lt!624258) (index!46286 lt!624258) (undefined!11785 lt!624258) mask!2840))))

(assert (= (and start!121976 res!951648) b!1415604))

(assert (= (and b!1415604 res!951650) b!1415605))

(assert (= (and b!1415605 res!951651) b!1415608))

(assert (= (and b!1415608 res!951649) b!1415606))

(assert (= (and b!1415606 res!951653) b!1415611))

(assert (= (and b!1415611 res!951655) b!1415610))

(assert (= (and b!1415610 res!951654) b!1415607))

(assert (= (and b!1415610 (not res!951652)) b!1415609))

(assert (= (and b!1415609 (not res!951646)) b!1415613))

(assert (= (and b!1415613 res!951647) b!1415612))

(declare-fun m!1305951 () Bool)

(assert (=> start!121976 m!1305951))

(declare-fun m!1305953 () Bool)

(assert (=> start!121976 m!1305953))

(declare-fun m!1305955 () Bool)

(assert (=> b!1415612 m!1305955))

(declare-fun m!1305957 () Bool)

(assert (=> b!1415612 m!1305957))

(assert (=> b!1415612 m!1305957))

(declare-fun m!1305959 () Bool)

(assert (=> b!1415612 m!1305959))

(declare-fun m!1305961 () Bool)

(assert (=> b!1415611 m!1305961))

(declare-fun m!1305963 () Bool)

(assert (=> b!1415609 m!1305963))

(assert (=> b!1415609 m!1305963))

(declare-fun m!1305965 () Bool)

(assert (=> b!1415609 m!1305965))

(declare-fun m!1305967 () Bool)

(assert (=> b!1415609 m!1305967))

(declare-fun m!1305969 () Bool)

(assert (=> b!1415609 m!1305969))

(declare-fun m!1305971 () Bool)

(assert (=> b!1415606 m!1305971))

(assert (=> b!1415608 m!1305957))

(assert (=> b!1415608 m!1305957))

(declare-fun m!1305973 () Bool)

(assert (=> b!1415608 m!1305973))

(assert (=> b!1415607 m!1305957))

(assert (=> b!1415607 m!1305957))

(declare-fun m!1305975 () Bool)

(assert (=> b!1415607 m!1305975))

(assert (=> b!1415610 m!1305957))

(declare-fun m!1305977 () Bool)

(assert (=> b!1415610 m!1305977))

(assert (=> b!1415610 m!1305957))

(declare-fun m!1305979 () Bool)

(assert (=> b!1415610 m!1305979))

(assert (=> b!1415610 m!1305957))

(declare-fun m!1305981 () Bool)

(assert (=> b!1415610 m!1305981))

(declare-fun m!1305983 () Bool)

(assert (=> b!1415610 m!1305983))

(assert (=> b!1415613 m!1305967))

(declare-fun m!1305985 () Bool)

(assert (=> b!1415613 m!1305985))

(declare-fun m!1305987 () Bool)

(assert (=> b!1415613 m!1305987))

(declare-fun m!1305989 () Bool)

(assert (=> b!1415605 m!1305989))

(assert (=> b!1415605 m!1305989))

(declare-fun m!1305991 () Bool)

(assert (=> b!1415605 m!1305991))

(check-sat (not b!1415607) (not b!1415610) (not b!1415608) (not b!1415612) (not start!121976) (not b!1415613) (not b!1415609) (not b!1415611) (not b!1415605) (not b!1415606))
(check-sat)
