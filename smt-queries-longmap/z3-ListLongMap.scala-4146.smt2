; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56566 () Bool)

(assert start!56566)

(declare-fun b!626571 () Bool)

(declare-fun res!404277 () Bool)

(declare-fun e!358996 () Bool)

(assert (=> b!626571 (=> (not res!404277) (not e!358996))))

(declare-datatypes ((array!37858 0))(
  ( (array!37859 (arr!18169 (Array (_ BitVec 32) (_ BitVec 64))) (size!18533 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37858)

(declare-datatypes ((List!12210 0))(
  ( (Nil!12207) (Cons!12206 (h!13251 (_ BitVec 64)) (t!18438 List!12210)) )
))
(declare-fun arrayNoDuplicates!0 (array!37858 (_ BitVec 32) List!12210) Bool)

(assert (=> b!626571 (= res!404277 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12207))))

(declare-fun b!626572 () Bool)

(declare-fun res!404271 () Bool)

(declare-fun e!358998 () Bool)

(assert (=> b!626572 (=> (not res!404271) (not e!358998))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!626572 (= res!404271 (and (= (size!18533 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18533 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18533 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!626573 () Bool)

(assert (=> b!626573 (= e!358996 false)))

(declare-datatypes ((SeekEntryResult!6609 0))(
  ( (MissingZero!6609 (index!28720 (_ BitVec 32))) (Found!6609 (index!28721 (_ BitVec 32))) (Intermediate!6609 (undefined!7421 Bool) (index!28722 (_ BitVec 32)) (x!57469 (_ BitVec 32))) (Undefined!6609) (MissingVacant!6609 (index!28723 (_ BitVec 32))) )
))
(declare-fun lt!290106 () SeekEntryResult!6609)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37858 (_ BitVec 32)) SeekEntryResult!6609)

(assert (=> b!626573 (= lt!290106 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18169 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!626574 () Bool)

(declare-fun res!404273 () Bool)

(assert (=> b!626574 (=> (not res!404273) (not e!358998))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!626574 (= res!404273 (validKeyInArray!0 k0!1786))))

(declare-fun b!626575 () Bool)

(assert (=> b!626575 (= e!358998 e!358996)))

(declare-fun res!404278 () Bool)

(assert (=> b!626575 (=> (not res!404278) (not e!358996))))

(declare-fun lt!290107 () SeekEntryResult!6609)

(assert (=> b!626575 (= res!404278 (or (= lt!290107 (MissingZero!6609 i!1108)) (= lt!290107 (MissingVacant!6609 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37858 (_ BitVec 32)) SeekEntryResult!6609)

(assert (=> b!626575 (= lt!290107 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!626576 () Bool)

(declare-fun res!404274 () Bool)

(assert (=> b!626576 (=> (not res!404274) (not e!358996))))

(assert (=> b!626576 (= res!404274 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18169 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18169 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!626577 () Bool)

(declare-fun res!404279 () Bool)

(assert (=> b!626577 (=> (not res!404279) (not e!358998))))

(declare-fun arrayContainsKey!0 (array!37858 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!626577 (= res!404279 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!626578 () Bool)

(declare-fun res!404275 () Bool)

(assert (=> b!626578 (=> (not res!404275) (not e!358998))))

(assert (=> b!626578 (= res!404275 (validKeyInArray!0 (select (arr!18169 a!2986) j!136)))))

(declare-fun b!626579 () Bool)

(declare-fun res!404272 () Bool)

(assert (=> b!626579 (=> (not res!404272) (not e!358996))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37858 (_ BitVec 32)) Bool)

(assert (=> b!626579 (= res!404272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!404276 () Bool)

(assert (=> start!56566 (=> (not res!404276) (not e!358998))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56566 (= res!404276 (validMask!0 mask!3053))))

(assert (=> start!56566 e!358998))

(assert (=> start!56566 true))

(declare-fun array_inv!13965 (array!37858) Bool)

(assert (=> start!56566 (array_inv!13965 a!2986)))

(assert (= (and start!56566 res!404276) b!626572))

(assert (= (and b!626572 res!404271) b!626578))

(assert (= (and b!626578 res!404275) b!626574))

(assert (= (and b!626574 res!404273) b!626577))

(assert (= (and b!626577 res!404279) b!626575))

(assert (= (and b!626575 res!404278) b!626579))

(assert (= (and b!626579 res!404272) b!626571))

(assert (= (and b!626571 res!404277) b!626576))

(assert (= (and b!626576 res!404274) b!626573))

(declare-fun m!601943 () Bool)

(assert (=> b!626576 m!601943))

(declare-fun m!601945 () Bool)

(assert (=> b!626576 m!601945))

(declare-fun m!601947 () Bool)

(assert (=> b!626576 m!601947))

(declare-fun m!601949 () Bool)

(assert (=> b!626577 m!601949))

(declare-fun m!601951 () Bool)

(assert (=> b!626573 m!601951))

(assert (=> b!626573 m!601951))

(declare-fun m!601953 () Bool)

(assert (=> b!626573 m!601953))

(declare-fun m!601955 () Bool)

(assert (=> b!626571 m!601955))

(declare-fun m!601957 () Bool)

(assert (=> b!626575 m!601957))

(assert (=> b!626578 m!601951))

(assert (=> b!626578 m!601951))

(declare-fun m!601959 () Bool)

(assert (=> b!626578 m!601959))

(declare-fun m!601961 () Bool)

(assert (=> b!626574 m!601961))

(declare-fun m!601963 () Bool)

(assert (=> b!626579 m!601963))

(declare-fun m!601965 () Bool)

(assert (=> start!56566 m!601965))

(declare-fun m!601967 () Bool)

(assert (=> start!56566 m!601967))

(check-sat (not b!626575) (not b!626579) (not b!626571) (not b!626577) (not b!626573) (not b!626578) (not start!56566) (not b!626574))
(check-sat)
