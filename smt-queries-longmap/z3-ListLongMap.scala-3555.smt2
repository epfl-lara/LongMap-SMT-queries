; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48888 () Bool)

(assert start!48888)

(declare-fun b!538702 () Bool)

(declare-fun e!312332 () Bool)

(assert (=> b!538702 (= e!312332 false)))

(declare-fun lt!246799 () Bool)

(declare-datatypes ((array!34110 0))(
  ( (array!34111 (arr!16394 (Array (_ BitVec 32) (_ BitVec 64))) (size!16759 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34110)

(declare-datatypes ((List!10552 0))(
  ( (Nil!10549) (Cons!10548 (h!11491 (_ BitVec 64)) (t!16771 List!10552)) )
))
(declare-fun arrayNoDuplicates!0 (array!34110 (_ BitVec 32) List!10552) Bool)

(assert (=> b!538702 (= lt!246799 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10549))))

(declare-fun res!334050 () Bool)

(declare-fun e!312333 () Bool)

(assert (=> start!48888 (=> (not res!334050) (not e!312333))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48888 (= res!334050 (validMask!0 mask!3216))))

(assert (=> start!48888 e!312333))

(assert (=> start!48888 true))

(declare-fun array_inv!12277 (array!34110) Bool)

(assert (=> start!48888 (array_inv!12277 a!3154)))

(declare-fun b!538703 () Bool)

(declare-fun res!334051 () Bool)

(assert (=> b!538703 (=> (not res!334051) (not e!312333))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!538703 (= res!334051 (and (= (size!16759 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16759 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16759 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538704 () Bool)

(declare-fun res!334055 () Bool)

(assert (=> b!538704 (=> (not res!334055) (not e!312333))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34110 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538704 (= res!334055 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538705 () Bool)

(declare-fun res!334053 () Bool)

(assert (=> b!538705 (=> (not res!334053) (not e!312332))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34110 (_ BitVec 32)) Bool)

(assert (=> b!538705 (= res!334053 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!538706 () Bool)

(declare-fun res!334052 () Bool)

(assert (=> b!538706 (=> (not res!334052) (not e!312333))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538706 (= res!334052 (validKeyInArray!0 k0!1998))))

(declare-fun b!538707 () Bool)

(assert (=> b!538707 (= e!312333 e!312332)))

(declare-fun res!334054 () Bool)

(assert (=> b!538707 (=> (not res!334054) (not e!312332))))

(declare-datatypes ((SeekEntryResult!4849 0))(
  ( (MissingZero!4849 (index!21620 (_ BitVec 32))) (Found!4849 (index!21621 (_ BitVec 32))) (Intermediate!4849 (undefined!5661 Bool) (index!21622 (_ BitVec 32)) (x!50547 (_ BitVec 32))) (Undefined!4849) (MissingVacant!4849 (index!21623 (_ BitVec 32))) )
))
(declare-fun lt!246798 () SeekEntryResult!4849)

(assert (=> b!538707 (= res!334054 (or (= lt!246798 (MissingZero!4849 i!1153)) (= lt!246798 (MissingVacant!4849 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34110 (_ BitVec 32)) SeekEntryResult!4849)

(assert (=> b!538707 (= lt!246798 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!538708 () Bool)

(declare-fun res!334049 () Bool)

(assert (=> b!538708 (=> (not res!334049) (not e!312333))))

(assert (=> b!538708 (= res!334049 (validKeyInArray!0 (select (arr!16394 a!3154) j!147)))))

(assert (= (and start!48888 res!334050) b!538703))

(assert (= (and b!538703 res!334051) b!538708))

(assert (= (and b!538708 res!334049) b!538706))

(assert (= (and b!538706 res!334052) b!538704))

(assert (= (and b!538704 res!334055) b!538707))

(assert (= (and b!538707 res!334054) b!538705))

(assert (= (and b!538705 res!334053) b!538702))

(declare-fun m!517333 () Bool)

(assert (=> b!538708 m!517333))

(assert (=> b!538708 m!517333))

(declare-fun m!517335 () Bool)

(assert (=> b!538708 m!517335))

(declare-fun m!517337 () Bool)

(assert (=> b!538706 m!517337))

(declare-fun m!517339 () Bool)

(assert (=> b!538707 m!517339))

(declare-fun m!517341 () Bool)

(assert (=> b!538702 m!517341))

(declare-fun m!517343 () Bool)

(assert (=> b!538705 m!517343))

(declare-fun m!517345 () Bool)

(assert (=> b!538704 m!517345))

(declare-fun m!517347 () Bool)

(assert (=> start!48888 m!517347))

(declare-fun m!517349 () Bool)

(assert (=> start!48888 m!517349))

(check-sat (not b!538706) (not b!538707) (not b!538704) (not b!538702) (not b!538705) (not start!48888) (not b!538708))
(check-sat)
