; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81630 () Bool)

(assert start!81630)

(declare-fun res!638418 () Bool)

(declare-fun e!536911 () Bool)

(assert (=> start!81630 (=> (not res!638418) (not e!536911))))

(declare-fun mask!4034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81630 (= res!638418 (validMask!0 mask!4034))))

(assert (=> start!81630 e!536911))

(assert (=> start!81630 true))

(declare-datatypes ((array!57691 0))(
  ( (array!57692 (arr!27733 (Array (_ BitVec 32) (_ BitVec 64))) (size!28212 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57691)

(declare-fun array_inv!21523 (array!57691) Bool)

(assert (=> start!81630 (array_inv!21523 a!3460)))

(declare-fun b!953234 () Bool)

(declare-fun res!638419 () Bool)

(assert (=> b!953234 (=> (not res!638419) (not e!536911))))

(assert (=> b!953234 (= res!638419 (= (size!28212 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(declare-fun b!953235 () Bool)

(assert (=> b!953235 (= e!536911 false)))

(declare-fun lt!429643 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57691 (_ BitVec 32)) Bool)

(assert (=> b!953235 (= lt!429643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(assert (= (and start!81630 res!638418) b!953234))

(assert (= (and b!953234 res!638419) b!953235))

(declare-fun m!885319 () Bool)

(assert (=> start!81630 m!885319))

(declare-fun m!885321 () Bool)

(assert (=> start!81630 m!885321))

(declare-fun m!885323 () Bool)

(assert (=> b!953235 m!885323))

(push 1)

(assert (not b!953235))

(assert (not start!81630))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

