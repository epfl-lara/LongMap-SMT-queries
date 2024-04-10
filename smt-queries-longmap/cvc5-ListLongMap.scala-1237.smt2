; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25980 () Bool)

(assert start!25980)

(declare-fun b!268096 () Bool)

(declare-fun e!173225 () Bool)

(assert (=> b!268096 (= e!173225 false)))

(declare-datatypes ((array!13077 0))(
  ( (array!13078 (arr!6188 (Array (_ BitVec 32) (_ BitVec 64))) (size!6540 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13077)

(declare-fun k!2581 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!1346 0))(
  ( (MissingZero!1346 (index!7554 (_ BitVec 32))) (Found!1346 (index!7555 (_ BitVec 32))) (Intermediate!1346 (undefined!2158 Bool) (index!7556 (_ BitVec 32)) (x!25927 (_ BitVec 32))) (Undefined!1346) (MissingVacant!1346 (index!7557 (_ BitVec 32))) )
))
(declare-fun lt!134785 () SeekEntryResult!1346)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13077 (_ BitVec 32)) SeekEntryResult!1346)

(assert (=> b!268096 (= lt!134785 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!268097 () Bool)

(declare-fun res!132375 () Bool)

(assert (=> b!268097 (=> (not res!132375) (not e!173225))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268097 (= res!132375 (and (= (size!6540 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6540 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6540 a!3325))))))

(declare-fun b!268098 () Bool)

(declare-fun res!132376 () Bool)

(assert (=> b!268098 (=> (not res!132376) (not e!173225))))

(declare-datatypes ((List!3996 0))(
  ( (Nil!3993) (Cons!3992 (h!4659 (_ BitVec 64)) (t!9078 List!3996)) )
))
(declare-fun arrayNoDuplicates!0 (array!13077 (_ BitVec 32) List!3996) Bool)

(assert (=> b!268098 (= res!132376 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3993))))

(declare-fun b!268099 () Bool)

(declare-fun res!132374 () Bool)

(assert (=> b!268099 (=> (not res!132374) (not e!173225))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268099 (= res!132374 (validKeyInArray!0 k!2581))))

(declare-fun b!268100 () Bool)

(declare-fun res!132377 () Bool)

(assert (=> b!268100 (=> (not res!132377) (not e!173225))))

(declare-fun arrayContainsKey!0 (array!13077 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268100 (= res!132377 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!132378 () Bool)

(assert (=> start!25980 (=> (not res!132378) (not e!173225))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25980 (= res!132378 (validMask!0 mask!3868))))

(assert (=> start!25980 e!173225))

(declare-fun array_inv!4151 (array!13077) Bool)

(assert (=> start!25980 (array_inv!4151 a!3325)))

(assert (=> start!25980 true))

(assert (= (and start!25980 res!132378) b!268097))

(assert (= (and b!268097 res!132375) b!268099))

(assert (= (and b!268099 res!132374) b!268098))

(assert (= (and b!268098 res!132376) b!268100))

(assert (= (and b!268100 res!132377) b!268096))

(declare-fun m!284307 () Bool)

(assert (=> b!268100 m!284307))

(declare-fun m!284309 () Bool)

(assert (=> start!25980 m!284309))

(declare-fun m!284311 () Bool)

(assert (=> start!25980 m!284311))

(declare-fun m!284313 () Bool)

(assert (=> b!268096 m!284313))

(declare-fun m!284315 () Bool)

(assert (=> b!268099 m!284315))

(declare-fun m!284317 () Bool)

(assert (=> b!268098 m!284317))

(push 1)

(assert (not b!268096))

(assert (not b!268099))

(assert (not b!268098))

(assert (not start!25980))

(assert (not b!268100))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

