; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53328 () Bool)

(assert start!53328)

(declare-fun b!579887 () Bool)

(declare-fun res!367853 () Bool)

(declare-fun e!333066 () Bool)

(assert (=> b!579887 (=> (not res!367853) (not e!333066))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36243 0))(
  ( (array!36244 (arr!17396 (Array (_ BitVec 32) (_ BitVec 64))) (size!17761 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36243)

(assert (=> b!579887 (= res!367853 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17396 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17396 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!367848 () Bool)

(declare-fun e!333064 () Bool)

(assert (=> start!53328 (=> (not res!367848) (not e!333064))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53328 (= res!367848 (validMask!0 mask!3053))))

(assert (=> start!53328 e!333064))

(assert (=> start!53328 true))

(declare-fun array_inv!13279 (array!36243) Bool)

(assert (=> start!53328 (array_inv!13279 a!2986)))

(declare-fun b!579888 () Bool)

(assert (=> b!579888 (= e!333064 e!333066)))

(declare-fun res!367851 () Bool)

(assert (=> b!579888 (=> (not res!367851) (not e!333066))))

(declare-datatypes ((SeekEntryResult!5833 0))(
  ( (MissingZero!5833 (index!25559 (_ BitVec 32))) (Found!5833 (index!25560 (_ BitVec 32))) (Intermediate!5833 (undefined!6645 Bool) (index!25561 (_ BitVec 32)) (x!54449 (_ BitVec 32))) (Undefined!5833) (MissingVacant!5833 (index!25562 (_ BitVec 32))) )
))
(declare-fun lt!264408 () SeekEntryResult!5833)

(assert (=> b!579888 (= res!367851 (or (= lt!264408 (MissingZero!5833 i!1108)) (= lt!264408 (MissingVacant!5833 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36243 (_ BitVec 32)) SeekEntryResult!5833)

(assert (=> b!579888 (= lt!264408 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!579889 () Bool)

(declare-fun res!367846 () Bool)

(assert (=> b!579889 (=> (not res!367846) (not e!333066))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36243 (_ BitVec 32)) Bool)

(assert (=> b!579889 (= res!367846 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579890 () Bool)

(assert (=> b!579890 (= e!333066 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!264409 () SeekEntryResult!5833)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36243 (_ BitVec 32)) SeekEntryResult!5833)

(assert (=> b!579890 (= lt!264409 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17396 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579891 () Bool)

(declare-fun res!367845 () Bool)

(assert (=> b!579891 (=> (not res!367845) (not e!333064))))

(assert (=> b!579891 (= res!367845 (and (= (size!17761 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17761 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17761 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579892 () Bool)

(declare-fun res!367847 () Bool)

(assert (=> b!579892 (=> (not res!367847) (not e!333064))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579892 (= res!367847 (validKeyInArray!0 k0!1786))))

(declare-fun b!579893 () Bool)

(declare-fun res!367852 () Bool)

(assert (=> b!579893 (=> (not res!367852) (not e!333064))))

(declare-fun arrayContainsKey!0 (array!36243 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579893 (= res!367852 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579894 () Bool)

(declare-fun res!367849 () Bool)

(assert (=> b!579894 (=> (not res!367849) (not e!333064))))

(assert (=> b!579894 (= res!367849 (validKeyInArray!0 (select (arr!17396 a!2986) j!136)))))

(declare-fun b!579895 () Bool)

(declare-fun res!367850 () Bool)

(assert (=> b!579895 (=> (not res!367850) (not e!333066))))

(declare-datatypes ((List!11476 0))(
  ( (Nil!11473) (Cons!11472 (h!12517 (_ BitVec 64)) (t!17695 List!11476)) )
))
(declare-fun arrayNoDuplicates!0 (array!36243 (_ BitVec 32) List!11476) Bool)

(assert (=> b!579895 (= res!367850 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11473))))

(assert (= (and start!53328 res!367848) b!579891))

(assert (= (and b!579891 res!367845) b!579894))

(assert (= (and b!579894 res!367849) b!579892))

(assert (= (and b!579892 res!367847) b!579893))

(assert (= (and b!579893 res!367852) b!579888))

(assert (= (and b!579888 res!367851) b!579889))

(assert (= (and b!579889 res!367846) b!579895))

(assert (= (and b!579895 res!367850) b!579887))

(assert (= (and b!579887 res!367853) b!579890))

(declare-fun m!557965 () Bool)

(assert (=> b!579895 m!557965))

(declare-fun m!557967 () Bool)

(assert (=> b!579887 m!557967))

(declare-fun m!557969 () Bool)

(assert (=> b!579887 m!557969))

(declare-fun m!557971 () Bool)

(assert (=> b!579887 m!557971))

(declare-fun m!557973 () Bool)

(assert (=> b!579892 m!557973))

(declare-fun m!557975 () Bool)

(assert (=> b!579888 m!557975))

(declare-fun m!557977 () Bool)

(assert (=> b!579893 m!557977))

(declare-fun m!557979 () Bool)

(assert (=> b!579890 m!557979))

(assert (=> b!579890 m!557979))

(declare-fun m!557981 () Bool)

(assert (=> b!579890 m!557981))

(declare-fun m!557983 () Bool)

(assert (=> start!53328 m!557983))

(declare-fun m!557985 () Bool)

(assert (=> start!53328 m!557985))

(declare-fun m!557987 () Bool)

(assert (=> b!579889 m!557987))

(assert (=> b!579894 m!557979))

(assert (=> b!579894 m!557979))

(declare-fun m!557989 () Bool)

(assert (=> b!579894 m!557989))

(check-sat (not b!579888) (not b!579892) (not b!579890) (not b!579895) (not start!53328) (not b!579894) (not b!579889) (not b!579893))
(check-sat)
