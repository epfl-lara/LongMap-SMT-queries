; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48676 () Bool)

(assert start!48676)

(declare-fun b!534904 () Bool)

(declare-fun res!330168 () Bool)

(declare-fun e!310837 () Bool)

(assert (=> b!534904 (=> (not res!330168) (not e!310837))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534904 (= res!330168 (validKeyInArray!0 k0!1998))))

(declare-fun res!330163 () Bool)

(assert (=> start!48676 (=> (not res!330163) (not e!310837))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48676 (= res!330163 (validMask!0 mask!3216))))

(assert (=> start!48676 e!310837))

(assert (=> start!48676 true))

(declare-datatypes ((array!33887 0))(
  ( (array!33888 (arr!16282 (Array (_ BitVec 32) (_ BitVec 64))) (size!16646 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33887)

(declare-fun array_inv!12141 (array!33887) Bool)

(assert (=> start!48676 (array_inv!12141 a!3154)))

(declare-fun b!534905 () Bool)

(declare-fun res!330164 () Bool)

(declare-fun e!310839 () Bool)

(assert (=> b!534905 (=> (not res!330164) (not e!310839))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33887 (_ BitVec 32)) Bool)

(assert (=> b!534905 (= res!330164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534906 () Bool)

(declare-fun res!330169 () Bool)

(assert (=> b!534906 (=> (not res!330169) (not e!310839))))

(declare-datatypes ((List!10308 0))(
  ( (Nil!10305) (Cons!10304 (h!11247 (_ BitVec 64)) (t!16528 List!10308)) )
))
(declare-fun arrayNoDuplicates!0 (array!33887 (_ BitVec 32) List!10308) Bool)

(assert (=> b!534906 (= res!330169 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10305))))

(declare-fun b!534907 () Bool)

(declare-fun res!330172 () Bool)

(assert (=> b!534907 (=> (not res!330172) (not e!310839))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!534907 (= res!330172 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16646 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16646 a!3154)) (= (select (arr!16282 a!3154) resIndex!32) (select (arr!16282 a!3154) j!147))))))

(declare-fun b!534908 () Bool)

(declare-fun res!330170 () Bool)

(assert (=> b!534908 (=> (not res!330170) (not e!310837))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534908 (= res!330170 (and (= (size!16646 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16646 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16646 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534909 () Bool)

(assert (=> b!534909 (= e!310837 e!310839)))

(declare-fun res!330171 () Bool)

(assert (=> b!534909 (=> (not res!330171) (not e!310839))))

(declare-datatypes ((SeekEntryResult!4696 0))(
  ( (MissingZero!4696 (index!21008 (_ BitVec 32))) (Found!4696 (index!21009 (_ BitVec 32))) (Intermediate!4696 (undefined!5508 Bool) (index!21010 (_ BitVec 32)) (x!50108 (_ BitVec 32))) (Undefined!4696) (MissingVacant!4696 (index!21011 (_ BitVec 32))) )
))
(declare-fun lt!245748 () SeekEntryResult!4696)

(assert (=> b!534909 (= res!330171 (or (= lt!245748 (MissingZero!4696 i!1153)) (= lt!245748 (MissingVacant!4696 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33887 (_ BitVec 32)) SeekEntryResult!4696)

(assert (=> b!534909 (= lt!245748 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!534910 () Bool)

(declare-fun res!330167 () Bool)

(assert (=> b!534910 (=> (not res!330167) (not e!310837))))

(assert (=> b!534910 (= res!330167 (validKeyInArray!0 (select (arr!16282 a!3154) j!147)))))

(declare-fun b!534911 () Bool)

(declare-fun res!330166 () Bool)

(assert (=> b!534911 (=> (not res!330166) (not e!310839))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33887 (_ BitVec 32)) SeekEntryResult!4696)

(assert (=> b!534911 (= res!330166 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16282 a!3154) j!147) a!3154 mask!3216) (Intermediate!4696 false resIndex!32 resX!32)))))

(declare-fun b!534912 () Bool)

(assert (=> b!534912 (= e!310839 false)))

(declare-fun lt!245749 () SeekEntryResult!4696)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534912 (= lt!245749 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16282 a!3154) j!147) mask!3216) (select (arr!16282 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534913 () Bool)

(declare-fun res!330165 () Bool)

(assert (=> b!534913 (=> (not res!330165) (not e!310837))))

(declare-fun arrayContainsKey!0 (array!33887 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534913 (= res!330165 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48676 res!330163) b!534908))

(assert (= (and b!534908 res!330170) b!534910))

(assert (= (and b!534910 res!330167) b!534904))

(assert (= (and b!534904 res!330168) b!534913))

(assert (= (and b!534913 res!330165) b!534909))

(assert (= (and b!534909 res!330171) b!534905))

(assert (= (and b!534905 res!330164) b!534906))

(assert (= (and b!534906 res!330169) b!534907))

(assert (= (and b!534907 res!330172) b!534911))

(assert (= (and b!534911 res!330166) b!534912))

(declare-fun m!514795 () Bool)

(assert (=> b!534906 m!514795))

(declare-fun m!514797 () Bool)

(assert (=> b!534911 m!514797))

(assert (=> b!534911 m!514797))

(declare-fun m!514799 () Bool)

(assert (=> b!534911 m!514799))

(declare-fun m!514801 () Bool)

(assert (=> b!534907 m!514801))

(assert (=> b!534907 m!514797))

(declare-fun m!514803 () Bool)

(assert (=> b!534909 m!514803))

(declare-fun m!514805 () Bool)

(assert (=> b!534905 m!514805))

(assert (=> b!534910 m!514797))

(assert (=> b!534910 m!514797))

(declare-fun m!514807 () Bool)

(assert (=> b!534910 m!514807))

(declare-fun m!514809 () Bool)

(assert (=> b!534913 m!514809))

(declare-fun m!514811 () Bool)

(assert (=> start!48676 m!514811))

(declare-fun m!514813 () Bool)

(assert (=> start!48676 m!514813))

(declare-fun m!514815 () Bool)

(assert (=> b!534904 m!514815))

(assert (=> b!534912 m!514797))

(assert (=> b!534912 m!514797))

(declare-fun m!514817 () Bool)

(assert (=> b!534912 m!514817))

(assert (=> b!534912 m!514817))

(assert (=> b!534912 m!514797))

(declare-fun m!514819 () Bool)

(assert (=> b!534912 m!514819))

(check-sat (not b!534904) (not b!534910) (not b!534905) (not start!48676) (not b!534906) (not b!534912) (not b!534913) (not b!534911) (not b!534909))
(check-sat)
