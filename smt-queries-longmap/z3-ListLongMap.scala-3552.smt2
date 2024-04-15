; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48870 () Bool)

(assert start!48870)

(declare-fun b!538408 () Bool)

(declare-fun res!333761 () Bool)

(declare-fun e!312177 () Bool)

(assert (=> b!538408 (=> (not res!333761) (not e!312177))))

(declare-datatypes ((array!34092 0))(
  ( (array!34093 (arr!16385 (Array (_ BitVec 32) (_ BitVec 64))) (size!16750 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34092)

(declare-datatypes ((List!10543 0))(
  ( (Nil!10540) (Cons!10539 (h!11482 (_ BitVec 64)) (t!16762 List!10543)) )
))
(declare-fun arrayNoDuplicates!0 (array!34092 (_ BitVec 32) List!10543) Bool)

(assert (=> b!538408 (= res!333761 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10540))))

(declare-fun res!333762 () Bool)

(declare-fun e!312181 () Bool)

(assert (=> start!48870 (=> (not res!333762) (not e!312181))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48870 (= res!333762 (validMask!0 mask!3216))))

(assert (=> start!48870 e!312181))

(assert (=> start!48870 true))

(declare-fun array_inv!12268 (array!34092) Bool)

(assert (=> start!48870 (array_inv!12268 a!3154)))

(declare-fun b!538409 () Bool)

(declare-fun res!333764 () Bool)

(assert (=> b!538409 (=> (not res!333764) (not e!312181))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34092 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538409 (= res!333764 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538410 () Bool)

(declare-fun e!312182 () Bool)

(declare-fun e!312178 () Bool)

(assert (=> b!538410 (= e!312182 e!312178)))

(declare-fun res!333759 () Bool)

(assert (=> b!538410 (=> (not res!333759) (not e!312178))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4840 0))(
  ( (MissingZero!4840 (index!21584 (_ BitVec 32))) (Found!4840 (index!21585 (_ BitVec 32))) (Intermediate!4840 (undefined!5652 Bool) (index!21586 (_ BitVec 32)) (x!50514 (_ BitVec 32))) (Undefined!4840) (MissingVacant!4840 (index!21587 (_ BitVec 32))) )
))
(declare-fun lt!246670 () SeekEntryResult!4840)

(declare-fun lt!246664 () SeekEntryResult!4840)

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!538410 (= res!333759 (and (= lt!246670 lt!246664) (not (= (select (arr!16385 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16385 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16385 a!3154) index!1177) (select (arr!16385 a!3154) j!147)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34092 (_ BitVec 32)) SeekEntryResult!4840)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538410 (= lt!246670 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16385 a!3154) j!147) mask!3216) (select (arr!16385 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538411 () Bool)

(declare-fun e!312180 () Bool)

(assert (=> b!538411 (= e!312178 e!312180)))

(declare-fun res!333757 () Bool)

(assert (=> b!538411 (=> (not res!333757) (not e!312180))))

(declare-fun lt!246667 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!538411 (= res!333757 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246667 #b00000000000000000000000000000000) (bvslt lt!246667 (size!16750 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538411 (= lt!246667 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!538412 () Bool)

(declare-fun res!333765 () Bool)

(assert (=> b!538412 (=> (not res!333765) (not e!312181))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538412 (= res!333765 (validKeyInArray!0 k0!1998))))

(declare-fun e!312183 () Bool)

(declare-fun b!538413 () Bool)

(assert (=> b!538413 (= e!312183 (not (or (bvslt mask!3216 #b00000000000000000000000000000000) (bvsge index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsle x!1030 #b01111111111111111111111111111110))))))

(declare-fun lt!246665 () SeekEntryResult!4840)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!538413 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246667 (select (store (arr!16385 a!3154) i!1153 k0!1998) j!147) (array!34093 (store (arr!16385 a!3154) i!1153 k0!1998) (size!16750 a!3154)) mask!3216) lt!246665)))

(declare-datatypes ((Unit!16852 0))(
  ( (Unit!16853) )
))
(declare-fun lt!246666 () Unit!16852)

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34092 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16852)

(assert (=> b!538413 (= lt!246666 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k0!1998 j!147 lt!246667 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!538414 () Bool)

(declare-fun res!333763 () Bool)

(assert (=> b!538414 (=> (not res!333763) (not e!312177))))

(assert (=> b!538414 (= res!333763 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16750 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16750 a!3154)) (= (select (arr!16385 a!3154) resIndex!32) (select (arr!16385 a!3154) j!147))))))

(declare-fun b!538415 () Bool)

(assert (=> b!538415 (= e!312181 e!312177)))

(declare-fun res!333766 () Bool)

(assert (=> b!538415 (=> (not res!333766) (not e!312177))))

(declare-fun lt!246668 () SeekEntryResult!4840)

(assert (=> b!538415 (= res!333766 (or (= lt!246668 (MissingZero!4840 i!1153)) (= lt!246668 (MissingVacant!4840 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34092 (_ BitVec 32)) SeekEntryResult!4840)

(assert (=> b!538415 (= lt!246668 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!538416 () Bool)

(declare-fun res!333756 () Bool)

(assert (=> b!538416 (=> (not res!333756) (not e!312181))))

(assert (=> b!538416 (= res!333756 (validKeyInArray!0 (select (arr!16385 a!3154) j!147)))))

(declare-fun b!538417 () Bool)

(declare-fun res!333758 () Bool)

(assert (=> b!538417 (=> (not res!333758) (not e!312181))))

(assert (=> b!538417 (= res!333758 (and (= (size!16750 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16750 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16750 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538418 () Bool)

(assert (=> b!538418 (= e!312180 e!312183)))

(declare-fun res!333767 () Bool)

(assert (=> b!538418 (=> (not res!333767) (not e!312183))))

(declare-fun lt!246669 () SeekEntryResult!4840)

(assert (=> b!538418 (= res!333767 (and (= lt!246669 lt!246665) (= lt!246670 lt!246669)))))

(assert (=> b!538418 (= lt!246669 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246667 (select (arr!16385 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538419 () Bool)

(declare-fun res!333755 () Bool)

(assert (=> b!538419 (=> (not res!333755) (not e!312177))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34092 (_ BitVec 32)) Bool)

(assert (=> b!538419 (= res!333755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!538420 () Bool)

(assert (=> b!538420 (= e!312177 e!312182)))

(declare-fun res!333760 () Bool)

(assert (=> b!538420 (=> (not res!333760) (not e!312182))))

(assert (=> b!538420 (= res!333760 (= lt!246664 lt!246665))))

(assert (=> b!538420 (= lt!246665 (Intermediate!4840 false resIndex!32 resX!32))))

(assert (=> b!538420 (= lt!246664 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16385 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48870 res!333762) b!538417))

(assert (= (and b!538417 res!333758) b!538416))

(assert (= (and b!538416 res!333756) b!538412))

(assert (= (and b!538412 res!333765) b!538409))

(assert (= (and b!538409 res!333764) b!538415))

(assert (= (and b!538415 res!333766) b!538419))

(assert (= (and b!538419 res!333755) b!538408))

(assert (= (and b!538408 res!333761) b!538414))

(assert (= (and b!538414 res!333763) b!538420))

(assert (= (and b!538420 res!333760) b!538410))

(assert (= (and b!538410 res!333759) b!538411))

(assert (= (and b!538411 res!333757) b!538418))

(assert (= (and b!538418 res!333767) b!538413))

(declare-fun m!517033 () Bool)

(assert (=> b!538411 m!517033))

(declare-fun m!517035 () Bool)

(assert (=> b!538418 m!517035))

(assert (=> b!538418 m!517035))

(declare-fun m!517037 () Bool)

(assert (=> b!538418 m!517037))

(declare-fun m!517039 () Bool)

(assert (=> b!538412 m!517039))

(assert (=> b!538420 m!517035))

(assert (=> b!538420 m!517035))

(declare-fun m!517041 () Bool)

(assert (=> b!538420 m!517041))

(declare-fun m!517043 () Bool)

(assert (=> b!538409 m!517043))

(assert (=> b!538416 m!517035))

(assert (=> b!538416 m!517035))

(declare-fun m!517045 () Bool)

(assert (=> b!538416 m!517045))

(declare-fun m!517047 () Bool)

(assert (=> b!538415 m!517047))

(declare-fun m!517049 () Bool)

(assert (=> b!538413 m!517049))

(declare-fun m!517051 () Bool)

(assert (=> b!538413 m!517051))

(assert (=> b!538413 m!517051))

(declare-fun m!517053 () Bool)

(assert (=> b!538413 m!517053))

(declare-fun m!517055 () Bool)

(assert (=> b!538413 m!517055))

(declare-fun m!517057 () Bool)

(assert (=> start!48870 m!517057))

(declare-fun m!517059 () Bool)

(assert (=> start!48870 m!517059))

(declare-fun m!517061 () Bool)

(assert (=> b!538410 m!517061))

(assert (=> b!538410 m!517035))

(assert (=> b!538410 m!517035))

(declare-fun m!517063 () Bool)

(assert (=> b!538410 m!517063))

(assert (=> b!538410 m!517063))

(assert (=> b!538410 m!517035))

(declare-fun m!517065 () Bool)

(assert (=> b!538410 m!517065))

(declare-fun m!517067 () Bool)

(assert (=> b!538414 m!517067))

(assert (=> b!538414 m!517035))

(declare-fun m!517069 () Bool)

(assert (=> b!538408 m!517069))

(declare-fun m!517071 () Bool)

(assert (=> b!538419 m!517071))

(check-sat (not b!538409) (not start!48870) (not b!538408) (not b!538419) (not b!538412) (not b!538410) (not b!538415) (not b!538416) (not b!538420) (not b!538418) (not b!538413) (not b!538411))
(check-sat)
