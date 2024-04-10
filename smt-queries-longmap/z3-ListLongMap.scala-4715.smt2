; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65352 () Bool)

(assert start!65352)

(declare-fun e!415108 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41525 0))(
  ( (array!41526 (arr!19876 (Array (_ BitVec 32) (_ BitVec 64))) (size!20297 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41525)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!742820 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7476 0))(
  ( (MissingZero!7476 (index!32272 (_ BitVec 32))) (Found!7476 (index!32273 (_ BitVec 32))) (Intermediate!7476 (undefined!8288 Bool) (index!32274 (_ BitVec 32)) (x!63242 (_ BitVec 32))) (Undefined!7476) (MissingVacant!7476 (index!32275 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41525 (_ BitVec 32)) SeekEntryResult!7476)

(assert (=> b!742820 (= e!415108 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19876 a!3186) j!159) a!3186 mask!3328) (Found!7476 j!159)))))

(declare-fun b!742821 () Bool)

(declare-fun e!415105 () Bool)

(declare-fun lt!329994 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!742821 (= e!415105 (validKeyInArray!0 lt!329994))))

(declare-fun b!742822 () Bool)

(declare-fun res!499971 () Bool)

(declare-fun e!415109 () Bool)

(assert (=> b!742822 (=> (not res!499971) (not e!415109))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!742822 (= res!499971 (validKeyInArray!0 k0!2102))))

(declare-fun b!742823 () Bool)

(declare-fun e!415106 () Bool)

(assert (=> b!742823 (= e!415109 e!415106)))

(declare-fun res!499980 () Bool)

(assert (=> b!742823 (=> (not res!499980) (not e!415106))))

(declare-fun lt!329999 () SeekEntryResult!7476)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!742823 (= res!499980 (or (= lt!329999 (MissingZero!7476 i!1173)) (= lt!329999 (MissingVacant!7476 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41525 (_ BitVec 32)) SeekEntryResult!7476)

(assert (=> b!742823 (= lt!329999 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!742824 () Bool)

(declare-fun res!499979 () Bool)

(declare-fun e!415111 () Bool)

(assert (=> b!742824 (=> (not res!499979) (not e!415111))))

(assert (=> b!742824 (= res!499979 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19876 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!742825 () Bool)

(declare-fun e!415104 () Bool)

(assert (=> b!742825 (= e!415111 e!415104)))

(declare-fun res!499972 () Bool)

(assert (=> b!742825 (=> (not res!499972) (not e!415104))))

(declare-fun lt!329995 () SeekEntryResult!7476)

(declare-fun lt!329992 () SeekEntryResult!7476)

(assert (=> b!742825 (= res!499972 (= lt!329995 lt!329992))))

(declare-fun lt!329997 () array!41525)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41525 (_ BitVec 32)) SeekEntryResult!7476)

(assert (=> b!742825 (= lt!329992 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329994 lt!329997 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!742825 (= lt!329995 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329994 mask!3328) lt!329994 lt!329997 mask!3328))))

(assert (=> b!742825 (= lt!329994 (select (store (arr!19876 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!742825 (= lt!329997 (array!41526 (store (arr!19876 a!3186) i!1173 k0!2102) (size!20297 a!3186)))))

(declare-fun res!499987 () Bool)

(assert (=> start!65352 (=> (not res!499987) (not e!415109))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65352 (= res!499987 (validMask!0 mask!3328))))

(assert (=> start!65352 e!415109))

(assert (=> start!65352 true))

(declare-fun array_inv!15672 (array!41525) Bool)

(assert (=> start!65352 (array_inv!15672 a!3186)))

(declare-fun b!742826 () Bool)

(declare-fun res!499973 () Bool)

(assert (=> b!742826 (=> res!499973 e!415105)))

(assert (=> b!742826 (= res!499973 (or (not (= (select (store (arr!19876 a!3186) i!1173 k0!2102) index!1321) lt!329994)) (undefined!8288 lt!329992) (bvslt mask!3328 #b00000000000000000000000000000000)))))

(declare-fun lt!329998 () SeekEntryResult!7476)

(declare-fun e!415110 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!742827 () Bool)

(assert (=> b!742827 (= e!415110 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19876 a!3186) j!159) a!3186 mask!3328) lt!329998))))

(declare-fun b!742828 () Bool)

(assert (=> b!742828 (= e!415104 (not e!415105))))

(declare-fun res!499975 () Bool)

(assert (=> b!742828 (=> res!499975 e!415105)))

(get-info :version)

(assert (=> b!742828 (= res!499975 (or (not ((_ is Intermediate!7476) lt!329992)) (bvslt x!1131 (x!63242 lt!329992)) (not (= x!1131 (x!63242 lt!329992))) (not (= index!1321 (index!32274 lt!329992)))))))

(declare-fun e!415107 () Bool)

(assert (=> b!742828 e!415107))

(declare-fun res!499978 () Bool)

(assert (=> b!742828 (=> (not res!499978) (not e!415107))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41525 (_ BitVec 32)) Bool)

(assert (=> b!742828 (= res!499978 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25432 0))(
  ( (Unit!25433) )
))
(declare-fun lt!329996 () Unit!25432)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41525 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25432)

(assert (=> b!742828 (= lt!329996 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!742829 () Bool)

(declare-fun res!499983 () Bool)

(assert (=> b!742829 (=> res!499983 e!415105)))

(assert (=> b!742829 (= res!499983 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19876 a!3186) j!159) a!3186 mask!3328) (Found!7476 j!159))))))

(declare-fun b!742830 () Bool)

(declare-fun res!499986 () Bool)

(assert (=> b!742830 (=> (not res!499986) (not e!415106))))

(assert (=> b!742830 (= res!499986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!742831 () Bool)

(declare-fun res!499977 () Bool)

(assert (=> b!742831 (=> (not res!499977) (not e!415109))))

(assert (=> b!742831 (= res!499977 (and (= (size!20297 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20297 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20297 a!3186)) (not (= i!1173 j!159))))))

(declare-fun lt!329993 () SeekEntryResult!7476)

(declare-fun b!742832 () Bool)

(assert (=> b!742832 (= e!415108 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19876 a!3186) j!159) a!3186 mask!3328) lt!329993))))

(declare-fun b!742833 () Bool)

(declare-fun res!499982 () Bool)

(assert (=> b!742833 (=> (not res!499982) (not e!415111))))

(assert (=> b!742833 (= res!499982 e!415108)))

(declare-fun c!81805 () Bool)

(assert (=> b!742833 (= c!81805 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!742834 () Bool)

(declare-fun res!499981 () Bool)

(assert (=> b!742834 (=> (not res!499981) (not e!415109))))

(assert (=> b!742834 (= res!499981 (validKeyInArray!0 (select (arr!19876 a!3186) j!159)))))

(declare-fun b!742835 () Bool)

(declare-fun res!499988 () Bool)

(assert (=> b!742835 (=> (not res!499988) (not e!415106))))

(assert (=> b!742835 (= res!499988 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20297 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20297 a!3186))))))

(declare-fun b!742836 () Bool)

(assert (=> b!742836 (= e!415106 e!415111)))

(declare-fun res!499984 () Bool)

(assert (=> b!742836 (=> (not res!499984) (not e!415111))))

(assert (=> b!742836 (= res!499984 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19876 a!3186) j!159) mask!3328) (select (arr!19876 a!3186) j!159) a!3186 mask!3328) lt!329993))))

(assert (=> b!742836 (= lt!329993 (Intermediate!7476 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!742837 () Bool)

(declare-fun res!499985 () Bool)

(assert (=> b!742837 (=> (not res!499985) (not e!415109))))

(declare-fun arrayContainsKey!0 (array!41525 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!742837 (= res!499985 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!742838 () Bool)

(assert (=> b!742838 (= e!415107 e!415110)))

(declare-fun res!499974 () Bool)

(assert (=> b!742838 (=> (not res!499974) (not e!415110))))

(assert (=> b!742838 (= res!499974 (= (seekEntryOrOpen!0 (select (arr!19876 a!3186) j!159) a!3186 mask!3328) lt!329998))))

(assert (=> b!742838 (= lt!329998 (Found!7476 j!159))))

(declare-fun b!742839 () Bool)

(declare-fun res!499976 () Bool)

(assert (=> b!742839 (=> (not res!499976) (not e!415106))))

(declare-datatypes ((List!13878 0))(
  ( (Nil!13875) (Cons!13874 (h!14946 (_ BitVec 64)) (t!20193 List!13878)) )
))
(declare-fun arrayNoDuplicates!0 (array!41525 (_ BitVec 32) List!13878) Bool)

(assert (=> b!742839 (= res!499976 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13875))))

(assert (= (and start!65352 res!499987) b!742831))

(assert (= (and b!742831 res!499977) b!742834))

(assert (= (and b!742834 res!499981) b!742822))

(assert (= (and b!742822 res!499971) b!742837))

(assert (= (and b!742837 res!499985) b!742823))

(assert (= (and b!742823 res!499980) b!742830))

(assert (= (and b!742830 res!499986) b!742839))

(assert (= (and b!742839 res!499976) b!742835))

(assert (= (and b!742835 res!499988) b!742836))

(assert (= (and b!742836 res!499984) b!742824))

(assert (= (and b!742824 res!499979) b!742833))

(assert (= (and b!742833 c!81805) b!742832))

(assert (= (and b!742833 (not c!81805)) b!742820))

(assert (= (and b!742833 res!499982) b!742825))

(assert (= (and b!742825 res!499972) b!742828))

(assert (= (and b!742828 res!499978) b!742838))

(assert (= (and b!742838 res!499974) b!742827))

(assert (= (and b!742828 (not res!499975)) b!742829))

(assert (= (and b!742829 (not res!499983)) b!742826))

(assert (= (and b!742826 (not res!499973)) b!742821))

(declare-fun m!693621 () Bool)

(assert (=> b!742830 m!693621))

(declare-fun m!693623 () Bool)

(assert (=> b!742823 m!693623))

(declare-fun m!693625 () Bool)

(assert (=> b!742832 m!693625))

(assert (=> b!742832 m!693625))

(declare-fun m!693627 () Bool)

(assert (=> b!742832 m!693627))

(declare-fun m!693629 () Bool)

(assert (=> b!742826 m!693629))

(declare-fun m!693631 () Bool)

(assert (=> b!742826 m!693631))

(assert (=> b!742838 m!693625))

(assert (=> b!742838 m!693625))

(declare-fun m!693633 () Bool)

(assert (=> b!742838 m!693633))

(assert (=> b!742836 m!693625))

(assert (=> b!742836 m!693625))

(declare-fun m!693635 () Bool)

(assert (=> b!742836 m!693635))

(assert (=> b!742836 m!693635))

(assert (=> b!742836 m!693625))

(declare-fun m!693637 () Bool)

(assert (=> b!742836 m!693637))

(assert (=> b!742820 m!693625))

(assert (=> b!742820 m!693625))

(declare-fun m!693639 () Bool)

(assert (=> b!742820 m!693639))

(declare-fun m!693641 () Bool)

(assert (=> start!65352 m!693641))

(declare-fun m!693643 () Bool)

(assert (=> start!65352 m!693643))

(declare-fun m!693645 () Bool)

(assert (=> b!742824 m!693645))

(declare-fun m!693647 () Bool)

(assert (=> b!742821 m!693647))

(declare-fun m!693649 () Bool)

(assert (=> b!742828 m!693649))

(declare-fun m!693651 () Bool)

(assert (=> b!742828 m!693651))

(declare-fun m!693653 () Bool)

(assert (=> b!742837 m!693653))

(assert (=> b!742825 m!693629))

(declare-fun m!693655 () Bool)

(assert (=> b!742825 m!693655))

(declare-fun m!693657 () Bool)

(assert (=> b!742825 m!693657))

(assert (=> b!742825 m!693655))

(declare-fun m!693659 () Bool)

(assert (=> b!742825 m!693659))

(declare-fun m!693661 () Bool)

(assert (=> b!742825 m!693661))

(declare-fun m!693663 () Bool)

(assert (=> b!742839 m!693663))

(assert (=> b!742834 m!693625))

(assert (=> b!742834 m!693625))

(declare-fun m!693665 () Bool)

(assert (=> b!742834 m!693665))

(declare-fun m!693667 () Bool)

(assert (=> b!742822 m!693667))

(assert (=> b!742829 m!693625))

(assert (=> b!742829 m!693625))

(assert (=> b!742829 m!693639))

(assert (=> b!742827 m!693625))

(assert (=> b!742827 m!693625))

(declare-fun m!693669 () Bool)

(assert (=> b!742827 m!693669))

(check-sat (not start!65352) (not b!742837) (not b!742839) (not b!742834) (not b!742822) (not b!742820) (not b!742836) (not b!742825) (not b!742829) (not b!742827) (not b!742832) (not b!742823) (not b!742838) (not b!742821) (not b!742830) (not b!742828))
(check-sat)
