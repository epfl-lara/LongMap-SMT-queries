; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56064 () Bool)

(assert start!56064)

(declare-fun b!617723 () Bool)

(declare-fun res!397964 () Bool)

(declare-fun e!354223 () Bool)

(assert (=> b!617723 (=> (not res!397964) (not e!354223))))

(declare-datatypes ((array!37534 0))(
  ( (array!37535 (arr!18013 (Array (_ BitVec 32) (_ BitVec 64))) (size!18377 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37534)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!617723 (= res!397964 (validKeyInArray!0 (select (arr!18013 a!2986) j!136)))))

(declare-fun b!617725 () Bool)

(assert (=> b!617725 false))

(declare-fun lt!284551 () array!37534)

(declare-datatypes ((Unit!20258 0))(
  ( (Unit!20259) )
))
(declare-fun lt!284539 () Unit!20258)

(declare-datatypes ((List!12054 0))(
  ( (Nil!12051) (Cons!12050 (h!13095 (_ BitVec 64)) (t!18282 List!12054)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37534 (_ BitVec 64) (_ BitVec 32) List!12054) Unit!20258)

(assert (=> b!617725 (= lt!284539 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284551 (select (arr!18013 a!2986) j!136) j!136 Nil!12051))))

(declare-fun arrayNoDuplicates!0 (array!37534 (_ BitVec 32) List!12054) Bool)

(assert (=> b!617725 (arrayNoDuplicates!0 lt!284551 j!136 Nil!12051)))

(declare-fun lt!284553 () Unit!20258)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37534 (_ BitVec 32) (_ BitVec 32)) Unit!20258)

(assert (=> b!617725 (= lt!284553 (lemmaNoDuplicateFromThenFromBigger!0 lt!284551 #b00000000000000000000000000000000 j!136))))

(assert (=> b!617725 (arrayNoDuplicates!0 lt!284551 #b00000000000000000000000000000000 Nil!12051)))

(declare-fun lt!284549 () Unit!20258)

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37534 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12054) Unit!20258)

(assert (=> b!617725 (= lt!284549 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12051))))

(declare-fun arrayContainsKey!0 (array!37534 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!617725 (arrayContainsKey!0 lt!284551 (select (arr!18013 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!284550 () Unit!20258)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37534 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20258)

(assert (=> b!617725 (= lt!284550 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284551 (select (arr!18013 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!354224 () Unit!20258)

(declare-fun Unit!20260 () Unit!20258)

(assert (=> b!617725 (= e!354224 Unit!20260)))

(declare-fun b!617726 () Bool)

(declare-fun e!354237 () Unit!20258)

(declare-fun Unit!20261 () Unit!20258)

(assert (=> b!617726 (= e!354237 Unit!20261)))

(declare-fun b!617727 () Bool)

(declare-fun Unit!20262 () Unit!20258)

(assert (=> b!617727 (= e!354224 Unit!20262)))

(declare-fun b!617728 () Bool)

(declare-fun e!354232 () Bool)

(assert (=> b!617728 (= e!354223 e!354232)))

(declare-fun res!397959 () Bool)

(assert (=> b!617728 (=> (not res!397959) (not e!354232))))

(declare-datatypes ((SeekEntryResult!6453 0))(
  ( (MissingZero!6453 (index!28096 (_ BitVec 32))) (Found!6453 (index!28097 (_ BitVec 32))) (Intermediate!6453 (undefined!7265 Bool) (index!28098 (_ BitVec 32)) (x!56885 (_ BitVec 32))) (Undefined!6453) (MissingVacant!6453 (index!28099 (_ BitVec 32))) )
))
(declare-fun lt!284545 () SeekEntryResult!6453)

(assert (=> b!617728 (= res!397959 (or (= lt!284545 (MissingZero!6453 i!1108)) (= lt!284545 (MissingVacant!6453 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37534 (_ BitVec 32)) SeekEntryResult!6453)

(assert (=> b!617728 (= lt!284545 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!617729 () Bool)

(declare-fun e!354235 () Bool)

(assert (=> b!617729 (= e!354235 true)))

(assert (=> b!617729 (= (select (store (arr!18013 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!617730 () Bool)

(declare-fun e!354228 () Bool)

(assert (=> b!617730 (= e!354228 (not e!354235))))

(declare-fun res!397971 () Bool)

(assert (=> b!617730 (=> res!397971 e!354235)))

(declare-fun lt!284543 () SeekEntryResult!6453)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!617730 (= res!397971 (not (= lt!284543 (MissingVacant!6453 vacantSpotIndex!68))))))

(declare-fun lt!284554 () Unit!20258)

(declare-fun e!354229 () Unit!20258)

(assert (=> b!617730 (= lt!284554 e!354229)))

(declare-fun c!70251 () Bool)

(assert (=> b!617730 (= c!70251 (= lt!284543 (Found!6453 index!984)))))

(declare-fun lt!284542 () Unit!20258)

(assert (=> b!617730 (= lt!284542 e!354237)))

(declare-fun c!70252 () Bool)

(assert (=> b!617730 (= c!70252 (= lt!284543 Undefined!6453))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!284552 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37534 (_ BitVec 32)) SeekEntryResult!6453)

(assert (=> b!617730 (= lt!284543 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!284552 lt!284551 mask!3053))))

(declare-fun e!354234 () Bool)

(assert (=> b!617730 e!354234))

(declare-fun res!397966 () Bool)

(assert (=> b!617730 (=> (not res!397966) (not e!354234))))

(declare-fun lt!284540 () (_ BitVec 32))

(declare-fun lt!284544 () SeekEntryResult!6453)

(assert (=> b!617730 (= res!397966 (= lt!284544 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284540 vacantSpotIndex!68 lt!284552 lt!284551 mask!3053)))))

(assert (=> b!617730 (= lt!284544 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284540 vacantSpotIndex!68 (select (arr!18013 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!617730 (= lt!284552 (select (store (arr!18013 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!284541 () Unit!20258)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37534 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20258)

(assert (=> b!617730 (= lt!284541 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!284540 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!617730 (= lt!284540 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!617731 () Bool)

(declare-fun res!397960 () Bool)

(assert (=> b!617731 (=> (not res!397960) (not e!354223))))

(assert (=> b!617731 (= res!397960 (validKeyInArray!0 k0!1786))))

(declare-fun b!617732 () Bool)

(declare-fun Unit!20263 () Unit!20258)

(assert (=> b!617732 (= e!354229 Unit!20263)))

(declare-fun res!397958 () Bool)

(assert (=> b!617732 (= res!397958 (= (select (store (arr!18013 a!2986) i!1108 k0!1786) index!984) (select (arr!18013 a!2986) j!136)))))

(declare-fun e!354233 () Bool)

(assert (=> b!617732 (=> (not res!397958) (not e!354233))))

(assert (=> b!617732 e!354233))

(declare-fun c!70253 () Bool)

(assert (=> b!617732 (= c!70253 (bvslt j!136 index!984))))

(declare-fun lt!284548 () Unit!20258)

(assert (=> b!617732 (= lt!284548 e!354224)))

(declare-fun c!70250 () Bool)

(assert (=> b!617732 (= c!70250 (bvslt index!984 j!136))))

(declare-fun lt!284557 () Unit!20258)

(declare-fun e!354226 () Unit!20258)

(assert (=> b!617732 (= lt!284557 e!354226)))

(assert (=> b!617732 false))

(declare-fun b!617733 () Bool)

(declare-fun res!397968 () Bool)

(assert (=> b!617733 (=> (not res!397968) (not e!354223))))

(assert (=> b!617733 (= res!397968 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!397965 () Bool)

(declare-fun b!617734 () Bool)

(assert (=> b!617734 (= res!397965 (arrayContainsKey!0 lt!284551 (select (arr!18013 a!2986) j!136) j!136))))

(declare-fun e!354227 () Bool)

(assert (=> b!617734 (=> (not res!397965) (not e!354227))))

(declare-fun e!354231 () Bool)

(assert (=> b!617734 (= e!354231 e!354227)))

(declare-fun b!617735 () Bool)

(declare-fun Unit!20264 () Unit!20258)

(assert (=> b!617735 (= e!354226 Unit!20264)))

(declare-fun b!617736 () Bool)

(assert (=> b!617736 (= e!354227 (arrayContainsKey!0 lt!284551 (select (arr!18013 a!2986) j!136) index!984))))

(declare-fun res!397969 () Bool)

(assert (=> start!56064 (=> (not res!397969) (not e!354223))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56064 (= res!397969 (validMask!0 mask!3053))))

(assert (=> start!56064 e!354223))

(assert (=> start!56064 true))

(declare-fun array_inv!13809 (array!37534) Bool)

(assert (=> start!56064 (array_inv!13809 a!2986)))

(declare-fun b!617724 () Bool)

(declare-fun e!354230 () Bool)

(assert (=> b!617724 (= e!354232 e!354230)))

(declare-fun res!397957 () Bool)

(assert (=> b!617724 (=> (not res!397957) (not e!354230))))

(assert (=> b!617724 (= res!397957 (= (select (store (arr!18013 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!617724 (= lt!284551 (array!37535 (store (arr!18013 a!2986) i!1108 k0!1786) (size!18377 a!2986)))))

(declare-fun b!617737 () Bool)

(declare-fun res!397973 () Bool)

(assert (=> b!617737 (=> (not res!397973) (not e!354232))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37534 (_ BitVec 32)) Bool)

(assert (=> b!617737 (= res!397973 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!617738 () Bool)

(declare-fun Unit!20265 () Unit!20258)

(assert (=> b!617738 (= e!354237 Unit!20265)))

(assert (=> b!617738 false))

(declare-fun b!617739 () Bool)

(assert (=> b!617739 false))

(declare-fun lt!284556 () Unit!20258)

(assert (=> b!617739 (= lt!284556 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284551 (select (arr!18013 a!2986) j!136) index!984 Nil!12051))))

(assert (=> b!617739 (arrayNoDuplicates!0 lt!284551 index!984 Nil!12051)))

(declare-fun lt!284547 () Unit!20258)

(assert (=> b!617739 (= lt!284547 (lemmaNoDuplicateFromThenFromBigger!0 lt!284551 #b00000000000000000000000000000000 index!984))))

(assert (=> b!617739 (arrayNoDuplicates!0 lt!284551 #b00000000000000000000000000000000 Nil!12051)))

(declare-fun lt!284555 () Unit!20258)

(assert (=> b!617739 (= lt!284555 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12051))))

(assert (=> b!617739 (arrayContainsKey!0 lt!284551 (select (arr!18013 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!284546 () Unit!20258)

(assert (=> b!617739 (= lt!284546 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284551 (select (arr!18013 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!354236 () Bool)

(assert (=> b!617739 e!354236))

(declare-fun res!397972 () Bool)

(assert (=> b!617739 (=> (not res!397972) (not e!354236))))

(assert (=> b!617739 (= res!397972 (arrayContainsKey!0 lt!284551 (select (arr!18013 a!2986) j!136) j!136))))

(declare-fun Unit!20266 () Unit!20258)

(assert (=> b!617739 (= e!354226 Unit!20266)))

(declare-fun b!617740 () Bool)

(assert (=> b!617740 (= e!354230 e!354228)))

(declare-fun res!397961 () Bool)

(assert (=> b!617740 (=> (not res!397961) (not e!354228))))

(declare-fun lt!284538 () SeekEntryResult!6453)

(assert (=> b!617740 (= res!397961 (and (= lt!284538 (Found!6453 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18013 a!2986) index!984) (select (arr!18013 a!2986) j!136))) (not (= (select (arr!18013 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!617740 (= lt!284538 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18013 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!617741 () Bool)

(declare-fun res!397967 () Bool)

(assert (=> b!617741 (=> (not res!397967) (not e!354232))))

(assert (=> b!617741 (= res!397967 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12051))))

(declare-fun b!617742 () Bool)

(assert (=> b!617742 (= e!354234 (= lt!284538 lt!284544))))

(declare-fun b!617743 () Bool)

(declare-fun res!397962 () Bool)

(assert (=> b!617743 (= res!397962 (bvsge j!136 index!984))))

(assert (=> b!617743 (=> res!397962 e!354231)))

(assert (=> b!617743 (= e!354233 e!354231)))

(declare-fun b!617744 () Bool)

(assert (=> b!617744 (= e!354236 (arrayContainsKey!0 lt!284551 (select (arr!18013 a!2986) j!136) index!984))))

(declare-fun b!617745 () Bool)

(declare-fun res!397970 () Bool)

(assert (=> b!617745 (=> (not res!397970) (not e!354232))))

(assert (=> b!617745 (= res!397970 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18013 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!617746 () Bool)

(declare-fun res!397963 () Bool)

(assert (=> b!617746 (=> (not res!397963) (not e!354223))))

(assert (=> b!617746 (= res!397963 (and (= (size!18377 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18377 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18377 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!617747 () Bool)

(declare-fun Unit!20267 () Unit!20258)

(assert (=> b!617747 (= e!354229 Unit!20267)))

(assert (= (and start!56064 res!397969) b!617746))

(assert (= (and b!617746 res!397963) b!617723))

(assert (= (and b!617723 res!397964) b!617731))

(assert (= (and b!617731 res!397960) b!617733))

(assert (= (and b!617733 res!397968) b!617728))

(assert (= (and b!617728 res!397959) b!617737))

(assert (= (and b!617737 res!397973) b!617741))

(assert (= (and b!617741 res!397967) b!617745))

(assert (= (and b!617745 res!397970) b!617724))

(assert (= (and b!617724 res!397957) b!617740))

(assert (= (and b!617740 res!397961) b!617730))

(assert (= (and b!617730 res!397966) b!617742))

(assert (= (and b!617730 c!70252) b!617738))

(assert (= (and b!617730 (not c!70252)) b!617726))

(assert (= (and b!617730 c!70251) b!617732))

(assert (= (and b!617730 (not c!70251)) b!617747))

(assert (= (and b!617732 res!397958) b!617743))

(assert (= (and b!617743 (not res!397962)) b!617734))

(assert (= (and b!617734 res!397965) b!617736))

(assert (= (and b!617732 c!70253) b!617725))

(assert (= (and b!617732 (not c!70253)) b!617727))

(assert (= (and b!617732 c!70250) b!617739))

(assert (= (and b!617732 (not c!70250)) b!617735))

(assert (= (and b!617739 res!397972) b!617744))

(assert (= (and b!617730 (not res!397971)) b!617729))

(declare-fun m!593811 () Bool)

(assert (=> b!617733 m!593811))

(declare-fun m!593813 () Bool)

(assert (=> b!617737 m!593813))

(declare-fun m!593815 () Bool)

(assert (=> b!617730 m!593815))

(declare-fun m!593817 () Bool)

(assert (=> b!617730 m!593817))

(declare-fun m!593819 () Bool)

(assert (=> b!617730 m!593819))

(declare-fun m!593821 () Bool)

(assert (=> b!617730 m!593821))

(declare-fun m!593823 () Bool)

(assert (=> b!617730 m!593823))

(assert (=> b!617730 m!593819))

(declare-fun m!593825 () Bool)

(assert (=> b!617730 m!593825))

(declare-fun m!593827 () Bool)

(assert (=> b!617730 m!593827))

(declare-fun m!593829 () Bool)

(assert (=> b!617730 m!593829))

(assert (=> b!617724 m!593829))

(declare-fun m!593831 () Bool)

(assert (=> b!617724 m!593831))

(assert (=> b!617725 m!593819))

(declare-fun m!593833 () Bool)

(assert (=> b!617725 m!593833))

(declare-fun m!593835 () Bool)

(assert (=> b!617725 m!593835))

(declare-fun m!593837 () Bool)

(assert (=> b!617725 m!593837))

(assert (=> b!617725 m!593819))

(declare-fun m!593839 () Bool)

(assert (=> b!617725 m!593839))

(assert (=> b!617725 m!593819))

(declare-fun m!593841 () Bool)

(assert (=> b!617725 m!593841))

(assert (=> b!617725 m!593819))

(declare-fun m!593843 () Bool)

(assert (=> b!617725 m!593843))

(declare-fun m!593845 () Bool)

(assert (=> b!617725 m!593845))

(declare-fun m!593847 () Bool)

(assert (=> b!617740 m!593847))

(assert (=> b!617740 m!593819))

(assert (=> b!617740 m!593819))

(declare-fun m!593849 () Bool)

(assert (=> b!617740 m!593849))

(assert (=> b!617734 m!593819))

(assert (=> b!617734 m!593819))

(declare-fun m!593851 () Bool)

(assert (=> b!617734 m!593851))

(declare-fun m!593853 () Bool)

(assert (=> b!617731 m!593853))

(assert (=> b!617744 m!593819))

(assert (=> b!617744 m!593819))

(declare-fun m!593855 () Bool)

(assert (=> b!617744 m!593855))

(assert (=> b!617729 m!593829))

(declare-fun m!593857 () Bool)

(assert (=> b!617729 m!593857))

(assert (=> b!617732 m!593829))

(assert (=> b!617732 m!593857))

(assert (=> b!617732 m!593819))

(assert (=> b!617723 m!593819))

(assert (=> b!617723 m!593819))

(declare-fun m!593859 () Bool)

(assert (=> b!617723 m!593859))

(declare-fun m!593861 () Bool)

(assert (=> b!617728 m!593861))

(assert (=> b!617739 m!593819))

(assert (=> b!617739 m!593819))

(assert (=> b!617739 m!593851))

(declare-fun m!593863 () Bool)

(assert (=> b!617739 m!593863))

(declare-fun m!593865 () Bool)

(assert (=> b!617739 m!593865))

(assert (=> b!617739 m!593837))

(assert (=> b!617739 m!593819))

(declare-fun m!593867 () Bool)

(assert (=> b!617739 m!593867))

(assert (=> b!617739 m!593819))

(declare-fun m!593869 () Bool)

(assert (=> b!617739 m!593869))

(assert (=> b!617739 m!593819))

(declare-fun m!593871 () Bool)

(assert (=> b!617739 m!593871))

(assert (=> b!617739 m!593835))

(declare-fun m!593873 () Bool)

(assert (=> b!617741 m!593873))

(assert (=> b!617736 m!593819))

(assert (=> b!617736 m!593819))

(assert (=> b!617736 m!593855))

(declare-fun m!593875 () Bool)

(assert (=> start!56064 m!593875))

(declare-fun m!593877 () Bool)

(assert (=> start!56064 m!593877))

(declare-fun m!593879 () Bool)

(assert (=> b!617745 m!593879))

(check-sat (not b!617734) (not b!617723) (not start!56064) (not b!617725) (not b!617728) (not b!617741) (not b!617740) (not b!617736) (not b!617739) (not b!617733) (not b!617731) (not b!617730) (not b!617737) (not b!617744))
(check-sat)
