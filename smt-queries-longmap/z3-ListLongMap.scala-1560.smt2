; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29652 () Bool)

(assert start!29652)

(declare-fun b!299152 () Bool)

(declare-fun e!188964 () Bool)

(declare-fun e!188967 () Bool)

(assert (=> b!299152 (= e!188964 e!188967)))

(declare-fun res!157722 () Bool)

(assert (=> b!299152 (=> (not res!157722) (not e!188967))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!148736 () Bool)

(declare-datatypes ((SeekEntryResult!2307 0))(
  ( (MissingZero!2307 (index!11401 (_ BitVec 32))) (Found!2307 (index!11402 (_ BitVec 32))) (Intermediate!2307 (undefined!3119 Bool) (index!11403 (_ BitVec 32)) (x!29642 (_ BitVec 32))) (Undefined!2307) (MissingVacant!2307 (index!11404 (_ BitVec 32))) )
))
(declare-fun lt!148737 () SeekEntryResult!2307)

(assert (=> b!299152 (= res!157722 (and (not lt!148736) (= lt!148737 (MissingVacant!2307 i!1256))))))

(declare-fun lt!148734 () SeekEntryResult!2307)

(declare-fun lt!148735 () (_ BitVec 32))

(declare-datatypes ((array!15116 0))(
  ( (array!15117 (arr!7158 (Array (_ BitVec 32) (_ BitVec 64))) (size!7510 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15116)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15116 (_ BitVec 32)) SeekEntryResult!2307)

(assert (=> b!299152 (= lt!148734 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148735 k0!2524 (array!15117 (store (arr!7158 a!3312) i!1256 k0!2524) (size!7510 a!3312)) mask!3809))))

(declare-fun lt!148740 () SeekEntryResult!2307)

(assert (=> b!299152 (= lt!148740 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148735 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!299152 (= lt!148735 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!299153 () Bool)

(declare-fun res!157718 () Bool)

(assert (=> b!299153 (=> (not res!157718) (not e!188964))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15116 (_ BitVec 32)) Bool)

(assert (=> b!299153 (= res!157718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!299154 () Bool)

(declare-fun e!188966 () Bool)

(assert (=> b!299154 (= e!188967 e!188966)))

(declare-fun res!157721 () Bool)

(assert (=> b!299154 (=> (not res!157721) (not e!188966))))

(declare-fun lt!148738 () Bool)

(assert (=> b!299154 (= res!157721 (and (or lt!148738 (not (undefined!3119 lt!148740))) (not lt!148738) (= (select (arr!7158 a!3312) (index!11403 lt!148740)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!299154 (= lt!148738 (not ((_ is Intermediate!2307) lt!148740)))))

(declare-fun b!299155 () Bool)

(declare-fun res!157715 () Bool)

(declare-fun e!188968 () Bool)

(assert (=> b!299155 (=> (not res!157715) (not e!188968))))

(declare-fun arrayContainsKey!0 (array!15116 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!299155 (= res!157715 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!157720 () Bool)

(assert (=> start!29652 (=> (not res!157720) (not e!188968))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29652 (= res!157720 (validMask!0 mask!3809))))

(assert (=> start!29652 e!188968))

(assert (=> start!29652 true))

(declare-fun array_inv!5121 (array!15116) Bool)

(assert (=> start!29652 (array_inv!5121 a!3312)))

(declare-fun b!299156 () Bool)

(assert (=> b!299156 (= e!188968 e!188964)))

(declare-fun res!157716 () Bool)

(assert (=> b!299156 (=> (not res!157716) (not e!188964))))

(assert (=> b!299156 (= res!157716 (or lt!148736 (= lt!148737 (MissingVacant!2307 i!1256))))))

(assert (=> b!299156 (= lt!148736 (= lt!148737 (MissingZero!2307 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15116 (_ BitVec 32)) SeekEntryResult!2307)

(assert (=> b!299156 (= lt!148737 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!299157 () Bool)

(assert (=> b!299157 (= e!188966 (not true))))

(declare-datatypes ((Unit!9325 0))(
  ( (Unit!9326) )
))
(declare-fun lt!148739 () Unit!9325)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!15116 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9325)

(assert (=> b!299157 (= lt!148739 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!148735 (index!11403 lt!148740) (x!29642 lt!148740) mask!3809))))

(assert (=> b!299157 (= (index!11403 lt!148740) i!1256)))

(declare-fun b!299158 () Bool)

(declare-fun res!157717 () Bool)

(assert (=> b!299158 (=> (not res!157717) (not e!188968))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!299158 (= res!157717 (validKeyInArray!0 k0!2524))))

(declare-fun b!299159 () Bool)

(declare-fun res!157719 () Bool)

(assert (=> b!299159 (=> (not res!157719) (not e!188968))))

(assert (=> b!299159 (= res!157719 (and (= (size!7510 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7510 a!3312))))))

(assert (= (and start!29652 res!157720) b!299159))

(assert (= (and b!299159 res!157719) b!299158))

(assert (= (and b!299158 res!157717) b!299155))

(assert (= (and b!299155 res!157715) b!299156))

(assert (= (and b!299156 res!157716) b!299153))

(assert (= (and b!299153 res!157718) b!299152))

(assert (= (and b!299152 res!157722) b!299154))

(assert (= (and b!299154 res!157721) b!299157))

(declare-fun m!311511 () Bool)

(assert (=> b!299157 m!311511))

(declare-fun m!311513 () Bool)

(assert (=> b!299158 m!311513))

(declare-fun m!311515 () Bool)

(assert (=> b!299156 m!311515))

(declare-fun m!311517 () Bool)

(assert (=> start!29652 m!311517))

(declare-fun m!311519 () Bool)

(assert (=> start!29652 m!311519))

(declare-fun m!311521 () Bool)

(assert (=> b!299152 m!311521))

(declare-fun m!311523 () Bool)

(assert (=> b!299152 m!311523))

(declare-fun m!311525 () Bool)

(assert (=> b!299152 m!311525))

(declare-fun m!311527 () Bool)

(assert (=> b!299152 m!311527))

(declare-fun m!311529 () Bool)

(assert (=> b!299155 m!311529))

(declare-fun m!311531 () Bool)

(assert (=> b!299154 m!311531))

(declare-fun m!311533 () Bool)

(assert (=> b!299153 m!311533))

(check-sat (not b!299157) (not b!299153) (not b!299156) (not b!299152) (not start!29652) (not b!299155) (not b!299158))
(check-sat)
