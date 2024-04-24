; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53952 () Bool)

(assert start!53952)

(declare-fun b!588318 () Bool)

(declare-fun res!375851 () Bool)

(declare-fun e!336003 () Bool)

(assert (=> b!588318 (=> (not res!375851) (not e!336003))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36741 0))(
  ( (array!36742 (arr!17641 (Array (_ BitVec 32) (_ BitVec 64))) (size!18005 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36741)

(assert (=> b!588318 (= res!375851 (and (= (size!18005 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18005 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18005 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!588319 () Bool)

(declare-fun e!335999 () Bool)

(declare-fun e!336002 () Bool)

(assert (=> b!588319 (= e!335999 e!336002)))

(declare-fun res!375852 () Bool)

(assert (=> b!588319 (=> (not res!375852) (not e!336002))))

(declare-datatypes ((SeekEntryResult!6037 0))(
  ( (MissingZero!6037 (index!26378 (_ BitVec 32))) (Found!6037 (index!26379 (_ BitVec 32))) (Intermediate!6037 (undefined!6849 Bool) (index!26380 (_ BitVec 32)) (x!55334 (_ BitVec 32))) (Undefined!6037) (MissingVacant!6037 (index!26381 (_ BitVec 32))) )
))
(declare-fun lt!266745 () SeekEntryResult!6037)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!588319 (= res!375852 (and (= lt!266745 (Found!6037 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17641 a!2986) index!984) (select (arr!17641 a!2986) j!136))) (not (= (select (arr!17641 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36741 (_ BitVec 32)) SeekEntryResult!6037)

(assert (=> b!588319 (= lt!266745 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17641 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588320 () Bool)

(declare-fun res!375849 () Bool)

(assert (=> b!588320 (=> (not res!375849) (not e!335999))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!588320 (= res!375849 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17641 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17641 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!375854 () Bool)

(assert (=> start!53952 (=> (not res!375854) (not e!336003))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53952 (= res!375854 (validMask!0 mask!3053))))

(assert (=> start!53952 e!336003))

(assert (=> start!53952 true))

(declare-fun array_inv!13500 (array!36741) Bool)

(assert (=> start!53952 (array_inv!13500 a!2986)))

(declare-fun b!588321 () Bool)

(declare-fun e!336000 () Bool)

(declare-fun lt!266744 () SeekEntryResult!6037)

(assert (=> b!588321 (= e!336000 (= lt!266745 lt!266744))))

(declare-fun b!588322 () Bool)

(assert (=> b!588322 (= e!336002 (not true))))

(assert (=> b!588322 e!336000))

(declare-fun res!375853 () Bool)

(assert (=> b!588322 (=> (not res!375853) (not e!336000))))

(declare-fun lt!266746 () (_ BitVec 32))

(assert (=> b!588322 (= res!375853 (= lt!266744 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266746 vacantSpotIndex!68 (select (store (arr!17641 a!2986) i!1108 k0!1786) j!136) (array!36742 (store (arr!17641 a!2986) i!1108 k0!1786) (size!18005 a!2986)) mask!3053)))))

(assert (=> b!588322 (= lt!266744 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266746 vacantSpotIndex!68 (select (arr!17641 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18271 0))(
  ( (Unit!18272) )
))
(declare-fun lt!266743 () Unit!18271)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36741 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18271)

(assert (=> b!588322 (= lt!266743 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266746 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588322 (= lt!266746 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!588323 () Bool)

(declare-fun res!375859 () Bool)

(assert (=> b!588323 (=> (not res!375859) (not e!336003))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588323 (= res!375859 (validKeyInArray!0 k0!1786))))

(declare-fun b!588324 () Bool)

(declare-fun res!375858 () Bool)

(assert (=> b!588324 (=> (not res!375858) (not e!335999))))

(declare-datatypes ((List!11589 0))(
  ( (Nil!11586) (Cons!11585 (h!12633 (_ BitVec 64)) (t!17809 List!11589)) )
))
(declare-fun arrayNoDuplicates!0 (array!36741 (_ BitVec 32) List!11589) Bool)

(assert (=> b!588324 (= res!375858 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11586))))

(declare-fun b!588325 () Bool)

(declare-fun res!375855 () Bool)

(assert (=> b!588325 (=> (not res!375855) (not e!336003))))

(assert (=> b!588325 (= res!375855 (validKeyInArray!0 (select (arr!17641 a!2986) j!136)))))

(declare-fun b!588326 () Bool)

(declare-fun res!375857 () Bool)

(assert (=> b!588326 (=> (not res!375857) (not e!336003))))

(declare-fun arrayContainsKey!0 (array!36741 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588326 (= res!375857 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588327 () Bool)

(assert (=> b!588327 (= e!336003 e!335999)))

(declare-fun res!375850 () Bool)

(assert (=> b!588327 (=> (not res!375850) (not e!335999))))

(declare-fun lt!266742 () SeekEntryResult!6037)

(assert (=> b!588327 (= res!375850 (or (= lt!266742 (MissingZero!6037 i!1108)) (= lt!266742 (MissingVacant!6037 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36741 (_ BitVec 32)) SeekEntryResult!6037)

(assert (=> b!588327 (= lt!266742 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!588328 () Bool)

(declare-fun res!375856 () Bool)

(assert (=> b!588328 (=> (not res!375856) (not e!335999))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36741 (_ BitVec 32)) Bool)

(assert (=> b!588328 (= res!375856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53952 res!375854) b!588318))

(assert (= (and b!588318 res!375851) b!588325))

(assert (= (and b!588325 res!375855) b!588323))

(assert (= (and b!588323 res!375859) b!588326))

(assert (= (and b!588326 res!375857) b!588327))

(assert (= (and b!588327 res!375850) b!588328))

(assert (= (and b!588328 res!375856) b!588324))

(assert (= (and b!588324 res!375858) b!588320))

(assert (= (and b!588320 res!375849) b!588319))

(assert (= (and b!588319 res!375852) b!588322))

(assert (= (and b!588322 res!375853) b!588321))

(declare-fun m!566975 () Bool)

(assert (=> b!588320 m!566975))

(declare-fun m!566977 () Bool)

(assert (=> b!588320 m!566977))

(declare-fun m!566979 () Bool)

(assert (=> b!588320 m!566979))

(declare-fun m!566981 () Bool)

(assert (=> b!588325 m!566981))

(assert (=> b!588325 m!566981))

(declare-fun m!566983 () Bool)

(assert (=> b!588325 m!566983))

(declare-fun m!566985 () Bool)

(assert (=> b!588319 m!566985))

(assert (=> b!588319 m!566981))

(assert (=> b!588319 m!566981))

(declare-fun m!566987 () Bool)

(assert (=> b!588319 m!566987))

(declare-fun m!566989 () Bool)

(assert (=> b!588328 m!566989))

(declare-fun m!566991 () Bool)

(assert (=> b!588322 m!566991))

(declare-fun m!566993 () Bool)

(assert (=> b!588322 m!566993))

(assert (=> b!588322 m!566981))

(assert (=> b!588322 m!566977))

(declare-fun m!566995 () Bool)

(assert (=> b!588322 m!566995))

(assert (=> b!588322 m!566993))

(declare-fun m!566997 () Bool)

(assert (=> b!588322 m!566997))

(assert (=> b!588322 m!566981))

(declare-fun m!566999 () Bool)

(assert (=> b!588322 m!566999))

(declare-fun m!567001 () Bool)

(assert (=> b!588326 m!567001))

(declare-fun m!567003 () Bool)

(assert (=> start!53952 m!567003))

(declare-fun m!567005 () Bool)

(assert (=> start!53952 m!567005))

(declare-fun m!567007 () Bool)

(assert (=> b!588324 m!567007))

(declare-fun m!567009 () Bool)

(assert (=> b!588323 m!567009))

(declare-fun m!567011 () Bool)

(assert (=> b!588327 m!567011))

(check-sat (not b!588328) (not b!588323) (not b!588324) (not b!588319) (not b!588322) (not b!588326) (not start!53952) (not b!588327) (not b!588325))
(check-sat)
