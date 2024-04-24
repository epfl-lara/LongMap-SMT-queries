; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48910 () Bool)

(assert start!48910)

(declare-fun b!538528 () Bool)

(declare-fun e!312293 () Bool)

(declare-fun e!312291 () Bool)

(assert (=> b!538528 (= e!312293 e!312291)))

(declare-fun res!333628 () Bool)

(assert (=> b!538528 (=> (not res!333628) (not e!312291))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!246821 () (_ BitVec 32))

(declare-datatypes ((array!34070 0))(
  ( (array!34071 (arr!16372 (Array (_ BitVec 32) (_ BitVec 64))) (size!16736 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34070)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!538528 (= res!333628 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246821 #b00000000000000000000000000000000) (bvslt lt!246821 (size!16736 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538528 (= lt!246821 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!538529 () Bool)

(declare-fun res!333638 () Bool)

(declare-fun e!312294 () Bool)

(assert (=> b!538529 (=> (not res!333638) (not e!312294))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538529 (= res!333638 (validKeyInArray!0 k0!1998))))

(declare-fun res!333640 () Bool)

(assert (=> start!48910 (=> (not res!333640) (not e!312294))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48910 (= res!333640 (validMask!0 mask!3216))))

(assert (=> start!48910 e!312294))

(assert (=> start!48910 true))

(declare-fun array_inv!12231 (array!34070) Bool)

(assert (=> start!48910 (array_inv!12231 a!3154)))

(declare-fun b!538530 () Bool)

(declare-fun e!312295 () Bool)

(assert (=> b!538530 (= e!312291 e!312295)))

(declare-fun res!333630 () Bool)

(assert (=> b!538530 (=> (not res!333630) (not e!312295))))

(declare-datatypes ((SeekEntryResult!4786 0))(
  ( (MissingZero!4786 (index!21368 (_ BitVec 32))) (Found!4786 (index!21369 (_ BitVec 32))) (Intermediate!4786 (undefined!5598 Bool) (index!21370 (_ BitVec 32)) (x!50444 (_ BitVec 32))) (Undefined!4786) (MissingVacant!4786 (index!21371 (_ BitVec 32))) )
))
(declare-fun lt!246823 () SeekEntryResult!4786)

(declare-fun lt!246819 () SeekEntryResult!4786)

(declare-fun lt!246818 () SeekEntryResult!4786)

(assert (=> b!538530 (= res!333630 (and (= lt!246823 lt!246819) (= lt!246818 lt!246823)))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34070 (_ BitVec 32)) SeekEntryResult!4786)

(assert (=> b!538530 (= lt!246823 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246821 (select (arr!16372 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538531 () Bool)

(declare-fun e!312292 () Bool)

(declare-fun e!312296 () Bool)

(assert (=> b!538531 (= e!312292 e!312296)))

(declare-fun res!333631 () Bool)

(assert (=> b!538531 (=> (not res!333631) (not e!312296))))

(declare-fun lt!246822 () SeekEntryResult!4786)

(assert (=> b!538531 (= res!333631 (= lt!246822 lt!246819))))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!538531 (= lt!246819 (Intermediate!4786 false resIndex!32 resX!32))))

(assert (=> b!538531 (= lt!246822 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16372 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538532 () Bool)

(declare-fun res!333633 () Bool)

(assert (=> b!538532 (=> (not res!333633) (not e!312292))))

(declare-datatypes ((List!10398 0))(
  ( (Nil!10395) (Cons!10394 (h!11340 (_ BitVec 64)) (t!16618 List!10398)) )
))
(declare-fun arrayNoDuplicates!0 (array!34070 (_ BitVec 32) List!10398) Bool)

(assert (=> b!538532 (= res!333633 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10395))))

(declare-fun b!538533 () Bool)

(declare-fun res!333632 () Bool)

(assert (=> b!538533 (=> (not res!333632) (not e!312292))))

(assert (=> b!538533 (= res!333632 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16736 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16736 a!3154)) (= (select (arr!16372 a!3154) resIndex!32) (select (arr!16372 a!3154) j!147))))))

(declare-fun b!538534 () Bool)

(assert (=> b!538534 (= e!312296 e!312293)))

(declare-fun res!333636 () Bool)

(assert (=> b!538534 (=> (not res!333636) (not e!312293))))

(assert (=> b!538534 (= res!333636 (and (= lt!246818 lt!246822) (not (= (select (arr!16372 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16372 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16372 a!3154) index!1177) (select (arr!16372 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538534 (= lt!246818 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16372 a!3154) j!147) mask!3216) (select (arr!16372 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538535 () Bool)

(declare-fun res!333635 () Bool)

(assert (=> b!538535 (=> (not res!333635) (not e!312294))))

(declare-fun arrayContainsKey!0 (array!34070 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538535 (= res!333635 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538536 () Bool)

(declare-fun res!333629 () Bool)

(assert (=> b!538536 (=> (not res!333629) (not e!312292))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34070 (_ BitVec 32)) Bool)

(assert (=> b!538536 (= res!333629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!538537 () Bool)

(declare-fun res!333634 () Bool)

(assert (=> b!538537 (=> (not res!333634) (not e!312294))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!538537 (= res!333634 (and (= (size!16736 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16736 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16736 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538538 () Bool)

(assert (=> b!538538 (= e!312295 (not (bvsge mask!3216 #b00000000000000000000000000000000)))))

(assert (=> b!538538 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246821 (select (store (arr!16372 a!3154) i!1153 k0!1998) j!147) (array!34071 (store (arr!16372 a!3154) i!1153 k0!1998) (size!16736 a!3154)) mask!3216) lt!246819)))

(declare-datatypes ((Unit!16829 0))(
  ( (Unit!16830) )
))
(declare-fun lt!246820 () Unit!16829)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34070 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16829)

(assert (=> b!538538 (= lt!246820 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k0!1998 j!147 lt!246821 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!538539 () Bool)

(assert (=> b!538539 (= e!312294 e!312292)))

(declare-fun res!333637 () Bool)

(assert (=> b!538539 (=> (not res!333637) (not e!312292))))

(declare-fun lt!246817 () SeekEntryResult!4786)

(assert (=> b!538539 (= res!333637 (or (= lt!246817 (MissingZero!4786 i!1153)) (= lt!246817 (MissingVacant!4786 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34070 (_ BitVec 32)) SeekEntryResult!4786)

(assert (=> b!538539 (= lt!246817 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!538540 () Bool)

(declare-fun res!333639 () Bool)

(assert (=> b!538540 (=> (not res!333639) (not e!312294))))

(assert (=> b!538540 (= res!333639 (validKeyInArray!0 (select (arr!16372 a!3154) j!147)))))

(assert (= (and start!48910 res!333640) b!538537))

(assert (= (and b!538537 res!333634) b!538540))

(assert (= (and b!538540 res!333639) b!538529))

(assert (= (and b!538529 res!333638) b!538535))

(assert (= (and b!538535 res!333635) b!538539))

(assert (= (and b!538539 res!333637) b!538536))

(assert (= (and b!538536 res!333629) b!538532))

(assert (= (and b!538532 res!333633) b!538533))

(assert (= (and b!538533 res!333632) b!538531))

(assert (= (and b!538531 res!333631) b!538534))

(assert (= (and b!538534 res!333636) b!538528))

(assert (= (and b!538528 res!333628) b!538530))

(assert (= (and b!538530 res!333630) b!538538))

(declare-fun m!517747 () Bool)

(assert (=> b!538536 m!517747))

(declare-fun m!517749 () Bool)

(assert (=> b!538529 m!517749))

(declare-fun m!517751 () Bool)

(assert (=> b!538532 m!517751))

(declare-fun m!517753 () Bool)

(assert (=> b!538531 m!517753))

(assert (=> b!538531 m!517753))

(declare-fun m!517755 () Bool)

(assert (=> b!538531 m!517755))

(declare-fun m!517757 () Bool)

(assert (=> b!538539 m!517757))

(declare-fun m!517759 () Bool)

(assert (=> b!538533 m!517759))

(assert (=> b!538533 m!517753))

(declare-fun m!517761 () Bool)

(assert (=> start!48910 m!517761))

(declare-fun m!517763 () Bool)

(assert (=> start!48910 m!517763))

(declare-fun m!517765 () Bool)

(assert (=> b!538538 m!517765))

(declare-fun m!517767 () Bool)

(assert (=> b!538538 m!517767))

(assert (=> b!538538 m!517767))

(declare-fun m!517769 () Bool)

(assert (=> b!538538 m!517769))

(declare-fun m!517771 () Bool)

(assert (=> b!538538 m!517771))

(assert (=> b!538530 m!517753))

(assert (=> b!538530 m!517753))

(declare-fun m!517773 () Bool)

(assert (=> b!538530 m!517773))

(assert (=> b!538540 m!517753))

(assert (=> b!538540 m!517753))

(declare-fun m!517775 () Bool)

(assert (=> b!538540 m!517775))

(declare-fun m!517777 () Bool)

(assert (=> b!538528 m!517777))

(declare-fun m!517779 () Bool)

(assert (=> b!538535 m!517779))

(declare-fun m!517781 () Bool)

(assert (=> b!538534 m!517781))

(assert (=> b!538534 m!517753))

(assert (=> b!538534 m!517753))

(declare-fun m!517783 () Bool)

(assert (=> b!538534 m!517783))

(assert (=> b!538534 m!517783))

(assert (=> b!538534 m!517753))

(declare-fun m!517785 () Bool)

(assert (=> b!538534 m!517785))

(check-sat (not b!538530) (not b!538538) (not b!538539) (not b!538528) (not start!48910) (not b!538531) (not b!538536) (not b!538529) (not b!538532) (not b!538540) (not b!538534) (not b!538535))
(check-sat)
