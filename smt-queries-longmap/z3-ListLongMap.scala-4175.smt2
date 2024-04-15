; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56892 () Bool)

(assert start!56892)

(declare-fun b!629760 () Bool)

(declare-fun res!407119 () Bool)

(declare-fun e!360106 () Bool)

(assert (=> b!629760 (=> (not res!407119) (not e!360106))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!38037 0))(
  ( (array!38038 (arr!18254 (Array (_ BitVec 32) (_ BitVec 64))) (size!18619 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38037)

(assert (=> b!629760 (= res!407119 (and (= (size!18619 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18619 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18619 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!629761 () Bool)

(declare-fun res!407116 () Bool)

(assert (=> b!629761 (=> (not res!407116) (not e!360106))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38037 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!629761 (= res!407116 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!629762 () Bool)

(declare-fun res!407126 () Bool)

(declare-fun e!360108 () Bool)

(assert (=> b!629762 (=> (not res!407126) (not e!360108))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!629762 (= res!407126 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18254 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18254 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!629763 () Bool)

(declare-fun res!407117 () Bool)

(assert (=> b!629763 (=> (not res!407117) (not e!360106))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!629763 (= res!407117 (validKeyInArray!0 (select (arr!18254 a!2986) j!136)))))

(declare-fun b!629764 () Bool)

(declare-fun e!360104 () Bool)

(assert (=> b!629764 (= e!360104 (not true))))

(declare-fun e!360107 () Bool)

(assert (=> b!629764 e!360107))

(declare-fun res!407123 () Bool)

(assert (=> b!629764 (=> (not res!407123) (not e!360107))))

(declare-datatypes ((SeekEntryResult!6691 0))(
  ( (MissingZero!6691 (index!29051 (_ BitVec 32))) (Found!6691 (index!29052 (_ BitVec 32))) (Intermediate!6691 (undefined!7503 Bool) (index!29053 (_ BitVec 32)) (x!57799 (_ BitVec 32))) (Undefined!6691) (MissingVacant!6691 (index!29054 (_ BitVec 32))) )
))
(declare-fun lt!290754 () SeekEntryResult!6691)

(declare-fun lt!290756 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38037 (_ BitVec 32)) SeekEntryResult!6691)

(assert (=> b!629764 (= res!407123 (= lt!290754 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290756 vacantSpotIndex!68 (select (store (arr!18254 a!2986) i!1108 k0!1786) j!136) (array!38038 (store (arr!18254 a!2986) i!1108 k0!1786) (size!18619 a!2986)) mask!3053)))))

(assert (=> b!629764 (= lt!290754 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290756 vacantSpotIndex!68 (select (arr!18254 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!21110 0))(
  ( (Unit!21111) )
))
(declare-fun lt!290755 () Unit!21110)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38037 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21110)

(assert (=> b!629764 (= lt!290755 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!290756 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!629764 (= lt!290756 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!629765 () Bool)

(declare-fun res!407120 () Bool)

(assert (=> b!629765 (=> (not res!407120) (not e!360108))))

(declare-datatypes ((List!12334 0))(
  ( (Nil!12331) (Cons!12330 (h!13375 (_ BitVec 64)) (t!18553 List!12334)) )
))
(declare-fun arrayNoDuplicates!0 (array!38037 (_ BitVec 32) List!12334) Bool)

(assert (=> b!629765 (= res!407120 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12331))))

(declare-fun b!629766 () Bool)

(declare-fun lt!290758 () SeekEntryResult!6691)

(assert (=> b!629766 (= e!360107 (= lt!290758 lt!290754))))

(declare-fun b!629767 () Bool)

(declare-fun res!407118 () Bool)

(assert (=> b!629767 (=> (not res!407118) (not e!360108))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38037 (_ BitVec 32)) Bool)

(assert (=> b!629767 (= res!407118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!629768 () Bool)

(assert (=> b!629768 (= e!360108 e!360104)))

(declare-fun res!407124 () Bool)

(assert (=> b!629768 (=> (not res!407124) (not e!360104))))

(assert (=> b!629768 (= res!407124 (and (= lt!290758 (Found!6691 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18254 a!2986) index!984) (select (arr!18254 a!2986) j!136))) (not (= (select (arr!18254 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!629768 (= lt!290758 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18254 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!407121 () Bool)

(assert (=> start!56892 (=> (not res!407121) (not e!360106))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56892 (= res!407121 (validMask!0 mask!3053))))

(assert (=> start!56892 e!360106))

(assert (=> start!56892 true))

(declare-fun array_inv!14137 (array!38037) Bool)

(assert (=> start!56892 (array_inv!14137 a!2986)))

(declare-fun b!629769 () Bool)

(declare-fun res!407125 () Bool)

(assert (=> b!629769 (=> (not res!407125) (not e!360106))))

(assert (=> b!629769 (= res!407125 (validKeyInArray!0 k0!1786))))

(declare-fun b!629770 () Bool)

(assert (=> b!629770 (= e!360106 e!360108)))

(declare-fun res!407122 () Bool)

(assert (=> b!629770 (=> (not res!407122) (not e!360108))))

(declare-fun lt!290757 () SeekEntryResult!6691)

(assert (=> b!629770 (= res!407122 (or (= lt!290757 (MissingZero!6691 i!1108)) (= lt!290757 (MissingVacant!6691 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38037 (_ BitVec 32)) SeekEntryResult!6691)

(assert (=> b!629770 (= lt!290757 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!56892 res!407121) b!629760))

(assert (= (and b!629760 res!407119) b!629763))

(assert (= (and b!629763 res!407117) b!629769))

(assert (= (and b!629769 res!407125) b!629761))

(assert (= (and b!629761 res!407116) b!629770))

(assert (= (and b!629770 res!407122) b!629767))

(assert (= (and b!629767 res!407118) b!629765))

(assert (= (and b!629765 res!407120) b!629762))

(assert (= (and b!629762 res!407126) b!629768))

(assert (= (and b!629768 res!407124) b!629764))

(assert (= (and b!629764 res!407123) b!629766))

(declare-fun m!604261 () Bool)

(assert (=> b!629765 m!604261))

(declare-fun m!604263 () Bool)

(assert (=> start!56892 m!604263))

(declare-fun m!604265 () Bool)

(assert (=> start!56892 m!604265))

(declare-fun m!604267 () Bool)

(assert (=> b!629770 m!604267))

(declare-fun m!604269 () Bool)

(assert (=> b!629768 m!604269))

(declare-fun m!604271 () Bool)

(assert (=> b!629768 m!604271))

(assert (=> b!629768 m!604271))

(declare-fun m!604273 () Bool)

(assert (=> b!629768 m!604273))

(declare-fun m!604275 () Bool)

(assert (=> b!629769 m!604275))

(declare-fun m!604277 () Bool)

(assert (=> b!629762 m!604277))

(declare-fun m!604279 () Bool)

(assert (=> b!629762 m!604279))

(declare-fun m!604281 () Bool)

(assert (=> b!629762 m!604281))

(declare-fun m!604283 () Bool)

(assert (=> b!629761 m!604283))

(assert (=> b!629763 m!604271))

(assert (=> b!629763 m!604271))

(declare-fun m!604285 () Bool)

(assert (=> b!629763 m!604285))

(declare-fun m!604287 () Bool)

(assert (=> b!629764 m!604287))

(declare-fun m!604289 () Bool)

(assert (=> b!629764 m!604289))

(assert (=> b!629764 m!604271))

(assert (=> b!629764 m!604279))

(assert (=> b!629764 m!604271))

(declare-fun m!604291 () Bool)

(assert (=> b!629764 m!604291))

(assert (=> b!629764 m!604289))

(declare-fun m!604293 () Bool)

(assert (=> b!629764 m!604293))

(declare-fun m!604295 () Bool)

(assert (=> b!629764 m!604295))

(declare-fun m!604297 () Bool)

(assert (=> b!629767 m!604297))

(check-sat (not b!629764) (not b!629763) (not b!629768) (not b!629770) (not b!629761) (not b!629769) (not b!629765) (not b!629767) (not start!56892))
(check-sat)
