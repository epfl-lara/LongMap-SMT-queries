; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81616 () Bool)

(assert start!81616)

(declare-fun res!638321 () Bool)

(declare-fun e!536776 () Bool)

(assert (=> start!81616 (=> (not res!638321) (not e!536776))))

(declare-fun mask!4034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81616 (= res!638321 (validMask!0 mask!4034))))

(assert (=> start!81616 e!536776))

(assert (=> start!81616 true))

(declare-datatypes ((array!57660 0))(
  ( (array!57661 (arr!27718 (Array (_ BitVec 32) (_ BitVec 64))) (size!28199 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57660)

(declare-fun array_inv!21575 (array!57660) Bool)

(assert (=> start!81616 (array_inv!21575 a!3460)))

(declare-fun b!953007 () Bool)

(declare-fun res!638320 () Bool)

(assert (=> b!953007 (=> (not res!638320) (not e!536776))))

(assert (=> b!953007 (= res!638320 (= (size!28199 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(declare-fun b!953008 () Bool)

(assert (=> b!953008 (= e!536776 false)))

(declare-fun lt!429413 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57660 (_ BitVec 32)) Bool)

(assert (=> b!953008 (= lt!429413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(assert (= (and start!81616 res!638321) b!953007))

(assert (= (and b!953007 res!638320) b!953008))

(declare-fun m!884573 () Bool)

(assert (=> start!81616 m!884573))

(declare-fun m!884575 () Bool)

(assert (=> start!81616 m!884575))

(declare-fun m!884577 () Bool)

(assert (=> b!953008 m!884577))

(push 1)

(assert (not b!953008))

(assert (not start!81616))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

