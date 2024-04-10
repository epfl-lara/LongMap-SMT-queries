; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58342 () Bool)

(assert start!58342)

(declare-fun b!644557 () Bool)

(declare-fun res!417615 () Bool)

(declare-fun e!369306 () Bool)

(assert (=> b!644557 (=> (not res!417615) (not e!369306))))

(declare-datatypes ((array!38439 0))(
  ( (array!38440 (arr!18433 (Array (_ BitVec 32) (_ BitVec 64))) (size!18797 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38439)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!644557 (= res!417615 (validKeyInArray!0 (select (arr!18433 a!2986) j!136)))))

(declare-fun b!644558 () Bool)

(declare-fun e!369308 () Bool)

(declare-fun e!369307 () Bool)

(assert (=> b!644558 (= e!369308 (not e!369307))))

(declare-fun res!417608 () Bool)

(assert (=> b!644558 (=> res!417608 e!369307)))

(declare-datatypes ((SeekEntryResult!6873 0))(
  ( (MissingZero!6873 (index!29824 (_ BitVec 32))) (Found!6873 (index!29825 (_ BitVec 32))) (Intermediate!6873 (undefined!7685 Bool) (index!29826 (_ BitVec 32)) (x!58593 (_ BitVec 32))) (Undefined!6873) (MissingVacant!6873 (index!29827 (_ BitVec 32))) )
))
(declare-fun lt!298782 () SeekEntryResult!6873)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!644558 (= res!417608 (not (= lt!298782 (Found!6873 index!984))))))

(declare-datatypes ((Unit!21864 0))(
  ( (Unit!21865) )
))
(declare-fun lt!298791 () Unit!21864)

(declare-fun e!369315 () Unit!21864)

(assert (=> b!644558 (= lt!298791 e!369315)))

(declare-fun c!73844 () Bool)

(assert (=> b!644558 (= c!73844 (= lt!298782 Undefined!6873))))

(declare-fun lt!298786 () (_ BitVec 64))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!298785 () array!38439)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38439 (_ BitVec 32)) SeekEntryResult!6873)

(assert (=> b!644558 (= lt!298782 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!298786 lt!298785 mask!3053))))

(declare-fun e!369309 () Bool)

(assert (=> b!644558 e!369309))

(declare-fun res!417611 () Bool)

(assert (=> b!644558 (=> (not res!417611) (not e!369309))))

(declare-fun lt!298778 () SeekEntryResult!6873)

(declare-fun lt!298783 () (_ BitVec 32))

(assert (=> b!644558 (= res!417611 (= lt!298778 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298783 vacantSpotIndex!68 lt!298786 lt!298785 mask!3053)))))

(assert (=> b!644558 (= lt!298778 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298783 vacantSpotIndex!68 (select (arr!18433 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!644558 (= lt!298786 (select (store (arr!18433 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!298784 () Unit!21864)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38439 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21864)

(assert (=> b!644558 (= lt!298784 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!298783 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!644558 (= lt!298783 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!644559 () Bool)

(declare-fun res!417619 () Bool)

(declare-fun e!369302 () Bool)

(assert (=> b!644559 (=> (not res!417619) (not e!369302))))

(assert (=> b!644559 (= res!417619 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18433 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!644560 () Bool)

(declare-fun res!417622 () Bool)

(assert (=> b!644560 (=> (not res!417622) (not e!369302))))

(declare-datatypes ((List!12474 0))(
  ( (Nil!12471) (Cons!12470 (h!13515 (_ BitVec 64)) (t!18702 List!12474)) )
))
(declare-fun arrayNoDuplicates!0 (array!38439 (_ BitVec 32) List!12474) Bool)

(assert (=> b!644560 (= res!417622 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12471))))

(declare-fun b!644561 () Bool)

(declare-fun Unit!21866 () Unit!21864)

(assert (=> b!644561 (= e!369315 Unit!21866)))

(assert (=> b!644561 false))

(declare-fun b!644562 () Bool)

(declare-fun res!417623 () Bool)

(assert (=> b!644562 (=> (not res!417623) (not e!369306))))

(assert (=> b!644562 (= res!417623 (validKeyInArray!0 k0!1786))))

(declare-fun b!644563 () Bool)

(declare-fun e!369305 () Bool)

(assert (=> b!644563 (= e!369302 e!369305)))

(declare-fun res!417621 () Bool)

(assert (=> b!644563 (=> (not res!417621) (not e!369305))))

(assert (=> b!644563 (= res!417621 (= (select (store (arr!18433 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!644563 (= lt!298785 (array!38440 (store (arr!18433 a!2986) i!1108 k0!1786) (size!18797 a!2986)))))

(declare-fun b!644564 () Bool)

(declare-fun res!417607 () Bool)

(assert (=> b!644564 (=> (not res!417607) (not e!369302))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38439 (_ BitVec 32)) Bool)

(assert (=> b!644564 (= res!417607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!644565 () Bool)

(declare-fun e!369304 () Bool)

(assert (=> b!644565 (= e!369307 e!369304)))

(declare-fun res!417606 () Bool)

(assert (=> b!644565 (=> res!417606 e!369304)))

(declare-fun lt!298779 () (_ BitVec 64))

(assert (=> b!644565 (= res!417606 (or (not (= (select (arr!18433 a!2986) j!136) lt!298786)) (not (= (select (arr!18433 a!2986) j!136) lt!298779))))))

(declare-fun e!369314 () Bool)

(assert (=> b!644565 e!369314))

(declare-fun res!417610 () Bool)

(assert (=> b!644565 (=> (not res!417610) (not e!369314))))

(assert (=> b!644565 (= res!417610 (= lt!298779 (select (arr!18433 a!2986) j!136)))))

(assert (=> b!644565 (= lt!298779 (select (store (arr!18433 a!2986) i!1108 k0!1786) index!984))))

(declare-fun res!417605 () Bool)

(assert (=> start!58342 (=> (not res!417605) (not e!369306))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58342 (= res!417605 (validMask!0 mask!3053))))

(assert (=> start!58342 e!369306))

(assert (=> start!58342 true))

(declare-fun array_inv!14229 (array!38439) Bool)

(assert (=> start!58342 (array_inv!14229 a!2986)))

(declare-fun b!644566 () Bool)

(declare-fun Unit!21867 () Unit!21864)

(assert (=> b!644566 (= e!369315 Unit!21867)))

(declare-fun e!369310 () Bool)

(declare-fun b!644567 () Bool)

(declare-fun arrayContainsKey!0 (array!38439 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!644567 (= e!369310 (arrayContainsKey!0 lt!298785 (select (arr!18433 a!2986) j!136) index!984))))

(declare-fun b!644568 () Bool)

(declare-fun e!369303 () Unit!21864)

(declare-fun Unit!21868 () Unit!21864)

(assert (=> b!644568 (= e!369303 Unit!21868)))

(declare-fun b!644569 () Bool)

(declare-fun Unit!21869 () Unit!21864)

(assert (=> b!644569 (= e!369303 Unit!21869)))

(declare-fun lt!298788 () Unit!21864)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38439 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21864)

(assert (=> b!644569 (= lt!298788 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!298785 (select (arr!18433 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!644569 (arrayContainsKey!0 lt!298785 (select (arr!18433 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!298790 () Unit!21864)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38439 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12474) Unit!21864)

(assert (=> b!644569 (= lt!298790 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12471))))

(assert (=> b!644569 (arrayNoDuplicates!0 lt!298785 #b00000000000000000000000000000000 Nil!12471)))

(declare-fun lt!298780 () Unit!21864)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38439 (_ BitVec 32) (_ BitVec 32)) Unit!21864)

(assert (=> b!644569 (= lt!298780 (lemmaNoDuplicateFromThenFromBigger!0 lt!298785 #b00000000000000000000000000000000 j!136))))

(assert (=> b!644569 (arrayNoDuplicates!0 lt!298785 j!136 Nil!12471)))

(declare-fun lt!298787 () Unit!21864)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38439 (_ BitVec 64) (_ BitVec 32) List!12474) Unit!21864)

(assert (=> b!644569 (= lt!298787 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!298785 (select (arr!18433 a!2986) j!136) j!136 Nil!12471))))

(assert (=> b!644569 false))

(declare-fun b!644570 () Bool)

(declare-fun e!369313 () Bool)

(assert (=> b!644570 (= e!369314 e!369313)))

(declare-fun res!417613 () Bool)

(assert (=> b!644570 (=> res!417613 e!369313)))

(assert (=> b!644570 (= res!417613 (or (not (= (select (arr!18433 a!2986) j!136) lt!298786)) (not (= (select (arr!18433 a!2986) j!136) lt!298779)) (bvsge j!136 index!984)))))

(declare-fun b!644571 () Bool)

(assert (=> b!644571 (= e!369305 e!369308)))

(declare-fun res!417616 () Bool)

(assert (=> b!644571 (=> (not res!417616) (not e!369308))))

(declare-fun lt!298781 () SeekEntryResult!6873)

(assert (=> b!644571 (= res!417616 (and (= lt!298781 (Found!6873 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18433 a!2986) index!984) (select (arr!18433 a!2986) j!136))) (not (= (select (arr!18433 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!644571 (= lt!298781 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18433 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!644572 () Bool)

(declare-fun res!417609 () Bool)

(assert (=> b!644572 (=> (not res!417609) (not e!369306))))

(assert (=> b!644572 (= res!417609 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!644573 () Bool)

(assert (=> b!644573 (= e!369306 e!369302)))

(declare-fun res!417612 () Bool)

(assert (=> b!644573 (=> (not res!417612) (not e!369302))))

(declare-fun lt!298789 () SeekEntryResult!6873)

(assert (=> b!644573 (= res!417612 (or (= lt!298789 (MissingZero!6873 i!1108)) (= lt!298789 (MissingVacant!6873 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38439 (_ BitVec 32)) SeekEntryResult!6873)

(assert (=> b!644573 (= lt!298789 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!644574 () Bool)

(declare-fun e!369301 () Bool)

(assert (=> b!644574 (= e!369313 e!369301)))

(declare-fun res!417617 () Bool)

(assert (=> b!644574 (=> (not res!417617) (not e!369301))))

(assert (=> b!644574 (= res!417617 (arrayContainsKey!0 lt!298785 (select (arr!18433 a!2986) j!136) j!136))))

(declare-fun b!644575 () Bool)

(assert (=> b!644575 (= e!369301 (arrayContainsKey!0 lt!298785 (select (arr!18433 a!2986) j!136) index!984))))

(declare-fun b!644576 () Bool)

(assert (=> b!644576 (= e!369309 (= lt!298781 lt!298778))))

(declare-fun b!644577 () Bool)

(declare-fun e!369311 () Bool)

(assert (=> b!644577 (= e!369304 e!369311)))

(declare-fun res!417618 () Bool)

(assert (=> b!644577 (=> res!417618 e!369311)))

(assert (=> b!644577 (= res!417618 (bvsge index!984 j!136))))

(declare-fun lt!298792 () Unit!21864)

(assert (=> b!644577 (= lt!298792 e!369303)))

(declare-fun c!73843 () Bool)

(assert (=> b!644577 (= c!73843 (bvslt j!136 index!984))))

(declare-fun b!644578 () Bool)

(declare-fun res!417614 () Bool)

(assert (=> b!644578 (=> (not res!417614) (not e!369306))))

(assert (=> b!644578 (= res!417614 (and (= (size!18797 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18797 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18797 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!644579 () Bool)

(assert (=> b!644579 (= e!369311 (or (bvslt (bvadd #b00000000000000000000000000000001 index!984) #b00000000000000000000000000000000) (bvslt (size!18797 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!644579 e!369310))

(declare-fun res!417620 () Bool)

(assert (=> b!644579 (=> (not res!417620) (not e!369310))))

(assert (=> b!644579 (= res!417620 (arrayContainsKey!0 lt!298785 (select (arr!18433 a!2986) j!136) j!136))))

(assert (= (and start!58342 res!417605) b!644578))

(assert (= (and b!644578 res!417614) b!644557))

(assert (= (and b!644557 res!417615) b!644562))

(assert (= (and b!644562 res!417623) b!644572))

(assert (= (and b!644572 res!417609) b!644573))

(assert (= (and b!644573 res!417612) b!644564))

(assert (= (and b!644564 res!417607) b!644560))

(assert (= (and b!644560 res!417622) b!644559))

(assert (= (and b!644559 res!417619) b!644563))

(assert (= (and b!644563 res!417621) b!644571))

(assert (= (and b!644571 res!417616) b!644558))

(assert (= (and b!644558 res!417611) b!644576))

(assert (= (and b!644558 c!73844) b!644561))

(assert (= (and b!644558 (not c!73844)) b!644566))

(assert (= (and b!644558 (not res!417608)) b!644565))

(assert (= (and b!644565 res!417610) b!644570))

(assert (= (and b!644570 (not res!417613)) b!644574))

(assert (= (and b!644574 res!417617) b!644575))

(assert (= (and b!644565 (not res!417606)) b!644577))

(assert (= (and b!644577 c!73843) b!644569))

(assert (= (and b!644577 (not c!73843)) b!644568))

(assert (= (and b!644577 (not res!417618)) b!644579))

(assert (= (and b!644579 res!417620) b!644567))

(declare-fun m!618149 () Bool)

(assert (=> b!644567 m!618149))

(assert (=> b!644567 m!618149))

(declare-fun m!618151 () Bool)

(assert (=> b!644567 m!618151))

(declare-fun m!618153 () Bool)

(assert (=> b!644571 m!618153))

(assert (=> b!644571 m!618149))

(assert (=> b!644571 m!618149))

(declare-fun m!618155 () Bool)

(assert (=> b!644571 m!618155))

(declare-fun m!618157 () Bool)

(assert (=> b!644573 m!618157))

(declare-fun m!618159 () Bool)

(assert (=> b!644563 m!618159))

(declare-fun m!618161 () Bool)

(assert (=> b!644563 m!618161))

(declare-fun m!618163 () Bool)

(assert (=> b!644558 m!618163))

(assert (=> b!644558 m!618149))

(assert (=> b!644558 m!618159))

(declare-fun m!618165 () Bool)

(assert (=> b!644558 m!618165))

(declare-fun m!618167 () Bool)

(assert (=> b!644558 m!618167))

(assert (=> b!644558 m!618149))

(declare-fun m!618169 () Bool)

(assert (=> b!644558 m!618169))

(declare-fun m!618171 () Bool)

(assert (=> b!644558 m!618171))

(declare-fun m!618173 () Bool)

(assert (=> b!644558 m!618173))

(declare-fun m!618175 () Bool)

(assert (=> b!644559 m!618175))

(assert (=> b!644570 m!618149))

(assert (=> b!644575 m!618149))

(assert (=> b!644575 m!618149))

(assert (=> b!644575 m!618151))

(assert (=> b!644569 m!618149))

(declare-fun m!618177 () Bool)

(assert (=> b!644569 m!618177))

(assert (=> b!644569 m!618149))

(declare-fun m!618179 () Bool)

(assert (=> b!644569 m!618179))

(declare-fun m!618181 () Bool)

(assert (=> b!644569 m!618181))

(declare-fun m!618183 () Bool)

(assert (=> b!644569 m!618183))

(declare-fun m!618185 () Bool)

(assert (=> b!644569 m!618185))

(assert (=> b!644569 m!618149))

(declare-fun m!618187 () Bool)

(assert (=> b!644569 m!618187))

(assert (=> b!644569 m!618149))

(declare-fun m!618189 () Bool)

(assert (=> b!644569 m!618189))

(assert (=> b!644579 m!618149))

(assert (=> b!644579 m!618149))

(declare-fun m!618191 () Bool)

(assert (=> b!644579 m!618191))

(declare-fun m!618193 () Bool)

(assert (=> start!58342 m!618193))

(declare-fun m!618195 () Bool)

(assert (=> start!58342 m!618195))

(assert (=> b!644557 m!618149))

(assert (=> b!644557 m!618149))

(declare-fun m!618197 () Bool)

(assert (=> b!644557 m!618197))

(declare-fun m!618199 () Bool)

(assert (=> b!644560 m!618199))

(declare-fun m!618201 () Bool)

(assert (=> b!644564 m!618201))

(assert (=> b!644565 m!618149))

(assert (=> b!644565 m!618159))

(declare-fun m!618203 () Bool)

(assert (=> b!644565 m!618203))

(declare-fun m!618205 () Bool)

(assert (=> b!644562 m!618205))

(declare-fun m!618207 () Bool)

(assert (=> b!644572 m!618207))

(assert (=> b!644574 m!618149))

(assert (=> b!644574 m!618149))

(assert (=> b!644574 m!618191))

(check-sat (not b!644567) (not b!644560) (not b!644569) (not b!644575) (not b!644572) (not b!644562) (not b!644557) (not b!644574) (not start!58342) (not b!644571) (not b!644564) (not b!644579) (not b!644558) (not b!644573))
(check-sat)
(get-model)

(declare-fun b!644657 () Bool)

(declare-fun e!369367 () Bool)

(declare-fun e!369369 () Bool)

(assert (=> b!644657 (= e!369367 e!369369)))

(declare-fun lt!298845 () (_ BitVec 64))

(assert (=> b!644657 (= lt!298845 (select (arr!18433 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!298844 () Unit!21864)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38439 (_ BitVec 64) (_ BitVec 32)) Unit!21864)

(assert (=> b!644657 (= lt!298844 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!298845 #b00000000000000000000000000000000))))

(assert (=> b!644657 (arrayContainsKey!0 a!2986 lt!298845 #b00000000000000000000000000000000)))

(declare-fun lt!298846 () Unit!21864)

(assert (=> b!644657 (= lt!298846 lt!298844)))

(declare-fun res!417686 () Bool)

(assert (=> b!644657 (= res!417686 (= (seekEntryOrOpen!0 (select (arr!18433 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6873 #b00000000000000000000000000000000)))))

(assert (=> b!644657 (=> (not res!417686) (not e!369369))))

(declare-fun b!644658 () Bool)

(declare-fun e!369368 () Bool)

(assert (=> b!644658 (= e!369368 e!369367)))

(declare-fun c!73853 () Bool)

(assert (=> b!644658 (= c!73853 (validKeyInArray!0 (select (arr!18433 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33608 () Bool)

(declare-fun call!33611 () Bool)

(assert (=> bm!33608 (= call!33611 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!644660 () Bool)

(assert (=> b!644660 (= e!369369 call!33611)))

(declare-fun b!644659 () Bool)

(assert (=> b!644659 (= e!369367 call!33611)))

(declare-fun d!91071 () Bool)

(declare-fun res!417685 () Bool)

(assert (=> d!91071 (=> res!417685 e!369368)))

(assert (=> d!91071 (= res!417685 (bvsge #b00000000000000000000000000000000 (size!18797 a!2986)))))

(assert (=> d!91071 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!369368)))

(assert (= (and d!91071 (not res!417685)) b!644658))

(assert (= (and b!644658 c!73853) b!644657))

(assert (= (and b!644658 (not c!73853)) b!644659))

(assert (= (and b!644657 res!417686) b!644660))

(assert (= (or b!644660 b!644659) bm!33608))

(declare-fun m!618269 () Bool)

(assert (=> b!644657 m!618269))

(declare-fun m!618271 () Bool)

(assert (=> b!644657 m!618271))

(declare-fun m!618273 () Bool)

(assert (=> b!644657 m!618273))

(assert (=> b!644657 m!618269))

(declare-fun m!618275 () Bool)

(assert (=> b!644657 m!618275))

(assert (=> b!644658 m!618269))

(assert (=> b!644658 m!618269))

(declare-fun m!618277 () Bool)

(assert (=> b!644658 m!618277))

(declare-fun m!618279 () Bool)

(assert (=> bm!33608 m!618279))

(assert (=> b!644564 d!91071))

(declare-fun d!91073 () Bool)

(declare-fun res!417691 () Bool)

(declare-fun e!369374 () Bool)

(assert (=> d!91073 (=> res!417691 e!369374)))

(assert (=> d!91073 (= res!417691 (= (select (arr!18433 lt!298785) index!984) (select (arr!18433 a!2986) j!136)))))

(assert (=> d!91073 (= (arrayContainsKey!0 lt!298785 (select (arr!18433 a!2986) j!136) index!984) e!369374)))

(declare-fun b!644665 () Bool)

(declare-fun e!369375 () Bool)

(assert (=> b!644665 (= e!369374 e!369375)))

(declare-fun res!417692 () Bool)

(assert (=> b!644665 (=> (not res!417692) (not e!369375))))

(assert (=> b!644665 (= res!417692 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18797 lt!298785)))))

(declare-fun b!644666 () Bool)

(assert (=> b!644666 (= e!369375 (arrayContainsKey!0 lt!298785 (select (arr!18433 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91073 (not res!417691)) b!644665))

(assert (= (and b!644665 res!417692) b!644666))

(declare-fun m!618281 () Bool)

(assert (=> d!91073 m!618281))

(assert (=> b!644666 m!618149))

(declare-fun m!618283 () Bool)

(assert (=> b!644666 m!618283))

(assert (=> b!644575 d!91073))

(declare-fun d!91075 () Bool)

(declare-fun res!417693 () Bool)

(declare-fun e!369376 () Bool)

(assert (=> d!91075 (=> res!417693 e!369376)))

(assert (=> d!91075 (= res!417693 (= (select (arr!18433 lt!298785) j!136) (select (arr!18433 a!2986) j!136)))))

(assert (=> d!91075 (= (arrayContainsKey!0 lt!298785 (select (arr!18433 a!2986) j!136) j!136) e!369376)))

(declare-fun b!644667 () Bool)

(declare-fun e!369377 () Bool)

(assert (=> b!644667 (= e!369376 e!369377)))

(declare-fun res!417694 () Bool)

(assert (=> b!644667 (=> (not res!417694) (not e!369377))))

(assert (=> b!644667 (= res!417694 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18797 lt!298785)))))

(declare-fun b!644668 () Bool)

(assert (=> b!644668 (= e!369377 (arrayContainsKey!0 lt!298785 (select (arr!18433 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91075 (not res!417693)) b!644667))

(assert (= (and b!644667 res!417694) b!644668))

(declare-fun m!618285 () Bool)

(assert (=> d!91075 m!618285))

(assert (=> b!644668 m!618149))

(declare-fun m!618287 () Bool)

(assert (=> b!644668 m!618287))

(assert (=> b!644579 d!91075))

(declare-fun b!644681 () Bool)

(declare-fun c!73861 () Bool)

(declare-fun lt!298851 () (_ BitVec 64))

(assert (=> b!644681 (= c!73861 (= lt!298851 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!369386 () SeekEntryResult!6873)

(declare-fun e!369385 () SeekEntryResult!6873)

(assert (=> b!644681 (= e!369386 e!369385)))

(declare-fun d!91077 () Bool)

(declare-fun lt!298852 () SeekEntryResult!6873)

(get-info :version)

(assert (=> d!91077 (and (or ((_ is Undefined!6873) lt!298852) (not ((_ is Found!6873) lt!298852)) (and (bvsge (index!29825 lt!298852) #b00000000000000000000000000000000) (bvslt (index!29825 lt!298852) (size!18797 a!2986)))) (or ((_ is Undefined!6873) lt!298852) ((_ is Found!6873) lt!298852) (not ((_ is MissingVacant!6873) lt!298852)) (not (= (index!29827 lt!298852) vacantSpotIndex!68)) (and (bvsge (index!29827 lt!298852) #b00000000000000000000000000000000) (bvslt (index!29827 lt!298852) (size!18797 a!2986)))) (or ((_ is Undefined!6873) lt!298852) (ite ((_ is Found!6873) lt!298852) (= (select (arr!18433 a!2986) (index!29825 lt!298852)) (select (arr!18433 a!2986) j!136)) (and ((_ is MissingVacant!6873) lt!298852) (= (index!29827 lt!298852) vacantSpotIndex!68) (= (select (arr!18433 a!2986) (index!29827 lt!298852)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!369384 () SeekEntryResult!6873)

(assert (=> d!91077 (= lt!298852 e!369384)))

(declare-fun c!73860 () Bool)

(assert (=> d!91077 (= c!73860 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!91077 (= lt!298851 (select (arr!18433 a!2986) lt!298783))))

(assert (=> d!91077 (validMask!0 mask!3053)))

(assert (=> d!91077 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298783 vacantSpotIndex!68 (select (arr!18433 a!2986) j!136) a!2986 mask!3053) lt!298852)))

(declare-fun b!644682 () Bool)

(assert (=> b!644682 (= e!369385 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!298783 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18433 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!644683 () Bool)

(assert (=> b!644683 (= e!369384 Undefined!6873)))

(declare-fun b!644684 () Bool)

(assert (=> b!644684 (= e!369385 (MissingVacant!6873 vacantSpotIndex!68))))

(declare-fun b!644685 () Bool)

(assert (=> b!644685 (= e!369386 (Found!6873 lt!298783))))

(declare-fun b!644686 () Bool)

(assert (=> b!644686 (= e!369384 e!369386)))

(declare-fun c!73862 () Bool)

(assert (=> b!644686 (= c!73862 (= lt!298851 (select (arr!18433 a!2986) j!136)))))

(assert (= (and d!91077 c!73860) b!644683))

(assert (= (and d!91077 (not c!73860)) b!644686))

(assert (= (and b!644686 c!73862) b!644685))

(assert (= (and b!644686 (not c!73862)) b!644681))

(assert (= (and b!644681 c!73861) b!644684))

(assert (= (and b!644681 (not c!73861)) b!644682))

(declare-fun m!618289 () Bool)

(assert (=> d!91077 m!618289))

(declare-fun m!618291 () Bool)

(assert (=> d!91077 m!618291))

(declare-fun m!618293 () Bool)

(assert (=> d!91077 m!618293))

(assert (=> d!91077 m!618193))

(declare-fun m!618295 () Bool)

(assert (=> b!644682 m!618295))

(assert (=> b!644682 m!618295))

(assert (=> b!644682 m!618149))

(declare-fun m!618297 () Bool)

(assert (=> b!644682 m!618297))

(assert (=> b!644558 d!91077))

(declare-fun d!91079 () Bool)

(declare-fun e!369389 () Bool)

(assert (=> d!91079 e!369389))

(declare-fun res!417697 () Bool)

(assert (=> d!91079 (=> (not res!417697) (not e!369389))))

(assert (=> d!91079 (= res!417697 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18797 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18797 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18797 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18797 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18797 a!2986))))))

(declare-fun lt!298855 () Unit!21864)

(declare-fun choose!9 (array!38439 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21864)

(assert (=> d!91079 (= lt!298855 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!298783 vacantSpotIndex!68 mask!3053))))

(assert (=> d!91079 (validMask!0 mask!3053)))

(assert (=> d!91079 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!298783 vacantSpotIndex!68 mask!3053) lt!298855)))

(declare-fun b!644689 () Bool)

(assert (=> b!644689 (= e!369389 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298783 vacantSpotIndex!68 (select (arr!18433 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298783 vacantSpotIndex!68 (select (store (arr!18433 a!2986) i!1108 k0!1786) j!136) (array!38440 (store (arr!18433 a!2986) i!1108 k0!1786) (size!18797 a!2986)) mask!3053)))))

(assert (= (and d!91079 res!417697) b!644689))

(declare-fun m!618299 () Bool)

(assert (=> d!91079 m!618299))

(assert (=> d!91079 m!618193))

(assert (=> b!644689 m!618149))

(assert (=> b!644689 m!618169))

(assert (=> b!644689 m!618171))

(declare-fun m!618301 () Bool)

(assert (=> b!644689 m!618301))

(assert (=> b!644689 m!618159))

(assert (=> b!644689 m!618171))

(assert (=> b!644689 m!618149))

(assert (=> b!644558 d!91079))

(declare-fun d!91081 () Bool)

(declare-fun lt!298858 () (_ BitVec 32))

(assert (=> d!91081 (and (bvsge lt!298858 #b00000000000000000000000000000000) (bvslt lt!298858 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91081 (= lt!298858 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!91081 (validMask!0 mask!3053)))

(assert (=> d!91081 (= (nextIndex!0 index!984 x!910 mask!3053) lt!298858)))

(declare-fun bs!19270 () Bool)

(assert (= bs!19270 d!91081))

(declare-fun m!618303 () Bool)

(assert (=> bs!19270 m!618303))

(assert (=> bs!19270 m!618193))

(assert (=> b!644558 d!91081))

(declare-fun b!644690 () Bool)

(declare-fun c!73864 () Bool)

(declare-fun lt!298859 () (_ BitVec 64))

(assert (=> b!644690 (= c!73864 (= lt!298859 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!369392 () SeekEntryResult!6873)

(declare-fun e!369391 () SeekEntryResult!6873)

(assert (=> b!644690 (= e!369392 e!369391)))

(declare-fun lt!298860 () SeekEntryResult!6873)

(declare-fun d!91083 () Bool)

(assert (=> d!91083 (and (or ((_ is Undefined!6873) lt!298860) (not ((_ is Found!6873) lt!298860)) (and (bvsge (index!29825 lt!298860) #b00000000000000000000000000000000) (bvslt (index!29825 lt!298860) (size!18797 lt!298785)))) (or ((_ is Undefined!6873) lt!298860) ((_ is Found!6873) lt!298860) (not ((_ is MissingVacant!6873) lt!298860)) (not (= (index!29827 lt!298860) vacantSpotIndex!68)) (and (bvsge (index!29827 lt!298860) #b00000000000000000000000000000000) (bvslt (index!29827 lt!298860) (size!18797 lt!298785)))) (or ((_ is Undefined!6873) lt!298860) (ite ((_ is Found!6873) lt!298860) (= (select (arr!18433 lt!298785) (index!29825 lt!298860)) lt!298786) (and ((_ is MissingVacant!6873) lt!298860) (= (index!29827 lt!298860) vacantSpotIndex!68) (= (select (arr!18433 lt!298785) (index!29827 lt!298860)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!369390 () SeekEntryResult!6873)

(assert (=> d!91083 (= lt!298860 e!369390)))

(declare-fun c!73863 () Bool)

(assert (=> d!91083 (= c!73863 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!91083 (= lt!298859 (select (arr!18433 lt!298785) index!984))))

(assert (=> d!91083 (validMask!0 mask!3053)))

(assert (=> d!91083 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!298786 lt!298785 mask!3053) lt!298860)))

(declare-fun b!644691 () Bool)

(assert (=> b!644691 (= e!369391 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!298786 lt!298785 mask!3053))))

(declare-fun b!644692 () Bool)

(assert (=> b!644692 (= e!369390 Undefined!6873)))

(declare-fun b!644693 () Bool)

(assert (=> b!644693 (= e!369391 (MissingVacant!6873 vacantSpotIndex!68))))

(declare-fun b!644694 () Bool)

(assert (=> b!644694 (= e!369392 (Found!6873 index!984))))

(declare-fun b!644695 () Bool)

(assert (=> b!644695 (= e!369390 e!369392)))

(declare-fun c!73865 () Bool)

(assert (=> b!644695 (= c!73865 (= lt!298859 lt!298786))))

(assert (= (and d!91083 c!73863) b!644692))

(assert (= (and d!91083 (not c!73863)) b!644695))

(assert (= (and b!644695 c!73865) b!644694))

(assert (= (and b!644695 (not c!73865)) b!644690))

(assert (= (and b!644690 c!73864) b!644693))

(assert (= (and b!644690 (not c!73864)) b!644691))

(declare-fun m!618305 () Bool)

(assert (=> d!91083 m!618305))

(declare-fun m!618307 () Bool)

(assert (=> d!91083 m!618307))

(assert (=> d!91083 m!618281))

(assert (=> d!91083 m!618193))

(assert (=> b!644691 m!618163))

(assert (=> b!644691 m!618163))

(declare-fun m!618309 () Bool)

(assert (=> b!644691 m!618309))

(assert (=> b!644558 d!91083))

(declare-fun b!644696 () Bool)

(declare-fun c!73867 () Bool)

(declare-fun lt!298861 () (_ BitVec 64))

(assert (=> b!644696 (= c!73867 (= lt!298861 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!369395 () SeekEntryResult!6873)

(declare-fun e!369394 () SeekEntryResult!6873)

(assert (=> b!644696 (= e!369395 e!369394)))

(declare-fun d!91085 () Bool)

(declare-fun lt!298862 () SeekEntryResult!6873)

(assert (=> d!91085 (and (or ((_ is Undefined!6873) lt!298862) (not ((_ is Found!6873) lt!298862)) (and (bvsge (index!29825 lt!298862) #b00000000000000000000000000000000) (bvslt (index!29825 lt!298862) (size!18797 lt!298785)))) (or ((_ is Undefined!6873) lt!298862) ((_ is Found!6873) lt!298862) (not ((_ is MissingVacant!6873) lt!298862)) (not (= (index!29827 lt!298862) vacantSpotIndex!68)) (and (bvsge (index!29827 lt!298862) #b00000000000000000000000000000000) (bvslt (index!29827 lt!298862) (size!18797 lt!298785)))) (or ((_ is Undefined!6873) lt!298862) (ite ((_ is Found!6873) lt!298862) (= (select (arr!18433 lt!298785) (index!29825 lt!298862)) lt!298786) (and ((_ is MissingVacant!6873) lt!298862) (= (index!29827 lt!298862) vacantSpotIndex!68) (= (select (arr!18433 lt!298785) (index!29827 lt!298862)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!369393 () SeekEntryResult!6873)

(assert (=> d!91085 (= lt!298862 e!369393)))

(declare-fun c!73866 () Bool)

(assert (=> d!91085 (= c!73866 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!91085 (= lt!298861 (select (arr!18433 lt!298785) lt!298783))))

(assert (=> d!91085 (validMask!0 mask!3053)))

(assert (=> d!91085 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298783 vacantSpotIndex!68 lt!298786 lt!298785 mask!3053) lt!298862)))

(declare-fun b!644697 () Bool)

(assert (=> b!644697 (= e!369394 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!298783 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!298786 lt!298785 mask!3053))))

(declare-fun b!644698 () Bool)

(assert (=> b!644698 (= e!369393 Undefined!6873)))

(declare-fun b!644699 () Bool)

(assert (=> b!644699 (= e!369394 (MissingVacant!6873 vacantSpotIndex!68))))

(declare-fun b!644700 () Bool)

(assert (=> b!644700 (= e!369395 (Found!6873 lt!298783))))

(declare-fun b!644701 () Bool)

(assert (=> b!644701 (= e!369393 e!369395)))

(declare-fun c!73868 () Bool)

(assert (=> b!644701 (= c!73868 (= lt!298861 lt!298786))))

(assert (= (and d!91085 c!73866) b!644698))

(assert (= (and d!91085 (not c!73866)) b!644701))

(assert (= (and b!644701 c!73868) b!644700))

(assert (= (and b!644701 (not c!73868)) b!644696))

(assert (= (and b!644696 c!73867) b!644699))

(assert (= (and b!644696 (not c!73867)) b!644697))

(declare-fun m!618311 () Bool)

(assert (=> d!91085 m!618311))

(declare-fun m!618313 () Bool)

(assert (=> d!91085 m!618313))

(declare-fun m!618315 () Bool)

(assert (=> d!91085 m!618315))

(assert (=> d!91085 m!618193))

(assert (=> b!644697 m!618295))

(assert (=> b!644697 m!618295))

(declare-fun m!618317 () Bool)

(assert (=> b!644697 m!618317))

(assert (=> b!644558 d!91085))

(declare-fun d!91087 () Bool)

(assert (=> d!91087 (arrayNoDuplicates!0 lt!298785 j!136 Nil!12471)))

(declare-fun lt!298865 () Unit!21864)

(declare-fun choose!39 (array!38439 (_ BitVec 32) (_ BitVec 32)) Unit!21864)

(assert (=> d!91087 (= lt!298865 (choose!39 lt!298785 #b00000000000000000000000000000000 j!136))))

(assert (=> d!91087 (bvslt (size!18797 lt!298785) #b01111111111111111111111111111111)))

(assert (=> d!91087 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!298785 #b00000000000000000000000000000000 j!136) lt!298865)))

(declare-fun bs!19271 () Bool)

(assert (= bs!19271 d!91087))

(assert (=> bs!19271 m!618183))

(declare-fun m!618319 () Bool)

(assert (=> bs!19271 m!618319))

(assert (=> b!644569 d!91087))

(declare-fun d!91089 () Bool)

(assert (=> d!91089 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18797 lt!298785)) (not (= (select (arr!18433 lt!298785) j!136) (select (arr!18433 a!2986) j!136))))))

(declare-fun lt!298868 () Unit!21864)

(declare-fun choose!21 (array!38439 (_ BitVec 64) (_ BitVec 32) List!12474) Unit!21864)

(assert (=> d!91089 (= lt!298868 (choose!21 lt!298785 (select (arr!18433 a!2986) j!136) j!136 Nil!12471))))

(assert (=> d!91089 (bvslt (size!18797 lt!298785) #b01111111111111111111111111111111)))

(assert (=> d!91089 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!298785 (select (arr!18433 a!2986) j!136) j!136 Nil!12471) lt!298868)))

(declare-fun bs!19272 () Bool)

(assert (= bs!19272 d!91089))

(assert (=> bs!19272 m!618285))

(assert (=> bs!19272 m!618149))

(declare-fun m!618321 () Bool)

(assert (=> bs!19272 m!618321))

(assert (=> b!644569 d!91089))

(declare-fun d!91093 () Bool)

(assert (=> d!91093 (arrayContainsKey!0 lt!298785 (select (arr!18433 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!298871 () Unit!21864)

(declare-fun choose!114 (array!38439 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21864)

(assert (=> d!91093 (= lt!298871 (choose!114 lt!298785 (select (arr!18433 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!91093 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!91093 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!298785 (select (arr!18433 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!298871)))

(declare-fun bs!19273 () Bool)

(assert (= bs!19273 d!91093))

(assert (=> bs!19273 m!618149))

(assert (=> bs!19273 m!618187))

(assert (=> bs!19273 m!618149))

(declare-fun m!618323 () Bool)

(assert (=> bs!19273 m!618323))

(assert (=> b!644569 d!91093))

(declare-fun b!644712 () Bool)

(declare-fun e!369405 () Bool)

(declare-fun e!369406 () Bool)

(assert (=> b!644712 (= e!369405 e!369406)))

(declare-fun c!73871 () Bool)

(assert (=> b!644712 (= c!73871 (validKeyInArray!0 (select (arr!18433 lt!298785) j!136)))))

(declare-fun bm!33611 () Bool)

(declare-fun call!33614 () Bool)

(assert (=> bm!33611 (= call!33614 (arrayNoDuplicates!0 lt!298785 (bvadd j!136 #b00000000000000000000000000000001) (ite c!73871 (Cons!12470 (select (arr!18433 lt!298785) j!136) Nil!12471) Nil!12471)))))

(declare-fun b!644713 () Bool)

(declare-fun e!369407 () Bool)

(declare-fun contains!3144 (List!12474 (_ BitVec 64)) Bool)

(assert (=> b!644713 (= e!369407 (contains!3144 Nil!12471 (select (arr!18433 lt!298785) j!136)))))

(declare-fun b!644714 () Bool)

(assert (=> b!644714 (= e!369406 call!33614)))

(declare-fun b!644715 () Bool)

(assert (=> b!644715 (= e!369406 call!33614)))

(declare-fun b!644716 () Bool)

(declare-fun e!369404 () Bool)

(assert (=> b!644716 (= e!369404 e!369405)))

(declare-fun res!417705 () Bool)

(assert (=> b!644716 (=> (not res!417705) (not e!369405))))

(assert (=> b!644716 (= res!417705 (not e!369407))))

(declare-fun res!417704 () Bool)

(assert (=> b!644716 (=> (not res!417704) (not e!369407))))

(assert (=> b!644716 (= res!417704 (validKeyInArray!0 (select (arr!18433 lt!298785) j!136)))))

(declare-fun d!91095 () Bool)

(declare-fun res!417706 () Bool)

(assert (=> d!91095 (=> res!417706 e!369404)))

(assert (=> d!91095 (= res!417706 (bvsge j!136 (size!18797 lt!298785)))))

(assert (=> d!91095 (= (arrayNoDuplicates!0 lt!298785 j!136 Nil!12471) e!369404)))

(assert (= (and d!91095 (not res!417706)) b!644716))

(assert (= (and b!644716 res!417704) b!644713))

(assert (= (and b!644716 res!417705) b!644712))

(assert (= (and b!644712 c!73871) b!644714))

(assert (= (and b!644712 (not c!73871)) b!644715))

(assert (= (or b!644714 b!644715) bm!33611))

(assert (=> b!644712 m!618285))

(assert (=> b!644712 m!618285))

(declare-fun m!618325 () Bool)

(assert (=> b!644712 m!618325))

(assert (=> bm!33611 m!618285))

(declare-fun m!618327 () Bool)

(assert (=> bm!33611 m!618327))

(assert (=> b!644713 m!618285))

(assert (=> b!644713 m!618285))

(declare-fun m!618329 () Bool)

(assert (=> b!644713 m!618329))

(assert (=> b!644716 m!618285))

(assert (=> b!644716 m!618285))

(assert (=> b!644716 m!618325))

(assert (=> b!644569 d!91095))

(declare-fun d!91101 () Bool)

(declare-fun e!369424 () Bool)

(assert (=> d!91101 e!369424))

(declare-fun res!417717 () Bool)

(assert (=> d!91101 (=> (not res!417717) (not e!369424))))

(assert (=> d!91101 (= res!417717 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18797 a!2986))))))

(declare-fun lt!298878 () Unit!21864)

(declare-fun choose!41 (array!38439 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12474) Unit!21864)

(assert (=> d!91101 (= lt!298878 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12471))))

(assert (=> d!91101 (bvslt (size!18797 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!91101 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12471) lt!298878)))

(declare-fun b!644739 () Bool)

(assert (=> b!644739 (= e!369424 (arrayNoDuplicates!0 (array!38440 (store (arr!18433 a!2986) i!1108 k0!1786) (size!18797 a!2986)) #b00000000000000000000000000000000 Nil!12471))))

(assert (= (and d!91101 res!417717) b!644739))

(declare-fun m!618339 () Bool)

(assert (=> d!91101 m!618339))

(assert (=> b!644739 m!618159))

(declare-fun m!618341 () Bool)

(assert (=> b!644739 m!618341))

(assert (=> b!644569 d!91101))

(declare-fun d!91107 () Bool)

(declare-fun res!417718 () Bool)

(declare-fun e!369425 () Bool)

(assert (=> d!91107 (=> res!417718 e!369425)))

(assert (=> d!91107 (= res!417718 (= (select (arr!18433 lt!298785) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18433 a!2986) j!136)))))

(assert (=> d!91107 (= (arrayContainsKey!0 lt!298785 (select (arr!18433 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!369425)))

(declare-fun b!644740 () Bool)

(declare-fun e!369426 () Bool)

(assert (=> b!644740 (= e!369425 e!369426)))

(declare-fun res!417719 () Bool)

(assert (=> b!644740 (=> (not res!417719) (not e!369426))))

(assert (=> b!644740 (= res!417719 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18797 lt!298785)))))

(declare-fun b!644741 () Bool)

(assert (=> b!644741 (= e!369426 (arrayContainsKey!0 lt!298785 (select (arr!18433 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91107 (not res!417718)) b!644740))

(assert (= (and b!644740 res!417719) b!644741))

(declare-fun m!618343 () Bool)

(assert (=> d!91107 m!618343))

(assert (=> b!644741 m!618149))

(declare-fun m!618345 () Bool)

(assert (=> b!644741 m!618345))

(assert (=> b!644569 d!91107))

(declare-fun b!644742 () Bool)

(declare-fun e!369428 () Bool)

(declare-fun e!369429 () Bool)

(assert (=> b!644742 (= e!369428 e!369429)))

(declare-fun c!73878 () Bool)

(assert (=> b!644742 (= c!73878 (validKeyInArray!0 (select (arr!18433 lt!298785) #b00000000000000000000000000000000)))))

(declare-fun bm!33612 () Bool)

(declare-fun call!33615 () Bool)

(assert (=> bm!33612 (= call!33615 (arrayNoDuplicates!0 lt!298785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73878 (Cons!12470 (select (arr!18433 lt!298785) #b00000000000000000000000000000000) Nil!12471) Nil!12471)))))

(declare-fun b!644743 () Bool)

(declare-fun e!369430 () Bool)

(assert (=> b!644743 (= e!369430 (contains!3144 Nil!12471 (select (arr!18433 lt!298785) #b00000000000000000000000000000000)))))

(declare-fun b!644744 () Bool)

(assert (=> b!644744 (= e!369429 call!33615)))

(declare-fun b!644745 () Bool)

(assert (=> b!644745 (= e!369429 call!33615)))

(declare-fun b!644746 () Bool)

(declare-fun e!369427 () Bool)

(assert (=> b!644746 (= e!369427 e!369428)))

(declare-fun res!417721 () Bool)

(assert (=> b!644746 (=> (not res!417721) (not e!369428))))

(assert (=> b!644746 (= res!417721 (not e!369430))))

(declare-fun res!417720 () Bool)

(assert (=> b!644746 (=> (not res!417720) (not e!369430))))

(assert (=> b!644746 (= res!417720 (validKeyInArray!0 (select (arr!18433 lt!298785) #b00000000000000000000000000000000)))))

(declare-fun d!91109 () Bool)

(declare-fun res!417722 () Bool)

(assert (=> d!91109 (=> res!417722 e!369427)))

(assert (=> d!91109 (= res!417722 (bvsge #b00000000000000000000000000000000 (size!18797 lt!298785)))))

(assert (=> d!91109 (= (arrayNoDuplicates!0 lt!298785 #b00000000000000000000000000000000 Nil!12471) e!369427)))

(assert (= (and d!91109 (not res!417722)) b!644746))

(assert (= (and b!644746 res!417720) b!644743))

(assert (= (and b!644746 res!417721) b!644742))

(assert (= (and b!644742 c!73878) b!644744))

(assert (= (and b!644742 (not c!73878)) b!644745))

(assert (= (or b!644744 b!644745) bm!33612))

(declare-fun m!618347 () Bool)

(assert (=> b!644742 m!618347))

(assert (=> b!644742 m!618347))

(declare-fun m!618349 () Bool)

(assert (=> b!644742 m!618349))

(assert (=> bm!33612 m!618347))

(declare-fun m!618351 () Bool)

(assert (=> bm!33612 m!618351))

(assert (=> b!644743 m!618347))

(assert (=> b!644743 m!618347))

(declare-fun m!618353 () Bool)

(assert (=> b!644743 m!618353))

(assert (=> b!644746 m!618347))

(assert (=> b!644746 m!618347))

(assert (=> b!644746 m!618349))

(assert (=> b!644569 d!91109))

(assert (=> b!644567 d!91073))

(declare-fun d!91111 () Bool)

(assert (=> d!91111 (= (validKeyInArray!0 (select (arr!18433 a!2986) j!136)) (and (not (= (select (arr!18433 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18433 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!644557 d!91111))

(declare-fun b!644753 () Bool)

(declare-fun e!369435 () Bool)

(declare-fun e!369436 () Bool)

(assert (=> b!644753 (= e!369435 e!369436)))

(declare-fun c!73882 () Bool)

(assert (=> b!644753 (= c!73882 (validKeyInArray!0 (select (arr!18433 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33613 () Bool)

(declare-fun call!33616 () Bool)

(assert (=> bm!33613 (= call!33616 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73882 (Cons!12470 (select (arr!18433 a!2986) #b00000000000000000000000000000000) Nil!12471) Nil!12471)))))

(declare-fun b!644754 () Bool)

(declare-fun e!369437 () Bool)

(assert (=> b!644754 (= e!369437 (contains!3144 Nil!12471 (select (arr!18433 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!644755 () Bool)

(assert (=> b!644755 (= e!369436 call!33616)))

(declare-fun b!644756 () Bool)

(assert (=> b!644756 (= e!369436 call!33616)))

(declare-fun b!644757 () Bool)

(declare-fun e!369434 () Bool)

(assert (=> b!644757 (= e!369434 e!369435)))

(declare-fun res!417724 () Bool)

(assert (=> b!644757 (=> (not res!417724) (not e!369435))))

(assert (=> b!644757 (= res!417724 (not e!369437))))

(declare-fun res!417723 () Bool)

(assert (=> b!644757 (=> (not res!417723) (not e!369437))))

(assert (=> b!644757 (= res!417723 (validKeyInArray!0 (select (arr!18433 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!91115 () Bool)

(declare-fun res!417725 () Bool)

(assert (=> d!91115 (=> res!417725 e!369434)))

(assert (=> d!91115 (= res!417725 (bvsge #b00000000000000000000000000000000 (size!18797 a!2986)))))

(assert (=> d!91115 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12471) e!369434)))

(assert (= (and d!91115 (not res!417725)) b!644757))

(assert (= (and b!644757 res!417723) b!644754))

(assert (= (and b!644757 res!417724) b!644753))

(assert (= (and b!644753 c!73882) b!644755))

(assert (= (and b!644753 (not c!73882)) b!644756))

(assert (= (or b!644755 b!644756) bm!33613))

(assert (=> b!644753 m!618269))

(assert (=> b!644753 m!618269))

(assert (=> b!644753 m!618277))

(assert (=> bm!33613 m!618269))

(declare-fun m!618361 () Bool)

(assert (=> bm!33613 m!618361))

(assert (=> b!644754 m!618269))

(assert (=> b!644754 m!618269))

(declare-fun m!618363 () Bool)

(assert (=> b!644754 m!618363))

(assert (=> b!644757 m!618269))

(assert (=> b!644757 m!618269))

(assert (=> b!644757 m!618277))

(assert (=> b!644560 d!91115))

(declare-fun b!644762 () Bool)

(declare-fun c!73884 () Bool)

(declare-fun lt!298881 () (_ BitVec 64))

(assert (=> b!644762 (= c!73884 (= lt!298881 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!369444 () SeekEntryResult!6873)

(declare-fun e!369443 () SeekEntryResult!6873)

(assert (=> b!644762 (= e!369444 e!369443)))

(declare-fun d!91117 () Bool)

(declare-fun lt!298882 () SeekEntryResult!6873)

(assert (=> d!91117 (and (or ((_ is Undefined!6873) lt!298882) (not ((_ is Found!6873) lt!298882)) (and (bvsge (index!29825 lt!298882) #b00000000000000000000000000000000) (bvslt (index!29825 lt!298882) (size!18797 a!2986)))) (or ((_ is Undefined!6873) lt!298882) ((_ is Found!6873) lt!298882) (not ((_ is MissingVacant!6873) lt!298882)) (not (= (index!29827 lt!298882) vacantSpotIndex!68)) (and (bvsge (index!29827 lt!298882) #b00000000000000000000000000000000) (bvslt (index!29827 lt!298882) (size!18797 a!2986)))) (or ((_ is Undefined!6873) lt!298882) (ite ((_ is Found!6873) lt!298882) (= (select (arr!18433 a!2986) (index!29825 lt!298882)) (select (arr!18433 a!2986) j!136)) (and ((_ is MissingVacant!6873) lt!298882) (= (index!29827 lt!298882) vacantSpotIndex!68) (= (select (arr!18433 a!2986) (index!29827 lt!298882)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!369442 () SeekEntryResult!6873)

(assert (=> d!91117 (= lt!298882 e!369442)))

(declare-fun c!73883 () Bool)

(assert (=> d!91117 (= c!73883 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!91117 (= lt!298881 (select (arr!18433 a!2986) index!984))))

(assert (=> d!91117 (validMask!0 mask!3053)))

(assert (=> d!91117 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18433 a!2986) j!136) a!2986 mask!3053) lt!298882)))

(declare-fun b!644763 () Bool)

(assert (=> b!644763 (= e!369443 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18433 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!644764 () Bool)

(assert (=> b!644764 (= e!369442 Undefined!6873)))

(declare-fun b!644765 () Bool)

(assert (=> b!644765 (= e!369443 (MissingVacant!6873 vacantSpotIndex!68))))

(declare-fun b!644766 () Bool)

(assert (=> b!644766 (= e!369444 (Found!6873 index!984))))

(declare-fun b!644767 () Bool)

(assert (=> b!644767 (= e!369442 e!369444)))

(declare-fun c!73885 () Bool)

(assert (=> b!644767 (= c!73885 (= lt!298881 (select (arr!18433 a!2986) j!136)))))

(assert (= (and d!91117 c!73883) b!644764))

(assert (= (and d!91117 (not c!73883)) b!644767))

(assert (= (and b!644767 c!73885) b!644766))

(assert (= (and b!644767 (not c!73885)) b!644762))

(assert (= (and b!644762 c!73884) b!644765))

(assert (= (and b!644762 (not c!73884)) b!644763))

(declare-fun m!618365 () Bool)

(assert (=> d!91117 m!618365))

(declare-fun m!618367 () Bool)

(assert (=> d!91117 m!618367))

(assert (=> d!91117 m!618153))

(assert (=> d!91117 m!618193))

(assert (=> b!644763 m!618163))

(assert (=> b!644763 m!618163))

(assert (=> b!644763 m!618149))

(declare-fun m!618369 () Bool)

(assert (=> b!644763 m!618369))

(assert (=> b!644571 d!91117))

(declare-fun d!91119 () Bool)

(assert (=> d!91119 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!58342 d!91119))

(declare-fun d!91125 () Bool)

(assert (=> d!91125 (= (array_inv!14229 a!2986) (bvsge (size!18797 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!58342 d!91125))

(assert (=> b!644574 d!91075))

(declare-fun d!91127 () Bool)

(declare-fun res!417738 () Bool)

(declare-fun e!369462 () Bool)

(assert (=> d!91127 (=> res!417738 e!369462)))

(assert (=> d!91127 (= res!417738 (= (select (arr!18433 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!91127 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!369462)))

(declare-fun b!644794 () Bool)

(declare-fun e!369463 () Bool)

(assert (=> b!644794 (= e!369462 e!369463)))

(declare-fun res!417739 () Bool)

(assert (=> b!644794 (=> (not res!417739) (not e!369463))))

(assert (=> b!644794 (= res!417739 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18797 a!2986)))))

(declare-fun b!644795 () Bool)

(assert (=> b!644795 (= e!369463 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!91127 (not res!417738)) b!644794))

(assert (= (and b!644794 res!417739) b!644795))

(assert (=> d!91127 m!618269))

(declare-fun m!618385 () Bool)

(assert (=> b!644795 m!618385))

(assert (=> b!644572 d!91127))

(declare-fun d!91129 () Bool)

(assert (=> d!91129 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!644562 d!91129))

(declare-fun b!644860 () Bool)

(declare-fun e!369512 () SeekEntryResult!6873)

(declare-fun lt!298917 () SeekEntryResult!6873)

(assert (=> b!644860 (= e!369512 (Found!6873 (index!29826 lt!298917)))))

(declare-fun b!644861 () Bool)

(declare-fun e!369513 () SeekEntryResult!6873)

(assert (=> b!644861 (= e!369513 e!369512)))

(declare-fun lt!298918 () (_ BitVec 64))

(assert (=> b!644861 (= lt!298918 (select (arr!18433 a!2986) (index!29826 lt!298917)))))

(declare-fun c!73911 () Bool)

(assert (=> b!644861 (= c!73911 (= lt!298918 k0!1786))))

(declare-fun b!644862 () Bool)

(declare-fun e!369514 () SeekEntryResult!6873)

(assert (=> b!644862 (= e!369514 (MissingZero!6873 (index!29826 lt!298917)))))

(declare-fun d!91131 () Bool)

(declare-fun lt!298916 () SeekEntryResult!6873)

(assert (=> d!91131 (and (or ((_ is Undefined!6873) lt!298916) (not ((_ is Found!6873) lt!298916)) (and (bvsge (index!29825 lt!298916) #b00000000000000000000000000000000) (bvslt (index!29825 lt!298916) (size!18797 a!2986)))) (or ((_ is Undefined!6873) lt!298916) ((_ is Found!6873) lt!298916) (not ((_ is MissingZero!6873) lt!298916)) (and (bvsge (index!29824 lt!298916) #b00000000000000000000000000000000) (bvslt (index!29824 lt!298916) (size!18797 a!2986)))) (or ((_ is Undefined!6873) lt!298916) ((_ is Found!6873) lt!298916) ((_ is MissingZero!6873) lt!298916) (not ((_ is MissingVacant!6873) lt!298916)) (and (bvsge (index!29827 lt!298916) #b00000000000000000000000000000000) (bvslt (index!29827 lt!298916) (size!18797 a!2986)))) (or ((_ is Undefined!6873) lt!298916) (ite ((_ is Found!6873) lt!298916) (= (select (arr!18433 a!2986) (index!29825 lt!298916)) k0!1786) (ite ((_ is MissingZero!6873) lt!298916) (= (select (arr!18433 a!2986) (index!29824 lt!298916)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6873) lt!298916) (= (select (arr!18433 a!2986) (index!29827 lt!298916)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!91131 (= lt!298916 e!369513)))

(declare-fun c!73912 () Bool)

(assert (=> d!91131 (= c!73912 (and ((_ is Intermediate!6873) lt!298917) (undefined!7685 lt!298917)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38439 (_ BitVec 32)) SeekEntryResult!6873)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91131 (= lt!298917 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!91131 (validMask!0 mask!3053)))

(assert (=> d!91131 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!298916)))

(declare-fun b!644863 () Bool)

(declare-fun c!73913 () Bool)

(assert (=> b!644863 (= c!73913 (= lt!298918 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!644863 (= e!369512 e!369514)))

(declare-fun b!644864 () Bool)

(assert (=> b!644864 (= e!369513 Undefined!6873)))

(declare-fun b!644865 () Bool)

(assert (=> b!644865 (= e!369514 (seekKeyOrZeroReturnVacant!0 (x!58593 lt!298917) (index!29826 lt!298917) (index!29826 lt!298917) k0!1786 a!2986 mask!3053))))

(assert (= (and d!91131 c!73912) b!644864))

(assert (= (and d!91131 (not c!73912)) b!644861))

(assert (= (and b!644861 c!73911) b!644860))

(assert (= (and b!644861 (not c!73911)) b!644863))

(assert (= (and b!644863 c!73913) b!644862))

(assert (= (and b!644863 (not c!73913)) b!644865))

(declare-fun m!618439 () Bool)

(assert (=> b!644861 m!618439))

(declare-fun m!618441 () Bool)

(assert (=> d!91131 m!618441))

(declare-fun m!618443 () Bool)

(assert (=> d!91131 m!618443))

(assert (=> d!91131 m!618193))

(declare-fun m!618445 () Bool)

(assert (=> d!91131 m!618445))

(declare-fun m!618447 () Bool)

(assert (=> d!91131 m!618447))

(declare-fun m!618449 () Bool)

(assert (=> d!91131 m!618449))

(assert (=> d!91131 m!618445))

(declare-fun m!618451 () Bool)

(assert (=> b!644865 m!618451))

(assert (=> b!644573 d!91131))

(check-sat (not b!644691) (not b!644743) (not b!644689) (not b!644795) (not d!91083) (not b!644741) (not b!644865) (not b!644713) (not d!91117) (not b!644754) (not b!644753) (not d!91089) (not d!91087) (not d!91077) (not b!644712) (not b!644682) (not b!644697) (not bm!33608) (not b!644657) (not b!644746) (not b!644742) (not b!644763) (not b!644668) (not d!91131) (not d!91101) (not b!644757) (not d!91079) (not b!644666) (not d!91093) (not d!91081) (not bm!33613) (not d!91085) (not b!644716) (not bm!33612) (not bm!33611) (not b!644739) (not b!644658))
(check-sat)
