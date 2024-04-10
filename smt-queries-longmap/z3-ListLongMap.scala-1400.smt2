; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27254 () Bool)

(assert start!27254)

(declare-fun b!282255 () Bool)

(declare-fun res!145326 () Bool)

(declare-fun e!179233 () Bool)

(assert (=> b!282255 (=> (not res!145326) (not e!179233))))

(declare-datatypes ((array!14072 0))(
  ( (array!14073 (arr!6678 (Array (_ BitVec 32) (_ BitVec 64))) (size!7030 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14072)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!282255 (= res!145326 (and (= (size!7030 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7030 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7030 a!3325))))))

(declare-fun b!282256 () Bool)

(declare-fun res!145331 () Bool)

(assert (=> b!282256 (=> (not res!145331) (not e!179233))))

(declare-datatypes ((List!4486 0))(
  ( (Nil!4483) (Cons!4482 (h!5152 (_ BitVec 64)) (t!9568 List!4486)) )
))
(declare-fun arrayNoDuplicates!0 (array!14072 (_ BitVec 32) List!4486) Bool)

(assert (=> b!282256 (= res!145331 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4483))))

(declare-fun b!282257 () Bool)

(declare-fun res!145324 () Bool)

(declare-fun e!179234 () Bool)

(assert (=> b!282257 (=> (not res!145324) (not e!179234))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14072 (_ BitVec 32)) Bool)

(assert (=> b!282257 (= res!145324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!145328 () Bool)

(assert (=> start!27254 (=> (not res!145328) (not e!179233))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27254 (= res!145328 (validMask!0 mask!3868))))

(assert (=> start!27254 e!179233))

(declare-fun array_inv!4641 (array!14072) Bool)

(assert (=> start!27254 (array_inv!4641 a!3325)))

(assert (=> start!27254 true))

(declare-fun b!282258 () Bool)

(declare-fun res!145329 () Bool)

(assert (=> b!282258 (=> (not res!145329) (not e!179233))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282258 (= res!145329 (validKeyInArray!0 k0!2581))))

(declare-fun b!282259 () Bool)

(assert (=> b!282259 (= e!179233 e!179234)))

(declare-fun res!145330 () Bool)

(assert (=> b!282259 (=> (not res!145330) (not e!179234))))

(declare-datatypes ((SeekEntryResult!1836 0))(
  ( (MissingZero!1836 (index!9514 (_ BitVec 32))) (Found!1836 (index!9515 (_ BitVec 32))) (Intermediate!1836 (undefined!2648 Bool) (index!9516 (_ BitVec 32)) (x!27730 (_ BitVec 32))) (Undefined!1836) (MissingVacant!1836 (index!9517 (_ BitVec 32))) )
))
(declare-fun lt!139447 () SeekEntryResult!1836)

(assert (=> b!282259 (= res!145330 (or (= lt!139447 (MissingZero!1836 i!1267)) (= lt!139447 (MissingVacant!1836 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14072 (_ BitVec 32)) SeekEntryResult!1836)

(assert (=> b!282259 (= lt!139447 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!282260 () Bool)

(declare-fun res!145325 () Bool)

(assert (=> b!282260 (=> (not res!145325) (not e!179233))))

(declare-fun arrayContainsKey!0 (array!14072 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282260 (= res!145325 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282261 () Bool)

(declare-fun e!179232 () Bool)

(assert (=> b!282261 (= e!179234 e!179232)))

(declare-fun res!145327 () Bool)

(assert (=> b!282261 (=> (not res!145327) (not e!179232))))

(assert (=> b!282261 (= res!145327 (not (= startIndex!26 i!1267)))))

(declare-fun lt!139446 () array!14072)

(assert (=> b!282261 (= lt!139446 (array!14073 (store (arr!6678 a!3325) i!1267 k0!2581) (size!7030 a!3325)))))

(declare-fun b!282262 () Bool)

(assert (=> b!282262 (= e!179232 (not (or (bvsge startIndex!26 (bvsub (size!7030 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000))))))

(assert (=> b!282262 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8956 0))(
  ( (Unit!8957) )
))
(declare-fun lt!139443 () Unit!8956)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14072 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8956)

(assert (=> b!282262 (= lt!139443 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!282262 (= (seekEntryOrOpen!0 (select (arr!6678 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6678 a!3325) i!1267 k0!2581) startIndex!26) lt!139446 mask!3868))))

(declare-fun lt!139445 () Unit!8956)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14072 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8956)

(assert (=> b!282262 (= lt!139445 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!282262 (arrayNoDuplicates!0 lt!139446 #b00000000000000000000000000000000 Nil!4483)))

(declare-fun lt!139444 () Unit!8956)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14072 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4486) Unit!8956)

(assert (=> b!282262 (= lt!139444 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4483))))

(declare-fun b!282263 () Bool)

(declare-fun res!145332 () Bool)

(assert (=> b!282263 (=> (not res!145332) (not e!179232))))

(assert (=> b!282263 (= res!145332 (validKeyInArray!0 (select (arr!6678 a!3325) startIndex!26)))))

(assert (= (and start!27254 res!145328) b!282255))

(assert (= (and b!282255 res!145326) b!282258))

(assert (= (and b!282258 res!145329) b!282256))

(assert (= (and b!282256 res!145331) b!282260))

(assert (= (and b!282260 res!145325) b!282259))

(assert (= (and b!282259 res!145330) b!282257))

(assert (= (and b!282257 res!145324) b!282261))

(assert (= (and b!282261 res!145327) b!282263))

(assert (= (and b!282263 res!145332) b!282262))

(declare-fun m!296763 () Bool)

(assert (=> b!282259 m!296763))

(declare-fun m!296765 () Bool)

(assert (=> b!282258 m!296765))

(declare-fun m!296767 () Bool)

(assert (=> b!282263 m!296767))

(assert (=> b!282263 m!296767))

(declare-fun m!296769 () Bool)

(assert (=> b!282263 m!296769))

(declare-fun m!296771 () Bool)

(assert (=> b!282262 m!296771))

(declare-fun m!296773 () Bool)

(assert (=> b!282262 m!296773))

(assert (=> b!282262 m!296773))

(declare-fun m!296775 () Bool)

(assert (=> b!282262 m!296775))

(declare-fun m!296777 () Bool)

(assert (=> b!282262 m!296777))

(declare-fun m!296779 () Bool)

(assert (=> b!282262 m!296779))

(assert (=> b!282262 m!296767))

(declare-fun m!296781 () Bool)

(assert (=> b!282262 m!296781))

(assert (=> b!282262 m!296767))

(declare-fun m!296783 () Bool)

(assert (=> b!282262 m!296783))

(declare-fun m!296785 () Bool)

(assert (=> b!282262 m!296785))

(declare-fun m!296787 () Bool)

(assert (=> b!282262 m!296787))

(declare-fun m!296789 () Bool)

(assert (=> start!27254 m!296789))

(declare-fun m!296791 () Bool)

(assert (=> start!27254 m!296791))

(assert (=> b!282261 m!296777))

(declare-fun m!296793 () Bool)

(assert (=> b!282256 m!296793))

(declare-fun m!296795 () Bool)

(assert (=> b!282257 m!296795))

(declare-fun m!296797 () Bool)

(assert (=> b!282260 m!296797))

(check-sat (not b!282257) (not b!282259) (not b!282256) (not b!282262) (not b!282258) (not start!27254) (not b!282263) (not b!282260))
(check-sat)
