; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81856 () Bool)

(assert start!81856)

(declare-fun res!638936 () Bool)

(declare-fun e!537622 () Bool)

(assert (=> start!81856 (=> (not res!638936) (not e!537622))))

(declare-fun mask!4034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81856 (= res!638936 (validMask!0 mask!4034))))

(assert (=> start!81856 e!537622))

(assert (=> start!81856 true))

(declare-datatypes ((array!57779 0))(
  ( (array!57780 (arr!27771 (Array (_ BitVec 32) (_ BitVec 64))) (size!28251 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57779)

(declare-fun array_inv!21630 (array!57779) Bool)

(assert (=> start!81856 (array_inv!21630 a!3460)))

(declare-fun b!954328 () Bool)

(declare-fun res!638937 () Bool)

(assert (=> b!954328 (=> (not res!638937) (not e!537622))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57779 (_ BitVec 32)) Bool)

(assert (=> b!954328 (= res!638937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(declare-fun b!954329 () Bool)

(declare-fun res!638935 () Bool)

(assert (=> b!954329 (=> (not res!638935) (not e!537622))))

(declare-fun k!2725 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954329 (= res!638935 (validKeyInArray!0 k!2725))))

(declare-fun b!954330 () Bool)

(assert (=> b!954330 (= e!537622 false)))

(declare-datatypes ((SeekEntryResult!9132 0))(
  ( (MissingZero!9132 (index!38899 (_ BitVec 32))) (Found!9132 (index!38900 (_ BitVec 32))) (Intermediate!9132 (undefined!9944 Bool) (index!38901 (_ BitVec 32)) (x!82034 (_ BitVec 32))) (Undefined!9132) (MissingVacant!9132 (index!38902 (_ BitVec 32))) )
))
(declare-fun lt!430073 () SeekEntryResult!9132)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57779 (_ BitVec 32)) SeekEntryResult!9132)

(assert (=> b!954330 (= lt!430073 (seekEntryOrOpen!0 k!2725 a!3460 mask!4034))))

(declare-fun b!954327 () Bool)

(declare-fun res!638934 () Bool)

(assert (=> b!954327 (=> (not res!638934) (not e!537622))))

(assert (=> b!954327 (= res!638934 (= (size!28251 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(assert (= (and start!81856 res!638936) b!954327))

(assert (= (and b!954327 res!638934) b!954328))

(assert (= (and b!954328 res!638937) b!954329))

(assert (= (and b!954329 res!638935) b!954330))

(declare-fun m!886777 () Bool)

(assert (=> start!81856 m!886777))

(declare-fun m!886779 () Bool)

(assert (=> start!81856 m!886779))

(declare-fun m!886781 () Bool)

(assert (=> b!954328 m!886781))

(declare-fun m!886783 () Bool)

(assert (=> b!954329 m!886783))

(declare-fun m!886785 () Bool)

(assert (=> b!954330 m!886785))

(push 1)

(assert (not b!954330))

(assert (not b!954328))

(assert (not b!954329))

(assert (not start!81856))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

