; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25980 () Bool)

(assert start!25980)

(declare-fun b!267934 () Bool)

(declare-fun res!132265 () Bool)

(declare-fun e!173117 () Bool)

(assert (=> b!267934 (=> (not res!132265) (not e!173117))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267934 (= res!132265 (validKeyInArray!0 k!2581))))

(declare-fun b!267935 () Bool)

(declare-fun res!132267 () Bool)

(assert (=> b!267935 (=> (not res!132267) (not e!173117))))

(declare-datatypes ((array!13066 0))(
  ( (array!13067 (arr!6182 (Array (_ BitVec 32) (_ BitVec 64))) (size!6535 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13066)

(declare-fun arrayContainsKey!0 (array!13066 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267935 (= res!132267 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!267936 () Bool)

(declare-fun res!132264 () Bool)

(assert (=> b!267936 (=> (not res!132264) (not e!173117))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!267936 (= res!132264 (and (= (size!6535 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6535 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6535 a!3325))))))

(declare-fun b!267937 () Bool)

(declare-fun res!132266 () Bool)

(assert (=> b!267937 (=> (not res!132266) (not e!173117))))

(declare-datatypes ((List!3963 0))(
  ( (Nil!3960) (Cons!3959 (h!4626 (_ BitVec 64)) (t!9036 List!3963)) )
))
(declare-fun arrayNoDuplicates!0 (array!13066 (_ BitVec 32) List!3963) Bool)

(assert (=> b!267937 (= res!132266 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3960))))

(declare-fun b!267938 () Bool)

(assert (=> b!267938 (= e!173117 false)))

(declare-datatypes ((SeekEntryResult!1339 0))(
  ( (MissingZero!1339 (index!7526 (_ BitVec 32))) (Found!1339 (index!7527 (_ BitVec 32))) (Intermediate!1339 (undefined!2151 Bool) (index!7528 (_ BitVec 32)) (x!25911 (_ BitVec 32))) (Undefined!1339) (MissingVacant!1339 (index!7529 (_ BitVec 32))) )
))
(declare-fun lt!134601 () SeekEntryResult!1339)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13066 (_ BitVec 32)) SeekEntryResult!1339)

(assert (=> b!267938 (= lt!134601 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!132268 () Bool)

(assert (=> start!25980 (=> (not res!132268) (not e!173117))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25980 (= res!132268 (validMask!0 mask!3868))))

(assert (=> start!25980 e!173117))

(declare-fun array_inv!4154 (array!13066) Bool)

(assert (=> start!25980 (array_inv!4154 a!3325)))

(assert (=> start!25980 true))

(assert (= (and start!25980 res!132268) b!267936))

(assert (= (and b!267936 res!132264) b!267934))

(assert (= (and b!267934 res!132265) b!267937))

(assert (= (and b!267937 res!132266) b!267935))

(assert (= (and b!267935 res!132267) b!267938))

(declare-fun m!283703 () Bool)

(assert (=> b!267934 m!283703))

(declare-fun m!283705 () Bool)

(assert (=> b!267937 m!283705))

(declare-fun m!283707 () Bool)

(assert (=> b!267938 m!283707))

(declare-fun m!283709 () Bool)

(assert (=> b!267935 m!283709))

(declare-fun m!283711 () Bool)

(assert (=> start!25980 m!283711))

(declare-fun m!283713 () Bool)

(assert (=> start!25980 m!283713))

(push 1)

(assert (not b!267935))

(assert (not b!267938))

(assert (not start!25980))

(assert (not b!267937))

(assert (not b!267934))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

