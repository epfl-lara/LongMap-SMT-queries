; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25672 () Bool)

(assert start!25672)

(declare-fun b!266202 () Bool)

(declare-fun e!172302 () Bool)

(assert (=> b!266202 (= e!172302 false)))

(declare-fun lt!134362 () Bool)

(declare-datatypes ((array!12851 0))(
  ( (array!12852 (arr!6080 (Array (_ BitVec 32) (_ BitVec 64))) (size!6432 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12851)

(declare-datatypes ((List!3894 0))(
  ( (Nil!3891) (Cons!3890 (h!4557 (_ BitVec 64)) (t!8976 List!3894)) )
))
(declare-fun arrayNoDuplicates!0 (array!12851 (_ BitVec 32) List!3894) Bool)

(assert (=> b!266202 (= lt!134362 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3891))))

(declare-fun b!266203 () Bool)

(declare-fun res!130498 () Bool)

(assert (=> b!266203 (=> (not res!130498) (not e!172302))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12851 (_ BitVec 32)) Bool)

(assert (=> b!266203 (= res!130498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266204 () Bool)

(declare-fun res!130501 () Bool)

(declare-fun e!172303 () Bool)

(assert (=> b!266204 (=> (not res!130501) (not e!172303))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266204 (= res!130501 (and (= (size!6432 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6432 a!3436))))))

(declare-fun b!266205 () Bool)

(declare-fun res!130500 () Bool)

(assert (=> b!266205 (=> (not res!130500) (not e!172303))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266205 (= res!130500 (validKeyInArray!0 k!2698))))

(declare-fun b!266206 () Bool)

(assert (=> b!266206 (= e!172303 e!172302)))

(declare-fun res!130502 () Bool)

(assert (=> b!266206 (=> (not res!130502) (not e!172302))))

(declare-datatypes ((SeekEntryResult!1271 0))(
  ( (MissingZero!1271 (index!7254 (_ BitVec 32))) (Found!1271 (index!7255 (_ BitVec 32))) (Intermediate!1271 (undefined!2083 Bool) (index!7256 (_ BitVec 32)) (x!25564 (_ BitVec 32))) (Undefined!1271) (MissingVacant!1271 (index!7257 (_ BitVec 32))) )
))
(declare-fun lt!134361 () SeekEntryResult!1271)

(assert (=> b!266206 (= res!130502 (or (= lt!134361 (MissingZero!1271 i!1355)) (= lt!134361 (MissingVacant!1271 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12851 (_ BitVec 32)) SeekEntryResult!1271)

(assert (=> b!266206 (= lt!134361 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!266207 () Bool)

(declare-fun res!130499 () Bool)

(assert (=> b!266207 (=> (not res!130499) (not e!172303))))

(declare-fun arrayContainsKey!0 (array!12851 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266207 (= res!130499 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun res!130503 () Bool)

(assert (=> start!25672 (=> (not res!130503) (not e!172303))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25672 (= res!130503 (validMask!0 mask!4002))))

(assert (=> start!25672 e!172303))

(assert (=> start!25672 true))

(declare-fun array_inv!4043 (array!12851) Bool)

(assert (=> start!25672 (array_inv!4043 a!3436)))

(assert (= (and start!25672 res!130503) b!266204))

(assert (= (and b!266204 res!130501) b!266205))

(assert (= (and b!266205 res!130500) b!266207))

(assert (= (and b!266207 res!130499) b!266206))

(assert (= (and b!266206 res!130502) b!266203))

(assert (= (and b!266203 res!130498) b!266202))

(declare-fun m!282837 () Bool)

(assert (=> b!266203 m!282837))

(declare-fun m!282839 () Bool)

(assert (=> b!266207 m!282839))

(declare-fun m!282841 () Bool)

(assert (=> b!266202 m!282841))

(declare-fun m!282843 () Bool)

(assert (=> start!25672 m!282843))

(declare-fun m!282845 () Bool)

(assert (=> start!25672 m!282845))

(declare-fun m!282847 () Bool)

(assert (=> b!266205 m!282847))

(declare-fun m!282849 () Bool)

(assert (=> b!266206 m!282849))

(push 1)

(assert (not b!266206))

(assert (not start!25672))

(assert (not b!266202))

(assert (not b!266205))

(assert (not b!266207))

(assert (not b!266203))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

