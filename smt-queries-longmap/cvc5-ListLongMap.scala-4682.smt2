; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65152 () Bool)

(assert start!65152)

(declare-fun b!736252 () Bool)

(declare-fun e!411886 () Bool)

(declare-fun e!411881 () Bool)

(assert (=> b!736252 (= e!411886 e!411881)))

(declare-fun res!494787 () Bool)

(assert (=> b!736252 (=> (not res!494787) (not e!411881))))

(declare-datatypes ((array!41325 0))(
  ( (array!41326 (arr!19776 (Array (_ BitVec 32) (_ BitVec 64))) (size!20197 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41325)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7376 0))(
  ( (MissingZero!7376 (index!31872 (_ BitVec 32))) (Found!7376 (index!31873 (_ BitVec 32))) (Intermediate!7376 (undefined!8188 Bool) (index!31874 (_ BitVec 32)) (x!62878 (_ BitVec 32))) (Undefined!7376) (MissingVacant!7376 (index!31875 (_ BitVec 32))) )
))
(declare-fun lt!326499 () SeekEntryResult!7376)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41325 (_ BitVec 32)) SeekEntryResult!7376)

(assert (=> b!736252 (= res!494787 (= (seekEntryOrOpen!0 (select (arr!19776 a!3186) j!159) a!3186 mask!3328) lt!326499))))

(assert (=> b!736252 (= lt!326499 (Found!7376 j!159))))

(declare-fun e!411890 () Bool)

(declare-fun b!736253 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!326500 () SeekEntryResult!7376)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41325 (_ BitVec 32)) SeekEntryResult!7376)

(assert (=> b!736253 (= e!411890 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19776 a!3186) j!159) a!3186 mask!3328) lt!326500))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!736254 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41325 (_ BitVec 32)) SeekEntryResult!7376)

(assert (=> b!736254 (= e!411890 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19776 a!3186) j!159) a!3186 mask!3328) (Found!7376 j!159)))))

(declare-fun lt!326496 () (_ BitVec 32))

(declare-fun e!411885 () Bool)

(declare-fun b!736255 () Bool)

(assert (=> b!736255 (= e!411885 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326496 (select (arr!19776 a!3186) j!159) a!3186 mask!3328) lt!326500)))))

(declare-fun lt!326494 () SeekEntryResult!7376)

(declare-fun b!736256 () Bool)

(assert (=> b!736256 (= e!411885 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326496 resIntermediateIndex!5 (select (arr!19776 a!3186) j!159) a!3186 mask!3328) lt!326494)))))

(declare-fun b!736257 () Bool)

(declare-fun e!411879 () Bool)

(declare-fun e!411884 () Bool)

(assert (=> b!736257 (= e!411879 e!411884)))

(declare-fun res!494802 () Bool)

(assert (=> b!736257 (=> (not res!494802) (not e!411884))))

(declare-fun lt!326489 () SeekEntryResult!7376)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!736257 (= res!494802 (or (= lt!326489 (MissingZero!7376 i!1173)) (= lt!326489 (MissingVacant!7376 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!736257 (= lt!326489 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!736258 () Bool)

(declare-fun e!411889 () Bool)

(declare-fun e!411887 () Bool)

(assert (=> b!736258 (= e!411889 e!411887)))

(declare-fun res!494792 () Bool)

(assert (=> b!736258 (=> (not res!494792) (not e!411887))))

(declare-fun lt!326488 () SeekEntryResult!7376)

(declare-fun lt!326501 () SeekEntryResult!7376)

(assert (=> b!736258 (= res!494792 (= lt!326488 lt!326501))))

(declare-fun lt!326498 () (_ BitVec 64))

(declare-fun lt!326493 () array!41325)

(assert (=> b!736258 (= lt!326501 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326498 lt!326493 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736258 (= lt!326488 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326498 mask!3328) lt!326498 lt!326493 mask!3328))))

(assert (=> b!736258 (= lt!326498 (select (store (arr!19776 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!736258 (= lt!326493 (array!41326 (store (arr!19776 a!3186) i!1173 k!2102) (size!20197 a!3186)))))

(declare-fun b!736259 () Bool)

(declare-fun e!411880 () Bool)

(assert (=> b!736259 (= e!411880 true)))

(declare-fun lt!326495 () SeekEntryResult!7376)

(assert (=> b!736259 (= lt!326495 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326496 lt!326498 lt!326493 mask!3328))))

(declare-fun b!736261 () Bool)

(declare-fun res!494791 () Bool)

(assert (=> b!736261 (=> (not res!494791) (not e!411879))))

(declare-fun arrayContainsKey!0 (array!41325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!736261 (= res!494791 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!736262 () Bool)

(declare-fun e!411882 () Bool)

(assert (=> b!736262 (= e!411882 e!411880)))

(declare-fun res!494795 () Bool)

(assert (=> b!736262 (=> res!494795 e!411880)))

(assert (=> b!736262 (= res!494795 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!326496 #b00000000000000000000000000000000) (bvsge lt!326496 (size!20197 a!3186))))))

(declare-datatypes ((Unit!25100 0))(
  ( (Unit!25101) )
))
(declare-fun lt!326491 () Unit!25100)

(declare-fun e!411883 () Unit!25100)

(assert (=> b!736262 (= lt!326491 e!411883)))

(declare-fun c!81113 () Bool)

(declare-fun lt!326497 () Bool)

(assert (=> b!736262 (= c!81113 lt!326497)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!736262 (= lt!326497 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736262 (= lt!326496 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!736263 () Bool)

(declare-fun res!494788 () Bool)

(assert (=> b!736263 (=> (not res!494788) (not e!411889))))

(assert (=> b!736263 (= res!494788 e!411890)))

(declare-fun c!81115 () Bool)

(assert (=> b!736263 (= c!81115 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!736264 () Bool)

(declare-fun res!494798 () Bool)

(assert (=> b!736264 (=> (not res!494798) (not e!411884))))

(declare-datatypes ((List!13778 0))(
  ( (Nil!13775) (Cons!13774 (h!14846 (_ BitVec 64)) (t!20093 List!13778)) )
))
(declare-fun arrayNoDuplicates!0 (array!41325 (_ BitVec 32) List!13778) Bool)

(assert (=> b!736264 (= res!494798 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13775))))

(declare-fun b!736265 () Bool)

(declare-fun Unit!25102 () Unit!25100)

(assert (=> b!736265 (= e!411883 Unit!25102)))

(assert (=> b!736265 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326496 (select (arr!19776 a!3186) j!159) a!3186 mask!3328) lt!326500)))

(declare-fun b!736266 () Bool)

(declare-fun res!494796 () Bool)

(assert (=> b!736266 (=> (not res!494796) (not e!411879))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!736266 (= res!494796 (validKeyInArray!0 (select (arr!19776 a!3186) j!159)))))

(declare-fun b!736267 () Bool)

(declare-fun res!494801 () Bool)

(assert (=> b!736267 (=> (not res!494801) (not e!411884))))

(assert (=> b!736267 (= res!494801 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20197 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20197 a!3186))))))

(declare-fun b!736268 () Bool)

(declare-fun res!494793 () Bool)

(assert (=> b!736268 (=> (not res!494793) (not e!411889))))

(assert (=> b!736268 (= res!494793 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19776 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!736269 () Bool)

(declare-fun res!494790 () Bool)

(assert (=> b!736269 (=> res!494790 e!411880)))

(assert (=> b!736269 (= res!494790 e!411885)))

(declare-fun c!81114 () Bool)

(assert (=> b!736269 (= c!81114 lt!326497)))

(declare-fun b!736270 () Bool)

(declare-fun res!494789 () Bool)

(assert (=> b!736270 (=> (not res!494789) (not e!411884))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41325 (_ BitVec 32)) Bool)

(assert (=> b!736270 (= res!494789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!736271 () Bool)

(assert (=> b!736271 (= e!411881 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19776 a!3186) j!159) a!3186 mask!3328) lt!326499))))

(declare-fun res!494803 () Bool)

(assert (=> start!65152 (=> (not res!494803) (not e!411879))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65152 (= res!494803 (validMask!0 mask!3328))))

(assert (=> start!65152 e!411879))

(assert (=> start!65152 true))

(declare-fun array_inv!15572 (array!41325) Bool)

(assert (=> start!65152 (array_inv!15572 a!3186)))

(declare-fun b!736260 () Bool)

(declare-fun res!494797 () Bool)

(assert (=> b!736260 (=> (not res!494797) (not e!411879))))

(assert (=> b!736260 (= res!494797 (and (= (size!20197 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20197 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20197 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!736272 () Bool)

(declare-fun Unit!25103 () Unit!25100)

(assert (=> b!736272 (= e!411883 Unit!25103)))

(declare-fun lt!326492 () SeekEntryResult!7376)

(assert (=> b!736272 (= lt!326492 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19776 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!736272 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326496 resIntermediateIndex!5 (select (arr!19776 a!3186) j!159) a!3186 mask!3328) lt!326494)))

(declare-fun b!736273 () Bool)

(assert (=> b!736273 (= e!411884 e!411889)))

(declare-fun res!494799 () Bool)

(assert (=> b!736273 (=> (not res!494799) (not e!411889))))

(assert (=> b!736273 (= res!494799 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19776 a!3186) j!159) mask!3328) (select (arr!19776 a!3186) j!159) a!3186 mask!3328) lt!326500))))

(assert (=> b!736273 (= lt!326500 (Intermediate!7376 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!736274 () Bool)

(declare-fun res!494800 () Bool)

(assert (=> b!736274 (=> (not res!494800) (not e!411879))))

(assert (=> b!736274 (= res!494800 (validKeyInArray!0 k!2102))))

(declare-fun b!736275 () Bool)

(assert (=> b!736275 (= e!411887 (not e!411882))))

(declare-fun res!494804 () Bool)

(assert (=> b!736275 (=> res!494804 e!411882)))

(assert (=> b!736275 (= res!494804 (or (not (is-Intermediate!7376 lt!326501)) (bvsge x!1131 (x!62878 lt!326501))))))

(assert (=> b!736275 (= lt!326494 (Found!7376 j!159))))

(assert (=> b!736275 e!411886))

(declare-fun res!494794 () Bool)

(assert (=> b!736275 (=> (not res!494794) (not e!411886))))

(assert (=> b!736275 (= res!494794 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!326490 () Unit!25100)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41325 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25100)

(assert (=> b!736275 (= lt!326490 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!65152 res!494803) b!736260))

(assert (= (and b!736260 res!494797) b!736266))

(assert (= (and b!736266 res!494796) b!736274))

(assert (= (and b!736274 res!494800) b!736261))

(assert (= (and b!736261 res!494791) b!736257))

(assert (= (and b!736257 res!494802) b!736270))

(assert (= (and b!736270 res!494789) b!736264))

(assert (= (and b!736264 res!494798) b!736267))

(assert (= (and b!736267 res!494801) b!736273))

(assert (= (and b!736273 res!494799) b!736268))

(assert (= (and b!736268 res!494793) b!736263))

(assert (= (and b!736263 c!81115) b!736253))

(assert (= (and b!736263 (not c!81115)) b!736254))

(assert (= (and b!736263 res!494788) b!736258))

(assert (= (and b!736258 res!494792) b!736275))

(assert (= (and b!736275 res!494794) b!736252))

(assert (= (and b!736252 res!494787) b!736271))

(assert (= (and b!736275 (not res!494804)) b!736262))

(assert (= (and b!736262 c!81113) b!736265))

(assert (= (and b!736262 (not c!81113)) b!736272))

(assert (= (and b!736262 (not res!494795)) b!736269))

(assert (= (and b!736269 c!81114) b!736255))

(assert (= (and b!736269 (not c!81114)) b!736256))

(assert (= (and b!736269 (not res!494790)) b!736259))

(declare-fun m!688429 () Bool)

(assert (=> b!736254 m!688429))

(assert (=> b!736254 m!688429))

(declare-fun m!688431 () Bool)

(assert (=> b!736254 m!688431))

(assert (=> b!736266 m!688429))

(assert (=> b!736266 m!688429))

(declare-fun m!688433 () Bool)

(assert (=> b!736266 m!688433))

(declare-fun m!688435 () Bool)

(assert (=> b!736264 m!688435))

(declare-fun m!688437 () Bool)

(assert (=> b!736275 m!688437))

(declare-fun m!688439 () Bool)

(assert (=> b!736275 m!688439))

(declare-fun m!688441 () Bool)

(assert (=> b!736262 m!688441))

(assert (=> b!736273 m!688429))

(assert (=> b!736273 m!688429))

(declare-fun m!688443 () Bool)

(assert (=> b!736273 m!688443))

(assert (=> b!736273 m!688443))

(assert (=> b!736273 m!688429))

(declare-fun m!688445 () Bool)

(assert (=> b!736273 m!688445))

(declare-fun m!688447 () Bool)

(assert (=> b!736258 m!688447))

(declare-fun m!688449 () Bool)

(assert (=> b!736258 m!688449))

(assert (=> b!736258 m!688447))

(declare-fun m!688451 () Bool)

(assert (=> b!736258 m!688451))

(declare-fun m!688453 () Bool)

(assert (=> b!736258 m!688453))

(declare-fun m!688455 () Bool)

(assert (=> b!736258 m!688455))

(assert (=> b!736255 m!688429))

(assert (=> b!736255 m!688429))

(declare-fun m!688457 () Bool)

(assert (=> b!736255 m!688457))

(assert (=> b!736253 m!688429))

(assert (=> b!736253 m!688429))

(declare-fun m!688459 () Bool)

(assert (=> b!736253 m!688459))

(declare-fun m!688461 () Bool)

(assert (=> b!736257 m!688461))

(assert (=> b!736256 m!688429))

(assert (=> b!736256 m!688429))

(declare-fun m!688463 () Bool)

(assert (=> b!736256 m!688463))

(declare-fun m!688465 () Bool)

(assert (=> b!736261 m!688465))

(declare-fun m!688467 () Bool)

(assert (=> b!736274 m!688467))

(declare-fun m!688469 () Bool)

(assert (=> b!736259 m!688469))

(declare-fun m!688471 () Bool)

(assert (=> start!65152 m!688471))

(declare-fun m!688473 () Bool)

(assert (=> start!65152 m!688473))

(declare-fun m!688475 () Bool)

(assert (=> b!736270 m!688475))

(assert (=> b!736271 m!688429))

(assert (=> b!736271 m!688429))

(declare-fun m!688477 () Bool)

(assert (=> b!736271 m!688477))

(assert (=> b!736252 m!688429))

(assert (=> b!736252 m!688429))

(declare-fun m!688479 () Bool)

(assert (=> b!736252 m!688479))

(declare-fun m!688481 () Bool)

(assert (=> b!736268 m!688481))

(assert (=> b!736272 m!688429))

(assert (=> b!736272 m!688429))

(assert (=> b!736272 m!688431))

(assert (=> b!736272 m!688429))

(assert (=> b!736272 m!688463))

(assert (=> b!736265 m!688429))

(assert (=> b!736265 m!688429))

(assert (=> b!736265 m!688457))

(push 1)

