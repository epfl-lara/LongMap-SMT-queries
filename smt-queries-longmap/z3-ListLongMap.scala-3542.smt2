; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48824 () Bool)

(assert start!48824)

(declare-fun b!537548 () Bool)

(declare-fun res!332757 () Bool)

(declare-fun e!311841 () Bool)

(assert (=> b!537548 (=> (not res!332757) (not e!311841))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34036 0))(
  ( (array!34037 (arr!16357 (Array (_ BitVec 32) (_ BitVec 64))) (size!16721 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34036)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!537548 (= res!332757 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16721 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16721 a!3154)) (= (select (arr!16357 a!3154) resIndex!32) (select (arr!16357 a!3154) j!147))))))

(declare-fun b!537550 () Bool)

(declare-fun res!332753 () Bool)

(assert (=> b!537550 (=> (not res!332753) (not e!311841))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34036 (_ BitVec 32)) Bool)

(assert (=> b!537550 (= res!332753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!537551 () Bool)

(declare-fun res!332758 () Bool)

(declare-fun e!311843 () Bool)

(assert (=> b!537551 (=> (not res!332758) (not e!311843))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537551 (= res!332758 (validKeyInArray!0 (select (arr!16357 a!3154) j!147)))))

(declare-fun b!537552 () Bool)

(declare-fun res!332762 () Bool)

(assert (=> b!537552 (=> (not res!332762) (not e!311843))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34036 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537552 (= res!332762 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537553 () Bool)

(declare-fun e!311844 () Bool)

(declare-fun e!311842 () Bool)

(assert (=> b!537553 (= e!311844 e!311842)))

(declare-fun res!332756 () Bool)

(assert (=> b!537553 (=> (not res!332756) (not e!311842))))

(declare-fun lt!246437 () (_ BitVec 32))

(assert (=> b!537553 (= res!332756 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246437 #b00000000000000000000000000000000) (bvslt lt!246437 (size!16721 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537553 (= lt!246437 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!537554 () Bool)

(assert (=> b!537554 (= e!311842 false)))

(declare-datatypes ((SeekEntryResult!4815 0))(
  ( (MissingZero!4815 (index!21484 (_ BitVec 32))) (Found!4815 (index!21485 (_ BitVec 32))) (Intermediate!4815 (undefined!5627 Bool) (index!21486 (_ BitVec 32)) (x!50414 (_ BitVec 32))) (Undefined!4815) (MissingVacant!4815 (index!21487 (_ BitVec 32))) )
))
(declare-fun lt!246436 () SeekEntryResult!4815)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34036 (_ BitVec 32)) SeekEntryResult!4815)

(assert (=> b!537554 (= lt!246436 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246437 (select (arr!16357 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537555 () Bool)

(assert (=> b!537555 (= e!311843 e!311841)))

(declare-fun res!332760 () Bool)

(assert (=> b!537555 (=> (not res!332760) (not e!311841))))

(declare-fun lt!246438 () SeekEntryResult!4815)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537555 (= res!332760 (or (= lt!246438 (MissingZero!4815 i!1153)) (= lt!246438 (MissingVacant!4815 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34036 (_ BitVec 32)) SeekEntryResult!4815)

(assert (=> b!537555 (= lt!246438 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!537549 () Bool)

(assert (=> b!537549 (= e!311841 e!311844)))

(declare-fun res!332759 () Bool)

(assert (=> b!537549 (=> (not res!332759) (not e!311844))))

(declare-fun lt!246439 () SeekEntryResult!4815)

(assert (=> b!537549 (= res!332759 (= lt!246439 (Intermediate!4815 false resIndex!32 resX!32)))))

(assert (=> b!537549 (= lt!246439 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16357 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!332754 () Bool)

(assert (=> start!48824 (=> (not res!332754) (not e!311843))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48824 (= res!332754 (validMask!0 mask!3216))))

(assert (=> start!48824 e!311843))

(assert (=> start!48824 true))

(declare-fun array_inv!12153 (array!34036) Bool)

(assert (=> start!48824 (array_inv!12153 a!3154)))

(declare-fun b!537556 () Bool)

(declare-fun res!332761 () Bool)

(assert (=> b!537556 (=> (not res!332761) (not e!311844))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537556 (= res!332761 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16357 a!3154) j!147) mask!3216) (select (arr!16357 a!3154) j!147) a!3154 mask!3216) lt!246439))))

(declare-fun b!537557 () Bool)

(declare-fun res!332763 () Bool)

(assert (=> b!537557 (=> (not res!332763) (not e!311843))))

(assert (=> b!537557 (= res!332763 (and (= (size!16721 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16721 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16721 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!537558 () Bool)

(declare-fun res!332765 () Bool)

(assert (=> b!537558 (=> (not res!332765) (not e!311841))))

(declare-datatypes ((List!10476 0))(
  ( (Nil!10473) (Cons!10472 (h!11415 (_ BitVec 64)) (t!16704 List!10476)) )
))
(declare-fun arrayNoDuplicates!0 (array!34036 (_ BitVec 32) List!10476) Bool)

(assert (=> b!537558 (= res!332765 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10473))))

(declare-fun b!537559 () Bool)

(declare-fun res!332764 () Bool)

(assert (=> b!537559 (=> (not res!332764) (not e!311844))))

(assert (=> b!537559 (= res!332764 (and (not (= (select (arr!16357 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16357 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16357 a!3154) index!1177) (select (arr!16357 a!3154) j!147)))))))

(declare-fun b!537560 () Bool)

(declare-fun res!332755 () Bool)

(assert (=> b!537560 (=> (not res!332755) (not e!311843))))

(assert (=> b!537560 (= res!332755 (validKeyInArray!0 k0!1998))))

(assert (= (and start!48824 res!332754) b!537557))

(assert (= (and b!537557 res!332763) b!537551))

(assert (= (and b!537551 res!332758) b!537560))

(assert (= (and b!537560 res!332755) b!537552))

(assert (= (and b!537552 res!332762) b!537555))

(assert (= (and b!537555 res!332760) b!537550))

(assert (= (and b!537550 res!332753) b!537558))

(assert (= (and b!537558 res!332765) b!537548))

(assert (= (and b!537548 res!332757) b!537549))

(assert (= (and b!537549 res!332759) b!537556))

(assert (= (and b!537556 res!332761) b!537559))

(assert (= (and b!537559 res!332764) b!537553))

(assert (= (and b!537553 res!332756) b!537554))

(declare-fun m!516761 () Bool)

(assert (=> b!537548 m!516761))

(declare-fun m!516763 () Bool)

(assert (=> b!537548 m!516763))

(declare-fun m!516765 () Bool)

(assert (=> b!537558 m!516765))

(declare-fun m!516767 () Bool)

(assert (=> start!48824 m!516767))

(declare-fun m!516769 () Bool)

(assert (=> start!48824 m!516769))

(declare-fun m!516771 () Bool)

(assert (=> b!537550 m!516771))

(declare-fun m!516773 () Bool)

(assert (=> b!537555 m!516773))

(assert (=> b!537551 m!516763))

(assert (=> b!537551 m!516763))

(declare-fun m!516775 () Bool)

(assert (=> b!537551 m!516775))

(declare-fun m!516777 () Bool)

(assert (=> b!537559 m!516777))

(assert (=> b!537559 m!516763))

(declare-fun m!516779 () Bool)

(assert (=> b!537553 m!516779))

(assert (=> b!537549 m!516763))

(assert (=> b!537549 m!516763))

(declare-fun m!516781 () Bool)

(assert (=> b!537549 m!516781))

(declare-fun m!516783 () Bool)

(assert (=> b!537552 m!516783))

(declare-fun m!516785 () Bool)

(assert (=> b!537560 m!516785))

(assert (=> b!537556 m!516763))

(assert (=> b!537556 m!516763))

(declare-fun m!516787 () Bool)

(assert (=> b!537556 m!516787))

(assert (=> b!537556 m!516787))

(assert (=> b!537556 m!516763))

(declare-fun m!516789 () Bool)

(assert (=> b!537556 m!516789))

(assert (=> b!537554 m!516763))

(assert (=> b!537554 m!516763))

(declare-fun m!516791 () Bool)

(assert (=> b!537554 m!516791))

(check-sat (not b!537552) (not b!537560) (not b!537550) (not b!537558) (not b!537553) (not b!537555) (not b!537554) (not b!537556) (not b!537551) (not start!48824) (not b!537549))
(check-sat)
