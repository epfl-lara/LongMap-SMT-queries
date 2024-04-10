; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49604 () Bool)

(assert start!49604)

(declare-fun b!545732 () Bool)

(declare-fun e!315434 () Bool)

(declare-fun e!315429 () Bool)

(assert (=> b!545732 (= e!315434 e!315429)))

(declare-fun res!339666 () Bool)

(assert (=> b!545732 (=> (not res!339666) (not e!315429))))

(declare-datatypes ((SeekEntryResult!4995 0))(
  ( (MissingZero!4995 (index!22204 (_ BitVec 32))) (Found!4995 (index!22205 (_ BitVec 32))) (Intermediate!4995 (undefined!5807 Bool) (index!22206 (_ BitVec 32)) (x!51131 (_ BitVec 32))) (Undefined!4995) (MissingVacant!4995 (index!22207 (_ BitVec 32))) )
))
(declare-fun lt!248973 () SeekEntryResult!4995)

(declare-fun lt!248971 () SeekEntryResult!4995)

(assert (=> b!545732 (= res!339666 (= lt!248973 lt!248971))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!545732 (= lt!248971 (Intermediate!4995 false resIndex!32 resX!32))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34417 0))(
  ( (array!34418 (arr!16537 (Array (_ BitVec 32) (_ BitVec 64))) (size!16901 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34417)

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34417 (_ BitVec 32)) SeekEntryResult!4995)

(assert (=> b!545732 (= lt!248973 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16537 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545733 () Bool)

(declare-fun res!339665 () Bool)

(assert (=> b!545733 (=> (not res!339665) (not e!315434))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34417 (_ BitVec 32)) Bool)

(assert (=> b!545733 (= res!339665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!545734 () Bool)

(declare-fun e!315431 () Bool)

(assert (=> b!545734 (= e!315431 (not true))))

(declare-fun lt!248975 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!545734 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!248975 (select (store (arr!16537 a!3154) i!1153 k0!1998) j!147) (array!34418 (store (arr!16537 a!3154) i!1153 k0!1998) (size!16901 a!3154)) mask!3216) lt!248971)))

(declare-datatypes ((Unit!16924 0))(
  ( (Unit!16925) )
))
(declare-fun lt!248976 () Unit!16924)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34417 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16924)

(assert (=> b!545734 (= lt!248976 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k0!1998 j!147 lt!248975 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!545735 () Bool)

(declare-fun e!315430 () Bool)

(declare-fun e!315435 () Bool)

(assert (=> b!545735 (= e!315430 e!315435)))

(declare-fun res!339661 () Bool)

(assert (=> b!545735 (=> (not res!339661) (not e!315435))))

(assert (=> b!545735 (= res!339661 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!248975 #b00000000000000000000000000000000) (bvslt lt!248975 (size!16901 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545735 (= lt!248975 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!545737 () Bool)

(declare-fun res!339664 () Bool)

(assert (=> b!545737 (=> (not res!339664) (not e!315434))))

(assert (=> b!545737 (= res!339664 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16901 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16901 a!3154)) (= (select (arr!16537 a!3154) resIndex!32) (select (arr!16537 a!3154) j!147))))))

(declare-fun b!545738 () Bool)

(declare-fun res!339660 () Bool)

(declare-fun e!315433 () Bool)

(assert (=> b!545738 (=> (not res!339660) (not e!315433))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!545738 (= res!339660 (validKeyInArray!0 (select (arr!16537 a!3154) j!147)))))

(declare-fun b!545739 () Bool)

(declare-fun res!339663 () Bool)

(assert (=> b!545739 (=> (not res!339663) (not e!315434))))

(declare-datatypes ((List!10656 0))(
  ( (Nil!10653) (Cons!10652 (h!11616 (_ BitVec 64)) (t!16884 List!10656)) )
))
(declare-fun arrayNoDuplicates!0 (array!34417 (_ BitVec 32) List!10656) Bool)

(assert (=> b!545739 (= res!339663 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10653))))

(declare-fun b!545740 () Bool)

(declare-fun res!339659 () Bool)

(assert (=> b!545740 (=> (not res!339659) (not e!315433))))

(assert (=> b!545740 (= res!339659 (validKeyInArray!0 k0!1998))))

(declare-fun b!545736 () Bool)

(declare-fun res!339669 () Bool)

(assert (=> b!545736 (=> (not res!339669) (not e!315433))))

(declare-fun arrayContainsKey!0 (array!34417 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!545736 (= res!339669 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun res!339668 () Bool)

(assert (=> start!49604 (=> (not res!339668) (not e!315433))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49604 (= res!339668 (validMask!0 mask!3216))))

(assert (=> start!49604 e!315433))

(assert (=> start!49604 true))

(declare-fun array_inv!12333 (array!34417) Bool)

(assert (=> start!49604 (array_inv!12333 a!3154)))

(declare-fun b!545741 () Bool)

(assert (=> b!545741 (= e!315433 e!315434)))

(declare-fun res!339667 () Bool)

(assert (=> b!545741 (=> (not res!339667) (not e!315434))))

(declare-fun lt!248974 () SeekEntryResult!4995)

(assert (=> b!545741 (= res!339667 (or (= lt!248974 (MissingZero!4995 i!1153)) (= lt!248974 (MissingVacant!4995 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34417 (_ BitVec 32)) SeekEntryResult!4995)

(assert (=> b!545741 (= lt!248974 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!545742 () Bool)

(declare-fun res!339671 () Bool)

(assert (=> b!545742 (=> (not res!339671) (not e!315433))))

(assert (=> b!545742 (= res!339671 (and (= (size!16901 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16901 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16901 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!545743 () Bool)

(assert (=> b!545743 (= e!315435 e!315431)))

(declare-fun res!339662 () Bool)

(assert (=> b!545743 (=> (not res!339662) (not e!315431))))

(declare-fun lt!248977 () SeekEntryResult!4995)

(declare-fun lt!248972 () SeekEntryResult!4995)

(assert (=> b!545743 (= res!339662 (and (= lt!248977 lt!248971) (= lt!248972 lt!248977)))))

(assert (=> b!545743 (= lt!248977 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!248975 (select (arr!16537 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545744 () Bool)

(assert (=> b!545744 (= e!315429 e!315430)))

(declare-fun res!339670 () Bool)

(assert (=> b!545744 (=> (not res!339670) (not e!315430))))

(assert (=> b!545744 (= res!339670 (and (= lt!248972 lt!248973) (not (= (select (arr!16537 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16537 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16537 a!3154) index!1177) (select (arr!16537 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545744 (= lt!248972 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16537 a!3154) j!147) mask!3216) (select (arr!16537 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!49604 res!339668) b!545742))

(assert (= (and b!545742 res!339671) b!545738))

(assert (= (and b!545738 res!339660) b!545740))

(assert (= (and b!545740 res!339659) b!545736))

(assert (= (and b!545736 res!339669) b!545741))

(assert (= (and b!545741 res!339667) b!545733))

(assert (= (and b!545733 res!339665) b!545739))

(assert (= (and b!545739 res!339663) b!545737))

(assert (= (and b!545737 res!339664) b!545732))

(assert (= (and b!545732 res!339666) b!545744))

(assert (= (and b!545744 res!339670) b!545735))

(assert (= (and b!545735 res!339661) b!545743))

(assert (= (and b!545743 res!339662) b!545734))

(declare-fun m!523273 () Bool)

(assert (=> b!545733 m!523273))

(declare-fun m!523275 () Bool)

(assert (=> b!545737 m!523275))

(declare-fun m!523277 () Bool)

(assert (=> b!545737 m!523277))

(declare-fun m!523279 () Bool)

(assert (=> b!545740 m!523279))

(declare-fun m!523281 () Bool)

(assert (=> b!545734 m!523281))

(declare-fun m!523283 () Bool)

(assert (=> b!545734 m!523283))

(assert (=> b!545734 m!523283))

(declare-fun m!523285 () Bool)

(assert (=> b!545734 m!523285))

(declare-fun m!523287 () Bool)

(assert (=> b!545734 m!523287))

(assert (=> b!545743 m!523277))

(assert (=> b!545743 m!523277))

(declare-fun m!523289 () Bool)

(assert (=> b!545743 m!523289))

(declare-fun m!523291 () Bool)

(assert (=> b!545735 m!523291))

(assert (=> b!545732 m!523277))

(assert (=> b!545732 m!523277))

(declare-fun m!523293 () Bool)

(assert (=> b!545732 m!523293))

(declare-fun m!523295 () Bool)

(assert (=> start!49604 m!523295))

(declare-fun m!523297 () Bool)

(assert (=> start!49604 m!523297))

(assert (=> b!545738 m!523277))

(assert (=> b!545738 m!523277))

(declare-fun m!523299 () Bool)

(assert (=> b!545738 m!523299))

(declare-fun m!523301 () Bool)

(assert (=> b!545741 m!523301))

(declare-fun m!523303 () Bool)

(assert (=> b!545744 m!523303))

(assert (=> b!545744 m!523277))

(assert (=> b!545744 m!523277))

(declare-fun m!523305 () Bool)

(assert (=> b!545744 m!523305))

(assert (=> b!545744 m!523305))

(assert (=> b!545744 m!523277))

(declare-fun m!523307 () Bool)

(assert (=> b!545744 m!523307))

(declare-fun m!523309 () Bool)

(assert (=> b!545739 m!523309))

(declare-fun m!523311 () Bool)

(assert (=> b!545736 m!523311))

(check-sat (not b!545735) (not b!545734) (not b!545744) (not b!545741) (not b!545740) (not b!545743) (not b!545739) (not b!545736) (not b!545732) (not b!545738) (not start!49604) (not b!545733))
(check-sat)
