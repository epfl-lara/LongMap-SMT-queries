; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58548 () Bool)

(assert start!58548)

(declare-fun b!646528 () Bool)

(declare-fun e!370612 () Bool)

(declare-fun e!370619 () Bool)

(assert (=> b!646528 (= e!370612 e!370619)))

(declare-fun res!418933 () Bool)

(assert (=> b!646528 (=> res!418933 e!370619)))

(declare-fun lt!299982 () (_ BitVec 64))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!299975 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38483 0))(
  ( (array!38484 (arr!18452 (Array (_ BitVec 32) (_ BitVec 64))) (size!18816 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38483)

(assert (=> b!646528 (= res!418933 (or (not (= (select (arr!18452 a!2986) j!136) lt!299975)) (not (= (select (arr!18452 a!2986) j!136) lt!299982)) (bvsge j!136 index!984)))))

(declare-fun b!646529 () Bool)

(declare-fun res!418938 () Bool)

(declare-fun e!370614 () Bool)

(assert (=> b!646529 (=> (not res!418938) (not e!370614))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38483 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!646529 (= res!418938 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun e!370610 () Bool)

(declare-fun lt!299968 () array!38483)

(declare-fun b!646530 () Bool)

(assert (=> b!646530 (= e!370610 (arrayContainsKey!0 lt!299968 (select (arr!18452 a!2986) j!136) index!984))))

(declare-fun b!646531 () Bool)

(declare-fun e!370617 () Bool)

(assert (=> b!646531 (= e!370617 (or (bvsge (size!18816 a!2986) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!18816 a!2986))))))

(assert (=> b!646531 (arrayContainsKey!0 lt!299968 (select (arr!18452 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-datatypes ((Unit!21978 0))(
  ( (Unit!21979) )
))
(declare-fun lt!299979 () Unit!21978)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38483 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21978)

(assert (=> b!646531 (= lt!299979 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299968 (select (arr!18452 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!370620 () Bool)

(assert (=> b!646531 e!370620))

(declare-fun res!418934 () Bool)

(assert (=> b!646531 (=> (not res!418934) (not e!370620))))

(assert (=> b!646531 (= res!418934 (arrayContainsKey!0 lt!299968 (select (arr!18452 a!2986) j!136) j!136))))

(declare-fun b!646532 () Bool)

(declare-fun e!370613 () Bool)

(assert (=> b!646532 (= e!370613 e!370617)))

(declare-fun res!418939 () Bool)

(assert (=> b!646532 (=> res!418939 e!370617)))

(assert (=> b!646532 (= res!418939 (bvsge index!984 j!136))))

(declare-fun lt!299972 () Unit!21978)

(declare-fun e!370608 () Unit!21978)

(assert (=> b!646532 (= lt!299972 e!370608)))

(declare-fun c!74168 () Bool)

(assert (=> b!646532 (= c!74168 (bvslt j!136 index!984))))

(declare-fun b!646533 () Bool)

(declare-fun res!418928 () Bool)

(assert (=> b!646533 (=> (not res!418928) (not e!370614))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!646533 (= res!418928 (and (= (size!18816 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18816 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18816 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!418944 () Bool)

(assert (=> start!58548 (=> (not res!418944) (not e!370614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58548 (= res!418944 (validMask!0 mask!3053))))

(assert (=> start!58548 e!370614))

(assert (=> start!58548 true))

(declare-fun array_inv!14248 (array!38483) Bool)

(assert (=> start!58548 (array_inv!14248 a!2986)))

(declare-fun b!646534 () Bool)

(declare-fun e!370618 () Bool)

(declare-fun e!370615 () Bool)

(assert (=> b!646534 (= e!370618 e!370615)))

(declare-fun res!418936 () Bool)

(assert (=> b!646534 (=> (not res!418936) (not e!370615))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!646534 (= res!418936 (= (select (store (arr!18452 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!646534 (= lt!299968 (array!38484 (store (arr!18452 a!2986) i!1108 k!1786) (size!18816 a!2986)))))

(declare-fun b!646535 () Bool)

(declare-fun res!418946 () Bool)

(assert (=> b!646535 (=> (not res!418946) (not e!370614))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!646535 (= res!418946 (validKeyInArray!0 (select (arr!18452 a!2986) j!136)))))

(declare-fun b!646536 () Bool)

(declare-fun res!418945 () Bool)

(assert (=> b!646536 (=> (not res!418945) (not e!370614))))

(assert (=> b!646536 (= res!418945 (validKeyInArray!0 k!1786))))

(declare-fun b!646537 () Bool)

(declare-fun Unit!21980 () Unit!21978)

(assert (=> b!646537 (= e!370608 Unit!21980)))

(declare-fun b!646538 () Bool)

(declare-fun res!418943 () Bool)

(assert (=> b!646538 (=> (not res!418943) (not e!370618))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38483 (_ BitVec 32)) Bool)

(assert (=> b!646538 (= res!418943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!646539 () Bool)

(assert (=> b!646539 (= e!370614 e!370618)))

(declare-fun res!418932 () Bool)

(assert (=> b!646539 (=> (not res!418932) (not e!370618))))

(declare-datatypes ((SeekEntryResult!6892 0))(
  ( (MissingZero!6892 (index!29906 (_ BitVec 32))) (Found!6892 (index!29907 (_ BitVec 32))) (Intermediate!6892 (undefined!7704 Bool) (index!29908 (_ BitVec 32)) (x!58678 (_ BitVec 32))) (Undefined!6892) (MissingVacant!6892 (index!29909 (_ BitVec 32))) )
))
(declare-fun lt!299981 () SeekEntryResult!6892)

(assert (=> b!646539 (= res!418932 (or (= lt!299981 (MissingZero!6892 i!1108)) (= lt!299981 (MissingVacant!6892 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38483 (_ BitVec 32)) SeekEntryResult!6892)

(assert (=> b!646539 (= lt!299981 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!646540 () Bool)

(declare-fun e!370611 () Bool)

(assert (=> b!646540 (= e!370611 e!370613)))

(declare-fun res!418942 () Bool)

(assert (=> b!646540 (=> res!418942 e!370613)))

(assert (=> b!646540 (= res!418942 (or (not (= (select (arr!18452 a!2986) j!136) lt!299975)) (not (= (select (arr!18452 a!2986) j!136) lt!299982))))))

(assert (=> b!646540 e!370612))

(declare-fun res!418931 () Bool)

(assert (=> b!646540 (=> (not res!418931) (not e!370612))))

(assert (=> b!646540 (= res!418931 (= lt!299982 (select (arr!18452 a!2986) j!136)))))

(assert (=> b!646540 (= lt!299982 (select (store (arr!18452 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!646541 () Bool)

(assert (=> b!646541 (= e!370619 e!370610)))

(declare-fun res!418935 () Bool)

(assert (=> b!646541 (=> (not res!418935) (not e!370610))))

(assert (=> b!646541 (= res!418935 (arrayContainsKey!0 lt!299968 (select (arr!18452 a!2986) j!136) j!136))))

(declare-fun b!646542 () Bool)

(declare-fun e!370607 () Bool)

(assert (=> b!646542 (= e!370607 (not e!370611))))

(declare-fun res!418930 () Bool)

(assert (=> b!646542 (=> res!418930 e!370611)))

(declare-fun lt!299971 () SeekEntryResult!6892)

(assert (=> b!646542 (= res!418930 (not (= lt!299971 (Found!6892 index!984))))))

(declare-fun lt!299978 () Unit!21978)

(declare-fun e!370609 () Unit!21978)

(assert (=> b!646542 (= lt!299978 e!370609)))

(declare-fun c!74167 () Bool)

(assert (=> b!646542 (= c!74167 (= lt!299971 Undefined!6892))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38483 (_ BitVec 32)) SeekEntryResult!6892)

(assert (=> b!646542 (= lt!299971 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!299975 lt!299968 mask!3053))))

(declare-fun e!370606 () Bool)

(assert (=> b!646542 e!370606))

(declare-fun res!418929 () Bool)

(assert (=> b!646542 (=> (not res!418929) (not e!370606))))

(declare-fun lt!299983 () (_ BitVec 32))

(declare-fun lt!299977 () SeekEntryResult!6892)

(assert (=> b!646542 (= res!418929 (= lt!299977 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299983 vacantSpotIndex!68 lt!299975 lt!299968 mask!3053)))))

(assert (=> b!646542 (= lt!299977 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299983 vacantSpotIndex!68 (select (arr!18452 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!646542 (= lt!299975 (select (store (arr!18452 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!299974 () Unit!21978)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38483 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21978)

(assert (=> b!646542 (= lt!299974 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299983 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!646542 (= lt!299983 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!646543 () Bool)

(declare-fun lt!299970 () SeekEntryResult!6892)

(assert (=> b!646543 (= e!370606 (= lt!299970 lt!299977))))

(declare-fun b!646544 () Bool)

(declare-fun res!418940 () Bool)

(assert (=> b!646544 (=> (not res!418940) (not e!370618))))

(declare-datatypes ((List!12493 0))(
  ( (Nil!12490) (Cons!12489 (h!13534 (_ BitVec 64)) (t!18721 List!12493)) )
))
(declare-fun arrayNoDuplicates!0 (array!38483 (_ BitVec 32) List!12493) Bool)

(assert (=> b!646544 (= res!418940 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12490))))

(declare-fun b!646545 () Bool)

(declare-fun Unit!21981 () Unit!21978)

(assert (=> b!646545 (= e!370609 Unit!21981)))

(assert (=> b!646545 false))

(declare-fun b!646546 () Bool)

(declare-fun res!418941 () Bool)

(assert (=> b!646546 (=> (not res!418941) (not e!370618))))

(assert (=> b!646546 (= res!418941 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18452 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!646547 () Bool)

(assert (=> b!646547 (= e!370620 (arrayContainsKey!0 lt!299968 (select (arr!18452 a!2986) j!136) index!984))))

(declare-fun b!646548 () Bool)

(assert (=> b!646548 (= e!370615 e!370607)))

(declare-fun res!418937 () Bool)

(assert (=> b!646548 (=> (not res!418937) (not e!370607))))

(assert (=> b!646548 (= res!418937 (and (= lt!299970 (Found!6892 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18452 a!2986) index!984) (select (arr!18452 a!2986) j!136))) (not (= (select (arr!18452 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!646548 (= lt!299970 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18452 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!646549 () Bool)

(declare-fun Unit!21982 () Unit!21978)

(assert (=> b!646549 (= e!370609 Unit!21982)))

(declare-fun b!646550 () Bool)

(declare-fun Unit!21983 () Unit!21978)

(assert (=> b!646550 (= e!370608 Unit!21983)))

(declare-fun lt!299980 () Unit!21978)

(assert (=> b!646550 (= lt!299980 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299968 (select (arr!18452 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!646550 (arrayContainsKey!0 lt!299968 (select (arr!18452 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!299973 () Unit!21978)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38483 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12493) Unit!21978)

(assert (=> b!646550 (= lt!299973 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12490))))

(assert (=> b!646550 (arrayNoDuplicates!0 lt!299968 #b00000000000000000000000000000000 Nil!12490)))

(declare-fun lt!299976 () Unit!21978)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38483 (_ BitVec 32) (_ BitVec 32)) Unit!21978)

(assert (=> b!646550 (= lt!299976 (lemmaNoDuplicateFromThenFromBigger!0 lt!299968 #b00000000000000000000000000000000 j!136))))

(assert (=> b!646550 (arrayNoDuplicates!0 lt!299968 j!136 Nil!12490)))

(declare-fun lt!299969 () Unit!21978)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38483 (_ BitVec 64) (_ BitVec 32) List!12493) Unit!21978)

(assert (=> b!646550 (= lt!299969 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!299968 (select (arr!18452 a!2986) j!136) j!136 Nil!12490))))

(assert (=> b!646550 false))

(assert (= (and start!58548 res!418944) b!646533))

(assert (= (and b!646533 res!418928) b!646535))

(assert (= (and b!646535 res!418946) b!646536))

(assert (= (and b!646536 res!418945) b!646529))

(assert (= (and b!646529 res!418938) b!646539))

(assert (= (and b!646539 res!418932) b!646538))

(assert (= (and b!646538 res!418943) b!646544))

(assert (= (and b!646544 res!418940) b!646546))

(assert (= (and b!646546 res!418941) b!646534))

(assert (= (and b!646534 res!418936) b!646548))

(assert (= (and b!646548 res!418937) b!646542))

(assert (= (and b!646542 res!418929) b!646543))

(assert (= (and b!646542 c!74167) b!646545))

(assert (= (and b!646542 (not c!74167)) b!646549))

(assert (= (and b!646542 (not res!418930)) b!646540))

(assert (= (and b!646540 res!418931) b!646528))

(assert (= (and b!646528 (not res!418933)) b!646541))

(assert (= (and b!646541 res!418935) b!646530))

(assert (= (and b!646540 (not res!418942)) b!646532))

(assert (= (and b!646532 c!74168) b!646550))

(assert (= (and b!646532 (not c!74168)) b!646537))

(assert (= (and b!646532 (not res!418939)) b!646531))

(assert (= (and b!646531 res!418934) b!646547))

(declare-fun m!619987 () Bool)

(assert (=> b!646536 m!619987))

(declare-fun m!619989 () Bool)

(assert (=> b!646538 m!619989))

(declare-fun m!619991 () Bool)

(assert (=> b!646528 m!619991))

(assert (=> b!646531 m!619991))

(assert (=> b!646531 m!619991))

(declare-fun m!619993 () Bool)

(assert (=> b!646531 m!619993))

(assert (=> b!646531 m!619991))

(declare-fun m!619995 () Bool)

(assert (=> b!646531 m!619995))

(assert (=> b!646531 m!619991))

(declare-fun m!619997 () Bool)

(assert (=> b!646531 m!619997))

(assert (=> b!646540 m!619991))

(declare-fun m!619999 () Bool)

(assert (=> b!646540 m!619999))

(declare-fun m!620001 () Bool)

(assert (=> b!646540 m!620001))

(assert (=> b!646535 m!619991))

(assert (=> b!646535 m!619991))

(declare-fun m!620003 () Bool)

(assert (=> b!646535 m!620003))

(assert (=> b!646547 m!619991))

(assert (=> b!646547 m!619991))

(declare-fun m!620005 () Bool)

(assert (=> b!646547 m!620005))

(assert (=> b!646541 m!619991))

(assert (=> b!646541 m!619991))

(assert (=> b!646541 m!619997))

(assert (=> b!646530 m!619991))

(assert (=> b!646530 m!619991))

(assert (=> b!646530 m!620005))

(assert (=> b!646550 m!619991))

(declare-fun m!620007 () Bool)

(assert (=> b!646550 m!620007))

(declare-fun m!620009 () Bool)

(assert (=> b!646550 m!620009))

(assert (=> b!646550 m!619991))

(declare-fun m!620011 () Bool)

(assert (=> b!646550 m!620011))

(declare-fun m!620013 () Bool)

(assert (=> b!646550 m!620013))

(declare-fun m!620015 () Bool)

(assert (=> b!646550 m!620015))

(declare-fun m!620017 () Bool)

(assert (=> b!646550 m!620017))

(assert (=> b!646550 m!619991))

(declare-fun m!620019 () Bool)

(assert (=> b!646550 m!620019))

(assert (=> b!646550 m!619991))

(declare-fun m!620021 () Bool)

(assert (=> b!646539 m!620021))

(declare-fun m!620023 () Bool)

(assert (=> start!58548 m!620023))

(declare-fun m!620025 () Bool)

(assert (=> start!58548 m!620025))

(declare-fun m!620027 () Bool)

(assert (=> b!646546 m!620027))

(declare-fun m!620029 () Bool)

(assert (=> b!646542 m!620029))

(declare-fun m!620031 () Bool)

(assert (=> b!646542 m!620031))

(assert (=> b!646542 m!619991))

(declare-fun m!620033 () Bool)

(assert (=> b!646542 m!620033))

(assert (=> b!646542 m!619999))

(declare-fun m!620035 () Bool)

(assert (=> b!646542 m!620035))

(declare-fun m!620037 () Bool)

(assert (=> b!646542 m!620037))

(assert (=> b!646542 m!619991))

(declare-fun m!620039 () Bool)

(assert (=> b!646542 m!620039))

(assert (=> b!646534 m!619999))

(declare-fun m!620041 () Bool)

(assert (=> b!646534 m!620041))

(declare-fun m!620043 () Bool)

(assert (=> b!646544 m!620043))

(declare-fun m!620045 () Bool)

(assert (=> b!646548 m!620045))

(assert (=> b!646548 m!619991))

(assert (=> b!646548 m!619991))

(declare-fun m!620047 () Bool)

(assert (=> b!646548 m!620047))

(declare-fun m!620049 () Bool)

(assert (=> b!646529 m!620049))

(push 1)

