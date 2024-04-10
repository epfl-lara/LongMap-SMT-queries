; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25606 () Bool)

(assert start!25606)

(declare-fun b!265608 () Bool)

(declare-fun res!129906 () Bool)

(declare-fun e!172005 () Bool)

(assert (=> b!265608 (=> (not res!129906) (not e!172005))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265608 (= res!129906 (validKeyInArray!0 k!2698))))

(declare-fun res!129909 () Bool)

(assert (=> start!25606 (=> (not res!129909) (not e!172005))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25606 (= res!129909 (validMask!0 mask!4002))))

(assert (=> start!25606 e!172005))

(assert (=> start!25606 true))

(declare-datatypes ((array!12785 0))(
  ( (array!12786 (arr!6047 (Array (_ BitVec 32) (_ BitVec 64))) (size!6399 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12785)

(declare-fun array_inv!4010 (array!12785) Bool)

(assert (=> start!25606 (array_inv!4010 a!3436)))

(declare-fun b!265609 () Bool)

(declare-fun res!129904 () Bool)

(assert (=> b!265609 (=> (not res!129904) (not e!172005))))

(declare-fun arrayContainsKey!0 (array!12785 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265609 (= res!129904 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265610 () Bool)

(declare-fun res!129908 () Bool)

(declare-fun e!172007 () Bool)

(assert (=> b!265610 (=> (not res!129908) (not e!172007))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12785 (_ BitVec 32)) Bool)

(assert (=> b!265610 (= res!129908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!265611 () Bool)

(assert (=> b!265611 (= e!172007 false)))

(declare-fun lt!134163 () Bool)

(declare-datatypes ((List!3861 0))(
  ( (Nil!3858) (Cons!3857 (h!4524 (_ BitVec 64)) (t!8943 List!3861)) )
))
(declare-fun arrayNoDuplicates!0 (array!12785 (_ BitVec 32) List!3861) Bool)

(assert (=> b!265611 (= lt!134163 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3858))))

(declare-fun b!265612 () Bool)

(assert (=> b!265612 (= e!172005 e!172007)))

(declare-fun res!129907 () Bool)

(assert (=> b!265612 (=> (not res!129907) (not e!172007))))

(declare-datatypes ((SeekEntryResult!1238 0))(
  ( (MissingZero!1238 (index!7122 (_ BitVec 32))) (Found!1238 (index!7123 (_ BitVec 32))) (Intermediate!1238 (undefined!2050 Bool) (index!7124 (_ BitVec 32)) (x!25443 (_ BitVec 32))) (Undefined!1238) (MissingVacant!1238 (index!7125 (_ BitVec 32))) )
))
(declare-fun lt!134164 () SeekEntryResult!1238)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265612 (= res!129907 (or (= lt!134164 (MissingZero!1238 i!1355)) (= lt!134164 (MissingVacant!1238 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12785 (_ BitVec 32)) SeekEntryResult!1238)

(assert (=> b!265612 (= lt!134164 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!265613 () Bool)

(declare-fun res!129905 () Bool)

(assert (=> b!265613 (=> (not res!129905) (not e!172005))))

(assert (=> b!265613 (= res!129905 (and (= (size!6399 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6399 a!3436))))))

(assert (= (and start!25606 res!129909) b!265613))

(assert (= (and b!265613 res!129905) b!265608))

(assert (= (and b!265608 res!129906) b!265609))

(assert (= (and b!265609 res!129904) b!265612))

(assert (= (and b!265612 res!129907) b!265610))

(assert (= (and b!265610 res!129908) b!265611))

(declare-fun m!282375 () Bool)

(assert (=> b!265611 m!282375))

(declare-fun m!282377 () Bool)

(assert (=> b!265609 m!282377))

(declare-fun m!282379 () Bool)

(assert (=> b!265608 m!282379))

(declare-fun m!282381 () Bool)

(assert (=> start!25606 m!282381))

(declare-fun m!282383 () Bool)

(assert (=> start!25606 m!282383))

(declare-fun m!282385 () Bool)

(assert (=> b!265612 m!282385))

(declare-fun m!282387 () Bool)

(assert (=> b!265610 m!282387))

(push 1)

