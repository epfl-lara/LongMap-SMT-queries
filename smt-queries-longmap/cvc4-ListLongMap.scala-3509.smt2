; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48628 () Bool)

(assert start!48628)

(declare-fun b!534116 () Bool)

(declare-fun res!329323 () Bool)

(declare-fun e!310617 () Bool)

(assert (=> b!534116 (=> (not res!329323) (not e!310617))))

(declare-datatypes ((array!33840 0))(
  ( (array!33841 (arr!16259 (Array (_ BitVec 32) (_ BitVec 64))) (size!16623 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33840)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33840 (_ BitVec 32)) Bool)

(assert (=> b!534116 (= res!329323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534117 () Bool)

(declare-fun res!329322 () Bool)

(declare-fun e!310616 () Bool)

(assert (=> b!534117 (=> (not res!329322) (not e!310616))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33840 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534117 (= res!329322 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534118 () Bool)

(assert (=> b!534118 (= e!310616 e!310617)))

(declare-fun res!329326 () Bool)

(assert (=> b!534118 (=> (not res!329326) (not e!310617))))

(declare-datatypes ((SeekEntryResult!4717 0))(
  ( (MissingZero!4717 (index!21092 (_ BitVec 32))) (Found!4717 (index!21093 (_ BitVec 32))) (Intermediate!4717 (undefined!5529 Bool) (index!21094 (_ BitVec 32)) (x!50052 (_ BitVec 32))) (Undefined!4717) (MissingVacant!4717 (index!21095 (_ BitVec 32))) )
))
(declare-fun lt!245569 () SeekEntryResult!4717)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534118 (= res!329326 (or (= lt!245569 (MissingZero!4717 i!1153)) (= lt!245569 (MissingVacant!4717 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33840 (_ BitVec 32)) SeekEntryResult!4717)

(assert (=> b!534118 (= lt!245569 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!534119 () Bool)

(assert (=> b!534119 (= e!310617 false)))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun lt!245568 () SeekEntryResult!4717)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33840 (_ BitVec 32)) SeekEntryResult!4717)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534119 (= lt!245568 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16259 a!3154) j!147) mask!3216) (select (arr!16259 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534120 () Bool)

(declare-fun res!329328 () Bool)

(assert (=> b!534120 (=> (not res!329328) (not e!310617))))

(declare-datatypes ((List!10378 0))(
  ( (Nil!10375) (Cons!10374 (h!11317 (_ BitVec 64)) (t!16606 List!10378)) )
))
(declare-fun arrayNoDuplicates!0 (array!33840 (_ BitVec 32) List!10378) Bool)

(assert (=> b!534120 (= res!329328 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10375))))

(declare-fun res!329329 () Bool)

(assert (=> start!48628 (=> (not res!329329) (not e!310616))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48628 (= res!329329 (validMask!0 mask!3216))))

(assert (=> start!48628 e!310616))

(assert (=> start!48628 true))

(declare-fun array_inv!12055 (array!33840) Bool)

(assert (=> start!48628 (array_inv!12055 a!3154)))

(declare-fun b!534121 () Bool)

(declare-fun res!329324 () Bool)

(assert (=> b!534121 (=> (not res!329324) (not e!310616))))

(assert (=> b!534121 (= res!329324 (and (= (size!16623 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16623 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16623 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534122 () Bool)

(declare-fun res!329321 () Bool)

(assert (=> b!534122 (=> (not res!329321) (not e!310616))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534122 (= res!329321 (validKeyInArray!0 k!1998))))

(declare-fun b!534123 () Bool)

(declare-fun res!329325 () Bool)

(assert (=> b!534123 (=> (not res!329325) (not e!310617))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!534123 (= res!329325 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16623 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16623 a!3154)) (= (select (arr!16259 a!3154) resIndex!32) (select (arr!16259 a!3154) j!147))))))

(declare-fun b!534124 () Bool)

(declare-fun res!329330 () Bool)

(assert (=> b!534124 (=> (not res!329330) (not e!310616))))

(assert (=> b!534124 (= res!329330 (validKeyInArray!0 (select (arr!16259 a!3154) j!147)))))

(declare-fun b!534125 () Bool)

(declare-fun res!329327 () Bool)

(assert (=> b!534125 (=> (not res!329327) (not e!310617))))

(assert (=> b!534125 (= res!329327 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16259 a!3154) j!147) a!3154 mask!3216) (Intermediate!4717 false resIndex!32 resX!32)))))

(assert (= (and start!48628 res!329329) b!534121))

(assert (= (and b!534121 res!329324) b!534124))

(assert (= (and b!534124 res!329330) b!534122))

(assert (= (and b!534122 res!329321) b!534117))

(assert (= (and b!534117 res!329322) b!534118))

(assert (= (and b!534118 res!329326) b!534116))

(assert (= (and b!534116 res!329323) b!534120))

(assert (= (and b!534120 res!329328) b!534123))

(assert (= (and b!534123 res!329325) b!534125))

(assert (= (and b!534125 res!329327) b!534119))

(declare-fun m!513877 () Bool)

(assert (=> b!534118 m!513877))

(declare-fun m!513879 () Bool)

(assert (=> b!534125 m!513879))

(assert (=> b!534125 m!513879))

(declare-fun m!513881 () Bool)

(assert (=> b!534125 m!513881))

(declare-fun m!513883 () Bool)

(assert (=> b!534117 m!513883))

(declare-fun m!513885 () Bool)

(assert (=> b!534116 m!513885))

(assert (=> b!534124 m!513879))

(assert (=> b!534124 m!513879))

(declare-fun m!513887 () Bool)

(assert (=> b!534124 m!513887))

(declare-fun m!513889 () Bool)

(assert (=> b!534123 m!513889))

(assert (=> b!534123 m!513879))

(assert (=> b!534119 m!513879))

(assert (=> b!534119 m!513879))

(declare-fun m!513891 () Bool)

(assert (=> b!534119 m!513891))

(assert (=> b!534119 m!513891))

(assert (=> b!534119 m!513879))

(declare-fun m!513893 () Bool)

(assert (=> b!534119 m!513893))

(declare-fun m!513895 () Bool)

(assert (=> start!48628 m!513895))

(declare-fun m!513897 () Bool)

(assert (=> start!48628 m!513897))

(declare-fun m!513899 () Bool)

(assert (=> b!534122 m!513899))

(declare-fun m!513901 () Bool)

(assert (=> b!534120 m!513901))

(push 1)

(assert (not b!534125))

(assert (not b!534116))

(assert (not b!534119))

(assert (not b!534124))

(assert (not b!534117))

(assert (not start!48628))

(assert (not b!534122))

(assert (not b!534120))

