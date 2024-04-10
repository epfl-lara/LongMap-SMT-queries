; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26708 () Bool)

(assert start!26708)

(declare-fun b!277298 () Bool)

(declare-fun res!141224 () Bool)

(declare-fun e!176994 () Bool)

(assert (=> b!277298 (=> (not res!141224) (not e!176994))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!277298 (= res!141224 (= startIndex!26 i!1267))))

(declare-fun b!277299 () Bool)

(declare-fun res!141229 () Bool)

(declare-fun e!176995 () Bool)

(assert (=> b!277299 (=> (not res!141229) (not e!176995))))

(declare-datatypes ((array!13805 0))(
  ( (array!13806 (arr!6552 (Array (_ BitVec 32) (_ BitVec 64))) (size!6904 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13805)

(declare-datatypes ((List!4360 0))(
  ( (Nil!4357) (Cons!4356 (h!5023 (_ BitVec 64)) (t!9442 List!4360)) )
))
(declare-fun arrayNoDuplicates!0 (array!13805 (_ BitVec 32) List!4360) Bool)

(assert (=> b!277299 (= res!141229 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4357))))

(declare-fun b!277300 () Bool)

(declare-fun res!141228 () Bool)

(assert (=> b!277300 (=> (not res!141228) (not e!176994))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13805 (_ BitVec 32)) Bool)

(assert (=> b!277300 (= res!141228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277301 () Bool)

(declare-datatypes ((Unit!8731 0))(
  ( (Unit!8732) )
))
(declare-fun e!176996 () Unit!8731)

(declare-fun lt!137894 () Unit!8731)

(assert (=> b!277301 (= e!176996 lt!137894)))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13805 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8731)

(assert (=> b!277301 (= lt!137894 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!277301 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13806 (store (arr!6552 a!3325) i!1267 k0!2581) (size!6904 a!3325)) mask!3868)))

(declare-fun b!277302 () Bool)

(declare-fun res!141225 () Bool)

(assert (=> b!277302 (=> (not res!141225) (not e!176995))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277302 (= res!141225 (validKeyInArray!0 k0!2581))))

(declare-fun b!277303 () Bool)

(declare-fun Unit!8733 () Unit!8731)

(assert (=> b!277303 (= e!176996 Unit!8733)))

(declare-fun b!277304 () Bool)

(assert (=> b!277304 (= e!176994 false)))

(declare-fun lt!137895 () Unit!8731)

(assert (=> b!277304 (= lt!137895 e!176996)))

(declare-fun c!45588 () Bool)

(assert (=> b!277304 (= c!45588 (bvslt startIndex!26 (bvsub (size!6904 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!277305 () Bool)

(declare-fun res!141230 () Bool)

(assert (=> b!277305 (=> (not res!141230) (not e!176995))))

(assert (=> b!277305 (= res!141230 (and (= (size!6904 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6904 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6904 a!3325))))))

(declare-fun b!277306 () Bool)

(assert (=> b!277306 (= e!176995 e!176994)))

(declare-fun res!141231 () Bool)

(assert (=> b!277306 (=> (not res!141231) (not e!176994))))

(declare-datatypes ((SeekEntryResult!1710 0))(
  ( (MissingZero!1710 (index!9010 (_ BitVec 32))) (Found!1710 (index!9011 (_ BitVec 32))) (Intermediate!1710 (undefined!2522 Bool) (index!9012 (_ BitVec 32)) (x!27259 (_ BitVec 32))) (Undefined!1710) (MissingVacant!1710 (index!9013 (_ BitVec 32))) )
))
(declare-fun lt!137896 () SeekEntryResult!1710)

(assert (=> b!277306 (= res!141231 (or (= lt!137896 (MissingZero!1710 i!1267)) (= lt!137896 (MissingVacant!1710 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13805 (_ BitVec 32)) SeekEntryResult!1710)

(assert (=> b!277306 (= lt!137896 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!141226 () Bool)

(assert (=> start!26708 (=> (not res!141226) (not e!176995))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26708 (= res!141226 (validMask!0 mask!3868))))

(assert (=> start!26708 e!176995))

(declare-fun array_inv!4515 (array!13805) Bool)

(assert (=> start!26708 (array_inv!4515 a!3325)))

(assert (=> start!26708 true))

(declare-fun b!277307 () Bool)

(declare-fun res!141227 () Bool)

(assert (=> b!277307 (=> (not res!141227) (not e!176995))))

(declare-fun arrayContainsKey!0 (array!13805 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277307 (= res!141227 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26708 res!141226) b!277305))

(assert (= (and b!277305 res!141230) b!277302))

(assert (= (and b!277302 res!141225) b!277299))

(assert (= (and b!277299 res!141229) b!277307))

(assert (= (and b!277307 res!141227) b!277306))

(assert (= (and b!277306 res!141231) b!277300))

(assert (= (and b!277300 res!141228) b!277298))

(assert (= (and b!277298 res!141224) b!277304))

(assert (= (and b!277304 c!45588) b!277301))

(assert (= (and b!277304 (not c!45588)) b!277303))

(declare-fun m!292391 () Bool)

(assert (=> b!277301 m!292391))

(declare-fun m!292393 () Bool)

(assert (=> b!277301 m!292393))

(declare-fun m!292395 () Bool)

(assert (=> b!277301 m!292395))

(declare-fun m!292397 () Bool)

(assert (=> b!277306 m!292397))

(declare-fun m!292399 () Bool)

(assert (=> start!26708 m!292399))

(declare-fun m!292401 () Bool)

(assert (=> start!26708 m!292401))

(declare-fun m!292403 () Bool)

(assert (=> b!277300 m!292403))

(declare-fun m!292405 () Bool)

(assert (=> b!277299 m!292405))

(declare-fun m!292407 () Bool)

(assert (=> b!277307 m!292407))

(declare-fun m!292409 () Bool)

(assert (=> b!277302 m!292409))

(check-sat (not start!26708) (not b!277307) (not b!277299) (not b!277302) (not b!277300) (not b!277301) (not b!277306))
(check-sat)
