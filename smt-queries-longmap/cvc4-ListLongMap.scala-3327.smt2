; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45946 () Bool)

(assert start!45946)

(declare-fun b!508643 () Bool)

(declare-fun e!297556 () Bool)

(declare-fun e!297555 () Bool)

(assert (=> b!508643 (= e!297556 e!297555)))

(declare-fun res!309548 () Bool)

(assert (=> b!508643 (=> (not res!309548) (not e!297555))))

(declare-datatypes ((SeekEntryResult!4130 0))(
  ( (MissingZero!4130 (index!18708 (_ BitVec 32))) (Found!4130 (index!18709 (_ BitVec 32))) (Intermediate!4130 (undefined!4942 Bool) (index!18710 (_ BitVec 32)) (x!47832 (_ BitVec 32))) (Undefined!4130) (MissingVacant!4130 (index!18711 (_ BitVec 32))) )
))
(declare-fun lt!232345 () SeekEntryResult!4130)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!508643 (= res!309548 (or (= lt!232345 (MissingZero!4130 i!1204)) (= lt!232345 (MissingVacant!4130 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32658 0))(
  ( (array!32659 (arr!15707 (Array (_ BitVec 32) (_ BitVec 64))) (size!16071 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32658)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32658 (_ BitVec 32)) SeekEntryResult!4130)

(assert (=> b!508643 (= lt!232345 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!508644 () Bool)

(declare-fun res!309549 () Bool)

(assert (=> b!508644 (=> (not res!309549) (not e!297556))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!508644 (= res!309549 (and (= (size!16071 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16071 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16071 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508645 () Bool)

(declare-fun e!297558 () Bool)

(assert (=> b!508645 (= e!297558 (= (seekEntryOrOpen!0 (select (arr!15707 a!3235) j!176) a!3235 mask!3524) (Found!4130 j!176)))))

(declare-fun b!508646 () Bool)

(declare-fun res!309543 () Bool)

(assert (=> b!508646 (=> (not res!309543) (not e!297556))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508646 (= res!309543 (validKeyInArray!0 k!2280))))

(declare-fun b!508647 () Bool)

(declare-fun res!309546 () Bool)

(assert (=> b!508647 (=> (not res!309546) (not e!297556))))

(assert (=> b!508647 (= res!309546 (validKeyInArray!0 (select (arr!15707 a!3235) j!176)))))

(declare-fun b!508648 () Bool)

(declare-fun res!309545 () Bool)

(assert (=> b!508648 (=> (not res!309545) (not e!297556))))

(declare-fun arrayContainsKey!0 (array!32658 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508648 (= res!309545 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508649 () Bool)

(assert (=> b!508649 (= e!297555 (not true))))

(assert (=> b!508649 e!297558))

(declare-fun res!309544 () Bool)

(assert (=> b!508649 (=> (not res!309544) (not e!297558))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32658 (_ BitVec 32)) Bool)

(assert (=> b!508649 (= res!309544 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15579 0))(
  ( (Unit!15580) )
))
(declare-fun lt!232344 () Unit!15579)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32658 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15579)

(assert (=> b!508649 (= lt!232344 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!508650 () Bool)

(declare-fun res!309547 () Bool)

(assert (=> b!508650 (=> (not res!309547) (not e!297555))))

(assert (=> b!508650 (= res!309547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508651 () Bool)

(declare-fun res!309542 () Bool)

(assert (=> b!508651 (=> (not res!309542) (not e!297555))))

(declare-datatypes ((List!9772 0))(
  ( (Nil!9769) (Cons!9768 (h!10645 (_ BitVec 64)) (t!15992 List!9772)) )
))
(declare-fun arrayNoDuplicates!0 (array!32658 (_ BitVec 32) List!9772) Bool)

(assert (=> b!508651 (= res!309542 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9769))))

(declare-fun res!309550 () Bool)

(assert (=> start!45946 (=> (not res!309550) (not e!297556))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45946 (= res!309550 (validMask!0 mask!3524))))

(assert (=> start!45946 e!297556))

(assert (=> start!45946 true))

(declare-fun array_inv!11566 (array!32658) Bool)

(assert (=> start!45946 (array_inv!11566 a!3235)))

(assert (= (and start!45946 res!309550) b!508644))

(assert (= (and b!508644 res!309549) b!508647))

(assert (= (and b!508647 res!309546) b!508646))

(assert (= (and b!508646 res!309543) b!508648))

(assert (= (and b!508648 res!309545) b!508643))

(assert (= (and b!508643 res!309548) b!508650))

(assert (= (and b!508650 res!309547) b!508651))

(assert (= (and b!508651 res!309542) b!508649))

(assert (= (and b!508649 res!309544) b!508645))

(declare-fun m!489637 () Bool)

(assert (=> b!508643 m!489637))

(declare-fun m!489639 () Bool)

(assert (=> b!508647 m!489639))

(assert (=> b!508647 m!489639))

(declare-fun m!489641 () Bool)

(assert (=> b!508647 m!489641))

(declare-fun m!489643 () Bool)

(assert (=> b!508648 m!489643))

(declare-fun m!489645 () Bool)

(assert (=> b!508651 m!489645))

(assert (=> b!508645 m!489639))

(assert (=> b!508645 m!489639))

(declare-fun m!489647 () Bool)

(assert (=> b!508645 m!489647))

(declare-fun m!489649 () Bool)

(assert (=> b!508646 m!489649))

(declare-fun m!489651 () Bool)

(assert (=> b!508650 m!489651))

(declare-fun m!489653 () Bool)

(assert (=> start!45946 m!489653))

(declare-fun m!489655 () Bool)

(assert (=> start!45946 m!489655))

(declare-fun m!489657 () Bool)

(assert (=> b!508649 m!489657))

(declare-fun m!489659 () Bool)

(assert (=> b!508649 m!489659))

(push 1)

(assert (not b!508649))

(assert (not b!508643))

(assert (not b!508650))

(assert (not b!508651))

(assert (not b!508648))

(assert (not start!45946))

(assert (not b!508646))

(assert (not b!508645))

(assert (not b!508647))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

