; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25628 () Bool)

(assert start!25628)

(declare-fun b!265806 () Bool)

(declare-fun e!172106 () Bool)

(declare-fun e!172104 () Bool)

(assert (=> b!265806 (= e!172106 e!172104)))

(declare-fun res!130107 () Bool)

(assert (=> b!265806 (=> (not res!130107) (not e!172104))))

(declare-datatypes ((SeekEntryResult!1249 0))(
  ( (MissingZero!1249 (index!7166 (_ BitVec 32))) (Found!1249 (index!7167 (_ BitVec 32))) (Intermediate!1249 (undefined!2061 Bool) (index!7168 (_ BitVec 32)) (x!25478 (_ BitVec 32))) (Undefined!1249) (MissingVacant!1249 (index!7169 (_ BitVec 32))) )
))
(declare-fun lt!134229 () SeekEntryResult!1249)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265806 (= res!130107 (or (= lt!134229 (MissingZero!1249 i!1355)) (= lt!134229 (MissingVacant!1249 i!1355))))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-datatypes ((array!12807 0))(
  ( (array!12808 (arr!6058 (Array (_ BitVec 32) (_ BitVec 64))) (size!6410 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12807)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12807 (_ BitVec 32)) SeekEntryResult!1249)

(assert (=> b!265806 (= lt!134229 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!265807 () Bool)

(declare-fun res!130102 () Bool)

(assert (=> b!265807 (=> (not res!130102) (not e!172106))))

(declare-fun arrayContainsKey!0 (array!12807 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265807 (= res!130102 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265808 () Bool)

(declare-fun res!130104 () Bool)

(assert (=> b!265808 (=> (not res!130104) (not e!172106))))

(assert (=> b!265808 (= res!130104 (and (= (size!6410 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6410 a!3436))))))

(declare-fun b!265809 () Bool)

(declare-fun res!130103 () Bool)

(assert (=> b!265809 (=> (not res!130103) (not e!172106))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265809 (= res!130103 (validKeyInArray!0 k!2698))))

(declare-fun b!265810 () Bool)

(declare-fun res!130105 () Bool)

(assert (=> b!265810 (=> (not res!130105) (not e!172104))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12807 (_ BitVec 32)) Bool)

(assert (=> b!265810 (= res!130105 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!265811 () Bool)

(assert (=> b!265811 (= e!172104 false)))

(declare-fun lt!134230 () Bool)

(declare-datatypes ((List!3872 0))(
  ( (Nil!3869) (Cons!3868 (h!4535 (_ BitVec 64)) (t!8954 List!3872)) )
))
(declare-fun arrayNoDuplicates!0 (array!12807 (_ BitVec 32) List!3872) Bool)

(assert (=> b!265811 (= lt!134230 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3869))))

(declare-fun res!130106 () Bool)

(assert (=> start!25628 (=> (not res!130106) (not e!172106))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25628 (= res!130106 (validMask!0 mask!4002))))

(assert (=> start!25628 e!172106))

(assert (=> start!25628 true))

(declare-fun array_inv!4021 (array!12807) Bool)

(assert (=> start!25628 (array_inv!4021 a!3436)))

(assert (= (and start!25628 res!130106) b!265808))

(assert (= (and b!265808 res!130104) b!265809))

(assert (= (and b!265809 res!130103) b!265807))

(assert (= (and b!265807 res!130102) b!265806))

(assert (= (and b!265806 res!130107) b!265810))

(assert (= (and b!265810 res!130105) b!265811))

(declare-fun m!282529 () Bool)

(assert (=> b!265807 m!282529))

(declare-fun m!282531 () Bool)

(assert (=> b!265811 m!282531))

(declare-fun m!282533 () Bool)

(assert (=> start!25628 m!282533))

(declare-fun m!282535 () Bool)

(assert (=> start!25628 m!282535))

(declare-fun m!282537 () Bool)

(assert (=> b!265806 m!282537))

(declare-fun m!282539 () Bool)

(assert (=> b!265810 m!282539))

(declare-fun m!282541 () Bool)

(assert (=> b!265809 m!282541))

(push 1)

(assert (not start!25628))

(assert (not b!265807))

(assert (not b!265810))

(assert (not b!265811))

(assert (not b!265806))

(assert (not b!265809))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

