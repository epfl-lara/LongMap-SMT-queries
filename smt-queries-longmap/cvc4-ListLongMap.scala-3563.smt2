; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49006 () Bool)

(assert start!49006)

(declare-fun res!335016 () Bool)

(declare-fun e!312926 () Bool)

(assert (=> start!49006 (=> (not res!335016) (not e!312926))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49006 (= res!335016 (validMask!0 mask!3216))))

(assert (=> start!49006 e!312926))

(assert (=> start!49006 true))

(declare-datatypes ((array!34167 0))(
  ( (array!34168 (arr!16421 (Array (_ BitVec 32) (_ BitVec 64))) (size!16785 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34167)

(declare-fun array_inv!12217 (array!34167) Bool)

(assert (=> start!49006 (array_inv!12217 a!3154)))

(declare-fun b!539966 () Bool)

(declare-fun e!312927 () Bool)

(assert (=> b!539966 (= e!312926 e!312927)))

(declare-fun res!335021 () Bool)

(assert (=> b!539966 (=> (not res!335021) (not e!312927))))

(declare-datatypes ((SeekEntryResult!4879 0))(
  ( (MissingZero!4879 (index!21740 (_ BitVec 32))) (Found!4879 (index!21741 (_ BitVec 32))) (Intermediate!4879 (undefined!5691 Bool) (index!21742 (_ BitVec 32)) (x!50652 (_ BitVec 32))) (Undefined!4879) (MissingVacant!4879 (index!21743 (_ BitVec 32))) )
))
(declare-fun lt!247284 () SeekEntryResult!4879)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539966 (= res!335021 (or (= lt!247284 (MissingZero!4879 i!1153)) (= lt!247284 (MissingVacant!4879 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34167 (_ BitVec 32)) SeekEntryResult!4879)

(assert (=> b!539966 (= lt!247284 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!539967 () Bool)

(declare-fun res!335019 () Bool)

(assert (=> b!539967 (=> (not res!335019) (not e!312927))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34167 (_ BitVec 32)) SeekEntryResult!4879)

(assert (=> b!539967 (= res!335019 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16421 a!3154) j!147) a!3154 mask!3216) (Intermediate!4879 false resIndex!32 resX!32)))))

(declare-fun b!539968 () Bool)

(declare-fun res!335012 () Bool)

(assert (=> b!539968 (=> (not res!335012) (not e!312926))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539968 (= res!335012 (validKeyInArray!0 (select (arr!16421 a!3154) j!147)))))

(declare-fun b!539969 () Bool)

(declare-fun res!335017 () Bool)

(assert (=> b!539969 (=> (not res!335017) (not e!312927))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34167 (_ BitVec 32)) Bool)

(assert (=> b!539969 (= res!335017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!539970 () Bool)

(declare-fun res!335013 () Bool)

(assert (=> b!539970 (=> (not res!335013) (not e!312926))))

(declare-fun arrayContainsKey!0 (array!34167 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539970 (= res!335013 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!539971 () Bool)

(declare-fun res!335015 () Bool)

(assert (=> b!539971 (=> (not res!335015) (not e!312926))))

(assert (=> b!539971 (= res!335015 (and (= (size!16785 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16785 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16785 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!539972 () Bool)

(declare-fun res!335020 () Bool)

(assert (=> b!539972 (=> (not res!335020) (not e!312927))))

(declare-datatypes ((List!10540 0))(
  ( (Nil!10537) (Cons!10536 (h!11482 (_ BitVec 64)) (t!16768 List!10540)) )
))
(declare-fun arrayNoDuplicates!0 (array!34167 (_ BitVec 32) List!10540) Bool)

(assert (=> b!539972 (= res!335020 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10537))))

(declare-fun b!539973 () Bool)

(declare-fun res!335018 () Bool)

(assert (=> b!539973 (=> (not res!335018) (not e!312927))))

(assert (=> b!539973 (= res!335018 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16785 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16785 a!3154)) (= (select (arr!16421 a!3154) resIndex!32) (select (arr!16421 a!3154) j!147))))))

(declare-fun b!539974 () Bool)

(assert (=> b!539974 (= e!312927 false)))

(declare-fun lt!247285 () SeekEntryResult!4879)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!539974 (= lt!247285 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16421 a!3154) j!147) mask!3216) (select (arr!16421 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!539975 () Bool)

(declare-fun res!335014 () Bool)

(assert (=> b!539975 (=> (not res!335014) (not e!312926))))

(assert (=> b!539975 (= res!335014 (validKeyInArray!0 k!1998))))

(assert (= (and start!49006 res!335016) b!539971))

(assert (= (and b!539971 res!335015) b!539968))

(assert (= (and b!539968 res!335012) b!539975))

(assert (= (and b!539975 res!335014) b!539970))

(assert (= (and b!539970 res!335013) b!539966))

(assert (= (and b!539966 res!335021) b!539969))

(assert (= (and b!539969 res!335017) b!539972))

(assert (= (and b!539972 res!335020) b!539973))

(assert (= (and b!539973 res!335018) b!539967))

(assert (= (and b!539967 res!335019) b!539974))

(declare-fun m!518827 () Bool)

(assert (=> b!539974 m!518827))

(assert (=> b!539974 m!518827))

(declare-fun m!518829 () Bool)

(assert (=> b!539974 m!518829))

(assert (=> b!539974 m!518829))

(assert (=> b!539974 m!518827))

(declare-fun m!518831 () Bool)

(assert (=> b!539974 m!518831))

(declare-fun m!518833 () Bool)

(assert (=> b!539973 m!518833))

(assert (=> b!539973 m!518827))

(declare-fun m!518835 () Bool)

(assert (=> b!539966 m!518835))

(declare-fun m!518837 () Bool)

(assert (=> b!539975 m!518837))

(assert (=> b!539967 m!518827))

(assert (=> b!539967 m!518827))

(declare-fun m!518839 () Bool)

(assert (=> b!539967 m!518839))

(declare-fun m!518841 () Bool)

(assert (=> start!49006 m!518841))

(declare-fun m!518843 () Bool)

(assert (=> start!49006 m!518843))

(assert (=> b!539968 m!518827))

(assert (=> b!539968 m!518827))

(declare-fun m!518845 () Bool)

(assert (=> b!539968 m!518845))

(declare-fun m!518847 () Bool)

(assert (=> b!539970 m!518847))

(declare-fun m!518849 () Bool)

(assert (=> b!539969 m!518849))

(declare-fun m!518851 () Bool)

(assert (=> b!539972 m!518851))

(push 1)

(assert (not b!539968))

(assert (not start!49006))

(assert (not b!539974))

(assert (not b!539975))

(assert (not b!539970))

(assert (not b!539969))

(assert (not b!539966))

