; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67702 () Bool)

(assert start!67702)

(declare-fun b!784931 () Bool)

(declare-fun res!531255 () Bool)

(declare-fun e!436395 () Bool)

(assert (=> b!784931 (=> (not res!531255) (not e!436395))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((array!42742 0))(
  ( (array!42743 (arr!20459 (Array (_ BitVec 32) (_ BitVec 64))) (size!20880 (_ BitVec 32))) )
))
(declare-fun lt!349945 () array!42742)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!349942 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8059 0))(
  ( (MissingZero!8059 (index!34604 (_ BitVec 32))) (Found!8059 (index!34605 (_ BitVec 32))) (Intermediate!8059 (undefined!8871 Bool) (index!34606 (_ BitVec 32)) (x!65551 (_ BitVec 32))) (Undefined!8059) (MissingVacant!8059 (index!34607 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42742 (_ BitVec 32)) SeekEntryResult!8059)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42742 (_ BitVec 32)) SeekEntryResult!8059)

(assert (=> b!784931 (= res!531255 (= (seekEntryOrOpen!0 lt!349942 lt!349945 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349942 lt!349945 mask!3328)))))

(declare-fun b!784932 () Bool)

(declare-fun e!436397 () Bool)

(declare-fun e!436393 () Bool)

(assert (=> b!784932 (= e!436397 e!436393)))

(declare-fun res!531250 () Bool)

(assert (=> b!784932 (=> (not res!531250) (not e!436393))))

(declare-fun lt!349947 () SeekEntryResult!8059)

(declare-fun a!3186 () array!42742)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42742 (_ BitVec 32)) SeekEntryResult!8059)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!784932 (= res!531250 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20459 a!3186) j!159) mask!3328) (select (arr!20459 a!3186) j!159) a!3186 mask!3328) lt!349947))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!784932 (= lt!349947 (Intermediate!8059 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!784933 () Bool)

(declare-datatypes ((Unit!27124 0))(
  ( (Unit!27125) )
))
(declare-fun e!436399 () Unit!27124)

(declare-fun Unit!27126 () Unit!27124)

(assert (=> b!784933 (= e!436399 Unit!27126)))

(declare-fun b!784934 () Bool)

(declare-fun res!531244 () Bool)

(assert (=> b!784934 (=> (not res!531244) (not e!436397))))

(assert (=> b!784934 (= res!531244 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20880 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20880 a!3186))))))

(declare-fun b!784935 () Bool)

(declare-fun res!531258 () Bool)

(declare-fun e!436391 () Bool)

(assert (=> b!784935 (=> (not res!531258) (not e!436391))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!784935 (= res!531258 (and (= (size!20880 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20880 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20880 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!531246 () Bool)

(assert (=> start!67702 (=> (not res!531246) (not e!436391))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67702 (= res!531246 (validMask!0 mask!3328))))

(assert (=> start!67702 e!436391))

(assert (=> start!67702 true))

(declare-fun array_inv!16255 (array!42742) Bool)

(assert (=> start!67702 (array_inv!16255 a!3186)))

(declare-fun b!784936 () Bool)

(declare-fun res!531245 () Bool)

(assert (=> b!784936 (=> (not res!531245) (not e!436393))))

(declare-fun e!436398 () Bool)

(assert (=> b!784936 (= res!531245 e!436398)))

(declare-fun c!87252 () Bool)

(assert (=> b!784936 (= c!87252 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!784937 () Bool)

(declare-fun res!531260 () Bool)

(assert (=> b!784937 (=> (not res!531260) (not e!436391))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!784937 (= res!531260 (validKeyInArray!0 (select (arr!20459 a!3186) j!159)))))

(declare-fun b!784938 () Bool)

(declare-fun res!531256 () Bool)

(assert (=> b!784938 (=> (not res!531256) (not e!436393))))

(assert (=> b!784938 (= res!531256 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20459 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!784939 () Bool)

(assert (=> b!784939 (= e!436398 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20459 a!3186) j!159) a!3186 mask!3328) (Found!8059 j!159)))))

(declare-fun b!784940 () Bool)

(declare-fun res!531252 () Bool)

(assert (=> b!784940 (=> (not res!531252) (not e!436397))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42742 (_ BitVec 32)) Bool)

(assert (=> b!784940 (= res!531252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!784941 () Bool)

(assert (=> b!784941 (= e!436398 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20459 a!3186) j!159) a!3186 mask!3328) lt!349947))))

(declare-fun b!784942 () Bool)

(declare-fun e!436400 () Bool)

(declare-fun lt!349948 () SeekEntryResult!8059)

(assert (=> b!784942 (= e!436400 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20459 a!3186) j!159) a!3186 mask!3328) lt!349948))))

(declare-fun b!784943 () Bool)

(declare-fun res!531248 () Bool)

(assert (=> b!784943 (=> (not res!531248) (not e!436391))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!784943 (= res!531248 (validKeyInArray!0 k!2102))))

(declare-fun b!784944 () Bool)

(declare-fun e!436394 () Bool)

(assert (=> b!784944 (= e!436394 true)))

(assert (=> b!784944 e!436395))

(declare-fun res!531254 () Bool)

(assert (=> b!784944 (=> (not res!531254) (not e!436395))))

(declare-fun lt!349951 () (_ BitVec 64))

(assert (=> b!784944 (= res!531254 (= lt!349951 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!349941 () Unit!27124)

(assert (=> b!784944 (= lt!349941 e!436399)))

(declare-fun c!87253 () Bool)

(assert (=> b!784944 (= c!87253 (= lt!349951 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!784945 () Bool)

(assert (=> b!784945 (= e!436391 e!436397)))

(declare-fun res!531242 () Bool)

(assert (=> b!784945 (=> (not res!531242) (not e!436397))))

(declare-fun lt!349943 () SeekEntryResult!8059)

(assert (=> b!784945 (= res!531242 (or (= lt!349943 (MissingZero!8059 i!1173)) (= lt!349943 (MissingVacant!8059 i!1173))))))

(assert (=> b!784945 (= lt!349943 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!784946 () Bool)

(declare-fun res!531253 () Bool)

(assert (=> b!784946 (=> (not res!531253) (not e!436397))))

(declare-datatypes ((List!14461 0))(
  ( (Nil!14458) (Cons!14457 (h!15580 (_ BitVec 64)) (t!20776 List!14461)) )
))
(declare-fun arrayNoDuplicates!0 (array!42742 (_ BitVec 32) List!14461) Bool)

(assert (=> b!784946 (= res!531253 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14458))))

(declare-fun b!784947 () Bool)

(declare-fun Unit!27127 () Unit!27124)

(assert (=> b!784947 (= e!436399 Unit!27127)))

(assert (=> b!784947 false))

(declare-fun b!784948 () Bool)

(declare-fun res!531243 () Bool)

(assert (=> b!784948 (=> (not res!531243) (not e!436391))))

(declare-fun arrayContainsKey!0 (array!42742 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!784948 (= res!531243 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!784949 () Bool)

(declare-fun e!436390 () Bool)

(assert (=> b!784949 (= e!436393 e!436390)))

(declare-fun res!531247 () Bool)

(assert (=> b!784949 (=> (not res!531247) (not e!436390))))

(declare-fun lt!349950 () SeekEntryResult!8059)

(declare-fun lt!349952 () SeekEntryResult!8059)

(assert (=> b!784949 (= res!531247 (= lt!349950 lt!349952))))

(assert (=> b!784949 (= lt!349952 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349942 lt!349945 mask!3328))))

(assert (=> b!784949 (= lt!349950 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349942 mask!3328) lt!349942 lt!349945 mask!3328))))

(assert (=> b!784949 (= lt!349942 (select (store (arr!20459 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!784949 (= lt!349945 (array!42743 (store (arr!20459 a!3186) i!1173 k!2102) (size!20880 a!3186)))))

(declare-fun b!784950 () Bool)

(declare-fun e!436389 () Bool)

(assert (=> b!784950 (= e!436389 e!436394)))

(declare-fun res!531257 () Bool)

(assert (=> b!784950 (=> res!531257 e!436394)))

(assert (=> b!784950 (= res!531257 (= lt!349951 lt!349942))))

(assert (=> b!784950 (= lt!349951 (select (store (arr!20459 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!784951 () Bool)

(declare-fun lt!349944 () SeekEntryResult!8059)

(declare-fun lt!349949 () SeekEntryResult!8059)

(assert (=> b!784951 (= e!436395 (= lt!349944 lt!349949))))

(declare-fun b!784952 () Bool)

(declare-fun e!436396 () Bool)

(assert (=> b!784952 (= e!436390 (not e!436396))))

(declare-fun res!531249 () Bool)

(assert (=> b!784952 (=> res!531249 e!436396)))

(assert (=> b!784952 (= res!531249 (or (not (is-Intermediate!8059 lt!349952)) (bvslt x!1131 (x!65551 lt!349952)) (not (= x!1131 (x!65551 lt!349952))) (not (= index!1321 (index!34606 lt!349952)))))))

(assert (=> b!784952 e!436400))

(declare-fun res!531259 () Bool)

(assert (=> b!784952 (=> (not res!531259) (not e!436400))))

(assert (=> b!784952 (= res!531259 (= lt!349944 lt!349948))))

(assert (=> b!784952 (= lt!349948 (Found!8059 j!159))))

(assert (=> b!784952 (= lt!349944 (seekEntryOrOpen!0 (select (arr!20459 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!784952 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!349946 () Unit!27124)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42742 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27124)

(assert (=> b!784952 (= lt!349946 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!784953 () Bool)

(assert (=> b!784953 (= e!436396 e!436389)))

(declare-fun res!531251 () Bool)

(assert (=> b!784953 (=> res!531251 e!436389)))

(assert (=> b!784953 (= res!531251 (not (= lt!349949 lt!349948)))))

(assert (=> b!784953 (= lt!349949 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20459 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and start!67702 res!531246) b!784935))

(assert (= (and b!784935 res!531258) b!784937))

(assert (= (and b!784937 res!531260) b!784943))

(assert (= (and b!784943 res!531248) b!784948))

(assert (= (and b!784948 res!531243) b!784945))

(assert (= (and b!784945 res!531242) b!784940))

(assert (= (and b!784940 res!531252) b!784946))

(assert (= (and b!784946 res!531253) b!784934))

(assert (= (and b!784934 res!531244) b!784932))

(assert (= (and b!784932 res!531250) b!784938))

(assert (= (and b!784938 res!531256) b!784936))

(assert (= (and b!784936 c!87252) b!784941))

(assert (= (and b!784936 (not c!87252)) b!784939))

(assert (= (and b!784936 res!531245) b!784949))

(assert (= (and b!784949 res!531247) b!784952))

(assert (= (and b!784952 res!531259) b!784942))

(assert (= (and b!784952 (not res!531249)) b!784953))

(assert (= (and b!784953 (not res!531251)) b!784950))

(assert (= (and b!784950 (not res!531257)) b!784944))

(assert (= (and b!784944 c!87253) b!784947))

(assert (= (and b!784944 (not c!87253)) b!784933))

(assert (= (and b!784944 res!531254) b!784931))

(assert (= (and b!784931 res!531255) b!784951))

(declare-fun m!727129 () Bool)

(assert (=> b!784943 m!727129))

(declare-fun m!727131 () Bool)

(assert (=> b!784938 m!727131))

(declare-fun m!727133 () Bool)

(assert (=> b!784931 m!727133))

(declare-fun m!727135 () Bool)

(assert (=> b!784931 m!727135))

(declare-fun m!727137 () Bool)

(assert (=> b!784939 m!727137))

(assert (=> b!784939 m!727137))

(declare-fun m!727139 () Bool)

(assert (=> b!784939 m!727139))

(declare-fun m!727141 () Bool)

(assert (=> b!784945 m!727141))

(declare-fun m!727143 () Bool)

(assert (=> start!67702 m!727143))

(declare-fun m!727145 () Bool)

(assert (=> start!67702 m!727145))

(assert (=> b!784952 m!727137))

(assert (=> b!784952 m!727137))

(declare-fun m!727147 () Bool)

(assert (=> b!784952 m!727147))

(declare-fun m!727149 () Bool)

(assert (=> b!784952 m!727149))

(declare-fun m!727151 () Bool)

(assert (=> b!784952 m!727151))

(assert (=> b!784953 m!727137))

(assert (=> b!784953 m!727137))

(assert (=> b!784953 m!727139))

(assert (=> b!784941 m!727137))

(assert (=> b!784941 m!727137))

(declare-fun m!727153 () Bool)

(assert (=> b!784941 m!727153))

(declare-fun m!727155 () Bool)

(assert (=> b!784948 m!727155))

(assert (=> b!784932 m!727137))

(assert (=> b!784932 m!727137))

(declare-fun m!727157 () Bool)

(assert (=> b!784932 m!727157))

(assert (=> b!784932 m!727157))

(assert (=> b!784932 m!727137))

(declare-fun m!727159 () Bool)

(assert (=> b!784932 m!727159))

(declare-fun m!727161 () Bool)

(assert (=> b!784946 m!727161))

(declare-fun m!727163 () Bool)

(assert (=> b!784949 m!727163))

(declare-fun m!727165 () Bool)

(assert (=> b!784949 m!727165))

(declare-fun m!727167 () Bool)

(assert (=> b!784949 m!727167))

(declare-fun m!727169 () Bool)

(assert (=> b!784949 m!727169))

(declare-fun m!727171 () Bool)

(assert (=> b!784949 m!727171))

(assert (=> b!784949 m!727163))

(assert (=> b!784937 m!727137))

(assert (=> b!784937 m!727137))

(declare-fun m!727173 () Bool)

(assert (=> b!784937 m!727173))

(assert (=> b!784942 m!727137))

(assert (=> b!784942 m!727137))

(declare-fun m!727175 () Bool)

(assert (=> b!784942 m!727175))

(declare-fun m!727177 () Bool)

(assert (=> b!784940 m!727177))

(assert (=> b!784950 m!727171))

(declare-fun m!727179 () Bool)

(assert (=> b!784950 m!727179))

(push 1)

