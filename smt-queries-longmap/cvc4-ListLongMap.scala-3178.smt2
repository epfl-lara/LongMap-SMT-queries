; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44698 () Bool)

(assert start!44698)

(declare-fun b!490516 () Bool)

(declare-fun res!293455 () Bool)

(declare-fun e!288339 () Bool)

(assert (=> b!490516 (=> (not res!293455) (not e!288339))))

(declare-datatypes ((array!31757 0))(
  ( (array!31758 (arr!15266 (Array (_ BitVec 32) (_ BitVec 64))) (size!15630 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31757)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31757 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490516 (= res!293455 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490517 () Bool)

(declare-fun e!288342 () Bool)

(assert (=> b!490517 (= e!288339 e!288342)))

(declare-fun res!293452 () Bool)

(assert (=> b!490517 (=> (not res!293452) (not e!288342))))

(declare-datatypes ((SeekEntryResult!3733 0))(
  ( (MissingZero!3733 (index!17111 (_ BitVec 32))) (Found!3733 (index!17112 (_ BitVec 32))) (Intermediate!3733 (undefined!4545 Bool) (index!17113 (_ BitVec 32)) (x!46207 (_ BitVec 32))) (Undefined!3733) (MissingVacant!3733 (index!17114 (_ BitVec 32))) )
))
(declare-fun lt!221545 () SeekEntryResult!3733)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!490517 (= res!293452 (or (= lt!221545 (MissingZero!3733 i!1204)) (= lt!221545 (MissingVacant!3733 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31757 (_ BitVec 32)) SeekEntryResult!3733)

(assert (=> b!490517 (= lt!221545 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!490518 () Bool)

(declare-fun res!293454 () Bool)

(assert (=> b!490518 (=> (not res!293454) (not e!288339))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!490518 (= res!293454 (and (= (size!15630 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15630 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15630 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490519 () Bool)

(declare-fun e!288341 () Bool)

(assert (=> b!490519 (= e!288341 true)))

(declare-fun lt!221544 () SeekEntryResult!3733)

(declare-fun lt!221546 () array!31757)

(declare-fun lt!221543 () (_ BitVec 64))

(assert (=> b!490519 (= lt!221544 (seekEntryOrOpen!0 lt!221543 lt!221546 mask!3524))))

(declare-datatypes ((Unit!14412 0))(
  ( (Unit!14413) )
))
(declare-fun lt!221548 () Unit!14412)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31757 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14412)

(assert (=> b!490519 (= lt!221548 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!490520 () Bool)

(declare-fun res!293458 () Bool)

(assert (=> b!490520 (=> (not res!293458) (not e!288339))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490520 (= res!293458 (validKeyInArray!0 (select (arr!15266 a!3235) j!176)))))

(declare-fun b!490521 () Bool)

(declare-fun res!293456 () Bool)

(assert (=> b!490521 (=> (not res!293456) (not e!288342))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31757 (_ BitVec 32)) Bool)

(assert (=> b!490521 (= res!293456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490515 () Bool)

(declare-fun res!293457 () Bool)

(assert (=> b!490515 (=> (not res!293457) (not e!288339))))

(assert (=> b!490515 (= res!293457 (validKeyInArray!0 k!2280))))

(declare-fun res!293459 () Bool)

(assert (=> start!44698 (=> (not res!293459) (not e!288339))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44698 (= res!293459 (validMask!0 mask!3524))))

(assert (=> start!44698 e!288339))

(assert (=> start!44698 true))

(declare-fun array_inv!11062 (array!31757) Bool)

(assert (=> start!44698 (array_inv!11062 a!3235)))

(declare-fun b!490522 () Bool)

(assert (=> b!490522 (= e!288342 (not e!288341))))

(declare-fun res!293453 () Bool)

(assert (=> b!490522 (=> res!293453 e!288341)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31757 (_ BitVec 32)) SeekEntryResult!3733)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490522 (= res!293453 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15266 a!3235) j!176) mask!3524) (select (arr!15266 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221543 mask!3524) lt!221543 lt!221546 mask!3524))))))

(assert (=> b!490522 (= lt!221543 (select (store (arr!15266 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!490522 (= lt!221546 (array!31758 (store (arr!15266 a!3235) i!1204 k!2280) (size!15630 a!3235)))))

(assert (=> b!490522 (= lt!221544 (Found!3733 j!176))))

(assert (=> b!490522 (= lt!221544 (seekEntryOrOpen!0 (select (arr!15266 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!490522 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!221547 () Unit!14412)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31757 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14412)

(assert (=> b!490522 (= lt!221547 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490523 () Bool)

(declare-fun res!293451 () Bool)

(assert (=> b!490523 (=> (not res!293451) (not e!288342))))

(declare-datatypes ((List!9424 0))(
  ( (Nil!9421) (Cons!9420 (h!10282 (_ BitVec 64)) (t!15652 List!9424)) )
))
(declare-fun arrayNoDuplicates!0 (array!31757 (_ BitVec 32) List!9424) Bool)

(assert (=> b!490523 (= res!293451 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9421))))

(assert (= (and start!44698 res!293459) b!490518))

(assert (= (and b!490518 res!293454) b!490520))

(assert (= (and b!490520 res!293458) b!490515))

(assert (= (and b!490515 res!293457) b!490516))

(assert (= (and b!490516 res!293455) b!490517))

(assert (= (and b!490517 res!293452) b!490521))

(assert (= (and b!490521 res!293456) b!490523))

(assert (= (and b!490523 res!293451) b!490522))

(assert (= (and b!490522 (not res!293453)) b!490519))

(declare-fun m!470657 () Bool)

(assert (=> b!490523 m!470657))

(declare-fun m!470659 () Bool)

(assert (=> b!490522 m!470659))

(declare-fun m!470661 () Bool)

(assert (=> b!490522 m!470661))

(declare-fun m!470663 () Bool)

(assert (=> b!490522 m!470663))

(declare-fun m!470665 () Bool)

(assert (=> b!490522 m!470665))

(declare-fun m!470667 () Bool)

(assert (=> b!490522 m!470667))

(declare-fun m!470669 () Bool)

(assert (=> b!490522 m!470669))

(declare-fun m!470671 () Bool)

(assert (=> b!490522 m!470671))

(declare-fun m!470673 () Bool)

(assert (=> b!490522 m!470673))

(assert (=> b!490522 m!470671))

(assert (=> b!490522 m!470669))

(assert (=> b!490522 m!470671))

(declare-fun m!470675 () Bool)

(assert (=> b!490522 m!470675))

(assert (=> b!490522 m!470671))

(declare-fun m!470677 () Bool)

(assert (=> b!490522 m!470677))

(assert (=> b!490522 m!470659))

(declare-fun m!470679 () Bool)

(assert (=> b!490515 m!470679))

(declare-fun m!470681 () Bool)

(assert (=> b!490521 m!470681))

(declare-fun m!470683 () Bool)

(assert (=> b!490517 m!470683))

(declare-fun m!470685 () Bool)

(assert (=> b!490519 m!470685))

(declare-fun m!470687 () Bool)

(assert (=> b!490519 m!470687))

(declare-fun m!470689 () Bool)

(assert (=> start!44698 m!470689))

(declare-fun m!470691 () Bool)

(assert (=> start!44698 m!470691))

(declare-fun m!470693 () Bool)

(assert (=> b!490516 m!470693))

(assert (=> b!490520 m!470671))

(assert (=> b!490520 m!470671))

(declare-fun m!470695 () Bool)

(assert (=> b!490520 m!470695))

(push 1)

