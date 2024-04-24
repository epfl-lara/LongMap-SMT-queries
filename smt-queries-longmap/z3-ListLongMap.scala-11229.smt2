; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131424 () Bool)

(assert start!131424)

(declare-fun b!1539469 () Bool)

(declare-fun res!1054987 () Bool)

(declare-fun e!856962 () Bool)

(assert (=> b!1539469 (=> (not res!1054987) (not e!856962))))

(declare-datatypes ((array!102226 0))(
  ( (array!102227 (arr!49321 (Array (_ BitVec 32) (_ BitVec 64))) (size!49872 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102226)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102226 (_ BitVec 32)) Bool)

(assert (=> b!1539469 (= res!1054987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1539470 () Bool)

(declare-fun res!1054989 () Bool)

(assert (=> b!1539470 (=> (not res!1054989) (not e!856962))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1539470 (= res!1054989 (validKeyInArray!0 (select (arr!49321 a!2792) j!64)))))

(declare-fun b!1539471 () Bool)

(declare-fun e!856966 () Bool)

(declare-fun e!856963 () Bool)

(assert (=> b!1539471 (= e!856966 e!856963)))

(declare-fun res!1054982 () Bool)

(assert (=> b!1539471 (=> (not res!1054982) (not e!856963))))

(declare-datatypes ((SeekEntryResult!13348 0))(
  ( (MissingZero!13348 (index!55787 (_ BitVec 32))) (Found!13348 (index!55788 (_ BitVec 32))) (Intermediate!13348 (undefined!14160 Bool) (index!55789 (_ BitVec 32)) (x!137728 (_ BitVec 32))) (Undefined!13348) (MissingVacant!13348 (index!55790 (_ BitVec 32))) )
))
(declare-fun lt!665480 () SeekEntryResult!13348)

(declare-fun lt!665478 () SeekEntryResult!13348)

(assert (=> b!1539471 (= res!1054982 (= lt!665480 lt!665478))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun lt!665481 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102226 (_ BitVec 32)) SeekEntryResult!13348)

(assert (=> b!1539471 (= lt!665480 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665481 vacantIndex!5 (select (arr!49321 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1539472 () Bool)

(declare-fun e!856964 () Bool)

(assert (=> b!1539472 (= e!856962 e!856964)))

(declare-fun res!1054986 () Bool)

(assert (=> b!1539472 (=> (not res!1054986) (not e!856964))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1539472 (= res!1054986 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49321 a!2792) j!64) a!2792 mask!2480) lt!665478))))

(assert (=> b!1539472 (= lt!665478 (Found!13348 j!64))))

(declare-fun b!1539473 () Bool)

(declare-fun res!1054979 () Bool)

(assert (=> b!1539473 (=> (not res!1054979) (not e!856962))))

(assert (=> b!1539473 (= res!1054979 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49872 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49872 a!2792)) (= (select (arr!49321 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1539474 () Bool)

(assert (=> b!1539474 (= e!856963 (not (or (bvslt mask!2480 #b00000000000000000000000000000000) (bvslt index!463 (bvadd #b00000000000000000000000000000001 mask!2480)))))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1539474 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665481 vacantIndex!5 (select (store (arr!49321 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102227 (store (arr!49321 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49872 a!2792)) mask!2480) lt!665480)))

(declare-datatypes ((Unit!51305 0))(
  ( (Unit!51306) )
))
(declare-fun lt!665479 () Unit!51305)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102226 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51305)

(assert (=> b!1539474 (= lt!665479 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!665481 vacantIndex!5 mask!2480))))

(declare-fun b!1539475 () Bool)

(declare-fun res!1054985 () Bool)

(assert (=> b!1539475 (=> (not res!1054985) (not e!856962))))

(assert (=> b!1539475 (= res!1054985 (and (= (size!49872 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49872 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49872 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1539476 () Bool)

(assert (=> b!1539476 (= e!856964 e!856966)))

(declare-fun res!1054980 () Bool)

(assert (=> b!1539476 (=> (not res!1054980) (not e!856966))))

(assert (=> b!1539476 (= res!1054980 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665481 #b00000000000000000000000000000000) (bvslt lt!665481 (size!49872 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1539476 (= lt!665481 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1539477 () Bool)

(declare-fun res!1054988 () Bool)

(assert (=> b!1539477 (=> (not res!1054988) (not e!856962))))

(assert (=> b!1539477 (= res!1054988 (validKeyInArray!0 (select (arr!49321 a!2792) i!951)))))

(declare-fun res!1054984 () Bool)

(assert (=> start!131424 (=> (not res!1054984) (not e!856962))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131424 (= res!1054984 (validMask!0 mask!2480))))

(assert (=> start!131424 e!856962))

(assert (=> start!131424 true))

(declare-fun array_inv!38602 (array!102226) Bool)

(assert (=> start!131424 (array_inv!38602 a!2792)))

(declare-fun b!1539478 () Bool)

(declare-fun res!1054983 () Bool)

(assert (=> b!1539478 (=> (not res!1054983) (not e!856962))))

(declare-datatypes ((List!35782 0))(
  ( (Nil!35779) (Cons!35778 (h!37241 (_ BitVec 64)) (t!50468 List!35782)) )
))
(declare-fun arrayNoDuplicates!0 (array!102226 (_ BitVec 32) List!35782) Bool)

(assert (=> b!1539478 (= res!1054983 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35779))))

(declare-fun b!1539479 () Bool)

(declare-fun res!1054981 () Bool)

(assert (=> b!1539479 (=> (not res!1054981) (not e!856964))))

(assert (=> b!1539479 (= res!1054981 (not (= (select (arr!49321 a!2792) index!463) (select (arr!49321 a!2792) j!64))))))

(assert (= (and start!131424 res!1054984) b!1539475))

(assert (= (and b!1539475 res!1054985) b!1539477))

(assert (= (and b!1539477 res!1054988) b!1539470))

(assert (= (and b!1539470 res!1054989) b!1539469))

(assert (= (and b!1539469 res!1054987) b!1539478))

(assert (= (and b!1539478 res!1054983) b!1539473))

(assert (= (and b!1539473 res!1054979) b!1539472))

(assert (= (and b!1539472 res!1054986) b!1539479))

(assert (= (and b!1539479 res!1054981) b!1539476))

(assert (= (and b!1539476 res!1054980) b!1539471))

(assert (= (and b!1539471 res!1054982) b!1539474))

(declare-fun m!1421761 () Bool)

(assert (=> b!1539470 m!1421761))

(assert (=> b!1539470 m!1421761))

(declare-fun m!1421763 () Bool)

(assert (=> b!1539470 m!1421763))

(declare-fun m!1421765 () Bool)

(assert (=> b!1539473 m!1421765))

(declare-fun m!1421767 () Bool)

(assert (=> b!1539476 m!1421767))

(declare-fun m!1421769 () Bool)

(assert (=> start!131424 m!1421769))

(declare-fun m!1421771 () Bool)

(assert (=> start!131424 m!1421771))

(declare-fun m!1421773 () Bool)

(assert (=> b!1539477 m!1421773))

(assert (=> b!1539477 m!1421773))

(declare-fun m!1421775 () Bool)

(assert (=> b!1539477 m!1421775))

(declare-fun m!1421777 () Bool)

(assert (=> b!1539478 m!1421777))

(assert (=> b!1539472 m!1421761))

(assert (=> b!1539472 m!1421761))

(declare-fun m!1421779 () Bool)

(assert (=> b!1539472 m!1421779))

(declare-fun m!1421781 () Bool)

(assert (=> b!1539474 m!1421781))

(declare-fun m!1421783 () Bool)

(assert (=> b!1539474 m!1421783))

(assert (=> b!1539474 m!1421783))

(declare-fun m!1421785 () Bool)

(assert (=> b!1539474 m!1421785))

(declare-fun m!1421787 () Bool)

(assert (=> b!1539474 m!1421787))

(assert (=> b!1539471 m!1421761))

(assert (=> b!1539471 m!1421761))

(declare-fun m!1421789 () Bool)

(assert (=> b!1539471 m!1421789))

(declare-fun m!1421791 () Bool)

(assert (=> b!1539479 m!1421791))

(assert (=> b!1539479 m!1421761))

(declare-fun m!1421793 () Bool)

(assert (=> b!1539469 m!1421793))

(check-sat (not b!1539472) (not start!131424) (not b!1539476) (not b!1539471) (not b!1539469) (not b!1539477) (not b!1539478) (not b!1539474) (not b!1539470))
(check-sat)
