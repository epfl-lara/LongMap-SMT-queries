; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26494 () Bool)

(assert start!26494)

(declare-fun b!275046 () Bool)

(declare-fun res!139038 () Bool)

(declare-fun e!175999 () Bool)

(assert (=> b!275046 (=> (not res!139038) (not e!175999))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275046 (= res!139038 (validKeyInArray!0 k!2581))))

(declare-fun b!275047 () Bool)

(declare-fun e!175998 () Bool)

(assert (=> b!275047 (= e!175998 false)))

(declare-fun lt!137257 () Bool)

(declare-datatypes ((array!13591 0))(
  ( (array!13592 (arr!6445 (Array (_ BitVec 32) (_ BitVec 64))) (size!6797 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13591)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13591 (_ BitVec 32)) Bool)

(assert (=> b!275047 (= lt!137257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!139041 () Bool)

(assert (=> start!26494 (=> (not res!139041) (not e!175999))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26494 (= res!139041 (validMask!0 mask!3868))))

(assert (=> start!26494 e!175999))

(declare-fun array_inv!4408 (array!13591) Bool)

(assert (=> start!26494 (array_inv!4408 a!3325)))

(assert (=> start!26494 true))

(declare-fun b!275048 () Bool)

(declare-fun res!139039 () Bool)

(assert (=> b!275048 (=> (not res!139039) (not e!175999))))

(declare-datatypes ((List!4253 0))(
  ( (Nil!4250) (Cons!4249 (h!4916 (_ BitVec 64)) (t!9335 List!4253)) )
))
(declare-fun arrayNoDuplicates!0 (array!13591 (_ BitVec 32) List!4253) Bool)

(assert (=> b!275048 (= res!139039 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4250))))

(declare-fun b!275049 () Bool)

(declare-fun res!139036 () Bool)

(assert (=> b!275049 (=> (not res!139036) (not e!175999))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275049 (= res!139036 (and (= (size!6797 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6797 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6797 a!3325))))))

(declare-fun b!275050 () Bool)

(assert (=> b!275050 (= e!175999 e!175998)))

(declare-fun res!139037 () Bool)

(assert (=> b!275050 (=> (not res!139037) (not e!175998))))

(declare-datatypes ((SeekEntryResult!1603 0))(
  ( (MissingZero!1603 (index!8582 (_ BitVec 32))) (Found!1603 (index!8583 (_ BitVec 32))) (Intermediate!1603 (undefined!2415 Bool) (index!8584 (_ BitVec 32)) (x!26864 (_ BitVec 32))) (Undefined!1603) (MissingVacant!1603 (index!8585 (_ BitVec 32))) )
))
(declare-fun lt!137256 () SeekEntryResult!1603)

(assert (=> b!275050 (= res!139037 (or (= lt!137256 (MissingZero!1603 i!1267)) (= lt!137256 (MissingVacant!1603 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13591 (_ BitVec 32)) SeekEntryResult!1603)

(assert (=> b!275050 (= lt!137256 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!275051 () Bool)

(declare-fun res!139040 () Bool)

(assert (=> b!275051 (=> (not res!139040) (not e!175999))))

(declare-fun arrayContainsKey!0 (array!13591 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275051 (= res!139040 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26494 res!139041) b!275049))

(assert (= (and b!275049 res!139036) b!275046))

(assert (= (and b!275046 res!139038) b!275048))

(assert (= (and b!275048 res!139039) b!275051))

(assert (= (and b!275051 res!139040) b!275050))

(assert (= (and b!275050 res!139037) b!275047))

(declare-fun m!290701 () Bool)

(assert (=> b!275050 m!290701))

(declare-fun m!290703 () Bool)

(assert (=> b!275048 m!290703))

(declare-fun m!290705 () Bool)

(assert (=> b!275047 m!290705))

(declare-fun m!290707 () Bool)

(assert (=> b!275046 m!290707))

(declare-fun m!290709 () Bool)

(assert (=> b!275051 m!290709))

(declare-fun m!290711 () Bool)

(assert (=> start!26494 m!290711))

(declare-fun m!290713 () Bool)

(assert (=> start!26494 m!290713))

(push 1)

(assert (not b!275047))

(assert (not b!275048))

(assert (not b!275050))

(assert (not start!26494))

(assert (not b!275046))

(assert (not b!275051))

