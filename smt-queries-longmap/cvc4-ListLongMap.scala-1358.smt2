; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26710 () Bool)

(assert start!26710)

(declare-fun b!277328 () Bool)

(declare-fun res!141249 () Bool)

(declare-fun e!177007 () Bool)

(assert (=> b!277328 (=> (not res!141249) (not e!177007))))

(declare-datatypes ((array!13807 0))(
  ( (array!13808 (arr!6553 (Array (_ BitVec 32) (_ BitVec 64))) (size!6905 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13807)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13807 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277328 (= res!141249 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277329 () Bool)

(declare-fun e!177005 () Bool)

(assert (=> b!277329 (= e!177005 false)))

(declare-datatypes ((Unit!8734 0))(
  ( (Unit!8735) )
))
(declare-fun lt!137904 () Unit!8734)

(declare-fun e!177006 () Unit!8734)

(assert (=> b!277329 (= lt!137904 e!177006)))

(declare-fun c!45591 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!277329 (= c!45591 (bvslt startIndex!26 (bvsub (size!6905 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!277330 () Bool)

(assert (=> b!277330 (= e!177007 e!177005)))

(declare-fun res!141253 () Bool)

(assert (=> b!277330 (=> (not res!141253) (not e!177005))))

(declare-datatypes ((SeekEntryResult!1711 0))(
  ( (MissingZero!1711 (index!9014 (_ BitVec 32))) (Found!1711 (index!9015 (_ BitVec 32))) (Intermediate!1711 (undefined!2523 Bool) (index!9016 (_ BitVec 32)) (x!27260 (_ BitVec 32))) (Undefined!1711) (MissingVacant!1711 (index!9017 (_ BitVec 32))) )
))
(declare-fun lt!137905 () SeekEntryResult!1711)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!277330 (= res!141253 (or (= lt!137905 (MissingZero!1711 i!1267)) (= lt!137905 (MissingVacant!1711 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13807 (_ BitVec 32)) SeekEntryResult!1711)

(assert (=> b!277330 (= lt!137905 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!277332 () Bool)

(declare-fun res!141251 () Bool)

(assert (=> b!277332 (=> (not res!141251) (not e!177007))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277332 (= res!141251 (validKeyInArray!0 k!2581))))

(declare-fun b!277333 () Bool)

(declare-fun lt!137903 () Unit!8734)

(assert (=> b!277333 (= e!177006 lt!137903)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13807 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8734)

(assert (=> b!277333 (= lt!137903 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13807 (_ BitVec 32)) Bool)

(assert (=> b!277333 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13808 (store (arr!6553 a!3325) i!1267 k!2581) (size!6905 a!3325)) mask!3868)))

(declare-fun b!277334 () Bool)

(declare-fun res!141248 () Bool)

(assert (=> b!277334 (=> (not res!141248) (not e!177007))))

(assert (=> b!277334 (= res!141248 (and (= (size!6905 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6905 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6905 a!3325))))))

(declare-fun b!277335 () Bool)

(declare-fun res!141254 () Bool)

(assert (=> b!277335 (=> (not res!141254) (not e!177005))))

(assert (=> b!277335 (= res!141254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277336 () Bool)

(declare-fun Unit!8736 () Unit!8734)

(assert (=> b!277336 (= e!177006 Unit!8736)))

(declare-fun b!277337 () Bool)

(declare-fun res!141250 () Bool)

(assert (=> b!277337 (=> (not res!141250) (not e!177007))))

(declare-datatypes ((List!4361 0))(
  ( (Nil!4358) (Cons!4357 (h!5024 (_ BitVec 64)) (t!9443 List!4361)) )
))
(declare-fun arrayNoDuplicates!0 (array!13807 (_ BitVec 32) List!4361) Bool)

(assert (=> b!277337 (= res!141250 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4358))))

(declare-fun b!277331 () Bool)

(declare-fun res!141255 () Bool)

(assert (=> b!277331 (=> (not res!141255) (not e!177005))))

(assert (=> b!277331 (= res!141255 (= startIndex!26 i!1267))))

(declare-fun res!141252 () Bool)

(assert (=> start!26710 (=> (not res!141252) (not e!177007))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26710 (= res!141252 (validMask!0 mask!3868))))

(assert (=> start!26710 e!177007))

(declare-fun array_inv!4516 (array!13807) Bool)

(assert (=> start!26710 (array_inv!4516 a!3325)))

(assert (=> start!26710 true))

(assert (= (and start!26710 res!141252) b!277334))

(assert (= (and b!277334 res!141248) b!277332))

(assert (= (and b!277332 res!141251) b!277337))

(assert (= (and b!277337 res!141250) b!277328))

(assert (= (and b!277328 res!141249) b!277330))

(assert (= (and b!277330 res!141253) b!277335))

(assert (= (and b!277335 res!141254) b!277331))

(assert (= (and b!277331 res!141255) b!277329))

(assert (= (and b!277329 c!45591) b!277333))

(assert (= (and b!277329 (not c!45591)) b!277336))

(declare-fun m!292411 () Bool)

(assert (=> start!26710 m!292411))

(declare-fun m!292413 () Bool)

(assert (=> start!26710 m!292413))

(declare-fun m!292415 () Bool)

(assert (=> b!277335 m!292415))

(declare-fun m!292417 () Bool)

(assert (=> b!277332 m!292417))

(declare-fun m!292419 () Bool)

(assert (=> b!277328 m!292419))

(declare-fun m!292421 () Bool)

(assert (=> b!277333 m!292421))

(declare-fun m!292423 () Bool)

(assert (=> b!277333 m!292423))

(declare-fun m!292425 () Bool)

(assert (=> b!277333 m!292425))

(declare-fun m!292427 () Bool)

(assert (=> b!277330 m!292427))

(declare-fun m!292429 () Bool)

(assert (=> b!277337 m!292429))

(push 1)

(assert (not start!26710))

(assert (not b!277328))

