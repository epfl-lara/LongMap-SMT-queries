; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67142 () Bool)

(assert start!67142)

(declare-fun b!776184 () Bool)

(declare-fun res!525129 () Bool)

(declare-fun e!431914 () Bool)

(assert (=> b!776184 (=> (not res!525129) (not e!431914))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42516 0))(
  ( (array!42517 (arr!20354 (Array (_ BitVec 32) (_ BitVec 64))) (size!20775 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42516)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!776184 (= res!525129 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20354 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!776185 () Bool)

(declare-fun res!525128 () Bool)

(declare-fun e!431917 () Bool)

(assert (=> b!776185 (=> (not res!525128) (not e!431917))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42516 (_ BitVec 32)) Bool)

(assert (=> b!776185 (= res!525128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!525134 () Bool)

(declare-fun e!431911 () Bool)

(assert (=> start!67142 (=> (not res!525134) (not e!431911))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67142 (= res!525134 (validMask!0 mask!3328))))

(assert (=> start!67142 e!431911))

(assert (=> start!67142 true))

(declare-fun array_inv!16237 (array!42516) Bool)

(assert (=> start!67142 (array_inv!16237 a!3186)))

(declare-fun b!776186 () Bool)

(declare-fun res!525131 () Bool)

(assert (=> b!776186 (=> (not res!525131) (not e!431911))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!776186 (= res!525131 (and (= (size!20775 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20775 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20775 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!776187 () Bool)

(declare-fun res!525139 () Bool)

(assert (=> b!776187 (=> (not res!525139) (not e!431911))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!776187 (= res!525139 (validKeyInArray!0 (select (arr!20354 a!3186) j!159)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!776188 () Bool)

(declare-fun e!431913 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7951 0))(
  ( (MissingZero!7951 (index!34172 (_ BitVec 32))) (Found!7951 (index!34173 (_ BitVec 32))) (Intermediate!7951 (undefined!8763 Bool) (index!34174 (_ BitVec 32)) (x!65121 (_ BitVec 32))) (Undefined!7951) (MissingVacant!7951 (index!34175 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42516 (_ BitVec 32)) SeekEntryResult!7951)

(assert (=> b!776188 (= e!431913 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20354 a!3186) j!159) a!3186 mask!3328) (Found!7951 j!159)))))

(declare-fun e!431915 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!776189 () Bool)

(declare-fun lt!345684 () SeekEntryResult!7951)

(assert (=> b!776189 (= e!431915 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20354 a!3186) j!159) a!3186 mask!3328) lt!345684))))

(declare-fun b!776190 () Bool)

(assert (=> b!776190 (= e!431917 e!431914)))

(declare-fun res!525127 () Bool)

(assert (=> b!776190 (=> (not res!525127) (not e!431914))))

(declare-fun lt!345685 () SeekEntryResult!7951)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42516 (_ BitVec 32)) SeekEntryResult!7951)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!776190 (= res!525127 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20354 a!3186) j!159) mask!3328) (select (arr!20354 a!3186) j!159) a!3186 mask!3328) lt!345685))))

(assert (=> b!776190 (= lt!345685 (Intermediate!7951 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!776191 () Bool)

(declare-fun res!525132 () Bool)

(assert (=> b!776191 (=> (not res!525132) (not e!431911))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!776191 (= res!525132 (validKeyInArray!0 k0!2102))))

(declare-fun b!776192 () Bool)

(declare-fun e!431912 () Bool)

(assert (=> b!776192 (= e!431912 true)))

(declare-fun lt!345681 () SeekEntryResult!7951)

(assert (=> b!776192 (= lt!345681 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20354 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!776193 () Bool)

(declare-fun res!525133 () Bool)

(assert (=> b!776193 (=> (not res!525133) (not e!431917))))

(declare-datatypes ((List!14395 0))(
  ( (Nil!14392) (Cons!14391 (h!15499 (_ BitVec 64)) (t!20701 List!14395)) )
))
(declare-fun arrayNoDuplicates!0 (array!42516 (_ BitVec 32) List!14395) Bool)

(assert (=> b!776193 (= res!525133 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14392))))

(declare-fun b!776194 () Bool)

(assert (=> b!776194 (= e!431913 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20354 a!3186) j!159) a!3186 mask!3328) lt!345685))))

(declare-fun b!776195 () Bool)

(assert (=> b!776195 (= e!431911 e!431917)))

(declare-fun res!525136 () Bool)

(assert (=> b!776195 (=> (not res!525136) (not e!431917))))

(declare-fun lt!345683 () SeekEntryResult!7951)

(assert (=> b!776195 (= res!525136 (or (= lt!345683 (MissingZero!7951 i!1173)) (= lt!345683 (MissingVacant!7951 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42516 (_ BitVec 32)) SeekEntryResult!7951)

(assert (=> b!776195 (= lt!345683 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!776196 () Bool)

(declare-fun res!525137 () Bool)

(assert (=> b!776196 (=> (not res!525137) (not e!431911))))

(declare-fun arrayContainsKey!0 (array!42516 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!776196 (= res!525137 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!776197 () Bool)

(declare-fun res!525141 () Bool)

(assert (=> b!776197 (=> (not res!525141) (not e!431914))))

(assert (=> b!776197 (= res!525141 e!431913)))

(declare-fun c!85929 () Bool)

(assert (=> b!776197 (= c!85929 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!776198 () Bool)

(declare-fun res!525140 () Bool)

(assert (=> b!776198 (=> (not res!525140) (not e!431917))))

(assert (=> b!776198 (= res!525140 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20775 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20775 a!3186))))))

(declare-fun b!776199 () Bool)

(declare-fun e!431910 () Bool)

(assert (=> b!776199 (= e!431914 e!431910)))

(declare-fun res!525126 () Bool)

(assert (=> b!776199 (=> (not res!525126) (not e!431910))))

(declare-fun lt!345682 () SeekEntryResult!7951)

(declare-fun lt!345686 () SeekEntryResult!7951)

(assert (=> b!776199 (= res!525126 (= lt!345682 lt!345686))))

(declare-fun lt!345679 () (_ BitVec 64))

(declare-fun lt!345680 () array!42516)

(assert (=> b!776199 (= lt!345686 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345679 lt!345680 mask!3328))))

(assert (=> b!776199 (= lt!345682 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345679 mask!3328) lt!345679 lt!345680 mask!3328))))

(assert (=> b!776199 (= lt!345679 (select (store (arr!20354 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!776199 (= lt!345680 (array!42517 (store (arr!20354 a!3186) i!1173 k0!2102) (size!20775 a!3186)))))

(declare-fun b!776200 () Bool)

(declare-fun e!431916 () Bool)

(assert (=> b!776200 (= e!431916 e!431915)))

(declare-fun res!525138 () Bool)

(assert (=> b!776200 (=> (not res!525138) (not e!431915))))

(assert (=> b!776200 (= res!525138 (= (seekEntryOrOpen!0 (select (arr!20354 a!3186) j!159) a!3186 mask!3328) lt!345684))))

(assert (=> b!776200 (= lt!345684 (Found!7951 j!159))))

(declare-fun b!776201 () Bool)

(assert (=> b!776201 (= e!431910 (not e!431912))))

(declare-fun res!525130 () Bool)

(assert (=> b!776201 (=> res!525130 e!431912)))

(get-info :version)

(assert (=> b!776201 (= res!525130 (or (not ((_ is Intermediate!7951) lt!345686)) (bvslt x!1131 (x!65121 lt!345686)) (not (= x!1131 (x!65121 lt!345686))) (not (= index!1321 (index!34174 lt!345686)))))))

(assert (=> b!776201 e!431916))

(declare-fun res!525135 () Bool)

(assert (=> b!776201 (=> (not res!525135) (not e!431916))))

(assert (=> b!776201 (= res!525135 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26768 0))(
  ( (Unit!26769) )
))
(declare-fun lt!345678 () Unit!26768)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42516 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26768)

(assert (=> b!776201 (= lt!345678 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!67142 res!525134) b!776186))

(assert (= (and b!776186 res!525131) b!776187))

(assert (= (and b!776187 res!525139) b!776191))

(assert (= (and b!776191 res!525132) b!776196))

(assert (= (and b!776196 res!525137) b!776195))

(assert (= (and b!776195 res!525136) b!776185))

(assert (= (and b!776185 res!525128) b!776193))

(assert (= (and b!776193 res!525133) b!776198))

(assert (= (and b!776198 res!525140) b!776190))

(assert (= (and b!776190 res!525127) b!776184))

(assert (= (and b!776184 res!525129) b!776197))

(assert (= (and b!776197 c!85929) b!776194))

(assert (= (and b!776197 (not c!85929)) b!776188))

(assert (= (and b!776197 res!525141) b!776199))

(assert (= (and b!776199 res!525126) b!776201))

(assert (= (and b!776201 res!525135) b!776200))

(assert (= (and b!776200 res!525138) b!776189))

(assert (= (and b!776201 (not res!525130)) b!776192))

(declare-fun m!719757 () Bool)

(assert (=> b!776195 m!719757))

(declare-fun m!719759 () Bool)

(assert (=> b!776192 m!719759))

(assert (=> b!776192 m!719759))

(declare-fun m!719761 () Bool)

(assert (=> b!776192 m!719761))

(declare-fun m!719763 () Bool)

(assert (=> b!776201 m!719763))

(declare-fun m!719765 () Bool)

(assert (=> b!776201 m!719765))

(declare-fun m!719767 () Bool)

(assert (=> b!776191 m!719767))

(assert (=> b!776188 m!719759))

(assert (=> b!776188 m!719759))

(assert (=> b!776188 m!719761))

(declare-fun m!719769 () Bool)

(assert (=> start!67142 m!719769))

(declare-fun m!719771 () Bool)

(assert (=> start!67142 m!719771))

(declare-fun m!719773 () Bool)

(assert (=> b!776184 m!719773))

(declare-fun m!719775 () Bool)

(assert (=> b!776185 m!719775))

(assert (=> b!776187 m!719759))

(assert (=> b!776187 m!719759))

(declare-fun m!719777 () Bool)

(assert (=> b!776187 m!719777))

(assert (=> b!776194 m!719759))

(assert (=> b!776194 m!719759))

(declare-fun m!719779 () Bool)

(assert (=> b!776194 m!719779))

(assert (=> b!776189 m!719759))

(assert (=> b!776189 m!719759))

(declare-fun m!719781 () Bool)

(assert (=> b!776189 m!719781))

(assert (=> b!776190 m!719759))

(assert (=> b!776190 m!719759))

(declare-fun m!719783 () Bool)

(assert (=> b!776190 m!719783))

(assert (=> b!776190 m!719783))

(assert (=> b!776190 m!719759))

(declare-fun m!719785 () Bool)

(assert (=> b!776190 m!719785))

(declare-fun m!719787 () Bool)

(assert (=> b!776196 m!719787))

(declare-fun m!719789 () Bool)

(assert (=> b!776199 m!719789))

(declare-fun m!719791 () Bool)

(assert (=> b!776199 m!719791))

(declare-fun m!719793 () Bool)

(assert (=> b!776199 m!719793))

(declare-fun m!719795 () Bool)

(assert (=> b!776199 m!719795))

(declare-fun m!719797 () Bool)

(assert (=> b!776199 m!719797))

(assert (=> b!776199 m!719795))

(declare-fun m!719799 () Bool)

(assert (=> b!776193 m!719799))

(assert (=> b!776200 m!719759))

(assert (=> b!776200 m!719759))

(declare-fun m!719801 () Bool)

(assert (=> b!776200 m!719801))

(check-sat (not start!67142) (not b!776193) (not b!776200) (not b!776187) (not b!776191) (not b!776199) (not b!776195) (not b!776201) (not b!776189) (not b!776188) (not b!776196) (not b!776190) (not b!776192) (not b!776194) (not b!776185))
(check-sat)
