; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49008 () Bool)

(assert start!49008)

(declare-fun res!335102 () Bool)

(declare-fun e!312815 () Bool)

(assert (=> start!49008 (=> (not res!335102) (not e!312815))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49008 (= res!335102 (validMask!0 mask!3216))))

(assert (=> start!49008 e!312815))

(assert (=> start!49008 true))

(declare-datatypes ((array!34179 0))(
  ( (array!34180 (arr!16427 (Array (_ BitVec 32) (_ BitVec 64))) (size!16792 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34179)

(declare-fun array_inv!12310 (array!34179) Bool)

(assert (=> start!49008 (array_inv!12310 a!3154)))

(declare-fun b!539905 () Bool)

(declare-fun res!335098 () Bool)

(declare-fun e!312816 () Bool)

(assert (=> b!539905 (=> (not res!335098) (not e!312816))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4882 0))(
  ( (MissingZero!4882 (index!21752 (_ BitVec 32))) (Found!4882 (index!21753 (_ BitVec 32))) (Intermediate!4882 (undefined!5694 Bool) (index!21754 (_ BitVec 32)) (x!50674 (_ BitVec 32))) (Undefined!4882) (MissingVacant!4882 (index!21755 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34179 (_ BitVec 32)) SeekEntryResult!4882)

(assert (=> b!539905 (= res!335098 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16427 a!3154) j!147) a!3154 mask!3216) (Intermediate!4882 false resIndex!32 resX!32)))))

(declare-fun b!539906 () Bool)

(declare-fun res!335093 () Bool)

(assert (=> b!539906 (=> (not res!335093) (not e!312815))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539906 (= res!335093 (validKeyInArray!0 k0!1998))))

(declare-fun b!539907 () Bool)

(declare-fun res!335094 () Bool)

(assert (=> b!539907 (=> (not res!335094) (not e!312815))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539907 (= res!335094 (and (= (size!16792 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16792 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16792 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!539908 () Bool)

(declare-fun res!335095 () Bool)

(assert (=> b!539908 (=> (not res!335095) (not e!312816))))

(assert (=> b!539908 (= res!335095 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16792 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16792 a!3154)) (= (select (arr!16427 a!3154) resIndex!32) (select (arr!16427 a!3154) j!147))))))

(declare-fun b!539909 () Bool)

(declare-fun res!335097 () Bool)

(assert (=> b!539909 (=> (not res!335097) (not e!312816))))

(declare-datatypes ((List!10585 0))(
  ( (Nil!10582) (Cons!10581 (h!11527 (_ BitVec 64)) (t!16804 List!10585)) )
))
(declare-fun arrayNoDuplicates!0 (array!34179 (_ BitVec 32) List!10585) Bool)

(assert (=> b!539909 (= res!335097 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10582))))

(declare-fun b!539910 () Bool)

(declare-fun res!335101 () Bool)

(assert (=> b!539910 (=> (not res!335101) (not e!312815))))

(assert (=> b!539910 (= res!335101 (validKeyInArray!0 (select (arr!16427 a!3154) j!147)))))

(declare-fun b!539911 () Bool)

(declare-fun res!335100 () Bool)

(assert (=> b!539911 (=> (not res!335100) (not e!312816))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34179 (_ BitVec 32)) Bool)

(assert (=> b!539911 (= res!335100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!539912 () Bool)

(assert (=> b!539912 (= e!312815 e!312816)))

(declare-fun res!335099 () Bool)

(assert (=> b!539912 (=> (not res!335099) (not e!312816))))

(declare-fun lt!247092 () SeekEntryResult!4882)

(assert (=> b!539912 (= res!335099 (or (= lt!247092 (MissingZero!4882 i!1153)) (= lt!247092 (MissingVacant!4882 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34179 (_ BitVec 32)) SeekEntryResult!4882)

(assert (=> b!539912 (= lt!247092 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!539913 () Bool)

(declare-fun res!335096 () Bool)

(assert (=> b!539913 (=> (not res!335096) (not e!312815))))

(declare-fun arrayContainsKey!0 (array!34179 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539913 (= res!335096 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!539914 () Bool)

(assert (=> b!539914 (= e!312816 false)))

(declare-fun lt!247093 () SeekEntryResult!4882)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!539914 (= lt!247093 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16427 a!3154) j!147) mask!3216) (select (arr!16427 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!49008 res!335102) b!539907))

(assert (= (and b!539907 res!335094) b!539910))

(assert (= (and b!539910 res!335101) b!539906))

(assert (= (and b!539906 res!335093) b!539913))

(assert (= (and b!539913 res!335096) b!539912))

(assert (= (and b!539912 res!335099) b!539911))

(assert (= (and b!539911 res!335100) b!539909))

(assert (= (and b!539909 res!335097) b!539908))

(assert (= (and b!539908 res!335095) b!539905))

(assert (= (and b!539905 res!335098) b!539914))

(declare-fun m!518257 () Bool)

(assert (=> b!539913 m!518257))

(declare-fun m!518259 () Bool)

(assert (=> b!539910 m!518259))

(assert (=> b!539910 m!518259))

(declare-fun m!518261 () Bool)

(assert (=> b!539910 m!518261))

(assert (=> b!539905 m!518259))

(assert (=> b!539905 m!518259))

(declare-fun m!518263 () Bool)

(assert (=> b!539905 m!518263))

(declare-fun m!518265 () Bool)

(assert (=> b!539912 m!518265))

(assert (=> b!539914 m!518259))

(assert (=> b!539914 m!518259))

(declare-fun m!518267 () Bool)

(assert (=> b!539914 m!518267))

(assert (=> b!539914 m!518267))

(assert (=> b!539914 m!518259))

(declare-fun m!518269 () Bool)

(assert (=> b!539914 m!518269))

(declare-fun m!518271 () Bool)

(assert (=> b!539906 m!518271))

(declare-fun m!518273 () Bool)

(assert (=> b!539909 m!518273))

(declare-fun m!518275 () Bool)

(assert (=> b!539908 m!518275))

(assert (=> b!539908 m!518259))

(declare-fun m!518277 () Bool)

(assert (=> b!539911 m!518277))

(declare-fun m!518279 () Bool)

(assert (=> start!49008 m!518279))

(declare-fun m!518281 () Bool)

(assert (=> start!49008 m!518281))

(check-sat (not b!539909) (not b!539906) (not b!539914) (not b!539913) (not b!539911) (not b!539905) (not b!539912) (not start!49008) (not b!539910))
(check-sat)
