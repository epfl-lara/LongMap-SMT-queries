; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64752 () Bool)

(assert start!64752)

(declare-fun b!731094 () Bool)

(declare-fun res!491327 () Bool)

(declare-fun e!409097 () Bool)

(assert (=> b!731094 (=> (not res!491327) (not e!409097))))

(declare-datatypes ((array!41201 0))(
  ( (array!41202 (arr!19720 (Array (_ BitVec 32) (_ BitVec 64))) (size!20141 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41201)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41201 (_ BitVec 32)) Bool)

(assert (=> b!731094 (= res!491327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!731095 () Bool)

(declare-fun e!409099 () Bool)

(assert (=> b!731095 (= e!409097 e!409099)))

(declare-fun res!491330 () Bool)

(assert (=> b!731095 (=> (not res!491330) (not e!409099))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7320 0))(
  ( (MissingZero!7320 (index!31648 (_ BitVec 32))) (Found!7320 (index!31649 (_ BitVec 32))) (Intermediate!7320 (undefined!8132 Bool) (index!31650 (_ BitVec 32)) (x!62622 (_ BitVec 32))) (Undefined!7320) (MissingVacant!7320 (index!31651 (_ BitVec 32))) )
))
(declare-fun lt!323988 () SeekEntryResult!7320)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41201 (_ BitVec 32)) SeekEntryResult!7320)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!731095 (= res!491330 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19720 a!3186) j!159) mask!3328) (select (arr!19720 a!3186) j!159) a!3186 mask!3328) lt!323988))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!731095 (= lt!323988 (Intermediate!7320 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!491320 () Bool)

(declare-fun e!409101 () Bool)

(assert (=> start!64752 (=> (not res!491320) (not e!409101))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64752 (= res!491320 (validMask!0 mask!3328))))

(assert (=> start!64752 e!409101))

(assert (=> start!64752 true))

(declare-fun array_inv!15516 (array!41201) Bool)

(assert (=> start!64752 (array_inv!15516 a!3186)))

(declare-fun e!409105 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!731096 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!731096 (= e!409105 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19720 a!3186) j!159) a!3186 mask!3328) lt!323988))))

(declare-fun b!731097 () Bool)

(assert (=> b!731097 (= e!409101 e!409097)))

(declare-fun res!491321 () Bool)

(assert (=> b!731097 (=> (not res!491321) (not e!409097))))

(declare-fun lt!323990 () SeekEntryResult!7320)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!731097 (= res!491321 (or (= lt!323990 (MissingZero!7320 i!1173)) (= lt!323990 (MissingVacant!7320 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41201 (_ BitVec 32)) SeekEntryResult!7320)

(assert (=> b!731097 (= lt!323990 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!731098 () Bool)

(declare-fun res!491319 () Bool)

(assert (=> b!731098 (=> (not res!491319) (not e!409101))))

(declare-fun arrayContainsKey!0 (array!41201 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!731098 (= res!491319 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!731099 () Bool)

(declare-fun res!491326 () Bool)

(assert (=> b!731099 (=> (not res!491326) (not e!409101))))

(assert (=> b!731099 (= res!491326 (and (= (size!20141 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20141 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20141 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!731100 () Bool)

(declare-fun e!409103 () Bool)

(assert (=> b!731100 (= e!409099 e!409103)))

(declare-fun res!491324 () Bool)

(assert (=> b!731100 (=> (not res!491324) (not e!409103))))

(declare-fun lt!323987 () SeekEntryResult!7320)

(declare-fun lt!323996 () SeekEntryResult!7320)

(assert (=> b!731100 (= res!491324 (= lt!323987 lt!323996))))

(declare-fun lt!323989 () array!41201)

(declare-fun lt!323994 () (_ BitVec 64))

(assert (=> b!731100 (= lt!323996 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323994 lt!323989 mask!3328))))

(assert (=> b!731100 (= lt!323987 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323994 mask!3328) lt!323994 lt!323989 mask!3328))))

(assert (=> b!731100 (= lt!323994 (select (store (arr!19720 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!731100 (= lt!323989 (array!41202 (store (arr!19720 a!3186) i!1173 k0!2102) (size!20141 a!3186)))))

(declare-fun b!731101 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41201 (_ BitVec 32)) SeekEntryResult!7320)

(assert (=> b!731101 (= e!409105 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19720 a!3186) j!159) a!3186 mask!3328) (Found!7320 j!159)))))

(declare-fun b!731102 () Bool)

(declare-fun e!409104 () Bool)

(assert (=> b!731102 (= e!409104 true)))

(declare-fun lt!323991 () SeekEntryResult!7320)

(assert (=> b!731102 (= lt!323991 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19720 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!731103 () Bool)

(declare-fun e!409102 () Bool)

(declare-fun lt!323993 () SeekEntryResult!7320)

(assert (=> b!731103 (= e!409102 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19720 a!3186) j!159) a!3186 mask!3328) lt!323993))))

(declare-fun b!731104 () Bool)

(declare-fun e!409100 () Bool)

(assert (=> b!731104 (= e!409100 e!409104)))

(declare-fun res!491325 () Bool)

(assert (=> b!731104 (=> res!491325 e!409104)))

(assert (=> b!731104 (= res!491325 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!323992 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!731104 (= lt!323992 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!731105 () Bool)

(declare-fun res!491323 () Bool)

(assert (=> b!731105 (=> (not res!491323) (not e!409097))))

(declare-datatypes ((List!13722 0))(
  ( (Nil!13719) (Cons!13718 (h!14778 (_ BitVec 64)) (t!20037 List!13722)) )
))
(declare-fun arrayNoDuplicates!0 (array!41201 (_ BitVec 32) List!13722) Bool)

(assert (=> b!731105 (= res!491323 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13719))))

(declare-fun b!731106 () Bool)

(declare-fun res!491322 () Bool)

(assert (=> b!731106 (=> (not res!491322) (not e!409097))))

(assert (=> b!731106 (= res!491322 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20141 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20141 a!3186))))))

(declare-fun b!731107 () Bool)

(declare-fun e!409106 () Bool)

(assert (=> b!731107 (= e!409106 e!409102)))

(declare-fun res!491329 () Bool)

(assert (=> b!731107 (=> (not res!491329) (not e!409102))))

(assert (=> b!731107 (= res!491329 (= (seekEntryOrOpen!0 (select (arr!19720 a!3186) j!159) a!3186 mask!3328) lt!323993))))

(assert (=> b!731107 (= lt!323993 (Found!7320 j!159))))

(declare-fun b!731108 () Bool)

(declare-fun res!491332 () Bool)

(assert (=> b!731108 (=> (not res!491332) (not e!409099))))

(assert (=> b!731108 (= res!491332 e!409105)))

(declare-fun c!80263 () Bool)

(assert (=> b!731108 (= c!80263 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!731109 () Bool)

(declare-fun res!491318 () Bool)

(assert (=> b!731109 (=> (not res!491318) (not e!409101))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!731109 (= res!491318 (validKeyInArray!0 k0!2102))))

(declare-fun b!731110 () Bool)

(declare-fun res!491317 () Bool)

(assert (=> b!731110 (=> (not res!491317) (not e!409099))))

(assert (=> b!731110 (= res!491317 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19720 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!731111 () Bool)

(declare-fun res!491328 () Bool)

(assert (=> b!731111 (=> (not res!491328) (not e!409101))))

(assert (=> b!731111 (= res!491328 (validKeyInArray!0 (select (arr!19720 a!3186) j!159)))))

(declare-fun b!731112 () Bool)

(assert (=> b!731112 (= e!409103 (not e!409100))))

(declare-fun res!491333 () Bool)

(assert (=> b!731112 (=> res!491333 e!409100)))

(get-info :version)

(assert (=> b!731112 (= res!491333 (or (not ((_ is Intermediate!7320) lt!323996)) (bvsge x!1131 (x!62622 lt!323996))))))

(assert (=> b!731112 e!409106))

(declare-fun res!491331 () Bool)

(assert (=> b!731112 (=> (not res!491331) (not e!409106))))

(assert (=> b!731112 (= res!491331 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24958 0))(
  ( (Unit!24959) )
))
(declare-fun lt!323995 () Unit!24958)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41201 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24958)

(assert (=> b!731112 (= lt!323995 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!64752 res!491320) b!731099))

(assert (= (and b!731099 res!491326) b!731111))

(assert (= (and b!731111 res!491328) b!731109))

(assert (= (and b!731109 res!491318) b!731098))

(assert (= (and b!731098 res!491319) b!731097))

(assert (= (and b!731097 res!491321) b!731094))

(assert (= (and b!731094 res!491327) b!731105))

(assert (= (and b!731105 res!491323) b!731106))

(assert (= (and b!731106 res!491322) b!731095))

(assert (= (and b!731095 res!491330) b!731110))

(assert (= (and b!731110 res!491317) b!731108))

(assert (= (and b!731108 c!80263) b!731096))

(assert (= (and b!731108 (not c!80263)) b!731101))

(assert (= (and b!731108 res!491332) b!731100))

(assert (= (and b!731100 res!491324) b!731112))

(assert (= (and b!731112 res!491331) b!731107))

(assert (= (and b!731107 res!491329) b!731103))

(assert (= (and b!731112 (not res!491333)) b!731104))

(assert (= (and b!731104 (not res!491325)) b!731102))

(declare-fun m!684523 () Bool)

(assert (=> b!731103 m!684523))

(assert (=> b!731103 m!684523))

(declare-fun m!684525 () Bool)

(assert (=> b!731103 m!684525))

(assert (=> b!731095 m!684523))

(assert (=> b!731095 m!684523))

(declare-fun m!684527 () Bool)

(assert (=> b!731095 m!684527))

(assert (=> b!731095 m!684527))

(assert (=> b!731095 m!684523))

(declare-fun m!684529 () Bool)

(assert (=> b!731095 m!684529))

(assert (=> b!731102 m!684523))

(assert (=> b!731102 m!684523))

(declare-fun m!684531 () Bool)

(assert (=> b!731102 m!684531))

(declare-fun m!684533 () Bool)

(assert (=> b!731110 m!684533))

(assert (=> b!731101 m!684523))

(assert (=> b!731101 m!684523))

(assert (=> b!731101 m!684531))

(assert (=> b!731111 m!684523))

(assert (=> b!731111 m!684523))

(declare-fun m!684535 () Bool)

(assert (=> b!731111 m!684535))

(declare-fun m!684537 () Bool)

(assert (=> b!731104 m!684537))

(declare-fun m!684539 () Bool)

(assert (=> b!731100 m!684539))

(declare-fun m!684541 () Bool)

(assert (=> b!731100 m!684541))

(declare-fun m!684543 () Bool)

(assert (=> b!731100 m!684543))

(declare-fun m!684545 () Bool)

(assert (=> b!731100 m!684545))

(declare-fun m!684547 () Bool)

(assert (=> b!731100 m!684547))

(assert (=> b!731100 m!684539))

(declare-fun m!684549 () Bool)

(assert (=> b!731097 m!684549))

(declare-fun m!684551 () Bool)

(assert (=> start!64752 m!684551))

(declare-fun m!684553 () Bool)

(assert (=> start!64752 m!684553))

(declare-fun m!684555 () Bool)

(assert (=> b!731094 m!684555))

(declare-fun m!684557 () Bool)

(assert (=> b!731112 m!684557))

(declare-fun m!684559 () Bool)

(assert (=> b!731112 m!684559))

(declare-fun m!684561 () Bool)

(assert (=> b!731105 m!684561))

(assert (=> b!731096 m!684523))

(assert (=> b!731096 m!684523))

(declare-fun m!684563 () Bool)

(assert (=> b!731096 m!684563))

(assert (=> b!731107 m!684523))

(assert (=> b!731107 m!684523))

(declare-fun m!684565 () Bool)

(assert (=> b!731107 m!684565))

(declare-fun m!684567 () Bool)

(assert (=> b!731109 m!684567))

(declare-fun m!684569 () Bool)

(assert (=> b!731098 m!684569))

(check-sat (not b!731095) (not b!731100) (not b!731112) (not b!731096) (not b!731109) (not b!731107) (not b!731102) (not b!731103) (not b!731094) (not b!731105) (not b!731104) (not b!731111) (not start!64752) (not b!731101) (not b!731097) (not b!731098))
(check-sat)
