; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67110 () Bool)

(assert start!67110)

(declare-datatypes ((array!42465 0))(
  ( (array!42466 (arr!20328 (Array (_ BitVec 32) (_ BitVec 64))) (size!20749 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42465)

(declare-datatypes ((SeekEntryResult!7928 0))(
  ( (MissingZero!7928 (index!34080 (_ BitVec 32))) (Found!7928 (index!34081 (_ BitVec 32))) (Intermediate!7928 (undefined!8740 Bool) (index!34082 (_ BitVec 32)) (x!65031 (_ BitVec 32))) (Undefined!7928) (MissingVacant!7928 (index!34083 (_ BitVec 32))) )
))
(declare-fun lt!345050 () SeekEntryResult!7928)

(declare-fun e!431244 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!345051 () (_ BitVec 32))

(declare-fun b!774747 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42465 (_ BitVec 32)) SeekEntryResult!7928)

(assert (=> b!774747 (= e!431244 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345051 (select (arr!20328 a!3186) j!159) a!3186 mask!3328) lt!345050)))))

(declare-fun b!774748 () Bool)

(declare-fun e!431242 () Bool)

(declare-fun e!431246 () Bool)

(assert (=> b!774748 (= e!431242 e!431246)))

(declare-fun res!523862 () Bool)

(assert (=> b!774748 (=> (not res!523862) (not e!431246))))

(declare-fun lt!345056 () SeekEntryResult!7928)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42465 (_ BitVec 32)) SeekEntryResult!7928)

(assert (=> b!774748 (= res!523862 (= (seekEntryOrOpen!0 (select (arr!20328 a!3186) j!159) a!3186 mask!3328) lt!345056))))

(assert (=> b!774748 (= lt!345056 (Found!7928 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!774750 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42465 (_ BitVec 32)) SeekEntryResult!7928)

(assert (=> b!774750 (= e!431246 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20328 a!3186) j!159) a!3186 mask!3328) lt!345056))))

(declare-fun b!774751 () Bool)

(declare-fun e!431243 () Bool)

(declare-fun e!431249 () Bool)

(assert (=> b!774751 (= e!431243 e!431249)))

(declare-fun res!523847 () Bool)

(assert (=> b!774751 (=> res!523847 e!431249)))

(assert (=> b!774751 (= res!523847 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!345051 #b00000000000000000000000000000000) (bvsge lt!345051 (size!20749 a!3186))))))

(declare-datatypes ((Unit!26726 0))(
  ( (Unit!26727) )
))
(declare-fun lt!345059 () Unit!26726)

(declare-fun e!431250 () Unit!26726)

(assert (=> b!774751 (= lt!345059 e!431250)))

(declare-fun c!85850 () Bool)

(declare-fun lt!345047 () Bool)

(assert (=> b!774751 (= c!85850 lt!345047)))

(assert (=> b!774751 (= lt!345047 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!774751 (= lt!345051 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!774752 () Bool)

(declare-fun res!523858 () Bool)

(declare-fun e!431248 () Bool)

(assert (=> b!774752 (=> (not res!523858) (not e!431248))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!774752 (= res!523858 (validKeyInArray!0 (select (arr!20328 a!3186) j!159)))))

(declare-fun b!774753 () Bool)

(declare-fun lt!345046 () SeekEntryResult!7928)

(assert (=> b!774753 (= e!431244 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345051 resIntermediateIndex!5 (select (arr!20328 a!3186) j!159) a!3186 mask!3328) lt!345046)))))

(declare-fun b!774754 () Bool)

(declare-fun res!523850 () Bool)

(assert (=> b!774754 (=> (not res!523850) (not e!431248))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!774754 (= res!523850 (validKeyInArray!0 k!2102))))

(declare-fun b!774755 () Bool)

(declare-fun res!523860 () Bool)

(declare-fun e!431247 () Bool)

(assert (=> b!774755 (=> (not res!523860) (not e!431247))))

(declare-fun e!431251 () Bool)

(assert (=> b!774755 (= res!523860 e!431251)))

(declare-fun c!85852 () Bool)

(assert (=> b!774755 (= c!85852 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!774756 () Bool)

(declare-fun res!523857 () Bool)

(assert (=> b!774756 (=> (not res!523857) (not e!431248))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!774756 (= res!523857 (and (= (size!20749 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20749 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20749 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!774757 () Bool)

(declare-fun res!523855 () Bool)

(assert (=> b!774757 (=> res!523855 e!431249)))

(declare-fun lt!345054 () array!42465)

(declare-fun lt!345057 () SeekEntryResult!7928)

(declare-fun lt!345048 () (_ BitVec 64))

(assert (=> b!774757 (= res!523855 (not (= lt!345057 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345051 lt!345048 lt!345054 mask!3328))))))

(declare-fun b!774758 () Bool)

(declare-fun Unit!26728 () Unit!26726)

(assert (=> b!774758 (= e!431250 Unit!26728)))

(assert (=> b!774758 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345051 (select (arr!20328 a!3186) j!159) a!3186 mask!3328) lt!345050)))

(declare-fun b!774759 () Bool)

(assert (=> b!774759 (= e!431251 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20328 a!3186) j!159) a!3186 mask!3328) (Found!7928 j!159)))))

(declare-fun res!523863 () Bool)

(assert (=> start!67110 (=> (not res!523863) (not e!431248))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67110 (= res!523863 (validMask!0 mask!3328))))

(assert (=> start!67110 e!431248))

(assert (=> start!67110 true))

(declare-fun array_inv!16124 (array!42465) Bool)

(assert (=> start!67110 (array_inv!16124 a!3186)))

(declare-fun b!774749 () Bool)

(declare-fun e!431241 () Bool)

(assert (=> b!774749 (= e!431248 e!431241)))

(declare-fun res!523854 () Bool)

(assert (=> b!774749 (=> (not res!523854) (not e!431241))))

(declare-fun lt!345053 () SeekEntryResult!7928)

(assert (=> b!774749 (= res!523854 (or (= lt!345053 (MissingZero!7928 i!1173)) (= lt!345053 (MissingVacant!7928 i!1173))))))

(assert (=> b!774749 (= lt!345053 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!774760 () Bool)

(declare-fun res!523856 () Bool)

(assert (=> b!774760 (=> res!523856 e!431249)))

(assert (=> b!774760 (= res!523856 e!431244)))

(declare-fun c!85851 () Bool)

(assert (=> b!774760 (= c!85851 lt!345047)))

(declare-fun b!774761 () Bool)

(declare-fun res!523852 () Bool)

(assert (=> b!774761 (=> (not res!523852) (not e!431241))))

(assert (=> b!774761 (= res!523852 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20749 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20749 a!3186))))))

(declare-fun b!774762 () Bool)

(declare-fun res!523849 () Bool)

(assert (=> b!774762 (=> (not res!523849) (not e!431241))))

(declare-datatypes ((List!14330 0))(
  ( (Nil!14327) (Cons!14326 (h!15434 (_ BitVec 64)) (t!20645 List!14330)) )
))
(declare-fun arrayNoDuplicates!0 (array!42465 (_ BitVec 32) List!14330) Bool)

(assert (=> b!774762 (= res!523849 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14327))))

(declare-fun b!774763 () Bool)

(declare-fun e!431252 () Bool)

(assert (=> b!774763 (= e!431247 e!431252)))

(declare-fun res!523848 () Bool)

(assert (=> b!774763 (=> (not res!523848) (not e!431252))))

(declare-fun lt!345049 () SeekEntryResult!7928)

(assert (=> b!774763 (= res!523848 (= lt!345057 lt!345049))))

(assert (=> b!774763 (= lt!345049 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345048 lt!345054 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!774763 (= lt!345057 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345048 mask!3328) lt!345048 lt!345054 mask!3328))))

(assert (=> b!774763 (= lt!345048 (select (store (arr!20328 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!774763 (= lt!345054 (array!42466 (store (arr!20328 a!3186) i!1173 k!2102) (size!20749 a!3186)))))

(declare-fun b!774764 () Bool)

(assert (=> b!774764 (= e!431241 e!431247)))

(declare-fun res!523859 () Bool)

(assert (=> b!774764 (=> (not res!523859) (not e!431247))))

(assert (=> b!774764 (= res!523859 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20328 a!3186) j!159) mask!3328) (select (arr!20328 a!3186) j!159) a!3186 mask!3328) lt!345050))))

(assert (=> b!774764 (= lt!345050 (Intermediate!7928 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!774765 () Bool)

(assert (=> b!774765 (= e!431249 true)))

(assert (=> b!774765 (= (seekEntryOrOpen!0 lt!345048 lt!345054 mask!3328) lt!345046)))

(declare-fun lt!345052 () Unit!26726)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!42465 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26726)

(assert (=> b!774765 (= lt!345052 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k!2102 j!159 lt!345051 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun b!774766 () Bool)

(declare-fun res!523861 () Bool)

(assert (=> b!774766 (=> (not res!523861) (not e!431241))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42465 (_ BitVec 32)) Bool)

(assert (=> b!774766 (= res!523861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!774767 () Bool)

(assert (=> b!774767 (= e!431252 (not e!431243))))

(declare-fun res!523865 () Bool)

(assert (=> b!774767 (=> res!523865 e!431243)))

(assert (=> b!774767 (= res!523865 (or (not (is-Intermediate!7928 lt!345049)) (bvsge x!1131 (x!65031 lt!345049))))))

(assert (=> b!774767 (= lt!345046 (Found!7928 j!159))))

(assert (=> b!774767 e!431242))

(declare-fun res!523853 () Bool)

(assert (=> b!774767 (=> (not res!523853) (not e!431242))))

(assert (=> b!774767 (= res!523853 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!345055 () Unit!26726)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42465 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26726)

(assert (=> b!774767 (= lt!345055 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!774768 () Bool)

(assert (=> b!774768 (= e!431251 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20328 a!3186) j!159) a!3186 mask!3328) lt!345050))))

(declare-fun b!774769 () Bool)

(declare-fun res!523851 () Bool)

(assert (=> b!774769 (=> (not res!523851) (not e!431248))))

(declare-fun arrayContainsKey!0 (array!42465 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!774769 (= res!523851 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!774770 () Bool)

(declare-fun Unit!26729 () Unit!26726)

(assert (=> b!774770 (= e!431250 Unit!26729)))

(declare-fun lt!345058 () SeekEntryResult!7928)

(assert (=> b!774770 (= lt!345058 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20328 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!774770 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345051 resIntermediateIndex!5 (select (arr!20328 a!3186) j!159) a!3186 mask!3328) lt!345046)))

(declare-fun b!774771 () Bool)

(declare-fun res!523864 () Bool)

(assert (=> b!774771 (=> (not res!523864) (not e!431247))))

(assert (=> b!774771 (= res!523864 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20328 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!67110 res!523863) b!774756))

(assert (= (and b!774756 res!523857) b!774752))

(assert (= (and b!774752 res!523858) b!774754))

(assert (= (and b!774754 res!523850) b!774769))

(assert (= (and b!774769 res!523851) b!774749))

(assert (= (and b!774749 res!523854) b!774766))

(assert (= (and b!774766 res!523861) b!774762))

(assert (= (and b!774762 res!523849) b!774761))

(assert (= (and b!774761 res!523852) b!774764))

(assert (= (and b!774764 res!523859) b!774771))

(assert (= (and b!774771 res!523864) b!774755))

(assert (= (and b!774755 c!85852) b!774768))

(assert (= (and b!774755 (not c!85852)) b!774759))

(assert (= (and b!774755 res!523860) b!774763))

(assert (= (and b!774763 res!523848) b!774767))

(assert (= (and b!774767 res!523853) b!774748))

(assert (= (and b!774748 res!523862) b!774750))

(assert (= (and b!774767 (not res!523865)) b!774751))

(assert (= (and b!774751 c!85850) b!774758))

(assert (= (and b!774751 (not c!85850)) b!774770))

(assert (= (and b!774751 (not res!523847)) b!774760))

(assert (= (and b!774760 c!85851) b!774747))

(assert (= (and b!774760 (not c!85851)) b!774753))

(assert (= (and b!774760 (not res!523856)) b!774757))

(assert (= (and b!774757 (not res!523855)) b!774765))

(declare-fun m!719129 () Bool)

(assert (=> b!774771 m!719129))

(declare-fun m!719131 () Bool)

(assert (=> b!774748 m!719131))

(assert (=> b!774748 m!719131))

(declare-fun m!719133 () Bool)

(assert (=> b!774748 m!719133))

(declare-fun m!719135 () Bool)

(assert (=> start!67110 m!719135))

(declare-fun m!719137 () Bool)

(assert (=> start!67110 m!719137))

(assert (=> b!774750 m!719131))

(assert (=> b!774750 m!719131))

(declare-fun m!719139 () Bool)

(assert (=> b!774750 m!719139))

(assert (=> b!774752 m!719131))

(assert (=> b!774752 m!719131))

(declare-fun m!719141 () Bool)

(assert (=> b!774752 m!719141))

(declare-fun m!719143 () Bool)

(assert (=> b!774757 m!719143))

(assert (=> b!774758 m!719131))

(assert (=> b!774758 m!719131))

(declare-fun m!719145 () Bool)

(assert (=> b!774758 m!719145))

(declare-fun m!719147 () Bool)

(assert (=> b!774765 m!719147))

(declare-fun m!719149 () Bool)

(assert (=> b!774765 m!719149))

(declare-fun m!719151 () Bool)

(assert (=> b!774763 m!719151))

(declare-fun m!719153 () Bool)

(assert (=> b!774763 m!719153))

(declare-fun m!719155 () Bool)

(assert (=> b!774763 m!719155))

(assert (=> b!774763 m!719151))

(declare-fun m!719157 () Bool)

(assert (=> b!774763 m!719157))

(declare-fun m!719159 () Bool)

(assert (=> b!774763 m!719159))

(assert (=> b!774764 m!719131))

(assert (=> b!774764 m!719131))

(declare-fun m!719161 () Bool)

(assert (=> b!774764 m!719161))

(assert (=> b!774764 m!719161))

(assert (=> b!774764 m!719131))

(declare-fun m!719163 () Bool)

(assert (=> b!774764 m!719163))

(declare-fun m!719165 () Bool)

(assert (=> b!774751 m!719165))

(assert (=> b!774753 m!719131))

(assert (=> b!774753 m!719131))

(declare-fun m!719167 () Bool)

(assert (=> b!774753 m!719167))

(assert (=> b!774759 m!719131))

(assert (=> b!774759 m!719131))

(declare-fun m!719169 () Bool)

(assert (=> b!774759 m!719169))

(declare-fun m!719171 () Bool)

(assert (=> b!774766 m!719171))

(assert (=> b!774770 m!719131))

(assert (=> b!774770 m!719131))

(assert (=> b!774770 m!719169))

(assert (=> b!774770 m!719131))

(assert (=> b!774770 m!719167))

(declare-fun m!719173 () Bool)

(assert (=> b!774762 m!719173))

(assert (=> b!774768 m!719131))

(assert (=> b!774768 m!719131))

(declare-fun m!719175 () Bool)

(assert (=> b!774768 m!719175))

(declare-fun m!719177 () Bool)

(assert (=> b!774767 m!719177))

(declare-fun m!719179 () Bool)

(assert (=> b!774767 m!719179))

(declare-fun m!719181 () Bool)

(assert (=> b!774749 m!719181))

(declare-fun m!719183 () Bool)

(assert (=> b!774754 m!719183))

(assert (=> b!774747 m!719131))

(assert (=> b!774747 m!719131))

(assert (=> b!774747 m!719145))

(declare-fun m!719185 () Bool)

(assert (=> b!774769 m!719185))

(push 1)

