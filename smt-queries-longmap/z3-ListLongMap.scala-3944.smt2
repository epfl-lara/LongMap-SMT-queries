; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53676 () Bool)

(assert start!53676)

(declare-fun res!372903 () Bool)

(declare-fun e!334863 () Bool)

(assert (=> start!53676 (=> (not res!372903) (not e!334863))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53676 (= res!372903 (validMask!0 mask!3053))))

(assert (=> start!53676 e!334863))

(assert (=> start!53676 true))

(declare-datatypes ((array!36577 0))(
  ( (array!36578 (arr!17563 (Array (_ BitVec 32) (_ BitVec 64))) (size!17927 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36577)

(declare-fun array_inv!13359 (array!36577) Bool)

(assert (=> start!53676 (array_inv!13359 a!2986)))

(declare-fun b!585078 () Bool)

(declare-fun res!372894 () Bool)

(declare-fun e!334866 () Bool)

(assert (=> b!585078 (=> (not res!372894) (not e!334866))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!585078 (= res!372894 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17563 a!2986) index!984) (select (arr!17563 a!2986) j!136))) (not (= (select (arr!17563 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!585079 () Bool)

(declare-fun e!334864 () Bool)

(assert (=> b!585079 (= e!334864 false)))

(declare-datatypes ((SeekEntryResult!6003 0))(
  ( (MissingZero!6003 (index!26239 (_ BitVec 32))) (Found!6003 (index!26240 (_ BitVec 32))) (Intermediate!6003 (undefined!6815 Bool) (index!26241 (_ BitVec 32)) (x!55064 (_ BitVec 32))) (Undefined!6003) (MissingVacant!6003 (index!26242 (_ BitVec 32))) )
))
(declare-fun lt!265735 () SeekEntryResult!6003)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!265734 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36577 (_ BitVec 32)) SeekEntryResult!6003)

(assert (=> b!585079 (= lt!265735 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265734 vacantSpotIndex!68 (select (arr!17563 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!585080 () Bool)

(declare-fun res!372901 () Bool)

(assert (=> b!585080 (=> (not res!372901) (not e!334866))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36577 (_ BitVec 32)) Bool)

(assert (=> b!585080 (= res!372901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585081 () Bool)

(declare-fun res!372896 () Bool)

(assert (=> b!585081 (=> (not res!372896) (not e!334863))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36577 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585081 (= res!372896 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585082 () Bool)

(declare-fun res!372899 () Bool)

(assert (=> b!585082 (=> (not res!372899) (not e!334866))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!585082 (= res!372899 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17563 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17563 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585083 () Bool)

(declare-fun res!372902 () Bool)

(assert (=> b!585083 (=> (not res!372902) (not e!334863))))

(assert (=> b!585083 (= res!372902 (and (= (size!17927 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17927 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17927 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!585084 () Bool)

(declare-fun res!372900 () Bool)

(assert (=> b!585084 (=> (not res!372900) (not e!334863))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585084 (= res!372900 (validKeyInArray!0 k0!1786))))

(declare-fun b!585085 () Bool)

(declare-fun res!372897 () Bool)

(assert (=> b!585085 (=> (not res!372897) (not e!334863))))

(assert (=> b!585085 (= res!372897 (validKeyInArray!0 (select (arr!17563 a!2986) j!136)))))

(declare-fun b!585086 () Bool)

(declare-fun res!372898 () Bool)

(assert (=> b!585086 (=> (not res!372898) (not e!334866))))

(declare-datatypes ((List!11604 0))(
  ( (Nil!11601) (Cons!11600 (h!12645 (_ BitVec 64)) (t!17832 List!11604)) )
))
(declare-fun arrayNoDuplicates!0 (array!36577 (_ BitVec 32) List!11604) Bool)

(assert (=> b!585086 (= res!372898 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11601))))

(declare-fun b!585087 () Bool)

(assert (=> b!585087 (= e!334863 e!334866)))

(declare-fun res!372895 () Bool)

(assert (=> b!585087 (=> (not res!372895) (not e!334866))))

(declare-fun lt!265733 () SeekEntryResult!6003)

(assert (=> b!585087 (= res!372895 (or (= lt!265733 (MissingZero!6003 i!1108)) (= lt!265733 (MissingVacant!6003 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36577 (_ BitVec 32)) SeekEntryResult!6003)

(assert (=> b!585087 (= lt!265733 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!585088 () Bool)

(assert (=> b!585088 (= e!334866 e!334864)))

(declare-fun res!372905 () Bool)

(assert (=> b!585088 (=> (not res!372905) (not e!334864))))

(assert (=> b!585088 (= res!372905 (and (bvsge lt!265734 #b00000000000000000000000000000000) (bvslt lt!265734 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585088 (= lt!265734 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!585089 () Bool)

(declare-fun res!372904 () Bool)

(assert (=> b!585089 (=> (not res!372904) (not e!334866))))

(assert (=> b!585089 (= res!372904 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17563 a!2986) j!136) a!2986 mask!3053) (Found!6003 j!136)))))

(assert (= (and start!53676 res!372903) b!585083))

(assert (= (and b!585083 res!372902) b!585085))

(assert (= (and b!585085 res!372897) b!585084))

(assert (= (and b!585084 res!372900) b!585081))

(assert (= (and b!585081 res!372896) b!585087))

(assert (= (and b!585087 res!372895) b!585080))

(assert (= (and b!585080 res!372901) b!585086))

(assert (= (and b!585086 res!372898) b!585082))

(assert (= (and b!585082 res!372899) b!585089))

(assert (= (and b!585089 res!372904) b!585078))

(assert (= (and b!585078 res!372894) b!585088))

(assert (= (and b!585088 res!372905) b!585079))

(declare-fun m!563361 () Bool)

(assert (=> b!585078 m!563361))

(declare-fun m!563363 () Bool)

(assert (=> b!585078 m!563363))

(assert (=> b!585079 m!563363))

(assert (=> b!585079 m!563363))

(declare-fun m!563365 () Bool)

(assert (=> b!585079 m!563365))

(declare-fun m!563367 () Bool)

(assert (=> b!585084 m!563367))

(declare-fun m!563369 () Bool)

(assert (=> b!585082 m!563369))

(declare-fun m!563371 () Bool)

(assert (=> b!585082 m!563371))

(declare-fun m!563373 () Bool)

(assert (=> b!585082 m!563373))

(declare-fun m!563375 () Bool)

(assert (=> b!585081 m!563375))

(declare-fun m!563377 () Bool)

(assert (=> b!585086 m!563377))

(assert (=> b!585089 m!563363))

(assert (=> b!585089 m!563363))

(declare-fun m!563379 () Bool)

(assert (=> b!585089 m!563379))

(declare-fun m!563381 () Bool)

(assert (=> start!53676 m!563381))

(declare-fun m!563383 () Bool)

(assert (=> start!53676 m!563383))

(assert (=> b!585085 m!563363))

(assert (=> b!585085 m!563363))

(declare-fun m!563385 () Bool)

(assert (=> b!585085 m!563385))

(declare-fun m!563387 () Bool)

(assert (=> b!585080 m!563387))

(declare-fun m!563389 () Bool)

(assert (=> b!585087 m!563389))

(declare-fun m!563391 () Bool)

(assert (=> b!585088 m!563391))

(check-sat (not b!585086) (not b!585079) (not b!585085) (not b!585081) (not b!585088) (not b!585089) (not b!585084) (not b!585087) (not b!585080) (not start!53676))
(check-sat)
