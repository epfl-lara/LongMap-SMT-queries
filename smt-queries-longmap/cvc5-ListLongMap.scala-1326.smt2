; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26514 () Bool)

(assert start!26514)

(declare-fun b!275226 () Bool)

(declare-fun res!139219 () Bool)

(declare-fun e!176090 () Bool)

(assert (=> b!275226 (=> (not res!139219) (not e!176090))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275226 (= res!139219 (validKeyInArray!0 k!2581))))

(declare-fun b!275227 () Bool)

(declare-fun res!139216 () Bool)

(assert (=> b!275227 (=> (not res!139216) (not e!176090))))

(declare-datatypes ((array!13611 0))(
  ( (array!13612 (arr!6455 (Array (_ BitVec 32) (_ BitVec 64))) (size!6807 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13611)

(declare-datatypes ((List!4263 0))(
  ( (Nil!4260) (Cons!4259 (h!4926 (_ BitVec 64)) (t!9345 List!4263)) )
))
(declare-fun arrayNoDuplicates!0 (array!13611 (_ BitVec 32) List!4263) Bool)

(assert (=> b!275227 (= res!139216 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4260))))

(declare-fun b!275228 () Bool)

(declare-fun e!176089 () Bool)

(assert (=> b!275228 (= e!176090 e!176089)))

(declare-fun res!139218 () Bool)

(assert (=> b!275228 (=> (not res!139218) (not e!176089))))

(declare-datatypes ((SeekEntryResult!1613 0))(
  ( (MissingZero!1613 (index!8622 (_ BitVec 32))) (Found!1613 (index!8623 (_ BitVec 32))) (Intermediate!1613 (undefined!2425 Bool) (index!8624 (_ BitVec 32)) (x!26906 (_ BitVec 32))) (Undefined!1613) (MissingVacant!1613 (index!8625 (_ BitVec 32))) )
))
(declare-fun lt!137317 () SeekEntryResult!1613)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275228 (= res!139218 (or (= lt!137317 (MissingZero!1613 i!1267)) (= lt!137317 (MissingVacant!1613 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13611 (_ BitVec 32)) SeekEntryResult!1613)

(assert (=> b!275228 (= lt!137317 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!275229 () Bool)

(declare-fun res!139217 () Bool)

(assert (=> b!275229 (=> (not res!139217) (not e!176090))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275229 (= res!139217 (and (= (size!6807 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6807 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6807 a!3325))))))

(declare-fun res!139221 () Bool)

(assert (=> start!26514 (=> (not res!139221) (not e!176090))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26514 (= res!139221 (validMask!0 mask!3868))))

(assert (=> start!26514 e!176090))

(declare-fun array_inv!4418 (array!13611) Bool)

(assert (=> start!26514 (array_inv!4418 a!3325)))

(assert (=> start!26514 true))

(declare-fun b!275230 () Bool)

(assert (=> b!275230 (= e!176089 false)))

(declare-fun lt!137316 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13611 (_ BitVec 32)) Bool)

(assert (=> b!275230 (= lt!137316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275231 () Bool)

(declare-fun res!139220 () Bool)

(assert (=> b!275231 (=> (not res!139220) (not e!176090))))

(declare-fun arrayContainsKey!0 (array!13611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275231 (= res!139220 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26514 res!139221) b!275229))

(assert (= (and b!275229 res!139217) b!275226))

(assert (= (and b!275226 res!139219) b!275227))

(assert (= (and b!275227 res!139216) b!275231))

(assert (= (and b!275231 res!139220) b!275228))

(assert (= (and b!275228 res!139218) b!275230))

(declare-fun m!290841 () Bool)

(assert (=> b!275227 m!290841))

(declare-fun m!290843 () Bool)

(assert (=> b!275231 m!290843))

(declare-fun m!290845 () Bool)

(assert (=> b!275228 m!290845))

(declare-fun m!290847 () Bool)

(assert (=> start!26514 m!290847))

(declare-fun m!290849 () Bool)

(assert (=> start!26514 m!290849))

(declare-fun m!290851 () Bool)

(assert (=> b!275230 m!290851))

(declare-fun m!290853 () Bool)

(assert (=> b!275226 m!290853))

(push 1)

