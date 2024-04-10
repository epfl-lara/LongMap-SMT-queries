; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54538 () Bool)

(assert start!54538)

(declare-fun b!595930 () Bool)

(declare-fun res!381774 () Bool)

(declare-fun e!340486 () Bool)

(assert (=> b!595930 (=> (not res!381774) (not e!340486))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36998 0))(
  ( (array!36999 (arr!17763 (Array (_ BitVec 32) (_ BitVec 64))) (size!18127 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36998)

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!595930 (= res!381774 (and (= (size!18127 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18127 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18127 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!595931 () Bool)

(declare-fun e!340490 () Bool)

(declare-fun e!340491 () Bool)

(assert (=> b!595931 (= e!340490 e!340491)))

(declare-fun res!381775 () Bool)

(assert (=> b!595931 (=> res!381775 e!340491)))

(declare-fun lt!270630 () (_ BitVec 64))

(declare-fun lt!270637 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!595931 (= res!381775 (or (not (= (select (arr!17763 a!2986) j!136) lt!270637)) (not (= (select (arr!17763 a!2986) j!136) lt!270630)) (bvsge j!136 index!984)))))

(declare-fun e!340480 () Bool)

(assert (=> b!595931 e!340480))

(declare-fun res!381781 () Bool)

(assert (=> b!595931 (=> (not res!381781) (not e!340480))))

(assert (=> b!595931 (= res!381781 (= lt!270630 (select (arr!17763 a!2986) j!136)))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!595931 (= lt!270630 (select (store (arr!17763 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!595932 () Bool)

(declare-fun e!340483 () Bool)

(declare-fun e!340485 () Bool)

(assert (=> b!595932 (= e!340483 e!340485)))

(declare-fun res!381773 () Bool)

(assert (=> b!595932 (=> (not res!381773) (not e!340485))))

(declare-datatypes ((SeekEntryResult!6203 0))(
  ( (MissingZero!6203 (index!27060 (_ BitVec 32))) (Found!6203 (index!27061 (_ BitVec 32))) (Intermediate!6203 (undefined!7015 Bool) (index!27062 (_ BitVec 32)) (x!55863 (_ BitVec 32))) (Undefined!6203) (MissingVacant!6203 (index!27063 (_ BitVec 32))) )
))
(declare-fun lt!270632 () SeekEntryResult!6203)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!595932 (= res!381773 (and (= lt!270632 (Found!6203 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17763 a!2986) index!984) (select (arr!17763 a!2986) j!136))) (not (= (select (arr!17763 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36998 (_ BitVec 32)) SeekEntryResult!6203)

(assert (=> b!595932 (= lt!270632 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17763 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!595933 () Bool)

(declare-datatypes ((Unit!18730 0))(
  ( (Unit!18731) )
))
(declare-fun e!340488 () Unit!18730)

(declare-fun Unit!18732 () Unit!18730)

(assert (=> b!595933 (= e!340488 Unit!18732)))

(declare-fun b!595934 () Bool)

(declare-fun e!340487 () Bool)

(assert (=> b!595934 (= e!340487 true)))

(declare-fun lt!270635 () Bool)

(declare-datatypes ((List!11804 0))(
  ( (Nil!11801) (Cons!11800 (h!12845 (_ BitVec 64)) (t!18032 List!11804)) )
))
(declare-fun contains!2939 (List!11804 (_ BitVec 64)) Bool)

(assert (=> b!595934 (= lt!270635 (contains!2939 Nil!11801 k!1786))))

(declare-fun b!595935 () Bool)

(declare-fun res!381778 () Bool)

(assert (=> b!595935 (=> res!381778 e!340487)))

(assert (=> b!595935 (= res!381778 (contains!2939 Nil!11801 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595936 () Bool)

(assert (=> b!595936 (= e!340485 (not e!340490))))

(declare-fun res!381764 () Bool)

(assert (=> b!595936 (=> res!381764 e!340490)))

(declare-fun lt!270627 () SeekEntryResult!6203)

(assert (=> b!595936 (= res!381764 (not (= lt!270627 (Found!6203 index!984))))))

(declare-fun lt!270636 () Unit!18730)

(assert (=> b!595936 (= lt!270636 e!340488)))

(declare-fun c!67451 () Bool)

(assert (=> b!595936 (= c!67451 (= lt!270627 Undefined!6203))))

(declare-fun lt!270631 () array!36998)

(assert (=> b!595936 (= lt!270627 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270637 lt!270631 mask!3053))))

(declare-fun e!340482 () Bool)

(assert (=> b!595936 e!340482))

(declare-fun res!381770 () Bool)

(assert (=> b!595936 (=> (not res!381770) (not e!340482))))

(declare-fun lt!270629 () SeekEntryResult!6203)

(declare-fun lt!270634 () (_ BitVec 32))

(assert (=> b!595936 (= res!381770 (= lt!270629 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270634 vacantSpotIndex!68 lt!270637 lt!270631 mask!3053)))))

(assert (=> b!595936 (= lt!270629 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270634 vacantSpotIndex!68 (select (arr!17763 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!595936 (= lt!270637 (select (store (arr!17763 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!270633 () Unit!18730)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36998 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18730)

(assert (=> b!595936 (= lt!270633 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270634 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!595936 (= lt!270634 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!595937 () Bool)

(assert (=> b!595937 (= e!340482 (= lt!270632 lt!270629))))

(declare-fun b!595938 () Bool)

(declare-fun e!340484 () Bool)

(assert (=> b!595938 (= e!340486 e!340484)))

(declare-fun res!381777 () Bool)

(assert (=> b!595938 (=> (not res!381777) (not e!340484))))

(declare-fun lt!270628 () SeekEntryResult!6203)

(assert (=> b!595938 (= res!381777 (or (= lt!270628 (MissingZero!6203 i!1108)) (= lt!270628 (MissingVacant!6203 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36998 (_ BitVec 32)) SeekEntryResult!6203)

(assert (=> b!595938 (= lt!270628 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!595939 () Bool)

(assert (=> b!595939 (= e!340491 e!340487)))

(declare-fun res!381771 () Bool)

(assert (=> b!595939 (=> res!381771 e!340487)))

(assert (=> b!595939 (= res!381771 (or (bvsge (size!18127 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18127 a!2986))))))

(declare-fun arrayContainsKey!0 (array!36998 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!595939 (arrayContainsKey!0 lt!270631 (select (arr!17763 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270626 () Unit!18730)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36998 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18730)

(assert (=> b!595939 (= lt!270626 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270631 (select (arr!17763 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!595941 () Bool)

(declare-fun res!381768 () Bool)

(assert (=> b!595941 (=> res!381768 e!340487)))

(assert (=> b!595941 (= res!381768 (contains!2939 Nil!11801 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595942 () Bool)

(declare-fun res!381762 () Bool)

(assert (=> b!595942 (=> (not res!381762) (not e!340486))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!595942 (= res!381762 (validKeyInArray!0 k!1786))))

(declare-fun b!595943 () Bool)

(declare-fun res!381763 () Bool)

(assert (=> b!595943 (=> (not res!381763) (not e!340484))))

(assert (=> b!595943 (= res!381763 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17763 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!595944 () Bool)

(declare-fun e!340489 () Bool)

(assert (=> b!595944 (= e!340480 e!340489)))

(declare-fun res!381769 () Bool)

(assert (=> b!595944 (=> res!381769 e!340489)))

(assert (=> b!595944 (= res!381769 (or (not (= (select (arr!17763 a!2986) j!136) lt!270637)) (not (= (select (arr!17763 a!2986) j!136) lt!270630)) (bvsge j!136 index!984)))))

(declare-fun b!595945 () Bool)

(declare-fun res!381772 () Bool)

(assert (=> b!595945 (=> (not res!381772) (not e!340486))))

(assert (=> b!595945 (= res!381772 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!595946 () Bool)

(declare-fun res!381776 () Bool)

(assert (=> b!595946 (=> (not res!381776) (not e!340484))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36998 (_ BitVec 32)) Bool)

(assert (=> b!595946 (= res!381776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!595947 () Bool)

(declare-fun res!381765 () Bool)

(assert (=> b!595947 (=> (not res!381765) (not e!340484))))

(declare-fun arrayNoDuplicates!0 (array!36998 (_ BitVec 32) List!11804) Bool)

(assert (=> b!595947 (= res!381765 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11801))))

(declare-fun b!595948 () Bool)

(declare-fun e!340479 () Bool)

(assert (=> b!595948 (= e!340479 (arrayContainsKey!0 lt!270631 (select (arr!17763 a!2986) j!136) index!984))))

(declare-fun b!595949 () Bool)

(declare-fun res!381767 () Bool)

(assert (=> b!595949 (=> (not res!381767) (not e!340486))))

(assert (=> b!595949 (= res!381767 (validKeyInArray!0 (select (arr!17763 a!2986) j!136)))))

(declare-fun b!595950 () Bool)

(assert (=> b!595950 (= e!340489 e!340479)))

(declare-fun res!381782 () Bool)

(assert (=> b!595950 (=> (not res!381782) (not e!340479))))

(assert (=> b!595950 (= res!381782 (arrayContainsKey!0 lt!270631 (select (arr!17763 a!2986) j!136) j!136))))

(declare-fun b!595951 () Bool)

(declare-fun Unit!18733 () Unit!18730)

(assert (=> b!595951 (= e!340488 Unit!18733)))

(assert (=> b!595951 false))

(declare-fun b!595952 () Bool)

(assert (=> b!595952 (= e!340484 e!340483)))

(declare-fun res!381766 () Bool)

(assert (=> b!595952 (=> (not res!381766) (not e!340483))))

(assert (=> b!595952 (= res!381766 (= (select (store (arr!17763 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!595952 (= lt!270631 (array!36999 (store (arr!17763 a!2986) i!1108 k!1786) (size!18127 a!2986)))))

(declare-fun b!595940 () Bool)

(declare-fun res!381780 () Bool)

(assert (=> b!595940 (=> res!381780 e!340487)))

(declare-fun noDuplicate!258 (List!11804) Bool)

(assert (=> b!595940 (= res!381780 (not (noDuplicate!258 Nil!11801)))))

(declare-fun res!381779 () Bool)

(assert (=> start!54538 (=> (not res!381779) (not e!340486))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54538 (= res!381779 (validMask!0 mask!3053))))

(assert (=> start!54538 e!340486))

(assert (=> start!54538 true))

(declare-fun array_inv!13559 (array!36998) Bool)

(assert (=> start!54538 (array_inv!13559 a!2986)))

(assert (= (and start!54538 res!381779) b!595930))

(assert (= (and b!595930 res!381774) b!595949))

(assert (= (and b!595949 res!381767) b!595942))

(assert (= (and b!595942 res!381762) b!595945))

(assert (= (and b!595945 res!381772) b!595938))

(assert (= (and b!595938 res!381777) b!595946))

(assert (= (and b!595946 res!381776) b!595947))

(assert (= (and b!595947 res!381765) b!595943))

(assert (= (and b!595943 res!381763) b!595952))

(assert (= (and b!595952 res!381766) b!595932))

(assert (= (and b!595932 res!381773) b!595936))

(assert (= (and b!595936 res!381770) b!595937))

(assert (= (and b!595936 c!67451) b!595951))

(assert (= (and b!595936 (not c!67451)) b!595933))

(assert (= (and b!595936 (not res!381764)) b!595931))

(assert (= (and b!595931 res!381781) b!595944))

(assert (= (and b!595944 (not res!381769)) b!595950))

(assert (= (and b!595950 res!381782) b!595948))

(assert (= (and b!595931 (not res!381775)) b!595939))

(assert (= (and b!595939 (not res!381771)) b!595940))

(assert (= (and b!595940 (not res!381780)) b!595935))

(assert (= (and b!595935 (not res!381778)) b!595941))

(assert (= (and b!595941 (not res!381768)) b!595934))

(declare-fun m!573503 () Bool)

(assert (=> b!595934 m!573503))

(declare-fun m!573505 () Bool)

(assert (=> b!595945 m!573505))

(declare-fun m!573507 () Bool)

(assert (=> b!595932 m!573507))

(declare-fun m!573509 () Bool)

(assert (=> b!595932 m!573509))

(assert (=> b!595932 m!573509))

(declare-fun m!573511 () Bool)

(assert (=> b!595932 m!573511))

(declare-fun m!573513 () Bool)

(assert (=> b!595940 m!573513))

(declare-fun m!573515 () Bool)

(assert (=> start!54538 m!573515))

(declare-fun m!573517 () Bool)

(assert (=> start!54538 m!573517))

(assert (=> b!595950 m!573509))

(assert (=> b!595950 m!573509))

(declare-fun m!573519 () Bool)

(assert (=> b!595950 m!573519))

(assert (=> b!595949 m!573509))

(assert (=> b!595949 m!573509))

(declare-fun m!573521 () Bool)

(assert (=> b!595949 m!573521))

(assert (=> b!595948 m!573509))

(assert (=> b!595948 m!573509))

(declare-fun m!573523 () Bool)

(assert (=> b!595948 m!573523))

(declare-fun m!573525 () Bool)

(assert (=> b!595947 m!573525))

(assert (=> b!595939 m!573509))

(assert (=> b!595939 m!573509))

(declare-fun m!573527 () Bool)

(assert (=> b!595939 m!573527))

(assert (=> b!595939 m!573509))

(declare-fun m!573529 () Bool)

(assert (=> b!595939 m!573529))

(declare-fun m!573531 () Bool)

(assert (=> b!595952 m!573531))

(declare-fun m!573533 () Bool)

(assert (=> b!595952 m!573533))

(assert (=> b!595931 m!573509))

(assert (=> b!595931 m!573531))

(declare-fun m!573535 () Bool)

(assert (=> b!595931 m!573535))

(declare-fun m!573537 () Bool)

(assert (=> b!595946 m!573537))

(declare-fun m!573539 () Bool)

(assert (=> b!595936 m!573539))

(assert (=> b!595936 m!573509))

(assert (=> b!595936 m!573531))

(declare-fun m!573541 () Bool)

(assert (=> b!595936 m!573541))

(assert (=> b!595936 m!573509))

(declare-fun m!573543 () Bool)

(assert (=> b!595936 m!573543))

(declare-fun m!573545 () Bool)

(assert (=> b!595936 m!573545))

(declare-fun m!573547 () Bool)

(assert (=> b!595936 m!573547))

(declare-fun m!573549 () Bool)

(assert (=> b!595936 m!573549))

(declare-fun m!573551 () Bool)

(assert (=> b!595941 m!573551))

(declare-fun m!573553 () Bool)

(assert (=> b!595943 m!573553))

(assert (=> b!595944 m!573509))

(declare-fun m!573555 () Bool)

(assert (=> b!595938 m!573555))

(declare-fun m!573557 () Bool)

(assert (=> b!595935 m!573557))

(declare-fun m!573559 () Bool)

(assert (=> b!595942 m!573559))

(push 1)

