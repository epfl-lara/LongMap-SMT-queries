; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56144 () Bool)

(assert start!56144)

(declare-fun b!620697 () Bool)

(declare-fun e!356007 () Bool)

(declare-fun e!356009 () Bool)

(assert (=> b!620697 (= e!356007 e!356009)))

(declare-fun res!399974 () Bool)

(assert (=> b!620697 (=> (not res!399974) (not e!356009))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37614 0))(
  ( (array!37615 (arr!18053 (Array (_ BitVec 32) (_ BitVec 64))) (size!18417 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37614)

(assert (=> b!620697 (= res!399974 (= (select (store (arr!18053 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!286946 () array!37614)

(assert (=> b!620697 (= lt!286946 (array!37615 (store (arr!18053 a!2986) i!1108 k!1786) (size!18417 a!2986)))))

(declare-fun b!620698 () Bool)

(assert (=> b!620698 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((Unit!20658 0))(
  ( (Unit!20659) )
))
(declare-fun lt!286941 () Unit!20658)

(declare-datatypes ((List!12094 0))(
  ( (Nil!12091) (Cons!12090 (h!13135 (_ BitVec 64)) (t!18322 List!12094)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37614 (_ BitVec 64) (_ BitVec 32) List!12094) Unit!20658)

(assert (=> b!620698 (= lt!286941 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286946 (select (arr!18053 a!2986) j!136) j!136 Nil!12091))))

(declare-fun arrayNoDuplicates!0 (array!37614 (_ BitVec 32) List!12094) Bool)

(assert (=> b!620698 (arrayNoDuplicates!0 lt!286946 j!136 Nil!12091)))

(declare-fun lt!286947 () Unit!20658)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37614 (_ BitVec 32) (_ BitVec 32)) Unit!20658)

(assert (=> b!620698 (= lt!286947 (lemmaNoDuplicateFromThenFromBigger!0 lt!286946 #b00000000000000000000000000000000 j!136))))

(assert (=> b!620698 (arrayNoDuplicates!0 lt!286946 #b00000000000000000000000000000000 Nil!12091)))

(declare-fun lt!286939 () Unit!20658)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37614 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12094) Unit!20658)

(assert (=> b!620698 (= lt!286939 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12091))))

(declare-fun arrayContainsKey!0 (array!37614 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!620698 (arrayContainsKey!0 lt!286946 (select (arr!18053 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!286938 () Unit!20658)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37614 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20658)

(assert (=> b!620698 (= lt!286938 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286946 (select (arr!18053 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!356002 () Unit!20658)

(declare-fun Unit!20660 () Unit!20658)

(assert (=> b!620698 (= e!356002 Unit!20660)))

(declare-fun b!620699 () Bool)

(declare-fun e!356006 () Bool)

(assert (=> b!620699 (= e!356006 e!356007)))

(declare-fun res!399978 () Bool)

(assert (=> b!620699 (=> (not res!399978) (not e!356007))))

(declare-datatypes ((SeekEntryResult!6493 0))(
  ( (MissingZero!6493 (index!28256 (_ BitVec 32))) (Found!6493 (index!28257 (_ BitVec 32))) (Intermediate!6493 (undefined!7305 Bool) (index!28258 (_ BitVec 32)) (x!57029 (_ BitVec 32))) (Undefined!6493) (MissingVacant!6493 (index!28259 (_ BitVec 32))) )
))
(declare-fun lt!286951 () SeekEntryResult!6493)

(assert (=> b!620699 (= res!399978 (or (= lt!286951 (MissingZero!6493 i!1108)) (= lt!286951 (MissingVacant!6493 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37614 (_ BitVec 32)) SeekEntryResult!6493)

(assert (=> b!620699 (= lt!286951 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!620700 () Bool)

(declare-fun res!399979 () Bool)

(assert (=> b!620700 (=> (not res!399979) (not e!356007))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!620700 (= res!399979 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18053 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!356003 () Bool)

(declare-fun b!620701 () Bool)

(assert (=> b!620701 (= e!356003 (arrayContainsKey!0 lt!286946 (select (arr!18053 a!2986) j!136) index!984))))

(declare-fun b!620702 () Bool)

(declare-fun e!355998 () Bool)

(assert (=> b!620702 (= e!356009 e!355998)))

(declare-fun res!399984 () Bool)

(assert (=> b!620702 (=> (not res!399984) (not e!355998))))

(declare-fun lt!286950 () SeekEntryResult!6493)

(assert (=> b!620702 (= res!399984 (and (= lt!286950 (Found!6493 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18053 a!2986) index!984) (select (arr!18053 a!2986) j!136))) (not (= (select (arr!18053 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37614 (_ BitVec 32)) SeekEntryResult!6493)

(assert (=> b!620702 (= lt!286950 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18053 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!620703 () Bool)

(assert (=> b!620703 false))

(declare-fun lt!286940 () Unit!20658)

(assert (=> b!620703 (= lt!286940 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286946 (select (arr!18053 a!2986) j!136) index!984 Nil!12091))))

(assert (=> b!620703 (arrayNoDuplicates!0 lt!286946 index!984 Nil!12091)))

(declare-fun lt!286954 () Unit!20658)

(assert (=> b!620703 (= lt!286954 (lemmaNoDuplicateFromThenFromBigger!0 lt!286946 #b00000000000000000000000000000000 index!984))))

(assert (=> b!620703 (arrayNoDuplicates!0 lt!286946 #b00000000000000000000000000000000 Nil!12091)))

(declare-fun lt!286952 () Unit!20658)

(assert (=> b!620703 (= lt!286952 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12091))))

(assert (=> b!620703 (arrayContainsKey!0 lt!286946 (select (arr!18053 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!286953 () Unit!20658)

(assert (=> b!620703 (= lt!286953 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286946 (select (arr!18053 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!356004 () Bool)

(assert (=> b!620703 e!356004))

(declare-fun res!399977 () Bool)

(assert (=> b!620703 (=> (not res!399977) (not e!356004))))

(assert (=> b!620703 (= res!399977 (arrayContainsKey!0 lt!286946 (select (arr!18053 a!2986) j!136) j!136))))

(declare-fun e!356008 () Unit!20658)

(declare-fun Unit!20661 () Unit!20658)

(assert (=> b!620703 (= e!356008 Unit!20661)))

(declare-fun b!620705 () Bool)

(declare-fun res!399971 () Bool)

(assert (=> b!620705 (=> (not res!399971) (not e!356007))))

(assert (=> b!620705 (= res!399971 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12091))))

(declare-fun b!620706 () Bool)

(declare-fun Unit!20662 () Unit!20658)

(assert (=> b!620706 (= e!356008 Unit!20662)))

(declare-fun b!620707 () Bool)

(assert (=> b!620707 (= e!356004 (arrayContainsKey!0 lt!286946 (select (arr!18053 a!2986) j!136) index!984))))

(declare-fun b!620708 () Bool)

(assert (=> b!620708 (= e!355998 (not true))))

(declare-fun lt!286949 () Unit!20658)

(declare-fun e!356001 () Unit!20658)

(assert (=> b!620708 (= lt!286949 e!356001)))

(declare-fun c!70732 () Bool)

(declare-fun lt!286945 () SeekEntryResult!6493)

(assert (=> b!620708 (= c!70732 (= lt!286945 (Found!6493 index!984)))))

(declare-fun lt!286956 () Unit!20658)

(declare-fun e!356000 () Unit!20658)

(assert (=> b!620708 (= lt!286956 e!356000)))

(declare-fun c!70730 () Bool)

(assert (=> b!620708 (= c!70730 (= lt!286945 Undefined!6493))))

(declare-fun lt!286944 () (_ BitVec 64))

(assert (=> b!620708 (= lt!286945 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!286944 lt!286946 mask!3053))))

(declare-fun e!355999 () Bool)

(assert (=> b!620708 e!355999))

(declare-fun res!399972 () Bool)

(assert (=> b!620708 (=> (not res!399972) (not e!355999))))

(declare-fun lt!286948 () (_ BitVec 32))

(declare-fun lt!286942 () SeekEntryResult!6493)

(assert (=> b!620708 (= res!399972 (= lt!286942 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286948 vacantSpotIndex!68 lt!286944 lt!286946 mask!3053)))))

(assert (=> b!620708 (= lt!286942 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286948 vacantSpotIndex!68 (select (arr!18053 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!620708 (= lt!286944 (select (store (arr!18053 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!286943 () Unit!20658)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37614 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20658)

(assert (=> b!620708 (= lt!286943 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!286948 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!620708 (= lt!286948 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!620709 () Bool)

(assert (=> b!620709 (= e!355999 (= lt!286950 lt!286942))))

(declare-fun b!620710 () Bool)

(declare-fun res!399980 () Bool)

(assert (=> b!620710 (= res!399980 (bvsge j!136 index!984))))

(declare-fun e!356010 () Bool)

(assert (=> b!620710 (=> res!399980 e!356010)))

(declare-fun e!356005 () Bool)

(assert (=> b!620710 (= e!356005 e!356010)))

(declare-fun b!620711 () Bool)

(declare-fun res!399983 () Bool)

(assert (=> b!620711 (=> (not res!399983) (not e!356006))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!620711 (= res!399983 (validKeyInArray!0 (select (arr!18053 a!2986) j!136)))))

(declare-fun b!620712 () Bool)

(declare-fun Unit!20663 () Unit!20658)

(assert (=> b!620712 (= e!356000 Unit!20663)))

(declare-fun res!399982 () Bool)

(declare-fun b!620713 () Bool)

(assert (=> b!620713 (= res!399982 (arrayContainsKey!0 lt!286946 (select (arr!18053 a!2986) j!136) j!136))))

(assert (=> b!620713 (=> (not res!399982) (not e!356003))))

(assert (=> b!620713 (= e!356010 e!356003)))

(declare-fun b!620714 () Bool)

(declare-fun res!399986 () Bool)

(assert (=> b!620714 (=> (not res!399986) (not e!356006))))

(assert (=> b!620714 (= res!399986 (and (= (size!18417 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18417 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18417 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!620715 () Bool)

(declare-fun Unit!20664 () Unit!20658)

(assert (=> b!620715 (= e!356001 Unit!20664)))

(declare-fun b!620716 () Bool)

(declare-fun res!399981 () Bool)

(assert (=> b!620716 (=> (not res!399981) (not e!356007))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37614 (_ BitVec 32)) Bool)

(assert (=> b!620716 (= res!399981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!620717 () Bool)

(declare-fun res!399985 () Bool)

(assert (=> b!620717 (=> (not res!399985) (not e!356006))))

(assert (=> b!620717 (= res!399985 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!620718 () Bool)

(declare-fun Unit!20665 () Unit!20658)

(assert (=> b!620718 (= e!356002 Unit!20665)))

(declare-fun b!620719 () Bool)

(declare-fun Unit!20666 () Unit!20658)

(assert (=> b!620719 (= e!356001 Unit!20666)))

(declare-fun res!399976 () Bool)

(assert (=> b!620719 (= res!399976 (= (select (store (arr!18053 a!2986) i!1108 k!1786) index!984) (select (arr!18053 a!2986) j!136)))))

(assert (=> b!620719 (=> (not res!399976) (not e!356005))))

(assert (=> b!620719 e!356005))

(declare-fun c!70733 () Bool)

(assert (=> b!620719 (= c!70733 (bvslt j!136 index!984))))

(declare-fun lt!286957 () Unit!20658)

(assert (=> b!620719 (= lt!286957 e!356002)))

(declare-fun c!70731 () Bool)

(assert (=> b!620719 (= c!70731 (bvslt index!984 j!136))))

(declare-fun lt!286955 () Unit!20658)

(assert (=> b!620719 (= lt!286955 e!356008)))

(assert (=> b!620719 false))

(declare-fun b!620720 () Bool)

(declare-fun res!399973 () Bool)

(assert (=> b!620720 (=> (not res!399973) (not e!356006))))

(assert (=> b!620720 (= res!399973 (validKeyInArray!0 k!1786))))

(declare-fun res!399975 () Bool)

(assert (=> start!56144 (=> (not res!399975) (not e!356006))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56144 (= res!399975 (validMask!0 mask!3053))))

(assert (=> start!56144 e!356006))

(assert (=> start!56144 true))

(declare-fun array_inv!13849 (array!37614) Bool)

(assert (=> start!56144 (array_inv!13849 a!2986)))

(declare-fun b!620704 () Bool)

(declare-fun Unit!20667 () Unit!20658)

(assert (=> b!620704 (= e!356000 Unit!20667)))

(assert (=> b!620704 false))

(assert (= (and start!56144 res!399975) b!620714))

(assert (= (and b!620714 res!399986) b!620711))

(assert (= (and b!620711 res!399983) b!620720))

(assert (= (and b!620720 res!399973) b!620717))

(assert (= (and b!620717 res!399985) b!620699))

(assert (= (and b!620699 res!399978) b!620716))

(assert (= (and b!620716 res!399981) b!620705))

(assert (= (and b!620705 res!399971) b!620700))

(assert (= (and b!620700 res!399979) b!620697))

(assert (= (and b!620697 res!399974) b!620702))

(assert (= (and b!620702 res!399984) b!620708))

(assert (= (and b!620708 res!399972) b!620709))

(assert (= (and b!620708 c!70730) b!620704))

(assert (= (and b!620708 (not c!70730)) b!620712))

(assert (= (and b!620708 c!70732) b!620719))

(assert (= (and b!620708 (not c!70732)) b!620715))

(assert (= (and b!620719 res!399976) b!620710))

(assert (= (and b!620710 (not res!399980)) b!620713))

(assert (= (and b!620713 res!399982) b!620701))

(assert (= (and b!620719 c!70733) b!620698))

(assert (= (and b!620719 (not c!70733)) b!620718))

(assert (= (and b!620719 c!70731) b!620703))

(assert (= (and b!620719 (not c!70731)) b!620706))

(assert (= (and b!620703 res!399977) b!620707))

(declare-fun m!596611 () Bool)

(assert (=> b!620708 m!596611))

(declare-fun m!596613 () Bool)

(assert (=> b!620708 m!596613))

(declare-fun m!596615 () Bool)

(assert (=> b!620708 m!596615))

(declare-fun m!596617 () Bool)

(assert (=> b!620708 m!596617))

(declare-fun m!596619 () Bool)

(assert (=> b!620708 m!596619))

(declare-fun m!596621 () Bool)

(assert (=> b!620708 m!596621))

(assert (=> b!620708 m!596617))

(declare-fun m!596623 () Bool)

(assert (=> b!620708 m!596623))

(declare-fun m!596625 () Bool)

(assert (=> b!620708 m!596625))

(assert (=> b!620713 m!596617))

(assert (=> b!620713 m!596617))

(declare-fun m!596627 () Bool)

(assert (=> b!620713 m!596627))

(declare-fun m!596629 () Bool)

(assert (=> b!620699 m!596629))

(declare-fun m!596631 () Bool)

(assert (=> b!620705 m!596631))

(declare-fun m!596633 () Bool)

(assert (=> b!620716 m!596633))

(assert (=> b!620697 m!596619))

(declare-fun m!596635 () Bool)

(assert (=> b!620697 m!596635))

(assert (=> b!620701 m!596617))

(assert (=> b!620701 m!596617))

(declare-fun m!596637 () Bool)

(assert (=> b!620701 m!596637))

(assert (=> b!620707 m!596617))

(assert (=> b!620707 m!596617))

(assert (=> b!620707 m!596637))

(assert (=> b!620711 m!596617))

(assert (=> b!620711 m!596617))

(declare-fun m!596639 () Bool)

(assert (=> b!620711 m!596639))

(assert (=> b!620703 m!596617))

(declare-fun m!596641 () Bool)

(assert (=> b!620703 m!596641))

(declare-fun m!596643 () Bool)

(assert (=> b!620703 m!596643))

(declare-fun m!596645 () Bool)

(assert (=> b!620703 m!596645))

(assert (=> b!620703 m!596617))

(assert (=> b!620703 m!596627))

(declare-fun m!596647 () Bool)

(assert (=> b!620703 m!596647))

(assert (=> b!620703 m!596617))

(declare-fun m!596649 () Bool)

(assert (=> b!620703 m!596649))

(declare-fun m!596651 () Bool)

(assert (=> b!620703 m!596651))

(assert (=> b!620703 m!596617))

(declare-fun m!596653 () Bool)

(assert (=> b!620703 m!596653))

(assert (=> b!620703 m!596617))

(assert (=> b!620698 m!596617))

(assert (=> b!620698 m!596617))

(declare-fun m!596655 () Bool)

(assert (=> b!620698 m!596655))

(declare-fun m!596657 () Bool)

(assert (=> b!620698 m!596657))

(assert (=> b!620698 m!596645))

(assert (=> b!620698 m!596617))

(declare-fun m!596659 () Bool)

(assert (=> b!620698 m!596659))

(assert (=> b!620698 m!596617))

(declare-fun m!596661 () Bool)

(assert (=> b!620698 m!596661))

(declare-fun m!596663 () Bool)

(assert (=> b!620698 m!596663))

(assert (=> b!620698 m!596651))

(assert (=> b!620719 m!596619))

(declare-fun m!596665 () Bool)

(assert (=> b!620719 m!596665))

(assert (=> b!620719 m!596617))

(declare-fun m!596667 () Bool)

(assert (=> start!56144 m!596667))

(declare-fun m!596669 () Bool)

(assert (=> start!56144 m!596669))

(declare-fun m!596671 () Bool)

(assert (=> b!620700 m!596671))

(declare-fun m!596673 () Bool)

(assert (=> b!620717 m!596673))

(declare-fun m!596675 () Bool)

(assert (=> b!620702 m!596675))

(assert (=> b!620702 m!596617))

(assert (=> b!620702 m!596617))

(declare-fun m!596677 () Bool)

(assert (=> b!620702 m!596677))

(declare-fun m!596679 () Bool)

(assert (=> b!620720 m!596679))

(push 1)

