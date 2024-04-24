; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120978 () Bool)

(assert start!120978)

(declare-fun b!1406592 () Bool)

(declare-fun res!944125 () Bool)

(declare-fun e!796299 () Bool)

(assert (=> b!1406592 (=> (not res!944125) (not e!796299))))

(declare-datatypes ((array!96207 0))(
  ( (array!96208 (arr!46449 (Array (_ BitVec 32) (_ BitVec 64))) (size!47000 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96207)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96207 (_ BitVec 32)) Bool)

(assert (=> b!1406592 (= res!944125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun e!796300 () Bool)

(declare-fun b!1406593 () Bool)

(declare-datatypes ((SeekEntryResult!10663 0))(
  ( (MissingZero!10663 (index!45029 (_ BitVec 32))) (Found!10663 (index!45030 (_ BitVec 32))) (Intermediate!10663 (undefined!11475 Bool) (index!45031 (_ BitVec 32)) (x!126793 (_ BitVec 32))) (Undefined!10663) (MissingVacant!10663 (index!45032 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96207 (_ BitVec 32)) SeekEntryResult!10663)

(assert (=> b!1406593 (= e!796300 (= (seekEntryOrOpen!0 (select (arr!46449 a!2901) j!112) a!2901 mask!2840) (Found!10663 j!112)))))

(declare-fun b!1406594 () Bool)

(declare-fun res!944130 () Bool)

(assert (=> b!1406594 (=> (not res!944130) (not e!796299))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1406594 (= res!944130 (and (= (size!47000 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47000 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47000 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406595 () Bool)

(declare-fun res!944128 () Bool)

(assert (=> b!1406595 (=> (not res!944128) (not e!796299))))

(declare-datatypes ((List!32955 0))(
  ( (Nil!32952) (Cons!32951 (h!34213 (_ BitVec 64)) (t!47641 List!32955)) )
))
(declare-fun arrayNoDuplicates!0 (array!96207 (_ BitVec 32) List!32955) Bool)

(assert (=> b!1406595 (= res!944128 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32952))))

(declare-fun b!1406596 () Bool)

(assert (=> b!1406596 (= e!796299 (not true))))

(assert (=> b!1406596 e!796300))

(declare-fun res!944127 () Bool)

(assert (=> b!1406596 (=> (not res!944127) (not e!796300))))

(assert (=> b!1406596 (= res!944127 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47327 0))(
  ( (Unit!47328) )
))
(declare-fun lt!619430 () Unit!47327)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96207 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47327)

(assert (=> b!1406596 (= lt!619430 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!619429 () SeekEntryResult!10663)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96207 (_ BitVec 32)) SeekEntryResult!10663)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406596 (= lt!619429 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46449 a!2901) j!112) mask!2840) (select (arr!46449 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!944129 () Bool)

(assert (=> start!120978 (=> (not res!944129) (not e!796299))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120978 (= res!944129 (validMask!0 mask!2840))))

(assert (=> start!120978 e!796299))

(assert (=> start!120978 true))

(declare-fun array_inv!35730 (array!96207) Bool)

(assert (=> start!120978 (array_inv!35730 a!2901)))

(declare-fun b!1406597 () Bool)

(declare-fun res!944126 () Bool)

(assert (=> b!1406597 (=> (not res!944126) (not e!796299))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406597 (= res!944126 (validKeyInArray!0 (select (arr!46449 a!2901) j!112)))))

(declare-fun b!1406598 () Bool)

(declare-fun res!944131 () Bool)

(assert (=> b!1406598 (=> (not res!944131) (not e!796299))))

(assert (=> b!1406598 (= res!944131 (validKeyInArray!0 (select (arr!46449 a!2901) i!1037)))))

(assert (= (and start!120978 res!944129) b!1406594))

(assert (= (and b!1406594 res!944130) b!1406598))

(assert (= (and b!1406598 res!944131) b!1406597))

(assert (= (and b!1406597 res!944126) b!1406592))

(assert (= (and b!1406592 res!944125) b!1406595))

(assert (= (and b!1406595 res!944128) b!1406596))

(assert (= (and b!1406596 res!944127) b!1406593))

(declare-fun m!1295609 () Bool)

(assert (=> b!1406592 m!1295609))

(declare-fun m!1295611 () Bool)

(assert (=> b!1406595 m!1295611))

(declare-fun m!1295613 () Bool)

(assert (=> b!1406593 m!1295613))

(assert (=> b!1406593 m!1295613))

(declare-fun m!1295615 () Bool)

(assert (=> b!1406593 m!1295615))

(declare-fun m!1295617 () Bool)

(assert (=> b!1406598 m!1295617))

(assert (=> b!1406598 m!1295617))

(declare-fun m!1295619 () Bool)

(assert (=> b!1406598 m!1295619))

(declare-fun m!1295621 () Bool)

(assert (=> start!120978 m!1295621))

(declare-fun m!1295623 () Bool)

(assert (=> start!120978 m!1295623))

(assert (=> b!1406596 m!1295613))

(declare-fun m!1295625 () Bool)

(assert (=> b!1406596 m!1295625))

(assert (=> b!1406596 m!1295613))

(declare-fun m!1295627 () Bool)

(assert (=> b!1406596 m!1295627))

(assert (=> b!1406596 m!1295625))

(assert (=> b!1406596 m!1295613))

(declare-fun m!1295629 () Bool)

(assert (=> b!1406596 m!1295629))

(declare-fun m!1295631 () Bool)

(assert (=> b!1406596 m!1295631))

(assert (=> b!1406597 m!1295613))

(assert (=> b!1406597 m!1295613))

(declare-fun m!1295633 () Bool)

(assert (=> b!1406597 m!1295633))

(push 1)

(assert (not b!1406593))

(assert (not b!1406596))

(assert (not b!1406592))

(assert (not b!1406595))

(assert (not b!1406597))

(assert (not start!120978))

(assert (not b!1406598))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

