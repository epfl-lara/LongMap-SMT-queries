; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120578 () Bool)

(assert start!120578)

(declare-fun b!1403994 () Bool)

(declare-fun res!942508 () Bool)

(declare-fun e!794886 () Bool)

(assert (=> b!1403994 (=> (not res!942508) (not e!794886))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95987 0))(
  ( (array!95988 (arr!46344 (Array (_ BitVec 32) (_ BitVec 64))) (size!46894 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95987)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1403994 (= res!942508 (and (= (size!46894 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46894 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46894 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403995 () Bool)

(declare-fun res!942509 () Bool)

(assert (=> b!1403995 (=> (not res!942509) (not e!794886))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403995 (= res!942509 (validKeyInArray!0 (select (arr!46344 a!2901) j!112)))))

(declare-fun b!1403996 () Bool)

(declare-fun res!942507 () Bool)

(assert (=> b!1403996 (=> (not res!942507) (not e!794886))))

(assert (=> b!1403996 (= res!942507 (validKeyInArray!0 (select (arr!46344 a!2901) i!1037)))))

(declare-fun b!1403997 () Bool)

(declare-fun e!794887 () Bool)

(declare-datatypes ((SeekEntryResult!10661 0))(
  ( (MissingZero!10661 (index!45021 (_ BitVec 32))) (Found!10661 (index!45022 (_ BitVec 32))) (Intermediate!10661 (undefined!11473 Bool) (index!45023 (_ BitVec 32)) (x!126624 (_ BitVec 32))) (Undefined!10661) (MissingVacant!10661 (index!45024 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95987 (_ BitVec 32)) SeekEntryResult!10661)

(assert (=> b!1403997 (= e!794887 (= (seekEntryOrOpen!0 (select (arr!46344 a!2901) j!112) a!2901 mask!2840) (Found!10661 j!112)))))

(declare-fun b!1403998 () Bool)

(assert (=> b!1403998 (= e!794886 (not true))))

(assert (=> b!1403998 e!794887))

(declare-fun res!942505 () Bool)

(assert (=> b!1403998 (=> (not res!942505) (not e!794887))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95987 (_ BitVec 32)) Bool)

(assert (=> b!1403998 (= res!942505 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47326 0))(
  ( (Unit!47327) )
))
(declare-fun lt!618567 () Unit!47326)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95987 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47326)

(assert (=> b!1403998 (= lt!618567 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618566 () SeekEntryResult!10661)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95987 (_ BitVec 32)) SeekEntryResult!10661)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403998 (= lt!618566 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46344 a!2901) j!112) mask!2840) (select (arr!46344 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!942511 () Bool)

(assert (=> start!120578 (=> (not res!942511) (not e!794886))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120578 (= res!942511 (validMask!0 mask!2840))))

(assert (=> start!120578 e!794886))

(assert (=> start!120578 true))

(declare-fun array_inv!35372 (array!95987) Bool)

(assert (=> start!120578 (array_inv!35372 a!2901)))

(declare-fun b!1403999 () Bool)

(declare-fun res!942506 () Bool)

(assert (=> b!1403999 (=> (not res!942506) (not e!794886))))

(assert (=> b!1403999 (= res!942506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1404000 () Bool)

(declare-fun res!942510 () Bool)

(assert (=> b!1404000 (=> (not res!942510) (not e!794886))))

(declare-datatypes ((List!32863 0))(
  ( (Nil!32860) (Cons!32859 (h!34107 (_ BitVec 64)) (t!47557 List!32863)) )
))
(declare-fun arrayNoDuplicates!0 (array!95987 (_ BitVec 32) List!32863) Bool)

(assert (=> b!1404000 (= res!942510 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32860))))

(assert (= (and start!120578 res!942511) b!1403994))

(assert (= (and b!1403994 res!942508) b!1403996))

(assert (= (and b!1403996 res!942507) b!1403995))

(assert (= (and b!1403995 res!942509) b!1403999))

(assert (= (and b!1403999 res!942506) b!1404000))

(assert (= (and b!1404000 res!942510) b!1403998))

(assert (= (and b!1403998 res!942505) b!1403997))

(declare-fun m!1292783 () Bool)

(assert (=> b!1403995 m!1292783))

(assert (=> b!1403995 m!1292783))

(declare-fun m!1292785 () Bool)

(assert (=> b!1403995 m!1292785))

(assert (=> b!1403998 m!1292783))

(declare-fun m!1292787 () Bool)

(assert (=> b!1403998 m!1292787))

(assert (=> b!1403998 m!1292783))

(declare-fun m!1292789 () Bool)

(assert (=> b!1403998 m!1292789))

(assert (=> b!1403998 m!1292787))

(assert (=> b!1403998 m!1292783))

(declare-fun m!1292791 () Bool)

(assert (=> b!1403998 m!1292791))

(declare-fun m!1292793 () Bool)

(assert (=> b!1403998 m!1292793))

(declare-fun m!1292795 () Bool)

(assert (=> start!120578 m!1292795))

(declare-fun m!1292797 () Bool)

(assert (=> start!120578 m!1292797))

(assert (=> b!1403997 m!1292783))

(assert (=> b!1403997 m!1292783))

(declare-fun m!1292799 () Bool)

(assert (=> b!1403997 m!1292799))

(declare-fun m!1292801 () Bool)

(assert (=> b!1404000 m!1292801))

(declare-fun m!1292803 () Bool)

(assert (=> b!1403999 m!1292803))

(declare-fun m!1292805 () Bool)

(assert (=> b!1403996 m!1292805))

(assert (=> b!1403996 m!1292805))

(declare-fun m!1292807 () Bool)

(assert (=> b!1403996 m!1292807))

(check-sat (not b!1403997) (not start!120578) (not b!1403998) (not b!1403999) (not b!1404000) (not b!1403996) (not b!1403995))
(check-sat)
