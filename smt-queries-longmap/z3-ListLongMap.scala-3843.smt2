; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52856 () Bool)

(assert start!52856)

(declare-fun res!364385 () Bool)

(declare-fun e!331399 () Bool)

(assert (=> start!52856 (=> (not res!364385) (not e!331399))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52856 (= res!364385 (validMask!0 mask!3119))))

(assert (=> start!52856 e!331399))

(assert (=> start!52856 true))

(declare-datatypes ((array!35953 0))(
  ( (array!35954 (arr!17258 (Array (_ BitVec 32) (_ BitVec 64))) (size!17623 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35953)

(declare-fun array_inv!13141 (array!35953) Bool)

(assert (=> start!52856 (array_inv!13141 a!3118)))

(declare-fun b!576001 () Bool)

(declare-fun res!364380 () Bool)

(declare-fun e!331401 () Bool)

(assert (=> b!576001 (=> (not res!364380) (not e!331401))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5704 0))(
  ( (MissingZero!5704 (index!25043 (_ BitVec 32))) (Found!5704 (index!25044 (_ BitVec 32))) (Intermediate!5704 (undefined!6516 Bool) (index!25045 (_ BitVec 32)) (x!53946 (_ BitVec 32))) (Undefined!5704) (MissingVacant!5704 (index!25046 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35953 (_ BitVec 32)) SeekEntryResult!5704)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!576001 (= res!364380 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17258 a!3118) j!142) mask!3119) (select (arr!17258 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17258 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17258 a!3118) i!1132 k0!1914) j!142) (array!35954 (store (arr!17258 a!3118) i!1132 k0!1914) (size!17623 a!3118)) mask!3119)))))

(declare-fun b!576002 () Bool)

(declare-fun res!364381 () Bool)

(assert (=> b!576002 (=> (not res!364381) (not e!331401))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35953 (_ BitVec 32)) Bool)

(assert (=> b!576002 (= res!364381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!576003 () Bool)

(assert (=> b!576003 (= e!331399 e!331401)))

(declare-fun res!364376 () Bool)

(assert (=> b!576003 (=> (not res!364376) (not e!331401))))

(declare-fun lt!263395 () SeekEntryResult!5704)

(assert (=> b!576003 (= res!364376 (or (= lt!263395 (MissingZero!5704 i!1132)) (= lt!263395 (MissingVacant!5704 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35953 (_ BitVec 32)) SeekEntryResult!5704)

(assert (=> b!576003 (= lt!263395 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!576004 () Bool)

(declare-fun res!364382 () Bool)

(assert (=> b!576004 (=> (not res!364382) (not e!331399))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!576004 (= res!364382 (validKeyInArray!0 k0!1914))))

(declare-fun b!576005 () Bool)

(declare-fun res!364377 () Bool)

(assert (=> b!576005 (=> (not res!364377) (not e!331401))))

(declare-datatypes ((List!11377 0))(
  ( (Nil!11374) (Cons!11373 (h!12415 (_ BitVec 64)) (t!17596 List!11377)) )
))
(declare-fun arrayNoDuplicates!0 (array!35953 (_ BitVec 32) List!11377) Bool)

(assert (=> b!576005 (= res!364377 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11374))))

(declare-fun b!576006 () Bool)

(assert (=> b!576006 (= e!331401 (not true))))

(declare-fun e!331398 () Bool)

(assert (=> b!576006 e!331398))

(declare-fun res!364383 () Bool)

(assert (=> b!576006 (=> (not res!364383) (not e!331398))))

(assert (=> b!576006 (= res!364383 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!18096 0))(
  ( (Unit!18097) )
))
(declare-fun lt!263394 () Unit!18096)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35953 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18096)

(assert (=> b!576006 (= lt!263394 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!576007 () Bool)

(declare-fun res!364379 () Bool)

(assert (=> b!576007 (=> (not res!364379) (not e!331399))))

(declare-fun arrayContainsKey!0 (array!35953 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!576007 (= res!364379 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!576008 () Bool)

(assert (=> b!576008 (= e!331398 (= (seekEntryOrOpen!0 (select (arr!17258 a!3118) j!142) a!3118 mask!3119) (Found!5704 j!142)))))

(declare-fun b!576009 () Bool)

(declare-fun res!364384 () Bool)

(assert (=> b!576009 (=> (not res!364384) (not e!331399))))

(assert (=> b!576009 (= res!364384 (and (= (size!17623 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17623 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17623 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!576010 () Bool)

(declare-fun res!364378 () Bool)

(assert (=> b!576010 (=> (not res!364378) (not e!331399))))

(assert (=> b!576010 (= res!364378 (validKeyInArray!0 (select (arr!17258 a!3118) j!142)))))

(assert (= (and start!52856 res!364385) b!576009))

(assert (= (and b!576009 res!364384) b!576010))

(assert (= (and b!576010 res!364378) b!576004))

(assert (= (and b!576004 res!364382) b!576007))

(assert (= (and b!576007 res!364379) b!576003))

(assert (= (and b!576003 res!364376) b!576002))

(assert (= (and b!576002 res!364381) b!576005))

(assert (= (and b!576005 res!364377) b!576001))

(assert (= (and b!576001 res!364380) b!576006))

(assert (= (and b!576006 res!364383) b!576008))

(declare-fun m!554429 () Bool)

(assert (=> start!52856 m!554429))

(declare-fun m!554431 () Bool)

(assert (=> start!52856 m!554431))

(declare-fun m!554433 () Bool)

(assert (=> b!576001 m!554433))

(declare-fun m!554435 () Bool)

(assert (=> b!576001 m!554435))

(assert (=> b!576001 m!554433))

(declare-fun m!554437 () Bool)

(assert (=> b!576001 m!554437))

(declare-fun m!554439 () Bool)

(assert (=> b!576001 m!554439))

(assert (=> b!576001 m!554437))

(declare-fun m!554441 () Bool)

(assert (=> b!576001 m!554441))

(assert (=> b!576001 m!554435))

(assert (=> b!576001 m!554433))

(declare-fun m!554443 () Bool)

(assert (=> b!576001 m!554443))

(declare-fun m!554445 () Bool)

(assert (=> b!576001 m!554445))

(assert (=> b!576001 m!554437))

(assert (=> b!576001 m!554439))

(declare-fun m!554447 () Bool)

(assert (=> b!576005 m!554447))

(declare-fun m!554449 () Bool)

(assert (=> b!576006 m!554449))

(declare-fun m!554451 () Bool)

(assert (=> b!576006 m!554451))

(declare-fun m!554453 () Bool)

(assert (=> b!576004 m!554453))

(declare-fun m!554455 () Bool)

(assert (=> b!576002 m!554455))

(assert (=> b!576010 m!554433))

(assert (=> b!576010 m!554433))

(declare-fun m!554457 () Bool)

(assert (=> b!576010 m!554457))

(declare-fun m!554459 () Bool)

(assert (=> b!576007 m!554459))

(declare-fun m!554461 () Bool)

(assert (=> b!576003 m!554461))

(assert (=> b!576008 m!554433))

(assert (=> b!576008 m!554433))

(declare-fun m!554463 () Bool)

(assert (=> b!576008 m!554463))

(check-sat (not b!576002) (not b!576004) (not start!52856) (not b!576010) (not b!576007) (not b!576006) (not b!576005) (not b!576003) (not b!576001) (not b!576008))
(check-sat)
