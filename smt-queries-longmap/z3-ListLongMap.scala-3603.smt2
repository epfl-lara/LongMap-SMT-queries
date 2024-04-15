; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49596 () Bool)

(assert start!49596)

(declare-fun b!545539 () Bool)

(declare-fun res!339616 () Bool)

(declare-fun e!315297 () Bool)

(assert (=> b!545539 (=> (not res!339616) (not e!315297))))

(declare-datatypes ((array!34419 0))(
  ( (array!34420 (arr!16538 (Array (_ BitVec 32) (_ BitVec 64))) (size!16903 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34419)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34419 (_ BitVec 32)) Bool)

(assert (=> b!545539 (= res!339616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!545540 () Bool)

(declare-fun e!315300 () Bool)

(assert (=> b!545540 (= e!315300 (not true))))

(declare-fun lt!248780 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4993 0))(
  ( (MissingZero!4993 (index!22196 (_ BitVec 32))) (Found!4993 (index!22197 (_ BitVec 32))) (Intermediate!4993 (undefined!5805 Bool) (index!22198 (_ BitVec 32)) (x!51132 (_ BitVec 32))) (Undefined!4993) (MissingVacant!4993 (index!22199 (_ BitVec 32))) )
))
(declare-fun lt!248779 () SeekEntryResult!4993)

(declare-fun i!1153 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34419 (_ BitVec 32)) SeekEntryResult!4993)

(assert (=> b!545540 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!248780 (select (store (arr!16538 a!3154) i!1153 k0!1998) j!147) (array!34420 (store (arr!16538 a!3154) i!1153 k0!1998) (size!16903 a!3154)) mask!3216) lt!248779)))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((Unit!16912 0))(
  ( (Unit!16913) )
))
(declare-fun lt!248781 () Unit!16912)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34419 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16912)

(assert (=> b!545540 (= lt!248781 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k0!1998 j!147 lt!248780 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!545541 () Bool)

(declare-fun res!339615 () Bool)

(declare-fun e!315302 () Bool)

(assert (=> b!545541 (=> (not res!339615) (not e!315302))))

(declare-fun arrayContainsKey!0 (array!34419 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!545541 (= res!339615 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!545542 () Bool)

(declare-fun e!315298 () Bool)

(declare-fun e!315301 () Bool)

(assert (=> b!545542 (= e!315298 e!315301)))

(declare-fun res!339612 () Bool)

(assert (=> b!545542 (=> (not res!339612) (not e!315301))))

(assert (=> b!545542 (= res!339612 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!248780 #b00000000000000000000000000000000) (bvslt lt!248780 (size!16903 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545542 (= lt!248780 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!545543 () Bool)

(declare-fun res!339618 () Bool)

(assert (=> b!545543 (=> (not res!339618) (not e!315302))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!545543 (= res!339618 (validKeyInArray!0 (select (arr!16538 a!3154) j!147)))))

(declare-fun res!339608 () Bool)

(assert (=> start!49596 (=> (not res!339608) (not e!315302))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49596 (= res!339608 (validMask!0 mask!3216))))

(assert (=> start!49596 e!315302))

(assert (=> start!49596 true))

(declare-fun array_inv!12421 (array!34419) Bool)

(assert (=> start!49596 (array_inv!12421 a!3154)))

(declare-fun b!545544 () Bool)

(declare-fun res!339620 () Bool)

(assert (=> b!545544 (=> (not res!339620) (not e!315297))))

(assert (=> b!545544 (= res!339620 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16903 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16903 a!3154)) (= (select (arr!16538 a!3154) resIndex!32) (select (arr!16538 a!3154) j!147))))))

(declare-fun b!545545 () Bool)

(declare-fun res!339610 () Bool)

(assert (=> b!545545 (=> (not res!339610) (not e!315302))))

(assert (=> b!545545 (= res!339610 (and (= (size!16903 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16903 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16903 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!545546 () Bool)

(assert (=> b!545546 (= e!315302 e!315297)))

(declare-fun res!339609 () Bool)

(assert (=> b!545546 (=> (not res!339609) (not e!315297))))

(declare-fun lt!248785 () SeekEntryResult!4993)

(assert (=> b!545546 (= res!339609 (or (= lt!248785 (MissingZero!4993 i!1153)) (= lt!248785 (MissingVacant!4993 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34419 (_ BitVec 32)) SeekEntryResult!4993)

(assert (=> b!545546 (= lt!248785 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!545547 () Bool)

(assert (=> b!545547 (= e!315301 e!315300)))

(declare-fun res!339614 () Bool)

(assert (=> b!545547 (=> (not res!339614) (not e!315300))))

(declare-fun lt!248782 () SeekEntryResult!4993)

(declare-fun lt!248783 () SeekEntryResult!4993)

(assert (=> b!545547 (= res!339614 (and (= lt!248782 lt!248779) (= lt!248783 lt!248782)))))

(assert (=> b!545547 (= lt!248782 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!248780 (select (arr!16538 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545548 () Bool)

(declare-fun res!339619 () Bool)

(assert (=> b!545548 (=> (not res!339619) (not e!315302))))

(assert (=> b!545548 (= res!339619 (validKeyInArray!0 k0!1998))))

(declare-fun b!545549 () Bool)

(declare-fun e!315303 () Bool)

(assert (=> b!545549 (= e!315303 e!315298)))

(declare-fun res!339617 () Bool)

(assert (=> b!545549 (=> (not res!339617) (not e!315298))))

(declare-fun lt!248784 () SeekEntryResult!4993)

(assert (=> b!545549 (= res!339617 (and (= lt!248783 lt!248784) (not (= (select (arr!16538 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16538 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16538 a!3154) index!1177) (select (arr!16538 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545549 (= lt!248783 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16538 a!3154) j!147) mask!3216) (select (arr!16538 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545550 () Bool)

(declare-fun res!339613 () Bool)

(assert (=> b!545550 (=> (not res!339613) (not e!315297))))

(declare-datatypes ((List!10696 0))(
  ( (Nil!10693) (Cons!10692 (h!11656 (_ BitVec 64)) (t!16915 List!10696)) )
))
(declare-fun arrayNoDuplicates!0 (array!34419 (_ BitVec 32) List!10696) Bool)

(assert (=> b!545550 (= res!339613 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10693))))

(declare-fun b!545551 () Bool)

(assert (=> b!545551 (= e!315297 e!315303)))

(declare-fun res!339611 () Bool)

(assert (=> b!545551 (=> (not res!339611) (not e!315303))))

(assert (=> b!545551 (= res!339611 (= lt!248784 lt!248779))))

(assert (=> b!545551 (= lt!248779 (Intermediate!4993 false resIndex!32 resX!32))))

(assert (=> b!545551 (= lt!248784 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16538 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!49596 res!339608) b!545545))

(assert (= (and b!545545 res!339610) b!545543))

(assert (= (and b!545543 res!339618) b!545548))

(assert (= (and b!545548 res!339619) b!545541))

(assert (= (and b!545541 res!339615) b!545546))

(assert (= (and b!545546 res!339609) b!545539))

(assert (= (and b!545539 res!339616) b!545550))

(assert (= (and b!545550 res!339613) b!545544))

(assert (= (and b!545544 res!339620) b!545551))

(assert (= (and b!545551 res!339611) b!545549))

(assert (= (and b!545549 res!339617) b!545542))

(assert (= (and b!545542 res!339612) b!545547))

(assert (= (and b!545547 res!339614) b!545540))

(declare-fun m!522601 () Bool)

(assert (=> b!545551 m!522601))

(assert (=> b!545551 m!522601))

(declare-fun m!522603 () Bool)

(assert (=> b!545551 m!522603))

(declare-fun m!522605 () Bool)

(assert (=> b!545548 m!522605))

(declare-fun m!522607 () Bool)

(assert (=> b!545539 m!522607))

(assert (=> b!545547 m!522601))

(assert (=> b!545547 m!522601))

(declare-fun m!522609 () Bool)

(assert (=> b!545547 m!522609))

(declare-fun m!522611 () Bool)

(assert (=> b!545542 m!522611))

(declare-fun m!522613 () Bool)

(assert (=> b!545544 m!522613))

(assert (=> b!545544 m!522601))

(declare-fun m!522615 () Bool)

(assert (=> b!545541 m!522615))

(assert (=> b!545543 m!522601))

(assert (=> b!545543 m!522601))

(declare-fun m!522617 () Bool)

(assert (=> b!545543 m!522617))

(declare-fun m!522619 () Bool)

(assert (=> b!545546 m!522619))

(declare-fun m!522621 () Bool)

(assert (=> b!545540 m!522621))

(declare-fun m!522623 () Bool)

(assert (=> b!545540 m!522623))

(assert (=> b!545540 m!522623))

(declare-fun m!522625 () Bool)

(assert (=> b!545540 m!522625))

(declare-fun m!522627 () Bool)

(assert (=> b!545540 m!522627))

(declare-fun m!522629 () Bool)

(assert (=> b!545549 m!522629))

(assert (=> b!545549 m!522601))

(assert (=> b!545549 m!522601))

(declare-fun m!522631 () Bool)

(assert (=> b!545549 m!522631))

(assert (=> b!545549 m!522631))

(assert (=> b!545549 m!522601))

(declare-fun m!522633 () Bool)

(assert (=> b!545549 m!522633))

(declare-fun m!522635 () Bool)

(assert (=> b!545550 m!522635))

(declare-fun m!522637 () Bool)

(assert (=> start!49596 m!522637))

(declare-fun m!522639 () Bool)

(assert (=> start!49596 m!522639))

(check-sat (not b!545541) (not b!545549) (not b!545542) (not b!545550) (not b!545539) (not b!545551) (not b!545543) (not b!545547) (not b!545546) (not b!545540) (not b!545548) (not start!49596))
(check-sat)
