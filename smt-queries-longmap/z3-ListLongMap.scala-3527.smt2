; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48734 () Bool)

(assert start!48734)

(declare-fun b!535794 () Bool)

(declare-fun res!331006 () Bool)

(declare-fun e!311167 () Bool)

(assert (=> b!535794 (=> (not res!331006) (not e!311167))))

(declare-datatypes ((array!33946 0))(
  ( (array!33947 (arr!16312 (Array (_ BitVec 32) (_ BitVec 64))) (size!16676 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33946)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535794 (= res!331006 (validKeyInArray!0 (select (arr!16312 a!3154) j!147)))))

(declare-fun b!535795 () Bool)

(declare-fun res!330999 () Bool)

(declare-fun e!311165 () Bool)

(assert (=> b!535795 (=> (not res!330999) (not e!311165))))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!535795 (= res!330999 (and (not (= (select (arr!16312 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16312 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16312 a!3154) index!1177) (select (arr!16312 a!3154) j!147)))))))

(declare-fun b!535796 () Bool)

(declare-fun res!331004 () Bool)

(assert (=> b!535796 (=> (not res!331004) (not e!311167))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33946 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535796 (= res!331004 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!535797 () Bool)

(declare-fun e!311168 () Bool)

(assert (=> b!535797 (= e!311167 e!311168)))

(declare-fun res!331002 () Bool)

(assert (=> b!535797 (=> (not res!331002) (not e!311168))))

(declare-datatypes ((SeekEntryResult!4770 0))(
  ( (MissingZero!4770 (index!21304 (_ BitVec 32))) (Found!4770 (index!21305 (_ BitVec 32))) (Intermediate!4770 (undefined!5582 Bool) (index!21306 (_ BitVec 32)) (x!50249 (_ BitVec 32))) (Undefined!4770) (MissingVacant!4770 (index!21307 (_ BitVec 32))) )
))
(declare-fun lt!245896 () SeekEntryResult!4770)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535797 (= res!331002 (or (= lt!245896 (MissingZero!4770 i!1153)) (= lt!245896 (MissingVacant!4770 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33946 (_ BitVec 32)) SeekEntryResult!4770)

(assert (=> b!535797 (= lt!245896 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!535798 () Bool)

(declare-fun res!331008 () Bool)

(assert (=> b!535798 (=> (not res!331008) (not e!311167))))

(assert (=> b!535798 (= res!331008 (and (= (size!16676 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16676 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16676 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!331005 () Bool)

(assert (=> start!48734 (=> (not res!331005) (not e!311167))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48734 (= res!331005 (validMask!0 mask!3216))))

(assert (=> start!48734 e!311167))

(assert (=> start!48734 true))

(declare-fun array_inv!12108 (array!33946) Bool)

(assert (=> start!48734 (array_inv!12108 a!3154)))

(declare-fun b!535793 () Bool)

(declare-fun res!330998 () Bool)

(assert (=> b!535793 (=> (not res!330998) (not e!311168))))

(declare-datatypes ((List!10431 0))(
  ( (Nil!10428) (Cons!10427 (h!11370 (_ BitVec 64)) (t!16659 List!10431)) )
))
(declare-fun arrayNoDuplicates!0 (array!33946 (_ BitVec 32) List!10431) Bool)

(assert (=> b!535793 (= res!330998 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10428))))

(declare-fun b!535799 () Bool)

(declare-fun e!311169 () Bool)

(assert (=> b!535799 (= e!311165 e!311169)))

(declare-fun res!331010 () Bool)

(assert (=> b!535799 (=> (not res!331010) (not e!311169))))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!245897 () (_ BitVec 32))

(assert (=> b!535799 (= res!331010 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!245897 #b00000000000000000000000000000000) (bvslt lt!245897 (size!16676 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535799 (= lt!245897 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!535800 () Bool)

(declare-fun res!331007 () Bool)

(assert (=> b!535800 (=> (not res!331007) (not e!311165))))

(declare-fun lt!245898 () SeekEntryResult!4770)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33946 (_ BitVec 32)) SeekEntryResult!4770)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535800 (= res!331007 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16312 a!3154) j!147) mask!3216) (select (arr!16312 a!3154) j!147) a!3154 mask!3216) lt!245898))))

(declare-fun b!535801 () Bool)

(assert (=> b!535801 (= e!311168 e!311165)))

(declare-fun res!331009 () Bool)

(assert (=> b!535801 (=> (not res!331009) (not e!311165))))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!535801 (= res!331009 (= lt!245898 (Intermediate!4770 false resIndex!32 resX!32)))))

(assert (=> b!535801 (= lt!245898 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16312 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535802 () Bool)

(declare-fun res!331000 () Bool)

(assert (=> b!535802 (=> (not res!331000) (not e!311168))))

(assert (=> b!535802 (= res!331000 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16676 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16676 a!3154)) (= (select (arr!16312 a!3154) resIndex!32) (select (arr!16312 a!3154) j!147))))))

(declare-fun b!535803 () Bool)

(assert (=> b!535803 (= e!311169 false)))

(declare-fun lt!245899 () SeekEntryResult!4770)

(assert (=> b!535803 (= lt!245899 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!245897 (select (arr!16312 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535804 () Bool)

(declare-fun res!331001 () Bool)

(assert (=> b!535804 (=> (not res!331001) (not e!311167))))

(assert (=> b!535804 (= res!331001 (validKeyInArray!0 k0!1998))))

(declare-fun b!535805 () Bool)

(declare-fun res!331003 () Bool)

(assert (=> b!535805 (=> (not res!331003) (not e!311168))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33946 (_ BitVec 32)) Bool)

(assert (=> b!535805 (= res!331003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48734 res!331005) b!535798))

(assert (= (and b!535798 res!331008) b!535794))

(assert (= (and b!535794 res!331006) b!535804))

(assert (= (and b!535804 res!331001) b!535796))

(assert (= (and b!535796 res!331004) b!535797))

(assert (= (and b!535797 res!331002) b!535805))

(assert (= (and b!535805 res!331003) b!535793))

(assert (= (and b!535793 res!330998) b!535802))

(assert (= (and b!535802 res!331000) b!535801))

(assert (= (and b!535801 res!331009) b!535800))

(assert (= (and b!535800 res!331007) b!535795))

(assert (= (and b!535795 res!330999) b!535799))

(assert (= (and b!535799 res!331010) b!535803))

(declare-fun m!515321 () Bool)

(assert (=> b!535805 m!515321))

(declare-fun m!515323 () Bool)

(assert (=> b!535794 m!515323))

(assert (=> b!535794 m!515323))

(declare-fun m!515325 () Bool)

(assert (=> b!535794 m!515325))

(declare-fun m!515327 () Bool)

(assert (=> b!535796 m!515327))

(declare-fun m!515329 () Bool)

(assert (=> b!535802 m!515329))

(assert (=> b!535802 m!515323))

(declare-fun m!515331 () Bool)

(assert (=> b!535797 m!515331))

(declare-fun m!515333 () Bool)

(assert (=> b!535793 m!515333))

(declare-fun m!515335 () Bool)

(assert (=> b!535799 m!515335))

(declare-fun m!515337 () Bool)

(assert (=> start!48734 m!515337))

(declare-fun m!515339 () Bool)

(assert (=> start!48734 m!515339))

(assert (=> b!535801 m!515323))

(assert (=> b!535801 m!515323))

(declare-fun m!515341 () Bool)

(assert (=> b!535801 m!515341))

(declare-fun m!515343 () Bool)

(assert (=> b!535804 m!515343))

(assert (=> b!535800 m!515323))

(assert (=> b!535800 m!515323))

(declare-fun m!515345 () Bool)

(assert (=> b!535800 m!515345))

(assert (=> b!535800 m!515345))

(assert (=> b!535800 m!515323))

(declare-fun m!515347 () Bool)

(assert (=> b!535800 m!515347))

(assert (=> b!535803 m!515323))

(assert (=> b!535803 m!515323))

(declare-fun m!515349 () Bool)

(assert (=> b!535803 m!515349))

(declare-fun m!515351 () Bool)

(assert (=> b!535795 m!515351))

(assert (=> b!535795 m!515323))

(check-sat (not b!535803) (not b!535805) (not b!535794) (not b!535799) (not b!535797) (not b!535793) (not b!535804) (not b!535800) (not start!48734) (not b!535796) (not b!535801))
(check-sat)
