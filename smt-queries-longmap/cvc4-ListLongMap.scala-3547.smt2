; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48856 () Bool)

(assert start!48856)

(declare-fun b!538172 () Bool)

(declare-fun res!333385 () Bool)

(declare-fun e!312080 () Bool)

(assert (=> b!538172 (=> (not res!333385) (not e!312080))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34068 0))(
  ( (array!34069 (arr!16373 (Array (_ BitVec 32) (_ BitVec 64))) (size!16737 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34068)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!538172 (= res!333385 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16737 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16737 a!3154)) (= (select (arr!16373 a!3154) resIndex!32) (select (arr!16373 a!3154) j!147))))))

(declare-fun b!538173 () Bool)

(declare-fun e!312084 () Bool)

(declare-fun e!312081 () Bool)

(assert (=> b!538173 (= e!312084 e!312081)))

(declare-fun res!333381 () Bool)

(assert (=> b!538173 (=> (not res!333381) (not e!312081))))

(declare-fun lt!246629 () (_ BitVec 32))

(assert (=> b!538173 (= res!333381 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246629 #b00000000000000000000000000000000) (bvslt lt!246629 (size!16737 a!3154))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538173 (= lt!246629 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!538174 () Bool)

(declare-fun res!333386 () Bool)

(declare-fun e!312082 () Bool)

(assert (=> b!538174 (=> (not res!333386) (not e!312082))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538174 (= res!333386 (validKeyInArray!0 k!1998))))

(declare-fun b!538175 () Bool)

(declare-fun res!333388 () Bool)

(assert (=> b!538175 (=> (not res!333388) (not e!312082))))

(declare-fun arrayContainsKey!0 (array!34068 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538175 (= res!333388 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538176 () Bool)

(declare-fun res!333382 () Bool)

(assert (=> b!538176 (=> (not res!333382) (not e!312084))))

(declare-datatypes ((SeekEntryResult!4831 0))(
  ( (MissingZero!4831 (index!21548 (_ BitVec 32))) (Found!4831 (index!21549 (_ BitVec 32))) (Intermediate!4831 (undefined!5643 Bool) (index!21550 (_ BitVec 32)) (x!50470 (_ BitVec 32))) (Undefined!4831) (MissingVacant!4831 (index!21551 (_ BitVec 32))) )
))
(declare-fun lt!246631 () SeekEntryResult!4831)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34068 (_ BitVec 32)) SeekEntryResult!4831)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538176 (= res!333382 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16373 a!3154) j!147) mask!3216) (select (arr!16373 a!3154) j!147) a!3154 mask!3216) lt!246631))))

(declare-fun b!538177 () Bool)

(declare-fun res!333384 () Bool)

(assert (=> b!538177 (=> (not res!333384) (not e!312080))))

(declare-datatypes ((List!10492 0))(
  ( (Nil!10489) (Cons!10488 (h!11431 (_ BitVec 64)) (t!16720 List!10492)) )
))
(declare-fun arrayNoDuplicates!0 (array!34068 (_ BitVec 32) List!10492) Bool)

(assert (=> b!538177 (= res!333384 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10489))))

(declare-fun b!538178 () Bool)

(declare-fun res!333378 () Bool)

(assert (=> b!538178 (=> (not res!333378) (not e!312082))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!538178 (= res!333378 (and (= (size!16737 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16737 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16737 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!333379 () Bool)

(assert (=> start!48856 (=> (not res!333379) (not e!312082))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48856 (= res!333379 (validMask!0 mask!3216))))

(assert (=> start!48856 e!312082))

(assert (=> start!48856 true))

(declare-fun array_inv!12169 (array!34068) Bool)

(assert (=> start!48856 (array_inv!12169 a!3154)))

(declare-fun b!538179 () Bool)

(declare-fun res!333380 () Bool)

(assert (=> b!538179 (=> (not res!333380) (not e!312084))))

(assert (=> b!538179 (= res!333380 (and (not (= (select (arr!16373 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16373 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16373 a!3154) index!1177) (select (arr!16373 a!3154) j!147)))))))

(declare-fun b!538180 () Bool)

(assert (=> b!538180 (= e!312082 e!312080)))

(declare-fun res!333387 () Bool)

(assert (=> b!538180 (=> (not res!333387) (not e!312080))))

(declare-fun lt!246630 () SeekEntryResult!4831)

(assert (=> b!538180 (= res!333387 (or (= lt!246630 (MissingZero!4831 i!1153)) (= lt!246630 (MissingVacant!4831 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34068 (_ BitVec 32)) SeekEntryResult!4831)

(assert (=> b!538180 (= lt!246630 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!538181 () Bool)

(declare-fun res!333383 () Bool)

(assert (=> b!538181 (=> (not res!333383) (not e!312080))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34068 (_ BitVec 32)) Bool)

(assert (=> b!538181 (= res!333383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!538182 () Bool)

(assert (=> b!538182 (= e!312080 e!312084)))

(declare-fun res!333389 () Bool)

(assert (=> b!538182 (=> (not res!333389) (not e!312084))))

(assert (=> b!538182 (= res!333389 (= lt!246631 (Intermediate!4831 false resIndex!32 resX!32)))))

(assert (=> b!538182 (= lt!246631 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16373 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538183 () Bool)

(declare-fun res!333377 () Bool)

(assert (=> b!538183 (=> (not res!333377) (not e!312082))))

(assert (=> b!538183 (= res!333377 (validKeyInArray!0 (select (arr!16373 a!3154) j!147)))))

(declare-fun b!538184 () Bool)

(assert (=> b!538184 (= e!312081 false)))

(declare-fun lt!246628 () SeekEntryResult!4831)

(assert (=> b!538184 (= lt!246628 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246629 (select (arr!16373 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48856 res!333379) b!538178))

(assert (= (and b!538178 res!333378) b!538183))

(assert (= (and b!538183 res!333377) b!538174))

(assert (= (and b!538174 res!333386) b!538175))

(assert (= (and b!538175 res!333388) b!538180))

(assert (= (and b!538180 res!333387) b!538181))

(assert (= (and b!538181 res!333383) b!538177))

(assert (= (and b!538177 res!333384) b!538172))

(assert (= (and b!538172 res!333385) b!538182))

(assert (= (and b!538182 res!333389) b!538176))

(assert (= (and b!538176 res!333382) b!538179))

(assert (= (and b!538179 res!333380) b!538173))

(assert (= (and b!538173 res!333381) b!538184))

(declare-fun m!517273 () Bool)

(assert (=> b!538177 m!517273))

(declare-fun m!517275 () Bool)

(assert (=> b!538179 m!517275))

(declare-fun m!517277 () Bool)

(assert (=> b!538179 m!517277))

(assert (=> b!538184 m!517277))

(assert (=> b!538184 m!517277))

(declare-fun m!517279 () Bool)

(assert (=> b!538184 m!517279))

(assert (=> b!538176 m!517277))

(assert (=> b!538176 m!517277))

(declare-fun m!517281 () Bool)

(assert (=> b!538176 m!517281))

(assert (=> b!538176 m!517281))

(assert (=> b!538176 m!517277))

(declare-fun m!517283 () Bool)

(assert (=> b!538176 m!517283))

(declare-fun m!517285 () Bool)

(assert (=> b!538181 m!517285))

(declare-fun m!517287 () Bool)

(assert (=> b!538173 m!517287))

(assert (=> b!538182 m!517277))

(assert (=> b!538182 m!517277))

(declare-fun m!517289 () Bool)

(assert (=> b!538182 m!517289))

(declare-fun m!517291 () Bool)

(assert (=> start!48856 m!517291))

(declare-fun m!517293 () Bool)

(assert (=> start!48856 m!517293))

(declare-fun m!517295 () Bool)

(assert (=> b!538180 m!517295))

(declare-fun m!517297 () Bool)

(assert (=> b!538175 m!517297))

(declare-fun m!517299 () Bool)

(assert (=> b!538174 m!517299))

(declare-fun m!517301 () Bool)

(assert (=> b!538172 m!517301))

(assert (=> b!538172 m!517277))

(assert (=> b!538183 m!517277))

(assert (=> b!538183 m!517277))

(declare-fun m!517303 () Bool)

(assert (=> b!538183 m!517303))

(push 1)

(assert (not b!538181))

(assert (not b!538183))

(assert (not b!538182))

(assert (not b!538173))

(assert (not b!538176))

(assert (not b!538177))

(assert (not b!538174))

