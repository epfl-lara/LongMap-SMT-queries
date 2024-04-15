; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26532 () Bool)

(assert start!26532)

(declare-fun b!275223 () Bool)

(declare-fun res!139268 () Bool)

(declare-fun e!176059 () Bool)

(assert (=> b!275223 (=> (not res!139268) (not e!176059))))

(declare-datatypes ((array!13618 0))(
  ( (array!13619 (arr!6458 (Array (_ BitVec 32) (_ BitVec 64))) (size!6811 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13618)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!275223 (= res!139268 (and (= (size!6811 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6811 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6811 a!3325))))))

(declare-fun b!275224 () Bool)

(declare-fun res!139266 () Bool)

(assert (=> b!275224 (=> (not res!139266) (not e!176059))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275224 (= res!139266 (validKeyInArray!0 k!2581))))

(declare-fun b!275225 () Bool)

(declare-fun res!139265 () Bool)

(assert (=> b!275225 (=> (not res!139265) (not e!176059))))

(declare-fun arrayContainsKey!0 (array!13618 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275225 (= res!139265 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275226 () Bool)

(declare-fun e!176061 () Bool)

(assert (=> b!275226 (= e!176059 e!176061)))

(declare-fun res!139267 () Bool)

(assert (=> b!275226 (=> (not res!139267) (not e!176061))))

(declare-datatypes ((SeekEntryResult!1615 0))(
  ( (MissingZero!1615 (index!8630 (_ BitVec 32))) (Found!1615 (index!8631 (_ BitVec 32))) (Intermediate!1615 (undefined!2427 Bool) (index!8632 (_ BitVec 32)) (x!26923 (_ BitVec 32))) (Undefined!1615) (MissingVacant!1615 (index!8633 (_ BitVec 32))) )
))
(declare-fun lt!137184 () SeekEntryResult!1615)

(assert (=> b!275226 (= res!139267 (or (= lt!137184 (MissingZero!1615 i!1267)) (= lt!137184 (MissingVacant!1615 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13618 (_ BitVec 32)) SeekEntryResult!1615)

(assert (=> b!275226 (= lt!137184 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!275227 () Bool)

(declare-fun res!139269 () Bool)

(assert (=> b!275227 (=> (not res!139269) (not e!176059))))

(declare-datatypes ((List!4239 0))(
  ( (Nil!4236) (Cons!4235 (h!4902 (_ BitVec 64)) (t!9312 List!4239)) )
))
(declare-fun arrayNoDuplicates!0 (array!13618 (_ BitVec 32) List!4239) Bool)

(assert (=> b!275227 (= res!139269 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4236))))

(declare-fun b!275228 () Bool)

(assert (=> b!275228 (= e!176061 false)))

(declare-fun lt!137183 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13618 (_ BitVec 32)) Bool)

(assert (=> b!275228 (= lt!137183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!139270 () Bool)

(assert (=> start!26532 (=> (not res!139270) (not e!176059))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26532 (= res!139270 (validMask!0 mask!3868))))

(assert (=> start!26532 e!176059))

(declare-fun array_inv!4430 (array!13618) Bool)

(assert (=> start!26532 (array_inv!4430 a!3325)))

(assert (=> start!26532 true))

(assert (= (and start!26532 res!139270) b!275223))

(assert (= (and b!275223 res!139268) b!275224))

(assert (= (and b!275224 res!139266) b!275227))

(assert (= (and b!275227 res!139269) b!275225))

(assert (= (and b!275225 res!139265) b!275226))

(assert (= (and b!275226 res!139267) b!275228))

(declare-fun m!290361 () Bool)

(assert (=> b!275228 m!290361))

(declare-fun m!290363 () Bool)

(assert (=> b!275226 m!290363))

(declare-fun m!290365 () Bool)

(assert (=> b!275225 m!290365))

(declare-fun m!290367 () Bool)

(assert (=> b!275227 m!290367))

(declare-fun m!290369 () Bool)

(assert (=> b!275224 m!290369))

(declare-fun m!290371 () Bool)

(assert (=> start!26532 m!290371))

(declare-fun m!290373 () Bool)

(assert (=> start!26532 m!290373))

(push 1)

(assert (not b!275226))

(assert (not b!275224))

(assert (not b!275227))

(assert (not b!275228))

(assert (not b!275225))

(assert (not start!26532))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

