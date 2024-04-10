; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45784 () Bool)

(assert start!45784)

(declare-fun b!506719 () Bool)

(declare-fun res!307683 () Bool)

(declare-fun e!296570 () Bool)

(assert (=> b!506719 (=> (not res!307683) (not e!296570))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((array!32540 0))(
  ( (array!32541 (arr!15650 (Array (_ BitVec 32) (_ BitVec 64))) (size!16014 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32540)

(assert (=> b!506719 (= res!307683 (and (= (size!16014 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16014 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16014 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506720 () Bool)

(declare-fun res!307684 () Bool)

(assert (=> b!506720 (=> (not res!307684) (not e!296570))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32540 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506720 (= res!307684 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!506721 () Bool)

(declare-fun e!296572 () Bool)

(declare-datatypes ((SeekEntryResult!4117 0))(
  ( (MissingZero!4117 (index!18656 (_ BitVec 32))) (Found!4117 (index!18657 (_ BitVec 32))) (Intermediate!4117 (undefined!4929 Bool) (index!18658 (_ BitVec 32)) (x!47654 (_ BitVec 32))) (Undefined!4117) (MissingVacant!4117 (index!18659 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32540 (_ BitVec 32)) SeekEntryResult!4117)

(assert (=> b!506721 (= e!296572 (= (seekEntryOrOpen!0 (select (arr!15650 a!3235) j!176) a!3235 mask!3524) (Found!4117 j!176)))))

(declare-fun b!506722 () Bool)

(declare-fun res!307678 () Bool)

(declare-fun e!296573 () Bool)

(assert (=> b!506722 (=> (not res!307678) (not e!296573))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32540 (_ BitVec 32)) Bool)

(assert (=> b!506722 (= res!307678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!506723 () Bool)

(assert (=> b!506723 (= e!296570 e!296573)))

(declare-fun res!307687 () Bool)

(assert (=> b!506723 (=> (not res!307687) (not e!296573))))

(declare-fun lt!231248 () SeekEntryResult!4117)

(assert (=> b!506723 (= res!307687 (or (= lt!231248 (MissingZero!4117 i!1204)) (= lt!231248 (MissingVacant!4117 i!1204))))))

(assert (=> b!506723 (= lt!231248 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!506724 () Bool)

(declare-fun res!307679 () Bool)

(assert (=> b!506724 (=> (not res!307679) (not e!296573))))

(declare-datatypes ((List!9808 0))(
  ( (Nil!9805) (Cons!9804 (h!10681 (_ BitVec 64)) (t!16036 List!9808)) )
))
(declare-fun arrayNoDuplicates!0 (array!32540 (_ BitVec 32) List!9808) Bool)

(assert (=> b!506724 (= res!307679 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9805))))

(declare-fun b!506725 () Bool)

(declare-fun res!307681 () Bool)

(assert (=> b!506725 (=> (not res!307681) (not e!296570))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506725 (= res!307681 (validKeyInArray!0 (select (arr!15650 a!3235) j!176)))))

(declare-fun b!506726 () Bool)

(declare-fun e!296574 () Bool)

(assert (=> b!506726 (= e!296574 true)))

(assert (=> b!506726 false))

(declare-fun b!506727 () Bool)

(declare-fun e!296569 () Bool)

(assert (=> b!506727 (= e!296569 e!296574)))

(declare-fun res!307686 () Bool)

(assert (=> b!506727 (=> res!307686 e!296574)))

(declare-fun lt!231246 () Bool)

(declare-fun lt!231247 () SeekEntryResult!4117)

(assert (=> b!506727 (= res!307686 (or (and (not lt!231246) (undefined!4929 lt!231247)) (and (not lt!231246) (not (undefined!4929 lt!231247)))))))

(assert (=> b!506727 (= lt!231246 (not (is-Intermediate!4117 lt!231247)))))

(declare-fun res!307682 () Bool)

(assert (=> start!45784 (=> (not res!307682) (not e!296570))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45784 (= res!307682 (validMask!0 mask!3524))))

(assert (=> start!45784 e!296570))

(assert (=> start!45784 true))

(declare-fun array_inv!11446 (array!32540) Bool)

(assert (=> start!45784 (array_inv!11446 a!3235)))

(declare-fun b!506728 () Bool)

(declare-fun res!307685 () Bool)

(assert (=> b!506728 (=> (not res!307685) (not e!296570))))

(assert (=> b!506728 (= res!307685 (validKeyInArray!0 k!2280))))

(declare-fun b!506729 () Bool)

(assert (=> b!506729 (= e!296573 (not e!296569))))

(declare-fun res!307680 () Bool)

(assert (=> b!506729 (=> res!307680 e!296569)))

(declare-fun lt!231245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32540 (_ BitVec 32)) SeekEntryResult!4117)

(assert (=> b!506729 (= res!307680 (= lt!231247 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231245 (select (store (arr!15650 a!3235) i!1204 k!2280) j!176) (array!32541 (store (arr!15650 a!3235) i!1204 k!2280) (size!16014 a!3235)) mask!3524)))))

(declare-fun lt!231250 () (_ BitVec 32))

(assert (=> b!506729 (= lt!231247 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231250 (select (arr!15650 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506729 (= lt!231245 (toIndex!0 (select (store (arr!15650 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!506729 (= lt!231250 (toIndex!0 (select (arr!15650 a!3235) j!176) mask!3524))))

(assert (=> b!506729 e!296572))

(declare-fun res!307688 () Bool)

(assert (=> b!506729 (=> (not res!307688) (not e!296572))))

(assert (=> b!506729 (= res!307688 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15522 0))(
  ( (Unit!15523) )
))
(declare-fun lt!231249 () Unit!15522)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32540 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15522)

(assert (=> b!506729 (= lt!231249 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45784 res!307682) b!506719))

(assert (= (and b!506719 res!307683) b!506725))

(assert (= (and b!506725 res!307681) b!506728))

(assert (= (and b!506728 res!307685) b!506720))

(assert (= (and b!506720 res!307684) b!506723))

(assert (= (and b!506723 res!307687) b!506722))

(assert (= (and b!506722 res!307678) b!506724))

(assert (= (and b!506724 res!307679) b!506729))

(assert (= (and b!506729 res!307688) b!506721))

(assert (= (and b!506729 (not res!307680)) b!506727))

(assert (= (and b!506727 (not res!307686)) b!506726))

(declare-fun m!487407 () Bool)

(assert (=> b!506722 m!487407))

(declare-fun m!487409 () Bool)

(assert (=> b!506721 m!487409))

(assert (=> b!506721 m!487409))

(declare-fun m!487411 () Bool)

(assert (=> b!506721 m!487411))

(declare-fun m!487413 () Bool)

(assert (=> b!506724 m!487413))

(declare-fun m!487415 () Bool)

(assert (=> b!506723 m!487415))

(assert (=> b!506725 m!487409))

(assert (=> b!506725 m!487409))

(declare-fun m!487417 () Bool)

(assert (=> b!506725 m!487417))

(declare-fun m!487419 () Bool)

(assert (=> b!506728 m!487419))

(declare-fun m!487421 () Bool)

(assert (=> b!506720 m!487421))

(declare-fun m!487423 () Bool)

(assert (=> start!45784 m!487423))

(declare-fun m!487425 () Bool)

(assert (=> start!45784 m!487425))

(declare-fun m!487427 () Bool)

(assert (=> b!506729 m!487427))

(declare-fun m!487429 () Bool)

(assert (=> b!506729 m!487429))

(assert (=> b!506729 m!487409))

(declare-fun m!487431 () Bool)

(assert (=> b!506729 m!487431))

(assert (=> b!506729 m!487409))

(declare-fun m!487433 () Bool)

(assert (=> b!506729 m!487433))

(declare-fun m!487435 () Bool)

(assert (=> b!506729 m!487435))

(assert (=> b!506729 m!487433))

(assert (=> b!506729 m!487409))

(declare-fun m!487437 () Bool)

(assert (=> b!506729 m!487437))

(assert (=> b!506729 m!487433))

(declare-fun m!487439 () Bool)

(assert (=> b!506729 m!487439))

(declare-fun m!487441 () Bool)

(assert (=> b!506729 m!487441))

(push 1)

