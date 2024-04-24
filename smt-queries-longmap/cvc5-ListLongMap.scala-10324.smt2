; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121620 () Bool)

(assert start!121620)

(declare-fun b!1411991 () Bool)

(declare-fun res!948537 () Bool)

(declare-fun e!799134 () Bool)

(assert (=> b!1411991 (=> (not res!948537) (not e!799134))))

(declare-datatypes ((array!96543 0))(
  ( (array!96544 (arr!46608 (Array (_ BitVec 32) (_ BitVec 64))) (size!47159 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96543)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96543 (_ BitVec 32)) Bool)

(assert (=> b!1411991 (= res!948537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!948535 () Bool)

(assert (=> start!121620 (=> (not res!948535) (not e!799134))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121620 (= res!948535 (validMask!0 mask!2840))))

(assert (=> start!121620 e!799134))

(assert (=> start!121620 true))

(declare-fun array_inv!35889 (array!96543) Bool)

(assert (=> start!121620 (array_inv!35889 a!2901)))

(declare-fun b!1411992 () Bool)

(declare-fun res!948536 () Bool)

(assert (=> b!1411992 (=> (not res!948536) (not e!799134))))

(declare-datatypes ((List!33114 0))(
  ( (Nil!33111) (Cons!33110 (h!34390 (_ BitVec 64)) (t!47800 List!33114)) )
))
(declare-fun arrayNoDuplicates!0 (array!96543 (_ BitVec 32) List!33114) Bool)

(assert (=> b!1411992 (= res!948536 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33111))))

(declare-fun b!1411993 () Bool)

(declare-fun res!948534 () Bool)

(assert (=> b!1411993 (=> (not res!948534) (not e!799134))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1411993 (= res!948534 (and (= (size!47159 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47159 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47159 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1411994 () Bool)

(declare-fun res!948540 () Bool)

(assert (=> b!1411994 (=> (not res!948540) (not e!799134))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411994 (= res!948540 (validKeyInArray!0 (select (arr!46608 a!2901) i!1037)))))

(declare-fun b!1411995 () Bool)

(declare-fun e!799135 () Bool)

(assert (=> b!1411995 (= e!799134 (not e!799135))))

(declare-fun res!948539 () Bool)

(assert (=> b!1411995 (=> res!948539 e!799135)))

(declare-datatypes ((SeekEntryResult!10822 0))(
  ( (MissingZero!10822 (index!45665 (_ BitVec 32))) (Found!10822 (index!45666 (_ BitVec 32))) (Intermediate!10822 (undefined!11634 Bool) (index!45667 (_ BitVec 32)) (x!127412 (_ BitVec 32))) (Undefined!10822) (MissingVacant!10822 (index!45668 (_ BitVec 32))) )
))
(declare-fun lt!621761 () SeekEntryResult!10822)

(assert (=> b!1411995 (= res!948539 (or (not (is-Intermediate!10822 lt!621761)) (undefined!11634 lt!621761)))))

(declare-fun e!799136 () Bool)

(assert (=> b!1411995 e!799136))

(declare-fun res!948541 () Bool)

(assert (=> b!1411995 (=> (not res!948541) (not e!799136))))

(assert (=> b!1411995 (= res!948541 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47645 0))(
  ( (Unit!47646) )
))
(declare-fun lt!621760 () Unit!47645)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96543 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47645)

(assert (=> b!1411995 (= lt!621760 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96543 (_ BitVec 32)) SeekEntryResult!10822)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411995 (= lt!621761 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46608 a!2901) j!112) mask!2840) (select (arr!46608 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1411996 () Bool)

(assert (=> b!1411996 (= e!799135 true)))

(declare-fun lt!621759 () SeekEntryResult!10822)

(assert (=> b!1411996 (= lt!621759 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46608 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46608 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96544 (store (arr!46608 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47159 a!2901)) mask!2840))))

(declare-fun b!1411997 () Bool)

(declare-fun res!948538 () Bool)

(assert (=> b!1411997 (=> (not res!948538) (not e!799134))))

(assert (=> b!1411997 (= res!948538 (validKeyInArray!0 (select (arr!46608 a!2901) j!112)))))

(declare-fun b!1411998 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96543 (_ BitVec 32)) SeekEntryResult!10822)

(assert (=> b!1411998 (= e!799136 (= (seekEntryOrOpen!0 (select (arr!46608 a!2901) j!112) a!2901 mask!2840) (Found!10822 j!112)))))

(assert (= (and start!121620 res!948535) b!1411993))

(assert (= (and b!1411993 res!948534) b!1411994))

(assert (= (and b!1411994 res!948540) b!1411997))

(assert (= (and b!1411997 res!948538) b!1411991))

(assert (= (and b!1411991 res!948537) b!1411992))

(assert (= (and b!1411992 res!948536) b!1411995))

(assert (= (and b!1411995 res!948541) b!1411998))

(assert (= (and b!1411995 (not res!948539)) b!1411996))

(declare-fun m!1301907 () Bool)

(assert (=> b!1411996 m!1301907))

(declare-fun m!1301909 () Bool)

(assert (=> b!1411996 m!1301909))

(assert (=> b!1411996 m!1301909))

(declare-fun m!1301911 () Bool)

(assert (=> b!1411996 m!1301911))

(assert (=> b!1411996 m!1301911))

(assert (=> b!1411996 m!1301909))

(declare-fun m!1301913 () Bool)

(assert (=> b!1411996 m!1301913))

(declare-fun m!1301915 () Bool)

(assert (=> b!1411992 m!1301915))

(declare-fun m!1301917 () Bool)

(assert (=> b!1411995 m!1301917))

(declare-fun m!1301919 () Bool)

(assert (=> b!1411995 m!1301919))

(assert (=> b!1411995 m!1301917))

(declare-fun m!1301921 () Bool)

(assert (=> b!1411995 m!1301921))

(assert (=> b!1411995 m!1301919))

(assert (=> b!1411995 m!1301917))

(declare-fun m!1301923 () Bool)

(assert (=> b!1411995 m!1301923))

(declare-fun m!1301925 () Bool)

(assert (=> b!1411995 m!1301925))

(declare-fun m!1301927 () Bool)

(assert (=> b!1411991 m!1301927))

(declare-fun m!1301929 () Bool)

(assert (=> start!121620 m!1301929))

(declare-fun m!1301931 () Bool)

(assert (=> start!121620 m!1301931))

(declare-fun m!1301933 () Bool)

(assert (=> b!1411994 m!1301933))

(assert (=> b!1411994 m!1301933))

(declare-fun m!1301935 () Bool)

(assert (=> b!1411994 m!1301935))

(assert (=> b!1411998 m!1301917))

(assert (=> b!1411998 m!1301917))

(declare-fun m!1301937 () Bool)

(assert (=> b!1411998 m!1301937))

(assert (=> b!1411997 m!1301917))

(assert (=> b!1411997 m!1301917))

(declare-fun m!1301939 () Bool)

(assert (=> b!1411997 m!1301939))

(push 1)

(assert (not start!121620))

(assert (not b!1411996))

(assert (not b!1411994))

(assert (not b!1411998))

(assert (not b!1411995))

(assert (not b!1411997))

(assert (not b!1411991))

(assert (not b!1411992))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

