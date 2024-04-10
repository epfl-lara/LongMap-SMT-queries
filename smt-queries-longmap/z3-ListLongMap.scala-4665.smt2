; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64836 () Bool)

(assert start!64836)

(declare-fun b!731867 () Bool)

(declare-fun res!491765 () Bool)

(declare-fun e!409537 () Bool)

(assert (=> b!731867 (=> (not res!491765) (not e!409537))))

(declare-datatypes ((array!41216 0))(
  ( (array!41217 (arr!19726 (Array (_ BitVec 32) (_ BitVec 64))) (size!20147 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41216)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41216 (_ BitVec 32)) Bool)

(assert (=> b!731867 (= res!491765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7326 0))(
  ( (MissingZero!7326 (index!31672 (_ BitVec 32))) (Found!7326 (index!31673 (_ BitVec 32))) (Intermediate!7326 (undefined!8138 Bool) (index!31674 (_ BitVec 32)) (x!62656 (_ BitVec 32))) (Undefined!7326) (MissingVacant!7326 (index!31675 (_ BitVec 32))) )
))
(declare-fun lt!324330 () SeekEntryResult!7326)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!409531 () Bool)

(declare-fun b!731868 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41216 (_ BitVec 32)) SeekEntryResult!7326)

(assert (=> b!731868 (= e!409531 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19726 a!3186) j!159) a!3186 mask!3328) lt!324330))))

(declare-fun b!731869 () Bool)

(declare-fun res!491769 () Bool)

(declare-fun e!409534 () Bool)

(assert (=> b!731869 (=> res!491769 e!409534)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!731869 (= res!491769 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19726 a!3186) j!159) a!3186 mask!3328) (Found!7326 j!159))))))

(declare-fun b!731870 () Bool)

(declare-fun res!491775 () Bool)

(assert (=> b!731870 (=> (not res!491775) (not e!409537))))

(declare-datatypes ((List!13728 0))(
  ( (Nil!13725) (Cons!13724 (h!14787 (_ BitVec 64)) (t!20043 List!13728)) )
))
(declare-fun arrayNoDuplicates!0 (array!41216 (_ BitVec 32) List!13728) Bool)

(assert (=> b!731870 (= res!491775 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13725))))

(declare-fun b!731871 () Bool)

(declare-fun res!491764 () Bool)

(declare-fun e!409538 () Bool)

(assert (=> b!731871 (=> (not res!491764) (not e!409538))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!731871 (= res!491764 (and (= (size!20147 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20147 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20147 a!3186)) (not (= i!1173 j!159))))))

(declare-fun lt!324333 () (_ BitVec 32))

(declare-fun b!731872 () Bool)

(assert (=> b!731872 (= e!409534 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt lt!324333 #b00000000000000000000000000000000) (bvsge lt!324333 (bvadd #b00000000000000000000000000000001 mask!3328)) (and (bvsle (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000))))))

(declare-fun b!731873 () Bool)

(declare-fun e!409536 () Bool)

(declare-fun e!409529 () Bool)

(assert (=> b!731873 (= e!409536 e!409529)))

(declare-fun res!491767 () Bool)

(assert (=> b!731873 (=> (not res!491767) (not e!409529))))

(declare-fun lt!324329 () SeekEntryResult!7326)

(declare-fun lt!324331 () SeekEntryResult!7326)

(assert (=> b!731873 (= res!491767 (= lt!324329 lt!324331))))

(declare-fun lt!324335 () (_ BitVec 64))

(declare-fun lt!324328 () array!41216)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41216 (_ BitVec 32)) SeekEntryResult!7326)

(assert (=> b!731873 (= lt!324331 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324335 lt!324328 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!731873 (= lt!324329 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324335 mask!3328) lt!324335 lt!324328 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!731873 (= lt!324335 (select (store (arr!19726 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!731873 (= lt!324328 (array!41217 (store (arr!19726 a!3186) i!1173 k0!2102) (size!20147 a!3186)))))

(declare-fun b!731874 () Bool)

(assert (=> b!731874 (= e!409538 e!409537)))

(declare-fun res!491776 () Bool)

(assert (=> b!731874 (=> (not res!491776) (not e!409537))))

(declare-fun lt!324327 () SeekEntryResult!7326)

(assert (=> b!731874 (= res!491776 (or (= lt!324327 (MissingZero!7326 i!1173)) (= lt!324327 (MissingVacant!7326 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41216 (_ BitVec 32)) SeekEntryResult!7326)

(assert (=> b!731874 (= lt!324327 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!731875 () Bool)

(declare-fun e!409533 () Bool)

(assert (=> b!731875 (= e!409533 e!409534)))

(declare-fun res!491777 () Bool)

(assert (=> b!731875 (=> res!491777 e!409534)))

(assert (=> b!731875 (= res!491777 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!731875 (= lt!324333 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!731876 () Bool)

(declare-fun e!409535 () Bool)

(assert (=> b!731876 (= e!409535 e!409531)))

(declare-fun res!491773 () Bool)

(assert (=> b!731876 (=> (not res!491773) (not e!409531))))

(assert (=> b!731876 (= res!491773 (= (seekEntryOrOpen!0 (select (arr!19726 a!3186) j!159) a!3186 mask!3328) lt!324330))))

(assert (=> b!731876 (= lt!324330 (Found!7326 j!159))))

(declare-fun res!491774 () Bool)

(assert (=> start!64836 (=> (not res!491774) (not e!409538))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64836 (= res!491774 (validMask!0 mask!3328))))

(assert (=> start!64836 e!409538))

(assert (=> start!64836 true))

(declare-fun array_inv!15522 (array!41216) Bool)

(assert (=> start!64836 (array_inv!15522 a!3186)))

(declare-fun b!731877 () Bool)

(declare-fun res!491763 () Bool)

(assert (=> b!731877 (=> (not res!491763) (not e!409538))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!731877 (= res!491763 (validKeyInArray!0 k0!2102))))

(declare-fun b!731878 () Bool)

(declare-fun res!491779 () Bool)

(assert (=> b!731878 (=> (not res!491779) (not e!409538))))

(assert (=> b!731878 (= res!491779 (validKeyInArray!0 (select (arr!19726 a!3186) j!159)))))

(declare-fun b!731879 () Bool)

(assert (=> b!731879 (= e!409537 e!409536)))

(declare-fun res!491778 () Bool)

(assert (=> b!731879 (=> (not res!491778) (not e!409536))))

(declare-fun lt!324332 () SeekEntryResult!7326)

(assert (=> b!731879 (= res!491778 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19726 a!3186) j!159) mask!3328) (select (arr!19726 a!3186) j!159) a!3186 mask!3328) lt!324332))))

(assert (=> b!731879 (= lt!324332 (Intermediate!7326 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!731880 () Bool)

(declare-fun res!491772 () Bool)

(assert (=> b!731880 (=> (not res!491772) (not e!409538))))

(declare-fun arrayContainsKey!0 (array!41216 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!731880 (= res!491772 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!731881 () Bool)

(assert (=> b!731881 (= e!409529 (not e!409533))))

(declare-fun res!491766 () Bool)

(assert (=> b!731881 (=> res!491766 e!409533)))

(get-info :version)

(assert (=> b!731881 (= res!491766 (or (not ((_ is Intermediate!7326) lt!324331)) (bvsge x!1131 (x!62656 lt!324331))))))

(assert (=> b!731881 e!409535))

(declare-fun res!491771 () Bool)

(assert (=> b!731881 (=> (not res!491771) (not e!409535))))

(assert (=> b!731881 (= res!491771 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24970 0))(
  ( (Unit!24971) )
))
(declare-fun lt!324334 () Unit!24970)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41216 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24970)

(assert (=> b!731881 (= lt!324334 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun e!409532 () Bool)

(declare-fun b!731882 () Bool)

(assert (=> b!731882 (= e!409532 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19726 a!3186) j!159) a!3186 mask!3328) (Found!7326 j!159)))))

(declare-fun b!731883 () Bool)

(declare-fun res!491768 () Bool)

(assert (=> b!731883 (=> (not res!491768) (not e!409536))))

(assert (=> b!731883 (= res!491768 e!409532)))

(declare-fun c!80428 () Bool)

(assert (=> b!731883 (= c!80428 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!731884 () Bool)

(declare-fun res!491770 () Bool)

(assert (=> b!731884 (=> (not res!491770) (not e!409536))))

(assert (=> b!731884 (= res!491770 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19726 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!731885 () Bool)

(assert (=> b!731885 (= e!409532 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19726 a!3186) j!159) a!3186 mask!3328) lt!324332))))

(declare-fun b!731886 () Bool)

(declare-fun res!491780 () Bool)

(assert (=> b!731886 (=> (not res!491780) (not e!409537))))

(assert (=> b!731886 (= res!491780 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20147 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20147 a!3186))))))

(assert (= (and start!64836 res!491774) b!731871))

(assert (= (and b!731871 res!491764) b!731878))

(assert (= (and b!731878 res!491779) b!731877))

(assert (= (and b!731877 res!491763) b!731880))

(assert (= (and b!731880 res!491772) b!731874))

(assert (= (and b!731874 res!491776) b!731867))

(assert (= (and b!731867 res!491765) b!731870))

(assert (= (and b!731870 res!491775) b!731886))

(assert (= (and b!731886 res!491780) b!731879))

(assert (= (and b!731879 res!491778) b!731884))

(assert (= (and b!731884 res!491770) b!731883))

(assert (= (and b!731883 c!80428) b!731885))

(assert (= (and b!731883 (not c!80428)) b!731882))

(assert (= (and b!731883 res!491768) b!731873))

(assert (= (and b!731873 res!491767) b!731881))

(assert (= (and b!731881 res!491771) b!731876))

(assert (= (and b!731876 res!491773) b!731868))

(assert (= (and b!731881 (not res!491766)) b!731875))

(assert (= (and b!731875 (not res!491777)) b!731869))

(assert (= (and b!731869 (not res!491769)) b!731872))

(declare-fun m!685093 () Bool)

(assert (=> start!64836 m!685093))

(declare-fun m!685095 () Bool)

(assert (=> start!64836 m!685095))

(declare-fun m!685097 () Bool)

(assert (=> b!731881 m!685097))

(declare-fun m!685099 () Bool)

(assert (=> b!731881 m!685099))

(declare-fun m!685101 () Bool)

(assert (=> b!731874 m!685101))

(declare-fun m!685103 () Bool)

(assert (=> b!731878 m!685103))

(assert (=> b!731878 m!685103))

(declare-fun m!685105 () Bool)

(assert (=> b!731878 m!685105))

(assert (=> b!731882 m!685103))

(assert (=> b!731882 m!685103))

(declare-fun m!685107 () Bool)

(assert (=> b!731882 m!685107))

(assert (=> b!731885 m!685103))

(assert (=> b!731885 m!685103))

(declare-fun m!685109 () Bool)

(assert (=> b!731885 m!685109))

(declare-fun m!685111 () Bool)

(assert (=> b!731884 m!685111))

(assert (=> b!731879 m!685103))

(assert (=> b!731879 m!685103))

(declare-fun m!685113 () Bool)

(assert (=> b!731879 m!685113))

(assert (=> b!731879 m!685113))

(assert (=> b!731879 m!685103))

(declare-fun m!685115 () Bool)

(assert (=> b!731879 m!685115))

(assert (=> b!731868 m!685103))

(assert (=> b!731868 m!685103))

(declare-fun m!685117 () Bool)

(assert (=> b!731868 m!685117))

(assert (=> b!731876 m!685103))

(assert (=> b!731876 m!685103))

(declare-fun m!685119 () Bool)

(assert (=> b!731876 m!685119))

(declare-fun m!685121 () Bool)

(assert (=> b!731870 m!685121))

(declare-fun m!685123 () Bool)

(assert (=> b!731880 m!685123))

(assert (=> b!731869 m!685103))

(assert (=> b!731869 m!685103))

(assert (=> b!731869 m!685107))

(declare-fun m!685125 () Bool)

(assert (=> b!731873 m!685125))

(declare-fun m!685127 () Bool)

(assert (=> b!731873 m!685127))

(declare-fun m!685129 () Bool)

(assert (=> b!731873 m!685129))

(declare-fun m!685131 () Bool)

(assert (=> b!731873 m!685131))

(declare-fun m!685133 () Bool)

(assert (=> b!731873 m!685133))

(assert (=> b!731873 m!685125))

(declare-fun m!685135 () Bool)

(assert (=> b!731877 m!685135))

(declare-fun m!685137 () Bool)

(assert (=> b!731875 m!685137))

(declare-fun m!685139 () Bool)

(assert (=> b!731867 m!685139))

(check-sat (not b!731880) (not b!731869) (not b!731876) (not start!64836) (not b!731873) (not b!731874) (not b!731867) (not b!731881) (not b!731885) (not b!731879) (not b!731882) (not b!731877) (not b!731878) (not b!731875) (not b!731868) (not b!731870))
(check-sat)
(get-model)

(declare-fun d!99733 () Bool)

(declare-fun lt!324365 () (_ BitVec 32))

(assert (=> d!99733 (and (bvsge lt!324365 #b00000000000000000000000000000000) (bvslt lt!324365 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!99733 (= lt!324365 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!99733 (validMask!0 mask!3328)))

(assert (=> d!99733 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!324365)))

(declare-fun bs!20944 () Bool)

(assert (= bs!20944 d!99733))

(declare-fun m!685189 () Bool)

(assert (=> bs!20944 m!685189))

(assert (=> bs!20944 m!685093))

(assert (=> b!731875 d!99733))

(declare-fun b!731965 () Bool)

(declare-fun lt!324371 () SeekEntryResult!7326)

(assert (=> b!731965 (and (bvsge (index!31674 lt!324371) #b00000000000000000000000000000000) (bvslt (index!31674 lt!324371) (size!20147 a!3186)))))

(declare-fun res!491841 () Bool)

(assert (=> b!731965 (= res!491841 (= (select (arr!19726 a!3186) (index!31674 lt!324371)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!409579 () Bool)

(assert (=> b!731965 (=> res!491841 e!409579)))

(declare-fun b!731966 () Bool)

(declare-fun e!409581 () Bool)

(assert (=> b!731966 (= e!409581 (bvsge (x!62656 lt!324371) #b01111111111111111111111111111110))))

(declare-fun e!409580 () SeekEntryResult!7326)

(declare-fun b!731967 () Bool)

(assert (=> b!731967 (= e!409580 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!19726 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!99735 () Bool)

(assert (=> d!99735 e!409581))

(declare-fun c!80440 () Bool)

(assert (=> d!99735 (= c!80440 (and ((_ is Intermediate!7326) lt!324371) (undefined!8138 lt!324371)))))

(declare-fun e!409583 () SeekEntryResult!7326)

(assert (=> d!99735 (= lt!324371 e!409583)))

(declare-fun c!80438 () Bool)

(assert (=> d!99735 (= c!80438 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!324370 () (_ BitVec 64))

(assert (=> d!99735 (= lt!324370 (select (arr!19726 a!3186) index!1321))))

(assert (=> d!99735 (validMask!0 mask!3328)))

(assert (=> d!99735 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19726 a!3186) j!159) a!3186 mask!3328) lt!324371)))

(declare-fun b!731968 () Bool)

(assert (=> b!731968 (= e!409583 (Intermediate!7326 true index!1321 x!1131))))

(declare-fun b!731969 () Bool)

(assert (=> b!731969 (= e!409580 (Intermediate!7326 false index!1321 x!1131))))

(declare-fun b!731970 () Bool)

(declare-fun e!409582 () Bool)

(assert (=> b!731970 (= e!409581 e!409582)))

(declare-fun res!491842 () Bool)

(assert (=> b!731970 (= res!491842 (and ((_ is Intermediate!7326) lt!324371) (not (undefined!8138 lt!324371)) (bvslt (x!62656 lt!324371) #b01111111111111111111111111111110) (bvsge (x!62656 lt!324371) #b00000000000000000000000000000000) (bvsge (x!62656 lt!324371) x!1131)))))

(assert (=> b!731970 (=> (not res!491842) (not e!409582))))

(declare-fun b!731971 () Bool)

(assert (=> b!731971 (and (bvsge (index!31674 lt!324371) #b00000000000000000000000000000000) (bvslt (index!31674 lt!324371) (size!20147 a!3186)))))

(assert (=> b!731971 (= e!409579 (= (select (arr!19726 a!3186) (index!31674 lt!324371)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!731972 () Bool)

(assert (=> b!731972 (= e!409583 e!409580)))

(declare-fun c!80439 () Bool)

(assert (=> b!731972 (= c!80439 (or (= lt!324370 (select (arr!19726 a!3186) j!159)) (= (bvadd lt!324370 lt!324370) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!731973 () Bool)

(assert (=> b!731973 (and (bvsge (index!31674 lt!324371) #b00000000000000000000000000000000) (bvslt (index!31674 lt!324371) (size!20147 a!3186)))))

(declare-fun res!491843 () Bool)

(assert (=> b!731973 (= res!491843 (= (select (arr!19726 a!3186) (index!31674 lt!324371)) (select (arr!19726 a!3186) j!159)))))

(assert (=> b!731973 (=> res!491843 e!409579)))

(assert (=> b!731973 (= e!409582 e!409579)))

(assert (= (and d!99735 c!80438) b!731968))

(assert (= (and d!99735 (not c!80438)) b!731972))

(assert (= (and b!731972 c!80439) b!731969))

(assert (= (and b!731972 (not c!80439)) b!731967))

(assert (= (and d!99735 c!80440) b!731966))

(assert (= (and d!99735 (not c!80440)) b!731970))

(assert (= (and b!731970 res!491842) b!731973))

(assert (= (and b!731973 (not res!491843)) b!731965))

(assert (= (and b!731965 (not res!491841)) b!731971))

(assert (=> b!731967 m!685137))

(assert (=> b!731967 m!685137))

(assert (=> b!731967 m!685103))

(declare-fun m!685191 () Bool)

(assert (=> b!731967 m!685191))

(declare-fun m!685193 () Bool)

(assert (=> b!731973 m!685193))

(assert (=> b!731971 m!685193))

(assert (=> b!731965 m!685193))

(declare-fun m!685195 () Bool)

(assert (=> d!99735 m!685195))

(assert (=> d!99735 m!685093))

(assert (=> b!731885 d!99735))

(declare-fun e!409592 () SeekEntryResult!7326)

(declare-fun lt!324381 () SeekEntryResult!7326)

(declare-fun b!731986 () Bool)

(assert (=> b!731986 (= e!409592 (seekKeyOrZeroReturnVacant!0 (x!62656 lt!324381) (index!31674 lt!324381) (index!31674 lt!324381) k0!2102 a!3186 mask!3328))))

(declare-fun d!99737 () Bool)

(declare-fun lt!324383 () SeekEntryResult!7326)

(assert (=> d!99737 (and (or ((_ is Undefined!7326) lt!324383) (not ((_ is Found!7326) lt!324383)) (and (bvsge (index!31673 lt!324383) #b00000000000000000000000000000000) (bvslt (index!31673 lt!324383) (size!20147 a!3186)))) (or ((_ is Undefined!7326) lt!324383) ((_ is Found!7326) lt!324383) (not ((_ is MissingZero!7326) lt!324383)) (and (bvsge (index!31672 lt!324383) #b00000000000000000000000000000000) (bvslt (index!31672 lt!324383) (size!20147 a!3186)))) (or ((_ is Undefined!7326) lt!324383) ((_ is Found!7326) lt!324383) ((_ is MissingZero!7326) lt!324383) (not ((_ is MissingVacant!7326) lt!324383)) (and (bvsge (index!31675 lt!324383) #b00000000000000000000000000000000) (bvslt (index!31675 lt!324383) (size!20147 a!3186)))) (or ((_ is Undefined!7326) lt!324383) (ite ((_ is Found!7326) lt!324383) (= (select (arr!19726 a!3186) (index!31673 lt!324383)) k0!2102) (ite ((_ is MissingZero!7326) lt!324383) (= (select (arr!19726 a!3186) (index!31672 lt!324383)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7326) lt!324383) (= (select (arr!19726 a!3186) (index!31675 lt!324383)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!409590 () SeekEntryResult!7326)

(assert (=> d!99737 (= lt!324383 e!409590)))

(declare-fun c!80447 () Bool)

(assert (=> d!99737 (= c!80447 (and ((_ is Intermediate!7326) lt!324381) (undefined!8138 lt!324381)))))

(assert (=> d!99737 (= lt!324381 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!99737 (validMask!0 mask!3328)))

(assert (=> d!99737 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!324383)))

(declare-fun b!731987 () Bool)

(assert (=> b!731987 (= e!409590 Undefined!7326)))

(declare-fun b!731988 () Bool)

(declare-fun c!80448 () Bool)

(declare-fun lt!324382 () (_ BitVec 64))

(assert (=> b!731988 (= c!80448 (= lt!324382 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!409591 () SeekEntryResult!7326)

(assert (=> b!731988 (= e!409591 e!409592)))

(declare-fun b!731989 () Bool)

(assert (=> b!731989 (= e!409591 (Found!7326 (index!31674 lt!324381)))))

(declare-fun b!731990 () Bool)

(assert (=> b!731990 (= e!409590 e!409591)))

(assert (=> b!731990 (= lt!324382 (select (arr!19726 a!3186) (index!31674 lt!324381)))))

(declare-fun c!80449 () Bool)

(assert (=> b!731990 (= c!80449 (= lt!324382 k0!2102))))

(declare-fun b!731991 () Bool)

(assert (=> b!731991 (= e!409592 (MissingZero!7326 (index!31674 lt!324381)))))

(assert (= (and d!99737 c!80447) b!731987))

(assert (= (and d!99737 (not c!80447)) b!731990))

(assert (= (and b!731990 c!80449) b!731989))

(assert (= (and b!731990 (not c!80449)) b!731988))

(assert (= (and b!731988 c!80448) b!731991))

(assert (= (and b!731988 (not c!80448)) b!731986))

(declare-fun m!685199 () Bool)

(assert (=> b!731986 m!685199))

(declare-fun m!685201 () Bool)

(assert (=> d!99737 m!685201))

(declare-fun m!685203 () Bool)

(assert (=> d!99737 m!685203))

(assert (=> d!99737 m!685093))

(assert (=> d!99737 m!685203))

(declare-fun m!685205 () Bool)

(assert (=> d!99737 m!685205))

(declare-fun m!685207 () Bool)

(assert (=> d!99737 m!685207))

(declare-fun m!685209 () Bool)

(assert (=> d!99737 m!685209))

(declare-fun m!685211 () Bool)

(assert (=> b!731990 m!685211))

(assert (=> b!731874 d!99737))

(declare-fun b!731992 () Bool)

(declare-fun lt!324385 () SeekEntryResult!7326)

(assert (=> b!731992 (and (bvsge (index!31674 lt!324385) #b00000000000000000000000000000000) (bvslt (index!31674 lt!324385) (size!20147 lt!324328)))))

(declare-fun res!491844 () Bool)

(assert (=> b!731992 (= res!491844 (= (select (arr!19726 lt!324328) (index!31674 lt!324385)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!409593 () Bool)

(assert (=> b!731992 (=> res!491844 e!409593)))

(declare-fun b!731993 () Bool)

(declare-fun e!409595 () Bool)

(assert (=> b!731993 (= e!409595 (bvsge (x!62656 lt!324385) #b01111111111111111111111111111110))))

(declare-fun b!731994 () Bool)

(declare-fun e!409594 () SeekEntryResult!7326)

(assert (=> b!731994 (= e!409594 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!324335 lt!324328 mask!3328))))

(declare-fun d!99747 () Bool)

(assert (=> d!99747 e!409595))

(declare-fun c!80452 () Bool)

(assert (=> d!99747 (= c!80452 (and ((_ is Intermediate!7326) lt!324385) (undefined!8138 lt!324385)))))

(declare-fun e!409597 () SeekEntryResult!7326)

(assert (=> d!99747 (= lt!324385 e!409597)))

(declare-fun c!80450 () Bool)

(assert (=> d!99747 (= c!80450 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!324384 () (_ BitVec 64))

(assert (=> d!99747 (= lt!324384 (select (arr!19726 lt!324328) index!1321))))

(assert (=> d!99747 (validMask!0 mask!3328)))

(assert (=> d!99747 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324335 lt!324328 mask!3328) lt!324385)))

(declare-fun b!731995 () Bool)

(assert (=> b!731995 (= e!409597 (Intermediate!7326 true index!1321 x!1131))))

(declare-fun b!731996 () Bool)

(assert (=> b!731996 (= e!409594 (Intermediate!7326 false index!1321 x!1131))))

(declare-fun b!731997 () Bool)

(declare-fun e!409596 () Bool)

(assert (=> b!731997 (= e!409595 e!409596)))

(declare-fun res!491845 () Bool)

(assert (=> b!731997 (= res!491845 (and ((_ is Intermediate!7326) lt!324385) (not (undefined!8138 lt!324385)) (bvslt (x!62656 lt!324385) #b01111111111111111111111111111110) (bvsge (x!62656 lt!324385) #b00000000000000000000000000000000) (bvsge (x!62656 lt!324385) x!1131)))))

(assert (=> b!731997 (=> (not res!491845) (not e!409596))))

(declare-fun b!731998 () Bool)

(assert (=> b!731998 (and (bvsge (index!31674 lt!324385) #b00000000000000000000000000000000) (bvslt (index!31674 lt!324385) (size!20147 lt!324328)))))

(assert (=> b!731998 (= e!409593 (= (select (arr!19726 lt!324328) (index!31674 lt!324385)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!731999 () Bool)

(assert (=> b!731999 (= e!409597 e!409594)))

(declare-fun c!80451 () Bool)

(assert (=> b!731999 (= c!80451 (or (= lt!324384 lt!324335) (= (bvadd lt!324384 lt!324384) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!732000 () Bool)

(assert (=> b!732000 (and (bvsge (index!31674 lt!324385) #b00000000000000000000000000000000) (bvslt (index!31674 lt!324385) (size!20147 lt!324328)))))

(declare-fun res!491846 () Bool)

(assert (=> b!732000 (= res!491846 (= (select (arr!19726 lt!324328) (index!31674 lt!324385)) lt!324335))))

(assert (=> b!732000 (=> res!491846 e!409593)))

(assert (=> b!732000 (= e!409596 e!409593)))

(assert (= (and d!99747 c!80450) b!731995))

(assert (= (and d!99747 (not c!80450)) b!731999))

(assert (= (and b!731999 c!80451) b!731996))

(assert (= (and b!731999 (not c!80451)) b!731994))

(assert (= (and d!99747 c!80452) b!731993))

(assert (= (and d!99747 (not c!80452)) b!731997))

(assert (= (and b!731997 res!491845) b!732000))

(assert (= (and b!732000 (not res!491846)) b!731992))

(assert (= (and b!731992 (not res!491844)) b!731998))

(assert (=> b!731994 m!685137))

(assert (=> b!731994 m!685137))

(declare-fun m!685213 () Bool)

(assert (=> b!731994 m!685213))

(declare-fun m!685215 () Bool)

(assert (=> b!732000 m!685215))

(assert (=> b!731998 m!685215))

(assert (=> b!731992 m!685215))

(declare-fun m!685217 () Bool)

(assert (=> d!99747 m!685217))

(assert (=> d!99747 m!685093))

(assert (=> b!731873 d!99747))

(declare-fun b!732001 () Bool)

(declare-fun lt!324387 () SeekEntryResult!7326)

(assert (=> b!732001 (and (bvsge (index!31674 lt!324387) #b00000000000000000000000000000000) (bvslt (index!31674 lt!324387) (size!20147 lt!324328)))))

(declare-fun res!491847 () Bool)

(assert (=> b!732001 (= res!491847 (= (select (arr!19726 lt!324328) (index!31674 lt!324387)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!409598 () Bool)

(assert (=> b!732001 (=> res!491847 e!409598)))

(declare-fun b!732002 () Bool)

(declare-fun e!409600 () Bool)

(assert (=> b!732002 (= e!409600 (bvsge (x!62656 lt!324387) #b01111111111111111111111111111110))))

(declare-fun e!409599 () SeekEntryResult!7326)

(declare-fun b!732003 () Bool)

(assert (=> b!732003 (= e!409599 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!324335 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!324335 lt!324328 mask!3328))))

(declare-fun d!99749 () Bool)

(assert (=> d!99749 e!409600))

(declare-fun c!80455 () Bool)

(assert (=> d!99749 (= c!80455 (and ((_ is Intermediate!7326) lt!324387) (undefined!8138 lt!324387)))))

(declare-fun e!409602 () SeekEntryResult!7326)

(assert (=> d!99749 (= lt!324387 e!409602)))

(declare-fun c!80453 () Bool)

(assert (=> d!99749 (= c!80453 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!324386 () (_ BitVec 64))

(assert (=> d!99749 (= lt!324386 (select (arr!19726 lt!324328) (toIndex!0 lt!324335 mask!3328)))))

(assert (=> d!99749 (validMask!0 mask!3328)))

(assert (=> d!99749 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324335 mask!3328) lt!324335 lt!324328 mask!3328) lt!324387)))

(declare-fun b!732004 () Bool)

(assert (=> b!732004 (= e!409602 (Intermediate!7326 true (toIndex!0 lt!324335 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!732005 () Bool)

(assert (=> b!732005 (= e!409599 (Intermediate!7326 false (toIndex!0 lt!324335 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!732006 () Bool)

(declare-fun e!409601 () Bool)

(assert (=> b!732006 (= e!409600 e!409601)))

(declare-fun res!491848 () Bool)

(assert (=> b!732006 (= res!491848 (and ((_ is Intermediate!7326) lt!324387) (not (undefined!8138 lt!324387)) (bvslt (x!62656 lt!324387) #b01111111111111111111111111111110) (bvsge (x!62656 lt!324387) #b00000000000000000000000000000000) (bvsge (x!62656 lt!324387) #b00000000000000000000000000000000)))))

(assert (=> b!732006 (=> (not res!491848) (not e!409601))))

(declare-fun b!732007 () Bool)

(assert (=> b!732007 (and (bvsge (index!31674 lt!324387) #b00000000000000000000000000000000) (bvslt (index!31674 lt!324387) (size!20147 lt!324328)))))

(assert (=> b!732007 (= e!409598 (= (select (arr!19726 lt!324328) (index!31674 lt!324387)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!732008 () Bool)

(assert (=> b!732008 (= e!409602 e!409599)))

(declare-fun c!80454 () Bool)

(assert (=> b!732008 (= c!80454 (or (= lt!324386 lt!324335) (= (bvadd lt!324386 lt!324386) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!732009 () Bool)

(assert (=> b!732009 (and (bvsge (index!31674 lt!324387) #b00000000000000000000000000000000) (bvslt (index!31674 lt!324387) (size!20147 lt!324328)))))

(declare-fun res!491849 () Bool)

(assert (=> b!732009 (= res!491849 (= (select (arr!19726 lt!324328) (index!31674 lt!324387)) lt!324335))))

(assert (=> b!732009 (=> res!491849 e!409598)))

(assert (=> b!732009 (= e!409601 e!409598)))

(assert (= (and d!99749 c!80453) b!732004))

(assert (= (and d!99749 (not c!80453)) b!732008))

(assert (= (and b!732008 c!80454) b!732005))

(assert (= (and b!732008 (not c!80454)) b!732003))

(assert (= (and d!99749 c!80455) b!732002))

(assert (= (and d!99749 (not c!80455)) b!732006))

(assert (= (and b!732006 res!491848) b!732009))

(assert (= (and b!732009 (not res!491849)) b!732001))

(assert (= (and b!732001 (not res!491847)) b!732007))

(assert (=> b!732003 m!685125))

(declare-fun m!685219 () Bool)

(assert (=> b!732003 m!685219))

(assert (=> b!732003 m!685219))

(declare-fun m!685221 () Bool)

(assert (=> b!732003 m!685221))

(declare-fun m!685223 () Bool)

(assert (=> b!732009 m!685223))

(assert (=> b!732007 m!685223))

(assert (=> b!732001 m!685223))

(assert (=> d!99749 m!685125))

(declare-fun m!685225 () Bool)

(assert (=> d!99749 m!685225))

(assert (=> d!99749 m!685093))

(assert (=> b!731873 d!99749))

(declare-fun d!99751 () Bool)

(declare-fun lt!324403 () (_ BitVec 32))

(declare-fun lt!324402 () (_ BitVec 32))

(assert (=> d!99751 (= lt!324403 (bvmul (bvxor lt!324402 (bvlshr lt!324402 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99751 (= lt!324402 ((_ extract 31 0) (bvand (bvxor lt!324335 (bvlshr lt!324335 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99751 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!491850 (let ((h!14789 ((_ extract 31 0) (bvand (bvxor lt!324335 (bvlshr lt!324335 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62661 (bvmul (bvxor h!14789 (bvlshr h!14789 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62661 (bvlshr x!62661 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!491850 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!491850 #b00000000000000000000000000000000))))))

(assert (=> d!99751 (= (toIndex!0 lt!324335 mask!3328) (bvand (bvxor lt!324403 (bvlshr lt!324403 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!731873 d!99751))

(declare-fun b!732054 () Bool)

(declare-fun e!409627 () Bool)

(declare-fun call!34851 () Bool)

(assert (=> b!732054 (= e!409627 call!34851)))

(declare-fun b!732055 () Bool)

(declare-fun e!409628 () Bool)

(assert (=> b!732055 (= e!409627 e!409628)))

(declare-fun lt!324416 () (_ BitVec 64))

(assert (=> b!732055 (= lt!324416 (select (arr!19726 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!324415 () Unit!24970)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!41216 (_ BitVec 64) (_ BitVec 32)) Unit!24970)

(assert (=> b!732055 (= lt!324415 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!324416 #b00000000000000000000000000000000))))

(assert (=> b!732055 (arrayContainsKey!0 a!3186 lt!324416 #b00000000000000000000000000000000)))

(declare-fun lt!324417 () Unit!24970)

(assert (=> b!732055 (= lt!324417 lt!324415)))

(declare-fun res!491855 () Bool)

(assert (=> b!732055 (= res!491855 (= (seekEntryOrOpen!0 (select (arr!19726 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7326 #b00000000000000000000000000000000)))))

(assert (=> b!732055 (=> (not res!491855) (not e!409628))))

(declare-fun bm!34848 () Bool)

(assert (=> bm!34848 (= call!34851 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!732056 () Bool)

(assert (=> b!732056 (= e!409628 call!34851)))

(declare-fun d!99753 () Bool)

(declare-fun res!491856 () Bool)

(declare-fun e!409629 () Bool)

(assert (=> d!99753 (=> res!491856 e!409629)))

(assert (=> d!99753 (= res!491856 (bvsge #b00000000000000000000000000000000 (size!20147 a!3186)))))

(assert (=> d!99753 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!409629)))

(declare-fun b!732057 () Bool)

(assert (=> b!732057 (= e!409629 e!409627)))

(declare-fun c!80476 () Bool)

(assert (=> b!732057 (= c!80476 (validKeyInArray!0 (select (arr!19726 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!99753 (not res!491856)) b!732057))

(assert (= (and b!732057 c!80476) b!732055))

(assert (= (and b!732057 (not c!80476)) b!732054))

(assert (= (and b!732055 res!491855) b!732056))

(assert (= (or b!732056 b!732054) bm!34848))

(declare-fun m!685249 () Bool)

(assert (=> b!732055 m!685249))

(declare-fun m!685251 () Bool)

(assert (=> b!732055 m!685251))

(declare-fun m!685253 () Bool)

(assert (=> b!732055 m!685253))

(assert (=> b!732055 m!685249))

(declare-fun m!685255 () Bool)

(assert (=> b!732055 m!685255))

(declare-fun m!685257 () Bool)

(assert (=> bm!34848 m!685257))

(assert (=> b!732057 m!685249))

(assert (=> b!732057 m!685249))

(declare-fun m!685259 () Bool)

(assert (=> b!732057 m!685259))

(assert (=> b!731867 d!99753))

(declare-fun d!99759 () Bool)

(assert (=> d!99759 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!731877 d!99759))

(declare-fun e!409642 () SeekEntryResult!7326)

(declare-fun b!732076 () Bool)

(declare-fun lt!324428 () SeekEntryResult!7326)

(assert (=> b!732076 (= e!409642 (seekKeyOrZeroReturnVacant!0 (x!62656 lt!324428) (index!31674 lt!324428) (index!31674 lt!324428) (select (arr!19726 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!99761 () Bool)

(declare-fun lt!324430 () SeekEntryResult!7326)

(assert (=> d!99761 (and (or ((_ is Undefined!7326) lt!324430) (not ((_ is Found!7326) lt!324430)) (and (bvsge (index!31673 lt!324430) #b00000000000000000000000000000000) (bvslt (index!31673 lt!324430) (size!20147 a!3186)))) (or ((_ is Undefined!7326) lt!324430) ((_ is Found!7326) lt!324430) (not ((_ is MissingZero!7326) lt!324430)) (and (bvsge (index!31672 lt!324430) #b00000000000000000000000000000000) (bvslt (index!31672 lt!324430) (size!20147 a!3186)))) (or ((_ is Undefined!7326) lt!324430) ((_ is Found!7326) lt!324430) ((_ is MissingZero!7326) lt!324430) (not ((_ is MissingVacant!7326) lt!324430)) (and (bvsge (index!31675 lt!324430) #b00000000000000000000000000000000) (bvslt (index!31675 lt!324430) (size!20147 a!3186)))) (or ((_ is Undefined!7326) lt!324430) (ite ((_ is Found!7326) lt!324430) (= (select (arr!19726 a!3186) (index!31673 lt!324430)) (select (arr!19726 a!3186) j!159)) (ite ((_ is MissingZero!7326) lt!324430) (= (select (arr!19726 a!3186) (index!31672 lt!324430)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7326) lt!324430) (= (select (arr!19726 a!3186) (index!31675 lt!324430)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!409640 () SeekEntryResult!7326)

(assert (=> d!99761 (= lt!324430 e!409640)))

(declare-fun c!80483 () Bool)

(assert (=> d!99761 (= c!80483 (and ((_ is Intermediate!7326) lt!324428) (undefined!8138 lt!324428)))))

(assert (=> d!99761 (= lt!324428 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19726 a!3186) j!159) mask!3328) (select (arr!19726 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!99761 (validMask!0 mask!3328)))

(assert (=> d!99761 (= (seekEntryOrOpen!0 (select (arr!19726 a!3186) j!159) a!3186 mask!3328) lt!324430)))

(declare-fun b!732077 () Bool)

(assert (=> b!732077 (= e!409640 Undefined!7326)))

(declare-fun b!732078 () Bool)

(declare-fun c!80484 () Bool)

(declare-fun lt!324429 () (_ BitVec 64))

(assert (=> b!732078 (= c!80484 (= lt!324429 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!409641 () SeekEntryResult!7326)

(assert (=> b!732078 (= e!409641 e!409642)))

(declare-fun b!732079 () Bool)

(assert (=> b!732079 (= e!409641 (Found!7326 (index!31674 lt!324428)))))

(declare-fun b!732080 () Bool)

(assert (=> b!732080 (= e!409640 e!409641)))

(assert (=> b!732080 (= lt!324429 (select (arr!19726 a!3186) (index!31674 lt!324428)))))

(declare-fun c!80485 () Bool)

(assert (=> b!732080 (= c!80485 (= lt!324429 (select (arr!19726 a!3186) j!159)))))

(declare-fun b!732081 () Bool)

(assert (=> b!732081 (= e!409642 (MissingZero!7326 (index!31674 lt!324428)))))

(assert (= (and d!99761 c!80483) b!732077))

(assert (= (and d!99761 (not c!80483)) b!732080))

(assert (= (and b!732080 c!80485) b!732079))

(assert (= (and b!732080 (not c!80485)) b!732078))

(assert (= (and b!732078 c!80484) b!732081))

(assert (= (and b!732078 (not c!80484)) b!732076))

(assert (=> b!732076 m!685103))

(declare-fun m!685261 () Bool)

(assert (=> b!732076 m!685261))

(declare-fun m!685263 () Bool)

(assert (=> d!99761 m!685263))

(assert (=> d!99761 m!685103))

(assert (=> d!99761 m!685113))

(assert (=> d!99761 m!685093))

(assert (=> d!99761 m!685113))

(assert (=> d!99761 m!685103))

(assert (=> d!99761 m!685115))

(declare-fun m!685265 () Bool)

(assert (=> d!99761 m!685265))

(declare-fun m!685267 () Bool)

(assert (=> d!99761 m!685267))

(declare-fun m!685269 () Bool)

(assert (=> b!732080 m!685269))

(assert (=> b!731876 d!99761))

(declare-fun d!99763 () Bool)

(declare-fun res!491876 () Bool)

(declare-fun e!409661 () Bool)

(assert (=> d!99763 (=> res!491876 e!409661)))

(assert (=> d!99763 (= res!491876 (= (select (arr!19726 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!99763 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!409661)))

(declare-fun b!732107 () Bool)

(declare-fun e!409662 () Bool)

(assert (=> b!732107 (= e!409661 e!409662)))

(declare-fun res!491877 () Bool)

(assert (=> b!732107 (=> (not res!491877) (not e!409662))))

(assert (=> b!732107 (= res!491877 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20147 a!3186)))))

(declare-fun b!732108 () Bool)

(assert (=> b!732108 (= e!409662 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!99763 (not res!491876)) b!732107))

(assert (= (and b!732107 res!491877) b!732108))

(assert (=> d!99763 m!685249))

(declare-fun m!685283 () Bool)

(assert (=> b!732108 m!685283))

(assert (=> b!731880 d!99763))

(declare-fun e!409680 () SeekEntryResult!7326)

(declare-fun b!732139 () Bool)

(assert (=> b!732139 (= e!409680 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!19726 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!732140 () Bool)

(declare-fun c!80508 () Bool)

(declare-fun lt!324449 () (_ BitVec 64))

(assert (=> b!732140 (= c!80508 (= lt!324449 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!409679 () SeekEntryResult!7326)

(assert (=> b!732140 (= e!409679 e!409680)))

(declare-fun b!732141 () Bool)

(assert (=> b!732141 (= e!409680 (MissingVacant!7326 resIntermediateIndex!5))))

(declare-fun b!732142 () Bool)

(declare-fun e!409678 () SeekEntryResult!7326)

(assert (=> b!732142 (= e!409678 Undefined!7326)))

(declare-fun b!732144 () Bool)

(assert (=> b!732144 (= e!409679 (Found!7326 index!1321))))

(declare-fun b!732143 () Bool)

(assert (=> b!732143 (= e!409678 e!409679)))

(declare-fun c!80509 () Bool)

(assert (=> b!732143 (= c!80509 (= lt!324449 (select (arr!19726 a!3186) j!159)))))

(declare-fun d!99769 () Bool)

(declare-fun lt!324450 () SeekEntryResult!7326)

(assert (=> d!99769 (and (or ((_ is Undefined!7326) lt!324450) (not ((_ is Found!7326) lt!324450)) (and (bvsge (index!31673 lt!324450) #b00000000000000000000000000000000) (bvslt (index!31673 lt!324450) (size!20147 a!3186)))) (or ((_ is Undefined!7326) lt!324450) ((_ is Found!7326) lt!324450) (not ((_ is MissingVacant!7326) lt!324450)) (not (= (index!31675 lt!324450) resIntermediateIndex!5)) (and (bvsge (index!31675 lt!324450) #b00000000000000000000000000000000) (bvslt (index!31675 lt!324450) (size!20147 a!3186)))) (or ((_ is Undefined!7326) lt!324450) (ite ((_ is Found!7326) lt!324450) (= (select (arr!19726 a!3186) (index!31673 lt!324450)) (select (arr!19726 a!3186) j!159)) (and ((_ is MissingVacant!7326) lt!324450) (= (index!31675 lt!324450) resIntermediateIndex!5) (= (select (arr!19726 a!3186) (index!31675 lt!324450)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!99769 (= lt!324450 e!409678)))

(declare-fun c!80507 () Bool)

(assert (=> d!99769 (= c!80507 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!99769 (= lt!324449 (select (arr!19726 a!3186) index!1321))))

(assert (=> d!99769 (validMask!0 mask!3328)))

(assert (=> d!99769 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19726 a!3186) j!159) a!3186 mask!3328) lt!324450)))

(assert (= (and d!99769 c!80507) b!732142))

(assert (= (and d!99769 (not c!80507)) b!732143))

(assert (= (and b!732143 c!80509) b!732144))

(assert (= (and b!732143 (not c!80509)) b!732140))

(assert (= (and b!732140 c!80508) b!732141))

(assert (= (and b!732140 (not c!80508)) b!732139))

(assert (=> b!732139 m!685137))

(assert (=> b!732139 m!685137))

(assert (=> b!732139 m!685103))

(declare-fun m!685295 () Bool)

(assert (=> b!732139 m!685295))

(declare-fun m!685297 () Bool)

(assert (=> d!99769 m!685297))

(declare-fun m!685299 () Bool)

(assert (=> d!99769 m!685299))

(assert (=> d!99769 m!685195))

(assert (=> d!99769 m!685093))

(assert (=> b!731869 d!99769))

(declare-fun b!732151 () Bool)

(declare-fun lt!324454 () SeekEntryResult!7326)

(assert (=> b!732151 (and (bvsge (index!31674 lt!324454) #b00000000000000000000000000000000) (bvslt (index!31674 lt!324454) (size!20147 a!3186)))))

(declare-fun res!491878 () Bool)

(assert (=> b!732151 (= res!491878 (= (select (arr!19726 a!3186) (index!31674 lt!324454)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!409684 () Bool)

(assert (=> b!732151 (=> res!491878 e!409684)))

(declare-fun b!732152 () Bool)

(declare-fun e!409686 () Bool)

(assert (=> b!732152 (= e!409686 (bvsge (x!62656 lt!324454) #b01111111111111111111111111111110))))

(declare-fun e!409685 () SeekEntryResult!7326)

(declare-fun b!732153 () Bool)

(assert (=> b!732153 (= e!409685 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!19726 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!19726 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!99779 () Bool)

(assert (=> d!99779 e!409686))

(declare-fun c!80515 () Bool)

(assert (=> d!99779 (= c!80515 (and ((_ is Intermediate!7326) lt!324454) (undefined!8138 lt!324454)))))

(declare-fun e!409688 () SeekEntryResult!7326)

(assert (=> d!99779 (= lt!324454 e!409688)))

(declare-fun c!80513 () Bool)

(assert (=> d!99779 (= c!80513 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!324453 () (_ BitVec 64))

(assert (=> d!99779 (= lt!324453 (select (arr!19726 a!3186) (toIndex!0 (select (arr!19726 a!3186) j!159) mask!3328)))))

(assert (=> d!99779 (validMask!0 mask!3328)))

(assert (=> d!99779 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19726 a!3186) j!159) mask!3328) (select (arr!19726 a!3186) j!159) a!3186 mask!3328) lt!324454)))

(declare-fun b!732154 () Bool)

(assert (=> b!732154 (= e!409688 (Intermediate!7326 true (toIndex!0 (select (arr!19726 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!732155 () Bool)

(assert (=> b!732155 (= e!409685 (Intermediate!7326 false (toIndex!0 (select (arr!19726 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!732156 () Bool)

(declare-fun e!409687 () Bool)

(assert (=> b!732156 (= e!409686 e!409687)))

(declare-fun res!491879 () Bool)

(assert (=> b!732156 (= res!491879 (and ((_ is Intermediate!7326) lt!324454) (not (undefined!8138 lt!324454)) (bvslt (x!62656 lt!324454) #b01111111111111111111111111111110) (bvsge (x!62656 lt!324454) #b00000000000000000000000000000000) (bvsge (x!62656 lt!324454) #b00000000000000000000000000000000)))))

(assert (=> b!732156 (=> (not res!491879) (not e!409687))))

(declare-fun b!732157 () Bool)

(assert (=> b!732157 (and (bvsge (index!31674 lt!324454) #b00000000000000000000000000000000) (bvslt (index!31674 lt!324454) (size!20147 a!3186)))))

(assert (=> b!732157 (= e!409684 (= (select (arr!19726 a!3186) (index!31674 lt!324454)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!732158 () Bool)

(assert (=> b!732158 (= e!409688 e!409685)))

(declare-fun c!80514 () Bool)

(assert (=> b!732158 (= c!80514 (or (= lt!324453 (select (arr!19726 a!3186) j!159)) (= (bvadd lt!324453 lt!324453) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!732159 () Bool)

(assert (=> b!732159 (and (bvsge (index!31674 lt!324454) #b00000000000000000000000000000000) (bvslt (index!31674 lt!324454) (size!20147 a!3186)))))

(declare-fun res!491880 () Bool)

(assert (=> b!732159 (= res!491880 (= (select (arr!19726 a!3186) (index!31674 lt!324454)) (select (arr!19726 a!3186) j!159)))))

(assert (=> b!732159 (=> res!491880 e!409684)))

(assert (=> b!732159 (= e!409687 e!409684)))

(assert (= (and d!99779 c!80513) b!732154))

(assert (= (and d!99779 (not c!80513)) b!732158))

(assert (= (and b!732158 c!80514) b!732155))

(assert (= (and b!732158 (not c!80514)) b!732153))

(assert (= (and d!99779 c!80515) b!732152))

(assert (= (and d!99779 (not c!80515)) b!732156))

(assert (= (and b!732156 res!491879) b!732159))

(assert (= (and b!732159 (not res!491880)) b!732151))

(assert (= (and b!732151 (not res!491878)) b!732157))

(assert (=> b!732153 m!685113))

(declare-fun m!685307 () Bool)

(assert (=> b!732153 m!685307))

(assert (=> b!732153 m!685307))

(assert (=> b!732153 m!685103))

(declare-fun m!685309 () Bool)

(assert (=> b!732153 m!685309))

(declare-fun m!685311 () Bool)

(assert (=> b!732159 m!685311))

(assert (=> b!732157 m!685311))

(assert (=> b!732151 m!685311))

(assert (=> d!99779 m!685113))

(declare-fun m!685313 () Bool)

(assert (=> d!99779 m!685313))

(assert (=> d!99779 m!685093))

(assert (=> b!731879 d!99779))

(declare-fun d!99785 () Bool)

(declare-fun lt!324456 () (_ BitVec 32))

(declare-fun lt!324455 () (_ BitVec 32))

(assert (=> d!99785 (= lt!324456 (bvmul (bvxor lt!324455 (bvlshr lt!324455 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99785 (= lt!324455 ((_ extract 31 0) (bvand (bvxor (select (arr!19726 a!3186) j!159) (bvlshr (select (arr!19726 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99785 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!491850 (let ((h!14789 ((_ extract 31 0) (bvand (bvxor (select (arr!19726 a!3186) j!159) (bvlshr (select (arr!19726 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62661 (bvmul (bvxor h!14789 (bvlshr h!14789 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62661 (bvlshr x!62661 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!491850 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!491850 #b00000000000000000000000000000000))))))

(assert (=> d!99785 (= (toIndex!0 (select (arr!19726 a!3186) j!159) mask!3328) (bvand (bvxor lt!324456 (bvlshr lt!324456 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!731879 d!99785))

(declare-fun e!409691 () SeekEntryResult!7326)

(declare-fun b!732160 () Bool)

(assert (=> b!732160 (= e!409691 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!19726 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!732161 () Bool)

(declare-fun c!80517 () Bool)

(declare-fun lt!324459 () (_ BitVec 64))

(assert (=> b!732161 (= c!80517 (= lt!324459 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!409690 () SeekEntryResult!7326)

(assert (=> b!732161 (= e!409690 e!409691)))

(declare-fun b!732162 () Bool)

(assert (=> b!732162 (= e!409691 (MissingVacant!7326 resIntermediateIndex!5))))

(declare-fun b!732163 () Bool)

(declare-fun e!409689 () SeekEntryResult!7326)

(assert (=> b!732163 (= e!409689 Undefined!7326)))

(declare-fun b!732165 () Bool)

(assert (=> b!732165 (= e!409690 (Found!7326 resIntermediateIndex!5))))

(declare-fun b!732164 () Bool)

(assert (=> b!732164 (= e!409689 e!409690)))

(declare-fun c!80518 () Bool)

(assert (=> b!732164 (= c!80518 (= lt!324459 (select (arr!19726 a!3186) j!159)))))

(declare-fun d!99787 () Bool)

(declare-fun lt!324460 () SeekEntryResult!7326)

(assert (=> d!99787 (and (or ((_ is Undefined!7326) lt!324460) (not ((_ is Found!7326) lt!324460)) (and (bvsge (index!31673 lt!324460) #b00000000000000000000000000000000) (bvslt (index!31673 lt!324460) (size!20147 a!3186)))) (or ((_ is Undefined!7326) lt!324460) ((_ is Found!7326) lt!324460) (not ((_ is MissingVacant!7326) lt!324460)) (not (= (index!31675 lt!324460) resIntermediateIndex!5)) (and (bvsge (index!31675 lt!324460) #b00000000000000000000000000000000) (bvslt (index!31675 lt!324460) (size!20147 a!3186)))) (or ((_ is Undefined!7326) lt!324460) (ite ((_ is Found!7326) lt!324460) (= (select (arr!19726 a!3186) (index!31673 lt!324460)) (select (arr!19726 a!3186) j!159)) (and ((_ is MissingVacant!7326) lt!324460) (= (index!31675 lt!324460) resIntermediateIndex!5) (= (select (arr!19726 a!3186) (index!31675 lt!324460)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!99787 (= lt!324460 e!409689)))

(declare-fun c!80516 () Bool)

(assert (=> d!99787 (= c!80516 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!99787 (= lt!324459 (select (arr!19726 a!3186) resIntermediateIndex!5))))

(assert (=> d!99787 (validMask!0 mask!3328)))

(assert (=> d!99787 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19726 a!3186) j!159) a!3186 mask!3328) lt!324460)))

(assert (= (and d!99787 c!80516) b!732163))

(assert (= (and d!99787 (not c!80516)) b!732164))

(assert (= (and b!732164 c!80518) b!732165))

(assert (= (and b!732164 (not c!80518)) b!732161))

(assert (= (and b!732161 c!80517) b!732162))

(assert (= (and b!732161 (not c!80517)) b!732160))

(declare-fun m!685317 () Bool)

(assert (=> b!732160 m!685317))

(assert (=> b!732160 m!685317))

(assert (=> b!732160 m!685103))

(declare-fun m!685319 () Bool)

(assert (=> b!732160 m!685319))

(declare-fun m!685321 () Bool)

(assert (=> d!99787 m!685321))

(declare-fun m!685323 () Bool)

(assert (=> d!99787 m!685323))

(assert (=> d!99787 m!685111))

(assert (=> d!99787 m!685093))

(assert (=> b!731868 d!99787))

(declare-fun d!99793 () Bool)

(assert (=> d!99793 (= (validKeyInArray!0 (select (arr!19726 a!3186) j!159)) (and (not (= (select (arr!19726 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19726 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!731878 d!99793))

(assert (=> b!731882 d!99769))

(declare-fun d!99795 () Bool)

(assert (=> d!99795 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!64836 d!99795))

(declare-fun d!99803 () Bool)

(assert (=> d!99803 (= (array_inv!15522 a!3186) (bvsge (size!20147 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!64836 d!99803))

(declare-fun b!732212 () Bool)

(declare-fun e!409724 () Bool)

(declare-fun call!34860 () Bool)

(assert (=> b!732212 (= e!409724 call!34860)))

(declare-fun b!732213 () Bool)

(declare-fun e!409725 () Bool)

(assert (=> b!732213 (= e!409724 e!409725)))

(declare-fun lt!324481 () (_ BitVec 64))

(assert (=> b!732213 (= lt!324481 (select (arr!19726 a!3186) j!159))))

(declare-fun lt!324480 () Unit!24970)

(assert (=> b!732213 (= lt!324480 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!324481 j!159))))

(assert (=> b!732213 (arrayContainsKey!0 a!3186 lt!324481 #b00000000000000000000000000000000)))

(declare-fun lt!324482 () Unit!24970)

(assert (=> b!732213 (= lt!324482 lt!324480)))

(declare-fun res!491899 () Bool)

(assert (=> b!732213 (= res!491899 (= (seekEntryOrOpen!0 (select (arr!19726 a!3186) j!159) a!3186 mask!3328) (Found!7326 j!159)))))

(assert (=> b!732213 (=> (not res!491899) (not e!409725))))

(declare-fun bm!34857 () Bool)

(assert (=> bm!34857 (= call!34860 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!732214 () Bool)

(assert (=> b!732214 (= e!409725 call!34860)))

(declare-fun d!99805 () Bool)

(declare-fun res!491900 () Bool)

(declare-fun e!409726 () Bool)

(assert (=> d!99805 (=> res!491900 e!409726)))

(assert (=> d!99805 (= res!491900 (bvsge j!159 (size!20147 a!3186)))))

(assert (=> d!99805 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!409726)))

(declare-fun b!732215 () Bool)

(assert (=> b!732215 (= e!409726 e!409724)))

(declare-fun c!80533 () Bool)

(assert (=> b!732215 (= c!80533 (validKeyInArray!0 (select (arr!19726 a!3186) j!159)))))

(assert (= (and d!99805 (not res!491900)) b!732215))

(assert (= (and b!732215 c!80533) b!732213))

(assert (= (and b!732215 (not c!80533)) b!732212))

(assert (= (and b!732213 res!491899) b!732214))

(assert (= (or b!732214 b!732212) bm!34857))

(assert (=> b!732213 m!685103))

(declare-fun m!685349 () Bool)

(assert (=> b!732213 m!685349))

(declare-fun m!685351 () Bool)

(assert (=> b!732213 m!685351))

(assert (=> b!732213 m!685103))

(assert (=> b!732213 m!685119))

(declare-fun m!685354 () Bool)

(assert (=> bm!34857 m!685354))

(assert (=> b!732215 m!685103))

(assert (=> b!732215 m!685103))

(assert (=> b!732215 m!685105))

(assert (=> b!731881 d!99805))

(declare-fun d!99807 () Bool)

(assert (=> d!99807 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!324495 () Unit!24970)

(declare-fun choose!38 (array!41216 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24970)

(assert (=> d!99807 (= lt!324495 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!99807 (validMask!0 mask!3328)))

(assert (=> d!99807 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!324495)))

(declare-fun bs!20948 () Bool)

(assert (= bs!20948 d!99807))

(assert (=> bs!20948 m!685097))

(declare-fun m!685383 () Bool)

(assert (=> bs!20948 m!685383))

(assert (=> bs!20948 m!685093))

(assert (=> b!731881 d!99807))

(declare-fun b!732286 () Bool)

(declare-fun e!409769 () Bool)

(declare-fun e!409770 () Bool)

(assert (=> b!732286 (= e!409769 e!409770)))

(declare-fun c!80559 () Bool)

(assert (=> b!732286 (= c!80559 (validKeyInArray!0 (select (arr!19726 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!99817 () Bool)

(declare-fun res!491924 () Bool)

(declare-fun e!409772 () Bool)

(assert (=> d!99817 (=> res!491924 e!409772)))

(assert (=> d!99817 (= res!491924 (bvsge #b00000000000000000000000000000000 (size!20147 a!3186)))))

(assert (=> d!99817 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13725) e!409772)))

(declare-fun b!732287 () Bool)

(declare-fun e!409771 () Bool)

(declare-fun contains!4055 (List!13728 (_ BitVec 64)) Bool)

(assert (=> b!732287 (= e!409771 (contains!4055 Nil!13725 (select (arr!19726 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!732288 () Bool)

(declare-fun call!34865 () Bool)

(assert (=> b!732288 (= e!409770 call!34865)))

(declare-fun bm!34862 () Bool)

(assert (=> bm!34862 (= call!34865 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!80559 (Cons!13724 (select (arr!19726 a!3186) #b00000000000000000000000000000000) Nil!13725) Nil!13725)))))

(declare-fun b!732289 () Bool)

(assert (=> b!732289 (= e!409772 e!409769)))

(declare-fun res!491922 () Bool)

(assert (=> b!732289 (=> (not res!491922) (not e!409769))))

(assert (=> b!732289 (= res!491922 (not e!409771))))

(declare-fun res!491923 () Bool)

(assert (=> b!732289 (=> (not res!491923) (not e!409771))))

(assert (=> b!732289 (= res!491923 (validKeyInArray!0 (select (arr!19726 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!732290 () Bool)

(assert (=> b!732290 (= e!409770 call!34865)))

(assert (= (and d!99817 (not res!491924)) b!732289))

(assert (= (and b!732289 res!491923) b!732287))

(assert (= (and b!732289 res!491922) b!732286))

(assert (= (and b!732286 c!80559) b!732290))

(assert (= (and b!732286 (not c!80559)) b!732288))

(assert (= (or b!732290 b!732288) bm!34862))

(assert (=> b!732286 m!685249))

(assert (=> b!732286 m!685249))

(assert (=> b!732286 m!685259))

(assert (=> b!732287 m!685249))

(assert (=> b!732287 m!685249))

(declare-fun m!685409 () Bool)

(assert (=> b!732287 m!685409))

(assert (=> bm!34862 m!685249))

(declare-fun m!685411 () Bool)

(assert (=> bm!34862 m!685411))

(assert (=> b!732289 m!685249))

(assert (=> b!732289 m!685249))

(assert (=> b!732289 m!685259))

(assert (=> b!731870 d!99817))

(check-sat (not d!99733) (not b!732215) (not b!732160) (not d!99761) (not bm!34862) (not b!732153) (not b!732213) (not b!731986) (not bm!34848) (not bm!34857) (not b!732003) (not d!99737) (not b!732286) (not d!99735) (not d!99769) (not b!731994) (not b!732057) (not d!99779) (not d!99787) (not b!732076) (not b!732108) (not b!732139) (not b!732289) (not d!99807) (not b!731967) (not b!732055) (not b!732287) (not d!99749) (not d!99747))
(check-sat)
