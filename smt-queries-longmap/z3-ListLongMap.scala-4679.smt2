; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65136 () Bool)

(assert start!65136)

(declare-fun b!735676 () Bool)

(declare-fun res!494367 () Bool)

(declare-fun e!411602 () Bool)

(assert (=> b!735676 (=> (not res!494367) (not e!411602))))

(declare-fun e!411598 () Bool)

(assert (=> b!735676 (= res!494367 e!411598)))

(declare-fun c!81041 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!735676 (= c!81041 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!494365 () Bool)

(declare-fun e!411595 () Bool)

(assert (=> start!65136 (=> (not res!494365) (not e!411595))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65136 (= res!494365 (validMask!0 mask!3328))))

(assert (=> start!65136 e!411595))

(assert (=> start!65136 true))

(declare-datatypes ((array!41309 0))(
  ( (array!41310 (arr!19768 (Array (_ BitVec 32) (_ BitVec 64))) (size!20189 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41309)

(declare-fun array_inv!15564 (array!41309) Bool)

(assert (=> start!65136 (array_inv!15564 a!3186)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!735677 () Bool)

(declare-datatypes ((SeekEntryResult!7368 0))(
  ( (MissingZero!7368 (index!31840 (_ BitVec 32))) (Found!7368 (index!31841 (_ BitVec 32))) (Intermediate!7368 (undefined!8180 Bool) (index!31842 (_ BitVec 32)) (x!62846 (_ BitVec 32))) (Undefined!7368) (MissingVacant!7368 (index!31843 (_ BitVec 32))) )
))
(declare-fun lt!326161 () SeekEntryResult!7368)

(declare-fun e!411592 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41309 (_ BitVec 32)) SeekEntryResult!7368)

(assert (=> b!735677 (= e!411592 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19768 a!3186) j!159) a!3186 mask!3328) lt!326161))))

(declare-fun b!735678 () Bool)

(declare-fun e!411591 () Bool)

(assert (=> b!735678 (= e!411602 e!411591)))

(declare-fun res!494363 () Bool)

(assert (=> b!735678 (=> (not res!494363) (not e!411591))))

(declare-fun lt!326158 () SeekEntryResult!7368)

(declare-fun lt!326162 () SeekEntryResult!7368)

(assert (=> b!735678 (= res!494363 (= lt!326158 lt!326162))))

(declare-fun lt!326159 () array!41309)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!326156 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41309 (_ BitVec 32)) SeekEntryResult!7368)

(assert (=> b!735678 (= lt!326162 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326156 lt!326159 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735678 (= lt!326158 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326156 mask!3328) lt!326156 lt!326159 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!735678 (= lt!326156 (select (store (arr!19768 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!735678 (= lt!326159 (array!41310 (store (arr!19768 a!3186) i!1173 k0!2102) (size!20189 a!3186)))))

(declare-fun lt!326165 () SeekEntryResult!7368)

(declare-fun b!735679 () Bool)

(assert (=> b!735679 (= e!411598 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19768 a!3186) j!159) a!3186 mask!3328) lt!326165))))

(declare-fun lt!326152 () (_ BitVec 32))

(declare-fun b!735680 () Bool)

(declare-fun lt!326163 () SeekEntryResult!7368)

(declare-fun e!411597 () Bool)

(assert (=> b!735680 (= e!411597 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326152 resIntermediateIndex!5 (select (arr!19768 a!3186) j!159) a!3186 mask!3328) lt!326163)))))

(declare-fun b!735681 () Bool)

(declare-fun e!411600 () Bool)

(declare-fun e!411593 () Bool)

(assert (=> b!735681 (= e!411600 e!411593)))

(declare-fun res!494364 () Bool)

(assert (=> b!735681 (=> res!494364 e!411593)))

(assert (=> b!735681 (= res!494364 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!326152 #b00000000000000000000000000000000) (bvsge lt!326152 (size!20189 a!3186))))))

(declare-datatypes ((Unit!25068 0))(
  ( (Unit!25069) )
))
(declare-fun lt!326160 () Unit!25068)

(declare-fun e!411594 () Unit!25068)

(assert (=> b!735681 (= lt!326160 e!411594)))

(declare-fun c!81042 () Bool)

(declare-fun lt!326164 () Bool)

(assert (=> b!735681 (= c!81042 lt!326164)))

(assert (=> b!735681 (= lt!326164 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735681 (= lt!326152 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!735682 () Bool)

(assert (=> b!735682 (= e!411598 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19768 a!3186) j!159) a!3186 mask!3328) (Found!7368 j!159)))))

(declare-fun b!735683 () Bool)

(declare-fun Unit!25070 () Unit!25068)

(assert (=> b!735683 (= e!411594 Unit!25070)))

(declare-fun lt!326154 () SeekEntryResult!7368)

(assert (=> b!735683 (= lt!326154 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19768 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!735683 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326152 resIntermediateIndex!5 (select (arr!19768 a!3186) j!159) a!3186 mask!3328) lt!326163)))

(declare-fun b!735684 () Bool)

(assert (=> b!735684 (= e!411597 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326152 (select (arr!19768 a!3186) j!159) a!3186 mask!3328) lt!326165)))))

(declare-fun b!735685 () Bool)

(declare-fun e!411596 () Bool)

(assert (=> b!735685 (= e!411596 e!411602)))

(declare-fun res!494368 () Bool)

(assert (=> b!735685 (=> (not res!494368) (not e!411602))))

(assert (=> b!735685 (= res!494368 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19768 a!3186) j!159) mask!3328) (select (arr!19768 a!3186) j!159) a!3186 mask!3328) lt!326165))))

(assert (=> b!735685 (= lt!326165 (Intermediate!7368 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!735686 () Bool)

(declare-fun res!494371 () Bool)

(assert (=> b!735686 (=> (not res!494371) (not e!411595))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!735686 (= res!494371 (validKeyInArray!0 (select (arr!19768 a!3186) j!159)))))

(declare-fun b!735687 () Bool)

(declare-fun e!411599 () Bool)

(assert (=> b!735687 (= e!411599 e!411592)))

(declare-fun res!494369 () Bool)

(assert (=> b!735687 (=> (not res!494369) (not e!411592))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41309 (_ BitVec 32)) SeekEntryResult!7368)

(assert (=> b!735687 (= res!494369 (= (seekEntryOrOpen!0 (select (arr!19768 a!3186) j!159) a!3186 mask!3328) lt!326161))))

(assert (=> b!735687 (= lt!326161 (Found!7368 j!159))))

(declare-fun b!735688 () Bool)

(declare-fun res!494370 () Bool)

(assert (=> b!735688 (=> (not res!494370) (not e!411596))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41309 (_ BitVec 32)) Bool)

(assert (=> b!735688 (= res!494370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!735689 () Bool)

(declare-fun res!494362 () Bool)

(assert (=> b!735689 (=> (not res!494362) (not e!411596))))

(assert (=> b!735689 (= res!494362 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20189 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20189 a!3186))))))

(declare-fun b!735690 () Bool)

(assert (=> b!735690 (= e!411595 e!411596)))

(declare-fun res!494355 () Bool)

(assert (=> b!735690 (=> (not res!494355) (not e!411596))))

(declare-fun lt!326153 () SeekEntryResult!7368)

(assert (=> b!735690 (= res!494355 (or (= lt!326153 (MissingZero!7368 i!1173)) (= lt!326153 (MissingVacant!7368 i!1173))))))

(assert (=> b!735690 (= lt!326153 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!735691 () Bool)

(declare-fun res!494358 () Bool)

(assert (=> b!735691 (=> (not res!494358) (not e!411595))))

(assert (=> b!735691 (= res!494358 (validKeyInArray!0 k0!2102))))

(declare-fun b!735692 () Bool)

(declare-fun res!494361 () Bool)

(assert (=> b!735692 (=> (not res!494361) (not e!411595))))

(assert (=> b!735692 (= res!494361 (and (= (size!20189 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20189 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20189 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!735693 () Bool)

(declare-fun res!494357 () Bool)

(assert (=> b!735693 (=> res!494357 e!411593)))

(assert (=> b!735693 (= res!494357 e!411597)))

(declare-fun c!81043 () Bool)

(assert (=> b!735693 (= c!81043 lt!326164)))

(declare-fun b!735694 () Bool)

(declare-fun res!494366 () Bool)

(assert (=> b!735694 (=> (not res!494366) (not e!411596))))

(declare-datatypes ((List!13770 0))(
  ( (Nil!13767) (Cons!13766 (h!14838 (_ BitVec 64)) (t!20085 List!13770)) )
))
(declare-fun arrayNoDuplicates!0 (array!41309 (_ BitVec 32) List!13770) Bool)

(assert (=> b!735694 (= res!494366 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13767))))

(declare-fun b!735695 () Bool)

(declare-fun res!494372 () Bool)

(assert (=> b!735695 (=> (not res!494372) (not e!411595))))

(declare-fun arrayContainsKey!0 (array!41309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!735695 (= res!494372 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!735696 () Bool)

(declare-fun Unit!25071 () Unit!25068)

(assert (=> b!735696 (= e!411594 Unit!25071)))

(assert (=> b!735696 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326152 (select (arr!19768 a!3186) j!159) a!3186 mask!3328) lt!326165)))

(declare-fun b!735697 () Bool)

(declare-fun res!494360 () Bool)

(assert (=> b!735697 (=> (not res!494360) (not e!411602))))

(assert (=> b!735697 (= res!494360 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19768 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!735698 () Bool)

(assert (=> b!735698 (= e!411593 true)))

(declare-fun lt!326157 () SeekEntryResult!7368)

(assert (=> b!735698 (= lt!326157 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326152 lt!326156 lt!326159 mask!3328))))

(declare-fun b!735699 () Bool)

(assert (=> b!735699 (= e!411591 (not e!411600))))

(declare-fun res!494356 () Bool)

(assert (=> b!735699 (=> res!494356 e!411600)))

(get-info :version)

(assert (=> b!735699 (= res!494356 (or (not ((_ is Intermediate!7368) lt!326162)) (bvsge x!1131 (x!62846 lt!326162))))))

(assert (=> b!735699 (= lt!326163 (Found!7368 j!159))))

(assert (=> b!735699 e!411599))

(declare-fun res!494359 () Bool)

(assert (=> b!735699 (=> (not res!494359) (not e!411599))))

(assert (=> b!735699 (= res!494359 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!326155 () Unit!25068)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41309 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25068)

(assert (=> b!735699 (= lt!326155 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!65136 res!494365) b!735692))

(assert (= (and b!735692 res!494361) b!735686))

(assert (= (and b!735686 res!494371) b!735691))

(assert (= (and b!735691 res!494358) b!735695))

(assert (= (and b!735695 res!494372) b!735690))

(assert (= (and b!735690 res!494355) b!735688))

(assert (= (and b!735688 res!494370) b!735694))

(assert (= (and b!735694 res!494366) b!735689))

(assert (= (and b!735689 res!494362) b!735685))

(assert (= (and b!735685 res!494368) b!735697))

(assert (= (and b!735697 res!494360) b!735676))

(assert (= (and b!735676 c!81041) b!735679))

(assert (= (and b!735676 (not c!81041)) b!735682))

(assert (= (and b!735676 res!494367) b!735678))

(assert (= (and b!735678 res!494363) b!735699))

(assert (= (and b!735699 res!494359) b!735687))

(assert (= (and b!735687 res!494369) b!735677))

(assert (= (and b!735699 (not res!494356)) b!735681))

(assert (= (and b!735681 c!81042) b!735696))

(assert (= (and b!735681 (not c!81042)) b!735683))

(assert (= (and b!735681 (not res!494364)) b!735693))

(assert (= (and b!735693 c!81043) b!735684))

(assert (= (and b!735693 (not c!81043)) b!735680))

(assert (= (and b!735693 (not res!494357)) b!735698))

(declare-fun m!687997 () Bool)

(assert (=> b!735691 m!687997))

(declare-fun m!687999 () Bool)

(assert (=> b!735681 m!687999))

(declare-fun m!688001 () Bool)

(assert (=> b!735680 m!688001))

(assert (=> b!735680 m!688001))

(declare-fun m!688003 () Bool)

(assert (=> b!735680 m!688003))

(declare-fun m!688005 () Bool)

(assert (=> b!735688 m!688005))

(declare-fun m!688007 () Bool)

(assert (=> b!735699 m!688007))

(declare-fun m!688009 () Bool)

(assert (=> b!735699 m!688009))

(declare-fun m!688011 () Bool)

(assert (=> b!735694 m!688011))

(declare-fun m!688013 () Bool)

(assert (=> b!735690 m!688013))

(assert (=> b!735683 m!688001))

(assert (=> b!735683 m!688001))

(declare-fun m!688015 () Bool)

(assert (=> b!735683 m!688015))

(assert (=> b!735683 m!688001))

(assert (=> b!735683 m!688003))

(declare-fun m!688017 () Bool)

(assert (=> start!65136 m!688017))

(declare-fun m!688019 () Bool)

(assert (=> start!65136 m!688019))

(assert (=> b!735685 m!688001))

(assert (=> b!735685 m!688001))

(declare-fun m!688021 () Bool)

(assert (=> b!735685 m!688021))

(assert (=> b!735685 m!688021))

(assert (=> b!735685 m!688001))

(declare-fun m!688023 () Bool)

(assert (=> b!735685 m!688023))

(assert (=> b!735677 m!688001))

(assert (=> b!735677 m!688001))

(declare-fun m!688025 () Bool)

(assert (=> b!735677 m!688025))

(assert (=> b!735687 m!688001))

(assert (=> b!735687 m!688001))

(declare-fun m!688027 () Bool)

(assert (=> b!735687 m!688027))

(assert (=> b!735682 m!688001))

(assert (=> b!735682 m!688001))

(assert (=> b!735682 m!688015))

(assert (=> b!735696 m!688001))

(assert (=> b!735696 m!688001))

(declare-fun m!688029 () Bool)

(assert (=> b!735696 m!688029))

(declare-fun m!688031 () Bool)

(assert (=> b!735698 m!688031))

(declare-fun m!688033 () Bool)

(assert (=> b!735678 m!688033))

(declare-fun m!688035 () Bool)

(assert (=> b!735678 m!688035))

(declare-fun m!688037 () Bool)

(assert (=> b!735678 m!688037))

(declare-fun m!688039 () Bool)

(assert (=> b!735678 m!688039))

(declare-fun m!688041 () Bool)

(assert (=> b!735678 m!688041))

(assert (=> b!735678 m!688039))

(assert (=> b!735684 m!688001))

(assert (=> b!735684 m!688001))

(assert (=> b!735684 m!688029))

(declare-fun m!688043 () Bool)

(assert (=> b!735697 m!688043))

(assert (=> b!735686 m!688001))

(assert (=> b!735686 m!688001))

(declare-fun m!688045 () Bool)

(assert (=> b!735686 m!688045))

(declare-fun m!688047 () Bool)

(assert (=> b!735695 m!688047))

(assert (=> b!735679 m!688001))

(assert (=> b!735679 m!688001))

(declare-fun m!688049 () Bool)

(assert (=> b!735679 m!688049))

(check-sat (not b!735683) (not b!735678) (not b!735682) (not b!735688) (not b!735684) (not b!735687) (not b!735699) (not b!735679) (not b!735695) (not b!735681) (not b!735686) (not start!65136) (not b!735694) (not b!735680) (not b!735698) (not b!735677) (not b!735690) (not b!735691) (not b!735696) (not b!735685))
(check-sat)
