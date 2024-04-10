; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58538 () Bool)

(assert start!58538)

(declare-fun b!646183 () Bool)

(declare-fun res!418643 () Bool)

(declare-fun e!370388 () Bool)

(assert (=> b!646183 (=> (not res!418643) (not e!370388))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38473 0))(
  ( (array!38474 (arr!18447 (Array (_ BitVec 32) (_ BitVec 64))) (size!18811 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38473)

(assert (=> b!646183 (= res!418643 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18447 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!646184 () Bool)

(declare-fun e!370391 () Bool)

(assert (=> b!646184 (= e!370388 e!370391)))

(declare-fun res!418652 () Bool)

(assert (=> b!646184 (=> (not res!418652) (not e!370391))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!646184 (= res!418652 (= (select (store (arr!18447 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!299742 () array!38473)

(assert (=> b!646184 (= lt!299742 (array!38474 (store (arr!18447 a!2986) i!1108 k!1786) (size!18811 a!2986)))))

(declare-fun b!646185 () Bool)

(declare-fun res!418656 () Bool)

(declare-fun e!370395 () Bool)

(assert (=> b!646185 (=> (not res!418656) (not e!370395))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!646185 (= res!418656 (and (= (size!18811 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18811 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18811 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!646186 () Bool)

(declare-fun e!370381 () Bool)

(declare-fun arrayContainsKey!0 (array!38473 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!646186 (= e!370381 (arrayContainsKey!0 lt!299742 (select (arr!18447 a!2986) j!136) index!984))))

(declare-fun b!646187 () Bool)

(declare-fun e!370390 () Bool)

(assert (=> b!646187 (= e!370390 true)))

(assert (=> b!646187 (arrayContainsKey!0 lt!299742 (select (arr!18447 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-datatypes ((Unit!21948 0))(
  ( (Unit!21949) )
))
(declare-fun lt!299729 () Unit!21948)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38473 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21948)

(assert (=> b!646187 (= lt!299729 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299742 (select (arr!18447 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!370385 () Bool)

(assert (=> b!646187 e!370385))

(declare-fun res!418649 () Bool)

(assert (=> b!646187 (=> (not res!418649) (not e!370385))))

(assert (=> b!646187 (= res!418649 (arrayContainsKey!0 lt!299742 (select (arr!18447 a!2986) j!136) j!136))))

(declare-fun b!646188 () Bool)

(declare-fun e!370393 () Unit!21948)

(declare-fun Unit!21950 () Unit!21948)

(assert (=> b!646188 (= e!370393 Unit!21950)))

(declare-fun b!646189 () Bool)

(declare-fun res!418654 () Bool)

(assert (=> b!646189 (=> (not res!418654) (not e!370388))))

(declare-datatypes ((List!12488 0))(
  ( (Nil!12485) (Cons!12484 (h!13529 (_ BitVec 64)) (t!18716 List!12488)) )
))
(declare-fun arrayNoDuplicates!0 (array!38473 (_ BitVec 32) List!12488) Bool)

(assert (=> b!646189 (= res!418654 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12485))))

(declare-fun b!646190 () Bool)

(declare-fun res!418657 () Bool)

(assert (=> b!646190 (=> (not res!418657) (not e!370395))))

(assert (=> b!646190 (= res!418657 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!646191 () Bool)

(declare-fun e!370394 () Unit!21948)

(declare-fun Unit!21951 () Unit!21948)

(assert (=> b!646191 (= e!370394 Unit!21951)))

(declare-fun lt!299728 () Unit!21948)

(assert (=> b!646191 (= lt!299728 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299742 (select (arr!18447 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!646191 (arrayContainsKey!0 lt!299742 (select (arr!18447 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!299738 () Unit!21948)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38473 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12488) Unit!21948)

(assert (=> b!646191 (= lt!299738 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12485))))

(assert (=> b!646191 (arrayNoDuplicates!0 lt!299742 #b00000000000000000000000000000000 Nil!12485)))

(declare-fun lt!299732 () Unit!21948)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38473 (_ BitVec 32) (_ BitVec 32)) Unit!21948)

(assert (=> b!646191 (= lt!299732 (lemmaNoDuplicateFromThenFromBigger!0 lt!299742 #b00000000000000000000000000000000 j!136))))

(assert (=> b!646191 (arrayNoDuplicates!0 lt!299742 j!136 Nil!12485)))

(declare-fun lt!299737 () Unit!21948)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38473 (_ BitVec 64) (_ BitVec 32) List!12488) Unit!21948)

(assert (=> b!646191 (= lt!299737 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!299742 (select (arr!18447 a!2986) j!136) j!136 Nil!12485))))

(assert (=> b!646191 false))

(declare-fun b!646192 () Bool)

(declare-fun e!370387 () Bool)

(assert (=> b!646192 (= e!370387 e!370381)))

(declare-fun res!418648 () Bool)

(assert (=> b!646192 (=> (not res!418648) (not e!370381))))

(assert (=> b!646192 (= res!418648 (arrayContainsKey!0 lt!299742 (select (arr!18447 a!2986) j!136) j!136))))

(declare-fun b!646193 () Bool)

(assert (=> b!646193 (= e!370395 e!370388)))

(declare-fun res!418655 () Bool)

(assert (=> b!646193 (=> (not res!418655) (not e!370388))))

(declare-datatypes ((SeekEntryResult!6887 0))(
  ( (MissingZero!6887 (index!29886 (_ BitVec 32))) (Found!6887 (index!29887 (_ BitVec 32))) (Intermediate!6887 (undefined!7699 Bool) (index!29888 (_ BitVec 32)) (x!58665 (_ BitVec 32))) (Undefined!6887) (MissingVacant!6887 (index!29889 (_ BitVec 32))) )
))
(declare-fun lt!299743 () SeekEntryResult!6887)

(assert (=> b!646193 (= res!418655 (or (= lt!299743 (MissingZero!6887 i!1108)) (= lt!299743 (MissingVacant!6887 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38473 (_ BitVec 32)) SeekEntryResult!6887)

(assert (=> b!646193 (= lt!299743 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!646194 () Bool)

(declare-fun e!370384 () Bool)

(declare-fun lt!299735 () SeekEntryResult!6887)

(declare-fun lt!299739 () SeekEntryResult!6887)

(assert (=> b!646194 (= e!370384 (= lt!299735 lt!299739))))

(declare-fun b!646195 () Bool)

(assert (=> b!646195 (= e!370385 (arrayContainsKey!0 lt!299742 (select (arr!18447 a!2986) j!136) index!984))))

(declare-fun b!646196 () Bool)

(declare-fun e!370383 () Bool)

(assert (=> b!646196 (= e!370383 e!370387)))

(declare-fun res!418646 () Bool)

(assert (=> b!646196 (=> res!418646 e!370387)))

(declare-fun lt!299734 () (_ BitVec 64))

(declare-fun lt!299730 () (_ BitVec 64))

(assert (=> b!646196 (= res!418646 (or (not (= (select (arr!18447 a!2986) j!136) lt!299734)) (not (= (select (arr!18447 a!2986) j!136) lt!299730)) (bvsge j!136 index!984)))))

(declare-fun b!646197 () Bool)

(declare-fun e!370386 () Bool)

(assert (=> b!646197 (= e!370391 e!370386)))

(declare-fun res!418660 () Bool)

(assert (=> b!646197 (=> (not res!418660) (not e!370386))))

(assert (=> b!646197 (= res!418660 (and (= lt!299735 (Found!6887 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18447 a!2986) index!984) (select (arr!18447 a!2986) j!136))) (not (= (select (arr!18447 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38473 (_ BitVec 32)) SeekEntryResult!6887)

(assert (=> b!646197 (= lt!299735 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18447 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!646198 () Bool)

(declare-fun Unit!21952 () Unit!21948)

(assert (=> b!646198 (= e!370393 Unit!21952)))

(assert (=> b!646198 false))

(declare-fun b!646199 () Bool)

(declare-fun Unit!21953 () Unit!21948)

(assert (=> b!646199 (= e!370394 Unit!21953)))

(declare-fun b!646200 () Bool)

(declare-fun res!418659 () Bool)

(assert (=> b!646200 (=> (not res!418659) (not e!370395))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!646200 (= res!418659 (validKeyInArray!0 k!1786))))

(declare-fun b!646201 () Bool)

(declare-fun e!370382 () Bool)

(assert (=> b!646201 (= e!370386 (not e!370382))))

(declare-fun res!418644 () Bool)

(assert (=> b!646201 (=> res!418644 e!370382)))

(declare-fun lt!299731 () SeekEntryResult!6887)

(assert (=> b!646201 (= res!418644 (not (= lt!299731 (Found!6887 index!984))))))

(declare-fun lt!299741 () Unit!21948)

(assert (=> b!646201 (= lt!299741 e!370393)))

(declare-fun c!74138 () Bool)

(assert (=> b!646201 (= c!74138 (= lt!299731 Undefined!6887))))

(assert (=> b!646201 (= lt!299731 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!299734 lt!299742 mask!3053))))

(assert (=> b!646201 e!370384))

(declare-fun res!418651 () Bool)

(assert (=> b!646201 (=> (not res!418651) (not e!370384))))

(declare-fun lt!299736 () (_ BitVec 32))

(assert (=> b!646201 (= res!418651 (= lt!299739 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299736 vacantSpotIndex!68 lt!299734 lt!299742 mask!3053)))))

(assert (=> b!646201 (= lt!299739 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299736 vacantSpotIndex!68 (select (arr!18447 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!646201 (= lt!299734 (select (store (arr!18447 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!299740 () Unit!21948)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38473 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21948)

(assert (=> b!646201 (= lt!299740 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299736 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!646201 (= lt!299736 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!418653 () Bool)

(assert (=> start!58538 (=> (not res!418653) (not e!370395))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58538 (= res!418653 (validMask!0 mask!3053))))

(assert (=> start!58538 e!370395))

(assert (=> start!58538 true))

(declare-fun array_inv!14243 (array!38473) Bool)

(assert (=> start!58538 (array_inv!14243 a!2986)))

(declare-fun b!646202 () Bool)

(declare-fun res!418645 () Bool)

(assert (=> b!646202 (=> (not res!418645) (not e!370388))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38473 (_ BitVec 32)) Bool)

(assert (=> b!646202 (= res!418645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!646203 () Bool)

(declare-fun e!370392 () Bool)

(assert (=> b!646203 (= e!370382 e!370392)))

(declare-fun res!418647 () Bool)

(assert (=> b!646203 (=> res!418647 e!370392)))

(assert (=> b!646203 (= res!418647 (or (not (= (select (arr!18447 a!2986) j!136) lt!299734)) (not (= (select (arr!18447 a!2986) j!136) lt!299730))))))

(assert (=> b!646203 e!370383))

(declare-fun res!418661 () Bool)

(assert (=> b!646203 (=> (not res!418661) (not e!370383))))

(assert (=> b!646203 (= res!418661 (= lt!299730 (select (arr!18447 a!2986) j!136)))))

(assert (=> b!646203 (= lt!299730 (select (store (arr!18447 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!646204 () Bool)

(declare-fun res!418650 () Bool)

(assert (=> b!646204 (=> (not res!418650) (not e!370395))))

(assert (=> b!646204 (= res!418650 (validKeyInArray!0 (select (arr!18447 a!2986) j!136)))))

(declare-fun b!646205 () Bool)

(assert (=> b!646205 (= e!370392 e!370390)))

(declare-fun res!418658 () Bool)

(assert (=> b!646205 (=> res!418658 e!370390)))

(assert (=> b!646205 (= res!418658 (bvsge index!984 j!136))))

(declare-fun lt!299733 () Unit!21948)

(assert (=> b!646205 (= lt!299733 e!370394)))

(declare-fun c!74137 () Bool)

(assert (=> b!646205 (= c!74137 (bvslt j!136 index!984))))

(assert (= (and start!58538 res!418653) b!646185))

(assert (= (and b!646185 res!418656) b!646204))

(assert (= (and b!646204 res!418650) b!646200))

(assert (= (and b!646200 res!418659) b!646190))

(assert (= (and b!646190 res!418657) b!646193))

(assert (= (and b!646193 res!418655) b!646202))

(assert (= (and b!646202 res!418645) b!646189))

(assert (= (and b!646189 res!418654) b!646183))

(assert (= (and b!646183 res!418643) b!646184))

(assert (= (and b!646184 res!418652) b!646197))

(assert (= (and b!646197 res!418660) b!646201))

(assert (= (and b!646201 res!418651) b!646194))

(assert (= (and b!646201 c!74138) b!646198))

(assert (= (and b!646201 (not c!74138)) b!646188))

(assert (= (and b!646201 (not res!418644)) b!646203))

(assert (= (and b!646203 res!418661) b!646196))

(assert (= (and b!646196 (not res!418646)) b!646192))

(assert (= (and b!646192 res!418648) b!646186))

(assert (= (and b!646203 (not res!418647)) b!646205))

(assert (= (and b!646205 c!74137) b!646191))

(assert (= (and b!646205 (not c!74137)) b!646199))

(assert (= (and b!646205 (not res!418658)) b!646187))

(assert (= (and b!646187 res!418649) b!646195))

(declare-fun m!619667 () Bool)

(assert (=> b!646192 m!619667))

(assert (=> b!646192 m!619667))

(declare-fun m!619669 () Bool)

(assert (=> b!646192 m!619669))

(declare-fun m!619671 () Bool)

(assert (=> b!646189 m!619671))

(declare-fun m!619673 () Bool)

(assert (=> b!646202 m!619673))

(assert (=> b!646195 m!619667))

(assert (=> b!646195 m!619667))

(declare-fun m!619675 () Bool)

(assert (=> b!646195 m!619675))

(declare-fun m!619677 () Bool)

(assert (=> start!58538 m!619677))

(declare-fun m!619679 () Bool)

(assert (=> start!58538 m!619679))

(declare-fun m!619681 () Bool)

(assert (=> b!646184 m!619681))

(declare-fun m!619683 () Bool)

(assert (=> b!646184 m!619683))

(assert (=> b!646204 m!619667))

(assert (=> b!646204 m!619667))

(declare-fun m!619685 () Bool)

(assert (=> b!646204 m!619685))

(declare-fun m!619687 () Bool)

(assert (=> b!646197 m!619687))

(assert (=> b!646197 m!619667))

(assert (=> b!646197 m!619667))

(declare-fun m!619689 () Bool)

(assert (=> b!646197 m!619689))

(declare-fun m!619691 () Bool)

(assert (=> b!646183 m!619691))

(assert (=> b!646186 m!619667))

(assert (=> b!646186 m!619667))

(assert (=> b!646186 m!619675))

(declare-fun m!619693 () Bool)

(assert (=> b!646191 m!619693))

(declare-fun m!619695 () Bool)

(assert (=> b!646191 m!619695))

(assert (=> b!646191 m!619667))

(declare-fun m!619697 () Bool)

(assert (=> b!646191 m!619697))

(assert (=> b!646191 m!619667))

(declare-fun m!619699 () Bool)

(assert (=> b!646191 m!619699))

(assert (=> b!646191 m!619667))

(declare-fun m!619701 () Bool)

(assert (=> b!646191 m!619701))

(assert (=> b!646191 m!619667))

(declare-fun m!619703 () Bool)

(assert (=> b!646191 m!619703))

(declare-fun m!619705 () Bool)

(assert (=> b!646191 m!619705))

(declare-fun m!619707 () Bool)

(assert (=> b!646190 m!619707))

(assert (=> b!646196 m!619667))

(declare-fun m!619709 () Bool)

(assert (=> b!646201 m!619709))

(declare-fun m!619711 () Bool)

(assert (=> b!646201 m!619711))

(declare-fun m!619713 () Bool)

(assert (=> b!646201 m!619713))

(assert (=> b!646201 m!619667))

(assert (=> b!646201 m!619681))

(assert (=> b!646201 m!619667))

(declare-fun m!619715 () Bool)

(assert (=> b!646201 m!619715))

(declare-fun m!619717 () Bool)

(assert (=> b!646201 m!619717))

(declare-fun m!619719 () Bool)

(assert (=> b!646201 m!619719))

(declare-fun m!619721 () Bool)

(assert (=> b!646200 m!619721))

(assert (=> b!646187 m!619667))

(assert (=> b!646187 m!619667))

(declare-fun m!619723 () Bool)

(assert (=> b!646187 m!619723))

(assert (=> b!646187 m!619667))

(declare-fun m!619725 () Bool)

(assert (=> b!646187 m!619725))

(assert (=> b!646187 m!619667))

(assert (=> b!646187 m!619669))

(assert (=> b!646203 m!619667))

(assert (=> b!646203 m!619681))

(declare-fun m!619727 () Bool)

(assert (=> b!646203 m!619727))

(declare-fun m!619729 () Bool)

(assert (=> b!646193 m!619729))

(push 1)

