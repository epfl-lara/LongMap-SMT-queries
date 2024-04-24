; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86746 () Bool)

(assert start!86746)

(declare-fun b!1003579 () Bool)

(declare-fun e!565492 () Bool)

(declare-fun e!565489 () Bool)

(assert (=> b!1003579 (= e!565492 e!565489)))

(declare-fun res!672300 () Bool)

(assert (=> b!1003579 (=> (not res!672300) (not e!565489))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9370 0))(
  ( (MissingZero!9370 (index!39851 (_ BitVec 32))) (Found!9370 (index!39852 (_ BitVec 32))) (Intermediate!9370 (undefined!10182 Bool) (index!39853 (_ BitVec 32)) (x!87426 (_ BitVec 32))) (Undefined!9370) (MissingVacant!9370 (index!39854 (_ BitVec 32))) )
))
(declare-fun lt!443603 () SeekEntryResult!9370)

(declare-fun lt!443605 () (_ BitVec 64))

(declare-datatypes ((array!63366 0))(
  ( (array!63367 (arr!30502 (Array (_ BitVec 32) (_ BitVec 64))) (size!31005 (_ BitVec 32))) )
))
(declare-fun lt!443606 () array!63366)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63366 (_ BitVec 32)) SeekEntryResult!9370)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003579 (= res!672300 (not (= lt!443603 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443605 mask!3464) lt!443605 lt!443606 mask!3464))))))

(declare-fun a!3219 () array!63366)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1003579 (= lt!443605 (select (store (arr!30502 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1003579 (= lt!443606 (array!63367 (store (arr!30502 a!3219) i!1194 k0!2224) (size!31005 a!3219)))))

(declare-fun b!1003580 () Bool)

(declare-fun res!672301 () Bool)

(declare-fun e!565494 () Bool)

(assert (=> b!1003580 (=> (not res!672301) (not e!565494))))

(declare-datatypes ((List!21149 0))(
  ( (Nil!21146) (Cons!21145 (h!22331 (_ BitVec 64)) (t!30142 List!21149)) )
))
(declare-fun arrayNoDuplicates!0 (array!63366 (_ BitVec 32) List!21149) Bool)

(assert (=> b!1003580 (= res!672301 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21146))))

(declare-fun b!1003581 () Bool)

(declare-fun res!672309 () Bool)

(declare-fun e!565493 () Bool)

(assert (=> b!1003581 (=> (not res!672309) (not e!565493))))

(declare-fun lt!443607 () SeekEntryResult!9370)

(declare-fun lt!443609 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1003581 (= res!672309 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443609 (select (arr!30502 a!3219) j!170) a!3219 mask!3464) lt!443607))))

(declare-fun b!1003582 () Bool)

(declare-fun res!672298 () Bool)

(assert (=> b!1003582 (=> (not res!672298) (not e!565489))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1003582 (= res!672298 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1003583 () Bool)

(declare-fun res!672311 () Bool)

(declare-fun e!565488 () Bool)

(assert (=> b!1003583 (=> (not res!672311) (not e!565488))))

(declare-fun arrayContainsKey!0 (array!63366 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1003583 (= res!672311 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1003584 () Bool)

(declare-fun res!672307 () Bool)

(assert (=> b!1003584 (=> (not res!672307) (not e!565494))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1003584 (= res!672307 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31005 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31005 a!3219))))))

(declare-fun b!1003585 () Bool)

(declare-fun res!672308 () Bool)

(assert (=> b!1003585 (=> (not res!672308) (not e!565488))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1003585 (= res!672308 (validKeyInArray!0 (select (arr!30502 a!3219) j!170)))))

(declare-fun b!1003586 () Bool)

(assert (=> b!1003586 (= e!565493 false)))

(declare-fun lt!443602 () SeekEntryResult!9370)

(assert (=> b!1003586 (= lt!443602 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443609 lt!443605 lt!443606 mask!3464))))

(declare-fun b!1003587 () Bool)

(declare-fun e!565490 () Bool)

(assert (=> b!1003587 (= e!565494 e!565490)))

(declare-fun res!672299 () Bool)

(assert (=> b!1003587 (=> (not res!672299) (not e!565490))))

(assert (=> b!1003587 (= res!672299 (= lt!443603 lt!443607))))

(assert (=> b!1003587 (= lt!443607 (Intermediate!9370 false resIndex!38 resX!38))))

(assert (=> b!1003587 (= lt!443603 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30502 a!3219) j!170) mask!3464) (select (arr!30502 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003588 () Bool)

(assert (=> b!1003588 (= e!565489 e!565493)))

(declare-fun res!672302 () Bool)

(assert (=> b!1003588 (=> (not res!672302) (not e!565493))))

(assert (=> b!1003588 (= res!672302 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443609 #b00000000000000000000000000000000) (bvslt lt!443609 (size!31005 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003588 (= lt!443609 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1003589 () Bool)

(declare-fun res!672297 () Bool)

(assert (=> b!1003589 (=> (not res!672297) (not e!565489))))

(declare-fun lt!443604 () SeekEntryResult!9370)

(assert (=> b!1003589 (= res!672297 (not (= lt!443604 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443605 lt!443606 mask!3464))))))

(declare-fun b!1003590 () Bool)

(declare-fun res!672305 () Bool)

(assert (=> b!1003590 (=> (not res!672305) (not e!565488))))

(assert (=> b!1003590 (= res!672305 (validKeyInArray!0 k0!2224))))

(declare-fun res!672310 () Bool)

(assert (=> start!86746 (=> (not res!672310) (not e!565488))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86746 (= res!672310 (validMask!0 mask!3464))))

(assert (=> start!86746 e!565488))

(declare-fun array_inv!23638 (array!63366) Bool)

(assert (=> start!86746 (array_inv!23638 a!3219)))

(assert (=> start!86746 true))

(declare-fun b!1003591 () Bool)

(assert (=> b!1003591 (= e!565490 e!565492)))

(declare-fun res!672303 () Bool)

(assert (=> b!1003591 (=> (not res!672303) (not e!565492))))

(assert (=> b!1003591 (= res!672303 (= lt!443604 lt!443607))))

(assert (=> b!1003591 (= lt!443604 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30502 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003592 () Bool)

(assert (=> b!1003592 (= e!565488 e!565494)))

(declare-fun res!672306 () Bool)

(assert (=> b!1003592 (=> (not res!672306) (not e!565494))))

(declare-fun lt!443608 () SeekEntryResult!9370)

(assert (=> b!1003592 (= res!672306 (or (= lt!443608 (MissingVacant!9370 i!1194)) (= lt!443608 (MissingZero!9370 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63366 (_ BitVec 32)) SeekEntryResult!9370)

(assert (=> b!1003592 (= lt!443608 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1003593 () Bool)

(declare-fun res!672304 () Bool)

(assert (=> b!1003593 (=> (not res!672304) (not e!565494))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63366 (_ BitVec 32)) Bool)

(assert (=> b!1003593 (= res!672304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1003594 () Bool)

(declare-fun res!672296 () Bool)

(assert (=> b!1003594 (=> (not res!672296) (not e!565488))))

(assert (=> b!1003594 (= res!672296 (and (= (size!31005 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31005 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31005 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86746 res!672310) b!1003594))

(assert (= (and b!1003594 res!672296) b!1003585))

(assert (= (and b!1003585 res!672308) b!1003590))

(assert (= (and b!1003590 res!672305) b!1003583))

(assert (= (and b!1003583 res!672311) b!1003592))

(assert (= (and b!1003592 res!672306) b!1003593))

(assert (= (and b!1003593 res!672304) b!1003580))

(assert (= (and b!1003580 res!672301) b!1003584))

(assert (= (and b!1003584 res!672307) b!1003587))

(assert (= (and b!1003587 res!672299) b!1003591))

(assert (= (and b!1003591 res!672303) b!1003579))

(assert (= (and b!1003579 res!672300) b!1003589))

(assert (= (and b!1003589 res!672297) b!1003582))

(assert (= (and b!1003582 res!672298) b!1003588))

(assert (= (and b!1003588 res!672302) b!1003581))

(assert (= (and b!1003581 res!672309) b!1003586))

(declare-fun m!929753 () Bool)

(assert (=> b!1003592 m!929753))

(declare-fun m!929755 () Bool)

(assert (=> b!1003579 m!929755))

(assert (=> b!1003579 m!929755))

(declare-fun m!929757 () Bool)

(assert (=> b!1003579 m!929757))

(declare-fun m!929759 () Bool)

(assert (=> b!1003579 m!929759))

(declare-fun m!929761 () Bool)

(assert (=> b!1003579 m!929761))

(declare-fun m!929763 () Bool)

(assert (=> b!1003587 m!929763))

(assert (=> b!1003587 m!929763))

(declare-fun m!929765 () Bool)

(assert (=> b!1003587 m!929765))

(assert (=> b!1003587 m!929765))

(assert (=> b!1003587 m!929763))

(declare-fun m!929767 () Bool)

(assert (=> b!1003587 m!929767))

(declare-fun m!929769 () Bool)

(assert (=> b!1003590 m!929769))

(assert (=> b!1003591 m!929763))

(assert (=> b!1003591 m!929763))

(declare-fun m!929771 () Bool)

(assert (=> b!1003591 m!929771))

(assert (=> b!1003581 m!929763))

(assert (=> b!1003581 m!929763))

(declare-fun m!929773 () Bool)

(assert (=> b!1003581 m!929773))

(declare-fun m!929775 () Bool)

(assert (=> b!1003589 m!929775))

(declare-fun m!929777 () Bool)

(assert (=> b!1003593 m!929777))

(assert (=> b!1003585 m!929763))

(assert (=> b!1003585 m!929763))

(declare-fun m!929779 () Bool)

(assert (=> b!1003585 m!929779))

(declare-fun m!929781 () Bool)

(assert (=> b!1003580 m!929781))

(declare-fun m!929783 () Bool)

(assert (=> b!1003583 m!929783))

(declare-fun m!929785 () Bool)

(assert (=> start!86746 m!929785))

(declare-fun m!929787 () Bool)

(assert (=> start!86746 m!929787))

(declare-fun m!929789 () Bool)

(assert (=> b!1003588 m!929789))

(declare-fun m!929791 () Bool)

(assert (=> b!1003586 m!929791))

(check-sat (not b!1003581) (not b!1003583) (not b!1003585) (not b!1003586) (not b!1003587) (not b!1003592) (not b!1003579) (not b!1003593) (not b!1003590) (not b!1003588) (not b!1003580) (not start!86746) (not b!1003591) (not b!1003589))
(check-sat)
