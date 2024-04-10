; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120496 () Bool)

(assert start!120496)

(declare-fun b!1403078 () Bool)

(declare-fun res!941594 () Bool)

(declare-fun e!794463 () Bool)

(assert (=> b!1403078 (=> (not res!941594) (not e!794463))))

(declare-datatypes ((array!95905 0))(
  ( (array!95906 (arr!46303 (Array (_ BitVec 32) (_ BitVec 64))) (size!46853 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95905)

(declare-datatypes ((List!32822 0))(
  ( (Nil!32819) (Cons!32818 (h!34066 (_ BitVec 64)) (t!47516 List!32822)) )
))
(declare-fun arrayNoDuplicates!0 (array!95905 (_ BitVec 32) List!32822) Bool)

(assert (=> b!1403078 (= res!941594 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32819))))

(declare-fun res!941591 () Bool)

(assert (=> start!120496 (=> (not res!941591) (not e!794463))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120496 (= res!941591 (validMask!0 mask!2840))))

(assert (=> start!120496 e!794463))

(assert (=> start!120496 true))

(declare-fun array_inv!35331 (array!95905) Bool)

(assert (=> start!120496 (array_inv!35331 a!2901)))

(declare-fun b!1403079 () Bool)

(declare-fun res!941590 () Bool)

(assert (=> b!1403079 (=> (not res!941590) (not e!794463))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95905 (_ BitVec 32)) Bool)

(assert (=> b!1403079 (= res!941590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403080 () Bool)

(declare-fun e!794464 () Bool)

(assert (=> b!1403080 (= e!794463 (not e!794464))))

(declare-fun res!941593 () Bool)

(assert (=> b!1403080 (=> res!941593 e!794464)))

(declare-datatypes ((SeekEntryResult!10620 0))(
  ( (MissingZero!10620 (index!44857 (_ BitVec 32))) (Found!10620 (index!44858 (_ BitVec 32))) (Intermediate!10620 (undefined!11432 Bool) (index!44859 (_ BitVec 32)) (x!126471 (_ BitVec 32))) (Undefined!10620) (MissingVacant!10620 (index!44860 (_ BitVec 32))) )
))
(declare-fun lt!618267 () SeekEntryResult!10620)

(assert (=> b!1403080 (= res!941593 (or (not (is-Intermediate!10620 lt!618267)) (undefined!11432 lt!618267)))))

(declare-fun e!794462 () Bool)

(assert (=> b!1403080 e!794462))

(declare-fun res!941595 () Bool)

(assert (=> b!1403080 (=> (not res!941595) (not e!794462))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1403080 (= res!941595 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47244 0))(
  ( (Unit!47245) )
))
(declare-fun lt!618266 () Unit!47244)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95905 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47244)

(assert (=> b!1403080 (= lt!618266 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95905 (_ BitVec 32)) SeekEntryResult!10620)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403080 (= lt!618267 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46303 a!2901) j!112) mask!2840) (select (arr!46303 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403081 () Bool)

(declare-fun res!941589 () Bool)

(assert (=> b!1403081 (=> (not res!941589) (not e!794463))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403081 (= res!941589 (validKeyInArray!0 (select (arr!46303 a!2901) j!112)))))

(declare-fun b!1403082 () Bool)

(assert (=> b!1403082 (= e!794464 true)))

(declare-fun lt!618265 () SeekEntryResult!10620)

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1403082 (= lt!618265 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46303 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46303 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95906 (store (arr!46303 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46853 a!2901)) mask!2840))))

(declare-fun b!1403083 () Bool)

(declare-fun res!941596 () Bool)

(assert (=> b!1403083 (=> (not res!941596) (not e!794463))))

(assert (=> b!1403083 (= res!941596 (and (= (size!46853 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46853 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46853 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403084 () Bool)

(declare-fun res!941592 () Bool)

(assert (=> b!1403084 (=> (not res!941592) (not e!794463))))

(assert (=> b!1403084 (= res!941592 (validKeyInArray!0 (select (arr!46303 a!2901) i!1037)))))

(declare-fun b!1403085 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95905 (_ BitVec 32)) SeekEntryResult!10620)

(assert (=> b!1403085 (= e!794462 (= (seekEntryOrOpen!0 (select (arr!46303 a!2901) j!112) a!2901 mask!2840) (Found!10620 j!112)))))

(assert (= (and start!120496 res!941591) b!1403083))

(assert (= (and b!1403083 res!941596) b!1403084))

(assert (= (and b!1403084 res!941592) b!1403081))

(assert (= (and b!1403081 res!941589) b!1403079))

(assert (= (and b!1403079 res!941590) b!1403078))

(assert (= (and b!1403078 res!941594) b!1403080))

(assert (= (and b!1403080 res!941595) b!1403085))

(assert (= (and b!1403080 (not res!941593)) b!1403082))

(declare-fun m!1291565 () Bool)

(assert (=> b!1403085 m!1291565))

(assert (=> b!1403085 m!1291565))

(declare-fun m!1291567 () Bool)

(assert (=> b!1403085 m!1291567))

(declare-fun m!1291569 () Bool)

(assert (=> start!120496 m!1291569))

(declare-fun m!1291571 () Bool)

(assert (=> start!120496 m!1291571))

(assert (=> b!1403080 m!1291565))

(declare-fun m!1291573 () Bool)

(assert (=> b!1403080 m!1291573))

(assert (=> b!1403080 m!1291565))

(declare-fun m!1291575 () Bool)

(assert (=> b!1403080 m!1291575))

(assert (=> b!1403080 m!1291573))

(assert (=> b!1403080 m!1291565))

(declare-fun m!1291577 () Bool)

(assert (=> b!1403080 m!1291577))

(declare-fun m!1291579 () Bool)

(assert (=> b!1403080 m!1291579))

(assert (=> b!1403081 m!1291565))

(assert (=> b!1403081 m!1291565))

(declare-fun m!1291581 () Bool)

(assert (=> b!1403081 m!1291581))

(declare-fun m!1291583 () Bool)

(assert (=> b!1403078 m!1291583))

(declare-fun m!1291585 () Bool)

(assert (=> b!1403079 m!1291585))

(declare-fun m!1291587 () Bool)

(assert (=> b!1403084 m!1291587))

(assert (=> b!1403084 m!1291587))

(declare-fun m!1291589 () Bool)

(assert (=> b!1403084 m!1291589))

(declare-fun m!1291591 () Bool)

(assert (=> b!1403082 m!1291591))

(declare-fun m!1291593 () Bool)

(assert (=> b!1403082 m!1291593))

(assert (=> b!1403082 m!1291593))

(declare-fun m!1291595 () Bool)

(assert (=> b!1403082 m!1291595))

(assert (=> b!1403082 m!1291595))

(assert (=> b!1403082 m!1291593))

(declare-fun m!1291597 () Bool)

(assert (=> b!1403082 m!1291597))

(push 1)

(assert (not b!1403084))

(assert (not b!1403085))

(assert (not b!1403078))

(assert (not b!1403081))

(assert (not b!1403080))

(assert (not b!1403082))

(assert (not start!120496))

(assert (not b!1403079))

(check-sat)

