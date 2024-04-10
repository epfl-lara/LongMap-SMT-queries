; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81634 () Bool)

(assert start!81634)

(declare-fun res!638430 () Bool)

(declare-fun e!536924 () Bool)

(assert (=> start!81634 (=> (not res!638430) (not e!536924))))

(declare-fun mask!4034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81634 (= res!638430 (validMask!0 mask!4034))))

(assert (=> start!81634 e!536924))

(assert (=> start!81634 true))

(declare-datatypes ((array!57695 0))(
  ( (array!57696 (arr!27735 (Array (_ BitVec 32) (_ BitVec 64))) (size!28214 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57695)

(declare-fun array_inv!21525 (array!57695) Bool)

(assert (=> start!81634 (array_inv!21525 a!3460)))

(declare-fun b!953246 () Bool)

(declare-fun res!638431 () Bool)

(assert (=> b!953246 (=> (not res!638431) (not e!536924))))

(assert (=> b!953246 (= res!638431 (= (size!28214 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(declare-fun b!953247 () Bool)

(assert (=> b!953247 (= e!536924 false)))

(declare-fun lt!429649 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57695 (_ BitVec 32)) Bool)

(assert (=> b!953247 (= lt!429649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(assert (= (and start!81634 res!638430) b!953246))

(assert (= (and b!953246 res!638431) b!953247))

(declare-fun m!885331 () Bool)

(assert (=> start!81634 m!885331))

(declare-fun m!885333 () Bool)

(assert (=> start!81634 m!885333))

(declare-fun m!885335 () Bool)

(assert (=> b!953247 m!885335))

(push 1)

(assert (not b!953247))

(assert (not start!81634))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

