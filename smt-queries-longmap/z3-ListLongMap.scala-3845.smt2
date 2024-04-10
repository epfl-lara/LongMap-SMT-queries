; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52882 () Bool)

(assert start!52882)

(declare-fun b!576482 () Bool)

(declare-fun e!331657 () Bool)

(declare-fun e!331658 () Bool)

(assert (=> b!576482 (= e!331657 e!331658)))

(declare-fun res!364719 () Bool)

(assert (=> b!576482 (=> (not res!364719) (not e!331658))))

(declare-datatypes ((SeekEntryResult!5715 0))(
  ( (MissingZero!5715 (index!25087 (_ BitVec 32))) (Found!5715 (index!25088 (_ BitVec 32))) (Intermediate!5715 (undefined!6527 Bool) (index!25089 (_ BitVec 32)) (x!53978 (_ BitVec 32))) (Undefined!5715) (MissingVacant!5715 (index!25090 (_ BitVec 32))) )
))
(declare-fun lt!263671 () SeekEntryResult!5715)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!576482 (= res!364719 (or (= lt!263671 (MissingZero!5715 i!1132)) (= lt!263671 (MissingVacant!5715 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!35970 0))(
  ( (array!35971 (arr!17266 (Array (_ BitVec 32) (_ BitVec 64))) (size!17630 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35970)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35970 (_ BitVec 32)) SeekEntryResult!5715)

(assert (=> b!576482 (= lt!263671 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!576483 () Bool)

(declare-fun res!364717 () Bool)

(assert (=> b!576483 (=> (not res!364717) (not e!331658))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35970 (_ BitVec 32)) Bool)

(assert (=> b!576483 (= res!364717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!576484 () Bool)

(declare-fun res!364721 () Bool)

(assert (=> b!576484 (=> (not res!364721) (not e!331657))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!576484 (= res!364721 (validKeyInArray!0 (select (arr!17266 a!3118) j!142)))))

(declare-fun b!576485 () Bool)

(declare-fun res!364715 () Bool)

(assert (=> b!576485 (=> (not res!364715) (not e!331658))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35970 (_ BitVec 32)) SeekEntryResult!5715)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!576485 (= res!364715 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17266 a!3118) j!142) mask!3119) (select (arr!17266 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17266 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17266 a!3118) i!1132 k0!1914) j!142) (array!35971 (store (arr!17266 a!3118) i!1132 k0!1914) (size!17630 a!3118)) mask!3119)))))

(declare-fun e!331659 () Bool)

(declare-fun b!576486 () Bool)

(assert (=> b!576486 (= e!331659 (= (seekEntryOrOpen!0 (select (arr!17266 a!3118) j!142) a!3118 mask!3119) (Found!5715 j!142)))))

(declare-fun b!576487 () Bool)

(assert (=> b!576487 (= e!331658 (not true))))

(assert (=> b!576487 e!331659))

(declare-fun res!364720 () Bool)

(assert (=> b!576487 (=> (not res!364720) (not e!331659))))

(assert (=> b!576487 (= res!364720 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!18132 0))(
  ( (Unit!18133) )
))
(declare-fun lt!263670 () Unit!18132)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35970 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18132)

(assert (=> b!576487 (= lt!263670 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!364724 () Bool)

(assert (=> start!52882 (=> (not res!364724) (not e!331657))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52882 (= res!364724 (validMask!0 mask!3119))))

(assert (=> start!52882 e!331657))

(assert (=> start!52882 true))

(declare-fun array_inv!13062 (array!35970) Bool)

(assert (=> start!52882 (array_inv!13062 a!3118)))

(declare-fun b!576488 () Bool)

(declare-fun res!364723 () Bool)

(assert (=> b!576488 (=> (not res!364723) (not e!331657))))

(declare-fun arrayContainsKey!0 (array!35970 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!576488 (= res!364723 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!576489 () Bool)

(declare-fun res!364718 () Bool)

(assert (=> b!576489 (=> (not res!364718) (not e!331657))))

(assert (=> b!576489 (= res!364718 (validKeyInArray!0 k0!1914))))

(declare-fun b!576490 () Bool)

(declare-fun res!364716 () Bool)

(assert (=> b!576490 (=> (not res!364716) (not e!331657))))

(assert (=> b!576490 (= res!364716 (and (= (size!17630 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17630 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17630 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!576491 () Bool)

(declare-fun res!364722 () Bool)

(assert (=> b!576491 (=> (not res!364722) (not e!331658))))

(declare-datatypes ((List!11346 0))(
  ( (Nil!11343) (Cons!11342 (h!12384 (_ BitVec 64)) (t!17574 List!11346)) )
))
(declare-fun arrayNoDuplicates!0 (array!35970 (_ BitVec 32) List!11346) Bool)

(assert (=> b!576491 (= res!364722 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11343))))

(assert (= (and start!52882 res!364724) b!576490))

(assert (= (and b!576490 res!364716) b!576484))

(assert (= (and b!576484 res!364721) b!576489))

(assert (= (and b!576489 res!364718) b!576488))

(assert (= (and b!576488 res!364723) b!576482))

(assert (= (and b!576482 res!364719) b!576483))

(assert (= (and b!576483 res!364717) b!576491))

(assert (= (and b!576491 res!364722) b!576485))

(assert (= (and b!576485 res!364715) b!576487))

(assert (= (and b!576487 res!364720) b!576486))

(declare-fun m!555453 () Bool)

(assert (=> b!576491 m!555453))

(declare-fun m!555455 () Bool)

(assert (=> b!576483 m!555455))

(declare-fun m!555457 () Bool)

(assert (=> start!52882 m!555457))

(declare-fun m!555459 () Bool)

(assert (=> start!52882 m!555459))

(declare-fun m!555461 () Bool)

(assert (=> b!576482 m!555461))

(declare-fun m!555463 () Bool)

(assert (=> b!576487 m!555463))

(declare-fun m!555465 () Bool)

(assert (=> b!576487 m!555465))

(declare-fun m!555467 () Bool)

(assert (=> b!576484 m!555467))

(assert (=> b!576484 m!555467))

(declare-fun m!555469 () Bool)

(assert (=> b!576484 m!555469))

(declare-fun m!555471 () Bool)

(assert (=> b!576489 m!555471))

(declare-fun m!555473 () Bool)

(assert (=> b!576488 m!555473))

(assert (=> b!576486 m!555467))

(assert (=> b!576486 m!555467))

(declare-fun m!555475 () Bool)

(assert (=> b!576486 m!555475))

(assert (=> b!576485 m!555467))

(declare-fun m!555477 () Bool)

(assert (=> b!576485 m!555477))

(assert (=> b!576485 m!555467))

(declare-fun m!555479 () Bool)

(assert (=> b!576485 m!555479))

(declare-fun m!555481 () Bool)

(assert (=> b!576485 m!555481))

(assert (=> b!576485 m!555479))

(declare-fun m!555483 () Bool)

(assert (=> b!576485 m!555483))

(assert (=> b!576485 m!555477))

(assert (=> b!576485 m!555467))

(declare-fun m!555485 () Bool)

(assert (=> b!576485 m!555485))

(declare-fun m!555487 () Bool)

(assert (=> b!576485 m!555487))

(assert (=> b!576485 m!555479))

(assert (=> b!576485 m!555481))

(check-sat (not b!576482) (not b!576484) (not b!576483) (not b!576489) (not b!576487) (not b!576488) (not b!576486) (not start!52882) (not b!576485) (not b!576491))
(check-sat)
