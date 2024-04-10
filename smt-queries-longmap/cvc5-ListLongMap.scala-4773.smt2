; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65698 () Bool)

(assert start!65698)

(declare-fun b!753494 () Bool)

(declare-fun e!420261 () Bool)

(declare-datatypes ((SeekEntryResult!7649 0))(
  ( (MissingZero!7649 (index!32964 (_ BitVec 32))) (Found!7649 (index!32965 (_ BitVec 32))) (Intermediate!7649 (undefined!8461 Bool) (index!32966 (_ BitVec 32)) (x!63879 (_ BitVec 32))) (Undefined!7649) (MissingVacant!7649 (index!32967 (_ BitVec 32))) )
))
(declare-fun lt!335259 () SeekEntryResult!7649)

(declare-fun lt!335261 () SeekEntryResult!7649)

(assert (=> b!753494 (= e!420261 (= lt!335259 lt!335261))))

(declare-fun b!753495 () Bool)

(declare-fun res!509016 () Bool)

(declare-fun e!420259 () Bool)

(assert (=> b!753495 (=> (not res!509016) (not e!420259))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!753495 (= res!509016 (validKeyInArray!0 k!2102))))

(declare-fun b!753497 () Bool)

(declare-fun e!420268 () Bool)

(declare-fun e!420264 () Bool)

(assert (=> b!753497 (= e!420268 e!420264)))

(declare-fun res!509021 () Bool)

(assert (=> b!753497 (=> (not res!509021) (not e!420264))))

(declare-fun lt!335251 () SeekEntryResult!7649)

(declare-fun lt!335250 () SeekEntryResult!7649)

(assert (=> b!753497 (= res!509021 (= lt!335251 lt!335250))))

(declare-datatypes ((array!41871 0))(
  ( (array!41872 (arr!20049 (Array (_ BitVec 32) (_ BitVec 64))) (size!20470 (_ BitVec 32))) )
))
(declare-fun lt!335256 () array!41871)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!335255 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41871 (_ BitVec 32)) SeekEntryResult!7649)

(assert (=> b!753497 (= lt!335250 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335255 lt!335256 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!753497 (= lt!335251 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335255 mask!3328) lt!335255 lt!335256 mask!3328))))

(declare-fun a!3186 () array!41871)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!753497 (= lt!335255 (select (store (arr!20049 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!753497 (= lt!335256 (array!41872 (store (arr!20049 a!3186) i!1173 k!2102) (size!20470 a!3186)))))

(declare-fun b!753498 () Bool)

(declare-fun e!420258 () Bool)

(declare-fun e!420266 () Bool)

(assert (=> b!753498 (= e!420258 e!420266)))

(declare-fun res!509010 () Bool)

(assert (=> b!753498 (=> res!509010 e!420266)))

(declare-fun lt!335258 () (_ BitVec 64))

(assert (=> b!753498 (= res!509010 (= lt!335258 lt!335255))))

(assert (=> b!753498 (= lt!335258 (select (store (arr!20049 a!3186) i!1173 k!2102) index!1321))))

(declare-fun lt!335260 () SeekEntryResult!7649)

(declare-fun e!420260 () Bool)

(declare-fun b!753499 () Bool)

(assert (=> b!753499 (= e!420260 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20049 a!3186) j!159) a!3186 mask!3328) lt!335260))))

(declare-fun e!420265 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!753500 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun lt!335252 () SeekEntryResult!7649)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41871 (_ BitVec 32)) SeekEntryResult!7649)

(assert (=> b!753500 (= e!420265 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20049 a!3186) j!159) a!3186 mask!3328) lt!335252))))

(declare-fun b!753501 () Bool)

(assert (=> b!753501 (= e!420266 true)))

(assert (=> b!753501 e!420261))

(declare-fun res!509017 () Bool)

(assert (=> b!753501 (=> (not res!509017) (not e!420261))))

(assert (=> b!753501 (= res!509017 (= lt!335258 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!25976 0))(
  ( (Unit!25977) )
))
(declare-fun lt!335253 () Unit!25976)

(declare-fun e!420267 () Unit!25976)

(assert (=> b!753501 (= lt!335253 e!420267)))

(declare-fun c!82623 () Bool)

(assert (=> b!753501 (= c!82623 (= lt!335258 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!753502 () Bool)

(declare-fun res!509009 () Bool)

(assert (=> b!753502 (=> (not res!509009) (not e!420268))))

(assert (=> b!753502 (= res!509009 e!420260)))

(declare-fun c!82624 () Bool)

(assert (=> b!753502 (= c!82624 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!753503 () Bool)

(declare-fun res!509013 () Bool)

(assert (=> b!753503 (=> (not res!509013) (not e!420259))))

(assert (=> b!753503 (= res!509013 (and (= (size!20470 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20470 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20470 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!753504 () Bool)

(declare-fun Unit!25978 () Unit!25976)

(assert (=> b!753504 (= e!420267 Unit!25978)))

(declare-fun b!753505 () Bool)

(declare-fun res!509019 () Bool)

(declare-fun e!420269 () Bool)

(assert (=> b!753505 (=> (not res!509019) (not e!420269))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41871 (_ BitVec 32)) Bool)

(assert (=> b!753505 (= res!509019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!753506 () Bool)

(declare-fun res!509020 () Bool)

(assert (=> b!753506 (=> (not res!509020) (not e!420269))))

(declare-datatypes ((List!14051 0))(
  ( (Nil!14048) (Cons!14047 (h!15119 (_ BitVec 64)) (t!20366 List!14051)) )
))
(declare-fun arrayNoDuplicates!0 (array!41871 (_ BitVec 32) List!14051) Bool)

(assert (=> b!753506 (= res!509020 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14048))))

(declare-fun res!509025 () Bool)

(assert (=> start!65698 (=> (not res!509025) (not e!420259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65698 (= res!509025 (validMask!0 mask!3328))))

(assert (=> start!65698 e!420259))

(assert (=> start!65698 true))

(declare-fun array_inv!15845 (array!41871) Bool)

(assert (=> start!65698 (array_inv!15845 a!3186)))

(declare-fun b!753496 () Bool)

(declare-fun res!509026 () Bool)

(assert (=> b!753496 (=> (not res!509026) (not e!420268))))

(assert (=> b!753496 (= res!509026 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20049 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!753507 () Bool)

(declare-fun e!420262 () Bool)

(assert (=> b!753507 (= e!420262 e!420258)))

(declare-fun res!509023 () Bool)

(assert (=> b!753507 (=> res!509023 e!420258)))

(assert (=> b!753507 (= res!509023 (not (= lt!335261 lt!335252)))))

(assert (=> b!753507 (= lt!335261 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20049 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!753508 () Bool)

(declare-fun res!509014 () Bool)

(assert (=> b!753508 (=> (not res!509014) (not e!420261))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41871 (_ BitVec 32)) SeekEntryResult!7649)

(assert (=> b!753508 (= res!509014 (= (seekEntryOrOpen!0 lt!335255 lt!335256 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335255 lt!335256 mask!3328)))))

(declare-fun b!753509 () Bool)

(declare-fun res!509018 () Bool)

(assert (=> b!753509 (=> (not res!509018) (not e!420259))))

(declare-fun arrayContainsKey!0 (array!41871 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!753509 (= res!509018 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!753510 () Bool)

(declare-fun Unit!25979 () Unit!25976)

(assert (=> b!753510 (= e!420267 Unit!25979)))

(assert (=> b!753510 false))

(declare-fun b!753511 () Bool)

(assert (=> b!753511 (= e!420259 e!420269)))

(declare-fun res!509015 () Bool)

(assert (=> b!753511 (=> (not res!509015) (not e!420269))))

(declare-fun lt!335257 () SeekEntryResult!7649)

(assert (=> b!753511 (= res!509015 (or (= lt!335257 (MissingZero!7649 i!1173)) (= lt!335257 (MissingVacant!7649 i!1173))))))

(assert (=> b!753511 (= lt!335257 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!753512 () Bool)

(assert (=> b!753512 (= e!420264 (not e!420262))))

(declare-fun res!509011 () Bool)

(assert (=> b!753512 (=> res!509011 e!420262)))

(assert (=> b!753512 (= res!509011 (or (not (is-Intermediate!7649 lt!335250)) (bvslt x!1131 (x!63879 lt!335250)) (not (= x!1131 (x!63879 lt!335250))) (not (= index!1321 (index!32966 lt!335250)))))))

(assert (=> b!753512 e!420265))

(declare-fun res!509027 () Bool)

(assert (=> b!753512 (=> (not res!509027) (not e!420265))))

(assert (=> b!753512 (= res!509027 (= lt!335259 lt!335252))))

(assert (=> b!753512 (= lt!335252 (Found!7649 j!159))))

(assert (=> b!753512 (= lt!335259 (seekEntryOrOpen!0 (select (arr!20049 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!753512 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!335254 () Unit!25976)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41871 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25976)

(assert (=> b!753512 (= lt!335254 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!753513 () Bool)

(assert (=> b!753513 (= e!420269 e!420268)))

(declare-fun res!509012 () Bool)

(assert (=> b!753513 (=> (not res!509012) (not e!420268))))

(assert (=> b!753513 (= res!509012 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20049 a!3186) j!159) mask!3328) (select (arr!20049 a!3186) j!159) a!3186 mask!3328) lt!335260))))

(assert (=> b!753513 (= lt!335260 (Intermediate!7649 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!753514 () Bool)

(declare-fun res!509024 () Bool)

(assert (=> b!753514 (=> (not res!509024) (not e!420259))))

(assert (=> b!753514 (= res!509024 (validKeyInArray!0 (select (arr!20049 a!3186) j!159)))))

(declare-fun b!753515 () Bool)

(assert (=> b!753515 (= e!420260 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20049 a!3186) j!159) a!3186 mask!3328) (Found!7649 j!159)))))

(declare-fun b!753516 () Bool)

(declare-fun res!509022 () Bool)

(assert (=> b!753516 (=> (not res!509022) (not e!420269))))

(assert (=> b!753516 (= res!509022 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20470 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20470 a!3186))))))

(assert (= (and start!65698 res!509025) b!753503))

(assert (= (and b!753503 res!509013) b!753514))

(assert (= (and b!753514 res!509024) b!753495))

(assert (= (and b!753495 res!509016) b!753509))

(assert (= (and b!753509 res!509018) b!753511))

(assert (= (and b!753511 res!509015) b!753505))

(assert (= (and b!753505 res!509019) b!753506))

(assert (= (and b!753506 res!509020) b!753516))

(assert (= (and b!753516 res!509022) b!753513))

(assert (= (and b!753513 res!509012) b!753496))

(assert (= (and b!753496 res!509026) b!753502))

(assert (= (and b!753502 c!82624) b!753499))

(assert (= (and b!753502 (not c!82624)) b!753515))

(assert (= (and b!753502 res!509009) b!753497))

(assert (= (and b!753497 res!509021) b!753512))

(assert (= (and b!753512 res!509027) b!753500))

(assert (= (and b!753512 (not res!509011)) b!753507))

(assert (= (and b!753507 (not res!509023)) b!753498))

(assert (= (and b!753498 (not res!509010)) b!753501))

(assert (= (and b!753501 c!82623) b!753510))

(assert (= (and b!753501 (not c!82623)) b!753504))

(assert (= (and b!753501 res!509017) b!753508))

(assert (= (and b!753508 res!509014) b!753494))

(declare-fun m!702175 () Bool)

(assert (=> b!753505 m!702175))

(declare-fun m!702177 () Bool)

(assert (=> b!753513 m!702177))

(assert (=> b!753513 m!702177))

(declare-fun m!702179 () Bool)

(assert (=> b!753513 m!702179))

(assert (=> b!753513 m!702179))

(assert (=> b!753513 m!702177))

(declare-fun m!702181 () Bool)

(assert (=> b!753513 m!702181))

(declare-fun m!702183 () Bool)

(assert (=> b!753498 m!702183))

(declare-fun m!702185 () Bool)

(assert (=> b!753498 m!702185))

(declare-fun m!702187 () Bool)

(assert (=> b!753496 m!702187))

(assert (=> b!753507 m!702177))

(assert (=> b!753507 m!702177))

(declare-fun m!702189 () Bool)

(assert (=> b!753507 m!702189))

(declare-fun m!702191 () Bool)

(assert (=> b!753497 m!702191))

(assert (=> b!753497 m!702183))

(declare-fun m!702193 () Bool)

(assert (=> b!753497 m!702193))

(declare-fun m!702195 () Bool)

(assert (=> b!753497 m!702195))

(assert (=> b!753497 m!702191))

(declare-fun m!702197 () Bool)

(assert (=> b!753497 m!702197))

(assert (=> b!753499 m!702177))

(assert (=> b!753499 m!702177))

(declare-fun m!702199 () Bool)

(assert (=> b!753499 m!702199))

(assert (=> b!753512 m!702177))

(assert (=> b!753512 m!702177))

(declare-fun m!702201 () Bool)

(assert (=> b!753512 m!702201))

(declare-fun m!702203 () Bool)

(assert (=> b!753512 m!702203))

(declare-fun m!702205 () Bool)

(assert (=> b!753512 m!702205))

(assert (=> b!753514 m!702177))

(assert (=> b!753514 m!702177))

(declare-fun m!702207 () Bool)

(assert (=> b!753514 m!702207))

(assert (=> b!753500 m!702177))

(assert (=> b!753500 m!702177))

(declare-fun m!702209 () Bool)

(assert (=> b!753500 m!702209))

(declare-fun m!702211 () Bool)

(assert (=> b!753509 m!702211))

(declare-fun m!702213 () Bool)

(assert (=> b!753508 m!702213))

(declare-fun m!702215 () Bool)

(assert (=> b!753508 m!702215))

(declare-fun m!702217 () Bool)

(assert (=> start!65698 m!702217))

(declare-fun m!702219 () Bool)

(assert (=> start!65698 m!702219))

(declare-fun m!702221 () Bool)

(assert (=> b!753495 m!702221))

(assert (=> b!753515 m!702177))

(assert (=> b!753515 m!702177))

(assert (=> b!753515 m!702189))

(declare-fun m!702223 () Bool)

(assert (=> b!753506 m!702223))

(declare-fun m!702225 () Bool)

(assert (=> b!753511 m!702225))

(push 1)

