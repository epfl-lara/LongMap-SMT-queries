; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25628 () Bool)

(assert start!25628)

(declare-fun b!265817 () Bool)

(declare-fun e!172110 () Bool)

(assert (=> b!265817 (= e!172110 false)))

(declare-fun lt!134277 () Bool)

(declare-datatypes ((array!12802 0))(
  ( (array!12803 (arr!6055 (Array (_ BitVec 32) (_ BitVec 64))) (size!6407 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12802)

(declare-datatypes ((List!3782 0))(
  ( (Nil!3779) (Cons!3778 (h!4445 (_ BitVec 64)) (t!8856 List!3782)) )
))
(declare-fun arrayNoDuplicates!0 (array!12802 (_ BitVec 32) List!3782) Bool)

(assert (=> b!265817 (= lt!134277 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3779))))

(declare-fun b!265818 () Bool)

(declare-fun e!172111 () Bool)

(assert (=> b!265818 (= e!172111 e!172110)))

(declare-fun res!130091 () Bool)

(assert (=> b!265818 (=> (not res!130091) (not e!172110))))

(declare-datatypes ((SeekEntryResult!1211 0))(
  ( (MissingZero!1211 (index!7014 (_ BitVec 32))) (Found!1211 (index!7015 (_ BitVec 32))) (Intermediate!1211 (undefined!2023 Bool) (index!7016 (_ BitVec 32)) (x!25440 (_ BitVec 32))) (Undefined!1211) (MissingVacant!1211 (index!7017 (_ BitVec 32))) )
))
(declare-fun lt!134276 () SeekEntryResult!1211)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265818 (= res!130091 (or (= lt!134276 (MissingZero!1211 i!1355)) (= lt!134276 (MissingVacant!1211 i!1355))))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12802 (_ BitVec 32)) SeekEntryResult!1211)

(assert (=> b!265818 (= lt!134276 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!265819 () Bool)

(declare-fun res!130088 () Bool)

(assert (=> b!265819 (=> (not res!130088) (not e!172111))))

(assert (=> b!265819 (= res!130088 (and (= (size!6407 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6407 a!3436))))))

(declare-fun b!265820 () Bool)

(declare-fun res!130089 () Bool)

(assert (=> b!265820 (=> (not res!130089) (not e!172111))))

(declare-fun arrayContainsKey!0 (array!12802 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265820 (= res!130089 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265821 () Bool)

(declare-fun res!130092 () Bool)

(assert (=> b!265821 (=> (not res!130092) (not e!172111))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265821 (= res!130092 (validKeyInArray!0 k0!2698))))

(declare-fun b!265822 () Bool)

(declare-fun res!130090 () Bool)

(assert (=> b!265822 (=> (not res!130090) (not e!172110))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12802 (_ BitVec 32)) Bool)

(assert (=> b!265822 (= res!130090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun res!130087 () Bool)

(assert (=> start!25628 (=> (not res!130087) (not e!172111))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25628 (= res!130087 (validMask!0 mask!4002))))

(assert (=> start!25628 e!172111))

(assert (=> start!25628 true))

(declare-fun array_inv!4005 (array!12802) Bool)

(assert (=> start!25628 (array_inv!4005 a!3436)))

(assert (= (and start!25628 res!130087) b!265819))

(assert (= (and b!265819 res!130088) b!265821))

(assert (= (and b!265821 res!130092) b!265820))

(assert (= (and b!265820 res!130089) b!265818))

(assert (= (and b!265818 res!130091) b!265822))

(assert (= (and b!265822 res!130090) b!265817))

(declare-fun m!282707 () Bool)

(assert (=> b!265822 m!282707))

(declare-fun m!282709 () Bool)

(assert (=> b!265817 m!282709))

(declare-fun m!282711 () Bool)

(assert (=> b!265818 m!282711))

(declare-fun m!282713 () Bool)

(assert (=> b!265821 m!282713))

(declare-fun m!282715 () Bool)

(assert (=> b!265820 m!282715))

(declare-fun m!282717 () Bool)

(assert (=> start!25628 m!282717))

(declare-fun m!282719 () Bool)

(assert (=> start!25628 m!282719))

(check-sat (not start!25628) (not b!265817) (not b!265818) (not b!265822) (not b!265820) (not b!265821))
(check-sat)
