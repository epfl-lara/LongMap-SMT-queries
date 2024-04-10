; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56116 () Bool)

(assert start!56116)

(declare-fun b!619673 () Bool)

(assert (=> b!619673 false))

(declare-datatypes ((array!37586 0))(
  ( (array!37587 (arr!18039 (Array (_ BitVec 32) (_ BitVec 64))) (size!18403 (_ BitVec 32))) )
))
(declare-fun lt!286108 () array!37586)

(declare-datatypes ((Unit!20518 0))(
  ( (Unit!20519) )
))
(declare-fun lt!286109 () Unit!20518)

(declare-fun a!2986 () array!37586)

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((List!12080 0))(
  ( (Nil!12077) (Cons!12076 (h!13121 (_ BitVec 64)) (t!18308 List!12080)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37586 (_ BitVec 64) (_ BitVec 32) List!12080) Unit!20518)

(assert (=> b!619673 (= lt!286109 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286108 (select (arr!18039 a!2986) j!136) j!136 Nil!12077))))

(declare-fun arrayNoDuplicates!0 (array!37586 (_ BitVec 32) List!12080) Bool)

(assert (=> b!619673 (arrayNoDuplicates!0 lt!286108 j!136 Nil!12077)))

(declare-fun lt!286104 () Unit!20518)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37586 (_ BitVec 32) (_ BitVec 32)) Unit!20518)

(assert (=> b!619673 (= lt!286104 (lemmaNoDuplicateFromThenFromBigger!0 lt!286108 #b00000000000000000000000000000000 j!136))))

(assert (=> b!619673 (arrayNoDuplicates!0 lt!286108 #b00000000000000000000000000000000 Nil!12077)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!286107 () Unit!20518)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37586 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12080) Unit!20518)

(assert (=> b!619673 (= lt!286107 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12077))))

(declare-fun arrayContainsKey!0 (array!37586 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!619673 (arrayContainsKey!0 lt!286108 (select (arr!18039 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!286116 () Unit!20518)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37586 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20518)

(assert (=> b!619673 (= lt!286116 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286108 (select (arr!18039 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!355396 () Unit!20518)

(declare-fun Unit!20520 () Unit!20518)

(assert (=> b!619673 (= e!355396 Unit!20520)))

(declare-fun b!619674 () Bool)

(declare-fun e!355397 () Bool)

(declare-datatypes ((SeekEntryResult!6479 0))(
  ( (MissingZero!6479 (index!28200 (_ BitVec 32))) (Found!6479 (index!28201 (_ BitVec 32))) (Intermediate!6479 (undefined!7291 Bool) (index!28202 (_ BitVec 32)) (x!56983 (_ BitVec 32))) (Undefined!6479) (MissingVacant!6479 (index!28203 (_ BitVec 32))) )
))
(declare-fun lt!286099 () SeekEntryResult!6479)

(declare-fun lt!286112 () SeekEntryResult!6479)

(assert (=> b!619674 (= e!355397 (= lt!286099 lt!286112))))

(declare-fun b!619675 () Bool)

(declare-fun res!399291 () Bool)

(declare-fun e!355400 () Bool)

(assert (=> b!619675 (=> (not res!399291) (not e!355400))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!619675 (= res!399291 (validKeyInArray!0 k!1786))))

(declare-fun b!619676 () Bool)

(declare-fun e!355407 () Bool)

(assert (=> b!619676 (= e!355400 e!355407)))

(declare-fun res!399299 () Bool)

(assert (=> b!619676 (=> (not res!399299) (not e!355407))))

(declare-fun lt!286113 () SeekEntryResult!6479)

(assert (=> b!619676 (= res!399299 (or (= lt!286113 (MissingZero!6479 i!1108)) (= lt!286113 (MissingVacant!6479 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37586 (_ BitVec 32)) SeekEntryResult!6479)

(assert (=> b!619676 (= lt!286113 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!619677 () Bool)

(declare-fun e!355394 () Bool)

(declare-fun e!355393 () Bool)

(assert (=> b!619677 (= e!355394 (not e!355393))))

(declare-fun res!399298 () Bool)

(assert (=> b!619677 (=> res!399298 e!355393)))

(declare-fun lt!286106 () SeekEntryResult!6479)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!619677 (= res!399298 (not (= lt!286106 (MissingVacant!6479 vacantSpotIndex!68))))))

(declare-fun lt!286100 () Unit!20518)

(declare-fun e!355405 () Unit!20518)

(assert (=> b!619677 (= lt!286100 e!355405)))

(declare-fun c!70565 () Bool)

(assert (=> b!619677 (= c!70565 (= lt!286106 (Found!6479 index!984)))))

(declare-fun lt!286114 () Unit!20518)

(declare-fun e!355401 () Unit!20518)

(assert (=> b!619677 (= lt!286114 e!355401)))

(declare-fun c!70563 () Bool)

(assert (=> b!619677 (= c!70563 (= lt!286106 Undefined!6479))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!286103 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37586 (_ BitVec 32)) SeekEntryResult!6479)

(assert (=> b!619677 (= lt!286106 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!286103 lt!286108 mask!3053))))

(assert (=> b!619677 e!355397))

(declare-fun res!399292 () Bool)

(assert (=> b!619677 (=> (not res!399292) (not e!355397))))

(declare-fun lt!286117 () (_ BitVec 32))

(assert (=> b!619677 (= res!399292 (= lt!286112 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286117 vacantSpotIndex!68 lt!286103 lt!286108 mask!3053)))))

(assert (=> b!619677 (= lt!286112 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286117 vacantSpotIndex!68 (select (arr!18039 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!619677 (= lt!286103 (select (store (arr!18039 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!286105 () Unit!20518)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37586 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20518)

(assert (=> b!619677 (= lt!286105 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!286117 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!619677 (= lt!286117 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!619678 () Bool)

(declare-fun res!399284 () Bool)

(assert (=> b!619678 (=> (not res!399284) (not e!355407))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37586 (_ BitVec 32)) Bool)

(assert (=> b!619678 (= res!399284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!619679 () Bool)

(declare-fun res!399294 () Bool)

(assert (=> b!619679 (=> (not res!399294) (not e!355400))))

(assert (=> b!619679 (= res!399294 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!619680 () Bool)

(declare-fun res!399296 () Bool)

(assert (=> b!619680 (=> (not res!399296) (not e!355407))))

(assert (=> b!619680 (= res!399296 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18039 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!619681 () Bool)

(declare-fun Unit!20521 () Unit!20518)

(assert (=> b!619681 (= e!355401 Unit!20521)))

(assert (=> b!619681 false))

(declare-fun b!619682 () Bool)

(declare-fun e!355399 () Bool)

(assert (=> b!619682 (= e!355399 (arrayContainsKey!0 lt!286108 (select (arr!18039 a!2986) j!136) index!984))))

(declare-fun res!399287 () Bool)

(assert (=> start!56116 (=> (not res!399287) (not e!355400))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56116 (= res!399287 (validMask!0 mask!3053))))

(assert (=> start!56116 e!355400))

(assert (=> start!56116 true))

(declare-fun array_inv!13835 (array!37586) Bool)

(assert (=> start!56116 (array_inv!13835 a!2986)))

(declare-fun b!619683 () Bool)

(declare-fun e!355404 () Bool)

(assert (=> b!619683 (= e!355407 e!355404)))

(declare-fun res!399289 () Bool)

(assert (=> b!619683 (=> (not res!399289) (not e!355404))))

(assert (=> b!619683 (= res!399289 (= (select (store (arr!18039 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!619683 (= lt!286108 (array!37587 (store (arr!18039 a!2986) i!1108 k!1786) (size!18403 a!2986)))))

(declare-fun b!619684 () Bool)

(declare-fun res!399286 () Bool)

(assert (=> b!619684 (=> (not res!399286) (not e!355407))))

(assert (=> b!619684 (= res!399286 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12077))))

(declare-fun b!619685 () Bool)

(declare-fun Unit!20522 () Unit!20518)

(assert (=> b!619685 (= e!355401 Unit!20522)))

(declare-fun b!619686 () Bool)

(assert (=> b!619686 (= e!355404 e!355394)))

(declare-fun res!399295 () Bool)

(assert (=> b!619686 (=> (not res!399295) (not e!355394))))

(assert (=> b!619686 (= res!399295 (and (= lt!286099 (Found!6479 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18039 a!2986) index!984) (select (arr!18039 a!2986) j!136))) (not (= (select (arr!18039 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!619686 (= lt!286099 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18039 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!619687 () Bool)

(assert (=> b!619687 false))

(declare-fun lt!286110 () Unit!20518)

(assert (=> b!619687 (= lt!286110 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286108 (select (arr!18039 a!2986) j!136) index!984 Nil!12077))))

(assert (=> b!619687 (arrayNoDuplicates!0 lt!286108 index!984 Nil!12077)))

(declare-fun lt!286111 () Unit!20518)

(assert (=> b!619687 (= lt!286111 (lemmaNoDuplicateFromThenFromBigger!0 lt!286108 #b00000000000000000000000000000000 index!984))))

(assert (=> b!619687 (arrayNoDuplicates!0 lt!286108 #b00000000000000000000000000000000 Nil!12077)))

(declare-fun lt!286098 () Unit!20518)

(assert (=> b!619687 (= lt!286098 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12077))))

(assert (=> b!619687 (arrayContainsKey!0 lt!286108 (select (arr!18039 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!286101 () Unit!20518)

(assert (=> b!619687 (= lt!286101 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286108 (select (arr!18039 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!619687 e!355399))

(declare-fun res!399288 () Bool)

(assert (=> b!619687 (=> (not res!399288) (not e!355399))))

(assert (=> b!619687 (= res!399288 (arrayContainsKey!0 lt!286108 (select (arr!18039 a!2986) j!136) j!136))))

(declare-fun e!355398 () Unit!20518)

(declare-fun Unit!20523 () Unit!20518)

(assert (=> b!619687 (= e!355398 Unit!20523)))

(declare-fun b!619688 () Bool)

(declare-fun Unit!20524 () Unit!20518)

(assert (=> b!619688 (= e!355396 Unit!20524)))

(declare-fun b!619689 () Bool)

(assert (=> b!619689 (= e!355393 true)))

(assert (=> b!619689 (= (select (store (arr!18039 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!619690 () Bool)

(declare-fun Unit!20525 () Unit!20518)

(assert (=> b!619690 (= e!355398 Unit!20525)))

(declare-fun b!619691 () Bool)

(declare-fun Unit!20526 () Unit!20518)

(assert (=> b!619691 (= e!355405 Unit!20526)))

(declare-fun b!619692 () Bool)

(declare-fun res!399290 () Bool)

(assert (=> b!619692 (= res!399290 (bvsge j!136 index!984))))

(declare-fun e!355395 () Bool)

(assert (=> b!619692 (=> res!399290 e!355395)))

(declare-fun e!355402 () Bool)

(assert (=> b!619692 (= e!355402 e!355395)))

(declare-fun b!619693 () Bool)

(declare-fun res!399285 () Bool)

(assert (=> b!619693 (= res!399285 (arrayContainsKey!0 lt!286108 (select (arr!18039 a!2986) j!136) j!136))))

(declare-fun e!355403 () Bool)

(assert (=> b!619693 (=> (not res!399285) (not e!355403))))

(assert (=> b!619693 (= e!355395 e!355403)))

(declare-fun b!619694 () Bool)

(assert (=> b!619694 (= e!355403 (arrayContainsKey!0 lt!286108 (select (arr!18039 a!2986) j!136) index!984))))

(declare-fun b!619695 () Bool)

(declare-fun res!399283 () Bool)

(assert (=> b!619695 (=> (not res!399283) (not e!355400))))

(assert (=> b!619695 (= res!399283 (and (= (size!18403 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18403 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18403 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!619696 () Bool)

(declare-fun res!399293 () Bool)

(assert (=> b!619696 (=> (not res!399293) (not e!355400))))

(assert (=> b!619696 (= res!399293 (validKeyInArray!0 (select (arr!18039 a!2986) j!136)))))

(declare-fun b!619697 () Bool)

(declare-fun Unit!20527 () Unit!20518)

(assert (=> b!619697 (= e!355405 Unit!20527)))

(declare-fun res!399297 () Bool)

(assert (=> b!619697 (= res!399297 (= (select (store (arr!18039 a!2986) i!1108 k!1786) index!984) (select (arr!18039 a!2986) j!136)))))

(assert (=> b!619697 (=> (not res!399297) (not e!355402))))

(assert (=> b!619697 e!355402))

(declare-fun c!70562 () Bool)

(assert (=> b!619697 (= c!70562 (bvslt j!136 index!984))))

(declare-fun lt!286102 () Unit!20518)

(assert (=> b!619697 (= lt!286102 e!355396)))

(declare-fun c!70564 () Bool)

(assert (=> b!619697 (= c!70564 (bvslt index!984 j!136))))

(declare-fun lt!286115 () Unit!20518)

(assert (=> b!619697 (= lt!286115 e!355398)))

(assert (=> b!619697 false))

(assert (= (and start!56116 res!399287) b!619695))

(assert (= (and b!619695 res!399283) b!619696))

(assert (= (and b!619696 res!399293) b!619675))

(assert (= (and b!619675 res!399291) b!619679))

(assert (= (and b!619679 res!399294) b!619676))

(assert (= (and b!619676 res!399299) b!619678))

(assert (= (and b!619678 res!399284) b!619684))

(assert (= (and b!619684 res!399286) b!619680))

(assert (= (and b!619680 res!399296) b!619683))

(assert (= (and b!619683 res!399289) b!619686))

(assert (= (and b!619686 res!399295) b!619677))

(assert (= (and b!619677 res!399292) b!619674))

(assert (= (and b!619677 c!70563) b!619681))

(assert (= (and b!619677 (not c!70563)) b!619685))

(assert (= (and b!619677 c!70565) b!619697))

(assert (= (and b!619677 (not c!70565)) b!619691))

(assert (= (and b!619697 res!399297) b!619692))

(assert (= (and b!619692 (not res!399290)) b!619693))

(assert (= (and b!619693 res!399285) b!619694))

(assert (= (and b!619697 c!70562) b!619673))

(assert (= (and b!619697 (not c!70562)) b!619688))

(assert (= (and b!619697 c!70564) b!619687))

(assert (= (and b!619697 (not c!70564)) b!619690))

(assert (= (and b!619687 res!399288) b!619682))

(assert (= (and b!619677 (not res!399298)) b!619689))

(declare-fun m!595631 () Bool)

(assert (=> b!619680 m!595631))

(declare-fun m!595633 () Bool)

(assert (=> b!619694 m!595633))

(assert (=> b!619694 m!595633))

(declare-fun m!595635 () Bool)

(assert (=> b!619694 m!595635))

(declare-fun m!595637 () Bool)

(assert (=> b!619697 m!595637))

(declare-fun m!595639 () Bool)

(assert (=> b!619697 m!595639))

(assert (=> b!619697 m!595633))

(assert (=> b!619687 m!595633))

(assert (=> b!619687 m!595633))

(declare-fun m!595641 () Bool)

(assert (=> b!619687 m!595641))

(declare-fun m!595643 () Bool)

(assert (=> b!619687 m!595643))

(assert (=> b!619687 m!595633))

(declare-fun m!595645 () Bool)

(assert (=> b!619687 m!595645))

(assert (=> b!619687 m!595633))

(declare-fun m!595647 () Bool)

(assert (=> b!619687 m!595647))

(declare-fun m!595649 () Bool)

(assert (=> b!619687 m!595649))

(declare-fun m!595651 () Bool)

(assert (=> b!619687 m!595651))

(assert (=> b!619687 m!595633))

(declare-fun m!595653 () Bool)

(assert (=> b!619687 m!595653))

(declare-fun m!595655 () Bool)

(assert (=> b!619687 m!595655))

(assert (=> b!619689 m!595637))

(assert (=> b!619689 m!595639))

(declare-fun m!595657 () Bool)

(assert (=> b!619676 m!595657))

(declare-fun m!595659 () Bool)

(assert (=> b!619679 m!595659))

(assert (=> b!619693 m!595633))

(assert (=> b!619693 m!595633))

(assert (=> b!619693 m!595645))

(declare-fun m!595661 () Bool)

(assert (=> b!619677 m!595661))

(declare-fun m!595663 () Bool)

(assert (=> b!619677 m!595663))

(assert (=> b!619677 m!595633))

(assert (=> b!619677 m!595637))

(declare-fun m!595665 () Bool)

(assert (=> b!619677 m!595665))

(declare-fun m!595667 () Bool)

(assert (=> b!619677 m!595667))

(assert (=> b!619677 m!595633))

(declare-fun m!595669 () Bool)

(assert (=> b!619677 m!595669))

(declare-fun m!595671 () Bool)

(assert (=> b!619677 m!595671))

(assert (=> b!619683 m!595637))

(declare-fun m!595673 () Bool)

(assert (=> b!619683 m!595673))

(declare-fun m!595675 () Bool)

(assert (=> b!619673 m!595675))

(assert (=> b!619673 m!595633))

(declare-fun m!595677 () Bool)

(assert (=> b!619673 m!595677))

(declare-fun m!595679 () Bool)

(assert (=> b!619673 m!595679))

(assert (=> b!619673 m!595649))

(assert (=> b!619673 m!595633))

(declare-fun m!595681 () Bool)

(assert (=> b!619673 m!595681))

(assert (=> b!619673 m!595655))

(assert (=> b!619673 m!595633))

(assert (=> b!619673 m!595633))

(declare-fun m!595683 () Bool)

(assert (=> b!619673 m!595683))

(assert (=> b!619696 m!595633))

(assert (=> b!619696 m!595633))

(declare-fun m!595685 () Bool)

(assert (=> b!619696 m!595685))

(declare-fun m!595687 () Bool)

(assert (=> b!619686 m!595687))

(assert (=> b!619686 m!595633))

(assert (=> b!619686 m!595633))

(declare-fun m!595689 () Bool)

(assert (=> b!619686 m!595689))

(declare-fun m!595691 () Bool)

(assert (=> start!56116 m!595691))

(declare-fun m!595693 () Bool)

(assert (=> start!56116 m!595693))

(assert (=> b!619682 m!595633))

(assert (=> b!619682 m!595633))

(assert (=> b!619682 m!595635))

(declare-fun m!595695 () Bool)

(assert (=> b!619678 m!595695))

(declare-fun m!595697 () Bool)

(assert (=> b!619675 m!595697))

(declare-fun m!595699 () Bool)

(assert (=> b!619684 m!595699))

(push 1)

