; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25658 () Bool)

(assert start!25658)

(declare-fun b!266076 () Bool)

(declare-fun res!130372 () Bool)

(declare-fun e!172239 () Bool)

(assert (=> b!266076 (=> (not res!130372) (not e!172239))))

(declare-datatypes ((array!12837 0))(
  ( (array!12838 (arr!6073 (Array (_ BitVec 32) (_ BitVec 64))) (size!6425 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12837)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266076 (= res!130372 (and (= (size!6425 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6425 a!3436))))))

(declare-fun b!266077 () Bool)

(declare-fun e!172240 () Bool)

(assert (=> b!266077 (= e!172240 false)))

(declare-fun lt!134320 () Bool)

(declare-datatypes ((List!3887 0))(
  ( (Nil!3884) (Cons!3883 (h!4550 (_ BitVec 64)) (t!8969 List!3887)) )
))
(declare-fun arrayNoDuplicates!0 (array!12837 (_ BitVec 32) List!3887) Bool)

(assert (=> b!266077 (= lt!134320 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3884))))

(declare-fun b!266078 () Bool)

(declare-fun res!130375 () Bool)

(assert (=> b!266078 (=> (not res!130375) (not e!172239))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12837 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266078 (= res!130375 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266079 () Bool)

(assert (=> b!266079 (= e!172239 e!172240)))

(declare-fun res!130376 () Bool)

(assert (=> b!266079 (=> (not res!130376) (not e!172240))))

(declare-datatypes ((SeekEntryResult!1264 0))(
  ( (MissingZero!1264 (index!7226 (_ BitVec 32))) (Found!1264 (index!7227 (_ BitVec 32))) (Intermediate!1264 (undefined!2076 Bool) (index!7228 (_ BitVec 32)) (x!25533 (_ BitVec 32))) (Undefined!1264) (MissingVacant!1264 (index!7229 (_ BitVec 32))) )
))
(declare-fun lt!134319 () SeekEntryResult!1264)

(assert (=> b!266079 (= res!130376 (or (= lt!134319 (MissingZero!1264 i!1355)) (= lt!134319 (MissingVacant!1264 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12837 (_ BitVec 32)) SeekEntryResult!1264)

(assert (=> b!266079 (= lt!134319 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!266080 () Bool)

(declare-fun res!130377 () Bool)

(assert (=> b!266080 (=> (not res!130377) (not e!172239))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266080 (= res!130377 (validKeyInArray!0 k!2698))))

(declare-fun b!266081 () Bool)

(declare-fun res!130373 () Bool)

(assert (=> b!266081 (=> (not res!130373) (not e!172240))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12837 (_ BitVec 32)) Bool)

(assert (=> b!266081 (= res!130373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun res!130374 () Bool)

(assert (=> start!25658 (=> (not res!130374) (not e!172239))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25658 (= res!130374 (validMask!0 mask!4002))))

(assert (=> start!25658 e!172239))

(assert (=> start!25658 true))

(declare-fun array_inv!4036 (array!12837) Bool)

(assert (=> start!25658 (array_inv!4036 a!3436)))

(assert (= (and start!25658 res!130374) b!266076))

(assert (= (and b!266076 res!130372) b!266080))

(assert (= (and b!266080 res!130377) b!266078))

(assert (= (and b!266078 res!130375) b!266079))

(assert (= (and b!266079 res!130376) b!266081))

(assert (= (and b!266081 res!130373) b!266077))

(declare-fun m!282739 () Bool)

(assert (=> b!266077 m!282739))

(declare-fun m!282741 () Bool)

(assert (=> start!25658 m!282741))

(declare-fun m!282743 () Bool)

(assert (=> start!25658 m!282743))

(declare-fun m!282745 () Bool)

(assert (=> b!266078 m!282745))

(declare-fun m!282747 () Bool)

(assert (=> b!266081 m!282747))

(declare-fun m!282749 () Bool)

(assert (=> b!266079 m!282749))

(declare-fun m!282751 () Bool)

(assert (=> b!266080 m!282751))

(push 1)

(assert (not start!25658))

(assert (not b!266081))

(assert (not b!266080))

(assert (not b!266077))

(assert (not b!266079))

(assert (not b!266078))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

