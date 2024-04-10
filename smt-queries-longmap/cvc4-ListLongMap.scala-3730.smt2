; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51378 () Bool)

(assert start!51378)

(declare-fun b!561062 () Bool)

(declare-fun e!323292 () Bool)

(declare-fun e!323294 () Bool)

(assert (=> b!561062 (= e!323292 e!323294)))

(declare-fun res!352215 () Bool)

(assert (=> b!561062 (=> (not res!352215) (not e!323294))))

(declare-datatypes ((SeekEntryResult!5371 0))(
  ( (MissingZero!5371 (index!23711 (_ BitVec 32))) (Found!5371 (index!23712 (_ BitVec 32))) (Intermediate!5371 (undefined!6183 Bool) (index!23713 (_ BitVec 32)) (x!52618 (_ BitVec 32))) (Undefined!5371) (MissingVacant!5371 (index!23714 (_ BitVec 32))) )
))
(declare-fun lt!255250 () SeekEntryResult!5371)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!561062 (= res!352215 (or (= lt!255250 (MissingZero!5371 i!1132)) (= lt!255250 (MissingVacant!5371 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!35243 0))(
  ( (array!35244 (arr!16922 (Array (_ BitVec 32) (_ BitVec 64))) (size!17286 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35243)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35243 (_ BitVec 32)) SeekEntryResult!5371)

(assert (=> b!561062 (= lt!255250 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!561063 () Bool)

(declare-fun e!323288 () Bool)

(assert (=> b!561063 (= e!323294 e!323288)))

(declare-fun res!352219 () Bool)

(assert (=> b!561063 (=> (not res!352219) (not e!323288))))

(declare-fun lt!255256 () (_ BitVec 64))

(declare-fun lt!255255 () (_ BitVec 32))

(declare-fun lt!255253 () array!35243)

(declare-fun lt!255252 () SeekEntryResult!5371)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35243 (_ BitVec 32)) SeekEntryResult!5371)

(assert (=> b!561063 (= res!352219 (= lt!255252 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255255 lt!255256 lt!255253 mask!3119)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!255248 () (_ BitVec 32))

(assert (=> b!561063 (= lt!255252 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255248 (select (arr!16922 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561063 (= lt!255255 (toIndex!0 lt!255256 mask!3119))))

(assert (=> b!561063 (= lt!255256 (select (store (arr!16922 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!561063 (= lt!255248 (toIndex!0 (select (arr!16922 a!3118) j!142) mask!3119))))

(assert (=> b!561063 (= lt!255253 (array!35244 (store (arr!16922 a!3118) i!1132 k!1914) (size!17286 a!3118)))))

(declare-fun b!561064 () Bool)

(declare-fun e!323290 () Bool)

(declare-fun e!323293 () Bool)

(assert (=> b!561064 (= e!323290 e!323293)))

(declare-fun res!352218 () Bool)

(assert (=> b!561064 (=> res!352218 e!323293)))

(declare-fun lt!255251 () (_ BitVec 64))

(assert (=> b!561064 (= res!352218 (or (= lt!255251 (select (arr!16922 a!3118) j!142)) (= lt!255251 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!561064 (= lt!255251 (select (arr!16922 a!3118) (index!23713 lt!255252)))))

(declare-fun b!561065 () Bool)

(declare-fun res!352220 () Bool)

(assert (=> b!561065 (=> (not res!352220) (not e!323292))))

(assert (=> b!561065 (= res!352220 (and (= (size!17286 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17286 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17286 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!561066 () Bool)

(declare-fun res!352222 () Bool)

(assert (=> b!561066 (=> (not res!352222) (not e!323294))))

(declare-datatypes ((List!11002 0))(
  ( (Nil!10999) (Cons!10998 (h!12001 (_ BitVec 64)) (t!17230 List!11002)) )
))
(declare-fun arrayNoDuplicates!0 (array!35243 (_ BitVec 32) List!11002) Bool)

(assert (=> b!561066 (= res!352222 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10999))))

(declare-fun b!561067 () Bool)

(declare-fun res!352221 () Bool)

(assert (=> b!561067 (=> (not res!352221) (not e!323292))))

(declare-fun arrayContainsKey!0 (array!35243 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561067 (= res!352221 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!561068 () Bool)

(declare-fun res!352226 () Bool)

(assert (=> b!561068 (=> (not res!352226) (not e!323292))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561068 (= res!352226 (validKeyInArray!0 k!1914))))

(declare-fun b!561069 () Bool)

(declare-fun e!323291 () Bool)

(assert (=> b!561069 (= e!323291 e!323290)))

(declare-fun res!352225 () Bool)

(assert (=> b!561069 (=> res!352225 e!323290)))

(assert (=> b!561069 (= res!352225 (or (undefined!6183 lt!255252) (not (is-Intermediate!5371 lt!255252))))))

(declare-fun b!561070 () Bool)

(assert (=> b!561070 (= e!323288 (not true))))

(assert (=> b!561070 e!323291))

(declare-fun res!352217 () Bool)

(assert (=> b!561070 (=> (not res!352217) (not e!323291))))

(declare-fun lt!255254 () SeekEntryResult!5371)

(assert (=> b!561070 (= res!352217 (= lt!255254 (Found!5371 j!142)))))

(assert (=> b!561070 (= lt!255254 (seekEntryOrOpen!0 (select (arr!16922 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35243 (_ BitVec 32)) Bool)

(assert (=> b!561070 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17516 0))(
  ( (Unit!17517) )
))
(declare-fun lt!255249 () Unit!17516)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35243 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17516)

(assert (=> b!561070 (= lt!255249 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!352223 () Bool)

(assert (=> start!51378 (=> (not res!352223) (not e!323292))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51378 (= res!352223 (validMask!0 mask!3119))))

(assert (=> start!51378 e!323292))

(assert (=> start!51378 true))

(declare-fun array_inv!12718 (array!35243) Bool)

(assert (=> start!51378 (array_inv!12718 a!3118)))

(declare-fun b!561071 () Bool)

(declare-fun res!352224 () Bool)

(assert (=> b!561071 (=> (not res!352224) (not e!323292))))

(assert (=> b!561071 (= res!352224 (validKeyInArray!0 (select (arr!16922 a!3118) j!142)))))

(declare-fun b!561072 () Bool)

(declare-fun e!323295 () Bool)

(assert (=> b!561072 (= e!323293 e!323295)))

(declare-fun res!352214 () Bool)

(assert (=> b!561072 (=> (not res!352214) (not e!323295))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35243 (_ BitVec 32)) SeekEntryResult!5371)

(assert (=> b!561072 (= res!352214 (= lt!255254 (seekKeyOrZeroReturnVacant!0 (x!52618 lt!255252) (index!23713 lt!255252) (index!23713 lt!255252) (select (arr!16922 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!561073 () Bool)

(declare-fun res!352216 () Bool)

(assert (=> b!561073 (=> (not res!352216) (not e!323294))))

(assert (=> b!561073 (= res!352216 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!561074 () Bool)

(assert (=> b!561074 (= e!323295 (= (seekEntryOrOpen!0 lt!255256 lt!255253 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52618 lt!255252) (index!23713 lt!255252) (index!23713 lt!255252) lt!255256 lt!255253 mask!3119)))))

(assert (= (and start!51378 res!352223) b!561065))

(assert (= (and b!561065 res!352220) b!561071))

(assert (= (and b!561071 res!352224) b!561068))

(assert (= (and b!561068 res!352226) b!561067))

(assert (= (and b!561067 res!352221) b!561062))

(assert (= (and b!561062 res!352215) b!561073))

(assert (= (and b!561073 res!352216) b!561066))

(assert (= (and b!561066 res!352222) b!561063))

(assert (= (and b!561063 res!352219) b!561070))

(assert (= (and b!561070 res!352217) b!561069))

(assert (= (and b!561069 (not res!352225)) b!561064))

(assert (= (and b!561064 (not res!352218)) b!561072))

(assert (= (and b!561072 res!352214) b!561074))

(declare-fun m!538909 () Bool)

(assert (=> b!561073 m!538909))

(declare-fun m!538911 () Bool)

(assert (=> b!561071 m!538911))

(assert (=> b!561071 m!538911))

(declare-fun m!538913 () Bool)

(assert (=> b!561071 m!538913))

(assert (=> b!561063 m!538911))

(declare-fun m!538915 () Bool)

(assert (=> b!561063 m!538915))

(assert (=> b!561063 m!538911))

(declare-fun m!538917 () Bool)

(assert (=> b!561063 m!538917))

(declare-fun m!538919 () Bool)

(assert (=> b!561063 m!538919))

(assert (=> b!561063 m!538911))

(declare-fun m!538921 () Bool)

(assert (=> b!561063 m!538921))

(declare-fun m!538923 () Bool)

(assert (=> b!561063 m!538923))

(declare-fun m!538925 () Bool)

(assert (=> b!561063 m!538925))

(declare-fun m!538927 () Bool)

(assert (=> b!561068 m!538927))

(declare-fun m!538929 () Bool)

(assert (=> b!561067 m!538929))

(declare-fun m!538931 () Bool)

(assert (=> b!561066 m!538931))

(assert (=> b!561070 m!538911))

(assert (=> b!561070 m!538911))

(declare-fun m!538933 () Bool)

(assert (=> b!561070 m!538933))

(declare-fun m!538935 () Bool)

(assert (=> b!561070 m!538935))

(declare-fun m!538937 () Bool)

(assert (=> b!561070 m!538937))

(declare-fun m!538939 () Bool)

(assert (=> start!51378 m!538939))

(declare-fun m!538941 () Bool)

(assert (=> start!51378 m!538941))

(assert (=> b!561072 m!538911))

(assert (=> b!561072 m!538911))

(declare-fun m!538943 () Bool)

(assert (=> b!561072 m!538943))

(declare-fun m!538945 () Bool)

(assert (=> b!561074 m!538945))

(declare-fun m!538947 () Bool)

(assert (=> b!561074 m!538947))

(assert (=> b!561064 m!538911))

(declare-fun m!538949 () Bool)

(assert (=> b!561064 m!538949))

(declare-fun m!538951 () Bool)

(assert (=> b!561062 m!538951))

(push 1)

