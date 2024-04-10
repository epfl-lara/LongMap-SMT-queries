; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26120 () Bool)

(assert start!26120)

(declare-fun b!269549 () Bool)

(declare-fun res!133731 () Bool)

(declare-fun e!173890 () Bool)

(assert (=> b!269549 (=> (not res!133731) (not e!173890))))

(declare-datatypes ((array!13217 0))(
  ( (array!13218 (arr!6258 (Array (_ BitVec 32) (_ BitVec 64))) (size!6610 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13217)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13217 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269549 (= res!133731 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269550 () Bool)

(declare-datatypes ((Unit!8353 0))(
  ( (Unit!8354) )
))
(declare-fun e!173891 () Unit!8353)

(declare-fun Unit!8355 () Unit!8353)

(assert (=> b!269550 (= e!173891 Unit!8355)))

(declare-fun b!269552 () Bool)

(declare-fun res!133730 () Bool)

(declare-fun e!173889 () Bool)

(assert (=> b!269552 (=> (not res!133730) (not e!173889))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!269552 (= res!133730 (= startIndex!26 i!1267))))

(declare-fun b!269553 () Bool)

(declare-fun res!133734 () Bool)

(assert (=> b!269553 (=> (not res!133734) (not e!173890))))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!269553 (= res!133734 (and (= (size!6610 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6610 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6610 a!3325))))))

(declare-fun b!269554 () Bool)

(declare-fun lt!135232 () Unit!8353)

(assert (=> b!269554 (= e!173891 lt!135232)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13217 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8353)

(assert (=> b!269554 (= lt!135232 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13217 (_ BitVec 32)) Bool)

(assert (=> b!269554 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13218 (store (arr!6258 a!3325) i!1267 k0!2581) (size!6610 a!3325)) mask!3868)))

(declare-fun b!269555 () Bool)

(declare-fun res!133733 () Bool)

(assert (=> b!269555 (=> (not res!133733) (not e!173889))))

(assert (=> b!269555 (= res!133733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269556 () Bool)

(assert (=> b!269556 (= e!173889 false)))

(declare-fun lt!135230 () Unit!8353)

(assert (=> b!269556 (= lt!135230 e!173891)))

(declare-fun c!45462 () Bool)

(assert (=> b!269556 (= c!45462 (bvslt startIndex!26 (bvsub (size!6610 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269557 () Bool)

(declare-fun res!133729 () Bool)

(assert (=> b!269557 (=> (not res!133729) (not e!173890))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269557 (= res!133729 (validKeyInArray!0 k0!2581))))

(declare-fun b!269558 () Bool)

(declare-fun res!133728 () Bool)

(assert (=> b!269558 (=> (not res!133728) (not e!173890))))

(declare-datatypes ((List!4066 0))(
  ( (Nil!4063) (Cons!4062 (h!4729 (_ BitVec 64)) (t!9148 List!4066)) )
))
(declare-fun arrayNoDuplicates!0 (array!13217 (_ BitVec 32) List!4066) Bool)

(assert (=> b!269558 (= res!133728 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4063))))

(declare-fun b!269551 () Bool)

(assert (=> b!269551 (= e!173890 e!173889)))

(declare-fun res!133732 () Bool)

(assert (=> b!269551 (=> (not res!133732) (not e!173889))))

(declare-datatypes ((SeekEntryResult!1416 0))(
  ( (MissingZero!1416 (index!7834 (_ BitVec 32))) (Found!1416 (index!7835 (_ BitVec 32))) (Intermediate!1416 (undefined!2228 Bool) (index!7836 (_ BitVec 32)) (x!26181 (_ BitVec 32))) (Undefined!1416) (MissingVacant!1416 (index!7837 (_ BitVec 32))) )
))
(declare-fun lt!135231 () SeekEntryResult!1416)

(assert (=> b!269551 (= res!133732 (or (= lt!135231 (MissingZero!1416 i!1267)) (= lt!135231 (MissingVacant!1416 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13217 (_ BitVec 32)) SeekEntryResult!1416)

(assert (=> b!269551 (= lt!135231 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!133727 () Bool)

(assert (=> start!26120 (=> (not res!133727) (not e!173890))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26120 (= res!133727 (validMask!0 mask!3868))))

(assert (=> start!26120 e!173890))

(declare-fun array_inv!4221 (array!13217) Bool)

(assert (=> start!26120 (array_inv!4221 a!3325)))

(assert (=> start!26120 true))

(assert (= (and start!26120 res!133727) b!269553))

(assert (= (and b!269553 res!133734) b!269557))

(assert (= (and b!269557 res!133729) b!269558))

(assert (= (and b!269558 res!133728) b!269549))

(assert (= (and b!269549 res!133731) b!269551))

(assert (= (and b!269551 res!133732) b!269555))

(assert (= (and b!269555 res!133733) b!269552))

(assert (= (and b!269552 res!133730) b!269556))

(assert (= (and b!269556 c!45462) b!269554))

(assert (= (and b!269556 (not c!45462)) b!269550))

(declare-fun m!285371 () Bool)

(assert (=> b!269557 m!285371))

(declare-fun m!285373 () Bool)

(assert (=> b!269549 m!285373))

(declare-fun m!285375 () Bool)

(assert (=> b!269555 m!285375))

(declare-fun m!285377 () Bool)

(assert (=> start!26120 m!285377))

(declare-fun m!285379 () Bool)

(assert (=> start!26120 m!285379))

(declare-fun m!285381 () Bool)

(assert (=> b!269551 m!285381))

(declare-fun m!285383 () Bool)

(assert (=> b!269554 m!285383))

(declare-fun m!285385 () Bool)

(assert (=> b!269554 m!285385))

(declare-fun m!285387 () Bool)

(assert (=> b!269554 m!285387))

(declare-fun m!285389 () Bool)

(assert (=> b!269558 m!285389))

(check-sat (not b!269554) (not b!269557) (not b!269555) (not b!269558) (not b!269549) (not start!26120) (not b!269551))
(check-sat)
