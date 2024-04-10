; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25616 () Bool)

(assert start!25616)

(declare-fun b!265698 () Bool)

(declare-fun res!129995 () Bool)

(declare-fun e!172052 () Bool)

(assert (=> b!265698 (=> (not res!129995) (not e!172052))))

(declare-datatypes ((array!12795 0))(
  ( (array!12796 (arr!6052 (Array (_ BitVec 32) (_ BitVec 64))) (size!6404 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12795)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12795 (_ BitVec 32)) Bool)

(assert (=> b!265698 (= res!129995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun res!129997 () Bool)

(declare-fun e!172051 () Bool)

(assert (=> start!25616 (=> (not res!129997) (not e!172051))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25616 (= res!129997 (validMask!0 mask!4002))))

(assert (=> start!25616 e!172051))

(assert (=> start!25616 true))

(declare-fun array_inv!4015 (array!12795) Bool)

(assert (=> start!25616 (array_inv!4015 a!3436)))

(declare-fun b!265699 () Bool)

(declare-fun res!129994 () Bool)

(assert (=> b!265699 (=> (not res!129994) (not e!172051))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265699 (= res!129994 (validKeyInArray!0 k!2698))))

(declare-fun b!265700 () Bool)

(assert (=> b!265700 (= e!172051 e!172052)))

(declare-fun res!129999 () Bool)

(assert (=> b!265700 (=> (not res!129999) (not e!172052))))

(declare-datatypes ((SeekEntryResult!1243 0))(
  ( (MissingZero!1243 (index!7142 (_ BitVec 32))) (Found!1243 (index!7143 (_ BitVec 32))) (Intermediate!1243 (undefined!2055 Bool) (index!7144 (_ BitVec 32)) (x!25456 (_ BitVec 32))) (Undefined!1243) (MissingVacant!1243 (index!7145 (_ BitVec 32))) )
))
(declare-fun lt!134193 () SeekEntryResult!1243)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265700 (= res!129999 (or (= lt!134193 (MissingZero!1243 i!1355)) (= lt!134193 (MissingVacant!1243 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12795 (_ BitVec 32)) SeekEntryResult!1243)

(assert (=> b!265700 (= lt!134193 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!265701 () Bool)

(declare-fun res!129998 () Bool)

(assert (=> b!265701 (=> (not res!129998) (not e!172051))))

(assert (=> b!265701 (= res!129998 (and (= (size!6404 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6404 a!3436))))))

(declare-fun b!265702 () Bool)

(declare-fun res!129996 () Bool)

(assert (=> b!265702 (=> (not res!129996) (not e!172051))))

(declare-fun arrayContainsKey!0 (array!12795 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265702 (= res!129996 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265703 () Bool)

(assert (=> b!265703 (= e!172052 false)))

(declare-fun lt!134194 () Bool)

(declare-datatypes ((List!3866 0))(
  ( (Nil!3863) (Cons!3862 (h!4529 (_ BitVec 64)) (t!8948 List!3866)) )
))
(declare-fun arrayNoDuplicates!0 (array!12795 (_ BitVec 32) List!3866) Bool)

(assert (=> b!265703 (= lt!134194 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3863))))

(assert (= (and start!25616 res!129997) b!265701))

(assert (= (and b!265701 res!129998) b!265699))

(assert (= (and b!265699 res!129994) b!265702))

(assert (= (and b!265702 res!129996) b!265700))

(assert (= (and b!265700 res!129999) b!265698))

(assert (= (and b!265698 res!129995) b!265703))

(declare-fun m!282445 () Bool)

(assert (=> b!265699 m!282445))

(declare-fun m!282447 () Bool)

(assert (=> b!265703 m!282447))

(declare-fun m!282449 () Bool)

(assert (=> b!265702 m!282449))

(declare-fun m!282451 () Bool)

(assert (=> b!265700 m!282451))

(declare-fun m!282453 () Bool)

(assert (=> b!265698 m!282453))

(declare-fun m!282455 () Bool)

(assert (=> start!25616 m!282455))

(declare-fun m!282457 () Bool)

(assert (=> start!25616 m!282457))

(push 1)

