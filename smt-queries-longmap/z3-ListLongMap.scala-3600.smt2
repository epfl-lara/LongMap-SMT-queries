; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49636 () Bool)

(assert start!49636)

(declare-fun b!545675 () Bool)

(declare-fun e!315429 () Bool)

(declare-fun e!315430 () Bool)

(assert (=> b!545675 (= e!315429 e!315430)))

(declare-fun res!339507 () Bool)

(assert (=> b!545675 (=> (not res!339507) (not e!315430))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-datatypes ((array!34397 0))(
  ( (array!34398 (arr!16525 (Array (_ BitVec 32) (_ BitVec 64))) (size!16889 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34397)

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun lt!248956 () (_ BitVec 32))

(assert (=> b!545675 (= res!339507 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!248956 #b00000000000000000000000000000000) (bvslt lt!248956 (size!16889 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545675 (= lt!248956 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!545676 () Bool)

(declare-fun res!339503 () Bool)

(declare-fun e!315432 () Bool)

(assert (=> b!545676 (=> (not res!339503) (not e!315432))))

(declare-datatypes ((List!10551 0))(
  ( (Nil!10548) (Cons!10547 (h!11514 (_ BitVec 64)) (t!16771 List!10551)) )
))
(declare-fun arrayNoDuplicates!0 (array!34397 (_ BitVec 32) List!10551) Bool)

(assert (=> b!545676 (= res!339503 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10548))))

(declare-fun b!545677 () Bool)

(declare-fun res!339500 () Bool)

(declare-fun e!315427 () Bool)

(assert (=> b!545677 (=> (not res!339500) (not e!315427))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!545677 (= res!339500 (and (= (size!16889 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16889 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16889 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!339498 () Bool)

(assert (=> start!49636 (=> (not res!339498) (not e!315427))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49636 (= res!339498 (validMask!0 mask!3216))))

(assert (=> start!49636 e!315427))

(assert (=> start!49636 true))

(declare-fun array_inv!12384 (array!34397) Bool)

(assert (=> start!49636 (array_inv!12384 a!3154)))

(declare-fun b!545678 () Bool)

(declare-fun res!339506 () Bool)

(assert (=> b!545678 (=> (not res!339506) (not e!315427))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!545678 (= res!339506 (validKeyInArray!0 (select (arr!16525 a!3154) j!147)))))

(declare-fun b!545679 () Bool)

(declare-fun res!339505 () Bool)

(assert (=> b!545679 (=> (not res!339505) (not e!315427))))

(declare-fun k0!1998 () (_ BitVec 64))

(assert (=> b!545679 (= res!339505 (validKeyInArray!0 k0!1998))))

(declare-fun b!545680 () Bool)

(declare-fun res!339504 () Bool)

(assert (=> b!545680 (=> (not res!339504) (not e!315427))))

(declare-fun arrayContainsKey!0 (array!34397 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!545680 (= res!339504 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!4939 0))(
  ( (MissingZero!4939 (index!21980 (_ BitVec 32))) (Found!4939 (index!21981 (_ BitVec 32))) (Intermediate!4939 (undefined!5751 Bool) (index!21982 (_ BitVec 32)) (x!51062 (_ BitVec 32))) (Undefined!4939) (MissingVacant!4939 (index!21983 (_ BitVec 32))) )
))
(declare-fun lt!248951 () SeekEntryResult!4939)

(declare-fun lt!248952 () SeekEntryResult!4939)

(declare-fun lt!248953 () SeekEntryResult!4939)

(declare-fun b!545681 () Bool)

(assert (=> b!545681 (= e!315430 (and (= lt!248953 lt!248951) (not (= lt!248952 lt!248953))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34397 (_ BitVec 32)) SeekEntryResult!4939)

(assert (=> b!545681 (= lt!248953 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!248956 (select (arr!16525 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545682 () Bool)

(declare-fun res!339497 () Bool)

(assert (=> b!545682 (=> (not res!339497) (not e!315432))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34397 (_ BitVec 32)) Bool)

(assert (=> b!545682 (= res!339497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!545683 () Bool)

(assert (=> b!545683 (= e!315427 e!315432)))

(declare-fun res!339508 () Bool)

(assert (=> b!545683 (=> (not res!339508) (not e!315432))))

(declare-fun lt!248955 () SeekEntryResult!4939)

(assert (=> b!545683 (= res!339508 (or (= lt!248955 (MissingZero!4939 i!1153)) (= lt!248955 (MissingVacant!4939 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34397 (_ BitVec 32)) SeekEntryResult!4939)

(assert (=> b!545683 (= lt!248955 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!545684 () Bool)

(declare-fun e!315428 () Bool)

(assert (=> b!545684 (= e!315432 e!315428)))

(declare-fun res!339499 () Bool)

(assert (=> b!545684 (=> (not res!339499) (not e!315428))))

(declare-fun lt!248954 () SeekEntryResult!4939)

(assert (=> b!545684 (= res!339499 (= lt!248954 lt!248951))))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!545684 (= lt!248951 (Intermediate!4939 false resIndex!32 resX!32))))

(assert (=> b!545684 (= lt!248954 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16525 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545685 () Bool)

(assert (=> b!545685 (= e!315428 e!315429)))

(declare-fun res!339501 () Bool)

(assert (=> b!545685 (=> (not res!339501) (not e!315429))))

(assert (=> b!545685 (= res!339501 (and (= lt!248952 lt!248954) (not (= (select (arr!16525 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16525 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16525 a!3154) index!1177) (select (arr!16525 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545685 (= lt!248952 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16525 a!3154) j!147) mask!3216) (select (arr!16525 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545686 () Bool)

(declare-fun res!339502 () Bool)

(assert (=> b!545686 (=> (not res!339502) (not e!315432))))

(assert (=> b!545686 (= res!339502 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16889 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16889 a!3154)) (= (select (arr!16525 a!3154) resIndex!32) (select (arr!16525 a!3154) j!147))))))

(assert (= (and start!49636 res!339498) b!545677))

(assert (= (and b!545677 res!339500) b!545678))

(assert (= (and b!545678 res!339506) b!545679))

(assert (= (and b!545679 res!339505) b!545680))

(assert (= (and b!545680 res!339504) b!545683))

(assert (= (and b!545683 res!339508) b!545682))

(assert (= (and b!545682 res!339497) b!545676))

(assert (= (and b!545676 res!339503) b!545686))

(assert (= (and b!545686 res!339502) b!545684))

(assert (= (and b!545684 res!339499) b!545685))

(assert (= (and b!545685 res!339501) b!545675))

(assert (= (and b!545675 res!339507) b!545681))

(declare-fun m!523387 () Bool)

(assert (=> b!545678 m!523387))

(assert (=> b!545678 m!523387))

(declare-fun m!523389 () Bool)

(assert (=> b!545678 m!523389))

(declare-fun m!523391 () Bool)

(assert (=> b!545682 m!523391))

(assert (=> b!545684 m!523387))

(assert (=> b!545684 m!523387))

(declare-fun m!523393 () Bool)

(assert (=> b!545684 m!523393))

(declare-fun m!523395 () Bool)

(assert (=> b!545680 m!523395))

(declare-fun m!523397 () Bool)

(assert (=> b!545686 m!523397))

(assert (=> b!545686 m!523387))

(assert (=> b!545681 m!523387))

(assert (=> b!545681 m!523387))

(declare-fun m!523399 () Bool)

(assert (=> b!545681 m!523399))

(declare-fun m!523401 () Bool)

(assert (=> start!49636 m!523401))

(declare-fun m!523403 () Bool)

(assert (=> start!49636 m!523403))

(declare-fun m!523405 () Bool)

(assert (=> b!545685 m!523405))

(assert (=> b!545685 m!523387))

(assert (=> b!545685 m!523387))

(declare-fun m!523407 () Bool)

(assert (=> b!545685 m!523407))

(assert (=> b!545685 m!523407))

(assert (=> b!545685 m!523387))

(declare-fun m!523409 () Bool)

(assert (=> b!545685 m!523409))

(declare-fun m!523411 () Bool)

(assert (=> b!545679 m!523411))

(declare-fun m!523413 () Bool)

(assert (=> b!545675 m!523413))

(declare-fun m!523415 () Bool)

(assert (=> b!545683 m!523415))

(declare-fun m!523417 () Bool)

(assert (=> b!545676 m!523417))

(check-sat (not b!545678) (not b!545681) (not b!545679) (not b!545680) (not b!545676) (not b!545684) (not b!545675) (not b!545683) (not start!49636) (not b!545682) (not b!545685))
(check-sat)
