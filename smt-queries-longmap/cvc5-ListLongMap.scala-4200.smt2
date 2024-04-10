; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57350 () Bool)

(assert start!57350)

(declare-fun b!634859 () Bool)

(declare-fun res!410705 () Bool)

(declare-fun e!363075 () Bool)

(assert (=> b!634859 (=> (not res!410705) (not e!363075))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!634859 (= res!410705 (validKeyInArray!0 k!1786))))

(declare-fun b!634860 () Bool)

(declare-fun res!410691 () Bool)

(assert (=> b!634860 (=> (not res!410691) (not e!363075))))

(declare-datatypes ((array!38203 0))(
  ( (array!38204 (arr!18330 (Array (_ BitVec 32) (_ BitVec 64))) (size!18694 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38203)

(declare-fun arrayContainsKey!0 (array!38203 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!634860 (= res!410691 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!634861 () Bool)

(declare-fun e!363069 () Bool)

(declare-fun e!363070 () Bool)

(assert (=> b!634861 (= e!363069 e!363070)))

(declare-fun res!410697 () Bool)

(assert (=> b!634861 (=> (not res!410697) (not e!363070))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6770 0))(
  ( (MissingZero!6770 (index!29382 (_ BitVec 32))) (Found!6770 (index!29383 (_ BitVec 32))) (Intermediate!6770 (undefined!7582 Bool) (index!29384 (_ BitVec 32)) (x!58128 (_ BitVec 32))) (Undefined!6770) (MissingVacant!6770 (index!29385 (_ BitVec 32))) )
))
(declare-fun lt!293514 () SeekEntryResult!6770)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!634861 (= res!410697 (and (= lt!293514 (Found!6770 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18330 a!2986) index!984) (select (arr!18330 a!2986) j!136))) (not (= (select (arr!18330 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38203 (_ BitVec 32)) SeekEntryResult!6770)

(assert (=> b!634861 (= lt!293514 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18330 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!634862 () Bool)

(declare-fun res!410703 () Bool)

(assert (=> b!634862 (=> (not res!410703) (not e!363075))))

(assert (=> b!634862 (= res!410703 (validKeyInArray!0 (select (arr!18330 a!2986) j!136)))))

(declare-fun b!634863 () Bool)

(declare-fun res!410701 () Bool)

(declare-fun e!363072 () Bool)

(assert (=> b!634863 (=> (not res!410701) (not e!363072))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38203 (_ BitVec 32)) Bool)

(assert (=> b!634863 (= res!410701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!634864 () Bool)

(declare-fun e!363067 () Bool)

(declare-fun e!363066 () Bool)

(assert (=> b!634864 (= e!363067 e!363066)))

(declare-fun res!410696 () Bool)

(assert (=> b!634864 (=> res!410696 e!363066)))

(declare-fun lt!293511 () (_ BitVec 64))

(declare-fun lt!293516 () (_ BitVec 64))

(assert (=> b!634864 (= res!410696 (or (not (= (select (arr!18330 a!2986) j!136) lt!293511)) (not (= (select (arr!18330 a!2986) j!136) lt!293516)) (bvsge j!136 index!984)))))

(declare-fun e!363074 () Bool)

(assert (=> b!634864 e!363074))

(declare-fun res!410690 () Bool)

(assert (=> b!634864 (=> (not res!410690) (not e!363074))))

(assert (=> b!634864 (= res!410690 (= lt!293516 (select (arr!18330 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!634864 (= lt!293516 (select (store (arr!18330 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!634865 () Bool)

(assert (=> b!634865 (= e!363070 (not e!363067))))

(declare-fun res!410694 () Bool)

(assert (=> b!634865 (=> res!410694 e!363067)))

(declare-fun lt!293515 () SeekEntryResult!6770)

(assert (=> b!634865 (= res!410694 (not (= lt!293515 (Found!6770 index!984))))))

(declare-datatypes ((Unit!21414 0))(
  ( (Unit!21415) )
))
(declare-fun lt!293519 () Unit!21414)

(declare-fun e!363068 () Unit!21414)

(assert (=> b!634865 (= lt!293519 e!363068)))

(declare-fun c!72452 () Bool)

(assert (=> b!634865 (= c!72452 (= lt!293515 Undefined!6770))))

(declare-fun lt!293518 () array!38203)

(assert (=> b!634865 (= lt!293515 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293511 lt!293518 mask!3053))))

(declare-fun e!363064 () Bool)

(assert (=> b!634865 e!363064))

(declare-fun res!410704 () Bool)

(assert (=> b!634865 (=> (not res!410704) (not e!363064))))

(declare-fun lt!293512 () (_ BitVec 32))

(declare-fun lt!293520 () SeekEntryResult!6770)

(assert (=> b!634865 (= res!410704 (= lt!293520 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293512 vacantSpotIndex!68 lt!293511 lt!293518 mask!3053)))))

(assert (=> b!634865 (= lt!293520 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293512 vacantSpotIndex!68 (select (arr!18330 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!634865 (= lt!293511 (select (store (arr!18330 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!293517 () Unit!21414)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38203 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21414)

(assert (=> b!634865 (= lt!293517 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293512 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!634865 (= lt!293512 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun e!363071 () Bool)

(declare-fun b!634866 () Bool)

(assert (=> b!634866 (= e!363071 (arrayContainsKey!0 lt!293518 (select (arr!18330 a!2986) j!136) index!984))))

(declare-fun b!634867 () Bool)

(assert (=> b!634867 (= e!363072 e!363069)))

(declare-fun res!410699 () Bool)

(assert (=> b!634867 (=> (not res!410699) (not e!363069))))

(assert (=> b!634867 (= res!410699 (= (select (store (arr!18330 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!634867 (= lt!293518 (array!38204 (store (arr!18330 a!2986) i!1108 k!1786) (size!18694 a!2986)))))

(declare-fun b!634868 () Bool)

(declare-fun Unit!21416 () Unit!21414)

(assert (=> b!634868 (= e!363068 Unit!21416)))

(declare-fun b!634869 () Bool)

(declare-fun Unit!21417 () Unit!21414)

(assert (=> b!634869 (= e!363068 Unit!21417)))

(assert (=> b!634869 false))

(declare-fun b!634871 () Bool)

(assert (=> b!634871 (= e!363064 (= lt!293514 lt!293520))))

(declare-fun b!634872 () Bool)

(declare-fun res!410695 () Bool)

(assert (=> b!634872 (=> (not res!410695) (not e!363075))))

(assert (=> b!634872 (= res!410695 (and (= (size!18694 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18694 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18694 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!634873 () Bool)

(assert (=> b!634873 (= e!363066 true)))

(assert (=> b!634873 (arrayContainsKey!0 lt!293518 (select (arr!18330 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!293521 () Unit!21414)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38203 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21414)

(assert (=> b!634873 (= lt!293521 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!293518 (select (arr!18330 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!634874 () Bool)

(declare-fun res!410689 () Bool)

(assert (=> b!634874 (=> (not res!410689) (not e!363072))))

(assert (=> b!634874 (= res!410689 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18330 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!634875 () Bool)

(declare-fun e!363065 () Bool)

(assert (=> b!634875 (= e!363065 e!363071)))

(declare-fun res!410702 () Bool)

(assert (=> b!634875 (=> (not res!410702) (not e!363071))))

(assert (=> b!634875 (= res!410702 (arrayContainsKey!0 lt!293518 (select (arr!18330 a!2986) j!136) j!136))))

(declare-fun b!634876 () Bool)

(assert (=> b!634876 (= e!363075 e!363072)))

(declare-fun res!410693 () Bool)

(assert (=> b!634876 (=> (not res!410693) (not e!363072))))

(declare-fun lt!293513 () SeekEntryResult!6770)

(assert (=> b!634876 (= res!410693 (or (= lt!293513 (MissingZero!6770 i!1108)) (= lt!293513 (MissingVacant!6770 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38203 (_ BitVec 32)) SeekEntryResult!6770)

(assert (=> b!634876 (= lt!293513 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!634877 () Bool)

(assert (=> b!634877 (= e!363074 e!363065)))

(declare-fun res!410700 () Bool)

(assert (=> b!634877 (=> res!410700 e!363065)))

(assert (=> b!634877 (= res!410700 (or (not (= (select (arr!18330 a!2986) j!136) lt!293511)) (not (= (select (arr!18330 a!2986) j!136) lt!293516)) (bvsge j!136 index!984)))))

(declare-fun b!634870 () Bool)

(declare-fun res!410692 () Bool)

(assert (=> b!634870 (=> (not res!410692) (not e!363072))))

(declare-datatypes ((List!12371 0))(
  ( (Nil!12368) (Cons!12367 (h!13412 (_ BitVec 64)) (t!18599 List!12371)) )
))
(declare-fun arrayNoDuplicates!0 (array!38203 (_ BitVec 32) List!12371) Bool)

(assert (=> b!634870 (= res!410692 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12368))))

(declare-fun res!410698 () Bool)

(assert (=> start!57350 (=> (not res!410698) (not e!363075))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57350 (= res!410698 (validMask!0 mask!3053))))

(assert (=> start!57350 e!363075))

(assert (=> start!57350 true))

(declare-fun array_inv!14126 (array!38203) Bool)

(assert (=> start!57350 (array_inv!14126 a!2986)))

(assert (= (and start!57350 res!410698) b!634872))

(assert (= (and b!634872 res!410695) b!634862))

(assert (= (and b!634862 res!410703) b!634859))

(assert (= (and b!634859 res!410705) b!634860))

(assert (= (and b!634860 res!410691) b!634876))

(assert (= (and b!634876 res!410693) b!634863))

(assert (= (and b!634863 res!410701) b!634870))

(assert (= (and b!634870 res!410692) b!634874))

(assert (= (and b!634874 res!410689) b!634867))

(assert (= (and b!634867 res!410699) b!634861))

(assert (= (and b!634861 res!410697) b!634865))

(assert (= (and b!634865 res!410704) b!634871))

(assert (= (and b!634865 c!72452) b!634869))

(assert (= (and b!634865 (not c!72452)) b!634868))

(assert (= (and b!634865 (not res!410694)) b!634864))

(assert (= (and b!634864 res!410690) b!634877))

(assert (= (and b!634877 (not res!410700)) b!634875))

(assert (= (and b!634875 res!410702) b!634866))

(assert (= (and b!634864 (not res!410696)) b!634873))

(declare-fun m!609293 () Bool)

(assert (=> b!634877 m!609293))

(declare-fun m!609295 () Bool)

(assert (=> b!634867 m!609295))

(declare-fun m!609297 () Bool)

(assert (=> b!634867 m!609297))

(assert (=> b!634866 m!609293))

(assert (=> b!634866 m!609293))

(declare-fun m!609299 () Bool)

(assert (=> b!634866 m!609299))

(declare-fun m!609301 () Bool)

(assert (=> b!634870 m!609301))

(declare-fun m!609303 () Bool)

(assert (=> b!634876 m!609303))

(assert (=> b!634864 m!609293))

(assert (=> b!634864 m!609295))

(declare-fun m!609305 () Bool)

(assert (=> b!634864 m!609305))

(assert (=> b!634862 m!609293))

(assert (=> b!634862 m!609293))

(declare-fun m!609307 () Bool)

(assert (=> b!634862 m!609307))

(declare-fun m!609309 () Bool)

(assert (=> b!634861 m!609309))

(assert (=> b!634861 m!609293))

(assert (=> b!634861 m!609293))

(declare-fun m!609311 () Bool)

(assert (=> b!634861 m!609311))

(declare-fun m!609313 () Bool)

(assert (=> b!634860 m!609313))

(declare-fun m!609315 () Bool)

(assert (=> b!634863 m!609315))

(declare-fun m!609317 () Bool)

(assert (=> start!57350 m!609317))

(declare-fun m!609319 () Bool)

(assert (=> start!57350 m!609319))

(declare-fun m!609321 () Bool)

(assert (=> b!634865 m!609321))

(declare-fun m!609323 () Bool)

(assert (=> b!634865 m!609323))

(assert (=> b!634865 m!609293))

(assert (=> b!634865 m!609295))

(declare-fun m!609325 () Bool)

(assert (=> b!634865 m!609325))

(declare-fun m!609327 () Bool)

(assert (=> b!634865 m!609327))

(assert (=> b!634865 m!609293))

(declare-fun m!609329 () Bool)

(assert (=> b!634865 m!609329))

(declare-fun m!609331 () Bool)

(assert (=> b!634865 m!609331))

(declare-fun m!609333 () Bool)

(assert (=> b!634874 m!609333))

(declare-fun m!609335 () Bool)

(assert (=> b!634859 m!609335))

(assert (=> b!634875 m!609293))

(assert (=> b!634875 m!609293))

(declare-fun m!609337 () Bool)

(assert (=> b!634875 m!609337))

(assert (=> b!634873 m!609293))

(assert (=> b!634873 m!609293))

(declare-fun m!609339 () Bool)

(assert (=> b!634873 m!609339))

(assert (=> b!634873 m!609293))

(declare-fun m!609341 () Bool)

(assert (=> b!634873 m!609341))

(push 1)

