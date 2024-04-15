; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57090 () Bool)

(assert start!57090)

(declare-fun res!408684 () Bool)

(declare-fun e!361258 () Bool)

(assert (=> start!57090 (=> (not res!408684) (not e!361258))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57090 (= res!408684 (validMask!0 mask!3053))))

(assert (=> start!57090 e!361258))

(assert (=> start!57090 true))

(declare-datatypes ((array!38121 0))(
  ( (array!38122 (arr!18293 (Array (_ BitVec 32) (_ BitVec 64))) (size!18658 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38121)

(declare-fun array_inv!14176 (array!38121) Bool)

(assert (=> start!57090 (array_inv!14176 a!2986)))

(declare-fun b!631901 () Bool)

(declare-fun res!408679 () Bool)

(declare-fun e!361259 () Bool)

(assert (=> b!631901 (=> (not res!408679) (not e!361259))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!631901 (= res!408679 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18293 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!631902 () Bool)

(declare-datatypes ((Unit!21248 0))(
  ( (Unit!21249) )
))
(declare-fun e!361256 () Unit!21248)

(declare-fun Unit!21250 () Unit!21248)

(assert (=> b!631902 (= e!361256 Unit!21250)))

(declare-fun b!631903 () Bool)

(declare-fun e!361260 () Bool)

(declare-datatypes ((SeekEntryResult!6730 0))(
  ( (MissingZero!6730 (index!29213 (_ BitVec 32))) (Found!6730 (index!29214 (_ BitVec 32))) (Intermediate!6730 (undefined!7542 Bool) (index!29215 (_ BitVec 32)) (x!57960 (_ BitVec 32))) (Undefined!6730) (MissingVacant!6730 (index!29216 (_ BitVec 32))) )
))
(declare-fun lt!291901 () SeekEntryResult!6730)

(declare-fun lt!291898 () SeekEntryResult!6730)

(assert (=> b!631903 (= e!361260 (= lt!291901 lt!291898))))

(declare-fun b!631904 () Bool)

(declare-fun e!361254 () Bool)

(declare-fun e!361257 () Bool)

(assert (=> b!631904 (= e!361254 e!361257)))

(declare-fun res!408681 () Bool)

(assert (=> b!631904 (=> (not res!408681) (not e!361257))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!631904 (= res!408681 (and (= lt!291901 (Found!6730 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18293 a!2986) index!984) (select (arr!18293 a!2986) j!136))) (not (= (select (arr!18293 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38121 (_ BitVec 32)) SeekEntryResult!6730)

(assert (=> b!631904 (= lt!291901 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18293 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!631905 () Bool)

(declare-fun res!408686 () Bool)

(assert (=> b!631905 (=> (not res!408686) (not e!361259))))

(declare-datatypes ((List!12373 0))(
  ( (Nil!12370) (Cons!12369 (h!13414 (_ BitVec 64)) (t!18592 List!12373)) )
))
(declare-fun arrayNoDuplicates!0 (array!38121 (_ BitVec 32) List!12373) Bool)

(assert (=> b!631905 (= res!408686 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12370))))

(declare-fun b!631906 () Bool)

(declare-fun e!361255 () Bool)

(assert (=> b!631906 (= e!361255 true)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!631906 (= (select (store (arr!18293 a!2986) i!1108 k0!1786) index!984) (select (arr!18293 a!2986) j!136))))

(declare-fun b!631907 () Bool)

(assert (=> b!631907 (= e!361257 (not e!361255))))

(declare-fun res!408682 () Bool)

(assert (=> b!631907 (=> res!408682 e!361255)))

(declare-fun lt!291903 () SeekEntryResult!6730)

(assert (=> b!631907 (= res!408682 (not (= lt!291903 (Found!6730 index!984))))))

(declare-fun lt!291899 () Unit!21248)

(assert (=> b!631907 (= lt!291899 e!361256)))

(declare-fun c!71979 () Bool)

(assert (=> b!631907 (= c!71979 (= lt!291903 Undefined!6730))))

(declare-fun lt!291896 () (_ BitVec 64))

(declare-fun lt!291904 () array!38121)

(assert (=> b!631907 (= lt!291903 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291896 lt!291904 mask!3053))))

(assert (=> b!631907 e!361260))

(declare-fun res!408689 () Bool)

(assert (=> b!631907 (=> (not res!408689) (not e!361260))))

(declare-fun lt!291902 () (_ BitVec 32))

(assert (=> b!631907 (= res!408689 (= lt!291898 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291902 vacantSpotIndex!68 lt!291896 lt!291904 mask!3053)))))

(assert (=> b!631907 (= lt!291898 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291902 vacantSpotIndex!68 (select (arr!18293 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!631907 (= lt!291896 (select (store (arr!18293 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!291897 () Unit!21248)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38121 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21248)

(assert (=> b!631907 (= lt!291897 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291902 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!631907 (= lt!291902 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!631908 () Bool)

(declare-fun res!408685 () Bool)

(assert (=> b!631908 (=> (not res!408685) (not e!361259))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38121 (_ BitVec 32)) Bool)

(assert (=> b!631908 (= res!408685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!631909 () Bool)

(declare-fun res!408687 () Bool)

(assert (=> b!631909 (=> (not res!408687) (not e!361258))))

(assert (=> b!631909 (= res!408687 (and (= (size!18658 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18658 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18658 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!631910 () Bool)

(assert (=> b!631910 (= e!361258 e!361259)))

(declare-fun res!408677 () Bool)

(assert (=> b!631910 (=> (not res!408677) (not e!361259))))

(declare-fun lt!291900 () SeekEntryResult!6730)

(assert (=> b!631910 (= res!408677 (or (= lt!291900 (MissingZero!6730 i!1108)) (= lt!291900 (MissingVacant!6730 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38121 (_ BitVec 32)) SeekEntryResult!6730)

(assert (=> b!631910 (= lt!291900 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!631911 () Bool)

(declare-fun res!408680 () Bool)

(assert (=> b!631911 (=> (not res!408680) (not e!361258))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!631911 (= res!408680 (validKeyInArray!0 k0!1786))))

(declare-fun b!631912 () Bool)

(declare-fun res!408683 () Bool)

(assert (=> b!631912 (=> (not res!408683) (not e!361258))))

(declare-fun arrayContainsKey!0 (array!38121 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!631912 (= res!408683 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!631913 () Bool)

(declare-fun Unit!21251 () Unit!21248)

(assert (=> b!631913 (= e!361256 Unit!21251)))

(assert (=> b!631913 false))

(declare-fun b!631914 () Bool)

(declare-fun res!408678 () Bool)

(assert (=> b!631914 (=> (not res!408678) (not e!361258))))

(assert (=> b!631914 (= res!408678 (validKeyInArray!0 (select (arr!18293 a!2986) j!136)))))

(declare-fun b!631915 () Bool)

(assert (=> b!631915 (= e!361259 e!361254)))

(declare-fun res!408688 () Bool)

(assert (=> b!631915 (=> (not res!408688) (not e!361254))))

(assert (=> b!631915 (= res!408688 (= (select (store (arr!18293 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!631915 (= lt!291904 (array!38122 (store (arr!18293 a!2986) i!1108 k0!1786) (size!18658 a!2986)))))

(assert (= (and start!57090 res!408684) b!631909))

(assert (= (and b!631909 res!408687) b!631914))

(assert (= (and b!631914 res!408678) b!631911))

(assert (= (and b!631911 res!408680) b!631912))

(assert (= (and b!631912 res!408683) b!631910))

(assert (= (and b!631910 res!408677) b!631908))

(assert (= (and b!631908 res!408685) b!631905))

(assert (= (and b!631905 res!408686) b!631901))

(assert (= (and b!631901 res!408679) b!631915))

(assert (= (and b!631915 res!408688) b!631904))

(assert (= (and b!631904 res!408681) b!631907))

(assert (= (and b!631907 res!408689) b!631903))

(assert (= (and b!631907 c!71979) b!631913))

(assert (= (and b!631907 (not c!71979)) b!631902))

(assert (= (and b!631907 (not res!408682)) b!631906))

(declare-fun m!606253 () Bool)

(assert (=> b!631907 m!606253))

(declare-fun m!606255 () Bool)

(assert (=> b!631907 m!606255))

(declare-fun m!606257 () Bool)

(assert (=> b!631907 m!606257))

(declare-fun m!606259 () Bool)

(assert (=> b!631907 m!606259))

(declare-fun m!606261 () Bool)

(assert (=> b!631907 m!606261))

(declare-fun m!606263 () Bool)

(assert (=> b!631907 m!606263))

(declare-fun m!606265 () Bool)

(assert (=> b!631907 m!606265))

(assert (=> b!631907 m!606257))

(declare-fun m!606267 () Bool)

(assert (=> b!631907 m!606267))

(declare-fun m!606269 () Bool)

(assert (=> start!57090 m!606269))

(declare-fun m!606271 () Bool)

(assert (=> start!57090 m!606271))

(declare-fun m!606273 () Bool)

(assert (=> b!631912 m!606273))

(assert (=> b!631914 m!606257))

(assert (=> b!631914 m!606257))

(declare-fun m!606275 () Bool)

(assert (=> b!631914 m!606275))

(declare-fun m!606277 () Bool)

(assert (=> b!631911 m!606277))

(declare-fun m!606279 () Bool)

(assert (=> b!631904 m!606279))

(assert (=> b!631904 m!606257))

(assert (=> b!631904 m!606257))

(declare-fun m!606281 () Bool)

(assert (=> b!631904 m!606281))

(assert (=> b!631906 m!606265))

(declare-fun m!606283 () Bool)

(assert (=> b!631906 m!606283))

(assert (=> b!631906 m!606257))

(declare-fun m!606285 () Bool)

(assert (=> b!631905 m!606285))

(declare-fun m!606287 () Bool)

(assert (=> b!631901 m!606287))

(declare-fun m!606289 () Bool)

(assert (=> b!631910 m!606289))

(assert (=> b!631915 m!606265))

(declare-fun m!606291 () Bool)

(assert (=> b!631915 m!606291))

(declare-fun m!606293 () Bool)

(assert (=> b!631908 m!606293))

(check-sat (not b!631911) (not b!631907) (not b!631910) (not b!631904) (not b!631912) (not b!631914) (not start!57090) (not b!631905) (not b!631908))
(check-sat)
