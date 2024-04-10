; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26056 () Bool)

(assert start!26056)

(declare-fun b!268773 () Bool)

(declare-fun res!133052 () Bool)

(declare-fun e!173552 () Bool)

(assert (=> b!268773 (=> (not res!133052) (not e!173552))))

(declare-datatypes ((array!13153 0))(
  ( (array!13154 (arr!6226 (Array (_ BitVec 32) (_ BitVec 64))) (size!6578 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13153)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13153 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268773 (= res!133052 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268774 () Bool)

(declare-fun e!173550 () Bool)

(assert (=> b!268774 (= e!173550 false)))

(declare-fun lt!134989 () Bool)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13153 (_ BitVec 32)) Bool)

(assert (=> b!268774 (= lt!134989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268775 () Bool)

(declare-fun res!133055 () Bool)

(assert (=> b!268775 (=> (not res!133055) (not e!173552))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268775 (= res!133055 (and (= (size!6578 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6578 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6578 a!3325))))))

(declare-fun b!268776 () Bool)

(declare-fun res!133053 () Bool)

(assert (=> b!268776 (=> (not res!133053) (not e!173552))))

(declare-datatypes ((List!4034 0))(
  ( (Nil!4031) (Cons!4030 (h!4697 (_ BitVec 64)) (t!9116 List!4034)) )
))
(declare-fun arrayNoDuplicates!0 (array!13153 (_ BitVec 32) List!4034) Bool)

(assert (=> b!268776 (= res!133053 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4031))))

(declare-fun res!133054 () Bool)

(assert (=> start!26056 (=> (not res!133054) (not e!173552))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26056 (= res!133054 (validMask!0 mask!3868))))

(assert (=> start!26056 e!173552))

(declare-fun array_inv!4189 (array!13153) Bool)

(assert (=> start!26056 (array_inv!4189 a!3325)))

(assert (=> start!26056 true))

(declare-fun b!268777 () Bool)

(assert (=> b!268777 (= e!173552 e!173550)))

(declare-fun res!133051 () Bool)

(assert (=> b!268777 (=> (not res!133051) (not e!173550))))

(declare-datatypes ((SeekEntryResult!1384 0))(
  ( (MissingZero!1384 (index!7706 (_ BitVec 32))) (Found!1384 (index!7707 (_ BitVec 32))) (Intermediate!1384 (undefined!2196 Bool) (index!7708 (_ BitVec 32)) (x!26061 (_ BitVec 32))) (Undefined!1384) (MissingVacant!1384 (index!7709 (_ BitVec 32))) )
))
(declare-fun lt!134988 () SeekEntryResult!1384)

(assert (=> b!268777 (= res!133051 (or (= lt!134988 (MissingZero!1384 i!1267)) (= lt!134988 (MissingVacant!1384 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13153 (_ BitVec 32)) SeekEntryResult!1384)

(assert (=> b!268777 (= lt!134988 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!268778 () Bool)

(declare-fun res!133056 () Bool)

(assert (=> b!268778 (=> (not res!133056) (not e!173552))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268778 (= res!133056 (validKeyInArray!0 k!2581))))

(assert (= (and start!26056 res!133054) b!268775))

(assert (= (and b!268775 res!133055) b!268778))

(assert (= (and b!268778 res!133056) b!268776))

(assert (= (and b!268776 res!133053) b!268773))

(assert (= (and b!268773 res!133052) b!268777))

(assert (= (and b!268777 res!133051) b!268774))

(declare-fun m!284827 () Bool)

(assert (=> b!268778 m!284827))

(declare-fun m!284829 () Bool)

(assert (=> b!268774 m!284829))

(declare-fun m!284831 () Bool)

(assert (=> b!268777 m!284831))

(declare-fun m!284833 () Bool)

(assert (=> b!268773 m!284833))

(declare-fun m!284835 () Bool)

(assert (=> b!268776 m!284835))

(declare-fun m!284837 () Bool)

(assert (=> start!26056 m!284837))

(declare-fun m!284839 () Bool)

(assert (=> start!26056 m!284839))

(push 1)

(assert (not b!268777))

(assert (not start!26056))

