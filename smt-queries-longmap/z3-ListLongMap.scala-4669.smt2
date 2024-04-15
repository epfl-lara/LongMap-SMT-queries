; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64910 () Bool)

(assert start!64910)

(declare-fun b!732675 () Bool)

(declare-fun e!409959 () Bool)

(declare-fun e!409963 () Bool)

(assert (=> b!732675 (= e!409959 e!409963)))

(declare-fun res!492367 () Bool)

(assert (=> b!732675 (=> (not res!492367) (not e!409963))))

(declare-datatypes ((array!41238 0))(
  ( (array!41239 (arr!19736 (Array (_ BitVec 32) (_ BitVec 64))) (size!20157 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41238)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7333 0))(
  ( (MissingZero!7333 (index!31700 (_ BitVec 32))) (Found!7333 (index!31701 (_ BitVec 32))) (Intermediate!7333 (undefined!8145 Bool) (index!31702 (_ BitVec 32)) (x!62702 (_ BitVec 32))) (Undefined!7333) (MissingVacant!7333 (index!31703 (_ BitVec 32))) )
))
(declare-fun lt!324582 () SeekEntryResult!7333)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41238 (_ BitVec 32)) SeekEntryResult!7333)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!732675 (= res!492367 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19736 a!3186) j!159) mask!3328) (select (arr!19736 a!3186) j!159) a!3186 mask!3328) lt!324582))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!732675 (= lt!324582 (Intermediate!7333 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!732676 () Bool)

(declare-fun res!492356 () Bool)

(declare-fun e!409957 () Bool)

(assert (=> b!732676 (=> (not res!492356) (not e!409957))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!732676 (= res!492356 (and (= (size!20157 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20157 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20157 a!3186)) (not (= i!1173 j!159))))))

(declare-fun e!409964 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!732677 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!732677 (= e!409964 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19736 a!3186) j!159) a!3186 mask!3328) lt!324582))))

(declare-fun b!732678 () Bool)

(declare-fun res!492354 () Bool)

(assert (=> b!732678 (=> (not res!492354) (not e!409959))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41238 (_ BitVec 32)) Bool)

(assert (=> b!732678 (= res!492354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!732679 () Bool)

(declare-fun res!492353 () Bool)

(assert (=> b!732679 (=> (not res!492353) (not e!409963))))

(assert (=> b!732679 (= res!492353 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19736 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!732680 () Bool)

(declare-fun res!492366 () Bool)

(assert (=> b!732680 (=> (not res!492366) (not e!409957))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41238 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!732680 (= res!492366 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!732681 () Bool)

(declare-fun res!492363 () Bool)

(assert (=> b!732681 (=> (not res!492363) (not e!409963))))

(assert (=> b!732681 (= res!492363 e!409964)))

(declare-fun c!80538 () Bool)

(assert (=> b!732681 (= c!80538 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!732682 () Bool)

(declare-fun e!409961 () Bool)

(declare-fun e!409965 () Bool)

(assert (=> b!732682 (= e!409961 e!409965)))

(declare-fun res!492364 () Bool)

(assert (=> b!732682 (=> res!492364 e!409965)))

(assert (=> b!732682 (= res!492364 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!324584 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!732682 (= lt!324584 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!732683 () Bool)

(declare-fun res!492355 () Bool)

(assert (=> b!732683 (=> (not res!492355) (not e!409957))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!732683 (= res!492355 (validKeyInArray!0 k0!2102))))

(declare-fun b!732684 () Bool)

(declare-fun res!492360 () Bool)

(assert (=> b!732684 (=> (not res!492360) (not e!409959))))

(assert (=> b!732684 (= res!492360 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20157 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20157 a!3186))))))

(declare-fun b!732685 () Bool)

(assert (=> b!732685 (= e!409965 true)))

(declare-fun lt!324579 () SeekEntryResult!7333)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41238 (_ BitVec 32)) SeekEntryResult!7333)

(assert (=> b!732685 (= lt!324579 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19736 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!732686 () Bool)

(assert (=> b!732686 (= e!409957 e!409959)))

(declare-fun res!492365 () Bool)

(assert (=> b!732686 (=> (not res!492365) (not e!409959))))

(declare-fun lt!324581 () SeekEntryResult!7333)

(assert (=> b!732686 (= res!492365 (or (= lt!324581 (MissingZero!7333 i!1173)) (= lt!324581 (MissingVacant!7333 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41238 (_ BitVec 32)) SeekEntryResult!7333)

(assert (=> b!732686 (= lt!324581 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!732687 () Bool)

(declare-fun e!409958 () Bool)

(assert (=> b!732687 (= e!409963 e!409958)))

(declare-fun res!492358 () Bool)

(assert (=> b!732687 (=> (not res!492358) (not e!409958))))

(declare-fun lt!324587 () SeekEntryResult!7333)

(declare-fun lt!324583 () SeekEntryResult!7333)

(assert (=> b!732687 (= res!492358 (= lt!324587 lt!324583))))

(declare-fun lt!324586 () array!41238)

(declare-fun lt!324585 () (_ BitVec 64))

(assert (=> b!732687 (= lt!324583 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324585 lt!324586 mask!3328))))

(assert (=> b!732687 (= lt!324587 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324585 mask!3328) lt!324585 lt!324586 mask!3328))))

(assert (=> b!732687 (= lt!324585 (select (store (arr!19736 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!732687 (= lt!324586 (array!41239 (store (arr!19736 a!3186) i!1173 k0!2102) (size!20157 a!3186)))))

(declare-fun b!732688 () Bool)

(assert (=> b!732688 (= e!409964 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19736 a!3186) j!159) a!3186 mask!3328) (Found!7333 j!159)))))

(declare-fun res!492361 () Bool)

(assert (=> start!64910 (=> (not res!492361) (not e!409957))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64910 (= res!492361 (validMask!0 mask!3328))))

(assert (=> start!64910 e!409957))

(assert (=> start!64910 true))

(declare-fun array_inv!15619 (array!41238) Bool)

(assert (=> start!64910 (array_inv!15619 a!3186)))

(declare-fun b!732674 () Bool)

(declare-fun res!492362 () Bool)

(assert (=> b!732674 (=> (not res!492362) (not e!409959))))

(declare-datatypes ((List!13777 0))(
  ( (Nil!13774) (Cons!13773 (h!14839 (_ BitVec 64)) (t!20083 List!13777)) )
))
(declare-fun arrayNoDuplicates!0 (array!41238 (_ BitVec 32) List!13777) Bool)

(assert (=> b!732674 (= res!492362 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13774))))

(declare-fun b!732689 () Bool)

(declare-fun res!492369 () Bool)

(assert (=> b!732689 (=> (not res!492369) (not e!409957))))

(assert (=> b!732689 (= res!492369 (validKeyInArray!0 (select (arr!19736 a!3186) j!159)))))

(declare-fun b!732690 () Bool)

(declare-fun e!409966 () Bool)

(declare-fun e!409962 () Bool)

(assert (=> b!732690 (= e!409966 e!409962)))

(declare-fun res!492359 () Bool)

(assert (=> b!732690 (=> (not res!492359) (not e!409962))))

(declare-fun lt!324578 () SeekEntryResult!7333)

(assert (=> b!732690 (= res!492359 (= (seekEntryOrOpen!0 (select (arr!19736 a!3186) j!159) a!3186 mask!3328) lt!324578))))

(assert (=> b!732690 (= lt!324578 (Found!7333 j!159))))

(declare-fun b!732691 () Bool)

(assert (=> b!732691 (= e!409958 (not e!409961))))

(declare-fun res!492357 () Bool)

(assert (=> b!732691 (=> res!492357 e!409961)))

(get-info :version)

(assert (=> b!732691 (= res!492357 (or (not ((_ is Intermediate!7333) lt!324583)) (bvsge x!1131 (x!62702 lt!324583))))))

(assert (=> b!732691 e!409966))

(declare-fun res!492368 () Bool)

(assert (=> b!732691 (=> (not res!492368) (not e!409966))))

(assert (=> b!732691 (= res!492368 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24956 0))(
  ( (Unit!24957) )
))
(declare-fun lt!324580 () Unit!24956)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41238 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24956)

(assert (=> b!732691 (= lt!324580 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!732692 () Bool)

(assert (=> b!732692 (= e!409962 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19736 a!3186) j!159) a!3186 mask!3328) lt!324578))))

(assert (= (and start!64910 res!492361) b!732676))

(assert (= (and b!732676 res!492356) b!732689))

(assert (= (and b!732689 res!492369) b!732683))

(assert (= (and b!732683 res!492355) b!732680))

(assert (= (and b!732680 res!492366) b!732686))

(assert (= (and b!732686 res!492365) b!732678))

(assert (= (and b!732678 res!492354) b!732674))

(assert (= (and b!732674 res!492362) b!732684))

(assert (= (and b!732684 res!492360) b!732675))

(assert (= (and b!732675 res!492367) b!732679))

(assert (= (and b!732679 res!492353) b!732681))

(assert (= (and b!732681 c!80538) b!732677))

(assert (= (and b!732681 (not c!80538)) b!732688))

(assert (= (and b!732681 res!492363) b!732687))

(assert (= (and b!732687 res!492358) b!732691))

(assert (= (and b!732691 res!492368) b!732690))

(assert (= (and b!732690 res!492359) b!732692))

(assert (= (and b!732691 (not res!492357)) b!732682))

(assert (= (and b!732682 (not res!492364)) b!732685))

(declare-fun m!685145 () Bool)

(assert (=> b!732674 m!685145))

(declare-fun m!685147 () Bool)

(assert (=> b!732680 m!685147))

(declare-fun m!685149 () Bool)

(assert (=> b!732687 m!685149))

(declare-fun m!685151 () Bool)

(assert (=> b!732687 m!685151))

(declare-fun m!685153 () Bool)

(assert (=> b!732687 m!685153))

(declare-fun m!685155 () Bool)

(assert (=> b!732687 m!685155))

(declare-fun m!685157 () Bool)

(assert (=> b!732687 m!685157))

(assert (=> b!732687 m!685149))

(declare-fun m!685159 () Bool)

(assert (=> b!732688 m!685159))

(assert (=> b!732688 m!685159))

(declare-fun m!685161 () Bool)

(assert (=> b!732688 m!685161))

(declare-fun m!685163 () Bool)

(assert (=> b!732678 m!685163))

(declare-fun m!685165 () Bool)

(assert (=> b!732691 m!685165))

(declare-fun m!685167 () Bool)

(assert (=> b!732691 m!685167))

(assert (=> b!732685 m!685159))

(assert (=> b!732685 m!685159))

(assert (=> b!732685 m!685161))

(declare-fun m!685169 () Bool)

(assert (=> b!732686 m!685169))

(assert (=> b!732690 m!685159))

(assert (=> b!732690 m!685159))

(declare-fun m!685171 () Bool)

(assert (=> b!732690 m!685171))

(assert (=> b!732675 m!685159))

(assert (=> b!732675 m!685159))

(declare-fun m!685173 () Bool)

(assert (=> b!732675 m!685173))

(assert (=> b!732675 m!685173))

(assert (=> b!732675 m!685159))

(declare-fun m!685175 () Bool)

(assert (=> b!732675 m!685175))

(declare-fun m!685177 () Bool)

(assert (=> start!64910 m!685177))

(declare-fun m!685179 () Bool)

(assert (=> start!64910 m!685179))

(assert (=> b!732689 m!685159))

(assert (=> b!732689 m!685159))

(declare-fun m!685181 () Bool)

(assert (=> b!732689 m!685181))

(assert (=> b!732677 m!685159))

(assert (=> b!732677 m!685159))

(declare-fun m!685183 () Bool)

(assert (=> b!732677 m!685183))

(assert (=> b!732692 m!685159))

(assert (=> b!732692 m!685159))

(declare-fun m!685185 () Bool)

(assert (=> b!732692 m!685185))

(declare-fun m!685187 () Bool)

(assert (=> b!732683 m!685187))

(declare-fun m!685189 () Bool)

(assert (=> b!732682 m!685189))

(declare-fun m!685191 () Bool)

(assert (=> b!732679 m!685191))

(check-sat (not b!732677) (not b!732687) (not b!732682) (not b!732683) (not b!732688) (not b!732674) (not start!64910) (not b!732692) (not b!732685) (not b!732691) (not b!732680) (not b!732675) (not b!732686) (not b!732678) (not b!732690) (not b!732689))
(check-sat)
