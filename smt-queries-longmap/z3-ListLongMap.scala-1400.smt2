; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27254 () Bool)

(assert start!27254)

(declare-fun b!282081 () Bool)

(declare-fun e!179121 () Bool)

(declare-fun e!179120 () Bool)

(assert (=> b!282081 (= e!179121 e!179120)))

(declare-fun res!145204 () Bool)

(assert (=> b!282081 (=> (not res!145204) (not e!179120))))

(declare-datatypes ((SeekEntryResult!1829 0))(
  ( (MissingZero!1829 (index!9486 (_ BitVec 32))) (Found!1829 (index!9487 (_ BitVec 32))) (Intermediate!1829 (undefined!2641 Bool) (index!9488 (_ BitVec 32)) (x!27722 (_ BitVec 32))) (Undefined!1829) (MissingVacant!1829 (index!9489 (_ BitVec 32))) )
))
(declare-fun lt!139251 () SeekEntryResult!1829)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!282081 (= res!145204 (or (= lt!139251 (MissingZero!1829 i!1267)) (= lt!139251 (MissingVacant!1829 i!1267))))))

(declare-datatypes ((array!14061 0))(
  ( (array!14062 (arr!6672 (Array (_ BitVec 32) (_ BitVec 64))) (size!7025 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14061)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14061 (_ BitVec 32)) SeekEntryResult!1829)

(assert (=> b!282081 (= lt!139251 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!282082 () Bool)

(declare-fun e!179119 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!282082 (= e!179119 (not (or (bvsge startIndex!26 (bvsub (size!7025 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000))))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14061 (_ BitVec 32)) Bool)

(assert (=> b!282082 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8904 0))(
  ( (Unit!8905) )
))
(declare-fun lt!139247 () Unit!8904)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14061 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8904)

(assert (=> b!282082 (= lt!139247 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!139249 () array!14061)

(assert (=> b!282082 (= (seekEntryOrOpen!0 (select (arr!6672 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6672 a!3325) i!1267 k0!2581) startIndex!26) lt!139249 mask!3868))))

(declare-fun lt!139250 () Unit!8904)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14061 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8904)

(assert (=> b!282082 (= lt!139250 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4453 0))(
  ( (Nil!4450) (Cons!4449 (h!5119 (_ BitVec 64)) (t!9526 List!4453)) )
))
(declare-fun arrayNoDuplicates!0 (array!14061 (_ BitVec 32) List!4453) Bool)

(assert (=> b!282082 (arrayNoDuplicates!0 lt!139249 #b00000000000000000000000000000000 Nil!4450)))

(declare-fun lt!139248 () Unit!8904)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14061 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4453) Unit!8904)

(assert (=> b!282082 (= lt!139248 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4450))))

(declare-fun b!282083 () Bool)

(declare-fun res!145209 () Bool)

(assert (=> b!282083 (=> (not res!145209) (not e!179119))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282083 (= res!145209 (validKeyInArray!0 (select (arr!6672 a!3325) startIndex!26)))))

(declare-fun res!145202 () Bool)

(assert (=> start!27254 (=> (not res!145202) (not e!179121))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27254 (= res!145202 (validMask!0 mask!3868))))

(assert (=> start!27254 e!179121))

(declare-fun array_inv!4644 (array!14061) Bool)

(assert (=> start!27254 (array_inv!4644 a!3325)))

(assert (=> start!27254 true))

(declare-fun b!282084 () Bool)

(declare-fun res!145210 () Bool)

(assert (=> b!282084 (=> (not res!145210) (not e!179121))))

(declare-fun arrayContainsKey!0 (array!14061 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282084 (= res!145210 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282085 () Bool)

(declare-fun res!145208 () Bool)

(assert (=> b!282085 (=> (not res!145208) (not e!179121))))

(assert (=> b!282085 (= res!145208 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4450))))

(declare-fun b!282086 () Bool)

(declare-fun res!145206 () Bool)

(assert (=> b!282086 (=> (not res!145206) (not e!179120))))

(assert (=> b!282086 (= res!145206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282087 () Bool)

(declare-fun res!145205 () Bool)

(assert (=> b!282087 (=> (not res!145205) (not e!179121))))

(assert (=> b!282087 (= res!145205 (and (= (size!7025 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7025 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7025 a!3325))))))

(declare-fun b!282088 () Bool)

(assert (=> b!282088 (= e!179120 e!179119)))

(declare-fun res!145207 () Bool)

(assert (=> b!282088 (=> (not res!145207) (not e!179119))))

(assert (=> b!282088 (= res!145207 (not (= startIndex!26 i!1267)))))

(assert (=> b!282088 (= lt!139249 (array!14062 (store (arr!6672 a!3325) i!1267 k0!2581) (size!7025 a!3325)))))

(declare-fun b!282089 () Bool)

(declare-fun res!145203 () Bool)

(assert (=> b!282089 (=> (not res!145203) (not e!179121))))

(assert (=> b!282089 (= res!145203 (validKeyInArray!0 k0!2581))))

(assert (= (and start!27254 res!145202) b!282087))

(assert (= (and b!282087 res!145205) b!282089))

(assert (= (and b!282089 res!145203) b!282085))

(assert (= (and b!282085 res!145208) b!282084))

(assert (= (and b!282084 res!145210) b!282081))

(assert (= (and b!282081 res!145204) b!282086))

(assert (= (and b!282086 res!145206) b!282088))

(assert (= (and b!282088 res!145207) b!282083))

(assert (= (and b!282083 res!145209) b!282082))

(declare-fun m!296135 () Bool)

(assert (=> b!282084 m!296135))

(declare-fun m!296137 () Bool)

(assert (=> b!282082 m!296137))

(declare-fun m!296139 () Bool)

(assert (=> b!282082 m!296139))

(declare-fun m!296141 () Bool)

(assert (=> b!282082 m!296141))

(declare-fun m!296143 () Bool)

(assert (=> b!282082 m!296143))

(declare-fun m!296145 () Bool)

(assert (=> b!282082 m!296145))

(declare-fun m!296147 () Bool)

(assert (=> b!282082 m!296147))

(declare-fun m!296149 () Bool)

(assert (=> b!282082 m!296149))

(assert (=> b!282082 m!296145))

(declare-fun m!296151 () Bool)

(assert (=> b!282082 m!296151))

(declare-fun m!296153 () Bool)

(assert (=> b!282082 m!296153))

(assert (=> b!282082 m!296137))

(declare-fun m!296155 () Bool)

(assert (=> b!282082 m!296155))

(declare-fun m!296157 () Bool)

(assert (=> b!282086 m!296157))

(assert (=> b!282083 m!296145))

(assert (=> b!282083 m!296145))

(declare-fun m!296159 () Bool)

(assert (=> b!282083 m!296159))

(declare-fun m!296161 () Bool)

(assert (=> b!282081 m!296161))

(declare-fun m!296163 () Bool)

(assert (=> b!282085 m!296163))

(declare-fun m!296165 () Bool)

(assert (=> b!282089 m!296165))

(assert (=> b!282088 m!296139))

(declare-fun m!296167 () Bool)

(assert (=> start!27254 m!296167))

(declare-fun m!296169 () Bool)

(assert (=> start!27254 m!296169))

(check-sat (not b!282085) (not b!282081) (not b!282086) (not b!282083) (not b!282082) (not start!27254) (not b!282084) (not b!282089))
(check-sat)
