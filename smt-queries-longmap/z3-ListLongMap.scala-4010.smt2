; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54582 () Bool)

(assert start!54582)

(declare-fun b!595933 () Bool)

(declare-datatypes ((Unit!18697 0))(
  ( (Unit!18698) )
))
(declare-fun e!340503 () Unit!18697)

(declare-fun Unit!18699 () Unit!18697)

(assert (=> b!595933 (= e!340503 Unit!18699)))

(assert (=> b!595933 false))

(declare-fun b!595934 () Bool)

(declare-fun res!381678 () Bool)

(declare-fun e!340501 () Bool)

(assert (=> b!595934 (=> (not res!381678) (not e!340501))))

(declare-datatypes ((array!36987 0))(
  ( (array!36988 (arr!17755 (Array (_ BitVec 32) (_ BitVec 64))) (size!18119 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36987)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36987 (_ BitVec 32)) Bool)

(assert (=> b!595934 (= res!381678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!595935 () Bool)

(declare-fun e!340492 () Bool)

(declare-datatypes ((SeekEntryResult!6151 0))(
  ( (MissingZero!6151 (index!26852 (_ BitVec 32))) (Found!6151 (index!26853 (_ BitVec 32))) (Intermediate!6151 (undefined!6963 Bool) (index!26854 (_ BitVec 32)) (x!55806 (_ BitVec 32))) (Undefined!6151) (MissingVacant!6151 (index!26855 (_ BitVec 32))) )
))
(declare-fun lt!270626 () SeekEntryResult!6151)

(declare-fun lt!270625 () SeekEntryResult!6151)

(assert (=> b!595935 (= e!340492 (= lt!270626 lt!270625))))

(declare-fun b!595936 () Bool)

(declare-fun e!340494 () Bool)

(assert (=> b!595936 (= e!340501 e!340494)))

(declare-fun res!381684 () Bool)

(assert (=> b!595936 (=> (not res!381684) (not e!340494))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!595936 (= res!381684 (= (select (store (arr!17755 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!270627 () array!36987)

(assert (=> b!595936 (= lt!270627 (array!36988 (store (arr!17755 a!2986) i!1108 k0!1786) (size!18119 a!2986)))))

(declare-fun b!595937 () Bool)

(declare-fun e!340493 () Bool)

(declare-fun e!340496 () Bool)

(assert (=> b!595937 (= e!340493 (not e!340496))))

(declare-fun res!381689 () Bool)

(assert (=> b!595937 (=> res!381689 e!340496)))

(declare-fun lt!270620 () SeekEntryResult!6151)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!595937 (= res!381689 (not (= lt!270620 (Found!6151 index!984))))))

(declare-fun lt!270630 () Unit!18697)

(assert (=> b!595937 (= lt!270630 e!340503)))

(declare-fun c!67496 () Bool)

(assert (=> b!595937 (= c!67496 (= lt!270620 Undefined!6151))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!270623 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36987 (_ BitVec 32)) SeekEntryResult!6151)

(assert (=> b!595937 (= lt!270620 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270623 lt!270627 mask!3053))))

(assert (=> b!595937 e!340492))

(declare-fun res!381683 () Bool)

(assert (=> b!595937 (=> (not res!381683) (not e!340492))))

(declare-fun lt!270624 () (_ BitVec 32))

(assert (=> b!595937 (= res!381683 (= lt!270625 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270624 vacantSpotIndex!68 lt!270623 lt!270627 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!595937 (= lt!270625 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270624 vacantSpotIndex!68 (select (arr!17755 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!595937 (= lt!270623 (select (store (arr!17755 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!270631 () Unit!18697)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36987 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18697)

(assert (=> b!595937 (= lt!270631 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270624 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!595937 (= lt!270624 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!595938 () Bool)

(declare-fun res!381681 () Bool)

(declare-fun e!340499 () Bool)

(assert (=> b!595938 (=> (not res!381681) (not e!340499))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!595938 (= res!381681 (validKeyInArray!0 (select (arr!17755 a!2986) j!136)))))

(declare-fun b!595939 () Bool)

(declare-fun res!381695 () Bool)

(declare-fun e!340497 () Bool)

(assert (=> b!595939 (=> res!381695 e!340497)))

(declare-datatypes ((List!11703 0))(
  ( (Nil!11700) (Cons!11699 (h!12747 (_ BitVec 64)) (t!17923 List!11703)) )
))
(declare-fun contains!2912 (List!11703 (_ BitVec 64)) Bool)

(assert (=> b!595939 (= res!381695 (contains!2912 Nil!11700 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595940 () Bool)

(declare-fun res!381679 () Bool)

(assert (=> b!595940 (=> (not res!381679) (not e!340499))))

(declare-fun arrayContainsKey!0 (array!36987 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!595940 (= res!381679 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!595941 () Bool)

(declare-fun Unit!18700 () Unit!18697)

(assert (=> b!595941 (= e!340503 Unit!18700)))

(declare-fun res!381677 () Bool)

(assert (=> start!54582 (=> (not res!381677) (not e!340499))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54582 (= res!381677 (validMask!0 mask!3053))))

(assert (=> start!54582 e!340499))

(assert (=> start!54582 true))

(declare-fun array_inv!13614 (array!36987) Bool)

(assert (=> start!54582 (array_inv!13614 a!2986)))

(declare-fun b!595932 () Bool)

(assert (=> b!595932 (= e!340497 true)))

(declare-fun lt!270628 () Bool)

(assert (=> b!595932 (= lt!270628 (contains!2912 Nil!11700 k0!1786))))

(declare-fun b!595942 () Bool)

(assert (=> b!595942 (= e!340494 e!340493)))

(declare-fun res!381693 () Bool)

(assert (=> b!595942 (=> (not res!381693) (not e!340493))))

(assert (=> b!595942 (= res!381693 (and (= lt!270626 (Found!6151 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17755 a!2986) index!984) (select (arr!17755 a!2986) j!136))) (not (= (select (arr!17755 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!595942 (= lt!270626 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17755 a!2986) j!136) a!2986 mask!3053))))

(declare-fun e!340495 () Bool)

(declare-fun b!595943 () Bool)

(assert (=> b!595943 (= e!340495 (arrayContainsKey!0 lt!270627 (select (arr!17755 a!2986) j!136) index!984))))

(declare-fun b!595944 () Bool)

(declare-fun e!340502 () Bool)

(assert (=> b!595944 (= e!340496 e!340502)))

(declare-fun res!381694 () Bool)

(assert (=> b!595944 (=> res!381694 e!340502)))

(declare-fun lt!270621 () (_ BitVec 64))

(assert (=> b!595944 (= res!381694 (or (not (= (select (arr!17755 a!2986) j!136) lt!270623)) (not (= (select (arr!17755 a!2986) j!136) lt!270621)) (bvsge j!136 index!984)))))

(declare-fun e!340498 () Bool)

(assert (=> b!595944 e!340498))

(declare-fun res!381686 () Bool)

(assert (=> b!595944 (=> (not res!381686) (not e!340498))))

(assert (=> b!595944 (= res!381686 (= lt!270621 (select (arr!17755 a!2986) j!136)))))

(assert (=> b!595944 (= lt!270621 (select (store (arr!17755 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!595945 () Bool)

(declare-fun e!340500 () Bool)

(assert (=> b!595945 (= e!340500 e!340495)))

(declare-fun res!381680 () Bool)

(assert (=> b!595945 (=> (not res!381680) (not e!340495))))

(assert (=> b!595945 (= res!381680 (arrayContainsKey!0 lt!270627 (select (arr!17755 a!2986) j!136) j!136))))

(declare-fun b!595946 () Bool)

(declare-fun res!381692 () Bool)

(assert (=> b!595946 (=> (not res!381692) (not e!340499))))

(assert (=> b!595946 (= res!381692 (validKeyInArray!0 k0!1786))))

(declare-fun b!595947 () Bool)

(assert (=> b!595947 (= e!340498 e!340500)))

(declare-fun res!381696 () Bool)

(assert (=> b!595947 (=> res!381696 e!340500)))

(assert (=> b!595947 (= res!381696 (or (not (= (select (arr!17755 a!2986) j!136) lt!270623)) (not (= (select (arr!17755 a!2986) j!136) lt!270621)) (bvsge j!136 index!984)))))

(declare-fun b!595948 () Bool)

(declare-fun res!381688 () Bool)

(assert (=> b!595948 (=> (not res!381688) (not e!340499))))

(assert (=> b!595948 (= res!381688 (and (= (size!18119 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18119 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18119 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!595949 () Bool)

(assert (=> b!595949 (= e!340502 e!340497)))

(declare-fun res!381687 () Bool)

(assert (=> b!595949 (=> res!381687 e!340497)))

(assert (=> b!595949 (= res!381687 (or (bvsge (size!18119 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18119 a!2986))))))

(assert (=> b!595949 (arrayContainsKey!0 lt!270627 (select (arr!17755 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270629 () Unit!18697)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36987 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18697)

(assert (=> b!595949 (= lt!270629 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270627 (select (arr!17755 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!595950 () Bool)

(declare-fun res!381697 () Bool)

(assert (=> b!595950 (=> res!381697 e!340497)))

(assert (=> b!595950 (= res!381697 (contains!2912 Nil!11700 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595951 () Bool)

(declare-fun res!381691 () Bool)

(assert (=> b!595951 (=> (not res!381691) (not e!340501))))

(declare-fun arrayNoDuplicates!0 (array!36987 (_ BitVec 32) List!11703) Bool)

(assert (=> b!595951 (= res!381691 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11700))))

(declare-fun b!595952 () Bool)

(assert (=> b!595952 (= e!340499 e!340501)))

(declare-fun res!381690 () Bool)

(assert (=> b!595952 (=> (not res!381690) (not e!340501))))

(declare-fun lt!270622 () SeekEntryResult!6151)

(assert (=> b!595952 (= res!381690 (or (= lt!270622 (MissingZero!6151 i!1108)) (= lt!270622 (MissingVacant!6151 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36987 (_ BitVec 32)) SeekEntryResult!6151)

(assert (=> b!595952 (= lt!270622 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!595953 () Bool)

(declare-fun res!381685 () Bool)

(assert (=> b!595953 (=> (not res!381685) (not e!340501))))

(assert (=> b!595953 (= res!381685 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17755 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!595954 () Bool)

(declare-fun res!381682 () Bool)

(assert (=> b!595954 (=> res!381682 e!340497)))

(declare-fun noDuplicate!259 (List!11703) Bool)

(assert (=> b!595954 (= res!381682 (not (noDuplicate!259 Nil!11700)))))

(assert (= (and start!54582 res!381677) b!595948))

(assert (= (and b!595948 res!381688) b!595938))

(assert (= (and b!595938 res!381681) b!595946))

(assert (= (and b!595946 res!381692) b!595940))

(assert (= (and b!595940 res!381679) b!595952))

(assert (= (and b!595952 res!381690) b!595934))

(assert (= (and b!595934 res!381678) b!595951))

(assert (= (and b!595951 res!381691) b!595953))

(assert (= (and b!595953 res!381685) b!595936))

(assert (= (and b!595936 res!381684) b!595942))

(assert (= (and b!595942 res!381693) b!595937))

(assert (= (and b!595937 res!381683) b!595935))

(assert (= (and b!595937 c!67496) b!595933))

(assert (= (and b!595937 (not c!67496)) b!595941))

(assert (= (and b!595937 (not res!381689)) b!595944))

(assert (= (and b!595944 res!381686) b!595947))

(assert (= (and b!595947 (not res!381696)) b!595945))

(assert (= (and b!595945 res!381680) b!595943))

(assert (= (and b!595944 (not res!381694)) b!595949))

(assert (= (and b!595949 (not res!381687)) b!595954))

(assert (= (and b!595954 (not res!381682)) b!595939))

(assert (= (and b!595939 (not res!381695)) b!595950))

(assert (= (and b!595950 (not res!381697)) b!595932))

(declare-fun m!573743 () Bool)

(assert (=> b!595939 m!573743))

(declare-fun m!573745 () Bool)

(assert (=> b!595932 m!573745))

(declare-fun m!573747 () Bool)

(assert (=> b!595950 m!573747))

(declare-fun m!573749 () Bool)

(assert (=> b!595951 m!573749))

(declare-fun m!573751 () Bool)

(assert (=> b!595942 m!573751))

(declare-fun m!573753 () Bool)

(assert (=> b!595942 m!573753))

(assert (=> b!595942 m!573753))

(declare-fun m!573755 () Bool)

(assert (=> b!595942 m!573755))

(declare-fun m!573757 () Bool)

(assert (=> start!54582 m!573757))

(declare-fun m!573759 () Bool)

(assert (=> start!54582 m!573759))

(assert (=> b!595944 m!573753))

(declare-fun m!573761 () Bool)

(assert (=> b!595944 m!573761))

(declare-fun m!573763 () Bool)

(assert (=> b!595944 m!573763))

(declare-fun m!573765 () Bool)

(assert (=> b!595940 m!573765))

(declare-fun m!573767 () Bool)

(assert (=> b!595953 m!573767))

(declare-fun m!573769 () Bool)

(assert (=> b!595954 m!573769))

(assert (=> b!595936 m!573761))

(declare-fun m!573771 () Bool)

(assert (=> b!595936 m!573771))

(assert (=> b!595947 m!573753))

(declare-fun m!573773 () Bool)

(assert (=> b!595934 m!573773))

(assert (=> b!595949 m!573753))

(assert (=> b!595949 m!573753))

(declare-fun m!573775 () Bool)

(assert (=> b!595949 m!573775))

(assert (=> b!595949 m!573753))

(declare-fun m!573777 () Bool)

(assert (=> b!595949 m!573777))

(assert (=> b!595938 m!573753))

(assert (=> b!595938 m!573753))

(declare-fun m!573779 () Bool)

(assert (=> b!595938 m!573779))

(declare-fun m!573781 () Bool)

(assert (=> b!595946 m!573781))

(declare-fun m!573783 () Bool)

(assert (=> b!595952 m!573783))

(assert (=> b!595945 m!573753))

(assert (=> b!595945 m!573753))

(declare-fun m!573785 () Bool)

(assert (=> b!595945 m!573785))

(assert (=> b!595943 m!573753))

(assert (=> b!595943 m!573753))

(declare-fun m!573787 () Bool)

(assert (=> b!595943 m!573787))

(declare-fun m!573789 () Bool)

(assert (=> b!595937 m!573789))

(declare-fun m!573791 () Bool)

(assert (=> b!595937 m!573791))

(assert (=> b!595937 m!573753))

(assert (=> b!595937 m!573761))

(declare-fun m!573793 () Bool)

(assert (=> b!595937 m!573793))

(declare-fun m!573795 () Bool)

(assert (=> b!595937 m!573795))

(assert (=> b!595937 m!573753))

(declare-fun m!573797 () Bool)

(assert (=> b!595937 m!573797))

(declare-fun m!573799 () Bool)

(assert (=> b!595937 m!573799))

(check-sat (not b!595934) (not b!595939) (not b!595946) (not b!595932) (not b!595949) (not start!54582) (not b!595942) (not b!595954) (not b!595951) (not b!595938) (not b!595950) (not b!595952) (not b!595943) (not b!595945) (not b!595940) (not b!595937))
(check-sat)
