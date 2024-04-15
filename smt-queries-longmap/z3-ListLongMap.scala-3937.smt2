; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53616 () Bool)

(assert start!53616)

(declare-fun res!371976 () Bool)

(declare-fun e!334428 () Bool)

(assert (=> start!53616 (=> (not res!371976) (not e!334428))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53616 (= res!371976 (validMask!0 mask!3053))))

(assert (=> start!53616 e!334428))

(assert (=> start!53616 true))

(declare-datatypes ((array!36531 0))(
  ( (array!36532 (arr!17540 (Array (_ BitVec 32) (_ BitVec 64))) (size!17905 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36531)

(declare-fun array_inv!13423 (array!36531) Bool)

(assert (=> start!53616 (array_inv!13423 a!2986)))

(declare-fun b!584015 () Bool)

(declare-fun res!371982 () Bool)

(declare-fun e!334425 () Bool)

(assert (=> b!584015 (=> (not res!371982) (not e!334425))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!584015 (= res!371982 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17540 a!2986) index!984) (select (arr!17540 a!2986) j!136))) (not (= (select (arr!17540 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!584016 () Bool)

(declare-fun res!371977 () Bool)

(assert (=> b!584016 (=> (not res!371977) (not e!334425))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36531 (_ BitVec 32)) Bool)

(assert (=> b!584016 (= res!371977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584017 () Bool)

(declare-fun res!371974 () Bool)

(assert (=> b!584017 (=> (not res!371974) (not e!334425))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5977 0))(
  ( (MissingZero!5977 (index!26135 (_ BitVec 32))) (Found!5977 (index!26136 (_ BitVec 32))) (Intermediate!5977 (undefined!6789 Bool) (index!26137 (_ BitVec 32)) (x!54977 (_ BitVec 32))) (Undefined!5977) (MissingVacant!5977 (index!26138 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36531 (_ BitVec 32)) SeekEntryResult!5977)

(assert (=> b!584017 (= res!371974 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17540 a!2986) j!136) a!2986 mask!3053) (Found!5977 j!136)))))

(declare-fun b!584018 () Bool)

(declare-fun e!334427 () Bool)

(assert (=> b!584018 (= e!334427 false)))

(declare-fun lt!265301 () SeekEntryResult!5977)

(declare-fun lt!265303 () (_ BitVec 32))

(assert (=> b!584018 (= lt!265301 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265303 vacantSpotIndex!68 (select (arr!17540 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584019 () Bool)

(declare-fun res!371983 () Bool)

(assert (=> b!584019 (=> (not res!371983) (not e!334425))))

(declare-datatypes ((List!11620 0))(
  ( (Nil!11617) (Cons!11616 (h!12661 (_ BitVec 64)) (t!17839 List!11620)) )
))
(declare-fun arrayNoDuplicates!0 (array!36531 (_ BitVec 32) List!11620) Bool)

(assert (=> b!584019 (= res!371983 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11617))))

(declare-fun b!584020 () Bool)

(assert (=> b!584020 (= e!334428 e!334425)))

(declare-fun res!371980 () Bool)

(assert (=> b!584020 (=> (not res!371980) (not e!334425))))

(declare-fun lt!265302 () SeekEntryResult!5977)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!584020 (= res!371980 (or (= lt!265302 (MissingZero!5977 i!1108)) (= lt!265302 (MissingVacant!5977 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36531 (_ BitVec 32)) SeekEntryResult!5977)

(assert (=> b!584020 (= lt!265302 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!584021 () Bool)

(declare-fun res!371978 () Bool)

(assert (=> b!584021 (=> (not res!371978) (not e!334425))))

(assert (=> b!584021 (= res!371978 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17540 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17540 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!584022 () Bool)

(declare-fun res!371979 () Bool)

(assert (=> b!584022 (=> (not res!371979) (not e!334428))))

(declare-fun arrayContainsKey!0 (array!36531 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584022 (= res!371979 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!584023 () Bool)

(declare-fun res!371973 () Bool)

(assert (=> b!584023 (=> (not res!371973) (not e!334428))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584023 (= res!371973 (validKeyInArray!0 k0!1786))))

(declare-fun b!584024 () Bool)

(declare-fun res!371981 () Bool)

(assert (=> b!584024 (=> (not res!371981) (not e!334428))))

(assert (=> b!584024 (= res!371981 (and (= (size!17905 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17905 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17905 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584025 () Bool)

(declare-fun res!371984 () Bool)

(assert (=> b!584025 (=> (not res!371984) (not e!334428))))

(assert (=> b!584025 (= res!371984 (validKeyInArray!0 (select (arr!17540 a!2986) j!136)))))

(declare-fun b!584026 () Bool)

(assert (=> b!584026 (= e!334425 e!334427)))

(declare-fun res!371975 () Bool)

(assert (=> b!584026 (=> (not res!371975) (not e!334427))))

(assert (=> b!584026 (= res!371975 (and (bvsge lt!265303 #b00000000000000000000000000000000) (bvslt lt!265303 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584026 (= lt!265303 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!53616 res!371976) b!584024))

(assert (= (and b!584024 res!371981) b!584025))

(assert (= (and b!584025 res!371984) b!584023))

(assert (= (and b!584023 res!371973) b!584022))

(assert (= (and b!584022 res!371979) b!584020))

(assert (= (and b!584020 res!371980) b!584016))

(assert (= (and b!584016 res!371977) b!584019))

(assert (= (and b!584019 res!371983) b!584021))

(assert (= (and b!584021 res!371978) b!584017))

(assert (= (and b!584017 res!371974) b!584015))

(assert (= (and b!584015 res!371982) b!584026))

(assert (= (and b!584026 res!371975) b!584018))

(declare-fun m!561871 () Bool)

(assert (=> b!584023 m!561871))

(declare-fun m!561873 () Bool)

(assert (=> b!584018 m!561873))

(assert (=> b!584018 m!561873))

(declare-fun m!561875 () Bool)

(assert (=> b!584018 m!561875))

(declare-fun m!561877 () Bool)

(assert (=> b!584015 m!561877))

(assert (=> b!584015 m!561873))

(assert (=> b!584017 m!561873))

(assert (=> b!584017 m!561873))

(declare-fun m!561879 () Bool)

(assert (=> b!584017 m!561879))

(declare-fun m!561881 () Bool)

(assert (=> start!53616 m!561881))

(declare-fun m!561883 () Bool)

(assert (=> start!53616 m!561883))

(assert (=> b!584025 m!561873))

(assert (=> b!584025 m!561873))

(declare-fun m!561885 () Bool)

(assert (=> b!584025 m!561885))

(declare-fun m!561887 () Bool)

(assert (=> b!584022 m!561887))

(declare-fun m!561889 () Bool)

(assert (=> b!584019 m!561889))

(declare-fun m!561891 () Bool)

(assert (=> b!584020 m!561891))

(declare-fun m!561893 () Bool)

(assert (=> b!584026 m!561893))

(declare-fun m!561895 () Bool)

(assert (=> b!584016 m!561895))

(declare-fun m!561897 () Bool)

(assert (=> b!584021 m!561897))

(declare-fun m!561899 () Bool)

(assert (=> b!584021 m!561899))

(declare-fun m!561901 () Bool)

(assert (=> b!584021 m!561901))

(check-sat (not b!584026) (not b!584022) (not b!584017) (not b!584018) (not b!584019) (not b!584016) (not b!584023) (not b!584020) (not b!584025) (not start!53616))
(check-sat)
