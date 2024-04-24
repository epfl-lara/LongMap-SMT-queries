; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131310 () Bool)

(assert start!131310)

(declare-fun b!1537649 () Bool)

(declare-fun res!1053161 () Bool)

(declare-fun e!856239 () Bool)

(assert (=> b!1537649 (=> (not res!1053161) (not e!856239))))

(declare-datatypes ((array!102112 0))(
  ( (array!102113 (arr!49264 (Array (_ BitVec 32) (_ BitVec 64))) (size!49815 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102112)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537649 (= res!1053161 (and (= (size!49815 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49815 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49815 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537650 () Bool)

(declare-fun res!1053168 () Bool)

(assert (=> b!1537650 (=> (not res!1053168) (not e!856239))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537650 (= res!1053168 (validKeyInArray!0 (select (arr!49264 a!2792) i!951)))))

(declare-fun b!1537651 () Bool)

(declare-fun res!1053167 () Bool)

(assert (=> b!1537651 (=> (not res!1053167) (not e!856239))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1537651 (= res!1053167 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49815 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49815 a!2792)) (= (select (arr!49264 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537652 () Bool)

(declare-fun res!1053166 () Bool)

(assert (=> b!1537652 (=> (not res!1053166) (not e!856239))))

(declare-datatypes ((List!35725 0))(
  ( (Nil!35722) (Cons!35721 (h!37184 (_ BitVec 64)) (t!50411 List!35725)) )
))
(declare-fun arrayNoDuplicates!0 (array!102112 (_ BitVec 32) List!35725) Bool)

(assert (=> b!1537652 (= res!1053166 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35722))))

(declare-fun b!1537653 () Bool)

(declare-fun res!1053162 () Bool)

(assert (=> b!1537653 (=> (not res!1053162) (not e!856239))))

(assert (=> b!1537653 (= res!1053162 (not (= (select (arr!49264 a!2792) index!463) (select (arr!49264 a!2792) j!64))))))

(declare-fun b!1537654 () Bool)

(declare-fun e!856238 () Bool)

(assert (=> b!1537654 (= e!856238 false)))

(declare-datatypes ((SeekEntryResult!13291 0))(
  ( (MissingZero!13291 (index!55559 (_ BitVec 32))) (Found!13291 (index!55560 (_ BitVec 32))) (Intermediate!13291 (undefined!14103 Bool) (index!55561 (_ BitVec 32)) (x!137519 (_ BitVec 32))) (Undefined!13291) (MissingVacant!13291 (index!55562 (_ BitVec 32))) )
))
(declare-fun lt!664925 () SeekEntryResult!13291)

(declare-fun lt!664926 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102112 (_ BitVec 32)) SeekEntryResult!13291)

(assert (=> b!1537654 (= lt!664925 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664926 vacantIndex!5 (select (arr!49264 a!2792) j!64) a!2792 mask!2480))))

(declare-fun res!1053160 () Bool)

(assert (=> start!131310 (=> (not res!1053160) (not e!856239))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131310 (= res!1053160 (validMask!0 mask!2480))))

(assert (=> start!131310 e!856239))

(assert (=> start!131310 true))

(declare-fun array_inv!38545 (array!102112) Bool)

(assert (=> start!131310 (array_inv!38545 a!2792)))

(declare-fun b!1537655 () Bool)

(declare-fun res!1053159 () Bool)

(assert (=> b!1537655 (=> (not res!1053159) (not e!856239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102112 (_ BitVec 32)) Bool)

(assert (=> b!1537655 (= res!1053159 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537656 () Bool)

(declare-fun res!1053163 () Bool)

(assert (=> b!1537656 (=> (not res!1053163) (not e!856239))))

(assert (=> b!1537656 (= res!1053163 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49264 a!2792) j!64) a!2792 mask!2480) (Found!13291 j!64)))))

(declare-fun b!1537657 () Bool)

(assert (=> b!1537657 (= e!856239 e!856238)))

(declare-fun res!1053165 () Bool)

(assert (=> b!1537657 (=> (not res!1053165) (not e!856238))))

(assert (=> b!1537657 (= res!1053165 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664926 #b00000000000000000000000000000000) (bvslt lt!664926 (size!49815 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1537657 (= lt!664926 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1537658 () Bool)

(declare-fun res!1053164 () Bool)

(assert (=> b!1537658 (=> (not res!1053164) (not e!856239))))

(assert (=> b!1537658 (= res!1053164 (validKeyInArray!0 (select (arr!49264 a!2792) j!64)))))

(assert (= (and start!131310 res!1053160) b!1537649))

(assert (= (and b!1537649 res!1053161) b!1537650))

(assert (= (and b!1537650 res!1053168) b!1537658))

(assert (= (and b!1537658 res!1053164) b!1537655))

(assert (= (and b!1537655 res!1053159) b!1537652))

(assert (= (and b!1537652 res!1053166) b!1537651))

(assert (= (and b!1537651 res!1053167) b!1537656))

(assert (= (and b!1537656 res!1053163) b!1537653))

(assert (= (and b!1537653 res!1053162) b!1537657))

(assert (= (and b!1537657 res!1053165) b!1537654))

(declare-fun m!1419997 () Bool)

(assert (=> b!1537655 m!1419997))

(declare-fun m!1419999 () Bool)

(assert (=> b!1537658 m!1419999))

(assert (=> b!1537658 m!1419999))

(declare-fun m!1420001 () Bool)

(assert (=> b!1537658 m!1420001))

(declare-fun m!1420003 () Bool)

(assert (=> start!131310 m!1420003))

(declare-fun m!1420005 () Bool)

(assert (=> start!131310 m!1420005))

(assert (=> b!1537656 m!1419999))

(assert (=> b!1537656 m!1419999))

(declare-fun m!1420007 () Bool)

(assert (=> b!1537656 m!1420007))

(declare-fun m!1420009 () Bool)

(assert (=> b!1537652 m!1420009))

(declare-fun m!1420011 () Bool)

(assert (=> b!1537657 m!1420011))

(declare-fun m!1420013 () Bool)

(assert (=> b!1537650 m!1420013))

(assert (=> b!1537650 m!1420013))

(declare-fun m!1420015 () Bool)

(assert (=> b!1537650 m!1420015))

(declare-fun m!1420017 () Bool)

(assert (=> b!1537653 m!1420017))

(assert (=> b!1537653 m!1419999))

(assert (=> b!1537654 m!1419999))

(assert (=> b!1537654 m!1419999))

(declare-fun m!1420019 () Bool)

(assert (=> b!1537654 m!1420019))

(declare-fun m!1420021 () Bool)

(assert (=> b!1537651 m!1420021))

(check-sat (not start!131310) (not b!1537658) (not b!1537655) (not b!1537656) (not b!1537657) (not b!1537650) (not b!1537652) (not b!1537654))
(check-sat)
