; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53808 () Bool)

(assert start!53808)

(declare-fun res!374399 () Bool)

(declare-fun e!335403 () Bool)

(assert (=> start!53808 (=> (not res!374399) (not e!335403))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53808 (= res!374399 (validMask!0 mask!3053))))

(assert (=> start!53808 e!335403))

(assert (=> start!53808 true))

(declare-datatypes ((array!36654 0))(
  ( (array!36655 (arr!17599 (Array (_ BitVec 32) (_ BitVec 64))) (size!17963 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36654)

(declare-fun array_inv!13458 (array!36654) Bool)

(assert (=> start!53808 (array_inv!13458 a!2986)))

(declare-fun b!586680 () Bool)

(declare-fun res!374401 () Bool)

(assert (=> b!586680 (=> (not res!374401) (not e!335403))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!586680 (= res!374401 (and (= (size!17963 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17963 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17963 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586681 () Bool)

(declare-fun res!374395 () Bool)

(assert (=> b!586681 (=> (not res!374395) (not e!335403))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586681 (= res!374395 (validKeyInArray!0 k0!1786))))

(declare-fun b!586682 () Bool)

(declare-fun e!335402 () Bool)

(assert (=> b!586682 (= e!335403 e!335402)))

(declare-fun res!374393 () Bool)

(assert (=> b!586682 (=> (not res!374393) (not e!335402))))

(declare-datatypes ((SeekEntryResult!5995 0))(
  ( (MissingZero!5995 (index!26207 (_ BitVec 32))) (Found!5995 (index!26208 (_ BitVec 32))) (Intermediate!5995 (undefined!6807 Bool) (index!26209 (_ BitVec 32)) (x!55171 (_ BitVec 32))) (Undefined!5995) (MissingVacant!5995 (index!26210 (_ BitVec 32))) )
))
(declare-fun lt!266205 () SeekEntryResult!5995)

(assert (=> b!586682 (= res!374393 (or (= lt!266205 (MissingZero!5995 i!1108)) (= lt!266205 (MissingVacant!5995 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36654 (_ BitVec 32)) SeekEntryResult!5995)

(assert (=> b!586682 (= lt!266205 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!586683 () Bool)

(declare-fun res!374394 () Bool)

(assert (=> b!586683 (=> (not res!374394) (not e!335402))))

(declare-datatypes ((List!11547 0))(
  ( (Nil!11544) (Cons!11543 (h!12591 (_ BitVec 64)) (t!17767 List!11547)) )
))
(declare-fun arrayNoDuplicates!0 (array!36654 (_ BitVec 32) List!11547) Bool)

(assert (=> b!586683 (= res!374394 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11544))))

(declare-fun b!586684 () Bool)

(declare-fun res!374392 () Bool)

(assert (=> b!586684 (=> (not res!374392) (not e!335403))))

(assert (=> b!586684 (= res!374392 (validKeyInArray!0 (select (arr!17599 a!2986) j!136)))))

(declare-fun b!586685 () Bool)

(assert (=> b!586685 (= e!335402 (not (bvsge mask!3053 #b00000000000000000000000000000000)))))

(declare-fun lt!266206 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36654 (_ BitVec 32)) SeekEntryResult!5995)

(assert (=> b!586685 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266206 vacantSpotIndex!68 (select (arr!17599 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266206 vacantSpotIndex!68 (select (store (arr!17599 a!2986) i!1108 k0!1786) j!136) (array!36655 (store (arr!17599 a!2986) i!1108 k0!1786) (size!17963 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18187 0))(
  ( (Unit!18188) )
))
(declare-fun lt!266204 () Unit!18187)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36654 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18187)

(assert (=> b!586685 (= lt!266204 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266206 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586685 (= lt!266206 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!586686 () Bool)

(declare-fun res!374400 () Bool)

(assert (=> b!586686 (=> (not res!374400) (not e!335402))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36654 (_ BitVec 32)) Bool)

(assert (=> b!586686 (= res!374400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586687 () Bool)

(declare-fun res!374396 () Bool)

(assert (=> b!586687 (=> (not res!374396) (not e!335402))))

(assert (=> b!586687 (= res!374396 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17599 a!2986) j!136) a!2986 mask!3053) (Found!5995 j!136)))))

(declare-fun b!586688 () Bool)

(declare-fun res!374397 () Bool)

(assert (=> b!586688 (=> (not res!374397) (not e!335402))))

(assert (=> b!586688 (= res!374397 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17599 a!2986) index!984) (select (arr!17599 a!2986) j!136))) (not (= (select (arr!17599 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!586689 () Bool)

(declare-fun res!374398 () Bool)

(assert (=> b!586689 (=> (not res!374398) (not e!335403))))

(declare-fun arrayContainsKey!0 (array!36654 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586689 (= res!374398 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586690 () Bool)

(declare-fun res!374391 () Bool)

(assert (=> b!586690 (=> (not res!374391) (not e!335402))))

(assert (=> b!586690 (= res!374391 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17599 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17599 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53808 res!374399) b!586680))

(assert (= (and b!586680 res!374401) b!586684))

(assert (= (and b!586684 res!374392) b!586681))

(assert (= (and b!586681 res!374395) b!586689))

(assert (= (and b!586689 res!374398) b!586682))

(assert (= (and b!586682 res!374393) b!586686))

(assert (= (and b!586686 res!374400) b!586683))

(assert (= (and b!586683 res!374394) b!586690))

(assert (= (and b!586690 res!374391) b!586687))

(assert (= (and b!586687 res!374396) b!586688))

(assert (= (and b!586688 res!374397) b!586685))

(declare-fun m!565193 () Bool)

(assert (=> b!586686 m!565193))

(declare-fun m!565195 () Bool)

(assert (=> b!586689 m!565195))

(declare-fun m!565197 () Bool)

(assert (=> b!586687 m!565197))

(assert (=> b!586687 m!565197))

(declare-fun m!565199 () Bool)

(assert (=> b!586687 m!565199))

(declare-fun m!565201 () Bool)

(assert (=> b!586690 m!565201))

(declare-fun m!565203 () Bool)

(assert (=> b!586690 m!565203))

(declare-fun m!565205 () Bool)

(assert (=> b!586690 m!565205))

(declare-fun m!565207 () Bool)

(assert (=> b!586682 m!565207))

(declare-fun m!565209 () Bool)

(assert (=> start!53808 m!565209))

(declare-fun m!565211 () Bool)

(assert (=> start!53808 m!565211))

(declare-fun m!565213 () Bool)

(assert (=> b!586681 m!565213))

(declare-fun m!565215 () Bool)

(assert (=> b!586683 m!565215))

(declare-fun m!565217 () Bool)

(assert (=> b!586685 m!565217))

(declare-fun m!565219 () Bool)

(assert (=> b!586685 m!565219))

(assert (=> b!586685 m!565197))

(assert (=> b!586685 m!565203))

(declare-fun m!565221 () Bool)

(assert (=> b!586685 m!565221))

(assert (=> b!586685 m!565219))

(declare-fun m!565223 () Bool)

(assert (=> b!586685 m!565223))

(assert (=> b!586685 m!565197))

(declare-fun m!565225 () Bool)

(assert (=> b!586685 m!565225))

(assert (=> b!586684 m!565197))

(assert (=> b!586684 m!565197))

(declare-fun m!565227 () Bool)

(assert (=> b!586684 m!565227))

(declare-fun m!565229 () Bool)

(assert (=> b!586688 m!565229))

(assert (=> b!586688 m!565197))

(check-sat (not b!586686) (not b!586682) (not b!586689) (not start!53808) (not b!586687) (not b!586685) (not b!586683) (not b!586684) (not b!586681))
(check-sat)
