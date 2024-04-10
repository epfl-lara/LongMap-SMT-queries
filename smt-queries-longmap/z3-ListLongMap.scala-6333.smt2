; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81632 () Bool)

(assert start!81632)

(declare-fun res!638425 () Bool)

(declare-fun e!536917 () Bool)

(assert (=> start!81632 (=> (not res!638425) (not e!536917))))

(declare-fun mask!4034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81632 (= res!638425 (validMask!0 mask!4034))))

(assert (=> start!81632 e!536917))

(assert (=> start!81632 true))

(declare-datatypes ((array!57693 0))(
  ( (array!57694 (arr!27734 (Array (_ BitVec 32) (_ BitVec 64))) (size!28213 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57693)

(declare-fun array_inv!21524 (array!57693) Bool)

(assert (=> start!81632 (array_inv!21524 a!3460)))

(declare-fun b!953240 () Bool)

(declare-fun res!638424 () Bool)

(assert (=> b!953240 (=> (not res!638424) (not e!536917))))

(assert (=> b!953240 (= res!638424 (= (size!28213 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(declare-fun b!953241 () Bool)

(assert (=> b!953241 (= e!536917 false)))

(declare-fun lt!429646 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57693 (_ BitVec 32)) Bool)

(assert (=> b!953241 (= lt!429646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(assert (= (and start!81632 res!638425) b!953240))

(assert (= (and b!953240 res!638424) b!953241))

(declare-fun m!885325 () Bool)

(assert (=> start!81632 m!885325))

(declare-fun m!885327 () Bool)

(assert (=> start!81632 m!885327))

(declare-fun m!885329 () Bool)

(assert (=> b!953241 m!885329))

(check-sat (not b!953241) (not start!81632))
(check-sat)
