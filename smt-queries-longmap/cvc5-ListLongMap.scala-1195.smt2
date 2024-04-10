; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25636 () Bool)

(assert start!25636)

(declare-fun b!265878 () Bool)

(declare-fun res!130179 () Bool)

(declare-fun e!172142 () Bool)

(assert (=> b!265878 (=> (not res!130179) (not e!172142))))

(declare-datatypes ((array!12815 0))(
  ( (array!12816 (arr!6062 (Array (_ BitVec 32) (_ BitVec 64))) (size!6414 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12815)

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12815 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265878 (= res!130179 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265879 () Bool)

(declare-fun res!130176 () Bool)

(declare-fun e!172140 () Bool)

(assert (=> b!265879 (=> (not res!130176) (not e!172140))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12815 (_ BitVec 32)) Bool)

(assert (=> b!265879 (= res!130176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!265880 () Bool)

(declare-fun res!130175 () Bool)

(assert (=> b!265880 (=> (not res!130175) (not e!172142))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265880 (= res!130175 (validKeyInArray!0 k!2698))))

(declare-fun res!130178 () Bool)

(assert (=> start!25636 (=> (not res!130178) (not e!172142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25636 (= res!130178 (validMask!0 mask!4002))))

(assert (=> start!25636 e!172142))

(assert (=> start!25636 true))

(declare-fun array_inv!4025 (array!12815) Bool)

(assert (=> start!25636 (array_inv!4025 a!3436)))

(declare-fun b!265881 () Bool)

(declare-fun res!130177 () Bool)

(assert (=> b!265881 (=> (not res!130177) (not e!172142))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265881 (= res!130177 (and (= (size!6414 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6414 a!3436))))))

(declare-fun b!265882 () Bool)

(assert (=> b!265882 (= e!172142 e!172140)))

(declare-fun res!130174 () Bool)

(assert (=> b!265882 (=> (not res!130174) (not e!172140))))

(declare-datatypes ((SeekEntryResult!1253 0))(
  ( (MissingZero!1253 (index!7182 (_ BitVec 32))) (Found!1253 (index!7183 (_ BitVec 32))) (Intermediate!1253 (undefined!2065 Bool) (index!7184 (_ BitVec 32)) (x!25498 (_ BitVec 32))) (Undefined!1253) (MissingVacant!1253 (index!7185 (_ BitVec 32))) )
))
(declare-fun lt!134253 () SeekEntryResult!1253)

(assert (=> b!265882 (= res!130174 (or (= lt!134253 (MissingZero!1253 i!1355)) (= lt!134253 (MissingVacant!1253 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12815 (_ BitVec 32)) SeekEntryResult!1253)

(assert (=> b!265882 (= lt!134253 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!265883 () Bool)

(assert (=> b!265883 (= e!172140 false)))

(declare-fun lt!134254 () Bool)

(declare-datatypes ((List!3876 0))(
  ( (Nil!3873) (Cons!3872 (h!4539 (_ BitVec 64)) (t!8958 List!3876)) )
))
(declare-fun arrayNoDuplicates!0 (array!12815 (_ BitVec 32) List!3876) Bool)

(assert (=> b!265883 (= lt!134254 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3873))))

(assert (= (and start!25636 res!130178) b!265881))

(assert (= (and b!265881 res!130177) b!265880))

(assert (= (and b!265880 res!130175) b!265878))

(assert (= (and b!265878 res!130179) b!265882))

(assert (= (and b!265882 res!130174) b!265879))

(assert (= (and b!265879 res!130176) b!265883))

(declare-fun m!282585 () Bool)

(assert (=> start!25636 m!282585))

(declare-fun m!282587 () Bool)

(assert (=> start!25636 m!282587))

(declare-fun m!282589 () Bool)

(assert (=> b!265882 m!282589))

(declare-fun m!282591 () Bool)

(assert (=> b!265880 m!282591))

(declare-fun m!282593 () Bool)

(assert (=> b!265883 m!282593))

(declare-fun m!282595 () Bool)

(assert (=> b!265878 m!282595))

(declare-fun m!282597 () Bool)

(assert (=> b!265879 m!282597))

(push 1)

(assert (not b!265882))

(assert (not start!25636))

(assert (not b!265883))

(assert (not b!265880))

(assert (not b!265879))

(assert (not b!265878))

