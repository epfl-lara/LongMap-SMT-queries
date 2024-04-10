; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27246 () Bool)

(assert start!27246)

(declare-fun b!282147 () Bool)

(declare-fun res!145219 () Bool)

(declare-fun e!179184 () Bool)

(assert (=> b!282147 (=> (not res!145219) (not e!179184))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((array!14064 0))(
  ( (array!14065 (arr!6674 (Array (_ BitVec 32) (_ BitVec 64))) (size!7026 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14064)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!282147 (= res!145219 (and (= (size!7026 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7026 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7026 a!3325))))))

(declare-fun res!145223 () Bool)

(assert (=> start!27246 (=> (not res!145223) (not e!179184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27246 (= res!145223 (validMask!0 mask!3868))))

(assert (=> start!27246 e!179184))

(declare-fun array_inv!4637 (array!14064) Bool)

(assert (=> start!27246 (array_inv!4637 a!3325)))

(assert (=> start!27246 true))

(declare-fun b!282148 () Bool)

(declare-fun res!145222 () Bool)

(declare-fun e!179185 () Bool)

(assert (=> b!282148 (=> (not res!145222) (not e!179185))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14064 (_ BitVec 32)) Bool)

(assert (=> b!282148 (= res!145222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282149 () Bool)

(declare-fun res!145217 () Bool)

(assert (=> b!282149 (=> (not res!145217) (not e!179184))))

(declare-datatypes ((List!4482 0))(
  ( (Nil!4479) (Cons!4478 (h!5148 (_ BitVec 64)) (t!9564 List!4482)) )
))
(declare-fun arrayNoDuplicates!0 (array!14064 (_ BitVec 32) List!4482) Bool)

(assert (=> b!282149 (= res!145217 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4479))))

(declare-fun b!282150 () Bool)

(declare-fun res!145221 () Bool)

(assert (=> b!282150 (=> (not res!145221) (not e!179184))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282150 (= res!145221 (validKeyInArray!0 k!2581))))

(declare-fun b!282151 () Bool)

(declare-fun e!179183 () Bool)

(assert (=> b!282151 (= e!179183 (not true))))

(assert (=> b!282151 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8948 0))(
  ( (Unit!8949) )
))
(declare-fun lt!139387 () Unit!8948)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14064 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8948)

(assert (=> b!282151 (= lt!139387 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!139385 () array!14064)

(declare-datatypes ((SeekEntryResult!1832 0))(
  ( (MissingZero!1832 (index!9498 (_ BitVec 32))) (Found!1832 (index!9499 (_ BitVec 32))) (Intermediate!1832 (undefined!2644 Bool) (index!9500 (_ BitVec 32)) (x!27718 (_ BitVec 32))) (Undefined!1832) (MissingVacant!1832 (index!9501 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14064 (_ BitVec 32)) SeekEntryResult!1832)

(assert (=> b!282151 (= (seekEntryOrOpen!0 (select (arr!6674 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6674 a!3325) i!1267 k!2581) startIndex!26) lt!139385 mask!3868))))

(declare-fun lt!139386 () Unit!8948)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14064 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8948)

(assert (=> b!282151 (= lt!139386 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!282151 (arrayNoDuplicates!0 lt!139385 #b00000000000000000000000000000000 Nil!4479)))

(declare-fun lt!139383 () Unit!8948)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14064 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4482) Unit!8948)

(assert (=> b!282151 (= lt!139383 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4479))))

(declare-fun b!282152 () Bool)

(assert (=> b!282152 (= e!179185 e!179183)))

(declare-fun res!145218 () Bool)

(assert (=> b!282152 (=> (not res!145218) (not e!179183))))

(assert (=> b!282152 (= res!145218 (not (= startIndex!26 i!1267)))))

(assert (=> b!282152 (= lt!139385 (array!14065 (store (arr!6674 a!3325) i!1267 k!2581) (size!7026 a!3325)))))

(declare-fun b!282153 () Bool)

(declare-fun res!145216 () Bool)

(assert (=> b!282153 (=> (not res!145216) (not e!179183))))

(assert (=> b!282153 (= res!145216 (validKeyInArray!0 (select (arr!6674 a!3325) startIndex!26)))))

(declare-fun b!282154 () Bool)

(declare-fun res!145220 () Bool)

(assert (=> b!282154 (=> (not res!145220) (not e!179184))))

(declare-fun arrayContainsKey!0 (array!14064 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282154 (= res!145220 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282155 () Bool)

(assert (=> b!282155 (= e!179184 e!179185)))

(declare-fun res!145224 () Bool)

(assert (=> b!282155 (=> (not res!145224) (not e!179185))))

(declare-fun lt!139384 () SeekEntryResult!1832)

(assert (=> b!282155 (= res!145224 (or (= lt!139384 (MissingZero!1832 i!1267)) (= lt!139384 (MissingVacant!1832 i!1267))))))

(assert (=> b!282155 (= lt!139384 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!27246 res!145223) b!282147))

(assert (= (and b!282147 res!145219) b!282150))

(assert (= (and b!282150 res!145221) b!282149))

(assert (= (and b!282149 res!145217) b!282154))

(assert (= (and b!282154 res!145220) b!282155))

(assert (= (and b!282155 res!145224) b!282148))

(assert (= (and b!282148 res!145222) b!282152))

(assert (= (and b!282152 res!145218) b!282153))

(assert (= (and b!282153 res!145216) b!282151))

(declare-fun m!296619 () Bool)

(assert (=> b!282155 m!296619))

(declare-fun m!296621 () Bool)

(assert (=> start!27246 m!296621))

(declare-fun m!296623 () Bool)

(assert (=> start!27246 m!296623))

(declare-fun m!296625 () Bool)

(assert (=> b!282150 m!296625))

(declare-fun m!296627 () Bool)

(assert (=> b!282153 m!296627))

(assert (=> b!282153 m!296627))

(declare-fun m!296629 () Bool)

(assert (=> b!282153 m!296629))

(declare-fun m!296631 () Bool)

(assert (=> b!282149 m!296631))

(declare-fun m!296633 () Bool)

(assert (=> b!282154 m!296633))

(declare-fun m!296635 () Bool)

(assert (=> b!282152 m!296635))

(declare-fun m!296637 () Bool)

(assert (=> b!282151 m!296637))

(declare-fun m!296639 () Bool)

(assert (=> b!282151 m!296639))

(assert (=> b!282151 m!296635))

(assert (=> b!282151 m!296627))

(declare-fun m!296641 () Bool)

(assert (=> b!282151 m!296641))

(declare-fun m!296643 () Bool)

(assert (=> b!282151 m!296643))

(declare-fun m!296645 () Bool)

(assert (=> b!282151 m!296645))

(declare-fun m!296647 () Bool)

(assert (=> b!282151 m!296647))

(assert (=> b!282151 m!296639))

(declare-fun m!296649 () Bool)

(assert (=> b!282151 m!296649))

(assert (=> b!282151 m!296627))

(declare-fun m!296651 () Bool)

(assert (=> b!282151 m!296651))

(declare-fun m!296653 () Bool)

(assert (=> b!282148 m!296653))

(push 1)

