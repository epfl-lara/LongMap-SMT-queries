; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65330 () Bool)

(assert start!65330)

(declare-fun b!742510 () Bool)

(declare-fun res!499814 () Bool)

(declare-fun e!414924 () Bool)

(assert (=> b!742510 (=> res!499814 e!414924)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41520 0))(
  ( (array!41521 (arr!19874 (Array (_ BitVec 32) (_ BitVec 64))) (size!20295 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41520)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7471 0))(
  ( (MissingZero!7471 (index!32252 (_ BitVec 32))) (Found!7471 (index!32253 (_ BitVec 32))) (Intermediate!7471 (undefined!8283 Bool) (index!32254 (_ BitVec 32)) (x!63232 (_ BitVec 32))) (Undefined!7471) (MissingVacant!7471 (index!32255 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41520 (_ BitVec 32)) SeekEntryResult!7471)

(assert (=> b!742510 (= res!499814 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19874 a!3186) j!159) a!3186 mask!3328) (Found!7471 j!159))))))

(declare-fun b!742512 () Bool)

(declare-fun res!499815 () Bool)

(declare-fun e!414931 () Bool)

(assert (=> b!742512 (=> (not res!499815) (not e!414931))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!742512 (= res!499815 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20295 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20295 a!3186))))))

(declare-fun b!742513 () Bool)

(declare-fun res!499820 () Bool)

(assert (=> b!742513 (=> (not res!499820) (not e!414931))))

(declare-datatypes ((List!13915 0))(
  ( (Nil!13912) (Cons!13911 (h!14983 (_ BitVec 64)) (t!20221 List!13915)) )
))
(declare-fun arrayNoDuplicates!0 (array!41520 (_ BitVec 32) List!13915) Bool)

(assert (=> b!742513 (= res!499820 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13912))))

(declare-fun b!742514 () Bool)

(declare-fun res!499807 () Bool)

(assert (=> b!742514 (=> res!499807 e!414924)))

(declare-fun lt!329728 () SeekEntryResult!7471)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun lt!329729 () (_ BitVec 64))

(assert (=> b!742514 (= res!499807 (or (not (= (select (store (arr!19874 a!3186) i!1173 k0!2102) index!1321) lt!329729)) (undefined!8283 lt!329728) (bvslt mask!3328 #b00000000000000000000000000000000)))))

(declare-fun b!742515 () Bool)

(declare-fun e!414928 () Bool)

(declare-fun e!414925 () Bool)

(assert (=> b!742515 (= e!414928 e!414925)))

(declare-fun res!499819 () Bool)

(assert (=> b!742515 (=> (not res!499819) (not e!414925))))

(declare-fun lt!329730 () SeekEntryResult!7471)

(assert (=> b!742515 (= res!499819 (= lt!329730 lt!329728))))

(declare-fun lt!329734 () array!41520)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41520 (_ BitVec 32)) SeekEntryResult!7471)

(assert (=> b!742515 (= lt!329728 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329729 lt!329734 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!742515 (= lt!329730 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329729 mask!3328) lt!329729 lt!329734 mask!3328))))

(assert (=> b!742515 (= lt!329729 (select (store (arr!19874 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!742515 (= lt!329734 (array!41521 (store (arr!19874 a!3186) i!1173 k0!2102) (size!20295 a!3186)))))

(declare-fun b!742516 () Bool)

(declare-fun res!499823 () Bool)

(declare-fun e!414930 () Bool)

(assert (=> b!742516 (=> (not res!499823) (not e!414930))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!742516 (= res!499823 (validKeyInArray!0 k0!2102))))

(declare-fun b!742517 () Bool)

(declare-fun res!499813 () Bool)

(assert (=> b!742517 (=> (not res!499813) (not e!414928))))

(declare-fun e!414926 () Bool)

(assert (=> b!742517 (= res!499813 e!414926)))

(declare-fun c!81732 () Bool)

(assert (=> b!742517 (= c!81732 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!742518 () Bool)

(assert (=> b!742518 (= e!414930 e!414931)))

(declare-fun res!499817 () Bool)

(assert (=> b!742518 (=> (not res!499817) (not e!414931))))

(declare-fun lt!329732 () SeekEntryResult!7471)

(assert (=> b!742518 (= res!499817 (or (= lt!329732 (MissingZero!7471 i!1173)) (= lt!329732 (MissingVacant!7471 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41520 (_ BitVec 32)) SeekEntryResult!7471)

(assert (=> b!742518 (= lt!329732 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!742519 () Bool)

(declare-fun res!499809 () Bool)

(assert (=> b!742519 (=> (not res!499809) (not e!414928))))

(assert (=> b!742519 (= res!499809 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19874 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!742520 () Bool)

(declare-fun res!499812 () Bool)

(assert (=> b!742520 (=> (not res!499812) (not e!414931))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41520 (_ BitVec 32)) Bool)

(assert (=> b!742520 (= res!499812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!742521 () Bool)

(assert (=> b!742521 (= e!414924 (validKeyInArray!0 lt!329729))))

(declare-fun b!742522 () Bool)

(declare-fun res!499811 () Bool)

(assert (=> b!742522 (=> (not res!499811) (not e!414930))))

(assert (=> b!742522 (= res!499811 (and (= (size!20295 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20295 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20295 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!499816 () Bool)

(assert (=> start!65330 (=> (not res!499816) (not e!414930))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65330 (= res!499816 (validMask!0 mask!3328))))

(assert (=> start!65330 e!414930))

(assert (=> start!65330 true))

(declare-fun array_inv!15757 (array!41520) Bool)

(assert (=> start!65330 (array_inv!15757 a!3186)))

(declare-fun b!742511 () Bool)

(declare-fun e!414929 () Bool)

(declare-fun e!414923 () Bool)

(assert (=> b!742511 (= e!414929 e!414923)))

(declare-fun res!499824 () Bool)

(assert (=> b!742511 (=> (not res!499824) (not e!414923))))

(declare-fun lt!329731 () SeekEntryResult!7471)

(assert (=> b!742511 (= res!499824 (= (seekEntryOrOpen!0 (select (arr!19874 a!3186) j!159) a!3186 mask!3328) lt!329731))))

(assert (=> b!742511 (= lt!329731 (Found!7471 j!159))))

(declare-fun b!742523 () Bool)

(assert (=> b!742523 (= e!414925 (not e!414924))))

(declare-fun res!499818 () Bool)

(assert (=> b!742523 (=> res!499818 e!414924)))

(get-info :version)

(assert (=> b!742523 (= res!499818 (or (not ((_ is Intermediate!7471) lt!329728)) (bvslt x!1131 (x!63232 lt!329728)) (not (= x!1131 (x!63232 lt!329728))) (not (= index!1321 (index!32254 lt!329728)))))))

(assert (=> b!742523 e!414929))

(declare-fun res!499821 () Bool)

(assert (=> b!742523 (=> (not res!499821) (not e!414929))))

(assert (=> b!742523 (= res!499821 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25394 0))(
  ( (Unit!25395) )
))
(declare-fun lt!329735 () Unit!25394)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41520 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25394)

(assert (=> b!742523 (= lt!329735 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!742524 () Bool)

(assert (=> b!742524 (= e!414931 e!414928)))

(declare-fun res!499808 () Bool)

(assert (=> b!742524 (=> (not res!499808) (not e!414928))))

(declare-fun lt!329733 () SeekEntryResult!7471)

(assert (=> b!742524 (= res!499808 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19874 a!3186) j!159) mask!3328) (select (arr!19874 a!3186) j!159) a!3186 mask!3328) lt!329733))))

(assert (=> b!742524 (= lt!329733 (Intermediate!7471 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!742525 () Bool)

(assert (=> b!742525 (= e!414926 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19874 a!3186) j!159) a!3186 mask!3328) (Found!7471 j!159)))))

(declare-fun b!742526 () Bool)

(assert (=> b!742526 (= e!414926 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19874 a!3186) j!159) a!3186 mask!3328) lt!329733))))

(declare-fun b!742527 () Bool)

(declare-fun res!499822 () Bool)

(assert (=> b!742527 (=> (not res!499822) (not e!414930))))

(declare-fun arrayContainsKey!0 (array!41520 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!742527 (= res!499822 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!742528 () Bool)

(assert (=> b!742528 (= e!414923 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19874 a!3186) j!159) a!3186 mask!3328) lt!329731))))

(declare-fun b!742529 () Bool)

(declare-fun res!499810 () Bool)

(assert (=> b!742529 (=> (not res!499810) (not e!414930))))

(assert (=> b!742529 (= res!499810 (validKeyInArray!0 (select (arr!19874 a!3186) j!159)))))

(assert (= (and start!65330 res!499816) b!742522))

(assert (= (and b!742522 res!499811) b!742529))

(assert (= (and b!742529 res!499810) b!742516))

(assert (= (and b!742516 res!499823) b!742527))

(assert (= (and b!742527 res!499822) b!742518))

(assert (= (and b!742518 res!499817) b!742520))

(assert (= (and b!742520 res!499812) b!742513))

(assert (= (and b!742513 res!499820) b!742512))

(assert (= (and b!742512 res!499815) b!742524))

(assert (= (and b!742524 res!499808) b!742519))

(assert (= (and b!742519 res!499809) b!742517))

(assert (= (and b!742517 c!81732) b!742526))

(assert (= (and b!742517 (not c!81732)) b!742525))

(assert (= (and b!742517 res!499813) b!742515))

(assert (= (and b!742515 res!499819) b!742523))

(assert (= (and b!742523 res!499821) b!742511))

(assert (= (and b!742511 res!499824) b!742528))

(assert (= (and b!742523 (not res!499818)) b!742510))

(assert (= (and b!742510 (not res!499814)) b!742514))

(assert (= (and b!742514 (not res!499807)) b!742521))

(declare-fun m!692813 () Bool)

(assert (=> b!742514 m!692813))

(declare-fun m!692815 () Bool)

(assert (=> b!742514 m!692815))

(declare-fun m!692817 () Bool)

(assert (=> b!742523 m!692817))

(declare-fun m!692819 () Bool)

(assert (=> b!742523 m!692819))

(declare-fun m!692821 () Bool)

(assert (=> b!742515 m!692821))

(assert (=> b!742515 m!692813))

(declare-fun m!692823 () Bool)

(assert (=> b!742515 m!692823))

(declare-fun m!692825 () Bool)

(assert (=> b!742515 m!692825))

(declare-fun m!692827 () Bool)

(assert (=> b!742515 m!692827))

(assert (=> b!742515 m!692823))

(declare-fun m!692829 () Bool)

(assert (=> b!742518 m!692829))

(declare-fun m!692831 () Bool)

(assert (=> b!742513 m!692831))

(declare-fun m!692833 () Bool)

(assert (=> b!742524 m!692833))

(assert (=> b!742524 m!692833))

(declare-fun m!692835 () Bool)

(assert (=> b!742524 m!692835))

(assert (=> b!742524 m!692835))

(assert (=> b!742524 m!692833))

(declare-fun m!692837 () Bool)

(assert (=> b!742524 m!692837))

(assert (=> b!742525 m!692833))

(assert (=> b!742525 m!692833))

(declare-fun m!692839 () Bool)

(assert (=> b!742525 m!692839))

(assert (=> b!742510 m!692833))

(assert (=> b!742510 m!692833))

(assert (=> b!742510 m!692839))

(declare-fun m!692841 () Bool)

(assert (=> b!742516 m!692841))

(declare-fun m!692843 () Bool)

(assert (=> b!742520 m!692843))

(assert (=> b!742526 m!692833))

(assert (=> b!742526 m!692833))

(declare-fun m!692845 () Bool)

(assert (=> b!742526 m!692845))

(assert (=> b!742528 m!692833))

(assert (=> b!742528 m!692833))

(declare-fun m!692847 () Bool)

(assert (=> b!742528 m!692847))

(declare-fun m!692849 () Bool)

(assert (=> b!742527 m!692849))

(declare-fun m!692851 () Bool)

(assert (=> b!742521 m!692851))

(declare-fun m!692853 () Bool)

(assert (=> start!65330 m!692853))

(declare-fun m!692855 () Bool)

(assert (=> start!65330 m!692855))

(declare-fun m!692857 () Bool)

(assert (=> b!742519 m!692857))

(assert (=> b!742511 m!692833))

(assert (=> b!742511 m!692833))

(declare-fun m!692859 () Bool)

(assert (=> b!742511 m!692859))

(assert (=> b!742529 m!692833))

(assert (=> b!742529 m!692833))

(declare-fun m!692861 () Bool)

(assert (=> b!742529 m!692861))

(check-sat (not b!742516) (not b!742515) (not b!742526) (not b!742520) (not b!742527) (not b!742523) (not b!742528) (not start!65330) (not b!742525) (not b!742529) (not b!742524) (not b!742510) (not b!742518) (not b!742521) (not b!742511) (not b!742513))
(check-sat)
