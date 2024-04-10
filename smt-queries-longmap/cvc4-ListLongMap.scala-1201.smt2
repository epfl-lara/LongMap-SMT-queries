; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25676 () Bool)

(assert start!25676)

(declare-fun b!266238 () Bool)

(declare-fun e!172320 () Bool)

(declare-fun e!172321 () Bool)

(assert (=> b!266238 (= e!172320 e!172321)))

(declare-fun res!130534 () Bool)

(assert (=> b!266238 (=> (not res!130534) (not e!172321))))

(declare-datatypes ((SeekEntryResult!1273 0))(
  ( (MissingZero!1273 (index!7262 (_ BitVec 32))) (Found!1273 (index!7263 (_ BitVec 32))) (Intermediate!1273 (undefined!2085 Bool) (index!7264 (_ BitVec 32)) (x!25566 (_ BitVec 32))) (Undefined!1273) (MissingVacant!1273 (index!7265 (_ BitVec 32))) )
))
(declare-fun lt!134373 () SeekEntryResult!1273)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266238 (= res!130534 (or (= lt!134373 (MissingZero!1273 i!1355)) (= lt!134373 (MissingVacant!1273 i!1355))))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-datatypes ((array!12855 0))(
  ( (array!12856 (arr!6082 (Array (_ BitVec 32) (_ BitVec 64))) (size!6434 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12855)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12855 (_ BitVec 32)) SeekEntryResult!1273)

(assert (=> b!266238 (= lt!134373 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!266239 () Bool)

(declare-fun res!130536 () Bool)

(assert (=> b!266239 (=> (not res!130536) (not e!172320))))

(assert (=> b!266239 (= res!130536 (and (= (size!6434 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6434 a!3436))))))

(declare-fun b!266240 () Bool)

(declare-fun res!130535 () Bool)

(assert (=> b!266240 (=> (not res!130535) (not e!172320))))

(declare-fun arrayContainsKey!0 (array!12855 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266240 (= res!130535 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266241 () Bool)

(declare-fun res!130539 () Bool)

(assert (=> b!266241 (=> (not res!130539) (not e!172321))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12855 (_ BitVec 32)) Bool)

(assert (=> b!266241 (= res!130539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun res!130538 () Bool)

(assert (=> start!25676 (=> (not res!130538) (not e!172320))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25676 (= res!130538 (validMask!0 mask!4002))))

(assert (=> start!25676 e!172320))

(assert (=> start!25676 true))

(declare-fun array_inv!4045 (array!12855) Bool)

(assert (=> start!25676 (array_inv!4045 a!3436)))

(declare-fun b!266242 () Bool)

(assert (=> b!266242 (= e!172321 false)))

(declare-fun lt!134374 () Bool)

(declare-datatypes ((List!3896 0))(
  ( (Nil!3893) (Cons!3892 (h!4559 (_ BitVec 64)) (t!8978 List!3896)) )
))
(declare-fun arrayNoDuplicates!0 (array!12855 (_ BitVec 32) List!3896) Bool)

(assert (=> b!266242 (= lt!134374 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3893))))

(declare-fun b!266243 () Bool)

(declare-fun res!130537 () Bool)

(assert (=> b!266243 (=> (not res!130537) (not e!172320))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266243 (= res!130537 (validKeyInArray!0 k!2698))))

(assert (= (and start!25676 res!130538) b!266239))

(assert (= (and b!266239 res!130536) b!266243))

(assert (= (and b!266243 res!130537) b!266240))

(assert (= (and b!266240 res!130535) b!266238))

(assert (= (and b!266238 res!130534) b!266241))

(assert (= (and b!266241 res!130539) b!266242))

(declare-fun m!282865 () Bool)

(assert (=> b!266240 m!282865))

(declare-fun m!282867 () Bool)

(assert (=> b!266241 m!282867))

(declare-fun m!282869 () Bool)

(assert (=> b!266243 m!282869))

(declare-fun m!282871 () Bool)

(assert (=> b!266242 m!282871))

(declare-fun m!282873 () Bool)

(assert (=> b!266238 m!282873))

(declare-fun m!282875 () Bool)

(assert (=> start!25676 m!282875))

(declare-fun m!282877 () Bool)

(assert (=> start!25676 m!282877))

(push 1)

(assert (not b!266241))

(assert (not b!266242))

(assert (not b!266243))

(assert (not b!266238))

(assert (not start!25676))

(assert (not b!266240))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

