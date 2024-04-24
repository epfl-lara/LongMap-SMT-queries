; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67390 () Bool)

(assert start!67390)

(declare-fun b!778724 () Bool)

(declare-fun res!526734 () Bool)

(declare-fun e!433314 () Bool)

(assert (=> b!778724 (=> res!526734 e!433314)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42562 0))(
  ( (array!42563 (arr!20371 (Array (_ BitVec 32) (_ BitVec 64))) (size!20791 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42562)

(declare-datatypes ((SeekEntryResult!7927 0))(
  ( (MissingZero!7927 (index!34076 (_ BitVec 32))) (Found!7927 (index!34077 (_ BitVec 32))) (Intermediate!7927 (undefined!8739 Bool) (index!34078 (_ BitVec 32)) (x!65178 (_ BitVec 32))) (Undefined!7927) (MissingVacant!7927 (index!34079 (_ BitVec 32))) )
))
(declare-fun lt!346924 () SeekEntryResult!7927)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42562 (_ BitVec 32)) SeekEntryResult!7927)

(assert (=> b!778724 (= res!526734 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20371 a!3186) j!159) a!3186 mask!3328) lt!346924)))))

(declare-fun e!433309 () Bool)

(declare-fun b!778725 () Bool)

(declare-fun lt!346927 () SeekEntryResult!7927)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42562 (_ BitVec 32)) SeekEntryResult!7927)

(assert (=> b!778725 (= e!433309 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20371 a!3186) j!159) a!3186 mask!3328) lt!346927))))

(declare-fun b!778726 () Bool)

(declare-fun res!526722 () Bool)

(declare-fun e!433311 () Bool)

(assert (=> b!778726 (=> (not res!526722) (not e!433311))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!778726 (= res!526722 (and (= (size!20791 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20791 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20791 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!778727 () Bool)

(declare-fun e!433313 () Bool)

(declare-fun e!433310 () Bool)

(assert (=> b!778727 (= e!433313 e!433310)))

(declare-fun res!526730 () Bool)

(assert (=> b!778727 (=> (not res!526730) (not e!433310))))

(declare-fun lt!346930 () SeekEntryResult!7927)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42562 (_ BitVec 32)) SeekEntryResult!7927)

(assert (=> b!778727 (= res!526730 (= (seekEntryOrOpen!0 (select (arr!20371 a!3186) j!159) a!3186 mask!3328) lt!346930))))

(assert (=> b!778727 (= lt!346930 (Found!7927 j!159))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!778728 () Bool)

(assert (=> b!778728 (= e!433310 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20371 a!3186) j!159) a!3186 mask!3328) lt!346930))))

(declare-fun b!778729 () Bool)

(declare-fun e!433308 () Bool)

(declare-fun e!433312 () Bool)

(assert (=> b!778729 (= e!433308 e!433312)))

(declare-fun res!526733 () Bool)

(assert (=> b!778729 (=> (not res!526733) (not e!433312))))

(declare-fun lt!346929 () SeekEntryResult!7927)

(declare-fun lt!346928 () SeekEntryResult!7927)

(assert (=> b!778729 (= res!526733 (= lt!346929 lt!346928))))

(declare-fun lt!346932 () (_ BitVec 64))

(declare-fun lt!346933 () array!42562)

(assert (=> b!778729 (= lt!346928 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346932 lt!346933 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!778729 (= lt!346929 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346932 mask!3328) lt!346932 lt!346933 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!778729 (= lt!346932 (select (store (arr!20371 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!778729 (= lt!346933 (array!42563 (store (arr!20371 a!3186) i!1173 k0!2102) (size!20791 a!3186)))))

(declare-fun b!778730 () Bool)

(assert (=> b!778730 (= e!433312 (not e!433314))))

(declare-fun res!526720 () Bool)

(assert (=> b!778730 (=> res!526720 e!433314)))

(get-info :version)

(assert (=> b!778730 (= res!526720 (or (not ((_ is Intermediate!7927) lt!346928)) (bvslt x!1131 (x!65178 lt!346928)) (not (= x!1131 (x!65178 lt!346928))) (not (= index!1321 (index!34078 lt!346928)))))))

(assert (=> b!778730 (= lt!346924 (Found!7927 j!159))))

(assert (=> b!778730 e!433313))

(declare-fun res!526724 () Bool)

(assert (=> b!778730 (=> (not res!526724) (not e!433313))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42562 (_ BitVec 32)) Bool)

(assert (=> b!778730 (= res!526724 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26827 0))(
  ( (Unit!26828) )
))
(declare-fun lt!346926 () Unit!26827)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42562 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26827)

(assert (=> b!778730 (= lt!346926 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!778731 () Bool)

(declare-fun e!433315 () Bool)

(assert (=> b!778731 (= e!433315 e!433308)))

(declare-fun res!526721 () Bool)

(assert (=> b!778731 (=> (not res!526721) (not e!433308))))

(assert (=> b!778731 (= res!526721 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20371 a!3186) j!159) mask!3328) (select (arr!20371 a!3186) j!159) a!3186 mask!3328) lt!346927))))

(assert (=> b!778731 (= lt!346927 (Intermediate!7927 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!778733 () Bool)

(declare-fun res!526723 () Bool)

(assert (=> b!778733 (=> res!526723 e!433314)))

(assert (=> b!778733 (= res!526723 (or (not (= (select (store (arr!20371 a!3186) i!1173 k0!2102) index!1321) lt!346932)) (undefined!8739 lt!346928)))))

(declare-fun b!778734 () Bool)

(declare-fun res!526718 () Bool)

(assert (=> b!778734 (=> (not res!526718) (not e!433311))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!778734 (= res!526718 (validKeyInArray!0 k0!2102))))

(declare-fun b!778735 () Bool)

(declare-fun res!526732 () Bool)

(assert (=> b!778735 (=> (not res!526732) (not e!433315))))

(assert (=> b!778735 (= res!526732 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20791 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20791 a!3186))))))

(declare-fun b!778736 () Bool)

(assert (=> b!778736 (= e!433309 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20371 a!3186) j!159) a!3186 mask!3328) (Found!7927 j!159)))))

(declare-fun b!778737 () Bool)

(declare-fun res!526719 () Bool)

(assert (=> b!778737 (=> (not res!526719) (not e!433315))))

(assert (=> b!778737 (= res!526719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!778738 () Bool)

(declare-fun res!526729 () Bool)

(assert (=> b!778738 (=> (not res!526729) (not e!433308))))

(assert (=> b!778738 (= res!526729 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20371 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!778739 () Bool)

(assert (=> b!778739 (= e!433311 e!433315)))

(declare-fun res!526727 () Bool)

(assert (=> b!778739 (=> (not res!526727) (not e!433315))))

(declare-fun lt!346925 () SeekEntryResult!7927)

(assert (=> b!778739 (= res!526727 (or (= lt!346925 (MissingZero!7927 i!1173)) (= lt!346925 (MissingVacant!7927 i!1173))))))

(assert (=> b!778739 (= lt!346925 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!778740 () Bool)

(declare-fun res!526725 () Bool)

(assert (=> b!778740 (=> (not res!526725) (not e!433308))))

(assert (=> b!778740 (= res!526725 e!433309)))

(declare-fun c!86408 () Bool)

(assert (=> b!778740 (= c!86408 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!778741 () Bool)

(declare-fun res!526717 () Bool)

(assert (=> b!778741 (=> (not res!526717) (not e!433311))))

(assert (=> b!778741 (= res!526717 (validKeyInArray!0 (select (arr!20371 a!3186) j!159)))))

(declare-fun b!778742 () Bool)

(declare-fun res!526726 () Bool)

(assert (=> b!778742 (=> (not res!526726) (not e!433311))))

(declare-fun arrayContainsKey!0 (array!42562 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!778742 (= res!526726 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun lt!346931 () SeekEntryResult!7927)

(declare-fun b!778743 () Bool)

(assert (=> b!778743 (= e!433314 (or (not (= lt!346931 (Found!7927 index!1321))) (= lt!346931 lt!346924)))))

(assert (=> b!778743 (= lt!346931 (seekEntryOrOpen!0 lt!346932 lt!346933 mask!3328))))

(declare-fun b!778732 () Bool)

(declare-fun res!526728 () Bool)

(assert (=> b!778732 (=> (not res!526728) (not e!433315))))

(declare-datatypes ((List!14280 0))(
  ( (Nil!14277) (Cons!14276 (h!15393 (_ BitVec 64)) (t!20587 List!14280)) )
))
(declare-fun arrayNoDuplicates!0 (array!42562 (_ BitVec 32) List!14280) Bool)

(assert (=> b!778732 (= res!526728 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14277))))

(declare-fun res!526731 () Bool)

(assert (=> start!67390 (=> (not res!526731) (not e!433311))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67390 (= res!526731 (validMask!0 mask!3328))))

(assert (=> start!67390 e!433311))

(assert (=> start!67390 true))

(declare-fun array_inv!16230 (array!42562) Bool)

(assert (=> start!67390 (array_inv!16230 a!3186)))

(assert (= (and start!67390 res!526731) b!778726))

(assert (= (and b!778726 res!526722) b!778741))

(assert (= (and b!778741 res!526717) b!778734))

(assert (= (and b!778734 res!526718) b!778742))

(assert (= (and b!778742 res!526726) b!778739))

(assert (= (and b!778739 res!526727) b!778737))

(assert (= (and b!778737 res!526719) b!778732))

(assert (= (and b!778732 res!526728) b!778735))

(assert (= (and b!778735 res!526732) b!778731))

(assert (= (and b!778731 res!526721) b!778738))

(assert (= (and b!778738 res!526729) b!778740))

(assert (= (and b!778740 c!86408) b!778725))

(assert (= (and b!778740 (not c!86408)) b!778736))

(assert (= (and b!778740 res!526725) b!778729))

(assert (= (and b!778729 res!526733) b!778730))

(assert (= (and b!778730 res!526724) b!778727))

(assert (= (and b!778727 res!526730) b!778728))

(assert (= (and b!778730 (not res!526720)) b!778724))

(assert (= (and b!778724 (not res!526734)) b!778733))

(assert (= (and b!778733 (not res!526723)) b!778743))

(declare-fun m!722903 () Bool)

(assert (=> b!778725 m!722903))

(assert (=> b!778725 m!722903))

(declare-fun m!722905 () Bool)

(assert (=> b!778725 m!722905))

(declare-fun m!722907 () Bool)

(assert (=> b!778734 m!722907))

(declare-fun m!722909 () Bool)

(assert (=> b!778729 m!722909))

(declare-fun m!722911 () Bool)

(assert (=> b!778729 m!722911))

(declare-fun m!722913 () Bool)

(assert (=> b!778729 m!722913))

(declare-fun m!722915 () Bool)

(assert (=> b!778729 m!722915))

(assert (=> b!778729 m!722915))

(declare-fun m!722917 () Bool)

(assert (=> b!778729 m!722917))

(declare-fun m!722919 () Bool)

(assert (=> b!778732 m!722919))

(declare-fun m!722921 () Bool)

(assert (=> start!67390 m!722921))

(declare-fun m!722923 () Bool)

(assert (=> start!67390 m!722923))

(declare-fun m!722925 () Bool)

(assert (=> b!778730 m!722925))

(declare-fun m!722927 () Bool)

(assert (=> b!778730 m!722927))

(assert (=> b!778733 m!722909))

(declare-fun m!722929 () Bool)

(assert (=> b!778733 m!722929))

(assert (=> b!778731 m!722903))

(assert (=> b!778731 m!722903))

(declare-fun m!722931 () Bool)

(assert (=> b!778731 m!722931))

(assert (=> b!778731 m!722931))

(assert (=> b!778731 m!722903))

(declare-fun m!722933 () Bool)

(assert (=> b!778731 m!722933))

(declare-fun m!722935 () Bool)

(assert (=> b!778742 m!722935))

(assert (=> b!778728 m!722903))

(assert (=> b!778728 m!722903))

(declare-fun m!722937 () Bool)

(assert (=> b!778728 m!722937))

(declare-fun m!722939 () Bool)

(assert (=> b!778739 m!722939))

(assert (=> b!778727 m!722903))

(assert (=> b!778727 m!722903))

(declare-fun m!722941 () Bool)

(assert (=> b!778727 m!722941))

(declare-fun m!722943 () Bool)

(assert (=> b!778743 m!722943))

(declare-fun m!722945 () Bool)

(assert (=> b!778737 m!722945))

(assert (=> b!778724 m!722903))

(assert (=> b!778724 m!722903))

(declare-fun m!722947 () Bool)

(assert (=> b!778724 m!722947))

(declare-fun m!722949 () Bool)

(assert (=> b!778738 m!722949))

(assert (=> b!778736 m!722903))

(assert (=> b!778736 m!722903))

(assert (=> b!778736 m!722947))

(assert (=> b!778741 m!722903))

(assert (=> b!778741 m!722903))

(declare-fun m!722951 () Bool)

(assert (=> b!778741 m!722951))

(check-sat (not b!778741) (not b!778729) (not b!778739) (not b!778731) (not b!778742) (not start!67390) (not b!778727) (not b!778730) (not b!778743) (not b!778732) (not b!778736) (not b!778734) (not b!778725) (not b!778728) (not b!778724) (not b!778737))
(check-sat)
(get-model)

(declare-fun d!102521 () Bool)

(declare-fun e!433380 () Bool)

(assert (=> d!102521 e!433380))

(declare-fun c!86423 () Bool)

(declare-fun lt!346998 () SeekEntryResult!7927)

(assert (=> d!102521 (= c!86423 (and ((_ is Intermediate!7927) lt!346998) (undefined!8739 lt!346998)))))

(declare-fun e!433383 () SeekEntryResult!7927)

(assert (=> d!102521 (= lt!346998 e!433383)))

(declare-fun c!86422 () Bool)

(assert (=> d!102521 (= c!86422 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!346999 () (_ BitVec 64))

(assert (=> d!102521 (= lt!346999 (select (arr!20371 a!3186) (toIndex!0 (select (arr!20371 a!3186) j!159) mask!3328)))))

(assert (=> d!102521 (validMask!0 mask!3328)))

(assert (=> d!102521 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20371 a!3186) j!159) mask!3328) (select (arr!20371 a!3186) j!159) a!3186 mask!3328) lt!346998)))

(declare-fun b!778882 () Bool)

(declare-fun e!433381 () SeekEntryResult!7927)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!778882 (= e!433381 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20371 a!3186) j!159) mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) (select (arr!20371 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!778883 () Bool)

(assert (=> b!778883 (and (bvsge (index!34078 lt!346998) #b00000000000000000000000000000000) (bvslt (index!34078 lt!346998) (size!20791 a!3186)))))

(declare-fun res!526850 () Bool)

(assert (=> b!778883 (= res!526850 (= (select (arr!20371 a!3186) (index!34078 lt!346998)) (select (arr!20371 a!3186) j!159)))))

(declare-fun e!433382 () Bool)

(assert (=> b!778883 (=> res!526850 e!433382)))

(declare-fun e!433384 () Bool)

(assert (=> b!778883 (= e!433384 e!433382)))

(declare-fun b!778884 () Bool)

(assert (=> b!778884 (= e!433383 e!433381)))

(declare-fun c!86421 () Bool)

(assert (=> b!778884 (= c!86421 (or (= lt!346999 (select (arr!20371 a!3186) j!159)) (= (bvadd lt!346999 lt!346999) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!778885 () Bool)

(assert (=> b!778885 (and (bvsge (index!34078 lt!346998) #b00000000000000000000000000000000) (bvslt (index!34078 lt!346998) (size!20791 a!3186)))))

(assert (=> b!778885 (= e!433382 (= (select (arr!20371 a!3186) (index!34078 lt!346998)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!778886 () Bool)

(assert (=> b!778886 (and (bvsge (index!34078 lt!346998) #b00000000000000000000000000000000) (bvslt (index!34078 lt!346998) (size!20791 a!3186)))))

(declare-fun res!526849 () Bool)

(assert (=> b!778886 (= res!526849 (= (select (arr!20371 a!3186) (index!34078 lt!346998)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!778886 (=> res!526849 e!433382)))

(declare-fun b!778887 () Bool)

(assert (=> b!778887 (= e!433380 (bvsge (x!65178 lt!346998) #b01111111111111111111111111111110))))

(declare-fun b!778888 () Bool)

(assert (=> b!778888 (= e!433381 (Intermediate!7927 false (toIndex!0 (select (arr!20371 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!778889 () Bool)

(assert (=> b!778889 (= e!433383 (Intermediate!7927 true (toIndex!0 (select (arr!20371 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!778890 () Bool)

(assert (=> b!778890 (= e!433380 e!433384)))

(declare-fun res!526851 () Bool)

(assert (=> b!778890 (= res!526851 (and ((_ is Intermediate!7927) lt!346998) (not (undefined!8739 lt!346998)) (bvslt (x!65178 lt!346998) #b01111111111111111111111111111110) (bvsge (x!65178 lt!346998) #b00000000000000000000000000000000) (bvsge (x!65178 lt!346998) #b00000000000000000000000000000000)))))

(assert (=> b!778890 (=> (not res!526851) (not e!433384))))

(assert (= (and d!102521 c!86422) b!778889))

(assert (= (and d!102521 (not c!86422)) b!778884))

(assert (= (and b!778884 c!86421) b!778888))

(assert (= (and b!778884 (not c!86421)) b!778882))

(assert (= (and d!102521 c!86423) b!778887))

(assert (= (and d!102521 (not c!86423)) b!778890))

(assert (= (and b!778890 res!526851) b!778883))

(assert (= (and b!778883 (not res!526850)) b!778886))

(assert (= (and b!778886 (not res!526849)) b!778885))

(declare-fun m!723053 () Bool)

(assert (=> b!778883 m!723053))

(assert (=> b!778882 m!722931))

(declare-fun m!723055 () Bool)

(assert (=> b!778882 m!723055))

(assert (=> b!778882 m!723055))

(assert (=> b!778882 m!722903))

(declare-fun m!723057 () Bool)

(assert (=> b!778882 m!723057))

(assert (=> d!102521 m!722931))

(declare-fun m!723059 () Bool)

(assert (=> d!102521 m!723059))

(assert (=> d!102521 m!722921))

(assert (=> b!778886 m!723053))

(assert (=> b!778885 m!723053))

(assert (=> b!778731 d!102521))

(declare-fun d!102523 () Bool)

(declare-fun lt!347005 () (_ BitVec 32))

(declare-fun lt!347004 () (_ BitVec 32))

(assert (=> d!102523 (= lt!347005 (bvmul (bvxor lt!347004 (bvlshr lt!347004 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102523 (= lt!347004 ((_ extract 31 0) (bvand (bvxor (select (arr!20371 a!3186) j!159) (bvlshr (select (arr!20371 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102523 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!526852 (let ((h!15396 ((_ extract 31 0) (bvand (bvxor (select (arr!20371 a!3186) j!159) (bvlshr (select (arr!20371 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65182 (bvmul (bvxor h!15396 (bvlshr h!15396 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65182 (bvlshr x!65182 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!526852 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!526852 #b00000000000000000000000000000000))))))

(assert (=> d!102523 (= (toIndex!0 (select (arr!20371 a!3186) j!159) mask!3328) (bvand (bvxor lt!347005 (bvlshr lt!347005 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!778731 d!102523))

(declare-fun d!102525 () Bool)

(declare-fun res!526857 () Bool)

(declare-fun e!433389 () Bool)

(assert (=> d!102525 (=> res!526857 e!433389)))

(assert (=> d!102525 (= res!526857 (= (select (arr!20371 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!102525 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!433389)))

(declare-fun b!778895 () Bool)

(declare-fun e!433390 () Bool)

(assert (=> b!778895 (= e!433389 e!433390)))

(declare-fun res!526858 () Bool)

(assert (=> b!778895 (=> (not res!526858) (not e!433390))))

(assert (=> b!778895 (= res!526858 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20791 a!3186)))))

(declare-fun b!778896 () Bool)

(assert (=> b!778896 (= e!433390 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!102525 (not res!526857)) b!778895))

(assert (= (and b!778895 res!526858) b!778896))

(declare-fun m!723061 () Bool)

(assert (=> d!102525 m!723061))

(declare-fun m!723063 () Bool)

(assert (=> b!778896 m!723063))

(assert (=> b!778742 d!102525))

(declare-fun b!778907 () Bool)

(declare-fun e!433399 () Bool)

(declare-fun e!433401 () Bool)

(assert (=> b!778907 (= e!433399 e!433401)))

(declare-fun res!526867 () Bool)

(assert (=> b!778907 (=> (not res!526867) (not e!433401))))

(declare-fun e!433400 () Bool)

(assert (=> b!778907 (= res!526867 (not e!433400))))

(declare-fun res!526866 () Bool)

(assert (=> b!778907 (=> (not res!526866) (not e!433400))))

(assert (=> b!778907 (= res!526866 (validKeyInArray!0 (select (arr!20371 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!102527 () Bool)

(declare-fun res!526865 () Bool)

(assert (=> d!102527 (=> res!526865 e!433399)))

(assert (=> d!102527 (= res!526865 (bvsge #b00000000000000000000000000000000 (size!20791 a!3186)))))

(assert (=> d!102527 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14277) e!433399)))

(declare-fun b!778908 () Bool)

(declare-fun e!433402 () Bool)

(declare-fun call!35223 () Bool)

(assert (=> b!778908 (= e!433402 call!35223)))

(declare-fun bm!35220 () Bool)

(declare-fun c!86426 () Bool)

(assert (=> bm!35220 (= call!35223 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!86426 (Cons!14276 (select (arr!20371 a!3186) #b00000000000000000000000000000000) Nil!14277) Nil!14277)))))

(declare-fun b!778909 () Bool)

(declare-fun contains!4076 (List!14280 (_ BitVec 64)) Bool)

(assert (=> b!778909 (= e!433400 (contains!4076 Nil!14277 (select (arr!20371 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!778910 () Bool)

(assert (=> b!778910 (= e!433402 call!35223)))

(declare-fun b!778911 () Bool)

(assert (=> b!778911 (= e!433401 e!433402)))

(assert (=> b!778911 (= c!86426 (validKeyInArray!0 (select (arr!20371 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!102527 (not res!526865)) b!778907))

(assert (= (and b!778907 res!526866) b!778909))

(assert (= (and b!778907 res!526867) b!778911))

(assert (= (and b!778911 c!86426) b!778908))

(assert (= (and b!778911 (not c!86426)) b!778910))

(assert (= (or b!778908 b!778910) bm!35220))

(assert (=> b!778907 m!723061))

(assert (=> b!778907 m!723061))

(declare-fun m!723065 () Bool)

(assert (=> b!778907 m!723065))

(assert (=> bm!35220 m!723061))

(declare-fun m!723067 () Bool)

(assert (=> bm!35220 m!723067))

(assert (=> b!778909 m!723061))

(assert (=> b!778909 m!723061))

(declare-fun m!723069 () Bool)

(assert (=> b!778909 m!723069))

(assert (=> b!778911 m!723061))

(assert (=> b!778911 m!723061))

(assert (=> b!778911 m!723065))

(assert (=> b!778732 d!102527))

(declare-fun b!778920 () Bool)

(declare-fun e!433409 () Bool)

(declare-fun call!35226 () Bool)

(assert (=> b!778920 (= e!433409 call!35226)))

(declare-fun bm!35223 () Bool)

(assert (=> bm!35223 (= call!35226 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!778921 () Bool)

(declare-fun e!433410 () Bool)

(declare-fun e!433411 () Bool)

(assert (=> b!778921 (= e!433410 e!433411)))

(declare-fun c!86429 () Bool)

(assert (=> b!778921 (= c!86429 (validKeyInArray!0 (select (arr!20371 a!3186) j!159)))))

(declare-fun b!778922 () Bool)

(assert (=> b!778922 (= e!433411 e!433409)))

(declare-fun lt!347012 () (_ BitVec 64))

(assert (=> b!778922 (= lt!347012 (select (arr!20371 a!3186) j!159))))

(declare-fun lt!347013 () Unit!26827)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42562 (_ BitVec 64) (_ BitVec 32)) Unit!26827)

(assert (=> b!778922 (= lt!347013 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!347012 j!159))))

(assert (=> b!778922 (arrayContainsKey!0 a!3186 lt!347012 #b00000000000000000000000000000000)))

(declare-fun lt!347014 () Unit!26827)

(assert (=> b!778922 (= lt!347014 lt!347013)))

(declare-fun res!526872 () Bool)

(assert (=> b!778922 (= res!526872 (= (seekEntryOrOpen!0 (select (arr!20371 a!3186) j!159) a!3186 mask!3328) (Found!7927 j!159)))))

(assert (=> b!778922 (=> (not res!526872) (not e!433409))))

(declare-fun d!102531 () Bool)

(declare-fun res!526873 () Bool)

(assert (=> d!102531 (=> res!526873 e!433410)))

(assert (=> d!102531 (= res!526873 (bvsge j!159 (size!20791 a!3186)))))

(assert (=> d!102531 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!433410)))

(declare-fun b!778923 () Bool)

(assert (=> b!778923 (= e!433411 call!35226)))

(assert (= (and d!102531 (not res!526873)) b!778921))

(assert (= (and b!778921 c!86429) b!778922))

(assert (= (and b!778921 (not c!86429)) b!778923))

(assert (= (and b!778922 res!526872) b!778920))

(assert (= (or b!778920 b!778923) bm!35223))

(declare-fun m!723071 () Bool)

(assert (=> bm!35223 m!723071))

(assert (=> b!778921 m!722903))

(assert (=> b!778921 m!722903))

(assert (=> b!778921 m!722951))

(assert (=> b!778922 m!722903))

(declare-fun m!723073 () Bool)

(assert (=> b!778922 m!723073))

(declare-fun m!723075 () Bool)

(assert (=> b!778922 m!723075))

(assert (=> b!778922 m!722903))

(assert (=> b!778922 m!722941))

(assert (=> b!778730 d!102531))

(declare-fun d!102535 () Bool)

(assert (=> d!102535 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!347017 () Unit!26827)

(declare-fun choose!38 (array!42562 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26827)

(assert (=> d!102535 (= lt!347017 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!102535 (validMask!0 mask!3328)))

(assert (=> d!102535 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!347017)))

(declare-fun bs!21707 () Bool)

(assert (= bs!21707 d!102535))

(assert (=> bs!21707 m!722925))

(declare-fun m!723077 () Bool)

(assert (=> bs!21707 m!723077))

(assert (=> bs!21707 m!722921))

(assert (=> b!778730 d!102535))

(declare-fun d!102537 () Bool)

(assert (=> d!102537 (= (validKeyInArray!0 (select (arr!20371 a!3186) j!159)) (and (not (= (select (arr!20371 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20371 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!778741 d!102537))

(declare-fun d!102539 () Bool)

(assert (=> d!102539 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!778734 d!102539))

(declare-fun b!779005 () Bool)

(declare-fun c!86461 () Bool)

(declare-fun lt!347040 () (_ BitVec 64))

(assert (=> b!779005 (= c!86461 (= lt!347040 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!433464 () SeekEntryResult!7927)

(declare-fun e!433465 () SeekEntryResult!7927)

(assert (=> b!779005 (= e!433464 e!433465)))

(declare-fun lt!347039 () SeekEntryResult!7927)

(declare-fun d!102541 () Bool)

(assert (=> d!102541 (and (or ((_ is Undefined!7927) lt!347039) (not ((_ is Found!7927) lt!347039)) (and (bvsge (index!34077 lt!347039) #b00000000000000000000000000000000) (bvslt (index!34077 lt!347039) (size!20791 a!3186)))) (or ((_ is Undefined!7927) lt!347039) ((_ is Found!7927) lt!347039) (not ((_ is MissingVacant!7927) lt!347039)) (not (= (index!34079 lt!347039) resIntermediateIndex!5)) (and (bvsge (index!34079 lt!347039) #b00000000000000000000000000000000) (bvslt (index!34079 lt!347039) (size!20791 a!3186)))) (or ((_ is Undefined!7927) lt!347039) (ite ((_ is Found!7927) lt!347039) (= (select (arr!20371 a!3186) (index!34077 lt!347039)) (select (arr!20371 a!3186) j!159)) (and ((_ is MissingVacant!7927) lt!347039) (= (index!34079 lt!347039) resIntermediateIndex!5) (= (select (arr!20371 a!3186) (index!34079 lt!347039)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!433463 () SeekEntryResult!7927)

(assert (=> d!102541 (= lt!347039 e!433463)))

(declare-fun c!86462 () Bool)

(assert (=> d!102541 (= c!86462 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102541 (= lt!347040 (select (arr!20371 a!3186) index!1321))))

(assert (=> d!102541 (validMask!0 mask!3328)))

(assert (=> d!102541 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20371 a!3186) j!159) a!3186 mask!3328) lt!347039)))

(declare-fun b!779006 () Bool)

(assert (=> b!779006 (= e!433463 e!433464)))

(declare-fun c!86460 () Bool)

(assert (=> b!779006 (= c!86460 (= lt!347040 (select (arr!20371 a!3186) j!159)))))

(declare-fun b!779007 () Bool)

(assert (=> b!779007 (= e!433465 (MissingVacant!7927 resIntermediateIndex!5))))

(declare-fun b!779008 () Bool)

(assert (=> b!779008 (= e!433463 Undefined!7927)))

(declare-fun b!779009 () Bool)

(assert (=> b!779009 (= e!433464 (Found!7927 index!1321))))

(declare-fun b!779010 () Bool)

(assert (=> b!779010 (= e!433465 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20371 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!102541 c!86462) b!779008))

(assert (= (and d!102541 (not c!86462)) b!779006))

(assert (= (and b!779006 c!86460) b!779009))

(assert (= (and b!779006 (not c!86460)) b!779005))

(assert (= (and b!779005 c!86461) b!779007))

(assert (= (and b!779005 (not c!86461)) b!779010))

(declare-fun m!723121 () Bool)

(assert (=> d!102541 m!723121))

(declare-fun m!723123 () Bool)

(assert (=> d!102541 m!723123))

(declare-fun m!723125 () Bool)

(assert (=> d!102541 m!723125))

(assert (=> d!102541 m!722921))

(declare-fun m!723127 () Bool)

(assert (=> b!779010 m!723127))

(assert (=> b!779010 m!723127))

(assert (=> b!779010 m!722903))

(declare-fun m!723129 () Bool)

(assert (=> b!779010 m!723129))

(assert (=> b!778724 d!102541))

(declare-fun b!779059 () Bool)

(declare-fun e!433491 () SeekEntryResult!7927)

(declare-fun lt!347060 () SeekEntryResult!7927)

(assert (=> b!779059 (= e!433491 (Found!7927 (index!34078 lt!347060)))))

(declare-fun b!779060 () Bool)

(declare-fun c!86484 () Bool)

(declare-fun lt!347061 () (_ BitVec 64))

(assert (=> b!779060 (= c!86484 (= lt!347061 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!433493 () SeekEntryResult!7927)

(assert (=> b!779060 (= e!433491 e!433493)))

(declare-fun b!779061 () Bool)

(assert (=> b!779061 (= e!433493 (seekKeyOrZeroReturnVacant!0 (x!65178 lt!347060) (index!34078 lt!347060) (index!34078 lt!347060) lt!346932 lt!346933 mask!3328))))

(declare-fun b!779062 () Bool)

(declare-fun e!433492 () SeekEntryResult!7927)

(assert (=> b!779062 (= e!433492 Undefined!7927)))

(declare-fun b!779063 () Bool)

(assert (=> b!779063 (= e!433492 e!433491)))

(assert (=> b!779063 (= lt!347061 (select (arr!20371 lt!346933) (index!34078 lt!347060)))))

(declare-fun c!86486 () Bool)

(assert (=> b!779063 (= c!86486 (= lt!347061 lt!346932))))

(declare-fun d!102557 () Bool)

(declare-fun lt!347062 () SeekEntryResult!7927)

(assert (=> d!102557 (and (or ((_ is Undefined!7927) lt!347062) (not ((_ is Found!7927) lt!347062)) (and (bvsge (index!34077 lt!347062) #b00000000000000000000000000000000) (bvslt (index!34077 lt!347062) (size!20791 lt!346933)))) (or ((_ is Undefined!7927) lt!347062) ((_ is Found!7927) lt!347062) (not ((_ is MissingZero!7927) lt!347062)) (and (bvsge (index!34076 lt!347062) #b00000000000000000000000000000000) (bvslt (index!34076 lt!347062) (size!20791 lt!346933)))) (or ((_ is Undefined!7927) lt!347062) ((_ is Found!7927) lt!347062) ((_ is MissingZero!7927) lt!347062) (not ((_ is MissingVacant!7927) lt!347062)) (and (bvsge (index!34079 lt!347062) #b00000000000000000000000000000000) (bvslt (index!34079 lt!347062) (size!20791 lt!346933)))) (or ((_ is Undefined!7927) lt!347062) (ite ((_ is Found!7927) lt!347062) (= (select (arr!20371 lt!346933) (index!34077 lt!347062)) lt!346932) (ite ((_ is MissingZero!7927) lt!347062) (= (select (arr!20371 lt!346933) (index!34076 lt!347062)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7927) lt!347062) (= (select (arr!20371 lt!346933) (index!34079 lt!347062)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102557 (= lt!347062 e!433492)))

(declare-fun c!86485 () Bool)

(assert (=> d!102557 (= c!86485 (and ((_ is Intermediate!7927) lt!347060) (undefined!8739 lt!347060)))))

(assert (=> d!102557 (= lt!347060 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346932 mask!3328) lt!346932 lt!346933 mask!3328))))

(assert (=> d!102557 (validMask!0 mask!3328)))

(assert (=> d!102557 (= (seekEntryOrOpen!0 lt!346932 lt!346933 mask!3328) lt!347062)))

(declare-fun b!779064 () Bool)

(assert (=> b!779064 (= e!433493 (MissingZero!7927 (index!34078 lt!347060)))))

(assert (= (and d!102557 c!86485) b!779062))

(assert (= (and d!102557 (not c!86485)) b!779063))

(assert (= (and b!779063 c!86486) b!779059))

(assert (= (and b!779063 (not c!86486)) b!779060))

(assert (= (and b!779060 c!86484) b!779064))

(assert (= (and b!779060 (not c!86484)) b!779061))

(declare-fun m!723145 () Bool)

(assert (=> b!779061 m!723145))

(declare-fun m!723147 () Bool)

(assert (=> b!779063 m!723147))

(assert (=> d!102557 m!722915))

(assert (=> d!102557 m!722917))

(declare-fun m!723149 () Bool)

(assert (=> d!102557 m!723149))

(declare-fun m!723151 () Bool)

(assert (=> d!102557 m!723151))

(declare-fun m!723153 () Bool)

(assert (=> d!102557 m!723153))

(assert (=> d!102557 m!722921))

(assert (=> d!102557 m!722915))

(assert (=> b!778743 d!102557))

(declare-fun b!779074 () Bool)

(declare-fun e!433499 () Bool)

(declare-fun call!35230 () Bool)

(assert (=> b!779074 (= e!433499 call!35230)))

(declare-fun bm!35227 () Bool)

(assert (=> bm!35227 (= call!35230 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!779075 () Bool)

(declare-fun e!433500 () Bool)

(declare-fun e!433501 () Bool)

(assert (=> b!779075 (= e!433500 e!433501)))

(declare-fun c!86490 () Bool)

(assert (=> b!779075 (= c!86490 (validKeyInArray!0 (select (arr!20371 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!779076 () Bool)

(assert (=> b!779076 (= e!433501 e!433499)))

(declare-fun lt!347065 () (_ BitVec 64))

(assert (=> b!779076 (= lt!347065 (select (arr!20371 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!347066 () Unit!26827)

(assert (=> b!779076 (= lt!347066 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!347065 #b00000000000000000000000000000000))))

(assert (=> b!779076 (arrayContainsKey!0 a!3186 lt!347065 #b00000000000000000000000000000000)))

(declare-fun lt!347067 () Unit!26827)

(assert (=> b!779076 (= lt!347067 lt!347066)))

(declare-fun res!526904 () Bool)

(assert (=> b!779076 (= res!526904 (= (seekEntryOrOpen!0 (select (arr!20371 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7927 #b00000000000000000000000000000000)))))

(assert (=> b!779076 (=> (not res!526904) (not e!433499))))

(declare-fun d!102561 () Bool)

(declare-fun res!526905 () Bool)

(assert (=> d!102561 (=> res!526905 e!433500)))

(assert (=> d!102561 (= res!526905 (bvsge #b00000000000000000000000000000000 (size!20791 a!3186)))))

(assert (=> d!102561 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!433500)))

(declare-fun b!779077 () Bool)

(assert (=> b!779077 (= e!433501 call!35230)))

(assert (= (and d!102561 (not res!526905)) b!779075))

(assert (= (and b!779075 c!86490) b!779076))

(assert (= (and b!779075 (not c!86490)) b!779077))

(assert (= (and b!779076 res!526904) b!779074))

(assert (= (or b!779074 b!779077) bm!35227))

(declare-fun m!723163 () Bool)

(assert (=> bm!35227 m!723163))

(assert (=> b!779075 m!723061))

(assert (=> b!779075 m!723061))

(assert (=> b!779075 m!723065))

(assert (=> b!779076 m!723061))

(declare-fun m!723165 () Bool)

(assert (=> b!779076 m!723165))

(declare-fun m!723167 () Bool)

(assert (=> b!779076 m!723167))

(assert (=> b!779076 m!723061))

(declare-fun m!723169 () Bool)

(assert (=> b!779076 m!723169))

(assert (=> b!778737 d!102561))

(declare-fun d!102565 () Bool)

(declare-fun e!433502 () Bool)

(assert (=> d!102565 e!433502))

(declare-fun c!86493 () Bool)

(declare-fun lt!347068 () SeekEntryResult!7927)

(assert (=> d!102565 (= c!86493 (and ((_ is Intermediate!7927) lt!347068) (undefined!8739 lt!347068)))))

(declare-fun e!433505 () SeekEntryResult!7927)

(assert (=> d!102565 (= lt!347068 e!433505)))

(declare-fun c!86492 () Bool)

(assert (=> d!102565 (= c!86492 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!347069 () (_ BitVec 64))

(assert (=> d!102565 (= lt!347069 (select (arr!20371 a!3186) index!1321))))

(assert (=> d!102565 (validMask!0 mask!3328)))

(assert (=> d!102565 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20371 a!3186) j!159) a!3186 mask!3328) lt!347068)))

(declare-fun b!779078 () Bool)

(declare-fun e!433503 () SeekEntryResult!7927)

(assert (=> b!779078 (= e!433503 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) (select (arr!20371 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!779079 () Bool)

(assert (=> b!779079 (and (bvsge (index!34078 lt!347068) #b00000000000000000000000000000000) (bvslt (index!34078 lt!347068) (size!20791 a!3186)))))

(declare-fun res!526908 () Bool)

(assert (=> b!779079 (= res!526908 (= (select (arr!20371 a!3186) (index!34078 lt!347068)) (select (arr!20371 a!3186) j!159)))))

(declare-fun e!433504 () Bool)

(assert (=> b!779079 (=> res!526908 e!433504)))

(declare-fun e!433506 () Bool)

(assert (=> b!779079 (= e!433506 e!433504)))

(declare-fun b!779080 () Bool)

(assert (=> b!779080 (= e!433505 e!433503)))

(declare-fun c!86491 () Bool)

(assert (=> b!779080 (= c!86491 (or (= lt!347069 (select (arr!20371 a!3186) j!159)) (= (bvadd lt!347069 lt!347069) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!779081 () Bool)

(assert (=> b!779081 (and (bvsge (index!34078 lt!347068) #b00000000000000000000000000000000) (bvslt (index!34078 lt!347068) (size!20791 a!3186)))))

(assert (=> b!779081 (= e!433504 (= (select (arr!20371 a!3186) (index!34078 lt!347068)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!779082 () Bool)

(assert (=> b!779082 (and (bvsge (index!34078 lt!347068) #b00000000000000000000000000000000) (bvslt (index!34078 lt!347068) (size!20791 a!3186)))))

(declare-fun res!526906 () Bool)

(assert (=> b!779082 (= res!526906 (= (select (arr!20371 a!3186) (index!34078 lt!347068)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!779082 (=> res!526906 e!433504)))

(declare-fun b!779083 () Bool)

(assert (=> b!779083 (= e!433502 (bvsge (x!65178 lt!347068) #b01111111111111111111111111111110))))

(declare-fun b!779084 () Bool)

(assert (=> b!779084 (= e!433503 (Intermediate!7927 false index!1321 x!1131))))

(declare-fun b!779085 () Bool)

(assert (=> b!779085 (= e!433505 (Intermediate!7927 true index!1321 x!1131))))

(declare-fun b!779086 () Bool)

(assert (=> b!779086 (= e!433502 e!433506)))

(declare-fun res!526909 () Bool)

(assert (=> b!779086 (= res!526909 (and ((_ is Intermediate!7927) lt!347068) (not (undefined!8739 lt!347068)) (bvslt (x!65178 lt!347068) #b01111111111111111111111111111110) (bvsge (x!65178 lt!347068) #b00000000000000000000000000000000) (bvsge (x!65178 lt!347068) x!1131)))))

(assert (=> b!779086 (=> (not res!526909) (not e!433506))))

(assert (= (and d!102565 c!86492) b!779085))

(assert (= (and d!102565 (not c!86492)) b!779080))

(assert (= (and b!779080 c!86491) b!779084))

(assert (= (and b!779080 (not c!86491)) b!779078))

(assert (= (and d!102565 c!86493) b!779083))

(assert (= (and d!102565 (not c!86493)) b!779086))

(assert (= (and b!779086 res!526909) b!779079))

(assert (= (and b!779079 (not res!526908)) b!779082))

(assert (= (and b!779082 (not res!526906)) b!779081))

(declare-fun m!723171 () Bool)

(assert (=> b!779079 m!723171))

(assert (=> b!779078 m!723127))

(assert (=> b!779078 m!723127))

(assert (=> b!779078 m!722903))

(declare-fun m!723173 () Bool)

(assert (=> b!779078 m!723173))

(assert (=> d!102565 m!723125))

(assert (=> d!102565 m!722921))

(assert (=> b!779082 m!723171))

(assert (=> b!779081 m!723171))

(assert (=> b!778725 d!102565))

(assert (=> b!778736 d!102541))

(declare-fun b!779087 () Bool)

(declare-fun e!433507 () SeekEntryResult!7927)

(declare-fun lt!347070 () SeekEntryResult!7927)

(assert (=> b!779087 (= e!433507 (Found!7927 (index!34078 lt!347070)))))

(declare-fun b!779088 () Bool)

(declare-fun c!86494 () Bool)

(declare-fun lt!347071 () (_ BitVec 64))

(assert (=> b!779088 (= c!86494 (= lt!347071 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!433509 () SeekEntryResult!7927)

(assert (=> b!779088 (= e!433507 e!433509)))

(declare-fun b!779089 () Bool)

(assert (=> b!779089 (= e!433509 (seekKeyOrZeroReturnVacant!0 (x!65178 lt!347070) (index!34078 lt!347070) (index!34078 lt!347070) k0!2102 a!3186 mask!3328))))

(declare-fun b!779090 () Bool)

(declare-fun e!433508 () SeekEntryResult!7927)

(assert (=> b!779090 (= e!433508 Undefined!7927)))

(declare-fun b!779091 () Bool)

(assert (=> b!779091 (= e!433508 e!433507)))

(assert (=> b!779091 (= lt!347071 (select (arr!20371 a!3186) (index!34078 lt!347070)))))

(declare-fun c!86496 () Bool)

(assert (=> b!779091 (= c!86496 (= lt!347071 k0!2102))))

(declare-fun d!102567 () Bool)

(declare-fun lt!347072 () SeekEntryResult!7927)

(assert (=> d!102567 (and (or ((_ is Undefined!7927) lt!347072) (not ((_ is Found!7927) lt!347072)) (and (bvsge (index!34077 lt!347072) #b00000000000000000000000000000000) (bvslt (index!34077 lt!347072) (size!20791 a!3186)))) (or ((_ is Undefined!7927) lt!347072) ((_ is Found!7927) lt!347072) (not ((_ is MissingZero!7927) lt!347072)) (and (bvsge (index!34076 lt!347072) #b00000000000000000000000000000000) (bvslt (index!34076 lt!347072) (size!20791 a!3186)))) (or ((_ is Undefined!7927) lt!347072) ((_ is Found!7927) lt!347072) ((_ is MissingZero!7927) lt!347072) (not ((_ is MissingVacant!7927) lt!347072)) (and (bvsge (index!34079 lt!347072) #b00000000000000000000000000000000) (bvslt (index!34079 lt!347072) (size!20791 a!3186)))) (or ((_ is Undefined!7927) lt!347072) (ite ((_ is Found!7927) lt!347072) (= (select (arr!20371 a!3186) (index!34077 lt!347072)) k0!2102) (ite ((_ is MissingZero!7927) lt!347072) (= (select (arr!20371 a!3186) (index!34076 lt!347072)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7927) lt!347072) (= (select (arr!20371 a!3186) (index!34079 lt!347072)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102567 (= lt!347072 e!433508)))

(declare-fun c!86495 () Bool)

(assert (=> d!102567 (= c!86495 (and ((_ is Intermediate!7927) lt!347070) (undefined!8739 lt!347070)))))

(assert (=> d!102567 (= lt!347070 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!102567 (validMask!0 mask!3328)))

(assert (=> d!102567 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!347072)))

(declare-fun b!779092 () Bool)

(assert (=> b!779092 (= e!433509 (MissingZero!7927 (index!34078 lt!347070)))))

(assert (= (and d!102567 c!86495) b!779090))

(assert (= (and d!102567 (not c!86495)) b!779091))

(assert (= (and b!779091 c!86496) b!779087))

(assert (= (and b!779091 (not c!86496)) b!779088))

(assert (= (and b!779088 c!86494) b!779092))

(assert (= (and b!779088 (not c!86494)) b!779089))

(declare-fun m!723175 () Bool)

(assert (=> b!779089 m!723175))

(declare-fun m!723177 () Bool)

(assert (=> b!779091 m!723177))

(declare-fun m!723179 () Bool)

(assert (=> d!102567 m!723179))

(declare-fun m!723181 () Bool)

(assert (=> d!102567 m!723181))

(declare-fun m!723183 () Bool)

(assert (=> d!102567 m!723183))

(declare-fun m!723185 () Bool)

(assert (=> d!102567 m!723185))

(declare-fun m!723187 () Bool)

(assert (=> d!102567 m!723187))

(assert (=> d!102567 m!722921))

(assert (=> d!102567 m!723179))

(assert (=> b!778739 d!102567))

(declare-fun d!102569 () Bool)

(declare-fun e!433510 () Bool)

(assert (=> d!102569 e!433510))

(declare-fun c!86499 () Bool)

(declare-fun lt!347073 () SeekEntryResult!7927)

(assert (=> d!102569 (= c!86499 (and ((_ is Intermediate!7927) lt!347073) (undefined!8739 lt!347073)))))

(declare-fun e!433513 () SeekEntryResult!7927)

(assert (=> d!102569 (= lt!347073 e!433513)))

(declare-fun c!86498 () Bool)

(assert (=> d!102569 (= c!86498 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!347074 () (_ BitVec 64))

(assert (=> d!102569 (= lt!347074 (select (arr!20371 lt!346933) index!1321))))

(assert (=> d!102569 (validMask!0 mask!3328)))

(assert (=> d!102569 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346932 lt!346933 mask!3328) lt!347073)))

(declare-fun e!433511 () SeekEntryResult!7927)

(declare-fun b!779093 () Bool)

(assert (=> b!779093 (= e!433511 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) lt!346932 lt!346933 mask!3328))))

(declare-fun b!779094 () Bool)

(assert (=> b!779094 (and (bvsge (index!34078 lt!347073) #b00000000000000000000000000000000) (bvslt (index!34078 lt!347073) (size!20791 lt!346933)))))

(declare-fun res!526911 () Bool)

(assert (=> b!779094 (= res!526911 (= (select (arr!20371 lt!346933) (index!34078 lt!347073)) lt!346932))))

(declare-fun e!433512 () Bool)

(assert (=> b!779094 (=> res!526911 e!433512)))

(declare-fun e!433514 () Bool)

(assert (=> b!779094 (= e!433514 e!433512)))

(declare-fun b!779095 () Bool)

(assert (=> b!779095 (= e!433513 e!433511)))

(declare-fun c!86497 () Bool)

(assert (=> b!779095 (= c!86497 (or (= lt!347074 lt!346932) (= (bvadd lt!347074 lt!347074) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!779096 () Bool)

(assert (=> b!779096 (and (bvsge (index!34078 lt!347073) #b00000000000000000000000000000000) (bvslt (index!34078 lt!347073) (size!20791 lt!346933)))))

(assert (=> b!779096 (= e!433512 (= (select (arr!20371 lt!346933) (index!34078 lt!347073)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!779097 () Bool)

(assert (=> b!779097 (and (bvsge (index!34078 lt!347073) #b00000000000000000000000000000000) (bvslt (index!34078 lt!347073) (size!20791 lt!346933)))))

(declare-fun res!526910 () Bool)

(assert (=> b!779097 (= res!526910 (= (select (arr!20371 lt!346933) (index!34078 lt!347073)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!779097 (=> res!526910 e!433512)))

(declare-fun b!779098 () Bool)

(assert (=> b!779098 (= e!433510 (bvsge (x!65178 lt!347073) #b01111111111111111111111111111110))))

(declare-fun b!779099 () Bool)

(assert (=> b!779099 (= e!433511 (Intermediate!7927 false index!1321 x!1131))))

(declare-fun b!779100 () Bool)

(assert (=> b!779100 (= e!433513 (Intermediate!7927 true index!1321 x!1131))))

(declare-fun b!779101 () Bool)

(assert (=> b!779101 (= e!433510 e!433514)))

(declare-fun res!526912 () Bool)

(assert (=> b!779101 (= res!526912 (and ((_ is Intermediate!7927) lt!347073) (not (undefined!8739 lt!347073)) (bvslt (x!65178 lt!347073) #b01111111111111111111111111111110) (bvsge (x!65178 lt!347073) #b00000000000000000000000000000000) (bvsge (x!65178 lt!347073) x!1131)))))

(assert (=> b!779101 (=> (not res!526912) (not e!433514))))

(assert (= (and d!102569 c!86498) b!779100))

(assert (= (and d!102569 (not c!86498)) b!779095))

(assert (= (and b!779095 c!86497) b!779099))

(assert (= (and b!779095 (not c!86497)) b!779093))

(assert (= (and d!102569 c!86499) b!779098))

(assert (= (and d!102569 (not c!86499)) b!779101))

(assert (= (and b!779101 res!526912) b!779094))

(assert (= (and b!779094 (not res!526911)) b!779097))

(assert (= (and b!779097 (not res!526910)) b!779096))

(declare-fun m!723189 () Bool)

(assert (=> b!779094 m!723189))

(assert (=> b!779093 m!723127))

(assert (=> b!779093 m!723127))

(declare-fun m!723191 () Bool)

(assert (=> b!779093 m!723191))

(declare-fun m!723193 () Bool)

(assert (=> d!102569 m!723193))

(assert (=> d!102569 m!722921))

(assert (=> b!779097 m!723189))

(assert (=> b!779096 m!723189))

(assert (=> b!778729 d!102569))

(declare-fun d!102571 () Bool)

(declare-fun e!433515 () Bool)

(assert (=> d!102571 e!433515))

(declare-fun c!86502 () Bool)

(declare-fun lt!347075 () SeekEntryResult!7927)

(assert (=> d!102571 (= c!86502 (and ((_ is Intermediate!7927) lt!347075) (undefined!8739 lt!347075)))))

(declare-fun e!433518 () SeekEntryResult!7927)

(assert (=> d!102571 (= lt!347075 e!433518)))

(declare-fun c!86501 () Bool)

(assert (=> d!102571 (= c!86501 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!347076 () (_ BitVec 64))

(assert (=> d!102571 (= lt!347076 (select (arr!20371 lt!346933) (toIndex!0 lt!346932 mask!3328)))))

(assert (=> d!102571 (validMask!0 mask!3328)))

(assert (=> d!102571 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346932 mask!3328) lt!346932 lt!346933 mask!3328) lt!347075)))

(declare-fun e!433516 () SeekEntryResult!7927)

(declare-fun b!779102 () Bool)

(assert (=> b!779102 (= e!433516 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!346932 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) lt!346932 lt!346933 mask!3328))))

(declare-fun b!779103 () Bool)

(assert (=> b!779103 (and (bvsge (index!34078 lt!347075) #b00000000000000000000000000000000) (bvslt (index!34078 lt!347075) (size!20791 lt!346933)))))

(declare-fun res!526914 () Bool)

(assert (=> b!779103 (= res!526914 (= (select (arr!20371 lt!346933) (index!34078 lt!347075)) lt!346932))))

(declare-fun e!433517 () Bool)

(assert (=> b!779103 (=> res!526914 e!433517)))

(declare-fun e!433519 () Bool)

(assert (=> b!779103 (= e!433519 e!433517)))

(declare-fun b!779104 () Bool)

(assert (=> b!779104 (= e!433518 e!433516)))

(declare-fun c!86500 () Bool)

(assert (=> b!779104 (= c!86500 (or (= lt!347076 lt!346932) (= (bvadd lt!347076 lt!347076) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!779105 () Bool)

(assert (=> b!779105 (and (bvsge (index!34078 lt!347075) #b00000000000000000000000000000000) (bvslt (index!34078 lt!347075) (size!20791 lt!346933)))))

(assert (=> b!779105 (= e!433517 (= (select (arr!20371 lt!346933) (index!34078 lt!347075)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!779106 () Bool)

(assert (=> b!779106 (and (bvsge (index!34078 lt!347075) #b00000000000000000000000000000000) (bvslt (index!34078 lt!347075) (size!20791 lt!346933)))))

(declare-fun res!526913 () Bool)

(assert (=> b!779106 (= res!526913 (= (select (arr!20371 lt!346933) (index!34078 lt!347075)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!779106 (=> res!526913 e!433517)))

(declare-fun b!779107 () Bool)

(assert (=> b!779107 (= e!433515 (bvsge (x!65178 lt!347075) #b01111111111111111111111111111110))))

(declare-fun b!779108 () Bool)

(assert (=> b!779108 (= e!433516 (Intermediate!7927 false (toIndex!0 lt!346932 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!779109 () Bool)

(assert (=> b!779109 (= e!433518 (Intermediate!7927 true (toIndex!0 lt!346932 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!779110 () Bool)

(assert (=> b!779110 (= e!433515 e!433519)))

(declare-fun res!526915 () Bool)

(assert (=> b!779110 (= res!526915 (and ((_ is Intermediate!7927) lt!347075) (not (undefined!8739 lt!347075)) (bvslt (x!65178 lt!347075) #b01111111111111111111111111111110) (bvsge (x!65178 lt!347075) #b00000000000000000000000000000000) (bvsge (x!65178 lt!347075) #b00000000000000000000000000000000)))))

(assert (=> b!779110 (=> (not res!526915) (not e!433519))))

(assert (= (and d!102571 c!86501) b!779109))

(assert (= (and d!102571 (not c!86501)) b!779104))

(assert (= (and b!779104 c!86500) b!779108))

(assert (= (and b!779104 (not c!86500)) b!779102))

(assert (= (and d!102571 c!86502) b!779107))

(assert (= (and d!102571 (not c!86502)) b!779110))

(assert (= (and b!779110 res!526915) b!779103))

(assert (= (and b!779103 (not res!526914)) b!779106))

(assert (= (and b!779106 (not res!526913)) b!779105))

(declare-fun m!723195 () Bool)

(assert (=> b!779103 m!723195))

(assert (=> b!779102 m!722915))

(declare-fun m!723197 () Bool)

(assert (=> b!779102 m!723197))

(assert (=> b!779102 m!723197))

(declare-fun m!723199 () Bool)

(assert (=> b!779102 m!723199))

(assert (=> d!102571 m!722915))

(declare-fun m!723201 () Bool)

(assert (=> d!102571 m!723201))

(assert (=> d!102571 m!722921))

(assert (=> b!779106 m!723195))

(assert (=> b!779105 m!723195))

(assert (=> b!778729 d!102571))

(declare-fun d!102575 () Bool)

(declare-fun lt!347084 () (_ BitVec 32))

(declare-fun lt!347083 () (_ BitVec 32))

(assert (=> d!102575 (= lt!347084 (bvmul (bvxor lt!347083 (bvlshr lt!347083 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102575 (= lt!347083 ((_ extract 31 0) (bvand (bvxor lt!346932 (bvlshr lt!346932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102575 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!526852 (let ((h!15396 ((_ extract 31 0) (bvand (bvxor lt!346932 (bvlshr lt!346932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65182 (bvmul (bvxor h!15396 (bvlshr h!15396 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65182 (bvlshr x!65182 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!526852 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!526852 #b00000000000000000000000000000000))))))

(assert (=> d!102575 (= (toIndex!0 lt!346932 mask!3328) (bvand (bvxor lt!347084 (bvlshr lt!347084 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!778729 d!102575))

(declare-fun b!779111 () Bool)

(declare-fun e!433520 () SeekEntryResult!7927)

(declare-fun lt!347085 () SeekEntryResult!7927)

(assert (=> b!779111 (= e!433520 (Found!7927 (index!34078 lt!347085)))))

(declare-fun b!779112 () Bool)

(declare-fun c!86503 () Bool)

(declare-fun lt!347086 () (_ BitVec 64))

(assert (=> b!779112 (= c!86503 (= lt!347086 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!433522 () SeekEntryResult!7927)

(assert (=> b!779112 (= e!433520 e!433522)))

(declare-fun b!779113 () Bool)

(assert (=> b!779113 (= e!433522 (seekKeyOrZeroReturnVacant!0 (x!65178 lt!347085) (index!34078 lt!347085) (index!34078 lt!347085) (select (arr!20371 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!779114 () Bool)

(declare-fun e!433521 () SeekEntryResult!7927)

(assert (=> b!779114 (= e!433521 Undefined!7927)))

(declare-fun b!779115 () Bool)

(assert (=> b!779115 (= e!433521 e!433520)))

(assert (=> b!779115 (= lt!347086 (select (arr!20371 a!3186) (index!34078 lt!347085)))))

(declare-fun c!86505 () Bool)

(assert (=> b!779115 (= c!86505 (= lt!347086 (select (arr!20371 a!3186) j!159)))))

(declare-fun d!102581 () Bool)

(declare-fun lt!347087 () SeekEntryResult!7927)

(assert (=> d!102581 (and (or ((_ is Undefined!7927) lt!347087) (not ((_ is Found!7927) lt!347087)) (and (bvsge (index!34077 lt!347087) #b00000000000000000000000000000000) (bvslt (index!34077 lt!347087) (size!20791 a!3186)))) (or ((_ is Undefined!7927) lt!347087) ((_ is Found!7927) lt!347087) (not ((_ is MissingZero!7927) lt!347087)) (and (bvsge (index!34076 lt!347087) #b00000000000000000000000000000000) (bvslt (index!34076 lt!347087) (size!20791 a!3186)))) (or ((_ is Undefined!7927) lt!347087) ((_ is Found!7927) lt!347087) ((_ is MissingZero!7927) lt!347087) (not ((_ is MissingVacant!7927) lt!347087)) (and (bvsge (index!34079 lt!347087) #b00000000000000000000000000000000) (bvslt (index!34079 lt!347087) (size!20791 a!3186)))) (or ((_ is Undefined!7927) lt!347087) (ite ((_ is Found!7927) lt!347087) (= (select (arr!20371 a!3186) (index!34077 lt!347087)) (select (arr!20371 a!3186) j!159)) (ite ((_ is MissingZero!7927) lt!347087) (= (select (arr!20371 a!3186) (index!34076 lt!347087)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7927) lt!347087) (= (select (arr!20371 a!3186) (index!34079 lt!347087)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102581 (= lt!347087 e!433521)))

(declare-fun c!86504 () Bool)

(assert (=> d!102581 (= c!86504 (and ((_ is Intermediate!7927) lt!347085) (undefined!8739 lt!347085)))))

(assert (=> d!102581 (= lt!347085 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20371 a!3186) j!159) mask!3328) (select (arr!20371 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!102581 (validMask!0 mask!3328)))

(assert (=> d!102581 (= (seekEntryOrOpen!0 (select (arr!20371 a!3186) j!159) a!3186 mask!3328) lt!347087)))

(declare-fun b!779116 () Bool)

(assert (=> b!779116 (= e!433522 (MissingZero!7927 (index!34078 lt!347085)))))

(assert (= (and d!102581 c!86504) b!779114))

(assert (= (and d!102581 (not c!86504)) b!779115))

(assert (= (and b!779115 c!86505) b!779111))

(assert (= (and b!779115 (not c!86505)) b!779112))

(assert (= (and b!779112 c!86503) b!779116))

(assert (= (and b!779112 (not c!86503)) b!779113))

(assert (=> b!779113 m!722903))

(declare-fun m!723203 () Bool)

(assert (=> b!779113 m!723203))

(declare-fun m!723205 () Bool)

(assert (=> b!779115 m!723205))

(assert (=> d!102581 m!722931))

(assert (=> d!102581 m!722903))

(assert (=> d!102581 m!722933))

(declare-fun m!723207 () Bool)

(assert (=> d!102581 m!723207))

(declare-fun m!723209 () Bool)

(assert (=> d!102581 m!723209))

(declare-fun m!723211 () Bool)

(assert (=> d!102581 m!723211))

(assert (=> d!102581 m!722921))

(assert (=> d!102581 m!722903))

(assert (=> d!102581 m!722931))

(assert (=> b!778727 d!102581))

(declare-fun b!779117 () Bool)

(declare-fun c!86507 () Bool)

(declare-fun lt!347089 () (_ BitVec 64))

(assert (=> b!779117 (= c!86507 (= lt!347089 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!433524 () SeekEntryResult!7927)

(declare-fun e!433525 () SeekEntryResult!7927)

(assert (=> b!779117 (= e!433524 e!433525)))

(declare-fun d!102587 () Bool)

(declare-fun lt!347088 () SeekEntryResult!7927)

(assert (=> d!102587 (and (or ((_ is Undefined!7927) lt!347088) (not ((_ is Found!7927) lt!347088)) (and (bvsge (index!34077 lt!347088) #b00000000000000000000000000000000) (bvslt (index!34077 lt!347088) (size!20791 a!3186)))) (or ((_ is Undefined!7927) lt!347088) ((_ is Found!7927) lt!347088) (not ((_ is MissingVacant!7927) lt!347088)) (not (= (index!34079 lt!347088) resIntermediateIndex!5)) (and (bvsge (index!34079 lt!347088) #b00000000000000000000000000000000) (bvslt (index!34079 lt!347088) (size!20791 a!3186)))) (or ((_ is Undefined!7927) lt!347088) (ite ((_ is Found!7927) lt!347088) (= (select (arr!20371 a!3186) (index!34077 lt!347088)) (select (arr!20371 a!3186) j!159)) (and ((_ is MissingVacant!7927) lt!347088) (= (index!34079 lt!347088) resIntermediateIndex!5) (= (select (arr!20371 a!3186) (index!34079 lt!347088)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!433523 () SeekEntryResult!7927)

(assert (=> d!102587 (= lt!347088 e!433523)))

(declare-fun c!86508 () Bool)

(assert (=> d!102587 (= c!86508 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!102587 (= lt!347089 (select (arr!20371 a!3186) resIntermediateIndex!5))))

(assert (=> d!102587 (validMask!0 mask!3328)))

(assert (=> d!102587 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20371 a!3186) j!159) a!3186 mask!3328) lt!347088)))

(declare-fun b!779118 () Bool)

(assert (=> b!779118 (= e!433523 e!433524)))

(declare-fun c!86506 () Bool)

(assert (=> b!779118 (= c!86506 (= lt!347089 (select (arr!20371 a!3186) j!159)))))

(declare-fun b!779119 () Bool)

(assert (=> b!779119 (= e!433525 (MissingVacant!7927 resIntermediateIndex!5))))

(declare-fun b!779120 () Bool)

(assert (=> b!779120 (= e!433523 Undefined!7927)))

(declare-fun b!779121 () Bool)

(assert (=> b!779121 (= e!433524 (Found!7927 resIntermediateIndex!5))))

(declare-fun b!779122 () Bool)

(assert (=> b!779122 (= e!433525 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20371 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!102587 c!86508) b!779120))

(assert (= (and d!102587 (not c!86508)) b!779118))

(assert (= (and b!779118 c!86506) b!779121))

(assert (= (and b!779118 (not c!86506)) b!779117))

(assert (= (and b!779117 c!86507) b!779119))

(assert (= (and b!779117 (not c!86507)) b!779122))

(declare-fun m!723213 () Bool)

(assert (=> d!102587 m!723213))

(declare-fun m!723215 () Bool)

(assert (=> d!102587 m!723215))

(assert (=> d!102587 m!722949))

(assert (=> d!102587 m!722921))

(declare-fun m!723217 () Bool)

(assert (=> b!779122 m!723217))

(assert (=> b!779122 m!723217))

(assert (=> b!779122 m!722903))

(declare-fun m!723219 () Bool)

(assert (=> b!779122 m!723219))

(assert (=> b!778728 d!102587))

(declare-fun d!102589 () Bool)

(assert (=> d!102589 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!67390 d!102589))

(declare-fun d!102595 () Bool)

(assert (=> d!102595 (= (array_inv!16230 a!3186) (bvsge (size!20791 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!67390 d!102595))

(check-sat (not b!779093) (not d!102557) (not bm!35223) (not b!778907) (not b!778909) (not b!779061) (not bm!35227) (not d!102541) (not b!779113) (not b!778896) (not b!778882) (not b!779089) (not d!102567) (not b!779076) (not b!779122) (not d!102565) (not d!102569) (not bm!35220) (not d!102587) (not b!778911) (not d!102571) (not b!778921) (not b!778922) (not d!102521) (not b!779010) (not d!102581) (not d!102535) (not b!779102) (not b!779078) (not b!779075))
(check-sat)
