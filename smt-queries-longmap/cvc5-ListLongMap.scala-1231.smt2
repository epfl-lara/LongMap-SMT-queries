; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25944 () Bool)

(assert start!25944)

(declare-fun b!267817 () Bool)

(declare-fun res!132098 () Bool)

(declare-fun e!173117 () Bool)

(assert (=> b!267817 (=> (not res!132098) (not e!173117))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267817 (= res!132098 (validKeyInArray!0 k!2581))))

(declare-fun b!267818 () Bool)

(declare-fun res!132096 () Bool)

(assert (=> b!267818 (=> (not res!132096) (not e!173117))))

(declare-datatypes ((array!13041 0))(
  ( (array!13042 (arr!6170 (Array (_ BitVec 32) (_ BitVec 64))) (size!6522 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13041)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!267818 (= res!132096 (and (= (size!6522 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6522 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6522 a!3325))))))

(declare-fun b!267819 () Bool)

(declare-fun res!132099 () Bool)

(assert (=> b!267819 (=> (not res!132099) (not e!173117))))

(declare-fun arrayContainsKey!0 (array!13041 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267819 (= res!132099 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!267820 () Bool)

(declare-fun res!132095 () Bool)

(assert (=> b!267820 (=> (not res!132095) (not e!173117))))

(declare-datatypes ((List!3978 0))(
  ( (Nil!3975) (Cons!3974 (h!4641 (_ BitVec 64)) (t!9060 List!3978)) )
))
(declare-fun arrayNoDuplicates!0 (array!13041 (_ BitVec 32) List!3978) Bool)

(assert (=> b!267820 (= res!132095 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3975))))

(declare-fun b!267821 () Bool)

(assert (=> b!267821 (= e!173117 false)))

(declare-datatypes ((SeekEntryResult!1328 0))(
  ( (MissingZero!1328 (index!7482 (_ BitVec 32))) (Found!1328 (index!7483 (_ BitVec 32))) (Intermediate!1328 (undefined!2140 Bool) (index!7484 (_ BitVec 32)) (x!25861 (_ BitVec 32))) (Undefined!1328) (MissingVacant!1328 (index!7485 (_ BitVec 32))) )
))
(declare-fun lt!134740 () SeekEntryResult!1328)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13041 (_ BitVec 32)) SeekEntryResult!1328)

(assert (=> b!267821 (= lt!134740 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!132097 () Bool)

(assert (=> start!25944 (=> (not res!132097) (not e!173117))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25944 (= res!132097 (validMask!0 mask!3868))))

(assert (=> start!25944 e!173117))

(declare-fun array_inv!4133 (array!13041) Bool)

(assert (=> start!25944 (array_inv!4133 a!3325)))

(assert (=> start!25944 true))

(assert (= (and start!25944 res!132097) b!267818))

(assert (= (and b!267818 res!132096) b!267817))

(assert (= (and b!267817 res!132098) b!267820))

(assert (= (and b!267820 res!132095) b!267819))

(assert (= (and b!267819 res!132099) b!267821))

(declare-fun m!284091 () Bool)

(assert (=> start!25944 m!284091))

(declare-fun m!284093 () Bool)

(assert (=> start!25944 m!284093))

(declare-fun m!284095 () Bool)

(assert (=> b!267821 m!284095))

(declare-fun m!284097 () Bool)

(assert (=> b!267817 m!284097))

(declare-fun m!284099 () Bool)

(assert (=> b!267819 m!284099))

(declare-fun m!284101 () Bool)

(assert (=> b!267820 m!284101))

(push 1)

(assert (not b!267821))

(assert (not start!25944))

(assert (not b!267817))

(assert (not b!267820))

(assert (not b!267819))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

