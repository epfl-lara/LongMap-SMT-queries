; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28178 () Bool)

(assert start!28178)

(declare-fun b!288493 () Bool)

(declare-fun res!150122 () Bool)

(declare-fun e!182662 () Bool)

(assert (=> b!288493 (=> (not res!150122) (not e!182662))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14492 0))(
  ( (array!14493 (arr!6873 (Array (_ BitVec 32) (_ BitVec 64))) (size!7225 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14492)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!288493 (= res!150122 (and (= (size!7225 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7225 a!3312))))))

(declare-fun b!288495 () Bool)

(declare-fun e!182660 () Bool)

(assert (=> b!288495 (= e!182662 e!182660)))

(declare-fun res!150118 () Bool)

(assert (=> b!288495 (=> (not res!150118) (not e!182660))))

(declare-fun lt!142125 () Bool)

(declare-datatypes ((SeekEntryResult!2022 0))(
  ( (MissingZero!2022 (index!10258 (_ BitVec 32))) (Found!2022 (index!10259 (_ BitVec 32))) (Intermediate!2022 (undefined!2834 Bool) (index!10260 (_ BitVec 32)) (x!28475 (_ BitVec 32))) (Undefined!2022) (MissingVacant!2022 (index!10261 (_ BitVec 32))) )
))
(declare-fun lt!142121 () SeekEntryResult!2022)

(assert (=> b!288495 (= res!150118 (or lt!142125 (= lt!142121 (MissingVacant!2022 i!1256))))))

(assert (=> b!288495 (= lt!142125 (= lt!142121 (MissingZero!2022 i!1256)))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14492 (_ BitVec 32)) SeekEntryResult!2022)

(assert (=> b!288495 (= lt!142121 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!288496 () Bool)

(declare-fun res!150120 () Bool)

(assert (=> b!288496 (=> (not res!150120) (not e!182662))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288496 (= res!150120 (validKeyInArray!0 k0!2524))))

(declare-fun b!288497 () Bool)

(declare-fun e!182659 () Bool)

(assert (=> b!288497 (= e!182660 e!182659)))

(declare-fun res!150117 () Bool)

(assert (=> b!288497 (=> (not res!150117) (not e!182659))))

(assert (=> b!288497 (= res!150117 lt!142125)))

(declare-fun lt!142122 () SeekEntryResult!2022)

(declare-fun lt!142126 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14492 (_ BitVec 32)) SeekEntryResult!2022)

(assert (=> b!288497 (= lt!142122 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142126 k0!2524 (array!14493 (store (arr!6873 a!3312) i!1256 k0!2524) (size!7225 a!3312)) mask!3809))))

(declare-fun lt!142123 () SeekEntryResult!2022)

(assert (=> b!288497 (= lt!142123 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142126 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288497 (= lt!142126 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!288498 () Bool)

(declare-fun e!182663 () Bool)

(assert (=> b!288498 (= e!182659 e!182663)))

(declare-fun res!150119 () Bool)

(assert (=> b!288498 (=> (not res!150119) (not e!182663))))

(declare-fun lt!142124 () Bool)

(assert (=> b!288498 (= res!150119 (and (or lt!142124 (not (undefined!2834 lt!142123))) (or lt!142124 (not (= (select (arr!6873 a!3312) (index!10260 lt!142123)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142124 (not (= (select (arr!6873 a!3312) (index!10260 lt!142123)) k0!2524))) (not lt!142124)))))

(get-info :version)

(assert (=> b!288498 (= lt!142124 (not ((_ is Intermediate!2022) lt!142123)))))

(declare-fun b!288499 () Bool)

(declare-fun res!150116 () Bool)

(assert (=> b!288499 (=> (not res!150116) (not e!182662))))

(declare-fun arrayContainsKey!0 (array!14492 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288499 (= res!150116 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288500 () Bool)

(declare-fun res!150121 () Bool)

(assert (=> b!288500 (=> (not res!150121) (not e!182660))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14492 (_ BitVec 32)) Bool)

(assert (=> b!288500 (= res!150121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!288494 () Bool)

(assert (=> b!288494 (= e!182663 (not true))))

(assert (=> b!288494 (and (= (select (arr!6873 a!3312) (index!10260 lt!142123)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10260 lt!142123) i!1256))))

(declare-fun res!150123 () Bool)

(assert (=> start!28178 (=> (not res!150123) (not e!182662))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28178 (= res!150123 (validMask!0 mask!3809))))

(assert (=> start!28178 e!182662))

(assert (=> start!28178 true))

(declare-fun array_inv!4836 (array!14492) Bool)

(assert (=> start!28178 (array_inv!4836 a!3312)))

(assert (= (and start!28178 res!150123) b!288493))

(assert (= (and b!288493 res!150122) b!288496))

(assert (= (and b!288496 res!150120) b!288499))

(assert (= (and b!288499 res!150116) b!288495))

(assert (= (and b!288495 res!150118) b!288500))

(assert (= (and b!288500 res!150121) b!288497))

(assert (= (and b!288497 res!150117) b!288498))

(assert (= (and b!288498 res!150119) b!288494))

(declare-fun m!302719 () Bool)

(assert (=> b!288494 m!302719))

(declare-fun m!302721 () Bool)

(assert (=> b!288495 m!302721))

(declare-fun m!302723 () Bool)

(assert (=> b!288497 m!302723))

(declare-fun m!302725 () Bool)

(assert (=> b!288497 m!302725))

(declare-fun m!302727 () Bool)

(assert (=> b!288497 m!302727))

(declare-fun m!302729 () Bool)

(assert (=> b!288497 m!302729))

(declare-fun m!302731 () Bool)

(assert (=> b!288496 m!302731))

(declare-fun m!302733 () Bool)

(assert (=> b!288500 m!302733))

(declare-fun m!302735 () Bool)

(assert (=> start!28178 m!302735))

(declare-fun m!302737 () Bool)

(assert (=> start!28178 m!302737))

(declare-fun m!302739 () Bool)

(assert (=> b!288499 m!302739))

(assert (=> b!288498 m!302719))

(check-sat (not b!288499) (not b!288496) (not b!288497) (not start!28178) (not b!288495) (not b!288500))
(check-sat)
