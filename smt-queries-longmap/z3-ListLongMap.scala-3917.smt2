; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53514 () Bool)

(assert start!53514)

(declare-fun b!582489 () Bool)

(declare-fun res!370308 () Bool)

(declare-fun e!334004 () Bool)

(assert (=> b!582489 (=> (not res!370308) (not e!334004))))

(declare-datatypes ((array!36415 0))(
  ( (array!36416 (arr!17482 (Array (_ BitVec 32) (_ BitVec 64))) (size!17846 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36415)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36415 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582489 (= res!370308 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582490 () Bool)

(declare-fun res!370305 () Bool)

(assert (=> b!582490 (=> (not res!370305) (not e!334004))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582490 (= res!370305 (and (= (size!17846 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17846 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17846 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582491 () Bool)

(declare-fun res!370311 () Bool)

(assert (=> b!582491 (=> (not res!370311) (not e!334004))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582491 (= res!370311 (validKeyInArray!0 k0!1786))))

(declare-fun b!582493 () Bool)

(declare-fun res!370313 () Bool)

(assert (=> b!582493 (=> (not res!370313) (not e!334004))))

(assert (=> b!582493 (= res!370313 (validKeyInArray!0 (select (arr!17482 a!2986) j!136)))))

(declare-fun b!582494 () Bool)

(declare-fun res!370307 () Bool)

(declare-fun e!334005 () Bool)

(assert (=> b!582494 (=> (not res!370307) (not e!334005))))

(declare-datatypes ((List!11523 0))(
  ( (Nil!11520) (Cons!11519 (h!12564 (_ BitVec 64)) (t!17751 List!11523)) )
))
(declare-fun arrayNoDuplicates!0 (array!36415 (_ BitVec 32) List!11523) Bool)

(assert (=> b!582494 (= res!370307 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11520))))

(declare-fun b!582495 () Bool)

(assert (=> b!582495 (= e!334004 e!334005)))

(declare-fun res!370309 () Bool)

(assert (=> b!582495 (=> (not res!370309) (not e!334005))))

(declare-datatypes ((SeekEntryResult!5922 0))(
  ( (MissingZero!5922 (index!25915 (_ BitVec 32))) (Found!5922 (index!25916 (_ BitVec 32))) (Intermediate!5922 (undefined!6734 Bool) (index!25917 (_ BitVec 32)) (x!54767 (_ BitVec 32))) (Undefined!5922) (MissingVacant!5922 (index!25918 (_ BitVec 32))) )
))
(declare-fun lt!265126 () SeekEntryResult!5922)

(assert (=> b!582495 (= res!370309 (or (= lt!265126 (MissingZero!5922 i!1108)) (= lt!265126 (MissingVacant!5922 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36415 (_ BitVec 32)) SeekEntryResult!5922)

(assert (=> b!582495 (= lt!265126 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!370312 () Bool)

(assert (=> start!53514 (=> (not res!370312) (not e!334004))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53514 (= res!370312 (validMask!0 mask!3053))))

(assert (=> start!53514 e!334004))

(assert (=> start!53514 true))

(declare-fun array_inv!13278 (array!36415) Bool)

(assert (=> start!53514 (array_inv!13278 a!2986)))

(declare-fun b!582492 () Bool)

(declare-fun res!370310 () Bool)

(assert (=> b!582492 (=> (not res!370310) (not e!334005))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!582492 (= res!370310 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17482 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17482 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582496 () Bool)

(declare-fun res!370306 () Bool)

(assert (=> b!582496 (=> (not res!370306) (not e!334005))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36415 (_ BitVec 32)) Bool)

(assert (=> b!582496 (= res!370306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582497 () Bool)

(assert (=> b!582497 (= e!334005 false)))

(declare-fun lt!265125 () SeekEntryResult!5922)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36415 (_ BitVec 32)) SeekEntryResult!5922)

(assert (=> b!582497 (= lt!265125 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17482 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!53514 res!370312) b!582490))

(assert (= (and b!582490 res!370305) b!582493))

(assert (= (and b!582493 res!370313) b!582491))

(assert (= (and b!582491 res!370311) b!582489))

(assert (= (and b!582489 res!370308) b!582495))

(assert (= (and b!582495 res!370309) b!582496))

(assert (= (and b!582496 res!370306) b!582494))

(assert (= (and b!582494 res!370307) b!582492))

(assert (= (and b!582492 res!370310) b!582497))

(declare-fun m!560991 () Bool)

(assert (=> b!582494 m!560991))

(declare-fun m!560993 () Bool)

(assert (=> b!582493 m!560993))

(assert (=> b!582493 m!560993))

(declare-fun m!560995 () Bool)

(assert (=> b!582493 m!560995))

(declare-fun m!560997 () Bool)

(assert (=> b!582489 m!560997))

(declare-fun m!560999 () Bool)

(assert (=> b!582495 m!560999))

(declare-fun m!561001 () Bool)

(assert (=> b!582491 m!561001))

(assert (=> b!582497 m!560993))

(assert (=> b!582497 m!560993))

(declare-fun m!561003 () Bool)

(assert (=> b!582497 m!561003))

(declare-fun m!561005 () Bool)

(assert (=> b!582492 m!561005))

(declare-fun m!561007 () Bool)

(assert (=> b!582492 m!561007))

(declare-fun m!561009 () Bool)

(assert (=> b!582492 m!561009))

(declare-fun m!561011 () Bool)

(assert (=> start!53514 m!561011))

(declare-fun m!561013 () Bool)

(assert (=> start!53514 m!561013))

(declare-fun m!561015 () Bool)

(assert (=> b!582496 m!561015))

(check-sat (not b!582491) (not start!53514) (not b!582496) (not b!582493) (not b!582489) (not b!582495) (not b!582497) (not b!582494))
