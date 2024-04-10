; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48850 () Bool)

(assert start!48850)

(declare-fun b!538055 () Bool)

(declare-fun res!333267 () Bool)

(declare-fun e!312035 () Bool)

(assert (=> b!538055 (=> (not res!333267) (not e!312035))))

(declare-datatypes ((array!34062 0))(
  ( (array!34063 (arr!16370 (Array (_ BitVec 32) (_ BitVec 64))) (size!16734 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34062)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!538055 (= res!333267 (and (= (size!16734 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16734 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16734 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538056 () Bool)

(declare-fun res!333261 () Bool)

(assert (=> b!538056 (=> (not res!333261) (not e!312035))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538056 (= res!333261 (validKeyInArray!0 k!1998))))

(declare-fun b!538057 () Bool)

(declare-fun e!312038 () Bool)

(declare-fun e!312036 () Bool)

(assert (=> b!538057 (= e!312038 e!312036)))

(declare-fun res!333271 () Bool)

(assert (=> b!538057 (=> (not res!333271) (not e!312036))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!246594 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!538057 (= res!333271 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246594 #b00000000000000000000000000000000) (bvslt lt!246594 (size!16734 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538057 (= lt!246594 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun res!333260 () Bool)

(assert (=> start!48850 (=> (not res!333260) (not e!312035))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48850 (= res!333260 (validMask!0 mask!3216))))

(assert (=> start!48850 e!312035))

(assert (=> start!48850 true))

(declare-fun array_inv!12166 (array!34062) Bool)

(assert (=> start!48850 (array_inv!12166 a!3154)))

(declare-fun b!538058 () Bool)

(declare-fun res!333262 () Bool)

(assert (=> b!538058 (=> (not res!333262) (not e!312038))))

(declare-datatypes ((SeekEntryResult!4828 0))(
  ( (MissingZero!4828 (index!21536 (_ BitVec 32))) (Found!4828 (index!21537 (_ BitVec 32))) (Intermediate!4828 (undefined!5640 Bool) (index!21538 (_ BitVec 32)) (x!50459 (_ BitVec 32))) (Undefined!4828) (MissingVacant!4828 (index!21539 (_ BitVec 32))) )
))
(declare-fun lt!246595 () SeekEntryResult!4828)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34062 (_ BitVec 32)) SeekEntryResult!4828)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538058 (= res!333262 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16370 a!3154) j!147) mask!3216) (select (arr!16370 a!3154) j!147) a!3154 mask!3216) lt!246595))))

(declare-fun b!538059 () Bool)

(declare-fun res!333263 () Bool)

(declare-fun e!312039 () Bool)

(assert (=> b!538059 (=> (not res!333263) (not e!312039))))

(declare-datatypes ((List!10489 0))(
  ( (Nil!10486) (Cons!10485 (h!11428 (_ BitVec 64)) (t!16717 List!10489)) )
))
(declare-fun arrayNoDuplicates!0 (array!34062 (_ BitVec 32) List!10489) Bool)

(assert (=> b!538059 (= res!333263 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10486))))

(declare-fun b!538060 () Bool)

(declare-fun res!333268 () Bool)

(assert (=> b!538060 (=> (not res!333268) (not e!312039))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34062 (_ BitVec 32)) Bool)

(assert (=> b!538060 (= res!333268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!538061 () Bool)

(declare-fun res!333264 () Bool)

(assert (=> b!538061 (=> (not res!333264) (not e!312035))))

(declare-fun arrayContainsKey!0 (array!34062 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538061 (= res!333264 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538062 () Bool)

(assert (=> b!538062 (= e!312036 false)))

(declare-fun lt!246593 () SeekEntryResult!4828)

(assert (=> b!538062 (= lt!246593 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246594 (select (arr!16370 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538063 () Bool)

(declare-fun res!333272 () Bool)

(assert (=> b!538063 (=> (not res!333272) (not e!312035))))

(assert (=> b!538063 (= res!333272 (validKeyInArray!0 (select (arr!16370 a!3154) j!147)))))

(declare-fun b!538064 () Bool)

(assert (=> b!538064 (= e!312039 e!312038)))

(declare-fun res!333265 () Bool)

(assert (=> b!538064 (=> (not res!333265) (not e!312038))))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!538064 (= res!333265 (= lt!246595 (Intermediate!4828 false resIndex!32 resX!32)))))

(assert (=> b!538064 (= lt!246595 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16370 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538065 () Bool)

(declare-fun res!333269 () Bool)

(assert (=> b!538065 (=> (not res!333269) (not e!312039))))

(assert (=> b!538065 (= res!333269 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16734 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16734 a!3154)) (= (select (arr!16370 a!3154) resIndex!32) (select (arr!16370 a!3154) j!147))))))

(declare-fun b!538066 () Bool)

(assert (=> b!538066 (= e!312035 e!312039)))

(declare-fun res!333266 () Bool)

(assert (=> b!538066 (=> (not res!333266) (not e!312039))))

(declare-fun lt!246592 () SeekEntryResult!4828)

(assert (=> b!538066 (= res!333266 (or (= lt!246592 (MissingZero!4828 i!1153)) (= lt!246592 (MissingVacant!4828 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34062 (_ BitVec 32)) SeekEntryResult!4828)

(assert (=> b!538066 (= lt!246592 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!538067 () Bool)

(declare-fun res!333270 () Bool)

(assert (=> b!538067 (=> (not res!333270) (not e!312038))))

(assert (=> b!538067 (= res!333270 (and (not (= (select (arr!16370 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16370 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16370 a!3154) index!1177) (select (arr!16370 a!3154) j!147)))))))

(assert (= (and start!48850 res!333260) b!538055))

(assert (= (and b!538055 res!333267) b!538063))

(assert (= (and b!538063 res!333272) b!538056))

(assert (= (and b!538056 res!333261) b!538061))

(assert (= (and b!538061 res!333264) b!538066))

(assert (= (and b!538066 res!333266) b!538060))

(assert (= (and b!538060 res!333268) b!538059))

(assert (= (and b!538059 res!333263) b!538065))

(assert (= (and b!538065 res!333269) b!538064))

(assert (= (and b!538064 res!333265) b!538058))

(assert (= (and b!538058 res!333262) b!538067))

(assert (= (and b!538067 res!333270) b!538057))

(assert (= (and b!538057 res!333271) b!538062))

(declare-fun m!517177 () Bool)

(assert (=> b!538064 m!517177))

(assert (=> b!538064 m!517177))

(declare-fun m!517179 () Bool)

(assert (=> b!538064 m!517179))

(assert (=> b!538062 m!517177))

(assert (=> b!538062 m!517177))

(declare-fun m!517181 () Bool)

(assert (=> b!538062 m!517181))

(declare-fun m!517183 () Bool)

(assert (=> b!538056 m!517183))

(assert (=> b!538063 m!517177))

(assert (=> b!538063 m!517177))

(declare-fun m!517185 () Bool)

(assert (=> b!538063 m!517185))

(assert (=> b!538058 m!517177))

(assert (=> b!538058 m!517177))

(declare-fun m!517187 () Bool)

(assert (=> b!538058 m!517187))

(assert (=> b!538058 m!517187))

(assert (=> b!538058 m!517177))

(declare-fun m!517189 () Bool)

(assert (=> b!538058 m!517189))

(declare-fun m!517191 () Bool)

(assert (=> b!538060 m!517191))

(declare-fun m!517193 () Bool)

(assert (=> b!538061 m!517193))

(declare-fun m!517195 () Bool)

(assert (=> b!538057 m!517195))

(declare-fun m!517197 () Bool)

(assert (=> b!538067 m!517197))

(assert (=> b!538067 m!517177))

(declare-fun m!517199 () Bool)

(assert (=> start!48850 m!517199))

(declare-fun m!517201 () Bool)

(assert (=> start!48850 m!517201))

(declare-fun m!517203 () Bool)

(assert (=> b!538065 m!517203))

(assert (=> b!538065 m!517177))

(declare-fun m!517205 () Bool)

(assert (=> b!538059 m!517205))

(declare-fun m!517207 () Bool)

(assert (=> b!538066 m!517207))

(push 1)

(assert (not b!538061))

(assert (not b!538056))

(assert (not b!538059))

(assert (not b!538066))

(assert (not b!538060))

(assert (not b!538063))

(assert (not start!48850))

