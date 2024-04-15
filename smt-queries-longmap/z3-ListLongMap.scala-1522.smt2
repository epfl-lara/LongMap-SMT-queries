; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28658 () Bool)

(assert start!28658)

(declare-fun b!292836 () Bool)

(declare-fun e!185196 () Bool)

(declare-fun e!185194 () Bool)

(assert (=> b!292836 (= e!185196 e!185194)))

(declare-fun res!153949 () Bool)

(assert (=> b!292836 (=> (not res!153949) (not e!185194))))

(declare-datatypes ((SeekEntryResult!2186 0))(
  ( (MissingZero!2186 (index!10914 (_ BitVec 32))) (Found!2186 (index!10915 (_ BitVec 32))) (Intermediate!2186 (undefined!2998 Bool) (index!10916 (_ BitVec 32)) (x!29112 (_ BitVec 32))) (Undefined!2186) (MissingVacant!2186 (index!10917 (_ BitVec 32))) )
))
(declare-fun lt!145023 () SeekEntryResult!2186)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!292836 (= res!153949 (or (= lt!145023 (MissingZero!2186 i!1256)) (= lt!145023 (MissingVacant!2186 i!1256))))))

(declare-datatypes ((array!14830 0))(
  ( (array!14831 (arr!7038 (Array (_ BitVec 32) (_ BitVec 64))) (size!7391 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14830)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14830 (_ BitVec 32)) SeekEntryResult!2186)

(assert (=> b!292836 (= lt!145023 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!153947 () Bool)

(assert (=> start!28658 (=> (not res!153947) (not e!185196))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28658 (= res!153947 (validMask!0 mask!3809))))

(assert (=> start!28658 e!185196))

(assert (=> start!28658 true))

(declare-fun array_inv!5010 (array!14830) Bool)

(assert (=> start!28658 (array_inv!5010 a!3312)))

(declare-fun b!292837 () Bool)

(assert (=> b!292837 (= e!185194 false)))

(declare-fun lt!145025 () SeekEntryResult!2186)

(declare-fun lt!145026 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14830 (_ BitVec 32)) SeekEntryResult!2186)

(assert (=> b!292837 (= lt!145025 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145026 k0!2524 (array!14831 (store (arr!7038 a!3312) i!1256 k0!2524) (size!7391 a!3312)) mask!3809))))

(declare-fun lt!145024 () SeekEntryResult!2186)

(assert (=> b!292837 (= lt!145024 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145026 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292837 (= lt!145026 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!292838 () Bool)

(declare-fun res!153948 () Bool)

(assert (=> b!292838 (=> (not res!153948) (not e!185194))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14830 (_ BitVec 32)) Bool)

(assert (=> b!292838 (= res!153948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292839 () Bool)

(declare-fun res!153944 () Bool)

(assert (=> b!292839 (=> (not res!153944) (not e!185196))))

(declare-fun arrayContainsKey!0 (array!14830 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292839 (= res!153944 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292840 () Bool)

(declare-fun res!153945 () Bool)

(assert (=> b!292840 (=> (not res!153945) (not e!185196))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292840 (= res!153945 (validKeyInArray!0 k0!2524))))

(declare-fun b!292841 () Bool)

(declare-fun res!153946 () Bool)

(assert (=> b!292841 (=> (not res!153946) (not e!185196))))

(assert (=> b!292841 (= res!153946 (and (= (size!7391 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7391 a!3312))))))

(assert (= (and start!28658 res!153947) b!292841))

(assert (= (and b!292841 res!153946) b!292840))

(assert (= (and b!292840 res!153945) b!292839))

(assert (= (and b!292839 res!153944) b!292836))

(assert (= (and b!292836 res!153949) b!292838))

(assert (= (and b!292838 res!153948) b!292837))

(declare-fun m!306185 () Bool)

(assert (=> b!292840 m!306185))

(declare-fun m!306187 () Bool)

(assert (=> start!28658 m!306187))

(declare-fun m!306189 () Bool)

(assert (=> start!28658 m!306189))

(declare-fun m!306191 () Bool)

(assert (=> b!292837 m!306191))

(declare-fun m!306193 () Bool)

(assert (=> b!292837 m!306193))

(declare-fun m!306195 () Bool)

(assert (=> b!292837 m!306195))

(declare-fun m!306197 () Bool)

(assert (=> b!292837 m!306197))

(declare-fun m!306199 () Bool)

(assert (=> b!292839 m!306199))

(declare-fun m!306201 () Bool)

(assert (=> b!292836 m!306201))

(declare-fun m!306203 () Bool)

(assert (=> b!292838 m!306203))

(check-sat (not b!292839) (not b!292838) (not start!28658) (not b!292837) (not b!292836) (not b!292840))
(check-sat)
