; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85918 () Bool)

(assert start!85918)

(declare-fun b!995797 () Bool)

(declare-fun e!561996 () Bool)

(declare-datatypes ((array!62994 0))(
  ( (array!62995 (arr!30331 (Array (_ BitVec 32) (_ BitVec 64))) (size!30834 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62994)

(assert (=> b!995797 (= e!561996 (bvsgt #b00000000000000000000000000000000 (size!30834 a!3219)))))

(declare-fun res!665741 () Bool)

(declare-fun e!561995 () Bool)

(assert (=> start!85918 (=> (not res!665741) (not e!561995))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85918 (= res!665741 (validMask!0 mask!3464))))

(assert (=> start!85918 e!561995))

(declare-fun array_inv!23467 (array!62994) Bool)

(assert (=> start!85918 (array_inv!23467 a!3219)))

(assert (=> start!85918 true))

(declare-fun b!995798 () Bool)

(declare-fun res!665739 () Bool)

(assert (=> b!995798 (=> (not res!665739) (not e!561995))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!995798 (= res!665739 (validKeyInArray!0 (select (arr!30331 a!3219) j!170)))))

(declare-fun b!995799 () Bool)

(declare-fun res!665740 () Bool)

(assert (=> b!995799 (=> (not res!665740) (not e!561996))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62994 (_ BitVec 32)) Bool)

(assert (=> b!995799 (= res!665740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!995800 () Bool)

(declare-fun res!665744 () Bool)

(assert (=> b!995800 (=> (not res!665744) (not e!561995))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!995800 (= res!665744 (validKeyInArray!0 k0!2224))))

(declare-fun b!995801 () Bool)

(declare-fun res!665743 () Bool)

(assert (=> b!995801 (=> (not res!665743) (not e!561995))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!995801 (= res!665743 (and (= (size!30834 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30834 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30834 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!995802 () Bool)

(declare-fun res!665742 () Bool)

(assert (=> b!995802 (=> (not res!665742) (not e!561995))))

(declare-fun arrayContainsKey!0 (array!62994 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!995802 (= res!665742 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!995803 () Bool)

(assert (=> b!995803 (= e!561995 e!561996)))

(declare-fun res!665738 () Bool)

(assert (=> b!995803 (=> (not res!665738) (not e!561996))))

(declare-datatypes ((SeekEntryResult!9199 0))(
  ( (MissingZero!9199 (index!39167 (_ BitVec 32))) (Found!9199 (index!39168 (_ BitVec 32))) (Intermediate!9199 (undefined!10011 Bool) (index!39169 (_ BitVec 32)) (x!86766 (_ BitVec 32))) (Undefined!9199) (MissingVacant!9199 (index!39170 (_ BitVec 32))) )
))
(declare-fun lt!441146 () SeekEntryResult!9199)

(assert (=> b!995803 (= res!665738 (or (= lt!441146 (MissingVacant!9199 i!1194)) (= lt!441146 (MissingZero!9199 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62994 (_ BitVec 32)) SeekEntryResult!9199)

(assert (=> b!995803 (= lt!441146 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(assert (= (and start!85918 res!665741) b!995801))

(assert (= (and b!995801 res!665743) b!995798))

(assert (= (and b!995798 res!665739) b!995800))

(assert (= (and b!995800 res!665744) b!995802))

(assert (= (and b!995802 res!665742) b!995803))

(assert (= (and b!995803 res!665738) b!995799))

(assert (= (and b!995799 res!665740) b!995797))

(declare-fun m!923741 () Bool)

(assert (=> b!995798 m!923741))

(assert (=> b!995798 m!923741))

(declare-fun m!923743 () Bool)

(assert (=> b!995798 m!923743))

(declare-fun m!923745 () Bool)

(assert (=> b!995800 m!923745))

(declare-fun m!923747 () Bool)

(assert (=> b!995802 m!923747))

(declare-fun m!923749 () Bool)

(assert (=> start!85918 m!923749))

(declare-fun m!923751 () Bool)

(assert (=> start!85918 m!923751))

(declare-fun m!923753 () Bool)

(assert (=> b!995799 m!923753))

(declare-fun m!923755 () Bool)

(assert (=> b!995803 m!923755))

(check-sat (not b!995800) (not start!85918) (not b!995803) (not b!995802) (not b!995798) (not b!995799))
(check-sat)
