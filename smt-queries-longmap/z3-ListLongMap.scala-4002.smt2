; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54384 () Bool)

(assert start!54384)

(declare-fun b!593670 () Bool)

(declare-fun res!379957 () Bool)

(declare-fun e!339117 () Bool)

(assert (=> b!593670 (=> (not res!379957) (not e!339117))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36933 0))(
  ( (array!36934 (arr!17731 (Array (_ BitVec 32) (_ BitVec 64))) (size!18095 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36933)

(assert (=> b!593670 (= res!379957 (and (= (size!18095 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18095 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18095 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!593671 () Bool)

(declare-fun res!379971 () Bool)

(declare-fun e!339116 () Bool)

(assert (=> b!593671 (=> (not res!379971) (not e!339116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36933 (_ BitVec 32)) Bool)

(assert (=> b!593671 (= res!379971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!593672 () Bool)

(declare-fun res!379968 () Bool)

(assert (=> b!593672 (=> (not res!379968) (not e!339116))))

(declare-datatypes ((List!11679 0))(
  ( (Nil!11676) (Cons!11675 (h!12723 (_ BitVec 64)) (t!17899 List!11679)) )
))
(declare-fun arrayNoDuplicates!0 (array!36933 (_ BitVec 32) List!11679) Bool)

(assert (=> b!593672 (= res!379968 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11676))))

(declare-fun b!593673 () Bool)

(declare-datatypes ((Unit!18601 0))(
  ( (Unit!18602) )
))
(declare-fun e!339120 () Unit!18601)

(declare-fun Unit!18603 () Unit!18601)

(assert (=> b!593673 (= e!339120 Unit!18603)))

(assert (=> b!593673 false))

(declare-fun b!593674 () Bool)

(declare-fun e!339118 () Bool)

(declare-fun e!339115 () Bool)

(assert (=> b!593674 (= e!339118 e!339115)))

(declare-fun res!379955 () Bool)

(assert (=> b!593674 (=> res!379955 e!339115)))

(declare-fun lt!269530 () (_ BitVec 64))

(declare-fun lt!269536 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!593674 (= res!379955 (or (not (= (select (arr!17731 a!2986) j!136) lt!269530)) (not (= (select (arr!17731 a!2986) j!136) lt!269536)) (bvsge j!136 index!984)))))

(declare-fun e!339114 () Bool)

(assert (=> b!593674 e!339114))

(declare-fun res!379972 () Bool)

(assert (=> b!593674 (=> (not res!379972) (not e!339114))))

(assert (=> b!593674 (= res!379972 (= lt!269536 (select (arr!17731 a!2986) j!136)))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!593674 (= lt!269536 (select (store (arr!17731 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!593675 () Bool)

(declare-fun res!379967 () Bool)

(assert (=> b!593675 (=> (not res!379967) (not e!339117))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!593675 (= res!379967 (validKeyInArray!0 k0!1786))))

(declare-fun b!593676 () Bool)

(declare-fun e!339113 () Bool)

(assert (=> b!593676 (= e!339115 e!339113)))

(declare-fun res!379961 () Bool)

(assert (=> b!593676 (=> res!379961 e!339113)))

(assert (=> b!593676 (= res!379961 (or (bvsgt #b00000000000000000000000000000000 (size!18095 a!2986)) (bvsge (size!18095 a!2986) #b01111111111111111111111111111111)))))

(declare-fun lt!269533 () array!36933)

(declare-fun arrayContainsKey!0 (array!36933 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!593676 (arrayContainsKey!0 lt!269533 (select (arr!17731 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269529 () Unit!18601)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36933 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18601)

(assert (=> b!593676 (= lt!269529 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269533 (select (arr!17731 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun res!379969 () Bool)

(assert (=> start!54384 (=> (not res!379969) (not e!339117))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54384 (= res!379969 (validMask!0 mask!3053))))

(assert (=> start!54384 e!339117))

(assert (=> start!54384 true))

(declare-fun array_inv!13590 (array!36933) Bool)

(assert (=> start!54384 (array_inv!13590 a!2986)))

(declare-fun b!593677 () Bool)

(declare-fun e!339112 () Bool)

(assert (=> b!593677 (= e!339112 (not e!339118))))

(declare-fun res!379966 () Bool)

(assert (=> b!593677 (=> res!379966 e!339118)))

(declare-datatypes ((SeekEntryResult!6127 0))(
  ( (MissingZero!6127 (index!26750 (_ BitVec 32))) (Found!6127 (index!26751 (_ BitVec 32))) (Intermediate!6127 (undefined!6939 Bool) (index!26752 (_ BitVec 32)) (x!55700 (_ BitVec 32))) (Undefined!6127) (MissingVacant!6127 (index!26753 (_ BitVec 32))) )
))
(declare-fun lt!269532 () SeekEntryResult!6127)

(assert (=> b!593677 (= res!379966 (not (= lt!269532 (Found!6127 index!984))))))

(declare-fun lt!269534 () Unit!18601)

(assert (=> b!593677 (= lt!269534 e!339120)))

(declare-fun c!67226 () Bool)

(assert (=> b!593677 (= c!67226 (= lt!269532 Undefined!6127))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36933 (_ BitVec 32)) SeekEntryResult!6127)

(assert (=> b!593677 (= lt!269532 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!269530 lt!269533 mask!3053))))

(declare-fun e!339108 () Bool)

(assert (=> b!593677 e!339108))

(declare-fun res!379963 () Bool)

(assert (=> b!593677 (=> (not res!379963) (not e!339108))))

(declare-fun lt!269526 () SeekEntryResult!6127)

(declare-fun lt!269528 () (_ BitVec 32))

(assert (=> b!593677 (= res!379963 (= lt!269526 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269528 vacantSpotIndex!68 lt!269530 lt!269533 mask!3053)))))

(assert (=> b!593677 (= lt!269526 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269528 vacantSpotIndex!68 (select (arr!17731 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!593677 (= lt!269530 (select (store (arr!17731 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!269531 () Unit!18601)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36933 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18601)

(assert (=> b!593677 (= lt!269531 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269528 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!593677 (= lt!269528 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!593678 () Bool)

(declare-fun e!339119 () Bool)

(declare-fun e!339110 () Bool)

(assert (=> b!593678 (= e!339119 e!339110)))

(declare-fun res!379959 () Bool)

(assert (=> b!593678 (=> (not res!379959) (not e!339110))))

(assert (=> b!593678 (= res!379959 (arrayContainsKey!0 lt!269533 (select (arr!17731 a!2986) j!136) j!136))))

(declare-fun b!593679 () Bool)

(declare-fun e!339109 () Bool)

(assert (=> b!593679 (= e!339116 e!339109)))

(declare-fun res!379970 () Bool)

(assert (=> b!593679 (=> (not res!379970) (not e!339109))))

(assert (=> b!593679 (= res!379970 (= (select (store (arr!17731 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!593679 (= lt!269533 (array!36934 (store (arr!17731 a!2986) i!1108 k0!1786) (size!18095 a!2986)))))

(declare-fun b!593680 () Bool)

(declare-fun lt!269527 () SeekEntryResult!6127)

(assert (=> b!593680 (= e!339108 (= lt!269527 lt!269526))))

(declare-fun b!593681 () Bool)

(declare-fun Unit!18604 () Unit!18601)

(assert (=> b!593681 (= e!339120 Unit!18604)))

(declare-fun b!593682 () Bool)

(assert (=> b!593682 (= e!339114 e!339119)))

(declare-fun res!379956 () Bool)

(assert (=> b!593682 (=> res!379956 e!339119)))

(assert (=> b!593682 (= res!379956 (or (not (= (select (arr!17731 a!2986) j!136) lt!269530)) (not (= (select (arr!17731 a!2986) j!136) lt!269536)) (bvsge j!136 index!984)))))

(declare-fun b!593683 () Bool)

(declare-fun res!379958 () Bool)

(assert (=> b!593683 (=> (not res!379958) (not e!339116))))

(assert (=> b!593683 (= res!379958 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17731 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!593684 () Bool)

(declare-fun res!379964 () Bool)

(assert (=> b!593684 (=> (not res!379964) (not e!339117))))

(assert (=> b!593684 (= res!379964 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!593685 () Bool)

(assert (=> b!593685 (= e!339110 (arrayContainsKey!0 lt!269533 (select (arr!17731 a!2986) j!136) index!984))))

(declare-fun b!593686 () Bool)

(assert (=> b!593686 (= e!339117 e!339116)))

(declare-fun res!379960 () Bool)

(assert (=> b!593686 (=> (not res!379960) (not e!339116))))

(declare-fun lt!269535 () SeekEntryResult!6127)

(assert (=> b!593686 (= res!379960 (or (= lt!269535 (MissingZero!6127 i!1108)) (= lt!269535 (MissingVacant!6127 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36933 (_ BitVec 32)) SeekEntryResult!6127)

(assert (=> b!593686 (= lt!269535 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!593687 () Bool)

(declare-fun noDuplicate!235 (List!11679) Bool)

(assert (=> b!593687 (= e!339113 (noDuplicate!235 Nil!11676))))

(declare-fun b!593688 () Bool)

(assert (=> b!593688 (= e!339109 e!339112)))

(declare-fun res!379965 () Bool)

(assert (=> b!593688 (=> (not res!379965) (not e!339112))))

(assert (=> b!593688 (= res!379965 (and (= lt!269527 (Found!6127 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17731 a!2986) index!984) (select (arr!17731 a!2986) j!136))) (not (= (select (arr!17731 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!593688 (= lt!269527 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17731 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!593689 () Bool)

(declare-fun res!379962 () Bool)

(assert (=> b!593689 (=> (not res!379962) (not e!339117))))

(assert (=> b!593689 (= res!379962 (validKeyInArray!0 (select (arr!17731 a!2986) j!136)))))

(assert (= (and start!54384 res!379969) b!593670))

(assert (= (and b!593670 res!379957) b!593689))

(assert (= (and b!593689 res!379962) b!593675))

(assert (= (and b!593675 res!379967) b!593684))

(assert (= (and b!593684 res!379964) b!593686))

(assert (= (and b!593686 res!379960) b!593671))

(assert (= (and b!593671 res!379971) b!593672))

(assert (= (and b!593672 res!379968) b!593683))

(assert (= (and b!593683 res!379958) b!593679))

(assert (= (and b!593679 res!379970) b!593688))

(assert (= (and b!593688 res!379965) b!593677))

(assert (= (and b!593677 res!379963) b!593680))

(assert (= (and b!593677 c!67226) b!593673))

(assert (= (and b!593677 (not c!67226)) b!593681))

(assert (= (and b!593677 (not res!379966)) b!593674))

(assert (= (and b!593674 res!379972) b!593682))

(assert (= (and b!593682 (not res!379956)) b!593678))

(assert (= (and b!593678 res!379959) b!593685))

(assert (= (and b!593674 (not res!379955)) b!593676))

(assert (= (and b!593676 (not res!379961)) b!593687))

(declare-fun m!571817 () Bool)

(assert (=> b!593689 m!571817))

(assert (=> b!593689 m!571817))

(declare-fun m!571819 () Bool)

(assert (=> b!593689 m!571819))

(assert (=> b!593678 m!571817))

(assert (=> b!593678 m!571817))

(declare-fun m!571821 () Bool)

(assert (=> b!593678 m!571821))

(declare-fun m!571823 () Bool)

(assert (=> b!593675 m!571823))

(assert (=> b!593685 m!571817))

(assert (=> b!593685 m!571817))

(declare-fun m!571825 () Bool)

(assert (=> b!593685 m!571825))

(declare-fun m!571827 () Bool)

(assert (=> b!593671 m!571827))

(declare-fun m!571829 () Bool)

(assert (=> b!593688 m!571829))

(assert (=> b!593688 m!571817))

(assert (=> b!593688 m!571817))

(declare-fun m!571831 () Bool)

(assert (=> b!593688 m!571831))

(assert (=> b!593676 m!571817))

(assert (=> b!593676 m!571817))

(declare-fun m!571833 () Bool)

(assert (=> b!593676 m!571833))

(assert (=> b!593676 m!571817))

(declare-fun m!571835 () Bool)

(assert (=> b!593676 m!571835))

(declare-fun m!571837 () Bool)

(assert (=> b!593672 m!571837))

(declare-fun m!571839 () Bool)

(assert (=> b!593686 m!571839))

(declare-fun m!571841 () Bool)

(assert (=> b!593683 m!571841))

(declare-fun m!571843 () Bool)

(assert (=> b!593687 m!571843))

(declare-fun m!571845 () Bool)

(assert (=> b!593679 m!571845))

(declare-fun m!571847 () Bool)

(assert (=> b!593679 m!571847))

(declare-fun m!571849 () Bool)

(assert (=> b!593684 m!571849))

(assert (=> b!593682 m!571817))

(declare-fun m!571851 () Bool)

(assert (=> start!54384 m!571851))

(declare-fun m!571853 () Bool)

(assert (=> start!54384 m!571853))

(assert (=> b!593674 m!571817))

(assert (=> b!593674 m!571845))

(declare-fun m!571855 () Bool)

(assert (=> b!593674 m!571855))

(declare-fun m!571857 () Bool)

(assert (=> b!593677 m!571857))

(declare-fun m!571859 () Bool)

(assert (=> b!593677 m!571859))

(assert (=> b!593677 m!571817))

(declare-fun m!571861 () Bool)

(assert (=> b!593677 m!571861))

(assert (=> b!593677 m!571845))

(declare-fun m!571863 () Bool)

(assert (=> b!593677 m!571863))

(assert (=> b!593677 m!571817))

(declare-fun m!571865 () Bool)

(assert (=> b!593677 m!571865))

(declare-fun m!571867 () Bool)

(assert (=> b!593677 m!571867))

(check-sat (not b!593684) (not b!593687) (not b!593685) (not b!593678) (not b!593689) (not start!54384) (not b!593672) (not b!593671) (not b!593676) (not b!593677) (not b!593688) (not b!593686) (not b!593675))
(check-sat)
(get-model)

(declare-fun d!86559 () Bool)

(declare-fun res!380085 () Bool)

(declare-fun e!339203 () Bool)

(assert (=> d!86559 (=> res!380085 e!339203)))

(assert (=> d!86559 (= res!380085 (= (select (arr!17731 lt!269533) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17731 a!2986) j!136)))))

(assert (=> d!86559 (= (arrayContainsKey!0 lt!269533 (select (arr!17731 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!339203)))

(declare-fun b!593814 () Bool)

(declare-fun e!339204 () Bool)

(assert (=> b!593814 (= e!339203 e!339204)))

(declare-fun res!380086 () Bool)

(assert (=> b!593814 (=> (not res!380086) (not e!339204))))

(assert (=> b!593814 (= res!380086 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18095 lt!269533)))))

(declare-fun b!593815 () Bool)

(assert (=> b!593815 (= e!339204 (arrayContainsKey!0 lt!269533 (select (arr!17731 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86559 (not res!380085)) b!593814))

(assert (= (and b!593814 res!380086) b!593815))

(declare-fun m!571973 () Bool)

(assert (=> d!86559 m!571973))

(assert (=> b!593815 m!571817))

(declare-fun m!571975 () Bool)

(assert (=> b!593815 m!571975))

(assert (=> b!593676 d!86559))

(declare-fun d!86561 () Bool)

(assert (=> d!86561 (arrayContainsKey!0 lt!269533 (select (arr!17731 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269605 () Unit!18601)

(declare-fun choose!114 (array!36933 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18601)

(assert (=> d!86561 (= lt!269605 (choose!114 lt!269533 (select (arr!17731 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!86561 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!86561 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269533 (select (arr!17731 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!269605)))

(declare-fun bs!18329 () Bool)

(assert (= bs!18329 d!86561))

(assert (=> bs!18329 m!571817))

(assert (=> bs!18329 m!571833))

(assert (=> bs!18329 m!571817))

(declare-fun m!571977 () Bool)

(assert (=> bs!18329 m!571977))

(assert (=> b!593676 d!86561))

(declare-fun d!86563 () Bool)

(declare-fun res!380091 () Bool)

(declare-fun e!339209 () Bool)

(assert (=> d!86563 (=> res!380091 e!339209)))

(get-info :version)

(assert (=> d!86563 (= res!380091 ((_ is Nil!11676) Nil!11676))))

(assert (=> d!86563 (= (noDuplicate!235 Nil!11676) e!339209)))

(declare-fun b!593820 () Bool)

(declare-fun e!339210 () Bool)

(assert (=> b!593820 (= e!339209 e!339210)))

(declare-fun res!380092 () Bool)

(assert (=> b!593820 (=> (not res!380092) (not e!339210))))

(declare-fun contains!2889 (List!11679 (_ BitVec 64)) Bool)

(assert (=> b!593820 (= res!380092 (not (contains!2889 (t!17899 Nil!11676) (h!12723 Nil!11676))))))

(declare-fun b!593821 () Bool)

(assert (=> b!593821 (= e!339210 (noDuplicate!235 (t!17899 Nil!11676)))))

(assert (= (and d!86563 (not res!380091)) b!593820))

(assert (= (and b!593820 res!380092) b!593821))

(declare-fun m!571979 () Bool)

(assert (=> b!593820 m!571979))

(declare-fun m!571981 () Bool)

(assert (=> b!593821 m!571981))

(assert (=> b!593687 d!86563))

(declare-fun d!86565 () Bool)

(declare-fun lt!269610 () SeekEntryResult!6127)

(assert (=> d!86565 (and (or ((_ is Undefined!6127) lt!269610) (not ((_ is Found!6127) lt!269610)) (and (bvsge (index!26751 lt!269610) #b00000000000000000000000000000000) (bvslt (index!26751 lt!269610) (size!18095 lt!269533)))) (or ((_ is Undefined!6127) lt!269610) ((_ is Found!6127) lt!269610) (not ((_ is MissingVacant!6127) lt!269610)) (not (= (index!26753 lt!269610) vacantSpotIndex!68)) (and (bvsge (index!26753 lt!269610) #b00000000000000000000000000000000) (bvslt (index!26753 lt!269610) (size!18095 lt!269533)))) (or ((_ is Undefined!6127) lt!269610) (ite ((_ is Found!6127) lt!269610) (= (select (arr!17731 lt!269533) (index!26751 lt!269610)) lt!269530) (and ((_ is MissingVacant!6127) lt!269610) (= (index!26753 lt!269610) vacantSpotIndex!68) (= (select (arr!17731 lt!269533) (index!26753 lt!269610)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!339217 () SeekEntryResult!6127)

(assert (=> d!86565 (= lt!269610 e!339217)))

(declare-fun c!67239 () Bool)

(assert (=> d!86565 (= c!67239 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!269611 () (_ BitVec 64))

(assert (=> d!86565 (= lt!269611 (select (arr!17731 lt!269533) index!984))))

(assert (=> d!86565 (validMask!0 mask!3053)))

(assert (=> d!86565 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!269530 lt!269533 mask!3053) lt!269610)))

(declare-fun b!593834 () Bool)

(declare-fun e!339218 () SeekEntryResult!6127)

(assert (=> b!593834 (= e!339217 e!339218)))

(declare-fun c!67241 () Bool)

(assert (=> b!593834 (= c!67241 (= lt!269611 lt!269530))))

(declare-fun b!593835 () Bool)

(assert (=> b!593835 (= e!339218 (Found!6127 index!984))))

(declare-fun e!339219 () SeekEntryResult!6127)

(declare-fun b!593836 () Bool)

(assert (=> b!593836 (= e!339219 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!269530 lt!269533 mask!3053))))

(declare-fun b!593837 () Bool)

(declare-fun c!67240 () Bool)

(assert (=> b!593837 (= c!67240 (= lt!269611 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!593837 (= e!339218 e!339219)))

(declare-fun b!593838 () Bool)

(assert (=> b!593838 (= e!339219 (MissingVacant!6127 vacantSpotIndex!68))))

(declare-fun b!593839 () Bool)

(assert (=> b!593839 (= e!339217 Undefined!6127)))

(assert (= (and d!86565 c!67239) b!593839))

(assert (= (and d!86565 (not c!67239)) b!593834))

(assert (= (and b!593834 c!67241) b!593835))

(assert (= (and b!593834 (not c!67241)) b!593837))

(assert (= (and b!593837 c!67240) b!593838))

(assert (= (and b!593837 (not c!67240)) b!593836))

(declare-fun m!571983 () Bool)

(assert (=> d!86565 m!571983))

(declare-fun m!571985 () Bool)

(assert (=> d!86565 m!571985))

(declare-fun m!571987 () Bool)

(assert (=> d!86565 m!571987))

(assert (=> d!86565 m!571851))

(declare-fun m!571989 () Bool)

(assert (=> b!593836 m!571989))

(assert (=> b!593836 m!571989))

(declare-fun m!571991 () Bool)

(assert (=> b!593836 m!571991))

(assert (=> b!593677 d!86565))

(declare-fun d!86567 () Bool)

(declare-fun lt!269612 () SeekEntryResult!6127)

(assert (=> d!86567 (and (or ((_ is Undefined!6127) lt!269612) (not ((_ is Found!6127) lt!269612)) (and (bvsge (index!26751 lt!269612) #b00000000000000000000000000000000) (bvslt (index!26751 lt!269612) (size!18095 a!2986)))) (or ((_ is Undefined!6127) lt!269612) ((_ is Found!6127) lt!269612) (not ((_ is MissingVacant!6127) lt!269612)) (not (= (index!26753 lt!269612) vacantSpotIndex!68)) (and (bvsge (index!26753 lt!269612) #b00000000000000000000000000000000) (bvslt (index!26753 lt!269612) (size!18095 a!2986)))) (or ((_ is Undefined!6127) lt!269612) (ite ((_ is Found!6127) lt!269612) (= (select (arr!17731 a!2986) (index!26751 lt!269612)) (select (arr!17731 a!2986) j!136)) (and ((_ is MissingVacant!6127) lt!269612) (= (index!26753 lt!269612) vacantSpotIndex!68) (= (select (arr!17731 a!2986) (index!26753 lt!269612)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!339220 () SeekEntryResult!6127)

(assert (=> d!86567 (= lt!269612 e!339220)))

(declare-fun c!67242 () Bool)

(assert (=> d!86567 (= c!67242 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!269613 () (_ BitVec 64))

(assert (=> d!86567 (= lt!269613 (select (arr!17731 a!2986) lt!269528))))

(assert (=> d!86567 (validMask!0 mask!3053)))

(assert (=> d!86567 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269528 vacantSpotIndex!68 (select (arr!17731 a!2986) j!136) a!2986 mask!3053) lt!269612)))

(declare-fun b!593840 () Bool)

(declare-fun e!339221 () SeekEntryResult!6127)

(assert (=> b!593840 (= e!339220 e!339221)))

(declare-fun c!67244 () Bool)

(assert (=> b!593840 (= c!67244 (= lt!269613 (select (arr!17731 a!2986) j!136)))))

(declare-fun b!593841 () Bool)

(assert (=> b!593841 (= e!339221 (Found!6127 lt!269528))))

(declare-fun b!593842 () Bool)

(declare-fun e!339222 () SeekEntryResult!6127)

(assert (=> b!593842 (= e!339222 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!269528 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!17731 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!593843 () Bool)

(declare-fun c!67243 () Bool)

(assert (=> b!593843 (= c!67243 (= lt!269613 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!593843 (= e!339221 e!339222)))

(declare-fun b!593844 () Bool)

(assert (=> b!593844 (= e!339222 (MissingVacant!6127 vacantSpotIndex!68))))

(declare-fun b!593845 () Bool)

(assert (=> b!593845 (= e!339220 Undefined!6127)))

(assert (= (and d!86567 c!67242) b!593845))

(assert (= (and d!86567 (not c!67242)) b!593840))

(assert (= (and b!593840 c!67244) b!593841))

(assert (= (and b!593840 (not c!67244)) b!593843))

(assert (= (and b!593843 c!67243) b!593844))

(assert (= (and b!593843 (not c!67243)) b!593842))

(declare-fun m!571993 () Bool)

(assert (=> d!86567 m!571993))

(declare-fun m!571995 () Bool)

(assert (=> d!86567 m!571995))

(declare-fun m!571997 () Bool)

(assert (=> d!86567 m!571997))

(assert (=> d!86567 m!571851))

(declare-fun m!571999 () Bool)

(assert (=> b!593842 m!571999))

(assert (=> b!593842 m!571999))

(assert (=> b!593842 m!571817))

(declare-fun m!572001 () Bool)

(assert (=> b!593842 m!572001))

(assert (=> b!593677 d!86567))

(declare-fun lt!269614 () SeekEntryResult!6127)

(declare-fun d!86569 () Bool)

(assert (=> d!86569 (and (or ((_ is Undefined!6127) lt!269614) (not ((_ is Found!6127) lt!269614)) (and (bvsge (index!26751 lt!269614) #b00000000000000000000000000000000) (bvslt (index!26751 lt!269614) (size!18095 lt!269533)))) (or ((_ is Undefined!6127) lt!269614) ((_ is Found!6127) lt!269614) (not ((_ is MissingVacant!6127) lt!269614)) (not (= (index!26753 lt!269614) vacantSpotIndex!68)) (and (bvsge (index!26753 lt!269614) #b00000000000000000000000000000000) (bvslt (index!26753 lt!269614) (size!18095 lt!269533)))) (or ((_ is Undefined!6127) lt!269614) (ite ((_ is Found!6127) lt!269614) (= (select (arr!17731 lt!269533) (index!26751 lt!269614)) lt!269530) (and ((_ is MissingVacant!6127) lt!269614) (= (index!26753 lt!269614) vacantSpotIndex!68) (= (select (arr!17731 lt!269533) (index!26753 lt!269614)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!339223 () SeekEntryResult!6127)

(assert (=> d!86569 (= lt!269614 e!339223)))

(declare-fun c!67245 () Bool)

(assert (=> d!86569 (= c!67245 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!269615 () (_ BitVec 64))

(assert (=> d!86569 (= lt!269615 (select (arr!17731 lt!269533) lt!269528))))

(assert (=> d!86569 (validMask!0 mask!3053)))

(assert (=> d!86569 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269528 vacantSpotIndex!68 lt!269530 lt!269533 mask!3053) lt!269614)))

(declare-fun b!593846 () Bool)

(declare-fun e!339224 () SeekEntryResult!6127)

(assert (=> b!593846 (= e!339223 e!339224)))

(declare-fun c!67247 () Bool)

(assert (=> b!593846 (= c!67247 (= lt!269615 lt!269530))))

(declare-fun b!593847 () Bool)

(assert (=> b!593847 (= e!339224 (Found!6127 lt!269528))))

(declare-fun b!593848 () Bool)

(declare-fun e!339225 () SeekEntryResult!6127)

(assert (=> b!593848 (= e!339225 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!269528 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!269530 lt!269533 mask!3053))))

(declare-fun b!593849 () Bool)

(declare-fun c!67246 () Bool)

(assert (=> b!593849 (= c!67246 (= lt!269615 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!593849 (= e!339224 e!339225)))

(declare-fun b!593850 () Bool)

(assert (=> b!593850 (= e!339225 (MissingVacant!6127 vacantSpotIndex!68))))

(declare-fun b!593851 () Bool)

(assert (=> b!593851 (= e!339223 Undefined!6127)))

(assert (= (and d!86569 c!67245) b!593851))

(assert (= (and d!86569 (not c!67245)) b!593846))

(assert (= (and b!593846 c!67247) b!593847))

(assert (= (and b!593846 (not c!67247)) b!593849))

(assert (= (and b!593849 c!67246) b!593850))

(assert (= (and b!593849 (not c!67246)) b!593848))

(declare-fun m!572003 () Bool)

(assert (=> d!86569 m!572003))

(declare-fun m!572005 () Bool)

(assert (=> d!86569 m!572005))

(declare-fun m!572007 () Bool)

(assert (=> d!86569 m!572007))

(assert (=> d!86569 m!571851))

(assert (=> b!593848 m!571999))

(assert (=> b!593848 m!571999))

(declare-fun m!572009 () Bool)

(assert (=> b!593848 m!572009))

(assert (=> b!593677 d!86569))

(declare-fun d!86573 () Bool)

(declare-fun lt!269618 () (_ BitVec 32))

(assert (=> d!86573 (and (bvsge lt!269618 #b00000000000000000000000000000000) (bvslt lt!269618 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86573 (= lt!269618 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!86573 (validMask!0 mask!3053)))

(assert (=> d!86573 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!269618)))

(declare-fun bs!18330 () Bool)

(assert (= bs!18330 d!86573))

(declare-fun m!572011 () Bool)

(assert (=> bs!18330 m!572011))

(assert (=> bs!18330 m!571851))

(assert (=> b!593677 d!86573))

(declare-fun d!86575 () Bool)

(declare-fun e!339243 () Bool)

(assert (=> d!86575 e!339243))

(declare-fun res!380101 () Bool)

(assert (=> d!86575 (=> (not res!380101) (not e!339243))))

(assert (=> d!86575 (= res!380101 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18095 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18095 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18095 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18095 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18095 a!2986))))))

(declare-fun lt!269630 () Unit!18601)

(declare-fun choose!9 (array!36933 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18601)

(assert (=> d!86575 (= lt!269630 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269528 vacantSpotIndex!68 mask!3053))))

(assert (=> d!86575 (validMask!0 mask!3053)))

(assert (=> d!86575 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269528 vacantSpotIndex!68 mask!3053) lt!269630)))

(declare-fun b!593878 () Bool)

(assert (=> b!593878 (= e!339243 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269528 vacantSpotIndex!68 (select (arr!17731 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269528 vacantSpotIndex!68 (select (store (arr!17731 a!2986) i!1108 k0!1786) j!136) (array!36934 (store (arr!17731 a!2986) i!1108 k0!1786) (size!18095 a!2986)) mask!3053)))))

(assert (= (and d!86575 res!380101) b!593878))

(declare-fun m!572031 () Bool)

(assert (=> d!86575 m!572031))

(assert (=> d!86575 m!571851))

(assert (=> b!593878 m!571867))

(declare-fun m!572033 () Bool)

(assert (=> b!593878 m!572033))

(assert (=> b!593878 m!571817))

(assert (=> b!593878 m!571865))

(assert (=> b!593878 m!571817))

(assert (=> b!593878 m!571845))

(assert (=> b!593878 m!571867))

(assert (=> b!593677 d!86575))

(declare-fun lt!269631 () SeekEntryResult!6127)

(declare-fun d!86583 () Bool)

(assert (=> d!86583 (and (or ((_ is Undefined!6127) lt!269631) (not ((_ is Found!6127) lt!269631)) (and (bvsge (index!26751 lt!269631) #b00000000000000000000000000000000) (bvslt (index!26751 lt!269631) (size!18095 a!2986)))) (or ((_ is Undefined!6127) lt!269631) ((_ is Found!6127) lt!269631) (not ((_ is MissingVacant!6127) lt!269631)) (not (= (index!26753 lt!269631) vacantSpotIndex!68)) (and (bvsge (index!26753 lt!269631) #b00000000000000000000000000000000) (bvslt (index!26753 lt!269631) (size!18095 a!2986)))) (or ((_ is Undefined!6127) lt!269631) (ite ((_ is Found!6127) lt!269631) (= (select (arr!17731 a!2986) (index!26751 lt!269631)) (select (arr!17731 a!2986) j!136)) (and ((_ is MissingVacant!6127) lt!269631) (= (index!26753 lt!269631) vacantSpotIndex!68) (= (select (arr!17731 a!2986) (index!26753 lt!269631)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!339244 () SeekEntryResult!6127)

(assert (=> d!86583 (= lt!269631 e!339244)))

(declare-fun c!67257 () Bool)

(assert (=> d!86583 (= c!67257 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!269632 () (_ BitVec 64))

(assert (=> d!86583 (= lt!269632 (select (arr!17731 a!2986) index!984))))

(assert (=> d!86583 (validMask!0 mask!3053)))

(assert (=> d!86583 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17731 a!2986) j!136) a!2986 mask!3053) lt!269631)))

(declare-fun b!593879 () Bool)

(declare-fun e!339245 () SeekEntryResult!6127)

(assert (=> b!593879 (= e!339244 e!339245)))

(declare-fun c!67259 () Bool)

(assert (=> b!593879 (= c!67259 (= lt!269632 (select (arr!17731 a!2986) j!136)))))

(declare-fun b!593880 () Bool)

(assert (=> b!593880 (= e!339245 (Found!6127 index!984))))

(declare-fun e!339246 () SeekEntryResult!6127)

(declare-fun b!593881 () Bool)

(assert (=> b!593881 (= e!339246 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!17731 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!593882 () Bool)

(declare-fun c!67258 () Bool)

(assert (=> b!593882 (= c!67258 (= lt!269632 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!593882 (= e!339245 e!339246)))

(declare-fun b!593883 () Bool)

(assert (=> b!593883 (= e!339246 (MissingVacant!6127 vacantSpotIndex!68))))

(declare-fun b!593884 () Bool)

(assert (=> b!593884 (= e!339244 Undefined!6127)))

(assert (= (and d!86583 c!67257) b!593884))

(assert (= (and d!86583 (not c!67257)) b!593879))

(assert (= (and b!593879 c!67259) b!593880))

(assert (= (and b!593879 (not c!67259)) b!593882))

(assert (= (and b!593882 c!67258) b!593883))

(assert (= (and b!593882 (not c!67258)) b!593881))

(declare-fun m!572035 () Bool)

(assert (=> d!86583 m!572035))

(declare-fun m!572037 () Bool)

(assert (=> d!86583 m!572037))

(assert (=> d!86583 m!571829))

(assert (=> d!86583 m!571851))

(assert (=> b!593881 m!571989))

(assert (=> b!593881 m!571989))

(assert (=> b!593881 m!571817))

(declare-fun m!572039 () Bool)

(assert (=> b!593881 m!572039))

(assert (=> b!593688 d!86583))

(declare-fun d!86585 () Bool)

(declare-fun res!380102 () Bool)

(declare-fun e!339247 () Bool)

(assert (=> d!86585 (=> res!380102 e!339247)))

(assert (=> d!86585 (= res!380102 (= (select (arr!17731 lt!269533) j!136) (select (arr!17731 a!2986) j!136)))))

(assert (=> d!86585 (= (arrayContainsKey!0 lt!269533 (select (arr!17731 a!2986) j!136) j!136) e!339247)))

(declare-fun b!593885 () Bool)

(declare-fun e!339248 () Bool)

(assert (=> b!593885 (= e!339247 e!339248)))

(declare-fun res!380103 () Bool)

(assert (=> b!593885 (=> (not res!380103) (not e!339248))))

(assert (=> b!593885 (= res!380103 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18095 lt!269533)))))

(declare-fun b!593886 () Bool)

(assert (=> b!593886 (= e!339248 (arrayContainsKey!0 lt!269533 (select (arr!17731 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86585 (not res!380102)) b!593885))

(assert (= (and b!593885 res!380103) b!593886))

(declare-fun m!572041 () Bool)

(assert (=> d!86585 m!572041))

(assert (=> b!593886 m!571817))

(declare-fun m!572043 () Bool)

(assert (=> b!593886 m!572043))

(assert (=> b!593678 d!86585))

(declare-fun d!86587 () Bool)

(assert (=> d!86587 (= (validKeyInArray!0 (select (arr!17731 a!2986) j!136)) (and (not (= (select (arr!17731 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17731 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!593689 d!86587))

(declare-fun d!86589 () Bool)

(assert (=> d!86589 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!54384 d!86589))

(declare-fun d!86607 () Bool)

(assert (=> d!86607 (= (array_inv!13590 a!2986) (bvsge (size!18095 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!54384 d!86607))

(declare-fun b!593931 () Bool)

(declare-fun e!339281 () Bool)

(declare-fun call!32876 () Bool)

(assert (=> b!593931 (= e!339281 call!32876)))

(declare-fun d!86609 () Bool)

(declare-fun res!380122 () Bool)

(declare-fun e!339282 () Bool)

(assert (=> d!86609 (=> res!380122 e!339282)))

(assert (=> d!86609 (= res!380122 (bvsge #b00000000000000000000000000000000 (size!18095 a!2986)))))

(assert (=> d!86609 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!339282)))

(declare-fun bm!32873 () Bool)

(assert (=> bm!32873 (= call!32876 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!593932 () Bool)

(declare-fun e!339280 () Bool)

(assert (=> b!593932 (= e!339280 call!32876)))

(declare-fun b!593933 () Bool)

(assert (=> b!593933 (= e!339280 e!339281)))

(declare-fun lt!269657 () (_ BitVec 64))

(assert (=> b!593933 (= lt!269657 (select (arr!17731 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!269659 () Unit!18601)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!36933 (_ BitVec 64) (_ BitVec 32)) Unit!18601)

(assert (=> b!593933 (= lt!269659 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!269657 #b00000000000000000000000000000000))))

(assert (=> b!593933 (arrayContainsKey!0 a!2986 lt!269657 #b00000000000000000000000000000000)))

(declare-fun lt!269658 () Unit!18601)

(assert (=> b!593933 (= lt!269658 lt!269659)))

(declare-fun res!380123 () Bool)

(assert (=> b!593933 (= res!380123 (= (seekEntryOrOpen!0 (select (arr!17731 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6127 #b00000000000000000000000000000000)))))

(assert (=> b!593933 (=> (not res!380123) (not e!339281))))

(declare-fun b!593934 () Bool)

(assert (=> b!593934 (= e!339282 e!339280)))

(declare-fun c!67273 () Bool)

(assert (=> b!593934 (= c!67273 (validKeyInArray!0 (select (arr!17731 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!86609 (not res!380122)) b!593934))

(assert (= (and b!593934 c!67273) b!593933))

(assert (= (and b!593934 (not c!67273)) b!593932))

(assert (= (and b!593933 res!380123) b!593931))

(assert (= (or b!593931 b!593932) bm!32873))

(declare-fun m!572071 () Bool)

(assert (=> bm!32873 m!572071))

(declare-fun m!572073 () Bool)

(assert (=> b!593933 m!572073))

(declare-fun m!572075 () Bool)

(assert (=> b!593933 m!572075))

(declare-fun m!572077 () Bool)

(assert (=> b!593933 m!572077))

(assert (=> b!593933 m!572073))

(declare-fun m!572079 () Bool)

(assert (=> b!593933 m!572079))

(assert (=> b!593934 m!572073))

(assert (=> b!593934 m!572073))

(declare-fun m!572083 () Bool)

(assert (=> b!593934 m!572083))

(assert (=> b!593671 d!86609))

(declare-fun b!593955 () Bool)

(declare-fun e!339300 () Bool)

(declare-fun e!339299 () Bool)

(assert (=> b!593955 (= e!339300 e!339299)))

(declare-fun res!380132 () Bool)

(assert (=> b!593955 (=> (not res!380132) (not e!339299))))

(declare-fun e!339298 () Bool)

(assert (=> b!593955 (= res!380132 (not e!339298))))

(declare-fun res!380134 () Bool)

(assert (=> b!593955 (=> (not res!380134) (not e!339298))))

(assert (=> b!593955 (= res!380134 (validKeyInArray!0 (select (arr!17731 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!593956 () Bool)

(declare-fun e!339297 () Bool)

(assert (=> b!593956 (= e!339299 e!339297)))

(declare-fun c!67280 () Bool)

(assert (=> b!593956 (= c!67280 (validKeyInArray!0 (select (arr!17731 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!32877 () Bool)

(declare-fun call!32880 () Bool)

(assert (=> bm!32877 (= call!32880 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67280 (Cons!11675 (select (arr!17731 a!2986) #b00000000000000000000000000000000) Nil!11676) Nil!11676)))))

(declare-fun b!593957 () Bool)

(assert (=> b!593957 (= e!339297 call!32880)))

(declare-fun b!593958 () Bool)

(assert (=> b!593958 (= e!339297 call!32880)))

(declare-fun d!86615 () Bool)

(declare-fun res!380133 () Bool)

(assert (=> d!86615 (=> res!380133 e!339300)))

(assert (=> d!86615 (= res!380133 (bvsge #b00000000000000000000000000000000 (size!18095 a!2986)))))

(assert (=> d!86615 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11676) e!339300)))

(declare-fun b!593959 () Bool)

(assert (=> b!593959 (= e!339298 (contains!2889 Nil!11676 (select (arr!17731 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!86615 (not res!380133)) b!593955))

(assert (= (and b!593955 res!380134) b!593959))

(assert (= (and b!593955 res!380132) b!593956))

(assert (= (and b!593956 c!67280) b!593958))

(assert (= (and b!593956 (not c!67280)) b!593957))

(assert (= (or b!593958 b!593957) bm!32877))

(assert (=> b!593955 m!572073))

(assert (=> b!593955 m!572073))

(assert (=> b!593955 m!572083))

(assert (=> b!593956 m!572073))

(assert (=> b!593956 m!572073))

(assert (=> b!593956 m!572083))

(assert (=> bm!32877 m!572073))

(declare-fun m!572105 () Bool)

(assert (=> bm!32877 m!572105))

(assert (=> b!593959 m!572073))

(assert (=> b!593959 m!572073))

(declare-fun m!572107 () Bool)

(assert (=> b!593959 m!572107))

(assert (=> b!593672 d!86615))

(declare-fun d!86621 () Bool)

(declare-fun res!380135 () Bool)

(declare-fun e!339301 () Bool)

(assert (=> d!86621 (=> res!380135 e!339301)))

(assert (=> d!86621 (= res!380135 (= (select (arr!17731 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!86621 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!339301)))

(declare-fun b!593960 () Bool)

(declare-fun e!339302 () Bool)

(assert (=> b!593960 (= e!339301 e!339302)))

(declare-fun res!380136 () Bool)

(assert (=> b!593960 (=> (not res!380136) (not e!339302))))

(assert (=> b!593960 (= res!380136 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18095 a!2986)))))

(declare-fun b!593961 () Bool)

(assert (=> b!593961 (= e!339302 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!86621 (not res!380135)) b!593960))

(assert (= (and b!593960 res!380136) b!593961))

(assert (=> d!86621 m!572073))

(declare-fun m!572109 () Bool)

(assert (=> b!593961 m!572109))

(assert (=> b!593684 d!86621))

(declare-fun d!86623 () Bool)

(declare-fun res!380137 () Bool)

(declare-fun e!339303 () Bool)

(assert (=> d!86623 (=> res!380137 e!339303)))

(assert (=> d!86623 (= res!380137 (= (select (arr!17731 lt!269533) index!984) (select (arr!17731 a!2986) j!136)))))

(assert (=> d!86623 (= (arrayContainsKey!0 lt!269533 (select (arr!17731 a!2986) j!136) index!984) e!339303)))

(declare-fun b!593962 () Bool)

(declare-fun e!339304 () Bool)

(assert (=> b!593962 (= e!339303 e!339304)))

(declare-fun res!380138 () Bool)

(assert (=> b!593962 (=> (not res!380138) (not e!339304))))

(assert (=> b!593962 (= res!380138 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18095 lt!269533)))))

(declare-fun b!593963 () Bool)

(assert (=> b!593963 (= e!339304 (arrayContainsKey!0 lt!269533 (select (arr!17731 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!86623 (not res!380137)) b!593962))

(assert (= (and b!593962 res!380138) b!593963))

(assert (=> d!86623 m!571987))

(assert (=> b!593963 m!571817))

(declare-fun m!572111 () Bool)

(assert (=> b!593963 m!572111))

(assert (=> b!593685 d!86623))

(declare-fun d!86625 () Bool)

(assert (=> d!86625 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!593675 d!86625))

(declare-fun lt!269689 () SeekEntryResult!6127)

(declare-fun b!594038 () Bool)

(declare-fun e!339353 () SeekEntryResult!6127)

(assert (=> b!594038 (= e!339353 (seekKeyOrZeroReturnVacant!0 (x!55700 lt!269689) (index!26752 lt!269689) (index!26752 lt!269689) k0!1786 a!2986 mask!3053))))

(declare-fun d!86627 () Bool)

(declare-fun lt!269690 () SeekEntryResult!6127)

(assert (=> d!86627 (and (or ((_ is Undefined!6127) lt!269690) (not ((_ is Found!6127) lt!269690)) (and (bvsge (index!26751 lt!269690) #b00000000000000000000000000000000) (bvslt (index!26751 lt!269690) (size!18095 a!2986)))) (or ((_ is Undefined!6127) lt!269690) ((_ is Found!6127) lt!269690) (not ((_ is MissingZero!6127) lt!269690)) (and (bvsge (index!26750 lt!269690) #b00000000000000000000000000000000) (bvslt (index!26750 lt!269690) (size!18095 a!2986)))) (or ((_ is Undefined!6127) lt!269690) ((_ is Found!6127) lt!269690) ((_ is MissingZero!6127) lt!269690) (not ((_ is MissingVacant!6127) lt!269690)) (and (bvsge (index!26753 lt!269690) #b00000000000000000000000000000000) (bvslt (index!26753 lt!269690) (size!18095 a!2986)))) (or ((_ is Undefined!6127) lt!269690) (ite ((_ is Found!6127) lt!269690) (= (select (arr!17731 a!2986) (index!26751 lt!269690)) k0!1786) (ite ((_ is MissingZero!6127) lt!269690) (= (select (arr!17731 a!2986) (index!26750 lt!269690)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6127) lt!269690) (= (select (arr!17731 a!2986) (index!26753 lt!269690)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!339354 () SeekEntryResult!6127)

(assert (=> d!86627 (= lt!269690 e!339354)))

(declare-fun c!67310 () Bool)

(assert (=> d!86627 (= c!67310 (and ((_ is Intermediate!6127) lt!269689) (undefined!6939 lt!269689)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36933 (_ BitVec 32)) SeekEntryResult!6127)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86627 (= lt!269689 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!86627 (validMask!0 mask!3053)))

(assert (=> d!86627 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!269690)))

(declare-fun b!594039 () Bool)

(declare-fun c!67308 () Bool)

(declare-fun lt!269691 () (_ BitVec 64))

(assert (=> b!594039 (= c!67308 (= lt!269691 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!339352 () SeekEntryResult!6127)

(assert (=> b!594039 (= e!339352 e!339353)))

(declare-fun b!594040 () Bool)

(assert (=> b!594040 (= e!339352 (Found!6127 (index!26752 lt!269689)))))

(declare-fun b!594041 () Bool)

(assert (=> b!594041 (= e!339353 (MissingZero!6127 (index!26752 lt!269689)))))

(declare-fun b!594042 () Bool)

(assert (=> b!594042 (= e!339354 Undefined!6127)))

(declare-fun b!594043 () Bool)

(assert (=> b!594043 (= e!339354 e!339352)))

(assert (=> b!594043 (= lt!269691 (select (arr!17731 a!2986) (index!26752 lt!269689)))))

(declare-fun c!67309 () Bool)

(assert (=> b!594043 (= c!67309 (= lt!269691 k0!1786))))

(assert (= (and d!86627 c!67310) b!594042))

(assert (= (and d!86627 (not c!67310)) b!594043))

(assert (= (and b!594043 c!67309) b!594040))

(assert (= (and b!594043 (not c!67309)) b!594039))

(assert (= (and b!594039 c!67308) b!594041))

(assert (= (and b!594039 (not c!67308)) b!594038))

(declare-fun m!572163 () Bool)

(assert (=> b!594038 m!572163))

(declare-fun m!572165 () Bool)

(assert (=> d!86627 m!572165))

(declare-fun m!572167 () Bool)

(assert (=> d!86627 m!572167))

(assert (=> d!86627 m!571851))

(declare-fun m!572169 () Bool)

(assert (=> d!86627 m!572169))

(declare-fun m!572171 () Bool)

(assert (=> d!86627 m!572171))

(declare-fun m!572173 () Bool)

(assert (=> d!86627 m!572173))

(assert (=> d!86627 m!572169))

(declare-fun m!572175 () Bool)

(assert (=> b!594043 m!572175))

(assert (=> b!593686 d!86627))

(check-sat (not b!593933) (not b!593961) (not d!86561) (not b!593821) (not b!593963) (not b!593959) (not d!86565) (not bm!32877) (not bm!32873) (not b!593881) (not d!86567) (not d!86575) (not d!86573) (not d!86583) (not b!593955) (not b!593848) (not b!593934) (not d!86627) (not b!593886) (not b!593956) (not b!593815) (not b!593842) (not b!593836) (not b!593820) (not b!593878) (not d!86569) (not b!594038))
(check-sat)
