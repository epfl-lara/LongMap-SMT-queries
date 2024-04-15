; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49002 () Bool)

(assert start!49002)

(declare-fun b!539815 () Bool)

(declare-fun e!312787 () Bool)

(assert (=> b!539815 (= e!312787 false)))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34173 0))(
  ( (array!34174 (arr!16424 (Array (_ BitVec 32) (_ BitVec 64))) (size!16789 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34173)

(declare-datatypes ((SeekEntryResult!4879 0))(
  ( (MissingZero!4879 (index!21740 (_ BitVec 32))) (Found!4879 (index!21741 (_ BitVec 32))) (Intermediate!4879 (undefined!5691 Bool) (index!21742 (_ BitVec 32)) (x!50663 (_ BitVec 32))) (Undefined!4879) (MissingVacant!4879 (index!21743 (_ BitVec 32))) )
))
(declare-fun lt!247075 () SeekEntryResult!4879)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34173 (_ BitVec 32)) SeekEntryResult!4879)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!539815 (= lt!247075 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16424 a!3154) j!147) mask!3216) (select (arr!16424 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!335010 () Bool)

(declare-fun e!312789 () Bool)

(assert (=> start!49002 (=> (not res!335010) (not e!312789))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49002 (= res!335010 (validMask!0 mask!3216))))

(assert (=> start!49002 e!312789))

(assert (=> start!49002 true))

(declare-fun array_inv!12307 (array!34173) Bool)

(assert (=> start!49002 (array_inv!12307 a!3154)))

(declare-fun b!539816 () Bool)

(declare-fun res!335012 () Bool)

(assert (=> b!539816 (=> (not res!335012) (not e!312789))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539816 (= res!335012 (validKeyInArray!0 k0!1998))))

(declare-fun b!539817 () Bool)

(declare-fun res!335008 () Bool)

(assert (=> b!539817 (=> (not res!335008) (not e!312787))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!539817 (= res!335008 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16789 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16789 a!3154)) (= (select (arr!16424 a!3154) resIndex!32) (select (arr!16424 a!3154) j!147))))))

(declare-fun b!539818 () Bool)

(declare-fun res!335003 () Bool)

(assert (=> b!539818 (=> (not res!335003) (not e!312787))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34173 (_ BitVec 32)) Bool)

(assert (=> b!539818 (= res!335003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!539819 () Bool)

(assert (=> b!539819 (= e!312789 e!312787)))

(declare-fun res!335011 () Bool)

(assert (=> b!539819 (=> (not res!335011) (not e!312787))))

(declare-fun lt!247074 () SeekEntryResult!4879)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539819 (= res!335011 (or (= lt!247074 (MissingZero!4879 i!1153)) (= lt!247074 (MissingVacant!4879 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34173 (_ BitVec 32)) SeekEntryResult!4879)

(assert (=> b!539819 (= lt!247074 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!539820 () Bool)

(declare-fun res!335009 () Bool)

(assert (=> b!539820 (=> (not res!335009) (not e!312787))))

(declare-datatypes ((List!10582 0))(
  ( (Nil!10579) (Cons!10578 (h!11524 (_ BitVec 64)) (t!16801 List!10582)) )
))
(declare-fun arrayNoDuplicates!0 (array!34173 (_ BitVec 32) List!10582) Bool)

(assert (=> b!539820 (= res!335009 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10579))))

(declare-fun b!539821 () Bool)

(declare-fun res!335005 () Bool)

(assert (=> b!539821 (=> (not res!335005) (not e!312787))))

(assert (=> b!539821 (= res!335005 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16424 a!3154) j!147) a!3154 mask!3216) (Intermediate!4879 false resIndex!32 resX!32)))))

(declare-fun b!539822 () Bool)

(declare-fun res!335007 () Bool)

(assert (=> b!539822 (=> (not res!335007) (not e!312789))))

(assert (=> b!539822 (= res!335007 (validKeyInArray!0 (select (arr!16424 a!3154) j!147)))))

(declare-fun b!539823 () Bool)

(declare-fun res!335006 () Bool)

(assert (=> b!539823 (=> (not res!335006) (not e!312789))))

(assert (=> b!539823 (= res!335006 (and (= (size!16789 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16789 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16789 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!539824 () Bool)

(declare-fun res!335004 () Bool)

(assert (=> b!539824 (=> (not res!335004) (not e!312789))))

(declare-fun arrayContainsKey!0 (array!34173 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539824 (= res!335004 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!49002 res!335010) b!539823))

(assert (= (and b!539823 res!335006) b!539822))

(assert (= (and b!539822 res!335007) b!539816))

(assert (= (and b!539816 res!335012) b!539824))

(assert (= (and b!539824 res!335004) b!539819))

(assert (= (and b!539819 res!335011) b!539818))

(assert (= (and b!539818 res!335003) b!539820))

(assert (= (and b!539820 res!335009) b!539817))

(assert (= (and b!539817 res!335008) b!539821))

(assert (= (and b!539821 res!335005) b!539815))

(declare-fun m!518179 () Bool)

(assert (=> b!539822 m!518179))

(assert (=> b!539822 m!518179))

(declare-fun m!518181 () Bool)

(assert (=> b!539822 m!518181))

(declare-fun m!518183 () Bool)

(assert (=> b!539820 m!518183))

(declare-fun m!518185 () Bool)

(assert (=> b!539824 m!518185))

(declare-fun m!518187 () Bool)

(assert (=> start!49002 m!518187))

(declare-fun m!518189 () Bool)

(assert (=> start!49002 m!518189))

(declare-fun m!518191 () Bool)

(assert (=> b!539817 m!518191))

(assert (=> b!539817 m!518179))

(assert (=> b!539821 m!518179))

(assert (=> b!539821 m!518179))

(declare-fun m!518193 () Bool)

(assert (=> b!539821 m!518193))

(assert (=> b!539815 m!518179))

(assert (=> b!539815 m!518179))

(declare-fun m!518195 () Bool)

(assert (=> b!539815 m!518195))

(assert (=> b!539815 m!518195))

(assert (=> b!539815 m!518179))

(declare-fun m!518197 () Bool)

(assert (=> b!539815 m!518197))

(declare-fun m!518199 () Bool)

(assert (=> b!539819 m!518199))

(declare-fun m!518201 () Bool)

(assert (=> b!539816 m!518201))

(declare-fun m!518203 () Bool)

(assert (=> b!539818 m!518203))

(check-sat (not b!539821) (not b!539819) (not b!539822) (not b!539815) (not b!539818) (not b!539824) (not start!49002) (not b!539820) (not b!539816))
(check-sat)
