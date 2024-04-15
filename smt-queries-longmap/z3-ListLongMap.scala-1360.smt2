; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26720 () Bool)

(assert start!26720)

(declare-fun b!277301 () Bool)

(declare-fun res!141252 () Bool)

(declare-fun e!176952 () Bool)

(assert (=> b!277301 (=> (not res!141252) (not e!176952))))

(declare-datatypes ((array!13806 0))(
  ( (array!13807 (arr!6552 (Array (_ BitVec 32) (_ BitVec 64))) (size!6905 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13806)

(declare-datatypes ((List!4333 0))(
  ( (Nil!4330) (Cons!4329 (h!4996 (_ BitVec 64)) (t!9406 List!4333)) )
))
(declare-fun arrayNoDuplicates!0 (array!13806 (_ BitVec 32) List!4333) Bool)

(assert (=> b!277301 (= res!141252 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4330))))

(declare-fun b!277302 () Bool)

(declare-fun e!176953 () Bool)

(assert (=> b!277302 (= e!176952 e!176953)))

(declare-fun res!141250 () Bool)

(assert (=> b!277302 (=> (not res!141250) (not e!176953))))

(declare-datatypes ((SeekEntryResult!1709 0))(
  ( (MissingZero!1709 (index!9006 (_ BitVec 32))) (Found!1709 (index!9007 (_ BitVec 32))) (Intermediate!1709 (undefined!2521 Bool) (index!9008 (_ BitVec 32)) (x!27273 (_ BitVec 32))) (Undefined!1709) (MissingVacant!1709 (index!9009 (_ BitVec 32))) )
))
(declare-fun lt!137760 () SeekEntryResult!1709)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!277302 (= res!141250 (or (= lt!137760 (MissingZero!1709 i!1267)) (= lt!137760 (MissingVacant!1709 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13806 (_ BitVec 32)) SeekEntryResult!1709)

(assert (=> b!277302 (= lt!137760 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!277303 () Bool)

(declare-fun res!141256 () Bool)

(assert (=> b!277303 (=> (not res!141256) (not e!176953))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13806 (_ BitVec 32)) Bool)

(assert (=> b!277303 (= res!141256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!141249 () Bool)

(assert (=> start!26720 (=> (not res!141249) (not e!176952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26720 (= res!141249 (validMask!0 mask!3868))))

(assert (=> start!26720 e!176952))

(declare-fun array_inv!4524 (array!13806) Bool)

(assert (=> start!26720 (array_inv!4524 a!3325)))

(assert (=> start!26720 true))

(declare-fun b!277304 () Bool)

(declare-fun res!141251 () Bool)

(assert (=> b!277304 (=> (not res!141251) (not e!176952))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277304 (= res!141251 (validKeyInArray!0 k0!2581))))

(declare-fun b!277305 () Bool)

(assert (=> b!277305 (= e!176953 false)))

(declare-datatypes ((Unit!8700 0))(
  ( (Unit!8701) )
))
(declare-fun lt!137758 () Unit!8700)

(declare-fun e!176954 () Unit!8700)

(assert (=> b!277305 (= lt!137758 e!176954)))

(declare-fun c!45577 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!277305 (= c!45577 (bvslt startIndex!26 (bvsub (size!6905 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!277306 () Bool)

(declare-fun res!141254 () Bool)

(assert (=> b!277306 (=> (not res!141254) (not e!176952))))

(assert (=> b!277306 (= res!141254 (and (= (size!6905 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6905 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6905 a!3325))))))

(declare-fun b!277307 () Bool)

(declare-fun Unit!8702 () Unit!8700)

(assert (=> b!277307 (= e!176954 Unit!8702)))

(declare-fun b!277308 () Bool)

(declare-fun lt!137759 () Unit!8700)

(assert (=> b!277308 (= e!176954 lt!137759)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13806 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8700)

(assert (=> b!277308 (= lt!137759 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!277308 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13807 (store (arr!6552 a!3325) i!1267 k0!2581) (size!6905 a!3325)) mask!3868)))

(declare-fun b!277309 () Bool)

(declare-fun res!141255 () Bool)

(assert (=> b!277309 (=> (not res!141255) (not e!176953))))

(assert (=> b!277309 (= res!141255 (= startIndex!26 i!1267))))

(declare-fun b!277310 () Bool)

(declare-fun res!141253 () Bool)

(assert (=> b!277310 (=> (not res!141253) (not e!176952))))

(declare-fun arrayContainsKey!0 (array!13806 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277310 (= res!141253 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26720 res!141249) b!277306))

(assert (= (and b!277306 res!141254) b!277304))

(assert (= (and b!277304 res!141251) b!277301))

(assert (= (and b!277301 res!141252) b!277310))

(assert (= (and b!277310 res!141253) b!277302))

(assert (= (and b!277302 res!141250) b!277303))

(assert (= (and b!277303 res!141256) b!277309))

(assert (= (and b!277309 res!141255) b!277305))

(assert (= (and b!277305 c!45577) b!277308))

(assert (= (and b!277305 (not c!45577)) b!277307))

(declare-fun m!291899 () Bool)

(assert (=> start!26720 m!291899))

(declare-fun m!291901 () Bool)

(assert (=> start!26720 m!291901))

(declare-fun m!291903 () Bool)

(assert (=> b!277308 m!291903))

(declare-fun m!291905 () Bool)

(assert (=> b!277308 m!291905))

(declare-fun m!291907 () Bool)

(assert (=> b!277308 m!291907))

(declare-fun m!291909 () Bool)

(assert (=> b!277303 m!291909))

(declare-fun m!291911 () Bool)

(assert (=> b!277302 m!291911))

(declare-fun m!291913 () Bool)

(assert (=> b!277304 m!291913))

(declare-fun m!291915 () Bool)

(assert (=> b!277310 m!291915))

(declare-fun m!291917 () Bool)

(assert (=> b!277301 m!291917))

(check-sat (not start!26720) (not b!277304) (not b!277303) (not b!277308) (not b!277310) (not b!277302) (not b!277301))
(check-sat)
