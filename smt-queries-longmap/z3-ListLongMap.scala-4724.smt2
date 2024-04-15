; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65384 () Bool)

(assert start!65384)

(declare-fun b!744090 () Bool)

(declare-fun res!501228 () Bool)

(declare-fun e!415659 () Bool)

(assert (=> b!744090 (=> (not res!501228) (not e!415659))))

(declare-datatypes ((array!41574 0))(
  ( (array!41575 (arr!19901 (Array (_ BitVec 32) (_ BitVec 64))) (size!20322 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41574)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41574 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!744090 (= res!501228 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!744091 () Bool)

(declare-fun res!501227 () Bool)

(assert (=> b!744091 (=> (not res!501227) (not e!415659))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!744091 (= res!501227 (and (= (size!20322 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20322 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20322 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!744092 () Bool)

(declare-fun res!501239 () Bool)

(assert (=> b!744092 (=> (not res!501239) (not e!415659))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!744092 (= res!501239 (validKeyInArray!0 (select (arr!19901 a!3186) j!159)))))

(declare-fun b!744093 () Bool)

(declare-fun res!501234 () Bool)

(declare-fun e!415657 () Bool)

(assert (=> b!744093 (=> (not res!501234) (not e!415657))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!744093 (= res!501234 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19901 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!415660 () Bool)

(declare-fun b!744094 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7498 0))(
  ( (MissingZero!7498 (index!32360 (_ BitVec 32))) (Found!7498 (index!32361 (_ BitVec 32))) (Intermediate!7498 (undefined!8310 Bool) (index!32362 (_ BitVec 32)) (x!63331 (_ BitVec 32))) (Undefined!7498) (MissingVacant!7498 (index!32363 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41574 (_ BitVec 32)) SeekEntryResult!7498)

(assert (=> b!744094 (= e!415660 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19901 a!3186) j!159) a!3186 mask!3328) (Found!7498 j!159)))))

(declare-fun b!744095 () Bool)

(declare-fun res!501226 () Bool)

(declare-fun e!415658 () Bool)

(assert (=> b!744095 (=> (not res!501226) (not e!415658))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!744095 (= res!501226 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20322 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20322 a!3186))))))

(declare-fun b!744096 () Bool)

(declare-fun res!501240 () Bool)

(assert (=> b!744096 (=> (not res!501240) (not e!415657))))

(assert (=> b!744096 (= res!501240 e!415660)))

(declare-fun c!81813 () Bool)

(assert (=> b!744096 (= c!81813 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!744098 () Bool)

(declare-fun e!415654 () Bool)

(declare-fun e!415653 () Bool)

(assert (=> b!744098 (= e!415654 e!415653)))

(declare-fun res!501231 () Bool)

(assert (=> b!744098 (=> (not res!501231) (not e!415653))))

(declare-fun lt!330428 () SeekEntryResult!7498)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41574 (_ BitVec 32)) SeekEntryResult!7498)

(assert (=> b!744098 (= res!501231 (= (seekEntryOrOpen!0 (select (arr!19901 a!3186) j!159) a!3186 mask!3328) lt!330428))))

(assert (=> b!744098 (= lt!330428 (Found!7498 j!159))))

(declare-fun b!744099 () Bool)

(declare-fun lt!330429 () SeekEntryResult!7498)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41574 (_ BitVec 32)) SeekEntryResult!7498)

(assert (=> b!744099 (= e!415660 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19901 a!3186) j!159) a!3186 mask!3328) lt!330429))))

(declare-fun b!744100 () Bool)

(assert (=> b!744100 (= e!415659 e!415658)))

(declare-fun res!501236 () Bool)

(assert (=> b!744100 (=> (not res!501236) (not e!415658))))

(declare-fun lt!330424 () SeekEntryResult!7498)

(assert (=> b!744100 (= res!501236 (or (= lt!330424 (MissingZero!7498 i!1173)) (= lt!330424 (MissingVacant!7498 i!1173))))))

(assert (=> b!744100 (= lt!330424 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!744101 () Bool)

(assert (=> b!744101 (= e!415658 e!415657)))

(declare-fun res!501229 () Bool)

(assert (=> b!744101 (=> (not res!501229) (not e!415657))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!744101 (= res!501229 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19901 a!3186) j!159) mask!3328) (select (arr!19901 a!3186) j!159) a!3186 mask!3328) lt!330429))))

(assert (=> b!744101 (= lt!330429 (Intermediate!7498 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!744102 () Bool)

(declare-fun e!415652 () Bool)

(assert (=> b!744102 (= e!415652 true)))

(declare-fun lt!330423 () SeekEntryResult!7498)

(assert (=> b!744102 (= lt!330423 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19901 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!744103 () Bool)

(declare-fun e!415656 () Bool)

(assert (=> b!744103 (= e!415656 (not e!415652))))

(declare-fun res!501238 () Bool)

(assert (=> b!744103 (=> res!501238 e!415652)))

(declare-fun lt!330425 () SeekEntryResult!7498)

(get-info :version)

(assert (=> b!744103 (= res!501238 (or (not ((_ is Intermediate!7498) lt!330425)) (bvslt x!1131 (x!63331 lt!330425)) (not (= x!1131 (x!63331 lt!330425))) (not (= index!1321 (index!32362 lt!330425)))))))

(assert (=> b!744103 e!415654))

(declare-fun res!501233 () Bool)

(assert (=> b!744103 (=> (not res!501233) (not e!415654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41574 (_ BitVec 32)) Bool)

(assert (=> b!744103 (= res!501233 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25448 0))(
  ( (Unit!25449) )
))
(declare-fun lt!330427 () Unit!25448)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41574 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25448)

(assert (=> b!744103 (= lt!330427 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!744104 () Bool)

(declare-fun res!501232 () Bool)

(assert (=> b!744104 (=> (not res!501232) (not e!415658))))

(assert (=> b!744104 (= res!501232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!744097 () Bool)

(declare-fun res!501230 () Bool)

(assert (=> b!744097 (=> (not res!501230) (not e!415659))))

(assert (=> b!744097 (= res!501230 (validKeyInArray!0 k0!2102))))

(declare-fun res!501237 () Bool)

(assert (=> start!65384 (=> (not res!501237) (not e!415659))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65384 (= res!501237 (validMask!0 mask!3328))))

(assert (=> start!65384 e!415659))

(assert (=> start!65384 true))

(declare-fun array_inv!15784 (array!41574) Bool)

(assert (=> start!65384 (array_inv!15784 a!3186)))

(declare-fun b!744105 () Bool)

(declare-fun res!501235 () Bool)

(assert (=> b!744105 (=> (not res!501235) (not e!415658))))

(declare-datatypes ((List!13942 0))(
  ( (Nil!13939) (Cons!13938 (h!15010 (_ BitVec 64)) (t!20248 List!13942)) )
))
(declare-fun arrayNoDuplicates!0 (array!41574 (_ BitVec 32) List!13942) Bool)

(assert (=> b!744105 (= res!501235 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13939))))

(declare-fun b!744106 () Bool)

(assert (=> b!744106 (= e!415653 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19901 a!3186) j!159) a!3186 mask!3328) lt!330428))))

(declare-fun b!744107 () Bool)

(assert (=> b!744107 (= e!415657 e!415656)))

(declare-fun res!501225 () Bool)

(assert (=> b!744107 (=> (not res!501225) (not e!415656))))

(declare-fun lt!330430 () SeekEntryResult!7498)

(assert (=> b!744107 (= res!501225 (= lt!330430 lt!330425))))

(declare-fun lt!330431 () array!41574)

(declare-fun lt!330426 () (_ BitVec 64))

(assert (=> b!744107 (= lt!330425 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330426 lt!330431 mask!3328))))

(assert (=> b!744107 (= lt!330430 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330426 mask!3328) lt!330426 lt!330431 mask!3328))))

(assert (=> b!744107 (= lt!330426 (select (store (arr!19901 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!744107 (= lt!330431 (array!41575 (store (arr!19901 a!3186) i!1173 k0!2102) (size!20322 a!3186)))))

(assert (= (and start!65384 res!501237) b!744091))

(assert (= (and b!744091 res!501227) b!744092))

(assert (= (and b!744092 res!501239) b!744097))

(assert (= (and b!744097 res!501230) b!744090))

(assert (= (and b!744090 res!501228) b!744100))

(assert (= (and b!744100 res!501236) b!744104))

(assert (= (and b!744104 res!501232) b!744105))

(assert (= (and b!744105 res!501235) b!744095))

(assert (= (and b!744095 res!501226) b!744101))

(assert (= (and b!744101 res!501229) b!744093))

(assert (= (and b!744093 res!501234) b!744096))

(assert (= (and b!744096 c!81813) b!744099))

(assert (= (and b!744096 (not c!81813)) b!744094))

(assert (= (and b!744096 res!501240) b!744107))

(assert (= (and b!744107 res!501225) b!744103))

(assert (= (and b!744103 res!501233) b!744098))

(assert (= (and b!744098 res!501231) b!744106))

(assert (= (and b!744103 (not res!501238)) b!744102))

(declare-fun m!694127 () Bool)

(assert (=> b!744094 m!694127))

(assert (=> b!744094 m!694127))

(declare-fun m!694129 () Bool)

(assert (=> b!744094 m!694129))

(assert (=> b!744102 m!694127))

(assert (=> b!744102 m!694127))

(assert (=> b!744102 m!694129))

(declare-fun m!694131 () Bool)

(assert (=> b!744097 m!694131))

(assert (=> b!744106 m!694127))

(assert (=> b!744106 m!694127))

(declare-fun m!694133 () Bool)

(assert (=> b!744106 m!694133))

(declare-fun m!694135 () Bool)

(assert (=> start!65384 m!694135))

(declare-fun m!694137 () Bool)

(assert (=> start!65384 m!694137))

(declare-fun m!694139 () Bool)

(assert (=> b!744103 m!694139))

(declare-fun m!694141 () Bool)

(assert (=> b!744103 m!694141))

(assert (=> b!744099 m!694127))

(assert (=> b!744099 m!694127))

(declare-fun m!694143 () Bool)

(assert (=> b!744099 m!694143))

(declare-fun m!694145 () Bool)

(assert (=> b!744104 m!694145))

(declare-fun m!694147 () Bool)

(assert (=> b!744093 m!694147))

(declare-fun m!694149 () Bool)

(assert (=> b!744100 m!694149))

(assert (=> b!744101 m!694127))

(assert (=> b!744101 m!694127))

(declare-fun m!694151 () Bool)

(assert (=> b!744101 m!694151))

(assert (=> b!744101 m!694151))

(assert (=> b!744101 m!694127))

(declare-fun m!694153 () Bool)

(assert (=> b!744101 m!694153))

(declare-fun m!694155 () Bool)

(assert (=> b!744090 m!694155))

(assert (=> b!744092 m!694127))

(assert (=> b!744092 m!694127))

(declare-fun m!694157 () Bool)

(assert (=> b!744092 m!694157))

(declare-fun m!694159 () Bool)

(assert (=> b!744105 m!694159))

(declare-fun m!694161 () Bool)

(assert (=> b!744107 m!694161))

(declare-fun m!694163 () Bool)

(assert (=> b!744107 m!694163))

(declare-fun m!694165 () Bool)

(assert (=> b!744107 m!694165))

(declare-fun m!694167 () Bool)

(assert (=> b!744107 m!694167))

(declare-fun m!694169 () Bool)

(assert (=> b!744107 m!694169))

(assert (=> b!744107 m!694163))

(assert (=> b!744098 m!694127))

(assert (=> b!744098 m!694127))

(declare-fun m!694171 () Bool)

(assert (=> b!744098 m!694171))

(check-sat (not b!744107) (not b!744099) (not b!744092) (not start!65384) (not b!744090) (not b!744097) (not b!744101) (not b!744105) (not b!744098) (not b!744094) (not b!744102) (not b!744106) (not b!744103) (not b!744104) (not b!744100))
(check-sat)
