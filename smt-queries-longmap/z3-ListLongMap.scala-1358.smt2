; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26706 () Bool)

(assert start!26706)

(declare-fun b!277315 () Bool)

(declare-fun res!141226 () Bool)

(declare-fun e!177007 () Bool)

(assert (=> b!277315 (=> (not res!141226) (not e!177007))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!277315 (= res!141226 (= startIndex!26 i!1267))))

(declare-fun b!277316 () Bool)

(declare-fun res!141225 () Bool)

(declare-fun e!177006 () Bool)

(assert (=> b!277316 (=> (not res!141225) (not e!177006))))

(declare-datatypes ((array!13802 0))(
  ( (array!13803 (arr!6550 (Array (_ BitVec 32) (_ BitVec 64))) (size!6902 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13802)

(declare-datatypes ((List!4271 0))(
  ( (Nil!4268) (Cons!4267 (h!4934 (_ BitVec 64)) (t!9345 List!4271)) )
))
(declare-fun arrayNoDuplicates!0 (array!13802 (_ BitVec 32) List!4271) Bool)

(assert (=> b!277316 (= res!141225 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4268))))

(declare-fun res!141222 () Bool)

(assert (=> start!26706 (=> (not res!141222) (not e!177006))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26706 (= res!141222 (validMask!0 mask!3868))))

(assert (=> start!26706 e!177006))

(declare-fun array_inv!4500 (array!13802) Bool)

(assert (=> start!26706 (array_inv!4500 a!3325)))

(assert (=> start!26706 true))

(declare-fun b!277317 () Bool)

(declare-datatypes ((Unit!8708 0))(
  ( (Unit!8709) )
))
(declare-fun e!177008 () Unit!8708)

(declare-fun Unit!8710 () Unit!8708)

(assert (=> b!277317 (= e!177008 Unit!8710)))

(declare-fun b!277318 () Bool)

(declare-fun lt!137944 () Unit!8708)

(assert (=> b!277318 (= e!177008 lt!137944)))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13802 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8708)

(assert (=> b!277318 (= lt!137944 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13802 (_ BitVec 32)) Bool)

(assert (=> b!277318 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13803 (store (arr!6550 a!3325) i!1267 k0!2581) (size!6902 a!3325)) mask!3868)))

(declare-fun b!277319 () Bool)

(declare-fun res!141228 () Bool)

(assert (=> b!277319 (=> (not res!141228) (not e!177006))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277319 (= res!141228 (validKeyInArray!0 k0!2581))))

(declare-fun b!277320 () Bool)

(declare-fun res!141223 () Bool)

(assert (=> b!277320 (=> (not res!141223) (not e!177007))))

(assert (=> b!277320 (= res!141223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277321 () Bool)

(declare-fun res!141227 () Bool)

(assert (=> b!277321 (=> (not res!141227) (not e!177006))))

(assert (=> b!277321 (= res!141227 (and (= (size!6902 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6902 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6902 a!3325))))))

(declare-fun b!277322 () Bool)

(assert (=> b!277322 (= e!177007 false)))

(declare-fun lt!137946 () Unit!8708)

(assert (=> b!277322 (= lt!137946 e!177008)))

(declare-fun c!45598 () Bool)

(assert (=> b!277322 (= c!45598 (bvslt startIndex!26 (bvsub (size!6902 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!277323 () Bool)

(declare-fun res!141221 () Bool)

(assert (=> b!277323 (=> (not res!141221) (not e!177006))))

(declare-fun arrayContainsKey!0 (array!13802 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277323 (= res!141221 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277324 () Bool)

(assert (=> b!277324 (= e!177006 e!177007)))

(declare-fun res!141224 () Bool)

(assert (=> b!277324 (=> (not res!141224) (not e!177007))))

(declare-datatypes ((SeekEntryResult!1673 0))(
  ( (MissingZero!1673 (index!8862 (_ BitVec 32))) (Found!1673 (index!8863 (_ BitVec 32))) (Intermediate!1673 (undefined!2485 Bool) (index!8864 (_ BitVec 32)) (x!27222 (_ BitVec 32))) (Undefined!1673) (MissingVacant!1673 (index!8865 (_ BitVec 32))) )
))
(declare-fun lt!137945 () SeekEntryResult!1673)

(assert (=> b!277324 (= res!141224 (or (= lt!137945 (MissingZero!1673 i!1267)) (= lt!137945 (MissingVacant!1673 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13802 (_ BitVec 32)) SeekEntryResult!1673)

(assert (=> b!277324 (= lt!137945 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26706 res!141222) b!277321))

(assert (= (and b!277321 res!141227) b!277319))

(assert (= (and b!277319 res!141228) b!277316))

(assert (= (and b!277316 res!141225) b!277323))

(assert (= (and b!277323 res!141221) b!277324))

(assert (= (and b!277324 res!141224) b!277320))

(assert (= (and b!277320 res!141223) b!277315))

(assert (= (and b!277315 res!141226) b!277322))

(assert (= (and b!277322 c!45598) b!277318))

(assert (= (and b!277322 (not c!45598)) b!277317))

(declare-fun m!292577 () Bool)

(assert (=> b!277319 m!292577))

(declare-fun m!292579 () Bool)

(assert (=> b!277318 m!292579))

(declare-fun m!292581 () Bool)

(assert (=> b!277318 m!292581))

(declare-fun m!292583 () Bool)

(assert (=> b!277318 m!292583))

(declare-fun m!292585 () Bool)

(assert (=> b!277324 m!292585))

(declare-fun m!292587 () Bool)

(assert (=> start!26706 m!292587))

(declare-fun m!292589 () Bool)

(assert (=> start!26706 m!292589))

(declare-fun m!292591 () Bool)

(assert (=> b!277316 m!292591))

(declare-fun m!292593 () Bool)

(assert (=> b!277323 m!292593))

(declare-fun m!292595 () Bool)

(assert (=> b!277320 m!292595))

(check-sat (not b!277318) (not b!277319) (not b!277324) (not start!26706) (not b!277316) (not b!277320) (not b!277323))
(check-sat)
