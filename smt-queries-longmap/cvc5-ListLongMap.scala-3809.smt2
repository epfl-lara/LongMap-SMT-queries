; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52208 () Bool)

(assert start!52208)

(declare-fun b!569987 () Bool)

(declare-fun res!360006 () Bool)

(declare-fun e!327818 () Bool)

(assert (=> b!569987 (=> (not res!360006) (not e!327818))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35731 0))(
  ( (array!35732 (arr!17157 (Array (_ BitVec 32) (_ BitVec 64))) (size!17521 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35731)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!569987 (= res!360006 (and (= (size!17521 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17521 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17521 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569988 () Bool)

(declare-fun e!327816 () Bool)

(assert (=> b!569988 (= e!327818 e!327816)))

(declare-fun res!360012 () Bool)

(assert (=> b!569988 (=> (not res!360012) (not e!327816))))

(declare-datatypes ((SeekEntryResult!5606 0))(
  ( (MissingZero!5606 (index!24651 (_ BitVec 32))) (Found!5606 (index!24652 (_ BitVec 32))) (Intermediate!5606 (undefined!6418 Bool) (index!24653 (_ BitVec 32)) (x!53521 (_ BitVec 32))) (Undefined!5606) (MissingVacant!5606 (index!24654 (_ BitVec 32))) )
))
(declare-fun lt!259828 () SeekEntryResult!5606)

(assert (=> b!569988 (= res!360012 (or (= lt!259828 (MissingZero!5606 i!1132)) (= lt!259828 (MissingVacant!5606 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35731 (_ BitVec 32)) SeekEntryResult!5606)

(assert (=> b!569988 (= lt!259828 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!569989 () Bool)

(declare-fun e!327817 () Bool)

(assert (=> b!569989 (= e!327816 e!327817)))

(declare-fun res!360008 () Bool)

(assert (=> b!569989 (=> (not res!360008) (not e!327817))))

(declare-fun lt!259827 () (_ BitVec 32))

(declare-fun lt!259823 () SeekEntryResult!5606)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35731 (_ BitVec 32)) SeekEntryResult!5606)

(assert (=> b!569989 (= res!360008 (= lt!259823 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259827 (select (store (arr!17157 a!3118) i!1132 k!1914) j!142) (array!35732 (store (arr!17157 a!3118) i!1132 k!1914) (size!17521 a!3118)) mask!3119)))))

(declare-fun lt!259824 () (_ BitVec 32))

(assert (=> b!569989 (= lt!259823 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259824 (select (arr!17157 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569989 (= lt!259827 (toIndex!0 (select (store (arr!17157 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!569989 (= lt!259824 (toIndex!0 (select (arr!17157 a!3118) j!142) mask!3119))))

(declare-fun b!569990 () Bool)

(declare-fun res!360009 () Bool)

(assert (=> b!569990 (=> (not res!360009) (not e!327818))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569990 (= res!360009 (validKeyInArray!0 (select (arr!17157 a!3118) j!142)))))

(declare-fun b!569991 () Bool)

(declare-fun res!360005 () Bool)

(assert (=> b!569991 (=> (not res!360005) (not e!327816))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35731 (_ BitVec 32)) Bool)

(assert (=> b!569991 (= res!360005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569992 () Bool)

(declare-fun res!360010 () Bool)

(assert (=> b!569992 (=> (not res!360010) (not e!327818))))

(declare-fun arrayContainsKey!0 (array!35731 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569992 (= res!360010 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569993 () Bool)

(declare-fun e!327819 () Bool)

(assert (=> b!569993 (= e!327817 (not e!327819))))

(declare-fun res!360007 () Bool)

(assert (=> b!569993 (=> res!360007 e!327819)))

(assert (=> b!569993 (= res!360007 (or (undefined!6418 lt!259823) (not (is-Intermediate!5606 lt!259823)) (= (select (arr!17157 a!3118) (index!24653 lt!259823)) (select (arr!17157 a!3118) j!142)) (= (select (arr!17157 a!3118) (index!24653 lt!259823)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!259826 () SeekEntryResult!5606)

(assert (=> b!569993 (= lt!259826 (Found!5606 j!142))))

(assert (=> b!569993 (= lt!259826 (seekEntryOrOpen!0 (select (arr!17157 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!569993 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17914 0))(
  ( (Unit!17915) )
))
(declare-fun lt!259825 () Unit!17914)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35731 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17914)

(assert (=> b!569993 (= lt!259825 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569994 () Bool)

(declare-fun res!360011 () Bool)

(assert (=> b!569994 (=> (not res!360011) (not e!327818))))

(assert (=> b!569994 (= res!360011 (validKeyInArray!0 k!1914))))

(declare-fun res!360013 () Bool)

(assert (=> start!52208 (=> (not res!360013) (not e!327818))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52208 (= res!360013 (validMask!0 mask!3119))))

(assert (=> start!52208 e!327818))

(assert (=> start!52208 true))

(declare-fun array_inv!12953 (array!35731) Bool)

(assert (=> start!52208 (array_inv!12953 a!3118)))

(declare-fun b!569995 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35731 (_ BitVec 32)) SeekEntryResult!5606)

(assert (=> b!569995 (= e!327819 (= lt!259826 (seekKeyOrZeroReturnVacant!0 (x!53521 lt!259823) (index!24653 lt!259823) (index!24653 lt!259823) (select (arr!17157 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!569996 () Bool)

(declare-fun res!360014 () Bool)

(assert (=> b!569996 (=> (not res!360014) (not e!327816))))

(declare-datatypes ((List!11237 0))(
  ( (Nil!11234) (Cons!11233 (h!12254 (_ BitVec 64)) (t!17465 List!11237)) )
))
(declare-fun arrayNoDuplicates!0 (array!35731 (_ BitVec 32) List!11237) Bool)

(assert (=> b!569996 (= res!360014 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11234))))

(assert (= (and start!52208 res!360013) b!569987))

(assert (= (and b!569987 res!360006) b!569990))

(assert (= (and b!569990 res!360009) b!569994))

(assert (= (and b!569994 res!360011) b!569992))

(assert (= (and b!569992 res!360010) b!569988))

(assert (= (and b!569988 res!360012) b!569991))

(assert (= (and b!569991 res!360005) b!569996))

(assert (= (and b!569996 res!360014) b!569989))

(assert (= (and b!569989 res!360008) b!569993))

(assert (= (and b!569993 (not res!360007)) b!569995))

(declare-fun m!548901 () Bool)

(assert (=> b!569991 m!548901))

(declare-fun m!548903 () Bool)

(assert (=> b!569996 m!548903))

(declare-fun m!548905 () Bool)

(assert (=> b!569992 m!548905))

(declare-fun m!548907 () Bool)

(assert (=> b!569989 m!548907))

(declare-fun m!548909 () Bool)

(assert (=> b!569989 m!548909))

(declare-fun m!548911 () Bool)

(assert (=> b!569989 m!548911))

(declare-fun m!548913 () Bool)

(assert (=> b!569989 m!548913))

(assert (=> b!569989 m!548907))

(declare-fun m!548915 () Bool)

(assert (=> b!569989 m!548915))

(assert (=> b!569989 m!548907))

(declare-fun m!548917 () Bool)

(assert (=> b!569989 m!548917))

(assert (=> b!569989 m!548911))

(declare-fun m!548919 () Bool)

(assert (=> b!569989 m!548919))

(assert (=> b!569989 m!548911))

(declare-fun m!548921 () Bool)

(assert (=> start!52208 m!548921))

(declare-fun m!548923 () Bool)

(assert (=> start!52208 m!548923))

(declare-fun m!548925 () Bool)

(assert (=> b!569988 m!548925))

(assert (=> b!569995 m!548911))

(assert (=> b!569995 m!548911))

(declare-fun m!548927 () Bool)

(assert (=> b!569995 m!548927))

(assert (=> b!569990 m!548911))

(assert (=> b!569990 m!548911))

(declare-fun m!548929 () Bool)

(assert (=> b!569990 m!548929))

(assert (=> b!569993 m!548911))

(declare-fun m!548931 () Bool)

(assert (=> b!569993 m!548931))

(declare-fun m!548933 () Bool)

(assert (=> b!569993 m!548933))

(declare-fun m!548935 () Bool)

(assert (=> b!569993 m!548935))

(assert (=> b!569993 m!548911))

(declare-fun m!548937 () Bool)

(assert (=> b!569993 m!548937))

(declare-fun m!548939 () Bool)

(assert (=> b!569994 m!548939))

(push 1)

(assert (not b!569995))

(assert (not b!569991))

(assert (not b!569990))

(assert (not b!569992))

(assert (not b!569988))

(assert (not b!569994))

(assert (not b!569993))

(assert (not b!569996))

(assert (not start!52208))

(assert (not b!569989))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!570073 () Bool)

(declare-fun e!327866 () Bool)

(declare-fun e!327864 () Bool)

(assert (=> b!570073 (= e!327866 e!327864)))

(declare-fun c!65348 () Bool)

(assert (=> b!570073 (= c!65348 (validKeyInArray!0 (select (arr!17157 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!570075 () Bool)

(declare-fun call!32585 () Bool)

(assert (=> b!570075 (= e!327864 call!32585)))

(declare-fun bm!32582 () Bool)

(assert (=> bm!32582 (= call!32585 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!65348 (Cons!11233 (select (arr!17157 a!3118) #b00000000000000000000000000000000) Nil!11234) Nil!11234)))))

(declare-fun b!570074 () Bool)

(declare-fun e!327867 () Bool)

(assert (=> b!570074 (= e!327867 e!327866)))

(declare-fun res!360088 () Bool)

(assert (=> b!570074 (=> (not res!360088) (not e!327866))))

(declare-fun e!327865 () Bool)

(assert (=> b!570074 (= res!360088 (not e!327865))))

(declare-fun res!360089 () Bool)

(assert (=> b!570074 (=> (not res!360089) (not e!327865))))

(assert (=> b!570074 (= res!360089 (validKeyInArray!0 (select (arr!17157 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!84609 () Bool)

(declare-fun res!360087 () Bool)

(assert (=> d!84609 (=> res!360087 e!327867)))

(assert (=> d!84609 (= res!360087 (bvsge #b00000000000000000000000000000000 (size!17521 a!3118)))))

(assert (=> d!84609 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11234) e!327867)))

(declare-fun b!570076 () Bool)

(declare-fun contains!2878 (List!11237 (_ BitVec 64)) Bool)

(assert (=> b!570076 (= e!327865 (contains!2878 Nil!11234 (select (arr!17157 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!570077 () Bool)

(assert (=> b!570077 (= e!327864 call!32585)))

(assert (= (and d!84609 (not res!360087)) b!570074))

(assert (= (and b!570074 res!360089) b!570076))

(assert (= (and b!570074 res!360088) b!570073))

(assert (= (and b!570073 c!65348) b!570075))

(assert (= (and b!570073 (not c!65348)) b!570077))

(assert (= (or b!570075 b!570077) bm!32582))

(declare-fun m!549025 () Bool)

(assert (=> b!570073 m!549025))

(assert (=> b!570073 m!549025))

(declare-fun m!549027 () Bool)

(assert (=> b!570073 m!549027))

(assert (=> bm!32582 m!549025))

(declare-fun m!549029 () Bool)

(assert (=> bm!32582 m!549029))

(assert (=> b!570074 m!549025))

(assert (=> b!570074 m!549025))

(assert (=> b!570074 m!549027))

(assert (=> b!570076 m!549025))

(assert (=> b!570076 m!549025))

(declare-fun m!549031 () Bool)

(assert (=> b!570076 m!549031))

(assert (=> b!569996 d!84609))

(declare-fun b!570132 () Bool)

(declare-fun e!327902 () SeekEntryResult!5606)

(assert (=> b!570132 (= e!327902 (Found!5606 (index!24653 lt!259823)))))

(declare-fun b!570133 () Bool)

(declare-fun e!327900 () SeekEntryResult!5606)

(assert (=> b!570133 (= e!327900 (MissingVacant!5606 (index!24653 lt!259823)))))

(declare-fun b!570135 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!570135 (= e!327900 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53521 lt!259823) #b00000000000000000000000000000001) (nextIndex!0 (index!24653 lt!259823) (x!53521 lt!259823) mask!3119) (index!24653 lt!259823) (select (arr!17157 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!570136 () Bool)

(declare-fun c!65367 () Bool)

(declare-fun lt!259885 () (_ BitVec 64))

(assert (=> b!570136 (= c!65367 (= lt!259885 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!570136 (= e!327902 e!327900)))

(declare-fun b!570137 () Bool)

(declare-fun e!327901 () SeekEntryResult!5606)

(assert (=> b!570137 (= e!327901 e!327902)))

(declare-fun c!65369 () Bool)

(assert (=> b!570137 (= c!65369 (= lt!259885 (select (arr!17157 a!3118) j!142)))))

(declare-fun b!570134 () Bool)

(assert (=> b!570134 (= e!327901 Undefined!5606)))

(declare-fun d!84611 () Bool)

(declare-fun lt!259886 () SeekEntryResult!5606)

(assert (=> d!84611 (and (or (is-Undefined!5606 lt!259886) (not (is-Found!5606 lt!259886)) (and (bvsge (index!24652 lt!259886) #b00000000000000000000000000000000) (bvslt (index!24652 lt!259886) (size!17521 a!3118)))) (or (is-Undefined!5606 lt!259886) (is-Found!5606 lt!259886) (not (is-MissingVacant!5606 lt!259886)) (not (= (index!24654 lt!259886) (index!24653 lt!259823))) (and (bvsge (index!24654 lt!259886) #b00000000000000000000000000000000) (bvslt (index!24654 lt!259886) (size!17521 a!3118)))) (or (is-Undefined!5606 lt!259886) (ite (is-Found!5606 lt!259886) (= (select (arr!17157 a!3118) (index!24652 lt!259886)) (select (arr!17157 a!3118) j!142)) (and (is-MissingVacant!5606 lt!259886) (= (index!24654 lt!259886) (index!24653 lt!259823)) (= (select (arr!17157 a!3118) (index!24654 lt!259886)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!84611 (= lt!259886 e!327901)))

(declare-fun c!65368 () Bool)

(assert (=> d!84611 (= c!65368 (bvsge (x!53521 lt!259823) #b01111111111111111111111111111110))))

(assert (=> d!84611 (= lt!259885 (select (arr!17157 a!3118) (index!24653 lt!259823)))))

(assert (=> d!84611 (validMask!0 mask!3119)))

(assert (=> d!84611 (= (seekKeyOrZeroReturnVacant!0 (x!53521 lt!259823) (index!24653 lt!259823) (index!24653 lt!259823) (select (arr!17157 a!3118) j!142) a!3118 mask!3119) lt!259886)))

(assert (= (and d!84611 c!65368) b!570134))

(assert (= (and d!84611 (not c!65368)) b!570137))

(assert (= (and b!570137 c!65369) b!570132))

(assert (= (and b!570137 (not c!65369)) b!570136))

(assert (= (and b!570136 c!65367) b!570133))

(assert (= (and b!570136 (not c!65367)) b!570135))

(declare-fun m!549053 () Bool)

(assert (=> b!570135 m!549053))

(assert (=> b!570135 m!549053))

(assert (=> b!570135 m!548911))

(declare-fun m!549055 () Bool)

(assert (=> b!570135 m!549055))

(declare-fun m!549057 () Bool)

(assert (=> d!84611 m!549057))

(declare-fun m!549059 () Bool)

(assert (=> d!84611 m!549059))

(assert (=> d!84611 m!548933))

(assert (=> d!84611 m!548921))

(assert (=> b!569995 d!84611))

(declare-fun d!84627 () Bool)

(assert (=> d!84627 (= (validKeyInArray!0 (select (arr!17157 a!3118) j!142)) (and (not (= (select (arr!17157 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17157 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!569990 d!84627))

(declare-fun b!570216 () Bool)

(declare-fun e!327952 () SeekEntryResult!5606)

(declare-fun e!327948 () SeekEntryResult!5606)

(assert (=> b!570216 (= e!327952 e!327948)))

(declare-fun lt!259917 () (_ BitVec 64))

(declare-fun c!65397 () Bool)

(assert (=> b!570216 (= c!65397 (or (= lt!259917 (select (store (arr!17157 a!3118) i!1132 k!1914) j!142)) (= (bvadd lt!259917 lt!259917) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!570217 () Bool)

(assert (=> b!570217 (= e!327952 (Intermediate!5606 true lt!259827 #b00000000000000000000000000000000))))

(declare-fun b!570218 () Bool)

(assert (=> b!570218 (= e!327948 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!259827 #b00000000000000000000000000000000 mask!3119) (select (store (arr!17157 a!3118) i!1132 k!1914) j!142) (array!35732 (store (arr!17157 a!3118) i!1132 k!1914) (size!17521 a!3118)) mask!3119))))

(declare-fun b!570219 () Bool)

(declare-fun lt!259916 () SeekEntryResult!5606)

(assert (=> b!570219 (and (bvsge (index!24653 lt!259916) #b00000000000000000000000000000000) (bvslt (index!24653 lt!259916) (size!17521 (array!35732 (store (arr!17157 a!3118) i!1132 k!1914) (size!17521 a!3118)))))))

(declare-fun res!360136 () Bool)

(assert (=> b!570219 (= res!360136 (= (select (arr!17157 (array!35732 (store (arr!17157 a!3118) i!1132 k!1914) (size!17521 a!3118))) (index!24653 lt!259916)) (select (store (arr!17157 a!3118) i!1132 k!1914) j!142)))))

(declare-fun e!327950 () Bool)

(assert (=> b!570219 (=> res!360136 e!327950)))

(declare-fun e!327949 () Bool)

(assert (=> b!570219 (= e!327949 e!327950)))

(declare-fun b!570220 () Bool)

(assert (=> b!570220 (and (bvsge (index!24653 lt!259916) #b00000000000000000000000000000000) (bvslt (index!24653 lt!259916) (size!17521 (array!35732 (store (arr!17157 a!3118) i!1132 k!1914) (size!17521 a!3118)))))))

(assert (=> b!570220 (= e!327950 (= (select (arr!17157 (array!35732 (store (arr!17157 a!3118) i!1132 k!1914) (size!17521 a!3118))) (index!24653 lt!259916)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!84629 () Bool)

(declare-fun e!327951 () Bool)

(assert (=> d!84629 e!327951))

(declare-fun c!65398 () Bool)

(assert (=> d!84629 (= c!65398 (and (is-Intermediate!5606 lt!259916) (undefined!6418 lt!259916)))))

(assert (=> d!84629 (= lt!259916 e!327952)))

(declare-fun c!65399 () Bool)

(assert (=> d!84629 (= c!65399 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84629 (= lt!259917 (select (arr!17157 (array!35732 (store (arr!17157 a!3118) i!1132 k!1914) (size!17521 a!3118))) lt!259827))))

(assert (=> d!84629 (validMask!0 mask!3119)))

(assert (=> d!84629 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259827 (select (store (arr!17157 a!3118) i!1132 k!1914) j!142) (array!35732 (store (arr!17157 a!3118) i!1132 k!1914) (size!17521 a!3118)) mask!3119) lt!259916)))

(declare-fun b!570221 () Bool)

(assert (=> b!570221 (= e!327951 e!327949)))

(declare-fun res!360135 () Bool)

(assert (=> b!570221 (= res!360135 (and (is-Intermediate!5606 lt!259916) (not (undefined!6418 lt!259916)) (bvslt (x!53521 lt!259916) #b01111111111111111111111111111110) (bvsge (x!53521 lt!259916) #b00000000000000000000000000000000) (bvsge (x!53521 lt!259916) #b00000000000000000000000000000000)))))

(assert (=> b!570221 (=> (not res!360135) (not e!327949))))

(declare-fun b!570222 () Bool)

(assert (=> b!570222 (and (bvsge (index!24653 lt!259916) #b00000000000000000000000000000000) (bvslt (index!24653 lt!259916) (size!17521 (array!35732 (store (arr!17157 a!3118) i!1132 k!1914) (size!17521 a!3118)))))))

(declare-fun res!360134 () Bool)

(assert (=> b!570222 (= res!360134 (= (select (arr!17157 (array!35732 (store (arr!17157 a!3118) i!1132 k!1914) (size!17521 a!3118))) (index!24653 lt!259916)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!570222 (=> res!360134 e!327950)))

(declare-fun b!570223 () Bool)

(assert (=> b!570223 (= e!327948 (Intermediate!5606 false lt!259827 #b00000000000000000000000000000000))))

(declare-fun b!570224 () Bool)

(assert (=> b!570224 (= e!327951 (bvsge (x!53521 lt!259916) #b01111111111111111111111111111110))))

(assert (= (and d!84629 c!65399) b!570217))

(assert (= (and d!84629 (not c!65399)) b!570216))

(assert (= (and b!570216 c!65397) b!570223))

(assert (= (and b!570216 (not c!65397)) b!570218))

(assert (= (and d!84629 c!65398) b!570224))

(assert (= (and d!84629 (not c!65398)) b!570221))

(assert (= (and b!570221 res!360135) b!570219))

(assert (= (and b!570219 (not res!360136)) b!570222))

(assert (= (and b!570222 (not res!360134)) b!570220))

(declare-fun m!549091 () Bool)

(assert (=> b!570218 m!549091))

(assert (=> b!570218 m!549091))

(assert (=> b!570218 m!548907))

(declare-fun m!549093 () Bool)

(assert (=> b!570218 m!549093))

(declare-fun m!549095 () Bool)

(assert (=> b!570220 m!549095))

(declare-fun m!549097 () Bool)

(assert (=> d!84629 m!549097))

(assert (=> d!84629 m!548921))

(assert (=> b!570219 m!549095))

(assert (=> b!570222 m!549095))

(assert (=> b!569989 d!84629))

(declare-fun b!570229 () Bool)

(declare-fun e!327959 () SeekEntryResult!5606)

(declare-fun e!327955 () SeekEntryResult!5606)

(assert (=> b!570229 (= e!327959 e!327955)))

(declare-fun lt!259919 () (_ BitVec 64))

(declare-fun c!65402 () Bool)

(assert (=> b!570229 (= c!65402 (or (= lt!259919 (select (arr!17157 a!3118) j!142)) (= (bvadd lt!259919 lt!259919) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!570230 () Bool)

(assert (=> b!570230 (= e!327959 (Intermediate!5606 true lt!259824 #b00000000000000000000000000000000))))

(declare-fun b!570231 () Bool)

(assert (=> b!570231 (= e!327955 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!259824 #b00000000000000000000000000000000 mask!3119) (select (arr!17157 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!570232 () Bool)

(declare-fun lt!259918 () SeekEntryResult!5606)

(assert (=> b!570232 (and (bvsge (index!24653 lt!259918) #b00000000000000000000000000000000) (bvslt (index!24653 lt!259918) (size!17521 a!3118)))))

(declare-fun res!360139 () Bool)

(assert (=> b!570232 (= res!360139 (= (select (arr!17157 a!3118) (index!24653 lt!259918)) (select (arr!17157 a!3118) j!142)))))

(declare-fun e!327957 () Bool)

(assert (=> b!570232 (=> res!360139 e!327957)))

(declare-fun e!327956 () Bool)

(assert (=> b!570232 (= e!327956 e!327957)))

(declare-fun b!570233 () Bool)

(assert (=> b!570233 (and (bvsge (index!24653 lt!259918) #b00000000000000000000000000000000) (bvslt (index!24653 lt!259918) (size!17521 a!3118)))))

(assert (=> b!570233 (= e!327957 (= (select (arr!17157 a!3118) (index!24653 lt!259918)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!84641 () Bool)

(declare-fun e!327958 () Bool)

(assert (=> d!84641 e!327958))

(declare-fun c!65403 () Bool)

(assert (=> d!84641 (= c!65403 (and (is-Intermediate!5606 lt!259918) (undefined!6418 lt!259918)))))

(assert (=> d!84641 (= lt!259918 e!327959)))

(declare-fun c!65404 () Bool)

(assert (=> d!84641 (= c!65404 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84641 (= lt!259919 (select (arr!17157 a!3118) lt!259824))))

(assert (=> d!84641 (validMask!0 mask!3119)))

(assert (=> d!84641 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259824 (select (arr!17157 a!3118) j!142) a!3118 mask!3119) lt!259918)))

(declare-fun b!570234 () Bool)

(assert (=> b!570234 (= e!327958 e!327956)))

(declare-fun res!360138 () Bool)

(assert (=> b!570234 (= res!360138 (and (is-Intermediate!5606 lt!259918) (not (undefined!6418 lt!259918)) (bvslt (x!53521 lt!259918) #b01111111111111111111111111111110) (bvsge (x!53521 lt!259918) #b00000000000000000000000000000000) (bvsge (x!53521 lt!259918) #b00000000000000000000000000000000)))))

(assert (=> b!570234 (=> (not res!360138) (not e!327956))))

(declare-fun b!570235 () Bool)

(assert (=> b!570235 (and (bvsge (index!24653 lt!259918) #b00000000000000000000000000000000) (bvslt (index!24653 lt!259918) (size!17521 a!3118)))))

(declare-fun res!360137 () Bool)

(assert (=> b!570235 (= res!360137 (= (select (arr!17157 a!3118) (index!24653 lt!259918)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!570235 (=> res!360137 e!327957)))

(declare-fun b!570236 () Bool)

(assert (=> b!570236 (= e!327955 (Intermediate!5606 false lt!259824 #b00000000000000000000000000000000))))

(declare-fun b!570237 () Bool)

(assert (=> b!570237 (= e!327958 (bvsge (x!53521 lt!259918) #b01111111111111111111111111111110))))

(assert (= (and d!84641 c!65404) b!570230))

(assert (= (and d!84641 (not c!65404)) b!570229))

(assert (= (and b!570229 c!65402) b!570236))

(assert (= (and b!570229 (not c!65402)) b!570231))

(assert (= (and d!84641 c!65403) b!570237))

(assert (= (and d!84641 (not c!65403)) b!570234))

(assert (= (and b!570234 res!360138) b!570232))

(assert (= (and b!570232 (not res!360139)) b!570235))

(assert (= (and b!570235 (not res!360137)) b!570233))

(declare-fun m!549099 () Bool)

(assert (=> b!570231 m!549099))

(assert (=> b!570231 m!549099))

(assert (=> b!570231 m!548911))

(declare-fun m!549101 () Bool)

(assert (=> b!570231 m!549101))

(declare-fun m!549103 () Bool)

(assert (=> b!570233 m!549103))

(declare-fun m!549105 () Bool)

(assert (=> d!84641 m!549105))

(assert (=> d!84641 m!548921))

(assert (=> b!570232 m!549103))

(assert (=> b!570235 m!549103))

(assert (=> b!569989 d!84641))

(declare-fun d!84643 () Bool)

(declare-fun lt!259925 () (_ BitVec 32))

(declare-fun lt!259924 () (_ BitVec 32))

(assert (=> d!84643 (= lt!259925 (bvmul (bvxor lt!259924 (bvlshr lt!259924 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84643 (= lt!259924 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17157 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!17157 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84643 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!360140 (let ((h!12259 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17157 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!17157 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53530 (bvmul (bvxor h!12259 (bvlshr h!12259 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53530 (bvlshr x!53530 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!360140 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!360140 #b00000000000000000000000000000000))))))

(assert (=> d!84643 (= (toIndex!0 (select (store (arr!17157 a!3118) i!1132 k!1914) j!142) mask!3119) (bvand (bvxor lt!259925 (bvlshr lt!259925 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!569989 d!84643))

(declare-fun d!84647 () Bool)

(declare-fun lt!259927 () (_ BitVec 32))

(declare-fun lt!259926 () (_ BitVec 32))

(assert (=> d!84647 (= lt!259927 (bvmul (bvxor lt!259926 (bvlshr lt!259926 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84647 (= lt!259926 ((_ extract 31 0) (bvand (bvxor (select (arr!17157 a!3118) j!142) (bvlshr (select (arr!17157 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84647 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!360140 (let ((h!12259 ((_ extract 31 0) (bvand (bvxor (select (arr!17157 a!3118) j!142) (bvlshr (select (arr!17157 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53530 (bvmul (bvxor h!12259 (bvlshr h!12259 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53530 (bvlshr x!53530 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!360140 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!360140 #b00000000000000000000000000000000))))))

(assert (=> d!84647 (= (toIndex!0 (select (arr!17157 a!3118) j!142) mask!3119) (bvand (bvxor lt!259927 (bvlshr lt!259927 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!569989 d!84647))

(declare-fun d!84649 () Bool)

(assert (=> d!84649 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52208 d!84649))

(declare-fun d!84653 () Bool)

(assert (=> d!84653 (= (array_inv!12953 a!3118) (bvsge (size!17521 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52208 d!84653))

(declare-fun d!84655 () Bool)

(assert (=> d!84655 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!569994 d!84655))

(declare-fun b!570315 () Bool)

(declare-fun c!65437 () Bool)

(declare-fun lt!259971 () (_ BitVec 64))

(assert (=> b!570315 (= c!65437 (= lt!259971 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!328007 () SeekEntryResult!5606)

(declare-fun e!328006 () SeekEntryResult!5606)

(assert (=> b!570315 (= e!328007 e!328006)))

(declare-fun b!570316 () Bool)

(declare-fun e!328008 () SeekEntryResult!5606)

(assert (=> b!570316 (= e!328008 Undefined!5606)))

(declare-fun d!84657 () Bool)

(declare-fun lt!259973 () SeekEntryResult!5606)

(assert (=> d!84657 (and (or (is-Undefined!5606 lt!259973) (not (is-Found!5606 lt!259973)) (and (bvsge (index!24652 lt!259973) #b00000000000000000000000000000000) (bvslt (index!24652 lt!259973) (size!17521 a!3118)))) (or (is-Undefined!5606 lt!259973) (is-Found!5606 lt!259973) (not (is-MissingZero!5606 lt!259973)) (and (bvsge (index!24651 lt!259973) #b00000000000000000000000000000000) (bvslt (index!24651 lt!259973) (size!17521 a!3118)))) (or (is-Undefined!5606 lt!259973) (is-Found!5606 lt!259973) (is-MissingZero!5606 lt!259973) (not (is-MissingVacant!5606 lt!259973)) (and (bvsge (index!24654 lt!259973) #b00000000000000000000000000000000) (bvslt (index!24654 lt!259973) (size!17521 a!3118)))) (or (is-Undefined!5606 lt!259973) (ite (is-Found!5606 lt!259973) (= (select (arr!17157 a!3118) (index!24652 lt!259973)) (select (arr!17157 a!3118) j!142)) (ite (is-MissingZero!5606 lt!259973) (= (select (arr!17157 a!3118) (index!24651 lt!259973)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5606 lt!259973) (= (select (arr!17157 a!3118) (index!24654 lt!259973)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84657 (= lt!259973 e!328008)))

(declare-fun c!65438 () Bool)

(declare-fun lt!259972 () SeekEntryResult!5606)

(assert (=> d!84657 (= c!65438 (and (is-Intermediate!5606 lt!259972) (undefined!6418 lt!259972)))))

(assert (=> d!84657 (= lt!259972 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17157 a!3118) j!142) mask!3119) (select (arr!17157 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84657 (validMask!0 mask!3119)))

(assert (=> d!84657 (= (seekEntryOrOpen!0 (select (arr!17157 a!3118) j!142) a!3118 mask!3119) lt!259973)))

(declare-fun b!570317 () Bool)

(assert (=> b!570317 (= e!328006 (MissingZero!5606 (index!24653 lt!259972)))))

(declare-fun b!570318 () Bool)

(assert (=> b!570318 (= e!328008 e!328007)))

(assert (=> b!570318 (= lt!259971 (select (arr!17157 a!3118) (index!24653 lt!259972)))))

(declare-fun c!65436 () Bool)

(assert (=> b!570318 (= c!65436 (= lt!259971 (select (arr!17157 a!3118) j!142)))))

(declare-fun b!570319 () Bool)

(assert (=> b!570319 (= e!328007 (Found!5606 (index!24653 lt!259972)))))

(declare-fun b!570320 () Bool)

(assert (=> b!570320 (= e!328006 (seekKeyOrZeroReturnVacant!0 (x!53521 lt!259972) (index!24653 lt!259972) (index!24653 lt!259972) (select (arr!17157 a!3118) j!142) a!3118 mask!3119))))

(assert (= (and d!84657 c!65438) b!570316))

(assert (= (and d!84657 (not c!65438)) b!570318))

(assert (= (and b!570318 c!65436) b!570319))

(assert (= (and b!570318 (not c!65436)) b!570315))

(assert (= (and b!570315 c!65437) b!570317))

(assert (= (and b!570315 (not c!65437)) b!570320))

(assert (=> d!84657 m!548911))

(assert (=> d!84657 m!548913))

(assert (=> d!84657 m!548921))

(declare-fun m!549155 () Bool)

(assert (=> d!84657 m!549155))

(declare-fun m!549157 () Bool)

(assert (=> d!84657 m!549157))

(assert (=> d!84657 m!548913))

(assert (=> d!84657 m!548911))

(declare-fun m!549159 () Bool)

(assert (=> d!84657 m!549159))

(declare-fun m!549161 () Bool)

(assert (=> d!84657 m!549161))

(declare-fun m!549163 () Bool)

(assert (=> b!570318 m!549163))

(assert (=> b!570320 m!548911))

(declare-fun m!549165 () Bool)

(assert (=> b!570320 m!549165))

(assert (=> b!569993 d!84657))

(declare-fun b!570349 () Bool)

(declare-fun e!328027 () Bool)

(declare-fun call!32598 () Bool)

(assert (=> b!570349 (= e!328027 call!32598)))

(declare-fun b!570350 () Bool)

(declare-fun e!328028 () Bool)

(assert (=> b!570350 (= e!328028 call!32598)))

(declare-fun bm!32595 () Bool)

(assert (=> bm!32595 (= call!32598 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun d!84671 () Bool)

(declare-fun res!360162 () Bool)

(declare-fun e!328026 () Bool)

(assert (=> d!84671 (=> res!360162 e!328026)))

(assert (=> d!84671 (= res!360162 (bvsge j!142 (size!17521 a!3118)))))

(assert (=> d!84671 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!328026)))

(declare-fun b!570351 () Bool)

(assert (=> b!570351 (= e!328028 e!328027)))

(declare-fun lt!259996 () (_ BitVec 64))

(assert (=> b!570351 (= lt!259996 (select (arr!17157 a!3118) j!142))))

(declare-fun lt!259997 () Unit!17914)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35731 (_ BitVec 64) (_ BitVec 32)) Unit!17914)

(assert (=> b!570351 (= lt!259997 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!259996 j!142))))

(assert (=> b!570351 (arrayContainsKey!0 a!3118 lt!259996 #b00000000000000000000000000000000)))

(declare-fun lt!259995 () Unit!17914)

(assert (=> b!570351 (= lt!259995 lt!259997)))

(declare-fun res!360163 () Bool)

(assert (=> b!570351 (= res!360163 (= (seekEntryOrOpen!0 (select (arr!17157 a!3118) j!142) a!3118 mask!3119) (Found!5606 j!142)))))

(assert (=> b!570351 (=> (not res!360163) (not e!328027))))

(declare-fun b!570352 () Bool)

(assert (=> b!570352 (= e!328026 e!328028)))

(declare-fun c!65450 () Bool)

(assert (=> b!570352 (= c!65450 (validKeyInArray!0 (select (arr!17157 a!3118) j!142)))))

(assert (= (and d!84671 (not res!360162)) b!570352))

(assert (= (and b!570352 c!65450) b!570351))

(assert (= (and b!570352 (not c!65450)) b!570350))

(assert (= (and b!570351 res!360163) b!570349))

(assert (= (or b!570349 b!570350) bm!32595))

(declare-fun m!549195 () Bool)

(assert (=> bm!32595 m!549195))

(assert (=> b!570351 m!548911))

(declare-fun m!549197 () Bool)

(assert (=> b!570351 m!549197))

(declare-fun m!549199 () Bool)

(assert (=> b!570351 m!549199))

(assert (=> b!570351 m!548911))

(assert (=> b!570351 m!548937))

(assert (=> b!570352 m!548911))

(assert (=> b!570352 m!548911))

(assert (=> b!570352 m!548929))

(assert (=> b!569993 d!84671))

(declare-fun d!84681 () Bool)

(assert (=> d!84681 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!260002 () Unit!17914)

(declare-fun choose!38 (array!35731 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17914)

(assert (=> d!84681 (= lt!260002 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84681 (validMask!0 mask!3119)))

(assert (=> d!84681 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!260002)))

(declare-fun bs!17688 () Bool)

(assert (= bs!17688 d!84681))

(assert (=> bs!17688 m!548931))

(declare-fun m!549209 () Bool)

(assert (=> bs!17688 m!549209))

(assert (=> bs!17688 m!548921))

(assert (=> b!569993 d!84681))

(declare-fun b!570367 () Bool)

(declare-fun c!65459 () Bool)

(declare-fun lt!260003 () (_ BitVec 64))

(assert (=> b!570367 (= c!65459 (= lt!260003 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!328037 () SeekEntryResult!5606)

(declare-fun e!328036 () SeekEntryResult!5606)

(assert (=> b!570367 (= e!328037 e!328036)))

(declare-fun b!570368 () Bool)

(declare-fun e!328038 () SeekEntryResult!5606)

(assert (=> b!570368 (= e!328038 Undefined!5606)))

(declare-fun d!84685 () Bool)

(declare-fun lt!260005 () SeekEntryResult!5606)

(assert (=> d!84685 (and (or (is-Undefined!5606 lt!260005) (not (is-Found!5606 lt!260005)) (and (bvsge (index!24652 lt!260005) #b00000000000000000000000000000000) (bvslt (index!24652 lt!260005) (size!17521 a!3118)))) (or (is-Undefined!5606 lt!260005) (is-Found!5606 lt!260005) (not (is-MissingZero!5606 lt!260005)) (and (bvsge (index!24651 lt!260005) #b00000000000000000000000000000000) (bvslt (index!24651 lt!260005) (size!17521 a!3118)))) (or (is-Undefined!5606 lt!260005) (is-Found!5606 lt!260005) (is-MissingZero!5606 lt!260005) (not (is-MissingVacant!5606 lt!260005)) (and (bvsge (index!24654 lt!260005) #b00000000000000000000000000000000) (bvslt (index!24654 lt!260005) (size!17521 a!3118)))) (or (is-Undefined!5606 lt!260005) (ite (is-Found!5606 lt!260005) (= (select (arr!17157 a!3118) (index!24652 lt!260005)) k!1914) (ite (is-MissingZero!5606 lt!260005) (= (select (arr!17157 a!3118) (index!24651 lt!260005)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5606 lt!260005) (= (select (arr!17157 a!3118) (index!24654 lt!260005)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84685 (= lt!260005 e!328038)))

(declare-fun c!65460 () Bool)

(declare-fun lt!260004 () SeekEntryResult!5606)

(assert (=> d!84685 (= c!65460 (and (is-Intermediate!5606 lt!260004) (undefined!6418 lt!260004)))))

(assert (=> d!84685 (= lt!260004 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!84685 (validMask!0 mask!3119)))

(assert (=> d!84685 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!260005)))

(declare-fun b!570369 () Bool)

(assert (=> b!570369 (= e!328036 (MissingZero!5606 (index!24653 lt!260004)))))

(declare-fun b!570370 () Bool)

(assert (=> b!570370 (= e!328038 e!328037)))

(assert (=> b!570370 (= lt!260003 (select (arr!17157 a!3118) (index!24653 lt!260004)))))

(declare-fun c!65458 () Bool)

(assert (=> b!570370 (= c!65458 (= lt!260003 k!1914))))

(declare-fun b!570371 () Bool)

(assert (=> b!570371 (= e!328037 (Found!5606 (index!24653 lt!260004)))))

(declare-fun b!570372 () Bool)

(assert (=> b!570372 (= e!328036 (seekKeyOrZeroReturnVacant!0 (x!53521 lt!260004) (index!24653 lt!260004) (index!24653 lt!260004) k!1914 a!3118 mask!3119))))

(assert (= (and d!84685 c!65460) b!570368))

(assert (= (and d!84685 (not c!65460)) b!570370))

(assert (= (and b!570370 c!65458) b!570371))

(assert (= (and b!570370 (not c!65458)) b!570367))

(assert (= (and b!570367 c!65459) b!570369))

(assert (= (and b!570367 (not c!65459)) b!570372))

(declare-fun m!549211 () Bool)

(assert (=> d!84685 m!549211))

(assert (=> d!84685 m!548921))

(declare-fun m!549213 () Bool)

(assert (=> d!84685 m!549213))

(declare-fun m!549215 () Bool)

(assert (=> d!84685 m!549215))

(assert (=> d!84685 m!549211))

(declare-fun m!549217 () Bool)

(assert (=> d!84685 m!549217))

(declare-fun m!549219 () Bool)

(assert (=> d!84685 m!549219))

(declare-fun m!549221 () Bool)

(assert (=> b!570370 m!549221))

(declare-fun m!549223 () Bool)

(assert (=> b!570372 m!549223))

(assert (=> b!569988 d!84685))

(declare-fun d!84687 () Bool)

(declare-fun res!360168 () Bool)

(declare-fun e!328043 () Bool)

(assert (=> d!84687 (=> res!360168 e!328043)))

(assert (=> d!84687 (= res!360168 (= (select (arr!17157 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!84687 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!328043)))

(declare-fun b!570377 () Bool)

(declare-fun e!328044 () Bool)

(assert (=> b!570377 (= e!328043 e!328044)))

(declare-fun res!360169 () Bool)

(assert (=> b!570377 (=> (not res!360169) (not e!328044))))

(assert (=> b!570377 (= res!360169 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17521 a!3118)))))

(declare-fun b!570378 () Bool)

(assert (=> b!570378 (= e!328044 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84687 (not res!360168)) b!570377))

(assert (= (and b!570377 res!360169) b!570378))

(assert (=> d!84687 m!549025))

(declare-fun m!549225 () Bool)

(assert (=> b!570378 m!549225))

(assert (=> b!569992 d!84687))

(declare-fun b!570379 () Bool)

(declare-fun e!328046 () Bool)

(declare-fun call!32599 () Bool)

(assert (=> b!570379 (= e!328046 call!32599)))

(declare-fun b!570380 () Bool)

(declare-fun e!328047 () Bool)

(assert (=> b!570380 (= e!328047 call!32599)))

(declare-fun bm!32596 () Bool)

(assert (=> bm!32596 (= call!32599 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun d!84689 () Bool)

(declare-fun res!360170 () Bool)

(declare-fun e!328045 () Bool)

(assert (=> d!84689 (=> res!360170 e!328045)))

(assert (=> d!84689 (= res!360170 (bvsge #b00000000000000000000000000000000 (size!17521 a!3118)))))

(assert (=> d!84689 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!328045)))

(declare-fun b!570381 () Bool)

(assert (=> b!570381 (= e!328047 e!328046)))

(declare-fun lt!260007 () (_ BitVec 64))

(assert (=> b!570381 (= lt!260007 (select (arr!17157 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!260008 () Unit!17914)

(assert (=> b!570381 (= lt!260008 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!260007 #b00000000000000000000000000000000))))

(assert (=> b!570381 (arrayContainsKey!0 a!3118 lt!260007 #b00000000000000000000000000000000)))

(declare-fun lt!260006 () Unit!17914)

(assert (=> b!570381 (= lt!260006 lt!260008)))

(declare-fun res!360171 () Bool)

(assert (=> b!570381 (= res!360171 (= (seekEntryOrOpen!0 (select (arr!17157 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5606 #b00000000000000000000000000000000)))))

(assert (=> b!570381 (=> (not res!360171) (not e!328046))))

(declare-fun b!570382 () Bool)

(assert (=> b!570382 (= e!328045 e!328047)))

(declare-fun c!65461 () Bool)

(assert (=> b!570382 (= c!65461 (validKeyInArray!0 (select (arr!17157 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!84689 (not res!360170)) b!570382))

(assert (= (and b!570382 c!65461) b!570381))

(assert (= (and b!570382 (not c!65461)) b!570380))

(assert (= (and b!570381 res!360171) b!570379))

(assert (= (or b!570379 b!570380) bm!32596))

(declare-fun m!549227 () Bool)

(assert (=> bm!32596 m!549227))

(assert (=> b!570381 m!549025))

(declare-fun m!549229 () Bool)

(assert (=> b!570381 m!549229))

(declare-fun m!549231 () Bool)

(assert (=> b!570381 m!549231))

(assert (=> b!570381 m!549025))

(declare-fun m!549233 () Bool)

(assert (=> b!570381 m!549233))

(assert (=> b!570382 m!549025))

(assert (=> b!570382 m!549025))

(assert (=> b!570382 m!549027))

(assert (=> b!569991 d!84689))

(push 1)

