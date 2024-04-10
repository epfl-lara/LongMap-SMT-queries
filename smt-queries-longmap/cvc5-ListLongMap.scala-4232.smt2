; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58328 () Bool)

(assert start!58328)

(declare-datatypes ((array!38425 0))(
  ( (array!38426 (arr!18426 (Array (_ BitVec 32) (_ BitVec 64))) (size!18790 (_ BitVec 32))) )
))
(declare-fun lt!298472 () array!38425)

(declare-fun b!644074 () Bool)

(declare-fun e!368999 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38425)

(declare-fun arrayContainsKey!0 (array!38425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!644074 (= e!368999 (arrayContainsKey!0 lt!298472 (select (arr!18426 a!2986) j!136) index!984))))

(declare-fun b!644075 () Bool)

(declare-fun res!417212 () Bool)

(declare-fun e!368996 () Bool)

(assert (=> b!644075 (=> (not res!417212) (not e!368996))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!644075 (= res!417212 (validKeyInArray!0 k!1786))))

(declare-fun b!644076 () Bool)

(declare-fun e!368995 () Bool)

(assert (=> b!644076 (= e!368995 (arrayContainsKey!0 lt!298472 (select (arr!18426 a!2986) j!136) index!984))))

(declare-fun b!644077 () Bool)

(declare-fun e!368987 () Bool)

(declare-datatypes ((SeekEntryResult!6866 0))(
  ( (MissingZero!6866 (index!29796 (_ BitVec 32))) (Found!6866 (index!29797 (_ BitVec 32))) (Intermediate!6866 (undefined!7678 Bool) (index!29798 (_ BitVec 32)) (x!58570 (_ BitVec 32))) (Undefined!6866) (MissingVacant!6866 (index!29799 (_ BitVec 32))) )
))
(declare-fun lt!298467 () SeekEntryResult!6866)

(declare-fun lt!298463 () SeekEntryResult!6866)

(assert (=> b!644077 (= e!368987 (= lt!298467 lt!298463))))

(declare-fun res!417214 () Bool)

(assert (=> start!58328 (=> (not res!417214) (not e!368996))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58328 (= res!417214 (validMask!0 mask!3053))))

(assert (=> start!58328 e!368996))

(assert (=> start!58328 true))

(declare-fun array_inv!14222 (array!38425) Bool)

(assert (=> start!58328 (array_inv!14222 a!2986)))

(declare-fun b!644078 () Bool)

(declare-fun res!417217 () Bool)

(declare-fun e!368989 () Bool)

(assert (=> b!644078 (=> (not res!417217) (not e!368989))))

(declare-datatypes ((List!12467 0))(
  ( (Nil!12464) (Cons!12463 (h!13508 (_ BitVec 64)) (t!18695 List!12467)) )
))
(declare-fun arrayNoDuplicates!0 (array!38425 (_ BitVec 32) List!12467) Bool)

(assert (=> b!644078 (= res!417217 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12464))))

(declare-fun b!644079 () Bool)

(declare-datatypes ((Unit!21822 0))(
  ( (Unit!21823) )
))
(declare-fun e!368991 () Unit!21822)

(declare-fun Unit!21824 () Unit!21822)

(assert (=> b!644079 (= e!368991 Unit!21824)))

(assert (=> b!644079 false))

(declare-fun b!644080 () Bool)

(declare-fun Unit!21825 () Unit!21822)

(assert (=> b!644080 (= e!368991 Unit!21825)))

(declare-fun b!644081 () Bool)

(declare-fun e!368992 () Bool)

(declare-fun e!368988 () Bool)

(assert (=> b!644081 (= e!368992 e!368988)))

(declare-fun res!417224 () Bool)

(assert (=> b!644081 (=> (not res!417224) (not e!368988))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!644081 (= res!417224 (and (= lt!298467 (Found!6866 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18426 a!2986) index!984) (select (arr!18426 a!2986) j!136))) (not (= (select (arr!18426 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38425 (_ BitVec 32)) SeekEntryResult!6866)

(assert (=> b!644081 (= lt!298467 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18426 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!644082 () Bool)

(assert (=> b!644082 (= e!368996 e!368989)))

(declare-fun res!417222 () Bool)

(assert (=> b!644082 (=> (not res!417222) (not e!368989))))

(declare-fun lt!298469 () SeekEntryResult!6866)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!644082 (= res!417222 (or (= lt!298469 (MissingZero!6866 i!1108)) (= lt!298469 (MissingVacant!6866 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38425 (_ BitVec 32)) SeekEntryResult!6866)

(assert (=> b!644082 (= lt!298469 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!644083 () Bool)

(declare-fun e!368998 () Bool)

(assert (=> b!644083 (= e!368988 (not e!368998))))

(declare-fun res!417208 () Bool)

(assert (=> b!644083 (=> res!417208 e!368998)))

(declare-fun lt!298474 () SeekEntryResult!6866)

(assert (=> b!644083 (= res!417208 (not (= lt!298474 (Found!6866 index!984))))))

(declare-fun lt!298470 () Unit!21822)

(assert (=> b!644083 (= lt!298470 e!368991)))

(declare-fun c!73802 () Bool)

(assert (=> b!644083 (= c!73802 (= lt!298474 Undefined!6866))))

(declare-fun lt!298471 () (_ BitVec 64))

(assert (=> b!644083 (= lt!298474 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!298471 lt!298472 mask!3053))))

(assert (=> b!644083 e!368987))

(declare-fun res!417219 () Bool)

(assert (=> b!644083 (=> (not res!417219) (not e!368987))))

(declare-fun lt!298466 () (_ BitVec 32))

(assert (=> b!644083 (= res!417219 (= lt!298463 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298466 vacantSpotIndex!68 lt!298471 lt!298472 mask!3053)))))

(assert (=> b!644083 (= lt!298463 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298466 vacantSpotIndex!68 (select (arr!18426 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!644083 (= lt!298471 (select (store (arr!18426 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!298477 () Unit!21822)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38425 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21822)

(assert (=> b!644083 (= lt!298477 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!298466 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!644083 (= lt!298466 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!644084 () Bool)

(declare-fun e!368997 () Unit!21822)

(declare-fun Unit!21826 () Unit!21822)

(assert (=> b!644084 (= e!368997 Unit!21826)))

(declare-fun b!644085 () Bool)

(declare-fun e!368986 () Bool)

(declare-fun e!368990 () Bool)

(assert (=> b!644085 (= e!368986 e!368990)))

(declare-fun res!417206 () Bool)

(assert (=> b!644085 (=> res!417206 e!368990)))

(assert (=> b!644085 (= res!417206 (bvsge index!984 j!136))))

(declare-fun lt!298464 () Unit!21822)

(assert (=> b!644085 (= lt!298464 e!368997)))

(declare-fun c!73801 () Bool)

(assert (=> b!644085 (= c!73801 (bvslt j!136 index!984))))

(declare-fun b!644086 () Bool)

(declare-fun e!368994 () Bool)

(assert (=> b!644086 (= e!368994 e!368995)))

(declare-fun res!417223 () Bool)

(assert (=> b!644086 (=> (not res!417223) (not e!368995))))

(assert (=> b!644086 (= res!417223 (arrayContainsKey!0 lt!298472 (select (arr!18426 a!2986) j!136) j!136))))

(declare-fun b!644087 () Bool)

(assert (=> b!644087 (= e!368998 e!368986)))

(declare-fun res!417213 () Bool)

(assert (=> b!644087 (=> res!417213 e!368986)))

(declare-fun lt!298476 () (_ BitVec 64))

(assert (=> b!644087 (= res!417213 (or (not (= (select (arr!18426 a!2986) j!136) lt!298471)) (not (= (select (arr!18426 a!2986) j!136) lt!298476))))))

(declare-fun e!369000 () Bool)

(assert (=> b!644087 e!369000))

(declare-fun res!417216 () Bool)

(assert (=> b!644087 (=> (not res!417216) (not e!369000))))

(assert (=> b!644087 (= res!417216 (= lt!298476 (select (arr!18426 a!2986) j!136)))))

(assert (=> b!644087 (= lt!298476 (select (store (arr!18426 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!644088 () Bool)

(declare-fun res!417207 () Bool)

(assert (=> b!644088 (=> (not res!417207) (not e!368989))))

(assert (=> b!644088 (= res!417207 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18426 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!644089 () Bool)

(assert (=> b!644089 (= e!368990 (bvsge (bvadd #b00000000000000000000000000000001 index!984) #b00000000000000000000000000000000))))

(assert (=> b!644089 e!368999))

(declare-fun res!417220 () Bool)

(assert (=> b!644089 (=> (not res!417220) (not e!368999))))

(assert (=> b!644089 (= res!417220 (arrayContainsKey!0 lt!298472 (select (arr!18426 a!2986) j!136) j!136))))

(declare-fun b!644090 () Bool)

(declare-fun res!417209 () Bool)

(assert (=> b!644090 (=> (not res!417209) (not e!368996))))

(assert (=> b!644090 (= res!417209 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!644091 () Bool)

(assert (=> b!644091 (= e!368989 e!368992)))

(declare-fun res!417210 () Bool)

(assert (=> b!644091 (=> (not res!417210) (not e!368992))))

(assert (=> b!644091 (= res!417210 (= (select (store (arr!18426 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!644091 (= lt!298472 (array!38426 (store (arr!18426 a!2986) i!1108 k!1786) (size!18790 a!2986)))))

(declare-fun b!644092 () Bool)

(declare-fun res!417211 () Bool)

(assert (=> b!644092 (=> (not res!417211) (not e!368996))))

(assert (=> b!644092 (= res!417211 (validKeyInArray!0 (select (arr!18426 a!2986) j!136)))))

(declare-fun b!644093 () Bool)

(assert (=> b!644093 (= e!369000 e!368994)))

(declare-fun res!417221 () Bool)

(assert (=> b!644093 (=> res!417221 e!368994)))

(assert (=> b!644093 (= res!417221 (or (not (= (select (arr!18426 a!2986) j!136) lt!298471)) (not (= (select (arr!18426 a!2986) j!136) lt!298476)) (bvsge j!136 index!984)))))

(declare-fun b!644094 () Bool)

(declare-fun Unit!21827 () Unit!21822)

(assert (=> b!644094 (= e!368997 Unit!21827)))

(declare-fun lt!298468 () Unit!21822)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38425 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21822)

(assert (=> b!644094 (= lt!298468 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!298472 (select (arr!18426 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!644094 (arrayContainsKey!0 lt!298472 (select (arr!18426 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!298473 () Unit!21822)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38425 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12467) Unit!21822)

(assert (=> b!644094 (= lt!298473 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12464))))

(assert (=> b!644094 (arrayNoDuplicates!0 lt!298472 #b00000000000000000000000000000000 Nil!12464)))

(declare-fun lt!298475 () Unit!21822)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38425 (_ BitVec 32) (_ BitVec 32)) Unit!21822)

(assert (=> b!644094 (= lt!298475 (lemmaNoDuplicateFromThenFromBigger!0 lt!298472 #b00000000000000000000000000000000 j!136))))

(assert (=> b!644094 (arrayNoDuplicates!0 lt!298472 j!136 Nil!12464)))

(declare-fun lt!298465 () Unit!21822)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38425 (_ BitVec 64) (_ BitVec 32) List!12467) Unit!21822)

(assert (=> b!644094 (= lt!298465 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!298472 (select (arr!18426 a!2986) j!136) j!136 Nil!12464))))

(assert (=> b!644094 false))

(declare-fun b!644095 () Bool)

(declare-fun res!417218 () Bool)

(assert (=> b!644095 (=> (not res!417218) (not e!368996))))

(assert (=> b!644095 (= res!417218 (and (= (size!18790 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18790 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18790 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!644096 () Bool)

(declare-fun res!417215 () Bool)

(assert (=> b!644096 (=> (not res!417215) (not e!368989))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38425 (_ BitVec 32)) Bool)

(assert (=> b!644096 (= res!417215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!58328 res!417214) b!644095))

(assert (= (and b!644095 res!417218) b!644092))

(assert (= (and b!644092 res!417211) b!644075))

(assert (= (and b!644075 res!417212) b!644090))

(assert (= (and b!644090 res!417209) b!644082))

(assert (= (and b!644082 res!417222) b!644096))

(assert (= (and b!644096 res!417215) b!644078))

(assert (= (and b!644078 res!417217) b!644088))

(assert (= (and b!644088 res!417207) b!644091))

(assert (= (and b!644091 res!417210) b!644081))

(assert (= (and b!644081 res!417224) b!644083))

(assert (= (and b!644083 res!417219) b!644077))

(assert (= (and b!644083 c!73802) b!644079))

(assert (= (and b!644083 (not c!73802)) b!644080))

(assert (= (and b!644083 (not res!417208)) b!644087))

(assert (= (and b!644087 res!417216) b!644093))

(assert (= (and b!644093 (not res!417221)) b!644086))

(assert (= (and b!644086 res!417223) b!644076))

(assert (= (and b!644087 (not res!417213)) b!644085))

(assert (= (and b!644085 c!73801) b!644094))

(assert (= (and b!644085 (not c!73801)) b!644084))

(assert (= (and b!644085 (not res!417206)) b!644089))

(assert (= (and b!644089 res!417220) b!644074))

(declare-fun m!617729 () Bool)

(assert (=> b!644081 m!617729))

(declare-fun m!617731 () Bool)

(assert (=> b!644081 m!617731))

(assert (=> b!644081 m!617731))

(declare-fun m!617733 () Bool)

(assert (=> b!644081 m!617733))

(assert (=> b!644094 m!617731))

(assert (=> b!644094 m!617731))

(declare-fun m!617735 () Bool)

(assert (=> b!644094 m!617735))

(assert (=> b!644094 m!617731))

(declare-fun m!617737 () Bool)

(assert (=> b!644094 m!617737))

(declare-fun m!617739 () Bool)

(assert (=> b!644094 m!617739))

(assert (=> b!644094 m!617731))

(declare-fun m!617741 () Bool)

(assert (=> b!644094 m!617741))

(declare-fun m!617743 () Bool)

(assert (=> b!644094 m!617743))

(declare-fun m!617745 () Bool)

(assert (=> b!644094 m!617745))

(declare-fun m!617747 () Bool)

(assert (=> b!644094 m!617747))

(assert (=> b!644092 m!617731))

(assert (=> b!644092 m!617731))

(declare-fun m!617749 () Bool)

(assert (=> b!644092 m!617749))

(assert (=> b!644076 m!617731))

(assert (=> b!644076 m!617731))

(declare-fun m!617751 () Bool)

(assert (=> b!644076 m!617751))

(declare-fun m!617753 () Bool)

(assert (=> b!644075 m!617753))

(assert (=> b!644086 m!617731))

(assert (=> b!644086 m!617731))

(declare-fun m!617755 () Bool)

(assert (=> b!644086 m!617755))

(declare-fun m!617757 () Bool)

(assert (=> start!58328 m!617757))

(declare-fun m!617759 () Bool)

(assert (=> start!58328 m!617759))

(assert (=> b!644093 m!617731))

(declare-fun m!617761 () Bool)

(assert (=> b!644091 m!617761))

(declare-fun m!617763 () Bool)

(assert (=> b!644091 m!617763))

(assert (=> b!644089 m!617731))

(assert (=> b!644089 m!617731))

(assert (=> b!644089 m!617755))

(declare-fun m!617765 () Bool)

(assert (=> b!644088 m!617765))

(declare-fun m!617767 () Bool)

(assert (=> b!644078 m!617767))

(declare-fun m!617769 () Bool)

(assert (=> b!644083 m!617769))

(declare-fun m!617771 () Bool)

(assert (=> b!644083 m!617771))

(declare-fun m!617773 () Bool)

(assert (=> b!644083 m!617773))

(assert (=> b!644083 m!617731))

(assert (=> b!644083 m!617731))

(declare-fun m!617775 () Bool)

(assert (=> b!644083 m!617775))

(assert (=> b!644083 m!617761))

(declare-fun m!617777 () Bool)

(assert (=> b!644083 m!617777))

(declare-fun m!617779 () Bool)

(assert (=> b!644083 m!617779))

(declare-fun m!617781 () Bool)

(assert (=> b!644082 m!617781))

(assert (=> b!644074 m!617731))

(assert (=> b!644074 m!617731))

(assert (=> b!644074 m!617751))

(declare-fun m!617783 () Bool)

(assert (=> b!644096 m!617783))

(assert (=> b!644087 m!617731))

(assert (=> b!644087 m!617761))

(declare-fun m!617785 () Bool)

(assert (=> b!644087 m!617785))

(declare-fun m!617787 () Bool)

(assert (=> b!644090 m!617787))

(push 1)

