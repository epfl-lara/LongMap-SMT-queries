; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64836 () Bool)

(assert start!64836)

(declare-fun b!730619 () Bool)

(declare-fun res!490538 () Bool)

(declare-fun e!408958 () Bool)

(assert (=> b!730619 (=> (not res!490538) (not e!408958))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41155 0))(
  ( (array!41156 (arr!19693 (Array (_ BitVec 32) (_ BitVec 64))) (size!20113 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41155)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!730619 (= res!490538 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19693 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!730620 () Bool)

(declare-fun res!490544 () Bool)

(declare-fun e!408965 () Bool)

(assert (=> b!730620 (=> (not res!490544) (not e!408965))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41155 (_ BitVec 32)) Bool)

(assert (=> b!730620 (= res!490544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!730621 () Bool)

(declare-fun e!408966 () Bool)

(declare-fun e!408963 () Bool)

(assert (=> b!730621 (= e!408966 (not e!408963))))

(declare-fun res!490546 () Bool)

(assert (=> b!730621 (=> res!490546 e!408963)))

(declare-datatypes ((SeekEntryResult!7249 0))(
  ( (MissingZero!7249 (index!31364 (_ BitVec 32))) (Found!7249 (index!31365 (_ BitVec 32))) (Intermediate!7249 (undefined!8061 Bool) (index!31366 (_ BitVec 32)) (x!62507 (_ BitVec 32))) (Undefined!7249) (MissingVacant!7249 (index!31367 (_ BitVec 32))) )
))
(declare-fun lt!323698 () SeekEntryResult!7249)

(declare-fun x!1131 () (_ BitVec 32))

(get-info :version)

(assert (=> b!730621 (= res!490546 (or (not ((_ is Intermediate!7249) lt!323698)) (bvsge x!1131 (x!62507 lt!323698))))))

(declare-fun e!408962 () Bool)

(assert (=> b!730621 e!408962))

(declare-fun res!490549 () Bool)

(assert (=> b!730621 (=> (not res!490549) (not e!408962))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!730621 (= res!490549 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24895 0))(
  ( (Unit!24896) )
))
(declare-fun lt!323694 () Unit!24895)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41155 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24895)

(assert (=> b!730621 (= lt!323694 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!730622 () Bool)

(declare-fun res!490545 () Bool)

(declare-fun e!408960 () Bool)

(assert (=> b!730622 (=> (not res!490545) (not e!408960))))

(assert (=> b!730622 (= res!490545 (and (= (size!20113 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20113 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20113 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!730623 () Bool)

(declare-fun res!490537 () Bool)

(assert (=> b!730623 (=> (not res!490537) (not e!408960))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!730623 (= res!490537 (validKeyInArray!0 k0!2102))))

(declare-fun res!490543 () Bool)

(assert (=> start!64836 (=> (not res!490543) (not e!408960))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64836 (= res!490543 (validMask!0 mask!3328))))

(assert (=> start!64836 e!408960))

(assert (=> start!64836 true))

(declare-fun array_inv!15552 (array!41155) Bool)

(assert (=> start!64836 (array_inv!15552 a!3186)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!730624 () Bool)

(assert (=> b!730624 (= e!408963 (or (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5) (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun lt!323699 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730624 (= lt!323699 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!730625 () Bool)

(assert (=> b!730625 (= e!408965 e!408958)))

(declare-fun res!490547 () Bool)

(assert (=> b!730625 (=> (not res!490547) (not e!408958))))

(declare-fun lt!323693 () SeekEntryResult!7249)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41155 (_ BitVec 32)) SeekEntryResult!7249)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730625 (= res!490547 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19693 a!3186) j!159) mask!3328) (select (arr!19693 a!3186) j!159) a!3186 mask!3328) lt!323693))))

(assert (=> b!730625 (= lt!323693 (Intermediate!7249 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!730626 () Bool)

(declare-fun res!490535 () Bool)

(assert (=> b!730626 (=> (not res!490535) (not e!408965))))

(assert (=> b!730626 (= res!490535 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20113 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20113 a!3186))))))

(declare-fun b!730627 () Bool)

(assert (=> b!730627 (= e!408958 e!408966)))

(declare-fun res!490534 () Bool)

(assert (=> b!730627 (=> (not res!490534) (not e!408966))))

(declare-fun lt!323696 () SeekEntryResult!7249)

(assert (=> b!730627 (= res!490534 (= lt!323696 lt!323698))))

(declare-fun lt!323692 () (_ BitVec 64))

(declare-fun lt!323700 () array!41155)

(assert (=> b!730627 (= lt!323698 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323692 lt!323700 mask!3328))))

(assert (=> b!730627 (= lt!323696 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323692 mask!3328) lt!323692 lt!323700 mask!3328))))

(assert (=> b!730627 (= lt!323692 (select (store (arr!19693 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!730627 (= lt!323700 (array!41156 (store (arr!19693 a!3186) i!1173 k0!2102) (size!20113 a!3186)))))

(declare-fun b!730628 () Bool)

(assert (=> b!730628 (= e!408960 e!408965)))

(declare-fun res!490541 () Bool)

(assert (=> b!730628 (=> (not res!490541) (not e!408965))))

(declare-fun lt!323695 () SeekEntryResult!7249)

(assert (=> b!730628 (= res!490541 (or (= lt!323695 (MissingZero!7249 i!1173)) (= lt!323695 (MissingVacant!7249 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41155 (_ BitVec 32)) SeekEntryResult!7249)

(assert (=> b!730628 (= lt!323695 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!730629 () Bool)

(declare-fun res!490539 () Bool)

(assert (=> b!730629 (=> (not res!490539) (not e!408960))))

(declare-fun arrayContainsKey!0 (array!41155 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!730629 (= res!490539 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun e!408964 () Bool)

(declare-fun b!730630 () Bool)

(assert (=> b!730630 (= e!408964 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19693 a!3186) j!159) a!3186 mask!3328) lt!323693))))

(declare-fun b!730631 () Bool)

(declare-fun res!490536 () Bool)

(assert (=> b!730631 (=> (not res!490536) (not e!408960))))

(assert (=> b!730631 (= res!490536 (validKeyInArray!0 (select (arr!19693 a!3186) j!159)))))

(declare-fun b!730632 () Bool)

(declare-fun res!490548 () Bool)

(assert (=> b!730632 (=> (not res!490548) (not e!408958))))

(assert (=> b!730632 (= res!490548 e!408964)))

(declare-fun c!80420 () Bool)

(assert (=> b!730632 (= c!80420 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!730633 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41155 (_ BitVec 32)) SeekEntryResult!7249)

(assert (=> b!730633 (= e!408964 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19693 a!3186) j!159) a!3186 mask!3328) (Found!7249 j!159)))))

(declare-fun b!730634 () Bool)

(declare-fun e!408961 () Bool)

(assert (=> b!730634 (= e!408962 e!408961)))

(declare-fun res!490540 () Bool)

(assert (=> b!730634 (=> (not res!490540) (not e!408961))))

(declare-fun lt!323697 () SeekEntryResult!7249)

(assert (=> b!730634 (= res!490540 (= (seekEntryOrOpen!0 (select (arr!19693 a!3186) j!159) a!3186 mask!3328) lt!323697))))

(assert (=> b!730634 (= lt!323697 (Found!7249 j!159))))

(declare-fun b!730635 () Bool)

(assert (=> b!730635 (= e!408961 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19693 a!3186) j!159) a!3186 mask!3328) lt!323697))))

(declare-fun b!730636 () Bool)

(declare-fun res!490542 () Bool)

(assert (=> b!730636 (=> (not res!490542) (not e!408965))))

(declare-datatypes ((List!13602 0))(
  ( (Nil!13599) (Cons!13598 (h!14664 (_ BitVec 64)) (t!19909 List!13602)) )
))
(declare-fun arrayNoDuplicates!0 (array!41155 (_ BitVec 32) List!13602) Bool)

(assert (=> b!730636 (= res!490542 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13599))))

(assert (= (and start!64836 res!490543) b!730622))

(assert (= (and b!730622 res!490545) b!730631))

(assert (= (and b!730631 res!490536) b!730623))

(assert (= (and b!730623 res!490537) b!730629))

(assert (= (and b!730629 res!490539) b!730628))

(assert (= (and b!730628 res!490541) b!730620))

(assert (= (and b!730620 res!490544) b!730636))

(assert (= (and b!730636 res!490542) b!730626))

(assert (= (and b!730626 res!490535) b!730625))

(assert (= (and b!730625 res!490547) b!730619))

(assert (= (and b!730619 res!490538) b!730632))

(assert (= (and b!730632 c!80420) b!730630))

(assert (= (and b!730632 (not c!80420)) b!730633))

(assert (= (and b!730632 res!490548) b!730627))

(assert (= (and b!730627 res!490534) b!730621))

(assert (= (and b!730621 res!490549) b!730634))

(assert (= (and b!730634 res!490540) b!730635))

(assert (= (and b!730621 (not res!490546)) b!730624))

(declare-fun m!684603 () Bool)

(assert (=> b!730630 m!684603))

(assert (=> b!730630 m!684603))

(declare-fun m!684605 () Bool)

(assert (=> b!730630 m!684605))

(declare-fun m!684607 () Bool)

(assert (=> b!730628 m!684607))

(declare-fun m!684609 () Bool)

(assert (=> b!730623 m!684609))

(declare-fun m!684611 () Bool)

(assert (=> b!730624 m!684611))

(declare-fun m!684613 () Bool)

(assert (=> b!730619 m!684613))

(declare-fun m!684615 () Bool)

(assert (=> b!730627 m!684615))

(declare-fun m!684617 () Bool)

(assert (=> b!730627 m!684617))

(assert (=> b!730627 m!684617))

(declare-fun m!684619 () Bool)

(assert (=> b!730627 m!684619))

(declare-fun m!684621 () Bool)

(assert (=> b!730627 m!684621))

(declare-fun m!684623 () Bool)

(assert (=> b!730627 m!684623))

(assert (=> b!730625 m!684603))

(assert (=> b!730625 m!684603))

(declare-fun m!684625 () Bool)

(assert (=> b!730625 m!684625))

(assert (=> b!730625 m!684625))

(assert (=> b!730625 m!684603))

(declare-fun m!684627 () Bool)

(assert (=> b!730625 m!684627))

(declare-fun m!684629 () Bool)

(assert (=> b!730636 m!684629))

(declare-fun m!684631 () Bool)

(assert (=> start!64836 m!684631))

(declare-fun m!684633 () Bool)

(assert (=> start!64836 m!684633))

(declare-fun m!684635 () Bool)

(assert (=> b!730621 m!684635))

(declare-fun m!684637 () Bool)

(assert (=> b!730621 m!684637))

(assert (=> b!730631 m!684603))

(assert (=> b!730631 m!684603))

(declare-fun m!684639 () Bool)

(assert (=> b!730631 m!684639))

(assert (=> b!730633 m!684603))

(assert (=> b!730633 m!684603))

(declare-fun m!684641 () Bool)

(assert (=> b!730633 m!684641))

(declare-fun m!684643 () Bool)

(assert (=> b!730629 m!684643))

(assert (=> b!730635 m!684603))

(assert (=> b!730635 m!684603))

(declare-fun m!684645 () Bool)

(assert (=> b!730635 m!684645))

(assert (=> b!730634 m!684603))

(assert (=> b!730634 m!684603))

(declare-fun m!684647 () Bool)

(assert (=> b!730634 m!684647))

(declare-fun m!684649 () Bool)

(assert (=> b!730620 m!684649))

(check-sat (not b!730635) (not start!64836) (not b!730633) (not b!730629) (not b!730630) (not b!730620) (not b!730624) (not b!730625) (not b!730621) (not b!730627) (not b!730631) (not b!730634) (not b!730623) (not b!730628) (not b!730636))
(check-sat)
