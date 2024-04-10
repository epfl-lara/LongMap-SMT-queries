; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59466 () Bool)

(assert start!59466)

(declare-fun b!656681 () Bool)

(declare-datatypes ((Unit!22664 0))(
  ( (Unit!22665) )
))
(declare-fun e!377177 () Unit!22664)

(declare-fun Unit!22666 () Unit!22664)

(assert (=> b!656681 (= e!377177 Unit!22666)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun res!425909 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38705 0))(
  ( (array!38706 (arr!18551 (Array (_ BitVec 32) (_ BitVec 64))) (size!18915 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38705)

(assert (=> b!656681 (= res!425909 (= (select (store (arr!18551 a!2986) i!1108 k!1786) index!984) (select (arr!18551 a!2986) j!136)))))

(declare-fun e!377181 () Bool)

(assert (=> b!656681 (=> (not res!425909) (not e!377181))))

(assert (=> b!656681 e!377181))

(declare-fun c!75757 () Bool)

(assert (=> b!656681 (= c!75757 (bvslt j!136 index!984))))

(declare-fun lt!306583 () Unit!22664)

(declare-fun e!377186 () Unit!22664)

(assert (=> b!656681 (= lt!306583 e!377186)))

(declare-fun c!75758 () Bool)

(assert (=> b!656681 (= c!75758 (bvslt index!984 j!136))))

(declare-fun lt!306595 () Unit!22664)

(declare-fun e!377175 () Unit!22664)

(assert (=> b!656681 (= lt!306595 e!377175)))

(assert (=> b!656681 false))

(declare-fun b!656682 () Bool)

(declare-fun res!425917 () Bool)

(declare-fun e!377174 () Bool)

(assert (=> b!656682 (=> (not res!425917) (not e!377174))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38705 (_ BitVec 32)) Bool)

(assert (=> b!656682 (= res!425917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!656683 () Bool)

(declare-fun res!425916 () Bool)

(declare-fun e!377180 () Bool)

(assert (=> b!656683 (=> (not res!425916) (not e!377180))))

(assert (=> b!656683 (= res!425916 (and (= (size!18915 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18915 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18915 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!656684 () Bool)

(declare-fun e!377184 () Unit!22664)

(declare-fun Unit!22667 () Unit!22664)

(assert (=> b!656684 (= e!377184 Unit!22667)))

(assert (=> b!656684 false))

(declare-fun b!656685 () Bool)

(declare-fun Unit!22668 () Unit!22664)

(assert (=> b!656685 (= e!377186 Unit!22668)))

(declare-fun b!656686 () Bool)

(declare-fun res!425919 () Bool)

(assert (=> b!656686 (= res!425919 (bvsge j!136 index!984))))

(declare-fun e!377176 () Bool)

(assert (=> b!656686 (=> res!425919 e!377176)))

(assert (=> b!656686 (= e!377181 e!377176)))

(declare-fun b!656687 () Bool)

(declare-fun Unit!22669 () Unit!22664)

(assert (=> b!656687 (= e!377175 Unit!22669)))

(declare-fun b!656688 () Bool)

(declare-fun e!377182 () Bool)

(declare-fun e!377173 () Bool)

(assert (=> b!656688 (= e!377182 e!377173)))

(declare-fun res!425908 () Bool)

(assert (=> b!656688 (=> (not res!425908) (not e!377173))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6991 0))(
  ( (MissingZero!6991 (index!30326 (_ BitVec 32))) (Found!6991 (index!30327 (_ BitVec 32))) (Intermediate!6991 (undefined!7803 Bool) (index!30328 (_ BitVec 32)) (x!59113 (_ BitVec 32))) (Undefined!6991) (MissingVacant!6991 (index!30329 (_ BitVec 32))) )
))
(declare-fun lt!306594 () SeekEntryResult!6991)

(assert (=> b!656688 (= res!425908 (and (= lt!306594 (Found!6991 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18551 a!2986) index!984) (select (arr!18551 a!2986) j!136))) (not (= (select (arr!18551 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38705 (_ BitVec 32)) SeekEntryResult!6991)

(assert (=> b!656688 (= lt!306594 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18551 a!2986) j!136) a!2986 mask!3053))))

(declare-fun lt!306576 () array!38705)

(declare-fun b!656689 () Bool)

(declare-fun res!425910 () Bool)

(declare-fun arrayContainsKey!0 (array!38705 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!656689 (= res!425910 (arrayContainsKey!0 lt!306576 (select (arr!18551 a!2986) j!136) j!136))))

(declare-fun e!377187 () Bool)

(assert (=> b!656689 (=> (not res!425910) (not e!377187))))

(assert (=> b!656689 (= e!377176 e!377187)))

(declare-fun b!656690 () Bool)

(declare-fun Unit!22670 () Unit!22664)

(assert (=> b!656690 (= e!377177 Unit!22670)))

(declare-fun b!656691 () Bool)

(declare-fun e!377178 () Bool)

(assert (=> b!656691 (= e!377178 (arrayContainsKey!0 lt!306576 (select (arr!18551 a!2986) j!136) index!984))))

(declare-fun b!656692 () Bool)

(declare-fun e!377183 () Bool)

(declare-fun lt!306579 () SeekEntryResult!6991)

(assert (=> b!656692 (= e!377183 (= lt!306594 lt!306579))))

(declare-fun b!656693 () Bool)

(declare-fun res!425912 () Bool)

(assert (=> b!656693 (=> (not res!425912) (not e!377180))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!656693 (= res!425912 (validKeyInArray!0 (select (arr!18551 a!2986) j!136)))))

(declare-fun b!656694 () Bool)

(assert (=> b!656694 false))

(declare-fun lt!306590 () Unit!22664)

(declare-datatypes ((List!12592 0))(
  ( (Nil!12589) (Cons!12588 (h!13633 (_ BitVec 64)) (t!18820 List!12592)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38705 (_ BitVec 64) (_ BitVec 32) List!12592) Unit!22664)

(assert (=> b!656694 (= lt!306590 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306576 (select (arr!18551 a!2986) j!136) index!984 Nil!12589))))

(declare-fun arrayNoDuplicates!0 (array!38705 (_ BitVec 32) List!12592) Bool)

(assert (=> b!656694 (arrayNoDuplicates!0 lt!306576 index!984 Nil!12589)))

(declare-fun lt!306587 () Unit!22664)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38705 (_ BitVec 32) (_ BitVec 32)) Unit!22664)

(assert (=> b!656694 (= lt!306587 (lemmaNoDuplicateFromThenFromBigger!0 lt!306576 #b00000000000000000000000000000000 index!984))))

(assert (=> b!656694 (arrayNoDuplicates!0 lt!306576 #b00000000000000000000000000000000 Nil!12589)))

(declare-fun lt!306582 () Unit!22664)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38705 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12592) Unit!22664)

(assert (=> b!656694 (= lt!306582 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12589))))

(assert (=> b!656694 (arrayContainsKey!0 lt!306576 (select (arr!18551 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!306593 () Unit!22664)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38705 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22664)

(assert (=> b!656694 (= lt!306593 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306576 (select (arr!18551 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!656694 e!377178))

(declare-fun res!425915 () Bool)

(assert (=> b!656694 (=> (not res!425915) (not e!377178))))

(assert (=> b!656694 (= res!425915 (arrayContainsKey!0 lt!306576 (select (arr!18551 a!2986) j!136) j!136))))

(declare-fun Unit!22671 () Unit!22664)

(assert (=> b!656694 (= e!377175 Unit!22671)))

(declare-fun b!656695 () Bool)

(declare-fun res!425918 () Bool)

(assert (=> b!656695 (=> (not res!425918) (not e!377174))))

(assert (=> b!656695 (= res!425918 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12589))))

(declare-fun b!656696 () Bool)

(declare-fun e!377185 () Bool)

(assert (=> b!656696 (= e!377185 false)))

(assert (=> b!656696 (= (select (store (arr!18551 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun res!425921 () Bool)

(assert (=> start!59466 (=> (not res!425921) (not e!377180))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59466 (= res!425921 (validMask!0 mask!3053))))

(assert (=> start!59466 e!377180))

(assert (=> start!59466 true))

(declare-fun array_inv!14347 (array!38705) Bool)

(assert (=> start!59466 (array_inv!14347 a!2986)))

(declare-fun b!656697 () Bool)

(assert (=> b!656697 (= e!377173 (not e!377185))))

(declare-fun res!425920 () Bool)

(assert (=> b!656697 (=> res!425920 e!377185)))

(declare-fun lt!306580 () SeekEntryResult!6991)

(assert (=> b!656697 (= res!425920 (not (= lt!306580 (MissingVacant!6991 vacantSpotIndex!68))))))

(declare-fun lt!306588 () Unit!22664)

(assert (=> b!656697 (= lt!306588 e!377177)))

(declare-fun c!75756 () Bool)

(assert (=> b!656697 (= c!75756 (= lt!306580 (Found!6991 index!984)))))

(declare-fun lt!306591 () Unit!22664)

(assert (=> b!656697 (= lt!306591 e!377184)))

(declare-fun c!75755 () Bool)

(assert (=> b!656697 (= c!75755 (= lt!306580 Undefined!6991))))

(declare-fun lt!306589 () (_ BitVec 64))

(assert (=> b!656697 (= lt!306580 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!306589 lt!306576 mask!3053))))

(assert (=> b!656697 e!377183))

(declare-fun res!425905 () Bool)

(assert (=> b!656697 (=> (not res!425905) (not e!377183))))

(declare-fun lt!306585 () (_ BitVec 32))

(assert (=> b!656697 (= res!425905 (= lt!306579 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306585 vacantSpotIndex!68 lt!306589 lt!306576 mask!3053)))))

(assert (=> b!656697 (= lt!306579 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306585 vacantSpotIndex!68 (select (arr!18551 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!656697 (= lt!306589 (select (store (arr!18551 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!306584 () Unit!22664)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38705 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22664)

(assert (=> b!656697 (= lt!306584 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!306585 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!656697 (= lt!306585 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!656698 () Bool)

(declare-fun Unit!22672 () Unit!22664)

(assert (=> b!656698 (= e!377184 Unit!22672)))

(declare-fun b!656699 () Bool)

(declare-fun res!425913 () Bool)

(assert (=> b!656699 (=> (not res!425913) (not e!377174))))

(assert (=> b!656699 (= res!425913 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18551 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!656700 () Bool)

(assert (=> b!656700 (= e!377187 (arrayContainsKey!0 lt!306576 (select (arr!18551 a!2986) j!136) index!984))))

(declare-fun b!656701 () Bool)

(assert (=> b!656701 (= e!377174 e!377182)))

(declare-fun res!425906 () Bool)

(assert (=> b!656701 (=> (not res!425906) (not e!377182))))

(assert (=> b!656701 (= res!425906 (= (select (store (arr!18551 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!656701 (= lt!306576 (array!38706 (store (arr!18551 a!2986) i!1108 k!1786) (size!18915 a!2986)))))

(declare-fun b!656702 () Bool)

(declare-fun res!425907 () Bool)

(assert (=> b!656702 (=> (not res!425907) (not e!377180))))

(assert (=> b!656702 (= res!425907 (validKeyInArray!0 k!1786))))

(declare-fun b!656703 () Bool)

(declare-fun res!425911 () Bool)

(assert (=> b!656703 (=> (not res!425911) (not e!377180))))

(assert (=> b!656703 (= res!425911 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!656704 () Bool)

(assert (=> b!656704 false))

(declare-fun lt!306577 () Unit!22664)

(assert (=> b!656704 (= lt!306577 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306576 (select (arr!18551 a!2986) j!136) j!136 Nil!12589))))

(assert (=> b!656704 (arrayNoDuplicates!0 lt!306576 j!136 Nil!12589)))

(declare-fun lt!306578 () Unit!22664)

(assert (=> b!656704 (= lt!306578 (lemmaNoDuplicateFromThenFromBigger!0 lt!306576 #b00000000000000000000000000000000 j!136))))

(assert (=> b!656704 (arrayNoDuplicates!0 lt!306576 #b00000000000000000000000000000000 Nil!12589)))

(declare-fun lt!306586 () Unit!22664)

(assert (=> b!656704 (= lt!306586 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12589))))

(assert (=> b!656704 (arrayContainsKey!0 lt!306576 (select (arr!18551 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!306592 () Unit!22664)

(assert (=> b!656704 (= lt!306592 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306576 (select (arr!18551 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22673 () Unit!22664)

(assert (=> b!656704 (= e!377186 Unit!22673)))

(declare-fun b!656705 () Bool)

(assert (=> b!656705 (= e!377180 e!377174)))

(declare-fun res!425914 () Bool)

(assert (=> b!656705 (=> (not res!425914) (not e!377174))))

(declare-fun lt!306581 () SeekEntryResult!6991)

(assert (=> b!656705 (= res!425914 (or (= lt!306581 (MissingZero!6991 i!1108)) (= lt!306581 (MissingVacant!6991 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38705 (_ BitVec 32)) SeekEntryResult!6991)

(assert (=> b!656705 (= lt!306581 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!59466 res!425921) b!656683))

(assert (= (and b!656683 res!425916) b!656693))

(assert (= (and b!656693 res!425912) b!656702))

(assert (= (and b!656702 res!425907) b!656703))

(assert (= (and b!656703 res!425911) b!656705))

(assert (= (and b!656705 res!425914) b!656682))

(assert (= (and b!656682 res!425917) b!656695))

(assert (= (and b!656695 res!425918) b!656699))

(assert (= (and b!656699 res!425913) b!656701))

(assert (= (and b!656701 res!425906) b!656688))

(assert (= (and b!656688 res!425908) b!656697))

(assert (= (and b!656697 res!425905) b!656692))

(assert (= (and b!656697 c!75755) b!656684))

(assert (= (and b!656697 (not c!75755)) b!656698))

(assert (= (and b!656697 c!75756) b!656681))

(assert (= (and b!656697 (not c!75756)) b!656690))

(assert (= (and b!656681 res!425909) b!656686))

(assert (= (and b!656686 (not res!425919)) b!656689))

(assert (= (and b!656689 res!425910) b!656700))

(assert (= (and b!656681 c!75757) b!656704))

(assert (= (and b!656681 (not c!75757)) b!656685))

(assert (= (and b!656681 c!75758) b!656694))

(assert (= (and b!656681 (not c!75758)) b!656687))

(assert (= (and b!656694 res!425915) b!656691))

(assert (= (and b!656697 (not res!425920)) b!656696))

(declare-fun m!629737 () Bool)

(assert (=> b!656681 m!629737))

(declare-fun m!629739 () Bool)

(assert (=> b!656681 m!629739))

(declare-fun m!629741 () Bool)

(assert (=> b!656681 m!629741))

(declare-fun m!629743 () Bool)

(assert (=> b!656705 m!629743))

(assert (=> b!656701 m!629737))

(declare-fun m!629745 () Bool)

(assert (=> b!656701 m!629745))

(declare-fun m!629747 () Bool)

(assert (=> b!656694 m!629747))

(assert (=> b!656694 m!629741))

(declare-fun m!629749 () Bool)

(assert (=> b!656694 m!629749))

(assert (=> b!656694 m!629741))

(assert (=> b!656694 m!629741))

(declare-fun m!629751 () Bool)

(assert (=> b!656694 m!629751))

(declare-fun m!629753 () Bool)

(assert (=> b!656694 m!629753))

(assert (=> b!656694 m!629741))

(declare-fun m!629755 () Bool)

(assert (=> b!656694 m!629755))

(declare-fun m!629757 () Bool)

(assert (=> b!656694 m!629757))

(assert (=> b!656694 m!629741))

(declare-fun m!629759 () Bool)

(assert (=> b!656694 m!629759))

(declare-fun m!629761 () Bool)

(assert (=> b!656694 m!629761))

(assert (=> b!656691 m!629741))

(assert (=> b!656691 m!629741))

(declare-fun m!629763 () Bool)

(assert (=> b!656691 m!629763))

(declare-fun m!629765 () Bool)

(assert (=> b!656702 m!629765))

(assert (=> b!656696 m!629737))

(assert (=> b!656696 m!629739))

(declare-fun m!629767 () Bool)

(assert (=> b!656695 m!629767))

(assert (=> b!656689 m!629741))

(assert (=> b!656689 m!629741))

(assert (=> b!656689 m!629755))

(declare-fun m!629769 () Bool)

(assert (=> b!656703 m!629769))

(declare-fun m!629771 () Bool)

(assert (=> start!59466 m!629771))

(declare-fun m!629773 () Bool)

(assert (=> start!59466 m!629773))

(assert (=> b!656700 m!629741))

(assert (=> b!656700 m!629741))

(assert (=> b!656700 m!629763))

(assert (=> b!656693 m!629741))

(assert (=> b!656693 m!629741))

(declare-fun m!629775 () Bool)

(assert (=> b!656693 m!629775))

(assert (=> b!656704 m!629741))

(assert (=> b!656704 m!629741))

(declare-fun m!629777 () Bool)

(assert (=> b!656704 m!629777))

(assert (=> b!656704 m!629741))

(declare-fun m!629779 () Bool)

(assert (=> b!656704 m!629779))

(declare-fun m!629781 () Bool)

(assert (=> b!656704 m!629781))

(assert (=> b!656704 m!629757))

(assert (=> b!656704 m!629761))

(assert (=> b!656704 m!629741))

(declare-fun m!629783 () Bool)

(assert (=> b!656704 m!629783))

(declare-fun m!629785 () Bool)

(assert (=> b!656704 m!629785))

(declare-fun m!629787 () Bool)

(assert (=> b!656688 m!629787))

(assert (=> b!656688 m!629741))

(assert (=> b!656688 m!629741))

(declare-fun m!629789 () Bool)

(assert (=> b!656688 m!629789))

(declare-fun m!629791 () Bool)

(assert (=> b!656697 m!629791))

(declare-fun m!629793 () Bool)

(assert (=> b!656697 m!629793))

(assert (=> b!656697 m!629737))

(declare-fun m!629795 () Bool)

(assert (=> b!656697 m!629795))

(declare-fun m!629797 () Bool)

(assert (=> b!656697 m!629797))

(declare-fun m!629799 () Bool)

(assert (=> b!656697 m!629799))

(assert (=> b!656697 m!629741))

(declare-fun m!629801 () Bool)

(assert (=> b!656697 m!629801))

(assert (=> b!656697 m!629741))

(declare-fun m!629803 () Bool)

(assert (=> b!656682 m!629803))

(declare-fun m!629805 () Bool)

(assert (=> b!656699 m!629805))

(push 1)

(assert (not b!656694))

(assert (not b!656695))

(assert (not b!656693))

(assert (not b!656691))

(assert (not b!656705))

(assert (not b!656702))

(assert (not b!656700))

(assert (not b!656704))

(assert (not start!59466))

(assert (not b!656689))

(assert (not b!656682))

(assert (not b!656703))

(assert (not b!656697))

(assert (not b!656688))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!656761 () Bool)

(declare-fun e!377231 () SeekEntryResult!6991)

(assert (=> b!656761 (= e!377231 Undefined!6991)))

(declare-fun b!656762 () Bool)

(declare-fun c!75774 () Bool)

(declare-fun lt!306622 () (_ BitVec 64))

(assert (=> b!656762 (= c!75774 (= lt!306622 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!377230 () SeekEntryResult!6991)

(declare-fun e!377232 () SeekEntryResult!6991)

(assert (=> b!656762 (= e!377230 e!377232)))

(declare-fun b!656763 () Bool)

(assert (=> b!656763 (= e!377232 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18551 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!656764 () Bool)

(assert (=> b!656764 (= e!377230 (Found!6991 index!984))))

(declare-fun b!656765 () Bool)

(assert (=> b!656765 (= e!377232 (MissingVacant!6991 vacantSpotIndex!68))))

(declare-fun b!656766 () Bool)

(assert (=> b!656766 (= e!377231 e!377230)))

(declare-fun c!75773 () Bool)

(assert (=> b!656766 (= c!75773 (= lt!306622 (select (arr!18551 a!2986) j!136)))))

(declare-fun d!92777 () Bool)

(declare-fun lt!306621 () SeekEntryResult!6991)

(assert (=> d!92777 (and (or (is-Undefined!6991 lt!306621) (not (is-Found!6991 lt!306621)) (and (bvsge (index!30327 lt!306621) #b00000000000000000000000000000000) (bvslt (index!30327 lt!306621) (size!18915 a!2986)))) (or (is-Undefined!6991 lt!306621) (is-Found!6991 lt!306621) (not (is-MissingVacant!6991 lt!306621)) (not (= (index!30329 lt!306621) vacantSpotIndex!68)) (and (bvsge (index!30329 lt!306621) #b00000000000000000000000000000000) (bvslt (index!30329 lt!306621) (size!18915 a!2986)))) (or (is-Undefined!6991 lt!306621) (ite (is-Found!6991 lt!306621) (= (select (arr!18551 a!2986) (index!30327 lt!306621)) (select (arr!18551 a!2986) j!136)) (and (is-MissingVacant!6991 lt!306621) (= (index!30329 lt!306621) vacantSpotIndex!68) (= (select (arr!18551 a!2986) (index!30329 lt!306621)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92777 (= lt!306621 e!377231)))

(declare-fun c!75772 () Bool)

(assert (=> d!92777 (= c!75772 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!92777 (= lt!306622 (select (arr!18551 a!2986) index!984))))

(assert (=> d!92777 (validMask!0 mask!3053)))

(assert (=> d!92777 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18551 a!2986) j!136) a!2986 mask!3053) lt!306621)))

(assert (= (and d!92777 c!75772) b!656761))

(assert (= (and d!92777 (not c!75772)) b!656766))

(assert (= (and b!656766 c!75773) b!656764))

(assert (= (and b!656766 (not c!75773)) b!656762))

(assert (= (and b!656762 c!75774) b!656765))

(assert (= (and b!656762 (not c!75774)) b!656763))

(assert (=> b!656763 m!629791))

(assert (=> b!656763 m!629791))

(assert (=> b!656763 m!629741))

(declare-fun m!629853 () Bool)

(assert (=> b!656763 m!629853))

(declare-fun m!629855 () Bool)

(assert (=> d!92777 m!629855))

(declare-fun m!629857 () Bool)

(assert (=> d!92777 m!629857))

(assert (=> d!92777 m!629787))

(assert (=> d!92777 m!629771))

(assert (=> b!656688 d!92777))

(declare-fun d!92785 () Bool)

(declare-fun res!425957 () Bool)

(declare-fun e!377239 () Bool)

(assert (=> d!92785 (=> res!425957 e!377239)))

(assert (=> d!92785 (= res!425957 (= (select (arr!18551 lt!306576) j!136) (select (arr!18551 a!2986) j!136)))))

(assert (=> d!92785 (= (arrayContainsKey!0 lt!306576 (select (arr!18551 a!2986) j!136) j!136) e!377239)))

(declare-fun b!656773 () Bool)

(declare-fun e!377240 () Bool)

(assert (=> b!656773 (= e!377239 e!377240)))

(declare-fun res!425958 () Bool)

(assert (=> b!656773 (=> (not res!425958) (not e!377240))))

(assert (=> b!656773 (= res!425958 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18915 lt!306576)))))

(declare-fun b!656774 () Bool)

(assert (=> b!656774 (= e!377240 (arrayContainsKey!0 lt!306576 (select (arr!18551 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92785 (not res!425957)) b!656773))

(assert (= (and b!656773 res!425958) b!656774))

(declare-fun m!629861 () Bool)

(assert (=> d!92785 m!629861))

(assert (=> b!656774 m!629741))

(declare-fun m!629863 () Bool)

(assert (=> b!656774 m!629863))

(assert (=> b!656689 d!92785))

(declare-fun d!92791 () Bool)

(declare-fun res!425959 () Bool)

(declare-fun e!377241 () Bool)

(assert (=> d!92791 (=> res!425959 e!377241)))

(assert (=> d!92791 (= res!425959 (= (select (arr!18551 lt!306576) index!984) (select (arr!18551 a!2986) j!136)))))

(assert (=> d!92791 (= (arrayContainsKey!0 lt!306576 (select (arr!18551 a!2986) j!136) index!984) e!377241)))

(declare-fun b!656775 () Bool)

(declare-fun e!377242 () Bool)

(assert (=> b!656775 (= e!377241 e!377242)))

(declare-fun res!425960 () Bool)

(assert (=> b!656775 (=> (not res!425960) (not e!377242))))

(assert (=> b!656775 (= res!425960 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18915 lt!306576)))))

(declare-fun b!656776 () Bool)

(assert (=> b!656776 (= e!377242 (arrayContainsKey!0 lt!306576 (select (arr!18551 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92791 (not res!425959)) b!656775))

(assert (= (and b!656775 res!425960) b!656776))

(declare-fun m!629865 () Bool)

(assert (=> d!92791 m!629865))

(assert (=> b!656776 m!629741))

(declare-fun m!629867 () Bool)

(assert (=> b!656776 m!629867))

(assert (=> b!656700 d!92791))

(declare-fun d!92793 () Bool)

(assert (=> d!92793 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!59466 d!92793))

(declare-fun d!92795 () Bool)

(assert (=> d!92795 (= (array_inv!14347 a!2986) (bvsge (size!18915 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!59466 d!92795))

(declare-fun b!656777 () Bool)

(declare-fun e!377244 () SeekEntryResult!6991)

(assert (=> b!656777 (= e!377244 Undefined!6991)))

(declare-fun b!656778 () Bool)

(declare-fun c!75777 () Bool)

(declare-fun lt!306624 () (_ BitVec 64))

(assert (=> b!656778 (= c!75777 (= lt!306624 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!377243 () SeekEntryResult!6991)

(declare-fun e!377245 () SeekEntryResult!6991)

(assert (=> b!656778 (= e!377243 e!377245)))

(declare-fun b!656779 () Bool)

(assert (=> b!656779 (= e!377245 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!306585 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!306589 lt!306576 mask!3053))))

(declare-fun b!656780 () Bool)

(assert (=> b!656780 (= e!377243 (Found!6991 lt!306585))))

(declare-fun b!656781 () Bool)

(assert (=> b!656781 (= e!377245 (MissingVacant!6991 vacantSpotIndex!68))))

(declare-fun b!656782 () Bool)

(assert (=> b!656782 (= e!377244 e!377243)))

(declare-fun c!75776 () Bool)

(assert (=> b!656782 (= c!75776 (= lt!306624 lt!306589))))

(declare-fun d!92797 () Bool)

(declare-fun lt!306623 () SeekEntryResult!6991)

(assert (=> d!92797 (and (or (is-Undefined!6991 lt!306623) (not (is-Found!6991 lt!306623)) (and (bvsge (index!30327 lt!306623) #b00000000000000000000000000000000) (bvslt (index!30327 lt!306623) (size!18915 lt!306576)))) (or (is-Undefined!6991 lt!306623) (is-Found!6991 lt!306623) (not (is-MissingVacant!6991 lt!306623)) (not (= (index!30329 lt!306623) vacantSpotIndex!68)) (and (bvsge (index!30329 lt!306623) #b00000000000000000000000000000000) (bvslt (index!30329 lt!306623) (size!18915 lt!306576)))) (or (is-Undefined!6991 lt!306623) (ite (is-Found!6991 lt!306623) (= (select (arr!18551 lt!306576) (index!30327 lt!306623)) lt!306589) (and (is-MissingVacant!6991 lt!306623) (= (index!30329 lt!306623) vacantSpotIndex!68) (= (select (arr!18551 lt!306576) (index!30329 lt!306623)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92797 (= lt!306623 e!377244)))

(declare-fun c!75775 () Bool)

(assert (=> d!92797 (= c!75775 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92797 (= lt!306624 (select (arr!18551 lt!306576) lt!306585))))

(assert (=> d!92797 (validMask!0 mask!3053)))

(assert (=> d!92797 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306585 vacantSpotIndex!68 lt!306589 lt!306576 mask!3053) lt!306623)))

(assert (= (and d!92797 c!75775) b!656777))

(assert (= (and d!92797 (not c!75775)) b!656782))

(assert (= (and b!656782 c!75776) b!656780))

(assert (= (and b!656782 (not c!75776)) b!656778))

(assert (= (and b!656778 c!75777) b!656781))

(assert (= (and b!656778 (not c!75777)) b!656779))

(declare-fun m!629869 () Bool)

(assert (=> b!656779 m!629869))

(assert (=> b!656779 m!629869))

(declare-fun m!629871 () Bool)

(assert (=> b!656779 m!629871))

(declare-fun m!629873 () Bool)

(assert (=> d!92797 m!629873))

(declare-fun m!629875 () Bool)

(assert (=> d!92797 m!629875))

(declare-fun m!629877 () Bool)

(assert (=> d!92797 m!629877))

(assert (=> d!92797 m!629771))

(assert (=> b!656697 d!92797))

(declare-fun b!656783 () Bool)

(declare-fun e!377247 () SeekEntryResult!6991)

(assert (=> b!656783 (= e!377247 Undefined!6991)))

(declare-fun b!656784 () Bool)

(declare-fun c!75780 () Bool)

(declare-fun lt!306626 () (_ BitVec 64))

(assert (=> b!656784 (= c!75780 (= lt!306626 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!377246 () SeekEntryResult!6991)

(declare-fun e!377248 () SeekEntryResult!6991)

(assert (=> b!656784 (= e!377246 e!377248)))

(declare-fun b!656785 () Bool)

(assert (=> b!656785 (= e!377248 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!306589 lt!306576 mask!3053))))

(declare-fun b!656786 () Bool)

(assert (=> b!656786 (= e!377246 (Found!6991 index!984))))

(declare-fun b!656787 () Bool)

(assert (=> b!656787 (= e!377248 (MissingVacant!6991 vacantSpotIndex!68))))

(declare-fun b!656788 () Bool)

(assert (=> b!656788 (= e!377247 e!377246)))

(declare-fun c!75779 () Bool)

(assert (=> b!656788 (= c!75779 (= lt!306626 lt!306589))))

(declare-fun d!92799 () Bool)

(declare-fun lt!306625 () SeekEntryResult!6991)

(assert (=> d!92799 (and (or (is-Undefined!6991 lt!306625) (not (is-Found!6991 lt!306625)) (and (bvsge (index!30327 lt!306625) #b00000000000000000000000000000000) (bvslt (index!30327 lt!306625) (size!18915 lt!306576)))) (or (is-Undefined!6991 lt!306625) (is-Found!6991 lt!306625) (not (is-MissingVacant!6991 lt!306625)) (not (= (index!30329 lt!306625) vacantSpotIndex!68)) (and (bvsge (index!30329 lt!306625) #b00000000000000000000000000000000) (bvslt (index!30329 lt!306625) (size!18915 lt!306576)))) (or (is-Undefined!6991 lt!306625) (ite (is-Found!6991 lt!306625) (= (select (arr!18551 lt!306576) (index!30327 lt!306625)) lt!306589) (and (is-MissingVacant!6991 lt!306625) (= (index!30329 lt!306625) vacantSpotIndex!68) (= (select (arr!18551 lt!306576) (index!30329 lt!306625)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92799 (= lt!306625 e!377247)))

(declare-fun c!75778 () Bool)

(assert (=> d!92799 (= c!75778 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!92799 (= lt!306626 (select (arr!18551 lt!306576) index!984))))

(assert (=> d!92799 (validMask!0 mask!3053)))

(assert (=> d!92799 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!306589 lt!306576 mask!3053) lt!306625)))

(assert (= (and d!92799 c!75778) b!656783))

(assert (= (and d!92799 (not c!75778)) b!656788))

(assert (= (and b!656788 c!75779) b!656786))

(assert (= (and b!656788 (not c!75779)) b!656784))

(assert (= (and b!656784 c!75780) b!656787))

(assert (= (and b!656784 (not c!75780)) b!656785))

(assert (=> b!656785 m!629791))

(assert (=> b!656785 m!629791))

(declare-fun m!629879 () Bool)

(assert (=> b!656785 m!629879))

(declare-fun m!629881 () Bool)

(assert (=> d!92799 m!629881))

(declare-fun m!629883 () Bool)

(assert (=> d!92799 m!629883))

(assert (=> d!92799 m!629865))

(assert (=> d!92799 m!629771))

(assert (=> b!656697 d!92799))

(declare-fun d!92801 () Bool)

(declare-fun lt!306629 () (_ BitVec 32))

(assert (=> d!92801 (and (bvsge lt!306629 #b00000000000000000000000000000000) (bvslt lt!306629 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92801 (= lt!306629 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!92801 (validMask!0 mask!3053)))

(assert (=> d!92801 (= (nextIndex!0 index!984 x!910 mask!3053) lt!306629)))

(declare-fun bs!19552 () Bool)

(assert (= bs!19552 d!92801))

(declare-fun m!629885 () Bool)

(assert (=> bs!19552 m!629885))

(assert (=> bs!19552 m!629771))

(assert (=> b!656697 d!92801))

(declare-fun b!656789 () Bool)

(declare-fun e!377250 () SeekEntryResult!6991)

(assert (=> b!656789 (= e!377250 Undefined!6991)))

(declare-fun b!656790 () Bool)

(declare-fun c!75783 () Bool)

(declare-fun lt!306631 () (_ BitVec 64))

(assert (=> b!656790 (= c!75783 (= lt!306631 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!377249 () SeekEntryResult!6991)

(declare-fun e!377251 () SeekEntryResult!6991)

(assert (=> b!656790 (= e!377249 e!377251)))

(declare-fun b!656791 () Bool)

(assert (=> b!656791 (= e!377251 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!306585 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18551 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!656792 () Bool)

(assert (=> b!656792 (= e!377249 (Found!6991 lt!306585))))

(declare-fun b!656793 () Bool)

(assert (=> b!656793 (= e!377251 (MissingVacant!6991 vacantSpotIndex!68))))

(declare-fun b!656794 () Bool)

(assert (=> b!656794 (= e!377250 e!377249)))

(declare-fun c!75782 () Bool)

(assert (=> b!656794 (= c!75782 (= lt!306631 (select (arr!18551 a!2986) j!136)))))

(declare-fun d!92803 () Bool)

(declare-fun lt!306630 () SeekEntryResult!6991)

(assert (=> d!92803 (and (or (is-Undefined!6991 lt!306630) (not (is-Found!6991 lt!306630)) (and (bvsge (index!30327 lt!306630) #b00000000000000000000000000000000) (bvslt (index!30327 lt!306630) (size!18915 a!2986)))) (or (is-Undefined!6991 lt!306630) (is-Found!6991 lt!306630) (not (is-MissingVacant!6991 lt!306630)) (not (= (index!30329 lt!306630) vacantSpotIndex!68)) (and (bvsge (index!30329 lt!306630) #b00000000000000000000000000000000) (bvslt (index!30329 lt!306630) (size!18915 a!2986)))) (or (is-Undefined!6991 lt!306630) (ite (is-Found!6991 lt!306630) (= (select (arr!18551 a!2986) (index!30327 lt!306630)) (select (arr!18551 a!2986) j!136)) (and (is-MissingVacant!6991 lt!306630) (= (index!30329 lt!306630) vacantSpotIndex!68) (= (select (arr!18551 a!2986) (index!30329 lt!306630)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92803 (= lt!306630 e!377250)))

(declare-fun c!75781 () Bool)

(assert (=> d!92803 (= c!75781 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92803 (= lt!306631 (select (arr!18551 a!2986) lt!306585))))

(assert (=> d!92803 (validMask!0 mask!3053)))

(assert (=> d!92803 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306585 vacantSpotIndex!68 (select (arr!18551 a!2986) j!136) a!2986 mask!3053) lt!306630)))

(assert (= (and d!92803 c!75781) b!656789))

(assert (= (and d!92803 (not c!75781)) b!656794))

(assert (= (and b!656794 c!75782) b!656792))

(assert (= (and b!656794 (not c!75782)) b!656790))

(assert (= (and b!656790 c!75783) b!656793))

(assert (= (and b!656790 (not c!75783)) b!656791))

(assert (=> b!656791 m!629869))

(assert (=> b!656791 m!629869))

(assert (=> b!656791 m!629741))

(declare-fun m!629887 () Bool)

(assert (=> b!656791 m!629887))

(declare-fun m!629889 () Bool)

(assert (=> d!92803 m!629889))

(declare-fun m!629891 () Bool)

(assert (=> d!92803 m!629891))

(declare-fun m!629893 () Bool)

(assert (=> d!92803 m!629893))

(assert (=> d!92803 m!629771))

(assert (=> b!656697 d!92803))

(declare-fun d!92805 () Bool)

(declare-fun e!377260 () Bool)

(assert (=> d!92805 e!377260))

(declare-fun res!425963 () Bool)

(assert (=> d!92805 (=> (not res!425963) (not e!377260))))

(assert (=> d!92805 (= res!425963 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18915 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18915 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18915 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18915 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18915 a!2986))))))

(declare-fun lt!306640 () Unit!22664)

(declare-fun choose!9 (array!38705 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22664)

(assert (=> d!92805 (= lt!306640 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!306585 vacantSpotIndex!68 mask!3053))))

(assert (=> d!92805 (validMask!0 mask!3053)))

(assert (=> d!92805 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!306585 vacantSpotIndex!68 mask!3053) lt!306640)))

(declare-fun b!656809 () Bool)

(assert (=> b!656809 (= e!377260 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306585 vacantSpotIndex!68 (select (arr!18551 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306585 vacantSpotIndex!68 (select (store (arr!18551 a!2986) i!1108 k!1786) j!136) (array!38706 (store (arr!18551 a!2986) i!1108 k!1786) (size!18915 a!2986)) mask!3053)))))

(assert (= (and d!92805 res!425963) b!656809))

(declare-fun m!629895 () Bool)

(assert (=> d!92805 m!629895))

(assert (=> d!92805 m!629771))

(assert (=> b!656809 m!629741))

(assert (=> b!656809 m!629801))

(assert (=> b!656809 m!629741))

(assert (=> b!656809 m!629793))

(declare-fun m!629897 () Bool)

(assert (=> b!656809 m!629897))

(assert (=> b!656809 m!629737))

(assert (=> b!656809 m!629793))

(assert (=> b!656697 d!92805))

(declare-fun d!92807 () Bool)

(assert (=> d!92807 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18915 lt!306576)) (not (= (select (arr!18551 lt!306576) j!136) (select (arr!18551 a!2986) j!136))))))

(declare-fun lt!306646 () Unit!22664)

(declare-fun choose!21 (array!38705 (_ BitVec 64) (_ BitVec 32) List!12592) Unit!22664)

(assert (=> d!92807 (= lt!306646 (choose!21 lt!306576 (select (arr!18551 a!2986) j!136) j!136 Nil!12589))))

(assert (=> d!92807 (bvslt (size!18915 lt!306576) #b01111111111111111111111111111111)))

(assert (=> d!92807 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306576 (select (arr!18551 a!2986) j!136) j!136 Nil!12589) lt!306646)))

(declare-fun bs!19553 () Bool)

(assert (= bs!19553 d!92807))

(assert (=> bs!19553 m!629861))

(assert (=> bs!19553 m!629741))

(declare-fun m!629899 () Bool)

(assert (=> bs!19553 m!629899))

(assert (=> b!656704 d!92807))

(declare-fun d!92809 () Bool)

(declare-fun res!425964 () Bool)

(declare-fun e!377264 () Bool)

(assert (=> d!92809 (=> res!425964 e!377264)))

(assert (=> d!92809 (= res!425964 (= (select (arr!18551 lt!306576) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18551 a!2986) j!136)))))

(assert (=> d!92809 (= (arrayContainsKey!0 lt!306576 (select (arr!18551 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!377264)))

(declare-fun b!656816 () Bool)

(declare-fun e!377265 () Bool)

(assert (=> b!656816 (= e!377264 e!377265)))

(declare-fun res!425965 () Bool)

(assert (=> b!656816 (=> (not res!425965) (not e!377265))))

(assert (=> b!656816 (= res!425965 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18915 lt!306576)))))

(declare-fun b!656817 () Bool)

(assert (=> b!656817 (= e!377265 (arrayContainsKey!0 lt!306576 (select (arr!18551 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92809 (not res!425964)) b!656816))

(assert (= (and b!656816 res!425965) b!656817))

(declare-fun m!629905 () Bool)

(assert (=> d!92809 m!629905))

(assert (=> b!656817 m!629741))

(declare-fun m!629911 () Bool)

(assert (=> b!656817 m!629911))

(assert (=> b!656704 d!92809))

(declare-fun d!92811 () Bool)

(assert (=> d!92811 (arrayNoDuplicates!0 lt!306576 j!136 Nil!12589)))

(declare-fun lt!306650 () Unit!22664)

(declare-fun choose!39 (array!38705 (_ BitVec 32) (_ BitVec 32)) Unit!22664)

(assert (=> d!92811 (= lt!306650 (choose!39 lt!306576 #b00000000000000000000000000000000 j!136))))

(assert (=> d!92811 (bvslt (size!18915 lt!306576) #b01111111111111111111111111111111)))

(assert (=> d!92811 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!306576 #b00000000000000000000000000000000 j!136) lt!306650)))

(declare-fun bs!19555 () Bool)

(assert (= bs!19555 d!92811))

(assert (=> bs!19555 m!629781))

(declare-fun m!629931 () Bool)

(assert (=> bs!19555 m!629931))

(assert (=> b!656704 d!92811))

(declare-fun d!92821 () Bool)

(assert (=> d!92821 (arrayContainsKey!0 lt!306576 (select (arr!18551 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!306655 () Unit!22664)

(declare-fun choose!114 (array!38705 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22664)

(assert (=> d!92821 (= lt!306655 (choose!114 lt!306576 (select (arr!18551 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!92821 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!92821 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306576 (select (arr!18551 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!306655)))

(declare-fun bs!19558 () Bool)

(assert (= bs!19558 d!92821))

(assert (=> bs!19558 m!629741))

(assert (=> bs!19558 m!629783))

(assert (=> bs!19558 m!629741))

(declare-fun m!629941 () Bool)

(assert (=> bs!19558 m!629941))

(assert (=> b!656704 d!92821))

(declare-fun call!33872 () Bool)

(declare-fun c!75797 () Bool)

(declare-fun bm!33869 () Bool)

(assert (=> bm!33869 (= call!33872 (arrayNoDuplicates!0 lt!306576 (bvadd j!136 #b00000000000000000000000000000001) (ite c!75797 (Cons!12588 (select (arr!18551 lt!306576) j!136) Nil!12589) Nil!12589)))))

(declare-fun d!92829 () Bool)

(declare-fun res!425981 () Bool)

(declare-fun e!377284 () Bool)

(assert (=> d!92829 (=> res!425981 e!377284)))

(assert (=> d!92829 (= res!425981 (bvsge j!136 (size!18915 lt!306576)))))

(assert (=> d!92829 (= (arrayNoDuplicates!0 lt!306576 j!136 Nil!12589) e!377284)))

(declare-fun b!656840 () Bool)

(declare-fun e!377286 () Bool)

(assert (=> b!656840 (= e!377284 e!377286)))

(declare-fun res!425982 () Bool)

(assert (=> b!656840 (=> (not res!425982) (not e!377286))))

(declare-fun e!377287 () Bool)

(assert (=> b!656840 (= res!425982 (not e!377287))))

(declare-fun res!425980 () Bool)

(assert (=> b!656840 (=> (not res!425980) (not e!377287))))

(assert (=> b!656840 (= res!425980 (validKeyInArray!0 (select (arr!18551 lt!306576) j!136)))))

(declare-fun b!656841 () Bool)

(declare-fun e!377285 () Bool)

(assert (=> b!656841 (= e!377285 call!33872)))

(declare-fun b!656842 () Bool)

(declare-fun contains!3195 (List!12592 (_ BitVec 64)) Bool)

(assert (=> b!656842 (= e!377287 (contains!3195 Nil!12589 (select (arr!18551 lt!306576) j!136)))))

(declare-fun b!656843 () Bool)

(assert (=> b!656843 (= e!377285 call!33872)))

(declare-fun b!656844 () Bool)

(assert (=> b!656844 (= e!377286 e!377285)))

(assert (=> b!656844 (= c!75797 (validKeyInArray!0 (select (arr!18551 lt!306576) j!136)))))

(assert (= (and d!92829 (not res!425981)) b!656840))

(assert (= (and b!656840 res!425980) b!656842))

(assert (= (and b!656840 res!425982) b!656844))

(assert (= (and b!656844 c!75797) b!656841))

(assert (= (and b!656844 (not c!75797)) b!656843))

(assert (= (or b!656841 b!656843) bm!33869))

(assert (=> bm!33869 m!629861))

(declare-fun m!629943 () Bool)

(assert (=> bm!33869 m!629943))

(assert (=> b!656840 m!629861))

(assert (=> b!656840 m!629861))

(declare-fun m!629945 () Bool)

(assert (=> b!656840 m!629945))

(assert (=> b!656842 m!629861))

(assert (=> b!656842 m!629861))

(declare-fun m!629947 () Bool)

(assert (=> b!656842 m!629947))

(assert (=> b!656844 m!629861))

(assert (=> b!656844 m!629861))

(assert (=> b!656844 m!629945))

(assert (=> b!656704 d!92829))

(declare-fun bm!33870 () Bool)

(declare-fun call!33873 () Bool)

(declare-fun c!75798 () Bool)

(assert (=> bm!33870 (= call!33873 (arrayNoDuplicates!0 lt!306576 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!75798 (Cons!12588 (select (arr!18551 lt!306576) #b00000000000000000000000000000000) Nil!12589) Nil!12589)))))

(declare-fun d!92833 () Bool)

(declare-fun res!425984 () Bool)

(declare-fun e!377288 () Bool)

(assert (=> d!92833 (=> res!425984 e!377288)))

(assert (=> d!92833 (= res!425984 (bvsge #b00000000000000000000000000000000 (size!18915 lt!306576)))))

(assert (=> d!92833 (= (arrayNoDuplicates!0 lt!306576 #b00000000000000000000000000000000 Nil!12589) e!377288)))

(declare-fun b!656845 () Bool)

(declare-fun e!377290 () Bool)

(assert (=> b!656845 (= e!377288 e!377290)))

(declare-fun res!425985 () Bool)

(assert (=> b!656845 (=> (not res!425985) (not e!377290))))

(declare-fun e!377291 () Bool)

(assert (=> b!656845 (= res!425985 (not e!377291))))

(declare-fun res!425983 () Bool)

(assert (=> b!656845 (=> (not res!425983) (not e!377291))))

(assert (=> b!656845 (= res!425983 (validKeyInArray!0 (select (arr!18551 lt!306576) #b00000000000000000000000000000000)))))

(declare-fun b!656846 () Bool)

(declare-fun e!377289 () Bool)

(assert (=> b!656846 (= e!377289 call!33873)))

(declare-fun b!656847 () Bool)

(assert (=> b!656847 (= e!377291 (contains!3195 Nil!12589 (select (arr!18551 lt!306576) #b00000000000000000000000000000000)))))

(declare-fun b!656848 () Bool)

(assert (=> b!656848 (= e!377289 call!33873)))

(declare-fun b!656849 () Bool)

(assert (=> b!656849 (= e!377290 e!377289)))

(assert (=> b!656849 (= c!75798 (validKeyInArray!0 (select (arr!18551 lt!306576) #b00000000000000000000000000000000)))))

(assert (= (and d!92833 (not res!425984)) b!656845))

(assert (= (and b!656845 res!425983) b!656847))

(assert (= (and b!656845 res!425985) b!656849))

(assert (= (and b!656849 c!75798) b!656846))

(assert (= (and b!656849 (not c!75798)) b!656848))

(assert (= (or b!656846 b!656848) bm!33870))

(declare-fun m!629949 () Bool)

(assert (=> bm!33870 m!629949))

(declare-fun m!629951 () Bool)

(assert (=> bm!33870 m!629951))

(assert (=> b!656845 m!629949))

(assert (=> b!656845 m!629949))

(declare-fun m!629953 () Bool)

(assert (=> b!656845 m!629953))

(assert (=> b!656847 m!629949))

(assert (=> b!656847 m!629949))

(declare-fun m!629955 () Bool)

(assert (=> b!656847 m!629955))

(assert (=> b!656849 m!629949))

(assert (=> b!656849 m!629949))

(assert (=> b!656849 m!629953))

(assert (=> b!656704 d!92833))

(declare-fun d!92835 () Bool)

(declare-fun e!377308 () Bool)

(assert (=> d!92835 e!377308))

(declare-fun res!425994 () Bool)

(assert (=> d!92835 (=> (not res!425994) (not e!377308))))

(assert (=> d!92835 (= res!425994 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18915 a!2986))))))

(declare-fun lt!306662 () Unit!22664)

(declare-fun choose!41 (array!38705 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12592) Unit!22664)

(assert (=> d!92835 (= lt!306662 (choose!41 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12589))))

(assert (=> d!92835 (bvslt (size!18915 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!92835 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12589) lt!306662)))

(declare-fun b!656874 () Bool)

(assert (=> b!656874 (= e!377308 (arrayNoDuplicates!0 (array!38706 (store (arr!18551 a!2986) i!1108 k!1786) (size!18915 a!2986)) #b00000000000000000000000000000000 Nil!12589))))

(assert (= (and d!92835 res!425994) b!656874))

(declare-fun m!629957 () Bool)

(assert (=> d!92835 m!629957))

(assert (=> b!656874 m!629737))

(declare-fun m!629959 () Bool)

(assert (=> b!656874 m!629959))

(assert (=> b!656704 d!92835))

(declare-fun d!92837 () Bool)

(assert (=> d!92837 (arrayNoDuplicates!0 lt!306576 index!984 Nil!12589)))

(declare-fun lt!306663 () Unit!22664)

(assert (=> d!92837 (= lt!306663 (choose!39 lt!306576 #b00000000000000000000000000000000 index!984))))

(assert (=> d!92837 (bvslt (size!18915 lt!306576) #b01111111111111111111111111111111)))

(assert (=> d!92837 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!306576 #b00000000000000000000000000000000 index!984) lt!306663)))

(declare-fun bs!19559 () Bool)

(assert (= bs!19559 d!92837))

(assert (=> bs!19559 m!629747))

(declare-fun m!629961 () Bool)

(assert (=> bs!19559 m!629961))

(assert (=> b!656694 d!92837))

(declare-fun d!92839 () Bool)

(assert (=> d!92839 (arrayContainsKey!0 lt!306576 (select (arr!18551 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!306664 () Unit!22664)

(assert (=> d!92839 (= lt!306664 (choose!114 lt!306576 (select (arr!18551 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!92839 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!92839 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306576 (select (arr!18551 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!306664)))

(declare-fun bs!19560 () Bool)

(assert (= bs!19560 d!92839))

(assert (=> bs!19560 m!629741))

(assert (=> bs!19560 m!629751))

(assert (=> bs!19560 m!629741))

(declare-fun m!629963 () Bool)

(assert (=> bs!19560 m!629963))

(assert (=> b!656694 d!92839))

(declare-fun call!33876 () Bool)

(declare-fun c!75807 () Bool)

(declare-fun bm!33873 () Bool)

(assert (=> bm!33873 (= call!33876 (arrayNoDuplicates!0 lt!306576 (bvadd index!984 #b00000000000000000000000000000001) (ite c!75807 (Cons!12588 (select (arr!18551 lt!306576) index!984) Nil!12589) Nil!12589)))))

(declare-fun d!92841 () Bool)

(declare-fun res!425996 () Bool)

(declare-fun e!377309 () Bool)

(assert (=> d!92841 (=> res!425996 e!377309)))

(assert (=> d!92841 (= res!425996 (bvsge index!984 (size!18915 lt!306576)))))

(assert (=> d!92841 (= (arrayNoDuplicates!0 lt!306576 index!984 Nil!12589) e!377309)))

(declare-fun b!656875 () Bool)

(declare-fun e!377311 () Bool)

(assert (=> b!656875 (= e!377309 e!377311)))

(declare-fun res!425997 () Bool)

(assert (=> b!656875 (=> (not res!425997) (not e!377311))))

(declare-fun e!377312 () Bool)

(assert (=> b!656875 (= res!425997 (not e!377312))))

(declare-fun res!425995 () Bool)

(assert (=> b!656875 (=> (not res!425995) (not e!377312))))

(assert (=> b!656875 (= res!425995 (validKeyInArray!0 (select (arr!18551 lt!306576) index!984)))))

(declare-fun b!656876 () Bool)

(declare-fun e!377310 () Bool)

(assert (=> b!656876 (= e!377310 call!33876)))

(declare-fun b!656877 () Bool)

(assert (=> b!656877 (= e!377312 (contains!3195 Nil!12589 (select (arr!18551 lt!306576) index!984)))))

(declare-fun b!656878 () Bool)

(assert (=> b!656878 (= e!377310 call!33876)))

(declare-fun b!656879 () Bool)

(assert (=> b!656879 (= e!377311 e!377310)))

(assert (=> b!656879 (= c!75807 (validKeyInArray!0 (select (arr!18551 lt!306576) index!984)))))

(assert (= (and d!92841 (not res!425996)) b!656875))

(assert (= (and b!656875 res!425995) b!656877))

(assert (= (and b!656875 res!425997) b!656879))

(assert (= (and b!656879 c!75807) b!656876))

(assert (= (and b!656879 (not c!75807)) b!656878))

(assert (= (or b!656876 b!656878) bm!33873))

(assert (=> bm!33873 m!629865))

(declare-fun m!629965 () Bool)

(assert (=> bm!33873 m!629965))

(assert (=> b!656875 m!629865))

(assert (=> b!656875 m!629865))

(declare-fun m!629967 () Bool)

(assert (=> b!656875 m!629967))

(assert (=> b!656877 m!629865))

(assert (=> b!656877 m!629865))

(declare-fun m!629971 () Bool)

(assert (=> b!656877 m!629971))

(assert (=> b!656879 m!629865))

(assert (=> b!656879 m!629865))

(assert (=> b!656879 m!629967))

(assert (=> b!656694 d!92841))

(declare-fun d!92843 () Bool)

(declare-fun res!426001 () Bool)

(declare-fun e!377320 () Bool)

(assert (=> d!92843 (=> res!426001 e!377320)))

(assert (=> d!92843 (= res!426001 (= (select (arr!18551 lt!306576) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18551 a!2986) j!136)))))

(assert (=> d!92843 (= (arrayContainsKey!0 lt!306576 (select (arr!18551 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!377320)))

(declare-fun b!656891 () Bool)

(declare-fun e!377321 () Bool)

(assert (=> b!656891 (= e!377320 e!377321)))

(declare-fun res!426002 () Bool)

(assert (=> b!656891 (=> (not res!426002) (not e!377321))))

(assert (=> b!656891 (= res!426002 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18915 lt!306576)))))

(declare-fun b!656892 () Bool)

(assert (=> b!656892 (= e!377321 (arrayContainsKey!0 lt!306576 (select (arr!18551 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92843 (not res!426001)) b!656891))

(assert (= (and b!656891 res!426002) b!656892))

(declare-fun m!629979 () Bool)

(assert (=> d!92843 m!629979))

(assert (=> b!656892 m!629741))

(declare-fun m!629981 () Bool)

(assert (=> b!656892 m!629981))

(assert (=> b!656694 d!92843))

(assert (=> b!656694 d!92833))

(assert (=> b!656694 d!92835))

(assert (=> b!656694 d!92785))

(declare-fun d!92847 () Bool)

(assert (=> d!92847 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (size!18915 lt!306576)) (not (= (select (arr!18551 lt!306576) index!984) (select (arr!18551 a!2986) j!136))))))

(declare-fun lt!306667 () Unit!22664)

(assert (=> d!92847 (= lt!306667 (choose!21 lt!306576 (select (arr!18551 a!2986) j!136) index!984 Nil!12589))))

(assert (=> d!92847 (bvslt (size!18915 lt!306576) #b01111111111111111111111111111111)))

(assert (=> d!92847 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306576 (select (arr!18551 a!2986) j!136) index!984 Nil!12589) lt!306667)))

(declare-fun bs!19561 () Bool)

(assert (= bs!19561 d!92847))

(assert (=> bs!19561 m!629865))

(assert (=> bs!19561 m!629741))

(declare-fun m!629987 () Bool)

(assert (=> bs!19561 m!629987))

(assert (=> b!656694 d!92847))

(declare-fun b!656943 () Bool)

(declare-fun e!377353 () SeekEntryResult!6991)

(declare-fun lt!306689 () SeekEntryResult!6991)

(assert (=> b!656943 (= e!377353 (MissingZero!6991 (index!30328 lt!306689)))))

(declare-fun b!656944 () Bool)

