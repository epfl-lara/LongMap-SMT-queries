; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49292 () Bool)

(assert start!49292)

(declare-fun res!337306 () Bool)

(declare-fun e!314073 () Bool)

(assert (=> start!49292 (=> (not res!337306) (not e!314073))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49292 (= res!337306 (validMask!0 mask!3216))))

(assert (=> start!49292 e!314073))

(assert (=> start!49292 true))

(declare-datatypes ((array!34300 0))(
  ( (array!34301 (arr!16483 (Array (_ BitVec 32) (_ BitVec 64))) (size!16847 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34300)

(declare-fun array_inv!12279 (array!34300) Bool)

(assert (=> start!49292 (array_inv!12279 a!3154)))

(declare-fun b!542754 () Bool)

(declare-fun e!314071 () Bool)

(declare-fun e!314072 () Bool)

(assert (=> b!542754 (= e!314071 e!314072)))

(declare-fun res!337308 () Bool)

(assert (=> b!542754 (=> (not res!337308) (not e!314072))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4941 0))(
  ( (MissingZero!4941 (index!21988 (_ BitVec 32))) (Found!4941 (index!21989 (_ BitVec 32))) (Intermediate!4941 (undefined!5753 Bool) (index!21990 (_ BitVec 32)) (x!50900 (_ BitVec 32))) (Undefined!4941) (MissingVacant!4941 (index!21991 (_ BitVec 32))) )
))
(declare-fun lt!248000 () SeekEntryResult!4941)

(assert (=> b!542754 (= res!337308 (= lt!248000 (Intermediate!4941 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34300 (_ BitVec 32)) SeekEntryResult!4941)

(assert (=> b!542754 (= lt!248000 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16483 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542755 () Bool)

(assert (=> b!542755 (= e!314072 false)))

(declare-fun lt!248001 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542755 (= lt!248001 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!542756 () Bool)

(declare-fun res!337314 () Bool)

(assert (=> b!542756 (=> (not res!337314) (not e!314072))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542756 (= res!337314 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16483 a!3154) j!147) mask!3216) (select (arr!16483 a!3154) j!147) a!3154 mask!3216) lt!248000))))

(declare-fun b!542757 () Bool)

(declare-fun res!337311 () Bool)

(assert (=> b!542757 (=> (not res!337311) (not e!314073))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!542757 (= res!337311 (validKeyInArray!0 (select (arr!16483 a!3154) j!147)))))

(declare-fun b!542758 () Bool)

(declare-fun res!337305 () Bool)

(assert (=> b!542758 (=> (not res!337305) (not e!314071))))

(declare-datatypes ((List!10602 0))(
  ( (Nil!10599) (Cons!10598 (h!11553 (_ BitVec 64)) (t!16830 List!10602)) )
))
(declare-fun arrayNoDuplicates!0 (array!34300 (_ BitVec 32) List!10602) Bool)

(assert (=> b!542758 (= res!337305 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10599))))

(declare-fun b!542759 () Bool)

(declare-fun res!337310 () Bool)

(assert (=> b!542759 (=> (not res!337310) (not e!314071))))

(assert (=> b!542759 (= res!337310 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16847 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16847 a!3154)) (= (select (arr!16483 a!3154) resIndex!32) (select (arr!16483 a!3154) j!147))))))

(declare-fun b!542760 () Bool)

(declare-fun res!337307 () Bool)

(assert (=> b!542760 (=> (not res!337307) (not e!314073))))

(declare-fun k0!1998 () (_ BitVec 64))

(assert (=> b!542760 (= res!337307 (validKeyInArray!0 k0!1998))))

(declare-fun b!542761 () Bool)

(assert (=> b!542761 (= e!314073 e!314071)))

(declare-fun res!337316 () Bool)

(assert (=> b!542761 (=> (not res!337316) (not e!314071))))

(declare-fun lt!248002 () SeekEntryResult!4941)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!542761 (= res!337316 (or (= lt!248002 (MissingZero!4941 i!1153)) (= lt!248002 (MissingVacant!4941 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34300 (_ BitVec 32)) SeekEntryResult!4941)

(assert (=> b!542761 (= lt!248002 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!542762 () Bool)

(declare-fun res!337312 () Bool)

(assert (=> b!542762 (=> (not res!337312) (not e!314073))))

(assert (=> b!542762 (= res!337312 (and (= (size!16847 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16847 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16847 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!542763 () Bool)

(declare-fun res!337315 () Bool)

(assert (=> b!542763 (=> (not res!337315) (not e!314071))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34300 (_ BitVec 32)) Bool)

(assert (=> b!542763 (= res!337315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!542764 () Bool)

(declare-fun res!337309 () Bool)

(assert (=> b!542764 (=> (not res!337309) (not e!314073))))

(declare-fun arrayContainsKey!0 (array!34300 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!542764 (= res!337309 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!542765 () Bool)

(declare-fun res!337313 () Bool)

(assert (=> b!542765 (=> (not res!337313) (not e!314072))))

(assert (=> b!542765 (= res!337313 (and (not (= (select (arr!16483 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16483 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16483 a!3154) index!1177) (select (arr!16483 a!3154) j!147)))))))

(assert (= (and start!49292 res!337306) b!542762))

(assert (= (and b!542762 res!337312) b!542757))

(assert (= (and b!542757 res!337311) b!542760))

(assert (= (and b!542760 res!337307) b!542764))

(assert (= (and b!542764 res!337309) b!542761))

(assert (= (and b!542761 res!337316) b!542763))

(assert (= (and b!542763 res!337315) b!542758))

(assert (= (and b!542758 res!337305) b!542759))

(assert (= (and b!542759 res!337310) b!542754))

(assert (= (and b!542754 res!337308) b!542756))

(assert (= (and b!542756 res!337314) b!542765))

(assert (= (and b!542765 res!337313) b!542755))

(declare-fun m!520959 () Bool)

(assert (=> b!542761 m!520959))

(declare-fun m!520961 () Bool)

(assert (=> b!542760 m!520961))

(declare-fun m!520963 () Bool)

(assert (=> b!542754 m!520963))

(assert (=> b!542754 m!520963))

(declare-fun m!520965 () Bool)

(assert (=> b!542754 m!520965))

(declare-fun m!520967 () Bool)

(assert (=> b!542764 m!520967))

(declare-fun m!520969 () Bool)

(assert (=> b!542763 m!520969))

(assert (=> b!542757 m!520963))

(assert (=> b!542757 m!520963))

(declare-fun m!520971 () Bool)

(assert (=> b!542757 m!520971))

(declare-fun m!520973 () Bool)

(assert (=> b!542755 m!520973))

(assert (=> b!542756 m!520963))

(assert (=> b!542756 m!520963))

(declare-fun m!520975 () Bool)

(assert (=> b!542756 m!520975))

(assert (=> b!542756 m!520975))

(assert (=> b!542756 m!520963))

(declare-fun m!520977 () Bool)

(assert (=> b!542756 m!520977))

(declare-fun m!520979 () Bool)

(assert (=> b!542759 m!520979))

(assert (=> b!542759 m!520963))

(declare-fun m!520981 () Bool)

(assert (=> start!49292 m!520981))

(declare-fun m!520983 () Bool)

(assert (=> start!49292 m!520983))

(declare-fun m!520985 () Bool)

(assert (=> b!542758 m!520985))

(declare-fun m!520987 () Bool)

(assert (=> b!542765 m!520987))

(assert (=> b!542765 m!520963))

(check-sat (not b!542758) (not b!542755) (not b!542754) (not start!49292) (not b!542756) (not b!542761) (not b!542760) (not b!542763) (not b!542764) (not b!542757))
