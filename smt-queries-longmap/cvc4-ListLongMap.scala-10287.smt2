; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120886 () Bool)

(assert start!120886)

(declare-fun b!1406576 () Bool)

(declare-fun e!796112 () Bool)

(declare-fun e!796109 () Bool)

(assert (=> b!1406576 (= e!796112 (not e!796109))))

(declare-fun res!944794 () Bool)

(assert (=> b!1406576 (=> res!944794 e!796109)))

(declare-datatypes ((SeekEntryResult!10755 0))(
  ( (MissingZero!10755 (index!45397 (_ BitVec 32))) (Found!10755 (index!45398 (_ BitVec 32))) (Intermediate!10755 (undefined!11567 Bool) (index!45399 (_ BitVec 32)) (x!126994 (_ BitVec 32))) (Undefined!10755) (MissingVacant!10755 (index!45400 (_ BitVec 32))) )
))
(declare-fun lt!619435 () SeekEntryResult!10755)

(assert (=> b!1406576 (= res!944794 (or (not (is-Intermediate!10755 lt!619435)) (undefined!11567 lt!619435)))))

(declare-fun e!796110 () Bool)

(assert (=> b!1406576 e!796110))

(declare-fun res!944800 () Bool)

(assert (=> b!1406576 (=> (not res!944800) (not e!796110))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96193 0))(
  ( (array!96194 (arr!46444 (Array (_ BitVec 32) (_ BitVec 64))) (size!46994 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96193)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96193 (_ BitVec 32)) Bool)

(assert (=> b!1406576 (= res!944800 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47484 0))(
  ( (Unit!47485) )
))
(declare-fun lt!619437 () Unit!47484)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96193 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47484)

(assert (=> b!1406576 (= lt!619437 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96193 (_ BitVec 32)) SeekEntryResult!10755)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406576 (= lt!619435 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46444 a!2901) j!112) mask!2840) (select (arr!46444 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!944796 () Bool)

(assert (=> start!120886 (=> (not res!944796) (not e!796112))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120886 (= res!944796 (validMask!0 mask!2840))))

(assert (=> start!120886 e!796112))

(assert (=> start!120886 true))

(declare-fun array_inv!35472 (array!96193) Bool)

(assert (=> start!120886 (array_inv!35472 a!2901)))

(declare-fun b!1406577 () Bool)

(declare-fun res!944799 () Bool)

(assert (=> b!1406577 (=> (not res!944799) (not e!796112))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1406577 (= res!944799 (and (= (size!46994 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46994 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46994 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406578 () Bool)

(declare-fun res!944798 () Bool)

(assert (=> b!1406578 (=> (not res!944798) (not e!796112))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406578 (= res!944798 (validKeyInArray!0 (select (arr!46444 a!2901) i!1037)))))

(declare-fun b!1406579 () Bool)

(declare-fun res!944793 () Bool)

(assert (=> b!1406579 (=> (not res!944793) (not e!796112))))

(declare-datatypes ((List!32963 0))(
  ( (Nil!32960) (Cons!32959 (h!34213 (_ BitVec 64)) (t!47657 List!32963)) )
))
(declare-fun arrayNoDuplicates!0 (array!96193 (_ BitVec 32) List!32963) Bool)

(assert (=> b!1406579 (= res!944793 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32960))))

(declare-fun b!1406580 () Bool)

(declare-fun res!944795 () Bool)

(assert (=> b!1406580 (=> (not res!944795) (not e!796112))))

(assert (=> b!1406580 (= res!944795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406581 () Bool)

(declare-fun res!944797 () Bool)

(assert (=> b!1406581 (=> (not res!944797) (not e!796112))))

(assert (=> b!1406581 (= res!944797 (validKeyInArray!0 (select (arr!46444 a!2901) j!112)))))

(declare-fun b!1406582 () Bool)

(assert (=> b!1406582 (= e!796109 true)))

(declare-fun lt!619436 () SeekEntryResult!10755)

(assert (=> b!1406582 (= lt!619436 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46444 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46444 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96194 (store (arr!46444 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46994 a!2901)) mask!2840))))

(declare-fun b!1406583 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96193 (_ BitVec 32)) SeekEntryResult!10755)

(assert (=> b!1406583 (= e!796110 (= (seekEntryOrOpen!0 (select (arr!46444 a!2901) j!112) a!2901 mask!2840) (Found!10755 j!112)))))

(assert (= (and start!120886 res!944796) b!1406577))

(assert (= (and b!1406577 res!944799) b!1406578))

(assert (= (and b!1406578 res!944798) b!1406581))

(assert (= (and b!1406581 res!944797) b!1406580))

(assert (= (and b!1406580 res!944795) b!1406579))

(assert (= (and b!1406579 res!944793) b!1406576))

(assert (= (and b!1406576 res!944800) b!1406583))

(assert (= (and b!1406576 (not res!944794)) b!1406582))

(declare-fun m!1295777 () Bool)

(assert (=> b!1406583 m!1295777))

(assert (=> b!1406583 m!1295777))

(declare-fun m!1295779 () Bool)

(assert (=> b!1406583 m!1295779))

(declare-fun m!1295781 () Bool)

(assert (=> start!120886 m!1295781))

(declare-fun m!1295783 () Bool)

(assert (=> start!120886 m!1295783))

(declare-fun m!1295785 () Bool)

(assert (=> b!1406578 m!1295785))

(assert (=> b!1406578 m!1295785))

(declare-fun m!1295787 () Bool)

(assert (=> b!1406578 m!1295787))

(declare-fun m!1295789 () Bool)

(assert (=> b!1406580 m!1295789))

(assert (=> b!1406581 m!1295777))

(assert (=> b!1406581 m!1295777))

(declare-fun m!1295791 () Bool)

(assert (=> b!1406581 m!1295791))

(assert (=> b!1406576 m!1295777))

(declare-fun m!1295793 () Bool)

(assert (=> b!1406576 m!1295793))

(assert (=> b!1406576 m!1295777))

(declare-fun m!1295795 () Bool)

(assert (=> b!1406576 m!1295795))

(assert (=> b!1406576 m!1295793))

(assert (=> b!1406576 m!1295777))

(declare-fun m!1295797 () Bool)

(assert (=> b!1406576 m!1295797))

(declare-fun m!1295799 () Bool)

(assert (=> b!1406576 m!1295799))

(declare-fun m!1295801 () Bool)

(assert (=> b!1406582 m!1295801))

(declare-fun m!1295803 () Bool)

(assert (=> b!1406582 m!1295803))

(assert (=> b!1406582 m!1295803))

(declare-fun m!1295805 () Bool)

(assert (=> b!1406582 m!1295805))

(assert (=> b!1406582 m!1295805))

(assert (=> b!1406582 m!1295803))

(declare-fun m!1295807 () Bool)

(assert (=> b!1406582 m!1295807))

(declare-fun m!1295809 () Bool)

(assert (=> b!1406579 m!1295809))

(push 1)

(assert (not b!1406580))

(assert (not b!1406578))

(assert (not b!1406583))

(assert (not start!120886))

(assert (not b!1406576))

(assert (not b!1406581))

(assert (not b!1406579))

(assert (not b!1406582))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

