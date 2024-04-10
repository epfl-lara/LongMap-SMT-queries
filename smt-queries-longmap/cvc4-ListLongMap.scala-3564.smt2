; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49012 () Bool)

(assert start!49012)

(declare-fun b!540056 () Bool)

(declare-fun res!335104 () Bool)

(declare-fun e!312952 () Bool)

(assert (=> b!540056 (=> (not res!335104) (not e!312952))))

(declare-datatypes ((array!34173 0))(
  ( (array!34174 (arr!16424 (Array (_ BitVec 32) (_ BitVec 64))) (size!16788 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34173)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34173 (_ BitVec 32)) Bool)

(assert (=> b!540056 (= res!335104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!540057 () Bool)

(assert (=> b!540057 (= e!312952 false)))

(declare-datatypes ((SeekEntryResult!4882 0))(
  ( (MissingZero!4882 (index!21752 (_ BitVec 32))) (Found!4882 (index!21753 (_ BitVec 32))) (Intermediate!4882 (undefined!5694 Bool) (index!21754 (_ BitVec 32)) (x!50663 (_ BitVec 32))) (Undefined!4882) (MissingVacant!4882 (index!21755 (_ BitVec 32))) )
))
(declare-fun lt!247303 () SeekEntryResult!4882)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34173 (_ BitVec 32)) SeekEntryResult!4882)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540057 (= lt!247303 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16424 a!3154) j!147) mask!3216) (select (arr!16424 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!335105 () Bool)

(declare-fun e!312953 () Bool)

(assert (=> start!49012 (=> (not res!335105) (not e!312953))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49012 (= res!335105 (validMask!0 mask!3216))))

(assert (=> start!49012 e!312953))

(assert (=> start!49012 true))

(declare-fun array_inv!12220 (array!34173) Bool)

(assert (=> start!49012 (array_inv!12220 a!3154)))

(declare-fun b!540058 () Bool)

(declare-fun res!335102 () Bool)

(assert (=> b!540058 (=> (not res!335102) (not e!312952))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!540058 (= res!335102 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16788 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16788 a!3154)) (= (select (arr!16424 a!3154) resIndex!32) (select (arr!16424 a!3154) j!147))))))

(declare-fun b!540059 () Bool)

(assert (=> b!540059 (= e!312953 e!312952)))

(declare-fun res!335110 () Bool)

(assert (=> b!540059 (=> (not res!335110) (not e!312952))))

(declare-fun lt!247302 () SeekEntryResult!4882)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!540059 (= res!335110 (or (= lt!247302 (MissingZero!4882 i!1153)) (= lt!247302 (MissingVacant!4882 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34173 (_ BitVec 32)) SeekEntryResult!4882)

(assert (=> b!540059 (= lt!247302 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!540060 () Bool)

(declare-fun res!335109 () Bool)

(assert (=> b!540060 (=> (not res!335109) (not e!312953))))

(assert (=> b!540060 (= res!335109 (and (= (size!16788 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16788 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16788 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!540061 () Bool)

(declare-fun res!335106 () Bool)

(assert (=> b!540061 (=> (not res!335106) (not e!312953))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!540061 (= res!335106 (validKeyInArray!0 (select (arr!16424 a!3154) j!147)))))

(declare-fun b!540062 () Bool)

(declare-fun res!335107 () Bool)

(assert (=> b!540062 (=> (not res!335107) (not e!312952))))

(declare-datatypes ((List!10543 0))(
  ( (Nil!10540) (Cons!10539 (h!11485 (_ BitVec 64)) (t!16771 List!10543)) )
))
(declare-fun arrayNoDuplicates!0 (array!34173 (_ BitVec 32) List!10543) Bool)

(assert (=> b!540062 (= res!335107 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10540))))

(declare-fun b!540063 () Bool)

(declare-fun res!335111 () Bool)

(assert (=> b!540063 (=> (not res!335111) (not e!312953))))

(assert (=> b!540063 (= res!335111 (validKeyInArray!0 k!1998))))

(declare-fun b!540064 () Bool)

(declare-fun res!335103 () Bool)

(assert (=> b!540064 (=> (not res!335103) (not e!312952))))

(assert (=> b!540064 (= res!335103 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16424 a!3154) j!147) a!3154 mask!3216) (Intermediate!4882 false resIndex!32 resX!32)))))

(declare-fun b!540065 () Bool)

(declare-fun res!335108 () Bool)

(assert (=> b!540065 (=> (not res!335108) (not e!312953))))

(declare-fun arrayContainsKey!0 (array!34173 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540065 (= res!335108 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!49012 res!335105) b!540060))

(assert (= (and b!540060 res!335109) b!540061))

(assert (= (and b!540061 res!335106) b!540063))

(assert (= (and b!540063 res!335111) b!540065))

(assert (= (and b!540065 res!335108) b!540059))

(assert (= (and b!540059 res!335110) b!540056))

(assert (= (and b!540056 res!335104) b!540062))

(assert (= (and b!540062 res!335107) b!540058))

(assert (= (and b!540058 res!335102) b!540064))

(assert (= (and b!540064 res!335103) b!540057))

(declare-fun m!518905 () Bool)

(assert (=> b!540056 m!518905))

(declare-fun m!518907 () Bool)

(assert (=> b!540061 m!518907))

(assert (=> b!540061 m!518907))

(declare-fun m!518909 () Bool)

(assert (=> b!540061 m!518909))

(assert (=> b!540057 m!518907))

(assert (=> b!540057 m!518907))

(declare-fun m!518911 () Bool)

(assert (=> b!540057 m!518911))

(assert (=> b!540057 m!518911))

(assert (=> b!540057 m!518907))

(declare-fun m!518913 () Bool)

(assert (=> b!540057 m!518913))

(declare-fun m!518915 () Bool)

(assert (=> start!49012 m!518915))

(declare-fun m!518917 () Bool)

(assert (=> start!49012 m!518917))

(declare-fun m!518919 () Bool)

(assert (=> b!540063 m!518919))

(declare-fun m!518921 () Bool)

(assert (=> b!540058 m!518921))

(assert (=> b!540058 m!518907))

(assert (=> b!540064 m!518907))

(assert (=> b!540064 m!518907))

(declare-fun m!518923 () Bool)

(assert (=> b!540064 m!518923))

(declare-fun m!518925 () Bool)

(assert (=> b!540059 m!518925))

(declare-fun m!518927 () Bool)

(assert (=> b!540065 m!518927))

(declare-fun m!518929 () Bool)

(assert (=> b!540062 m!518929))

(push 1)

(assert (not start!49012))

(assert (not b!540063))

(assert (not b!540064))

(assert (not b!540061))

(assert (not b!540059))

(assert (not b!540065))

(assert (not b!540056))

(assert (not b!540062))

(assert (not b!540057))

(check-sat)

