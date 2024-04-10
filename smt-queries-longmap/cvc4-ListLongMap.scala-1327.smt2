; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26524 () Bool)

(assert start!26524)

(declare-fun b!275316 () Bool)

(declare-fun res!139309 () Bool)

(declare-fun e!176135 () Bool)

(assert (=> b!275316 (=> (not res!139309) (not e!176135))))

(declare-datatypes ((array!13621 0))(
  ( (array!13622 (arr!6460 (Array (_ BitVec 32) (_ BitVec 64))) (size!6812 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13621)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!275316 (= res!139309 (and (= (size!6812 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6812 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6812 a!3325))))))

(declare-fun b!275317 () Bool)

(declare-fun res!139311 () Bool)

(assert (=> b!275317 (=> (not res!139311) (not e!176135))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275317 (= res!139311 (validKeyInArray!0 k!2581))))

(declare-fun b!275318 () Bool)

(declare-fun res!139308 () Bool)

(assert (=> b!275318 (=> (not res!139308) (not e!176135))))

(declare-fun arrayContainsKey!0 (array!13621 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275318 (= res!139308 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275319 () Bool)

(declare-fun res!139306 () Bool)

(assert (=> b!275319 (=> (not res!139306) (not e!176135))))

(declare-datatypes ((List!4268 0))(
  ( (Nil!4265) (Cons!4264 (h!4931 (_ BitVec 64)) (t!9350 List!4268)) )
))
(declare-fun arrayNoDuplicates!0 (array!13621 (_ BitVec 32) List!4268) Bool)

(assert (=> b!275319 (= res!139306 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4265))))

(declare-fun b!275320 () Bool)

(declare-fun e!176134 () Bool)

(assert (=> b!275320 (= e!176134 false)))

(declare-fun lt!137347 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13621 (_ BitVec 32)) Bool)

(assert (=> b!275320 (= lt!137347 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!139307 () Bool)

(assert (=> start!26524 (=> (not res!139307) (not e!176135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26524 (= res!139307 (validMask!0 mask!3868))))

(assert (=> start!26524 e!176135))

(declare-fun array_inv!4423 (array!13621) Bool)

(assert (=> start!26524 (array_inv!4423 a!3325)))

(assert (=> start!26524 true))

(declare-fun b!275321 () Bool)

(assert (=> b!275321 (= e!176135 e!176134)))

(declare-fun res!139310 () Bool)

(assert (=> b!275321 (=> (not res!139310) (not e!176134))))

(declare-datatypes ((SeekEntryResult!1618 0))(
  ( (MissingZero!1618 (index!8642 (_ BitVec 32))) (Found!1618 (index!8643 (_ BitVec 32))) (Intermediate!1618 (undefined!2430 Bool) (index!8644 (_ BitVec 32)) (x!26919 (_ BitVec 32))) (Undefined!1618) (MissingVacant!1618 (index!8645 (_ BitVec 32))) )
))
(declare-fun lt!137346 () SeekEntryResult!1618)

(assert (=> b!275321 (= res!139310 (or (= lt!137346 (MissingZero!1618 i!1267)) (= lt!137346 (MissingVacant!1618 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13621 (_ BitVec 32)) SeekEntryResult!1618)

(assert (=> b!275321 (= lt!137346 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!26524 res!139307) b!275316))

(assert (= (and b!275316 res!139309) b!275317))

(assert (= (and b!275317 res!139311) b!275319))

(assert (= (and b!275319 res!139306) b!275318))

(assert (= (and b!275318 res!139308) b!275321))

(assert (= (and b!275321 res!139310) b!275320))

(declare-fun m!290911 () Bool)

(assert (=> b!275317 m!290911))

(declare-fun m!290913 () Bool)

(assert (=> b!275318 m!290913))

(declare-fun m!290915 () Bool)

(assert (=> b!275319 m!290915))

(declare-fun m!290917 () Bool)

(assert (=> start!26524 m!290917))

(declare-fun m!290919 () Bool)

(assert (=> start!26524 m!290919))

(declare-fun m!290921 () Bool)

(assert (=> b!275321 m!290921))

(declare-fun m!290923 () Bool)

(assert (=> b!275320 m!290923))

(push 1)

(assert (not b!275317))

(assert (not b!275318))

(assert (not b!275320))

(assert (not b!275321))

(assert (not start!26524))

(assert (not b!275319))

(check-sat)

