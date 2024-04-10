; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130750 () Bool)

(assert start!130750)

(declare-fun b!1533420 () Bool)

(declare-fun res!1050505 () Bool)

(declare-fun e!854229 () Bool)

(assert (=> b!1533420 (=> (not res!1050505) (not e!854229))))

(declare-datatypes ((array!101848 0))(
  ( (array!101849 (arr!49140 (Array (_ BitVec 32) (_ BitVec 64))) (size!49690 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101848)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533420 (= res!1050505 (validKeyInArray!0 (select (arr!49140 a!2792) j!64)))))

(declare-fun b!1533421 () Bool)

(declare-fun res!1050507 () Bool)

(assert (=> b!1533421 (=> (not res!1050507) (not e!854229))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101848 (_ BitVec 32)) Bool)

(assert (=> b!1533421 (= res!1050507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533422 () Bool)

(declare-fun res!1050506 () Bool)

(assert (=> b!1533422 (=> (not res!1050506) (not e!854229))))

(declare-datatypes ((List!35614 0))(
  ( (Nil!35611) (Cons!35610 (h!37055 (_ BitVec 64)) (t!50308 List!35614)) )
))
(declare-fun arrayNoDuplicates!0 (array!101848 (_ BitVec 32) List!35614) Bool)

(assert (=> b!1533422 (= res!1050506 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35611))))

(declare-fun b!1533423 () Bool)

(declare-fun res!1050510 () Bool)

(assert (=> b!1533423 (=> (not res!1050510) (not e!854229))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1533423 (= res!1050510 (validKeyInArray!0 (select (arr!49140 a!2792) i!951)))))

(declare-fun b!1533424 () Bool)

(assert (=> b!1533424 (= e!854229 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13272 0))(
  ( (MissingZero!13272 (index!55483 (_ BitVec 32))) (Found!13272 (index!55484 (_ BitVec 32))) (Intermediate!13272 (undefined!14084 Bool) (index!55485 (_ BitVec 32)) (x!137258 (_ BitVec 32))) (Undefined!13272) (MissingVacant!13272 (index!55486 (_ BitVec 32))) )
))
(declare-fun lt!663799 () SeekEntryResult!13272)

(declare-fun index!463 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101848 (_ BitVec 32)) SeekEntryResult!13272)

(assert (=> b!1533424 (= lt!663799 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49140 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1533425 () Bool)

(declare-fun res!1050511 () Bool)

(assert (=> b!1533425 (=> (not res!1050511) (not e!854229))))

(assert (=> b!1533425 (= res!1050511 (and (= (size!49690 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49690 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49690 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1050508 () Bool)

(assert (=> start!130750 (=> (not res!1050508) (not e!854229))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130750 (= res!1050508 (validMask!0 mask!2480))))

(assert (=> start!130750 e!854229))

(assert (=> start!130750 true))

(declare-fun array_inv!38168 (array!101848) Bool)

(assert (=> start!130750 (array_inv!38168 a!2792)))

(declare-fun b!1533419 () Bool)

(declare-fun res!1050509 () Bool)

(assert (=> b!1533419 (=> (not res!1050509) (not e!854229))))

(assert (=> b!1533419 (= res!1050509 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49690 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49690 a!2792)) (= (select (arr!49140 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!130750 res!1050508) b!1533425))

(assert (= (and b!1533425 res!1050511) b!1533423))

(assert (= (and b!1533423 res!1050510) b!1533420))

(assert (= (and b!1533420 res!1050505) b!1533421))

(assert (= (and b!1533421 res!1050507) b!1533422))

(assert (= (and b!1533422 res!1050506) b!1533419))

(assert (= (and b!1533419 res!1050509) b!1533424))

(declare-fun m!1416113 () Bool)

(assert (=> b!1533423 m!1416113))

(assert (=> b!1533423 m!1416113))

(declare-fun m!1416115 () Bool)

(assert (=> b!1533423 m!1416115))

(declare-fun m!1416117 () Bool)

(assert (=> b!1533420 m!1416117))

(assert (=> b!1533420 m!1416117))

(declare-fun m!1416119 () Bool)

(assert (=> b!1533420 m!1416119))

(declare-fun m!1416121 () Bool)

(assert (=> b!1533419 m!1416121))

(assert (=> b!1533424 m!1416117))

(assert (=> b!1533424 m!1416117))

(declare-fun m!1416123 () Bool)

(assert (=> b!1533424 m!1416123))

(declare-fun m!1416125 () Bool)

(assert (=> start!130750 m!1416125))

(declare-fun m!1416127 () Bool)

(assert (=> start!130750 m!1416127))

(declare-fun m!1416129 () Bool)

(assert (=> b!1533422 m!1416129))

(declare-fun m!1416131 () Bool)

(assert (=> b!1533421 m!1416131))

(check-sat (not b!1533424) (not b!1533422) (not b!1533420) (not start!130750) (not b!1533421) (not b!1533423))
