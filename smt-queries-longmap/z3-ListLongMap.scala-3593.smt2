; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49346 () Bool)

(assert start!49346)

(declare-fun b!543726 () Bool)

(declare-fun res!338282 () Bool)

(declare-fun e!314395 () Bool)

(assert (=> b!543726 (=> (not res!338282) (not e!314395))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34354 0))(
  ( (array!34355 (arr!16510 (Array (_ BitVec 32) (_ BitVec 64))) (size!16874 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34354)

(assert (=> b!543726 (= res!338282 (and (not (= (select (arr!16510 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16510 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16510 a!3154) index!1177) (select (arr!16510 a!3154) j!147)))))))

(declare-fun b!543727 () Bool)

(assert (=> b!543727 (= e!314395 false)))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun lt!248244 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543727 (= lt!248244 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun res!338287 () Bool)

(declare-fun e!314396 () Bool)

(assert (=> start!49346 (=> (not res!338287) (not e!314396))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49346 (= res!338287 (validMask!0 mask!3216))))

(assert (=> start!49346 e!314396))

(assert (=> start!49346 true))

(declare-fun array_inv!12306 (array!34354) Bool)

(assert (=> start!49346 (array_inv!12306 a!3154)))

(declare-fun b!543728 () Bool)

(declare-fun e!314397 () Bool)

(assert (=> b!543728 (= e!314397 e!314395)))

(declare-fun res!338286 () Bool)

(assert (=> b!543728 (=> (not res!338286) (not e!314395))))

(declare-datatypes ((SeekEntryResult!4968 0))(
  ( (MissingZero!4968 (index!22096 (_ BitVec 32))) (Found!4968 (index!22097 (_ BitVec 32))) (Intermediate!4968 (undefined!5780 Bool) (index!22098 (_ BitVec 32)) (x!50999 (_ BitVec 32))) (Undefined!4968) (MissingVacant!4968 (index!22099 (_ BitVec 32))) )
))
(declare-fun lt!248243 () SeekEntryResult!4968)

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!543728 (= res!338286 (= lt!248243 (Intermediate!4968 false resIndex!32 resX!32)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34354 (_ BitVec 32)) SeekEntryResult!4968)

(assert (=> b!543728 (= lt!248243 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16510 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!543729 () Bool)

(declare-fun res!338280 () Bool)

(assert (=> b!543729 (=> (not res!338280) (not e!314396))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!543729 (= res!338280 (and (= (size!16874 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16874 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16874 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!543730 () Bool)

(declare-fun res!338277 () Bool)

(assert (=> b!543730 (=> (not res!338277) (not e!314396))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34354 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!543730 (= res!338277 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!543731 () Bool)

(declare-fun res!338288 () Bool)

(assert (=> b!543731 (=> (not res!338288) (not e!314397))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34354 (_ BitVec 32)) Bool)

(assert (=> b!543731 (= res!338288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!543732 () Bool)

(declare-fun res!338279 () Bool)

(assert (=> b!543732 (=> (not res!338279) (not e!314397))))

(assert (=> b!543732 (= res!338279 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16874 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16874 a!3154)) (= (select (arr!16510 a!3154) resIndex!32) (select (arr!16510 a!3154) j!147))))))

(declare-fun b!543733 () Bool)

(declare-fun res!338283 () Bool)

(assert (=> b!543733 (=> (not res!338283) (not e!314396))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543733 (= res!338283 (validKeyInArray!0 (select (arr!16510 a!3154) j!147)))))

(declare-fun b!543734 () Bool)

(declare-fun res!338284 () Bool)

(assert (=> b!543734 (=> (not res!338284) (not e!314396))))

(assert (=> b!543734 (= res!338284 (validKeyInArray!0 k0!1998))))

(declare-fun b!543735 () Bool)

(declare-fun res!338281 () Bool)

(assert (=> b!543735 (=> (not res!338281) (not e!314395))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543735 (= res!338281 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16510 a!3154) j!147) mask!3216) (select (arr!16510 a!3154) j!147) a!3154 mask!3216) lt!248243))))

(declare-fun b!543736 () Bool)

(assert (=> b!543736 (= e!314396 e!314397)))

(declare-fun res!338278 () Bool)

(assert (=> b!543736 (=> (not res!338278) (not e!314397))))

(declare-fun lt!248245 () SeekEntryResult!4968)

(assert (=> b!543736 (= res!338278 (or (= lt!248245 (MissingZero!4968 i!1153)) (= lt!248245 (MissingVacant!4968 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34354 (_ BitVec 32)) SeekEntryResult!4968)

(assert (=> b!543736 (= lt!248245 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!543737 () Bool)

(declare-fun res!338285 () Bool)

(assert (=> b!543737 (=> (not res!338285) (not e!314397))))

(declare-datatypes ((List!10629 0))(
  ( (Nil!10626) (Cons!10625 (h!11580 (_ BitVec 64)) (t!16857 List!10629)) )
))
(declare-fun arrayNoDuplicates!0 (array!34354 (_ BitVec 32) List!10629) Bool)

(assert (=> b!543737 (= res!338285 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10626))))

(assert (= (and start!49346 res!338287) b!543729))

(assert (= (and b!543729 res!338280) b!543733))

(assert (= (and b!543733 res!338283) b!543734))

(assert (= (and b!543734 res!338284) b!543730))

(assert (= (and b!543730 res!338277) b!543736))

(assert (= (and b!543736 res!338278) b!543731))

(assert (= (and b!543731 res!338288) b!543737))

(assert (= (and b!543737 res!338285) b!543732))

(assert (= (and b!543732 res!338279) b!543728))

(assert (= (and b!543728 res!338286) b!543735))

(assert (= (and b!543735 res!338281) b!543726))

(assert (= (and b!543726 res!338282) b!543727))

(declare-fun m!521769 () Bool)

(assert (=> b!543728 m!521769))

(assert (=> b!543728 m!521769))

(declare-fun m!521771 () Bool)

(assert (=> b!543728 m!521771))

(declare-fun m!521773 () Bool)

(assert (=> b!543731 m!521773))

(declare-fun m!521775 () Bool)

(assert (=> b!543727 m!521775))

(declare-fun m!521777 () Bool)

(assert (=> b!543737 m!521777))

(declare-fun m!521779 () Bool)

(assert (=> start!49346 m!521779))

(declare-fun m!521781 () Bool)

(assert (=> start!49346 m!521781))

(assert (=> b!543735 m!521769))

(assert (=> b!543735 m!521769))

(declare-fun m!521783 () Bool)

(assert (=> b!543735 m!521783))

(assert (=> b!543735 m!521783))

(assert (=> b!543735 m!521769))

(declare-fun m!521785 () Bool)

(assert (=> b!543735 m!521785))

(declare-fun m!521787 () Bool)

(assert (=> b!543734 m!521787))

(declare-fun m!521789 () Bool)

(assert (=> b!543730 m!521789))

(declare-fun m!521791 () Bool)

(assert (=> b!543726 m!521791))

(assert (=> b!543726 m!521769))

(assert (=> b!543733 m!521769))

(assert (=> b!543733 m!521769))

(declare-fun m!521793 () Bool)

(assert (=> b!543733 m!521793))

(declare-fun m!521795 () Bool)

(assert (=> b!543732 m!521795))

(assert (=> b!543732 m!521769))

(declare-fun m!521797 () Bool)

(assert (=> b!543736 m!521797))

(check-sat (not b!543737) (not b!543735) (not b!543731) (not b!543727) (not b!543734) (not b!543728) (not b!543730) (not start!49346) (not b!543736) (not b!543733))
(check-sat)
