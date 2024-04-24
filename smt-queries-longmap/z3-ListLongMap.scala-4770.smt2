; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65808 () Bool)

(assert start!65808)

(declare-fun b!753618 () Bool)

(declare-fun e!420420 () Bool)

(declare-fun e!420414 () Bool)

(assert (=> b!753618 (= e!420420 (not e!420414))))

(declare-fun res!508803 () Bool)

(assert (=> b!753618 (=> res!508803 e!420414)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7591 0))(
  ( (MissingZero!7591 (index!32732 (_ BitVec 32))) (Found!7591 (index!32733 (_ BitVec 32))) (Intermediate!7591 (undefined!8403 Bool) (index!32734 (_ BitVec 32)) (x!63809 (_ BitVec 32))) (Undefined!7591) (MissingVacant!7591 (index!32735 (_ BitVec 32))) )
))
(declare-fun lt!335247 () SeekEntryResult!7591)

(declare-fun index!1321 () (_ BitVec 32))

(get-info :version)

(assert (=> b!753618 (= res!508803 (or (not ((_ is Intermediate!7591) lt!335247)) (bvslt x!1131 (x!63809 lt!335247)) (not (= x!1131 (x!63809 lt!335247))) (not (= index!1321 (index!32734 lt!335247)))))))

(declare-fun e!420418 () Bool)

(assert (=> b!753618 e!420418))

(declare-fun res!508807 () Bool)

(assert (=> b!753618 (=> (not res!508807) (not e!420418))))

(declare-fun lt!335242 () SeekEntryResult!7591)

(declare-fun lt!335248 () SeekEntryResult!7591)

(assert (=> b!753618 (= res!508807 (= lt!335242 lt!335248))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!753618 (= lt!335248 (Found!7591 j!159))))

(declare-datatypes ((array!41851 0))(
  ( (array!41852 (arr!20035 (Array (_ BitVec 32) (_ BitVec 64))) (size!20455 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41851)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41851 (_ BitVec 32)) SeekEntryResult!7591)

(assert (=> b!753618 (= lt!335242 (seekEntryOrOpen!0 (select (arr!20035 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41851 (_ BitVec 32)) Bool)

(assert (=> b!753618 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25921 0))(
  ( (Unit!25922) )
))
(declare-fun lt!335249 () Unit!25921)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41851 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25921)

(assert (=> b!753618 (= lt!335249 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!753619 () Bool)

(declare-fun e!420421 () Bool)

(declare-fun e!420416 () Bool)

(assert (=> b!753619 (= e!420421 e!420416)))

(declare-fun res!508811 () Bool)

(assert (=> b!753619 (=> (not res!508811) (not e!420416))))

(declare-fun lt!335246 () SeekEntryResult!7591)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!753619 (= res!508811 (or (= lt!335246 (MissingZero!7591 i!1173)) (= lt!335246 (MissingVacant!7591 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!753619 (= lt!335246 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!753620 () Bool)

(declare-fun e!420413 () Unit!25921)

(declare-fun Unit!25923 () Unit!25921)

(assert (=> b!753620 (= e!420413 Unit!25923)))

(assert (=> b!753620 false))

(declare-fun b!753621 () Bool)

(declare-fun e!420412 () Bool)

(assert (=> b!753621 (= e!420412 true)))

(declare-fun e!420419 () Bool)

(assert (=> b!753621 e!420419))

(declare-fun res!508801 () Bool)

(assert (=> b!753621 (=> (not res!508801) (not e!420419))))

(declare-fun lt!335245 () (_ BitVec 64))

(assert (=> b!753621 (= res!508801 (= lt!335245 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!335250 () Unit!25921)

(assert (=> b!753621 (= lt!335250 e!420413)))

(declare-fun c!82793 () Bool)

(assert (=> b!753621 (= c!82793 (= lt!335245 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!753622 () Bool)

(declare-fun e!420422 () Bool)

(assert (=> b!753622 (= e!420422 e!420412)))

(declare-fun res!508806 () Bool)

(assert (=> b!753622 (=> res!508806 e!420412)))

(declare-fun lt!335243 () (_ BitVec 64))

(assert (=> b!753622 (= res!508806 (= lt!335245 lt!335243))))

(assert (=> b!753622 (= lt!335245 (select (store (arr!20035 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!753623 () Bool)

(declare-fun res!508812 () Bool)

(declare-fun e!420415 () Bool)

(assert (=> b!753623 (=> (not res!508812) (not e!420415))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!753623 (= res!508812 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20035 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!753624 () Bool)

(declare-fun res!508815 () Bool)

(assert (=> b!753624 (=> (not res!508815) (not e!420421))))

(assert (=> b!753624 (= res!508815 (and (= (size!20455 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20455 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20455 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!753625 () Bool)

(assert (=> b!753625 (= e!420416 e!420415)))

(declare-fun res!508802 () Bool)

(assert (=> b!753625 (=> (not res!508802) (not e!420415))))

(declare-fun lt!335239 () SeekEntryResult!7591)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41851 (_ BitVec 32)) SeekEntryResult!7591)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!753625 (= res!508802 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20035 a!3186) j!159) mask!3328) (select (arr!20035 a!3186) j!159) a!3186 mask!3328) lt!335239))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!753625 (= lt!335239 (Intermediate!7591 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!753626 () Bool)

(declare-fun res!508816 () Bool)

(assert (=> b!753626 (=> (not res!508816) (not e!420416))))

(assert (=> b!753626 (= res!508816 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20455 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20455 a!3186))))))

(declare-fun b!753627 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41851 (_ BitVec 32)) SeekEntryResult!7591)

(assert (=> b!753627 (= e!420418 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20035 a!3186) j!159) a!3186 mask!3328) lt!335248))))

(declare-fun b!753628 () Bool)

(assert (=> b!753628 (= e!420415 e!420420)))

(declare-fun res!508817 () Bool)

(assert (=> b!753628 (=> (not res!508817) (not e!420420))))

(declare-fun lt!335241 () SeekEntryResult!7591)

(assert (=> b!753628 (= res!508817 (= lt!335241 lt!335247))))

(declare-fun lt!335244 () array!41851)

(assert (=> b!753628 (= lt!335247 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335243 lt!335244 mask!3328))))

(assert (=> b!753628 (= lt!335241 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335243 mask!3328) lt!335243 lt!335244 mask!3328))))

(assert (=> b!753628 (= lt!335243 (select (store (arr!20035 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!753628 (= lt!335244 (array!41852 (store (arr!20035 a!3186) i!1173 k0!2102) (size!20455 a!3186)))))

(declare-fun b!753629 () Bool)

(declare-fun res!508814 () Bool)

(assert (=> b!753629 (=> (not res!508814) (not e!420421))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!753629 (= res!508814 (validKeyInArray!0 k0!2102))))

(declare-fun b!753630 () Bool)

(assert (=> b!753630 (= e!420414 e!420422)))

(declare-fun res!508818 () Bool)

(assert (=> b!753630 (=> res!508818 e!420422)))

(declare-fun lt!335240 () SeekEntryResult!7591)

(assert (=> b!753630 (= res!508818 (not (= lt!335240 lt!335248)))))

(assert (=> b!753630 (= lt!335240 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20035 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!753631 () Bool)

(declare-fun Unit!25924 () Unit!25921)

(assert (=> b!753631 (= e!420413 Unit!25924)))

(declare-fun res!508810 () Bool)

(assert (=> start!65808 (=> (not res!508810) (not e!420421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65808 (= res!508810 (validMask!0 mask!3328))))

(assert (=> start!65808 e!420421))

(assert (=> start!65808 true))

(declare-fun array_inv!15894 (array!41851) Bool)

(assert (=> start!65808 (array_inv!15894 a!3186)))

(declare-fun b!753632 () Bool)

(declare-fun res!508804 () Bool)

(assert (=> b!753632 (=> (not res!508804) (not e!420421))))

(assert (=> b!753632 (= res!508804 (validKeyInArray!0 (select (arr!20035 a!3186) j!159)))))

(declare-fun e!420417 () Bool)

(declare-fun b!753633 () Bool)

(assert (=> b!753633 (= e!420417 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20035 a!3186) j!159) a!3186 mask!3328) (Found!7591 j!159)))))

(declare-fun b!753634 () Bool)

(declare-fun res!508808 () Bool)

(assert (=> b!753634 (=> (not res!508808) (not e!420416))))

(declare-datatypes ((List!13944 0))(
  ( (Nil!13941) (Cons!13940 (h!15018 (_ BitVec 64)) (t!20251 List!13944)) )
))
(declare-fun arrayNoDuplicates!0 (array!41851 (_ BitVec 32) List!13944) Bool)

(assert (=> b!753634 (= res!508808 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13941))))

(declare-fun b!753635 () Bool)

(declare-fun res!508805 () Bool)

(assert (=> b!753635 (=> (not res!508805) (not e!420421))))

(declare-fun arrayContainsKey!0 (array!41851 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!753635 (= res!508805 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!753636 () Bool)

(assert (=> b!753636 (= e!420417 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20035 a!3186) j!159) a!3186 mask!3328) lt!335239))))

(declare-fun b!753637 () Bool)

(declare-fun res!508813 () Bool)

(assert (=> b!753637 (=> (not res!508813) (not e!420419))))

(assert (=> b!753637 (= res!508813 (= (seekEntryOrOpen!0 lt!335243 lt!335244 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335243 lt!335244 mask!3328)))))

(declare-fun b!753638 () Bool)

(declare-fun res!508809 () Bool)

(assert (=> b!753638 (=> (not res!508809) (not e!420416))))

(assert (=> b!753638 (= res!508809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!753639 () Bool)

(assert (=> b!753639 (= e!420419 (= lt!335242 lt!335240))))

(declare-fun b!753640 () Bool)

(declare-fun res!508819 () Bool)

(assert (=> b!753640 (=> (not res!508819) (not e!420415))))

(assert (=> b!753640 (= res!508819 e!420417)))

(declare-fun c!82792 () Bool)

(assert (=> b!753640 (= c!82792 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!65808 res!508810) b!753624))

(assert (= (and b!753624 res!508815) b!753632))

(assert (= (and b!753632 res!508804) b!753629))

(assert (= (and b!753629 res!508814) b!753635))

(assert (= (and b!753635 res!508805) b!753619))

(assert (= (and b!753619 res!508811) b!753638))

(assert (= (and b!753638 res!508809) b!753634))

(assert (= (and b!753634 res!508808) b!753626))

(assert (= (and b!753626 res!508816) b!753625))

(assert (= (and b!753625 res!508802) b!753623))

(assert (= (and b!753623 res!508812) b!753640))

(assert (= (and b!753640 c!82792) b!753636))

(assert (= (and b!753640 (not c!82792)) b!753633))

(assert (= (and b!753640 res!508819) b!753628))

(assert (= (and b!753628 res!508817) b!753618))

(assert (= (and b!753618 res!508807) b!753627))

(assert (= (and b!753618 (not res!508803)) b!753630))

(assert (= (and b!753630 (not res!508818)) b!753622))

(assert (= (and b!753622 (not res!508806)) b!753621))

(assert (= (and b!753621 c!82793) b!753620))

(assert (= (and b!753621 (not c!82793)) b!753631))

(assert (= (and b!753621 res!508801) b!753637))

(assert (= (and b!753637 res!508813) b!753639))

(declare-fun m!702867 () Bool)

(assert (=> b!753619 m!702867))

(declare-fun m!702869 () Bool)

(assert (=> b!753623 m!702869))

(declare-fun m!702871 () Bool)

(assert (=> b!753634 m!702871))

(declare-fun m!702873 () Bool)

(assert (=> b!753625 m!702873))

(assert (=> b!753625 m!702873))

(declare-fun m!702875 () Bool)

(assert (=> b!753625 m!702875))

(assert (=> b!753625 m!702875))

(assert (=> b!753625 m!702873))

(declare-fun m!702877 () Bool)

(assert (=> b!753625 m!702877))

(assert (=> b!753632 m!702873))

(assert (=> b!753632 m!702873))

(declare-fun m!702879 () Bool)

(assert (=> b!753632 m!702879))

(declare-fun m!702881 () Bool)

(assert (=> b!753635 m!702881))

(declare-fun m!702883 () Bool)

(assert (=> b!753628 m!702883))

(declare-fun m!702885 () Bool)

(assert (=> b!753628 m!702885))

(declare-fun m!702887 () Bool)

(assert (=> b!753628 m!702887))

(declare-fun m!702889 () Bool)

(assert (=> b!753628 m!702889))

(assert (=> b!753628 m!702887))

(declare-fun m!702891 () Bool)

(assert (=> b!753628 m!702891))

(declare-fun m!702893 () Bool)

(assert (=> b!753638 m!702893))

(declare-fun m!702895 () Bool)

(assert (=> b!753629 m!702895))

(declare-fun m!702897 () Bool)

(assert (=> b!753637 m!702897))

(declare-fun m!702899 () Bool)

(assert (=> b!753637 m!702899))

(assert (=> b!753622 m!702885))

(declare-fun m!702901 () Bool)

(assert (=> b!753622 m!702901))

(declare-fun m!702903 () Bool)

(assert (=> start!65808 m!702903))

(declare-fun m!702905 () Bool)

(assert (=> start!65808 m!702905))

(assert (=> b!753630 m!702873))

(assert (=> b!753630 m!702873))

(declare-fun m!702907 () Bool)

(assert (=> b!753630 m!702907))

(assert (=> b!753633 m!702873))

(assert (=> b!753633 m!702873))

(assert (=> b!753633 m!702907))

(assert (=> b!753627 m!702873))

(assert (=> b!753627 m!702873))

(declare-fun m!702909 () Bool)

(assert (=> b!753627 m!702909))

(assert (=> b!753618 m!702873))

(assert (=> b!753618 m!702873))

(declare-fun m!702911 () Bool)

(assert (=> b!753618 m!702911))

(declare-fun m!702913 () Bool)

(assert (=> b!753618 m!702913))

(declare-fun m!702915 () Bool)

(assert (=> b!753618 m!702915))

(assert (=> b!753636 m!702873))

(assert (=> b!753636 m!702873))

(declare-fun m!702917 () Bool)

(assert (=> b!753636 m!702917))

(check-sat (not b!753628) (not b!753627) (not b!753638) (not b!753618) (not b!753637) (not b!753619) (not b!753635) (not b!753636) (not b!753634) (not b!753633) (not b!753632) (not b!753629) (not b!753630) (not start!65808) (not b!753625))
(check-sat)
