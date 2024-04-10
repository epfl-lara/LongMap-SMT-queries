; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26688 () Bool)

(assert start!26688)

(declare-fun b!276998 () Bool)

(declare-fun res!140991 () Bool)

(declare-fun e!176874 () Bool)

(assert (=> b!276998 (=> (not res!140991) (not e!176874))))

(declare-datatypes ((array!13785 0))(
  ( (array!13786 (arr!6542 (Array (_ BitVec 32) (_ BitVec 64))) (size!6894 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13785)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13785 (_ BitVec 32)) Bool)

(assert (=> b!276998 (= res!140991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276999 () Bool)

(assert (=> b!276999 (= e!176874 false)))

(declare-datatypes ((Unit!8701 0))(
  ( (Unit!8702) )
))
(declare-fun lt!137805 () Unit!8701)

(declare-fun e!176875 () Unit!8701)

(assert (=> b!276999 (= lt!137805 e!176875)))

(declare-fun c!45558 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276999 (= c!45558 (bvslt startIndex!26 (bvsub (size!6894 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!277000 () Bool)

(declare-fun res!140987 () Bool)

(declare-fun e!176873 () Bool)

(assert (=> b!277000 (=> (not res!140987) (not e!176873))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13785 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277000 (= res!140987 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!140990 () Bool)

(assert (=> start!26688 (=> (not res!140990) (not e!176873))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26688 (= res!140990 (validMask!0 mask!3868))))

(assert (=> start!26688 e!176873))

(declare-fun array_inv!4505 (array!13785) Bool)

(assert (=> start!26688 (array_inv!4505 a!3325)))

(assert (=> start!26688 true))

(declare-fun b!277001 () Bool)

(declare-fun Unit!8703 () Unit!8701)

(assert (=> b!277001 (= e!176875 Unit!8703)))

(declare-fun b!277002 () Bool)

(declare-fun res!140988 () Bool)

(assert (=> b!277002 (=> (not res!140988) (not e!176873))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277002 (= res!140988 (validKeyInArray!0 k!2581))))

(declare-fun b!277003 () Bool)

(declare-fun res!140986 () Bool)

(assert (=> b!277003 (=> (not res!140986) (not e!176874))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!277003 (= res!140986 (= startIndex!26 i!1267))))

(declare-fun b!277004 () Bool)

(declare-fun lt!137806 () Unit!8701)

(assert (=> b!277004 (= e!176875 lt!137806)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13785 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8701)

(assert (=> b!277004 (= lt!137806 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!277004 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13786 (store (arr!6542 a!3325) i!1267 k!2581) (size!6894 a!3325)) mask!3868)))

(declare-fun b!277005 () Bool)

(declare-fun res!140989 () Bool)

(assert (=> b!277005 (=> (not res!140989) (not e!176873))))

(declare-datatypes ((List!4350 0))(
  ( (Nil!4347) (Cons!4346 (h!5013 (_ BitVec 64)) (t!9432 List!4350)) )
))
(declare-fun arrayNoDuplicates!0 (array!13785 (_ BitVec 32) List!4350) Bool)

(assert (=> b!277005 (= res!140989 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4347))))

(declare-fun b!277006 () Bool)

(assert (=> b!277006 (= e!176873 e!176874)))

(declare-fun res!140985 () Bool)

(assert (=> b!277006 (=> (not res!140985) (not e!176874))))

(declare-datatypes ((SeekEntryResult!1700 0))(
  ( (MissingZero!1700 (index!8970 (_ BitVec 32))) (Found!1700 (index!8971 (_ BitVec 32))) (Intermediate!1700 (undefined!2512 Bool) (index!8972 (_ BitVec 32)) (x!27225 (_ BitVec 32))) (Undefined!1700) (MissingVacant!1700 (index!8973 (_ BitVec 32))) )
))
(declare-fun lt!137804 () SeekEntryResult!1700)

(assert (=> b!277006 (= res!140985 (or (= lt!137804 (MissingZero!1700 i!1267)) (= lt!137804 (MissingVacant!1700 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13785 (_ BitVec 32)) SeekEntryResult!1700)

(assert (=> b!277006 (= lt!137804 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!277007 () Bool)

(declare-fun res!140984 () Bool)

(assert (=> b!277007 (=> (not res!140984) (not e!176873))))

(assert (=> b!277007 (= res!140984 (and (= (size!6894 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6894 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6894 a!3325))))))

(assert (= (and start!26688 res!140990) b!277007))

(assert (= (and b!277007 res!140984) b!277002))

(assert (= (and b!277002 res!140988) b!277005))

(assert (= (and b!277005 res!140989) b!277000))

(assert (= (and b!277000 res!140987) b!277006))

(assert (= (and b!277006 res!140985) b!276998))

(assert (= (and b!276998 res!140991) b!277003))

(assert (= (and b!277003 res!140986) b!276999))

(assert (= (and b!276999 c!45558) b!277004))

(assert (= (and b!276999 (not c!45558)) b!277001))

(declare-fun m!292191 () Bool)

(assert (=> b!277000 m!292191))

(declare-fun m!292193 () Bool)

(assert (=> b!276998 m!292193))

(declare-fun m!292195 () Bool)

(assert (=> b!277002 m!292195))

(declare-fun m!292197 () Bool)

(assert (=> b!277005 m!292197))

(declare-fun m!292199 () Bool)

(assert (=> b!277004 m!292199))

(declare-fun m!292201 () Bool)

(assert (=> b!277004 m!292201))

(declare-fun m!292203 () Bool)

(assert (=> b!277004 m!292203))

(declare-fun m!292205 () Bool)

(assert (=> b!277006 m!292205))

(declare-fun m!292207 () Bool)

(assert (=> start!26688 m!292207))

(declare-fun m!292209 () Bool)

(assert (=> start!26688 m!292209))

(push 1)

