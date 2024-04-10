; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121096 () Bool)

(assert start!121096)

(declare-fun b!1407953 () Bool)

(declare-fun res!945680 () Bool)

(declare-fun e!796876 () Bool)

(assert (=> b!1407953 (=> (not res!945680) (not e!796876))))

(declare-datatypes ((array!96250 0))(
  ( (array!96251 (arr!46468 (Array (_ BitVec 32) (_ BitVec 64))) (size!47018 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96250)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1407953 (= res!945680 (validKeyInArray!0 (select (arr!46468 a!2901) j!112)))))

(declare-fun b!1407954 () Bool)

(declare-fun res!945675 () Bool)

(assert (=> b!1407954 (=> (not res!945675) (not e!796876))))

(declare-datatypes ((List!32987 0))(
  ( (Nil!32984) (Cons!32983 (h!34246 (_ BitVec 64)) (t!47681 List!32987)) )
))
(declare-fun arrayNoDuplicates!0 (array!96250 (_ BitVec 32) List!32987) Bool)

(assert (=> b!1407954 (= res!945675 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32984))))

(declare-fun b!1407955 () Bool)

(declare-fun e!796875 () Bool)

(assert (=> b!1407955 (= e!796876 (not e!796875))))

(declare-fun res!945679 () Bool)

(assert (=> b!1407955 (=> res!945679 e!796875)))

(declare-datatypes ((SeekEntryResult!10779 0))(
  ( (MissingZero!10779 (index!45493 (_ BitVec 32))) (Found!10779 (index!45494 (_ BitVec 32))) (Intermediate!10779 (undefined!11591 Bool) (index!45495 (_ BitVec 32)) (x!127100 (_ BitVec 32))) (Undefined!10779) (MissingVacant!10779 (index!45496 (_ BitVec 32))) )
))
(declare-fun lt!620002 () SeekEntryResult!10779)

(assert (=> b!1407955 (= res!945679 (or (not (is-Intermediate!10779 lt!620002)) (undefined!11591 lt!620002)))))

(declare-fun e!796877 () Bool)

(assert (=> b!1407955 e!796877))

(declare-fun res!945676 () Bool)

(assert (=> b!1407955 (=> (not res!945676) (not e!796877))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96250 (_ BitVec 32)) Bool)

(assert (=> b!1407955 (= res!945676 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47532 0))(
  ( (Unit!47533) )
))
(declare-fun lt!620004 () Unit!47532)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96250 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47532)

(assert (=> b!1407955 (= lt!620004 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96250 (_ BitVec 32)) SeekEntryResult!10779)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407955 (= lt!620002 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46468 a!2901) j!112) mask!2840) (select (arr!46468 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1407956 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96250 (_ BitVec 32)) SeekEntryResult!10779)

(assert (=> b!1407956 (= e!796877 (= (seekEntryOrOpen!0 (select (arr!46468 a!2901) j!112) a!2901 mask!2840) (Found!10779 j!112)))))

(declare-fun b!1407957 () Bool)

(declare-fun res!945677 () Bool)

(assert (=> b!1407957 (=> (not res!945677) (not e!796876))))

(assert (=> b!1407957 (= res!945677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1407958 () Bool)

(declare-fun res!945681 () Bool)

(assert (=> b!1407958 (=> (not res!945681) (not e!796876))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1407958 (= res!945681 (validKeyInArray!0 (select (arr!46468 a!2901) i!1037)))))

(declare-fun b!1407960 () Bool)

(assert (=> b!1407960 (= e!796875 true)))

(declare-fun lt!620003 () SeekEntryResult!10779)

(assert (=> b!1407960 (= lt!620003 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46468 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46468 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96251 (store (arr!46468 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47018 a!2901)) mask!2840))))

(declare-fun res!945678 () Bool)

(assert (=> start!121096 (=> (not res!945678) (not e!796876))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121096 (= res!945678 (validMask!0 mask!2840))))

(assert (=> start!121096 e!796876))

(assert (=> start!121096 true))

(declare-fun array_inv!35496 (array!96250) Bool)

(assert (=> start!121096 (array_inv!35496 a!2901)))

(declare-fun b!1407959 () Bool)

(declare-fun res!945682 () Bool)

(assert (=> b!1407959 (=> (not res!945682) (not e!796876))))

(assert (=> b!1407959 (= res!945682 (and (= (size!47018 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47018 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47018 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121096 res!945678) b!1407959))

(assert (= (and b!1407959 res!945682) b!1407958))

(assert (= (and b!1407958 res!945681) b!1407953))

(assert (= (and b!1407953 res!945680) b!1407957))

(assert (= (and b!1407957 res!945677) b!1407954))

(assert (= (and b!1407954 res!945675) b!1407955))

(assert (= (and b!1407955 res!945676) b!1407956))

(assert (= (and b!1407955 (not res!945679)) b!1407960))

(declare-fun m!1297055 () Bool)

(assert (=> start!121096 m!1297055))

(declare-fun m!1297057 () Bool)

(assert (=> start!121096 m!1297057))

(declare-fun m!1297059 () Bool)

(assert (=> b!1407958 m!1297059))

(assert (=> b!1407958 m!1297059))

(declare-fun m!1297061 () Bool)

(assert (=> b!1407958 m!1297061))

(declare-fun m!1297063 () Bool)

(assert (=> b!1407954 m!1297063))

(declare-fun m!1297065 () Bool)

(assert (=> b!1407955 m!1297065))

(declare-fun m!1297067 () Bool)

(assert (=> b!1407955 m!1297067))

(assert (=> b!1407955 m!1297065))

(declare-fun m!1297069 () Bool)

(assert (=> b!1407955 m!1297069))

(assert (=> b!1407955 m!1297067))

(assert (=> b!1407955 m!1297065))

(declare-fun m!1297071 () Bool)

(assert (=> b!1407955 m!1297071))

(declare-fun m!1297073 () Bool)

(assert (=> b!1407955 m!1297073))

(assert (=> b!1407956 m!1297065))

(assert (=> b!1407956 m!1297065))

(declare-fun m!1297075 () Bool)

(assert (=> b!1407956 m!1297075))

(declare-fun m!1297077 () Bool)

(assert (=> b!1407960 m!1297077))

(declare-fun m!1297079 () Bool)

(assert (=> b!1407960 m!1297079))

(assert (=> b!1407960 m!1297079))

(declare-fun m!1297081 () Bool)

(assert (=> b!1407960 m!1297081))

(assert (=> b!1407960 m!1297081))

(assert (=> b!1407960 m!1297079))

(declare-fun m!1297083 () Bool)

(assert (=> b!1407960 m!1297083))

(declare-fun m!1297085 () Bool)

(assert (=> b!1407957 m!1297085))

(assert (=> b!1407953 m!1297065))

(assert (=> b!1407953 m!1297065))

(declare-fun m!1297087 () Bool)

(assert (=> b!1407953 m!1297087))

(push 1)

(assert (not b!1407958))

(assert (not b!1407956))

(assert (not b!1407954))

(assert (not b!1407957))

(assert (not b!1407955))

(assert (not b!1407953))

(assert (not start!121096))

(assert (not b!1407960))

(check-sat)

(pop 1)

(push 1)

(check-sat)

