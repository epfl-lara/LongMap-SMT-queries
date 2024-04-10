; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81680 () Bool)

(assert start!81680)

(declare-fun res!638545 () Bool)

(declare-fun e!537017 () Bool)

(assert (=> start!81680 (=> (not res!638545) (not e!537017))))

(declare-fun mask!4034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81680 (= res!638545 (validMask!0 mask!4034))))

(assert (=> start!81680 e!537017))

(assert (=> start!81680 true))

(declare-datatypes ((array!57720 0))(
  ( (array!57721 (arr!27746 (Array (_ BitVec 32) (_ BitVec 64))) (size!28225 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57720)

(declare-fun array_inv!21536 (array!57720) Bool)

(assert (=> start!81680 (array_inv!21536 a!3460)))

(declare-fun b!953378 () Bool)

(declare-fun res!638543 () Bool)

(assert (=> b!953378 (=> (not res!638543) (not e!537017))))

(declare-fun k0!2725 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!953378 (= res!638543 (validKeyInArray!0 k0!2725))))

(declare-fun b!953376 () Bool)

(declare-fun res!638542 () Bool)

(assert (=> b!953376 (=> (not res!638542) (not e!537017))))

(assert (=> b!953376 (= res!638542 (= (size!28225 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(declare-fun b!953379 () Bool)

(assert (=> b!953379 (= e!537017 false)))

(declare-datatypes ((SeekEntryResult!9173 0))(
  ( (MissingZero!9173 (index!39063 (_ BitVec 32))) (Found!9173 (index!39064 (_ BitVec 32))) (Intermediate!9173 (undefined!9985 Bool) (index!39065 (_ BitVec 32)) (x!82053 (_ BitVec 32))) (Undefined!9173) (MissingVacant!9173 (index!39066 (_ BitVec 32))) )
))
(declare-fun lt!429700 () SeekEntryResult!9173)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57720 (_ BitVec 32)) SeekEntryResult!9173)

(assert (=> b!953379 (= lt!429700 (seekEntryOrOpen!0 k0!2725 a!3460 mask!4034))))

(declare-fun b!953377 () Bool)

(declare-fun res!638544 () Bool)

(assert (=> b!953377 (=> (not res!638544) (not e!537017))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57720 (_ BitVec 32)) Bool)

(assert (=> b!953377 (= res!638544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(assert (= (and start!81680 res!638545) b!953376))

(assert (= (and b!953376 res!638542) b!953377))

(assert (= (and b!953377 res!638544) b!953378))

(assert (= (and b!953378 res!638543) b!953379))

(declare-fun m!885443 () Bool)

(assert (=> start!81680 m!885443))

(declare-fun m!885445 () Bool)

(assert (=> start!81680 m!885445))

(declare-fun m!885447 () Bool)

(assert (=> b!953378 m!885447))

(declare-fun m!885449 () Bool)

(assert (=> b!953379 m!885449))

(declare-fun m!885451 () Bool)

(assert (=> b!953377 m!885451))

(check-sat (not b!953379) (not b!953377) (not b!953378) (not start!81680))
(check-sat)
