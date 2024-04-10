; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81674 () Bool)

(assert start!81674)

(declare-fun res!638515 () Bool)

(declare-fun e!536998 () Bool)

(assert (=> start!81674 (=> (not res!638515) (not e!536998))))

(declare-fun mask!4034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81674 (= res!638515 (validMask!0 mask!4034))))

(assert (=> start!81674 e!536998))

(assert (=> start!81674 true))

(declare-datatypes ((array!57714 0))(
  ( (array!57715 (arr!27743 (Array (_ BitVec 32) (_ BitVec 64))) (size!28222 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57714)

(declare-fun array_inv!21533 (array!57714) Bool)

(assert (=> start!81674 (array_inv!21533 a!3460)))

(declare-fun b!953348 () Bool)

(declare-fun res!638514 () Bool)

(assert (=> b!953348 (=> (not res!638514) (not e!536998))))

(assert (=> b!953348 (= res!638514 (= (size!28222 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(declare-fun b!953349 () Bool)

(assert (=> b!953349 (= e!536998 false)))

(declare-fun lt!429691 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57714 (_ BitVec 32)) Bool)

(assert (=> b!953349 (= lt!429691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(assert (= (and start!81674 res!638515) b!953348))

(assert (= (and b!953348 res!638514) b!953349))

(declare-fun m!885421 () Bool)

(assert (=> start!81674 m!885421))

(declare-fun m!885423 () Bool)

(assert (=> start!81674 m!885423))

(declare-fun m!885425 () Bool)

(assert (=> b!953349 m!885425))

(check-sat (not b!953349) (not start!81674))
(check-sat)
