; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49098 () Bool)

(assert start!49098)

(declare-fun b!540715 () Bool)

(declare-fun res!335744 () Bool)

(declare-fun e!313154 () Bool)

(assert (=> b!540715 (=> (not res!335744) (not e!313154))))

(declare-datatypes ((array!34218 0))(
  ( (array!34219 (arr!16445 (Array (_ BitVec 32) (_ BitVec 64))) (size!16810 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34218)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!540715 (= res!335744 (validKeyInArray!0 (select (arr!16445 a!3154) j!147)))))

(declare-fun b!540716 () Bool)

(declare-fun res!335752 () Bool)

(declare-fun e!313155 () Bool)

(assert (=> b!540716 (=> (not res!335752) (not e!313155))))

(declare-datatypes ((List!10603 0))(
  ( (Nil!10600) (Cons!10599 (h!11548 (_ BitVec 64)) (t!16822 List!10603)) )
))
(declare-fun arrayNoDuplicates!0 (array!34218 (_ BitVec 32) List!10603) Bool)

(assert (=> b!540716 (= res!335752 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10600))))

(declare-fun b!540717 () Bool)

(declare-fun res!335748 () Bool)

(assert (=> b!540717 (=> (not res!335748) (not e!313154))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!540717 (= res!335748 (and (= (size!16810 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16810 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16810 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!540718 () Bool)

(declare-fun res!335751 () Bool)

(assert (=> b!540718 (=> (not res!335751) (not e!313155))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!540718 (= res!335751 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16810 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16810 a!3154)) (= (select (arr!16445 a!3154) resIndex!32) (select (arr!16445 a!3154) j!147))))))

(declare-fun b!540719 () Bool)

(assert (=> b!540719 (= e!313155 false)))

(declare-datatypes ((SeekEntryResult!4900 0))(
  ( (MissingZero!4900 (index!21824 (_ BitVec 32))) (Found!4900 (index!21825 (_ BitVec 32))) (Intermediate!4900 (undefined!5712 Bool) (index!21826 (_ BitVec 32)) (x!50746 (_ BitVec 32))) (Undefined!4900) (MissingVacant!4900 (index!21827 (_ BitVec 32))) )
))
(declare-fun lt!247296 () SeekEntryResult!4900)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34218 (_ BitVec 32)) SeekEntryResult!4900)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540719 (= lt!247296 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16445 a!3154) j!147) mask!3216) (select (arr!16445 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!540720 () Bool)

(assert (=> b!540720 (= e!313154 e!313155)))

(declare-fun res!335749 () Bool)

(assert (=> b!540720 (=> (not res!335749) (not e!313155))))

(declare-fun lt!247297 () SeekEntryResult!4900)

(assert (=> b!540720 (= res!335749 (or (= lt!247297 (MissingZero!4900 i!1153)) (= lt!247297 (MissingVacant!4900 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34218 (_ BitVec 32)) SeekEntryResult!4900)

(assert (=> b!540720 (= lt!247297 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!540721 () Bool)

(declare-fun res!335750 () Bool)

(assert (=> b!540721 (=> (not res!335750) (not e!313154))))

(assert (=> b!540721 (= res!335750 (validKeyInArray!0 k0!1998))))

(declare-fun b!540722 () Bool)

(declare-fun res!335747 () Bool)

(assert (=> b!540722 (=> (not res!335747) (not e!313155))))

(assert (=> b!540722 (= res!335747 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16445 a!3154) j!147) a!3154 mask!3216) (Intermediate!4900 false resIndex!32 resX!32)))))

(declare-fun b!540723 () Bool)

(declare-fun res!335745 () Bool)

(assert (=> b!540723 (=> (not res!335745) (not e!313154))))

(declare-fun arrayContainsKey!0 (array!34218 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540723 (= res!335745 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun res!335746 () Bool)

(assert (=> start!49098 (=> (not res!335746) (not e!313154))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49098 (= res!335746 (validMask!0 mask!3216))))

(assert (=> start!49098 e!313154))

(assert (=> start!49098 true))

(declare-fun array_inv!12328 (array!34218) Bool)

(assert (=> start!49098 (array_inv!12328 a!3154)))

(declare-fun b!540724 () Bool)

(declare-fun res!335753 () Bool)

(assert (=> b!540724 (=> (not res!335753) (not e!313155))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34218 (_ BitVec 32)) Bool)

(assert (=> b!540724 (= res!335753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!49098 res!335746) b!540717))

(assert (= (and b!540717 res!335748) b!540715))

(assert (= (and b!540715 res!335744) b!540721))

(assert (= (and b!540721 res!335750) b!540723))

(assert (= (and b!540723 res!335745) b!540720))

(assert (= (and b!540720 res!335749) b!540724))

(assert (= (and b!540724 res!335753) b!540716))

(assert (= (and b!540716 res!335752) b!540718))

(assert (= (and b!540718 res!335751) b!540722))

(assert (= (and b!540722 res!335747) b!540719))

(declare-fun m!518869 () Bool)

(assert (=> b!540716 m!518869))

(declare-fun m!518871 () Bool)

(assert (=> b!540723 m!518871))

(declare-fun m!518873 () Bool)

(assert (=> b!540722 m!518873))

(assert (=> b!540722 m!518873))

(declare-fun m!518875 () Bool)

(assert (=> b!540722 m!518875))

(assert (=> b!540719 m!518873))

(assert (=> b!540719 m!518873))

(declare-fun m!518877 () Bool)

(assert (=> b!540719 m!518877))

(assert (=> b!540719 m!518877))

(assert (=> b!540719 m!518873))

(declare-fun m!518879 () Bool)

(assert (=> b!540719 m!518879))

(declare-fun m!518881 () Bool)

(assert (=> b!540720 m!518881))

(declare-fun m!518883 () Bool)

(assert (=> start!49098 m!518883))

(declare-fun m!518885 () Bool)

(assert (=> start!49098 m!518885))

(declare-fun m!518887 () Bool)

(assert (=> b!540721 m!518887))

(declare-fun m!518889 () Bool)

(assert (=> b!540724 m!518889))

(declare-fun m!518891 () Bool)

(assert (=> b!540718 m!518891))

(assert (=> b!540718 m!518873))

(assert (=> b!540715 m!518873))

(assert (=> b!540715 m!518873))

(declare-fun m!518893 () Bool)

(assert (=> b!540715 m!518893))

(check-sat (not b!540719) (not b!540720) (not b!540724) (not b!540721) (not b!540716) (not start!49098) (not b!540722) (not b!540715) (not b!540723))
(check-sat)
