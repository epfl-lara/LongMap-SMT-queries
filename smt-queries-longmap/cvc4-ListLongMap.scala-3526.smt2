; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48730 () Bool)

(assert start!48730)

(declare-fun b!535717 () Bool)

(declare-fun res!330932 () Bool)

(declare-fun e!311137 () Bool)

(assert (=> b!535717 (=> (not res!330932) (not e!311137))))

(declare-datatypes ((array!33942 0))(
  ( (array!33943 (arr!16310 (Array (_ BitVec 32) (_ BitVec 64))) (size!16674 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33942)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535717 (= res!330932 (validKeyInArray!0 (select (arr!16310 a!3154) j!147)))))

(declare-fun b!535718 () Bool)

(declare-fun res!330928 () Bool)

(declare-fun e!311139 () Bool)

(assert (=> b!535718 (=> (not res!330928) (not e!311139))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4768 0))(
  ( (MissingZero!4768 (index!21296 (_ BitVec 32))) (Found!4768 (index!21297 (_ BitVec 32))) (Intermediate!4768 (undefined!5580 Bool) (index!21298 (_ BitVec 32)) (x!50239 (_ BitVec 32))) (Undefined!4768) (MissingVacant!4768 (index!21299 (_ BitVec 32))) )
))
(declare-fun lt!245875 () SeekEntryResult!4768)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33942 (_ BitVec 32)) SeekEntryResult!4768)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535718 (= res!330928 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16310 a!3154) j!147) mask!3216) (select (arr!16310 a!3154) j!147) a!3154 mask!3216) lt!245875))))

(declare-fun b!535719 () Bool)

(declare-fun res!330930 () Bool)

(assert (=> b!535719 (=> (not res!330930) (not e!311137))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33942 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535719 (= res!330930 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!535720 () Bool)

(declare-fun e!311136 () Bool)

(assert (=> b!535720 (= e!311137 e!311136)))

(declare-fun res!330931 () Bool)

(assert (=> b!535720 (=> (not res!330931) (not e!311136))))

(declare-fun lt!245874 () SeekEntryResult!4768)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535720 (= res!330931 (or (= lt!245874 (MissingZero!4768 i!1153)) (= lt!245874 (MissingVacant!4768 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33942 (_ BitVec 32)) SeekEntryResult!4768)

(assert (=> b!535720 (= lt!245874 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!535721 () Bool)

(declare-fun res!330929 () Bool)

(assert (=> b!535721 (=> (not res!330929) (not e!311137))))

(assert (=> b!535721 (= res!330929 (validKeyInArray!0 k!1998))))

(declare-fun b!535722 () Bool)

(assert (=> b!535722 (= e!311136 e!311139)))

(declare-fun res!330925 () Bool)

(assert (=> b!535722 (=> (not res!330925) (not e!311139))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!535722 (= res!330925 (= lt!245875 (Intermediate!4768 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!535722 (= lt!245875 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16310 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535723 () Bool)

(declare-fun res!330922 () Bool)

(assert (=> b!535723 (=> (not res!330922) (not e!311136))))

(declare-datatypes ((List!10429 0))(
  ( (Nil!10426) (Cons!10425 (h!11368 (_ BitVec 64)) (t!16657 List!10429)) )
))
(declare-fun arrayNoDuplicates!0 (array!33942 (_ BitVec 32) List!10429) Bool)

(assert (=> b!535723 (= res!330922 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10426))))

(declare-fun b!535724 () Bool)

(assert (=> b!535724 (= e!311139 (and (not (= (select (arr!16310 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16310 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16310 a!3154) index!1177) (select (arr!16310 a!3154) j!147))) (bvsge mask!3216 #b00000000000000000000000000000000) (bvslt index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsgt x!1030 #b01111111111111111111111111111110)))))

(declare-fun res!330923 () Bool)

(assert (=> start!48730 (=> (not res!330923) (not e!311137))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48730 (= res!330923 (validMask!0 mask!3216))))

(assert (=> start!48730 e!311137))

(assert (=> start!48730 true))

(declare-fun array_inv!12106 (array!33942) Bool)

(assert (=> start!48730 (array_inv!12106 a!3154)))

(declare-fun b!535725 () Bool)

(declare-fun res!330924 () Bool)

(assert (=> b!535725 (=> (not res!330924) (not e!311136))))

(assert (=> b!535725 (= res!330924 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16674 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16674 a!3154)) (= (select (arr!16310 a!3154) resIndex!32) (select (arr!16310 a!3154) j!147))))))

(declare-fun b!535726 () Bool)

(declare-fun res!330926 () Bool)

(assert (=> b!535726 (=> (not res!330926) (not e!311136))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33942 (_ BitVec 32)) Bool)

(assert (=> b!535726 (= res!330926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!535727 () Bool)

(declare-fun res!330927 () Bool)

(assert (=> b!535727 (=> (not res!330927) (not e!311137))))

(assert (=> b!535727 (= res!330927 (and (= (size!16674 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16674 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16674 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48730 res!330923) b!535727))

(assert (= (and b!535727 res!330927) b!535717))

(assert (= (and b!535717 res!330932) b!535721))

(assert (= (and b!535721 res!330929) b!535719))

(assert (= (and b!535719 res!330930) b!535720))

(assert (= (and b!535720 res!330931) b!535726))

(assert (= (and b!535726 res!330926) b!535723))

(assert (= (and b!535723 res!330922) b!535725))

(assert (= (and b!535725 res!330924) b!535722))

(assert (= (and b!535722 res!330925) b!535718))

(assert (= (and b!535718 res!330928) b!535724))

(declare-fun m!515261 () Bool)

(assert (=> start!48730 m!515261))

(declare-fun m!515263 () Bool)

(assert (=> start!48730 m!515263))

(declare-fun m!515265 () Bool)

(assert (=> b!535720 m!515265))

(declare-fun m!515267 () Bool)

(assert (=> b!535726 m!515267))

(declare-fun m!515269 () Bool)

(assert (=> b!535724 m!515269))

(declare-fun m!515271 () Bool)

(assert (=> b!535724 m!515271))

(declare-fun m!515273 () Bool)

(assert (=> b!535719 m!515273))

(declare-fun m!515275 () Bool)

(assert (=> b!535725 m!515275))

(assert (=> b!535725 m!515271))

(declare-fun m!515277 () Bool)

(assert (=> b!535721 m!515277))

(declare-fun m!515279 () Bool)

(assert (=> b!535723 m!515279))

(assert (=> b!535722 m!515271))

(assert (=> b!535722 m!515271))

(declare-fun m!515281 () Bool)

(assert (=> b!535722 m!515281))

(assert (=> b!535718 m!515271))

(assert (=> b!535718 m!515271))

(declare-fun m!515283 () Bool)

(assert (=> b!535718 m!515283))

(assert (=> b!535718 m!515283))

(assert (=> b!535718 m!515271))

(declare-fun m!515285 () Bool)

(assert (=> b!535718 m!515285))

(assert (=> b!535717 m!515271))

(assert (=> b!535717 m!515271))

(declare-fun m!515287 () Bool)

(assert (=> b!535717 m!515287))

(push 1)

(assert (not b!535721))

(assert (not b!535726))

(assert (not start!48730))

(assert (not b!535717))

(assert (not b!535720))

(assert (not b!535723))

(assert (not b!535718))

(assert (not b!535719))

(assert (not b!535722))

