; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44364 () Bool)

(assert start!44364)

(declare-fun b!487445 () Bool)

(declare-fun res!290865 () Bool)

(declare-fun e!286782 () Bool)

(assert (=> b!487445 (=> (not res!290865) (not e!286782))))

(declare-datatypes ((array!31580 0))(
  ( (array!31581 (arr!15182 (Array (_ BitVec 32) (_ BitVec 64))) (size!15547 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31580)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31580 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487445 (= res!290865 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!487446 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!286785 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3646 0))(
  ( (MissingZero!3646 (index!16763 (_ BitVec 32))) (Found!3646 (index!16764 (_ BitVec 32))) (Intermediate!3646 (undefined!4458 Bool) (index!16765 (_ BitVec 32)) (x!45893 (_ BitVec 32))) (Undefined!3646) (MissingVacant!3646 (index!16766 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31580 (_ BitVec 32)) SeekEntryResult!3646)

(assert (=> b!487446 (= e!286785 (= (seekEntryOrOpen!0 (select (arr!15182 a!3235) j!176) a!3235 mask!3524) (Found!3646 j!176)))))

(declare-fun b!487447 () Bool)

(declare-fun res!290866 () Bool)

(assert (=> b!487447 (=> (not res!290866) (not e!286782))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!487447 (= res!290866 (and (= (size!15547 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15547 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15547 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!487448 () Bool)

(declare-fun res!290867 () Bool)

(declare-fun e!286784 () Bool)

(assert (=> b!487448 (=> (not res!290867) (not e!286784))))

(declare-datatypes ((List!9379 0))(
  ( (Nil!9376) (Cons!9375 (h!10231 (_ BitVec 64)) (t!15598 List!9379)) )
))
(declare-fun arrayNoDuplicates!0 (array!31580 (_ BitVec 32) List!9379) Bool)

(assert (=> b!487448 (= res!290867 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9376))))

(declare-fun res!290860 () Bool)

(assert (=> start!44364 (=> (not res!290860) (not e!286782))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44364 (= res!290860 (validMask!0 mask!3524))))

(assert (=> start!44364 e!286782))

(assert (=> start!44364 true))

(declare-fun array_inv!11065 (array!31580) Bool)

(assert (=> start!44364 (array_inv!11065 a!3235)))

(declare-fun b!487449 () Bool)

(declare-fun res!290864 () Bool)

(assert (=> b!487449 (=> (not res!290864) (not e!286782))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487449 (= res!290864 (validKeyInArray!0 k0!2280))))

(declare-fun b!487450 () Bool)

(assert (=> b!487450 (= e!286782 e!286784)))

(declare-fun res!290863 () Bool)

(assert (=> b!487450 (=> (not res!290863) (not e!286784))))

(declare-fun lt!219899 () SeekEntryResult!3646)

(assert (=> b!487450 (= res!290863 (or (= lt!219899 (MissingZero!3646 i!1204)) (= lt!219899 (MissingVacant!3646 i!1204))))))

(assert (=> b!487450 (= lt!219899 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!487451 () Bool)

(declare-fun res!290859 () Bool)

(assert (=> b!487451 (=> (not res!290859) (not e!286784))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31580 (_ BitVec 32)) Bool)

(assert (=> b!487451 (= res!290859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!487452 () Bool)

(assert (=> b!487452 (= e!286784 (not (bvsge mask!3524 #b00000000000000000000000000000000)))))

(declare-fun lt!219901 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!487452 (= lt!219901 (toIndex!0 (select (arr!15182 a!3235) j!176) mask!3524))))

(assert (=> b!487452 e!286785))

(declare-fun res!290862 () Bool)

(assert (=> b!487452 (=> (not res!290862) (not e!286785))))

(assert (=> b!487452 (= res!290862 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14224 0))(
  ( (Unit!14225) )
))
(declare-fun lt!219900 () Unit!14224)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31580 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14224)

(assert (=> b!487452 (= lt!219900 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487453 () Bool)

(declare-fun res!290861 () Bool)

(assert (=> b!487453 (=> (not res!290861) (not e!286782))))

(assert (=> b!487453 (= res!290861 (validKeyInArray!0 (select (arr!15182 a!3235) j!176)))))

(assert (= (and start!44364 res!290860) b!487447))

(assert (= (and b!487447 res!290866) b!487453))

(assert (= (and b!487453 res!290861) b!487449))

(assert (= (and b!487449 res!290864) b!487445))

(assert (= (and b!487445 res!290865) b!487450))

(assert (= (and b!487450 res!290863) b!487451))

(assert (= (and b!487451 res!290859) b!487448))

(assert (= (and b!487448 res!290867) b!487452))

(assert (= (and b!487452 res!290862) b!487446))

(declare-fun m!466753 () Bool)

(assert (=> b!487450 m!466753))

(declare-fun m!466755 () Bool)

(assert (=> start!44364 m!466755))

(declare-fun m!466757 () Bool)

(assert (=> start!44364 m!466757))

(declare-fun m!466759 () Bool)

(assert (=> b!487452 m!466759))

(assert (=> b!487452 m!466759))

(declare-fun m!466761 () Bool)

(assert (=> b!487452 m!466761))

(declare-fun m!466763 () Bool)

(assert (=> b!487452 m!466763))

(declare-fun m!466765 () Bool)

(assert (=> b!487452 m!466765))

(declare-fun m!466767 () Bool)

(assert (=> b!487448 m!466767))

(declare-fun m!466769 () Bool)

(assert (=> b!487449 m!466769))

(assert (=> b!487446 m!466759))

(assert (=> b!487446 m!466759))

(declare-fun m!466771 () Bool)

(assert (=> b!487446 m!466771))

(declare-fun m!466773 () Bool)

(assert (=> b!487445 m!466773))

(declare-fun m!466775 () Bool)

(assert (=> b!487451 m!466775))

(assert (=> b!487453 m!466759))

(assert (=> b!487453 m!466759))

(declare-fun m!466777 () Bool)

(assert (=> b!487453 m!466777))

(check-sat (not b!487450) (not b!487453) (not b!487452) (not b!487448) (not b!487449) (not b!487445) (not b!487451) (not start!44364) (not b!487446))
(check-sat)
