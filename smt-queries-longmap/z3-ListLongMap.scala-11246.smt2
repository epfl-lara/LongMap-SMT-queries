; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131146 () Bool)

(assert start!131146)

(declare-fun b!1538469 () Bool)

(declare-fun res!1055450 () Bool)

(declare-fun e!856002 () Bool)

(assert (=> b!1538469 (=> (not res!1055450) (not e!856002))))

(declare-datatypes ((array!102211 0))(
  ( (array!102212 (arr!49320 (Array (_ BitVec 32) (_ BitVec 64))) (size!49870 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102211)

(declare-datatypes ((List!35794 0))(
  ( (Nil!35791) (Cons!35790 (h!37235 (_ BitVec 64)) (t!50488 List!35794)) )
))
(declare-fun arrayNoDuplicates!0 (array!102211 (_ BitVec 32) List!35794) Bool)

(assert (=> b!1538469 (= res!1055450 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35791))))

(declare-fun b!1538471 () Bool)

(declare-fun res!1055455 () Bool)

(assert (=> b!1538471 (=> (not res!1055455) (not e!856002))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1538471 (= res!1055455 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49870 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49870 a!2792)) (= (select (arr!49320 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538472 () Bool)

(declare-fun res!1055452 () Bool)

(assert (=> b!1538472 (=> (not res!1055452) (not e!856002))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1538472 (= res!1055452 (not (= (select (arr!49320 a!2792) index!463) (select (arr!49320 a!2792) j!64))))))

(declare-fun b!1538473 () Bool)

(declare-fun res!1055447 () Bool)

(assert (=> b!1538473 (=> (not res!1055447) (not e!856002))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538473 (= res!1055447 (validKeyInArray!0 (select (arr!49320 a!2792) i!951)))))

(declare-fun b!1538474 () Bool)

(declare-fun res!1055449 () Bool)

(assert (=> b!1538474 (=> (not res!1055449) (not e!856002))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102211 (_ BitVec 32)) Bool)

(assert (=> b!1538474 (= res!1055449 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538475 () Bool)

(declare-fun res!1055448 () Bool)

(assert (=> b!1538475 (=> (not res!1055448) (not e!856002))))

(assert (=> b!1538475 (= res!1055448 (validKeyInArray!0 (select (arr!49320 a!2792) j!64)))))

(declare-fun res!1055451 () Bool)

(assert (=> start!131146 (=> (not res!1055451) (not e!856002))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131146 (= res!1055451 (validMask!0 mask!2480))))

(assert (=> start!131146 e!856002))

(assert (=> start!131146 true))

(declare-fun array_inv!38348 (array!102211) Bool)

(assert (=> start!131146 (array_inv!38348 a!2792)))

(declare-fun b!1538470 () Bool)

(declare-fun res!1055454 () Bool)

(assert (=> b!1538470 (=> (not res!1055454) (not e!856002))))

(declare-datatypes ((SeekEntryResult!13446 0))(
  ( (MissingZero!13446 (index!56179 (_ BitVec 32))) (Found!13446 (index!56180 (_ BitVec 32))) (Intermediate!13446 (undefined!14258 Bool) (index!56181 (_ BitVec 32)) (x!137915 (_ BitVec 32))) (Undefined!13446) (MissingVacant!13446 (index!56182 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102211 (_ BitVec 32)) SeekEntryResult!13446)

(assert (=> b!1538470 (= res!1055454 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49320 a!2792) j!64) a!2792 mask!2480) (Found!13446 j!64)))))

(declare-fun b!1538476 () Bool)

(assert (=> b!1538476 (= e!856002 false)))

(declare-fun lt!664903 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538476 (= lt!664903 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1538477 () Bool)

(declare-fun res!1055453 () Bool)

(assert (=> b!1538477 (=> (not res!1055453) (not e!856002))))

(assert (=> b!1538477 (= res!1055453 (and (= (size!49870 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49870 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49870 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!131146 res!1055451) b!1538477))

(assert (= (and b!1538477 res!1055453) b!1538473))

(assert (= (and b!1538473 res!1055447) b!1538475))

(assert (= (and b!1538475 res!1055448) b!1538474))

(assert (= (and b!1538474 res!1055449) b!1538469))

(assert (= (and b!1538469 res!1055450) b!1538471))

(assert (= (and b!1538471 res!1055455) b!1538470))

(assert (= (and b!1538470 res!1055454) b!1538472))

(assert (= (and b!1538472 res!1055452) b!1538476))

(declare-fun m!1420899 () Bool)

(assert (=> b!1538469 m!1420899))

(declare-fun m!1420901 () Bool)

(assert (=> b!1538474 m!1420901))

(declare-fun m!1420903 () Bool)

(assert (=> b!1538473 m!1420903))

(assert (=> b!1538473 m!1420903))

(declare-fun m!1420905 () Bool)

(assert (=> b!1538473 m!1420905))

(declare-fun m!1420907 () Bool)

(assert (=> b!1538471 m!1420907))

(declare-fun m!1420909 () Bool)

(assert (=> b!1538470 m!1420909))

(assert (=> b!1538470 m!1420909))

(declare-fun m!1420911 () Bool)

(assert (=> b!1538470 m!1420911))

(declare-fun m!1420913 () Bool)

(assert (=> start!131146 m!1420913))

(declare-fun m!1420915 () Bool)

(assert (=> start!131146 m!1420915))

(declare-fun m!1420917 () Bool)

(assert (=> b!1538472 m!1420917))

(assert (=> b!1538472 m!1420909))

(assert (=> b!1538475 m!1420909))

(assert (=> b!1538475 m!1420909))

(declare-fun m!1420919 () Bool)

(assert (=> b!1538475 m!1420919))

(declare-fun m!1420921 () Bool)

(assert (=> b!1538476 m!1420921))

(check-sat (not b!1538469) (not b!1538470) (not b!1538474) (not start!131146) (not b!1538473) (not b!1538475) (not b!1538476))
