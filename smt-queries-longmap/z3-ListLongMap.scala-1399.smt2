; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27246 () Bool)

(assert start!27246)

(declare-fun b!282194 () Bool)

(declare-fun res!145241 () Bool)

(declare-fun e!179208 () Bool)

(assert (=> b!282194 (=> (not res!145241) (not e!179208))))

(declare-datatypes ((array!14063 0))(
  ( (array!14064 (arr!6673 (Array (_ BitVec 32) (_ BitVec 64))) (size!7025 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14063)

(declare-datatypes ((List!4394 0))(
  ( (Nil!4391) (Cons!4390 (h!5060 (_ BitVec 64)) (t!9468 List!4394)) )
))
(declare-fun arrayNoDuplicates!0 (array!14063 (_ BitVec 32) List!4394) Bool)

(assert (=> b!282194 (= res!145241 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4391))))

(declare-fun b!282195 () Bool)

(declare-fun e!179209 () Bool)

(declare-fun e!179210 () Bool)

(assert (=> b!282195 (= e!179209 e!179210)))

(declare-fun res!145244 () Bool)

(assert (=> b!282195 (=> (not res!145244) (not e!179210))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!282195 (= res!145244 (not (= startIndex!26 i!1267)))))

(declare-fun lt!139442 () array!14063)

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!282195 (= lt!139442 (array!14064 (store (arr!6673 a!3325) i!1267 k0!2581) (size!7025 a!3325)))))

(declare-fun b!282196 () Bool)

(declare-fun res!145239 () Bool)

(assert (=> b!282196 (=> (not res!145239) (not e!179208))))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!282196 (= res!145239 (and (= (size!7025 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7025 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7025 a!3325))))))

(declare-fun b!282197 () Bool)

(declare-fun res!145242 () Bool)

(assert (=> b!282197 (=> (not res!145242) (not e!179208))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282197 (= res!145242 (validKeyInArray!0 k0!2581))))

(declare-fun res!145237 () Bool)

(assert (=> start!27246 (=> (not res!145237) (not e!179208))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27246 (= res!145237 (validMask!0 mask!3868))))

(assert (=> start!27246 e!179208))

(declare-fun array_inv!4623 (array!14063) Bool)

(assert (=> start!27246 (array_inv!4623 a!3325)))

(assert (=> start!27246 true))

(declare-fun b!282198 () Bool)

(declare-fun res!145238 () Bool)

(assert (=> b!282198 (=> (not res!145238) (not e!179208))))

(declare-fun arrayContainsKey!0 (array!14063 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282198 (= res!145238 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282199 () Bool)

(assert (=> b!282199 (= e!179208 e!179209)))

(declare-fun res!145240 () Bool)

(assert (=> b!282199 (=> (not res!145240) (not e!179209))))

(declare-datatypes ((SeekEntryResult!1796 0))(
  ( (MissingZero!1796 (index!9354 (_ BitVec 32))) (Found!1796 (index!9355 (_ BitVec 32))) (Intermediate!1796 (undefined!2608 Bool) (index!9356 (_ BitVec 32)) (x!27682 (_ BitVec 32))) (Undefined!1796) (MissingVacant!1796 (index!9357 (_ BitVec 32))) )
))
(declare-fun lt!139443 () SeekEntryResult!1796)

(assert (=> b!282199 (= res!145240 (or (= lt!139443 (MissingZero!1796 i!1267)) (= lt!139443 (MissingVacant!1796 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14063 (_ BitVec 32)) SeekEntryResult!1796)

(assert (=> b!282199 (= lt!139443 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!282200 () Bool)

(assert (=> b!282200 (= e!179210 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14063 (_ BitVec 32)) Bool)

(assert (=> b!282200 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8922 0))(
  ( (Unit!8923) )
))
(declare-fun lt!139444 () Unit!8922)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14063 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8922)

(assert (=> b!282200 (= lt!139444 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!282200 (= (seekEntryOrOpen!0 (select (arr!6673 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6673 a!3325) i!1267 k0!2581) startIndex!26) lt!139442 mask!3868))))

(declare-fun lt!139445 () Unit!8922)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14063 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8922)

(assert (=> b!282200 (= lt!139445 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!282200 (arrayNoDuplicates!0 lt!139442 #b00000000000000000000000000000000 Nil!4391)))

(declare-fun lt!139446 () Unit!8922)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14063 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4394) Unit!8922)

(assert (=> b!282200 (= lt!139446 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4391))))

(declare-fun b!282201 () Bool)

(declare-fun res!145243 () Bool)

(assert (=> b!282201 (=> (not res!145243) (not e!179209))))

(assert (=> b!282201 (= res!145243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282202 () Bool)

(declare-fun res!145245 () Bool)

(assert (=> b!282202 (=> (not res!145245) (not e!179210))))

(assert (=> b!282202 (= res!145245 (validKeyInArray!0 (select (arr!6673 a!3325) startIndex!26)))))

(assert (= (and start!27246 res!145237) b!282196))

(assert (= (and b!282196 res!145239) b!282197))

(assert (= (and b!282197 res!145242) b!282194))

(assert (= (and b!282194 res!145241) b!282198))

(assert (= (and b!282198 res!145238) b!282199))

(assert (= (and b!282199 res!145240) b!282201))

(assert (= (and b!282201 res!145243) b!282195))

(assert (= (and b!282195 res!145244) b!282202))

(assert (= (and b!282202 res!145245) b!282200))

(declare-fun m!296825 () Bool)

(assert (=> b!282195 m!296825))

(declare-fun m!296827 () Bool)

(assert (=> b!282197 m!296827))

(declare-fun m!296829 () Bool)

(assert (=> b!282201 m!296829))

(declare-fun m!296831 () Bool)

(assert (=> start!27246 m!296831))

(declare-fun m!296833 () Bool)

(assert (=> start!27246 m!296833))

(declare-fun m!296835 () Bool)

(assert (=> b!282199 m!296835))

(declare-fun m!296837 () Bool)

(assert (=> b!282198 m!296837))

(declare-fun m!296839 () Bool)

(assert (=> b!282200 m!296839))

(declare-fun m!296841 () Bool)

(assert (=> b!282200 m!296841))

(assert (=> b!282200 m!296825))

(declare-fun m!296843 () Bool)

(assert (=> b!282200 m!296843))

(declare-fun m!296845 () Bool)

(assert (=> b!282200 m!296845))

(declare-fun m!296847 () Bool)

(assert (=> b!282200 m!296847))

(assert (=> b!282200 m!296841))

(declare-fun m!296849 () Bool)

(assert (=> b!282200 m!296849))

(declare-fun m!296851 () Bool)

(assert (=> b!282200 m!296851))

(declare-fun m!296853 () Bool)

(assert (=> b!282200 m!296853))

(assert (=> b!282200 m!296845))

(declare-fun m!296855 () Bool)

(assert (=> b!282200 m!296855))

(declare-fun m!296857 () Bool)

(assert (=> b!282194 m!296857))

(assert (=> b!282202 m!296845))

(assert (=> b!282202 m!296845))

(declare-fun m!296859 () Bool)

(assert (=> b!282202 m!296859))

(check-sat (not b!282200) (not b!282194) (not b!282198) (not b!282199) (not start!27246) (not b!282202) (not b!282201) (not b!282197))
(check-sat)
