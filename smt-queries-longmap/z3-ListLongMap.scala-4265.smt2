; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59332 () Bool)

(assert start!59332)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!654525 () Bool)

(declare-datatypes ((array!38652 0))(
  ( (array!38653 (arr!18526 (Array (_ BitVec 32) (_ BitVec 64))) (size!18890 (_ BitVec 32))) )
))
(declare-fun lt!304939 () array!38652)

(declare-fun e!375867 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38652)

(declare-fun arrayContainsKey!0 (array!38652 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!654525 (= e!375867 (arrayContainsKey!0 lt!304939 (select (arr!18526 a!2986) j!136) index!984))))

(declare-fun b!654526 () Bool)

(declare-datatypes ((Unit!22424 0))(
  ( (Unit!22425) )
))
(declare-fun e!375869 () Unit!22424)

(declare-fun Unit!22426 () Unit!22424)

(assert (=> b!654526 (= e!375869 Unit!22426)))

(declare-fun b!654527 () Bool)

(declare-fun e!375865 () Bool)

(declare-fun e!375870 () Bool)

(assert (=> b!654527 (= e!375865 e!375870)))

(declare-fun res!424546 () Bool)

(assert (=> b!654527 (=> res!424546 e!375870)))

(declare-fun lt!304941 () (_ BitVec 64))

(declare-fun lt!304930 () (_ BitVec 64))

(assert (=> b!654527 (= res!424546 (or (not (= (select (arr!18526 a!2986) j!136) lt!304941)) (not (= (select (arr!18526 a!2986) j!136) lt!304930)) (bvsge j!136 index!984)))))

(declare-fun b!654528 () Bool)

(declare-fun e!375871 () Unit!22424)

(declare-fun Unit!22427 () Unit!22424)

(assert (=> b!654528 (= e!375871 Unit!22427)))

(declare-fun lt!304925 () Unit!22424)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38652 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22424)

(assert (=> b!654528 (= lt!304925 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!304939 (select (arr!18526 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!654528 (arrayContainsKey!0 lt!304939 (select (arr!18526 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!304931 () Unit!22424)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((List!12567 0))(
  ( (Nil!12564) (Cons!12563 (h!13608 (_ BitVec 64)) (t!18795 List!12567)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38652 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12567) Unit!22424)

(assert (=> b!654528 (= lt!304931 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12564))))

(declare-fun arrayNoDuplicates!0 (array!38652 (_ BitVec 32) List!12567) Bool)

(assert (=> b!654528 (arrayNoDuplicates!0 lt!304939 #b00000000000000000000000000000000 Nil!12564)))

(declare-fun lt!304926 () Unit!22424)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38652 (_ BitVec 32) (_ BitVec 32)) Unit!22424)

(assert (=> b!654528 (= lt!304926 (lemmaNoDuplicateFromThenFromBigger!0 lt!304939 #b00000000000000000000000000000000 j!136))))

(assert (=> b!654528 (arrayNoDuplicates!0 lt!304939 j!136 Nil!12564)))

(declare-fun lt!304928 () Unit!22424)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38652 (_ BitVec 64) (_ BitVec 32) List!12567) Unit!22424)

(assert (=> b!654528 (= lt!304928 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!304939 (select (arr!18526 a!2986) j!136) j!136 Nil!12564))))

(assert (=> b!654528 false))

(declare-fun b!654529 () Bool)

(declare-fun e!375863 () Unit!22424)

(declare-fun Unit!22428 () Unit!22424)

(assert (=> b!654529 (= e!375863 Unit!22428)))

(assert (=> b!654529 false))

(declare-fun b!654530 () Bool)

(declare-fun res!424544 () Bool)

(declare-fun e!375868 () Bool)

(assert (=> b!654530 (=> (not res!424544) (not e!375868))))

(assert (=> b!654530 (= res!424544 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12564))))

(declare-fun res!424540 () Bool)

(declare-fun e!375864 () Bool)

(assert (=> start!59332 (=> (not res!424540) (not e!375864))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59332 (= res!424540 (validMask!0 mask!3053))))

(assert (=> start!59332 e!375864))

(assert (=> start!59332 true))

(declare-fun array_inv!14322 (array!38652) Bool)

(assert (=> start!59332 (array_inv!14322 a!2986)))

(declare-fun b!654531 () Bool)

(declare-fun res!424542 () Bool)

(assert (=> b!654531 (=> (not res!424542) (not e!375864))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!654531 (= res!424542 (validKeyInArray!0 k0!1786))))

(declare-fun b!654532 () Bool)

(declare-fun e!375875 () Bool)

(assert (=> b!654532 (= e!375875 false)))

(declare-fun lt!304938 () Unit!22424)

(assert (=> b!654532 (= lt!304938 e!375869)))

(declare-fun c!75362 () Bool)

(assert (=> b!654532 (= c!75362 (bvslt index!984 j!136))))

(declare-fun lt!304929 () Unit!22424)

(assert (=> b!654532 (= lt!304929 e!375871)))

(declare-fun c!75361 () Bool)

(assert (=> b!654532 (= c!75361 (bvslt j!136 index!984))))

(declare-fun b!654533 () Bool)

(declare-fun res!424541 () Bool)

(assert (=> b!654533 (=> (not res!424541) (not e!375868))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!654533 (= res!424541 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18526 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!654534 () Bool)

(assert (=> b!654534 (= e!375864 e!375868)))

(declare-fun res!424551 () Bool)

(assert (=> b!654534 (=> (not res!424551) (not e!375868))))

(declare-datatypes ((SeekEntryResult!6966 0))(
  ( (MissingZero!6966 (index!30223 (_ BitVec 32))) (Found!6966 (index!30224 (_ BitVec 32))) (Intermediate!6966 (undefined!7778 Bool) (index!30225 (_ BitVec 32)) (x!59015 (_ BitVec 32))) (Undefined!6966) (MissingVacant!6966 (index!30226 (_ BitVec 32))) )
))
(declare-fun lt!304935 () SeekEntryResult!6966)

(assert (=> b!654534 (= res!424551 (or (= lt!304935 (MissingZero!6966 i!1108)) (= lt!304935 (MissingVacant!6966 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38652 (_ BitVec 32)) SeekEntryResult!6966)

(assert (=> b!654534 (= lt!304935 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!654535 () Bool)

(declare-fun Unit!22429 () Unit!22424)

(assert (=> b!654535 (= e!375863 Unit!22429)))

(declare-fun b!654536 () Bool)

(declare-fun res!424556 () Bool)

(assert (=> b!654536 (=> (not res!424556) (not e!375864))))

(assert (=> b!654536 (= res!424556 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!654537 () Bool)

(declare-fun e!375862 () Bool)

(declare-fun e!375866 () Bool)

(assert (=> b!654537 (= e!375862 e!375866)))

(declare-fun res!424543 () Bool)

(assert (=> b!654537 (=> (not res!424543) (not e!375866))))

(declare-fun lt!304936 () SeekEntryResult!6966)

(assert (=> b!654537 (= res!424543 (and (= lt!304936 (Found!6966 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18526 a!2986) index!984) (select (arr!18526 a!2986) j!136))) (not (= (select (arr!18526 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38652 (_ BitVec 32)) SeekEntryResult!6966)

(assert (=> b!654537 (= lt!304936 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18526 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!654538 () Bool)

(assert (=> b!654538 (= e!375870 e!375867)))

(declare-fun res!424552 () Bool)

(assert (=> b!654538 (=> (not res!424552) (not e!375867))))

(assert (=> b!654538 (= res!424552 (arrayContainsKey!0 lt!304939 (select (arr!18526 a!2986) j!136) j!136))))

(declare-fun e!375872 () Bool)

(declare-fun b!654539 () Bool)

(assert (=> b!654539 (= e!375872 (arrayContainsKey!0 lt!304939 (select (arr!18526 a!2986) j!136) index!984))))

(declare-fun b!654540 () Bool)

(declare-fun e!375873 () Bool)

(declare-fun lt!304932 () SeekEntryResult!6966)

(assert (=> b!654540 (= e!375873 (= lt!304936 lt!304932))))

(declare-fun b!654541 () Bool)

(declare-fun e!375876 () Bool)

(assert (=> b!654541 (= e!375876 e!375875)))

(declare-fun res!424539 () Bool)

(assert (=> b!654541 (=> res!424539 e!375875)))

(assert (=> b!654541 (= res!424539 (or (not (= (select (arr!18526 a!2986) j!136) lt!304941)) (not (= (select (arr!18526 a!2986) j!136) lt!304930))))))

(assert (=> b!654541 e!375865))

(declare-fun res!424554 () Bool)

(assert (=> b!654541 (=> (not res!424554) (not e!375865))))

(assert (=> b!654541 (= res!424554 (= lt!304930 (select (arr!18526 a!2986) j!136)))))

(assert (=> b!654541 (= lt!304930 (select (store (arr!18526 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!654542 () Bool)

(assert (=> b!654542 (= e!375866 (not e!375876))))

(declare-fun res!424548 () Bool)

(assert (=> b!654542 (=> res!424548 e!375876)))

(declare-fun lt!304923 () SeekEntryResult!6966)

(assert (=> b!654542 (= res!424548 (not (= lt!304923 (Found!6966 index!984))))))

(declare-fun lt!304934 () Unit!22424)

(assert (=> b!654542 (= lt!304934 e!375863)))

(declare-fun c!75360 () Bool)

(assert (=> b!654542 (= c!75360 (= lt!304923 Undefined!6966))))

(assert (=> b!654542 (= lt!304923 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!304941 lt!304939 mask!3053))))

(assert (=> b!654542 e!375873))

(declare-fun res!424549 () Bool)

(assert (=> b!654542 (=> (not res!424549) (not e!375873))))

(declare-fun lt!304933 () (_ BitVec 32))

(assert (=> b!654542 (= res!424549 (= lt!304932 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!304933 vacantSpotIndex!68 lt!304941 lt!304939 mask!3053)))))

(assert (=> b!654542 (= lt!304932 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!304933 vacantSpotIndex!68 (select (arr!18526 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!654542 (= lt!304941 (select (store (arr!18526 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!304924 () Unit!22424)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38652 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22424)

(assert (=> b!654542 (= lt!304924 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!304933 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!654542 (= lt!304933 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!654543 () Bool)

(declare-fun res!424545 () Bool)

(assert (=> b!654543 (=> (not res!424545) (not e!375864))))

(assert (=> b!654543 (= res!424545 (and (= (size!18890 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18890 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18890 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!654544 () Bool)

(declare-fun Unit!22430 () Unit!22424)

(assert (=> b!654544 (= e!375871 Unit!22430)))

(declare-fun b!654545 () Bool)

(declare-fun res!424555 () Bool)

(assert (=> b!654545 (=> (not res!424555) (not e!375864))))

(assert (=> b!654545 (= res!424555 (validKeyInArray!0 (select (arr!18526 a!2986) j!136)))))

(declare-fun b!654546 () Bool)

(assert (=> b!654546 (= e!375868 e!375862)))

(declare-fun res!424547 () Bool)

(assert (=> b!654546 (=> (not res!424547) (not e!375862))))

(assert (=> b!654546 (= res!424547 (= (select (store (arr!18526 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!654546 (= lt!304939 (array!38653 (store (arr!18526 a!2986) i!1108 k0!1786) (size!18890 a!2986)))))

(declare-fun b!654547 () Bool)

(declare-fun Unit!22431 () Unit!22424)

(assert (=> b!654547 (= e!375869 Unit!22431)))

(declare-fun res!424550 () Bool)

(assert (=> b!654547 (= res!424550 (arrayContainsKey!0 lt!304939 (select (arr!18526 a!2986) j!136) j!136))))

(assert (=> b!654547 (=> (not res!424550) (not e!375872))))

(assert (=> b!654547 e!375872))

(declare-fun lt!304942 () Unit!22424)

(assert (=> b!654547 (= lt!304942 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!304939 (select (arr!18526 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!654547 (arrayContainsKey!0 lt!304939 (select (arr!18526 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!304937 () Unit!22424)

(assert (=> b!654547 (= lt!304937 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12564))))

(assert (=> b!654547 (arrayNoDuplicates!0 lt!304939 #b00000000000000000000000000000000 Nil!12564)))

(declare-fun lt!304940 () Unit!22424)

(assert (=> b!654547 (= lt!304940 (lemmaNoDuplicateFromThenFromBigger!0 lt!304939 #b00000000000000000000000000000000 index!984))))

(assert (=> b!654547 (arrayNoDuplicates!0 lt!304939 index!984 Nil!12564)))

(declare-fun lt!304927 () Unit!22424)

(assert (=> b!654547 (= lt!304927 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!304939 (select (arr!18526 a!2986) j!136) index!984 Nil!12564))))

(assert (=> b!654547 false))

(declare-fun b!654548 () Bool)

(declare-fun res!424553 () Bool)

(assert (=> b!654548 (=> (not res!424553) (not e!375868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38652 (_ BitVec 32)) Bool)

(assert (=> b!654548 (= res!424553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!59332 res!424540) b!654543))

(assert (= (and b!654543 res!424545) b!654545))

(assert (= (and b!654545 res!424555) b!654531))

(assert (= (and b!654531 res!424542) b!654536))

(assert (= (and b!654536 res!424556) b!654534))

(assert (= (and b!654534 res!424551) b!654548))

(assert (= (and b!654548 res!424553) b!654530))

(assert (= (and b!654530 res!424544) b!654533))

(assert (= (and b!654533 res!424541) b!654546))

(assert (= (and b!654546 res!424547) b!654537))

(assert (= (and b!654537 res!424543) b!654542))

(assert (= (and b!654542 res!424549) b!654540))

(assert (= (and b!654542 c!75360) b!654529))

(assert (= (and b!654542 (not c!75360)) b!654535))

(assert (= (and b!654542 (not res!424548)) b!654541))

(assert (= (and b!654541 res!424554) b!654527))

(assert (= (and b!654527 (not res!424546)) b!654538))

(assert (= (and b!654538 res!424552) b!654525))

(assert (= (and b!654541 (not res!424539)) b!654532))

(assert (= (and b!654532 c!75361) b!654528))

(assert (= (and b!654532 (not c!75361)) b!654544))

(assert (= (and b!654532 c!75362) b!654547))

(assert (= (and b!654532 (not c!75362)) b!654526))

(assert (= (and b!654547 res!424550) b!654539))

(declare-fun m!627627 () Bool)

(assert (=> b!654542 m!627627))

(declare-fun m!627629 () Bool)

(assert (=> b!654542 m!627629))

(declare-fun m!627631 () Bool)

(assert (=> b!654542 m!627631))

(declare-fun m!627633 () Bool)

(assert (=> b!654542 m!627633))

(declare-fun m!627635 () Bool)

(assert (=> b!654542 m!627635))

(assert (=> b!654542 m!627633))

(declare-fun m!627637 () Bool)

(assert (=> b!654542 m!627637))

(declare-fun m!627639 () Bool)

(assert (=> b!654542 m!627639))

(declare-fun m!627641 () Bool)

(assert (=> b!654542 m!627641))

(declare-fun m!627643 () Bool)

(assert (=> b!654548 m!627643))

(assert (=> b!654545 m!627633))

(assert (=> b!654545 m!627633))

(declare-fun m!627645 () Bool)

(assert (=> b!654545 m!627645))

(assert (=> b!654538 m!627633))

(assert (=> b!654538 m!627633))

(declare-fun m!627647 () Bool)

(assert (=> b!654538 m!627647))

(assert (=> b!654546 m!627637))

(declare-fun m!627649 () Bool)

(assert (=> b!654546 m!627649))

(declare-fun m!627651 () Bool)

(assert (=> b!654530 m!627651))

(declare-fun m!627653 () Bool)

(assert (=> b!654534 m!627653))

(assert (=> b!654547 m!627633))

(assert (=> b!654547 m!627633))

(assert (=> b!654547 m!627647))

(declare-fun m!627655 () Bool)

(assert (=> b!654547 m!627655))

(assert (=> b!654547 m!627633))

(declare-fun m!627657 () Bool)

(assert (=> b!654547 m!627657))

(assert (=> b!654547 m!627633))

(declare-fun m!627659 () Bool)

(assert (=> b!654547 m!627659))

(declare-fun m!627661 () Bool)

(assert (=> b!654547 m!627661))

(declare-fun m!627663 () Bool)

(assert (=> b!654547 m!627663))

(assert (=> b!654547 m!627633))

(declare-fun m!627665 () Bool)

(assert (=> b!654547 m!627665))

(declare-fun m!627667 () Bool)

(assert (=> b!654547 m!627667))

(assert (=> b!654541 m!627633))

(assert (=> b!654541 m!627637))

(declare-fun m!627669 () Bool)

(assert (=> b!654541 m!627669))

(declare-fun m!627671 () Bool)

(assert (=> start!59332 m!627671))

(declare-fun m!627673 () Bool)

(assert (=> start!59332 m!627673))

(declare-fun m!627675 () Bool)

(assert (=> b!654531 m!627675))

(declare-fun m!627677 () Bool)

(assert (=> b!654533 m!627677))

(declare-fun m!627679 () Bool)

(assert (=> b!654536 m!627679))

(declare-fun m!627681 () Bool)

(assert (=> b!654537 m!627681))

(assert (=> b!654537 m!627633))

(assert (=> b!654537 m!627633))

(declare-fun m!627683 () Bool)

(assert (=> b!654537 m!627683))

(assert (=> b!654528 m!627633))

(assert (=> b!654528 m!627633))

(declare-fun m!627685 () Bool)

(assert (=> b!654528 m!627685))

(assert (=> b!654528 m!627633))

(declare-fun m!627687 () Bool)

(assert (=> b!654528 m!627687))

(assert (=> b!654528 m!627633))

(declare-fun m!627689 () Bool)

(assert (=> b!654528 m!627689))

(declare-fun m!627691 () Bool)

(assert (=> b!654528 m!627691))

(declare-fun m!627693 () Bool)

(assert (=> b!654528 m!627693))

(assert (=> b!654528 m!627661))

(assert (=> b!654528 m!627663))

(assert (=> b!654525 m!627633))

(assert (=> b!654525 m!627633))

(declare-fun m!627695 () Bool)

(assert (=> b!654525 m!627695))

(assert (=> b!654539 m!627633))

(assert (=> b!654539 m!627633))

(assert (=> b!654539 m!627695))

(assert (=> b!654527 m!627633))

(check-sat (not b!654538) (not b!654536) (not b!654525) (not b!654530) (not b!654548) (not b!654534) (not b!654537) (not start!59332) (not b!654528) (not b!654539) (not b!654542) (not b!654531) (not b!654547) (not b!654545))
(check-sat)
