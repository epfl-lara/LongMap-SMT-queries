; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49500 () Bool)

(assert start!49500)

(declare-fun b!544583 () Bool)

(declare-fun res!338840 () Bool)

(declare-fun e!314823 () Bool)

(assert (=> b!544583 (=> (not res!338840) (not e!314823))))

(declare-datatypes ((array!34380 0))(
  ( (array!34381 (arr!16520 (Array (_ BitVec 32) (_ BitVec 64))) (size!16885 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34380)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34380 (_ BitVec 32)) Bool)

(assert (=> b!544583 (= res!338840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!544584 () Bool)

(declare-fun res!338829 () Bool)

(declare-fun e!314820 () Bool)

(assert (=> b!544584 (=> (not res!338829) (not e!314820))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34380 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!544584 (= res!338829 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!544585 () Bool)

(declare-fun res!338833 () Bool)

(assert (=> b!544585 (=> (not res!338833) (not e!314820))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!544585 (= res!338833 (and (= (size!16885 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16885 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16885 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!338837 () Bool)

(assert (=> start!49500 (=> (not res!338837) (not e!314820))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49500 (= res!338837 (validMask!0 mask!3216))))

(assert (=> start!49500 e!314820))

(assert (=> start!49500 true))

(declare-fun array_inv!12403 (array!34380) Bool)

(assert (=> start!49500 (array_inv!12403 a!3154)))

(declare-fun b!544586 () Bool)

(declare-fun e!314822 () Bool)

(assert (=> b!544586 (= e!314822 false)))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!248401 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!544586 (= lt!248401 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!544587 () Bool)

(declare-fun res!338836 () Bool)

(assert (=> b!544587 (=> (not res!338836) (not e!314823))))

(declare-datatypes ((List!10678 0))(
  ( (Nil!10675) (Cons!10674 (h!11635 (_ BitVec 64)) (t!16897 List!10678)) )
))
(declare-fun arrayNoDuplicates!0 (array!34380 (_ BitVec 32) List!10678) Bool)

(assert (=> b!544587 (= res!338836 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10675))))

(declare-fun b!544588 () Bool)

(assert (=> b!544588 (= e!314820 e!314823)))

(declare-fun res!338830 () Bool)

(assert (=> b!544588 (=> (not res!338830) (not e!314823))))

(declare-datatypes ((SeekEntryResult!4975 0))(
  ( (MissingZero!4975 (index!22124 (_ BitVec 32))) (Found!4975 (index!22125 (_ BitVec 32))) (Intermediate!4975 (undefined!5787 Bool) (index!22126 (_ BitVec 32)) (x!51057 (_ BitVec 32))) (Undefined!4975) (MissingVacant!4975 (index!22127 (_ BitVec 32))) )
))
(declare-fun lt!248400 () SeekEntryResult!4975)

(assert (=> b!544588 (= res!338830 (or (= lt!248400 (MissingZero!4975 i!1153)) (= lt!248400 (MissingVacant!4975 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34380 (_ BitVec 32)) SeekEntryResult!4975)

(assert (=> b!544588 (= lt!248400 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!544589 () Bool)

(declare-fun res!338839 () Bool)

(assert (=> b!544589 (=> (not res!338839) (not e!314822))))

(declare-fun lt!248399 () SeekEntryResult!4975)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34380 (_ BitVec 32)) SeekEntryResult!4975)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!544589 (= res!338839 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16520 a!3154) j!147) mask!3216) (select (arr!16520 a!3154) j!147) a!3154 mask!3216) lt!248399))))

(declare-fun b!544590 () Bool)

(declare-fun res!338831 () Bool)

(assert (=> b!544590 (=> (not res!338831) (not e!314823))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!544590 (= res!338831 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16885 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16885 a!3154)) (= (select (arr!16520 a!3154) resIndex!32) (select (arr!16520 a!3154) j!147))))))

(declare-fun b!544591 () Bool)

(declare-fun res!338832 () Bool)

(assert (=> b!544591 (=> (not res!338832) (not e!314820))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!544591 (= res!338832 (validKeyInArray!0 (select (arr!16520 a!3154) j!147)))))

(declare-fun b!544592 () Bool)

(assert (=> b!544592 (= e!314823 e!314822)))

(declare-fun res!338834 () Bool)

(assert (=> b!544592 (=> (not res!338834) (not e!314822))))

(assert (=> b!544592 (= res!338834 (= lt!248399 (Intermediate!4975 false resIndex!32 resX!32)))))

(assert (=> b!544592 (= lt!248399 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16520 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!544593 () Bool)

(declare-fun res!338838 () Bool)

(assert (=> b!544593 (=> (not res!338838) (not e!314822))))

(assert (=> b!544593 (= res!338838 (and (not (= (select (arr!16520 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16520 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16520 a!3154) index!1177) (select (arr!16520 a!3154) j!147)))))))

(declare-fun b!544594 () Bool)

(declare-fun res!338835 () Bool)

(assert (=> b!544594 (=> (not res!338835) (not e!314820))))

(assert (=> b!544594 (= res!338835 (validKeyInArray!0 k0!1998))))

(assert (= (and start!49500 res!338837) b!544585))

(assert (= (and b!544585 res!338833) b!544591))

(assert (= (and b!544591 res!338832) b!544594))

(assert (= (and b!544594 res!338835) b!544584))

(assert (= (and b!544584 res!338829) b!544588))

(assert (= (and b!544588 res!338830) b!544583))

(assert (= (and b!544583 res!338840) b!544587))

(assert (= (and b!544587 res!338836) b!544590))

(assert (= (and b!544590 res!338831) b!544592))

(assert (= (and b!544592 res!338834) b!544589))

(assert (= (and b!544589 res!338839) b!544593))

(assert (= (and b!544593 res!338838) b!544586))

(declare-fun m!521851 () Bool)

(assert (=> b!544591 m!521851))

(assert (=> b!544591 m!521851))

(declare-fun m!521853 () Bool)

(assert (=> b!544591 m!521853))

(declare-fun m!521855 () Bool)

(assert (=> b!544584 m!521855))

(declare-fun m!521857 () Bool)

(assert (=> b!544593 m!521857))

(assert (=> b!544593 m!521851))

(declare-fun m!521859 () Bool)

(assert (=> b!544583 m!521859))

(assert (=> b!544589 m!521851))

(assert (=> b!544589 m!521851))

(declare-fun m!521861 () Bool)

(assert (=> b!544589 m!521861))

(assert (=> b!544589 m!521861))

(assert (=> b!544589 m!521851))

(declare-fun m!521863 () Bool)

(assert (=> b!544589 m!521863))

(declare-fun m!521865 () Bool)

(assert (=> b!544588 m!521865))

(declare-fun m!521867 () Bool)

(assert (=> b!544586 m!521867))

(declare-fun m!521869 () Bool)

(assert (=> b!544590 m!521869))

(assert (=> b!544590 m!521851))

(declare-fun m!521871 () Bool)

(assert (=> b!544594 m!521871))

(declare-fun m!521873 () Bool)

(assert (=> start!49500 m!521873))

(declare-fun m!521875 () Bool)

(assert (=> start!49500 m!521875))

(declare-fun m!521877 () Bool)

(assert (=> b!544587 m!521877))

(assert (=> b!544592 m!521851))

(assert (=> b!544592 m!521851))

(declare-fun m!521879 () Bool)

(assert (=> b!544592 m!521879))

(check-sat (not b!544591) (not b!544588) (not start!49500) (not b!544584) (not b!544594) (not b!544587) (not b!544592) (not b!544589) (not b!544583) (not b!544586))
(check-sat)
