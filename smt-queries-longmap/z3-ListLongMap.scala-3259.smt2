; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45428 () Bool)

(assert start!45428)

(declare-fun b!499593 () Bool)

(declare-fun res!301545 () Bool)

(declare-fun e!292752 () Bool)

(assert (=> b!499593 (=> (not res!301545) (not e!292752))))

(declare-datatypes ((array!32253 0))(
  ( (array!32254 (arr!15508 (Array (_ BitVec 32) (_ BitVec 64))) (size!15872 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32253)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32253 (_ BitVec 32)) Bool)

(assert (=> b!499593 (= res!301545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!499594 () Bool)

(declare-fun res!301543 () Bool)

(declare-fun e!292753 () Bool)

(assert (=> b!499594 (=> res!301543 e!292753)))

(declare-datatypes ((SeekEntryResult!3975 0))(
  ( (MissingZero!3975 (index!18082 (_ BitVec 32))) (Found!3975 (index!18083 (_ BitVec 32))) (Intermediate!3975 (undefined!4787 Bool) (index!18084 (_ BitVec 32)) (x!47124 (_ BitVec 32))) (Undefined!3975) (MissingVacant!3975 (index!18085 (_ BitVec 32))) )
))
(declare-fun lt!226557 () SeekEntryResult!3975)

(get-info :version)

(assert (=> b!499594 (= res!301543 (or (undefined!4787 lt!226557) (not ((_ is Intermediate!3975) lt!226557))))))

(declare-fun b!499595 () Bool)

(assert (=> b!499595 (= e!292752 (not e!292753))))

(declare-fun res!301547 () Bool)

(assert (=> b!499595 (=> res!301547 e!292753)))

(declare-fun lt!226558 () (_ BitVec 32))

(declare-fun lt!226554 () array!32253)

(declare-fun lt!226549 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32253 (_ BitVec 32)) SeekEntryResult!3975)

(assert (=> b!499595 (= res!301547 (= lt!226557 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226558 lt!226549 lt!226554 mask!3524)))))

(declare-fun lt!226551 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!499595 (= lt!226557 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226551 (select (arr!15508 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!499595 (= lt!226558 (toIndex!0 lt!226549 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!499595 (= lt!226549 (select (store (arr!15508 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!499595 (= lt!226551 (toIndex!0 (select (arr!15508 a!3235) j!176) mask!3524))))

(assert (=> b!499595 (= lt!226554 (array!32254 (store (arr!15508 a!3235) i!1204 k0!2280) (size!15872 a!3235)))))

(declare-fun e!292755 () Bool)

(assert (=> b!499595 e!292755))

(declare-fun res!301541 () Bool)

(assert (=> b!499595 (=> (not res!301541) (not e!292755))))

(assert (=> b!499595 (= res!301541 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14976 0))(
  ( (Unit!14977) )
))
(declare-fun lt!226552 () Unit!14976)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32253 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14976)

(assert (=> b!499595 (= lt!226552 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!499596 () Bool)

(declare-fun res!301539 () Bool)

(declare-fun e!292756 () Bool)

(assert (=> b!499596 (=> (not res!301539) (not e!292756))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!499596 (= res!301539 (validKeyInArray!0 k0!2280))))

(declare-fun b!499597 () Bool)

(declare-fun e!292758 () Bool)

(assert (=> b!499597 (= e!292753 e!292758)))

(declare-fun res!301546 () Bool)

(assert (=> b!499597 (=> res!301546 e!292758)))

(assert (=> b!499597 (= res!301546 (or (bvsgt #b00000000000000000000000000000000 (x!47124 lt!226557)) (bvsgt (x!47124 lt!226557) #b01111111111111111111111111111110) (bvslt lt!226551 #b00000000000000000000000000000000) (bvsge lt!226551 (size!15872 a!3235)) (bvslt (index!18084 lt!226557) #b00000000000000000000000000000000) (bvsge (index!18084 lt!226557) (size!15872 a!3235)) (not (= lt!226557 (Intermediate!3975 false (index!18084 lt!226557) (x!47124 lt!226557))))))))

(assert (=> b!499597 (and (or (= (select (arr!15508 a!3235) (index!18084 lt!226557)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15508 a!3235) (index!18084 lt!226557)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15508 a!3235) (index!18084 lt!226557)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15508 a!3235) (index!18084 lt!226557)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226553 () Unit!14976)

(declare-fun e!292754 () Unit!14976)

(assert (=> b!499597 (= lt!226553 e!292754)))

(declare-fun c!59306 () Bool)

(assert (=> b!499597 (= c!59306 (= (select (arr!15508 a!3235) (index!18084 lt!226557)) (select (arr!15508 a!3235) j!176)))))

(assert (=> b!499597 (and (bvslt (x!47124 lt!226557) #b01111111111111111111111111111110) (or (= (select (arr!15508 a!3235) (index!18084 lt!226557)) (select (arr!15508 a!3235) j!176)) (= (select (arr!15508 a!3235) (index!18084 lt!226557)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15508 a!3235) (index!18084 lt!226557)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!301542 () Bool)

(assert (=> start!45428 (=> (not res!301542) (not e!292756))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45428 (= res!301542 (validMask!0 mask!3524))))

(assert (=> start!45428 e!292756))

(assert (=> start!45428 true))

(declare-fun array_inv!11304 (array!32253) Bool)

(assert (=> start!45428 (array_inv!11304 a!3235)))

(declare-fun b!499598 () Bool)

(declare-fun res!301535 () Bool)

(assert (=> b!499598 (=> (not res!301535) (not e!292752))))

(declare-datatypes ((List!9666 0))(
  ( (Nil!9663) (Cons!9662 (h!10536 (_ BitVec 64)) (t!15894 List!9666)) )
))
(declare-fun arrayNoDuplicates!0 (array!32253 (_ BitVec 32) List!9666) Bool)

(assert (=> b!499598 (= res!301535 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9663))))

(declare-fun b!499599 () Bool)

(declare-fun res!301544 () Bool)

(assert (=> b!499599 (=> (not res!301544) (not e!292756))))

(declare-fun arrayContainsKey!0 (array!32253 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!499599 (= res!301544 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!499600 () Bool)

(declare-fun e!292757 () Bool)

(assert (=> b!499600 (= e!292757 false)))

(declare-fun b!499601 () Bool)

(assert (=> b!499601 (= e!292758 true)))

(declare-fun lt!226556 () SeekEntryResult!3975)

(assert (=> b!499601 (= lt!226556 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226551 lt!226549 lt!226554 mask!3524))))

(declare-fun b!499602 () Bool)

(declare-fun res!301538 () Bool)

(assert (=> b!499602 (=> (not res!301538) (not e!292756))))

(assert (=> b!499602 (= res!301538 (and (= (size!15872 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15872 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15872 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!499603 () Bool)

(declare-fun Unit!14978 () Unit!14976)

(assert (=> b!499603 (= e!292754 Unit!14978)))

(declare-fun b!499604 () Bool)

(assert (=> b!499604 (= e!292756 e!292752)))

(declare-fun res!301536 () Bool)

(assert (=> b!499604 (=> (not res!301536) (not e!292752))))

(declare-fun lt!226555 () SeekEntryResult!3975)

(assert (=> b!499604 (= res!301536 (or (= lt!226555 (MissingZero!3975 i!1204)) (= lt!226555 (MissingVacant!3975 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32253 (_ BitVec 32)) SeekEntryResult!3975)

(assert (=> b!499604 (= lt!226555 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!499605 () Bool)

(declare-fun res!301540 () Bool)

(assert (=> b!499605 (=> (not res!301540) (not e!292756))))

(assert (=> b!499605 (= res!301540 (validKeyInArray!0 (select (arr!15508 a!3235) j!176)))))

(declare-fun b!499606 () Bool)

(assert (=> b!499606 (= e!292755 (= (seekEntryOrOpen!0 (select (arr!15508 a!3235) j!176) a!3235 mask!3524) (Found!3975 j!176)))))

(declare-fun b!499607 () Bool)

(declare-fun Unit!14979 () Unit!14976)

(assert (=> b!499607 (= e!292754 Unit!14979)))

(declare-fun lt!226550 () Unit!14976)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32253 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14976)

(assert (=> b!499607 (= lt!226550 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!226551 #b00000000000000000000000000000000 (index!18084 lt!226557) (x!47124 lt!226557) mask!3524))))

(declare-fun res!301537 () Bool)

(assert (=> b!499607 (= res!301537 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226551 lt!226549 lt!226554 mask!3524) (Intermediate!3975 false (index!18084 lt!226557) (x!47124 lt!226557))))))

(assert (=> b!499607 (=> (not res!301537) (not e!292757))))

(assert (=> b!499607 e!292757))

(assert (= (and start!45428 res!301542) b!499602))

(assert (= (and b!499602 res!301538) b!499605))

(assert (= (and b!499605 res!301540) b!499596))

(assert (= (and b!499596 res!301539) b!499599))

(assert (= (and b!499599 res!301544) b!499604))

(assert (= (and b!499604 res!301536) b!499593))

(assert (= (and b!499593 res!301545) b!499598))

(assert (= (and b!499598 res!301535) b!499595))

(assert (= (and b!499595 res!301541) b!499606))

(assert (= (and b!499595 (not res!301547)) b!499594))

(assert (= (and b!499594 (not res!301543)) b!499597))

(assert (= (and b!499597 c!59306) b!499607))

(assert (= (and b!499597 (not c!59306)) b!499603))

(assert (= (and b!499607 res!301537) b!499600))

(assert (= (and b!499597 (not res!301546)) b!499601))

(declare-fun m!480783 () Bool)

(assert (=> b!499607 m!480783))

(declare-fun m!480785 () Bool)

(assert (=> b!499607 m!480785))

(declare-fun m!480787 () Bool)

(assert (=> b!499593 m!480787))

(declare-fun m!480789 () Bool)

(assert (=> b!499597 m!480789))

(declare-fun m!480791 () Bool)

(assert (=> b!499597 m!480791))

(declare-fun m!480793 () Bool)

(assert (=> b!499604 m!480793))

(declare-fun m!480795 () Bool)

(assert (=> b!499595 m!480795))

(declare-fun m!480797 () Bool)

(assert (=> b!499595 m!480797))

(declare-fun m!480799 () Bool)

(assert (=> b!499595 m!480799))

(declare-fun m!480801 () Bool)

(assert (=> b!499595 m!480801))

(assert (=> b!499595 m!480791))

(declare-fun m!480803 () Bool)

(assert (=> b!499595 m!480803))

(assert (=> b!499595 m!480791))

(assert (=> b!499595 m!480791))

(declare-fun m!480805 () Bool)

(assert (=> b!499595 m!480805))

(declare-fun m!480807 () Bool)

(assert (=> b!499595 m!480807))

(declare-fun m!480809 () Bool)

(assert (=> b!499595 m!480809))

(assert (=> b!499601 m!480785))

(declare-fun m!480811 () Bool)

(assert (=> b!499596 m!480811))

(assert (=> b!499606 m!480791))

(assert (=> b!499606 m!480791))

(declare-fun m!480813 () Bool)

(assert (=> b!499606 m!480813))

(assert (=> b!499605 m!480791))

(assert (=> b!499605 m!480791))

(declare-fun m!480815 () Bool)

(assert (=> b!499605 m!480815))

(declare-fun m!480817 () Bool)

(assert (=> b!499599 m!480817))

(declare-fun m!480819 () Bool)

(assert (=> b!499598 m!480819))

(declare-fun m!480821 () Bool)

(assert (=> start!45428 m!480821))

(declare-fun m!480823 () Bool)

(assert (=> start!45428 m!480823))

(check-sat (not b!499607) (not b!499593) (not b!499598) (not b!499596) (not b!499605) (not start!45428) (not b!499601) (not b!499595) (not b!499604) (not b!499606) (not b!499599))
(check-sat)
