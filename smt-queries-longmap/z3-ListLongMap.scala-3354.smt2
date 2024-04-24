; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46106 () Bool)

(assert start!46106)

(declare-fun b!510803 () Bool)

(declare-fun res!311706 () Bool)

(declare-fun e!298517 () Bool)

(assert (=> b!510803 (=> (not res!311706) (not e!298517))))

(declare-datatypes ((array!32818 0))(
  ( (array!32819 (arr!15787 (Array (_ BitVec 32) (_ BitVec 64))) (size!16151 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32818)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32818 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510803 (= res!311706 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510804 () Bool)

(declare-fun e!298518 () Bool)

(assert (=> b!510804 (= e!298518 (not true))))

(declare-datatypes ((SeekEntryResult!4210 0))(
  ( (MissingZero!4210 (index!19028 (_ BitVec 32))) (Found!4210 (index!19029 (_ BitVec 32))) (Intermediate!4210 (undefined!5022 Bool) (index!19030 (_ BitVec 32)) (x!48128 (_ BitVec 32))) (Undefined!4210) (MissingVacant!4210 (index!19031 (_ BitVec 32))) )
))
(declare-fun lt!233679 () SeekEntryResult!4210)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!233682 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32818 (_ BitVec 32)) SeekEntryResult!4210)

(assert (=> b!510804 (= lt!233679 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233682 (select (store (arr!15787 a!3235) i!1204 k0!2280) j!176) (array!32819 (store (arr!15787 a!3235) i!1204 k0!2280) (size!16151 a!3235)) mask!3524))))

(declare-fun lt!233678 () (_ BitVec 32))

(declare-fun lt!233683 () SeekEntryResult!4210)

(assert (=> b!510804 (= lt!233683 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233678 (select (arr!15787 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510804 (= lt!233682 (toIndex!0 (select (store (arr!15787 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!510804 (= lt!233678 (toIndex!0 (select (arr!15787 a!3235) j!176) mask!3524))))

(declare-fun e!298515 () Bool)

(assert (=> b!510804 e!298515))

(declare-fun res!311702 () Bool)

(assert (=> b!510804 (=> (not res!311702) (not e!298515))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32818 (_ BitVec 32)) Bool)

(assert (=> b!510804 (= res!311702 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15739 0))(
  ( (Unit!15740) )
))
(declare-fun lt!233680 () Unit!15739)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32818 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15739)

(assert (=> b!510804 (= lt!233680 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510805 () Bool)

(declare-fun res!311707 () Bool)

(assert (=> b!510805 (=> (not res!311707) (not e!298517))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510805 (= res!311707 (validKeyInArray!0 k0!2280))))

(declare-fun b!510806 () Bool)

(declare-fun res!311705 () Bool)

(assert (=> b!510806 (=> (not res!311705) (not e!298518))))

(assert (=> b!510806 (= res!311705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510807 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32818 (_ BitVec 32)) SeekEntryResult!4210)

(assert (=> b!510807 (= e!298515 (= (seekEntryOrOpen!0 (select (arr!15787 a!3235) j!176) a!3235 mask!3524) (Found!4210 j!176)))))

(declare-fun b!510808 () Bool)

(assert (=> b!510808 (= e!298517 e!298518)))

(declare-fun res!311710 () Bool)

(assert (=> b!510808 (=> (not res!311710) (not e!298518))))

(declare-fun lt!233681 () SeekEntryResult!4210)

(assert (=> b!510808 (= res!311710 (or (= lt!233681 (MissingZero!4210 i!1204)) (= lt!233681 (MissingVacant!4210 i!1204))))))

(assert (=> b!510808 (= lt!233681 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!510809 () Bool)

(declare-fun res!311704 () Bool)

(assert (=> b!510809 (=> (not res!311704) (not e!298517))))

(assert (=> b!510809 (= res!311704 (validKeyInArray!0 (select (arr!15787 a!3235) j!176)))))

(declare-fun res!311709 () Bool)

(assert (=> start!46106 (=> (not res!311709) (not e!298517))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46106 (= res!311709 (validMask!0 mask!3524))))

(assert (=> start!46106 e!298517))

(assert (=> start!46106 true))

(declare-fun array_inv!11646 (array!32818) Bool)

(assert (=> start!46106 (array_inv!11646 a!3235)))

(declare-fun b!510810 () Bool)

(declare-fun res!311703 () Bool)

(assert (=> b!510810 (=> (not res!311703) (not e!298517))))

(assert (=> b!510810 (= res!311703 (and (= (size!16151 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16151 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16151 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510811 () Bool)

(declare-fun res!311708 () Bool)

(assert (=> b!510811 (=> (not res!311708) (not e!298518))))

(declare-datatypes ((List!9852 0))(
  ( (Nil!9849) (Cons!9848 (h!10725 (_ BitVec 64)) (t!16072 List!9852)) )
))
(declare-fun arrayNoDuplicates!0 (array!32818 (_ BitVec 32) List!9852) Bool)

(assert (=> b!510811 (= res!311708 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9849))))

(assert (= (and start!46106 res!311709) b!510810))

(assert (= (and b!510810 res!311703) b!510809))

(assert (= (and b!510809 res!311704) b!510805))

(assert (= (and b!510805 res!311707) b!510803))

(assert (= (and b!510803 res!311706) b!510808))

(assert (= (and b!510808 res!311710) b!510806))

(assert (= (and b!510806 res!311705) b!510811))

(assert (= (and b!510811 res!311708) b!510804))

(assert (= (and b!510804 res!311702) b!510807))

(declare-fun m!492505 () Bool)

(assert (=> b!510809 m!492505))

(assert (=> b!510809 m!492505))

(declare-fun m!492507 () Bool)

(assert (=> b!510809 m!492507))

(declare-fun m!492509 () Bool)

(assert (=> start!46106 m!492509))

(declare-fun m!492511 () Bool)

(assert (=> start!46106 m!492511))

(assert (=> b!510807 m!492505))

(assert (=> b!510807 m!492505))

(declare-fun m!492513 () Bool)

(assert (=> b!510807 m!492513))

(declare-fun m!492515 () Bool)

(assert (=> b!510803 m!492515))

(declare-fun m!492517 () Bool)

(assert (=> b!510805 m!492517))

(declare-fun m!492519 () Bool)

(assert (=> b!510811 m!492519))

(declare-fun m!492521 () Bool)

(assert (=> b!510804 m!492521))

(assert (=> b!510804 m!492505))

(declare-fun m!492523 () Bool)

(assert (=> b!510804 m!492523))

(declare-fun m!492525 () Bool)

(assert (=> b!510804 m!492525))

(declare-fun m!492527 () Bool)

(assert (=> b!510804 m!492527))

(assert (=> b!510804 m!492527))

(declare-fun m!492529 () Bool)

(assert (=> b!510804 m!492529))

(assert (=> b!510804 m!492505))

(declare-fun m!492531 () Bool)

(assert (=> b!510804 m!492531))

(assert (=> b!510804 m!492505))

(declare-fun m!492533 () Bool)

(assert (=> b!510804 m!492533))

(assert (=> b!510804 m!492527))

(declare-fun m!492535 () Bool)

(assert (=> b!510804 m!492535))

(declare-fun m!492537 () Bool)

(assert (=> b!510806 m!492537))

(declare-fun m!492539 () Bool)

(assert (=> b!510808 m!492539))

(check-sat (not b!510809) (not b!510811) (not start!46106) (not b!510807) (not b!510803) (not b!510806) (not b!510808) (not b!510804) (not b!510805))
(check-sat)
