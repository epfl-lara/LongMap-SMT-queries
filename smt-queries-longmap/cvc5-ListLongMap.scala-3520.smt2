; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48682 () Bool)

(assert start!48682)

(declare-fun b!534852 () Bool)

(declare-fun res!330202 () Bool)

(declare-fun e!310755 () Bool)

(assert (=> b!534852 (=> (not res!330202) (not e!310755))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33904 0))(
  ( (array!33905 (arr!16291 (Array (_ BitVec 32) (_ BitVec 64))) (size!16656 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33904)

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!534852 (= res!330202 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16656 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16656 a!3154)) (= (select (arr!16291 a!3154) resIndex!32) (select (arr!16291 a!3154) j!147))))))

(declare-fun b!534853 () Bool)

(declare-fun e!310757 () Bool)

(assert (=> b!534853 (= e!310755 e!310757)))

(declare-fun res!330203 () Bool)

(assert (=> b!534853 (=> (not res!330203) (not e!310757))))

(declare-datatypes ((SeekEntryResult!4746 0))(
  ( (MissingZero!4746 (index!21208 (_ BitVec 32))) (Found!4746 (index!21209 (_ BitVec 32))) (Intermediate!4746 (undefined!5558 Bool) (index!21210 (_ BitVec 32)) (x!50164 (_ BitVec 32))) (Undefined!4746) (MissingVacant!4746 (index!21211 (_ BitVec 32))) )
))
(declare-fun lt!245533 () SeekEntryResult!4746)

(assert (=> b!534853 (= res!330203 (= lt!245533 (Intermediate!4746 false resIndex!32 resX!32)))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33904 (_ BitVec 32)) SeekEntryResult!4746)

(assert (=> b!534853 (= lt!245533 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16291 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534854 () Bool)

(declare-fun res!330200 () Bool)

(declare-fun e!310756 () Bool)

(assert (=> b!534854 (=> (not res!330200) (not e!310756))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534854 (= res!330200 (validKeyInArray!0 k!1998))))

(declare-fun b!534855 () Bool)

(assert (=> b!534855 (= e!310757 (and (not (= (select (arr!16291 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16291 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16291 a!3154) index!1177) (select (arr!16291 a!3154) j!147)) (= index!1177 resIndex!32) (bvsge mask!3216 #b00000000000000000000000000000000) (bvsge index!1177 (bvadd #b00000000000000000000000000000001 mask!3216))))))

(declare-fun b!534856 () Bool)

(declare-fun res!330207 () Bool)

(assert (=> b!534856 (=> (not res!330207) (not e!310755))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33904 (_ BitVec 32)) Bool)

(assert (=> b!534856 (= res!330207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!330209 () Bool)

(assert (=> start!48682 (=> (not res!330209) (not e!310756))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48682 (= res!330209 (validMask!0 mask!3216))))

(assert (=> start!48682 e!310756))

(assert (=> start!48682 true))

(declare-fun array_inv!12174 (array!33904) Bool)

(assert (=> start!48682 (array_inv!12174 a!3154)))

(declare-fun b!534857 () Bool)

(declare-fun res!330208 () Bool)

(assert (=> b!534857 (=> (not res!330208) (not e!310757))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534857 (= res!330208 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16291 a!3154) j!147) mask!3216) (select (arr!16291 a!3154) j!147) a!3154 mask!3216) lt!245533))))

(declare-fun b!534858 () Bool)

(assert (=> b!534858 (= e!310756 e!310755)))

(declare-fun res!330206 () Bool)

(assert (=> b!534858 (=> (not res!330206) (not e!310755))))

(declare-fun lt!245532 () SeekEntryResult!4746)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534858 (= res!330206 (or (= lt!245532 (MissingZero!4746 i!1153)) (= lt!245532 (MissingVacant!4746 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33904 (_ BitVec 32)) SeekEntryResult!4746)

(assert (=> b!534858 (= lt!245532 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!534859 () Bool)

(declare-fun res!330205 () Bool)

(assert (=> b!534859 (=> (not res!330205) (not e!310755))))

(declare-datatypes ((List!10449 0))(
  ( (Nil!10446) (Cons!10445 (h!11388 (_ BitVec 64)) (t!16668 List!10449)) )
))
(declare-fun arrayNoDuplicates!0 (array!33904 (_ BitVec 32) List!10449) Bool)

(assert (=> b!534859 (= res!330205 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10446))))

(declare-fun b!534860 () Bool)

(declare-fun res!330201 () Bool)

(assert (=> b!534860 (=> (not res!330201) (not e!310756))))

(declare-fun arrayContainsKey!0 (array!33904 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534860 (= res!330201 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534861 () Bool)

(declare-fun res!330199 () Bool)

(assert (=> b!534861 (=> (not res!330199) (not e!310756))))

(assert (=> b!534861 (= res!330199 (validKeyInArray!0 (select (arr!16291 a!3154) j!147)))))

(declare-fun b!534862 () Bool)

(declare-fun res!330204 () Bool)

(assert (=> b!534862 (=> (not res!330204) (not e!310756))))

(assert (=> b!534862 (= res!330204 (and (= (size!16656 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16656 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16656 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48682 res!330209) b!534862))

(assert (= (and b!534862 res!330204) b!534861))

(assert (= (and b!534861 res!330199) b!534854))

(assert (= (and b!534854 res!330200) b!534860))

(assert (= (and b!534860 res!330201) b!534858))

(assert (= (and b!534858 res!330206) b!534856))

(assert (= (and b!534856 res!330207) b!534859))

(assert (= (and b!534859 res!330205) b!534852))

(assert (= (and b!534852 res!330202) b!534853))

(assert (= (and b!534853 res!330203) b!534857))

(assert (= (and b!534857 res!330208) b!534855))

(declare-fun m!513993 () Bool)

(assert (=> b!534854 m!513993))

(declare-fun m!513995 () Bool)

(assert (=> b!534861 m!513995))

(assert (=> b!534861 m!513995))

(declare-fun m!513997 () Bool)

(assert (=> b!534861 m!513997))

(declare-fun m!513999 () Bool)

(assert (=> b!534856 m!513999))

(declare-fun m!514001 () Bool)

(assert (=> b!534859 m!514001))

(declare-fun m!514003 () Bool)

(assert (=> start!48682 m!514003))

(declare-fun m!514005 () Bool)

(assert (=> start!48682 m!514005))

(assert (=> b!534857 m!513995))

(assert (=> b!534857 m!513995))

(declare-fun m!514007 () Bool)

(assert (=> b!534857 m!514007))

(assert (=> b!534857 m!514007))

(assert (=> b!534857 m!513995))

(declare-fun m!514009 () Bool)

(assert (=> b!534857 m!514009))

(declare-fun m!514011 () Bool)

(assert (=> b!534852 m!514011))

(assert (=> b!534852 m!513995))

(declare-fun m!514013 () Bool)

(assert (=> b!534860 m!514013))

(declare-fun m!514015 () Bool)

(assert (=> b!534855 m!514015))

(assert (=> b!534855 m!513995))

(assert (=> b!534853 m!513995))

(assert (=> b!534853 m!513995))

(declare-fun m!514017 () Bool)

(assert (=> b!534853 m!514017))

(declare-fun m!514019 () Bool)

(assert (=> b!534858 m!514019))

(push 1)

(assert (not b!534854))

(assert (not b!534853))

(assert (not b!534859))

(assert (not b!534857))

(assert (not b!534856))

(assert (not b!534858))

(assert (not start!48682))

(assert (not b!534861))

(assert (not b!534860))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

