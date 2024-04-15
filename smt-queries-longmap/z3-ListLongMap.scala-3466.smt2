; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48114 () Bool)

(assert start!48114)

(declare-fun b!529767 () Bool)

(declare-fun res!325616 () Bool)

(declare-fun e!308673 () Bool)

(assert (=> b!529767 (=> (not res!325616) (not e!308673))))

(declare-datatypes ((array!33560 0))(
  ( (array!33561 (arr!16127 (Array (_ BitVec 32) (_ BitVec 64))) (size!16492 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33560)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33560 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!529767 (= res!325616 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!529768 () Bool)

(declare-fun res!325620 () Bool)

(assert (=> b!529768 (=> (not res!325620) (not e!308673))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!529768 (= res!325620 (validKeyInArray!0 k0!2280))))

(declare-fun b!529769 () Bool)

(declare-fun res!325617 () Bool)

(declare-fun e!308669 () Bool)

(assert (=> b!529769 (=> (not res!325617) (not e!308669))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33560 (_ BitVec 32)) Bool)

(assert (=> b!529769 (= res!325617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!529770 () Bool)

(declare-fun e!308668 () Bool)

(declare-fun e!308672 () Bool)

(assert (=> b!529770 (= e!308668 e!308672)))

(declare-fun res!325618 () Bool)

(assert (=> b!529770 (=> res!325618 e!308672)))

(declare-fun lt!244224 () Bool)

(declare-datatypes ((SeekEntryResult!4591 0))(
  ( (MissingZero!4591 (index!20588 (_ BitVec 32))) (Found!4591 (index!20589 (_ BitVec 32))) (Intermediate!4591 (undefined!5403 Bool) (index!20590 (_ BitVec 32)) (x!49568 (_ BitVec 32))) (Undefined!4591) (MissingVacant!4591 (index!20591 (_ BitVec 32))) )
))
(declare-fun lt!244222 () SeekEntryResult!4591)

(assert (=> b!529770 (= res!325618 (or (and (not lt!244224) (undefined!5403 lt!244222)) (and (not lt!244224) (not (undefined!5403 lt!244222)))))))

(get-info :version)

(assert (=> b!529770 (= lt!244224 (not ((_ is Intermediate!4591) lt!244222)))))

(declare-fun b!529771 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!308670 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33560 (_ BitVec 32)) SeekEntryResult!4591)

(assert (=> b!529771 (= e!308670 (= (seekEntryOrOpen!0 (select (arr!16127 a!3235) j!176) a!3235 mask!3524) (Found!4591 j!176)))))

(declare-fun b!529772 () Bool)

(assert (=> b!529772 (= e!308672 true)))

(declare-fun lt!244221 () SeekEntryResult!4591)

(declare-fun lt!244217 () array!33560)

(declare-fun lt!244219 () (_ BitVec 64))

(assert (=> b!529772 (= lt!244221 (seekEntryOrOpen!0 lt!244219 lt!244217 mask!3524))))

(assert (=> b!529772 false))

(declare-fun b!529773 () Bool)

(assert (=> b!529773 (= e!308673 e!308669)))

(declare-fun res!325622 () Bool)

(assert (=> b!529773 (=> (not res!325622) (not e!308669))))

(declare-fun lt!244218 () SeekEntryResult!4591)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!529773 (= res!325622 (or (= lt!244218 (MissingZero!4591 i!1204)) (= lt!244218 (MissingVacant!4591 i!1204))))))

(assert (=> b!529773 (= lt!244218 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!529775 () Bool)

(assert (=> b!529775 (= e!308669 (not e!308668))))

(declare-fun res!325623 () Bool)

(assert (=> b!529775 (=> res!325623 e!308668)))

(declare-fun lt!244223 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33560 (_ BitVec 32)) SeekEntryResult!4591)

(assert (=> b!529775 (= res!325623 (= lt!244222 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244223 lt!244219 lt!244217 mask!3524)))))

(declare-fun lt!244225 () (_ BitVec 32))

(assert (=> b!529775 (= lt!244222 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244225 (select (arr!16127 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!529775 (= lt!244223 (toIndex!0 lt!244219 mask!3524))))

(assert (=> b!529775 (= lt!244219 (select (store (arr!16127 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!529775 (= lt!244225 (toIndex!0 (select (arr!16127 a!3235) j!176) mask!3524))))

(assert (=> b!529775 (= lt!244217 (array!33561 (store (arr!16127 a!3235) i!1204 k0!2280) (size!16492 a!3235)))))

(assert (=> b!529775 e!308670))

(declare-fun res!325624 () Bool)

(assert (=> b!529775 (=> (not res!325624) (not e!308670))))

(assert (=> b!529775 (= res!325624 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16780 0))(
  ( (Unit!16781) )
))
(declare-fun lt!244220 () Unit!16780)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33560 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16780)

(assert (=> b!529775 (= lt!244220 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!529776 () Bool)

(declare-fun res!325619 () Bool)

(assert (=> b!529776 (=> (not res!325619) (not e!308669))))

(declare-datatypes ((List!10324 0))(
  ( (Nil!10321) (Cons!10320 (h!11260 (_ BitVec 64)) (t!16543 List!10324)) )
))
(declare-fun arrayNoDuplicates!0 (array!33560 (_ BitVec 32) List!10324) Bool)

(assert (=> b!529776 (= res!325619 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10321))))

(declare-fun b!529777 () Bool)

(declare-fun res!325615 () Bool)

(assert (=> b!529777 (=> (not res!325615) (not e!308673))))

(assert (=> b!529777 (= res!325615 (validKeyInArray!0 (select (arr!16127 a!3235) j!176)))))

(declare-fun res!325621 () Bool)

(assert (=> start!48114 (=> (not res!325621) (not e!308673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48114 (= res!325621 (validMask!0 mask!3524))))

(assert (=> start!48114 e!308673))

(assert (=> start!48114 true))

(declare-fun array_inv!12010 (array!33560) Bool)

(assert (=> start!48114 (array_inv!12010 a!3235)))

(declare-fun b!529774 () Bool)

(declare-fun res!325625 () Bool)

(assert (=> b!529774 (=> (not res!325625) (not e!308673))))

(assert (=> b!529774 (= res!325625 (and (= (size!16492 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16492 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16492 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!48114 res!325621) b!529774))

(assert (= (and b!529774 res!325625) b!529777))

(assert (= (and b!529777 res!325615) b!529768))

(assert (= (and b!529768 res!325620) b!529767))

(assert (= (and b!529767 res!325616) b!529773))

(assert (= (and b!529773 res!325622) b!529769))

(assert (= (and b!529769 res!325617) b!529776))

(assert (= (and b!529776 res!325619) b!529775))

(assert (= (and b!529775 res!325624) b!529771))

(assert (= (and b!529775 (not res!325623)) b!529770))

(assert (= (and b!529770 (not res!325618)) b!529772))

(declare-fun m!509809 () Bool)

(assert (=> b!529776 m!509809))

(declare-fun m!509811 () Bool)

(assert (=> start!48114 m!509811))

(declare-fun m!509813 () Bool)

(assert (=> start!48114 m!509813))

(declare-fun m!509815 () Bool)

(assert (=> b!529769 m!509815))

(declare-fun m!509817 () Bool)

(assert (=> b!529775 m!509817))

(declare-fun m!509819 () Bool)

(assert (=> b!529775 m!509819))

(declare-fun m!509821 () Bool)

(assert (=> b!529775 m!509821))

(declare-fun m!509823 () Bool)

(assert (=> b!529775 m!509823))

(declare-fun m!509825 () Bool)

(assert (=> b!529775 m!509825))

(assert (=> b!529775 m!509817))

(declare-fun m!509827 () Bool)

(assert (=> b!529775 m!509827))

(declare-fun m!509829 () Bool)

(assert (=> b!529775 m!509829))

(declare-fun m!509831 () Bool)

(assert (=> b!529775 m!509831))

(declare-fun m!509833 () Bool)

(assert (=> b!529775 m!509833))

(assert (=> b!529775 m!509817))

(declare-fun m!509835 () Bool)

(assert (=> b!529773 m!509835))

(declare-fun m!509837 () Bool)

(assert (=> b!529772 m!509837))

(assert (=> b!529771 m!509817))

(assert (=> b!529771 m!509817))

(declare-fun m!509839 () Bool)

(assert (=> b!529771 m!509839))

(declare-fun m!509841 () Bool)

(assert (=> b!529768 m!509841))

(declare-fun m!509843 () Bool)

(assert (=> b!529767 m!509843))

(assert (=> b!529777 m!509817))

(assert (=> b!529777 m!509817))

(declare-fun m!509845 () Bool)

(assert (=> b!529777 m!509845))

(check-sat (not b!529775) (not start!48114) (not b!529773) (not b!529776) (not b!529771) (not b!529768) (not b!529772) (not b!529767) (not b!529769) (not b!529777))
(check-sat)
