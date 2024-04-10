; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119818 () Bool)

(assert start!119818)

(declare-fun b!1395470 () Bool)

(declare-fun res!934713 () Bool)

(declare-fun e!790019 () Bool)

(assert (=> b!1395470 (=> (not res!934713) (not e!790019))))

(declare-datatypes ((array!95449 0))(
  ( (array!95450 (arr!46081 (Array (_ BitVec 32) (_ BitVec 64))) (size!46631 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95449)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395470 (= res!934713 (validKeyInArray!0 (select (arr!46081 a!2901) i!1037)))))

(declare-fun b!1395471 () Bool)

(declare-fun res!934715 () Bool)

(assert (=> b!1395471 (=> (not res!934715) (not e!790019))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95449 (_ BitVec 32)) Bool)

(assert (=> b!1395471 (= res!934715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1395472 () Bool)

(declare-fun res!934714 () Bool)

(assert (=> b!1395472 (=> (not res!934714) (not e!790019))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1395472 (= res!934714 (validKeyInArray!0 (select (arr!46081 a!2901) j!112)))))

(declare-fun b!1395473 () Bool)

(declare-fun e!790021 () Bool)

(declare-datatypes ((SeekEntryResult!10398 0))(
  ( (MissingZero!10398 (index!43963 (_ BitVec 32))) (Found!10398 (index!43964 (_ BitVec 32))) (Intermediate!10398 (undefined!11210 Bool) (index!43965 (_ BitVec 32)) (x!125624 (_ BitVec 32))) (Undefined!10398) (MissingVacant!10398 (index!43966 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95449 (_ BitVec 32)) SeekEntryResult!10398)

(assert (=> b!1395473 (= e!790021 (= (seekEntryOrOpen!0 (select (arr!46081 a!2901) j!112) a!2901 mask!2840) (Found!10398 j!112)))))

(declare-fun b!1395474 () Bool)

(declare-fun res!934718 () Bool)

(assert (=> b!1395474 (=> (not res!934718) (not e!790019))))

(declare-datatypes ((List!32600 0))(
  ( (Nil!32597) (Cons!32596 (h!33832 (_ BitVec 64)) (t!47294 List!32600)) )
))
(declare-fun arrayNoDuplicates!0 (array!95449 (_ BitVec 32) List!32600) Bool)

(assert (=> b!1395474 (= res!934718 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32597))))

(declare-fun b!1395475 () Bool)

(declare-fun res!934717 () Bool)

(assert (=> b!1395475 (=> (not res!934717) (not e!790019))))

(assert (=> b!1395475 (= res!934717 (and (= (size!46631 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46631 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46631 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1395477 () Bool)

(declare-fun e!790022 () Bool)

(assert (=> b!1395477 (= e!790022 true)))

(declare-fun lt!612997 () SeekEntryResult!10398)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95449 (_ BitVec 32)) SeekEntryResult!10398)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395477 (= lt!612997 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46081 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46081 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95450 (store (arr!46081 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46631 a!2901)) mask!2840))))

(declare-fun res!934719 () Bool)

(assert (=> start!119818 (=> (not res!934719) (not e!790019))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119818 (= res!934719 (validMask!0 mask!2840))))

(assert (=> start!119818 e!790019))

(assert (=> start!119818 true))

(declare-fun array_inv!35109 (array!95449) Bool)

(assert (=> start!119818 (array_inv!35109 a!2901)))

(declare-fun b!1395476 () Bool)

(assert (=> b!1395476 (= e!790019 (not e!790022))))

(declare-fun res!934720 () Bool)

(assert (=> b!1395476 (=> res!934720 e!790022)))

(declare-fun lt!612998 () SeekEntryResult!10398)

(assert (=> b!1395476 (= res!934720 (or (not (is-Intermediate!10398 lt!612998)) (undefined!11210 lt!612998)))))

(assert (=> b!1395476 e!790021))

(declare-fun res!934716 () Bool)

(assert (=> b!1395476 (=> (not res!934716) (not e!790021))))

(assert (=> b!1395476 (= res!934716 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46800 0))(
  ( (Unit!46801) )
))
(declare-fun lt!612999 () Unit!46800)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95449 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46800)

(assert (=> b!1395476 (= lt!612999 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1395476 (= lt!612998 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46081 a!2901) j!112) mask!2840) (select (arr!46081 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!119818 res!934719) b!1395475))

(assert (= (and b!1395475 res!934717) b!1395470))

(assert (= (and b!1395470 res!934713) b!1395472))

(assert (= (and b!1395472 res!934714) b!1395471))

(assert (= (and b!1395471 res!934715) b!1395474))

(assert (= (and b!1395474 res!934718) b!1395476))

(assert (= (and b!1395476 res!934716) b!1395473))

(assert (= (and b!1395476 (not res!934720)) b!1395477))

(declare-fun m!1281965 () Bool)

(assert (=> b!1395477 m!1281965))

(declare-fun m!1281967 () Bool)

(assert (=> b!1395477 m!1281967))

(assert (=> b!1395477 m!1281967))

(declare-fun m!1281969 () Bool)

(assert (=> b!1395477 m!1281969))

(assert (=> b!1395477 m!1281969))

(assert (=> b!1395477 m!1281967))

(declare-fun m!1281971 () Bool)

(assert (=> b!1395477 m!1281971))

(declare-fun m!1281973 () Bool)

(assert (=> b!1395474 m!1281973))

(declare-fun m!1281975 () Bool)

(assert (=> b!1395471 m!1281975))

(declare-fun m!1281977 () Bool)

(assert (=> b!1395476 m!1281977))

(declare-fun m!1281979 () Bool)

(assert (=> b!1395476 m!1281979))

(assert (=> b!1395476 m!1281977))

(declare-fun m!1281981 () Bool)

(assert (=> b!1395476 m!1281981))

(assert (=> b!1395476 m!1281979))

(assert (=> b!1395476 m!1281977))

(declare-fun m!1281983 () Bool)

(assert (=> b!1395476 m!1281983))

(declare-fun m!1281985 () Bool)

(assert (=> b!1395476 m!1281985))

(declare-fun m!1281987 () Bool)

(assert (=> start!119818 m!1281987))

(declare-fun m!1281989 () Bool)

(assert (=> start!119818 m!1281989))

(assert (=> b!1395473 m!1281977))

(assert (=> b!1395473 m!1281977))

(declare-fun m!1281991 () Bool)

(assert (=> b!1395473 m!1281991))

(declare-fun m!1281993 () Bool)

(assert (=> b!1395470 m!1281993))

(assert (=> b!1395470 m!1281993))

(declare-fun m!1281995 () Bool)

(assert (=> b!1395470 m!1281995))

(assert (=> b!1395472 m!1281977))

(assert (=> b!1395472 m!1281977))

(declare-fun m!1281997 () Bool)

(assert (=> b!1395472 m!1281997))

(push 1)

(assert (not b!1395477))

(assert (not b!1395470))

(assert (not b!1395476))

(assert (not b!1395474))

(assert (not b!1395472))

(assert (not b!1395471))

(assert (not b!1395473))

(assert (not start!119818))

(check-sat)

(pop 1)

