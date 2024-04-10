; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25756 () Bool)

(assert start!25756)

(declare-fun b!267039 () Bool)

(declare-fun e!172682 () Bool)

(declare-fun e!172681 () Bool)

(assert (=> b!267039 (= e!172682 e!172681)))

(declare-fun res!131336 () Bool)

(assert (=> b!267039 (=> (not res!131336) (not e!172681))))

(declare-datatypes ((SeekEntryResult!1313 0))(
  ( (MissingZero!1313 (index!7422 (_ BitVec 32))) (Found!1313 (index!7423 (_ BitVec 32))) (Intermediate!1313 (undefined!2125 Bool) (index!7424 (_ BitVec 32)) (x!25718 (_ BitVec 32))) (Undefined!1313) (MissingVacant!1313 (index!7425 (_ BitVec 32))) )
))
(declare-fun lt!134605 () SeekEntryResult!1313)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!267039 (= res!131336 (or (= lt!134605 (MissingZero!1313 i!1355)) (= lt!134605 (MissingVacant!1313 i!1355))))))

(declare-datatypes ((array!12935 0))(
  ( (array!12936 (arr!6122 (Array (_ BitVec 32) (_ BitVec 64))) (size!6474 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12935)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12935 (_ BitVec 32)) SeekEntryResult!1313)

(assert (=> b!267039 (= lt!134605 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!267040 () Bool)

(declare-fun res!131335 () Bool)

(assert (=> b!267040 (=> (not res!131335) (not e!172682))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267040 (= res!131335 (validKeyInArray!0 k!2698))))

(declare-fun b!267041 () Bool)

(assert (=> b!267041 (= e!172681 false)))

(declare-fun lt!134604 () Bool)

(declare-datatypes ((List!3936 0))(
  ( (Nil!3933) (Cons!3932 (h!4599 (_ BitVec 64)) (t!9018 List!3936)) )
))
(declare-fun arrayNoDuplicates!0 (array!12935 (_ BitVec 32) List!3936) Bool)

(assert (=> b!267041 (= lt!134604 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3933))))

(declare-fun b!267042 () Bool)

(declare-fun res!131339 () Bool)

(assert (=> b!267042 (=> (not res!131339) (not e!172682))))

(assert (=> b!267042 (= res!131339 (and (= (size!6474 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6474 a!3436))))))

(declare-fun res!131338 () Bool)

(assert (=> start!25756 (=> (not res!131338) (not e!172682))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25756 (= res!131338 (validMask!0 mask!4002))))

(assert (=> start!25756 e!172682))

(assert (=> start!25756 true))

(declare-fun array_inv!4085 (array!12935) Bool)

(assert (=> start!25756 (array_inv!4085 a!3436)))

(declare-fun b!267043 () Bool)

(declare-fun res!131337 () Bool)

(assert (=> b!267043 (=> (not res!131337) (not e!172682))))

(declare-fun arrayContainsKey!0 (array!12935 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267043 (= res!131337 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!267044 () Bool)

(declare-fun res!131340 () Bool)

(assert (=> b!267044 (=> (not res!131340) (not e!172681))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12935 (_ BitVec 32)) Bool)

(assert (=> b!267044 (= res!131340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(assert (= (and start!25756 res!131338) b!267042))

(assert (= (and b!267042 res!131339) b!267040))

(assert (= (and b!267040 res!131335) b!267043))

(assert (= (and b!267043 res!131337) b!267039))

(assert (= (and b!267039 res!131336) b!267044))

(assert (= (and b!267044 res!131340) b!267041))

(declare-fun m!283497 () Bool)

(assert (=> b!267040 m!283497))

(declare-fun m!283499 () Bool)

(assert (=> start!25756 m!283499))

(declare-fun m!283501 () Bool)

(assert (=> start!25756 m!283501))

(declare-fun m!283503 () Bool)

(assert (=> b!267044 m!283503))

(declare-fun m!283505 () Bool)

(assert (=> b!267043 m!283505))

(declare-fun m!283507 () Bool)

(assert (=> b!267039 m!283507))

(declare-fun m!283509 () Bool)

(assert (=> b!267041 m!283509))

(push 1)

