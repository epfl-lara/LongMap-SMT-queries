; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26182 () Bool)

(assert start!26182)

(declare-fun b!270526 () Bool)

(declare-fun e!174359 () Bool)

(declare-fun e!174357 () Bool)

(assert (=> b!270526 (= e!174359 e!174357)))

(declare-fun res!134496 () Bool)

(assert (=> b!270526 (=> (not res!134496) (not e!174357))))

(declare-datatypes ((SeekEntryResult!1411 0))(
  ( (MissingZero!1411 (index!7814 (_ BitVec 32))) (Found!1411 (index!7815 (_ BitVec 32))) (Intermediate!1411 (undefined!2223 Bool) (index!7816 (_ BitVec 32)) (x!26256 (_ BitVec 32))) (Undefined!1411) (MissingVacant!1411 (index!7817 (_ BitVec 32))) )
))
(declare-fun lt!135710 () SeekEntryResult!1411)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!270526 (= res!134496 (or (= lt!135710 (MissingZero!1411 i!1267)) (= lt!135710 (MissingVacant!1411 i!1267))))))

(declare-datatypes ((array!13278 0))(
  ( (array!13279 (arr!6288 (Array (_ BitVec 32) (_ BitVec 64))) (size!6640 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13278)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13278 (_ BitVec 32)) SeekEntryResult!1411)

(assert (=> b!270526 (= lt!135710 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!270527 () Bool)

(declare-fun res!134493 () Bool)

(assert (=> b!270527 (=> (not res!134493) (not e!174359))))

(declare-datatypes ((List!4009 0))(
  ( (Nil!4006) (Cons!4005 (h!4672 (_ BitVec 64)) (t!9083 List!4009)) )
))
(declare-fun arrayNoDuplicates!0 (array!13278 (_ BitVec 32) List!4009) Bool)

(assert (=> b!270527 (= res!134493 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4006))))

(declare-fun b!270528 () Bool)

(declare-datatypes ((Unit!8426 0))(
  ( (Unit!8427) )
))
(declare-fun e!174356 () Unit!8426)

(declare-fun lt!135711 () Unit!8426)

(assert (=> b!270528 (= e!174356 lt!135711)))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13278 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8426)

(assert (=> b!270528 (= lt!135711 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun lt!135712 () array!13278)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13278 (_ BitVec 32)) Bool)

(assert (=> b!270528 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135712 mask!3868)))

(declare-fun b!270529 () Bool)

(declare-fun res!134495 () Bool)

(assert (=> b!270529 (=> (not res!134495) (not e!174359))))

(declare-fun arrayContainsKey!0 (array!13278 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270529 (= res!134495 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270530 () Bool)

(declare-fun res!134494 () Bool)

(assert (=> b!270530 (=> (not res!134494) (not e!174359))))

(assert (=> b!270530 (= res!134494 (and (= (size!6640 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6640 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6640 a!3325))))))

(declare-fun b!270532 () Bool)

(declare-fun Unit!8428 () Unit!8426)

(assert (=> b!270532 (= e!174356 Unit!8428)))

(declare-fun b!270533 () Bool)

(declare-fun e!174355 () Bool)

(assert (=> b!270533 (= e!174357 e!174355)))

(declare-fun res!134497 () Bool)

(assert (=> b!270533 (=> (not res!134497) (not e!174355))))

(assert (=> b!270533 (= res!134497 (= startIndex!26 i!1267))))

(assert (=> b!270533 (= lt!135712 (array!13279 (store (arr!6288 a!3325) i!1267 k!2581) (size!6640 a!3325)))))

(declare-fun b!270534 () Bool)

(declare-fun res!134499 () Bool)

(assert (=> b!270534 (=> (not res!134499) (not e!174359))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270534 (= res!134499 (validKeyInArray!0 k!2581))))

(declare-fun b!270535 () Bool)

(assert (=> b!270535 (= e!174355 (not (bvsle startIndex!26 (size!6640 a!3325))))))

(assert (=> b!270535 (= (seekEntryOrOpen!0 k!2581 lt!135712 mask!3868) (Found!1411 i!1267))))

(declare-fun lt!135713 () Unit!8426)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13278 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8426)

(assert (=> b!270535 (= lt!135713 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k!2581 mask!3868))))

(declare-fun lt!135714 () Unit!8426)

(assert (=> b!270535 (= lt!135714 e!174356)))

(declare-fun c!45568 () Bool)

(assert (=> b!270535 (= c!45568 (bvslt startIndex!26 (bvsub (size!6640 a!3325) #b00000000000000000000000000000001)))))

(declare-fun res!134498 () Bool)

(assert (=> start!26182 (=> (not res!134498) (not e!174359))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26182 (= res!134498 (validMask!0 mask!3868))))

(assert (=> start!26182 e!174359))

(declare-fun array_inv!4238 (array!13278) Bool)

(assert (=> start!26182 (array_inv!4238 a!3325)))

(assert (=> start!26182 true))

(declare-fun b!270531 () Bool)

(declare-fun res!134492 () Bool)

(assert (=> b!270531 (=> (not res!134492) (not e!174357))))

(assert (=> b!270531 (= res!134492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26182 res!134498) b!270530))

(assert (= (and b!270530 res!134494) b!270534))

(assert (= (and b!270534 res!134499) b!270527))

(assert (= (and b!270527 res!134493) b!270529))

(assert (= (and b!270529 res!134495) b!270526))

(assert (= (and b!270526 res!134496) b!270531))

(assert (= (and b!270531 res!134492) b!270533))

(assert (= (and b!270533 res!134497) b!270535))

(assert (= (and b!270535 c!45568) b!270528))

(assert (= (and b!270535 (not c!45568)) b!270532))

(declare-fun m!286289 () Bool)

(assert (=> start!26182 m!286289))

(declare-fun m!286291 () Bool)

(assert (=> start!26182 m!286291))

(declare-fun m!286293 () Bool)

(assert (=> b!270531 m!286293))

(declare-fun m!286295 () Bool)

(assert (=> b!270527 m!286295))

(declare-fun m!286297 () Bool)

(assert (=> b!270534 m!286297))

(declare-fun m!286299 () Bool)

(assert (=> b!270528 m!286299))

(declare-fun m!286301 () Bool)

(assert (=> b!270528 m!286301))

(declare-fun m!286303 () Bool)

(assert (=> b!270526 m!286303))

(declare-fun m!286305 () Bool)

(assert (=> b!270533 m!286305))

(declare-fun m!286307 () Bool)

(assert (=> b!270529 m!286307))

(declare-fun m!286309 () Bool)

(assert (=> b!270535 m!286309))

(declare-fun m!286311 () Bool)

(assert (=> b!270535 m!286311))

(push 1)

(assert (not b!270527))

(assert (not b!270529))

(assert (not b!270534))

(assert (not start!26182))

(assert (not b!270535))

(assert (not b!270531))

(assert (not b!270528))

(assert (not b!270526))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

