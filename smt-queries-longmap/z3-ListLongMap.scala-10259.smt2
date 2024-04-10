; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120608 () Bool)

(assert start!120608)

(declare-fun b!1404259 () Bool)

(declare-fun res!942773 () Bool)

(declare-fun e!794981 () Bool)

(assert (=> b!1404259 (=> (not res!942773) (not e!794981))))

(declare-datatypes ((array!96017 0))(
  ( (array!96018 (arr!46359 (Array (_ BitVec 32) (_ BitVec 64))) (size!46909 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96017)

(declare-datatypes ((List!32878 0))(
  ( (Nil!32875) (Cons!32874 (h!34122 (_ BitVec 64)) (t!47572 List!32878)) )
))
(declare-fun arrayNoDuplicates!0 (array!96017 (_ BitVec 32) List!32878) Bool)

(assert (=> b!1404259 (= res!942773 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32875))))

(declare-fun b!1404260 () Bool)

(declare-fun res!942775 () Bool)

(assert (=> b!1404260 (=> (not res!942775) (not e!794981))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96017 (_ BitVec 32)) Bool)

(assert (=> b!1404260 (= res!942775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1404261 () Bool)

(declare-fun res!942771 () Bool)

(assert (=> b!1404261 (=> (not res!942771) (not e!794981))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404261 (= res!942771 (validKeyInArray!0 (select (arr!46359 a!2901) j!112)))))

(declare-fun res!942772 () Bool)

(assert (=> start!120608 (=> (not res!942772) (not e!794981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120608 (= res!942772 (validMask!0 mask!2840))))

(assert (=> start!120608 e!794981))

(assert (=> start!120608 true))

(declare-fun array_inv!35387 (array!96017) Bool)

(assert (=> start!120608 (array_inv!35387 a!2901)))

(declare-fun b!1404262 () Bool)

(declare-fun res!942774 () Bool)

(assert (=> b!1404262 (=> (not res!942774) (not e!794981))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1404262 (= res!942774 (and (= (size!46909 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46909 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46909 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404263 () Bool)

(declare-fun res!942770 () Bool)

(assert (=> b!1404263 (=> (not res!942770) (not e!794981))))

(assert (=> b!1404263 (= res!942770 (validKeyInArray!0 (select (arr!46359 a!2901) i!1037)))))

(declare-fun b!1404264 () Bool)

(assert (=> b!1404264 (= e!794981 (bvsgt #b00000000000000000000000000000000 (size!46909 a!2901)))))

(declare-datatypes ((SeekEntryResult!10670 0))(
  ( (MissingZero!10670 (index!45057 (_ BitVec 32))) (Found!10670 (index!45058 (_ BitVec 32))) (Intermediate!10670 (undefined!11482 Bool) (index!45059 (_ BitVec 32)) (x!126673 (_ BitVec 32))) (Undefined!10670) (MissingVacant!10670 (index!45060 (_ BitVec 32))) )
))
(declare-fun lt!618615 () SeekEntryResult!10670)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96017 (_ BitVec 32)) SeekEntryResult!10670)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404264 (= lt!618615 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46359 a!2901) j!112) mask!2840) (select (arr!46359 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!120608 res!942772) b!1404262))

(assert (= (and b!1404262 res!942774) b!1404263))

(assert (= (and b!1404263 res!942770) b!1404261))

(assert (= (and b!1404261 res!942771) b!1404260))

(assert (= (and b!1404260 res!942775) b!1404259))

(assert (= (and b!1404259 res!942773) b!1404264))

(declare-fun m!1293077 () Bool)

(assert (=> start!120608 m!1293077))

(declare-fun m!1293079 () Bool)

(assert (=> start!120608 m!1293079))

(declare-fun m!1293081 () Bool)

(assert (=> b!1404264 m!1293081))

(assert (=> b!1404264 m!1293081))

(declare-fun m!1293083 () Bool)

(assert (=> b!1404264 m!1293083))

(assert (=> b!1404264 m!1293083))

(assert (=> b!1404264 m!1293081))

(declare-fun m!1293085 () Bool)

(assert (=> b!1404264 m!1293085))

(assert (=> b!1404261 m!1293081))

(assert (=> b!1404261 m!1293081))

(declare-fun m!1293087 () Bool)

(assert (=> b!1404261 m!1293087))

(declare-fun m!1293089 () Bool)

(assert (=> b!1404260 m!1293089))

(declare-fun m!1293091 () Bool)

(assert (=> b!1404259 m!1293091))

(declare-fun m!1293093 () Bool)

(assert (=> b!1404263 m!1293093))

(assert (=> b!1404263 m!1293093))

(declare-fun m!1293095 () Bool)

(assert (=> b!1404263 m!1293095))

(check-sat (not start!120608) (not b!1404261) (not b!1404259) (not b!1404260) (not b!1404263) (not b!1404264))
(check-sat)
