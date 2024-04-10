; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81688 () Bool)

(assert start!81688)

(declare-fun res!638590 () Bool)

(declare-fun e!537041 () Bool)

(assert (=> start!81688 (=> (not res!638590) (not e!537041))))

(declare-fun mask!4034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81688 (= res!638590 (validMask!0 mask!4034))))

(assert (=> start!81688 e!537041))

(assert (=> start!81688 true))

(declare-datatypes ((array!57728 0))(
  ( (array!57729 (arr!27750 (Array (_ BitVec 32) (_ BitVec 64))) (size!28229 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57728)

(declare-fun array_inv!21540 (array!57728) Bool)

(assert (=> start!81688 (array_inv!21540 a!3460)))

(declare-fun b!953425 () Bool)

(declare-fun res!638592 () Bool)

(assert (=> b!953425 (=> (not res!638592) (not e!537041))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57728 (_ BitVec 32)) Bool)

(assert (=> b!953425 (= res!638592 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(declare-fun b!953426 () Bool)

(declare-fun res!638591 () Bool)

(assert (=> b!953426 (=> (not res!638591) (not e!537041))))

(declare-fun k!2725 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!953426 (= res!638591 (validKeyInArray!0 k!2725))))

(declare-fun b!953424 () Bool)

(declare-fun res!638593 () Bool)

(assert (=> b!953424 (=> (not res!638593) (not e!537041))))

(assert (=> b!953424 (= res!638593 (= (size!28229 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(declare-fun b!953427 () Bool)

(assert (=> b!953427 (= e!537041 false)))

(declare-datatypes ((SeekEntryResult!9177 0))(
  ( (MissingZero!9177 (index!39079 (_ BitVec 32))) (Found!9177 (index!39080 (_ BitVec 32))) (Intermediate!9177 (undefined!9989 Bool) (index!39081 (_ BitVec 32)) (x!82065 (_ BitVec 32))) (Undefined!9177) (MissingVacant!9177 (index!39082 (_ BitVec 32))) )
))
(declare-fun lt!429712 () SeekEntryResult!9177)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57728 (_ BitVec 32)) SeekEntryResult!9177)

(assert (=> b!953427 (= lt!429712 (seekEntryOrOpen!0 k!2725 a!3460 mask!4034))))

(assert (= (and start!81688 res!638590) b!953424))

(assert (= (and b!953424 res!638593) b!953425))

(assert (= (and b!953425 res!638592) b!953426))

(assert (= (and b!953426 res!638591) b!953427))

(declare-fun m!885483 () Bool)

(assert (=> start!81688 m!885483))

(declare-fun m!885485 () Bool)

(assert (=> start!81688 m!885485))

(declare-fun m!885487 () Bool)

(assert (=> b!953425 m!885487))

(declare-fun m!885489 () Bool)

(assert (=> b!953426 m!885489))

(declare-fun m!885491 () Bool)

(assert (=> b!953427 m!885491))

(push 1)

(assert (not b!953425))

(assert (not b!953426))

(assert (not start!81688))

(assert (not b!953427))

(check-sat)

