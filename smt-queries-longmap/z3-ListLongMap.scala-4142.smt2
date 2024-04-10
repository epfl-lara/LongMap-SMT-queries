; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56448 () Bool)

(assert start!56448)

(declare-fun b!625788 () Bool)

(declare-fun res!403800 () Bool)

(declare-fun e!358602 () Bool)

(assert (=> b!625788 (=> (not res!403800) (not e!358602))))

(declare-datatypes ((array!37828 0))(
  ( (array!37829 (arr!18157 (Array (_ BitVec 32) (_ BitVec 64))) (size!18521 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37828)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37828 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625788 (= res!403800 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625790 () Bool)

(declare-fun e!358601 () Bool)

(assert (=> b!625790 (= e!358601 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6597 0))(
  ( (MissingZero!6597 (index!28672 (_ BitVec 32))) (Found!6597 (index!28673 (_ BitVec 32))) (Intermediate!6597 (undefined!7409 Bool) (index!28674 (_ BitVec 32)) (x!57419 (_ BitVec 32))) (Undefined!6597) (MissingVacant!6597 (index!28675 (_ BitVec 32))) )
))
(declare-fun lt!289902 () SeekEntryResult!6597)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37828 (_ BitVec 32)) SeekEntryResult!6597)

(assert (=> b!625790 (= lt!289902 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18157 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!403799 () Bool)

(assert (=> start!56448 (=> (not res!403799) (not e!358602))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56448 (= res!403799 (validMask!0 mask!3053))))

(assert (=> start!56448 e!358602))

(assert (=> start!56448 true))

(declare-fun array_inv!13953 (array!37828) Bool)

(assert (=> start!56448 (array_inv!13953 a!2986)))

(declare-fun b!625789 () Bool)

(declare-fun res!403796 () Bool)

(assert (=> b!625789 (=> (not res!403796) (not e!358601))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!625789 (= res!403796 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18157 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18157 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!625791 () Bool)

(declare-fun res!403794 () Bool)

(assert (=> b!625791 (=> (not res!403794) (not e!358602))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625791 (= res!403794 (validKeyInArray!0 (select (arr!18157 a!2986) j!136)))))

(declare-fun b!625792 () Bool)

(declare-fun res!403798 () Bool)

(assert (=> b!625792 (=> (not res!403798) (not e!358601))))

(declare-datatypes ((List!12198 0))(
  ( (Nil!12195) (Cons!12194 (h!13239 (_ BitVec 64)) (t!18426 List!12198)) )
))
(declare-fun arrayNoDuplicates!0 (array!37828 (_ BitVec 32) List!12198) Bool)

(assert (=> b!625792 (= res!403798 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12195))))

(declare-fun b!625793 () Bool)

(declare-fun res!403802 () Bool)

(assert (=> b!625793 (=> (not res!403802) (not e!358601))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37828 (_ BitVec 32)) Bool)

(assert (=> b!625793 (= res!403802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625794 () Bool)

(assert (=> b!625794 (= e!358602 e!358601)))

(declare-fun res!403797 () Bool)

(assert (=> b!625794 (=> (not res!403797) (not e!358601))))

(declare-fun lt!289903 () SeekEntryResult!6597)

(assert (=> b!625794 (= res!403797 (or (= lt!289903 (MissingZero!6597 i!1108)) (= lt!289903 (MissingVacant!6597 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37828 (_ BitVec 32)) SeekEntryResult!6597)

(assert (=> b!625794 (= lt!289903 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!625795 () Bool)

(declare-fun res!403801 () Bool)

(assert (=> b!625795 (=> (not res!403801) (not e!358602))))

(assert (=> b!625795 (= res!403801 (and (= (size!18521 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18521 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18521 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625796 () Bool)

(declare-fun res!403795 () Bool)

(assert (=> b!625796 (=> (not res!403795) (not e!358602))))

(assert (=> b!625796 (= res!403795 (validKeyInArray!0 k0!1786))))

(assert (= (and start!56448 res!403799) b!625795))

(assert (= (and b!625795 res!403801) b!625791))

(assert (= (and b!625791 res!403794) b!625796))

(assert (= (and b!625796 res!403795) b!625788))

(assert (= (and b!625788 res!403800) b!625794))

(assert (= (and b!625794 res!403797) b!625793))

(assert (= (and b!625793 res!403802) b!625792))

(assert (= (and b!625792 res!403798) b!625789))

(assert (= (and b!625789 res!403796) b!625790))

(declare-fun m!601345 () Bool)

(assert (=> b!625796 m!601345))

(declare-fun m!601347 () Bool)

(assert (=> b!625792 m!601347))

(declare-fun m!601349 () Bool)

(assert (=> start!56448 m!601349))

(declare-fun m!601351 () Bool)

(assert (=> start!56448 m!601351))

(declare-fun m!601353 () Bool)

(assert (=> b!625789 m!601353))

(declare-fun m!601355 () Bool)

(assert (=> b!625789 m!601355))

(declare-fun m!601357 () Bool)

(assert (=> b!625789 m!601357))

(declare-fun m!601359 () Bool)

(assert (=> b!625793 m!601359))

(declare-fun m!601361 () Bool)

(assert (=> b!625788 m!601361))

(declare-fun m!601363 () Bool)

(assert (=> b!625791 m!601363))

(assert (=> b!625791 m!601363))

(declare-fun m!601365 () Bool)

(assert (=> b!625791 m!601365))

(assert (=> b!625790 m!601363))

(assert (=> b!625790 m!601363))

(declare-fun m!601367 () Bool)

(assert (=> b!625790 m!601367))

(declare-fun m!601369 () Bool)

(assert (=> b!625794 m!601369))

(check-sat (not b!625791) (not start!56448) (not b!625788) (not b!625793) (not b!625792) (not b!625796) (not b!625794) (not b!625790))
(check-sat)
