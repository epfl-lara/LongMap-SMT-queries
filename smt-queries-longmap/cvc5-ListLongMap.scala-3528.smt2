; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48738 () Bool)

(assert start!48738)

(declare-fun b!535871 () Bool)

(declare-fun e!311198 () Bool)

(assert (=> b!535871 (= e!311198 false)))

(declare-fun lt!245921 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4772 0))(
  ( (MissingZero!4772 (index!21312 (_ BitVec 32))) (Found!4772 (index!21313 (_ BitVec 32))) (Intermediate!4772 (undefined!5584 Bool) (index!21314 (_ BitVec 32)) (x!50259 (_ BitVec 32))) (Undefined!4772) (MissingVacant!4772 (index!21315 (_ BitVec 32))) )
))
(declare-fun lt!245923 () SeekEntryResult!4772)

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33950 0))(
  ( (array!33951 (arr!16314 (Array (_ BitVec 32) (_ BitVec 64))) (size!16678 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33950)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33950 (_ BitVec 32)) SeekEntryResult!4772)

(assert (=> b!535871 (= lt!245923 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!245921 (select (arr!16314 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535872 () Bool)

(declare-fun res!331086 () Bool)

(declare-fun e!311196 () Bool)

(assert (=> b!535872 (=> (not res!331086) (not e!311196))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!535872 (= res!331086 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16678 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16678 a!3154)) (= (select (arr!16314 a!3154) resIndex!32) (select (arr!16314 a!3154) j!147))))))

(declare-fun b!535873 () Bool)

(declare-fun e!311197 () Bool)

(assert (=> b!535873 (= e!311197 e!311196)))

(declare-fun res!331083 () Bool)

(assert (=> b!535873 (=> (not res!331083) (not e!311196))))

(declare-fun lt!245920 () SeekEntryResult!4772)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535873 (= res!331083 (or (= lt!245920 (MissingZero!4772 i!1153)) (= lt!245920 (MissingVacant!4772 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33950 (_ BitVec 32)) SeekEntryResult!4772)

(assert (=> b!535873 (= lt!245920 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!535874 () Bool)

(declare-fun e!311199 () Bool)

(assert (=> b!535874 (= e!311199 e!311198)))

(declare-fun res!331077 () Bool)

(assert (=> b!535874 (=> (not res!331077) (not e!311198))))

(assert (=> b!535874 (= res!331077 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!245921 #b00000000000000000000000000000000) (bvslt lt!245921 (size!16678 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535874 (= lt!245921 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!535875 () Bool)

(assert (=> b!535875 (= e!311196 e!311199)))

(declare-fun res!331087 () Bool)

(assert (=> b!535875 (=> (not res!331087) (not e!311199))))

(declare-fun lt!245922 () SeekEntryResult!4772)

(assert (=> b!535875 (= res!331087 (= lt!245922 (Intermediate!4772 false resIndex!32 resX!32)))))

(assert (=> b!535875 (= lt!245922 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16314 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535876 () Bool)

(declare-fun res!331088 () Bool)

(assert (=> b!535876 (=> (not res!331088) (not e!311197))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535876 (= res!331088 (validKeyInArray!0 (select (arr!16314 a!3154) j!147)))))

(declare-fun res!331076 () Bool)

(assert (=> start!48738 (=> (not res!331076) (not e!311197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48738 (= res!331076 (validMask!0 mask!3216))))

(assert (=> start!48738 e!311197))

(assert (=> start!48738 true))

(declare-fun array_inv!12110 (array!33950) Bool)

(assert (=> start!48738 (array_inv!12110 a!3154)))

(declare-fun b!535877 () Bool)

(declare-fun res!331080 () Bool)

(assert (=> b!535877 (=> (not res!331080) (not e!311197))))

(assert (=> b!535877 (= res!331080 (validKeyInArray!0 k!1998))))

(declare-fun b!535878 () Bool)

(declare-fun res!331084 () Bool)

(assert (=> b!535878 (=> (not res!331084) (not e!311197))))

(assert (=> b!535878 (= res!331084 (and (= (size!16678 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16678 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16678 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!535879 () Bool)

(declare-fun res!331078 () Bool)

(assert (=> b!535879 (=> (not res!331078) (not e!311199))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535879 (= res!331078 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16314 a!3154) j!147) mask!3216) (select (arr!16314 a!3154) j!147) a!3154 mask!3216) lt!245922))))

(declare-fun b!535880 () Bool)

(declare-fun res!331082 () Bool)

(assert (=> b!535880 (=> (not res!331082) (not e!311196))))

(declare-datatypes ((List!10433 0))(
  ( (Nil!10430) (Cons!10429 (h!11372 (_ BitVec 64)) (t!16661 List!10433)) )
))
(declare-fun arrayNoDuplicates!0 (array!33950 (_ BitVec 32) List!10433) Bool)

(assert (=> b!535880 (= res!331082 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10430))))

(declare-fun b!535881 () Bool)

(declare-fun res!331081 () Bool)

(assert (=> b!535881 (=> (not res!331081) (not e!311197))))

(declare-fun arrayContainsKey!0 (array!33950 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535881 (= res!331081 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!535882 () Bool)

(declare-fun res!331085 () Bool)

(assert (=> b!535882 (=> (not res!331085) (not e!311199))))

(assert (=> b!535882 (= res!331085 (and (not (= (select (arr!16314 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16314 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16314 a!3154) index!1177) (select (arr!16314 a!3154) j!147)))))))

(declare-fun b!535883 () Bool)

(declare-fun res!331079 () Bool)

(assert (=> b!535883 (=> (not res!331079) (not e!311196))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33950 (_ BitVec 32)) Bool)

(assert (=> b!535883 (= res!331079 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48738 res!331076) b!535878))

(assert (= (and b!535878 res!331084) b!535876))

(assert (= (and b!535876 res!331088) b!535877))

(assert (= (and b!535877 res!331080) b!535881))

(assert (= (and b!535881 res!331081) b!535873))

(assert (= (and b!535873 res!331083) b!535883))

(assert (= (and b!535883 res!331079) b!535880))

(assert (= (and b!535880 res!331082) b!535872))

(assert (= (and b!535872 res!331086) b!535875))

(assert (= (and b!535875 res!331087) b!535879))

(assert (= (and b!535879 res!331078) b!535882))

(assert (= (and b!535882 res!331085) b!535874))

(assert (= (and b!535874 res!331077) b!535871))

(declare-fun m!515385 () Bool)

(assert (=> b!535877 m!515385))

(declare-fun m!515387 () Bool)

(assert (=> b!535872 m!515387))

(declare-fun m!515389 () Bool)

(assert (=> b!535872 m!515389))

(declare-fun m!515391 () Bool)

(assert (=> b!535873 m!515391))

(declare-fun m!515393 () Bool)

(assert (=> b!535882 m!515393))

(assert (=> b!535882 m!515389))

(assert (=> b!535879 m!515389))

(assert (=> b!535879 m!515389))

(declare-fun m!515395 () Bool)

(assert (=> b!535879 m!515395))

(assert (=> b!535879 m!515395))

(assert (=> b!535879 m!515389))

(declare-fun m!515397 () Bool)

(assert (=> b!535879 m!515397))

(assert (=> b!535875 m!515389))

(assert (=> b!535875 m!515389))

(declare-fun m!515399 () Bool)

(assert (=> b!535875 m!515399))

(declare-fun m!515401 () Bool)

(assert (=> start!48738 m!515401))

(declare-fun m!515403 () Bool)

(assert (=> start!48738 m!515403))

(declare-fun m!515405 () Bool)

(assert (=> b!535883 m!515405))

(declare-fun m!515407 () Bool)

(assert (=> b!535874 m!515407))

(assert (=> b!535876 m!515389))

(assert (=> b!535876 m!515389))

(declare-fun m!515409 () Bool)

(assert (=> b!535876 m!515409))

(declare-fun m!515411 () Bool)

(assert (=> b!535881 m!515411))

(assert (=> b!535871 m!515389))

(assert (=> b!535871 m!515389))

(declare-fun m!515413 () Bool)

(assert (=> b!535871 m!515413))

(declare-fun m!515415 () Bool)

(assert (=> b!535880 m!515415))

(push 1)

