; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67566 () Bool)

(assert start!67566)

(declare-fun b!782140 () Bool)

(declare-fun res!529202 () Bool)

(declare-fun e!434947 () Bool)

(assert (=> b!782140 (=> (not res!529202) (not e!434947))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!782140 (= res!529202 (validKeyInArray!0 k!2102))))

(declare-fun b!782141 () Bool)

(declare-fun res!529199 () Bool)

(assert (=> b!782141 (=> (not res!529199) (not e!434947))))

(declare-datatypes ((array!42669 0))(
  ( (array!42670 (arr!20424 (Array (_ BitVec 32) (_ BitVec 64))) (size!20845 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42669)

(declare-fun arrayContainsKey!0 (array!42669 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!782141 (= res!529199 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!782142 () Bool)

(declare-datatypes ((Unit!26984 0))(
  ( (Unit!26985) )
))
(declare-fun e!434950 () Unit!26984)

(declare-fun Unit!26986 () Unit!26984)

(assert (=> b!782142 (= e!434950 Unit!26986)))

(assert (=> b!782142 false))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!782143 () Bool)

(declare-fun e!434951 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8024 0))(
  ( (MissingZero!8024 (index!34464 (_ BitVec 32))) (Found!8024 (index!34465 (_ BitVec 32))) (Intermediate!8024 (undefined!8836 Bool) (index!34466 (_ BitVec 32)) (x!65419 (_ BitVec 32))) (Undefined!8024) (MissingVacant!8024 (index!34467 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42669 (_ BitVec 32)) SeekEntryResult!8024)

(assert (=> b!782143 (= e!434951 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20424 a!3186) j!159) a!3186 mask!3328) (Found!8024 j!159)))))

(declare-fun b!782144 () Bool)

(declare-fun res!529205 () Bool)

(declare-fun e!434948 () Bool)

(assert (=> b!782144 (=> res!529205 e!434948)))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun lt!348569 () (_ BitVec 64))

(assert (=> b!782144 (= res!529205 (= (select (store (arr!20424 a!3186) i!1173 k!2102) index!1321) lt!348569))))

(declare-fun b!782146 () Bool)

(declare-fun res!529200 () Bool)

(assert (=> b!782146 (=> res!529200 e!434948)))

(declare-fun lt!348568 () SeekEntryResult!8024)

(assert (=> b!782146 (= res!529200 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20424 a!3186) j!159) a!3186 mask!3328) lt!348568)))))

(declare-fun b!782147 () Bool)

(assert (=> b!782147 (= e!434948 true)))

(assert (=> b!782147 (= (select (store (arr!20424 a!3186) i!1173 k!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!348566 () Unit!26984)

(assert (=> b!782147 (= lt!348566 e!434950)))

(declare-fun c!86877 () Bool)

(assert (=> b!782147 (= c!86877 (= (select (store (arr!20424 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!782148 () Bool)

(declare-fun res!529214 () Bool)

(declare-fun e!434943 () Bool)

(assert (=> b!782148 (=> (not res!529214) (not e!434943))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!782148 (= res!529214 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20845 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20845 a!3186))))))

(declare-fun e!434949 () Bool)

(declare-fun b!782149 () Bool)

(assert (=> b!782149 (= e!434949 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20424 a!3186) j!159) a!3186 mask!3328) lt!348568))))

(declare-fun b!782150 () Bool)

(declare-fun res!529213 () Bool)

(assert (=> b!782150 (=> (not res!529213) (not e!434943))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42669 (_ BitVec 32)) Bool)

(assert (=> b!782150 (= res!529213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!782151 () Bool)

(declare-fun e!434946 () Bool)

(declare-fun e!434945 () Bool)

(assert (=> b!782151 (= e!434946 e!434945)))

(declare-fun res!529204 () Bool)

(assert (=> b!782151 (=> (not res!529204) (not e!434945))))

(declare-fun lt!348564 () SeekEntryResult!8024)

(declare-fun lt!348563 () SeekEntryResult!8024)

(assert (=> b!782151 (= res!529204 (= lt!348564 lt!348563))))

(declare-fun lt!348560 () array!42669)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42669 (_ BitVec 32)) SeekEntryResult!8024)

(assert (=> b!782151 (= lt!348563 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348569 lt!348560 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!782151 (= lt!348564 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348569 mask!3328) lt!348569 lt!348560 mask!3328))))

(assert (=> b!782151 (= lt!348569 (select (store (arr!20424 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!782151 (= lt!348560 (array!42670 (store (arr!20424 a!3186) i!1173 k!2102) (size!20845 a!3186)))))

(declare-fun b!782152 () Bool)

(declare-fun res!529208 () Bool)

(assert (=> b!782152 (=> (not res!529208) (not e!434947))))

(assert (=> b!782152 (= res!529208 (validKeyInArray!0 (select (arr!20424 a!3186) j!159)))))

(declare-fun b!782153 () Bool)

(assert (=> b!782153 (= e!434943 e!434946)))

(declare-fun res!529206 () Bool)

(assert (=> b!782153 (=> (not res!529206) (not e!434946))))

(declare-fun lt!348562 () SeekEntryResult!8024)

(assert (=> b!782153 (= res!529206 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20424 a!3186) j!159) mask!3328) (select (arr!20424 a!3186) j!159) a!3186 mask!3328) lt!348562))))

(assert (=> b!782153 (= lt!348562 (Intermediate!8024 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!782154 () Bool)

(declare-fun res!529210 () Bool)

(assert (=> b!782154 (=> (not res!529210) (not e!434946))))

(assert (=> b!782154 (= res!529210 e!434951)))

(declare-fun c!86878 () Bool)

(assert (=> b!782154 (= c!86878 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!782155 () Bool)

(assert (=> b!782155 (= e!434951 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20424 a!3186) j!159) a!3186 mask!3328) lt!348562))))

(declare-fun b!782156 () Bool)

(declare-fun Unit!26987 () Unit!26984)

(assert (=> b!782156 (= e!434950 Unit!26987)))

(declare-fun b!782157 () Bool)

(declare-fun res!529207 () Bool)

(assert (=> b!782157 (=> (not res!529207) (not e!434943))))

(declare-datatypes ((List!14426 0))(
  ( (Nil!14423) (Cons!14422 (h!15542 (_ BitVec 64)) (t!20741 List!14426)) )
))
(declare-fun arrayNoDuplicates!0 (array!42669 (_ BitVec 32) List!14426) Bool)

(assert (=> b!782157 (= res!529207 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14423))))

(declare-fun b!782158 () Bool)

(declare-fun res!529201 () Bool)

(assert (=> b!782158 (=> (not res!529201) (not e!434946))))

(assert (=> b!782158 (= res!529201 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20424 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!529198 () Bool)

(assert (=> start!67566 (=> (not res!529198) (not e!434947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67566 (= res!529198 (validMask!0 mask!3328))))

(assert (=> start!67566 e!434947))

(assert (=> start!67566 true))

(declare-fun array_inv!16220 (array!42669) Bool)

(assert (=> start!67566 (array_inv!16220 a!3186)))

(declare-fun b!782145 () Bool)

(assert (=> b!782145 (= e!434945 (not e!434948))))

(declare-fun res!529212 () Bool)

(assert (=> b!782145 (=> res!529212 e!434948)))

(assert (=> b!782145 (= res!529212 (or (not (is-Intermediate!8024 lt!348563)) (bvslt x!1131 (x!65419 lt!348563)) (not (= x!1131 (x!65419 lt!348563))) (not (= index!1321 (index!34466 lt!348563)))))))

(assert (=> b!782145 e!434949))

(declare-fun res!529203 () Bool)

(assert (=> b!782145 (=> (not res!529203) (not e!434949))))

(declare-fun lt!348567 () SeekEntryResult!8024)

(assert (=> b!782145 (= res!529203 (= lt!348567 lt!348568))))

(assert (=> b!782145 (= lt!348568 (Found!8024 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42669 (_ BitVec 32)) SeekEntryResult!8024)

(assert (=> b!782145 (= lt!348567 (seekEntryOrOpen!0 (select (arr!20424 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!782145 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!348565 () Unit!26984)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42669 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26984)

(assert (=> b!782145 (= lt!348565 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!782159 () Bool)

(declare-fun res!529211 () Bool)

(assert (=> b!782159 (=> (not res!529211) (not e!434947))))

(assert (=> b!782159 (= res!529211 (and (= (size!20845 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20845 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20845 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!782160 () Bool)

(assert (=> b!782160 (= e!434947 e!434943)))

(declare-fun res!529209 () Bool)

(assert (=> b!782160 (=> (not res!529209) (not e!434943))))

(declare-fun lt!348561 () SeekEntryResult!8024)

(assert (=> b!782160 (= res!529209 (or (= lt!348561 (MissingZero!8024 i!1173)) (= lt!348561 (MissingVacant!8024 i!1173))))))

(assert (=> b!782160 (= lt!348561 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!67566 res!529198) b!782159))

(assert (= (and b!782159 res!529211) b!782152))

(assert (= (and b!782152 res!529208) b!782140))

(assert (= (and b!782140 res!529202) b!782141))

(assert (= (and b!782141 res!529199) b!782160))

(assert (= (and b!782160 res!529209) b!782150))

(assert (= (and b!782150 res!529213) b!782157))

(assert (= (and b!782157 res!529207) b!782148))

(assert (= (and b!782148 res!529214) b!782153))

(assert (= (and b!782153 res!529206) b!782158))

(assert (= (and b!782158 res!529201) b!782154))

(assert (= (and b!782154 c!86878) b!782155))

(assert (= (and b!782154 (not c!86878)) b!782143))

(assert (= (and b!782154 res!529210) b!782151))

(assert (= (and b!782151 res!529204) b!782145))

(assert (= (and b!782145 res!529203) b!782149))

(assert (= (and b!782145 (not res!529212)) b!782146))

(assert (= (and b!782146 (not res!529200)) b!782144))

(assert (= (and b!782144 (not res!529205)) b!782147))

(assert (= (and b!782147 c!86877) b!782142))

(assert (= (and b!782147 (not c!86877)) b!782156))

(declare-fun m!725003 () Bool)

(assert (=> b!782147 m!725003))

(declare-fun m!725005 () Bool)

(assert (=> b!782147 m!725005))

(assert (=> b!782151 m!725003))

(declare-fun m!725007 () Bool)

(assert (=> b!782151 m!725007))

(declare-fun m!725009 () Bool)

(assert (=> b!782151 m!725009))

(declare-fun m!725011 () Bool)

(assert (=> b!782151 m!725011))

(assert (=> b!782151 m!725011))

(declare-fun m!725013 () Bool)

(assert (=> b!782151 m!725013))

(declare-fun m!725015 () Bool)

(assert (=> b!782160 m!725015))

(declare-fun m!725017 () Bool)

(assert (=> b!782157 m!725017))

(declare-fun m!725019 () Bool)

(assert (=> b!782155 m!725019))

(assert (=> b!782155 m!725019))

(declare-fun m!725021 () Bool)

(assert (=> b!782155 m!725021))

(declare-fun m!725023 () Bool)

(assert (=> b!782140 m!725023))

(declare-fun m!725025 () Bool)

(assert (=> start!67566 m!725025))

(declare-fun m!725027 () Bool)

(assert (=> start!67566 m!725027))

(assert (=> b!782144 m!725003))

(assert (=> b!782144 m!725005))

(assert (=> b!782143 m!725019))

(assert (=> b!782143 m!725019))

(declare-fun m!725029 () Bool)

(assert (=> b!782143 m!725029))

(assert (=> b!782153 m!725019))

(assert (=> b!782153 m!725019))

(declare-fun m!725031 () Bool)

(assert (=> b!782153 m!725031))

(assert (=> b!782153 m!725031))

(assert (=> b!782153 m!725019))

(declare-fun m!725033 () Bool)

(assert (=> b!782153 m!725033))

(declare-fun m!725035 () Bool)

(assert (=> b!782158 m!725035))

(declare-fun m!725037 () Bool)

(assert (=> b!782141 m!725037))

(declare-fun m!725039 () Bool)

(assert (=> b!782150 m!725039))

(assert (=> b!782152 m!725019))

(assert (=> b!782152 m!725019))

(declare-fun m!725041 () Bool)

(assert (=> b!782152 m!725041))

(assert (=> b!782145 m!725019))

(assert (=> b!782145 m!725019))

(declare-fun m!725043 () Bool)

(assert (=> b!782145 m!725043))

(declare-fun m!725045 () Bool)

(assert (=> b!782145 m!725045))

(declare-fun m!725047 () Bool)

(assert (=> b!782145 m!725047))

(assert (=> b!782146 m!725019))

(assert (=> b!782146 m!725019))

(assert (=> b!782146 m!725029))

(assert (=> b!782149 m!725019))

(assert (=> b!782149 m!725019))

(declare-fun m!725049 () Bool)

(assert (=> b!782149 m!725049))

(push 1)

