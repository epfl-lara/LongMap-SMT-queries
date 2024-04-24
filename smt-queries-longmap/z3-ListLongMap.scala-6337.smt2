; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81846 () Bool)

(assert start!81846)

(declare-fun b!954270 () Bool)

(declare-fun e!537593 () Bool)

(assert (=> b!954270 (= e!537593 false)))

(declare-datatypes ((array!57769 0))(
  ( (array!57770 (arr!27766 (Array (_ BitVec 32) (_ BitVec 64))) (size!28246 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57769)

(declare-datatypes ((SeekEntryResult!9127 0))(
  ( (MissingZero!9127 (index!38879 (_ BitVec 32))) (Found!9127 (index!38880 (_ BitVec 32))) (Intermediate!9127 (undefined!9939 Bool) (index!38881 (_ BitVec 32)) (x!82021 (_ BitVec 32))) (Undefined!9127) (MissingVacant!9127 (index!38882 (_ BitVec 32))) )
))
(declare-fun lt!430058 () SeekEntryResult!9127)

(declare-fun k0!2725 () (_ BitVec 64))

(declare-fun mask!4034 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57769 (_ BitVec 32)) SeekEntryResult!9127)

(assert (=> b!954270 (= lt!430058 (seekEntryOrOpen!0 k0!2725 a!3460 mask!4034))))

(declare-fun b!954267 () Bool)

(declare-fun res!638877 () Bool)

(assert (=> b!954267 (=> (not res!638877) (not e!537593))))

(assert (=> b!954267 (= res!638877 (= (size!28246 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(declare-fun b!954268 () Bool)

(declare-fun res!638874 () Bool)

(assert (=> b!954268 (=> (not res!638874) (not e!537593))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57769 (_ BitVec 32)) Bool)

(assert (=> b!954268 (= res!638874 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(declare-fun b!954269 () Bool)

(declare-fun res!638876 () Bool)

(assert (=> b!954269 (=> (not res!638876) (not e!537593))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954269 (= res!638876 (validKeyInArray!0 k0!2725))))

(declare-fun res!638875 () Bool)

(assert (=> start!81846 (=> (not res!638875) (not e!537593))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81846 (= res!638875 (validMask!0 mask!4034))))

(assert (=> start!81846 e!537593))

(assert (=> start!81846 true))

(declare-fun array_inv!21625 (array!57769) Bool)

(assert (=> start!81846 (array_inv!21625 a!3460)))

(assert (= (and start!81846 res!638875) b!954267))

(assert (= (and b!954267 res!638877) b!954268))

(assert (= (and b!954268 res!638874) b!954269))

(assert (= (and b!954269 res!638876) b!954270))

(declare-fun m!886727 () Bool)

(assert (=> b!954270 m!886727))

(declare-fun m!886729 () Bool)

(assert (=> b!954268 m!886729))

(declare-fun m!886731 () Bool)

(assert (=> b!954269 m!886731))

(declare-fun m!886733 () Bool)

(assert (=> start!81846 m!886733))

(declare-fun m!886735 () Bool)

(assert (=> start!81846 m!886735))

(check-sat (not b!954269) (not start!81846) (not b!954270) (not b!954268))
(check-sat)
