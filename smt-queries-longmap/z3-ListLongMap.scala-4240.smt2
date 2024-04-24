; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58602 () Bool)

(assert start!58602)

(declare-fun b!646614 () Bool)

(declare-fun res!418935 () Bool)

(declare-fun e!370664 () Bool)

(assert (=> b!646614 (=> (not res!418935) (not e!370664))))

(declare-datatypes ((array!38475 0))(
  ( (array!38476 (arr!18445 (Array (_ BitVec 32) (_ BitVec 64))) (size!18809 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38475)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!646614 (= res!418935 (validKeyInArray!0 (select (arr!18445 a!2986) j!136)))))

(declare-fun b!646615 () Bool)

(declare-fun e!370663 () Bool)

(declare-fun e!370669 () Bool)

(assert (=> b!646615 (= e!370663 e!370669)))

(declare-fun res!418932 () Bool)

(assert (=> b!646615 (=> res!418932 e!370669)))

(declare-fun lt!299983 () (_ BitVec 64))

(declare-fun lt!299985 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!646615 (= res!418932 (or (not (= (select (arr!18445 a!2986) j!136) lt!299985)) (not (= (select (arr!18445 a!2986) j!136) lt!299983)) (bvsge j!136 index!984)))))

(declare-fun b!646616 () Bool)

(declare-fun e!370662 () Bool)

(declare-fun e!370661 () Bool)

(assert (=> b!646616 (= e!370662 (not e!370661))))

(declare-fun res!418938 () Bool)

(assert (=> b!646616 (=> res!418938 e!370661)))

(declare-datatypes ((SeekEntryResult!6841 0))(
  ( (MissingZero!6841 (index!29702 (_ BitVec 32))) (Found!6841 (index!29703 (_ BitVec 32))) (Intermediate!6841 (undefined!7653 Bool) (index!29704 (_ BitVec 32)) (x!58630 (_ BitVec 32))) (Undefined!6841) (MissingVacant!6841 (index!29705 (_ BitVec 32))) )
))
(declare-fun lt!299975 () SeekEntryResult!6841)

(assert (=> b!646616 (= res!418938 (not (= lt!299975 (Found!6841 index!984))))))

(declare-datatypes ((Unit!21945 0))(
  ( (Unit!21946) )
))
(declare-fun lt!299988 () Unit!21945)

(declare-fun e!370660 () Unit!21945)

(assert (=> b!646616 (= lt!299988 e!370660)))

(declare-fun c!74213 () Bool)

(assert (=> b!646616 (= c!74213 (= lt!299975 Undefined!6841))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!299979 () array!38475)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38475 (_ BitVec 32)) SeekEntryResult!6841)

(assert (=> b!646616 (= lt!299975 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!299985 lt!299979 mask!3053))))

(declare-fun e!370657 () Bool)

(assert (=> b!646616 e!370657))

(declare-fun res!418934 () Bool)

(assert (=> b!646616 (=> (not res!418934) (not e!370657))))

(declare-fun lt!299987 () (_ BitVec 32))

(declare-fun lt!299977 () SeekEntryResult!6841)

(assert (=> b!646616 (= res!418934 (= lt!299977 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299987 vacantSpotIndex!68 lt!299985 lt!299979 mask!3053)))))

(assert (=> b!646616 (= lt!299977 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299987 vacantSpotIndex!68 (select (arr!18445 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!646616 (= lt!299985 (select (store (arr!18445 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!299974 () Unit!21945)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38475 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21945)

(assert (=> b!646616 (= lt!299974 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299987 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!646616 (= lt!299987 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!646617 () Bool)

(declare-fun e!370668 () Bool)

(declare-fun arrayContainsKey!0 (array!38475 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!646617 (= e!370668 (arrayContainsKey!0 lt!299979 (select (arr!18445 a!2986) j!136) index!984))))

(declare-fun b!646618 () Bool)

(declare-fun Unit!21947 () Unit!21945)

(assert (=> b!646618 (= e!370660 Unit!21947)))

(declare-fun b!646619 () Bool)

(declare-fun e!370670 () Bool)

(assert (=> b!646619 (= e!370669 e!370670)))

(declare-fun res!418939 () Bool)

(assert (=> b!646619 (=> (not res!418939) (not e!370670))))

(assert (=> b!646619 (= res!418939 (arrayContainsKey!0 lt!299979 (select (arr!18445 a!2986) j!136) j!136))))

(declare-fun b!646620 () Bool)

(declare-fun res!418945 () Bool)

(declare-fun e!370659 () Bool)

(assert (=> b!646620 (=> (not res!418945) (not e!370659))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38475 (_ BitVec 32)) Bool)

(assert (=> b!646620 (= res!418945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!646621 () Bool)

(declare-fun e!370665 () Bool)

(declare-fun e!370666 () Bool)

(assert (=> b!646621 (= e!370665 e!370666)))

(declare-fun res!418943 () Bool)

(assert (=> b!646621 (=> res!418943 e!370666)))

(assert (=> b!646621 (= res!418943 (bvsge index!984 j!136))))

(declare-fun lt!299980 () Unit!21945)

(declare-fun e!370671 () Unit!21945)

(assert (=> b!646621 (= lt!299980 e!370671)))

(declare-fun c!74212 () Bool)

(assert (=> b!646621 (= c!74212 (bvslt j!136 index!984))))

(declare-fun b!646623 () Bool)

(declare-fun res!418942 () Bool)

(assert (=> b!646623 (=> (not res!418942) (not e!370659))))

(assert (=> b!646623 (= res!418942 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18445 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!646624 () Bool)

(declare-fun res!418937 () Bool)

(assert (=> b!646624 (=> (not res!418937) (not e!370659))))

(declare-datatypes ((List!12393 0))(
  ( (Nil!12390) (Cons!12389 (h!13437 (_ BitVec 64)) (t!18613 List!12393)) )
))
(declare-fun arrayNoDuplicates!0 (array!38475 (_ BitVec 32) List!12393) Bool)

(assert (=> b!646624 (= res!418937 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12390))))

(declare-fun b!646625 () Bool)

(assert (=> b!646625 (= e!370670 (arrayContainsKey!0 lt!299979 (select (arr!18445 a!2986) j!136) index!984))))

(declare-fun b!646626 () Bool)

(declare-fun e!370667 () Bool)

(assert (=> b!646626 (= e!370667 e!370662)))

(declare-fun res!418936 () Bool)

(assert (=> b!646626 (=> (not res!418936) (not e!370662))))

(declare-fun lt!299986 () SeekEntryResult!6841)

(assert (=> b!646626 (= res!418936 (and (= lt!299986 (Found!6841 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18445 a!2986) index!984) (select (arr!18445 a!2986) j!136))) (not (= (select (arr!18445 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!646626 (= lt!299986 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18445 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!646627 () Bool)

(assert (=> b!646627 (= e!370666 (or (bvsge (size!18809 a!2986) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!18809 a!2986))))))

(assert (=> b!646627 (arrayContainsKey!0 lt!299979 (select (arr!18445 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!299982 () Unit!21945)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38475 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21945)

(assert (=> b!646627 (= lt!299982 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299979 (select (arr!18445 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!646627 e!370668))

(declare-fun res!418928 () Bool)

(assert (=> b!646627 (=> (not res!418928) (not e!370668))))

(assert (=> b!646627 (= res!418928 (arrayContainsKey!0 lt!299979 (select (arr!18445 a!2986) j!136) j!136))))

(declare-fun b!646628 () Bool)

(assert (=> b!646628 (= e!370664 e!370659)))

(declare-fun res!418933 () Bool)

(assert (=> b!646628 (=> (not res!418933) (not e!370659))))

(declare-fun lt!299981 () SeekEntryResult!6841)

(assert (=> b!646628 (= res!418933 (or (= lt!299981 (MissingZero!6841 i!1108)) (= lt!299981 (MissingVacant!6841 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38475 (_ BitVec 32)) SeekEntryResult!6841)

(assert (=> b!646628 (= lt!299981 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!646629 () Bool)

(declare-fun res!418941 () Bool)

(assert (=> b!646629 (=> (not res!418941) (not e!370664))))

(assert (=> b!646629 (= res!418941 (validKeyInArray!0 k0!1786))))

(declare-fun b!646630 () Bool)

(declare-fun Unit!21948 () Unit!21945)

(assert (=> b!646630 (= e!370671 Unit!21948)))

(declare-fun lt!299978 () Unit!21945)

(assert (=> b!646630 (= lt!299978 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299979 (select (arr!18445 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!646630 (arrayContainsKey!0 lt!299979 (select (arr!18445 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!299976 () Unit!21945)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38475 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12393) Unit!21945)

(assert (=> b!646630 (= lt!299976 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12390))))

(assert (=> b!646630 (arrayNoDuplicates!0 lt!299979 #b00000000000000000000000000000000 Nil!12390)))

(declare-fun lt!299984 () Unit!21945)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38475 (_ BitVec 32) (_ BitVec 32)) Unit!21945)

(assert (=> b!646630 (= lt!299984 (lemmaNoDuplicateFromThenFromBigger!0 lt!299979 #b00000000000000000000000000000000 j!136))))

(assert (=> b!646630 (arrayNoDuplicates!0 lt!299979 j!136 Nil!12390)))

(declare-fun lt!299989 () Unit!21945)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38475 (_ BitVec 64) (_ BitVec 32) List!12393) Unit!21945)

(assert (=> b!646630 (= lt!299989 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!299979 (select (arr!18445 a!2986) j!136) j!136 Nil!12390))))

(assert (=> b!646630 false))

(declare-fun b!646631 () Bool)

(declare-fun Unit!21949 () Unit!21945)

(assert (=> b!646631 (= e!370671 Unit!21949)))

(declare-fun b!646632 () Bool)

(assert (=> b!646632 (= e!370661 e!370665)))

(declare-fun res!418944 () Bool)

(assert (=> b!646632 (=> res!418944 e!370665)))

(assert (=> b!646632 (= res!418944 (or (not (= (select (arr!18445 a!2986) j!136) lt!299985)) (not (= (select (arr!18445 a!2986) j!136) lt!299983))))))

(assert (=> b!646632 e!370663))

(declare-fun res!418940 () Bool)

(assert (=> b!646632 (=> (not res!418940) (not e!370663))))

(assert (=> b!646632 (= res!418940 (= lt!299983 (select (arr!18445 a!2986) j!136)))))

(assert (=> b!646632 (= lt!299983 (select (store (arr!18445 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!646633 () Bool)

(declare-fun res!418927 () Bool)

(assert (=> b!646633 (=> (not res!418927) (not e!370664))))

(assert (=> b!646633 (= res!418927 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!646634 () Bool)

(assert (=> b!646634 (= e!370657 (= lt!299986 lt!299977))))

(declare-fun res!418931 () Bool)

(assert (=> start!58602 (=> (not res!418931) (not e!370664))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58602 (= res!418931 (validMask!0 mask!3053))))

(assert (=> start!58602 e!370664))

(assert (=> start!58602 true))

(declare-fun array_inv!14304 (array!38475) Bool)

(assert (=> start!58602 (array_inv!14304 a!2986)))

(declare-fun b!646622 () Bool)

(declare-fun Unit!21950 () Unit!21945)

(assert (=> b!646622 (= e!370660 Unit!21950)))

(assert (=> b!646622 false))

(declare-fun b!646635 () Bool)

(assert (=> b!646635 (= e!370659 e!370667)))

(declare-fun res!418929 () Bool)

(assert (=> b!646635 (=> (not res!418929) (not e!370667))))

(assert (=> b!646635 (= res!418929 (= (select (store (arr!18445 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!646635 (= lt!299979 (array!38476 (store (arr!18445 a!2986) i!1108 k0!1786) (size!18809 a!2986)))))

(declare-fun b!646636 () Bool)

(declare-fun res!418930 () Bool)

(assert (=> b!646636 (=> (not res!418930) (not e!370664))))

(assert (=> b!646636 (= res!418930 (and (= (size!18809 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18809 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18809 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!58602 res!418931) b!646636))

(assert (= (and b!646636 res!418930) b!646614))

(assert (= (and b!646614 res!418935) b!646629))

(assert (= (and b!646629 res!418941) b!646633))

(assert (= (and b!646633 res!418927) b!646628))

(assert (= (and b!646628 res!418933) b!646620))

(assert (= (and b!646620 res!418945) b!646624))

(assert (= (and b!646624 res!418937) b!646623))

(assert (= (and b!646623 res!418942) b!646635))

(assert (= (and b!646635 res!418929) b!646626))

(assert (= (and b!646626 res!418936) b!646616))

(assert (= (and b!646616 res!418934) b!646634))

(assert (= (and b!646616 c!74213) b!646622))

(assert (= (and b!646616 (not c!74213)) b!646618))

(assert (= (and b!646616 (not res!418938)) b!646632))

(assert (= (and b!646632 res!418940) b!646615))

(assert (= (and b!646615 (not res!418932)) b!646619))

(assert (= (and b!646619 res!418939) b!646625))

(assert (= (and b!646632 (not res!418944)) b!646621))

(assert (= (and b!646621 c!74212) b!646630))

(assert (= (and b!646621 (not c!74212)) b!646631))

(assert (= (and b!646621 (not res!418943)) b!646627))

(assert (= (and b!646627 res!418928) b!646617))

(declare-fun m!620497 () Bool)

(assert (=> b!646632 m!620497))

(declare-fun m!620499 () Bool)

(assert (=> b!646632 m!620499))

(declare-fun m!620501 () Bool)

(assert (=> b!646632 m!620501))

(declare-fun m!620503 () Bool)

(assert (=> b!646624 m!620503))

(declare-fun m!620505 () Bool)

(assert (=> b!646628 m!620505))

(assert (=> b!646627 m!620497))

(assert (=> b!646627 m!620497))

(declare-fun m!620507 () Bool)

(assert (=> b!646627 m!620507))

(assert (=> b!646627 m!620497))

(declare-fun m!620509 () Bool)

(assert (=> b!646627 m!620509))

(assert (=> b!646627 m!620497))

(declare-fun m!620511 () Bool)

(assert (=> b!646627 m!620511))

(declare-fun m!620513 () Bool)

(assert (=> b!646616 m!620513))

(declare-fun m!620515 () Bool)

(assert (=> b!646616 m!620515))

(declare-fun m!620517 () Bool)

(assert (=> b!646616 m!620517))

(assert (=> b!646616 m!620497))

(declare-fun m!620519 () Bool)

(assert (=> b!646616 m!620519))

(declare-fun m!620521 () Bool)

(assert (=> b!646616 m!620521))

(assert (=> b!646616 m!620497))

(declare-fun m!620523 () Bool)

(assert (=> b!646616 m!620523))

(assert (=> b!646616 m!620499))

(assert (=> b!646635 m!620499))

(declare-fun m!620525 () Bool)

(assert (=> b!646635 m!620525))

(assert (=> b!646625 m!620497))

(assert (=> b!646625 m!620497))

(declare-fun m!620527 () Bool)

(assert (=> b!646625 m!620527))

(declare-fun m!620529 () Bool)

(assert (=> b!646629 m!620529))

(declare-fun m!620531 () Bool)

(assert (=> b!646626 m!620531))

(assert (=> b!646626 m!620497))

(assert (=> b!646626 m!620497))

(declare-fun m!620533 () Bool)

(assert (=> b!646626 m!620533))

(declare-fun m!620535 () Bool)

(assert (=> start!58602 m!620535))

(declare-fun m!620537 () Bool)

(assert (=> start!58602 m!620537))

(declare-fun m!620539 () Bool)

(assert (=> b!646623 m!620539))

(assert (=> b!646614 m!620497))

(assert (=> b!646614 m!620497))

(declare-fun m!620541 () Bool)

(assert (=> b!646614 m!620541))

(assert (=> b!646617 m!620497))

(assert (=> b!646617 m!620497))

(assert (=> b!646617 m!620527))

(declare-fun m!620543 () Bool)

(assert (=> b!646630 m!620543))

(assert (=> b!646630 m!620497))

(assert (=> b!646630 m!620497))

(declare-fun m!620545 () Bool)

(assert (=> b!646630 m!620545))

(assert (=> b!646630 m!620497))

(declare-fun m!620547 () Bool)

(assert (=> b!646630 m!620547))

(assert (=> b!646630 m!620497))

(declare-fun m!620549 () Bool)

(assert (=> b!646630 m!620549))

(declare-fun m!620551 () Bool)

(assert (=> b!646630 m!620551))

(declare-fun m!620553 () Bool)

(assert (=> b!646630 m!620553))

(declare-fun m!620555 () Bool)

(assert (=> b!646630 m!620555))

(declare-fun m!620557 () Bool)

(assert (=> b!646620 m!620557))

(declare-fun m!620559 () Bool)

(assert (=> b!646633 m!620559))

(assert (=> b!646619 m!620497))

(assert (=> b!646619 m!620497))

(assert (=> b!646619 m!620511))

(assert (=> b!646615 m!620497))

(check-sat (not start!58602) (not b!646625) (not b!646617) (not b!646629) (not b!646620) (not b!646616) (not b!646633) (not b!646619) (not b!646628) (not b!646627) (not b!646614) (not b!646630) (not b!646624) (not b!646626))
(check-sat)
