; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25618 () Bool)

(assert start!25618)

(declare-fun b!265716 () Bool)

(declare-fun e!172059 () Bool)

(declare-fun e!172061 () Bool)

(assert (=> b!265716 (= e!172059 e!172061)))

(declare-fun res!130016 () Bool)

(assert (=> b!265716 (=> (not res!130016) (not e!172061))))

(declare-datatypes ((SeekEntryResult!1244 0))(
  ( (MissingZero!1244 (index!7146 (_ BitVec 32))) (Found!1244 (index!7147 (_ BitVec 32))) (Intermediate!1244 (undefined!2056 Bool) (index!7148 (_ BitVec 32)) (x!25465 (_ BitVec 32))) (Undefined!1244) (MissingVacant!1244 (index!7149 (_ BitVec 32))) )
))
(declare-fun lt!134200 () SeekEntryResult!1244)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265716 (= res!130016 (or (= lt!134200 (MissingZero!1244 i!1355)) (= lt!134200 (MissingVacant!1244 i!1355))))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-datatypes ((array!12797 0))(
  ( (array!12798 (arr!6053 (Array (_ BitVec 32) (_ BitVec 64))) (size!6405 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12797)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12797 (_ BitVec 32)) SeekEntryResult!1244)

(assert (=> b!265716 (= lt!134200 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!265717 () Bool)

(declare-fun res!130012 () Bool)

(assert (=> b!265717 (=> (not res!130012) (not e!172059))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265717 (= res!130012 (validKeyInArray!0 k!2698))))

(declare-fun b!265718 () Bool)

(declare-fun res!130013 () Bool)

(assert (=> b!265718 (=> (not res!130013) (not e!172059))))

(assert (=> b!265718 (= res!130013 (and (= (size!6405 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6405 a!3436))))))

(declare-fun b!265719 () Bool)

(assert (=> b!265719 (= e!172061 false)))

(declare-fun lt!134199 () Bool)

(declare-datatypes ((List!3867 0))(
  ( (Nil!3864) (Cons!3863 (h!4530 (_ BitVec 64)) (t!8949 List!3867)) )
))
(declare-fun arrayNoDuplicates!0 (array!12797 (_ BitVec 32) List!3867) Bool)

(assert (=> b!265719 (= lt!134199 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3864))))

(declare-fun b!265720 () Bool)

(declare-fun res!130015 () Bool)

(assert (=> b!265720 (=> (not res!130015) (not e!172059))))

(declare-fun arrayContainsKey!0 (array!12797 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265720 (= res!130015 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265721 () Bool)

(declare-fun res!130017 () Bool)

(assert (=> b!265721 (=> (not res!130017) (not e!172061))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12797 (_ BitVec 32)) Bool)

(assert (=> b!265721 (= res!130017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun res!130014 () Bool)

(assert (=> start!25618 (=> (not res!130014) (not e!172059))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25618 (= res!130014 (validMask!0 mask!4002))))

(assert (=> start!25618 e!172059))

(assert (=> start!25618 true))

(declare-fun array_inv!4016 (array!12797) Bool)

(assert (=> start!25618 (array_inv!4016 a!3436)))

(assert (= (and start!25618 res!130014) b!265718))

(assert (= (and b!265718 res!130013) b!265717))

(assert (= (and b!265717 res!130012) b!265720))

(assert (= (and b!265720 res!130015) b!265716))

(assert (= (and b!265716 res!130016) b!265721))

(assert (= (and b!265721 res!130017) b!265719))

(declare-fun m!282459 () Bool)

(assert (=> b!265721 m!282459))

(declare-fun m!282461 () Bool)

(assert (=> start!25618 m!282461))

(declare-fun m!282463 () Bool)

(assert (=> start!25618 m!282463))

(declare-fun m!282465 () Bool)

(assert (=> b!265716 m!282465))

(declare-fun m!282467 () Bool)

(assert (=> b!265719 m!282467))

(declare-fun m!282469 () Bool)

(assert (=> b!265720 m!282469))

(declare-fun m!282471 () Bool)

(assert (=> b!265717 m!282471))

(push 1)

