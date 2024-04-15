; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66980 () Bool)

(assert start!66980)

(declare-fun b!772810 () Bool)

(declare-fun e!430206 () Bool)

(declare-fun e!430205 () Bool)

(assert (=> b!772810 (= e!430206 e!430205)))

(declare-fun res!522670 () Bool)

(assert (=> b!772810 (=> (not res!522670) (not e!430205))))

(declare-datatypes ((SeekEntryResult!7906 0))(
  ( (MissingZero!7906 (index!33992 (_ BitVec 32))) (Found!7906 (index!33993 (_ BitVec 32))) (Intermediate!7906 (undefined!8718 Bool) (index!33994 (_ BitVec 32)) (x!64944 (_ BitVec 32))) (Undefined!7906) (MissingVacant!7906 (index!33995 (_ BitVec 32))) )
))
(declare-fun lt!343966 () SeekEntryResult!7906)

(declare-fun lt!343968 () SeekEntryResult!7906)

(assert (=> b!772810 (= res!522670 (= lt!343966 lt!343968))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((array!42423 0))(
  ( (array!42424 (arr!20309 (Array (_ BitVec 32) (_ BitVec 64))) (size!20730 (_ BitVec 32))) )
))
(declare-fun lt!343963 () array!42423)

(declare-fun lt!343964 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42423 (_ BitVec 32)) SeekEntryResult!7906)

(assert (=> b!772810 (= lt!343968 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343964 lt!343963 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!772810 (= lt!343966 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343964 mask!3328) lt!343964 lt!343963 mask!3328))))

(declare-fun a!3186 () array!42423)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!772810 (= lt!343964 (select (store (arr!20309 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!772810 (= lt!343963 (array!42424 (store (arr!20309 a!3186) i!1173 k0!2102) (size!20730 a!3186)))))

(declare-fun b!772811 () Bool)

(declare-fun res!522677 () Bool)

(declare-fun e!430198 () Bool)

(assert (=> b!772811 (=> (not res!522677) (not e!430198))))

(declare-fun arrayContainsKey!0 (array!42423 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!772811 (= res!522677 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!772812 () Bool)

(declare-fun res!522679 () Bool)

(assert (=> b!772812 (=> (not res!522679) (not e!430198))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!772812 (= res!522679 (validKeyInArray!0 (select (arr!20309 a!3186) j!159)))))

(declare-fun b!772814 () Bool)

(declare-fun res!522680 () Bool)

(assert (=> b!772814 (=> (not res!522680) (not e!430198))))

(assert (=> b!772814 (= res!522680 (validKeyInArray!0 k0!2102))))

(declare-fun b!772815 () Bool)

(declare-fun e!430200 () Bool)

(declare-fun lt!343965 () SeekEntryResult!7906)

(assert (=> b!772815 (= e!430200 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20309 a!3186) j!159) a!3186 mask!3328) lt!343965))))

(declare-fun lt!343970 () SeekEntryResult!7906)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!430201 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!772816 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42423 (_ BitVec 32)) SeekEntryResult!7906)

(assert (=> b!772816 (= e!430201 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20309 a!3186) j!159) a!3186 mask!3328) lt!343970))))

(declare-fun b!772817 () Bool)

(declare-fun res!522674 () Bool)

(declare-fun e!430199 () Bool)

(assert (=> b!772817 (=> (not res!522674) (not e!430199))))

(declare-datatypes ((List!14350 0))(
  ( (Nil!14347) (Cons!14346 (h!15451 (_ BitVec 64)) (t!20656 List!14350)) )
))
(declare-fun arrayNoDuplicates!0 (array!42423 (_ BitVec 32) List!14350) Bool)

(assert (=> b!772817 (= res!522674 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14347))))

(declare-fun b!772818 () Bool)

(declare-fun e!430202 () Bool)

(assert (=> b!772818 (= e!430202 true)))

(declare-datatypes ((Unit!26618 0))(
  ( (Unit!26619) )
))
(declare-fun lt!343969 () Unit!26618)

(declare-fun e!430203 () Unit!26618)

(assert (=> b!772818 (= lt!343969 e!430203)))

(declare-fun c!85469 () Bool)

(assert (=> b!772818 (= c!85469 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!343961 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!772818 (= lt!343961 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!772819 () Bool)

(declare-fun res!522676 () Bool)

(assert (=> b!772819 (=> (not res!522676) (not e!430199))))

(assert (=> b!772819 (= res!522676 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20730 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20730 a!3186))))))

(declare-fun b!772813 () Bool)

(declare-fun res!522673 () Bool)

(assert (=> b!772813 (=> (not res!522673) (not e!430199))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42423 (_ BitVec 32)) Bool)

(assert (=> b!772813 (= res!522673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!522671 () Bool)

(assert (=> start!66980 (=> (not res!522671) (not e!430198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66980 (= res!522671 (validMask!0 mask!3328))))

(assert (=> start!66980 e!430198))

(assert (=> start!66980 true))

(declare-fun array_inv!16192 (array!42423) Bool)

(assert (=> start!66980 (array_inv!16192 a!3186)))

(declare-fun b!772820 () Bool)

(assert (=> b!772820 (= e!430205 (not e!430202))))

(declare-fun res!522684 () Bool)

(assert (=> b!772820 (=> res!522684 e!430202)))

(get-info :version)

(assert (=> b!772820 (= res!522684 (or (not ((_ is Intermediate!7906) lt!343968)) (bvsge x!1131 (x!64944 lt!343968))))))

(declare-fun e!430204 () Bool)

(assert (=> b!772820 e!430204))

(declare-fun res!522683 () Bool)

(assert (=> b!772820 (=> (not res!522683) (not e!430204))))

(assert (=> b!772820 (= res!522683 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!343960 () Unit!26618)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42423 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26618)

(assert (=> b!772820 (= lt!343960 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!772821 () Bool)

(assert (=> b!772821 (= e!430199 e!430206)))

(declare-fun res!522669 () Bool)

(assert (=> b!772821 (=> (not res!522669) (not e!430206))))

(assert (=> b!772821 (= res!522669 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20309 a!3186) j!159) mask!3328) (select (arr!20309 a!3186) j!159) a!3186 mask!3328) lt!343965))))

(assert (=> b!772821 (= lt!343965 (Intermediate!7906 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!772822 () Bool)

(assert (=> b!772822 (= e!430198 e!430199)))

(declare-fun res!522675 () Bool)

(assert (=> b!772822 (=> (not res!522675) (not e!430199))))

(declare-fun lt!343967 () SeekEntryResult!7906)

(assert (=> b!772822 (= res!522675 (or (= lt!343967 (MissingZero!7906 i!1173)) (= lt!343967 (MissingVacant!7906 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42423 (_ BitVec 32)) SeekEntryResult!7906)

(assert (=> b!772822 (= lt!343967 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!772823 () Bool)

(declare-fun res!522678 () Bool)

(assert (=> b!772823 (=> (not res!522678) (not e!430198))))

(assert (=> b!772823 (= res!522678 (and (= (size!20730 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20730 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20730 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!772824 () Bool)

(declare-fun Unit!26620 () Unit!26618)

(assert (=> b!772824 (= e!430203 Unit!26620)))

(assert (=> b!772824 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343961 (select (arr!20309 a!3186) j!159) a!3186 mask!3328) lt!343965)))

(declare-fun b!772825 () Bool)

(assert (=> b!772825 (= e!430200 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20309 a!3186) j!159) a!3186 mask!3328) (Found!7906 j!159)))))

(declare-fun b!772826 () Bool)

(declare-fun res!522681 () Bool)

(assert (=> b!772826 (=> (not res!522681) (not e!430206))))

(assert (=> b!772826 (= res!522681 e!430200)))

(declare-fun c!85470 () Bool)

(assert (=> b!772826 (= c!85470 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!772827 () Bool)

(declare-fun Unit!26621 () Unit!26618)

(assert (=> b!772827 (= e!430203 Unit!26621)))

(declare-fun lt!343962 () SeekEntryResult!7906)

(assert (=> b!772827 (= lt!343962 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20309 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!772827 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343961 resIntermediateIndex!5 (select (arr!20309 a!3186) j!159) a!3186 mask!3328) (Found!7906 j!159))))

(declare-fun b!772828 () Bool)

(declare-fun res!522672 () Bool)

(assert (=> b!772828 (=> (not res!522672) (not e!430206))))

(assert (=> b!772828 (= res!522672 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20309 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!772829 () Bool)

(assert (=> b!772829 (= e!430204 e!430201)))

(declare-fun res!522682 () Bool)

(assert (=> b!772829 (=> (not res!522682) (not e!430201))))

(assert (=> b!772829 (= res!522682 (= (seekEntryOrOpen!0 (select (arr!20309 a!3186) j!159) a!3186 mask!3328) lt!343970))))

(assert (=> b!772829 (= lt!343970 (Found!7906 j!159))))

(assert (= (and start!66980 res!522671) b!772823))

(assert (= (and b!772823 res!522678) b!772812))

(assert (= (and b!772812 res!522679) b!772814))

(assert (= (and b!772814 res!522680) b!772811))

(assert (= (and b!772811 res!522677) b!772822))

(assert (= (and b!772822 res!522675) b!772813))

(assert (= (and b!772813 res!522673) b!772817))

(assert (= (and b!772817 res!522674) b!772819))

(assert (= (and b!772819 res!522676) b!772821))

(assert (= (and b!772821 res!522669) b!772828))

(assert (= (and b!772828 res!522672) b!772826))

(assert (= (and b!772826 c!85470) b!772815))

(assert (= (and b!772826 (not c!85470)) b!772825))

(assert (= (and b!772826 res!522681) b!772810))

(assert (= (and b!772810 res!522670) b!772820))

(assert (= (and b!772820 res!522683) b!772829))

(assert (= (and b!772829 res!522682) b!772816))

(assert (= (and b!772820 (not res!522684)) b!772818))

(assert (= (and b!772818 c!85469) b!772824))

(assert (= (and b!772818 (not c!85469)) b!772827))

(declare-fun m!717081 () Bool)

(assert (=> b!772812 m!717081))

(assert (=> b!772812 m!717081))

(declare-fun m!717083 () Bool)

(assert (=> b!772812 m!717083))

(declare-fun m!717085 () Bool)

(assert (=> b!772814 m!717085))

(assert (=> b!772815 m!717081))

(assert (=> b!772815 m!717081))

(declare-fun m!717087 () Bool)

(assert (=> b!772815 m!717087))

(assert (=> b!772816 m!717081))

(assert (=> b!772816 m!717081))

(declare-fun m!717089 () Bool)

(assert (=> b!772816 m!717089))

(declare-fun m!717091 () Bool)

(assert (=> b!772811 m!717091))

(declare-fun m!717093 () Bool)

(assert (=> b!772813 m!717093))

(declare-fun m!717095 () Bool)

(assert (=> b!772820 m!717095))

(declare-fun m!717097 () Bool)

(assert (=> b!772820 m!717097))

(declare-fun m!717099 () Bool)

(assert (=> b!772828 m!717099))

(assert (=> b!772827 m!717081))

(assert (=> b!772827 m!717081))

(declare-fun m!717101 () Bool)

(assert (=> b!772827 m!717101))

(assert (=> b!772827 m!717081))

(declare-fun m!717103 () Bool)

(assert (=> b!772827 m!717103))

(assert (=> b!772821 m!717081))

(assert (=> b!772821 m!717081))

(declare-fun m!717105 () Bool)

(assert (=> b!772821 m!717105))

(assert (=> b!772821 m!717105))

(assert (=> b!772821 m!717081))

(declare-fun m!717107 () Bool)

(assert (=> b!772821 m!717107))

(declare-fun m!717109 () Bool)

(assert (=> b!772817 m!717109))

(assert (=> b!772824 m!717081))

(assert (=> b!772824 m!717081))

(declare-fun m!717111 () Bool)

(assert (=> b!772824 m!717111))

(assert (=> b!772825 m!717081))

(assert (=> b!772825 m!717081))

(assert (=> b!772825 m!717101))

(declare-fun m!717113 () Bool)

(assert (=> b!772822 m!717113))

(declare-fun m!717115 () Bool)

(assert (=> start!66980 m!717115))

(declare-fun m!717117 () Bool)

(assert (=> start!66980 m!717117))

(assert (=> b!772829 m!717081))

(assert (=> b!772829 m!717081))

(declare-fun m!717119 () Bool)

(assert (=> b!772829 m!717119))

(declare-fun m!717121 () Bool)

(assert (=> b!772818 m!717121))

(declare-fun m!717123 () Bool)

(assert (=> b!772810 m!717123))

(declare-fun m!717125 () Bool)

(assert (=> b!772810 m!717125))

(declare-fun m!717127 () Bool)

(assert (=> b!772810 m!717127))

(declare-fun m!717129 () Bool)

(assert (=> b!772810 m!717129))

(assert (=> b!772810 m!717129))

(declare-fun m!717131 () Bool)

(assert (=> b!772810 m!717131))

(check-sat (not b!772816) (not b!772810) (not b!772817) (not b!772820) (not b!772812) (not start!66980) (not b!772827) (not b!772814) (not b!772821) (not b!772825) (not b!772824) (not b!772815) (not b!772813) (not b!772822) (not b!772818) (not b!772829) (not b!772811))
(check-sat)
