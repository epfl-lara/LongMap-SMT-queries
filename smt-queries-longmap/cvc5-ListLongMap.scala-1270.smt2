; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26178 () Bool)

(assert start!26178)

(declare-fun b!270419 () Bool)

(declare-fun e!174301 () Bool)

(declare-fun e!174302 () Bool)

(assert (=> b!270419 (= e!174301 e!174302)))

(declare-fun res!134430 () Bool)

(assert (=> b!270419 (=> (not res!134430) (not e!174302))))

(declare-datatypes ((SeekEntryResult!1445 0))(
  ( (MissingZero!1445 (index!7950 (_ BitVec 32))) (Found!1445 (index!7951 (_ BitVec 32))) (Intermediate!1445 (undefined!2257 Bool) (index!7952 (_ BitVec 32)) (x!26290 (_ BitVec 32))) (Undefined!1445) (MissingVacant!1445 (index!7953 (_ BitVec 32))) )
))
(declare-fun lt!135621 () SeekEntryResult!1445)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!270419 (= res!134430 (or (= lt!135621 (MissingZero!1445 i!1267)) (= lt!135621 (MissingVacant!1445 i!1267))))))

(declare-datatypes ((array!13275 0))(
  ( (array!13276 (arr!6287 (Array (_ BitVec 32) (_ BitVec 64))) (size!6639 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13275)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13275 (_ BitVec 32)) SeekEntryResult!1445)

(assert (=> b!270419 (= lt!135621 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!270420 () Bool)

(declare-fun e!174304 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!270420 (= e!174304 (not (bvsle startIndex!26 (size!6639 a!3325))))))

(declare-fun lt!135623 () array!13275)

(assert (=> b!270420 (= (seekEntryOrOpen!0 k!2581 lt!135623 mask!3868) (Found!1445 i!1267))))

(declare-datatypes ((Unit!8440 0))(
  ( (Unit!8441) )
))
(declare-fun lt!135624 () Unit!8440)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13275 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8440)

(assert (=> b!270420 (= lt!135624 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k!2581 mask!3868))))

(declare-fun lt!135622 () Unit!8440)

(declare-fun e!174305 () Unit!8440)

(assert (=> b!270420 (= lt!135622 e!174305)))

(declare-fun c!45549 () Bool)

(assert (=> b!270420 (= c!45549 (bvslt startIndex!26 (bvsub (size!6639 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!270421 () Bool)

(declare-fun res!134426 () Bool)

(assert (=> b!270421 (=> (not res!134426) (not e!174302))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13275 (_ BitVec 32)) Bool)

(assert (=> b!270421 (= res!134426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270422 () Bool)

(assert (=> b!270422 (= e!174302 e!174304)))

(declare-fun res!134425 () Bool)

(assert (=> b!270422 (=> (not res!134425) (not e!174304))))

(assert (=> b!270422 (= res!134425 (= startIndex!26 i!1267))))

(assert (=> b!270422 (= lt!135623 (array!13276 (store (arr!6287 a!3325) i!1267 k!2581) (size!6639 a!3325)))))

(declare-fun b!270423 () Bool)

(declare-fun res!134424 () Bool)

(assert (=> b!270423 (=> (not res!134424) (not e!174301))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270423 (= res!134424 (validKeyInArray!0 k!2581))))

(declare-fun res!134429 () Bool)

(assert (=> start!26178 (=> (not res!134429) (not e!174301))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26178 (= res!134429 (validMask!0 mask!3868))))

(assert (=> start!26178 e!174301))

(declare-fun array_inv!4250 (array!13275) Bool)

(assert (=> start!26178 (array_inv!4250 a!3325)))

(assert (=> start!26178 true))

(declare-fun b!270424 () Bool)

(declare-fun res!134423 () Bool)

(assert (=> b!270424 (=> (not res!134423) (not e!174301))))

(declare-datatypes ((List!4095 0))(
  ( (Nil!4092) (Cons!4091 (h!4758 (_ BitVec 64)) (t!9177 List!4095)) )
))
(declare-fun arrayNoDuplicates!0 (array!13275 (_ BitVec 32) List!4095) Bool)

(assert (=> b!270424 (= res!134423 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4092))))

(declare-fun b!270425 () Bool)

(declare-fun Unit!8442 () Unit!8440)

(assert (=> b!270425 (= e!174305 Unit!8442)))

(declare-fun b!270426 () Bool)

(declare-fun res!134428 () Bool)

(assert (=> b!270426 (=> (not res!134428) (not e!174301))))

(declare-fun arrayContainsKey!0 (array!13275 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270426 (= res!134428 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270427 () Bool)

(declare-fun lt!135625 () Unit!8440)

(assert (=> b!270427 (= e!174305 lt!135625)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13275 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8440)

(assert (=> b!270427 (= lt!135625 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!270427 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135623 mask!3868)))

(declare-fun b!270428 () Bool)

(declare-fun res!134427 () Bool)

(assert (=> b!270428 (=> (not res!134427) (not e!174301))))

(assert (=> b!270428 (= res!134427 (and (= (size!6639 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6639 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6639 a!3325))))))

(assert (= (and start!26178 res!134429) b!270428))

(assert (= (and b!270428 res!134427) b!270423))

(assert (= (and b!270423 res!134424) b!270424))

(assert (= (and b!270424 res!134423) b!270426))

(assert (= (and b!270426 res!134428) b!270419))

(assert (= (and b!270419 res!134430) b!270421))

(assert (= (and b!270421 res!134426) b!270422))

(assert (= (and b!270422 res!134425) b!270420))

(assert (= (and b!270420 c!45549) b!270427))

(assert (= (and b!270420 (not c!45549)) b!270425))

(declare-fun m!286035 () Bool)

(assert (=> b!270427 m!286035))

(declare-fun m!286037 () Bool)

(assert (=> b!270427 m!286037))

(declare-fun m!286039 () Bool)

(assert (=> b!270419 m!286039))

(declare-fun m!286041 () Bool)

(assert (=> b!270424 m!286041))

(declare-fun m!286043 () Bool)

(assert (=> b!270421 m!286043))

(declare-fun m!286045 () Bool)

(assert (=> b!270426 m!286045))

(declare-fun m!286047 () Bool)

(assert (=> b!270423 m!286047))

(declare-fun m!286049 () Bool)

(assert (=> b!270422 m!286049))

(declare-fun m!286051 () Bool)

(assert (=> start!26178 m!286051))

(declare-fun m!286053 () Bool)

(assert (=> start!26178 m!286053))

(declare-fun m!286055 () Bool)

(assert (=> b!270420 m!286055))

(declare-fun m!286057 () Bool)

(assert (=> b!270420 m!286057))

(push 1)

(assert (not b!270419))

(assert (not b!270423))

(assert (not b!270421))

(assert (not b!270426))

(assert (not b!270427))

(assert (not start!26178))

(assert (not b!270420))

(assert (not b!270424))

(check-sat)

(pop 1)

(push 1)

(check-sat)

