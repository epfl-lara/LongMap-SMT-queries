; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52166 () Bool)

(assert start!52166)

(declare-fun b!569291 () Bool)

(declare-fun e!327461 () Bool)

(assert (=> b!569291 (= e!327461 (not true))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5587 0))(
  ( (MissingZero!5587 (index!24575 (_ BitVec 32))) (Found!5587 (index!24576 (_ BitVec 32))) (Intermediate!5587 (undefined!6399 Bool) (index!24577 (_ BitVec 32)) (x!53457 (_ BitVec 32))) (Undefined!5587) (MissingVacant!5587 (index!24578 (_ BitVec 32))) )
))
(declare-fun lt!259393 () SeekEntryResult!5587)

(declare-fun lt!259391 () SeekEntryResult!5587)

(declare-datatypes ((array!35698 0))(
  ( (array!35699 (arr!17141 (Array (_ BitVec 32) (_ BitVec 64))) (size!17506 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35698)

(get-info :version)

(assert (=> b!569291 (and (= lt!259393 (Found!5587 j!142)) (or (undefined!6399 lt!259391) (not ((_ is Intermediate!5587) lt!259391)) (= (select (arr!17141 a!3118) (index!24577 lt!259391)) (select (arr!17141 a!3118) j!142)) (not (= (select (arr!17141 a!3118) (index!24577 lt!259391)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259393 (MissingZero!5587 (index!24577 lt!259391)))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35698 (_ BitVec 32)) SeekEntryResult!5587)

(assert (=> b!569291 (= lt!259393 (seekEntryOrOpen!0 (select (arr!17141 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35698 (_ BitVec 32)) Bool)

(assert (=> b!569291 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17862 0))(
  ( (Unit!17863) )
))
(declare-fun lt!259395 () Unit!17862)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35698 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17862)

(assert (=> b!569291 (= lt!259395 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569292 () Bool)

(declare-fun res!359452 () Bool)

(declare-fun e!327462 () Bool)

(assert (=> b!569292 (=> (not res!359452) (not e!327462))))

(declare-datatypes ((List!11260 0))(
  ( (Nil!11257) (Cons!11256 (h!12277 (_ BitVec 64)) (t!17479 List!11260)) )
))
(declare-fun arrayNoDuplicates!0 (array!35698 (_ BitVec 32) List!11260) Bool)

(assert (=> b!569292 (= res!359452 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11257))))

(declare-fun b!569293 () Bool)

(declare-fun res!359457 () Bool)

(declare-fun e!327459 () Bool)

(assert (=> b!569293 (=> (not res!359457) (not e!327459))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569293 (= res!359457 (validKeyInArray!0 (select (arr!17141 a!3118) j!142)))))

(declare-fun res!359455 () Bool)

(assert (=> start!52166 (=> (not res!359455) (not e!327459))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52166 (= res!359455 (validMask!0 mask!3119))))

(assert (=> start!52166 e!327459))

(assert (=> start!52166 true))

(declare-fun array_inv!13024 (array!35698) Bool)

(assert (=> start!52166 (array_inv!13024 a!3118)))

(declare-fun b!569294 () Bool)

(declare-fun res!359459 () Bool)

(assert (=> b!569294 (=> (not res!359459) (not e!327462))))

(assert (=> b!569294 (= res!359459 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569295 () Bool)

(declare-fun res!359453 () Bool)

(assert (=> b!569295 (=> (not res!359453) (not e!327459))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!569295 (= res!359453 (validKeyInArray!0 k0!1914))))

(declare-fun b!569296 () Bool)

(assert (=> b!569296 (= e!327462 e!327461)))

(declare-fun res!359454 () Bool)

(assert (=> b!569296 (=> (not res!359454) (not e!327461))))

(declare-fun lt!259396 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35698 (_ BitVec 32)) SeekEntryResult!5587)

(assert (=> b!569296 (= res!359454 (= lt!259391 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259396 (select (store (arr!17141 a!3118) i!1132 k0!1914) j!142) (array!35699 (store (arr!17141 a!3118) i!1132 k0!1914) (size!17506 a!3118)) mask!3119)))))

(declare-fun lt!259394 () (_ BitVec 32))

(assert (=> b!569296 (= lt!259391 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259394 (select (arr!17141 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569296 (= lt!259396 (toIndex!0 (select (store (arr!17141 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!569296 (= lt!259394 (toIndex!0 (select (arr!17141 a!3118) j!142) mask!3119))))

(declare-fun b!569297 () Bool)

(declare-fun res!359456 () Bool)

(assert (=> b!569297 (=> (not res!359456) (not e!327459))))

(assert (=> b!569297 (= res!359456 (and (= (size!17506 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17506 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17506 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569298 () Bool)

(assert (=> b!569298 (= e!327459 e!327462)))

(declare-fun res!359458 () Bool)

(assert (=> b!569298 (=> (not res!359458) (not e!327462))))

(declare-fun lt!259392 () SeekEntryResult!5587)

(assert (=> b!569298 (= res!359458 (or (= lt!259392 (MissingZero!5587 i!1132)) (= lt!259392 (MissingVacant!5587 i!1132))))))

(assert (=> b!569298 (= lt!259392 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!569299 () Bool)

(declare-fun res!359451 () Bool)

(assert (=> b!569299 (=> (not res!359451) (not e!327459))))

(declare-fun arrayContainsKey!0 (array!35698 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569299 (= res!359451 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!52166 res!359455) b!569297))

(assert (= (and b!569297 res!359456) b!569293))

(assert (= (and b!569293 res!359457) b!569295))

(assert (= (and b!569295 res!359453) b!569299))

(assert (= (and b!569299 res!359451) b!569298))

(assert (= (and b!569298 res!359458) b!569294))

(assert (= (and b!569294 res!359459) b!569292))

(assert (= (and b!569292 res!359452) b!569296))

(assert (= (and b!569296 res!359454) b!569291))

(declare-fun m!547571 () Bool)

(assert (=> b!569292 m!547571))

(declare-fun m!547573 () Bool)

(assert (=> b!569298 m!547573))

(declare-fun m!547575 () Bool)

(assert (=> b!569296 m!547575))

(declare-fun m!547577 () Bool)

(assert (=> b!569296 m!547577))

(assert (=> b!569296 m!547575))

(declare-fun m!547579 () Bool)

(assert (=> b!569296 m!547579))

(assert (=> b!569296 m!547579))

(declare-fun m!547581 () Bool)

(assert (=> b!569296 m!547581))

(declare-fun m!547583 () Bool)

(assert (=> b!569296 m!547583))

(assert (=> b!569296 m!547575))

(declare-fun m!547585 () Bool)

(assert (=> b!569296 m!547585))

(assert (=> b!569296 m!547579))

(declare-fun m!547587 () Bool)

(assert (=> b!569296 m!547587))

(declare-fun m!547589 () Bool)

(assert (=> b!569295 m!547589))

(assert (=> b!569293 m!547575))

(assert (=> b!569293 m!547575))

(declare-fun m!547591 () Bool)

(assert (=> b!569293 m!547591))

(declare-fun m!547593 () Bool)

(assert (=> b!569299 m!547593))

(declare-fun m!547595 () Bool)

(assert (=> b!569294 m!547595))

(declare-fun m!547597 () Bool)

(assert (=> start!52166 m!547597))

(declare-fun m!547599 () Bool)

(assert (=> start!52166 m!547599))

(assert (=> b!569291 m!547575))

(declare-fun m!547601 () Bool)

(assert (=> b!569291 m!547601))

(declare-fun m!547603 () Bool)

(assert (=> b!569291 m!547603))

(declare-fun m!547605 () Bool)

(assert (=> b!569291 m!547605))

(assert (=> b!569291 m!547575))

(declare-fun m!547607 () Bool)

(assert (=> b!569291 m!547607))

(check-sat (not b!569292) (not start!52166) (not b!569293) (not b!569298) (not b!569295) (not b!569299) (not b!569291) (not b!569294) (not b!569296))
(check-sat)
