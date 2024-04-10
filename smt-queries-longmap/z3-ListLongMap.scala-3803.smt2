; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52174 () Bool)

(assert start!52174)

(declare-fun b!569508 () Bool)

(declare-fun res!359526 () Bool)

(declare-fun e!327611 () Bool)

(assert (=> b!569508 (=> (not res!359526) (not e!327611))))

(declare-datatypes ((array!35697 0))(
  ( (array!35698 (arr!17140 (Array (_ BitVec 32) (_ BitVec 64))) (size!17504 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35697)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35697 (_ BitVec 32)) Bool)

(assert (=> b!569508 (= res!359526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569509 () Bool)

(declare-fun res!359527 () Bool)

(assert (=> b!569509 (=> (not res!359527) (not e!327611))))

(declare-datatypes ((List!11220 0))(
  ( (Nil!11217) (Cons!11216 (h!12237 (_ BitVec 64)) (t!17448 List!11220)) )
))
(declare-fun arrayNoDuplicates!0 (array!35697 (_ BitVec 32) List!11220) Bool)

(assert (=> b!569509 (= res!359527 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11217))))

(declare-fun b!569510 () Bool)

(declare-fun res!359533 () Bool)

(declare-fun e!327612 () Bool)

(assert (=> b!569510 (=> (not res!359533) (not e!327612))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569510 (= res!359533 (validKeyInArray!0 k0!1914))))

(declare-fun b!569512 () Bool)

(assert (=> b!569512 (= e!327612 e!327611)))

(declare-fun res!359532 () Bool)

(assert (=> b!569512 (=> (not res!359532) (not e!327611))))

(declare-datatypes ((SeekEntryResult!5589 0))(
  ( (MissingZero!5589 (index!24583 (_ BitVec 32))) (Found!5589 (index!24584 (_ BitVec 32))) (Intermediate!5589 (undefined!6401 Bool) (index!24585 (_ BitVec 32)) (x!53456 (_ BitVec 32))) (Undefined!5589) (MissingVacant!5589 (index!24586 (_ BitVec 32))) )
))
(declare-fun lt!259593 () SeekEntryResult!5589)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!569512 (= res!359532 (or (= lt!259593 (MissingZero!5589 i!1132)) (= lt!259593 (MissingVacant!5589 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35697 (_ BitVec 32)) SeekEntryResult!5589)

(assert (=> b!569512 (= lt!259593 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!569513 () Bool)

(declare-fun e!327610 () Bool)

(assert (=> b!569513 (= e!327610 (not true))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!259591 () SeekEntryResult!5589)

(declare-fun lt!259594 () SeekEntryResult!5589)

(get-info :version)

(assert (=> b!569513 (and (= lt!259591 (Found!5589 j!142)) (or (undefined!6401 lt!259594) (not ((_ is Intermediate!5589) lt!259594)) (= (select (arr!17140 a!3118) (index!24585 lt!259594)) (select (arr!17140 a!3118) j!142)) (not (= (select (arr!17140 a!3118) (index!24585 lt!259594)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259591 (MissingZero!5589 (index!24585 lt!259594)))))))

(assert (=> b!569513 (= lt!259591 (seekEntryOrOpen!0 (select (arr!17140 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!569513 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17880 0))(
  ( (Unit!17881) )
))
(declare-fun lt!259590 () Unit!17880)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35697 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17880)

(assert (=> b!569513 (= lt!259590 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569514 () Bool)

(declare-fun res!359528 () Bool)

(assert (=> b!569514 (=> (not res!359528) (not e!327612))))

(assert (=> b!569514 (= res!359528 (validKeyInArray!0 (select (arr!17140 a!3118) j!142)))))

(declare-fun b!569515 () Bool)

(declare-fun res!359529 () Bool)

(assert (=> b!569515 (=> (not res!359529) (not e!327612))))

(declare-fun arrayContainsKey!0 (array!35697 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569515 (= res!359529 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569516 () Bool)

(assert (=> b!569516 (= e!327611 e!327610)))

(declare-fun res!359531 () Bool)

(assert (=> b!569516 (=> (not res!359531) (not e!327610))))

(declare-fun lt!259592 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35697 (_ BitVec 32)) SeekEntryResult!5589)

(assert (=> b!569516 (= res!359531 (= lt!259594 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259592 (select (store (arr!17140 a!3118) i!1132 k0!1914) j!142) (array!35698 (store (arr!17140 a!3118) i!1132 k0!1914) (size!17504 a!3118)) mask!3119)))))

(declare-fun lt!259589 () (_ BitVec 32))

(assert (=> b!569516 (= lt!259594 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259589 (select (arr!17140 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569516 (= lt!259592 (toIndex!0 (select (store (arr!17140 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!569516 (= lt!259589 (toIndex!0 (select (arr!17140 a!3118) j!142) mask!3119))))

(declare-fun b!569511 () Bool)

(declare-fun res!359530 () Bool)

(assert (=> b!569511 (=> (not res!359530) (not e!327612))))

(assert (=> b!569511 (= res!359530 (and (= (size!17504 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17504 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17504 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!359534 () Bool)

(assert (=> start!52174 (=> (not res!359534) (not e!327612))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52174 (= res!359534 (validMask!0 mask!3119))))

(assert (=> start!52174 e!327612))

(assert (=> start!52174 true))

(declare-fun array_inv!12936 (array!35697) Bool)

(assert (=> start!52174 (array_inv!12936 a!3118)))

(assert (= (and start!52174 res!359534) b!569511))

(assert (= (and b!569511 res!359530) b!569514))

(assert (= (and b!569514 res!359528) b!569510))

(assert (= (and b!569510 res!359533) b!569515))

(assert (= (and b!569515 res!359529) b!569512))

(assert (= (and b!569512 res!359532) b!569508))

(assert (= (and b!569508 res!359526) b!569509))

(assert (= (and b!569509 res!359527) b!569516))

(assert (= (and b!569516 res!359531) b!569513))

(declare-fun m!548267 () Bool)

(assert (=> b!569508 m!548267))

(declare-fun m!548269 () Bool)

(assert (=> b!569513 m!548269))

(declare-fun m!548271 () Bool)

(assert (=> b!569513 m!548271))

(declare-fun m!548273 () Bool)

(assert (=> b!569513 m!548273))

(declare-fun m!548275 () Bool)

(assert (=> b!569513 m!548275))

(assert (=> b!569513 m!548269))

(declare-fun m!548277 () Bool)

(assert (=> b!569513 m!548277))

(declare-fun m!548279 () Bool)

(assert (=> b!569512 m!548279))

(declare-fun m!548281 () Bool)

(assert (=> b!569515 m!548281))

(assert (=> b!569516 m!548269))

(declare-fun m!548283 () Bool)

(assert (=> b!569516 m!548283))

(declare-fun m!548285 () Bool)

(assert (=> b!569516 m!548285))

(declare-fun m!548287 () Bool)

(assert (=> b!569516 m!548287))

(assert (=> b!569516 m!548269))

(assert (=> b!569516 m!548285))

(declare-fun m!548289 () Bool)

(assert (=> b!569516 m!548289))

(assert (=> b!569516 m!548269))

(declare-fun m!548291 () Bool)

(assert (=> b!569516 m!548291))

(assert (=> b!569516 m!548285))

(declare-fun m!548293 () Bool)

(assert (=> b!569516 m!548293))

(declare-fun m!548295 () Bool)

(assert (=> b!569510 m!548295))

(declare-fun m!548297 () Bool)

(assert (=> start!52174 m!548297))

(declare-fun m!548299 () Bool)

(assert (=> start!52174 m!548299))

(assert (=> b!569514 m!548269))

(assert (=> b!569514 m!548269))

(declare-fun m!548301 () Bool)

(assert (=> b!569514 m!548301))

(declare-fun m!548303 () Bool)

(assert (=> b!569509 m!548303))

(check-sat (not b!569513) (not start!52174) (not b!569512) (not b!569509) (not b!569516) (not b!569514) (not b!569508) (not b!569510) (not b!569515))
(check-sat)
