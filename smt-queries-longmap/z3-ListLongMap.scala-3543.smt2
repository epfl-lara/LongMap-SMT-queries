; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48830 () Bool)

(assert start!48830)

(declare-fun b!537665 () Bool)

(declare-fun e!311885 () Bool)

(declare-fun e!311886 () Bool)

(assert (=> b!537665 (= e!311885 e!311886)))

(declare-fun res!332877 () Bool)

(assert (=> b!537665 (=> (not res!332877) (not e!311886))))

(declare-datatypes ((SeekEntryResult!4818 0))(
  ( (MissingZero!4818 (index!21496 (_ BitVec 32))) (Found!4818 (index!21497 (_ BitVec 32))) (Intermediate!4818 (undefined!5630 Bool) (index!21498 (_ BitVec 32)) (x!50425 (_ BitVec 32))) (Undefined!4818) (MissingVacant!4818 (index!21499 (_ BitVec 32))) )
))
(declare-fun lt!246472 () SeekEntryResult!4818)

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!537665 (= res!332877 (= lt!246472 (Intermediate!4818 false resIndex!32 resX!32)))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34042 0))(
  ( (array!34043 (arr!16360 (Array (_ BitVec 32) (_ BitVec 64))) (size!16724 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34042)

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34042 (_ BitVec 32)) SeekEntryResult!4818)

(assert (=> b!537665 (= lt!246472 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16360 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537666 () Bool)

(declare-fun res!332874 () Bool)

(declare-fun e!311888 () Bool)

(assert (=> b!537666 (=> (not res!332874) (not e!311888))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537666 (= res!332874 (and (= (size!16724 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16724 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16724 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!332872 () Bool)

(assert (=> start!48830 (=> (not res!332872) (not e!311888))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48830 (= res!332872 (validMask!0 mask!3216))))

(assert (=> start!48830 e!311888))

(assert (=> start!48830 true))

(declare-fun array_inv!12156 (array!34042) Bool)

(assert (=> start!48830 (array_inv!12156 a!3154)))

(declare-fun b!537667 () Bool)

(declare-fun res!332876 () Bool)

(assert (=> b!537667 (=> (not res!332876) (not e!311888))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34042 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537667 (= res!332876 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537668 () Bool)

(declare-fun res!332878 () Bool)

(assert (=> b!537668 (=> (not res!332878) (not e!311885))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34042 (_ BitVec 32)) Bool)

(assert (=> b!537668 (= res!332878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!537669 () Bool)

(declare-fun res!332882 () Bool)

(assert (=> b!537669 (=> (not res!332882) (not e!311886))))

(assert (=> b!537669 (= res!332882 (and (not (= (select (arr!16360 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16360 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16360 a!3154) index!1177) (select (arr!16360 a!3154) j!147)))))))

(declare-fun b!537670 () Bool)

(declare-fun res!332880 () Bool)

(assert (=> b!537670 (=> (not res!332880) (not e!311886))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537670 (= res!332880 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16360 a!3154) j!147) mask!3216) (select (arr!16360 a!3154) j!147) a!3154 mask!3216) lt!246472))))

(declare-fun b!537671 () Bool)

(assert (=> b!537671 (= e!311888 e!311885)))

(declare-fun res!332870 () Bool)

(assert (=> b!537671 (=> (not res!332870) (not e!311885))))

(declare-fun lt!246474 () SeekEntryResult!4818)

(assert (=> b!537671 (= res!332870 (or (= lt!246474 (MissingZero!4818 i!1153)) (= lt!246474 (MissingVacant!4818 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34042 (_ BitVec 32)) SeekEntryResult!4818)

(assert (=> b!537671 (= lt!246474 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!537672 () Bool)

(declare-fun res!332871 () Bool)

(assert (=> b!537672 (=> (not res!332871) (not e!311885))))

(declare-datatypes ((List!10479 0))(
  ( (Nil!10476) (Cons!10475 (h!11418 (_ BitVec 64)) (t!16707 List!10479)) )
))
(declare-fun arrayNoDuplicates!0 (array!34042 (_ BitVec 32) List!10479) Bool)

(assert (=> b!537672 (= res!332871 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10476))))

(declare-fun b!537673 () Bool)

(declare-fun e!311889 () Bool)

(assert (=> b!537673 (= e!311889 false)))

(declare-fun lt!246475 () SeekEntryResult!4818)

(declare-fun lt!246473 () (_ BitVec 32))

(assert (=> b!537673 (= lt!246475 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246473 (select (arr!16360 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537674 () Bool)

(declare-fun res!332879 () Bool)

(assert (=> b!537674 (=> (not res!332879) (not e!311888))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537674 (= res!332879 (validKeyInArray!0 k0!1998))))

(declare-fun b!537675 () Bool)

(declare-fun res!332881 () Bool)

(assert (=> b!537675 (=> (not res!332881) (not e!311885))))

(assert (=> b!537675 (= res!332881 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16724 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16724 a!3154)) (= (select (arr!16360 a!3154) resIndex!32) (select (arr!16360 a!3154) j!147))))))

(declare-fun b!537676 () Bool)

(declare-fun res!332873 () Bool)

(assert (=> b!537676 (=> (not res!332873) (not e!311888))))

(assert (=> b!537676 (= res!332873 (validKeyInArray!0 (select (arr!16360 a!3154) j!147)))))

(declare-fun b!537677 () Bool)

(assert (=> b!537677 (= e!311886 e!311889)))

(declare-fun res!332875 () Bool)

(assert (=> b!537677 (=> (not res!332875) (not e!311889))))

(assert (=> b!537677 (= res!332875 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246473 #b00000000000000000000000000000000) (bvslt lt!246473 (size!16724 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537677 (= lt!246473 (nextIndex!0 index!1177 x!1030 mask!3216))))

(assert (= (and start!48830 res!332872) b!537666))

(assert (= (and b!537666 res!332874) b!537676))

(assert (= (and b!537676 res!332873) b!537674))

(assert (= (and b!537674 res!332879) b!537667))

(assert (= (and b!537667 res!332876) b!537671))

(assert (= (and b!537671 res!332870) b!537668))

(assert (= (and b!537668 res!332878) b!537672))

(assert (= (and b!537672 res!332871) b!537675))

(assert (= (and b!537675 res!332881) b!537665))

(assert (= (and b!537665 res!332877) b!537670))

(assert (= (and b!537670 res!332880) b!537669))

(assert (= (and b!537669 res!332882) b!537677))

(assert (= (and b!537677 res!332875) b!537673))

(declare-fun m!516857 () Bool)

(assert (=> b!537675 m!516857))

(declare-fun m!516859 () Bool)

(assert (=> b!537675 m!516859))

(declare-fun m!516861 () Bool)

(assert (=> b!537671 m!516861))

(declare-fun m!516863 () Bool)

(assert (=> b!537669 m!516863))

(assert (=> b!537669 m!516859))

(assert (=> b!537670 m!516859))

(assert (=> b!537670 m!516859))

(declare-fun m!516865 () Bool)

(assert (=> b!537670 m!516865))

(assert (=> b!537670 m!516865))

(assert (=> b!537670 m!516859))

(declare-fun m!516867 () Bool)

(assert (=> b!537670 m!516867))

(declare-fun m!516869 () Bool)

(assert (=> b!537668 m!516869))

(declare-fun m!516871 () Bool)

(assert (=> b!537674 m!516871))

(assert (=> b!537673 m!516859))

(assert (=> b!537673 m!516859))

(declare-fun m!516873 () Bool)

(assert (=> b!537673 m!516873))

(declare-fun m!516875 () Bool)

(assert (=> b!537672 m!516875))

(declare-fun m!516877 () Bool)

(assert (=> b!537677 m!516877))

(declare-fun m!516879 () Bool)

(assert (=> b!537667 m!516879))

(assert (=> b!537665 m!516859))

(assert (=> b!537665 m!516859))

(declare-fun m!516881 () Bool)

(assert (=> b!537665 m!516881))

(assert (=> b!537676 m!516859))

(assert (=> b!537676 m!516859))

(declare-fun m!516883 () Bool)

(assert (=> b!537676 m!516883))

(declare-fun m!516885 () Bool)

(assert (=> start!48830 m!516885))

(declare-fun m!516887 () Bool)

(assert (=> start!48830 m!516887))

(check-sat (not b!537668) (not b!537676) (not b!537672) (not b!537677) (not b!537667) (not b!537673) (not b!537670) (not b!537671) (not start!48830) (not b!537674) (not b!537665))
(check-sat)