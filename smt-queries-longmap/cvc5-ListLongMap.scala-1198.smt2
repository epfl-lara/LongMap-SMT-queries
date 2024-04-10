; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25654 () Bool)

(assert start!25654)

(declare-fun b!266040 () Bool)

(declare-fun res!130339 () Bool)

(declare-fun e!172221 () Bool)

(assert (=> b!266040 (=> (not res!130339) (not e!172221))))

(declare-datatypes ((array!12833 0))(
  ( (array!12834 (arr!6071 (Array (_ BitVec 32) (_ BitVec 64))) (size!6423 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12833)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266040 (= res!130339 (and (= (size!6423 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6423 a!3436))))))

(declare-fun b!266041 () Bool)

(declare-fun e!172223 () Bool)

(assert (=> b!266041 (= e!172221 e!172223)))

(declare-fun res!130340 () Bool)

(assert (=> b!266041 (=> (not res!130340) (not e!172223))))

(declare-datatypes ((SeekEntryResult!1262 0))(
  ( (MissingZero!1262 (index!7218 (_ BitVec 32))) (Found!1262 (index!7219 (_ BitVec 32))) (Intermediate!1262 (undefined!2074 Bool) (index!7220 (_ BitVec 32)) (x!25531 (_ BitVec 32))) (Undefined!1262) (MissingVacant!1262 (index!7221 (_ BitVec 32))) )
))
(declare-fun lt!134307 () SeekEntryResult!1262)

(assert (=> b!266041 (= res!130340 (or (= lt!134307 (MissingZero!1262 i!1355)) (= lt!134307 (MissingVacant!1262 i!1355))))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12833 (_ BitVec 32)) SeekEntryResult!1262)

(assert (=> b!266041 (= lt!134307 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!266042 () Bool)

(assert (=> b!266042 (= e!172223 false)))

(declare-fun lt!134308 () Bool)

(declare-datatypes ((List!3885 0))(
  ( (Nil!3882) (Cons!3881 (h!4548 (_ BitVec 64)) (t!8967 List!3885)) )
))
(declare-fun arrayNoDuplicates!0 (array!12833 (_ BitVec 32) List!3885) Bool)

(assert (=> b!266042 (= lt!134308 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3882))))

(declare-fun b!266043 () Bool)

(declare-fun res!130337 () Bool)

(assert (=> b!266043 (=> (not res!130337) (not e!172221))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266043 (= res!130337 (validKeyInArray!0 k!2698))))

(declare-fun b!266044 () Bool)

(declare-fun res!130336 () Bool)

(assert (=> b!266044 (=> (not res!130336) (not e!172221))))

(declare-fun arrayContainsKey!0 (array!12833 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266044 (= res!130336 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266045 () Bool)

(declare-fun res!130338 () Bool)

(assert (=> b!266045 (=> (not res!130338) (not e!172223))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12833 (_ BitVec 32)) Bool)

(assert (=> b!266045 (= res!130338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun res!130341 () Bool)

(assert (=> start!25654 (=> (not res!130341) (not e!172221))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25654 (= res!130341 (validMask!0 mask!4002))))

(assert (=> start!25654 e!172221))

(assert (=> start!25654 true))

(declare-fun array_inv!4034 (array!12833) Bool)

(assert (=> start!25654 (array_inv!4034 a!3436)))

(assert (= (and start!25654 res!130341) b!266040))

(assert (= (and b!266040 res!130339) b!266043))

(assert (= (and b!266043 res!130337) b!266044))

(assert (= (and b!266044 res!130336) b!266041))

(assert (= (and b!266041 res!130340) b!266045))

(assert (= (and b!266045 res!130338) b!266042))

(declare-fun m!282711 () Bool)

(assert (=> b!266041 m!282711))

(declare-fun m!282713 () Bool)

(assert (=> b!266042 m!282713))

(declare-fun m!282715 () Bool)

(assert (=> b!266044 m!282715))

(declare-fun m!282717 () Bool)

(assert (=> start!25654 m!282717))

(declare-fun m!282719 () Bool)

(assert (=> start!25654 m!282719))

(declare-fun m!282721 () Bool)

(assert (=> b!266043 m!282721))

(declare-fun m!282723 () Bool)

(assert (=> b!266045 m!282723))

(push 1)

(assert (not b!266041))

(assert (not b!266044))

(assert (not b!266042))

(assert (not start!25654))

(assert (not b!266043))

(assert (not b!266045))

(check-sat)

(pop 1)

