; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54042 () Bool)

(assert start!54042)

(declare-fun b!590046 () Bool)

(declare-fun e!336847 () Bool)

(assert (=> b!590046 (= e!336847 true)))

(declare-fun e!336841 () Bool)

(assert (=> b!590046 e!336841))

(declare-fun res!377427 () Bool)

(assert (=> b!590046 (=> (not res!377427) (not e!336841))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36843 0))(
  ( (array!36844 (arr!17693 (Array (_ BitVec 32) (_ BitVec 64))) (size!18058 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36843)

(assert (=> b!590046 (= res!377427 (= (select (store (arr!17693 a!2986) i!1108 k0!1786) index!984) (select (arr!17693 a!2986) j!136)))))

(declare-fun b!590047 () Bool)

(declare-fun res!377438 () Bool)

(declare-fun e!336845 () Bool)

(assert (=> b!590047 (=> (not res!377438) (not e!336845))))

(declare-datatypes ((List!11773 0))(
  ( (Nil!11770) (Cons!11769 (h!12814 (_ BitVec 64)) (t!17992 List!11773)) )
))
(declare-fun arrayNoDuplicates!0 (array!36843 (_ BitVec 32) List!11773) Bool)

(assert (=> b!590047 (= res!377438 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11770))))

(declare-fun b!590048 () Bool)

(declare-fun res!377435 () Bool)

(declare-fun e!336844 () Bool)

(assert (=> b!590048 (=> (not res!377435) (not e!336844))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!590048 (= res!377435 (validKeyInArray!0 (select (arr!17693 a!2986) j!136)))))

(declare-fun b!590050 () Bool)

(declare-datatypes ((Unit!18432 0))(
  ( (Unit!18433) )
))
(declare-fun e!336846 () Unit!18432)

(declare-fun Unit!18434 () Unit!18432)

(assert (=> b!590050 (= e!336846 Unit!18434)))

(declare-fun b!590051 () Bool)

(declare-fun e!336849 () Bool)

(assert (=> b!590051 (= e!336845 e!336849)))

(declare-fun res!377434 () Bool)

(assert (=> b!590051 (=> (not res!377434) (not e!336849))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!590051 (= res!377434 (= (select (store (arr!17693 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!267570 () array!36843)

(assert (=> b!590051 (= lt!267570 (array!36844 (store (arr!17693 a!2986) i!1108 k0!1786) (size!18058 a!2986)))))

(declare-fun b!590052 () Bool)

(declare-fun res!377432 () Bool)

(assert (=> b!590052 (=> (not res!377432) (not e!336845))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36843 (_ BitVec 32)) Bool)

(assert (=> b!590052 (= res!377432 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!590053 () Bool)

(declare-fun Unit!18435 () Unit!18432)

(assert (=> b!590053 (= e!336846 Unit!18435)))

(assert (=> b!590053 false))

(declare-fun b!590054 () Bool)

(declare-fun res!377433 () Bool)

(assert (=> b!590054 (=> (not res!377433) (not e!336845))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!590054 (= res!377433 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17693 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!590055 () Bool)

(declare-fun res!377424 () Bool)

(assert (=> b!590055 (=> (not res!377424) (not e!336844))))

(assert (=> b!590055 (= res!377424 (validKeyInArray!0 k0!1786))))

(declare-fun b!590056 () Bool)

(declare-fun res!377425 () Bool)

(assert (=> b!590056 (=> (not res!377425) (not e!336844))))

(assert (=> b!590056 (= res!377425 (and (= (size!18058 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18058 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18058 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!590057 () Bool)

(declare-fun e!336848 () Bool)

(declare-datatypes ((SeekEntryResult!6130 0))(
  ( (MissingZero!6130 (index!26753 (_ BitVec 32))) (Found!6130 (index!26754 (_ BitVec 32))) (Intermediate!6130 (undefined!6942 Bool) (index!26755 (_ BitVec 32)) (x!55556 (_ BitVec 32))) (Undefined!6130) (MissingVacant!6130 (index!26756 (_ BitVec 32))) )
))
(declare-fun lt!267569 () SeekEntryResult!6130)

(declare-fun lt!267573 () SeekEntryResult!6130)

(assert (=> b!590057 (= e!336848 (= lt!267569 lt!267573))))

(declare-fun b!590058 () Bool)

(declare-fun e!336843 () Bool)

(assert (=> b!590058 (= e!336841 e!336843)))

(declare-fun res!377437 () Bool)

(assert (=> b!590058 (=> res!377437 e!336843)))

(declare-fun lt!267572 () (_ BitVec 64))

(assert (=> b!590058 (= res!377437 (or (not (= (select (arr!17693 a!2986) j!136) lt!267572)) (not (= (select (arr!17693 a!2986) j!136) (select (store (arr!17693 a!2986) i!1108 k0!1786) index!984))) (bvsge j!136 index!984)))))

(declare-fun b!590059 () Bool)

(declare-fun arrayContainsKey!0 (array!36843 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!590059 (= e!336843 (arrayContainsKey!0 lt!267570 (select (arr!17693 a!2986) j!136) j!136))))

(declare-fun b!590060 () Bool)

(assert (=> b!590060 (= e!336844 e!336845)))

(declare-fun res!377430 () Bool)

(assert (=> b!590060 (=> (not res!377430) (not e!336845))))

(declare-fun lt!267571 () SeekEntryResult!6130)

(assert (=> b!590060 (= res!377430 (or (= lt!267571 (MissingZero!6130 i!1108)) (= lt!267571 (MissingVacant!6130 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36843 (_ BitVec 32)) SeekEntryResult!6130)

(assert (=> b!590060 (= lt!267571 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!377428 () Bool)

(assert (=> start!54042 (=> (not res!377428) (not e!336844))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54042 (= res!377428 (validMask!0 mask!3053))))

(assert (=> start!54042 e!336844))

(assert (=> start!54042 true))

(declare-fun array_inv!13576 (array!36843) Bool)

(assert (=> start!54042 (array_inv!13576 a!2986)))

(declare-fun b!590049 () Bool)

(declare-fun res!377426 () Bool)

(assert (=> b!590049 (=> (not res!377426) (not e!336844))))

(assert (=> b!590049 (= res!377426 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!590061 () Bool)

(declare-fun e!336840 () Bool)

(assert (=> b!590061 (= e!336840 (not e!336847))))

(declare-fun res!377429 () Bool)

(assert (=> b!590061 (=> res!377429 e!336847)))

(declare-fun lt!267574 () SeekEntryResult!6130)

(assert (=> b!590061 (= res!377429 (not (= lt!267574 (Found!6130 index!984))))))

(declare-fun lt!267567 () Unit!18432)

(assert (=> b!590061 (= lt!267567 e!336846)))

(declare-fun c!66678 () Bool)

(assert (=> b!590061 (= c!66678 (= lt!267574 Undefined!6130))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36843 (_ BitVec 32)) SeekEntryResult!6130)

(assert (=> b!590061 (= lt!267574 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267572 lt!267570 mask!3053))))

(assert (=> b!590061 e!336848))

(declare-fun res!377436 () Bool)

(assert (=> b!590061 (=> (not res!377436) (not e!336848))))

(declare-fun lt!267566 () (_ BitVec 32))

(assert (=> b!590061 (= res!377436 (= lt!267573 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267566 vacantSpotIndex!68 lt!267572 lt!267570 mask!3053)))))

(assert (=> b!590061 (= lt!267573 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267566 vacantSpotIndex!68 (select (arr!17693 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!590061 (= lt!267572 (select (store (arr!17693 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!267568 () Unit!18432)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36843 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18432)

(assert (=> b!590061 (= lt!267568 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267566 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!590061 (= lt!267566 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!590062 () Bool)

(assert (=> b!590062 (= e!336849 e!336840)))

(declare-fun res!377431 () Bool)

(assert (=> b!590062 (=> (not res!377431) (not e!336840))))

(assert (=> b!590062 (= res!377431 (and (= lt!267569 (Found!6130 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17693 a!2986) index!984) (select (arr!17693 a!2986) j!136))) (not (= (select (arr!17693 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!590062 (= lt!267569 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17693 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!54042 res!377428) b!590056))

(assert (= (and b!590056 res!377425) b!590048))

(assert (= (and b!590048 res!377435) b!590055))

(assert (= (and b!590055 res!377424) b!590049))

(assert (= (and b!590049 res!377426) b!590060))

(assert (= (and b!590060 res!377430) b!590052))

(assert (= (and b!590052 res!377432) b!590047))

(assert (= (and b!590047 res!377438) b!590054))

(assert (= (and b!590054 res!377433) b!590051))

(assert (= (and b!590051 res!377434) b!590062))

(assert (= (and b!590062 res!377431) b!590061))

(assert (= (and b!590061 res!377436) b!590057))

(assert (= (and b!590061 c!66678) b!590053))

(assert (= (and b!590061 (not c!66678)) b!590050))

(assert (= (and b!590061 (not res!377429)) b!590046))

(assert (= (and b!590046 res!377427) b!590058))

(assert (= (and b!590058 (not res!377437)) b!590059))

(declare-fun m!567955 () Bool)

(assert (=> b!590055 m!567955))

(declare-fun m!567957 () Bool)

(assert (=> b!590059 m!567957))

(assert (=> b!590059 m!567957))

(declare-fun m!567959 () Bool)

(assert (=> b!590059 m!567959))

(assert (=> b!590058 m!567957))

(declare-fun m!567961 () Bool)

(assert (=> b!590058 m!567961))

(declare-fun m!567963 () Bool)

(assert (=> b!590058 m!567963))

(assert (=> b!590046 m!567961))

(assert (=> b!590046 m!567963))

(assert (=> b!590046 m!567957))

(assert (=> b!590051 m!567961))

(declare-fun m!567965 () Bool)

(assert (=> b!590051 m!567965))

(declare-fun m!567967 () Bool)

(assert (=> b!590061 m!567967))

(declare-fun m!567969 () Bool)

(assert (=> b!590061 m!567969))

(assert (=> b!590061 m!567957))

(assert (=> b!590061 m!567961))

(declare-fun m!567971 () Bool)

(assert (=> b!590061 m!567971))

(declare-fun m!567973 () Bool)

(assert (=> b!590061 m!567973))

(declare-fun m!567975 () Bool)

(assert (=> b!590061 m!567975))

(assert (=> b!590061 m!567957))

(declare-fun m!567977 () Bool)

(assert (=> b!590061 m!567977))

(declare-fun m!567979 () Bool)

(assert (=> b!590049 m!567979))

(declare-fun m!567981 () Bool)

(assert (=> b!590047 m!567981))

(declare-fun m!567983 () Bool)

(assert (=> b!590052 m!567983))

(assert (=> b!590048 m!567957))

(assert (=> b!590048 m!567957))

(declare-fun m!567985 () Bool)

(assert (=> b!590048 m!567985))

(declare-fun m!567987 () Bool)

(assert (=> b!590062 m!567987))

(assert (=> b!590062 m!567957))

(assert (=> b!590062 m!567957))

(declare-fun m!567989 () Bool)

(assert (=> b!590062 m!567989))

(declare-fun m!567991 () Bool)

(assert (=> b!590060 m!567991))

(declare-fun m!567993 () Bool)

(assert (=> start!54042 m!567993))

(declare-fun m!567995 () Bool)

(assert (=> start!54042 m!567995))

(declare-fun m!567997 () Bool)

(assert (=> b!590054 m!567997))

(check-sat (not b!590062) (not b!590060) (not b!590052) (not b!590047) (not b!590049) (not b!590048) (not b!590055) (not b!590059) (not start!54042) (not b!590061))
(check-sat)
