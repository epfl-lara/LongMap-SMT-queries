; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81664 () Bool)

(assert start!81664)

(declare-fun b!953150 () Bool)

(declare-fun res!638446 () Bool)

(declare-fun e!536874 () Bool)

(assert (=> b!953150 (=> (not res!638446) (not e!536874))))

(declare-datatypes ((array!57687 0))(
  ( (array!57688 (arr!27730 (Array (_ BitVec 32) (_ BitVec 64))) (size!28211 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57687)

(declare-fun mask!4034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57687 (_ BitVec 32)) Bool)

(assert (=> b!953150 (= res!638446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(declare-fun b!953152 () Bool)

(assert (=> b!953152 (= e!536874 false)))

(declare-datatypes ((SeekEntryResult!9169 0))(
  ( (MissingZero!9169 (index!39047 (_ BitVec 32))) (Found!9169 (index!39048 (_ BitVec 32))) (Intermediate!9169 (undefined!9981 Bool) (index!39049 (_ BitVec 32)) (x!82044 (_ BitVec 32))) (Undefined!9169) (MissingVacant!9169 (index!39050 (_ BitVec 32))) )
))
(declare-fun lt!429467 () SeekEntryResult!9169)

(declare-fun k!2725 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57687 (_ BitVec 32)) SeekEntryResult!9169)

(assert (=> b!953152 (= lt!429467 (seekEntryOrOpen!0 k!2725 a!3460 mask!4034))))

(declare-fun b!953149 () Bool)

(declare-fun res!638444 () Bool)

(assert (=> b!953149 (=> (not res!638444) (not e!536874))))

(assert (=> b!953149 (= res!638444 (= (size!28211 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(declare-fun res!638445 () Bool)

(assert (=> start!81664 (=> (not res!638445) (not e!536874))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81664 (= res!638445 (validMask!0 mask!4034))))

(assert (=> start!81664 e!536874))

(assert (=> start!81664 true))

(declare-fun array_inv!21587 (array!57687) Bool)

(assert (=> start!81664 (array_inv!21587 a!3460)))

(declare-fun b!953151 () Bool)

(declare-fun res!638447 () Bool)

(assert (=> b!953151 (=> (not res!638447) (not e!536874))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!953151 (= res!638447 (validKeyInArray!0 k!2725))))

(assert (= (and start!81664 res!638445) b!953149))

(assert (= (and b!953149 res!638444) b!953150))

(assert (= (and b!953150 res!638446) b!953151))

(assert (= (and b!953151 res!638447) b!953152))

(declare-fun m!884695 () Bool)

(assert (=> b!953150 m!884695))

(declare-fun m!884697 () Bool)

(assert (=> b!953152 m!884697))

(declare-fun m!884699 () Bool)

(assert (=> start!81664 m!884699))

(declare-fun m!884701 () Bool)

(assert (=> start!81664 m!884701))

(declare-fun m!884703 () Bool)

(assert (=> b!953151 m!884703))

(push 1)

(assert (not b!953150))

(assert (not b!953151))

(assert (not start!81664))

(assert (not b!953152))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

