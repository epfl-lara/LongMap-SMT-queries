; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81692 () Bool)

(assert start!81692)

(declare-fun b!953449 () Bool)

(declare-fun res!638616 () Bool)

(declare-fun e!537053 () Bool)

(assert (=> b!953449 (=> (not res!638616) (not e!537053))))

(declare-datatypes ((array!57732 0))(
  ( (array!57733 (arr!27752 (Array (_ BitVec 32) (_ BitVec 64))) (size!28231 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57732)

(declare-fun mask!4034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57732 (_ BitVec 32)) Bool)

(assert (=> b!953449 (= res!638616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(declare-fun res!638615 () Bool)

(assert (=> start!81692 (=> (not res!638615) (not e!537053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81692 (= res!638615 (validMask!0 mask!4034))))

(assert (=> start!81692 e!537053))

(assert (=> start!81692 true))

(declare-fun array_inv!21542 (array!57732) Bool)

(assert (=> start!81692 (array_inv!21542 a!3460)))

(declare-fun b!953450 () Bool)

(declare-fun res!638617 () Bool)

(assert (=> b!953450 (=> (not res!638617) (not e!537053))))

(declare-fun k0!2725 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!953450 (= res!638617 (validKeyInArray!0 k0!2725))))

(declare-fun b!953448 () Bool)

(declare-fun res!638614 () Bool)

(assert (=> b!953448 (=> (not res!638614) (not e!537053))))

(assert (=> b!953448 (= res!638614 (= (size!28231 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(declare-fun b!953451 () Bool)

(assert (=> b!953451 (= e!537053 false)))

(declare-datatypes ((SeekEntryResult!9179 0))(
  ( (MissingZero!9179 (index!39087 (_ BitVec 32))) (Found!9179 (index!39088 (_ BitVec 32))) (Intermediate!9179 (undefined!9991 Bool) (index!39089 (_ BitVec 32)) (x!82075 (_ BitVec 32))) (Undefined!9179) (MissingVacant!9179 (index!39090 (_ BitVec 32))) )
))
(declare-fun lt!429718 () SeekEntryResult!9179)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57732 (_ BitVec 32)) SeekEntryResult!9179)

(assert (=> b!953451 (= lt!429718 (seekEntryOrOpen!0 k0!2725 a!3460 mask!4034))))

(assert (= (and start!81692 res!638615) b!953448))

(assert (= (and b!953448 res!638614) b!953449))

(assert (= (and b!953449 res!638616) b!953450))

(assert (= (and b!953450 res!638617) b!953451))

(declare-fun m!885503 () Bool)

(assert (=> b!953449 m!885503))

(declare-fun m!885505 () Bool)

(assert (=> start!81692 m!885505))

(declare-fun m!885507 () Bool)

(assert (=> start!81692 m!885507))

(declare-fun m!885509 () Bool)

(assert (=> b!953450 m!885509))

(declare-fun m!885511 () Bool)

(assert (=> b!953451 m!885511))

(check-sat (not b!953451) (not b!953450) (not start!81692) (not b!953449))
(check-sat)
