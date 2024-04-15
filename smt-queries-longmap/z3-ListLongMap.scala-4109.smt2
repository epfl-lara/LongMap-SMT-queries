; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56136 () Bool)

(assert start!56136)

(declare-fun b!620714 () Bool)

(declare-fun res!400037 () Bool)

(declare-fun e!355997 () Bool)

(assert (=> b!620714 (=> (not res!400037) (not e!355997))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!620714 (= res!400037 (validKeyInArray!0 k0!1786))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37620 0))(
  ( (array!37621 (arr!18056 (Array (_ BitVec 32) (_ BitVec 64))) (size!18421 (_ BitVec 32))) )
))
(declare-fun lt!286953 () array!37620)

(declare-fun a!2986 () array!37620)

(declare-fun res!400044 () Bool)

(declare-fun b!620715 () Bool)

(declare-fun arrayContainsKey!0 (array!37620 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!620715 (= res!400044 (arrayContainsKey!0 lt!286953 (select (arr!18056 a!2986) j!136) j!136))))

(declare-fun e!355996 () Bool)

(assert (=> b!620715 (=> (not res!400044) (not e!355996))))

(declare-fun e!355999 () Bool)

(assert (=> b!620715 (= e!355999 e!355996)))

(declare-fun b!620716 () Bool)

(declare-fun res!400041 () Bool)

(assert (=> b!620716 (=> (not res!400041) (not e!355997))))

(assert (=> b!620716 (= res!400041 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!620717 () Bool)

(declare-fun e!355991 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!620717 (= e!355991 (arrayContainsKey!0 lt!286953 (select (arr!18056 a!2986) j!136) index!984))))

(declare-fun b!620718 () Bool)

(declare-fun e!356001 () Bool)

(assert (=> b!620718 (= e!356001 (not true))))

(declare-datatypes ((Unit!20676 0))(
  ( (Unit!20677) )
))
(declare-fun lt!286958 () Unit!20676)

(declare-fun e!355993 () Unit!20676)

(assert (=> b!620718 (= lt!286958 e!355993)))

(declare-fun c!70710 () Bool)

(declare-datatypes ((SeekEntryResult!6493 0))(
  ( (MissingZero!6493 (index!28256 (_ BitVec 32))) (Found!6493 (index!28257 (_ BitVec 32))) (Intermediate!6493 (undefined!7305 Bool) (index!28258 (_ BitVec 32)) (x!57040 (_ BitVec 32))) (Undefined!6493) (MissingVacant!6493 (index!28259 (_ BitVec 32))) )
))
(declare-fun lt!286957 () SeekEntryResult!6493)

(assert (=> b!620718 (= c!70710 (= lt!286957 (Found!6493 index!984)))))

(declare-fun lt!286951 () Unit!20676)

(declare-fun e!355998 () Unit!20676)

(assert (=> b!620718 (= lt!286951 e!355998)))

(declare-fun c!70707 () Bool)

(assert (=> b!620718 (= c!70707 (= lt!286957 Undefined!6493))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!286949 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37620 (_ BitVec 32)) SeekEntryResult!6493)

(assert (=> b!620718 (= lt!286957 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!286949 lt!286953 mask!3053))))

(declare-fun e!356003 () Bool)

(assert (=> b!620718 e!356003))

(declare-fun res!400036 () Bool)

(assert (=> b!620718 (=> (not res!400036) (not e!356003))))

(declare-fun lt!286959 () SeekEntryResult!6493)

(declare-fun lt!286960 () (_ BitVec 32))

(assert (=> b!620718 (= res!400036 (= lt!286959 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286960 vacantSpotIndex!68 lt!286949 lt!286953 mask!3053)))))

(assert (=> b!620718 (= lt!286959 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286960 vacantSpotIndex!68 (select (arr!18056 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!620718 (= lt!286949 (select (store (arr!18056 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!286962 () Unit!20676)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37620 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20676)

(assert (=> b!620718 (= lt!286962 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!286960 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!620718 (= lt!286960 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!620719 () Bool)

(declare-fun e!355995 () Bool)

(assert (=> b!620719 (= e!355995 e!356001)))

(declare-fun res!400048 () Bool)

(assert (=> b!620719 (=> (not res!400048) (not e!356001))))

(declare-fun lt!286944 () SeekEntryResult!6493)

(assert (=> b!620719 (= res!400048 (and (= lt!286944 (Found!6493 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18056 a!2986) index!984) (select (arr!18056 a!2986) j!136))) (not (= (select (arr!18056 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!620719 (= lt!286944 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18056 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!620720 () Bool)

(assert (=> b!620720 false))

(declare-fun lt!286963 () Unit!20676)

(declare-datatypes ((List!12136 0))(
  ( (Nil!12133) (Cons!12132 (h!13177 (_ BitVec 64)) (t!18355 List!12136)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37620 (_ BitVec 64) (_ BitVec 32) List!12136) Unit!20676)

(assert (=> b!620720 (= lt!286963 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286953 (select (arr!18056 a!2986) j!136) index!984 Nil!12133))))

(declare-fun arrayNoDuplicates!0 (array!37620 (_ BitVec 32) List!12136) Bool)

(assert (=> b!620720 (arrayNoDuplicates!0 lt!286953 index!984 Nil!12133)))

(declare-fun lt!286946 () Unit!20676)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37620 (_ BitVec 32) (_ BitVec 32)) Unit!20676)

(assert (=> b!620720 (= lt!286946 (lemmaNoDuplicateFromThenFromBigger!0 lt!286953 #b00000000000000000000000000000000 index!984))))

(assert (=> b!620720 (arrayNoDuplicates!0 lt!286953 #b00000000000000000000000000000000 Nil!12133)))

(declare-fun lt!286956 () Unit!20676)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37620 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12136) Unit!20676)

(assert (=> b!620720 (= lt!286956 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12133))))

(assert (=> b!620720 (arrayContainsKey!0 lt!286953 (select (arr!18056 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!286952 () Unit!20676)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37620 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20676)

(assert (=> b!620720 (= lt!286952 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286953 (select (arr!18056 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!620720 e!355991))

(declare-fun res!400049 () Bool)

(assert (=> b!620720 (=> (not res!400049) (not e!355991))))

(assert (=> b!620720 (= res!400049 (arrayContainsKey!0 lt!286953 (select (arr!18056 a!2986) j!136) j!136))))

(declare-fun e!356004 () Unit!20676)

(declare-fun Unit!20678 () Unit!20676)

(assert (=> b!620720 (= e!356004 Unit!20678)))

(declare-fun res!400034 () Bool)

(assert (=> start!56136 (=> (not res!400034) (not e!355997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56136 (= res!400034 (validMask!0 mask!3053))))

(assert (=> start!56136 e!355997))

(assert (=> start!56136 true))

(declare-fun array_inv!13939 (array!37620) Bool)

(assert (=> start!56136 (array_inv!13939 a!2986)))

(declare-fun b!620721 () Bool)

(declare-fun Unit!20679 () Unit!20676)

(assert (=> b!620721 (= e!355998 Unit!20679)))

(assert (=> b!620721 false))

(declare-fun b!620722 () Bool)

(declare-fun e!356000 () Unit!20676)

(declare-fun Unit!20680 () Unit!20676)

(assert (=> b!620722 (= e!356000 Unit!20680)))

(declare-fun b!620723 () Bool)

(declare-fun e!355994 () Bool)

(assert (=> b!620723 (= e!355994 e!355995)))

(declare-fun res!400045 () Bool)

(assert (=> b!620723 (=> (not res!400045) (not e!355995))))

(assert (=> b!620723 (= res!400045 (= (select (store (arr!18056 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!620723 (= lt!286953 (array!37621 (store (arr!18056 a!2986) i!1108 k0!1786) (size!18421 a!2986)))))

(declare-fun b!620724 () Bool)

(declare-fun res!400047 () Bool)

(assert (=> b!620724 (=> (not res!400047) (not e!355997))))

(assert (=> b!620724 (= res!400047 (and (= (size!18421 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18421 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18421 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!620725 () Bool)

(declare-fun res!400039 () Bool)

(assert (=> b!620725 (=> (not res!400039) (not e!355994))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37620 (_ BitVec 32)) Bool)

(assert (=> b!620725 (= res!400039 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!620726 () Bool)

(assert (=> b!620726 false))

(declare-fun lt!286948 () Unit!20676)

(assert (=> b!620726 (= lt!286948 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286953 (select (arr!18056 a!2986) j!136) j!136 Nil!12133))))

(assert (=> b!620726 (arrayNoDuplicates!0 lt!286953 j!136 Nil!12133)))

(declare-fun lt!286955 () Unit!20676)

(assert (=> b!620726 (= lt!286955 (lemmaNoDuplicateFromThenFromBigger!0 lt!286953 #b00000000000000000000000000000000 j!136))))

(assert (=> b!620726 (arrayNoDuplicates!0 lt!286953 #b00000000000000000000000000000000 Nil!12133)))

(declare-fun lt!286961 () Unit!20676)

(assert (=> b!620726 (= lt!286961 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12133))))

(assert (=> b!620726 (arrayContainsKey!0 lt!286953 (select (arr!18056 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!286945 () Unit!20676)

(assert (=> b!620726 (= lt!286945 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286953 (select (arr!18056 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20681 () Unit!20676)

(assert (=> b!620726 (= e!356000 Unit!20681)))

(declare-fun b!620727 () Bool)

(declare-fun Unit!20682 () Unit!20676)

(assert (=> b!620727 (= e!355998 Unit!20682)))

(declare-fun b!620728 () Bool)

(declare-fun Unit!20683 () Unit!20676)

(assert (=> b!620728 (= e!355993 Unit!20683)))

(declare-fun res!400038 () Bool)

(assert (=> b!620728 (= res!400038 (= (select (store (arr!18056 a!2986) i!1108 k0!1786) index!984) (select (arr!18056 a!2986) j!136)))))

(declare-fun e!355992 () Bool)

(assert (=> b!620728 (=> (not res!400038) (not e!355992))))

(assert (=> b!620728 e!355992))

(declare-fun c!70709 () Bool)

(assert (=> b!620728 (= c!70709 (bvslt j!136 index!984))))

(declare-fun lt!286947 () Unit!20676)

(assert (=> b!620728 (= lt!286947 e!356000)))

(declare-fun c!70708 () Bool)

(assert (=> b!620728 (= c!70708 (bvslt index!984 j!136))))

(declare-fun lt!286950 () Unit!20676)

(assert (=> b!620728 (= lt!286950 e!356004)))

(assert (=> b!620728 false))

(declare-fun b!620729 () Bool)

(assert (=> b!620729 (= e!356003 (= lt!286944 lt!286959))))

(declare-fun b!620730 () Bool)

(declare-fun res!400035 () Bool)

(assert (=> b!620730 (=> (not res!400035) (not e!355994))))

(assert (=> b!620730 (= res!400035 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18056 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!620731 () Bool)

(declare-fun Unit!20684 () Unit!20676)

(assert (=> b!620731 (= e!356004 Unit!20684)))

(declare-fun b!620732 () Bool)

(declare-fun res!400040 () Bool)

(assert (=> b!620732 (=> (not res!400040) (not e!355997))))

(assert (=> b!620732 (= res!400040 (validKeyInArray!0 (select (arr!18056 a!2986) j!136)))))

(declare-fun b!620733 () Bool)

(declare-fun res!400046 () Bool)

(assert (=> b!620733 (=> (not res!400046) (not e!355994))))

(assert (=> b!620733 (= res!400046 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12133))))

(declare-fun b!620734 () Bool)

(assert (=> b!620734 (= e!355996 (arrayContainsKey!0 lt!286953 (select (arr!18056 a!2986) j!136) index!984))))

(declare-fun b!620735 () Bool)

(declare-fun Unit!20685 () Unit!20676)

(assert (=> b!620735 (= e!355993 Unit!20685)))

(declare-fun b!620736 () Bool)

(assert (=> b!620736 (= e!355997 e!355994)))

(declare-fun res!400042 () Bool)

(assert (=> b!620736 (=> (not res!400042) (not e!355994))))

(declare-fun lt!286954 () SeekEntryResult!6493)

(assert (=> b!620736 (= res!400042 (or (= lt!286954 (MissingZero!6493 i!1108)) (= lt!286954 (MissingVacant!6493 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37620 (_ BitVec 32)) SeekEntryResult!6493)

(assert (=> b!620736 (= lt!286954 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!620737 () Bool)

(declare-fun res!400043 () Bool)

(assert (=> b!620737 (= res!400043 (bvsge j!136 index!984))))

(assert (=> b!620737 (=> res!400043 e!355999)))

(assert (=> b!620737 (= e!355992 e!355999)))

(assert (= (and start!56136 res!400034) b!620724))

(assert (= (and b!620724 res!400047) b!620732))

(assert (= (and b!620732 res!400040) b!620714))

(assert (= (and b!620714 res!400037) b!620716))

(assert (= (and b!620716 res!400041) b!620736))

(assert (= (and b!620736 res!400042) b!620725))

(assert (= (and b!620725 res!400039) b!620733))

(assert (= (and b!620733 res!400046) b!620730))

(assert (= (and b!620730 res!400035) b!620723))

(assert (= (and b!620723 res!400045) b!620719))

(assert (= (and b!620719 res!400048) b!620718))

(assert (= (and b!620718 res!400036) b!620729))

(assert (= (and b!620718 c!70707) b!620721))

(assert (= (and b!620718 (not c!70707)) b!620727))

(assert (= (and b!620718 c!70710) b!620728))

(assert (= (and b!620718 (not c!70710)) b!620735))

(assert (= (and b!620728 res!400038) b!620737))

(assert (= (and b!620737 (not res!400043)) b!620715))

(assert (= (and b!620715 res!400044) b!620734))

(assert (= (and b!620728 c!70709) b!620726))

(assert (= (and b!620728 (not c!70709)) b!620722))

(assert (= (and b!620728 c!70708) b!620720))

(assert (= (and b!620728 (not c!70708)) b!620731))

(assert (= (and b!620720 res!400049) b!620717))

(declare-fun m!596119 () Bool)

(assert (=> b!620718 m!596119))

(declare-fun m!596121 () Bool)

(assert (=> b!620718 m!596121))

(declare-fun m!596123 () Bool)

(assert (=> b!620718 m!596123))

(declare-fun m!596125 () Bool)

(assert (=> b!620718 m!596125))

(declare-fun m!596127 () Bool)

(assert (=> b!620718 m!596127))

(declare-fun m!596129 () Bool)

(assert (=> b!620718 m!596129))

(assert (=> b!620718 m!596127))

(declare-fun m!596131 () Bool)

(assert (=> b!620718 m!596131))

(declare-fun m!596133 () Bool)

(assert (=> b!620718 m!596133))

(declare-fun m!596135 () Bool)

(assert (=> b!620730 m!596135))

(assert (=> b!620723 m!596129))

(declare-fun m!596137 () Bool)

(assert (=> b!620723 m!596137))

(assert (=> b!620726 m!596127))

(declare-fun m!596139 () Bool)

(assert (=> b!620726 m!596139))

(declare-fun m!596141 () Bool)

(assert (=> b!620726 m!596141))

(assert (=> b!620726 m!596127))

(declare-fun m!596143 () Bool)

(assert (=> b!620726 m!596143))

(assert (=> b!620726 m!596127))

(declare-fun m!596145 () Bool)

(assert (=> b!620726 m!596145))

(assert (=> b!620726 m!596127))

(declare-fun m!596147 () Bool)

(assert (=> b!620726 m!596147))

(declare-fun m!596149 () Bool)

(assert (=> b!620726 m!596149))

(declare-fun m!596151 () Bool)

(assert (=> b!620726 m!596151))

(assert (=> b!620717 m!596127))

(assert (=> b!620717 m!596127))

(declare-fun m!596153 () Bool)

(assert (=> b!620717 m!596153))

(assert (=> b!620734 m!596127))

(assert (=> b!620734 m!596127))

(assert (=> b!620734 m!596153))

(declare-fun m!596155 () Bool)

(assert (=> b!620733 m!596155))

(declare-fun m!596157 () Bool)

(assert (=> b!620714 m!596157))

(declare-fun m!596159 () Bool)

(assert (=> b!620719 m!596159))

(assert (=> b!620719 m!596127))

(assert (=> b!620719 m!596127))

(declare-fun m!596161 () Bool)

(assert (=> b!620719 m!596161))

(assert (=> b!620732 m!596127))

(assert (=> b!620732 m!596127))

(declare-fun m!596163 () Bool)

(assert (=> b!620732 m!596163))

(assert (=> b!620720 m!596127))

(declare-fun m!596165 () Bool)

(assert (=> b!620720 m!596165))

(assert (=> b!620720 m!596127))

(assert (=> b!620720 m!596127))

(declare-fun m!596167 () Bool)

(assert (=> b!620720 m!596167))

(declare-fun m!596169 () Bool)

(assert (=> b!620720 m!596169))

(assert (=> b!620720 m!596145))

(assert (=> b!620720 m!596127))

(declare-fun m!596171 () Bool)

(assert (=> b!620720 m!596171))

(declare-fun m!596173 () Bool)

(assert (=> b!620720 m!596173))

(assert (=> b!620720 m!596127))

(declare-fun m!596175 () Bool)

(assert (=> b!620720 m!596175))

(assert (=> b!620720 m!596151))

(declare-fun m!596177 () Bool)

(assert (=> b!620736 m!596177))

(assert (=> b!620728 m!596129))

(declare-fun m!596179 () Bool)

(assert (=> b!620728 m!596179))

(assert (=> b!620728 m!596127))

(declare-fun m!596181 () Bool)

(assert (=> start!56136 m!596181))

(declare-fun m!596183 () Bool)

(assert (=> start!56136 m!596183))

(declare-fun m!596185 () Bool)

(assert (=> b!620716 m!596185))

(declare-fun m!596187 () Bool)

(assert (=> b!620725 m!596187))

(assert (=> b!620715 m!596127))

(assert (=> b!620715 m!596127))

(assert (=> b!620715 m!596167))

(check-sat (not b!620715) (not b!620717) (not b!620733) (not b!620734) (not b!620719) (not start!56136) (not b!620726) (not b!620725) (not b!620736) (not b!620720) (not b!620714) (not b!620716) (not b!620718) (not b!620732))
(check-sat)
