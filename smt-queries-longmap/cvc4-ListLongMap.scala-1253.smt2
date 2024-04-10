; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26080 () Bool)

(assert start!26080)

(declare-fun b!268989 () Bool)

(declare-fun e!173659 () Bool)

(declare-fun e!173660 () Bool)

(assert (=> b!268989 (= e!173659 e!173660)))

(declare-fun res!133272 () Bool)

(assert (=> b!268989 (=> (not res!133272) (not e!173660))))

(declare-datatypes ((SeekEntryResult!1396 0))(
  ( (MissingZero!1396 (index!7754 (_ BitVec 32))) (Found!1396 (index!7755 (_ BitVec 32))) (Intermediate!1396 (undefined!2208 Bool) (index!7756 (_ BitVec 32)) (x!26105 (_ BitVec 32))) (Undefined!1396) (MissingVacant!1396 (index!7757 (_ BitVec 32))) )
))
(declare-fun lt!135060 () SeekEntryResult!1396)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!268989 (= res!133272 (or (= lt!135060 (MissingZero!1396 i!1267)) (= lt!135060 (MissingVacant!1396 i!1267))))))

(declare-datatypes ((array!13177 0))(
  ( (array!13178 (arr!6238 (Array (_ BitVec 32) (_ BitVec 64))) (size!6590 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13177)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13177 (_ BitVec 32)) SeekEntryResult!1396)

(assert (=> b!268989 (= lt!135060 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!268990 () Bool)

(assert (=> b!268990 (= e!173660 false)))

(declare-fun lt!135061 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13177 (_ BitVec 32)) Bool)

(assert (=> b!268990 (= lt!135061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268991 () Bool)

(declare-fun res!133270 () Bool)

(assert (=> b!268991 (=> (not res!133270) (not e!173659))))

(declare-fun arrayContainsKey!0 (array!13177 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268991 (= res!133270 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268992 () Bool)

(declare-fun res!133267 () Bool)

(assert (=> b!268992 (=> (not res!133267) (not e!173659))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268992 (= res!133267 (and (= (size!6590 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6590 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6590 a!3325))))))

(declare-fun b!268993 () Bool)

(declare-fun res!133271 () Bool)

(assert (=> b!268993 (=> (not res!133271) (not e!173659))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268993 (= res!133271 (validKeyInArray!0 k!2581))))

(declare-fun b!268994 () Bool)

(declare-fun res!133269 () Bool)

(assert (=> b!268994 (=> (not res!133269) (not e!173659))))

(declare-datatypes ((List!4046 0))(
  ( (Nil!4043) (Cons!4042 (h!4709 (_ BitVec 64)) (t!9128 List!4046)) )
))
(declare-fun arrayNoDuplicates!0 (array!13177 (_ BitVec 32) List!4046) Bool)

(assert (=> b!268994 (= res!133269 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4043))))

(declare-fun res!133268 () Bool)

(assert (=> start!26080 (=> (not res!133268) (not e!173659))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26080 (= res!133268 (validMask!0 mask!3868))))

(assert (=> start!26080 e!173659))

(declare-fun array_inv!4201 (array!13177) Bool)

(assert (=> start!26080 (array_inv!4201 a!3325)))

(assert (=> start!26080 true))

(assert (= (and start!26080 res!133268) b!268992))

(assert (= (and b!268992 res!133267) b!268993))

(assert (= (and b!268993 res!133271) b!268994))

(assert (= (and b!268994 res!133269) b!268991))

(assert (= (and b!268991 res!133270) b!268989))

(assert (= (and b!268989 res!133272) b!268990))

(declare-fun m!284995 () Bool)

(assert (=> b!268989 m!284995))

(declare-fun m!284997 () Bool)

(assert (=> b!268994 m!284997))

(declare-fun m!284999 () Bool)

(assert (=> b!268991 m!284999))

(declare-fun m!285001 () Bool)

(assert (=> b!268993 m!285001))

(declare-fun m!285003 () Bool)

(assert (=> start!26080 m!285003))

(declare-fun m!285005 () Bool)

(assert (=> start!26080 m!285005))

(declare-fun m!285007 () Bool)

(assert (=> b!268990 m!285007))

(push 1)

(assert (not start!26080))

(assert (not b!268993))

(assert (not b!268989))

(assert (not b!268991))

(assert (not b!268994))

(assert (not b!268990))

(check-sat)

