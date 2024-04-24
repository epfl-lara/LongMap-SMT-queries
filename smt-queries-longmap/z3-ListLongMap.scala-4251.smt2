; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59034 () Bool)

(assert start!59034)

(declare-fun b!650583 () Bool)

(declare-fun e!373257 () Bool)

(declare-datatypes ((SeekEntryResult!6874 0))(
  ( (MissingZero!6874 (index!29846 (_ BitVec 32))) (Found!6874 (index!29847 (_ BitVec 32))) (Intermediate!6874 (undefined!7686 Bool) (index!29848 (_ BitVec 32)) (x!58787 (_ BitVec 32))) (Undefined!6874) (MissingVacant!6874 (index!29849 (_ BitVec 32))) )
))
(declare-fun lt!302246 () SeekEntryResult!6874)

(declare-fun lt!302254 () SeekEntryResult!6874)

(assert (=> b!650583 (= e!373257 (= lt!302246 lt!302254))))

(declare-fun b!650584 () Bool)

(declare-fun e!373244 () Bool)

(assert (=> b!650584 (= e!373244 true)))

(declare-datatypes ((array!38553 0))(
  ( (array!38554 (arr!18478 (Array (_ BitVec 32) (_ BitVec 64))) (size!18842 (_ BitVec 32))) )
))
(declare-fun lt!302245 () array!38553)

(declare-datatypes ((List!12426 0))(
  ( (Nil!12423) (Cons!12422 (h!13470 (_ BitVec 64)) (t!18646 List!12426)) )
))
(declare-fun arrayNoDuplicates!0 (array!38553 (_ BitVec 32) List!12426) Bool)

(assert (=> b!650584 (arrayNoDuplicates!0 lt!302245 #b00000000000000000000000000000000 Nil!12423)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((Unit!22143 0))(
  ( (Unit!22144) )
))
(declare-fun lt!302241 () Unit!22143)

(declare-fun a!2986 () array!38553)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38553 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12426) Unit!22143)

(assert (=> b!650584 (= lt!302241 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12423))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!650584 (arrayContainsKey!0 lt!302245 (select (arr!18478 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!302247 () Unit!22143)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38553 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22143)

(assert (=> b!650584 (= lt!302247 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302245 (select (arr!18478 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!373253 () Bool)

(assert (=> b!650584 e!373253))

(declare-fun res!421672 () Bool)

(assert (=> b!650584 (=> (not res!421672) (not e!373253))))

(assert (=> b!650584 (= res!421672 (arrayContainsKey!0 lt!302245 (select (arr!18478 a!2986) j!136) j!136))))

(declare-fun b!650585 () Bool)

(declare-fun e!373254 () Bool)

(declare-fun e!373247 () Bool)

(assert (=> b!650585 (= e!373254 e!373247)))

(declare-fun res!421662 () Bool)

(assert (=> b!650585 (=> (not res!421662) (not e!373247))))

(declare-fun lt!302238 () SeekEntryResult!6874)

(assert (=> b!650585 (= res!421662 (or (= lt!302238 (MissingZero!6874 i!1108)) (= lt!302238 (MissingVacant!6874 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38553 (_ BitVec 32)) SeekEntryResult!6874)

(assert (=> b!650585 (= lt!302238 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!650586 () Bool)

(declare-fun e!373252 () Bool)

(assert (=> b!650586 (= e!373247 e!373252)))

(declare-fun res!421660 () Bool)

(assert (=> b!650586 (=> (not res!421660) (not e!373252))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!650586 (= res!421660 (= (select (store (arr!18478 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!650586 (= lt!302245 (array!38554 (store (arr!18478 a!2986) i!1108 k0!1786) (size!18842 a!2986)))))

(declare-fun b!650587 () Bool)

(declare-fun e!373251 () Unit!22143)

(declare-fun Unit!22145 () Unit!22143)

(assert (=> b!650587 (= e!373251 Unit!22145)))

(declare-fun b!650588 () Bool)

(declare-fun res!421670 () Bool)

(assert (=> b!650588 (=> (not res!421670) (not e!373254))))

(assert (=> b!650588 (= res!421670 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!650589 () Bool)

(declare-fun e!373250 () Bool)

(assert (=> b!650589 (= e!373250 e!373244)))

(declare-fun res!421669 () Bool)

(assert (=> b!650589 (=> res!421669 e!373244)))

(assert (=> b!650589 (= res!421669 (bvsge index!984 j!136))))

(declare-fun lt!302251 () Unit!22143)

(assert (=> b!650589 (= lt!302251 e!373251)))

(declare-fun c!74830 () Bool)

(assert (=> b!650589 (= c!74830 (bvslt j!136 index!984))))

(declare-fun b!650590 () Bool)

(declare-fun e!373246 () Bool)

(assert (=> b!650590 (= e!373246 e!373250)))

(declare-fun res!421664 () Bool)

(assert (=> b!650590 (=> res!421664 e!373250)))

(declare-fun lt!302249 () (_ BitVec 64))

(declare-fun lt!302239 () (_ BitVec 64))

(assert (=> b!650590 (= res!421664 (or (not (= (select (arr!18478 a!2986) j!136) lt!302239)) (not (= (select (arr!18478 a!2986) j!136) lt!302249))))))

(declare-fun e!373243 () Bool)

(assert (=> b!650590 e!373243))

(declare-fun res!421661 () Bool)

(assert (=> b!650590 (=> (not res!421661) (not e!373243))))

(assert (=> b!650590 (= res!421661 (= lt!302249 (select (arr!18478 a!2986) j!136)))))

(assert (=> b!650590 (= lt!302249 (select (store (arr!18478 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!650591 () Bool)

(declare-fun e!373245 () Bool)

(assert (=> b!650591 (= e!373245 (not e!373246))))

(declare-fun res!421678 () Bool)

(assert (=> b!650591 (=> res!421678 e!373246)))

(declare-fun lt!302243 () SeekEntryResult!6874)

(assert (=> b!650591 (= res!421678 (not (= lt!302243 (Found!6874 index!984))))))

(declare-fun lt!302240 () Unit!22143)

(declare-fun e!373255 () Unit!22143)

(assert (=> b!650591 (= lt!302240 e!373255)))

(declare-fun c!74831 () Bool)

(assert (=> b!650591 (= c!74831 (= lt!302243 Undefined!6874))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38553 (_ BitVec 32)) SeekEntryResult!6874)

(assert (=> b!650591 (= lt!302243 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!302239 lt!302245 mask!3053))))

(assert (=> b!650591 e!373257))

(declare-fun res!421677 () Bool)

(assert (=> b!650591 (=> (not res!421677) (not e!373257))))

(declare-fun lt!302252 () (_ BitVec 32))

(assert (=> b!650591 (= res!421677 (= lt!302254 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302252 vacantSpotIndex!68 lt!302239 lt!302245 mask!3053)))))

(assert (=> b!650591 (= lt!302254 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302252 vacantSpotIndex!68 (select (arr!18478 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!650591 (= lt!302239 (select (store (arr!18478 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!302253 () Unit!22143)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38553 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22143)

(assert (=> b!650591 (= lt!302253 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!302252 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!650591 (= lt!302252 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun res!421673 () Bool)

(assert (=> start!59034 (=> (not res!421673) (not e!373254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59034 (= res!421673 (validMask!0 mask!3053))))

(assert (=> start!59034 e!373254))

(assert (=> start!59034 true))

(declare-fun array_inv!14337 (array!38553) Bool)

(assert (=> start!59034 (array_inv!14337 a!2986)))

(declare-fun b!650592 () Bool)

(declare-fun Unit!22146 () Unit!22143)

(assert (=> b!650592 (= e!373255 Unit!22146)))

(assert (=> b!650592 false))

(declare-fun b!650593 () Bool)

(declare-fun Unit!22147 () Unit!22143)

(assert (=> b!650593 (= e!373251 Unit!22147)))

(declare-fun lt!302244 () Unit!22143)

(assert (=> b!650593 (= lt!302244 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302245 (select (arr!18478 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!650593 (arrayContainsKey!0 lt!302245 (select (arr!18478 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!302248 () Unit!22143)

(assert (=> b!650593 (= lt!302248 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12423))))

(assert (=> b!650593 (arrayNoDuplicates!0 lt!302245 #b00000000000000000000000000000000 Nil!12423)))

(declare-fun lt!302250 () Unit!22143)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38553 (_ BitVec 32) (_ BitVec 32)) Unit!22143)

(assert (=> b!650593 (= lt!302250 (lemmaNoDuplicateFromThenFromBigger!0 lt!302245 #b00000000000000000000000000000000 j!136))))

(assert (=> b!650593 (arrayNoDuplicates!0 lt!302245 j!136 Nil!12423)))

(declare-fun lt!302242 () Unit!22143)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38553 (_ BitVec 64) (_ BitVec 32) List!12426) Unit!22143)

(assert (=> b!650593 (= lt!302242 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!302245 (select (arr!18478 a!2986) j!136) j!136 Nil!12423))))

(assert (=> b!650593 false))

(declare-fun b!650594 () Bool)

(declare-fun res!421674 () Bool)

(assert (=> b!650594 (=> (not res!421674) (not e!373247))))

(assert (=> b!650594 (= res!421674 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18478 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!650595 () Bool)

(declare-fun e!373248 () Bool)

(assert (=> b!650595 (= e!373248 (arrayContainsKey!0 lt!302245 (select (arr!18478 a!2986) j!136) index!984))))

(declare-fun b!650596 () Bool)

(assert (=> b!650596 (= e!373253 (arrayContainsKey!0 lt!302245 (select (arr!18478 a!2986) j!136) index!984))))

(declare-fun b!650597 () Bool)

(declare-fun res!421666 () Bool)

(assert (=> b!650597 (=> (not res!421666) (not e!373254))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!650597 (= res!421666 (validKeyInArray!0 k0!1786))))

(declare-fun b!650598 () Bool)

(declare-fun e!373256 () Bool)

(assert (=> b!650598 (= e!373256 e!373248)))

(declare-fun res!421665 () Bool)

(assert (=> b!650598 (=> (not res!421665) (not e!373248))))

(assert (=> b!650598 (= res!421665 (arrayContainsKey!0 lt!302245 (select (arr!18478 a!2986) j!136) j!136))))

(declare-fun b!650599 () Bool)

(assert (=> b!650599 (= e!373252 e!373245)))

(declare-fun res!421663 () Bool)

(assert (=> b!650599 (=> (not res!421663) (not e!373245))))

(assert (=> b!650599 (= res!421663 (and (= lt!302246 (Found!6874 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18478 a!2986) index!984) (select (arr!18478 a!2986) j!136))) (not (= (select (arr!18478 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!650599 (= lt!302246 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18478 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!650600 () Bool)

(declare-fun res!421676 () Bool)

(assert (=> b!650600 (=> (not res!421676) (not e!373254))))

(assert (=> b!650600 (= res!421676 (validKeyInArray!0 (select (arr!18478 a!2986) j!136)))))

(declare-fun b!650601 () Bool)

(declare-fun res!421671 () Bool)

(assert (=> b!650601 (=> (not res!421671) (not e!373247))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38553 (_ BitVec 32)) Bool)

(assert (=> b!650601 (= res!421671 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!650602 () Bool)

(declare-fun Unit!22148 () Unit!22143)

(assert (=> b!650602 (= e!373255 Unit!22148)))

(declare-fun b!650603 () Bool)

(declare-fun res!421675 () Bool)

(assert (=> b!650603 (=> (not res!421675) (not e!373247))))

(assert (=> b!650603 (= res!421675 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12423))))

(declare-fun b!650604 () Bool)

(declare-fun res!421668 () Bool)

(assert (=> b!650604 (=> (not res!421668) (not e!373254))))

(assert (=> b!650604 (= res!421668 (and (= (size!18842 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18842 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18842 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!650605 () Bool)

(assert (=> b!650605 (= e!373243 e!373256)))

(declare-fun res!421667 () Bool)

(assert (=> b!650605 (=> res!421667 e!373256)))

(assert (=> b!650605 (= res!421667 (or (not (= (select (arr!18478 a!2986) j!136) lt!302239)) (not (= (select (arr!18478 a!2986) j!136) lt!302249)) (bvsge j!136 index!984)))))

(assert (= (and start!59034 res!421673) b!650604))

(assert (= (and b!650604 res!421668) b!650600))

(assert (= (and b!650600 res!421676) b!650597))

(assert (= (and b!650597 res!421666) b!650588))

(assert (= (and b!650588 res!421670) b!650585))

(assert (= (and b!650585 res!421662) b!650601))

(assert (= (and b!650601 res!421671) b!650603))

(assert (= (and b!650603 res!421675) b!650594))

(assert (= (and b!650594 res!421674) b!650586))

(assert (= (and b!650586 res!421660) b!650599))

(assert (= (and b!650599 res!421663) b!650591))

(assert (= (and b!650591 res!421677) b!650583))

(assert (= (and b!650591 c!74831) b!650592))

(assert (= (and b!650591 (not c!74831)) b!650602))

(assert (= (and b!650591 (not res!421678)) b!650590))

(assert (= (and b!650590 res!421661) b!650605))

(assert (= (and b!650605 (not res!421667)) b!650598))

(assert (= (and b!650598 res!421665) b!650595))

(assert (= (and b!650590 (not res!421664)) b!650589))

(assert (= (and b!650589 c!74830) b!650593))

(assert (= (and b!650589 (not c!74830)) b!650587))

(assert (= (and b!650589 (not res!421669)) b!650584))

(assert (= (and b!650584 res!421672) b!650596))

(declare-fun m!624229 () Bool)

(assert (=> b!650596 m!624229))

(assert (=> b!650596 m!624229))

(declare-fun m!624231 () Bool)

(assert (=> b!650596 m!624231))

(declare-fun m!624233 () Bool)

(assert (=> b!650597 m!624233))

(assert (=> b!650595 m!624229))

(assert (=> b!650595 m!624229))

(assert (=> b!650595 m!624231))

(declare-fun m!624235 () Bool)

(assert (=> b!650603 m!624235))

(declare-fun m!624237 () Bool)

(assert (=> b!650591 m!624237))

(declare-fun m!624239 () Bool)

(assert (=> b!650591 m!624239))

(declare-fun m!624241 () Bool)

(assert (=> b!650591 m!624241))

(declare-fun m!624243 () Bool)

(assert (=> b!650591 m!624243))

(assert (=> b!650591 m!624229))

(declare-fun m!624245 () Bool)

(assert (=> b!650591 m!624245))

(declare-fun m!624247 () Bool)

(assert (=> b!650591 m!624247))

(declare-fun m!624249 () Bool)

(assert (=> b!650591 m!624249))

(assert (=> b!650591 m!624229))

(assert (=> b!650584 m!624229))

(declare-fun m!624251 () Bool)

(assert (=> b!650584 m!624251))

(assert (=> b!650584 m!624229))

(assert (=> b!650584 m!624229))

(declare-fun m!624253 () Bool)

(assert (=> b!650584 m!624253))

(assert (=> b!650584 m!624229))

(declare-fun m!624255 () Bool)

(assert (=> b!650584 m!624255))

(declare-fun m!624257 () Bool)

(assert (=> b!650584 m!624257))

(declare-fun m!624259 () Bool)

(assert (=> b!650584 m!624259))

(assert (=> b!650600 m!624229))

(assert (=> b!650600 m!624229))

(declare-fun m!624261 () Bool)

(assert (=> b!650600 m!624261))

(assert (=> b!650586 m!624241))

(declare-fun m!624263 () Bool)

(assert (=> b!650586 m!624263))

(declare-fun m!624265 () Bool)

(assert (=> b!650593 m!624265))

(declare-fun m!624267 () Bool)

(assert (=> b!650593 m!624267))

(assert (=> b!650593 m!624257))

(assert (=> b!650593 m!624229))

(declare-fun m!624269 () Bool)

(assert (=> b!650593 m!624269))

(assert (=> b!650593 m!624229))

(assert (=> b!650593 m!624229))

(declare-fun m!624271 () Bool)

(assert (=> b!650593 m!624271))

(assert (=> b!650593 m!624259))

(assert (=> b!650593 m!624229))

(declare-fun m!624273 () Bool)

(assert (=> b!650593 m!624273))

(declare-fun m!624275 () Bool)

(assert (=> start!59034 m!624275))

(declare-fun m!624277 () Bool)

(assert (=> start!59034 m!624277))

(assert (=> b!650598 m!624229))

(assert (=> b!650598 m!624229))

(assert (=> b!650598 m!624255))

(declare-fun m!624279 () Bool)

(assert (=> b!650601 m!624279))

(assert (=> b!650605 m!624229))

(declare-fun m!624281 () Bool)

(assert (=> b!650585 m!624281))

(declare-fun m!624283 () Bool)

(assert (=> b!650594 m!624283))

(declare-fun m!624285 () Bool)

(assert (=> b!650588 m!624285))

(declare-fun m!624287 () Bool)

(assert (=> b!650599 m!624287))

(assert (=> b!650599 m!624229))

(assert (=> b!650599 m!624229))

(declare-fun m!624289 () Bool)

(assert (=> b!650599 m!624289))

(assert (=> b!650590 m!624229))

(assert (=> b!650590 m!624241))

(declare-fun m!624291 () Bool)

(assert (=> b!650590 m!624291))

(check-sat (not b!650584) (not start!59034) (not b!650591) (not b!650596) (not b!650603) (not b!650595) (not b!650585) (not b!650588) (not b!650593) (not b!650600) (not b!650597) (not b!650598) (not b!650601) (not b!650599))
(check-sat)
