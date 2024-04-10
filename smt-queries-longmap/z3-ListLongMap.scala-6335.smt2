; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81668 () Bool)

(assert start!81668)

(declare-fun res!638497 () Bool)

(declare-fun e!536981 () Bool)

(assert (=> start!81668 (=> (not res!638497) (not e!536981))))

(declare-fun mask!4034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81668 (= res!638497 (validMask!0 mask!4034))))

(assert (=> start!81668 e!536981))

(assert (=> start!81668 true))

(declare-datatypes ((array!57708 0))(
  ( (array!57709 (arr!27740 (Array (_ BitVec 32) (_ BitVec 64))) (size!28219 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57708)

(declare-fun array_inv!21530 (array!57708) Bool)

(assert (=> start!81668 (array_inv!21530 a!3460)))

(declare-fun b!953330 () Bool)

(declare-fun res!638496 () Bool)

(assert (=> b!953330 (=> (not res!638496) (not e!536981))))

(assert (=> b!953330 (= res!638496 (= (size!28219 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(declare-fun b!953331 () Bool)

(assert (=> b!953331 (= e!536981 false)))

(declare-fun lt!429682 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57708 (_ BitVec 32)) Bool)

(assert (=> b!953331 (= lt!429682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(assert (= (and start!81668 res!638497) b!953330))

(assert (= (and b!953330 res!638496) b!953331))

(declare-fun m!885403 () Bool)

(assert (=> start!81668 m!885403))

(declare-fun m!885405 () Bool)

(assert (=> start!81668 m!885405))

(declare-fun m!885407 () Bool)

(assert (=> b!953331 m!885407))

(check-sat (not b!953331) (not start!81668))
(check-sat)
