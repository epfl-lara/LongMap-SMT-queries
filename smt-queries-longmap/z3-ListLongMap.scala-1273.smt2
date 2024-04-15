; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26198 () Bool)

(assert start!26198)

(declare-fun b!270602 () Bool)

(declare-fun res!134644 () Bool)

(declare-fun e!174296 () Bool)

(assert (=> b!270602 (=> (not res!134644) (not e!174296))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270602 (= res!134644 (validKeyInArray!0 k0!2581))))

(declare-fun b!270603 () Bool)

(declare-fun res!134654 () Bool)

(declare-fun e!174297 () Bool)

(assert (=> b!270603 (=> (not res!134654) (not e!174297))))

(declare-datatypes ((List!4072 0))(
  ( (Nil!4069) (Cons!4068 (h!4735 (_ BitVec 64)) (t!9145 List!4072)) )
))
(declare-fun contains!1910 (List!4072 (_ BitVec 64)) Bool)

(assert (=> b!270603 (= res!134654 (not (contains!1910 Nil!4069 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270604 () Bool)

(assert (=> b!270604 (= e!174296 e!174297)))

(declare-fun res!134645 () Bool)

(assert (=> b!270604 (=> (not res!134645) (not e!174297))))

(declare-datatypes ((SeekEntryResult!1448 0))(
  ( (MissingZero!1448 (index!7962 (_ BitVec 32))) (Found!1448 (index!7963 (_ BitVec 32))) (Intermediate!1448 (undefined!2260 Bool) (index!7964 (_ BitVec 32)) (x!26316 (_ BitVec 32))) (Undefined!1448) (MissingVacant!1448 (index!7965 (_ BitVec 32))) )
))
(declare-fun lt!135515 () SeekEntryResult!1448)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!270604 (= res!134645 (or (= lt!135515 (MissingZero!1448 i!1267)) (= lt!135515 (MissingVacant!1448 i!1267))))))

(declare-datatypes ((array!13284 0))(
  ( (array!13285 (arr!6291 (Array (_ BitVec 32) (_ BitVec 64))) (size!6644 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13284)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13284 (_ BitVec 32)) SeekEntryResult!1448)

(assert (=> b!270604 (= lt!135515 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!270605 () Bool)

(declare-fun res!134656 () Bool)

(assert (=> b!270605 (=> (not res!134656) (not e!174297))))

(declare-fun noDuplicate!124 (List!4072) Bool)

(assert (=> b!270605 (= res!134656 (noDuplicate!124 Nil!4069))))

(declare-fun b!270606 () Bool)

(assert (=> b!270606 (= e!174297 false)))

(declare-fun lt!135516 () Bool)

(assert (=> b!270606 (= lt!135516 (contains!1910 Nil!4069 k0!2581))))

(declare-fun b!270607 () Bool)

(declare-fun res!134647 () Bool)

(assert (=> b!270607 (=> (not res!134647) (not e!174297))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13284 (_ BitVec 32)) Bool)

(assert (=> b!270607 (= res!134647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270608 () Bool)

(declare-fun res!134653 () Bool)

(assert (=> b!270608 (=> (not res!134653) (not e!174296))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!270608 (= res!134653 (and (= (size!6644 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6644 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6644 a!3325))))))

(declare-fun b!270609 () Bool)

(declare-fun res!134649 () Bool)

(assert (=> b!270609 (=> (not res!134649) (not e!174297))))

(assert (=> b!270609 (= res!134649 (validKeyInArray!0 (select (arr!6291 a!3325) startIndex!26)))))

(declare-fun b!270610 () Bool)

(declare-fun res!134650 () Bool)

(assert (=> b!270610 (=> (not res!134650) (not e!174297))))

(assert (=> b!270610 (= res!134650 (and (bvslt (size!6644 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6644 a!3325))))))

(declare-fun res!134655 () Bool)

(assert (=> start!26198 (=> (not res!134655) (not e!174296))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26198 (= res!134655 (validMask!0 mask!3868))))

(assert (=> start!26198 e!174296))

(declare-fun array_inv!4263 (array!13284) Bool)

(assert (=> start!26198 (array_inv!4263 a!3325)))

(assert (=> start!26198 true))

(declare-fun b!270611 () Bool)

(declare-fun res!134652 () Bool)

(assert (=> b!270611 (=> (not res!134652) (not e!174297))))

(assert (=> b!270611 (= res!134652 (not (contains!1910 Nil!4069 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270612 () Bool)

(declare-fun res!134651 () Bool)

(assert (=> b!270612 (=> (not res!134651) (not e!174296))))

(declare-fun arrayContainsKey!0 (array!13284 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270612 (= res!134651 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270613 () Bool)

(declare-fun res!134648 () Bool)

(assert (=> b!270613 (=> (not res!134648) (not e!174296))))

(declare-fun arrayNoDuplicates!0 (array!13284 (_ BitVec 32) List!4072) Bool)

(assert (=> b!270613 (= res!134648 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4069))))

(declare-fun b!270614 () Bool)

(declare-fun res!134646 () Bool)

(assert (=> b!270614 (=> (not res!134646) (not e!174297))))

(assert (=> b!270614 (= res!134646 (not (= startIndex!26 i!1267)))))

(assert (= (and start!26198 res!134655) b!270608))

(assert (= (and b!270608 res!134653) b!270602))

(assert (= (and b!270602 res!134644) b!270613))

(assert (= (and b!270613 res!134648) b!270612))

(assert (= (and b!270612 res!134651) b!270604))

(assert (= (and b!270604 res!134645) b!270607))

(assert (= (and b!270607 res!134647) b!270614))

(assert (= (and b!270614 res!134646) b!270609))

(assert (= (and b!270609 res!134649) b!270610))

(assert (= (and b!270610 res!134650) b!270605))

(assert (= (and b!270605 res!134656) b!270603))

(assert (= (and b!270603 res!134654) b!270611))

(assert (= (and b!270611 res!134652) b!270606))

(declare-fun m!285671 () Bool)

(assert (=> b!270605 m!285671))

(declare-fun m!285673 () Bool)

(assert (=> b!270612 m!285673))

(declare-fun m!285675 () Bool)

(assert (=> start!26198 m!285675))

(declare-fun m!285677 () Bool)

(assert (=> start!26198 m!285677))

(declare-fun m!285679 () Bool)

(assert (=> b!270611 m!285679))

(declare-fun m!285681 () Bool)

(assert (=> b!270604 m!285681))

(declare-fun m!285683 () Bool)

(assert (=> b!270606 m!285683))

(declare-fun m!285685 () Bool)

(assert (=> b!270613 m!285685))

(declare-fun m!285687 () Bool)

(assert (=> b!270603 m!285687))

(declare-fun m!285689 () Bool)

(assert (=> b!270607 m!285689))

(declare-fun m!285691 () Bool)

(assert (=> b!270609 m!285691))

(assert (=> b!270609 m!285691))

(declare-fun m!285693 () Bool)

(assert (=> b!270609 m!285693))

(declare-fun m!285695 () Bool)

(assert (=> b!270602 m!285695))

(check-sat (not b!270606) (not b!270611) (not b!270602) (not b!270609) (not b!270612) (not b!270605) (not start!26198) (not b!270603) (not b!270607) (not b!270604) (not b!270613))
(check-sat)
