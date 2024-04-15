; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48846 () Bool)

(assert start!48846)

(declare-fun b!537940 () Bool)

(declare-fun e!311927 () Bool)

(declare-fun e!311930 () Bool)

(assert (=> b!537940 (= e!311927 e!311930)))

(declare-fun res!333288 () Bool)

(assert (=> b!537940 (=> (not res!333288) (not e!311930))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4828 0))(
  ( (MissingZero!4828 (index!21536 (_ BitVec 32))) (Found!4828 (index!21537 (_ BitVec 32))) (Intermediate!4828 (undefined!5640 Bool) (index!21538 (_ BitVec 32)) (x!50470 (_ BitVec 32))) (Undefined!4828) (MissingVacant!4828 (index!21539 (_ BitVec 32))) )
))
(declare-fun lt!246414 () SeekEntryResult!4828)

(declare-datatypes ((array!34068 0))(
  ( (array!34069 (arr!16373 (Array (_ BitVec 32) (_ BitVec 64))) (size!16738 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34068)

(declare-fun lt!246416 () SeekEntryResult!4828)

(assert (=> b!537940 (= res!333288 (and (= lt!246414 lt!246416) (not (= (select (arr!16373 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16373 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16373 a!3154) index!1177) (select (arr!16373 a!3154) j!147)))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34068 (_ BitVec 32)) SeekEntryResult!4828)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537940 (= lt!246414 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16373 a!3154) j!147) mask!3216) (select (arr!16373 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537941 () Bool)

(declare-fun res!333294 () Bool)

(declare-fun e!311929 () Bool)

(assert (=> b!537941 (=> (not res!333294) (not e!311929))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537941 (= res!333294 (validKeyInArray!0 k0!1998))))

(declare-fun res!333295 () Bool)

(assert (=> start!48846 (=> (not res!333295) (not e!311929))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48846 (= res!333295 (validMask!0 mask!3216))))

(assert (=> start!48846 e!311929))

(assert (=> start!48846 true))

(declare-fun array_inv!12256 (array!34068) Bool)

(assert (=> start!48846 (array_inv!12256 a!3154)))

(declare-fun b!537942 () Bool)

(declare-fun e!311928 () Bool)

(assert (=> b!537942 (= e!311928 e!311927)))

(declare-fun res!333292 () Bool)

(assert (=> b!537942 (=> (not res!333292) (not e!311927))))

(declare-fun lt!246418 () SeekEntryResult!4828)

(assert (=> b!537942 (= res!333292 (= lt!246416 lt!246418))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!537942 (= lt!246418 (Intermediate!4828 false resIndex!32 resX!32))))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!537942 (= lt!246416 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16373 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537943 () Bool)

(declare-fun e!311931 () Bool)

(assert (=> b!537943 (= e!311930 e!311931)))

(declare-fun res!333289 () Bool)

(assert (=> b!537943 (=> (not res!333289) (not e!311931))))

(declare-fun lt!246412 () (_ BitVec 32))

(assert (=> b!537943 (= res!333289 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246412 #b00000000000000000000000000000000) (bvslt lt!246412 (size!16738 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537943 (= lt!246412 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!537944 () Bool)

(declare-fun res!333296 () Bool)

(assert (=> b!537944 (=> (not res!333296) (not e!311929))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537944 (= res!333296 (and (= (size!16738 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16738 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16738 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!537945 () Bool)

(declare-fun e!311925 () Bool)

(assert (=> b!537945 (= e!311925 (not true))))

(assert (=> b!537945 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246412 (select (store (arr!16373 a!3154) i!1153 k0!1998) j!147) (array!34069 (store (arr!16373 a!3154) i!1153 k0!1998) (size!16738 a!3154)) mask!3216) lt!246418)))

(declare-datatypes ((Unit!16828 0))(
  ( (Unit!16829) )
))
(declare-fun lt!246417 () Unit!16828)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34068 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16828)

(assert (=> b!537945 (= lt!246417 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k0!1998 j!147 lt!246412 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!537946 () Bool)

(declare-fun res!333297 () Bool)

(assert (=> b!537946 (=> (not res!333297) (not e!311928))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34068 (_ BitVec 32)) Bool)

(assert (=> b!537946 (= res!333297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!537947 () Bool)

(declare-fun res!333293 () Bool)

(assert (=> b!537947 (=> (not res!333293) (not e!311929))))

(assert (=> b!537947 (= res!333293 (validKeyInArray!0 (select (arr!16373 a!3154) j!147)))))

(declare-fun b!537948 () Bool)

(assert (=> b!537948 (= e!311931 e!311925)))

(declare-fun res!333298 () Bool)

(assert (=> b!537948 (=> (not res!333298) (not e!311925))))

(declare-fun lt!246415 () SeekEntryResult!4828)

(assert (=> b!537948 (= res!333298 (and (= lt!246415 lt!246418) (= lt!246414 lt!246415)))))

(assert (=> b!537948 (= lt!246415 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246412 (select (arr!16373 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537949 () Bool)

(assert (=> b!537949 (= e!311929 e!311928)))

(declare-fun res!333291 () Bool)

(assert (=> b!537949 (=> (not res!333291) (not e!311928))))

(declare-fun lt!246413 () SeekEntryResult!4828)

(assert (=> b!537949 (= res!333291 (or (= lt!246413 (MissingZero!4828 i!1153)) (= lt!246413 (MissingVacant!4828 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34068 (_ BitVec 32)) SeekEntryResult!4828)

(assert (=> b!537949 (= lt!246413 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!537950 () Bool)

(declare-fun res!333299 () Bool)

(assert (=> b!537950 (=> (not res!333299) (not e!311928))))

(declare-datatypes ((List!10531 0))(
  ( (Nil!10528) (Cons!10527 (h!11470 (_ BitVec 64)) (t!16750 List!10531)) )
))
(declare-fun arrayNoDuplicates!0 (array!34068 (_ BitVec 32) List!10531) Bool)

(assert (=> b!537950 (= res!333299 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10528))))

(declare-fun b!537951 () Bool)

(declare-fun res!333290 () Bool)

(assert (=> b!537951 (=> (not res!333290) (not e!311928))))

(assert (=> b!537951 (= res!333290 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16738 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16738 a!3154)) (= (select (arr!16373 a!3154) resIndex!32) (select (arr!16373 a!3154) j!147))))))

(declare-fun b!537952 () Bool)

(declare-fun res!333287 () Bool)

(assert (=> b!537952 (=> (not res!333287) (not e!311929))))

(declare-fun arrayContainsKey!0 (array!34068 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537952 (= res!333287 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48846 res!333295) b!537944))

(assert (= (and b!537944 res!333296) b!537947))

(assert (= (and b!537947 res!333293) b!537941))

(assert (= (and b!537941 res!333294) b!537952))

(assert (= (and b!537952 res!333287) b!537949))

(assert (= (and b!537949 res!333291) b!537946))

(assert (= (and b!537946 res!333297) b!537950))

(assert (= (and b!537950 res!333299) b!537951))

(assert (= (and b!537951 res!333290) b!537942))

(assert (= (and b!537942 res!333292) b!537940))

(assert (= (and b!537940 res!333288) b!537943))

(assert (= (and b!537943 res!333289) b!537948))

(assert (= (and b!537948 res!333298) b!537945))

(declare-fun m!516553 () Bool)

(assert (=> b!537941 m!516553))

(declare-fun m!516555 () Bool)

(assert (=> b!537950 m!516555))

(declare-fun m!516557 () Bool)

(assert (=> b!537947 m!516557))

(assert (=> b!537947 m!516557))

(declare-fun m!516559 () Bool)

(assert (=> b!537947 m!516559))

(declare-fun m!516561 () Bool)

(assert (=> b!537951 m!516561))

(assert (=> b!537951 m!516557))

(declare-fun m!516563 () Bool)

(assert (=> b!537945 m!516563))

(declare-fun m!516565 () Bool)

(assert (=> b!537945 m!516565))

(assert (=> b!537945 m!516565))

(declare-fun m!516567 () Bool)

(assert (=> b!537945 m!516567))

(declare-fun m!516569 () Bool)

(assert (=> b!537945 m!516569))

(declare-fun m!516571 () Bool)

(assert (=> b!537952 m!516571))

(declare-fun m!516573 () Bool)

(assert (=> b!537940 m!516573))

(assert (=> b!537940 m!516557))

(assert (=> b!537940 m!516557))

(declare-fun m!516575 () Bool)

(assert (=> b!537940 m!516575))

(assert (=> b!537940 m!516575))

(assert (=> b!537940 m!516557))

(declare-fun m!516577 () Bool)

(assert (=> b!537940 m!516577))

(declare-fun m!516579 () Bool)

(assert (=> start!48846 m!516579))

(declare-fun m!516581 () Bool)

(assert (=> start!48846 m!516581))

(declare-fun m!516583 () Bool)

(assert (=> b!537943 m!516583))

(assert (=> b!537948 m!516557))

(assert (=> b!537948 m!516557))

(declare-fun m!516585 () Bool)

(assert (=> b!537948 m!516585))

(declare-fun m!516587 () Bool)

(assert (=> b!537949 m!516587))

(assert (=> b!537942 m!516557))

(assert (=> b!537942 m!516557))

(declare-fun m!516589 () Bool)

(assert (=> b!537942 m!516589))

(declare-fun m!516591 () Bool)

(assert (=> b!537946 m!516591))

(check-sat (not b!537948) (not b!537947) (not b!537949) (not b!537946) (not b!537942) (not b!537945) (not b!537940) (not start!48846) (not b!537950) (not b!537941) (not b!537952) (not b!537943))
(check-sat)
