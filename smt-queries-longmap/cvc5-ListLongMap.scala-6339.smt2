; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81676 () Bool)

(assert start!81676)

(declare-fun b!953221 () Bool)

(declare-fun res!638519 () Bool)

(declare-fun e!536911 () Bool)

(assert (=> b!953221 (=> (not res!638519) (not e!536911))))

(declare-datatypes ((array!57699 0))(
  ( (array!57700 (arr!27736 (Array (_ BitVec 32) (_ BitVec 64))) (size!28217 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57699)

(declare-fun mask!4034 () (_ BitVec 32))

(assert (=> b!953221 (= res!638519 (= (size!28217 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(declare-fun b!953223 () Bool)

(declare-fun res!638517 () Bool)

(assert (=> b!953223 (=> (not res!638517) (not e!536911))))

(declare-fun k!2725 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!953223 (= res!638517 (validKeyInArray!0 k!2725))))

(declare-fun b!953224 () Bool)

(assert (=> b!953224 (= e!536911 false)))

(declare-datatypes ((SeekEntryResult!9175 0))(
  ( (MissingZero!9175 (index!39071 (_ BitVec 32))) (Found!9175 (index!39072 (_ BitVec 32))) (Intermediate!9175 (undefined!9987 Bool) (index!39073 (_ BitVec 32)) (x!82066 (_ BitVec 32))) (Undefined!9175) (MissingVacant!9175 (index!39074 (_ BitVec 32))) )
))
(declare-fun lt!429485 () SeekEntryResult!9175)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57699 (_ BitVec 32)) SeekEntryResult!9175)

(assert (=> b!953224 (= lt!429485 (seekEntryOrOpen!0 k!2725 a!3460 mask!4034))))

(declare-fun res!638516 () Bool)

(assert (=> start!81676 (=> (not res!638516) (not e!536911))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81676 (= res!638516 (validMask!0 mask!4034))))

(assert (=> start!81676 e!536911))

(assert (=> start!81676 true))

(declare-fun array_inv!21593 (array!57699) Bool)

(assert (=> start!81676 (array_inv!21593 a!3460)))

(declare-fun b!953222 () Bool)

(declare-fun res!638518 () Bool)

(assert (=> b!953222 (=> (not res!638518) (not e!536911))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57699 (_ BitVec 32)) Bool)

(assert (=> b!953222 (= res!638518 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(assert (= (and start!81676 res!638516) b!953221))

(assert (= (and b!953221 res!638519) b!953222))

(assert (= (and b!953222 res!638518) b!953223))

(assert (= (and b!953223 res!638517) b!953224))

(declare-fun m!884755 () Bool)

(assert (=> b!953223 m!884755))

(declare-fun m!884757 () Bool)

(assert (=> b!953224 m!884757))

(declare-fun m!884759 () Bool)

(assert (=> start!81676 m!884759))

(declare-fun m!884761 () Bool)

(assert (=> start!81676 m!884761))

(declare-fun m!884763 () Bool)

(assert (=> b!953222 m!884763))

(push 1)

(assert (not b!953222))

(assert (not b!953223))

(assert (not start!81676))

(assert (not b!953224))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

