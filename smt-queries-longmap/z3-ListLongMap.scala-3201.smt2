; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44940 () Bool)

(assert start!44940)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31895 0))(
  ( (array!31896 (arr!15332 (Array (_ BitVec 32) (_ BitVec 64))) (size!15697 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31895)

(declare-fun b!492689 () Bool)

(declare-fun e!289395 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3796 0))(
  ( (MissingZero!3796 (index!17363 (_ BitVec 32))) (Found!3796 (index!17364 (_ BitVec 32))) (Intermediate!3796 (undefined!4608 Bool) (index!17365 (_ BitVec 32)) (x!46461 (_ BitVec 32))) (Undefined!3796) (MissingVacant!3796 (index!17366 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31895 (_ BitVec 32)) SeekEntryResult!3796)

(assert (=> b!492689 (= e!289395 (= (seekEntryOrOpen!0 (select (arr!15332 a!3235) j!176) a!3235 mask!3524) (Found!3796 j!176)))))

(declare-fun b!492690 () Bool)

(declare-fun e!289396 () Bool)

(declare-fun e!289398 () Bool)

(assert (=> b!492690 (= e!289396 e!289398)))

(declare-fun res!295407 () Bool)

(assert (=> b!492690 (=> (not res!295407) (not e!289398))))

(declare-fun lt!222642 () SeekEntryResult!3796)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!492690 (= res!295407 (or (= lt!222642 (MissingZero!3796 i!1204)) (= lt!222642 (MissingVacant!3796 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!492690 (= lt!222642 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!492691 () Bool)

(declare-fun res!295402 () Bool)

(assert (=> b!492691 (=> (not res!295402) (not e!289396))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!492691 (= res!295402 (validKeyInArray!0 k0!2280))))

(declare-fun b!492692 () Bool)

(assert (=> b!492692 (= e!289398 (not true))))

(declare-fun lt!222639 () SeekEntryResult!3796)

(declare-fun lt!222641 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31895 (_ BitVec 32)) SeekEntryResult!3796)

(assert (=> b!492692 (= lt!222639 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222641 (select (store (arr!15332 a!3235) i!1204 k0!2280) j!176) (array!31896 (store (arr!15332 a!3235) i!1204 k0!2280) (size!15697 a!3235)) mask!3524))))

(declare-fun lt!222643 () (_ BitVec 32))

(declare-fun lt!222638 () SeekEntryResult!3796)

(assert (=> b!492692 (= lt!222638 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222643 (select (arr!15332 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492692 (= lt!222641 (toIndex!0 (select (store (arr!15332 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!492692 (= lt!222643 (toIndex!0 (select (arr!15332 a!3235) j!176) mask!3524))))

(assert (=> b!492692 e!289395))

(declare-fun res!295405 () Bool)

(assert (=> b!492692 (=> (not res!295405) (not e!289395))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31895 (_ BitVec 32)) Bool)

(assert (=> b!492692 (= res!295405 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14524 0))(
  ( (Unit!14525) )
))
(declare-fun lt!222640 () Unit!14524)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31895 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14524)

(assert (=> b!492692 (= lt!222640 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!492693 () Bool)

(declare-fun res!295401 () Bool)

(assert (=> b!492693 (=> (not res!295401) (not e!289396))))

(assert (=> b!492693 (= res!295401 (and (= (size!15697 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15697 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15697 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!295404 () Bool)

(assert (=> start!44940 (=> (not res!295404) (not e!289396))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44940 (= res!295404 (validMask!0 mask!3524))))

(assert (=> start!44940 e!289396))

(assert (=> start!44940 true))

(declare-fun array_inv!11215 (array!31895) Bool)

(assert (=> start!44940 (array_inv!11215 a!3235)))

(declare-fun b!492694 () Bool)

(declare-fun res!295409 () Bool)

(assert (=> b!492694 (=> (not res!295409) (not e!289396))))

(declare-fun arrayContainsKey!0 (array!31895 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!492694 (= res!295409 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!492695 () Bool)

(declare-fun res!295408 () Bool)

(assert (=> b!492695 (=> (not res!295408) (not e!289398))))

(assert (=> b!492695 (= res!295408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!492696 () Bool)

(declare-fun res!295406 () Bool)

(assert (=> b!492696 (=> (not res!295406) (not e!289396))))

(assert (=> b!492696 (= res!295406 (validKeyInArray!0 (select (arr!15332 a!3235) j!176)))))

(declare-fun b!492697 () Bool)

(declare-fun res!295403 () Bool)

(assert (=> b!492697 (=> (not res!295403) (not e!289398))))

(declare-datatypes ((List!9529 0))(
  ( (Nil!9526) (Cons!9525 (h!10393 (_ BitVec 64)) (t!15748 List!9529)) )
))
(declare-fun arrayNoDuplicates!0 (array!31895 (_ BitVec 32) List!9529) Bool)

(assert (=> b!492697 (= res!295403 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9526))))

(assert (= (and start!44940 res!295404) b!492693))

(assert (= (and b!492693 res!295401) b!492696))

(assert (= (and b!492696 res!295406) b!492691))

(assert (= (and b!492691 res!295402) b!492694))

(assert (= (and b!492694 res!295409) b!492690))

(assert (= (and b!492690 res!295407) b!492695))

(assert (= (and b!492695 res!295408) b!492697))

(assert (= (and b!492697 res!295403) b!492692))

(assert (= (and b!492692 res!295405) b!492689))

(declare-fun m!472915 () Bool)

(assert (=> start!44940 m!472915))

(declare-fun m!472917 () Bool)

(assert (=> start!44940 m!472917))

(declare-fun m!472919 () Bool)

(assert (=> b!492692 m!472919))

(declare-fun m!472921 () Bool)

(assert (=> b!492692 m!472921))

(declare-fun m!472923 () Bool)

(assert (=> b!492692 m!472923))

(declare-fun m!472925 () Bool)

(assert (=> b!492692 m!472925))

(assert (=> b!492692 m!472923))

(declare-fun m!472927 () Bool)

(assert (=> b!492692 m!472927))

(assert (=> b!492692 m!472923))

(declare-fun m!472929 () Bool)

(assert (=> b!492692 m!472929))

(declare-fun m!472931 () Bool)

(assert (=> b!492692 m!472931))

(declare-fun m!472933 () Bool)

(assert (=> b!492692 m!472933))

(assert (=> b!492692 m!472931))

(declare-fun m!472935 () Bool)

(assert (=> b!492692 m!472935))

(assert (=> b!492692 m!472931))

(assert (=> b!492696 m!472923))

(assert (=> b!492696 m!472923))

(declare-fun m!472937 () Bool)

(assert (=> b!492696 m!472937))

(declare-fun m!472939 () Bool)

(assert (=> b!492690 m!472939))

(declare-fun m!472941 () Bool)

(assert (=> b!492695 m!472941))

(declare-fun m!472943 () Bool)

(assert (=> b!492694 m!472943))

(declare-fun m!472945 () Bool)

(assert (=> b!492697 m!472945))

(declare-fun m!472947 () Bool)

(assert (=> b!492691 m!472947))

(assert (=> b!492689 m!472923))

(assert (=> b!492689 m!472923))

(declare-fun m!472949 () Bool)

(assert (=> b!492689 m!472949))

(check-sat (not b!492694) (not b!492692) (not b!492695) (not start!44940) (not b!492696) (not b!492697) (not b!492691) (not b!492689) (not b!492690))
(check-sat)
