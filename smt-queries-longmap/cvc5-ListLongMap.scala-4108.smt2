; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56146 () Bool)

(assert start!56146)

(declare-fun b!620769 () Bool)

(declare-fun res!400026 () Bool)

(declare-fun e!356044 () Bool)

(assert (=> b!620769 (=> (not res!400026) (not e!356044))))

(declare-datatypes ((array!37616 0))(
  ( (array!37617 (arr!18054 (Array (_ BitVec 32) (_ BitVec 64))) (size!18418 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37616)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!620769 (= res!400026 (validKeyInArray!0 (select (arr!18054 a!2986) j!136)))))

(declare-fun b!620770 () Bool)

(declare-datatypes ((Unit!20668 0))(
  ( (Unit!20669) )
))
(declare-fun e!356048 () Unit!20668)

(declare-fun Unit!20670 () Unit!20668)

(assert (=> b!620770 (= e!356048 Unit!20670)))

(declare-fun b!620771 () Bool)

(declare-fun res!400032 () Bool)

(assert (=> b!620771 (=> (not res!400032) (not e!356044))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37616 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!620771 (= res!400032 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!620772 () Bool)

(declare-fun e!356041 () Bool)

(declare-fun lt!287014 () array!37616)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!620772 (= e!356041 (arrayContainsKey!0 lt!287014 (select (arr!18054 a!2986) j!136) index!984))))

(declare-fun res!400027 () Bool)

(assert (=> start!56146 (=> (not res!400027) (not e!356044))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56146 (= res!400027 (validMask!0 mask!3053))))

(assert (=> start!56146 e!356044))

(assert (=> start!56146 true))

(declare-fun array_inv!13850 (array!37616) Bool)

(assert (=> start!56146 (array_inv!13850 a!2986)))

(declare-fun b!620773 () Bool)

(declare-fun Unit!20671 () Unit!20668)

(assert (=> b!620773 (= e!356048 Unit!20671)))

(assert (=> b!620773 false))

(declare-fun b!620774 () Bool)

(declare-fun res!400024 () Bool)

(assert (=> b!620774 (=> (not res!400024) (not e!356044))))

(assert (=> b!620774 (= res!400024 (validKeyInArray!0 k!1786))))

(declare-fun res!400020 () Bool)

(declare-fun b!620775 () Bool)

(assert (=> b!620775 (= res!400020 (arrayContainsKey!0 lt!287014 (select (arr!18054 a!2986) j!136) j!136))))

(declare-fun e!356052 () Bool)

(assert (=> b!620775 (=> (not res!400020) (not e!356052))))

(declare-fun e!356049 () Bool)

(assert (=> b!620775 (= e!356049 e!356052)))

(declare-fun b!620776 () Bool)

(declare-fun e!356040 () Unit!20668)

(declare-fun Unit!20672 () Unit!20668)

(assert (=> b!620776 (= e!356040 Unit!20672)))

(declare-fun b!620777 () Bool)

(assert (=> b!620777 false))

(declare-fun lt!287000 () Unit!20668)

(declare-datatypes ((List!12095 0))(
  ( (Nil!12092) (Cons!12091 (h!13136 (_ BitVec 64)) (t!18323 List!12095)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37616 (_ BitVec 64) (_ BitVec 32) List!12095) Unit!20668)

(assert (=> b!620777 (= lt!287000 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287014 (select (arr!18054 a!2986) j!136) index!984 Nil!12092))))

(declare-fun arrayNoDuplicates!0 (array!37616 (_ BitVec 32) List!12095) Bool)

(assert (=> b!620777 (arrayNoDuplicates!0 lt!287014 index!984 Nil!12092)))

(declare-fun lt!287015 () Unit!20668)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37616 (_ BitVec 32) (_ BitVec 32)) Unit!20668)

(assert (=> b!620777 (= lt!287015 (lemmaNoDuplicateFromThenFromBigger!0 lt!287014 #b00000000000000000000000000000000 index!984))))

(assert (=> b!620777 (arrayNoDuplicates!0 lt!287014 #b00000000000000000000000000000000 Nil!12092)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!287005 () Unit!20668)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37616 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12095) Unit!20668)

(assert (=> b!620777 (= lt!287005 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12092))))

(assert (=> b!620777 (arrayContainsKey!0 lt!287014 (select (arr!18054 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!287016 () Unit!20668)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37616 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20668)

(assert (=> b!620777 (= lt!287016 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287014 (select (arr!18054 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!620777 e!356041))

(declare-fun res!400021 () Bool)

(assert (=> b!620777 (=> (not res!400021) (not e!356041))))

(assert (=> b!620777 (= res!400021 (arrayContainsKey!0 lt!287014 (select (arr!18054 a!2986) j!136) j!136))))

(declare-fun e!356043 () Unit!20668)

(declare-fun Unit!20673 () Unit!20668)

(assert (=> b!620777 (= e!356043 Unit!20673)))

(declare-fun b!620778 () Bool)

(declare-fun e!356047 () Bool)

(declare-fun e!356046 () Bool)

(assert (=> b!620778 (= e!356047 e!356046)))

(declare-fun res!400029 () Bool)

(assert (=> b!620778 (=> (not res!400029) (not e!356046))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!620778 (= res!400029 (= (select (store (arr!18054 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!620778 (= lt!287014 (array!37617 (store (arr!18054 a!2986) i!1108 k!1786) (size!18418 a!2986)))))

(declare-fun b!620779 () Bool)

(declare-fun res!400030 () Bool)

(assert (=> b!620779 (=> (not res!400030) (not e!356047))))

(assert (=> b!620779 (= res!400030 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12092))))

(declare-fun b!620780 () Bool)

(declare-fun e!356050 () Unit!20668)

(declare-fun Unit!20674 () Unit!20668)

(assert (=> b!620780 (= e!356050 Unit!20674)))

(declare-fun res!400033 () Bool)

(assert (=> b!620780 (= res!400033 (= (select (store (arr!18054 a!2986) i!1108 k!1786) index!984) (select (arr!18054 a!2986) j!136)))))

(declare-fun e!356042 () Bool)

(assert (=> b!620780 (=> (not res!400033) (not e!356042))))

(assert (=> b!620780 e!356042))

(declare-fun c!70743 () Bool)

(assert (=> b!620780 (= c!70743 (bvslt j!136 index!984))))

(declare-fun lt!287017 () Unit!20668)

(assert (=> b!620780 (= lt!287017 e!356040)))

(declare-fun c!70745 () Bool)

(assert (=> b!620780 (= c!70745 (bvslt index!984 j!136))))

(declare-fun lt!287008 () Unit!20668)

(assert (=> b!620780 (= lt!287008 e!356043)))

(assert (=> b!620780 false))

(declare-fun b!620781 () Bool)

(assert (=> b!620781 (= e!356052 (arrayContainsKey!0 lt!287014 (select (arr!18054 a!2986) j!136) index!984))))

(declare-fun b!620782 () Bool)

(declare-fun Unit!20675 () Unit!20668)

(assert (=> b!620782 (= e!356050 Unit!20675)))

(declare-fun b!620783 () Bool)

(declare-fun e!356039 () Bool)

(assert (=> b!620783 (= e!356039 (not true))))

(declare-fun lt!286999 () Unit!20668)

(assert (=> b!620783 (= lt!286999 e!356050)))

(declare-fun c!70744 () Bool)

(declare-datatypes ((SeekEntryResult!6494 0))(
  ( (MissingZero!6494 (index!28260 (_ BitVec 32))) (Found!6494 (index!28261 (_ BitVec 32))) (Intermediate!6494 (undefined!7306 Bool) (index!28262 (_ BitVec 32)) (x!57038 (_ BitVec 32))) (Undefined!6494) (MissingVacant!6494 (index!28263 (_ BitVec 32))) )
))
(declare-fun lt!287004 () SeekEntryResult!6494)

(assert (=> b!620783 (= c!70744 (= lt!287004 (Found!6494 index!984)))))

(declare-fun lt!287010 () Unit!20668)

(assert (=> b!620783 (= lt!287010 e!356048)))

(declare-fun c!70742 () Bool)

(assert (=> b!620783 (= c!70742 (= lt!287004 Undefined!6494))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!287003 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37616 (_ BitVec 32)) SeekEntryResult!6494)

(assert (=> b!620783 (= lt!287004 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!287003 lt!287014 mask!3053))))

(declare-fun e!356051 () Bool)

(assert (=> b!620783 e!356051))

(declare-fun res!400025 () Bool)

(assert (=> b!620783 (=> (not res!400025) (not e!356051))))

(declare-fun lt!287012 () (_ BitVec 32))

(declare-fun lt!287009 () SeekEntryResult!6494)

(assert (=> b!620783 (= res!400025 (= lt!287009 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287012 vacantSpotIndex!68 lt!287003 lt!287014 mask!3053)))))

(assert (=> b!620783 (= lt!287009 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287012 vacantSpotIndex!68 (select (arr!18054 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!620783 (= lt!287003 (select (store (arr!18054 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!287001 () Unit!20668)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37616 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20668)

(assert (=> b!620783 (= lt!287001 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!287012 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!620783 (= lt!287012 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!620784 () Bool)

(declare-fun res!400022 () Bool)

(assert (=> b!620784 (= res!400022 (bvsge j!136 index!984))))

(assert (=> b!620784 (=> res!400022 e!356049)))

(assert (=> b!620784 (= e!356042 e!356049)))

(declare-fun b!620785 () Bool)

(assert (=> b!620785 false))

(declare-fun lt!286998 () Unit!20668)

(assert (=> b!620785 (= lt!286998 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287014 (select (arr!18054 a!2986) j!136) j!136 Nil!12092))))

(assert (=> b!620785 (arrayNoDuplicates!0 lt!287014 j!136 Nil!12092)))

(declare-fun lt!287013 () Unit!20668)

(assert (=> b!620785 (= lt!287013 (lemmaNoDuplicateFromThenFromBigger!0 lt!287014 #b00000000000000000000000000000000 j!136))))

(assert (=> b!620785 (arrayNoDuplicates!0 lt!287014 #b00000000000000000000000000000000 Nil!12092)))

(declare-fun lt!287011 () Unit!20668)

(assert (=> b!620785 (= lt!287011 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12092))))

(assert (=> b!620785 (arrayContainsKey!0 lt!287014 (select (arr!18054 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!287006 () Unit!20668)

(assert (=> b!620785 (= lt!287006 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287014 (select (arr!18054 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20676 () Unit!20668)

(assert (=> b!620785 (= e!356040 Unit!20676)))

(declare-fun b!620786 () Bool)

(declare-fun res!400034 () Bool)

(assert (=> b!620786 (=> (not res!400034) (not e!356047))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37616 (_ BitVec 32)) Bool)

(assert (=> b!620786 (= res!400034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!620787 () Bool)

(assert (=> b!620787 (= e!356044 e!356047)))

(declare-fun res!400028 () Bool)

(assert (=> b!620787 (=> (not res!400028) (not e!356047))))

(declare-fun lt!287007 () SeekEntryResult!6494)

(assert (=> b!620787 (= res!400028 (or (= lt!287007 (MissingZero!6494 i!1108)) (= lt!287007 (MissingVacant!6494 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37616 (_ BitVec 32)) SeekEntryResult!6494)

(assert (=> b!620787 (= lt!287007 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!620788 () Bool)

(assert (=> b!620788 (= e!356046 e!356039)))

(declare-fun res!400019 () Bool)

(assert (=> b!620788 (=> (not res!400019) (not e!356039))))

(declare-fun lt!287002 () SeekEntryResult!6494)

(assert (=> b!620788 (= res!400019 (and (= lt!287002 (Found!6494 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18054 a!2986) index!984) (select (arr!18054 a!2986) j!136))) (not (= (select (arr!18054 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!620788 (= lt!287002 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18054 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!620789 () Bool)

(declare-fun Unit!20677 () Unit!20668)

(assert (=> b!620789 (= e!356043 Unit!20677)))

(declare-fun b!620790 () Bool)

(assert (=> b!620790 (= e!356051 (= lt!287002 lt!287009))))

(declare-fun b!620791 () Bool)

(declare-fun res!400023 () Bool)

(assert (=> b!620791 (=> (not res!400023) (not e!356047))))

(assert (=> b!620791 (= res!400023 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18054 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!620792 () Bool)

(declare-fun res!400031 () Bool)

(assert (=> b!620792 (=> (not res!400031) (not e!356044))))

(assert (=> b!620792 (= res!400031 (and (= (size!18418 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18418 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18418 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!56146 res!400027) b!620792))

(assert (= (and b!620792 res!400031) b!620769))

(assert (= (and b!620769 res!400026) b!620774))

(assert (= (and b!620774 res!400024) b!620771))

(assert (= (and b!620771 res!400032) b!620787))

(assert (= (and b!620787 res!400028) b!620786))

(assert (= (and b!620786 res!400034) b!620779))

(assert (= (and b!620779 res!400030) b!620791))

(assert (= (and b!620791 res!400023) b!620778))

(assert (= (and b!620778 res!400029) b!620788))

(assert (= (and b!620788 res!400019) b!620783))

(assert (= (and b!620783 res!400025) b!620790))

(assert (= (and b!620783 c!70742) b!620773))

(assert (= (and b!620783 (not c!70742)) b!620770))

(assert (= (and b!620783 c!70744) b!620780))

(assert (= (and b!620783 (not c!70744)) b!620782))

(assert (= (and b!620780 res!400033) b!620784))

(assert (= (and b!620784 (not res!400022)) b!620775))

(assert (= (and b!620775 res!400020) b!620781))

(assert (= (and b!620780 c!70743) b!620785))

(assert (= (and b!620780 (not c!70743)) b!620776))

(assert (= (and b!620780 c!70745) b!620777))

(assert (= (and b!620780 (not c!70745)) b!620789))

(assert (= (and b!620777 res!400021) b!620772))

(declare-fun m!596681 () Bool)

(assert (=> b!620779 m!596681))

(declare-fun m!596683 () Bool)

(assert (=> b!620788 m!596683))

(declare-fun m!596685 () Bool)

(assert (=> b!620788 m!596685))

(assert (=> b!620788 m!596685))

(declare-fun m!596687 () Bool)

(assert (=> b!620788 m!596687))

(declare-fun m!596689 () Bool)

(assert (=> b!620787 m!596689))

(assert (=> b!620775 m!596685))

(assert (=> b!620775 m!596685))

(declare-fun m!596691 () Bool)

(assert (=> b!620775 m!596691))

(assert (=> b!620772 m!596685))

(assert (=> b!620772 m!596685))

(declare-fun m!596693 () Bool)

(assert (=> b!620772 m!596693))

(declare-fun m!596695 () Bool)

(assert (=> start!56146 m!596695))

(declare-fun m!596697 () Bool)

(assert (=> start!56146 m!596697))

(assert (=> b!620769 m!596685))

(assert (=> b!620769 m!596685))

(declare-fun m!596699 () Bool)

(assert (=> b!620769 m!596699))

(declare-fun m!596701 () Bool)

(assert (=> b!620791 m!596701))

(declare-fun m!596703 () Bool)

(assert (=> b!620780 m!596703))

(declare-fun m!596705 () Bool)

(assert (=> b!620780 m!596705))

(assert (=> b!620780 m!596685))

(declare-fun m!596707 () Bool)

(assert (=> b!620771 m!596707))

(declare-fun m!596709 () Bool)

(assert (=> b!620786 m!596709))

(assert (=> b!620778 m!596703))

(declare-fun m!596711 () Bool)

(assert (=> b!620778 m!596711))

(declare-fun m!596713 () Bool)

(assert (=> b!620774 m!596713))

(declare-fun m!596715 () Bool)

(assert (=> b!620785 m!596715))

(declare-fun m!596717 () Bool)

(assert (=> b!620785 m!596717))

(assert (=> b!620785 m!596685))

(declare-fun m!596719 () Bool)

(assert (=> b!620785 m!596719))

(assert (=> b!620785 m!596685))

(declare-fun m!596721 () Bool)

(assert (=> b!620785 m!596721))

(declare-fun m!596723 () Bool)

(assert (=> b!620785 m!596723))

(declare-fun m!596725 () Bool)

(assert (=> b!620785 m!596725))

(assert (=> b!620785 m!596685))

(declare-fun m!596727 () Bool)

(assert (=> b!620785 m!596727))

(assert (=> b!620785 m!596685))

(assert (=> b!620777 m!596685))

(assert (=> b!620777 m!596685))

(declare-fun m!596729 () Bool)

(assert (=> b!620777 m!596729))

(declare-fun m!596731 () Bool)

(assert (=> b!620777 m!596731))

(declare-fun m!596733 () Bool)

(assert (=> b!620777 m!596733))

(assert (=> b!620777 m!596685))

(assert (=> b!620777 m!596691))

(assert (=> b!620777 m!596685))

(declare-fun m!596735 () Bool)

(assert (=> b!620777 m!596735))

(assert (=> b!620777 m!596685))

(declare-fun m!596737 () Bool)

(assert (=> b!620777 m!596737))

(assert (=> b!620777 m!596723))

(assert (=> b!620777 m!596725))

(assert (=> b!620781 m!596685))

(assert (=> b!620781 m!596685))

(assert (=> b!620781 m!596693))

(declare-fun m!596739 () Bool)

(assert (=> b!620783 m!596739))

(assert (=> b!620783 m!596685))

(assert (=> b!620783 m!596703))

(assert (=> b!620783 m!596685))

(declare-fun m!596741 () Bool)

(assert (=> b!620783 m!596741))

(declare-fun m!596743 () Bool)

(assert (=> b!620783 m!596743))

(declare-fun m!596745 () Bool)

(assert (=> b!620783 m!596745))

(declare-fun m!596747 () Bool)

(assert (=> b!620783 m!596747))

(declare-fun m!596749 () Bool)

(assert (=> b!620783 m!596749))

(push 1)

