; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130800 () Bool)

(assert start!130800)

(declare-fun b!1534270 () Bool)

(declare-fun res!1051543 () Bool)

(declare-fun e!854342 () Bool)

(assert (=> b!1534270 (=> (not res!1051543) (not e!854342))))

(declare-datatypes ((array!101896 0))(
  ( (array!101897 (arr!49165 (Array (_ BitVec 32) (_ BitVec 64))) (size!49717 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101896)

(declare-fun index!463 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1534270 (= res!1051543 (not (= (select (arr!49165 a!2792) index!463) (select (arr!49165 a!2792) j!64))))))

(declare-fun b!1534271 () Bool)

(declare-fun res!1051549 () Bool)

(assert (=> b!1534271 (=> (not res!1051549) (not e!854342))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534271 (= res!1051549 (and (= (size!49717 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49717 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49717 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534272 () Bool)

(declare-fun res!1051547 () Bool)

(assert (=> b!1534272 (=> (not res!1051547) (not e!854342))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101896 (_ BitVec 32)) Bool)

(assert (=> b!1534272 (= res!1051547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534273 () Bool)

(declare-fun res!1051544 () Bool)

(assert (=> b!1534273 (=> (not res!1051544) (not e!854342))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13322 0))(
  ( (MissingZero!13322 (index!55683 (_ BitVec 32))) (Found!13322 (index!55684 (_ BitVec 32))) (Intermediate!13322 (undefined!14134 Bool) (index!55685 (_ BitVec 32)) (x!137439 (_ BitVec 32))) (Undefined!13322) (MissingVacant!13322 (index!55686 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101896 (_ BitVec 32)) SeekEntryResult!13322)

(assert (=> b!1534273 (= res!1051544 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49165 a!2792) j!64) a!2792 mask!2480) (Found!13322 j!64)))))

(declare-fun b!1534274 () Bool)

(declare-fun res!1051546 () Bool)

(assert (=> b!1534274 (=> (not res!1051546) (not e!854342))))

(declare-datatypes ((List!35717 0))(
  ( (Nil!35714) (Cons!35713 (h!37159 (_ BitVec 64)) (t!50403 List!35717)) )
))
(declare-fun arrayNoDuplicates!0 (array!101896 (_ BitVec 32) List!35717) Bool)

(assert (=> b!1534274 (= res!1051546 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35714))))

(declare-fun b!1534275 () Bool)

(declare-fun e!854344 () Bool)

(assert (=> b!1534275 (= e!854344 false)))

(declare-fun lt!663603 () (_ BitVec 32))

(declare-fun lt!663602 () SeekEntryResult!13322)

(assert (=> b!1534275 (= lt!663602 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663603 vacantIndex!5 (select (arr!49165 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1534276 () Bool)

(declare-fun res!1051548 () Bool)

(assert (=> b!1534276 (=> (not res!1051548) (not e!854342))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534276 (= res!1051548 (validKeyInArray!0 (select (arr!49165 a!2792) j!64)))))

(declare-fun b!1534277 () Bool)

(declare-fun res!1051542 () Bool)

(assert (=> b!1534277 (=> (not res!1051542) (not e!854342))))

(assert (=> b!1534277 (= res!1051542 (validKeyInArray!0 (select (arr!49165 a!2792) i!951)))))

(declare-fun b!1534278 () Bool)

(declare-fun res!1051545 () Bool)

(assert (=> b!1534278 (=> (not res!1051545) (not e!854342))))

(assert (=> b!1534278 (= res!1051545 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49717 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49717 a!2792)) (= (select (arr!49165 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1051540 () Bool)

(assert (=> start!130800 (=> (not res!1051540) (not e!854342))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130800 (= res!1051540 (validMask!0 mask!2480))))

(assert (=> start!130800 e!854342))

(assert (=> start!130800 true))

(declare-fun array_inv!38398 (array!101896) Bool)

(assert (=> start!130800 (array_inv!38398 a!2792)))

(declare-fun b!1534279 () Bool)

(assert (=> b!1534279 (= e!854342 e!854344)))

(declare-fun res!1051541 () Bool)

(assert (=> b!1534279 (=> (not res!1051541) (not e!854344))))

(assert (=> b!1534279 (= res!1051541 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663603 #b00000000000000000000000000000000) (bvslt lt!663603 (size!49717 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1534279 (= lt!663603 (nextIndex!0 index!463 x!510 mask!2480))))

(assert (= (and start!130800 res!1051540) b!1534271))

(assert (= (and b!1534271 res!1051549) b!1534277))

(assert (= (and b!1534277 res!1051542) b!1534276))

(assert (= (and b!1534276 res!1051548) b!1534272))

(assert (= (and b!1534272 res!1051547) b!1534274))

(assert (= (and b!1534274 res!1051546) b!1534278))

(assert (= (and b!1534278 res!1051545) b!1534273))

(assert (= (and b!1534273 res!1051544) b!1534270))

(assert (= (and b!1534270 res!1051543) b!1534279))

(assert (= (and b!1534279 res!1051541) b!1534275))

(declare-fun m!1416323 () Bool)

(assert (=> b!1534270 m!1416323))

(declare-fun m!1416325 () Bool)

(assert (=> b!1534270 m!1416325))

(assert (=> b!1534273 m!1416325))

(assert (=> b!1534273 m!1416325))

(declare-fun m!1416327 () Bool)

(assert (=> b!1534273 m!1416327))

(declare-fun m!1416329 () Bool)

(assert (=> b!1534279 m!1416329))

(assert (=> b!1534275 m!1416325))

(assert (=> b!1534275 m!1416325))

(declare-fun m!1416331 () Bool)

(assert (=> b!1534275 m!1416331))

(declare-fun m!1416333 () Bool)

(assert (=> b!1534278 m!1416333))

(declare-fun m!1416335 () Bool)

(assert (=> b!1534272 m!1416335))

(declare-fun m!1416337 () Bool)

(assert (=> b!1534274 m!1416337))

(declare-fun m!1416339 () Bool)

(assert (=> b!1534277 m!1416339))

(assert (=> b!1534277 m!1416339))

(declare-fun m!1416341 () Bool)

(assert (=> b!1534277 m!1416341))

(assert (=> b!1534276 m!1416325))

(assert (=> b!1534276 m!1416325))

(declare-fun m!1416343 () Bool)

(assert (=> b!1534276 m!1416343))

(declare-fun m!1416345 () Bool)

(assert (=> start!130800 m!1416345))

(declare-fun m!1416347 () Bool)

(assert (=> start!130800 m!1416347))

(check-sat (not b!1534279) (not b!1534273) (not b!1534277) (not start!130800) (not b!1534276) (not b!1534274) (not b!1534272) (not b!1534275))
(check-sat)
