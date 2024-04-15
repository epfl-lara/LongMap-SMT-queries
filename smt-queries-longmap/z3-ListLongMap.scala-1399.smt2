; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27248 () Bool)

(assert start!27248)

(declare-fun b!282000 () Bool)

(declare-fun e!179083 () Bool)

(assert (=> b!282000 (= e!179083 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!14055 0))(
  ( (array!14056 (arr!6669 (Array (_ BitVec 32) (_ BitVec 64))) (size!7022 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14055)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14055 (_ BitVec 32)) Bool)

(assert (=> b!282000 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8898 0))(
  ( (Unit!8899) )
))
(declare-fun lt!139206 () Unit!8898)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14055 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8898)

(assert (=> b!282000 (= lt!139206 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun lt!139203 () array!14055)

(declare-datatypes ((SeekEntryResult!1826 0))(
  ( (MissingZero!1826 (index!9474 (_ BitVec 32))) (Found!1826 (index!9475 (_ BitVec 32))) (Intermediate!1826 (undefined!2638 Bool) (index!9476 (_ BitVec 32)) (x!27711 (_ BitVec 32))) (Undefined!1826) (MissingVacant!1826 (index!9477 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14055 (_ BitVec 32)) SeekEntryResult!1826)

(assert (=> b!282000 (= (seekEntryOrOpen!0 (select (arr!6669 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6669 a!3325) i!1267 k0!2581) startIndex!26) lt!139203 mask!3868))))

(declare-fun lt!139204 () Unit!8898)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14055 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8898)

(assert (=> b!282000 (= lt!139204 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4450 0))(
  ( (Nil!4447) (Cons!4446 (h!5116 (_ BitVec 64)) (t!9523 List!4450)) )
))
(declare-fun arrayNoDuplicates!0 (array!14055 (_ BitVec 32) List!4450) Bool)

(assert (=> b!282000 (arrayNoDuplicates!0 lt!139203 #b00000000000000000000000000000000 Nil!4447)))

(declare-fun lt!139202 () Unit!8898)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14055 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4450) Unit!8898)

(assert (=> b!282000 (= lt!139202 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4447))))

(declare-fun b!282001 () Bool)

(declare-fun e!179084 () Bool)

(declare-fun e!179082 () Bool)

(assert (=> b!282001 (= e!179084 e!179082)))

(declare-fun res!145125 () Bool)

(assert (=> b!282001 (=> (not res!145125) (not e!179082))))

(declare-fun lt!139205 () SeekEntryResult!1826)

(assert (=> b!282001 (= res!145125 (or (= lt!139205 (MissingZero!1826 i!1267)) (= lt!139205 (MissingVacant!1826 i!1267))))))

(assert (=> b!282001 (= lt!139205 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!282002 () Bool)

(declare-fun res!145121 () Bool)

(assert (=> b!282002 (=> (not res!145121) (not e!179084))))

(assert (=> b!282002 (= res!145121 (and (= (size!7022 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7022 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7022 a!3325))))))

(declare-fun res!145129 () Bool)

(assert (=> start!27248 (=> (not res!145129) (not e!179084))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27248 (= res!145129 (validMask!0 mask!3868))))

(assert (=> start!27248 e!179084))

(declare-fun array_inv!4641 (array!14055) Bool)

(assert (=> start!27248 (array_inv!4641 a!3325)))

(assert (=> start!27248 true))

(declare-fun b!282003 () Bool)

(declare-fun res!145124 () Bool)

(assert (=> b!282003 (=> (not res!145124) (not e!179082))))

(assert (=> b!282003 (= res!145124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282004 () Bool)

(declare-fun res!145122 () Bool)

(assert (=> b!282004 (=> (not res!145122) (not e!179084))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282004 (= res!145122 (validKeyInArray!0 k0!2581))))

(declare-fun b!282005 () Bool)

(declare-fun res!145123 () Bool)

(assert (=> b!282005 (=> (not res!145123) (not e!179084))))

(declare-fun arrayContainsKey!0 (array!14055 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282005 (= res!145123 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282006 () Bool)

(assert (=> b!282006 (= e!179082 e!179083)))

(declare-fun res!145127 () Bool)

(assert (=> b!282006 (=> (not res!145127) (not e!179083))))

(assert (=> b!282006 (= res!145127 (not (= startIndex!26 i!1267)))))

(assert (=> b!282006 (= lt!139203 (array!14056 (store (arr!6669 a!3325) i!1267 k0!2581) (size!7022 a!3325)))))

(declare-fun b!282007 () Bool)

(declare-fun res!145126 () Bool)

(assert (=> b!282007 (=> (not res!145126) (not e!179084))))

(assert (=> b!282007 (= res!145126 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4447))))

(declare-fun b!282008 () Bool)

(declare-fun res!145128 () Bool)

(assert (=> b!282008 (=> (not res!145128) (not e!179083))))

(assert (=> b!282008 (= res!145128 (validKeyInArray!0 (select (arr!6669 a!3325) startIndex!26)))))

(assert (= (and start!27248 res!145129) b!282002))

(assert (= (and b!282002 res!145121) b!282004))

(assert (= (and b!282004 res!145122) b!282007))

(assert (= (and b!282007 res!145126) b!282005))

(assert (= (and b!282005 res!145123) b!282001))

(assert (= (and b!282001 res!145125) b!282003))

(assert (= (and b!282003 res!145124) b!282006))

(assert (= (and b!282006 res!145127) b!282008))

(assert (= (and b!282008 res!145128) b!282000))

(declare-fun m!296027 () Bool)

(assert (=> b!282007 m!296027))

(declare-fun m!296029 () Bool)

(assert (=> b!282004 m!296029))

(declare-fun m!296031 () Bool)

(assert (=> b!282008 m!296031))

(assert (=> b!282008 m!296031))

(declare-fun m!296033 () Bool)

(assert (=> b!282008 m!296033))

(declare-fun m!296035 () Bool)

(assert (=> start!27248 m!296035))

(declare-fun m!296037 () Bool)

(assert (=> start!27248 m!296037))

(declare-fun m!296039 () Bool)

(assert (=> b!282006 m!296039))

(declare-fun m!296041 () Bool)

(assert (=> b!282003 m!296041))

(declare-fun m!296043 () Bool)

(assert (=> b!282001 m!296043))

(declare-fun m!296045 () Bool)

(assert (=> b!282000 m!296045))

(declare-fun m!296047 () Bool)

(assert (=> b!282000 m!296047))

(assert (=> b!282000 m!296039))

(declare-fun m!296049 () Bool)

(assert (=> b!282000 m!296049))

(assert (=> b!282000 m!296031))

(declare-fun m!296051 () Bool)

(assert (=> b!282000 m!296051))

(declare-fun m!296053 () Bool)

(assert (=> b!282000 m!296053))

(declare-fun m!296055 () Bool)

(assert (=> b!282000 m!296055))

(assert (=> b!282000 m!296031))

(declare-fun m!296057 () Bool)

(assert (=> b!282000 m!296057))

(assert (=> b!282000 m!296047))

(declare-fun m!296059 () Bool)

(assert (=> b!282000 m!296059))

(declare-fun m!296061 () Bool)

(assert (=> b!282005 m!296061))

(check-sat (not b!282008) (not b!282001) (not b!282007) (not b!282003) (not start!27248) (not b!282004) (not b!282000) (not b!282005))
(check-sat)
