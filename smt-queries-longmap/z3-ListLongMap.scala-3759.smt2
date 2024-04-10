; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51550 () Bool)

(assert start!51550)

(declare-fun res!355243 () Bool)

(declare-fun e!324977 () Bool)

(assert (=> start!51550 (=> (not res!355243) (not e!324977))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51550 (= res!355243 (validMask!0 mask!3119))))

(assert (=> start!51550 e!324977))

(assert (=> start!51550 true))

(declare-datatypes ((array!35415 0))(
  ( (array!35416 (arr!17008 (Array (_ BitVec 32) (_ BitVec 64))) (size!17372 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35415)

(declare-fun array_inv!12804 (array!35415) Bool)

(assert (=> start!51550 (array_inv!12804 a!3118)))

(declare-fun b!564089 () Bool)

(declare-fun res!355241 () Bool)

(assert (=> b!564089 (=> (not res!355241) (not e!324977))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564089 (= res!355241 (validKeyInArray!0 k0!1914))))

(declare-fun b!564090 () Bool)

(declare-fun e!324976 () Bool)

(assert (=> b!564090 (= e!324976 false)))

(declare-fun lt!257437 () Bool)

(declare-datatypes ((List!11088 0))(
  ( (Nil!11085) (Cons!11084 (h!12087 (_ BitVec 64)) (t!17316 List!11088)) )
))
(declare-fun arrayNoDuplicates!0 (array!35415 (_ BitVec 32) List!11088) Bool)

(assert (=> b!564090 (= lt!257437 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11085))))

(declare-fun b!564091 () Bool)

(declare-fun res!355244 () Bool)

(assert (=> b!564091 (=> (not res!355244) (not e!324977))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564091 (= res!355244 (and (= (size!17372 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17372 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17372 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564092 () Bool)

(assert (=> b!564092 (= e!324977 e!324976)))

(declare-fun res!355246 () Bool)

(assert (=> b!564092 (=> (not res!355246) (not e!324976))))

(declare-datatypes ((SeekEntryResult!5457 0))(
  ( (MissingZero!5457 (index!24055 (_ BitVec 32))) (Found!5457 (index!24056 (_ BitVec 32))) (Intermediate!5457 (undefined!6269 Bool) (index!24057 (_ BitVec 32)) (x!52936 (_ BitVec 32))) (Undefined!5457) (MissingVacant!5457 (index!24058 (_ BitVec 32))) )
))
(declare-fun lt!257436 () SeekEntryResult!5457)

(assert (=> b!564092 (= res!355246 (or (= lt!257436 (MissingZero!5457 i!1132)) (= lt!257436 (MissingVacant!5457 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35415 (_ BitVec 32)) SeekEntryResult!5457)

(assert (=> b!564092 (= lt!257436 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!564093 () Bool)

(declare-fun res!355242 () Bool)

(assert (=> b!564093 (=> (not res!355242) (not e!324977))))

(declare-fun arrayContainsKey!0 (array!35415 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564093 (= res!355242 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564094 () Bool)

(declare-fun res!355245 () Bool)

(assert (=> b!564094 (=> (not res!355245) (not e!324976))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35415 (_ BitVec 32)) Bool)

(assert (=> b!564094 (= res!355245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564095 () Bool)

(declare-fun res!355247 () Bool)

(assert (=> b!564095 (=> (not res!355247) (not e!324977))))

(assert (=> b!564095 (= res!355247 (validKeyInArray!0 (select (arr!17008 a!3118) j!142)))))

(assert (= (and start!51550 res!355243) b!564091))

(assert (= (and b!564091 res!355244) b!564095))

(assert (= (and b!564095 res!355247) b!564089))

(assert (= (and b!564089 res!355241) b!564093))

(assert (= (and b!564093 res!355242) b!564092))

(assert (= (and b!564092 res!355246) b!564094))

(assert (= (and b!564094 res!355245) b!564090))

(declare-fun m!542559 () Bool)

(assert (=> b!564093 m!542559))

(declare-fun m!542561 () Bool)

(assert (=> b!564092 m!542561))

(declare-fun m!542563 () Bool)

(assert (=> start!51550 m!542563))

(declare-fun m!542565 () Bool)

(assert (=> start!51550 m!542565))

(declare-fun m!542567 () Bool)

(assert (=> b!564089 m!542567))

(declare-fun m!542569 () Bool)

(assert (=> b!564094 m!542569))

(declare-fun m!542571 () Bool)

(assert (=> b!564090 m!542571))

(declare-fun m!542573 () Bool)

(assert (=> b!564095 m!542573))

(assert (=> b!564095 m!542573))

(declare-fun m!542575 () Bool)

(assert (=> b!564095 m!542575))

(check-sat (not start!51550) (not b!564095) (not b!564093) (not b!564090) (not b!564094) (not b!564092) (not b!564089))
(check-sat)
