; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48852 () Bool)

(assert start!48852)

(declare-fun b!538094 () Bool)

(declare-fun res!333309 () Bool)

(declare-fun e!312050 () Bool)

(assert (=> b!538094 (=> (not res!333309) (not e!312050))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34064 0))(
  ( (array!34065 (arr!16371 (Array (_ BitVec 32) (_ BitVec 64))) (size!16735 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34064)

(assert (=> b!538094 (= res!333309 (and (not (= (select (arr!16371 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16371 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16371 a!3154) index!1177) (select (arr!16371 a!3154) j!147)))))))

(declare-fun b!538095 () Bool)

(declare-fun res!333308 () Bool)

(declare-fun e!312054 () Bool)

(assert (=> b!538095 (=> (not res!333308) (not e!312054))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538095 (= res!333308 (validKeyInArray!0 k!1998))))

(declare-fun b!538096 () Bool)

(declare-fun res!333307 () Bool)

(declare-fun e!312053 () Bool)

(assert (=> b!538096 (=> (not res!333307) (not e!312053))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34064 (_ BitVec 32)) Bool)

(assert (=> b!538096 (= res!333307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!538097 () Bool)

(declare-fun res!333305 () Bool)

(assert (=> b!538097 (=> (not res!333305) (not e!312054))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!538097 (= res!333305 (and (= (size!16735 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16735 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16735 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538099 () Bool)

(declare-fun e!312052 () Bool)

(assert (=> b!538099 (= e!312050 e!312052)))

(declare-fun res!333303 () Bool)

(assert (=> b!538099 (=> (not res!333303) (not e!312052))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!246605 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!538099 (= res!333303 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246605 #b00000000000000000000000000000000) (bvslt lt!246605 (size!16735 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538099 (= lt!246605 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!538100 () Bool)

(assert (=> b!538100 (= e!312053 e!312050)))

(declare-fun res!333300 () Bool)

(assert (=> b!538100 (=> (not res!333300) (not e!312050))))

(declare-datatypes ((SeekEntryResult!4829 0))(
  ( (MissingZero!4829 (index!21540 (_ BitVec 32))) (Found!4829 (index!21541 (_ BitVec 32))) (Intermediate!4829 (undefined!5641 Bool) (index!21542 (_ BitVec 32)) (x!50468 (_ BitVec 32))) (Undefined!4829) (MissingVacant!4829 (index!21543 (_ BitVec 32))) )
))
(declare-fun lt!246607 () SeekEntryResult!4829)

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!538100 (= res!333300 (= lt!246607 (Intermediate!4829 false resIndex!32 resX!32)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34064 (_ BitVec 32)) SeekEntryResult!4829)

(assert (=> b!538100 (= lt!246607 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16371 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!333310 () Bool)

(assert (=> start!48852 (=> (not res!333310) (not e!312054))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48852 (= res!333310 (validMask!0 mask!3216))))

(assert (=> start!48852 e!312054))

(assert (=> start!48852 true))

(declare-fun array_inv!12167 (array!34064) Bool)

(assert (=> start!48852 (array_inv!12167 a!3154)))

(declare-fun b!538098 () Bool)

(assert (=> b!538098 (= e!312054 e!312053)))

(declare-fun res!333299 () Bool)

(assert (=> b!538098 (=> (not res!333299) (not e!312053))))

(declare-fun lt!246606 () SeekEntryResult!4829)

(assert (=> b!538098 (= res!333299 (or (= lt!246606 (MissingZero!4829 i!1153)) (= lt!246606 (MissingVacant!4829 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34064 (_ BitVec 32)) SeekEntryResult!4829)

(assert (=> b!538098 (= lt!246606 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!538101 () Bool)

(declare-fun res!333301 () Bool)

(assert (=> b!538101 (=> (not res!333301) (not e!312054))))

(declare-fun arrayContainsKey!0 (array!34064 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538101 (= res!333301 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538102 () Bool)

(declare-fun res!333302 () Bool)

(assert (=> b!538102 (=> (not res!333302) (not e!312053))))

(assert (=> b!538102 (= res!333302 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16735 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16735 a!3154)) (= (select (arr!16371 a!3154) resIndex!32) (select (arr!16371 a!3154) j!147))))))

(declare-fun b!538103 () Bool)

(declare-fun res!333306 () Bool)

(assert (=> b!538103 (=> (not res!333306) (not e!312050))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538103 (= res!333306 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16371 a!3154) j!147) mask!3216) (select (arr!16371 a!3154) j!147) a!3154 mask!3216) lt!246607))))

(declare-fun b!538104 () Bool)

(declare-fun res!333304 () Bool)

(assert (=> b!538104 (=> (not res!333304) (not e!312054))))

(assert (=> b!538104 (= res!333304 (validKeyInArray!0 (select (arr!16371 a!3154) j!147)))))

(declare-fun b!538105 () Bool)

(declare-fun res!333311 () Bool)

(assert (=> b!538105 (=> (not res!333311) (not e!312053))))

(declare-datatypes ((List!10490 0))(
  ( (Nil!10487) (Cons!10486 (h!11429 (_ BitVec 64)) (t!16718 List!10490)) )
))
(declare-fun arrayNoDuplicates!0 (array!34064 (_ BitVec 32) List!10490) Bool)

(assert (=> b!538105 (= res!333311 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10487))))

(declare-fun b!538106 () Bool)

(assert (=> b!538106 (= e!312052 false)))

(declare-fun lt!246604 () SeekEntryResult!4829)

(assert (=> b!538106 (= lt!246604 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246605 (select (arr!16371 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48852 res!333310) b!538097))

(assert (= (and b!538097 res!333305) b!538104))

(assert (= (and b!538104 res!333304) b!538095))

(assert (= (and b!538095 res!333308) b!538101))

(assert (= (and b!538101 res!333301) b!538098))

(assert (= (and b!538098 res!333299) b!538096))

(assert (= (and b!538096 res!333307) b!538105))

(assert (= (and b!538105 res!333311) b!538102))

(assert (= (and b!538102 res!333302) b!538100))

(assert (= (and b!538100 res!333300) b!538103))

(assert (= (and b!538103 res!333306) b!538094))

(assert (= (and b!538094 res!333309) b!538099))

(assert (= (and b!538099 res!333303) b!538106))

(declare-fun m!517209 () Bool)

(assert (=> b!538096 m!517209))

(declare-fun m!517211 () Bool)

(assert (=> b!538101 m!517211))

(declare-fun m!517213 () Bool)

(assert (=> b!538094 m!517213))

(declare-fun m!517215 () Bool)

(assert (=> b!538094 m!517215))

(declare-fun m!517217 () Bool)

(assert (=> b!538098 m!517217))

(declare-fun m!517219 () Bool)

(assert (=> b!538102 m!517219))

(assert (=> b!538102 m!517215))

(assert (=> b!538106 m!517215))

(assert (=> b!538106 m!517215))

(declare-fun m!517221 () Bool)

(assert (=> b!538106 m!517221))

(assert (=> b!538103 m!517215))

(assert (=> b!538103 m!517215))

(declare-fun m!517223 () Bool)

(assert (=> b!538103 m!517223))

(assert (=> b!538103 m!517223))

(assert (=> b!538103 m!517215))

(declare-fun m!517225 () Bool)

(assert (=> b!538103 m!517225))

(declare-fun m!517227 () Bool)

(assert (=> start!48852 m!517227))

(declare-fun m!517229 () Bool)

(assert (=> start!48852 m!517229))

(declare-fun m!517231 () Bool)

(assert (=> b!538095 m!517231))

(declare-fun m!517233 () Bool)

(assert (=> b!538099 m!517233))

(declare-fun m!517235 () Bool)

(assert (=> b!538105 m!517235))

(assert (=> b!538100 m!517215))

(assert (=> b!538100 m!517215))

(declare-fun m!517237 () Bool)

(assert (=> b!538100 m!517237))

(assert (=> b!538104 m!517215))

(assert (=> b!538104 m!517215))

(declare-fun m!517239 () Bool)

(assert (=> b!538104 m!517239))

(push 1)

