; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25736 () Bool)

(assert start!25736)

(declare-fun res!131158 () Bool)

(declare-fun e!172591 () Bool)

(assert (=> start!25736 (=> (not res!131158) (not e!172591))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25736 (= res!131158 (validMask!0 mask!4002))))

(assert (=> start!25736 e!172591))

(assert (=> start!25736 true))

(declare-datatypes ((array!12915 0))(
  ( (array!12916 (arr!6112 (Array (_ BitVec 32) (_ BitVec 64))) (size!6464 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12915)

(declare-fun array_inv!4075 (array!12915) Bool)

(assert (=> start!25736 (array_inv!4075 a!3436)))

(declare-fun b!266858 () Bool)

(declare-fun e!172592 () Bool)

(assert (=> b!266858 (= e!172591 e!172592)))

(declare-fun res!131159 () Bool)

(assert (=> b!266858 (=> (not res!131159) (not e!172592))))

(declare-datatypes ((SeekEntryResult!1303 0))(
  ( (MissingZero!1303 (index!7382 (_ BitVec 32))) (Found!1303 (index!7383 (_ BitVec 32))) (Intermediate!1303 (undefined!2115 Bool) (index!7384 (_ BitVec 32)) (x!25676 (_ BitVec 32))) (Undefined!1303) (MissingVacant!1303 (index!7385 (_ BitVec 32))) )
))
(declare-fun lt!134545 () SeekEntryResult!1303)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266858 (= res!131159 (or (= lt!134545 (MissingZero!1303 i!1355)) (= lt!134545 (MissingVacant!1303 i!1355))))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12915 (_ BitVec 32)) SeekEntryResult!1303)

(assert (=> b!266858 (= lt!134545 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!266859 () Bool)

(declare-fun res!131157 () Bool)

(assert (=> b!266859 (=> (not res!131157) (not e!172591))))

(declare-fun arrayContainsKey!0 (array!12915 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266859 (= res!131157 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266860 () Bool)

(declare-fun res!131155 () Bool)

(assert (=> b!266860 (=> (not res!131155) (not e!172591))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266860 (= res!131155 (validKeyInArray!0 k!2698))))

(declare-fun b!266861 () Bool)

(declare-fun res!131154 () Bool)

(assert (=> b!266861 (=> (not res!131154) (not e!172592))))

(declare-datatypes ((List!3926 0))(
  ( (Nil!3923) (Cons!3922 (h!4589 (_ BitVec 64)) (t!9008 List!3926)) )
))
(declare-fun arrayNoDuplicates!0 (array!12915 (_ BitVec 32) List!3926) Bool)

(assert (=> b!266861 (= res!131154 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3923))))

(declare-fun b!266862 () Bool)

(declare-fun res!131156 () Bool)

(assert (=> b!266862 (=> (not res!131156) (not e!172592))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12915 (_ BitVec 32)) Bool)

(assert (=> b!266862 (= res!131156 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266863 () Bool)

(declare-fun res!131160 () Bool)

(assert (=> b!266863 (=> (not res!131160) (not e!172591))))

(assert (=> b!266863 (= res!131160 (and (= (size!6464 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6464 a!3436))))))

(declare-fun b!266864 () Bool)

(assert (=> b!266864 (= e!172592 (bvsge #b00000000000000000000000000000000 (size!6464 a!3436)))))

(assert (= (and start!25736 res!131158) b!266863))

(assert (= (and b!266863 res!131160) b!266860))

(assert (= (and b!266860 res!131155) b!266859))

(assert (= (and b!266859 res!131157) b!266858))

(assert (= (and b!266858 res!131159) b!266862))

(assert (= (and b!266862 res!131156) b!266861))

(assert (= (and b!266861 res!131154) b!266864))

(declare-fun m!283357 () Bool)

(assert (=> b!266859 m!283357))

(declare-fun m!283359 () Bool)

(assert (=> b!266862 m!283359))

(declare-fun m!283361 () Bool)

(assert (=> b!266861 m!283361))

(declare-fun m!283363 () Bool)

(assert (=> b!266858 m!283363))

(declare-fun m!283365 () Bool)

(assert (=> start!25736 m!283365))

(declare-fun m!283367 () Bool)

(assert (=> start!25736 m!283367))

(declare-fun m!283369 () Bool)

(assert (=> b!266860 m!283369))

(push 1)

(assert (not b!266861))

(assert (not b!266862))

(assert (not b!266858))

(assert (not start!25736))

(assert (not b!266859))

