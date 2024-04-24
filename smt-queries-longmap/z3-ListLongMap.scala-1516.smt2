; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28618 () Bool)

(assert start!28618)

(declare-fun b!292706 () Bool)

(declare-fun res!153736 () Bool)

(declare-fun e!185159 () Bool)

(assert (=> b!292706 (=> (not res!153736) (not e!185159))))

(declare-datatypes ((array!14802 0))(
  ( (array!14803 (arr!7024 (Array (_ BitVec 32) (_ BitVec 64))) (size!7376 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14802)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14802 (_ BitVec 32)) Bool)

(assert (=> b!292706 (= res!153736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292707 () Bool)

(declare-fun e!185158 () Bool)

(assert (=> b!292707 (= e!185158 e!185159)))

(declare-fun res!153740 () Bool)

(assert (=> b!292707 (=> (not res!153740) (not e!185159))))

(declare-datatypes ((SeekEntryResult!2138 0))(
  ( (MissingZero!2138 (index!10722 (_ BitVec 32))) (Found!2138 (index!10723 (_ BitVec 32))) (Intermediate!2138 (undefined!2950 Bool) (index!10724 (_ BitVec 32)) (x!29017 (_ BitVec 32))) (Undefined!2138) (MissingVacant!2138 (index!10725 (_ BitVec 32))) )
))
(declare-fun lt!145050 () SeekEntryResult!2138)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!292707 (= res!153740 (or (= lt!145050 (MissingZero!2138 i!1256)) (= lt!145050 (MissingVacant!2138 i!1256))))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14802 (_ BitVec 32)) SeekEntryResult!2138)

(assert (=> b!292707 (= lt!145050 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!292708 () Bool)

(declare-fun res!153738 () Bool)

(assert (=> b!292708 (=> (not res!153738) (not e!185158))))

(assert (=> b!292708 (= res!153738 (and (= (size!7376 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7376 a!3312))))))

(declare-fun b!292709 () Bool)

(assert (=> b!292709 (= e!185159 false)))

(declare-fun lt!145047 () (_ BitVec 32))

(declare-fun lt!145049 () SeekEntryResult!2138)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14802 (_ BitVec 32)) SeekEntryResult!2138)

(assert (=> b!292709 (= lt!145049 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145047 k0!2524 (array!14803 (store (arr!7024 a!3312) i!1256 k0!2524) (size!7376 a!3312)) mask!3809))))

(declare-fun lt!145048 () SeekEntryResult!2138)

(assert (=> b!292709 (= lt!145048 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145047 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292709 (= lt!145047 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!292710 () Bool)

(declare-fun res!153737 () Bool)

(assert (=> b!292710 (=> (not res!153737) (not e!185158))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292710 (= res!153737 (validKeyInArray!0 k0!2524))))

(declare-fun res!153739 () Bool)

(assert (=> start!28618 (=> (not res!153739) (not e!185158))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28618 (= res!153739 (validMask!0 mask!3809))))

(assert (=> start!28618 e!185158))

(assert (=> start!28618 true))

(declare-fun array_inv!4974 (array!14802) Bool)

(assert (=> start!28618 (array_inv!4974 a!3312)))

(declare-fun b!292711 () Bool)

(declare-fun res!153741 () Bool)

(assert (=> b!292711 (=> (not res!153741) (not e!185158))))

(declare-fun arrayContainsKey!0 (array!14802 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292711 (= res!153741 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!28618 res!153739) b!292708))

(assert (= (and b!292708 res!153738) b!292710))

(assert (= (and b!292710 res!153737) b!292711))

(assert (= (and b!292711 res!153741) b!292707))

(assert (= (and b!292707 res!153740) b!292706))

(assert (= (and b!292706 res!153736) b!292709))

(declare-fun m!306623 () Bool)

(assert (=> b!292711 m!306623))

(declare-fun m!306625 () Bool)

(assert (=> b!292707 m!306625))

(declare-fun m!306627 () Bool)

(assert (=> b!292709 m!306627))

(declare-fun m!306629 () Bool)

(assert (=> b!292709 m!306629))

(declare-fun m!306631 () Bool)

(assert (=> b!292709 m!306631))

(declare-fun m!306633 () Bool)

(assert (=> b!292709 m!306633))

(declare-fun m!306635 () Bool)

(assert (=> b!292706 m!306635))

(declare-fun m!306637 () Bool)

(assert (=> start!28618 m!306637))

(declare-fun m!306639 () Bool)

(assert (=> start!28618 m!306639))

(declare-fun m!306641 () Bool)

(assert (=> b!292710 m!306641))

(check-sat (not b!292711) (not b!292710) (not b!292706) (not b!292709) (not b!292707) (not start!28618))
(check-sat)
