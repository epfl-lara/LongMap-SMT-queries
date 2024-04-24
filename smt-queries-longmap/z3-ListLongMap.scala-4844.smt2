; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66880 () Bool)

(assert start!66880)

(declare-fun b!769901 () Bool)

(declare-fun res!520484 () Bool)

(declare-fun e!428783 () Bool)

(assert (=> b!769901 (=> (not res!520484) (not e!428783))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!769901 (= res!520484 (validKeyInArray!0 k0!2102))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42322 0))(
  ( (array!42323 (arr!20257 (Array (_ BitVec 32) (_ BitVec 64))) (size!20677 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42322)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!769902 () Bool)

(declare-datatypes ((SeekEntryResult!7813 0))(
  ( (MissingZero!7813 (index!33620 (_ BitVec 32))) (Found!7813 (index!33621 (_ BitVec 32))) (Intermediate!7813 (undefined!8625 Bool) (index!33622 (_ BitVec 32)) (x!64715 (_ BitVec 32))) (Undefined!7813) (MissingVacant!7813 (index!33623 (_ BitVec 32))) )
))
(declare-fun lt!342521 () SeekEntryResult!7813)

(declare-fun e!428776 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42322 (_ BitVec 32)) SeekEntryResult!7813)

(assert (=> b!769902 (= e!428776 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20257 a!3186) j!159) a!3186 mask!3328) lt!342521))))

(declare-fun e!428781 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!342518 () SeekEntryResult!7813)

(declare-fun b!769903 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42322 (_ BitVec 32)) SeekEntryResult!7813)

(assert (=> b!769903 (= e!428781 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20257 a!3186) j!159) a!3186 mask!3328) lt!342518))))

(declare-fun b!769904 () Bool)

(declare-fun res!520491 () Bool)

(declare-fun e!428780 () Bool)

(assert (=> b!769904 (=> (not res!520491) (not e!428780))))

(declare-datatypes ((List!14166 0))(
  ( (Nil!14163) (Cons!14162 (h!15267 (_ BitVec 64)) (t!20473 List!14166)) )
))
(declare-fun arrayNoDuplicates!0 (array!42322 (_ BitVec 32) List!14166) Bool)

(assert (=> b!769904 (= res!520491 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14163))))

(declare-fun b!769905 () Bool)

(declare-fun e!428782 () Bool)

(declare-fun e!428779 () Bool)

(assert (=> b!769905 (= e!428782 e!428779)))

(declare-fun res!520488 () Bool)

(assert (=> b!769905 (=> (not res!520488) (not e!428779))))

(declare-fun lt!342517 () SeekEntryResult!7813)

(declare-fun lt!342522 () SeekEntryResult!7813)

(assert (=> b!769905 (= res!520488 (= lt!342517 lt!342522))))

(declare-fun lt!342520 () array!42322)

(declare-fun lt!342516 () (_ BitVec 64))

(assert (=> b!769905 (= lt!342522 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342516 lt!342520 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769905 (= lt!342517 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342516 mask!3328) lt!342516 lt!342520 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!769905 (= lt!342516 (select (store (arr!20257 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!769905 (= lt!342520 (array!42323 (store (arr!20257 a!3186) i!1173 k0!2102) (size!20677 a!3186)))))

(declare-fun b!769906 () Bool)

(declare-fun res!520477 () Bool)

(assert (=> b!769906 (=> (not res!520477) (not e!428780))))

(assert (=> b!769906 (= res!520477 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20677 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20677 a!3186))))))

(declare-fun b!769907 () Bool)

(declare-fun res!520482 () Bool)

(assert (=> b!769907 (=> (not res!520482) (not e!428782))))

(assert (=> b!769907 (= res!520482 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20257 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!769908 () Bool)

(assert (=> b!769908 (= e!428780 e!428782)))

(declare-fun res!520476 () Bool)

(assert (=> b!769908 (=> (not res!520476) (not e!428782))))

(assert (=> b!769908 (= res!520476 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20257 a!3186) j!159) mask!3328) (select (arr!20257 a!3186) j!159) a!3186 mask!3328) lt!342518))))

(assert (=> b!769908 (= lt!342518 (Intermediate!7813 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!769909 () Bool)

(declare-fun res!520486 () Bool)

(assert (=> b!769909 (=> (not res!520486) (not e!428783))))

(declare-fun arrayContainsKey!0 (array!42322 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!769909 (= res!520486 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!769910 () Bool)

(declare-fun res!520483 () Bool)

(assert (=> b!769910 (=> (not res!520483) (not e!428783))))

(assert (=> b!769910 (= res!520483 (and (= (size!20677 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20677 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20677 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!769911 () Bool)

(declare-datatypes ((Unit!26443 0))(
  ( (Unit!26444) )
))
(declare-fun e!428784 () Unit!26443)

(declare-fun Unit!26445 () Unit!26443)

(assert (=> b!769911 (= e!428784 Unit!26445)))

(declare-fun lt!342524 () SeekEntryResult!7813)

(assert (=> b!769911 (= lt!342524 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20257 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!342519 () (_ BitVec 32))

(assert (=> b!769911 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342519 resIntermediateIndex!5 (select (arr!20257 a!3186) j!159) a!3186 mask!3328) (Found!7813 j!159))))

(declare-fun b!769912 () Bool)

(declare-fun Unit!26446 () Unit!26443)

(assert (=> b!769912 (= e!428784 Unit!26446)))

(assert (=> b!769912 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342519 (select (arr!20257 a!3186) j!159) a!3186 mask!3328) lt!342518)))

(declare-fun b!769913 () Bool)

(assert (=> b!769913 (= e!428783 e!428780)))

(declare-fun res!520480 () Bool)

(assert (=> b!769913 (=> (not res!520480) (not e!428780))))

(declare-fun lt!342526 () SeekEntryResult!7813)

(assert (=> b!769913 (= res!520480 (or (= lt!342526 (MissingZero!7813 i!1173)) (= lt!342526 (MissingVacant!7813 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42322 (_ BitVec 32)) SeekEntryResult!7813)

(assert (=> b!769913 (= lt!342526 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!769914 () Bool)

(declare-fun res!520487 () Bool)

(assert (=> b!769914 (=> (not res!520487) (not e!428782))))

(assert (=> b!769914 (= res!520487 e!428781)))

(declare-fun c!85112 () Bool)

(assert (=> b!769914 (= c!85112 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!769915 () Bool)

(declare-fun res!520479 () Bool)

(assert (=> b!769915 (=> (not res!520479) (not e!428780))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42322 (_ BitVec 32)) Bool)

(assert (=> b!769915 (= res!520479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!520478 () Bool)

(assert (=> start!66880 (=> (not res!520478) (not e!428783))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66880 (= res!520478 (validMask!0 mask!3328))))

(assert (=> start!66880 e!428783))

(assert (=> start!66880 true))

(declare-fun array_inv!16116 (array!42322) Bool)

(assert (=> start!66880 (array_inv!16116 a!3186)))

(declare-fun b!769916 () Bool)

(declare-fun e!428785 () Bool)

(assert (=> b!769916 (= e!428779 (not e!428785))))

(declare-fun res!520490 () Bool)

(assert (=> b!769916 (=> res!520490 e!428785)))

(get-info :version)

(assert (=> b!769916 (= res!520490 (or (not ((_ is Intermediate!7813) lt!342522)) (bvsge x!1131 (x!64715 lt!342522))))))

(declare-fun e!428777 () Bool)

(assert (=> b!769916 e!428777))

(declare-fun res!520489 () Bool)

(assert (=> b!769916 (=> (not res!520489) (not e!428777))))

(assert (=> b!769916 (= res!520489 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!342525 () Unit!26443)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42322 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26443)

(assert (=> b!769916 (= lt!342525 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!769917 () Bool)

(assert (=> b!769917 (= e!428785 true)))

(declare-fun lt!342523 () Unit!26443)

(assert (=> b!769917 (= lt!342523 e!428784)))

(declare-fun c!85111 () Bool)

(assert (=> b!769917 (= c!85111 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769917 (= lt!342519 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!769918 () Bool)

(assert (=> b!769918 (= e!428777 e!428776)))

(declare-fun res!520481 () Bool)

(assert (=> b!769918 (=> (not res!520481) (not e!428776))))

(assert (=> b!769918 (= res!520481 (= (seekEntryOrOpen!0 (select (arr!20257 a!3186) j!159) a!3186 mask!3328) lt!342521))))

(assert (=> b!769918 (= lt!342521 (Found!7813 j!159))))

(declare-fun b!769919 () Bool)

(declare-fun res!520485 () Bool)

(assert (=> b!769919 (=> (not res!520485) (not e!428783))))

(assert (=> b!769919 (= res!520485 (validKeyInArray!0 (select (arr!20257 a!3186) j!159)))))

(declare-fun b!769920 () Bool)

(assert (=> b!769920 (= e!428781 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20257 a!3186) j!159) a!3186 mask!3328) (Found!7813 j!159)))))

(assert (= (and start!66880 res!520478) b!769910))

(assert (= (and b!769910 res!520483) b!769919))

(assert (= (and b!769919 res!520485) b!769901))

(assert (= (and b!769901 res!520484) b!769909))

(assert (= (and b!769909 res!520486) b!769913))

(assert (= (and b!769913 res!520480) b!769915))

(assert (= (and b!769915 res!520479) b!769904))

(assert (= (and b!769904 res!520491) b!769906))

(assert (= (and b!769906 res!520477) b!769908))

(assert (= (and b!769908 res!520476) b!769907))

(assert (= (and b!769907 res!520482) b!769914))

(assert (= (and b!769914 c!85112) b!769903))

(assert (= (and b!769914 (not c!85112)) b!769920))

(assert (= (and b!769914 res!520487) b!769905))

(assert (= (and b!769905 res!520488) b!769916))

(assert (= (and b!769916 res!520489) b!769918))

(assert (= (and b!769918 res!520481) b!769902))

(assert (= (and b!769916 (not res!520490)) b!769917))

(assert (= (and b!769917 c!85111) b!769912))

(assert (= (and b!769917 (not c!85111)) b!769911))

(declare-fun m!715739 () Bool)

(assert (=> b!769903 m!715739))

(assert (=> b!769903 m!715739))

(declare-fun m!715741 () Bool)

(assert (=> b!769903 m!715741))

(assert (=> b!769902 m!715739))

(assert (=> b!769902 m!715739))

(declare-fun m!715743 () Bool)

(assert (=> b!769902 m!715743))

(declare-fun m!715745 () Bool)

(assert (=> start!66880 m!715745))

(declare-fun m!715747 () Bool)

(assert (=> start!66880 m!715747))

(declare-fun m!715749 () Bool)

(assert (=> b!769917 m!715749))

(assert (=> b!769908 m!715739))

(assert (=> b!769908 m!715739))

(declare-fun m!715751 () Bool)

(assert (=> b!769908 m!715751))

(assert (=> b!769908 m!715751))

(assert (=> b!769908 m!715739))

(declare-fun m!715753 () Bool)

(assert (=> b!769908 m!715753))

(assert (=> b!769912 m!715739))

(assert (=> b!769912 m!715739))

(declare-fun m!715755 () Bool)

(assert (=> b!769912 m!715755))

(declare-fun m!715757 () Bool)

(assert (=> b!769901 m!715757))

(declare-fun m!715759 () Bool)

(assert (=> b!769913 m!715759))

(declare-fun m!715761 () Bool)

(assert (=> b!769907 m!715761))

(assert (=> b!769911 m!715739))

(assert (=> b!769911 m!715739))

(declare-fun m!715763 () Bool)

(assert (=> b!769911 m!715763))

(assert (=> b!769911 m!715739))

(declare-fun m!715765 () Bool)

(assert (=> b!769911 m!715765))

(assert (=> b!769919 m!715739))

(assert (=> b!769919 m!715739))

(declare-fun m!715767 () Bool)

(assert (=> b!769919 m!715767))

(declare-fun m!715769 () Bool)

(assert (=> b!769909 m!715769))

(assert (=> b!769918 m!715739))

(assert (=> b!769918 m!715739))

(declare-fun m!715771 () Bool)

(assert (=> b!769918 m!715771))

(declare-fun m!715773 () Bool)

(assert (=> b!769915 m!715773))

(declare-fun m!715775 () Bool)

(assert (=> b!769916 m!715775))

(declare-fun m!715777 () Bool)

(assert (=> b!769916 m!715777))

(declare-fun m!715779 () Bool)

(assert (=> b!769904 m!715779))

(assert (=> b!769920 m!715739))

(assert (=> b!769920 m!715739))

(assert (=> b!769920 m!715763))

(declare-fun m!715781 () Bool)

(assert (=> b!769905 m!715781))

(declare-fun m!715783 () Bool)

(assert (=> b!769905 m!715783))

(declare-fun m!715785 () Bool)

(assert (=> b!769905 m!715785))

(declare-fun m!715787 () Bool)

(assert (=> b!769905 m!715787))

(declare-fun m!715789 () Bool)

(assert (=> b!769905 m!715789))

(assert (=> b!769905 m!715781))

(check-sat (not b!769909) (not b!769912) (not b!769919) (not b!769913) (not start!66880) (not b!769904) (not b!769911) (not b!769918) (not b!769915) (not b!769920) (not b!769908) (not b!769903) (not b!769901) (not b!769905) (not b!769917) (not b!769902) (not b!769916))
(check-sat)
