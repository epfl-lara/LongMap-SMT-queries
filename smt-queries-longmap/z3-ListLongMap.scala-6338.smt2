; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81686 () Bool)

(assert start!81686)

(declare-fun b!953412 () Bool)

(declare-fun res!638580 () Bool)

(declare-fun e!537034 () Bool)

(assert (=> b!953412 (=> (not res!638580) (not e!537034))))

(declare-datatypes ((array!57726 0))(
  ( (array!57727 (arr!27749 (Array (_ BitVec 32) (_ BitVec 64))) (size!28228 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57726)

(declare-fun mask!4034 () (_ BitVec 32))

(assert (=> b!953412 (= res!638580 (= (size!28228 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(declare-fun b!953415 () Bool)

(assert (=> b!953415 (= e!537034 false)))

(declare-datatypes ((SeekEntryResult!9176 0))(
  ( (MissingZero!9176 (index!39075 (_ BitVec 32))) (Found!9176 (index!39076 (_ BitVec 32))) (Intermediate!9176 (undefined!9988 Bool) (index!39077 (_ BitVec 32)) (x!82064 (_ BitVec 32))) (Undefined!9176) (MissingVacant!9176 (index!39078 (_ BitVec 32))) )
))
(declare-fun lt!429709 () SeekEntryResult!9176)

(declare-fun k0!2725 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57726 (_ BitVec 32)) SeekEntryResult!9176)

(assert (=> b!953415 (= lt!429709 (seekEntryOrOpen!0 k0!2725 a!3460 mask!4034))))

(declare-fun b!953414 () Bool)

(declare-fun res!638579 () Bool)

(assert (=> b!953414 (=> (not res!638579) (not e!537034))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!953414 (= res!638579 (validKeyInArray!0 k0!2725))))

(declare-fun b!953413 () Bool)

(declare-fun res!638578 () Bool)

(assert (=> b!953413 (=> (not res!638578) (not e!537034))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57726 (_ BitVec 32)) Bool)

(assert (=> b!953413 (= res!638578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(declare-fun res!638581 () Bool)

(assert (=> start!81686 (=> (not res!638581) (not e!537034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81686 (= res!638581 (validMask!0 mask!4034))))

(assert (=> start!81686 e!537034))

(assert (=> start!81686 true))

(declare-fun array_inv!21539 (array!57726) Bool)

(assert (=> start!81686 (array_inv!21539 a!3460)))

(assert (= (and start!81686 res!638581) b!953412))

(assert (= (and b!953412 res!638580) b!953413))

(assert (= (and b!953413 res!638578) b!953414))

(assert (= (and b!953414 res!638579) b!953415))

(declare-fun m!885473 () Bool)

(assert (=> b!953415 m!885473))

(declare-fun m!885475 () Bool)

(assert (=> b!953414 m!885475))

(declare-fun m!885477 () Bool)

(assert (=> b!953413 m!885477))

(declare-fun m!885479 () Bool)

(assert (=> start!81686 m!885479))

(declare-fun m!885481 () Bool)

(assert (=> start!81686 m!885481))

(check-sat (not b!953413) (not b!953414) (not start!81686) (not b!953415))
(check-sat)
