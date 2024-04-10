; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25702 () Bool)

(assert start!25702)

(declare-fun b!266544 () Bool)

(declare-fun e!172437 () Bool)

(assert (=> b!266544 (= e!172437 false)))

(declare-fun lt!134452 () Bool)

(declare-datatypes ((array!12881 0))(
  ( (array!12882 (arr!6095 (Array (_ BitVec 32) (_ BitVec 64))) (size!6447 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12881)

(declare-datatypes ((List!3909 0))(
  ( (Nil!3906) (Cons!3905 (h!4572 (_ BitVec 64)) (t!8991 List!3909)) )
))
(declare-fun arrayNoDuplicates!0 (array!12881 (_ BitVec 32) List!3909) Bool)

(assert (=> b!266544 (= lt!134452 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3906))))

(declare-fun b!266545 () Bool)

(declare-fun res!130843 () Bool)

(assert (=> b!266545 (=> (not res!130843) (not e!172437))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12881 (_ BitVec 32)) Bool)

(assert (=> b!266545 (= res!130843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266546 () Bool)

(declare-fun e!172438 () Bool)

(assert (=> b!266546 (= e!172438 e!172437)))

(declare-fun res!130842 () Bool)

(assert (=> b!266546 (=> (not res!130842) (not e!172437))))

(declare-datatypes ((SeekEntryResult!1286 0))(
  ( (MissingZero!1286 (index!7314 (_ BitVec 32))) (Found!1286 (index!7315 (_ BitVec 32))) (Intermediate!1286 (undefined!2098 Bool) (index!7316 (_ BitVec 32)) (x!25619 (_ BitVec 32))) (Undefined!1286) (MissingVacant!1286 (index!7317 (_ BitVec 32))) )
))
(declare-fun lt!134451 () SeekEntryResult!1286)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266546 (= res!130842 (or (= lt!134451 (MissingZero!1286 i!1355)) (= lt!134451 (MissingVacant!1286 i!1355))))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12881 (_ BitVec 32)) SeekEntryResult!1286)

(assert (=> b!266546 (= lt!134451 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!266547 () Bool)

(declare-fun res!130845 () Bool)

(assert (=> b!266547 (=> (not res!130845) (not e!172438))))

(declare-fun arrayContainsKey!0 (array!12881 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266547 (= res!130845 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266548 () Bool)

(declare-fun res!130840 () Bool)

(assert (=> b!266548 (=> (not res!130840) (not e!172438))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266548 (= res!130840 (validKeyInArray!0 k!2698))))

(declare-fun b!266549 () Bool)

(declare-fun res!130841 () Bool)

(assert (=> b!266549 (=> (not res!130841) (not e!172438))))

(assert (=> b!266549 (= res!130841 (and (= (size!6447 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6447 a!3436))))))

(declare-fun res!130844 () Bool)

(assert (=> start!25702 (=> (not res!130844) (not e!172438))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25702 (= res!130844 (validMask!0 mask!4002))))

(assert (=> start!25702 e!172438))

(assert (=> start!25702 true))

(declare-fun array_inv!4058 (array!12881) Bool)

(assert (=> start!25702 (array_inv!4058 a!3436)))

(assert (= (and start!25702 res!130844) b!266549))

(assert (= (and b!266549 res!130841) b!266548))

(assert (= (and b!266548 res!130840) b!266547))

(assert (= (and b!266547 res!130845) b!266546))

(assert (= (and b!266546 res!130842) b!266545))

(assert (= (and b!266545 res!130843) b!266544))

(declare-fun m!283119 () Bool)

(assert (=> start!25702 m!283119))

(declare-fun m!283121 () Bool)

(assert (=> start!25702 m!283121))

(declare-fun m!283123 () Bool)

(assert (=> b!266546 m!283123))

(declare-fun m!283125 () Bool)

(assert (=> b!266545 m!283125))

(declare-fun m!283127 () Bool)

(assert (=> b!266544 m!283127))

(declare-fun m!283129 () Bool)

(assert (=> b!266548 m!283129))

(declare-fun m!283131 () Bool)

(assert (=> b!266547 m!283131))

(push 1)

