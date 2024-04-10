; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25700 () Bool)

(assert start!25700)

(declare-fun b!266524 () Bool)

(declare-fun e!172430 () Bool)

(declare-datatypes ((array!12879 0))(
  ( (array!12880 (arr!6094 (Array (_ BitVec 32) (_ BitVec 64))) (size!6446 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12879)

(assert (=> b!266524 (= e!172430 (not (bvsle #b00000000000000000000000000000000 (size!6446 a!3436))))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12879 (_ BitVec 32)) Bool)

(assert (=> b!266524 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12880 (store (arr!6094 a!3436) i!1355 k!2698) (size!6446 a!3436)) mask!4002)))

(declare-datatypes ((Unit!8291 0))(
  ( (Unit!8292) )
))
(declare-fun lt!134445 () Unit!8291)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!12879 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8291)

(assert (=> b!266524 (= lt!134445 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3436 i!1355 k!2698 #b00000000000000000000000000000000 mask!4002))))

(declare-fun b!266525 () Bool)

(declare-fun res!130827 () Bool)

(declare-fun e!172428 () Bool)

(assert (=> b!266525 (=> (not res!130827) (not e!172428))))

(declare-fun arrayContainsKey!0 (array!12879 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266525 (= res!130827 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266527 () Bool)

(declare-fun res!130824 () Bool)

(assert (=> b!266527 (=> (not res!130824) (not e!172428))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266527 (= res!130824 (validKeyInArray!0 k!2698))))

(declare-fun b!266528 () Bool)

(declare-fun res!130823 () Bool)

(assert (=> b!266528 (=> (not res!130823) (not e!172428))))

(assert (=> b!266528 (= res!130823 (and (= (size!6446 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6446 a!3436))))))

(declare-fun b!266529 () Bool)

(declare-fun res!130820 () Bool)

(assert (=> b!266529 (=> (not res!130820) (not e!172430))))

(assert (=> b!266529 (= res!130820 (bvslt #b00000000000000000000000000000000 (size!6446 a!3436)))))

(declare-fun b!266526 () Bool)

(assert (=> b!266526 (= e!172428 e!172430)))

(declare-fun res!130825 () Bool)

(assert (=> b!266526 (=> (not res!130825) (not e!172430))))

(declare-datatypes ((SeekEntryResult!1285 0))(
  ( (MissingZero!1285 (index!7310 (_ BitVec 32))) (Found!1285 (index!7311 (_ BitVec 32))) (Intermediate!1285 (undefined!2097 Bool) (index!7312 (_ BitVec 32)) (x!25610 (_ BitVec 32))) (Undefined!1285) (MissingVacant!1285 (index!7313 (_ BitVec 32))) )
))
(declare-fun lt!134446 () SeekEntryResult!1285)

(assert (=> b!266526 (= res!130825 (or (= lt!134446 (MissingZero!1285 i!1355)) (= lt!134446 (MissingVacant!1285 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12879 (_ BitVec 32)) SeekEntryResult!1285)

(assert (=> b!266526 (= lt!134446 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun res!130821 () Bool)

(assert (=> start!25700 (=> (not res!130821) (not e!172428))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25700 (= res!130821 (validMask!0 mask!4002))))

(assert (=> start!25700 e!172428))

(assert (=> start!25700 true))

(declare-fun array_inv!4057 (array!12879) Bool)

(assert (=> start!25700 (array_inv!4057 a!3436)))

(declare-fun b!266530 () Bool)

(declare-fun res!130826 () Bool)

(assert (=> b!266530 (=> (not res!130826) (not e!172430))))

(declare-datatypes ((List!3908 0))(
  ( (Nil!3905) (Cons!3904 (h!4571 (_ BitVec 64)) (t!8990 List!3908)) )
))
(declare-fun arrayNoDuplicates!0 (array!12879 (_ BitVec 32) List!3908) Bool)

(assert (=> b!266530 (= res!130826 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3905))))

(declare-fun b!266531 () Bool)

(declare-fun res!130822 () Bool)

(assert (=> b!266531 (=> (not res!130822) (not e!172430))))

(assert (=> b!266531 (= res!130822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(assert (= (and start!25700 res!130821) b!266528))

(assert (= (and b!266528 res!130823) b!266527))

(assert (= (and b!266527 res!130824) b!266525))

(assert (= (and b!266525 res!130827) b!266526))

(assert (= (and b!266526 res!130825) b!266531))

(assert (= (and b!266531 res!130822) b!266530))

(assert (= (and b!266530 res!130826) b!266529))

(assert (= (and b!266529 res!130820) b!266524))

(declare-fun m!283099 () Bool)

(assert (=> start!25700 m!283099))

(declare-fun m!283101 () Bool)

(assert (=> start!25700 m!283101))

(declare-fun m!283103 () Bool)

(assert (=> b!266525 m!283103))

(declare-fun m!283105 () Bool)

(assert (=> b!266531 m!283105))

(declare-fun m!283107 () Bool)

(assert (=> b!266530 m!283107))

(declare-fun m!283109 () Bool)

(assert (=> b!266526 m!283109))

(declare-fun m!283111 () Bool)

(assert (=> b!266524 m!283111))

(declare-fun m!283113 () Bool)

(assert (=> b!266524 m!283113))

(declare-fun m!283115 () Bool)

(assert (=> b!266524 m!283115))

(declare-fun m!283117 () Bool)

(assert (=> b!266527 m!283117))

(push 1)

(assert (not b!266526))

(assert (not b!266531))

(assert (not b!266530))

(assert (not b!266524))

(assert (not b!266525))

(assert (not b!266527))

(assert (not start!25700))

(check-sat)

(pop 1)

(push 1)

(check-sat)

