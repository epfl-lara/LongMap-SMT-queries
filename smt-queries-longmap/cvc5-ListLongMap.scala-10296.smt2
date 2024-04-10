; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121098 () Bool)

(assert start!121098)

(declare-fun b!1407979 () Bool)

(declare-fun e!796888 () Bool)

(assert (=> b!1407979 (= e!796888 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10780 0))(
  ( (MissingZero!10780 (index!45497 (_ BitVec 32))) (Found!10780 (index!45498 (_ BitVec 32))) (Intermediate!10780 (undefined!11592 Bool) (index!45499 (_ BitVec 32)) (x!127109 (_ BitVec 32))) (Undefined!10780) (MissingVacant!10780 (index!45500 (_ BitVec 32))) )
))
(declare-fun lt!620020 () SeekEntryResult!10780)

(declare-datatypes ((array!96252 0))(
  ( (array!96253 (arr!46469 (Array (_ BitVec 32) (_ BitVec 64))) (size!47019 (_ BitVec 32))) )
))
(declare-fun lt!620022 () array!96252)

(declare-fun lt!620021 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96252 (_ BitVec 32)) SeekEntryResult!10780)

(assert (=> b!1407979 (= lt!620020 (seekEntryOrOpen!0 lt!620021 lt!620022 mask!2840))))

(declare-fun a!2901 () array!96252)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!620023 () (_ BitVec 32))

(declare-datatypes ((Unit!47534 0))(
  ( (Unit!47535) )
))
(declare-fun lt!620024 () Unit!47534)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lt!620025 () SeekEntryResult!10780)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!96252 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47534)

(assert (=> b!1407979 (= lt!620024 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!620023 (x!127109 lt!620025) (index!45499 lt!620025) mask!2840))))

(declare-fun b!1407980 () Bool)

(declare-fun e!796889 () Bool)

(assert (=> b!1407980 (= e!796889 e!796888)))

(declare-fun res!945704 () Bool)

(assert (=> b!1407980 (=> res!945704 e!796888)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96252 (_ BitVec 32)) SeekEntryResult!10780)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407980 (= res!945704 (not (= lt!620025 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!620021 mask!2840) lt!620021 lt!620022 mask!2840))))))

(assert (=> b!1407980 (= lt!620021 (select (store (arr!46469 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1407980 (= lt!620022 (array!96253 (store (arr!46469 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47019 a!2901)))))

(declare-fun b!1407981 () Bool)

(declare-fun res!945708 () Bool)

(assert (=> b!1407981 (=> res!945708 e!796888)))

(assert (=> b!1407981 (= res!945708 (or (bvslt (x!127109 lt!620025) #b00000000000000000000000000000000) (bvsgt (x!127109 lt!620025) #b01111111111111111111111111111110) (bvslt lt!620023 #b00000000000000000000000000000000) (bvsge lt!620023 (size!47019 a!2901)) (bvslt (index!45499 lt!620025) #b00000000000000000000000000000000) (bvsge (index!45499 lt!620025) (size!47019 a!2901)) (not (= lt!620025 (Intermediate!10780 false (index!45499 lt!620025) (x!127109 lt!620025))))))))

(declare-fun b!1407982 () Bool)

(declare-fun res!945709 () Bool)

(declare-fun e!796887 () Bool)

(assert (=> b!1407982 (=> (not res!945709) (not e!796887))))

(assert (=> b!1407982 (= res!945709 (and (= (size!47019 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47019 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47019 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1407983 () Bool)

(declare-fun res!945701 () Bool)

(assert (=> b!1407983 (=> (not res!945701) (not e!796887))))

(declare-datatypes ((List!32988 0))(
  ( (Nil!32985) (Cons!32984 (h!34247 (_ BitVec 64)) (t!47682 List!32988)) )
))
(declare-fun arrayNoDuplicates!0 (array!96252 (_ BitVec 32) List!32988) Bool)

(assert (=> b!1407983 (= res!945701 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32985))))

(declare-fun b!1407984 () Bool)

(declare-fun res!945707 () Bool)

(assert (=> b!1407984 (=> (not res!945707) (not e!796887))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1407984 (= res!945707 (validKeyInArray!0 (select (arr!46469 a!2901) i!1037)))))

(declare-fun b!1407985 () Bool)

(declare-fun res!945706 () Bool)

(assert (=> b!1407985 (=> (not res!945706) (not e!796887))))

(assert (=> b!1407985 (= res!945706 (validKeyInArray!0 (select (arr!46469 a!2901) j!112)))))

(declare-fun res!945703 () Bool)

(assert (=> start!121098 (=> (not res!945703) (not e!796887))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121098 (= res!945703 (validMask!0 mask!2840))))

(assert (=> start!121098 e!796887))

(assert (=> start!121098 true))

(declare-fun array_inv!35497 (array!96252) Bool)

(assert (=> start!121098 (array_inv!35497 a!2901)))

(declare-fun b!1407986 () Bool)

(assert (=> b!1407986 (= e!796887 (not e!796889))))

(declare-fun res!945702 () Bool)

(assert (=> b!1407986 (=> res!945702 e!796889)))

(assert (=> b!1407986 (= res!945702 (or (not (is-Intermediate!10780 lt!620025)) (undefined!11592 lt!620025)))))

(assert (=> b!1407986 (= lt!620020 (Found!10780 j!112))))

(assert (=> b!1407986 (= lt!620020 (seekEntryOrOpen!0 (select (arr!46469 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96252 (_ BitVec 32)) Bool)

(assert (=> b!1407986 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!620019 () Unit!47534)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96252 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47534)

(assert (=> b!1407986 (= lt!620019 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1407986 (= lt!620025 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!620023 (select (arr!46469 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1407986 (= lt!620023 (toIndex!0 (select (arr!46469 a!2901) j!112) mask!2840))))

(declare-fun b!1407987 () Bool)

(declare-fun res!945705 () Bool)

(assert (=> b!1407987 (=> (not res!945705) (not e!796887))))

(assert (=> b!1407987 (= res!945705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!121098 res!945703) b!1407982))

(assert (= (and b!1407982 res!945709) b!1407984))

(assert (= (and b!1407984 res!945707) b!1407985))

(assert (= (and b!1407985 res!945706) b!1407987))

(assert (= (and b!1407987 res!945705) b!1407983))

(assert (= (and b!1407983 res!945701) b!1407986))

(assert (= (and b!1407986 (not res!945702)) b!1407980))

(assert (= (and b!1407980 (not res!945704)) b!1407981))

(assert (= (and b!1407981 (not res!945708)) b!1407979))

(declare-fun m!1297089 () Bool)

(assert (=> start!121098 m!1297089))

(declare-fun m!1297091 () Bool)

(assert (=> start!121098 m!1297091))

(declare-fun m!1297093 () Bool)

(assert (=> b!1407987 m!1297093))

(declare-fun m!1297095 () Bool)

(assert (=> b!1407985 m!1297095))

(assert (=> b!1407985 m!1297095))

(declare-fun m!1297097 () Bool)

(assert (=> b!1407985 m!1297097))

(declare-fun m!1297099 () Bool)

(assert (=> b!1407984 m!1297099))

(assert (=> b!1407984 m!1297099))

(declare-fun m!1297101 () Bool)

(assert (=> b!1407984 m!1297101))

(declare-fun m!1297103 () Bool)

(assert (=> b!1407979 m!1297103))

(declare-fun m!1297105 () Bool)

(assert (=> b!1407979 m!1297105))

(declare-fun m!1297107 () Bool)

(assert (=> b!1407980 m!1297107))

(assert (=> b!1407980 m!1297107))

(declare-fun m!1297109 () Bool)

(assert (=> b!1407980 m!1297109))

(declare-fun m!1297111 () Bool)

(assert (=> b!1407980 m!1297111))

(declare-fun m!1297113 () Bool)

(assert (=> b!1407980 m!1297113))

(declare-fun m!1297115 () Bool)

(assert (=> b!1407983 m!1297115))

(assert (=> b!1407986 m!1297095))

(declare-fun m!1297117 () Bool)

(assert (=> b!1407986 m!1297117))

(assert (=> b!1407986 m!1297095))

(assert (=> b!1407986 m!1297095))

(declare-fun m!1297119 () Bool)

(assert (=> b!1407986 m!1297119))

(declare-fun m!1297121 () Bool)

(assert (=> b!1407986 m!1297121))

(assert (=> b!1407986 m!1297095))

(declare-fun m!1297123 () Bool)

(assert (=> b!1407986 m!1297123))

(declare-fun m!1297125 () Bool)

(assert (=> b!1407986 m!1297125))

(push 1)

