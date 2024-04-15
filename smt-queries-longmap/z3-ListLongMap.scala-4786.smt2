; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65756 () Bool)

(assert start!65756)

(declare-fun b!755935 () Bool)

(declare-fun res!511136 () Bool)

(declare-fun e!421510 () Bool)

(assert (=> b!755935 (=> (not res!511136) (not e!421510))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41946 0))(
  ( (array!41947 (arr!20087 (Array (_ BitVec 32) (_ BitVec 64))) (size!20508 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41946)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!755935 (= res!511136 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20087 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!755936 () Bool)

(declare-fun res!511122 () Bool)

(declare-fun e!421509 () Bool)

(assert (=> b!755936 (=> (not res!511122) (not e!421509))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!755936 (= res!511122 (validKeyInArray!0 k0!2102))))

(declare-fun b!755937 () Bool)

(declare-datatypes ((Unit!26096 0))(
  ( (Unit!26097) )
))
(declare-fun e!421511 () Unit!26096)

(declare-fun Unit!26098 () Unit!26096)

(assert (=> b!755937 (= e!421511 Unit!26098)))

(assert (=> b!755937 false))

(declare-fun b!755938 () Bool)

(declare-fun Unit!26099 () Unit!26096)

(assert (=> b!755938 (= e!421511 Unit!26099)))

(declare-fun b!755939 () Bool)

(declare-fun res!511134 () Bool)

(declare-fun e!421514 () Bool)

(assert (=> b!755939 (=> (not res!511134) (not e!421514))))

(declare-datatypes ((List!14128 0))(
  ( (Nil!14125) (Cons!14124 (h!15196 (_ BitVec 64)) (t!20434 List!14128)) )
))
(declare-fun arrayNoDuplicates!0 (array!41946 (_ BitVec 32) List!14128) Bool)

(assert (=> b!755939 (= res!511134 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14125))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7684 0))(
  ( (MissingZero!7684 (index!33104 (_ BitVec 32))) (Found!7684 (index!33105 (_ BitVec 32))) (Intermediate!7684 (undefined!8496 Bool) (index!33106 (_ BitVec 32)) (x!64013 (_ BitVec 32))) (Undefined!7684) (MissingVacant!7684 (index!33107 (_ BitVec 32))) )
))
(declare-fun lt!336424 () SeekEntryResult!7684)

(declare-fun e!421516 () Bool)

(declare-fun b!755940 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41946 (_ BitVec 32)) SeekEntryResult!7684)

(assert (=> b!755940 (= e!421516 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20087 a!3186) j!159) a!3186 mask!3328) lt!336424))))

(declare-fun b!755941 () Bool)

(declare-fun res!511135 () Bool)

(declare-fun e!421513 () Bool)

(assert (=> b!755941 (=> (not res!511135) (not e!421513))))

(declare-fun lt!336420 () array!41946)

(declare-fun lt!336415 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41946 (_ BitVec 32)) SeekEntryResult!7684)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41946 (_ BitVec 32)) SeekEntryResult!7684)

(assert (=> b!755941 (= res!511135 (= (seekEntryOrOpen!0 lt!336415 lt!336420 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336415 lt!336420 mask!3328)))))

(declare-fun b!755942 () Bool)

(declare-fun e!421519 () Bool)

(declare-fun e!421508 () Bool)

(assert (=> b!755942 (= e!421519 (not e!421508))))

(declare-fun res!511133 () Bool)

(assert (=> b!755942 (=> res!511133 e!421508)))

(declare-fun lt!336425 () SeekEntryResult!7684)

(get-info :version)

(assert (=> b!755942 (= res!511133 (or (not ((_ is Intermediate!7684) lt!336425)) (bvslt x!1131 (x!64013 lt!336425)) (not (= x!1131 (x!64013 lt!336425))) (not (= index!1321 (index!33106 lt!336425)))))))

(declare-fun e!421515 () Bool)

(assert (=> b!755942 e!421515))

(declare-fun res!511125 () Bool)

(assert (=> b!755942 (=> (not res!511125) (not e!421515))))

(declare-fun lt!336416 () SeekEntryResult!7684)

(declare-fun lt!336419 () SeekEntryResult!7684)

(assert (=> b!755942 (= res!511125 (= lt!336416 lt!336419))))

(assert (=> b!755942 (= lt!336419 (Found!7684 j!159))))

(assert (=> b!755942 (= lt!336416 (seekEntryOrOpen!0 (select (arr!20087 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41946 (_ BitVec 32)) Bool)

(assert (=> b!755942 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!336422 () Unit!26096)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41946 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26096)

(assert (=> b!755942 (= lt!336422 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!755943 () Bool)

(declare-fun e!421518 () Bool)

(assert (=> b!755943 (= e!421508 e!421518)))

(declare-fun res!511140 () Bool)

(assert (=> b!755943 (=> res!511140 e!421518)))

(declare-fun lt!336423 () SeekEntryResult!7684)

(assert (=> b!755943 (= res!511140 (not (= lt!336423 lt!336419)))))

(assert (=> b!755943 (= lt!336423 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20087 a!3186) j!159) a!3186 mask!3328))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!755944 () Bool)

(assert (=> b!755944 (= e!421515 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20087 a!3186) j!159) a!3186 mask!3328) lt!336419))))

(declare-fun b!755945 () Bool)

(declare-fun res!511139 () Bool)

(assert (=> b!755945 (=> (not res!511139) (not e!421514))))

(assert (=> b!755945 (= res!511139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!755946 () Bool)

(assert (=> b!755946 (= e!421516 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20087 a!3186) j!159) a!3186 mask!3328) (Found!7684 j!159)))))

(declare-fun b!755947 () Bool)

(declare-fun res!511126 () Bool)

(assert (=> b!755947 (=> (not res!511126) (not e!421514))))

(assert (=> b!755947 (= res!511126 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20508 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20508 a!3186))))))

(declare-fun b!755948 () Bool)

(declare-fun res!511128 () Bool)

(assert (=> b!755948 (=> (not res!511128) (not e!421509))))

(assert (=> b!755948 (= res!511128 (and (= (size!20508 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20508 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20508 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!755949 () Bool)

(declare-fun res!511130 () Bool)

(assert (=> b!755949 (=> (not res!511130) (not e!421510))))

(assert (=> b!755949 (= res!511130 e!421516)))

(declare-fun c!82788 () Bool)

(assert (=> b!755949 (= c!82788 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!755950 () Bool)

(assert (=> b!755950 (= e!421509 e!421514)))

(declare-fun res!511129 () Bool)

(assert (=> b!755950 (=> (not res!511129) (not e!421514))))

(declare-fun lt!336417 () SeekEntryResult!7684)

(assert (=> b!755950 (= res!511129 (or (= lt!336417 (MissingZero!7684 i!1173)) (= lt!336417 (MissingVacant!7684 i!1173))))))

(assert (=> b!755950 (= lt!336417 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!755951 () Bool)

(declare-fun res!511132 () Bool)

(assert (=> b!755951 (=> (not res!511132) (not e!421509))))

(declare-fun arrayContainsKey!0 (array!41946 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!755951 (= res!511132 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!755952 () Bool)

(declare-fun res!511127 () Bool)

(assert (=> b!755952 (=> (not res!511127) (not e!421509))))

(assert (=> b!755952 (= res!511127 (validKeyInArray!0 (select (arr!20087 a!3186) j!159)))))

(declare-fun b!755953 () Bool)

(assert (=> b!755953 (= e!421514 e!421510)))

(declare-fun res!511123 () Bool)

(assert (=> b!755953 (=> (not res!511123) (not e!421510))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!755953 (= res!511123 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20087 a!3186) j!159) mask!3328) (select (arr!20087 a!3186) j!159) a!3186 mask!3328) lt!336424))))

(assert (=> b!755953 (= lt!336424 (Intermediate!7684 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!755954 () Bool)

(declare-fun e!421512 () Bool)

(assert (=> b!755954 (= e!421512 true)))

(assert (=> b!755954 e!421513))

(declare-fun res!511131 () Bool)

(assert (=> b!755954 (=> (not res!511131) (not e!421513))))

(declare-fun lt!336418 () (_ BitVec 64))

(assert (=> b!755954 (= res!511131 (= lt!336418 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336421 () Unit!26096)

(assert (=> b!755954 (= lt!336421 e!421511)))

(declare-fun c!82787 () Bool)

(assert (=> b!755954 (= c!82787 (= lt!336418 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!755955 () Bool)

(assert (=> b!755955 (= e!421518 e!421512)))

(declare-fun res!511138 () Bool)

(assert (=> b!755955 (=> res!511138 e!421512)))

(assert (=> b!755955 (= res!511138 (= lt!336418 lt!336415))))

(assert (=> b!755955 (= lt!336418 (select (store (arr!20087 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!755956 () Bool)

(assert (=> b!755956 (= e!421510 e!421519)))

(declare-fun res!511124 () Bool)

(assert (=> b!755956 (=> (not res!511124) (not e!421519))))

(declare-fun lt!336414 () SeekEntryResult!7684)

(assert (=> b!755956 (= res!511124 (= lt!336414 lt!336425))))

(assert (=> b!755956 (= lt!336425 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336415 lt!336420 mask!3328))))

(assert (=> b!755956 (= lt!336414 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336415 mask!3328) lt!336415 lt!336420 mask!3328))))

(assert (=> b!755956 (= lt!336415 (select (store (arr!20087 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!755956 (= lt!336420 (array!41947 (store (arr!20087 a!3186) i!1173 k0!2102) (size!20508 a!3186)))))

(declare-fun b!755957 () Bool)

(assert (=> b!755957 (= e!421513 (= lt!336416 lt!336423))))

(declare-fun res!511137 () Bool)

(assert (=> start!65756 (=> (not res!511137) (not e!421509))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65756 (= res!511137 (validMask!0 mask!3328))))

(assert (=> start!65756 e!421509))

(assert (=> start!65756 true))

(declare-fun array_inv!15970 (array!41946) Bool)

(assert (=> start!65756 (array_inv!15970 a!3186)))

(assert (= (and start!65756 res!511137) b!755948))

(assert (= (and b!755948 res!511128) b!755952))

(assert (= (and b!755952 res!511127) b!755936))

(assert (= (and b!755936 res!511122) b!755951))

(assert (= (and b!755951 res!511132) b!755950))

(assert (= (and b!755950 res!511129) b!755945))

(assert (= (and b!755945 res!511139) b!755939))

(assert (= (and b!755939 res!511134) b!755947))

(assert (= (and b!755947 res!511126) b!755953))

(assert (= (and b!755953 res!511123) b!755935))

(assert (= (and b!755935 res!511136) b!755949))

(assert (= (and b!755949 c!82788) b!755940))

(assert (= (and b!755949 (not c!82788)) b!755946))

(assert (= (and b!755949 res!511130) b!755956))

(assert (= (and b!755956 res!511124) b!755942))

(assert (= (and b!755942 res!511125) b!755944))

(assert (= (and b!755942 (not res!511133)) b!755943))

(assert (= (and b!755943 (not res!511140)) b!755955))

(assert (= (and b!755955 (not res!511138)) b!755954))

(assert (= (and b!755954 c!82787) b!755937))

(assert (= (and b!755954 (not c!82787)) b!755938))

(assert (= (and b!755954 res!511131) b!755941))

(assert (= (and b!755941 res!511135) b!755957))

(declare-fun m!703445 () Bool)

(assert (=> b!755940 m!703445))

(assert (=> b!755940 m!703445))

(declare-fun m!703447 () Bool)

(assert (=> b!755940 m!703447))

(declare-fun m!703449 () Bool)

(assert (=> b!755936 m!703449))

(declare-fun m!703451 () Bool)

(assert (=> b!755941 m!703451))

(declare-fun m!703453 () Bool)

(assert (=> b!755941 m!703453))

(declare-fun m!703455 () Bool)

(assert (=> b!755935 m!703455))

(assert (=> b!755944 m!703445))

(assert (=> b!755944 m!703445))

(declare-fun m!703457 () Bool)

(assert (=> b!755944 m!703457))

(declare-fun m!703459 () Bool)

(assert (=> b!755956 m!703459))

(declare-fun m!703461 () Bool)

(assert (=> b!755956 m!703461))

(declare-fun m!703463 () Bool)

(assert (=> b!755956 m!703463))

(declare-fun m!703465 () Bool)

(assert (=> b!755956 m!703465))

(assert (=> b!755956 m!703459))

(declare-fun m!703467 () Bool)

(assert (=> b!755956 m!703467))

(assert (=> b!755942 m!703445))

(assert (=> b!755942 m!703445))

(declare-fun m!703469 () Bool)

(assert (=> b!755942 m!703469))

(declare-fun m!703471 () Bool)

(assert (=> b!755942 m!703471))

(declare-fun m!703473 () Bool)

(assert (=> b!755942 m!703473))

(declare-fun m!703475 () Bool)

(assert (=> b!755950 m!703475))

(assert (=> b!755946 m!703445))

(assert (=> b!755946 m!703445))

(declare-fun m!703477 () Bool)

(assert (=> b!755946 m!703477))

(declare-fun m!703479 () Bool)

(assert (=> start!65756 m!703479))

(declare-fun m!703481 () Bool)

(assert (=> start!65756 m!703481))

(declare-fun m!703483 () Bool)

(assert (=> b!755945 m!703483))

(assert (=> b!755943 m!703445))

(assert (=> b!755943 m!703445))

(assert (=> b!755943 m!703477))

(assert (=> b!755952 m!703445))

(assert (=> b!755952 m!703445))

(declare-fun m!703485 () Bool)

(assert (=> b!755952 m!703485))

(declare-fun m!703487 () Bool)

(assert (=> b!755939 m!703487))

(assert (=> b!755953 m!703445))

(assert (=> b!755953 m!703445))

(declare-fun m!703489 () Bool)

(assert (=> b!755953 m!703489))

(assert (=> b!755953 m!703489))

(assert (=> b!755953 m!703445))

(declare-fun m!703491 () Bool)

(assert (=> b!755953 m!703491))

(declare-fun m!703493 () Bool)

(assert (=> b!755951 m!703493))

(assert (=> b!755955 m!703461))

(declare-fun m!703495 () Bool)

(assert (=> b!755955 m!703495))

(check-sat (not b!755956) (not b!755941) (not b!755940) (not b!755945) (not b!755936) (not b!755944) (not b!755951) (not b!755953) (not b!755952) (not start!65756) (not b!755939) (not b!755946) (not b!755950) (not b!755943) (not b!755942))
(check-sat)
