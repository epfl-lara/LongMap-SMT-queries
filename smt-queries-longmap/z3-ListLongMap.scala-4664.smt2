; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64884 () Bool)

(assert start!64884)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41203 0))(
  ( (array!41204 (arr!19717 (Array (_ BitVec 32) (_ BitVec 64))) (size!20137 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41203)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!731955 () Bool)

(declare-fun e!409636 () Bool)

(declare-datatypes ((SeekEntryResult!7273 0))(
  ( (MissingZero!7273 (index!31460 (_ BitVec 32))) (Found!7273 (index!31461 (_ BitVec 32))) (Intermediate!7273 (undefined!8085 Bool) (index!31462 (_ BitVec 32)) (x!62595 (_ BitVec 32))) (Undefined!7273) (MissingVacant!7273 (index!31463 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41203 (_ BitVec 32)) SeekEntryResult!7273)

(assert (=> b!731955 (= e!409636 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19717 a!3186) j!159) a!3186 mask!3328) (Found!7273 j!159)))))

(declare-fun b!731957 () Bool)

(declare-fun res!491732 () Bool)

(declare-fun e!409644 () Bool)

(assert (=> b!731957 (=> (not res!491732) (not e!409644))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!731957 (= res!491732 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20137 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20137 a!3186))))))

(declare-fun b!731958 () Bool)

(declare-fun res!491731 () Bool)

(declare-fun e!409638 () Bool)

(assert (=> b!731958 (=> (not res!491731) (not e!409638))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!731958 (= res!491731 (and (= (size!20137 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20137 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20137 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!731959 () Bool)

(declare-fun lt!324366 () SeekEntryResult!7273)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41203 (_ BitVec 32)) SeekEntryResult!7273)

(assert (=> b!731959 (= e!409636 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19717 a!3186) j!159) a!3186 mask!3328) lt!324366))))

(declare-fun b!731960 () Bool)

(declare-fun e!409640 () Bool)

(declare-fun e!409641 () Bool)

(assert (=> b!731960 (= e!409640 e!409641)))

(declare-fun res!491739 () Bool)

(assert (=> b!731960 (=> (not res!491739) (not e!409641))))

(declare-fun lt!324364 () SeekEntryResult!7273)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41203 (_ BitVec 32)) SeekEntryResult!7273)

(assert (=> b!731960 (= res!491739 (= (seekEntryOrOpen!0 (select (arr!19717 a!3186) j!159) a!3186 mask!3328) lt!324364))))

(assert (=> b!731960 (= lt!324364 (Found!7273 j!159))))

(declare-fun b!731961 () Bool)

(declare-fun res!491730 () Bool)

(assert (=> b!731961 (=> (not res!491730) (not e!409638))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!731961 (= res!491730 (validKeyInArray!0 k0!2102))))

(declare-fun b!731962 () Bool)

(assert (=> b!731962 (= e!409641 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19717 a!3186) j!159) a!3186 mask!3328) lt!324364))))

(declare-fun b!731963 () Bool)

(declare-fun e!409643 () Bool)

(assert (=> b!731963 (= e!409644 e!409643)))

(declare-fun res!491738 () Bool)

(assert (=> b!731963 (=> (not res!491738) (not e!409643))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!731963 (= res!491738 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19717 a!3186) j!159) mask!3328) (select (arr!19717 a!3186) j!159) a!3186 mask!3328) lt!324366))))

(assert (=> b!731963 (= lt!324366 (Intermediate!7273 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!731964 () Bool)

(declare-fun e!409637 () Bool)

(declare-fun e!409635 () Bool)

(assert (=> b!731964 (= e!409637 (not e!409635))))

(declare-fun res!491726 () Bool)

(assert (=> b!731964 (=> res!491726 e!409635)))

(declare-fun lt!324360 () SeekEntryResult!7273)

(get-info :version)

(assert (=> b!731964 (= res!491726 (or (not ((_ is Intermediate!7273) lt!324360)) (bvsge x!1131 (x!62595 lt!324360))))))

(assert (=> b!731964 e!409640))

(declare-fun res!491727 () Bool)

(assert (=> b!731964 (=> (not res!491727) (not e!409640))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41203 (_ BitVec 32)) Bool)

(assert (=> b!731964 (= res!491727 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24943 0))(
  ( (Unit!24944) )
))
(declare-fun lt!324361 () Unit!24943)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41203 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24943)

(assert (=> b!731964 (= lt!324361 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!731965 () Bool)

(assert (=> b!731965 (= e!409638 e!409644)))

(declare-fun res!491729 () Bool)

(assert (=> b!731965 (=> (not res!491729) (not e!409644))))

(declare-fun lt!324363 () SeekEntryResult!7273)

(assert (=> b!731965 (= res!491729 (or (= lt!324363 (MissingZero!7273 i!1173)) (= lt!324363 (MissingVacant!7273 i!1173))))))

(assert (=> b!731965 (= lt!324363 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!731966 () Bool)

(declare-fun res!491728 () Bool)

(assert (=> b!731966 (=> (not res!491728) (not e!409644))))

(declare-datatypes ((List!13626 0))(
  ( (Nil!13623) (Cons!13622 (h!14688 (_ BitVec 64)) (t!19933 List!13626)) )
))
(declare-fun arrayNoDuplicates!0 (array!41203 (_ BitVec 32) List!13626) Bool)

(assert (=> b!731966 (= res!491728 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13623))))

(declare-fun b!731956 () Bool)

(assert (=> b!731956 (= e!409643 e!409637)))

(declare-fun res!491743 () Bool)

(assert (=> b!731956 (=> (not res!491743) (not e!409637))))

(declare-fun lt!324365 () SeekEntryResult!7273)

(assert (=> b!731956 (= res!491743 (= lt!324365 lt!324360))))

(declare-fun lt!324358 () (_ BitVec 64))

(declare-fun lt!324362 () array!41203)

(assert (=> b!731956 (= lt!324360 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324358 lt!324362 mask!3328))))

(assert (=> b!731956 (= lt!324365 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324358 mask!3328) lt!324358 lt!324362 mask!3328))))

(assert (=> b!731956 (= lt!324358 (select (store (arr!19717 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!731956 (= lt!324362 (array!41204 (store (arr!19717 a!3186) i!1173 k0!2102) (size!20137 a!3186)))))

(declare-fun res!491735 () Bool)

(assert (=> start!64884 (=> (not res!491735) (not e!409638))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64884 (= res!491735 (validMask!0 mask!3328))))

(assert (=> start!64884 e!409638))

(assert (=> start!64884 true))

(declare-fun array_inv!15576 (array!41203) Bool)

(assert (=> start!64884 (array_inv!15576 a!3186)))

(declare-fun b!731967 () Bool)

(declare-fun res!491740 () Bool)

(declare-fun e!409642 () Bool)

(assert (=> b!731967 (=> res!491740 e!409642)))

(assert (=> b!731967 (= res!491740 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19717 a!3186) j!159) a!3186 mask!3328) (Found!7273 j!159))))))

(declare-fun b!731968 () Bool)

(declare-fun res!491736 () Bool)

(assert (=> b!731968 (=> (not res!491736) (not e!409638))))

(declare-fun arrayContainsKey!0 (array!41203 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!731968 (= res!491736 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!731969 () Bool)

(declare-fun res!491741 () Bool)

(assert (=> b!731969 (=> (not res!491741) (not e!409644))))

(assert (=> b!731969 (= res!491741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!731970 () Bool)

(declare-fun res!491733 () Bool)

(assert (=> b!731970 (=> (not res!491733) (not e!409643))))

(assert (=> b!731970 (= res!491733 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19717 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!731971 () Bool)

(assert (=> b!731971 (= e!409635 e!409642)))

(declare-fun res!491737 () Bool)

(assert (=> b!731971 (=> res!491737 e!409642)))

(assert (=> b!731971 (= res!491737 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!324359 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!731971 (= lt!324359 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!731972 () Bool)

(declare-fun res!491742 () Bool)

(assert (=> b!731972 (=> (not res!491742) (not e!409643))))

(assert (=> b!731972 (= res!491742 e!409636)))

(declare-fun c!80492 () Bool)

(assert (=> b!731972 (= c!80492 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!731973 () Bool)

(declare-fun res!491734 () Bool)

(assert (=> b!731973 (=> (not res!491734) (not e!409638))))

(assert (=> b!731973 (= res!491734 (validKeyInArray!0 (select (arr!19717 a!3186) j!159)))))

(declare-fun b!731974 () Bool)

(assert (=> b!731974 (= e!409642 (or (bvslt mask!3328 #b00000000000000000000000000000000) (and (bvsge lt!324359 #b00000000000000000000000000000000) (bvslt lt!324359 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(assert (= (and start!64884 res!491735) b!731958))

(assert (= (and b!731958 res!491731) b!731973))

(assert (= (and b!731973 res!491734) b!731961))

(assert (= (and b!731961 res!491730) b!731968))

(assert (= (and b!731968 res!491736) b!731965))

(assert (= (and b!731965 res!491729) b!731969))

(assert (= (and b!731969 res!491741) b!731966))

(assert (= (and b!731966 res!491728) b!731957))

(assert (= (and b!731957 res!491732) b!731963))

(assert (= (and b!731963 res!491738) b!731970))

(assert (= (and b!731970 res!491733) b!731972))

(assert (= (and b!731972 c!80492) b!731959))

(assert (= (and b!731972 (not c!80492)) b!731955))

(assert (= (and b!731972 res!491742) b!731956))

(assert (= (and b!731956 res!491743) b!731964))

(assert (= (and b!731964 res!491727) b!731960))

(assert (= (and b!731960 res!491739) b!731962))

(assert (= (and b!731964 (not res!491726)) b!731971))

(assert (= (and b!731971 (not res!491737)) b!731967))

(assert (= (and b!731967 (not res!491740)) b!731974))

(declare-fun m!685755 () Bool)

(assert (=> b!731968 m!685755))

(declare-fun m!685757 () Bool)

(assert (=> b!731963 m!685757))

(assert (=> b!731963 m!685757))

(declare-fun m!685759 () Bool)

(assert (=> b!731963 m!685759))

(assert (=> b!731963 m!685759))

(assert (=> b!731963 m!685757))

(declare-fun m!685761 () Bool)

(assert (=> b!731963 m!685761))

(declare-fun m!685763 () Bool)

(assert (=> b!731964 m!685763))

(declare-fun m!685765 () Bool)

(assert (=> b!731964 m!685765))

(assert (=> b!731962 m!685757))

(assert (=> b!731962 m!685757))

(declare-fun m!685767 () Bool)

(assert (=> b!731962 m!685767))

(assert (=> b!731960 m!685757))

(assert (=> b!731960 m!685757))

(declare-fun m!685769 () Bool)

(assert (=> b!731960 m!685769))

(declare-fun m!685771 () Bool)

(assert (=> b!731971 m!685771))

(declare-fun m!685773 () Bool)

(assert (=> b!731966 m!685773))

(declare-fun m!685775 () Bool)

(assert (=> b!731965 m!685775))

(declare-fun m!685777 () Bool)

(assert (=> start!64884 m!685777))

(declare-fun m!685779 () Bool)

(assert (=> start!64884 m!685779))

(assert (=> b!731959 m!685757))

(assert (=> b!731959 m!685757))

(declare-fun m!685781 () Bool)

(assert (=> b!731959 m!685781))

(assert (=> b!731955 m!685757))

(assert (=> b!731955 m!685757))

(declare-fun m!685783 () Bool)

(assert (=> b!731955 m!685783))

(declare-fun m!685785 () Bool)

(assert (=> b!731970 m!685785))

(declare-fun m!685787 () Bool)

(assert (=> b!731969 m!685787))

(assert (=> b!731973 m!685757))

(assert (=> b!731973 m!685757))

(declare-fun m!685789 () Bool)

(assert (=> b!731973 m!685789))

(declare-fun m!685791 () Bool)

(assert (=> b!731961 m!685791))

(assert (=> b!731967 m!685757))

(assert (=> b!731967 m!685757))

(assert (=> b!731967 m!685783))

(declare-fun m!685793 () Bool)

(assert (=> b!731956 m!685793))

(declare-fun m!685795 () Bool)

(assert (=> b!731956 m!685795))

(declare-fun m!685797 () Bool)

(assert (=> b!731956 m!685797))

(assert (=> b!731956 m!685795))

(declare-fun m!685799 () Bool)

(assert (=> b!731956 m!685799))

(declare-fun m!685801 () Bool)

(assert (=> b!731956 m!685801))

(check-sat (not b!731960) (not b!731969) (not b!731965) (not b!731963) (not b!731973) (not b!731956) (not b!731967) (not b!731971) (not b!731955) (not b!731964) (not b!731966) (not start!64884) (not b!731968) (not b!731962) (not b!731959) (not b!731961))
(check-sat)
(get-model)

(declare-fun b!732106 () Bool)

(declare-fun e!409715 () Bool)

(declare-fun call!34860 () Bool)

(assert (=> b!732106 (= e!409715 call!34860)))

(declare-fun b!732107 () Bool)

(declare-fun e!409713 () Bool)

(declare-fun e!409716 () Bool)

(assert (=> b!732107 (= e!409713 e!409716)))

(declare-fun res!491858 () Bool)

(assert (=> b!732107 (=> (not res!491858) (not e!409716))))

(declare-fun e!409714 () Bool)

(assert (=> b!732107 (= res!491858 (not e!409714))))

(declare-fun res!491860 () Bool)

(assert (=> b!732107 (=> (not res!491860) (not e!409714))))

(assert (=> b!732107 (= res!491860 (validKeyInArray!0 (select (arr!19717 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!732108 () Bool)

(declare-fun contains!4031 (List!13626 (_ BitVec 64)) Bool)

(assert (=> b!732108 (= e!409714 (contains!4031 Nil!13623 (select (arr!19717 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!34857 () Bool)

(declare-fun c!80501 () Bool)

(assert (=> bm!34857 (= call!34860 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!80501 (Cons!13622 (select (arr!19717 a!3186) #b00000000000000000000000000000000) Nil!13623) Nil!13623)))))

(declare-fun b!732109 () Bool)

(assert (=> b!732109 (= e!409716 e!409715)))

(assert (=> b!732109 (= c!80501 (validKeyInArray!0 (select (arr!19717 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!732105 () Bool)

(assert (=> b!732105 (= e!409715 call!34860)))

(declare-fun d!99917 () Bool)

(declare-fun res!491859 () Bool)

(assert (=> d!99917 (=> res!491859 e!409713)))

(assert (=> d!99917 (= res!491859 (bvsge #b00000000000000000000000000000000 (size!20137 a!3186)))))

(assert (=> d!99917 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13623) e!409713)))

(assert (= (and d!99917 (not res!491859)) b!732107))

(assert (= (and b!732107 res!491860) b!732108))

(assert (= (and b!732107 res!491858) b!732109))

(assert (= (and b!732109 c!80501) b!732105))

(assert (= (and b!732109 (not c!80501)) b!732106))

(assert (= (or b!732105 b!732106) bm!34857))

(declare-fun m!685899 () Bool)

(assert (=> b!732107 m!685899))

(assert (=> b!732107 m!685899))

(declare-fun m!685901 () Bool)

(assert (=> b!732107 m!685901))

(assert (=> b!732108 m!685899))

(assert (=> b!732108 m!685899))

(declare-fun m!685903 () Bool)

(assert (=> b!732108 m!685903))

(assert (=> bm!34857 m!685899))

(declare-fun m!685905 () Bool)

(assert (=> bm!34857 m!685905))

(assert (=> b!732109 m!685899))

(assert (=> b!732109 m!685899))

(assert (=> b!732109 m!685901))

(assert (=> b!731966 d!99917))

(declare-fun b!732128 () Bool)

(declare-fun lt!324426 () SeekEntryResult!7273)

(assert (=> b!732128 (and (bvsge (index!31462 lt!324426) #b00000000000000000000000000000000) (bvslt (index!31462 lt!324426) (size!20137 lt!324362)))))

(declare-fun e!409728 () Bool)

(assert (=> b!732128 (= e!409728 (= (select (arr!19717 lt!324362) (index!31462 lt!324426)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!732129 () Bool)

(declare-fun e!409731 () SeekEntryResult!7273)

(assert (=> b!732129 (= e!409731 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) lt!324358 lt!324362 mask!3328))))

(declare-fun b!732130 () Bool)

(assert (=> b!732130 (and (bvsge (index!31462 lt!324426) #b00000000000000000000000000000000) (bvslt (index!31462 lt!324426) (size!20137 lt!324362)))))

(declare-fun res!491869 () Bool)

(assert (=> b!732130 (= res!491869 (= (select (arr!19717 lt!324362) (index!31462 lt!324426)) lt!324358))))

(assert (=> b!732130 (=> res!491869 e!409728)))

(declare-fun e!409727 () Bool)

(assert (=> b!732130 (= e!409727 e!409728)))

(declare-fun b!732131 () Bool)

(declare-fun e!409729 () Bool)

(assert (=> b!732131 (= e!409729 e!409727)))

(declare-fun res!491867 () Bool)

(assert (=> b!732131 (= res!491867 (and ((_ is Intermediate!7273) lt!324426) (not (undefined!8085 lt!324426)) (bvslt (x!62595 lt!324426) #b01111111111111111111111111111110) (bvsge (x!62595 lt!324426) #b00000000000000000000000000000000) (bvsge (x!62595 lt!324426) x!1131)))))

(assert (=> b!732131 (=> (not res!491867) (not e!409727))))

(declare-fun d!99919 () Bool)

(assert (=> d!99919 e!409729))

(declare-fun c!80508 () Bool)

(assert (=> d!99919 (= c!80508 (and ((_ is Intermediate!7273) lt!324426) (undefined!8085 lt!324426)))))

(declare-fun e!409730 () SeekEntryResult!7273)

(assert (=> d!99919 (= lt!324426 e!409730)))

(declare-fun c!80510 () Bool)

(assert (=> d!99919 (= c!80510 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!324425 () (_ BitVec 64))

(assert (=> d!99919 (= lt!324425 (select (arr!19717 lt!324362) index!1321))))

(assert (=> d!99919 (validMask!0 mask!3328)))

(assert (=> d!99919 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324358 lt!324362 mask!3328) lt!324426)))

(declare-fun b!732132 () Bool)

(assert (=> b!732132 (= e!409731 (Intermediate!7273 false index!1321 x!1131))))

(declare-fun b!732133 () Bool)

(assert (=> b!732133 (= e!409729 (bvsge (x!62595 lt!324426) #b01111111111111111111111111111110))))

(declare-fun b!732134 () Bool)

(assert (=> b!732134 (and (bvsge (index!31462 lt!324426) #b00000000000000000000000000000000) (bvslt (index!31462 lt!324426) (size!20137 lt!324362)))))

(declare-fun res!491868 () Bool)

(assert (=> b!732134 (= res!491868 (= (select (arr!19717 lt!324362) (index!31462 lt!324426)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!732134 (=> res!491868 e!409728)))

(declare-fun b!732135 () Bool)

(assert (=> b!732135 (= e!409730 e!409731)))

(declare-fun c!80509 () Bool)

(assert (=> b!732135 (= c!80509 (or (= lt!324425 lt!324358) (= (bvadd lt!324425 lt!324425) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!732136 () Bool)

(assert (=> b!732136 (= e!409730 (Intermediate!7273 true index!1321 x!1131))))

(assert (= (and d!99919 c!80510) b!732136))

(assert (= (and d!99919 (not c!80510)) b!732135))

(assert (= (and b!732135 c!80509) b!732132))

(assert (= (and b!732135 (not c!80509)) b!732129))

(assert (= (and d!99919 c!80508) b!732133))

(assert (= (and d!99919 (not c!80508)) b!732131))

(assert (= (and b!732131 res!491867) b!732130))

(assert (= (and b!732130 (not res!491869)) b!732134))

(assert (= (and b!732134 (not res!491868)) b!732128))

(declare-fun m!685907 () Bool)

(assert (=> b!732129 m!685907))

(assert (=> b!732129 m!685907))

(declare-fun m!685909 () Bool)

(assert (=> b!732129 m!685909))

(declare-fun m!685911 () Bool)

(assert (=> b!732134 m!685911))

(declare-fun m!685913 () Bool)

(assert (=> d!99919 m!685913))

(assert (=> d!99919 m!685777))

(assert (=> b!732130 m!685911))

(assert (=> b!732128 m!685911))

(assert (=> b!731956 d!99919))

(declare-fun b!732137 () Bool)

(declare-fun lt!324428 () SeekEntryResult!7273)

(assert (=> b!732137 (and (bvsge (index!31462 lt!324428) #b00000000000000000000000000000000) (bvslt (index!31462 lt!324428) (size!20137 lt!324362)))))

(declare-fun e!409733 () Bool)

(assert (=> b!732137 (= e!409733 (= (select (arr!19717 lt!324362) (index!31462 lt!324428)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!732138 () Bool)

(declare-fun e!409736 () SeekEntryResult!7273)

(assert (=> b!732138 (= e!409736 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!324358 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) lt!324358 lt!324362 mask!3328))))

(declare-fun b!732139 () Bool)

(assert (=> b!732139 (and (bvsge (index!31462 lt!324428) #b00000000000000000000000000000000) (bvslt (index!31462 lt!324428) (size!20137 lt!324362)))))

(declare-fun res!491872 () Bool)

(assert (=> b!732139 (= res!491872 (= (select (arr!19717 lt!324362) (index!31462 lt!324428)) lt!324358))))

(assert (=> b!732139 (=> res!491872 e!409733)))

(declare-fun e!409732 () Bool)

(assert (=> b!732139 (= e!409732 e!409733)))

(declare-fun b!732140 () Bool)

(declare-fun e!409734 () Bool)

(assert (=> b!732140 (= e!409734 e!409732)))

(declare-fun res!491870 () Bool)

(assert (=> b!732140 (= res!491870 (and ((_ is Intermediate!7273) lt!324428) (not (undefined!8085 lt!324428)) (bvslt (x!62595 lt!324428) #b01111111111111111111111111111110) (bvsge (x!62595 lt!324428) #b00000000000000000000000000000000) (bvsge (x!62595 lt!324428) #b00000000000000000000000000000000)))))

(assert (=> b!732140 (=> (not res!491870) (not e!409732))))

(declare-fun d!99921 () Bool)

(assert (=> d!99921 e!409734))

(declare-fun c!80511 () Bool)

(assert (=> d!99921 (= c!80511 (and ((_ is Intermediate!7273) lt!324428) (undefined!8085 lt!324428)))))

(declare-fun e!409735 () SeekEntryResult!7273)

(assert (=> d!99921 (= lt!324428 e!409735)))

(declare-fun c!80513 () Bool)

(assert (=> d!99921 (= c!80513 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!324427 () (_ BitVec 64))

(assert (=> d!99921 (= lt!324427 (select (arr!19717 lt!324362) (toIndex!0 lt!324358 mask!3328)))))

(assert (=> d!99921 (validMask!0 mask!3328)))

(assert (=> d!99921 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324358 mask!3328) lt!324358 lt!324362 mask!3328) lt!324428)))

(declare-fun b!732141 () Bool)

(assert (=> b!732141 (= e!409736 (Intermediate!7273 false (toIndex!0 lt!324358 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!732142 () Bool)

(assert (=> b!732142 (= e!409734 (bvsge (x!62595 lt!324428) #b01111111111111111111111111111110))))

(declare-fun b!732143 () Bool)

(assert (=> b!732143 (and (bvsge (index!31462 lt!324428) #b00000000000000000000000000000000) (bvslt (index!31462 lt!324428) (size!20137 lt!324362)))))

(declare-fun res!491871 () Bool)

(assert (=> b!732143 (= res!491871 (= (select (arr!19717 lt!324362) (index!31462 lt!324428)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!732143 (=> res!491871 e!409733)))

(declare-fun b!732144 () Bool)

(assert (=> b!732144 (= e!409735 e!409736)))

(declare-fun c!80512 () Bool)

(assert (=> b!732144 (= c!80512 (or (= lt!324427 lt!324358) (= (bvadd lt!324427 lt!324427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!732145 () Bool)

(assert (=> b!732145 (= e!409735 (Intermediate!7273 true (toIndex!0 lt!324358 mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!99921 c!80513) b!732145))

(assert (= (and d!99921 (not c!80513)) b!732144))

(assert (= (and b!732144 c!80512) b!732141))

(assert (= (and b!732144 (not c!80512)) b!732138))

(assert (= (and d!99921 c!80511) b!732142))

(assert (= (and d!99921 (not c!80511)) b!732140))

(assert (= (and b!732140 res!491870) b!732139))

(assert (= (and b!732139 (not res!491872)) b!732143))

(assert (= (and b!732143 (not res!491871)) b!732137))

(assert (=> b!732138 m!685795))

(declare-fun m!685915 () Bool)

(assert (=> b!732138 m!685915))

(assert (=> b!732138 m!685915))

(declare-fun m!685917 () Bool)

(assert (=> b!732138 m!685917))

(declare-fun m!685919 () Bool)

(assert (=> b!732143 m!685919))

(assert (=> d!99921 m!685795))

(declare-fun m!685921 () Bool)

(assert (=> d!99921 m!685921))

(assert (=> d!99921 m!685777))

(assert (=> b!732139 m!685919))

(assert (=> b!732137 m!685919))

(assert (=> b!731956 d!99921))

(declare-fun d!99925 () Bool)

(declare-fun lt!324434 () (_ BitVec 32))

(declare-fun lt!324433 () (_ BitVec 32))

(assert (=> d!99925 (= lt!324434 (bvmul (bvxor lt!324433 (bvlshr lt!324433 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99925 (= lt!324433 ((_ extract 31 0) (bvand (bvxor lt!324358 (bvlshr lt!324358 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99925 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!491873 (let ((h!14691 ((_ extract 31 0) (bvand (bvxor lt!324358 (bvlshr lt!324358 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62599 (bvmul (bvxor h!14691 (bvlshr h!14691 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62599 (bvlshr x!62599 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!491873 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!491873 #b00000000000000000000000000000000))))))

(assert (=> d!99925 (= (toIndex!0 lt!324358 mask!3328) (bvand (bvxor lt!324434 (bvlshr lt!324434 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!731956 d!99925))

(declare-fun b!732188 () Bool)

(declare-fun e!409760 () SeekEntryResult!7273)

(declare-fun e!409759 () SeekEntryResult!7273)

(assert (=> b!732188 (= e!409760 e!409759)))

(declare-fun lt!324447 () (_ BitVec 64))

(declare-fun c!80533 () Bool)

(assert (=> b!732188 (= c!80533 (= lt!324447 (select (arr!19717 a!3186) j!159)))))

(declare-fun b!732189 () Bool)

(declare-fun e!409761 () SeekEntryResult!7273)

(assert (=> b!732189 (= e!409761 (MissingVacant!7273 resIntermediateIndex!5))))

(declare-fun b!732190 () Bool)

(assert (=> b!732190 (= e!409759 (Found!7273 index!1321))))

(declare-fun d!99929 () Bool)

(declare-fun lt!324448 () SeekEntryResult!7273)

(assert (=> d!99929 (and (or ((_ is Undefined!7273) lt!324448) (not ((_ is Found!7273) lt!324448)) (and (bvsge (index!31461 lt!324448) #b00000000000000000000000000000000) (bvslt (index!31461 lt!324448) (size!20137 a!3186)))) (or ((_ is Undefined!7273) lt!324448) ((_ is Found!7273) lt!324448) (not ((_ is MissingVacant!7273) lt!324448)) (not (= (index!31463 lt!324448) resIntermediateIndex!5)) (and (bvsge (index!31463 lt!324448) #b00000000000000000000000000000000) (bvslt (index!31463 lt!324448) (size!20137 a!3186)))) (or ((_ is Undefined!7273) lt!324448) (ite ((_ is Found!7273) lt!324448) (= (select (arr!19717 a!3186) (index!31461 lt!324448)) (select (arr!19717 a!3186) j!159)) (and ((_ is MissingVacant!7273) lt!324448) (= (index!31463 lt!324448) resIntermediateIndex!5) (= (select (arr!19717 a!3186) (index!31463 lt!324448)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!99929 (= lt!324448 e!409760)))

(declare-fun c!80534 () Bool)

(assert (=> d!99929 (= c!80534 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!99929 (= lt!324447 (select (arr!19717 a!3186) index!1321))))

(assert (=> d!99929 (validMask!0 mask!3328)))

(assert (=> d!99929 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19717 a!3186) j!159) a!3186 mask!3328) lt!324448)))

(declare-fun b!732191 () Bool)

(assert (=> b!732191 (= e!409761 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!19717 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!732192 () Bool)

(declare-fun c!80532 () Bool)

(assert (=> b!732192 (= c!80532 (= lt!324447 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!732192 (= e!409759 e!409761)))

(declare-fun b!732193 () Bool)

(assert (=> b!732193 (= e!409760 Undefined!7273)))

(assert (= (and d!99929 c!80534) b!732193))

(assert (= (and d!99929 (not c!80534)) b!732188))

(assert (= (and b!732188 c!80533) b!732190))

(assert (= (and b!732188 (not c!80533)) b!732192))

(assert (= (and b!732192 c!80532) b!732189))

(assert (= (and b!732192 (not c!80532)) b!732191))

(declare-fun m!685923 () Bool)

(assert (=> d!99929 m!685923))

(declare-fun m!685925 () Bool)

(assert (=> d!99929 m!685925))

(declare-fun m!685927 () Bool)

(assert (=> d!99929 m!685927))

(assert (=> d!99929 m!685777))

(assert (=> b!732191 m!685907))

(assert (=> b!732191 m!685907))

(assert (=> b!732191 m!685757))

(declare-fun m!685929 () Bool)

(assert (=> b!732191 m!685929))

(assert (=> b!731967 d!99929))

(declare-fun d!99931 () Bool)

(declare-fun res!491888 () Bool)

(declare-fun e!409774 () Bool)

(assert (=> d!99931 (=> res!491888 e!409774)))

(assert (=> d!99931 (= res!491888 (= (select (arr!19717 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!99931 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!409774)))

(declare-fun b!732213 () Bool)

(declare-fun e!409775 () Bool)

(assert (=> b!732213 (= e!409774 e!409775)))

(declare-fun res!491889 () Bool)

(assert (=> b!732213 (=> (not res!491889) (not e!409775))))

(assert (=> b!732213 (= res!491889 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20137 a!3186)))))

(declare-fun b!732214 () Bool)

(assert (=> b!732214 (= e!409775 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!99931 (not res!491888)) b!732213))

(assert (= (and b!732213 res!491889) b!732214))

(assert (=> d!99931 m!685899))

(declare-fun m!685949 () Bool)

(assert (=> b!732214 m!685949))

(assert (=> b!731968 d!99931))

(declare-fun d!99937 () Bool)

(declare-fun res!491901 () Bool)

(declare-fun e!409793 () Bool)

(assert (=> d!99937 (=> res!491901 e!409793)))

(assert (=> d!99937 (= res!491901 (bvsge j!159 (size!20137 a!3186)))))

(assert (=> d!99937 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!409793)))

(declare-fun b!732235 () Bool)

(declare-fun e!409791 () Bool)

(assert (=> b!732235 (= e!409793 e!409791)))

(declare-fun c!80546 () Bool)

(assert (=> b!732235 (= c!80546 (validKeyInArray!0 (select (arr!19717 a!3186) j!159)))))

(declare-fun b!732236 () Bool)

(declare-fun e!409792 () Bool)

(declare-fun call!34866 () Bool)

(assert (=> b!732236 (= e!409792 call!34866)))

(declare-fun b!732237 () Bool)

(assert (=> b!732237 (= e!409791 call!34866)))

(declare-fun bm!34863 () Bool)

(assert (=> bm!34863 (= call!34866 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!732238 () Bool)

(assert (=> b!732238 (= e!409791 e!409792)))

(declare-fun lt!324477 () (_ BitVec 64))

(assert (=> b!732238 (= lt!324477 (select (arr!19717 a!3186) j!159))))

(declare-fun lt!324478 () Unit!24943)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!41203 (_ BitVec 64) (_ BitVec 32)) Unit!24943)

(assert (=> b!732238 (= lt!324478 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!324477 j!159))))

(assert (=> b!732238 (arrayContainsKey!0 a!3186 lt!324477 #b00000000000000000000000000000000)))

(declare-fun lt!324479 () Unit!24943)

(assert (=> b!732238 (= lt!324479 lt!324478)))

(declare-fun res!491900 () Bool)

(assert (=> b!732238 (= res!491900 (= (seekEntryOrOpen!0 (select (arr!19717 a!3186) j!159) a!3186 mask!3328) (Found!7273 j!159)))))

(assert (=> b!732238 (=> (not res!491900) (not e!409792))))

(assert (= (and d!99937 (not res!491901)) b!732235))

(assert (= (and b!732235 c!80546) b!732238))

(assert (= (and b!732235 (not c!80546)) b!732237))

(assert (= (and b!732238 res!491900) b!732236))

(assert (= (or b!732236 b!732237) bm!34863))

(assert (=> b!732235 m!685757))

(assert (=> b!732235 m!685757))

(assert (=> b!732235 m!685789))

(declare-fun m!685965 () Bool)

(assert (=> bm!34863 m!685965))

(assert (=> b!732238 m!685757))

(declare-fun m!685967 () Bool)

(assert (=> b!732238 m!685967))

(declare-fun m!685969 () Bool)

(assert (=> b!732238 m!685969))

(assert (=> b!732238 m!685757))

(assert (=> b!732238 m!685769))

(assert (=> b!731964 d!99937))

(declare-fun d!99945 () Bool)

(assert (=> d!99945 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!324486 () Unit!24943)

(declare-fun choose!38 (array!41203 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24943)

(assert (=> d!99945 (= lt!324486 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!99945 (validMask!0 mask!3328)))

(assert (=> d!99945 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!324486)))

(declare-fun bs!20958 () Bool)

(assert (= bs!20958 d!99945))

(assert (=> bs!20958 m!685763))

(declare-fun m!685971 () Bool)

(assert (=> bs!20958 m!685971))

(assert (=> bs!20958 m!685777))

(assert (=> b!731964 d!99945))

(declare-fun b!732329 () Bool)

(declare-fun e!409843 () SeekEntryResult!7273)

(declare-fun lt!324522 () SeekEntryResult!7273)

(assert (=> b!732329 (= e!409843 (Found!7273 (index!31462 lt!324522)))))

(declare-fun d!99947 () Bool)

(declare-fun lt!324520 () SeekEntryResult!7273)

(assert (=> d!99947 (and (or ((_ is Undefined!7273) lt!324520) (not ((_ is Found!7273) lt!324520)) (and (bvsge (index!31461 lt!324520) #b00000000000000000000000000000000) (bvslt (index!31461 lt!324520) (size!20137 a!3186)))) (or ((_ is Undefined!7273) lt!324520) ((_ is Found!7273) lt!324520) (not ((_ is MissingZero!7273) lt!324520)) (and (bvsge (index!31460 lt!324520) #b00000000000000000000000000000000) (bvslt (index!31460 lt!324520) (size!20137 a!3186)))) (or ((_ is Undefined!7273) lt!324520) ((_ is Found!7273) lt!324520) ((_ is MissingZero!7273) lt!324520) (not ((_ is MissingVacant!7273) lt!324520)) (and (bvsge (index!31463 lt!324520) #b00000000000000000000000000000000) (bvslt (index!31463 lt!324520) (size!20137 a!3186)))) (or ((_ is Undefined!7273) lt!324520) (ite ((_ is Found!7273) lt!324520) (= (select (arr!19717 a!3186) (index!31461 lt!324520)) k0!2102) (ite ((_ is MissingZero!7273) lt!324520) (= (select (arr!19717 a!3186) (index!31460 lt!324520)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7273) lt!324520) (= (select (arr!19717 a!3186) (index!31463 lt!324520)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!409842 () SeekEntryResult!7273)

(assert (=> d!99947 (= lt!324520 e!409842)))

(declare-fun c!80586 () Bool)

(assert (=> d!99947 (= c!80586 (and ((_ is Intermediate!7273) lt!324522) (undefined!8085 lt!324522)))))

(assert (=> d!99947 (= lt!324522 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!99947 (validMask!0 mask!3328)))

(assert (=> d!99947 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!324520)))

(declare-fun b!732330 () Bool)

(declare-fun e!409841 () SeekEntryResult!7273)

(assert (=> b!732330 (= e!409841 (seekKeyOrZeroReturnVacant!0 (x!62595 lt!324522) (index!31462 lt!324522) (index!31462 lt!324522) k0!2102 a!3186 mask!3328))))

(declare-fun b!732331 () Bool)

(assert (=> b!732331 (= e!409842 Undefined!7273)))

(declare-fun b!732332 () Bool)

(declare-fun c!80588 () Bool)

(declare-fun lt!324521 () (_ BitVec 64))

(assert (=> b!732332 (= c!80588 (= lt!324521 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!732332 (= e!409843 e!409841)))

(declare-fun b!732333 () Bool)

(assert (=> b!732333 (= e!409841 (MissingZero!7273 (index!31462 lt!324522)))))

(declare-fun b!732334 () Bool)

(assert (=> b!732334 (= e!409842 e!409843)))

(assert (=> b!732334 (= lt!324521 (select (arr!19717 a!3186) (index!31462 lt!324522)))))

(declare-fun c!80587 () Bool)

(assert (=> b!732334 (= c!80587 (= lt!324521 k0!2102))))

(assert (= (and d!99947 c!80586) b!732331))

(assert (= (and d!99947 (not c!80586)) b!732334))

(assert (= (and b!732334 c!80587) b!732329))

(assert (= (and b!732334 (not c!80587)) b!732332))

(assert (= (and b!732332 c!80588) b!732333))

(assert (= (and b!732332 (not c!80588)) b!732330))

(assert (=> d!99947 m!685777))

(declare-fun m!686017 () Bool)

(assert (=> d!99947 m!686017))

(declare-fun m!686019 () Bool)

(assert (=> d!99947 m!686019))

(declare-fun m!686021 () Bool)

(assert (=> d!99947 m!686021))

(assert (=> d!99947 m!686019))

(declare-fun m!686023 () Bool)

(assert (=> d!99947 m!686023))

(declare-fun m!686025 () Bool)

(assert (=> d!99947 m!686025))

(declare-fun m!686027 () Bool)

(assert (=> b!732330 m!686027))

(declare-fun m!686029 () Bool)

(assert (=> b!732334 m!686029))

(assert (=> b!731965 d!99947))

(assert (=> b!731955 d!99929))

(declare-fun d!99963 () Bool)

(assert (=> d!99963 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!731961 d!99963))

(declare-fun b!732339 () Bool)

(declare-fun e!409849 () SeekEntryResult!7273)

(declare-fun e!409848 () SeekEntryResult!7273)

(assert (=> b!732339 (= e!409849 e!409848)))

(declare-fun c!80590 () Bool)

(declare-fun lt!324523 () (_ BitVec 64))

(assert (=> b!732339 (= c!80590 (= lt!324523 (select (arr!19717 a!3186) j!159)))))

(declare-fun b!732340 () Bool)

(declare-fun e!409850 () SeekEntryResult!7273)

(assert (=> b!732340 (= e!409850 (MissingVacant!7273 resIntermediateIndex!5))))

(declare-fun b!732341 () Bool)

(assert (=> b!732341 (= e!409848 (Found!7273 resIntermediateIndex!5))))

(declare-fun d!99965 () Bool)

(declare-fun lt!324524 () SeekEntryResult!7273)

(assert (=> d!99965 (and (or ((_ is Undefined!7273) lt!324524) (not ((_ is Found!7273) lt!324524)) (and (bvsge (index!31461 lt!324524) #b00000000000000000000000000000000) (bvslt (index!31461 lt!324524) (size!20137 a!3186)))) (or ((_ is Undefined!7273) lt!324524) ((_ is Found!7273) lt!324524) (not ((_ is MissingVacant!7273) lt!324524)) (not (= (index!31463 lt!324524) resIntermediateIndex!5)) (and (bvsge (index!31463 lt!324524) #b00000000000000000000000000000000) (bvslt (index!31463 lt!324524) (size!20137 a!3186)))) (or ((_ is Undefined!7273) lt!324524) (ite ((_ is Found!7273) lt!324524) (= (select (arr!19717 a!3186) (index!31461 lt!324524)) (select (arr!19717 a!3186) j!159)) (and ((_ is MissingVacant!7273) lt!324524) (= (index!31463 lt!324524) resIntermediateIndex!5) (= (select (arr!19717 a!3186) (index!31463 lt!324524)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!99965 (= lt!324524 e!409849)))

(declare-fun c!80591 () Bool)

(assert (=> d!99965 (= c!80591 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!99965 (= lt!324523 (select (arr!19717 a!3186) resIntermediateIndex!5))))

(assert (=> d!99965 (validMask!0 mask!3328)))

(assert (=> d!99965 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19717 a!3186) j!159) a!3186 mask!3328) lt!324524)))

(declare-fun b!732342 () Bool)

(assert (=> b!732342 (= e!409850 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!19717 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!732343 () Bool)

(declare-fun c!80589 () Bool)

(assert (=> b!732343 (= c!80589 (= lt!324523 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!732343 (= e!409848 e!409850)))

(declare-fun b!732344 () Bool)

(assert (=> b!732344 (= e!409849 Undefined!7273)))

(assert (= (and d!99965 c!80591) b!732344))

(assert (= (and d!99965 (not c!80591)) b!732339))

(assert (= (and b!732339 c!80590) b!732341))

(assert (= (and b!732339 (not c!80590)) b!732343))

(assert (= (and b!732343 c!80589) b!732340))

(assert (= (and b!732343 (not c!80589)) b!732342))

(declare-fun m!686035 () Bool)

(assert (=> d!99965 m!686035))

(declare-fun m!686037 () Bool)

(assert (=> d!99965 m!686037))

(assert (=> d!99965 m!685785))

(assert (=> d!99965 m!685777))

(declare-fun m!686039 () Bool)

(assert (=> b!732342 m!686039))

(assert (=> b!732342 m!686039))

(assert (=> b!732342 m!685757))

(declare-fun m!686041 () Bool)

(assert (=> b!732342 m!686041))

(assert (=> b!731962 d!99965))

(declare-fun d!99969 () Bool)

(assert (=> d!99969 (= (validKeyInArray!0 (select (arr!19717 a!3186) j!159)) (and (not (= (select (arr!19717 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19717 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!731973 d!99969))

(declare-fun b!732347 () Bool)

(declare-fun lt!324526 () SeekEntryResult!7273)

(assert (=> b!732347 (and (bvsge (index!31462 lt!324526) #b00000000000000000000000000000000) (bvslt (index!31462 lt!324526) (size!20137 a!3186)))))

(declare-fun e!409854 () Bool)

(assert (=> b!732347 (= e!409854 (= (select (arr!19717 a!3186) (index!31462 lt!324526)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!409857 () SeekEntryResult!7273)

(declare-fun b!732348 () Bool)

(assert (=> b!732348 (= e!409857 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!19717 a!3186) j!159) mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) (select (arr!19717 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!732349 () Bool)

(assert (=> b!732349 (and (bvsge (index!31462 lt!324526) #b00000000000000000000000000000000) (bvslt (index!31462 lt!324526) (size!20137 a!3186)))))

(declare-fun res!491923 () Bool)

(assert (=> b!732349 (= res!491923 (= (select (arr!19717 a!3186) (index!31462 lt!324526)) (select (arr!19717 a!3186) j!159)))))

(assert (=> b!732349 (=> res!491923 e!409854)))

(declare-fun e!409853 () Bool)

(assert (=> b!732349 (= e!409853 e!409854)))

(declare-fun b!732350 () Bool)

(declare-fun e!409855 () Bool)

(assert (=> b!732350 (= e!409855 e!409853)))

(declare-fun res!491921 () Bool)

(assert (=> b!732350 (= res!491921 (and ((_ is Intermediate!7273) lt!324526) (not (undefined!8085 lt!324526)) (bvslt (x!62595 lt!324526) #b01111111111111111111111111111110) (bvsge (x!62595 lt!324526) #b00000000000000000000000000000000) (bvsge (x!62595 lt!324526) #b00000000000000000000000000000000)))))

(assert (=> b!732350 (=> (not res!491921) (not e!409853))))

(declare-fun d!99971 () Bool)

(assert (=> d!99971 e!409855))

(declare-fun c!80592 () Bool)

(assert (=> d!99971 (= c!80592 (and ((_ is Intermediate!7273) lt!324526) (undefined!8085 lt!324526)))))

(declare-fun e!409856 () SeekEntryResult!7273)

(assert (=> d!99971 (= lt!324526 e!409856)))

(declare-fun c!80594 () Bool)

(assert (=> d!99971 (= c!80594 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!324525 () (_ BitVec 64))

(assert (=> d!99971 (= lt!324525 (select (arr!19717 a!3186) (toIndex!0 (select (arr!19717 a!3186) j!159) mask!3328)))))

(assert (=> d!99971 (validMask!0 mask!3328)))

(assert (=> d!99971 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19717 a!3186) j!159) mask!3328) (select (arr!19717 a!3186) j!159) a!3186 mask!3328) lt!324526)))

(declare-fun b!732351 () Bool)

(assert (=> b!732351 (= e!409857 (Intermediate!7273 false (toIndex!0 (select (arr!19717 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!732352 () Bool)

(assert (=> b!732352 (= e!409855 (bvsge (x!62595 lt!324526) #b01111111111111111111111111111110))))

(declare-fun b!732353 () Bool)

(assert (=> b!732353 (and (bvsge (index!31462 lt!324526) #b00000000000000000000000000000000) (bvslt (index!31462 lt!324526) (size!20137 a!3186)))))

(declare-fun res!491922 () Bool)

(assert (=> b!732353 (= res!491922 (= (select (arr!19717 a!3186) (index!31462 lt!324526)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!732353 (=> res!491922 e!409854)))

(declare-fun b!732354 () Bool)

(assert (=> b!732354 (= e!409856 e!409857)))

(declare-fun c!80593 () Bool)

(assert (=> b!732354 (= c!80593 (or (= lt!324525 (select (arr!19717 a!3186) j!159)) (= (bvadd lt!324525 lt!324525) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!732355 () Bool)

(assert (=> b!732355 (= e!409856 (Intermediate!7273 true (toIndex!0 (select (arr!19717 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!99971 c!80594) b!732355))

(assert (= (and d!99971 (not c!80594)) b!732354))

(assert (= (and b!732354 c!80593) b!732351))

(assert (= (and b!732354 (not c!80593)) b!732348))

(assert (= (and d!99971 c!80592) b!732352))

(assert (= (and d!99971 (not c!80592)) b!732350))

(assert (= (and b!732350 res!491921) b!732349))

(assert (= (and b!732349 (not res!491923)) b!732353))

(assert (= (and b!732353 (not res!491922)) b!732347))

(assert (=> b!732348 m!685759))

(declare-fun m!686043 () Bool)

(assert (=> b!732348 m!686043))

(assert (=> b!732348 m!686043))

(assert (=> b!732348 m!685757))

(declare-fun m!686045 () Bool)

(assert (=> b!732348 m!686045))

(declare-fun m!686047 () Bool)

(assert (=> b!732353 m!686047))

(assert (=> d!99971 m!685759))

(declare-fun m!686049 () Bool)

(assert (=> d!99971 m!686049))

(assert (=> d!99971 m!685777))

(assert (=> b!732349 m!686047))

(assert (=> b!732347 m!686047))

(assert (=> b!731963 d!99971))

(declare-fun d!99975 () Bool)

(declare-fun lt!324528 () (_ BitVec 32))

(declare-fun lt!324527 () (_ BitVec 32))

(assert (=> d!99975 (= lt!324528 (bvmul (bvxor lt!324527 (bvlshr lt!324527 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99975 (= lt!324527 ((_ extract 31 0) (bvand (bvxor (select (arr!19717 a!3186) j!159) (bvlshr (select (arr!19717 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99975 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!491873 (let ((h!14691 ((_ extract 31 0) (bvand (bvxor (select (arr!19717 a!3186) j!159) (bvlshr (select (arr!19717 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62599 (bvmul (bvxor h!14691 (bvlshr h!14691 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62599 (bvlshr x!62599 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!491873 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!491873 #b00000000000000000000000000000000))))))

(assert (=> d!99975 (= (toIndex!0 (select (arr!19717 a!3186) j!159) mask!3328) (bvand (bvxor lt!324528 (bvlshr lt!324528 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!731963 d!99975))

(declare-fun d!99977 () Bool)

(declare-fun res!491925 () Bool)

(declare-fun e!409860 () Bool)

(assert (=> d!99977 (=> res!491925 e!409860)))

(assert (=> d!99977 (= res!491925 (bvsge #b00000000000000000000000000000000 (size!20137 a!3186)))))

(assert (=> d!99977 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!409860)))

(declare-fun b!732356 () Bool)

(declare-fun e!409858 () Bool)

(assert (=> b!732356 (= e!409860 e!409858)))

(declare-fun c!80595 () Bool)

(assert (=> b!732356 (= c!80595 (validKeyInArray!0 (select (arr!19717 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!732357 () Bool)

(declare-fun e!409859 () Bool)

(declare-fun call!34867 () Bool)

(assert (=> b!732357 (= e!409859 call!34867)))

(declare-fun b!732358 () Bool)

(assert (=> b!732358 (= e!409858 call!34867)))

(declare-fun bm!34864 () Bool)

(assert (=> bm!34864 (= call!34867 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!732359 () Bool)

(assert (=> b!732359 (= e!409858 e!409859)))

(declare-fun lt!324529 () (_ BitVec 64))

(assert (=> b!732359 (= lt!324529 (select (arr!19717 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!324530 () Unit!24943)

(assert (=> b!732359 (= lt!324530 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!324529 #b00000000000000000000000000000000))))

(assert (=> b!732359 (arrayContainsKey!0 a!3186 lt!324529 #b00000000000000000000000000000000)))

(declare-fun lt!324531 () Unit!24943)

(assert (=> b!732359 (= lt!324531 lt!324530)))

(declare-fun res!491924 () Bool)

(assert (=> b!732359 (= res!491924 (= (seekEntryOrOpen!0 (select (arr!19717 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7273 #b00000000000000000000000000000000)))))

(assert (=> b!732359 (=> (not res!491924) (not e!409859))))

(assert (= (and d!99977 (not res!491925)) b!732356))

(assert (= (and b!732356 c!80595) b!732359))

(assert (= (and b!732356 (not c!80595)) b!732358))

(assert (= (and b!732359 res!491924) b!732357))

(assert (= (or b!732357 b!732358) bm!34864))

(assert (=> b!732356 m!685899))

(assert (=> b!732356 m!685899))

(assert (=> b!732356 m!685901))

(declare-fun m!686051 () Bool)

(assert (=> bm!34864 m!686051))

(assert (=> b!732359 m!685899))

(declare-fun m!686053 () Bool)

(assert (=> b!732359 m!686053))

(declare-fun m!686055 () Bool)

(assert (=> b!732359 m!686055))

(assert (=> b!732359 m!685899))

(declare-fun m!686057 () Bool)

(assert (=> b!732359 m!686057))

(assert (=> b!731969 d!99977))

(declare-fun b!732360 () Bool)

(declare-fun lt!324533 () SeekEntryResult!7273)

(assert (=> b!732360 (and (bvsge (index!31462 lt!324533) #b00000000000000000000000000000000) (bvslt (index!31462 lt!324533) (size!20137 a!3186)))))

(declare-fun e!409862 () Bool)

(assert (=> b!732360 (= e!409862 (= (select (arr!19717 a!3186) (index!31462 lt!324533)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!409865 () SeekEntryResult!7273)

(declare-fun b!732361 () Bool)

(assert (=> b!732361 (= e!409865 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) (select (arr!19717 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!732362 () Bool)

(assert (=> b!732362 (and (bvsge (index!31462 lt!324533) #b00000000000000000000000000000000) (bvslt (index!31462 lt!324533) (size!20137 a!3186)))))

(declare-fun res!491928 () Bool)

(assert (=> b!732362 (= res!491928 (= (select (arr!19717 a!3186) (index!31462 lt!324533)) (select (arr!19717 a!3186) j!159)))))

(assert (=> b!732362 (=> res!491928 e!409862)))

(declare-fun e!409861 () Bool)

(assert (=> b!732362 (= e!409861 e!409862)))

(declare-fun b!732363 () Bool)

(declare-fun e!409863 () Bool)

(assert (=> b!732363 (= e!409863 e!409861)))

(declare-fun res!491926 () Bool)

(assert (=> b!732363 (= res!491926 (and ((_ is Intermediate!7273) lt!324533) (not (undefined!8085 lt!324533)) (bvslt (x!62595 lt!324533) #b01111111111111111111111111111110) (bvsge (x!62595 lt!324533) #b00000000000000000000000000000000) (bvsge (x!62595 lt!324533) x!1131)))))

(assert (=> b!732363 (=> (not res!491926) (not e!409861))))

(declare-fun d!99979 () Bool)

(assert (=> d!99979 e!409863))

(declare-fun c!80596 () Bool)

(assert (=> d!99979 (= c!80596 (and ((_ is Intermediate!7273) lt!324533) (undefined!8085 lt!324533)))))

(declare-fun e!409864 () SeekEntryResult!7273)

(assert (=> d!99979 (= lt!324533 e!409864)))

(declare-fun c!80598 () Bool)

(assert (=> d!99979 (= c!80598 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!324532 () (_ BitVec 64))

(assert (=> d!99979 (= lt!324532 (select (arr!19717 a!3186) index!1321))))

(assert (=> d!99979 (validMask!0 mask!3328)))

(assert (=> d!99979 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19717 a!3186) j!159) a!3186 mask!3328) lt!324533)))

(declare-fun b!732364 () Bool)

(assert (=> b!732364 (= e!409865 (Intermediate!7273 false index!1321 x!1131))))

(declare-fun b!732365 () Bool)

(assert (=> b!732365 (= e!409863 (bvsge (x!62595 lt!324533) #b01111111111111111111111111111110))))

(declare-fun b!732366 () Bool)

(assert (=> b!732366 (and (bvsge (index!31462 lt!324533) #b00000000000000000000000000000000) (bvslt (index!31462 lt!324533) (size!20137 a!3186)))))

(declare-fun res!491927 () Bool)

(assert (=> b!732366 (= res!491927 (= (select (arr!19717 a!3186) (index!31462 lt!324533)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!732366 (=> res!491927 e!409862)))

(declare-fun b!732367 () Bool)

(assert (=> b!732367 (= e!409864 e!409865)))

(declare-fun c!80597 () Bool)

(assert (=> b!732367 (= c!80597 (or (= lt!324532 (select (arr!19717 a!3186) j!159)) (= (bvadd lt!324532 lt!324532) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!732368 () Bool)

(assert (=> b!732368 (= e!409864 (Intermediate!7273 true index!1321 x!1131))))

(assert (= (and d!99979 c!80598) b!732368))

(assert (= (and d!99979 (not c!80598)) b!732367))

(assert (= (and b!732367 c!80597) b!732364))

(assert (= (and b!732367 (not c!80597)) b!732361))

(assert (= (and d!99979 c!80596) b!732365))

(assert (= (and d!99979 (not c!80596)) b!732363))

(assert (= (and b!732363 res!491926) b!732362))

(assert (= (and b!732362 (not res!491928)) b!732366))

(assert (= (and b!732366 (not res!491927)) b!732360))

(assert (=> b!732361 m!685907))

(assert (=> b!732361 m!685907))

(assert (=> b!732361 m!685757))

(declare-fun m!686059 () Bool)

(assert (=> b!732361 m!686059))

(declare-fun m!686061 () Bool)

(assert (=> b!732366 m!686061))

(assert (=> d!99979 m!685927))

(assert (=> d!99979 m!685777))

(assert (=> b!732362 m!686061))

(assert (=> b!732360 m!686061))

(assert (=> b!731959 d!99979))

(declare-fun d!99981 () Bool)

(assert (=> d!99981 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!64884 d!99981))

(declare-fun d!99993 () Bool)

(assert (=> d!99993 (= (array_inv!15576 a!3186) (bvsge (size!20137 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!64884 d!99993))

(declare-fun b!732403 () Bool)

(declare-fun e!409889 () SeekEntryResult!7273)

(declare-fun lt!324560 () SeekEntryResult!7273)

(assert (=> b!732403 (= e!409889 (Found!7273 (index!31462 lt!324560)))))

(declare-fun d!99995 () Bool)

(declare-fun lt!324558 () SeekEntryResult!7273)

(assert (=> d!99995 (and (or ((_ is Undefined!7273) lt!324558) (not ((_ is Found!7273) lt!324558)) (and (bvsge (index!31461 lt!324558) #b00000000000000000000000000000000) (bvslt (index!31461 lt!324558) (size!20137 a!3186)))) (or ((_ is Undefined!7273) lt!324558) ((_ is Found!7273) lt!324558) (not ((_ is MissingZero!7273) lt!324558)) (and (bvsge (index!31460 lt!324558) #b00000000000000000000000000000000) (bvslt (index!31460 lt!324558) (size!20137 a!3186)))) (or ((_ is Undefined!7273) lt!324558) ((_ is Found!7273) lt!324558) ((_ is MissingZero!7273) lt!324558) (not ((_ is MissingVacant!7273) lt!324558)) (and (bvsge (index!31463 lt!324558) #b00000000000000000000000000000000) (bvslt (index!31463 lt!324558) (size!20137 a!3186)))) (or ((_ is Undefined!7273) lt!324558) (ite ((_ is Found!7273) lt!324558) (= (select (arr!19717 a!3186) (index!31461 lt!324558)) (select (arr!19717 a!3186) j!159)) (ite ((_ is MissingZero!7273) lt!324558) (= (select (arr!19717 a!3186) (index!31460 lt!324558)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7273) lt!324558) (= (select (arr!19717 a!3186) (index!31463 lt!324558)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!409888 () SeekEntryResult!7273)

(assert (=> d!99995 (= lt!324558 e!409888)))

(declare-fun c!80612 () Bool)

(assert (=> d!99995 (= c!80612 (and ((_ is Intermediate!7273) lt!324560) (undefined!8085 lt!324560)))))

(assert (=> d!99995 (= lt!324560 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19717 a!3186) j!159) mask!3328) (select (arr!19717 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!99995 (validMask!0 mask!3328)))

(assert (=> d!99995 (= (seekEntryOrOpen!0 (select (arr!19717 a!3186) j!159) a!3186 mask!3328) lt!324558)))

(declare-fun e!409887 () SeekEntryResult!7273)

(declare-fun b!732404 () Bool)

(assert (=> b!732404 (= e!409887 (seekKeyOrZeroReturnVacant!0 (x!62595 lt!324560) (index!31462 lt!324560) (index!31462 lt!324560) (select (arr!19717 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!732405 () Bool)

(assert (=> b!732405 (= e!409888 Undefined!7273)))

(declare-fun b!732406 () Bool)

(declare-fun c!80614 () Bool)

(declare-fun lt!324559 () (_ BitVec 64))

(assert (=> b!732406 (= c!80614 (= lt!324559 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!732406 (= e!409889 e!409887)))

(declare-fun b!732407 () Bool)

(assert (=> b!732407 (= e!409887 (MissingZero!7273 (index!31462 lt!324560)))))

(declare-fun b!732408 () Bool)

(assert (=> b!732408 (= e!409888 e!409889)))

(assert (=> b!732408 (= lt!324559 (select (arr!19717 a!3186) (index!31462 lt!324560)))))

(declare-fun c!80613 () Bool)

(assert (=> b!732408 (= c!80613 (= lt!324559 (select (arr!19717 a!3186) j!159)))))

(assert (= (and d!99995 c!80612) b!732405))

(assert (= (and d!99995 (not c!80612)) b!732408))

(assert (= (and b!732408 c!80613) b!732403))

(assert (= (and b!732408 (not c!80613)) b!732406))

(assert (= (and b!732406 c!80614) b!732407))

(assert (= (and b!732406 (not c!80614)) b!732404))

(assert (=> d!99995 m!685777))

(declare-fun m!686087 () Bool)

(assert (=> d!99995 m!686087))

(assert (=> d!99995 m!685759))

(assert (=> d!99995 m!685757))

(assert (=> d!99995 m!685761))

(assert (=> d!99995 m!685757))

(assert (=> d!99995 m!685759))

(declare-fun m!686089 () Bool)

(assert (=> d!99995 m!686089))

(declare-fun m!686091 () Bool)

(assert (=> d!99995 m!686091))

(assert (=> b!732404 m!685757))

(declare-fun m!686093 () Bool)

(assert (=> b!732404 m!686093))

(declare-fun m!686095 () Bool)

(assert (=> b!732408 m!686095))

(assert (=> b!731960 d!99995))

(declare-fun d!99997 () Bool)

(declare-fun lt!324566 () (_ BitVec 32))

(assert (=> d!99997 (and (bvsge lt!324566 #b00000000000000000000000000000000) (bvslt lt!324566 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!99997 (= lt!324566 (choose!52 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(assert (=> d!99997 (validMask!0 mask!3328)))

(assert (=> d!99997 (= (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) lt!324566)))

(declare-fun bs!20961 () Bool)

(assert (= bs!20961 d!99997))

(declare-fun m!686101 () Bool)

(assert (=> bs!20961 m!686101))

(assert (=> bs!20961 m!685777))

(assert (=> b!731971 d!99997))

(check-sat (not b!732138) (not b!732107) (not b!732108) (not b!732359) (not b!732330) (not b!732235) (not b!732356) (not b!732109) (not d!99997) (not d!99979) (not d!99965) (not d!99921) (not bm!34863) (not d!99929) (not b!732342) (not d!99947) (not d!99919) (not b!732129) (not b!732348) (not bm!34864) (not d!99971) (not b!732404) (not b!732238) (not b!732361) (not d!99945) (not d!99995) (not b!732214) (not bm!34857) (not b!732191))
(check-sat)
