; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65336 () Bool)

(assert start!65336)

(declare-datatypes ((array!41526 0))(
  ( (array!41527 (arr!19877 (Array (_ BitVec 32) (_ BitVec 64))) (size!20298 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41526)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!742690 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7474 0))(
  ( (MissingZero!7474 (index!32264 (_ BitVec 32))) (Found!7474 (index!32265 (_ BitVec 32))) (Intermediate!7474 (undefined!8286 Bool) (index!32266 (_ BitVec 32)) (x!63243 (_ BitVec 32))) (Undefined!7474) (MissingVacant!7474 (index!32267 (_ BitVec 32))) )
))
(declare-fun lt!329802 () SeekEntryResult!7474)

(declare-fun e!415011 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41526 (_ BitVec 32)) SeekEntryResult!7474)

(assert (=> b!742690 (= e!415011 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19877 a!3186) j!159) a!3186 mask!3328) lt!329802))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!742692 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41526 (_ BitVec 32)) SeekEntryResult!7474)

(assert (=> b!742692 (= e!415011 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19877 a!3186) j!159) a!3186 mask!3328) (Found!7474 j!159)))))

(declare-fun b!742693 () Bool)

(declare-fun e!415004 () Bool)

(assert (=> b!742693 (= e!415004 true)))

(declare-fun lt!329805 () SeekEntryResult!7474)

(declare-fun lt!329804 () (_ BitVec 64))

(declare-fun lt!329809 () array!41526)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41526 (_ BitVec 32)) SeekEntryResult!7474)

(assert (=> b!742693 (= lt!329805 (seekEntryOrOpen!0 lt!329804 lt!329809 mask!3328))))

(declare-fun b!742694 () Bool)

(declare-fun e!415005 () Bool)

(declare-fun e!415008 () Bool)

(assert (=> b!742694 (= e!415005 e!415008)))

(declare-fun res!499975 () Bool)

(assert (=> b!742694 (=> (not res!499975) (not e!415008))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!742694 (= res!499975 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19877 a!3186) j!159) mask!3328) (select (arr!19877 a!3186) j!159) a!3186 mask!3328) lt!329802))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!742694 (= lt!329802 (Intermediate!7474 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!742695 () Bool)

(declare-fun res!499979 () Bool)

(declare-fun e!415006 () Bool)

(assert (=> b!742695 (=> (not res!499979) (not e!415006))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!742695 (= res!499979 (validKeyInArray!0 (select (arr!19877 a!3186) j!159)))))

(declare-fun b!742696 () Bool)

(declare-fun e!415009 () Bool)

(declare-fun e!415012 () Bool)

(assert (=> b!742696 (= e!415009 e!415012)))

(declare-fun res!499977 () Bool)

(assert (=> b!742696 (=> (not res!499977) (not e!415012))))

(declare-fun lt!329803 () SeekEntryResult!7474)

(assert (=> b!742696 (= res!499977 (= (seekEntryOrOpen!0 (select (arr!19877 a!3186) j!159) a!3186 mask!3328) lt!329803))))

(assert (=> b!742696 (= lt!329803 (Found!7474 j!159))))

(declare-fun b!742697 () Bool)

(declare-fun res!499984 () Bool)

(assert (=> b!742697 (=> (not res!499984) (not e!415008))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!742697 (= res!499984 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19877 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!742698 () Bool)

(declare-fun res!499985 () Bool)

(assert (=> b!742698 (=> (not res!499985) (not e!415005))))

(declare-datatypes ((List!13918 0))(
  ( (Nil!13915) (Cons!13914 (h!14986 (_ BitVec 64)) (t!20224 List!13918)) )
))
(declare-fun arrayNoDuplicates!0 (array!41526 (_ BitVec 32) List!13918) Bool)

(assert (=> b!742698 (= res!499985 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13915))))

(declare-fun b!742699 () Bool)

(declare-fun e!415010 () Bool)

(assert (=> b!742699 (= e!415008 e!415010)))

(declare-fun res!499982 () Bool)

(assert (=> b!742699 (=> (not res!499982) (not e!415010))))

(declare-fun lt!329810 () SeekEntryResult!7474)

(declare-fun lt!329807 () SeekEntryResult!7474)

(assert (=> b!742699 (= res!499982 (= lt!329810 lt!329807))))

(assert (=> b!742699 (= lt!329807 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329804 lt!329809 mask!3328))))

(assert (=> b!742699 (= lt!329810 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329804 mask!3328) lt!329804 lt!329809 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!742699 (= lt!329804 (select (store (arr!19877 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!742699 (= lt!329809 (array!41527 (store (arr!19877 a!3186) i!1173 k0!2102) (size!20298 a!3186)))))

(declare-fun b!742700 () Bool)

(declare-fun res!499973 () Bool)

(assert (=> b!742700 (=> (not res!499973) (not e!415005))))

(assert (=> b!742700 (= res!499973 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20298 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20298 a!3186))))))

(declare-fun b!742701 () Bool)

(declare-fun res!499976 () Bool)

(assert (=> b!742701 (=> (not res!499976) (not e!415006))))

(declare-fun arrayContainsKey!0 (array!41526 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!742701 (= res!499976 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!742702 () Bool)

(declare-fun res!499981 () Bool)

(assert (=> b!742702 (=> res!499981 e!415004)))

(assert (=> b!742702 (= res!499981 (or (not (= (select (store (arr!19877 a!3186) i!1173 k0!2102) index!1321) lt!329804)) (undefined!8286 lt!329807)))))

(declare-fun b!742703 () Bool)

(assert (=> b!742703 (= e!415010 (not e!415004))))

(declare-fun res!499970 () Bool)

(assert (=> b!742703 (=> res!499970 e!415004)))

(get-info :version)

(assert (=> b!742703 (= res!499970 (or (not ((_ is Intermediate!7474) lt!329807)) (bvslt x!1131 (x!63243 lt!329807)) (not (= x!1131 (x!63243 lt!329807))) (not (= index!1321 (index!32266 lt!329807)))))))

(assert (=> b!742703 e!415009))

(declare-fun res!499971 () Bool)

(assert (=> b!742703 (=> (not res!499971) (not e!415009))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41526 (_ BitVec 32)) Bool)

(assert (=> b!742703 (= res!499971 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25400 0))(
  ( (Unit!25401) )
))
(declare-fun lt!329806 () Unit!25400)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41526 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25400)

(assert (=> b!742703 (= lt!329806 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!742704 () Bool)

(declare-fun res!499980 () Bool)

(assert (=> b!742704 (=> (not res!499980) (not e!415008))))

(assert (=> b!742704 (= res!499980 e!415011)))

(declare-fun c!81741 () Bool)

(assert (=> b!742704 (= c!81741 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!742705 () Bool)

(declare-fun res!499986 () Bool)

(assert (=> b!742705 (=> (not res!499986) (not e!415005))))

(assert (=> b!742705 (= res!499986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!742691 () Bool)

(declare-fun res!499972 () Bool)

(assert (=> b!742691 (=> res!499972 e!415004)))

(assert (=> b!742691 (= res!499972 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19877 a!3186) j!159) a!3186 mask!3328) (Found!7474 j!159))))))

(declare-fun res!499983 () Bool)

(assert (=> start!65336 (=> (not res!499983) (not e!415006))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65336 (= res!499983 (validMask!0 mask!3328))))

(assert (=> start!65336 e!415006))

(assert (=> start!65336 true))

(declare-fun array_inv!15760 (array!41526) Bool)

(assert (=> start!65336 (array_inv!15760 a!3186)))

(declare-fun b!742706 () Bool)

(declare-fun res!499974 () Bool)

(assert (=> b!742706 (=> (not res!499974) (not e!415006))))

(assert (=> b!742706 (= res!499974 (validKeyInArray!0 k0!2102))))

(declare-fun b!742707 () Bool)

(assert (=> b!742707 (= e!415006 e!415005)))

(declare-fun res!499969 () Bool)

(assert (=> b!742707 (=> (not res!499969) (not e!415005))))

(declare-fun lt!329808 () SeekEntryResult!7474)

(assert (=> b!742707 (= res!499969 (or (= lt!329808 (MissingZero!7474 i!1173)) (= lt!329808 (MissingVacant!7474 i!1173))))))

(assert (=> b!742707 (= lt!329808 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!742708 () Bool)

(declare-fun res!499978 () Bool)

(assert (=> b!742708 (=> (not res!499978) (not e!415006))))

(assert (=> b!742708 (= res!499978 (and (= (size!20298 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20298 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20298 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!742709 () Bool)

(assert (=> b!742709 (= e!415012 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19877 a!3186) j!159) a!3186 mask!3328) lt!329803))))

(assert (= (and start!65336 res!499983) b!742708))

(assert (= (and b!742708 res!499978) b!742695))

(assert (= (and b!742695 res!499979) b!742706))

(assert (= (and b!742706 res!499974) b!742701))

(assert (= (and b!742701 res!499976) b!742707))

(assert (= (and b!742707 res!499969) b!742705))

(assert (= (and b!742705 res!499986) b!742698))

(assert (= (and b!742698 res!499985) b!742700))

(assert (= (and b!742700 res!499973) b!742694))

(assert (= (and b!742694 res!499975) b!742697))

(assert (= (and b!742697 res!499984) b!742704))

(assert (= (and b!742704 c!81741) b!742690))

(assert (= (and b!742704 (not c!81741)) b!742692))

(assert (= (and b!742704 res!499980) b!742699))

(assert (= (and b!742699 res!499982) b!742703))

(assert (= (and b!742703 res!499971) b!742696))

(assert (= (and b!742696 res!499977) b!742709))

(assert (= (and b!742703 (not res!499970)) b!742691))

(assert (= (and b!742691 (not res!499972)) b!742702))

(assert (= (and b!742702 (not res!499981)) b!742693))

(declare-fun m!692963 () Bool)

(assert (=> b!742690 m!692963))

(assert (=> b!742690 m!692963))

(declare-fun m!692965 () Bool)

(assert (=> b!742690 m!692965))

(assert (=> b!742691 m!692963))

(assert (=> b!742691 m!692963))

(declare-fun m!692967 () Bool)

(assert (=> b!742691 m!692967))

(declare-fun m!692969 () Bool)

(assert (=> b!742707 m!692969))

(declare-fun m!692971 () Bool)

(assert (=> b!742706 m!692971))

(declare-fun m!692973 () Bool)

(assert (=> b!742705 m!692973))

(declare-fun m!692975 () Bool)

(assert (=> b!742701 m!692975))

(declare-fun m!692977 () Bool)

(assert (=> b!742698 m!692977))

(declare-fun m!692979 () Bool)

(assert (=> b!742702 m!692979))

(declare-fun m!692981 () Bool)

(assert (=> b!742702 m!692981))

(declare-fun m!692983 () Bool)

(assert (=> start!65336 m!692983))

(declare-fun m!692985 () Bool)

(assert (=> start!65336 m!692985))

(declare-fun m!692987 () Bool)

(assert (=> b!742699 m!692987))

(declare-fun m!692989 () Bool)

(assert (=> b!742699 m!692989))

(declare-fun m!692991 () Bool)

(assert (=> b!742699 m!692991))

(assert (=> b!742699 m!692979))

(declare-fun m!692993 () Bool)

(assert (=> b!742699 m!692993))

(assert (=> b!742699 m!692987))

(assert (=> b!742709 m!692963))

(assert (=> b!742709 m!692963))

(declare-fun m!692995 () Bool)

(assert (=> b!742709 m!692995))

(declare-fun m!692997 () Bool)

(assert (=> b!742703 m!692997))

(declare-fun m!692999 () Bool)

(assert (=> b!742703 m!692999))

(assert (=> b!742694 m!692963))

(assert (=> b!742694 m!692963))

(declare-fun m!693001 () Bool)

(assert (=> b!742694 m!693001))

(assert (=> b!742694 m!693001))

(assert (=> b!742694 m!692963))

(declare-fun m!693003 () Bool)

(assert (=> b!742694 m!693003))

(assert (=> b!742692 m!692963))

(assert (=> b!742692 m!692963))

(assert (=> b!742692 m!692967))

(declare-fun m!693005 () Bool)

(assert (=> b!742693 m!693005))

(assert (=> b!742696 m!692963))

(assert (=> b!742696 m!692963))

(declare-fun m!693007 () Bool)

(assert (=> b!742696 m!693007))

(assert (=> b!742695 m!692963))

(assert (=> b!742695 m!692963))

(declare-fun m!693009 () Bool)

(assert (=> b!742695 m!693009))

(declare-fun m!693011 () Bool)

(assert (=> b!742697 m!693011))

(check-sat (not b!742695) (not b!742691) (not start!65336) (not b!742690) (not b!742694) (not b!742692) (not b!742705) (not b!742698) (not b!742706) (not b!742693) (not b!742703) (not b!742709) (not b!742707) (not b!742699) (not b!742701) (not b!742696))
(check-sat)
