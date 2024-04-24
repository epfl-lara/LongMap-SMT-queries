; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58080 () Bool)

(assert start!58080)

(declare-fun b!641698 () Bool)

(declare-fun e!367432 () Bool)

(declare-fun e!367440 () Bool)

(assert (=> b!641698 (= e!367432 e!367440)))

(declare-fun res!415569 () Bool)

(assert (=> b!641698 (=> (not res!415569) (not e!367440))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38364 0))(
  ( (array!38365 (arr!18397 (Array (_ BitVec 32) (_ BitVec 64))) (size!18761 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38364)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!641698 (= res!415569 (= (select (store (arr!18397 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!297099 () array!38364)

(assert (=> b!641698 (= lt!297099 (array!38365 (store (arr!18397 a!2986) i!1108 k0!1786) (size!18761 a!2986)))))

(declare-fun b!641699 () Bool)

(declare-fun res!415579 () Bool)

(assert (=> b!641699 (=> (not res!415579) (not e!367432))))

(declare-datatypes ((List!12345 0))(
  ( (Nil!12342) (Cons!12341 (h!13389 (_ BitVec 64)) (t!18565 List!12345)) )
))
(declare-fun arrayNoDuplicates!0 (array!38364 (_ BitVec 32) List!12345) Bool)

(assert (=> b!641699 (= res!415579 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12342))))

(declare-fun b!641700 () Bool)

(declare-fun e!367431 () Bool)

(declare-datatypes ((SeekEntryResult!6793 0))(
  ( (MissingZero!6793 (index!29495 (_ BitVec 32))) (Found!6793 (index!29496 (_ BitVec 32))) (Intermediate!6793 (undefined!7605 Bool) (index!29497 (_ BitVec 32)) (x!58409 (_ BitVec 32))) (Undefined!6793) (MissingVacant!6793 (index!29498 (_ BitVec 32))) )
))
(declare-fun lt!297093 () SeekEntryResult!6793)

(declare-fun lt!297094 () SeekEntryResult!6793)

(assert (=> b!641700 (= e!367431 (= lt!297093 lt!297094))))

(declare-fun res!415582 () Bool)

(declare-fun e!367433 () Bool)

(assert (=> start!58080 (=> (not res!415582) (not e!367433))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58080 (= res!415582 (validMask!0 mask!3053))))

(assert (=> start!58080 e!367433))

(assert (=> start!58080 true))

(declare-fun array_inv!14256 (array!38364) Bool)

(assert (=> start!58080 (array_inv!14256 a!2986)))

(declare-fun b!641701 () Bool)

(declare-fun e!367427 () Bool)

(declare-fun e!367429 () Bool)

(assert (=> b!641701 (= e!367427 e!367429)))

(declare-fun res!415574 () Bool)

(assert (=> b!641701 (=> res!415574 e!367429)))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!641701 (= res!415574 (or (bvsge (size!18761 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18761 a!2986))))))

(assert (=> b!641701 (arrayNoDuplicates!0 lt!297099 j!136 Nil!12342)))

(declare-datatypes ((Unit!21681 0))(
  ( (Unit!21682) )
))
(declare-fun lt!297101 () Unit!21681)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38364 (_ BitVec 32) (_ BitVec 32)) Unit!21681)

(assert (=> b!641701 (= lt!297101 (lemmaNoDuplicateFromThenFromBigger!0 lt!297099 #b00000000000000000000000000000000 j!136))))

(assert (=> b!641701 (arrayNoDuplicates!0 lt!297099 #b00000000000000000000000000000000 Nil!12342)))

(declare-fun lt!297102 () Unit!21681)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38364 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12345) Unit!21681)

(assert (=> b!641701 (= lt!297102 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12342))))

(declare-fun arrayContainsKey!0 (array!38364 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!641701 (arrayContainsKey!0 lt!297099 (select (arr!18397 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!297095 () Unit!21681)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38364 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21681)

(assert (=> b!641701 (= lt!297095 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!297099 (select (arr!18397 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!641702 () Bool)

(declare-fun e!367434 () Bool)

(declare-fun contains!3110 (List!12345 (_ BitVec 64)) Bool)

(assert (=> b!641702 (= e!367434 (not (contains!3110 Nil!12342 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!641703 () Bool)

(declare-fun e!367438 () Bool)

(declare-fun e!367437 () Bool)

(assert (=> b!641703 (= e!367438 (not e!367437))))

(declare-fun res!415575 () Bool)

(assert (=> b!641703 (=> res!415575 e!367437)))

(declare-fun lt!297096 () SeekEntryResult!6793)

(assert (=> b!641703 (= res!415575 (not (= lt!297096 (Found!6793 index!984))))))

(declare-fun lt!297092 () Unit!21681)

(declare-fun e!367435 () Unit!21681)

(assert (=> b!641703 (= lt!297092 e!367435)))

(declare-fun c!73433 () Bool)

(assert (=> b!641703 (= c!73433 (= lt!297096 Undefined!6793))))

(declare-fun lt!297100 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38364 (_ BitVec 32)) SeekEntryResult!6793)

(assert (=> b!641703 (= lt!297096 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!297100 lt!297099 mask!3053))))

(assert (=> b!641703 e!367431))

(declare-fun res!415588 () Bool)

(assert (=> b!641703 (=> (not res!415588) (not e!367431))))

(declare-fun lt!297091 () (_ BitVec 32))

(assert (=> b!641703 (= res!415588 (= lt!297094 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297091 vacantSpotIndex!68 lt!297100 lt!297099 mask!3053)))))

(assert (=> b!641703 (= lt!297094 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297091 vacantSpotIndex!68 (select (arr!18397 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!641703 (= lt!297100 (select (store (arr!18397 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!297098 () Unit!21681)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38364 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21681)

(assert (=> b!641703 (= lt!297098 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297091 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!641703 (= lt!297091 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!641704 () Bool)

(declare-fun res!415587 () Bool)

(assert (=> b!641704 (=> (not res!415587) (not e!367433))))

(assert (=> b!641704 (= res!415587 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!641705 () Bool)

(declare-fun Unit!21683 () Unit!21681)

(assert (=> b!641705 (= e!367435 Unit!21683)))

(declare-fun b!641706 () Bool)

(assert (=> b!641706 (= e!367429 e!367434)))

(declare-fun res!415581 () Bool)

(assert (=> b!641706 (=> (not res!415581) (not e!367434))))

(assert (=> b!641706 (= res!415581 (not (contains!3110 Nil!12342 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!641707 () Bool)

(declare-fun res!415578 () Bool)

(assert (=> b!641707 (=> (not res!415578) (not e!367433))))

(assert (=> b!641707 (= res!415578 (and (= (size!18761 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18761 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18761 a!2986)) (not (= i!1108 j!136))))))

(declare-fun e!367430 () Bool)

(declare-fun b!641708 () Bool)

(assert (=> b!641708 (= e!367430 (arrayContainsKey!0 lt!297099 (select (arr!18397 a!2986) j!136) index!984))))

(declare-fun b!641709 () Bool)

(declare-fun res!415586 () Bool)

(assert (=> b!641709 (=> res!415586 e!367429)))

(declare-fun noDuplicate!406 (List!12345) Bool)

(assert (=> b!641709 (= res!415586 (not (noDuplicate!406 Nil!12342)))))

(declare-fun b!641710 () Bool)

(declare-fun res!415580 () Bool)

(assert (=> b!641710 (=> (not res!415580) (not e!367433))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!641710 (= res!415580 (validKeyInArray!0 k0!1786))))

(declare-fun b!641711 () Bool)

(assert (=> b!641711 (= e!367433 e!367432)))

(declare-fun res!415584 () Bool)

(assert (=> b!641711 (=> (not res!415584) (not e!367432))))

(declare-fun lt!297103 () SeekEntryResult!6793)

(assert (=> b!641711 (= res!415584 (or (= lt!297103 (MissingZero!6793 i!1108)) (= lt!297103 (MissingVacant!6793 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38364 (_ BitVec 32)) SeekEntryResult!6793)

(assert (=> b!641711 (= lt!297103 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!641712 () Bool)

(declare-fun res!415585 () Bool)

(assert (=> b!641712 (=> (not res!415585) (not e!367433))))

(assert (=> b!641712 (= res!415585 (validKeyInArray!0 (select (arr!18397 a!2986) j!136)))))

(declare-fun b!641713 () Bool)

(assert (=> b!641713 (= e!367437 e!367427)))

(declare-fun res!415572 () Bool)

(assert (=> b!641713 (=> res!415572 e!367427)))

(declare-fun lt!297097 () (_ BitVec 64))

(assert (=> b!641713 (= res!415572 (or (not (= (select (arr!18397 a!2986) j!136) lt!297100)) (not (= (select (arr!18397 a!2986) j!136) lt!297097)) (bvsge j!136 index!984)))))

(declare-fun e!367436 () Bool)

(assert (=> b!641713 e!367436))

(declare-fun res!415571 () Bool)

(assert (=> b!641713 (=> (not res!415571) (not e!367436))))

(assert (=> b!641713 (= res!415571 (= lt!297097 (select (arr!18397 a!2986) j!136)))))

(assert (=> b!641713 (= lt!297097 (select (store (arr!18397 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!641714 () Bool)

(declare-fun e!367428 () Bool)

(assert (=> b!641714 (= e!367428 e!367430)))

(declare-fun res!415573 () Bool)

(assert (=> b!641714 (=> (not res!415573) (not e!367430))))

(assert (=> b!641714 (= res!415573 (arrayContainsKey!0 lt!297099 (select (arr!18397 a!2986) j!136) j!136))))

(declare-fun b!641715 () Bool)

(declare-fun res!415576 () Bool)

(assert (=> b!641715 (=> (not res!415576) (not e!367432))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38364 (_ BitVec 32)) Bool)

(assert (=> b!641715 (= res!415576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!641716 () Bool)

(declare-fun res!415577 () Bool)

(assert (=> b!641716 (=> (not res!415577) (not e!367432))))

(assert (=> b!641716 (= res!415577 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18397 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!641717 () Bool)

(assert (=> b!641717 (= e!367436 e!367428)))

(declare-fun res!415570 () Bool)

(assert (=> b!641717 (=> res!415570 e!367428)))

(assert (=> b!641717 (= res!415570 (or (not (= (select (arr!18397 a!2986) j!136) lt!297100)) (not (= (select (arr!18397 a!2986) j!136) lt!297097)) (bvsge j!136 index!984)))))

(declare-fun b!641718 () Bool)

(assert (=> b!641718 (= e!367440 e!367438)))

(declare-fun res!415583 () Bool)

(assert (=> b!641718 (=> (not res!415583) (not e!367438))))

(assert (=> b!641718 (= res!415583 (and (= lt!297093 (Found!6793 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18397 a!2986) index!984) (select (arr!18397 a!2986) j!136))) (not (= (select (arr!18397 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!641718 (= lt!297093 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18397 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!641719 () Bool)

(declare-fun Unit!21684 () Unit!21681)

(assert (=> b!641719 (= e!367435 Unit!21684)))

(assert (=> b!641719 false))

(assert (= (and start!58080 res!415582) b!641707))

(assert (= (and b!641707 res!415578) b!641712))

(assert (= (and b!641712 res!415585) b!641710))

(assert (= (and b!641710 res!415580) b!641704))

(assert (= (and b!641704 res!415587) b!641711))

(assert (= (and b!641711 res!415584) b!641715))

(assert (= (and b!641715 res!415576) b!641699))

(assert (= (and b!641699 res!415579) b!641716))

(assert (= (and b!641716 res!415577) b!641698))

(assert (= (and b!641698 res!415569) b!641718))

(assert (= (and b!641718 res!415583) b!641703))

(assert (= (and b!641703 res!415588) b!641700))

(assert (= (and b!641703 c!73433) b!641719))

(assert (= (and b!641703 (not c!73433)) b!641705))

(assert (= (and b!641703 (not res!415575)) b!641713))

(assert (= (and b!641713 res!415571) b!641717))

(assert (= (and b!641717 (not res!415570)) b!641714))

(assert (= (and b!641714 res!415573) b!641708))

(assert (= (and b!641713 (not res!415572)) b!641701))

(assert (= (and b!641701 (not res!415574)) b!641709))

(assert (= (and b!641709 (not res!415586)) b!641706))

(assert (= (and b!641706 res!415581) b!641702))

(declare-fun m!615889 () Bool)

(assert (=> start!58080 m!615889))

(declare-fun m!615891 () Bool)

(assert (=> start!58080 m!615891))

(declare-fun m!615893 () Bool)

(assert (=> b!641704 m!615893))

(declare-fun m!615895 () Bool)

(assert (=> b!641708 m!615895))

(assert (=> b!641708 m!615895))

(declare-fun m!615897 () Bool)

(assert (=> b!641708 m!615897))

(declare-fun m!615899 () Bool)

(assert (=> b!641703 m!615899))

(declare-fun m!615901 () Bool)

(assert (=> b!641703 m!615901))

(assert (=> b!641703 m!615895))

(declare-fun m!615903 () Bool)

(assert (=> b!641703 m!615903))

(assert (=> b!641703 m!615895))

(declare-fun m!615905 () Bool)

(assert (=> b!641703 m!615905))

(declare-fun m!615907 () Bool)

(assert (=> b!641703 m!615907))

(declare-fun m!615909 () Bool)

(assert (=> b!641703 m!615909))

(declare-fun m!615911 () Bool)

(assert (=> b!641703 m!615911))

(assert (=> b!641713 m!615895))

(assert (=> b!641713 m!615909))

(declare-fun m!615913 () Bool)

(assert (=> b!641713 m!615913))

(assert (=> b!641717 m!615895))

(declare-fun m!615915 () Bool)

(assert (=> b!641710 m!615915))

(declare-fun m!615917 () Bool)

(assert (=> b!641716 m!615917))

(declare-fun m!615919 () Bool)

(assert (=> b!641706 m!615919))

(declare-fun m!615921 () Bool)

(assert (=> b!641709 m!615921))

(assert (=> b!641698 m!615909))

(declare-fun m!615923 () Bool)

(assert (=> b!641698 m!615923))

(assert (=> b!641712 m!615895))

(assert (=> b!641712 m!615895))

(declare-fun m!615925 () Bool)

(assert (=> b!641712 m!615925))

(declare-fun m!615927 () Bool)

(assert (=> b!641701 m!615927))

(assert (=> b!641701 m!615895))

(declare-fun m!615929 () Bool)

(assert (=> b!641701 m!615929))

(assert (=> b!641701 m!615895))

(declare-fun m!615931 () Bool)

(assert (=> b!641701 m!615931))

(assert (=> b!641701 m!615895))

(declare-fun m!615933 () Bool)

(assert (=> b!641701 m!615933))

(declare-fun m!615935 () Bool)

(assert (=> b!641701 m!615935))

(declare-fun m!615937 () Bool)

(assert (=> b!641701 m!615937))

(declare-fun m!615939 () Bool)

(assert (=> b!641702 m!615939))

(declare-fun m!615941 () Bool)

(assert (=> b!641699 m!615941))

(declare-fun m!615943 () Bool)

(assert (=> b!641711 m!615943))

(assert (=> b!641714 m!615895))

(assert (=> b!641714 m!615895))

(declare-fun m!615945 () Bool)

(assert (=> b!641714 m!615945))

(declare-fun m!615947 () Bool)

(assert (=> b!641718 m!615947))

(assert (=> b!641718 m!615895))

(assert (=> b!641718 m!615895))

(declare-fun m!615949 () Bool)

(assert (=> b!641718 m!615949))

(declare-fun m!615951 () Bool)

(assert (=> b!641715 m!615951))

(check-sat (not b!641702) (not b!641706) (not b!641718) (not start!58080) (not b!641699) (not b!641704) (not b!641709) (not b!641712) (not b!641711) (not b!641703) (not b!641701) (not b!641715) (not b!641710) (not b!641708) (not b!641714))
(check-sat)
(get-model)

(declare-fun b!641862 () Bool)

(declare-fun e!367535 () Bool)

(declare-fun e!367533 () Bool)

(assert (=> b!641862 (= e!367535 e!367533)))

(declare-fun c!73442 () Bool)

(assert (=> b!641862 (= c!73442 (validKeyInArray!0 (select (arr!18397 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!641863 () Bool)

(declare-fun e!367536 () Bool)

(assert (=> b!641863 (= e!367536 (contains!3110 Nil!12342 (select (arr!18397 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!90747 () Bool)

(declare-fun res!415715 () Bool)

(declare-fun e!367534 () Bool)

(assert (=> d!90747 (=> res!415715 e!367534)))

(assert (=> d!90747 (= res!415715 (bvsge #b00000000000000000000000000000000 (size!18761 a!2986)))))

(assert (=> d!90747 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12342) e!367534)))

(declare-fun b!641864 () Bool)

(declare-fun call!33546 () Bool)

(assert (=> b!641864 (= e!367533 call!33546)))

(declare-fun b!641865 () Bool)

(assert (=> b!641865 (= e!367534 e!367535)))

(declare-fun res!415716 () Bool)

(assert (=> b!641865 (=> (not res!415716) (not e!367535))))

(assert (=> b!641865 (= res!415716 (not e!367536))))

(declare-fun res!415717 () Bool)

(assert (=> b!641865 (=> (not res!415717) (not e!367536))))

(assert (=> b!641865 (= res!415717 (validKeyInArray!0 (select (arr!18397 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!641866 () Bool)

(assert (=> b!641866 (= e!367533 call!33546)))

(declare-fun bm!33543 () Bool)

(assert (=> bm!33543 (= call!33546 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73442 (Cons!12341 (select (arr!18397 a!2986) #b00000000000000000000000000000000) Nil!12342) Nil!12342)))))

(assert (= (and d!90747 (not res!415715)) b!641865))

(assert (= (and b!641865 res!415717) b!641863))

(assert (= (and b!641865 res!415716) b!641862))

(assert (= (and b!641862 c!73442) b!641866))

(assert (= (and b!641862 (not c!73442)) b!641864))

(assert (= (or b!641866 b!641864) bm!33543))

(declare-fun m!616081 () Bool)

(assert (=> b!641862 m!616081))

(assert (=> b!641862 m!616081))

(declare-fun m!616083 () Bool)

(assert (=> b!641862 m!616083))

(assert (=> b!641863 m!616081))

(assert (=> b!641863 m!616081))

(declare-fun m!616085 () Bool)

(assert (=> b!641863 m!616085))

(assert (=> b!641865 m!616081))

(assert (=> b!641865 m!616081))

(assert (=> b!641865 m!616083))

(assert (=> bm!33543 m!616081))

(declare-fun m!616087 () Bool)

(assert (=> bm!33543 m!616087))

(assert (=> b!641699 d!90747))

(declare-fun d!90749 () Bool)

(declare-fun res!415722 () Bool)

(declare-fun e!367541 () Bool)

(assert (=> d!90749 (=> res!415722 e!367541)))

(get-info :version)

(assert (=> d!90749 (= res!415722 ((_ is Nil!12342) Nil!12342))))

(assert (=> d!90749 (= (noDuplicate!406 Nil!12342) e!367541)))

(declare-fun b!641871 () Bool)

(declare-fun e!367542 () Bool)

(assert (=> b!641871 (= e!367541 e!367542)))

(declare-fun res!415723 () Bool)

(assert (=> b!641871 (=> (not res!415723) (not e!367542))))

(assert (=> b!641871 (= res!415723 (not (contains!3110 (t!18565 Nil!12342) (h!13389 Nil!12342))))))

(declare-fun b!641872 () Bool)

(assert (=> b!641872 (= e!367542 (noDuplicate!406 (t!18565 Nil!12342)))))

(assert (= (and d!90749 (not res!415722)) b!641871))

(assert (= (and b!641871 res!415723) b!641872))

(declare-fun m!616089 () Bool)

(assert (=> b!641871 m!616089))

(declare-fun m!616091 () Bool)

(assert (=> b!641872 m!616091))

(assert (=> b!641709 d!90749))

(declare-fun d!90751 () Bool)

(declare-fun lt!297188 () SeekEntryResult!6793)

(assert (=> d!90751 (and (or ((_ is Undefined!6793) lt!297188) (not ((_ is Found!6793) lt!297188)) (and (bvsge (index!29496 lt!297188) #b00000000000000000000000000000000) (bvslt (index!29496 lt!297188) (size!18761 a!2986)))) (or ((_ is Undefined!6793) lt!297188) ((_ is Found!6793) lt!297188) (not ((_ is MissingZero!6793) lt!297188)) (and (bvsge (index!29495 lt!297188) #b00000000000000000000000000000000) (bvslt (index!29495 lt!297188) (size!18761 a!2986)))) (or ((_ is Undefined!6793) lt!297188) ((_ is Found!6793) lt!297188) ((_ is MissingZero!6793) lt!297188) (not ((_ is MissingVacant!6793) lt!297188)) (and (bvsge (index!29498 lt!297188) #b00000000000000000000000000000000) (bvslt (index!29498 lt!297188) (size!18761 a!2986)))) (or ((_ is Undefined!6793) lt!297188) (ite ((_ is Found!6793) lt!297188) (= (select (arr!18397 a!2986) (index!29496 lt!297188)) k0!1786) (ite ((_ is MissingZero!6793) lt!297188) (= (select (arr!18397 a!2986) (index!29495 lt!297188)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6793) lt!297188) (= (select (arr!18397 a!2986) (index!29498 lt!297188)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!367549 () SeekEntryResult!6793)

(assert (=> d!90751 (= lt!297188 e!367549)))

(declare-fun c!73450 () Bool)

(declare-fun lt!297190 () SeekEntryResult!6793)

(assert (=> d!90751 (= c!73450 (and ((_ is Intermediate!6793) lt!297190) (undefined!7605 lt!297190)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38364 (_ BitVec 32)) SeekEntryResult!6793)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90751 (= lt!297190 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!90751 (validMask!0 mask!3053)))

(assert (=> d!90751 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!297188)))

(declare-fun b!641885 () Bool)

(declare-fun e!367550 () SeekEntryResult!6793)

(assert (=> b!641885 (= e!367550 (MissingZero!6793 (index!29497 lt!297190)))))

(declare-fun b!641886 () Bool)

(declare-fun e!367551 () SeekEntryResult!6793)

(assert (=> b!641886 (= e!367551 (Found!6793 (index!29497 lt!297190)))))

(declare-fun b!641887 () Bool)

(assert (=> b!641887 (= e!367549 Undefined!6793)))

(declare-fun b!641888 () Bool)

(assert (=> b!641888 (= e!367550 (seekKeyOrZeroReturnVacant!0 (x!58409 lt!297190) (index!29497 lt!297190) (index!29497 lt!297190) k0!1786 a!2986 mask!3053))))

(declare-fun b!641889 () Bool)

(assert (=> b!641889 (= e!367549 e!367551)))

(declare-fun lt!297189 () (_ BitVec 64))

(assert (=> b!641889 (= lt!297189 (select (arr!18397 a!2986) (index!29497 lt!297190)))))

(declare-fun c!73451 () Bool)

(assert (=> b!641889 (= c!73451 (= lt!297189 k0!1786))))

(declare-fun b!641890 () Bool)

(declare-fun c!73449 () Bool)

(assert (=> b!641890 (= c!73449 (= lt!297189 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!641890 (= e!367551 e!367550)))

(assert (= (and d!90751 c!73450) b!641887))

(assert (= (and d!90751 (not c!73450)) b!641889))

(assert (= (and b!641889 c!73451) b!641886))

(assert (= (and b!641889 (not c!73451)) b!641890))

(assert (= (and b!641890 c!73449) b!641885))

(assert (= (and b!641890 (not c!73449)) b!641888))

(declare-fun m!616093 () Bool)

(assert (=> d!90751 m!616093))

(assert (=> d!90751 m!615889))

(declare-fun m!616095 () Bool)

(assert (=> d!90751 m!616095))

(declare-fun m!616097 () Bool)

(assert (=> d!90751 m!616097))

(assert (=> d!90751 m!616093))

(declare-fun m!616099 () Bool)

(assert (=> d!90751 m!616099))

(declare-fun m!616101 () Bool)

(assert (=> d!90751 m!616101))

(declare-fun m!616103 () Bool)

(assert (=> b!641888 m!616103))

(declare-fun m!616105 () Bool)

(assert (=> b!641889 m!616105))

(assert (=> b!641711 d!90751))

(declare-fun d!90755 () Bool)

(assert (=> d!90755 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!641710 d!90755))

(declare-fun d!90757 () Bool)

(assert (=> d!90757 (= (validKeyInArray!0 (select (arr!18397 a!2986) j!136)) (and (not (= (select (arr!18397 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18397 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!641712 d!90757))

(declare-fun d!90759 () Bool)

(declare-fun res!415737 () Bool)

(declare-fun e!367568 () Bool)

(assert (=> d!90759 (=> res!415737 e!367568)))

(assert (=> d!90759 (= res!415737 (= (select (arr!18397 lt!297099) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18397 a!2986) j!136)))))

(assert (=> d!90759 (= (arrayContainsKey!0 lt!297099 (select (arr!18397 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!367568)))

(declare-fun b!641910 () Bool)

(declare-fun e!367569 () Bool)

(assert (=> b!641910 (= e!367568 e!367569)))

(declare-fun res!415738 () Bool)

(assert (=> b!641910 (=> (not res!415738) (not e!367569))))

(assert (=> b!641910 (= res!415738 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18761 lt!297099)))))

(declare-fun b!641911 () Bool)

(assert (=> b!641911 (= e!367569 (arrayContainsKey!0 lt!297099 (select (arr!18397 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90759 (not res!415737)) b!641910))

(assert (= (and b!641910 res!415738) b!641911))

(declare-fun m!616115 () Bool)

(assert (=> d!90759 m!616115))

(assert (=> b!641911 m!615895))

(declare-fun m!616117 () Bool)

(assert (=> b!641911 m!616117))

(assert (=> b!641701 d!90759))

(declare-fun d!90763 () Bool)

(assert (=> d!90763 (arrayNoDuplicates!0 lt!297099 j!136 Nil!12342)))

(declare-fun lt!297195 () Unit!21681)

(declare-fun choose!39 (array!38364 (_ BitVec 32) (_ BitVec 32)) Unit!21681)

(assert (=> d!90763 (= lt!297195 (choose!39 lt!297099 #b00000000000000000000000000000000 j!136))))

(assert (=> d!90763 (bvslt (size!18761 lt!297099) #b01111111111111111111111111111111)))

(assert (=> d!90763 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!297099 #b00000000000000000000000000000000 j!136) lt!297195)))

(declare-fun bs!19226 () Bool)

(assert (= bs!19226 d!90763))

(assert (=> bs!19226 m!615931))

(declare-fun m!616121 () Bool)

(assert (=> bs!19226 m!616121))

(assert (=> b!641701 d!90763))

(declare-fun d!90767 () Bool)

(assert (=> d!90767 (arrayContainsKey!0 lt!297099 (select (arr!18397 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!297199 () Unit!21681)

(declare-fun choose!114 (array!38364 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21681)

(assert (=> d!90767 (= lt!297199 (choose!114 lt!297099 (select (arr!18397 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!90767 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!90767 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!297099 (select (arr!18397 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!297199)))

(declare-fun bs!19227 () Bool)

(assert (= bs!19227 d!90767))

(assert (=> bs!19227 m!615895))

(assert (=> bs!19227 m!615933))

(assert (=> bs!19227 m!615895))

(declare-fun m!616129 () Bool)

(assert (=> bs!19227 m!616129))

(assert (=> b!641701 d!90767))

(declare-fun d!90771 () Bool)

(declare-fun e!367584 () Bool)

(assert (=> d!90771 e!367584))

(declare-fun res!415753 () Bool)

(assert (=> d!90771 (=> (not res!415753) (not e!367584))))

(assert (=> d!90771 (= res!415753 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18761 a!2986))))))

(declare-fun lt!297202 () Unit!21681)

(declare-fun choose!41 (array!38364 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12345) Unit!21681)

(assert (=> d!90771 (= lt!297202 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12342))))

(assert (=> d!90771 (bvslt (size!18761 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!90771 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12342) lt!297202)))

(declare-fun b!641926 () Bool)

(assert (=> b!641926 (= e!367584 (arrayNoDuplicates!0 (array!38365 (store (arr!18397 a!2986) i!1108 k0!1786) (size!18761 a!2986)) #b00000000000000000000000000000000 Nil!12342))))

(assert (= (and d!90771 res!415753) b!641926))

(declare-fun m!616131 () Bool)

(assert (=> d!90771 m!616131))

(assert (=> b!641926 m!615909))

(declare-fun m!616133 () Bool)

(assert (=> b!641926 m!616133))

(assert (=> b!641701 d!90771))

(declare-fun b!641927 () Bool)

(declare-fun e!367587 () Bool)

(declare-fun e!367585 () Bool)

(assert (=> b!641927 (= e!367587 e!367585)))

(declare-fun c!73455 () Bool)

(assert (=> b!641927 (= c!73455 (validKeyInArray!0 (select (arr!18397 lt!297099) #b00000000000000000000000000000000)))))

(declare-fun b!641928 () Bool)

(declare-fun e!367588 () Bool)

(assert (=> b!641928 (= e!367588 (contains!3110 Nil!12342 (select (arr!18397 lt!297099) #b00000000000000000000000000000000)))))

(declare-fun d!90773 () Bool)

(declare-fun res!415754 () Bool)

(declare-fun e!367586 () Bool)

(assert (=> d!90773 (=> res!415754 e!367586)))

(assert (=> d!90773 (= res!415754 (bvsge #b00000000000000000000000000000000 (size!18761 lt!297099)))))

(assert (=> d!90773 (= (arrayNoDuplicates!0 lt!297099 #b00000000000000000000000000000000 Nil!12342) e!367586)))

(declare-fun b!641929 () Bool)

(declare-fun call!33550 () Bool)

(assert (=> b!641929 (= e!367585 call!33550)))

(declare-fun b!641930 () Bool)

(assert (=> b!641930 (= e!367586 e!367587)))

(declare-fun res!415755 () Bool)

(assert (=> b!641930 (=> (not res!415755) (not e!367587))))

(assert (=> b!641930 (= res!415755 (not e!367588))))

(declare-fun res!415756 () Bool)

(assert (=> b!641930 (=> (not res!415756) (not e!367588))))

(assert (=> b!641930 (= res!415756 (validKeyInArray!0 (select (arr!18397 lt!297099) #b00000000000000000000000000000000)))))

(declare-fun b!641931 () Bool)

(assert (=> b!641931 (= e!367585 call!33550)))

(declare-fun bm!33547 () Bool)

(assert (=> bm!33547 (= call!33550 (arrayNoDuplicates!0 lt!297099 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73455 (Cons!12341 (select (arr!18397 lt!297099) #b00000000000000000000000000000000) Nil!12342) Nil!12342)))))

(assert (= (and d!90773 (not res!415754)) b!641930))

(assert (= (and b!641930 res!415756) b!641928))

(assert (= (and b!641930 res!415755) b!641927))

(assert (= (and b!641927 c!73455) b!641931))

(assert (= (and b!641927 (not c!73455)) b!641929))

(assert (= (or b!641931 b!641929) bm!33547))

(declare-fun m!616135 () Bool)

(assert (=> b!641927 m!616135))

(assert (=> b!641927 m!616135))

(declare-fun m!616137 () Bool)

(assert (=> b!641927 m!616137))

(assert (=> b!641928 m!616135))

(assert (=> b!641928 m!616135))

(declare-fun m!616139 () Bool)

(assert (=> b!641928 m!616139))

(assert (=> b!641930 m!616135))

(assert (=> b!641930 m!616135))

(assert (=> b!641930 m!616137))

(assert (=> bm!33547 m!616135))

(declare-fun m!616141 () Bool)

(assert (=> bm!33547 m!616141))

(assert (=> b!641701 d!90773))

(declare-fun b!641944 () Bool)

(declare-fun e!367597 () Bool)

(declare-fun e!367595 () Bool)

(assert (=> b!641944 (= e!367597 e!367595)))

(declare-fun c!73462 () Bool)

(assert (=> b!641944 (= c!73462 (validKeyInArray!0 (select (arr!18397 lt!297099) j!136)))))

(declare-fun b!641945 () Bool)

(declare-fun e!367598 () Bool)

(assert (=> b!641945 (= e!367598 (contains!3110 Nil!12342 (select (arr!18397 lt!297099) j!136)))))

(declare-fun d!90775 () Bool)

(declare-fun res!415757 () Bool)

(declare-fun e!367596 () Bool)

(assert (=> d!90775 (=> res!415757 e!367596)))

(assert (=> d!90775 (= res!415757 (bvsge j!136 (size!18761 lt!297099)))))

(assert (=> d!90775 (= (arrayNoDuplicates!0 lt!297099 j!136 Nil!12342) e!367596)))

(declare-fun b!641946 () Bool)

(declare-fun call!33551 () Bool)

(assert (=> b!641946 (= e!367595 call!33551)))

(declare-fun b!641947 () Bool)

(assert (=> b!641947 (= e!367596 e!367597)))

(declare-fun res!415758 () Bool)

(assert (=> b!641947 (=> (not res!415758) (not e!367597))))

(assert (=> b!641947 (= res!415758 (not e!367598))))

(declare-fun res!415759 () Bool)

(assert (=> b!641947 (=> (not res!415759) (not e!367598))))

(assert (=> b!641947 (= res!415759 (validKeyInArray!0 (select (arr!18397 lt!297099) j!136)))))

(declare-fun b!641948 () Bool)

(assert (=> b!641948 (= e!367595 call!33551)))

(declare-fun bm!33548 () Bool)

(assert (=> bm!33548 (= call!33551 (arrayNoDuplicates!0 lt!297099 (bvadd j!136 #b00000000000000000000000000000001) (ite c!73462 (Cons!12341 (select (arr!18397 lt!297099) j!136) Nil!12342) Nil!12342)))))

(assert (= (and d!90775 (not res!415757)) b!641947))

(assert (= (and b!641947 res!415759) b!641945))

(assert (= (and b!641947 res!415758) b!641944))

(assert (= (and b!641944 c!73462) b!641948))

(assert (= (and b!641944 (not c!73462)) b!641946))

(assert (= (or b!641948 b!641946) bm!33548))

(declare-fun m!616143 () Bool)

(assert (=> b!641944 m!616143))

(assert (=> b!641944 m!616143))

(declare-fun m!616145 () Bool)

(assert (=> b!641944 m!616145))

(assert (=> b!641945 m!616143))

(assert (=> b!641945 m!616143))

(declare-fun m!616147 () Bool)

(assert (=> b!641945 m!616147))

(assert (=> b!641947 m!616143))

(assert (=> b!641947 m!616143))

(assert (=> b!641947 m!616145))

(assert (=> bm!33548 m!616143))

(declare-fun m!616149 () Bool)

(assert (=> bm!33548 m!616149))

(assert (=> b!641701 d!90775))

(declare-fun d!90777 () Bool)

(assert (=> d!90777 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!58080 d!90777))

(declare-fun d!90789 () Bool)

(assert (=> d!90789 (= (array_inv!14256 a!2986) (bvsge (size!18761 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!58080 d!90789))

(declare-fun d!90791 () Bool)

(declare-fun e!367622 () Bool)

(assert (=> d!90791 e!367622))

(declare-fun res!415777 () Bool)

(assert (=> d!90791 (=> (not res!415777) (not e!367622))))

(assert (=> d!90791 (= res!415777 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18761 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18761 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18761 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18761 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18761 a!2986))))))

(declare-fun lt!297211 () Unit!21681)

(declare-fun choose!9 (array!38364 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21681)

(assert (=> d!90791 (= lt!297211 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297091 vacantSpotIndex!68 mask!3053))))

(assert (=> d!90791 (validMask!0 mask!3053)))

(assert (=> d!90791 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297091 vacantSpotIndex!68 mask!3053) lt!297211)))

(declare-fun b!641978 () Bool)

(assert (=> b!641978 (= e!367622 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297091 vacantSpotIndex!68 (select (arr!18397 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297091 vacantSpotIndex!68 (select (store (arr!18397 a!2986) i!1108 k0!1786) j!136) (array!38365 (store (arr!18397 a!2986) i!1108 k0!1786) (size!18761 a!2986)) mask!3053)))))

(assert (= (and d!90791 res!415777) b!641978))

(declare-fun m!616171 () Bool)

(assert (=> d!90791 m!616171))

(assert (=> d!90791 m!615889))

(assert (=> b!641978 m!615895))

(assert (=> b!641978 m!615905))

(assert (=> b!641978 m!615901))

(declare-fun m!616173 () Bool)

(assert (=> b!641978 m!616173))

(assert (=> b!641978 m!615895))

(assert (=> b!641978 m!615901))

(assert (=> b!641978 m!615909))

(assert (=> b!641703 d!90791))

(declare-fun b!642045 () Bool)

(declare-fun c!73500 () Bool)

(declare-fun lt!297240 () (_ BitVec 64))

(assert (=> b!642045 (= c!73500 (= lt!297240 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!367661 () SeekEntryResult!6793)

(declare-fun e!367662 () SeekEntryResult!6793)

(assert (=> b!642045 (= e!367661 e!367662)))

(declare-fun b!642046 () Bool)

(declare-fun e!367660 () SeekEntryResult!6793)

(assert (=> b!642046 (= e!367660 Undefined!6793)))

(declare-fun lt!297239 () SeekEntryResult!6793)

(declare-fun d!90797 () Bool)

(assert (=> d!90797 (and (or ((_ is Undefined!6793) lt!297239) (not ((_ is Found!6793) lt!297239)) (and (bvsge (index!29496 lt!297239) #b00000000000000000000000000000000) (bvslt (index!29496 lt!297239) (size!18761 lt!297099)))) (or ((_ is Undefined!6793) lt!297239) ((_ is Found!6793) lt!297239) (not ((_ is MissingVacant!6793) lt!297239)) (not (= (index!29498 lt!297239) vacantSpotIndex!68)) (and (bvsge (index!29498 lt!297239) #b00000000000000000000000000000000) (bvslt (index!29498 lt!297239) (size!18761 lt!297099)))) (or ((_ is Undefined!6793) lt!297239) (ite ((_ is Found!6793) lt!297239) (= (select (arr!18397 lt!297099) (index!29496 lt!297239)) lt!297100) (and ((_ is MissingVacant!6793) lt!297239) (= (index!29498 lt!297239) vacantSpotIndex!68) (= (select (arr!18397 lt!297099) (index!29498 lt!297239)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90797 (= lt!297239 e!367660)))

(declare-fun c!73499 () Bool)

(assert (=> d!90797 (= c!73499 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!90797 (= lt!297240 (select (arr!18397 lt!297099) lt!297091))))

(assert (=> d!90797 (validMask!0 mask!3053)))

(assert (=> d!90797 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297091 vacantSpotIndex!68 lt!297100 lt!297099 mask!3053) lt!297239)))

(declare-fun b!642047 () Bool)

(assert (=> b!642047 (= e!367660 e!367661)))

(declare-fun c!73498 () Bool)

(assert (=> b!642047 (= c!73498 (= lt!297240 lt!297100))))

(declare-fun b!642048 () Bool)

(assert (=> b!642048 (= e!367662 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!297091 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!297100 lt!297099 mask!3053))))

(declare-fun b!642049 () Bool)

(assert (=> b!642049 (= e!367662 (MissingVacant!6793 vacantSpotIndex!68))))

(declare-fun b!642050 () Bool)

(assert (=> b!642050 (= e!367661 (Found!6793 lt!297091))))

(assert (= (and d!90797 c!73499) b!642046))

(assert (= (and d!90797 (not c!73499)) b!642047))

(assert (= (and b!642047 c!73498) b!642050))

(assert (= (and b!642047 (not c!73498)) b!642045))

(assert (= (and b!642045 c!73500) b!642049))

(assert (= (and b!642045 (not c!73500)) b!642048))

(declare-fun m!616233 () Bool)

(assert (=> d!90797 m!616233))

(declare-fun m!616235 () Bool)

(assert (=> d!90797 m!616235))

(declare-fun m!616237 () Bool)

(assert (=> d!90797 m!616237))

(assert (=> d!90797 m!615889))

(declare-fun m!616239 () Bool)

(assert (=> b!642048 m!616239))

(assert (=> b!642048 m!616239))

(declare-fun m!616241 () Bool)

(assert (=> b!642048 m!616241))

(assert (=> b!641703 d!90797))

(declare-fun b!642051 () Bool)

(declare-fun c!73503 () Bool)

(declare-fun lt!297242 () (_ BitVec 64))

(assert (=> b!642051 (= c!73503 (= lt!297242 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!367664 () SeekEntryResult!6793)

(declare-fun e!367665 () SeekEntryResult!6793)

(assert (=> b!642051 (= e!367664 e!367665)))

(declare-fun b!642052 () Bool)

(declare-fun e!367663 () SeekEntryResult!6793)

(assert (=> b!642052 (= e!367663 Undefined!6793)))

(declare-fun lt!297241 () SeekEntryResult!6793)

(declare-fun d!90815 () Bool)

(assert (=> d!90815 (and (or ((_ is Undefined!6793) lt!297241) (not ((_ is Found!6793) lt!297241)) (and (bvsge (index!29496 lt!297241) #b00000000000000000000000000000000) (bvslt (index!29496 lt!297241) (size!18761 lt!297099)))) (or ((_ is Undefined!6793) lt!297241) ((_ is Found!6793) lt!297241) (not ((_ is MissingVacant!6793) lt!297241)) (not (= (index!29498 lt!297241) vacantSpotIndex!68)) (and (bvsge (index!29498 lt!297241) #b00000000000000000000000000000000) (bvslt (index!29498 lt!297241) (size!18761 lt!297099)))) (or ((_ is Undefined!6793) lt!297241) (ite ((_ is Found!6793) lt!297241) (= (select (arr!18397 lt!297099) (index!29496 lt!297241)) lt!297100) (and ((_ is MissingVacant!6793) lt!297241) (= (index!29498 lt!297241) vacantSpotIndex!68) (= (select (arr!18397 lt!297099) (index!29498 lt!297241)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90815 (= lt!297241 e!367663)))

(declare-fun c!73502 () Bool)

(assert (=> d!90815 (= c!73502 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!90815 (= lt!297242 (select (arr!18397 lt!297099) index!984))))

(assert (=> d!90815 (validMask!0 mask!3053)))

(assert (=> d!90815 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!297100 lt!297099 mask!3053) lt!297241)))

(declare-fun b!642053 () Bool)

(assert (=> b!642053 (= e!367663 e!367664)))

(declare-fun c!73501 () Bool)

(assert (=> b!642053 (= c!73501 (= lt!297242 lt!297100))))

(declare-fun b!642054 () Bool)

(assert (=> b!642054 (= e!367665 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!297100 lt!297099 mask!3053))))

(declare-fun b!642055 () Bool)

(assert (=> b!642055 (= e!367665 (MissingVacant!6793 vacantSpotIndex!68))))

(declare-fun b!642056 () Bool)

(assert (=> b!642056 (= e!367664 (Found!6793 index!984))))

(assert (= (and d!90815 c!73502) b!642052))

(assert (= (and d!90815 (not c!73502)) b!642053))

(assert (= (and b!642053 c!73501) b!642056))

(assert (= (and b!642053 (not c!73501)) b!642051))

(assert (= (and b!642051 c!73503) b!642055))

(assert (= (and b!642051 (not c!73503)) b!642054))

(declare-fun m!616243 () Bool)

(assert (=> d!90815 m!616243))

(declare-fun m!616245 () Bool)

(assert (=> d!90815 m!616245))

(declare-fun m!616247 () Bool)

(assert (=> d!90815 m!616247))

(assert (=> d!90815 m!615889))

(declare-fun m!616249 () Bool)

(assert (=> b!642054 m!616249))

(assert (=> b!642054 m!616249))

(declare-fun m!616251 () Bool)

(assert (=> b!642054 m!616251))

(assert (=> b!641703 d!90815))

(declare-fun b!642059 () Bool)

(declare-fun c!73506 () Bool)

(declare-fun lt!297246 () (_ BitVec 64))

(assert (=> b!642059 (= c!73506 (= lt!297246 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!367669 () SeekEntryResult!6793)

(declare-fun e!367670 () SeekEntryResult!6793)

(assert (=> b!642059 (= e!367669 e!367670)))

(declare-fun b!642060 () Bool)

(declare-fun e!367668 () SeekEntryResult!6793)

(assert (=> b!642060 (= e!367668 Undefined!6793)))

(declare-fun d!90817 () Bool)

(declare-fun lt!297245 () SeekEntryResult!6793)

(assert (=> d!90817 (and (or ((_ is Undefined!6793) lt!297245) (not ((_ is Found!6793) lt!297245)) (and (bvsge (index!29496 lt!297245) #b00000000000000000000000000000000) (bvslt (index!29496 lt!297245) (size!18761 a!2986)))) (or ((_ is Undefined!6793) lt!297245) ((_ is Found!6793) lt!297245) (not ((_ is MissingVacant!6793) lt!297245)) (not (= (index!29498 lt!297245) vacantSpotIndex!68)) (and (bvsge (index!29498 lt!297245) #b00000000000000000000000000000000) (bvslt (index!29498 lt!297245) (size!18761 a!2986)))) (or ((_ is Undefined!6793) lt!297245) (ite ((_ is Found!6793) lt!297245) (= (select (arr!18397 a!2986) (index!29496 lt!297245)) (select (arr!18397 a!2986) j!136)) (and ((_ is MissingVacant!6793) lt!297245) (= (index!29498 lt!297245) vacantSpotIndex!68) (= (select (arr!18397 a!2986) (index!29498 lt!297245)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90817 (= lt!297245 e!367668)))

(declare-fun c!73505 () Bool)

(assert (=> d!90817 (= c!73505 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!90817 (= lt!297246 (select (arr!18397 a!2986) lt!297091))))

(assert (=> d!90817 (validMask!0 mask!3053)))

(assert (=> d!90817 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297091 vacantSpotIndex!68 (select (arr!18397 a!2986) j!136) a!2986 mask!3053) lt!297245)))

(declare-fun b!642061 () Bool)

(assert (=> b!642061 (= e!367668 e!367669)))

(declare-fun c!73504 () Bool)

(assert (=> b!642061 (= c!73504 (= lt!297246 (select (arr!18397 a!2986) j!136)))))

(declare-fun b!642062 () Bool)

(assert (=> b!642062 (= e!367670 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!297091 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18397 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!642063 () Bool)

(assert (=> b!642063 (= e!367670 (MissingVacant!6793 vacantSpotIndex!68))))

(declare-fun b!642064 () Bool)

(assert (=> b!642064 (= e!367669 (Found!6793 lt!297091))))

(assert (= (and d!90817 c!73505) b!642060))

(assert (= (and d!90817 (not c!73505)) b!642061))

(assert (= (and b!642061 c!73504) b!642064))

(assert (= (and b!642061 (not c!73504)) b!642059))

(assert (= (and b!642059 c!73506) b!642063))

(assert (= (and b!642059 (not c!73506)) b!642062))

(declare-fun m!616253 () Bool)

(assert (=> d!90817 m!616253))

(declare-fun m!616255 () Bool)

(assert (=> d!90817 m!616255))

(declare-fun m!616257 () Bool)

(assert (=> d!90817 m!616257))

(assert (=> d!90817 m!615889))

(assert (=> b!642062 m!616239))

(assert (=> b!642062 m!616239))

(assert (=> b!642062 m!615895))

(declare-fun m!616261 () Bool)

(assert (=> b!642062 m!616261))

(assert (=> b!641703 d!90817))

(declare-fun d!90819 () Bool)

(declare-fun lt!297251 () (_ BitVec 32))

(assert (=> d!90819 (and (bvsge lt!297251 #b00000000000000000000000000000000) (bvslt lt!297251 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90819 (= lt!297251 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!90819 (validMask!0 mask!3053)))

(assert (=> d!90819 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!297251)))

(declare-fun bs!19230 () Bool)

(assert (= bs!19230 d!90819))

(declare-fun m!616275 () Bool)

(assert (=> bs!19230 m!616275))

(assert (=> bs!19230 m!615889))

(assert (=> b!641703 d!90819))

(declare-fun d!90831 () Bool)

(declare-fun lt!297256 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!247 (List!12345) (InoxSet (_ BitVec 64)))

(assert (=> d!90831 (= lt!297256 (select (content!247 Nil!12342) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!367685 () Bool)

(assert (=> d!90831 (= lt!297256 e!367685)))

(declare-fun res!415802 () Bool)

(assert (=> d!90831 (=> (not res!415802) (not e!367685))))

(assert (=> d!90831 (= res!415802 ((_ is Cons!12341) Nil!12342))))

(assert (=> d!90831 (= (contains!3110 Nil!12342 #b1000000000000000000000000000000000000000000000000000000000000000) lt!297256)))

(declare-fun b!642078 () Bool)

(declare-fun e!367684 () Bool)

(assert (=> b!642078 (= e!367685 e!367684)))

(declare-fun res!415801 () Bool)

(assert (=> b!642078 (=> res!415801 e!367684)))

(assert (=> b!642078 (= res!415801 (= (h!13389 Nil!12342) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!642079 () Bool)

(assert (=> b!642079 (= e!367684 (contains!3110 (t!18565 Nil!12342) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!90831 res!415802) b!642078))

(assert (= (and b!642078 (not res!415801)) b!642079))

(declare-fun m!616277 () Bool)

(assert (=> d!90831 m!616277))

(declare-fun m!616279 () Bool)

(assert (=> d!90831 m!616279))

(declare-fun m!616281 () Bool)

(assert (=> b!642079 m!616281))

(assert (=> b!641702 d!90831))

(declare-fun b!642113 () Bool)

(declare-fun e!367713 () Bool)

(declare-fun call!33562 () Bool)

(assert (=> b!642113 (= e!367713 call!33562)))

(declare-fun b!642114 () Bool)

(declare-fun e!367712 () Bool)

(assert (=> b!642114 (= e!367712 e!367713)))

(declare-fun c!73515 () Bool)

(assert (=> b!642114 (= c!73515 (validKeyInArray!0 (select (arr!18397 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!642115 () Bool)

(declare-fun e!367711 () Bool)

(assert (=> b!642115 (= e!367711 call!33562)))

(declare-fun bm!33559 () Bool)

(assert (=> bm!33559 (= call!33562 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!642116 () Bool)

(assert (=> b!642116 (= e!367713 e!367711)))

(declare-fun lt!297283 () (_ BitVec 64))

(assert (=> b!642116 (= lt!297283 (select (arr!18397 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!297281 () Unit!21681)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38364 (_ BitVec 64) (_ BitVec 32)) Unit!21681)

(assert (=> b!642116 (= lt!297281 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!297283 #b00000000000000000000000000000000))))

(assert (=> b!642116 (arrayContainsKey!0 a!2986 lt!297283 #b00000000000000000000000000000000)))

(declare-fun lt!297282 () Unit!21681)

(assert (=> b!642116 (= lt!297282 lt!297281)))

(declare-fun res!415821 () Bool)

(assert (=> b!642116 (= res!415821 (= (seekEntryOrOpen!0 (select (arr!18397 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6793 #b00000000000000000000000000000000)))))

(assert (=> b!642116 (=> (not res!415821) (not e!367711))))

(declare-fun d!90833 () Bool)

(declare-fun res!415820 () Bool)

(assert (=> d!90833 (=> res!415820 e!367712)))

(assert (=> d!90833 (= res!415820 (bvsge #b00000000000000000000000000000000 (size!18761 a!2986)))))

(assert (=> d!90833 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!367712)))

(assert (= (and d!90833 (not res!415820)) b!642114))

(assert (= (and b!642114 c!73515) b!642116))

(assert (= (and b!642114 (not c!73515)) b!642113))

(assert (= (and b!642116 res!415821) b!642115))

(assert (= (or b!642115 b!642113) bm!33559))

(assert (=> b!642114 m!616081))

(assert (=> b!642114 m!616081))

(assert (=> b!642114 m!616083))

(declare-fun m!616311 () Bool)

(assert (=> bm!33559 m!616311))

(assert (=> b!642116 m!616081))

(declare-fun m!616313 () Bool)

(assert (=> b!642116 m!616313))

(declare-fun m!616315 () Bool)

(assert (=> b!642116 m!616315))

(assert (=> b!642116 m!616081))

(declare-fun m!616317 () Bool)

(assert (=> b!642116 m!616317))

(assert (=> b!641715 d!90833))

(declare-fun d!90845 () Bool)

(declare-fun res!415822 () Bool)

(declare-fun e!367714 () Bool)

(assert (=> d!90845 (=> res!415822 e!367714)))

(assert (=> d!90845 (= res!415822 (= (select (arr!18397 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!90845 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!367714)))

(declare-fun b!642117 () Bool)

(declare-fun e!367715 () Bool)

(assert (=> b!642117 (= e!367714 e!367715)))

(declare-fun res!415823 () Bool)

(assert (=> b!642117 (=> (not res!415823) (not e!367715))))

(assert (=> b!642117 (= res!415823 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18761 a!2986)))))

(declare-fun b!642118 () Bool)

(assert (=> b!642118 (= e!367715 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!90845 (not res!415822)) b!642117))

(assert (= (and b!642117 res!415823) b!642118))

(assert (=> d!90845 m!616081))

(declare-fun m!616319 () Bool)

(assert (=> b!642118 m!616319))

(assert (=> b!641704 d!90845))

(declare-fun d!90847 () Bool)

(declare-fun res!415828 () Bool)

(declare-fun e!367720 () Bool)

(assert (=> d!90847 (=> res!415828 e!367720)))

(assert (=> d!90847 (= res!415828 (= (select (arr!18397 lt!297099) j!136) (select (arr!18397 a!2986) j!136)))))

(assert (=> d!90847 (= (arrayContainsKey!0 lt!297099 (select (arr!18397 a!2986) j!136) j!136) e!367720)))

(declare-fun b!642123 () Bool)

(declare-fun e!367721 () Bool)

(assert (=> b!642123 (= e!367720 e!367721)))

(declare-fun res!415829 () Bool)

(assert (=> b!642123 (=> (not res!415829) (not e!367721))))

(assert (=> b!642123 (= res!415829 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18761 lt!297099)))))

(declare-fun b!642124 () Bool)

(assert (=> b!642124 (= e!367721 (arrayContainsKey!0 lt!297099 (select (arr!18397 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90847 (not res!415828)) b!642123))

(assert (= (and b!642123 res!415829) b!642124))

(assert (=> d!90847 m!616143))

(assert (=> b!642124 m!615895))

(declare-fun m!616321 () Bool)

(assert (=> b!642124 m!616321))

(assert (=> b!641714 d!90847))

(declare-fun d!90849 () Bool)

(declare-fun lt!297284 () Bool)

(assert (=> d!90849 (= lt!297284 (select (content!247 Nil!12342) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!367723 () Bool)

(assert (=> d!90849 (= lt!297284 e!367723)))

(declare-fun res!415831 () Bool)

(assert (=> d!90849 (=> (not res!415831) (not e!367723))))

(assert (=> d!90849 (= res!415831 ((_ is Cons!12341) Nil!12342))))

(assert (=> d!90849 (= (contains!3110 Nil!12342 #b0000000000000000000000000000000000000000000000000000000000000000) lt!297284)))

(declare-fun b!642125 () Bool)

(declare-fun e!367722 () Bool)

(assert (=> b!642125 (= e!367723 e!367722)))

(declare-fun res!415830 () Bool)

(assert (=> b!642125 (=> res!415830 e!367722)))

(assert (=> b!642125 (= res!415830 (= (h!13389 Nil!12342) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!642126 () Bool)

(assert (=> b!642126 (= e!367722 (contains!3110 (t!18565 Nil!12342) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!90849 res!415831) b!642125))

(assert (= (and b!642125 (not res!415830)) b!642126))

(assert (=> d!90849 m!616277))

(declare-fun m!616323 () Bool)

(assert (=> d!90849 m!616323))

(declare-fun m!616325 () Bool)

(assert (=> b!642126 m!616325))

(assert (=> b!641706 d!90849))

(declare-fun d!90851 () Bool)

(declare-fun res!415832 () Bool)

(declare-fun e!367724 () Bool)

(assert (=> d!90851 (=> res!415832 e!367724)))

(assert (=> d!90851 (= res!415832 (= (select (arr!18397 lt!297099) index!984) (select (arr!18397 a!2986) j!136)))))

(assert (=> d!90851 (= (arrayContainsKey!0 lt!297099 (select (arr!18397 a!2986) j!136) index!984) e!367724)))

(declare-fun b!642127 () Bool)

(declare-fun e!367725 () Bool)

(assert (=> b!642127 (= e!367724 e!367725)))

(declare-fun res!415833 () Bool)

(assert (=> b!642127 (=> (not res!415833) (not e!367725))))

(assert (=> b!642127 (= res!415833 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18761 lt!297099)))))

(declare-fun b!642128 () Bool)

(assert (=> b!642128 (= e!367725 (arrayContainsKey!0 lt!297099 (select (arr!18397 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!90851 (not res!415832)) b!642127))

(assert (= (and b!642127 res!415833) b!642128))

(assert (=> d!90851 m!616247))

(assert (=> b!642128 m!615895))

(declare-fun m!616329 () Bool)

(assert (=> b!642128 m!616329))

(assert (=> b!641708 d!90851))

(declare-fun b!642131 () Bool)

(declare-fun c!73518 () Bool)

(declare-fun lt!297286 () (_ BitVec 64))

(assert (=> b!642131 (= c!73518 (= lt!297286 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!367729 () SeekEntryResult!6793)

(declare-fun e!367730 () SeekEntryResult!6793)

(assert (=> b!642131 (= e!367729 e!367730)))

(declare-fun b!642132 () Bool)

(declare-fun e!367728 () SeekEntryResult!6793)

(assert (=> b!642132 (= e!367728 Undefined!6793)))

(declare-fun lt!297285 () SeekEntryResult!6793)

(declare-fun d!90853 () Bool)

(assert (=> d!90853 (and (or ((_ is Undefined!6793) lt!297285) (not ((_ is Found!6793) lt!297285)) (and (bvsge (index!29496 lt!297285) #b00000000000000000000000000000000) (bvslt (index!29496 lt!297285) (size!18761 a!2986)))) (or ((_ is Undefined!6793) lt!297285) ((_ is Found!6793) lt!297285) (not ((_ is MissingVacant!6793) lt!297285)) (not (= (index!29498 lt!297285) vacantSpotIndex!68)) (and (bvsge (index!29498 lt!297285) #b00000000000000000000000000000000) (bvslt (index!29498 lt!297285) (size!18761 a!2986)))) (or ((_ is Undefined!6793) lt!297285) (ite ((_ is Found!6793) lt!297285) (= (select (arr!18397 a!2986) (index!29496 lt!297285)) (select (arr!18397 a!2986) j!136)) (and ((_ is MissingVacant!6793) lt!297285) (= (index!29498 lt!297285) vacantSpotIndex!68) (= (select (arr!18397 a!2986) (index!29498 lt!297285)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90853 (= lt!297285 e!367728)))

(declare-fun c!73517 () Bool)

(assert (=> d!90853 (= c!73517 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!90853 (= lt!297286 (select (arr!18397 a!2986) index!984))))

(assert (=> d!90853 (validMask!0 mask!3053)))

(assert (=> d!90853 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18397 a!2986) j!136) a!2986 mask!3053) lt!297285)))

(declare-fun b!642133 () Bool)

(assert (=> b!642133 (= e!367728 e!367729)))

(declare-fun c!73516 () Bool)

(assert (=> b!642133 (= c!73516 (= lt!297286 (select (arr!18397 a!2986) j!136)))))

(declare-fun b!642134 () Bool)

(assert (=> b!642134 (= e!367730 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18397 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!642135 () Bool)

(assert (=> b!642135 (= e!367730 (MissingVacant!6793 vacantSpotIndex!68))))

(declare-fun b!642136 () Bool)

(assert (=> b!642136 (= e!367729 (Found!6793 index!984))))

(assert (= (and d!90853 c!73517) b!642132))

(assert (= (and d!90853 (not c!73517)) b!642133))

(assert (= (and b!642133 c!73516) b!642136))

(assert (= (and b!642133 (not c!73516)) b!642131))

(assert (= (and b!642131 c!73518) b!642135))

(assert (= (and b!642131 (not c!73518)) b!642134))

(declare-fun m!616333 () Bool)

(assert (=> d!90853 m!616333))

(declare-fun m!616335 () Bool)

(assert (=> d!90853 m!616335))

(assert (=> d!90853 m!615947))

(assert (=> d!90853 m!615889))

(assert (=> b!642134 m!616249))

(assert (=> b!642134 m!616249))

(assert (=> b!642134 m!615895))

(declare-fun m!616337 () Bool)

(assert (=> b!642134 m!616337))

(assert (=> b!641718 d!90853))

(check-sat (not b!641928) (not b!641945) (not b!642126) (not b!641888) (not b!641911) (not d!90771) (not bm!33559) (not b!641947) (not bm!33548) (not b!642114) (not d!90797) (not b!642054) (not b!642116) (not d!90751) (not b!641872) (not b!642134) (not d!90817) (not b!642118) (not b!641930) (not bm!33543) (not b!641863) (not d!90791) (not b!641944) (not b!641862) (not b!641865) (not b!641871) (not b!641978) (not d!90815) (not b!642079) (not b!642124) (not d!90849) (not d!90831) (not bm!33547) (not b!642128) (not b!641926) (not d!90819) (not b!642048) (not d!90767) (not b!642062) (not b!641927) (not d!90853) (not d!90763))
(check-sat)
