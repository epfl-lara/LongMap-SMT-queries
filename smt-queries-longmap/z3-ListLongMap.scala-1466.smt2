; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28178 () Bool)

(assert start!28178)

(declare-fun b!288394 () Bool)

(declare-fun res!150072 () Bool)

(declare-fun e!182589 () Bool)

(assert (=> b!288394 (=> (not res!150072) (not e!182589))))

(declare-datatypes ((array!14485 0))(
  ( (array!14486 (arr!6870 (Array (_ BitVec 32) (_ BitVec 64))) (size!7223 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14485)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14485 (_ BitVec 32)) Bool)

(assert (=> b!288394 (= res!150072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!288395 () Bool)

(declare-fun res!150069 () Bool)

(declare-fun e!182590 () Bool)

(assert (=> b!288395 (=> (not res!150069) (not e!182590))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14485 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288395 (= res!150069 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!150076 () Bool)

(assert (=> start!28178 (=> (not res!150076) (not e!182590))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28178 (= res!150076 (validMask!0 mask!3809))))

(assert (=> start!28178 e!182590))

(assert (=> start!28178 true))

(declare-fun array_inv!4842 (array!14485) Bool)

(assert (=> start!28178 (array_inv!4842 a!3312)))

(declare-fun b!288396 () Bool)

(declare-fun res!150071 () Bool)

(assert (=> b!288396 (=> (not res!150071) (not e!182590))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!288396 (= res!150071 (and (= (size!7223 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7223 a!3312))))))

(declare-fun b!288397 () Bool)

(declare-fun res!150070 () Bool)

(assert (=> b!288397 (=> (not res!150070) (not e!182590))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288397 (= res!150070 (validKeyInArray!0 k0!2524))))

(declare-fun b!288398 () Bool)

(declare-fun e!182588 () Bool)

(assert (=> b!288398 (= e!182588 (not true))))

(declare-datatypes ((SeekEntryResult!2018 0))(
  ( (MissingZero!2018 (index!10242 (_ BitVec 32))) (Found!2018 (index!10243 (_ BitVec 32))) (Intermediate!2018 (undefined!2830 Bool) (index!10244 (_ BitVec 32)) (x!28478 (_ BitVec 32))) (Undefined!2018) (MissingVacant!2018 (index!10245 (_ BitVec 32))) )
))
(declare-fun lt!141977 () SeekEntryResult!2018)

(assert (=> b!288398 (and (= (select (arr!6870 a!3312) (index!10244 lt!141977)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10244 lt!141977) i!1256))))

(declare-fun b!288399 () Bool)

(declare-fun e!182592 () Bool)

(assert (=> b!288399 (= e!182589 e!182592)))

(declare-fun res!150075 () Bool)

(assert (=> b!288399 (=> (not res!150075) (not e!182592))))

(declare-fun lt!141980 () Bool)

(assert (=> b!288399 (= res!150075 lt!141980)))

(declare-fun lt!141981 () SeekEntryResult!2018)

(declare-fun lt!141976 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14485 (_ BitVec 32)) SeekEntryResult!2018)

(assert (=> b!288399 (= lt!141981 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141976 k0!2524 (array!14486 (store (arr!6870 a!3312) i!1256 k0!2524) (size!7223 a!3312)) mask!3809))))

(assert (=> b!288399 (= lt!141977 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141976 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288399 (= lt!141976 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!288400 () Bool)

(assert (=> b!288400 (= e!182592 e!182588)))

(declare-fun res!150074 () Bool)

(assert (=> b!288400 (=> (not res!150074) (not e!182588))))

(declare-fun lt!141979 () Bool)

(assert (=> b!288400 (= res!150074 (and (or lt!141979 (not (undefined!2830 lt!141977))) (or lt!141979 (not (= (select (arr!6870 a!3312) (index!10244 lt!141977)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!141979 (not (= (select (arr!6870 a!3312) (index!10244 lt!141977)) k0!2524))) (not lt!141979)))))

(get-info :version)

(assert (=> b!288400 (= lt!141979 (not ((_ is Intermediate!2018) lt!141977)))))

(declare-fun b!288401 () Bool)

(assert (=> b!288401 (= e!182590 e!182589)))

(declare-fun res!150073 () Bool)

(assert (=> b!288401 (=> (not res!150073) (not e!182589))))

(declare-fun lt!141978 () SeekEntryResult!2018)

(assert (=> b!288401 (= res!150073 (or lt!141980 (= lt!141978 (MissingVacant!2018 i!1256))))))

(assert (=> b!288401 (= lt!141980 (= lt!141978 (MissingZero!2018 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14485 (_ BitVec 32)) SeekEntryResult!2018)

(assert (=> b!288401 (= lt!141978 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!28178 res!150076) b!288396))

(assert (= (and b!288396 res!150071) b!288397))

(assert (= (and b!288397 res!150070) b!288395))

(assert (= (and b!288395 res!150069) b!288401))

(assert (= (and b!288401 res!150073) b!288394))

(assert (= (and b!288394 res!150072) b!288399))

(assert (= (and b!288399 res!150075) b!288400))

(assert (= (and b!288400 res!150074) b!288398))

(declare-fun m!302171 () Bool)

(assert (=> b!288400 m!302171))

(declare-fun m!302173 () Bool)

(assert (=> b!288394 m!302173))

(assert (=> b!288398 m!302171))

(declare-fun m!302175 () Bool)

(assert (=> b!288399 m!302175))

(declare-fun m!302177 () Bool)

(assert (=> b!288399 m!302177))

(declare-fun m!302179 () Bool)

(assert (=> b!288399 m!302179))

(declare-fun m!302181 () Bool)

(assert (=> b!288399 m!302181))

(declare-fun m!302183 () Bool)

(assert (=> start!28178 m!302183))

(declare-fun m!302185 () Bool)

(assert (=> start!28178 m!302185))

(declare-fun m!302187 () Bool)

(assert (=> b!288395 m!302187))

(declare-fun m!302189 () Bool)

(assert (=> b!288401 m!302189))

(declare-fun m!302191 () Bool)

(assert (=> b!288397 m!302191))

(check-sat (not b!288397) (not start!28178) (not b!288395) (not b!288394) (not b!288401) (not b!288399))
(check-sat)
