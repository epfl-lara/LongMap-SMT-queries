; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53778 () Bool)

(assert start!53778)

(declare-fun b!586185 () Bool)

(declare-fun res!373904 () Bool)

(declare-fun e!335268 () Bool)

(assert (=> b!586185 (=> (not res!373904) (not e!335268))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36624 0))(
  ( (array!36625 (arr!17584 (Array (_ BitVec 32) (_ BitVec 64))) (size!17948 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36624)

(declare-datatypes ((SeekEntryResult!5980 0))(
  ( (MissingZero!5980 (index!26147 (_ BitVec 32))) (Found!5980 (index!26148 (_ BitVec 32))) (Intermediate!5980 (undefined!6792 Bool) (index!26149 (_ BitVec 32)) (x!55116 (_ BitVec 32))) (Undefined!5980) (MissingVacant!5980 (index!26150 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36624 (_ BitVec 32)) SeekEntryResult!5980)

(assert (=> b!586185 (= res!373904 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17584 a!2986) j!136) a!2986 mask!3053) (Found!5980 j!136)))))

(declare-fun b!586186 () Bool)

(declare-fun res!373902 () Bool)

(assert (=> b!586186 (=> (not res!373902) (not e!335268))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!586186 (= res!373902 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17584 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17584 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!373903 () Bool)

(declare-fun e!335266 () Bool)

(assert (=> start!53778 (=> (not res!373903) (not e!335266))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53778 (= res!373903 (validMask!0 mask!3053))))

(assert (=> start!53778 e!335266))

(assert (=> start!53778 true))

(declare-fun array_inv!13443 (array!36624) Bool)

(assert (=> start!53778 (array_inv!13443 a!2986)))

(declare-fun b!586187 () Bool)

(declare-fun res!373900 () Bool)

(assert (=> b!586187 (=> (not res!373900) (not e!335266))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586187 (= res!373900 (validKeyInArray!0 (select (arr!17584 a!2986) j!136)))))

(declare-fun b!586188 () Bool)

(assert (=> b!586188 (= e!335268 (not true))))

(declare-fun lt!266071 () (_ BitVec 32))

(assert (=> b!586188 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266071 vacantSpotIndex!68 (select (arr!17584 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266071 vacantSpotIndex!68 (select (store (arr!17584 a!2986) i!1108 k0!1786) j!136) (array!36625 (store (arr!17584 a!2986) i!1108 k0!1786) (size!17948 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18157 0))(
  ( (Unit!18158) )
))
(declare-fun lt!266069 () Unit!18157)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36624 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18157)

(assert (=> b!586188 (= lt!266069 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266071 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586188 (= lt!266071 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!586189 () Bool)

(declare-fun res!373897 () Bool)

(assert (=> b!586189 (=> (not res!373897) (not e!335268))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36624 (_ BitVec 32)) Bool)

(assert (=> b!586189 (= res!373897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586190 () Bool)

(declare-fun res!373905 () Bool)

(assert (=> b!586190 (=> (not res!373905) (not e!335268))))

(declare-datatypes ((List!11532 0))(
  ( (Nil!11529) (Cons!11528 (h!12576 (_ BitVec 64)) (t!17752 List!11532)) )
))
(declare-fun arrayNoDuplicates!0 (array!36624 (_ BitVec 32) List!11532) Bool)

(assert (=> b!586190 (= res!373905 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11529))))

(declare-fun b!586191 () Bool)

(assert (=> b!586191 (= e!335266 e!335268)))

(declare-fun res!373901 () Bool)

(assert (=> b!586191 (=> (not res!373901) (not e!335268))))

(declare-fun lt!266070 () SeekEntryResult!5980)

(assert (=> b!586191 (= res!373901 (or (= lt!266070 (MissingZero!5980 i!1108)) (= lt!266070 (MissingVacant!5980 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36624 (_ BitVec 32)) SeekEntryResult!5980)

(assert (=> b!586191 (= lt!266070 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!586192 () Bool)

(declare-fun res!373906 () Bool)

(assert (=> b!586192 (=> (not res!373906) (not e!335266))))

(declare-fun arrayContainsKey!0 (array!36624 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586192 (= res!373906 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586193 () Bool)

(declare-fun res!373896 () Bool)

(assert (=> b!586193 (=> (not res!373896) (not e!335266))))

(assert (=> b!586193 (= res!373896 (and (= (size!17948 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17948 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17948 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586194 () Bool)

(declare-fun res!373899 () Bool)

(assert (=> b!586194 (=> (not res!373899) (not e!335266))))

(assert (=> b!586194 (= res!373899 (validKeyInArray!0 k0!1786))))

(declare-fun b!586195 () Bool)

(declare-fun res!373898 () Bool)

(assert (=> b!586195 (=> (not res!373898) (not e!335268))))

(assert (=> b!586195 (= res!373898 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17584 a!2986) index!984) (select (arr!17584 a!2986) j!136))) (not (= (select (arr!17584 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (= (and start!53778 res!373903) b!586193))

(assert (= (and b!586193 res!373896) b!586187))

(assert (= (and b!586187 res!373900) b!586194))

(assert (= (and b!586194 res!373899) b!586192))

(assert (= (and b!586192 res!373906) b!586191))

(assert (= (and b!586191 res!373901) b!586189))

(assert (= (and b!586189 res!373897) b!586190))

(assert (= (and b!586190 res!373905) b!586186))

(assert (= (and b!586186 res!373902) b!586185))

(assert (= (and b!586185 res!373904) b!586195))

(assert (= (and b!586195 res!373898) b!586188))

(declare-fun m!564623 () Bool)

(assert (=> b!586190 m!564623))

(declare-fun m!564625 () Bool)

(assert (=> b!586189 m!564625))

(declare-fun m!564627 () Bool)

(assert (=> b!586185 m!564627))

(assert (=> b!586185 m!564627))

(declare-fun m!564629 () Bool)

(assert (=> b!586185 m!564629))

(declare-fun m!564631 () Bool)

(assert (=> b!586195 m!564631))

(assert (=> b!586195 m!564627))

(declare-fun m!564633 () Bool)

(assert (=> start!53778 m!564633))

(declare-fun m!564635 () Bool)

(assert (=> start!53778 m!564635))

(declare-fun m!564637 () Bool)

(assert (=> b!586188 m!564637))

(declare-fun m!564639 () Bool)

(assert (=> b!586188 m!564639))

(assert (=> b!586188 m!564639))

(declare-fun m!564641 () Bool)

(assert (=> b!586188 m!564641))

(assert (=> b!586188 m!564627))

(declare-fun m!564643 () Bool)

(assert (=> b!586188 m!564643))

(declare-fun m!564645 () Bool)

(assert (=> b!586188 m!564645))

(assert (=> b!586188 m!564627))

(declare-fun m!564647 () Bool)

(assert (=> b!586188 m!564647))

(assert (=> b!586187 m!564627))

(assert (=> b!586187 m!564627))

(declare-fun m!564649 () Bool)

(assert (=> b!586187 m!564649))

(declare-fun m!564651 () Bool)

(assert (=> b!586192 m!564651))

(declare-fun m!564653 () Bool)

(assert (=> b!586191 m!564653))

(declare-fun m!564655 () Bool)

(assert (=> b!586194 m!564655))

(declare-fun m!564657 () Bool)

(assert (=> b!586186 m!564657))

(assert (=> b!586186 m!564643))

(declare-fun m!564659 () Bool)

(assert (=> b!586186 m!564659))

(check-sat (not start!53778) (not b!586189) (not b!586187) (not b!586192) (not b!586190) (not b!586185) (not b!586191) (not b!586194) (not b!586188))
(check-sat)
