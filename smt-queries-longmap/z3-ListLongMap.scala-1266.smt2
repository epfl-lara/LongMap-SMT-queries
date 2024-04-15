; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26156 () Bool)

(assert start!26156)

(declare-fun b!269912 () Bool)

(declare-fun res!134041 () Bool)

(declare-fun e!174021 () Bool)

(assert (=> b!269912 (=> (not res!134041) (not e!174021))))

(declare-datatypes ((array!13242 0))(
  ( (array!13243 (arr!6270 (Array (_ BitVec 32) (_ BitVec 64))) (size!6623 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13242)

(declare-datatypes ((List!4051 0))(
  ( (Nil!4048) (Cons!4047 (h!4714 (_ BitVec 64)) (t!9124 List!4051)) )
))
(declare-fun arrayNoDuplicates!0 (array!13242 (_ BitVec 32) List!4051) Bool)

(assert (=> b!269912 (= res!134041 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4048))))

(declare-fun b!269913 () Bool)

(declare-fun e!174020 () Bool)

(assert (=> b!269913 (= e!174020 (not true))))

(declare-fun lt!135264 () array!13242)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1427 0))(
  ( (MissingZero!1427 (index!7878 (_ BitVec 32))) (Found!1427 (index!7879 (_ BitVec 32))) (Intermediate!1427 (undefined!2239 Bool) (index!7880 (_ BitVec 32)) (x!26239 (_ BitVec 32))) (Undefined!1427) (MissingVacant!1427 (index!7881 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13242 (_ BitVec 32)) SeekEntryResult!1427)

(assert (=> b!269913 (= (seekEntryOrOpen!0 k0!2581 lt!135264 mask!3868) (Found!1427 i!1267))))

(declare-datatypes ((Unit!8358 0))(
  ( (Unit!8359) )
))
(declare-fun lt!135262 () Unit!8358)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13242 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8358)

(assert (=> b!269913 (= lt!135262 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k0!2581 mask!3868))))

(declare-fun lt!135261 () Unit!8358)

(declare-fun e!174022 () Unit!8358)

(assert (=> b!269913 (= lt!135261 e!174022)))

(declare-fun c!45487 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!269913 (= c!45487 (bvslt startIndex!26 (bvsub (size!6623 a!3325) #b00000000000000000000000000000001)))))

(declare-fun res!134044 () Bool)

(assert (=> start!26156 (=> (not res!134044) (not e!174021))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26156 (= res!134044 (validMask!0 mask!3868))))

(assert (=> start!26156 e!174021))

(declare-fun array_inv!4242 (array!13242) Bool)

(assert (=> start!26156 (array_inv!4242 a!3325)))

(assert (=> start!26156 true))

(declare-fun b!269914 () Bool)

(declare-fun res!134046 () Bool)

(assert (=> b!269914 (=> (not res!134046) (not e!174021))))

(declare-fun arrayContainsKey!0 (array!13242 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269914 (= res!134046 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269915 () Bool)

(declare-fun e!174024 () Bool)

(assert (=> b!269915 (= e!174021 e!174024)))

(declare-fun res!134047 () Bool)

(assert (=> b!269915 (=> (not res!134047) (not e!174024))))

(declare-fun lt!135263 () SeekEntryResult!1427)

(assert (=> b!269915 (= res!134047 (or (= lt!135263 (MissingZero!1427 i!1267)) (= lt!135263 (MissingVacant!1427 i!1267))))))

(assert (=> b!269915 (= lt!135263 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!269916 () Bool)

(declare-fun lt!135260 () Unit!8358)

(assert (=> b!269916 (= e!174022 lt!135260)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13242 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8358)

(assert (=> b!269916 (= lt!135260 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13242 (_ BitVec 32)) Bool)

(assert (=> b!269916 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135264 mask!3868)))

(declare-fun b!269917 () Bool)

(declare-fun Unit!8360 () Unit!8358)

(assert (=> b!269917 (= e!174022 Unit!8360)))

(declare-fun b!269918 () Bool)

(declare-fun res!134042 () Bool)

(assert (=> b!269918 (=> (not res!134042) (not e!174024))))

(assert (=> b!269918 (= res!134042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269919 () Bool)

(declare-fun res!134043 () Bool)

(assert (=> b!269919 (=> (not res!134043) (not e!174021))))

(assert (=> b!269919 (= res!134043 (and (= (size!6623 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6623 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6623 a!3325))))))

(declare-fun b!269920 () Bool)

(declare-fun res!134045 () Bool)

(assert (=> b!269920 (=> (not res!134045) (not e!174021))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269920 (= res!134045 (validKeyInArray!0 k0!2581))))

(declare-fun b!269921 () Bool)

(assert (=> b!269921 (= e!174024 e!174020)))

(declare-fun res!134040 () Bool)

(assert (=> b!269921 (=> (not res!134040) (not e!174020))))

(assert (=> b!269921 (= res!134040 (= startIndex!26 i!1267))))

(assert (=> b!269921 (= lt!135264 (array!13243 (store (arr!6270 a!3325) i!1267 k0!2581) (size!6623 a!3325)))))

(assert (= (and start!26156 res!134044) b!269919))

(assert (= (and b!269919 res!134043) b!269920))

(assert (= (and b!269920 res!134045) b!269912))

(assert (= (and b!269912 res!134041) b!269914))

(assert (= (and b!269914 res!134046) b!269915))

(assert (= (and b!269915 res!134047) b!269918))

(assert (= (and b!269918 res!134042) b!269921))

(assert (= (and b!269921 res!134040) b!269913))

(assert (= (and b!269913 c!45487) b!269916))

(assert (= (and b!269913 (not c!45487)) b!269917))

(declare-fun m!285155 () Bool)

(assert (=> b!269920 m!285155))

(declare-fun m!285157 () Bool)

(assert (=> b!269913 m!285157))

(declare-fun m!285159 () Bool)

(assert (=> b!269913 m!285159))

(declare-fun m!285161 () Bool)

(assert (=> b!269915 m!285161))

(declare-fun m!285163 () Bool)

(assert (=> b!269916 m!285163))

(declare-fun m!285165 () Bool)

(assert (=> b!269916 m!285165))

(declare-fun m!285167 () Bool)

(assert (=> start!26156 m!285167))

(declare-fun m!285169 () Bool)

(assert (=> start!26156 m!285169))

(declare-fun m!285171 () Bool)

(assert (=> b!269918 m!285171))

(declare-fun m!285173 () Bool)

(assert (=> b!269921 m!285173))

(declare-fun m!285175 () Bool)

(assert (=> b!269914 m!285175))

(declare-fun m!285177 () Bool)

(assert (=> b!269912 m!285177))

(check-sat (not b!269918) (not b!269912) (not b!269920) (not b!269913) (not b!269914) (not start!26156) (not b!269916) (not b!269915))
(check-sat)
