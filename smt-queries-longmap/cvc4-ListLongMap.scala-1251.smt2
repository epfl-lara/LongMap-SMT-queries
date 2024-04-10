; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26068 () Bool)

(assert start!26068)

(declare-fun b!268881 () Bool)

(declare-fun res!133159 () Bool)

(declare-fun e!173606 () Bool)

(assert (=> b!268881 (=> (not res!133159) (not e!173606))))

(declare-datatypes ((array!13165 0))(
  ( (array!13166 (arr!6232 (Array (_ BitVec 32) (_ BitVec 64))) (size!6584 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13165)

(declare-datatypes ((List!4040 0))(
  ( (Nil!4037) (Cons!4036 (h!4703 (_ BitVec 64)) (t!9122 List!4040)) )
))
(declare-fun arrayNoDuplicates!0 (array!13165 (_ BitVec 32) List!4040) Bool)

(assert (=> b!268881 (= res!133159 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4037))))

(declare-fun b!268882 () Bool)

(declare-fun e!173605 () Bool)

(assert (=> b!268882 (= e!173606 e!173605)))

(declare-fun res!133163 () Bool)

(assert (=> b!268882 (=> (not res!133163) (not e!173605))))

(declare-datatypes ((SeekEntryResult!1390 0))(
  ( (MissingZero!1390 (index!7730 (_ BitVec 32))) (Found!1390 (index!7731 (_ BitVec 32))) (Intermediate!1390 (undefined!2202 Bool) (index!7732 (_ BitVec 32)) (x!26083 (_ BitVec 32))) (Undefined!1390) (MissingVacant!1390 (index!7733 (_ BitVec 32))) )
))
(declare-fun lt!135024 () SeekEntryResult!1390)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!268882 (= res!133163 (or (= lt!135024 (MissingZero!1390 i!1267)) (= lt!135024 (MissingVacant!1390 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13165 (_ BitVec 32)) SeekEntryResult!1390)

(assert (=> b!268882 (= lt!135024 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!133161 () Bool)

(assert (=> start!26068 (=> (not res!133161) (not e!173606))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26068 (= res!133161 (validMask!0 mask!3868))))

(assert (=> start!26068 e!173606))

(declare-fun array_inv!4195 (array!13165) Bool)

(assert (=> start!26068 (array_inv!4195 a!3325)))

(assert (=> start!26068 true))

(declare-fun b!268883 () Bool)

(assert (=> b!268883 (= e!173605 false)))

(declare-fun lt!135025 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13165 (_ BitVec 32)) Bool)

(assert (=> b!268883 (= lt!135025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268884 () Bool)

(declare-fun res!133164 () Bool)

(assert (=> b!268884 (=> (not res!133164) (not e!173606))))

(declare-fun arrayContainsKey!0 (array!13165 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268884 (= res!133164 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268885 () Bool)

(declare-fun res!133160 () Bool)

(assert (=> b!268885 (=> (not res!133160) (not e!173606))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268885 (= res!133160 (validKeyInArray!0 k!2581))))

(declare-fun b!268886 () Bool)

(declare-fun res!133162 () Bool)

(assert (=> b!268886 (=> (not res!133162) (not e!173606))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268886 (= res!133162 (and (= (size!6584 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6584 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6584 a!3325))))))

(assert (= (and start!26068 res!133161) b!268886))

(assert (= (and b!268886 res!133162) b!268885))

(assert (= (and b!268885 res!133160) b!268881))

(assert (= (and b!268881 res!133159) b!268884))

(assert (= (and b!268884 res!133164) b!268882))

(assert (= (and b!268882 res!133163) b!268883))

(declare-fun m!284911 () Bool)

(assert (=> start!26068 m!284911))

(declare-fun m!284913 () Bool)

(assert (=> start!26068 m!284913))

(declare-fun m!284915 () Bool)

(assert (=> b!268881 m!284915))

(declare-fun m!284917 () Bool)

(assert (=> b!268884 m!284917))

(declare-fun m!284919 () Bool)

(assert (=> b!268882 m!284919))

(declare-fun m!284921 () Bool)

(assert (=> b!268883 m!284921))

(declare-fun m!284923 () Bool)

(assert (=> b!268885 m!284923))

(push 1)

(assert (not b!268885))

(assert (not b!268882))

(assert (not start!26068))

(assert (not b!268884))

(assert (not b!268883))

(assert (not b!268881))

(check-sat)

(pop 1)

