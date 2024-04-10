; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25930 () Bool)

(assert start!25930)

(declare-fun b!267748 () Bool)

(declare-fun e!173075 () Bool)

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!267748 (= e!173075 (bvslt mask!3868 #b00000000000000000000000000000000))))

(declare-fun b!267749 () Bool)

(declare-fun res!132027 () Bool)

(assert (=> b!267749 (=> (not res!132027) (not e!173075))))

(declare-datatypes ((array!13027 0))(
  ( (array!13028 (arr!6163 (Array (_ BitVec 32) (_ BitVec 64))) (size!6515 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13027)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267749 (= res!132027 (and (= (size!6515 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6515 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6515 a!3325))))))

(declare-fun res!132030 () Bool)

(assert (=> start!25930 (=> (not res!132030) (not e!173075))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25930 (= res!132030 (validMask!0 mask!3868))))

(assert (=> start!25930 e!173075))

(declare-fun array_inv!4126 (array!13027) Bool)

(assert (=> start!25930 (array_inv!4126 a!3325)))

(assert (=> start!25930 true))

(declare-fun b!267750 () Bool)

(declare-fun res!132029 () Bool)

(assert (=> b!267750 (=> (not res!132029) (not e!173075))))

(declare-datatypes ((List!3971 0))(
  ( (Nil!3968) (Cons!3967 (h!4634 (_ BitVec 64)) (t!9053 List!3971)) )
))
(declare-fun arrayNoDuplicates!0 (array!13027 (_ BitVec 32) List!3971) Bool)

(assert (=> b!267750 (= res!132029 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3968))))

(declare-fun b!267751 () Bool)

(declare-fun res!132028 () Bool)

(assert (=> b!267751 (=> (not res!132028) (not e!173075))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13027 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267751 (= res!132028 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!267752 () Bool)

(declare-fun res!132026 () Bool)

(assert (=> b!267752 (=> (not res!132026) (not e!173075))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267752 (= res!132026 (validKeyInArray!0 k!2581))))

(assert (= (and start!25930 res!132030) b!267749))

(assert (= (and b!267749 res!132027) b!267752))

(assert (= (and b!267752 res!132026) b!267750))

(assert (= (and b!267750 res!132029) b!267751))

(assert (= (and b!267751 res!132028) b!267748))

(declare-fun m!284033 () Bool)

(assert (=> start!25930 m!284033))

(declare-fun m!284035 () Bool)

(assert (=> start!25930 m!284035))

(declare-fun m!284037 () Bool)

(assert (=> b!267750 m!284037))

(declare-fun m!284039 () Bool)

(assert (=> b!267751 m!284039))

(declare-fun m!284041 () Bool)

(assert (=> b!267752 m!284041))

(push 1)

(assert (not start!25930))

(assert (not b!267751))

(assert (not b!267752))

(assert (not b!267750))

(check-sat)

(pop 1)

(push 1)

(check-sat)

