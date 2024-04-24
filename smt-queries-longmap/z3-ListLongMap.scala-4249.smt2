; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58938 () Bool)

(assert start!58938)

(declare-fun b!649836 () Bool)

(declare-fun res!421203 () Bool)

(declare-fun e!372759 () Bool)

(assert (=> b!649836 (=> (not res!421203) (not e!372759))))

(declare-datatypes ((array!38538 0))(
  ( (array!38539 (arr!18472 (Array (_ BitVec 32) (_ BitVec 64))) (size!18836 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38538)

(declare-datatypes ((List!12420 0))(
  ( (Nil!12417) (Cons!12416 (h!13464 (_ BitVec 64)) (t!18640 List!12420)) )
))
(declare-fun arrayNoDuplicates!0 (array!38538 (_ BitVec 32) List!12420) Bool)

(assert (=> b!649836 (= res!421203 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12417))))

(declare-fun b!649837 () Bool)

(declare-fun e!372757 () Bool)

(declare-fun e!372750 () Bool)

(assert (=> b!649837 (= e!372757 e!372750)))

(declare-fun res!421207 () Bool)

(assert (=> b!649837 (=> res!421207 e!372750)))

(declare-fun lt!301799 () (_ BitVec 64))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!301796 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!649837 (= res!421207 (or (not (= (select (arr!18472 a!2986) j!136) lt!301799)) (not (= (select (arr!18472 a!2986) j!136) lt!301796)) (bvsge j!136 index!984)))))

(declare-fun b!649838 () Bool)

(declare-fun e!372758 () Bool)

(assert (=> b!649838 (= e!372759 e!372758)))

(declare-fun res!421211 () Bool)

(assert (=> b!649838 (=> (not res!421211) (not e!372758))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!649838 (= res!421211 (= (select (store (arr!18472 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!301788 () array!38538)

(assert (=> b!649838 (= lt!301788 (array!38539 (store (arr!18472 a!2986) i!1108 k0!1786) (size!18836 a!2986)))))

(declare-fun b!649839 () Bool)

(declare-fun e!372749 () Bool)

(declare-fun arrayContainsKey!0 (array!38538 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!649839 (= e!372749 (arrayContainsKey!0 lt!301788 (select (arr!18472 a!2986) j!136) index!984))))

(declare-fun b!649840 () Bool)

(declare-datatypes ((Unit!22107 0))(
  ( (Unit!22108) )
))
(declare-fun e!372751 () Unit!22107)

(declare-fun Unit!22109 () Unit!22107)

(assert (=> b!649840 (= e!372751 Unit!22109)))

(assert (=> b!649840 false))

(declare-fun b!649841 () Bool)

(declare-fun e!372753 () Bool)

(declare-fun e!372755 () Bool)

(assert (=> b!649841 (= e!372753 e!372755)))

(declare-fun res!421195 () Bool)

(assert (=> b!649841 (=> res!421195 e!372755)))

(assert (=> b!649841 (= res!421195 (or (not (= (select (arr!18472 a!2986) j!136) lt!301799)) (not (= (select (arr!18472 a!2986) j!136) lt!301796))))))

(assert (=> b!649841 e!372757))

(declare-fun res!421197 () Bool)

(assert (=> b!649841 (=> (not res!421197) (not e!372757))))

(assert (=> b!649841 (= res!421197 (= lt!301796 (select (arr!18472 a!2986) j!136)))))

(assert (=> b!649841 (= lt!301796 (select (store (arr!18472 a!2986) i!1108 k0!1786) index!984))))

(declare-fun res!421204 () Bool)

(declare-fun e!372756 () Bool)

(assert (=> start!58938 (=> (not res!421204) (not e!372756))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58938 (= res!421204 (validMask!0 mask!3053))))

(assert (=> start!58938 e!372756))

(assert (=> start!58938 true))

(declare-fun array_inv!14331 (array!38538) Bool)

(assert (=> start!58938 (array_inv!14331 a!2986)))

(declare-fun b!649842 () Bool)

(declare-fun res!421198 () Bool)

(assert (=> b!649842 (=> (not res!421198) (not e!372759))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!649842 (= res!421198 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18472 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!649843 () Bool)

(assert (=> b!649843 (= e!372756 e!372759)))

(declare-fun res!421212 () Bool)

(assert (=> b!649843 (=> (not res!421212) (not e!372759))))

(declare-datatypes ((SeekEntryResult!6868 0))(
  ( (MissingZero!6868 (index!29819 (_ BitVec 32))) (Found!6868 (index!29820 (_ BitVec 32))) (Intermediate!6868 (undefined!7680 Bool) (index!29821 (_ BitVec 32)) (x!58756 (_ BitVec 32))) (Undefined!6868) (MissingVacant!6868 (index!29822 (_ BitVec 32))) )
))
(declare-fun lt!301797 () SeekEntryResult!6868)

(assert (=> b!649843 (= res!421212 (or (= lt!301797 (MissingZero!6868 i!1108)) (= lt!301797 (MissingVacant!6868 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38538 (_ BitVec 32)) SeekEntryResult!6868)

(assert (=> b!649843 (= lt!301797 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!649844 () Bool)

(declare-fun e!372745 () Bool)

(assert (=> b!649844 (= e!372750 e!372745)))

(declare-fun res!421205 () Bool)

(assert (=> b!649844 (=> (not res!421205) (not e!372745))))

(assert (=> b!649844 (= res!421205 (arrayContainsKey!0 lt!301788 (select (arr!18472 a!2986) j!136) j!136))))

(declare-fun b!649845 () Bool)

(declare-fun res!421202 () Bool)

(assert (=> b!649845 (=> (not res!421202) (not e!372756))))

(assert (=> b!649845 (= res!421202 (and (= (size!18836 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18836 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18836 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!649846 () Bool)

(declare-fun e!372748 () Unit!22107)

(declare-fun Unit!22110 () Unit!22107)

(assert (=> b!649846 (= e!372748 Unit!22110)))

(declare-fun b!649847 () Bool)

(declare-fun Unit!22111 () Unit!22107)

(assert (=> b!649847 (= e!372748 Unit!22111)))

(declare-fun lt!301786 () Unit!22107)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38538 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22107)

(assert (=> b!649847 (= lt!301786 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301788 (select (arr!18472 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!649847 (arrayContainsKey!0 lt!301788 (select (arr!18472 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!301793 () Unit!22107)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38538 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12420) Unit!22107)

(assert (=> b!649847 (= lt!301793 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12417))))

(assert (=> b!649847 (arrayNoDuplicates!0 lt!301788 #b00000000000000000000000000000000 Nil!12417)))

(declare-fun lt!301794 () Unit!22107)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38538 (_ BitVec 32) (_ BitVec 32)) Unit!22107)

(assert (=> b!649847 (= lt!301794 (lemmaNoDuplicateFromThenFromBigger!0 lt!301788 #b00000000000000000000000000000000 j!136))))

(assert (=> b!649847 (arrayNoDuplicates!0 lt!301788 j!136 Nil!12417)))

(declare-fun lt!301789 () Unit!22107)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38538 (_ BitVec 64) (_ BitVec 32) List!12420) Unit!22107)

(assert (=> b!649847 (= lt!301789 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!301788 (select (arr!18472 a!2986) j!136) j!136 Nil!12417))))

(assert (=> b!649847 false))

(declare-fun b!649848 () Bool)

(declare-fun res!421208 () Bool)

(assert (=> b!649848 (=> (not res!421208) (not e!372759))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38538 (_ BitVec 32)) Bool)

(assert (=> b!649848 (= res!421208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!649849 () Bool)

(declare-fun Unit!22112 () Unit!22107)

(assert (=> b!649849 (= e!372751 Unit!22112)))

(declare-fun b!649850 () Bool)

(declare-fun res!421206 () Bool)

(assert (=> b!649850 (=> (not res!421206) (not e!372756))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!649850 (= res!421206 (validKeyInArray!0 k0!1786))))

(declare-fun b!649851 () Bool)

(declare-fun e!372746 () Bool)

(assert (=> b!649851 (= e!372746 (not e!372753))))

(declare-fun res!421199 () Bool)

(assert (=> b!649851 (=> res!421199 e!372753)))

(declare-fun lt!301801 () SeekEntryResult!6868)

(assert (=> b!649851 (= res!421199 (not (= lt!301801 (Found!6868 index!984))))))

(declare-fun lt!301795 () Unit!22107)

(assert (=> b!649851 (= lt!301795 e!372751)))

(declare-fun c!74689 () Bool)

(assert (=> b!649851 (= c!74689 (= lt!301801 Undefined!6868))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38538 (_ BitVec 32)) SeekEntryResult!6868)

(assert (=> b!649851 (= lt!301801 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!301799 lt!301788 mask!3053))))

(declare-fun e!372752 () Bool)

(assert (=> b!649851 e!372752))

(declare-fun res!421210 () Bool)

(assert (=> b!649851 (=> (not res!421210) (not e!372752))))

(declare-fun lt!301790 () (_ BitVec 32))

(declare-fun lt!301787 () SeekEntryResult!6868)

(assert (=> b!649851 (= res!421210 (= lt!301787 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301790 vacantSpotIndex!68 lt!301799 lt!301788 mask!3053)))))

(assert (=> b!649851 (= lt!301787 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301790 vacantSpotIndex!68 (select (arr!18472 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!649851 (= lt!301799 (select (store (arr!18472 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!301791 () Unit!22107)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38538 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22107)

(assert (=> b!649851 (= lt!301791 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!301790 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!649851 (= lt!301790 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!649852 () Bool)

(assert (=> b!649852 (= e!372745 (arrayContainsKey!0 lt!301788 (select (arr!18472 a!2986) j!136) index!984))))

(declare-fun b!649853 () Bool)

(declare-fun e!372747 () Bool)

(assert (=> b!649853 (= e!372747 true)))

(assert (=> b!649853 (arrayNoDuplicates!0 lt!301788 #b00000000000000000000000000000000 Nil!12417)))

(declare-fun lt!301798 () Unit!22107)

(assert (=> b!649853 (= lt!301798 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12417))))

(assert (=> b!649853 (arrayContainsKey!0 lt!301788 (select (arr!18472 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!301785 () Unit!22107)

(assert (=> b!649853 (= lt!301785 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301788 (select (arr!18472 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!649853 e!372749))

(declare-fun res!421196 () Bool)

(assert (=> b!649853 (=> (not res!421196) (not e!372749))))

(assert (=> b!649853 (= res!421196 (arrayContainsKey!0 lt!301788 (select (arr!18472 a!2986) j!136) j!136))))

(declare-fun b!649854 () Bool)

(assert (=> b!649854 (= e!372755 e!372747)))

(declare-fun res!421213 () Bool)

(assert (=> b!649854 (=> res!421213 e!372747)))

(assert (=> b!649854 (= res!421213 (bvsge index!984 j!136))))

(declare-fun lt!301800 () Unit!22107)

(assert (=> b!649854 (= lt!301800 e!372748)))

(declare-fun c!74690 () Bool)

(assert (=> b!649854 (= c!74690 (bvslt j!136 index!984))))

(declare-fun b!649855 () Bool)

(assert (=> b!649855 (= e!372758 e!372746)))

(declare-fun res!421209 () Bool)

(assert (=> b!649855 (=> (not res!421209) (not e!372746))))

(declare-fun lt!301792 () SeekEntryResult!6868)

(assert (=> b!649855 (= res!421209 (and (= lt!301792 (Found!6868 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18472 a!2986) index!984) (select (arr!18472 a!2986) j!136))) (not (= (select (arr!18472 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!649855 (= lt!301792 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18472 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!649856 () Bool)

(assert (=> b!649856 (= e!372752 (= lt!301792 lt!301787))))

(declare-fun b!649857 () Bool)

(declare-fun res!421201 () Bool)

(assert (=> b!649857 (=> (not res!421201) (not e!372756))))

(assert (=> b!649857 (= res!421201 (validKeyInArray!0 (select (arr!18472 a!2986) j!136)))))

(declare-fun b!649858 () Bool)

(declare-fun res!421200 () Bool)

(assert (=> b!649858 (=> (not res!421200) (not e!372756))))

(assert (=> b!649858 (= res!421200 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!58938 res!421204) b!649845))

(assert (= (and b!649845 res!421202) b!649857))

(assert (= (and b!649857 res!421201) b!649850))

(assert (= (and b!649850 res!421206) b!649858))

(assert (= (and b!649858 res!421200) b!649843))

(assert (= (and b!649843 res!421212) b!649848))

(assert (= (and b!649848 res!421208) b!649836))

(assert (= (and b!649836 res!421203) b!649842))

(assert (= (and b!649842 res!421198) b!649838))

(assert (= (and b!649838 res!421211) b!649855))

(assert (= (and b!649855 res!421209) b!649851))

(assert (= (and b!649851 res!421210) b!649856))

(assert (= (and b!649851 c!74689) b!649840))

(assert (= (and b!649851 (not c!74689)) b!649849))

(assert (= (and b!649851 (not res!421199)) b!649841))

(assert (= (and b!649841 res!421197) b!649837))

(assert (= (and b!649837 (not res!421207)) b!649844))

(assert (= (and b!649844 res!421205) b!649852))

(assert (= (and b!649841 (not res!421195)) b!649854))

(assert (= (and b!649854 c!74690) b!649847))

(assert (= (and b!649854 (not c!74690)) b!649846))

(assert (= (and b!649854 (not res!421213)) b!649853))

(assert (= (and b!649853 res!421196) b!649839))

(declare-fun m!623509 () Bool)

(assert (=> b!649836 m!623509))

(declare-fun m!623511 () Bool)

(assert (=> b!649839 m!623511))

(assert (=> b!649839 m!623511))

(declare-fun m!623513 () Bool)

(assert (=> b!649839 m!623513))

(assert (=> b!649841 m!623511))

(declare-fun m!623515 () Bool)

(assert (=> b!649841 m!623515))

(declare-fun m!623517 () Bool)

(assert (=> b!649841 m!623517))

(declare-fun m!623519 () Bool)

(assert (=> start!58938 m!623519))

(declare-fun m!623521 () Bool)

(assert (=> start!58938 m!623521))

(assert (=> b!649837 m!623511))

(declare-fun m!623523 () Bool)

(assert (=> b!649855 m!623523))

(assert (=> b!649855 m!623511))

(assert (=> b!649855 m!623511))

(declare-fun m!623525 () Bool)

(assert (=> b!649855 m!623525))

(declare-fun m!623527 () Bool)

(assert (=> b!649858 m!623527))

(assert (=> b!649853 m!623511))

(assert (=> b!649853 m!623511))

(declare-fun m!623529 () Bool)

(assert (=> b!649853 m!623529))

(assert (=> b!649853 m!623511))

(declare-fun m!623531 () Bool)

(assert (=> b!649853 m!623531))

(declare-fun m!623533 () Bool)

(assert (=> b!649853 m!623533))

(assert (=> b!649853 m!623511))

(declare-fun m!623535 () Bool)

(assert (=> b!649853 m!623535))

(declare-fun m!623537 () Bool)

(assert (=> b!649853 m!623537))

(assert (=> b!649844 m!623511))

(assert (=> b!649844 m!623511))

(assert (=> b!649844 m!623535))

(assert (=> b!649838 m!623515))

(declare-fun m!623539 () Bool)

(assert (=> b!649838 m!623539))

(assert (=> b!649852 m!623511))

(assert (=> b!649852 m!623511))

(assert (=> b!649852 m!623513))

(declare-fun m!623541 () Bool)

(assert (=> b!649842 m!623541))

(declare-fun m!623543 () Bool)

(assert (=> b!649843 m!623543))

(declare-fun m!623545 () Bool)

(assert (=> b!649850 m!623545))

(assert (=> b!649857 m!623511))

(assert (=> b!649857 m!623511))

(declare-fun m!623547 () Bool)

(assert (=> b!649857 m!623547))

(assert (=> b!649847 m!623511))

(declare-fun m!623549 () Bool)

(assert (=> b!649847 m!623549))

(assert (=> b!649847 m!623511))

(declare-fun m!623551 () Bool)

(assert (=> b!649847 m!623551))

(declare-fun m!623553 () Bool)

(assert (=> b!649847 m!623553))

(assert (=> b!649847 m!623511))

(declare-fun m!623555 () Bool)

(assert (=> b!649847 m!623555))

(assert (=> b!649847 m!623533))

(assert (=> b!649847 m!623511))

(declare-fun m!623557 () Bool)

(assert (=> b!649847 m!623557))

(assert (=> b!649847 m!623537))

(declare-fun m!623559 () Bool)

(assert (=> b!649848 m!623559))

(declare-fun m!623561 () Bool)

(assert (=> b!649851 m!623561))

(declare-fun m!623563 () Bool)

(assert (=> b!649851 m!623563))

(assert (=> b!649851 m!623511))

(assert (=> b!649851 m!623515))

(declare-fun m!623565 () Bool)

(assert (=> b!649851 m!623565))

(declare-fun m!623567 () Bool)

(assert (=> b!649851 m!623567))

(assert (=> b!649851 m!623511))

(declare-fun m!623569 () Bool)

(assert (=> b!649851 m!623569))

(declare-fun m!623571 () Bool)

(assert (=> b!649851 m!623571))

(check-sat (not b!649848) (not b!649847) (not start!58938) (not b!649843) (not b!649836) (not b!649853) (not b!649858) (not b!649852) (not b!649839) (not b!649844) (not b!649850) (not b!649857) (not b!649851) (not b!649855))
(check-sat)
