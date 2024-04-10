; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48808 () Bool)

(assert start!48808)

(declare-fun b!537236 () Bool)

(declare-fun res!332448 () Bool)

(declare-fun e!311723 () Bool)

(assert (=> b!537236 (=> (not res!332448) (not e!311723))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537236 (= res!332448 (validKeyInArray!0 k!1998))))

(declare-fun b!537237 () Bool)

(declare-fun e!311724 () Bool)

(assert (=> b!537237 (= e!311723 e!311724)))

(declare-fun res!332449 () Bool)

(assert (=> b!537237 (=> (not res!332449) (not e!311724))))

(declare-datatypes ((SeekEntryResult!4807 0))(
  ( (MissingZero!4807 (index!21452 (_ BitVec 32))) (Found!4807 (index!21453 (_ BitVec 32))) (Intermediate!4807 (undefined!5619 Bool) (index!21454 (_ BitVec 32)) (x!50382 (_ BitVec 32))) (Undefined!4807) (MissingVacant!4807 (index!21455 (_ BitVec 32))) )
))
(declare-fun lt!246341 () SeekEntryResult!4807)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537237 (= res!332449 (or (= lt!246341 (MissingZero!4807 i!1153)) (= lt!246341 (MissingVacant!4807 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((array!34020 0))(
  ( (array!34021 (arr!16349 (Array (_ BitVec 32) (_ BitVec 64))) (size!16713 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34020)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34020 (_ BitVec 32)) SeekEntryResult!4807)

(assert (=> b!537237 (= lt!246341 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!537238 () Bool)

(declare-fun e!311721 () Bool)

(declare-fun e!311722 () Bool)

(assert (=> b!537238 (= e!311721 e!311722)))

(declare-fun res!332450 () Bool)

(assert (=> b!537238 (=> (not res!332450) (not e!311722))))

(declare-fun lt!246340 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!537238 (= res!332450 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246340 #b00000000000000000000000000000000) (bvslt lt!246340 (size!16713 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537238 (= lt!246340 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!537239 () Bool)

(declare-fun res!332451 () Bool)

(assert (=> b!537239 (=> (not res!332451) (not e!311724))))

(declare-datatypes ((List!10468 0))(
  ( (Nil!10465) (Cons!10464 (h!11407 (_ BitVec 64)) (t!16696 List!10468)) )
))
(declare-fun arrayNoDuplicates!0 (array!34020 (_ BitVec 32) List!10468) Bool)

(assert (=> b!537239 (= res!332451 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10465))))

(declare-fun b!537240 () Bool)

(declare-fun res!332442 () Bool)

(assert (=> b!537240 (=> (not res!332442) (not e!311724))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34020 (_ BitVec 32)) Bool)

(assert (=> b!537240 (= res!332442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!537241 () Bool)

(declare-fun res!332446 () Bool)

(assert (=> b!537241 (=> (not res!332446) (not e!311723))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!537241 (= res!332446 (validKeyInArray!0 (select (arr!16349 a!3154) j!147)))))

(declare-fun b!537242 () Bool)

(declare-fun res!332443 () Bool)

(assert (=> b!537242 (=> (not res!332443) (not e!311723))))

(declare-fun arrayContainsKey!0 (array!34020 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537242 (= res!332443 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537243 () Bool)

(declare-fun res!332447 () Bool)

(assert (=> b!537243 (=> (not res!332447) (not e!311721))))

(declare-fun lt!246343 () SeekEntryResult!4807)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34020 (_ BitVec 32)) SeekEntryResult!4807)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537243 (= res!332447 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16349 a!3154) j!147) mask!3216) (select (arr!16349 a!3154) j!147) a!3154 mask!3216) lt!246343))))

(declare-fun b!537244 () Bool)

(declare-fun res!332452 () Bool)

(assert (=> b!537244 (=> (not res!332452) (not e!311723))))

(assert (=> b!537244 (= res!332452 (and (= (size!16713 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16713 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16713 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!537245 () Bool)

(declare-fun res!332445 () Bool)

(assert (=> b!537245 (=> (not res!332445) (not e!311724))))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!537245 (= res!332445 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16713 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16713 a!3154)) (= (select (arr!16349 a!3154) resIndex!32) (select (arr!16349 a!3154) j!147))))))

(declare-fun b!537246 () Bool)

(assert (=> b!537246 (= e!311724 e!311721)))

(declare-fun res!332444 () Bool)

(assert (=> b!537246 (=> (not res!332444) (not e!311721))))

(assert (=> b!537246 (= res!332444 (= lt!246343 (Intermediate!4807 false resIndex!32 resX!32)))))

(assert (=> b!537246 (= lt!246343 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16349 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537247 () Bool)

(assert (=> b!537247 (= e!311722 false)))

(declare-fun lt!246342 () SeekEntryResult!4807)

(assert (=> b!537247 (= lt!246342 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246340 (select (arr!16349 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!332441 () Bool)

(assert (=> start!48808 (=> (not res!332441) (not e!311723))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48808 (= res!332441 (validMask!0 mask!3216))))

(assert (=> start!48808 e!311723))

(assert (=> start!48808 true))

(declare-fun array_inv!12145 (array!34020) Bool)

(assert (=> start!48808 (array_inv!12145 a!3154)))

(declare-fun b!537248 () Bool)

(declare-fun res!332453 () Bool)

(assert (=> b!537248 (=> (not res!332453) (not e!311721))))

(assert (=> b!537248 (= res!332453 (and (not (= (select (arr!16349 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16349 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16349 a!3154) index!1177) (select (arr!16349 a!3154) j!147)))))))

(assert (= (and start!48808 res!332441) b!537244))

(assert (= (and b!537244 res!332452) b!537241))

(assert (= (and b!537241 res!332446) b!537236))

(assert (= (and b!537236 res!332448) b!537242))

(assert (= (and b!537242 res!332443) b!537237))

(assert (= (and b!537237 res!332449) b!537240))

(assert (= (and b!537240 res!332442) b!537239))

(assert (= (and b!537239 res!332451) b!537245))

(assert (= (and b!537245 res!332445) b!537246))

(assert (= (and b!537246 res!332444) b!537243))

(assert (= (and b!537243 res!332447) b!537248))

(assert (= (and b!537248 res!332453) b!537238))

(assert (= (and b!537238 res!332450) b!537247))

(declare-fun m!516505 () Bool)

(assert (=> b!537243 m!516505))

(assert (=> b!537243 m!516505))

(declare-fun m!516507 () Bool)

(assert (=> b!537243 m!516507))

(assert (=> b!537243 m!516507))

(assert (=> b!537243 m!516505))

(declare-fun m!516509 () Bool)

(assert (=> b!537243 m!516509))

(declare-fun m!516511 () Bool)

(assert (=> b!537238 m!516511))

(declare-fun m!516513 () Bool)

(assert (=> b!537237 m!516513))

(declare-fun m!516515 () Bool)

(assert (=> b!537239 m!516515))

(assert (=> b!537241 m!516505))

(assert (=> b!537241 m!516505))

(declare-fun m!516517 () Bool)

(assert (=> b!537241 m!516517))

(declare-fun m!516519 () Bool)

(assert (=> b!537236 m!516519))

(declare-fun m!516521 () Bool)

(assert (=> b!537245 m!516521))

(assert (=> b!537245 m!516505))

(assert (=> b!537246 m!516505))

(assert (=> b!537246 m!516505))

(declare-fun m!516523 () Bool)

(assert (=> b!537246 m!516523))

(declare-fun m!516525 () Bool)

(assert (=> b!537242 m!516525))

(declare-fun m!516527 () Bool)

(assert (=> start!48808 m!516527))

(declare-fun m!516529 () Bool)

(assert (=> start!48808 m!516529))

(declare-fun m!516531 () Bool)

(assert (=> b!537248 m!516531))

(assert (=> b!537248 m!516505))

(assert (=> b!537247 m!516505))

(assert (=> b!537247 m!516505))

(declare-fun m!516533 () Bool)

(assert (=> b!537247 m!516533))

(declare-fun m!516535 () Bool)

(assert (=> b!537240 m!516535))

(push 1)

(assert (not b!537238))

(assert (not b!537237))

(assert (not b!537242))

(assert (not b!537240))

(assert (not b!537246))

(assert (not start!48808))

(assert (not b!537243))

