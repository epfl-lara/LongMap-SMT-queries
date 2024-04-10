; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26112 () Bool)

(assert start!26112)

(declare-fun b!269430 () Bool)

(declare-fun res!133636 () Bool)

(declare-fun e!173840 () Bool)

(assert (=> b!269430 (=> (not res!133636) (not e!173840))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269430 (= res!133636 (validKeyInArray!0 k!2581))))

(declare-fun b!269431 () Bool)

(declare-datatypes ((Unit!8341 0))(
  ( (Unit!8342) )
))
(declare-fun e!173842 () Unit!8341)

(declare-fun lt!135195 () Unit!8341)

(assert (=> b!269431 (= e!173842 lt!135195)))

(declare-datatypes ((array!13209 0))(
  ( (array!13210 (arr!6254 (Array (_ BitVec 32) (_ BitVec 64))) (size!6606 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13209)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13209 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8341)

(assert (=> b!269431 (= lt!135195 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13209 (_ BitVec 32)) Bool)

(assert (=> b!269431 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13210 (store (arr!6254 a!3325) i!1267 k!2581) (size!6606 a!3325)) mask!3868)))

(declare-fun b!269432 () Bool)

(declare-fun e!173841 () Bool)

(assert (=> b!269432 (= e!173841 false)))

(declare-fun lt!135196 () Unit!8341)

(assert (=> b!269432 (= lt!135196 e!173842)))

(declare-fun c!45450 () Bool)

(assert (=> b!269432 (= c!45450 (bvslt startIndex!26 (bvsub (size!6606 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269433 () Bool)

(declare-fun res!133635 () Bool)

(assert (=> b!269433 (=> (not res!133635) (not e!173840))))

(assert (=> b!269433 (= res!133635 (and (= (size!6606 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6606 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6606 a!3325))))))

(declare-fun b!269434 () Bool)

(declare-fun res!133631 () Bool)

(assert (=> b!269434 (=> (not res!133631) (not e!173841))))

(assert (=> b!269434 (= res!133631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269435 () Bool)

(declare-fun Unit!8343 () Unit!8341)

(assert (=> b!269435 (= e!173842 Unit!8343)))

(declare-fun b!269436 () Bool)

(declare-fun res!133633 () Bool)

(assert (=> b!269436 (=> (not res!133633) (not e!173840))))

(declare-datatypes ((List!4062 0))(
  ( (Nil!4059) (Cons!4058 (h!4725 (_ BitVec 64)) (t!9144 List!4062)) )
))
(declare-fun arrayNoDuplicates!0 (array!13209 (_ BitVec 32) List!4062) Bool)

(assert (=> b!269436 (= res!133633 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4059))))

(declare-fun b!269429 () Bool)

(declare-fun res!133637 () Bool)

(assert (=> b!269429 (=> (not res!133637) (not e!173841))))

(assert (=> b!269429 (= res!133637 (= startIndex!26 i!1267))))

(declare-fun res!133634 () Bool)

(assert (=> start!26112 (=> (not res!133634) (not e!173840))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26112 (= res!133634 (validMask!0 mask!3868))))

(assert (=> start!26112 e!173840))

(declare-fun array_inv!4217 (array!13209) Bool)

(assert (=> start!26112 (array_inv!4217 a!3325)))

(assert (=> start!26112 true))

(declare-fun b!269437 () Bool)

(declare-fun res!133638 () Bool)

(assert (=> b!269437 (=> (not res!133638) (not e!173840))))

(declare-fun arrayContainsKey!0 (array!13209 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269437 (= res!133638 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269438 () Bool)

(assert (=> b!269438 (= e!173840 e!173841)))

(declare-fun res!133632 () Bool)

(assert (=> b!269438 (=> (not res!133632) (not e!173841))))

(declare-datatypes ((SeekEntryResult!1412 0))(
  ( (MissingZero!1412 (index!7818 (_ BitVec 32))) (Found!1412 (index!7819 (_ BitVec 32))) (Intermediate!1412 (undefined!2224 Bool) (index!7820 (_ BitVec 32)) (x!26169 (_ BitVec 32))) (Undefined!1412) (MissingVacant!1412 (index!7821 (_ BitVec 32))) )
))
(declare-fun lt!135194 () SeekEntryResult!1412)

(assert (=> b!269438 (= res!133632 (or (= lt!135194 (MissingZero!1412 i!1267)) (= lt!135194 (MissingVacant!1412 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13209 (_ BitVec 32)) SeekEntryResult!1412)

(assert (=> b!269438 (= lt!135194 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!26112 res!133634) b!269433))

(assert (= (and b!269433 res!133635) b!269430))

(assert (= (and b!269430 res!133636) b!269436))

(assert (= (and b!269436 res!133633) b!269437))

(assert (= (and b!269437 res!133638) b!269438))

(assert (= (and b!269438 res!133632) b!269434))

(assert (= (and b!269434 res!133631) b!269429))

(assert (= (and b!269429 res!133637) b!269432))

(assert (= (and b!269432 c!45450) b!269431))

(assert (= (and b!269432 (not c!45450)) b!269435))

(declare-fun m!285291 () Bool)

(assert (=> start!26112 m!285291))

(declare-fun m!285293 () Bool)

(assert (=> start!26112 m!285293))

(declare-fun m!285295 () Bool)

(assert (=> b!269434 m!285295))

(declare-fun m!285297 () Bool)

(assert (=> b!269438 m!285297))

(declare-fun m!285299 () Bool)

(assert (=> b!269437 m!285299))

(declare-fun m!285301 () Bool)

(assert (=> b!269430 m!285301))

(declare-fun m!285303 () Bool)

(assert (=> b!269436 m!285303))

(declare-fun m!285305 () Bool)

(assert (=> b!269431 m!285305))

(declare-fun m!285307 () Bool)

(assert (=> b!269431 m!285307))

(declare-fun m!285309 () Bool)

(assert (=> b!269431 m!285309))

(push 1)

