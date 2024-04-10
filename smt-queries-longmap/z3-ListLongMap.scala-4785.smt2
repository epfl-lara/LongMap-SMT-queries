; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65772 () Bool)

(assert start!65772)

(declare-fun b!756047 () Bool)

(declare-fun res!511126 () Bool)

(declare-fun e!421600 () Bool)

(assert (=> b!756047 (=> (not res!511126) (not e!421600))))

(declare-datatypes ((array!41945 0))(
  ( (array!41946 (arr!20086 (Array (_ BitVec 32) (_ BitVec 64))) (size!20507 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41945)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41945 (_ BitVec 32)) Bool)

(assert (=> b!756047 (= res!511126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!756048 () Bool)

(declare-fun res!511136 () Bool)

(declare-fun e!421597 () Bool)

(assert (=> b!756048 (=> (not res!511136) (not e!421597))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!336582 () array!41945)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!336590 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!7686 0))(
  ( (MissingZero!7686 (index!33112 (_ BitVec 32))) (Found!7686 (index!33113 (_ BitVec 32))) (Intermediate!7686 (undefined!8498 Bool) (index!33114 (_ BitVec 32)) (x!64012 (_ BitVec 32))) (Undefined!7686) (MissingVacant!7686 (index!33115 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41945 (_ BitVec 32)) SeekEntryResult!7686)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41945 (_ BitVec 32)) SeekEntryResult!7686)

(assert (=> b!756048 (= res!511136 (= (seekEntryOrOpen!0 lt!336590 lt!336582 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336590 lt!336582 mask!3328)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!336587 () SeekEntryResult!7686)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!756049 () Bool)

(declare-fun e!421593 () Bool)

(assert (=> b!756049 (= e!421593 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20086 a!3186) j!159) a!3186 mask!3328) lt!336587))))

(declare-fun b!756050 () Bool)

(declare-fun res!511118 () Bool)

(declare-fun e!421594 () Bool)

(assert (=> b!756050 (=> (not res!511118) (not e!421594))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!756050 (= res!511118 (and (= (size!20507 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20507 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20507 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!756051 () Bool)

(declare-fun res!511127 () Bool)

(assert (=> b!756051 (=> (not res!511127) (not e!421600))))

(declare-datatypes ((List!14088 0))(
  ( (Nil!14085) (Cons!14084 (h!15156 (_ BitVec 64)) (t!20403 List!14088)) )
))
(declare-fun arrayNoDuplicates!0 (array!41945 (_ BitVec 32) List!14088) Bool)

(assert (=> b!756051 (= res!511127 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14085))))

(declare-fun b!756052 () Bool)

(declare-fun e!421595 () Bool)

(declare-fun lt!336589 () SeekEntryResult!7686)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41945 (_ BitVec 32)) SeekEntryResult!7686)

(assert (=> b!756052 (= e!421595 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20086 a!3186) j!159) a!3186 mask!3328) lt!336589))))

(declare-fun b!756053 () Bool)

(declare-fun e!421592 () Bool)

(declare-fun e!421590 () Bool)

(assert (=> b!756053 (= e!421592 e!421590)))

(declare-fun res!511133 () Bool)

(assert (=> b!756053 (=> res!511133 e!421590)))

(declare-fun lt!336585 () (_ BitVec 64))

(assert (=> b!756053 (= res!511133 (= lt!336585 lt!336590))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!756053 (= lt!336585 (select (store (arr!20086 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!756054 () Bool)

(declare-fun res!511132 () Bool)

(declare-fun e!421596 () Bool)

(assert (=> b!756054 (=> (not res!511132) (not e!421596))))

(assert (=> b!756054 (= res!511132 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20086 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!756055 () Bool)

(declare-fun res!511124 () Bool)

(assert (=> b!756055 (=> (not res!511124) (not e!421596))))

(assert (=> b!756055 (= res!511124 e!421595)))

(declare-fun c!82845 () Bool)

(assert (=> b!756055 (= c!82845 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!756057 () Bool)

(declare-fun res!511123 () Bool)

(assert (=> b!756057 (=> (not res!511123) (not e!421594))))

(declare-fun arrayContainsKey!0 (array!41945 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!756057 (= res!511123 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!756058 () Bool)

(assert (=> b!756058 (= e!421595 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20086 a!3186) j!159) a!3186 mask!3328) (Found!7686 j!159)))))

(declare-fun b!756059 () Bool)

(declare-fun e!421599 () Bool)

(declare-fun e!421598 () Bool)

(assert (=> b!756059 (= e!421599 (not e!421598))))

(declare-fun res!511135 () Bool)

(assert (=> b!756059 (=> res!511135 e!421598)))

(declare-fun lt!336592 () SeekEntryResult!7686)

(get-info :version)

(assert (=> b!756059 (= res!511135 (or (not ((_ is Intermediate!7686) lt!336592)) (bvslt x!1131 (x!64012 lt!336592)) (not (= x!1131 (x!64012 lt!336592))) (not (= index!1321 (index!33114 lt!336592)))))))

(assert (=> b!756059 e!421593))

(declare-fun res!511120 () Bool)

(assert (=> b!756059 (=> (not res!511120) (not e!421593))))

(declare-fun lt!336584 () SeekEntryResult!7686)

(assert (=> b!756059 (= res!511120 (= lt!336584 lt!336587))))

(assert (=> b!756059 (= lt!336587 (Found!7686 j!159))))

(assert (=> b!756059 (= lt!336584 (seekEntryOrOpen!0 (select (arr!20086 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!756059 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26124 0))(
  ( (Unit!26125) )
))
(declare-fun lt!336591 () Unit!26124)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41945 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26124)

(assert (=> b!756059 (= lt!336591 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!756060 () Bool)

(declare-fun res!511131 () Bool)

(assert (=> b!756060 (=> (not res!511131) (not e!421594))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!756060 (= res!511131 (validKeyInArray!0 (select (arr!20086 a!3186) j!159)))))

(declare-fun b!756061 () Bool)

(declare-fun e!421601 () Unit!26124)

(declare-fun Unit!26126 () Unit!26124)

(assert (=> b!756061 (= e!421601 Unit!26126)))

(assert (=> b!756061 false))

(declare-fun b!756062 () Bool)

(declare-fun res!511129 () Bool)

(assert (=> b!756062 (=> (not res!511129) (not e!421594))))

(assert (=> b!756062 (= res!511129 (validKeyInArray!0 k0!2102))))

(declare-fun b!756063 () Bool)

(assert (=> b!756063 (= e!421590 true)))

(assert (=> b!756063 e!421597))

(declare-fun res!511134 () Bool)

(assert (=> b!756063 (=> (not res!511134) (not e!421597))))

(assert (=> b!756063 (= res!511134 (= lt!336585 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336586 () Unit!26124)

(assert (=> b!756063 (= lt!336586 e!421601)))

(declare-fun c!82846 () Bool)

(assert (=> b!756063 (= c!82846 (= lt!336585 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!756064 () Bool)

(declare-fun res!511121 () Bool)

(assert (=> b!756064 (=> (not res!511121) (not e!421600))))

(assert (=> b!756064 (= res!511121 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20507 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20507 a!3186))))))

(declare-fun b!756065 () Bool)

(assert (=> b!756065 (= e!421598 e!421592)))

(declare-fun res!511122 () Bool)

(assert (=> b!756065 (=> res!511122 e!421592)))

(declare-fun lt!336588 () SeekEntryResult!7686)

(assert (=> b!756065 (= res!511122 (not (= lt!336588 lt!336587)))))

(assert (=> b!756065 (= lt!336588 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20086 a!3186) j!159) a!3186 mask!3328))))

(declare-fun res!511130 () Bool)

(assert (=> start!65772 (=> (not res!511130) (not e!421594))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65772 (= res!511130 (validMask!0 mask!3328))))

(assert (=> start!65772 e!421594))

(assert (=> start!65772 true))

(declare-fun array_inv!15882 (array!41945) Bool)

(assert (=> start!65772 (array_inv!15882 a!3186)))

(declare-fun b!756056 () Bool)

(assert (=> b!756056 (= e!421596 e!421599)))

(declare-fun res!511128 () Bool)

(assert (=> b!756056 (=> (not res!511128) (not e!421599))))

(declare-fun lt!336583 () SeekEntryResult!7686)

(assert (=> b!756056 (= res!511128 (= lt!336583 lt!336592))))

(assert (=> b!756056 (= lt!336592 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336590 lt!336582 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!756056 (= lt!336583 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336590 mask!3328) lt!336590 lt!336582 mask!3328))))

(assert (=> b!756056 (= lt!336590 (select (store (arr!20086 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!756056 (= lt!336582 (array!41946 (store (arr!20086 a!3186) i!1173 k0!2102) (size!20507 a!3186)))))

(declare-fun b!756066 () Bool)

(declare-fun Unit!26127 () Unit!26124)

(assert (=> b!756066 (= e!421601 Unit!26127)))

(declare-fun b!756067 () Bool)

(assert (=> b!756067 (= e!421600 e!421596)))

(declare-fun res!511119 () Bool)

(assert (=> b!756067 (=> (not res!511119) (not e!421596))))

(assert (=> b!756067 (= res!511119 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20086 a!3186) j!159) mask!3328) (select (arr!20086 a!3186) j!159) a!3186 mask!3328) lt!336589))))

(assert (=> b!756067 (= lt!336589 (Intermediate!7686 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!756068 () Bool)

(assert (=> b!756068 (= e!421594 e!421600)))

(declare-fun res!511125 () Bool)

(assert (=> b!756068 (=> (not res!511125) (not e!421600))))

(declare-fun lt!336593 () SeekEntryResult!7686)

(assert (=> b!756068 (= res!511125 (or (= lt!336593 (MissingZero!7686 i!1173)) (= lt!336593 (MissingVacant!7686 i!1173))))))

(assert (=> b!756068 (= lt!336593 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!756069 () Bool)

(assert (=> b!756069 (= e!421597 (= lt!336584 lt!336588))))

(assert (= (and start!65772 res!511130) b!756050))

(assert (= (and b!756050 res!511118) b!756060))

(assert (= (and b!756060 res!511131) b!756062))

(assert (= (and b!756062 res!511129) b!756057))

(assert (= (and b!756057 res!511123) b!756068))

(assert (= (and b!756068 res!511125) b!756047))

(assert (= (and b!756047 res!511126) b!756051))

(assert (= (and b!756051 res!511127) b!756064))

(assert (= (and b!756064 res!511121) b!756067))

(assert (= (and b!756067 res!511119) b!756054))

(assert (= (and b!756054 res!511132) b!756055))

(assert (= (and b!756055 c!82845) b!756052))

(assert (= (and b!756055 (not c!82845)) b!756058))

(assert (= (and b!756055 res!511124) b!756056))

(assert (= (and b!756056 res!511128) b!756059))

(assert (= (and b!756059 res!511120) b!756049))

(assert (= (and b!756059 (not res!511135)) b!756065))

(assert (= (and b!756065 (not res!511122)) b!756053))

(assert (= (and b!756053 (not res!511133)) b!756063))

(assert (= (and b!756063 c!82846) b!756061))

(assert (= (and b!756063 (not c!82846)) b!756066))

(assert (= (and b!756063 res!511134) b!756048))

(assert (= (and b!756048 res!511136) b!756069))

(declare-fun m!704099 () Bool)

(assert (=> b!756054 m!704099))

(declare-fun m!704101 () Bool)

(assert (=> b!756048 m!704101))

(declare-fun m!704103 () Bool)

(assert (=> b!756048 m!704103))

(declare-fun m!704105 () Bool)

(assert (=> b!756068 m!704105))

(declare-fun m!704107 () Bool)

(assert (=> b!756058 m!704107))

(assert (=> b!756058 m!704107))

(declare-fun m!704109 () Bool)

(assert (=> b!756058 m!704109))

(assert (=> b!756049 m!704107))

(assert (=> b!756049 m!704107))

(declare-fun m!704111 () Bool)

(assert (=> b!756049 m!704111))

(assert (=> b!756065 m!704107))

(assert (=> b!756065 m!704107))

(assert (=> b!756065 m!704109))

(declare-fun m!704113 () Bool)

(assert (=> b!756056 m!704113))

(declare-fun m!704115 () Bool)

(assert (=> b!756056 m!704115))

(declare-fun m!704117 () Bool)

(assert (=> b!756056 m!704117))

(declare-fun m!704119 () Bool)

(assert (=> b!756056 m!704119))

(assert (=> b!756056 m!704119))

(declare-fun m!704121 () Bool)

(assert (=> b!756056 m!704121))

(assert (=> b!756060 m!704107))

(assert (=> b!756060 m!704107))

(declare-fun m!704123 () Bool)

(assert (=> b!756060 m!704123))

(declare-fun m!704125 () Bool)

(assert (=> b!756057 m!704125))

(declare-fun m!704127 () Bool)

(assert (=> start!65772 m!704127))

(declare-fun m!704129 () Bool)

(assert (=> start!65772 m!704129))

(declare-fun m!704131 () Bool)

(assert (=> b!756051 m!704131))

(assert (=> b!756067 m!704107))

(assert (=> b!756067 m!704107))

(declare-fun m!704133 () Bool)

(assert (=> b!756067 m!704133))

(assert (=> b!756067 m!704133))

(assert (=> b!756067 m!704107))

(declare-fun m!704135 () Bool)

(assert (=> b!756067 m!704135))

(declare-fun m!704137 () Bool)

(assert (=> b!756062 m!704137))

(declare-fun m!704139 () Bool)

(assert (=> b!756047 m!704139))

(assert (=> b!756059 m!704107))

(assert (=> b!756059 m!704107))

(declare-fun m!704141 () Bool)

(assert (=> b!756059 m!704141))

(declare-fun m!704143 () Bool)

(assert (=> b!756059 m!704143))

(declare-fun m!704145 () Bool)

(assert (=> b!756059 m!704145))

(assert (=> b!756052 m!704107))

(assert (=> b!756052 m!704107))

(declare-fun m!704147 () Bool)

(assert (=> b!756052 m!704147))

(assert (=> b!756053 m!704115))

(declare-fun m!704149 () Bool)

(assert (=> b!756053 m!704149))

(check-sat (not b!756052) (not start!65772) (not b!756058) (not b!756051) (not b!756065) (not b!756056) (not b!756049) (not b!756068) (not b!756067) (not b!756059) (not b!756048) (not b!756060) (not b!756062) (not b!756057) (not b!756047))
(check-sat)
