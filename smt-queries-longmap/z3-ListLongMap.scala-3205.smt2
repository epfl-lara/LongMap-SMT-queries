; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44964 () Bool)

(assert start!44964)

(declare-fun b!493022 () Bool)

(declare-fun res!295742 () Bool)

(declare-fun e!289550 () Bool)

(assert (=> b!493022 (=> (not res!295742) (not e!289550))))

(declare-datatypes ((array!31919 0))(
  ( (array!31920 (arr!15344 (Array (_ BitVec 32) (_ BitVec 64))) (size!15709 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31919)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31919 (_ BitVec 32)) Bool)

(assert (=> b!493022 (= res!295742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!295736 () Bool)

(declare-fun e!289551 () Bool)

(assert (=> start!44964 (=> (not res!295736) (not e!289551))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44964 (= res!295736 (validMask!0 mask!3524))))

(assert (=> start!44964 e!289551))

(assert (=> start!44964 true))

(declare-fun array_inv!11227 (array!31919) Bool)

(assert (=> start!44964 (array_inv!11227 a!3235)))

(declare-fun b!493023 () Bool)

(assert (=> b!493023 (= e!289550 (not true))))

(declare-fun lt!222845 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3808 0))(
  ( (MissingZero!3808 (index!17411 (_ BitVec 32))) (Found!3808 (index!17412 (_ BitVec 32))) (Intermediate!3808 (undefined!4620 Bool) (index!17413 (_ BitVec 32)) (x!46505 (_ BitVec 32))) (Undefined!3808) (MissingVacant!3808 (index!17414 (_ BitVec 32))) )
))
(declare-fun lt!222846 () SeekEntryResult!3808)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31919 (_ BitVec 32)) SeekEntryResult!3808)

(assert (=> b!493023 (= lt!222846 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222845 (select (store (arr!15344 a!3235) i!1204 k0!2280) j!176) (array!31920 (store (arr!15344 a!3235) i!1204 k0!2280) (size!15709 a!3235)) mask!3524))))

(declare-fun lt!222847 () (_ BitVec 32))

(declare-fun lt!222850 () SeekEntryResult!3808)

(assert (=> b!493023 (= lt!222850 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222847 (select (arr!15344 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493023 (= lt!222845 (toIndex!0 (select (store (arr!15344 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!493023 (= lt!222847 (toIndex!0 (select (arr!15344 a!3235) j!176) mask!3524))))

(declare-fun e!289549 () Bool)

(assert (=> b!493023 e!289549))

(declare-fun res!295737 () Bool)

(assert (=> b!493023 (=> (not res!295737) (not e!289549))))

(assert (=> b!493023 (= res!295737 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14548 0))(
  ( (Unit!14549) )
))
(declare-fun lt!222849 () Unit!14548)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31919 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14548)

(assert (=> b!493023 (= lt!222849 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493024 () Bool)

(declare-fun res!295740 () Bool)

(assert (=> b!493024 (=> (not res!295740) (not e!289551))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493024 (= res!295740 (validKeyInArray!0 (select (arr!15344 a!3235) j!176)))))

(declare-fun b!493025 () Bool)

(declare-fun res!295739 () Bool)

(assert (=> b!493025 (=> (not res!295739) (not e!289551))))

(declare-fun arrayContainsKey!0 (array!31919 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493025 (= res!295739 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493026 () Bool)

(assert (=> b!493026 (= e!289551 e!289550)))

(declare-fun res!295738 () Bool)

(assert (=> b!493026 (=> (not res!295738) (not e!289550))))

(declare-fun lt!222848 () SeekEntryResult!3808)

(assert (=> b!493026 (= res!295738 (or (= lt!222848 (MissingZero!3808 i!1204)) (= lt!222848 (MissingVacant!3808 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31919 (_ BitVec 32)) SeekEntryResult!3808)

(assert (=> b!493026 (= lt!222848 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!493027 () Bool)

(assert (=> b!493027 (= e!289549 (= (seekEntryOrOpen!0 (select (arr!15344 a!3235) j!176) a!3235 mask!3524) (Found!3808 j!176)))))

(declare-fun b!493028 () Bool)

(declare-fun res!295741 () Bool)

(assert (=> b!493028 (=> (not res!295741) (not e!289551))))

(assert (=> b!493028 (= res!295741 (validKeyInArray!0 k0!2280))))

(declare-fun b!493029 () Bool)

(declare-fun res!295734 () Bool)

(assert (=> b!493029 (=> (not res!295734) (not e!289550))))

(declare-datatypes ((List!9541 0))(
  ( (Nil!9538) (Cons!9537 (h!10405 (_ BitVec 64)) (t!15760 List!9541)) )
))
(declare-fun arrayNoDuplicates!0 (array!31919 (_ BitVec 32) List!9541) Bool)

(assert (=> b!493029 (= res!295734 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9538))))

(declare-fun b!493030 () Bool)

(declare-fun res!295735 () Bool)

(assert (=> b!493030 (=> (not res!295735) (not e!289551))))

(assert (=> b!493030 (= res!295735 (and (= (size!15709 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15709 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15709 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44964 res!295736) b!493030))

(assert (= (and b!493030 res!295735) b!493024))

(assert (= (and b!493024 res!295740) b!493028))

(assert (= (and b!493028 res!295741) b!493025))

(assert (= (and b!493025 res!295739) b!493026))

(assert (= (and b!493026 res!295738) b!493022))

(assert (= (and b!493022 res!295742) b!493029))

(assert (= (and b!493029 res!295734) b!493023))

(assert (= (and b!493023 res!295737) b!493027))

(declare-fun m!473347 () Bool)

(assert (=> b!493027 m!473347))

(assert (=> b!493027 m!473347))

(declare-fun m!473349 () Bool)

(assert (=> b!493027 m!473349))

(declare-fun m!473351 () Bool)

(assert (=> b!493026 m!473351))

(declare-fun m!473353 () Bool)

(assert (=> b!493025 m!473353))

(assert (=> b!493024 m!473347))

(assert (=> b!493024 m!473347))

(declare-fun m!473355 () Bool)

(assert (=> b!493024 m!473355))

(declare-fun m!473357 () Bool)

(assert (=> b!493022 m!473357))

(declare-fun m!473359 () Bool)

(assert (=> start!44964 m!473359))

(declare-fun m!473361 () Bool)

(assert (=> start!44964 m!473361))

(declare-fun m!473363 () Bool)

(assert (=> b!493028 m!473363))

(declare-fun m!473365 () Bool)

(assert (=> b!493029 m!473365))

(declare-fun m!473367 () Bool)

(assert (=> b!493023 m!473367))

(declare-fun m!473369 () Bool)

(assert (=> b!493023 m!473369))

(declare-fun m!473371 () Bool)

(assert (=> b!493023 m!473371))

(assert (=> b!493023 m!473347))

(declare-fun m!473373 () Bool)

(assert (=> b!493023 m!473373))

(assert (=> b!493023 m!473347))

(declare-fun m!473375 () Bool)

(assert (=> b!493023 m!473375))

(assert (=> b!493023 m!473371))

(declare-fun m!473377 () Bool)

(assert (=> b!493023 m!473377))

(assert (=> b!493023 m!473371))

(declare-fun m!473379 () Bool)

(assert (=> b!493023 m!473379))

(assert (=> b!493023 m!473347))

(declare-fun m!473381 () Bool)

(assert (=> b!493023 m!473381))

(check-sat (not b!493022) (not b!493025) (not b!493029) (not b!493027) (not b!493023) (not b!493028) (not start!44964) (not b!493024) (not b!493026))
(check-sat)
