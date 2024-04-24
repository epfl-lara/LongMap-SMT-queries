; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52908 () Bool)

(assert start!52908)

(declare-fun b!576382 () Bool)

(declare-fun e!331668 () Bool)

(assert (=> b!576382 (= e!331668 (not true))))

(declare-fun e!331667 () Bool)

(assert (=> b!576382 e!331667))

(declare-fun res!364513 () Bool)

(assert (=> b!576382 (=> (not res!364513) (not e!331667))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35943 0))(
  ( (array!35944 (arr!17251 (Array (_ BitVec 32) (_ BitVec 64))) (size!17615 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35943)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35943 (_ BitVec 32)) Bool)

(assert (=> b!576382 (= res!364513 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!18085 0))(
  ( (Unit!18086) )
))
(declare-fun lt!263722 () Unit!18085)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35943 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18085)

(assert (=> b!576382 (= lt!263722 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!576383 () Bool)

(declare-fun res!364511 () Bool)

(declare-fun e!331666 () Bool)

(assert (=> b!576383 (=> (not res!364511) (not e!331666))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!576383 (= res!364511 (and (= (size!17615 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17615 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17615 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!576384 () Bool)

(declare-fun res!364510 () Bool)

(assert (=> b!576384 (=> (not res!364510) (not e!331666))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!576384 (= res!364510 (validKeyInArray!0 (select (arr!17251 a!3118) j!142)))))

(declare-fun b!576385 () Bool)

(assert (=> b!576385 (= e!331666 e!331668)))

(declare-fun res!364516 () Bool)

(assert (=> b!576385 (=> (not res!364516) (not e!331668))))

(declare-datatypes ((SeekEntryResult!5656 0))(
  ( (MissingZero!5656 (index!24851 (_ BitVec 32))) (Found!5656 (index!24852 (_ BitVec 32))) (Intermediate!5656 (undefined!6468 Bool) (index!24853 (_ BitVec 32)) (x!53898 (_ BitVec 32))) (Undefined!5656) (MissingVacant!5656 (index!24854 (_ BitVec 32))) )
))
(declare-fun lt!263721 () SeekEntryResult!5656)

(assert (=> b!576385 (= res!364516 (or (= lt!263721 (MissingZero!5656 i!1132)) (= lt!263721 (MissingVacant!5656 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35943 (_ BitVec 32)) SeekEntryResult!5656)

(assert (=> b!576385 (= lt!263721 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!576386 () Bool)

(assert (=> b!576386 (= e!331667 (= (seekEntryOrOpen!0 (select (arr!17251 a!3118) j!142) a!3118 mask!3119) (Found!5656 j!142)))))

(declare-fun b!576387 () Bool)

(declare-fun res!364512 () Bool)

(assert (=> b!576387 (=> (not res!364512) (not e!331668))))

(declare-datatypes ((List!11238 0))(
  ( (Nil!11235) (Cons!11234 (h!12279 (_ BitVec 64)) (t!17458 List!11238)) )
))
(declare-fun arrayNoDuplicates!0 (array!35943 (_ BitVec 32) List!11238) Bool)

(assert (=> b!576387 (= res!364512 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11235))))

(declare-fun b!576388 () Bool)

(declare-fun res!364514 () Bool)

(assert (=> b!576388 (=> (not res!364514) (not e!331666))))

(assert (=> b!576388 (= res!364514 (validKeyInArray!0 k0!1914))))

(declare-fun res!364518 () Bool)

(assert (=> start!52908 (=> (not res!364518) (not e!331666))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52908 (= res!364518 (validMask!0 mask!3119))))

(assert (=> start!52908 e!331666))

(assert (=> start!52908 true))

(declare-fun array_inv!13110 (array!35943) Bool)

(assert (=> start!52908 (array_inv!13110 a!3118)))

(declare-fun b!576389 () Bool)

(declare-fun res!364515 () Bool)

(assert (=> b!576389 (=> (not res!364515) (not e!331668))))

(assert (=> b!576389 (= res!364515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!576390 () Bool)

(declare-fun res!364517 () Bool)

(assert (=> b!576390 (=> (not res!364517) (not e!331666))))

(declare-fun arrayContainsKey!0 (array!35943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!576390 (= res!364517 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!576391 () Bool)

(declare-fun res!364519 () Bool)

(assert (=> b!576391 (=> (not res!364519) (not e!331668))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35943 (_ BitVec 32)) SeekEntryResult!5656)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!576391 (= res!364519 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17251 a!3118) j!142) mask!3119) (select (arr!17251 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17251 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17251 a!3118) i!1132 k0!1914) j!142) (array!35944 (store (arr!17251 a!3118) i!1132 k0!1914) (size!17615 a!3118)) mask!3119)))))

(assert (= (and start!52908 res!364518) b!576383))

(assert (= (and b!576383 res!364511) b!576384))

(assert (= (and b!576384 res!364510) b!576388))

(assert (= (and b!576388 res!364514) b!576390))

(assert (= (and b!576390 res!364517) b!576385))

(assert (= (and b!576385 res!364516) b!576389))

(assert (= (and b!576389 res!364515) b!576387))

(assert (= (and b!576387 res!364512) b!576391))

(assert (= (and b!576391 res!364519) b!576382))

(assert (= (and b!576382 res!364513) b!576386))

(declare-fun m!555431 () Bool)

(assert (=> b!576390 m!555431))

(declare-fun m!555433 () Bool)

(assert (=> b!576386 m!555433))

(assert (=> b!576386 m!555433))

(declare-fun m!555435 () Bool)

(assert (=> b!576386 m!555435))

(assert (=> b!576391 m!555433))

(declare-fun m!555437 () Bool)

(assert (=> b!576391 m!555437))

(assert (=> b!576391 m!555433))

(declare-fun m!555439 () Bool)

(assert (=> b!576391 m!555439))

(declare-fun m!555441 () Bool)

(assert (=> b!576391 m!555441))

(assert (=> b!576391 m!555439))

(declare-fun m!555443 () Bool)

(assert (=> b!576391 m!555443))

(assert (=> b!576391 m!555437))

(assert (=> b!576391 m!555433))

(declare-fun m!555445 () Bool)

(assert (=> b!576391 m!555445))

(declare-fun m!555447 () Bool)

(assert (=> b!576391 m!555447))

(assert (=> b!576391 m!555439))

(assert (=> b!576391 m!555441))

(declare-fun m!555449 () Bool)

(assert (=> b!576388 m!555449))

(declare-fun m!555451 () Bool)

(assert (=> start!52908 m!555451))

(declare-fun m!555453 () Bool)

(assert (=> start!52908 m!555453))

(declare-fun m!555455 () Bool)

(assert (=> b!576382 m!555455))

(declare-fun m!555457 () Bool)

(assert (=> b!576382 m!555457))

(declare-fun m!555459 () Bool)

(assert (=> b!576389 m!555459))

(declare-fun m!555461 () Bool)

(assert (=> b!576387 m!555461))

(assert (=> b!576384 m!555433))

(assert (=> b!576384 m!555433))

(declare-fun m!555463 () Bool)

(assert (=> b!576384 m!555463))

(declare-fun m!555465 () Bool)

(assert (=> b!576385 m!555465))

(check-sat (not b!576382) (not b!576391) (not start!52908) (not b!576388) (not b!576390) (not b!576386) (not b!576385) (not b!576387) (not b!576384) (not b!576389))
(check-sat)
