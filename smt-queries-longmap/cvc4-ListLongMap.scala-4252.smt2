; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58986 () Bool)

(assert start!58986)

(declare-fun b!650704 () Bool)

(declare-datatypes ((Unit!22194 0))(
  ( (Unit!22195) )
))
(declare-fun e!373337 () Unit!22194)

(declare-fun Unit!22196 () Unit!22194)

(assert (=> b!650704 (= e!373337 Unit!22196)))

(declare-fun b!650705 () Bool)

(declare-fun res!421838 () Bool)

(declare-fun e!373336 () Bool)

(assert (=> b!650705 (=> (not res!421838) (not e!373336))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!650705 (= res!421838 (validKeyInArray!0 k!1786))))

(declare-fun b!650707 () Bool)

(declare-fun e!373341 () Unit!22194)

(declare-fun Unit!22197 () Unit!22194)

(assert (=> b!650707 (= e!373341 Unit!22197)))

(declare-fun b!650708 () Bool)

(declare-fun res!421834 () Bool)

(assert (=> b!650708 (=> (not res!421834) (not e!373336))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!38567 0))(
  ( (array!38568 (arr!18488 (Array (_ BitVec 32) (_ BitVec 64))) (size!18852 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38567)

(assert (=> b!650708 (= res!421834 (and (= (size!18852 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18852 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18852 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!650709 () Bool)

(declare-fun res!421832 () Bool)

(assert (=> b!650709 (=> (not res!421832) (not e!373336))))

(assert (=> b!650709 (= res!421832 (validKeyInArray!0 (select (arr!18488 a!2986) j!136)))))

(declare-fun e!373339 () Bool)

(declare-fun b!650710 () Bool)

(declare-fun lt!302395 () array!38567)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38567 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!650710 (= e!373339 (arrayContainsKey!0 lt!302395 (select (arr!18488 a!2986) j!136) index!984))))

(declare-fun b!650711 () Bool)

(declare-fun e!373332 () Bool)

(declare-fun e!373327 () Bool)

(assert (=> b!650711 (= e!373332 e!373327)))

(declare-fun res!421846 () Bool)

(assert (=> b!650711 (=> res!421846 e!373327)))

(assert (=> b!650711 (= res!421846 (bvsge index!984 j!136))))

(declare-fun lt!302397 () Unit!22194)

(assert (=> b!650711 (= lt!302397 e!373337)))

(declare-fun c!74803 () Bool)

(assert (=> b!650711 (= c!74803 (bvslt j!136 index!984))))

(declare-fun b!650712 () Bool)

(declare-fun e!373333 () Bool)

(assert (=> b!650712 (= e!373336 e!373333)))

(declare-fun res!421843 () Bool)

(assert (=> b!650712 (=> (not res!421843) (not e!373333))))

(declare-datatypes ((SeekEntryResult!6928 0))(
  ( (MissingZero!6928 (index!30062 (_ BitVec 32))) (Found!6928 (index!30063 (_ BitVec 32))) (Intermediate!6928 (undefined!7740 Bool) (index!30064 (_ BitVec 32)) (x!58846 (_ BitVec 32))) (Undefined!6928) (MissingVacant!6928 (index!30065 (_ BitVec 32))) )
))
(declare-fun lt!302394 () SeekEntryResult!6928)

(assert (=> b!650712 (= res!421843 (or (= lt!302394 (MissingZero!6928 i!1108)) (= lt!302394 (MissingVacant!6928 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38567 (_ BitVec 32)) SeekEntryResult!6928)

(assert (=> b!650712 (= lt!302394 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!650713 () Bool)

(declare-fun e!373328 () Bool)

(assert (=> b!650713 (= e!373328 e!373332)))

(declare-fun res!421833 () Bool)

(assert (=> b!650713 (=> res!421833 e!373332)))

(declare-fun lt!302396 () (_ BitVec 64))

(declare-fun lt!302401 () (_ BitVec 64))

(assert (=> b!650713 (= res!421833 (or (not (= (select (arr!18488 a!2986) j!136) lt!302401)) (not (= (select (arr!18488 a!2986) j!136) lt!302396))))))

(declare-fun e!373329 () Bool)

(assert (=> b!650713 e!373329))

(declare-fun res!421850 () Bool)

(assert (=> b!650713 (=> (not res!421850) (not e!373329))))

(assert (=> b!650713 (= res!421850 (= lt!302396 (select (arr!18488 a!2986) j!136)))))

(assert (=> b!650713 (= lt!302396 (select (store (arr!18488 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!650714 () Bool)

(assert (=> b!650714 (= e!373327 (or (bvsge (size!18852 a!2986) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (size!18852 a!2986))))))

(declare-datatypes ((List!12529 0))(
  ( (Nil!12526) (Cons!12525 (h!13570 (_ BitVec 64)) (t!18757 List!12529)) )
))
(declare-fun arrayNoDuplicates!0 (array!38567 (_ BitVec 32) List!12529) Bool)

(assert (=> b!650714 (arrayNoDuplicates!0 lt!302395 #b00000000000000000000000000000000 Nil!12526)))

(declare-fun lt!302398 () Unit!22194)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38567 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12529) Unit!22194)

(assert (=> b!650714 (= lt!302398 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12526))))

(assert (=> b!650714 (arrayContainsKey!0 lt!302395 (select (arr!18488 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!302402 () Unit!22194)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38567 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22194)

(assert (=> b!650714 (= lt!302402 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302395 (select (arr!18488 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!373340 () Bool)

(assert (=> b!650714 e!373340))

(declare-fun res!421835 () Bool)

(assert (=> b!650714 (=> (not res!421835) (not e!373340))))

(assert (=> b!650714 (= res!421835 (arrayContainsKey!0 lt!302395 (select (arr!18488 a!2986) j!136) j!136))))

(declare-fun b!650715 () Bool)

(declare-fun res!421842 () Bool)

(assert (=> b!650715 (=> (not res!421842) (not e!373333))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!650715 (= res!421842 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18488 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!650716 () Bool)

(declare-fun res!421839 () Bool)

(assert (=> b!650716 (=> (not res!421839) (not e!373336))))

(assert (=> b!650716 (= res!421839 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!650717 () Bool)

(declare-fun e!373330 () Bool)

(assert (=> b!650717 (= e!373330 (not e!373328))))

(declare-fun res!421845 () Bool)

(assert (=> b!650717 (=> res!421845 e!373328)))

(declare-fun lt!302406 () SeekEntryResult!6928)

(assert (=> b!650717 (= res!421845 (not (= lt!302406 (Found!6928 index!984))))))

(declare-fun lt!302392 () Unit!22194)

(assert (=> b!650717 (= lt!302392 e!373341)))

(declare-fun c!74804 () Bool)

(assert (=> b!650717 (= c!74804 (= lt!302406 Undefined!6928))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38567 (_ BitVec 32)) SeekEntryResult!6928)

(assert (=> b!650717 (= lt!302406 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!302401 lt!302395 mask!3053))))

(declare-fun e!373335 () Bool)

(assert (=> b!650717 e!373335))

(declare-fun res!421847 () Bool)

(assert (=> b!650717 (=> (not res!421847) (not e!373335))))

(declare-fun lt!302404 () SeekEntryResult!6928)

(declare-fun lt!302391 () (_ BitVec 32))

(assert (=> b!650717 (= res!421847 (= lt!302404 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302391 vacantSpotIndex!68 lt!302401 lt!302395 mask!3053)))))

(assert (=> b!650717 (= lt!302404 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302391 vacantSpotIndex!68 (select (arr!18488 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!650717 (= lt!302401 (select (store (arr!18488 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!302399 () Unit!22194)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38567 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22194)

(assert (=> b!650717 (= lt!302399 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!302391 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!650717 (= lt!302391 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!650718 () Bool)

(declare-fun e!373338 () Bool)

(assert (=> b!650718 (= e!373338 e!373330)))

(declare-fun res!421837 () Bool)

(assert (=> b!650718 (=> (not res!421837) (not e!373330))))

(declare-fun lt!302405 () SeekEntryResult!6928)

(assert (=> b!650718 (= res!421837 (and (= lt!302405 (Found!6928 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18488 a!2986) index!984) (select (arr!18488 a!2986) j!136))) (not (= (select (arr!18488 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!650718 (= lt!302405 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18488 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!650719 () Bool)

(assert (=> b!650719 (= e!373340 (arrayContainsKey!0 lt!302395 (select (arr!18488 a!2986) j!136) index!984))))

(declare-fun res!421849 () Bool)

(assert (=> start!58986 (=> (not res!421849) (not e!373336))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58986 (= res!421849 (validMask!0 mask!3053))))

(assert (=> start!58986 e!373336))

(assert (=> start!58986 true))

(declare-fun array_inv!14284 (array!38567) Bool)

(assert (=> start!58986 (array_inv!14284 a!2986)))

(declare-fun b!650706 () Bool)

(assert (=> b!650706 (= e!373333 e!373338)))

(declare-fun res!421836 () Bool)

(assert (=> b!650706 (=> (not res!421836) (not e!373338))))

(assert (=> b!650706 (= res!421836 (= (select (store (arr!18488 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!650706 (= lt!302395 (array!38568 (store (arr!18488 a!2986) i!1108 k!1786) (size!18852 a!2986)))))

(declare-fun b!650720 () Bool)

(declare-fun Unit!22198 () Unit!22194)

(assert (=> b!650720 (= e!373341 Unit!22198)))

(assert (=> b!650720 false))

(declare-fun b!650721 () Bool)

(declare-fun e!373334 () Bool)

(assert (=> b!650721 (= e!373334 e!373339)))

(declare-fun res!421848 () Bool)

(assert (=> b!650721 (=> (not res!421848) (not e!373339))))

(assert (=> b!650721 (= res!421848 (arrayContainsKey!0 lt!302395 (select (arr!18488 a!2986) j!136) j!136))))

(declare-fun b!650722 () Bool)

(declare-fun res!421844 () Bool)

(assert (=> b!650722 (=> (not res!421844) (not e!373333))))

(assert (=> b!650722 (= res!421844 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12526))))

(declare-fun b!650723 () Bool)

(declare-fun Unit!22199 () Unit!22194)

(assert (=> b!650723 (= e!373337 Unit!22199)))

(declare-fun lt!302393 () Unit!22194)

(assert (=> b!650723 (= lt!302393 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302395 (select (arr!18488 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!650723 (arrayContainsKey!0 lt!302395 (select (arr!18488 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!302403 () Unit!22194)

(assert (=> b!650723 (= lt!302403 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12526))))

(assert (=> b!650723 (arrayNoDuplicates!0 lt!302395 #b00000000000000000000000000000000 Nil!12526)))

(declare-fun lt!302407 () Unit!22194)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38567 (_ BitVec 32) (_ BitVec 32)) Unit!22194)

(assert (=> b!650723 (= lt!302407 (lemmaNoDuplicateFromThenFromBigger!0 lt!302395 #b00000000000000000000000000000000 j!136))))

(assert (=> b!650723 (arrayNoDuplicates!0 lt!302395 j!136 Nil!12526)))

(declare-fun lt!302400 () Unit!22194)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38567 (_ BitVec 64) (_ BitVec 32) List!12529) Unit!22194)

(assert (=> b!650723 (= lt!302400 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!302395 (select (arr!18488 a!2986) j!136) j!136 Nil!12526))))

(assert (=> b!650723 false))

(declare-fun b!650724 () Bool)

(declare-fun res!421841 () Bool)

(assert (=> b!650724 (=> (not res!421841) (not e!373333))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38567 (_ BitVec 32)) Bool)

(assert (=> b!650724 (= res!421841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!650725 () Bool)

(assert (=> b!650725 (= e!373329 e!373334)))

(declare-fun res!421840 () Bool)

(assert (=> b!650725 (=> res!421840 e!373334)))

(assert (=> b!650725 (= res!421840 (or (not (= (select (arr!18488 a!2986) j!136) lt!302401)) (not (= (select (arr!18488 a!2986) j!136) lt!302396)) (bvsge j!136 index!984)))))

(declare-fun b!650726 () Bool)

(assert (=> b!650726 (= e!373335 (= lt!302405 lt!302404))))

(assert (= (and start!58986 res!421849) b!650708))

(assert (= (and b!650708 res!421834) b!650709))

(assert (= (and b!650709 res!421832) b!650705))

(assert (= (and b!650705 res!421838) b!650716))

(assert (= (and b!650716 res!421839) b!650712))

(assert (= (and b!650712 res!421843) b!650724))

(assert (= (and b!650724 res!421841) b!650722))

(assert (= (and b!650722 res!421844) b!650715))

(assert (= (and b!650715 res!421842) b!650706))

(assert (= (and b!650706 res!421836) b!650718))

(assert (= (and b!650718 res!421837) b!650717))

(assert (= (and b!650717 res!421847) b!650726))

(assert (= (and b!650717 c!74804) b!650720))

(assert (= (and b!650717 (not c!74804)) b!650707))

(assert (= (and b!650717 (not res!421845)) b!650713))

(assert (= (and b!650713 res!421850) b!650725))

(assert (= (and b!650725 (not res!421840)) b!650721))

(assert (= (and b!650721 res!421848) b!650710))

(assert (= (and b!650713 (not res!421833)) b!650711))

(assert (= (and b!650711 c!74803) b!650723))

(assert (= (and b!650711 (not c!74803)) b!650704))

(assert (= (and b!650711 (not res!421846)) b!650714))

(assert (= (and b!650714 res!421835) b!650719))

(declare-fun m!623887 () Bool)

(assert (=> b!650725 m!623887))

(declare-fun m!623889 () Bool)

(assert (=> b!650717 m!623889))

(declare-fun m!623891 () Bool)

(assert (=> b!650717 m!623891))

(declare-fun m!623893 () Bool)

(assert (=> b!650717 m!623893))

(declare-fun m!623895 () Bool)

(assert (=> b!650717 m!623895))

(declare-fun m!623897 () Bool)

(assert (=> b!650717 m!623897))

(assert (=> b!650717 m!623887))

(declare-fun m!623899 () Bool)

(assert (=> b!650717 m!623899))

(declare-fun m!623901 () Bool)

(assert (=> b!650717 m!623901))

(assert (=> b!650717 m!623887))

(declare-fun m!623903 () Bool)

(assert (=> b!650712 m!623903))

(assert (=> b!650709 m!623887))

(assert (=> b!650709 m!623887))

(declare-fun m!623905 () Bool)

(assert (=> b!650709 m!623905))

(assert (=> b!650713 m!623887))

(assert (=> b!650713 m!623893))

(declare-fun m!623907 () Bool)

(assert (=> b!650713 m!623907))

(assert (=> b!650721 m!623887))

(assert (=> b!650721 m!623887))

(declare-fun m!623909 () Bool)

(assert (=> b!650721 m!623909))

(assert (=> b!650706 m!623893))

(declare-fun m!623911 () Bool)

(assert (=> b!650706 m!623911))

(assert (=> b!650719 m!623887))

(assert (=> b!650719 m!623887))

(declare-fun m!623913 () Bool)

(assert (=> b!650719 m!623913))

(assert (=> b!650710 m!623887))

(assert (=> b!650710 m!623887))

(assert (=> b!650710 m!623913))

(assert (=> b!650723 m!623887))

(declare-fun m!623915 () Bool)

(assert (=> b!650723 m!623915))

(assert (=> b!650723 m!623887))

(assert (=> b!650723 m!623887))

(declare-fun m!623917 () Bool)

(assert (=> b!650723 m!623917))

(declare-fun m!623919 () Bool)

(assert (=> b!650723 m!623919))

(declare-fun m!623921 () Bool)

(assert (=> b!650723 m!623921))

(declare-fun m!623923 () Bool)

(assert (=> b!650723 m!623923))

(assert (=> b!650723 m!623887))

(declare-fun m!623925 () Bool)

(assert (=> b!650723 m!623925))

(declare-fun m!623927 () Bool)

(assert (=> b!650723 m!623927))

(declare-fun m!623929 () Bool)

(assert (=> b!650718 m!623929))

(assert (=> b!650718 m!623887))

(assert (=> b!650718 m!623887))

(declare-fun m!623931 () Bool)

(assert (=> b!650718 m!623931))

(assert (=> b!650714 m!623887))

(assert (=> b!650714 m!623909))

(assert (=> b!650714 m!623887))

(assert (=> b!650714 m!623887))

(declare-fun m!623933 () Bool)

(assert (=> b!650714 m!623933))

(assert (=> b!650714 m!623921))

(assert (=> b!650714 m!623887))

(declare-fun m!623935 () Bool)

(assert (=> b!650714 m!623935))

(assert (=> b!650714 m!623923))

(declare-fun m!623937 () Bool)

(assert (=> b!650716 m!623937))

(declare-fun m!623939 () Bool)

(assert (=> b!650724 m!623939))

(declare-fun m!623941 () Bool)

(assert (=> b!650705 m!623941))

(declare-fun m!623943 () Bool)

(assert (=> b!650722 m!623943))

(declare-fun m!623945 () Bool)

(assert (=> b!650715 m!623945))

(declare-fun m!623947 () Bool)

(assert (=> start!58986 m!623947))

(declare-fun m!623949 () Bool)

(assert (=> start!58986 m!623949))

(push 1)

