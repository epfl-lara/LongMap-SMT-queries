; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54888 () Bool)

(assert start!54888)

(declare-fun b!600836 () Bool)

(declare-fun e!343520 () Bool)

(declare-fun e!343524 () Bool)

(assert (=> b!600836 (= e!343520 e!343524)))

(declare-fun res!385803 () Bool)

(assert (=> b!600836 (=> (not res!385803) (not e!343524))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37137 0))(
  ( (array!37138 (arr!17828 (Array (_ BitVec 32) (_ BitVec 64))) (size!18193 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37137)

(assert (=> b!600836 (= res!385803 (= (select (store (arr!17828 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!273335 () array!37137)

(assert (=> b!600836 (= lt!273335 (array!37138 (store (arr!17828 a!2986) i!1108 k0!1786) (size!18193 a!2986)))))

(declare-fun b!600837 () Bool)

(declare-fun e!343526 () Bool)

(declare-datatypes ((SeekEntryResult!6265 0))(
  ( (MissingZero!6265 (index!27317 (_ BitVec 32))) (Found!6265 (index!27318 (_ BitVec 32))) (Intermediate!6265 (undefined!7077 Bool) (index!27319 (_ BitVec 32)) (x!56123 (_ BitVec 32))) (Undefined!6265) (MissingVacant!6265 (index!27320 (_ BitVec 32))) )
))
(declare-fun lt!273327 () SeekEntryResult!6265)

(declare-fun lt!273329 () SeekEntryResult!6265)

(assert (=> b!600837 (= e!343526 (= lt!273327 lt!273329))))

(declare-fun b!600838 () Bool)

(declare-fun res!385810 () Bool)

(assert (=> b!600838 (=> (not res!385810) (not e!343520))))

(declare-datatypes ((List!11908 0))(
  ( (Nil!11905) (Cons!11904 (h!12949 (_ BitVec 64)) (t!18127 List!11908)) )
))
(declare-fun arrayNoDuplicates!0 (array!37137 (_ BitVec 32) List!11908) Bool)

(assert (=> b!600838 (= res!385810 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11905))))

(declare-fun b!600839 () Bool)

(declare-datatypes ((Unit!18972 0))(
  ( (Unit!18973) )
))
(declare-fun e!343519 () Unit!18972)

(declare-fun Unit!18974 () Unit!18972)

(assert (=> b!600839 (= e!343519 Unit!18974)))

(declare-fun b!600840 () Bool)

(declare-fun e!343518 () Unit!18972)

(declare-fun Unit!18975 () Unit!18972)

(assert (=> b!600840 (= e!343518 Unit!18975)))

(declare-fun b!600841 () Bool)

(declare-fun e!343523 () Bool)

(declare-fun e!343522 () Bool)

(assert (=> b!600841 (= e!343523 e!343522)))

(declare-fun res!385814 () Bool)

(assert (=> b!600841 (=> (not res!385814) (not e!343522))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37137 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!600841 (= res!385814 (arrayContainsKey!0 lt!273335 (select (arr!17828 a!2986) j!136) j!136))))

(declare-fun b!600842 () Bool)

(declare-fun e!343516 () Bool)

(assert (=> b!600842 (= e!343516 e!343520)))

(declare-fun res!385805 () Bool)

(assert (=> b!600842 (=> (not res!385805) (not e!343520))))

(declare-fun lt!273332 () SeekEntryResult!6265)

(assert (=> b!600842 (= res!385805 (or (= lt!273332 (MissingZero!6265 i!1108)) (= lt!273332 (MissingVacant!6265 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37137 (_ BitVec 32)) SeekEntryResult!6265)

(assert (=> b!600842 (= lt!273332 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!600843 () Bool)

(declare-fun e!343525 () Bool)

(declare-fun e!343517 () Bool)

(assert (=> b!600843 (= e!343525 (not e!343517))))

(declare-fun res!385802 () Bool)

(assert (=> b!600843 (=> res!385802 e!343517)))

(declare-fun lt!273328 () SeekEntryResult!6265)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!600843 (= res!385802 (not (= lt!273328 (Found!6265 index!984))))))

(declare-fun lt!273330 () Unit!18972)

(assert (=> b!600843 (= lt!273330 e!343519)))

(declare-fun c!67886 () Bool)

(assert (=> b!600843 (= c!67886 (= lt!273328 Undefined!6265))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!273337 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37137 (_ BitVec 32)) SeekEntryResult!6265)

(assert (=> b!600843 (= lt!273328 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273337 lt!273335 mask!3053))))

(assert (=> b!600843 e!343526))

(declare-fun res!385806 () Bool)

(assert (=> b!600843 (=> (not res!385806) (not e!343526))))

(declare-fun lt!273331 () (_ BitVec 32))

(assert (=> b!600843 (= res!385806 (= lt!273329 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273331 vacantSpotIndex!68 lt!273337 lt!273335 mask!3053)))))

(assert (=> b!600843 (= lt!273329 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273331 vacantSpotIndex!68 (select (arr!17828 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!600843 (= lt!273337 (select (store (arr!17828 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!273326 () Unit!18972)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37137 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18972)

(assert (=> b!600843 (= lt!273326 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273331 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!600843 (= lt!273331 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!600844 () Bool)

(declare-fun e!343527 () Bool)

(assert (=> b!600844 (= e!343527 e!343523)))

(declare-fun res!385811 () Bool)

(assert (=> b!600844 (=> res!385811 e!343523)))

(declare-fun lt!273340 () (_ BitVec 64))

(assert (=> b!600844 (= res!385811 (or (not (= (select (arr!17828 a!2986) j!136) lt!273337)) (not (= (select (arr!17828 a!2986) j!136) lt!273340)) (bvsge j!136 index!984)))))

(declare-fun b!600845 () Bool)

(declare-fun res!385800 () Bool)

(assert (=> b!600845 (=> (not res!385800) (not e!343516))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!600845 (= res!385800 (validKeyInArray!0 k0!1786))))

(declare-fun b!600846 () Bool)

(assert (=> b!600846 (= e!343522 (arrayContainsKey!0 lt!273335 (select (arr!17828 a!2986) j!136) index!984))))

(declare-fun res!385813 () Bool)

(assert (=> start!54888 (=> (not res!385813) (not e!343516))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54888 (= res!385813 (validMask!0 mask!3053))))

(assert (=> start!54888 e!343516))

(assert (=> start!54888 true))

(declare-fun array_inv!13711 (array!37137) Bool)

(assert (=> start!54888 (array_inv!13711 a!2986)))

(declare-fun b!600847 () Bool)

(assert (=> b!600847 (= e!343524 e!343525)))

(declare-fun res!385804 () Bool)

(assert (=> b!600847 (=> (not res!385804) (not e!343525))))

(assert (=> b!600847 (= res!385804 (and (= lt!273327 (Found!6265 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17828 a!2986) index!984) (select (arr!17828 a!2986) j!136))) (not (= (select (arr!17828 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!600847 (= lt!273327 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17828 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!600848 () Bool)

(declare-fun res!385808 () Bool)

(assert (=> b!600848 (=> (not res!385808) (not e!343516))))

(assert (=> b!600848 (= res!385808 (validKeyInArray!0 (select (arr!17828 a!2986) j!136)))))

(declare-fun b!600849 () Bool)

(declare-fun Unit!18976 () Unit!18972)

(assert (=> b!600849 (= e!343518 Unit!18976)))

(declare-fun lt!273336 () Unit!18972)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37137 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18972)

(assert (=> b!600849 (= lt!273336 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273335 (select (arr!17828 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!600849 (arrayContainsKey!0 lt!273335 (select (arr!17828 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!273333 () Unit!18972)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37137 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11908) Unit!18972)

(assert (=> b!600849 (= lt!273333 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11905))))

(assert (=> b!600849 (arrayNoDuplicates!0 lt!273335 #b00000000000000000000000000000000 Nil!11905)))

(declare-fun lt!273334 () Unit!18972)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37137 (_ BitVec 32) (_ BitVec 32)) Unit!18972)

(assert (=> b!600849 (= lt!273334 (lemmaNoDuplicateFromThenFromBigger!0 lt!273335 #b00000000000000000000000000000000 j!136))))

(assert (=> b!600849 (arrayNoDuplicates!0 lt!273335 j!136 Nil!11905)))

(declare-fun lt!273338 () Unit!18972)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37137 (_ BitVec 64) (_ BitVec 32) List!11908) Unit!18972)

(assert (=> b!600849 (= lt!273338 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!273335 (select (arr!17828 a!2986) j!136) j!136 Nil!11905))))

(assert (=> b!600849 false))

(declare-fun b!600850 () Bool)

(declare-fun res!385807 () Bool)

(assert (=> b!600850 (=> (not res!385807) (not e!343520))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37137 (_ BitVec 32)) Bool)

(assert (=> b!600850 (= res!385807 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!600851 () Bool)

(declare-fun Unit!18977 () Unit!18972)

(assert (=> b!600851 (= e!343519 Unit!18977)))

(assert (=> b!600851 false))

(declare-fun b!600852 () Bool)

(declare-fun res!385809 () Bool)

(assert (=> b!600852 (=> (not res!385809) (not e!343516))))

(assert (=> b!600852 (= res!385809 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!600853 () Bool)

(declare-fun e!343515 () Bool)

(assert (=> b!600853 (= e!343515 true)))

(declare-fun lt!273339 () Unit!18972)

(assert (=> b!600853 (= lt!273339 e!343518)))

(declare-fun c!67887 () Bool)

(assert (=> b!600853 (= c!67887 (bvslt j!136 index!984))))

(declare-fun b!600854 () Bool)

(assert (=> b!600854 (= e!343517 e!343515)))

(declare-fun res!385799 () Bool)

(assert (=> b!600854 (=> res!385799 e!343515)))

(assert (=> b!600854 (= res!385799 (or (not (= (select (arr!17828 a!2986) j!136) lt!273337)) (not (= (select (arr!17828 a!2986) j!136) lt!273340))))))

(assert (=> b!600854 e!343527))

(declare-fun res!385812 () Bool)

(assert (=> b!600854 (=> (not res!385812) (not e!343527))))

(assert (=> b!600854 (= res!385812 (= lt!273340 (select (arr!17828 a!2986) j!136)))))

(assert (=> b!600854 (= lt!273340 (select (store (arr!17828 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!600855 () Bool)

(declare-fun res!385798 () Bool)

(assert (=> b!600855 (=> (not res!385798) (not e!343520))))

(assert (=> b!600855 (= res!385798 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17828 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!600856 () Bool)

(declare-fun res!385801 () Bool)

(assert (=> b!600856 (=> (not res!385801) (not e!343516))))

(assert (=> b!600856 (= res!385801 (and (= (size!18193 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18193 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18193 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!54888 res!385813) b!600856))

(assert (= (and b!600856 res!385801) b!600848))

(assert (= (and b!600848 res!385808) b!600845))

(assert (= (and b!600845 res!385800) b!600852))

(assert (= (and b!600852 res!385809) b!600842))

(assert (= (and b!600842 res!385805) b!600850))

(assert (= (and b!600850 res!385807) b!600838))

(assert (= (and b!600838 res!385810) b!600855))

(assert (= (and b!600855 res!385798) b!600836))

(assert (= (and b!600836 res!385803) b!600847))

(assert (= (and b!600847 res!385804) b!600843))

(assert (= (and b!600843 res!385806) b!600837))

(assert (= (and b!600843 c!67886) b!600851))

(assert (= (and b!600843 (not c!67886)) b!600839))

(assert (= (and b!600843 (not res!385802)) b!600854))

(assert (= (and b!600854 res!385812) b!600844))

(assert (= (and b!600844 (not res!385811)) b!600841))

(assert (= (and b!600841 res!385814) b!600846))

(assert (= (and b!600854 (not res!385799)) b!600853))

(assert (= (and b!600853 c!67887) b!600849))

(assert (= (and b!600853 (not c!67887)) b!600840))

(declare-fun m!577537 () Bool)

(assert (=> start!54888 m!577537))

(declare-fun m!577539 () Bool)

(assert (=> start!54888 m!577539))

(declare-fun m!577541 () Bool)

(assert (=> b!600846 m!577541))

(assert (=> b!600846 m!577541))

(declare-fun m!577543 () Bool)

(assert (=> b!600846 m!577543))

(assert (=> b!600844 m!577541))

(declare-fun m!577545 () Bool)

(assert (=> b!600855 m!577545))

(declare-fun m!577547 () Bool)

(assert (=> b!600850 m!577547))

(declare-fun m!577549 () Bool)

(assert (=> b!600847 m!577549))

(assert (=> b!600847 m!577541))

(assert (=> b!600847 m!577541))

(declare-fun m!577551 () Bool)

(assert (=> b!600847 m!577551))

(declare-fun m!577553 () Bool)

(assert (=> b!600843 m!577553))

(declare-fun m!577555 () Bool)

(assert (=> b!600843 m!577555))

(assert (=> b!600843 m!577541))

(declare-fun m!577557 () Bool)

(assert (=> b!600843 m!577557))

(declare-fun m!577559 () Bool)

(assert (=> b!600843 m!577559))

(declare-fun m!577561 () Bool)

(assert (=> b!600843 m!577561))

(assert (=> b!600843 m!577541))

(declare-fun m!577563 () Bool)

(assert (=> b!600843 m!577563))

(declare-fun m!577565 () Bool)

(assert (=> b!600843 m!577565))

(declare-fun m!577567 () Bool)

(assert (=> b!600845 m!577567))

(assert (=> b!600836 m!577559))

(declare-fun m!577569 () Bool)

(assert (=> b!600836 m!577569))

(declare-fun m!577571 () Bool)

(assert (=> b!600842 m!577571))

(declare-fun m!577573 () Bool)

(assert (=> b!600849 m!577573))

(assert (=> b!600849 m!577541))

(assert (=> b!600849 m!577541))

(declare-fun m!577575 () Bool)

(assert (=> b!600849 m!577575))

(assert (=> b!600849 m!577541))

(declare-fun m!577577 () Bool)

(assert (=> b!600849 m!577577))

(declare-fun m!577579 () Bool)

(assert (=> b!600849 m!577579))

(declare-fun m!577581 () Bool)

(assert (=> b!600849 m!577581))

(assert (=> b!600849 m!577541))

(declare-fun m!577583 () Bool)

(assert (=> b!600849 m!577583))

(declare-fun m!577585 () Bool)

(assert (=> b!600849 m!577585))

(declare-fun m!577587 () Bool)

(assert (=> b!600838 m!577587))

(assert (=> b!600854 m!577541))

(assert (=> b!600854 m!577559))

(declare-fun m!577589 () Bool)

(assert (=> b!600854 m!577589))

(assert (=> b!600848 m!577541))

(assert (=> b!600848 m!577541))

(declare-fun m!577591 () Bool)

(assert (=> b!600848 m!577591))

(assert (=> b!600841 m!577541))

(assert (=> b!600841 m!577541))

(declare-fun m!577593 () Bool)

(assert (=> b!600841 m!577593))

(declare-fun m!577595 () Bool)

(assert (=> b!600852 m!577595))

(check-sat (not b!600850) (not b!600846) (not b!600845) (not b!600843) (not b!600841) (not start!54888) (not b!600838) (not b!600842) (not b!600848) (not b!600852) (not b!600849) (not b!600847))
(check-sat)
