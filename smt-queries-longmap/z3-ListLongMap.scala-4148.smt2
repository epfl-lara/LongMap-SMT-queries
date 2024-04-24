; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56628 () Bool)

(assert start!56628)

(declare-fun b!626915 () Bool)

(declare-fun res!404514 () Bool)

(declare-fun e!359172 () Bool)

(assert (=> b!626915 (=> (not res!404514) (not e!359172))))

(declare-datatypes ((array!37863 0))(
  ( (array!37864 (arr!18169 (Array (_ BitVec 32) (_ BitVec 64))) (size!18533 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37863)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37863 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!626915 (= res!404514 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!404513 () Bool)

(assert (=> start!56628 (=> (not res!404513) (not e!359172))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56628 (= res!404513 (validMask!0 mask!3053))))

(assert (=> start!56628 e!359172))

(assert (=> start!56628 true))

(declare-fun array_inv!14028 (array!37863) Bool)

(assert (=> start!56628 (array_inv!14028 a!2986)))

(declare-fun b!626916 () Bool)

(declare-fun res!404512 () Bool)

(assert (=> b!626916 (=> (not res!404512) (not e!359172))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!626916 (= res!404512 (and (= (size!18533 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18533 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18533 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!626917 () Bool)

(declare-fun e!359171 () Bool)

(assert (=> b!626917 (= e!359171 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6565 0))(
  ( (MissingZero!6565 (index!28544 (_ BitVec 32))) (Found!6565 (index!28545 (_ BitVec 32))) (Intermediate!6565 (undefined!7377 Bool) (index!28546 (_ BitVec 32)) (x!57444 (_ BitVec 32))) (Undefined!6565) (MissingVacant!6565 (index!28547 (_ BitVec 32))) )
))
(declare-fun lt!290239 () SeekEntryResult!6565)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37863 (_ BitVec 32)) SeekEntryResult!6565)

(assert (=> b!626917 (= lt!290239 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18169 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!626918 () Bool)

(assert (=> b!626918 (= e!359172 e!359171)))

(declare-fun res!404510 () Bool)

(assert (=> b!626918 (=> (not res!404510) (not e!359171))))

(declare-fun lt!290238 () SeekEntryResult!6565)

(assert (=> b!626918 (= res!404510 (or (= lt!290238 (MissingZero!6565 i!1108)) (= lt!290238 (MissingVacant!6565 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37863 (_ BitVec 32)) SeekEntryResult!6565)

(assert (=> b!626918 (= lt!290238 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!626919 () Bool)

(declare-fun res!404515 () Bool)

(assert (=> b!626919 (=> (not res!404515) (not e!359171))))

(assert (=> b!626919 (= res!404515 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18169 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18169 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!626920 () Bool)

(declare-fun res!404511 () Bool)

(assert (=> b!626920 (=> (not res!404511) (not e!359172))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!626920 (= res!404511 (validKeyInArray!0 k0!1786))))

(declare-fun b!626921 () Bool)

(declare-fun res!404518 () Bool)

(assert (=> b!626921 (=> (not res!404518) (not e!359171))))

(declare-datatypes ((List!12117 0))(
  ( (Nil!12114) (Cons!12113 (h!13161 (_ BitVec 64)) (t!18337 List!12117)) )
))
(declare-fun arrayNoDuplicates!0 (array!37863 (_ BitVec 32) List!12117) Bool)

(assert (=> b!626921 (= res!404518 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12114))))

(declare-fun b!626922 () Bool)

(declare-fun res!404517 () Bool)

(assert (=> b!626922 (=> (not res!404517) (not e!359171))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37863 (_ BitVec 32)) Bool)

(assert (=> b!626922 (= res!404517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!626923 () Bool)

(declare-fun res!404516 () Bool)

(assert (=> b!626923 (=> (not res!404516) (not e!359172))))

(assert (=> b!626923 (= res!404516 (validKeyInArray!0 (select (arr!18169 a!2986) j!136)))))

(assert (= (and start!56628 res!404513) b!626916))

(assert (= (and b!626916 res!404512) b!626923))

(assert (= (and b!626923 res!404516) b!626920))

(assert (= (and b!626920 res!404511) b!626915))

(assert (= (and b!626915 res!404514) b!626918))

(assert (= (and b!626918 res!404510) b!626922))

(assert (= (and b!626922 res!404517) b!626921))

(assert (= (and b!626921 res!404518) b!626919))

(assert (= (and b!626919 res!404515) b!626917))

(declare-fun m!602563 () Bool)

(assert (=> b!626917 m!602563))

(assert (=> b!626917 m!602563))

(declare-fun m!602565 () Bool)

(assert (=> b!626917 m!602565))

(declare-fun m!602567 () Bool)

(assert (=> b!626918 m!602567))

(declare-fun m!602569 () Bool)

(assert (=> b!626920 m!602569))

(declare-fun m!602571 () Bool)

(assert (=> b!626921 m!602571))

(declare-fun m!602573 () Bool)

(assert (=> b!626922 m!602573))

(declare-fun m!602575 () Bool)

(assert (=> start!56628 m!602575))

(declare-fun m!602577 () Bool)

(assert (=> start!56628 m!602577))

(declare-fun m!602579 () Bool)

(assert (=> b!626915 m!602579))

(declare-fun m!602581 () Bool)

(assert (=> b!626919 m!602581))

(declare-fun m!602583 () Bool)

(assert (=> b!626919 m!602583))

(declare-fun m!602585 () Bool)

(assert (=> b!626919 m!602585))

(assert (=> b!626923 m!602563))

(assert (=> b!626923 m!602563))

(declare-fun m!602587 () Bool)

(assert (=> b!626923 m!602587))

(check-sat (not b!626923) (not b!626920) (not b!626915) (not b!626917) (not start!56628) (not b!626918) (not b!626922) (not b!626921))
(check-sat)
