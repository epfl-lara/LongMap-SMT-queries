; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45036 () Bool)

(assert start!45036)

(declare-fun b!494095 () Bool)

(declare-fun e!289981 () Bool)

(assert (=> b!494095 (= e!289981 true)))

(declare-datatypes ((SeekEntryResult!3844 0))(
  ( (MissingZero!3844 (index!17555 (_ BitVec 32))) (Found!3844 (index!17556 (_ BitVec 32))) (Intermediate!3844 (undefined!4656 Bool) (index!17557 (_ BitVec 32)) (x!46637 (_ BitVec 32))) (Undefined!3844) (MissingVacant!3844 (index!17558 (_ BitVec 32))) )
))
(declare-fun lt!223496 () SeekEntryResult!3844)

(assert (=> b!494095 (= lt!223496 Undefined!3844)))

(declare-fun b!494096 () Bool)

(declare-fun res!296812 () Bool)

(declare-fun e!289983 () Bool)

(assert (=> b!494096 (=> (not res!296812) (not e!289983))))

(declare-datatypes ((array!31991 0))(
  ( (array!31992 (arr!15380 (Array (_ BitVec 32) (_ BitVec 64))) (size!15745 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31991)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494096 (= res!296812 (validKeyInArray!0 (select (arr!15380 a!3235) j!176)))))

(declare-fun b!494098 () Bool)

(declare-fun res!296811 () Bool)

(declare-fun e!289980 () Bool)

(assert (=> b!494098 (=> (not res!296811) (not e!289980))))

(declare-datatypes ((List!9577 0))(
  ( (Nil!9574) (Cons!9573 (h!10441 (_ BitVec 64)) (t!15796 List!9577)) )
))
(declare-fun arrayNoDuplicates!0 (array!31991 (_ BitVec 32) List!9577) Bool)

(assert (=> b!494098 (= res!296811 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9574))))

(declare-fun b!494099 () Bool)

(declare-fun res!296810 () Bool)

(assert (=> b!494099 (=> (not res!296810) (not e!289983))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!494099 (= res!296810 (and (= (size!15745 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15745 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15745 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494100 () Bool)

(declare-fun res!296807 () Bool)

(assert (=> b!494100 (=> (not res!296807) (not e!289980))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31991 (_ BitVec 32)) Bool)

(assert (=> b!494100 (= res!296807 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494101 () Bool)

(assert (=> b!494101 (= e!289983 e!289980)))

(declare-fun res!296814 () Bool)

(assert (=> b!494101 (=> (not res!296814) (not e!289980))))

(declare-fun lt!223497 () SeekEntryResult!3844)

(assert (=> b!494101 (= res!296814 (or (= lt!223497 (MissingZero!3844 i!1204)) (= lt!223497 (MissingVacant!3844 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31991 (_ BitVec 32)) SeekEntryResult!3844)

(assert (=> b!494101 (= lt!223497 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!494102 () Bool)

(declare-fun res!296816 () Bool)

(assert (=> b!494102 (=> res!296816 e!289981)))

(declare-fun lt!223493 () SeekEntryResult!3844)

(get-info :version)

(assert (=> b!494102 (= res!296816 (or (not ((_ is Intermediate!3844) lt!223493)) (not (undefined!4656 lt!223493))))))

(declare-fun b!494103 () Bool)

(declare-fun res!296813 () Bool)

(assert (=> b!494103 (=> (not res!296813) (not e!289983))))

(assert (=> b!494103 (= res!296813 (validKeyInArray!0 k0!2280))))

(declare-fun b!494104 () Bool)

(assert (=> b!494104 (= e!289980 (not e!289981))))

(declare-fun res!296815 () Bool)

(assert (=> b!494104 (=> res!296815 e!289981)))

(declare-fun lt!223494 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31991 (_ BitVec 32)) SeekEntryResult!3844)

(assert (=> b!494104 (= res!296815 (= lt!223493 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223494 (select (store (arr!15380 a!3235) i!1204 k0!2280) j!176) (array!31992 (store (arr!15380 a!3235) i!1204 k0!2280) (size!15745 a!3235)) mask!3524)))))

(declare-fun lt!223495 () (_ BitVec 32))

(assert (=> b!494104 (= lt!223493 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223495 (select (arr!15380 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494104 (= lt!223494 (toIndex!0 (select (store (arr!15380 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!494104 (= lt!223495 (toIndex!0 (select (arr!15380 a!3235) j!176) mask!3524))))

(assert (=> b!494104 (= lt!223496 (Found!3844 j!176))))

(assert (=> b!494104 (= lt!223496 (seekEntryOrOpen!0 (select (arr!15380 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!494104 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14620 0))(
  ( (Unit!14621) )
))
(declare-fun lt!223498 () Unit!14620)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31991 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14620)

(assert (=> b!494104 (= lt!223498 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!296808 () Bool)

(assert (=> start!45036 (=> (not res!296808) (not e!289983))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45036 (= res!296808 (validMask!0 mask!3524))))

(assert (=> start!45036 e!289983))

(assert (=> start!45036 true))

(declare-fun array_inv!11263 (array!31991) Bool)

(assert (=> start!45036 (array_inv!11263 a!3235)))

(declare-fun b!494097 () Bool)

(declare-fun res!296809 () Bool)

(assert (=> b!494097 (=> (not res!296809) (not e!289983))))

(declare-fun arrayContainsKey!0 (array!31991 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494097 (= res!296809 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45036 res!296808) b!494099))

(assert (= (and b!494099 res!296810) b!494096))

(assert (= (and b!494096 res!296812) b!494103))

(assert (= (and b!494103 res!296813) b!494097))

(assert (= (and b!494097 res!296809) b!494101))

(assert (= (and b!494101 res!296814) b!494100))

(assert (= (and b!494100 res!296807) b!494098))

(assert (= (and b!494098 res!296811) b!494104))

(assert (= (and b!494104 (not res!296815)) b!494102))

(assert (= (and b!494102 (not res!296816)) b!494095))

(declare-fun m!474643 () Bool)

(assert (=> b!494100 m!474643))

(declare-fun m!474645 () Bool)

(assert (=> b!494097 m!474645))

(declare-fun m!474647 () Bool)

(assert (=> b!494098 m!474647))

(declare-fun m!474649 () Bool)

(assert (=> b!494101 m!474649))

(declare-fun m!474651 () Bool)

(assert (=> b!494096 m!474651))

(assert (=> b!494096 m!474651))

(declare-fun m!474653 () Bool)

(assert (=> b!494096 m!474653))

(declare-fun m!474655 () Bool)

(assert (=> b!494103 m!474655))

(declare-fun m!474657 () Bool)

(assert (=> start!45036 m!474657))

(declare-fun m!474659 () Bool)

(assert (=> start!45036 m!474659))

(assert (=> b!494104 m!474651))

(declare-fun m!474661 () Bool)

(assert (=> b!494104 m!474661))

(declare-fun m!474663 () Bool)

(assert (=> b!494104 m!474663))

(declare-fun m!474665 () Bool)

(assert (=> b!494104 m!474665))

(declare-fun m!474667 () Bool)

(assert (=> b!494104 m!474667))

(assert (=> b!494104 m!474651))

(declare-fun m!474669 () Bool)

(assert (=> b!494104 m!474669))

(assert (=> b!494104 m!474651))

(declare-fun m!474671 () Bool)

(assert (=> b!494104 m!474671))

(assert (=> b!494104 m!474651))

(declare-fun m!474673 () Bool)

(assert (=> b!494104 m!474673))

(assert (=> b!494104 m!474667))

(declare-fun m!474675 () Bool)

(assert (=> b!494104 m!474675))

(assert (=> b!494104 m!474667))

(declare-fun m!474677 () Bool)

(assert (=> b!494104 m!474677))

(check-sat (not b!494098) (not b!494097) (not b!494100) (not b!494096) (not b!494103) (not b!494101) (not b!494104) (not start!45036))
(check-sat)
