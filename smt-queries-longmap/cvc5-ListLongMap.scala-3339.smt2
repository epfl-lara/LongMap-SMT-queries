; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46026 () Bool)

(assert start!46026)

(declare-fun b!509649 () Bool)

(declare-fun res!310502 () Bool)

(declare-fun e!298015 () Bool)

(assert (=> b!509649 (=> (not res!310502) (not e!298015))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509649 (= res!310502 (validKeyInArray!0 k!2280))))

(declare-fun b!509650 () Bool)

(declare-fun res!310499 () Bool)

(declare-fun e!298016 () Bool)

(assert (=> b!509650 (=> (not res!310499) (not e!298016))))

(declare-datatypes ((array!32737 0))(
  ( (array!32738 (arr!15747 (Array (_ BitVec 32) (_ BitVec 64))) (size!16111 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32737)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32737 (_ BitVec 32)) Bool)

(assert (=> b!509650 (= res!310499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!310500 () Bool)

(assert (=> start!46026 (=> (not res!310500) (not e!298015))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46026 (= res!310500 (validMask!0 mask!3524))))

(assert (=> start!46026 e!298015))

(assert (=> start!46026 true))

(declare-fun array_inv!11543 (array!32737) Bool)

(assert (=> start!46026 (array_inv!11543 a!3235)))

(declare-fun b!509651 () Bool)

(declare-fun res!310497 () Bool)

(assert (=> b!509651 (=> (not res!310497) (not e!298015))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!509651 (= res!310497 (validKeyInArray!0 (select (arr!15747 a!3235) j!176)))))

(declare-fun b!509652 () Bool)

(declare-fun res!310498 () Bool)

(assert (=> b!509652 (=> (not res!310498) (not e!298015))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!509652 (= res!310498 (and (= (size!16111 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16111 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16111 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509653 () Bool)

(declare-fun res!310494 () Bool)

(assert (=> b!509653 (=> (not res!310494) (not e!298016))))

(declare-datatypes ((List!9905 0))(
  ( (Nil!9902) (Cons!9901 (h!10778 (_ BitVec 64)) (t!16133 List!9905)) )
))
(declare-fun arrayNoDuplicates!0 (array!32737 (_ BitVec 32) List!9905) Bool)

(assert (=> b!509653 (= res!310494 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9902))))

(declare-fun b!509654 () Bool)

(assert (=> b!509654 (= e!298015 e!298016)))

(declare-fun res!310496 () Bool)

(assert (=> b!509654 (=> (not res!310496) (not e!298016))))

(declare-datatypes ((SeekEntryResult!4214 0))(
  ( (MissingZero!4214 (index!19044 (_ BitVec 32))) (Found!4214 (index!19045 (_ BitVec 32))) (Intermediate!4214 (undefined!5026 Bool) (index!19046 (_ BitVec 32)) (x!48015 (_ BitVec 32))) (Undefined!4214) (MissingVacant!4214 (index!19047 (_ BitVec 32))) )
))
(declare-fun lt!232857 () SeekEntryResult!4214)

(assert (=> b!509654 (= res!310496 (or (= lt!232857 (MissingZero!4214 i!1204)) (= lt!232857 (MissingVacant!4214 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32737 (_ BitVec 32)) SeekEntryResult!4214)

(assert (=> b!509654 (= lt!232857 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun e!298017 () Bool)

(declare-fun b!509655 () Bool)

(assert (=> b!509655 (= e!298017 (= (seekEntryOrOpen!0 (select (arr!15747 a!3235) j!176) a!3235 mask!3524) (Found!4214 j!176)))))

(declare-fun b!509656 () Bool)

(declare-fun res!310501 () Bool)

(assert (=> b!509656 (=> (not res!310501) (not e!298015))))

(declare-fun arrayContainsKey!0 (array!32737 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509656 (= res!310501 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509657 () Bool)

(assert (=> b!509657 (= e!298016 (not true))))

(declare-fun lt!232861 () SeekEntryResult!4214)

(declare-fun lt!232858 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32737 (_ BitVec 32)) SeekEntryResult!4214)

(assert (=> b!509657 (= lt!232861 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232858 (select (store (arr!15747 a!3235) i!1204 k!2280) j!176) (array!32738 (store (arr!15747 a!3235) i!1204 k!2280) (size!16111 a!3235)) mask!3524))))

(declare-fun lt!232859 () (_ BitVec 32))

(declare-fun lt!232860 () SeekEntryResult!4214)

(assert (=> b!509657 (= lt!232860 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232859 (select (arr!15747 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509657 (= lt!232858 (toIndex!0 (select (store (arr!15747 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!509657 (= lt!232859 (toIndex!0 (select (arr!15747 a!3235) j!176) mask!3524))))

(assert (=> b!509657 e!298017))

(declare-fun res!310495 () Bool)

(assert (=> b!509657 (=> (not res!310495) (not e!298017))))

(assert (=> b!509657 (= res!310495 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15686 0))(
  ( (Unit!15687) )
))
(declare-fun lt!232856 () Unit!15686)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32737 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15686)

(assert (=> b!509657 (= lt!232856 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!46026 res!310500) b!509652))

(assert (= (and b!509652 res!310498) b!509651))

(assert (= (and b!509651 res!310497) b!509649))

(assert (= (and b!509649 res!310502) b!509656))

(assert (= (and b!509656 res!310501) b!509654))

(assert (= (and b!509654 res!310496) b!509650))

(assert (= (and b!509650 res!310499) b!509653))

(assert (= (and b!509653 res!310494) b!509657))

(assert (= (and b!509657 res!310495) b!509655))

(declare-fun m!490605 () Bool)

(assert (=> start!46026 m!490605))

(declare-fun m!490607 () Bool)

(assert (=> start!46026 m!490607))

(declare-fun m!490609 () Bool)

(assert (=> b!509649 m!490609))

(declare-fun m!490611 () Bool)

(assert (=> b!509651 m!490611))

(assert (=> b!509651 m!490611))

(declare-fun m!490613 () Bool)

(assert (=> b!509651 m!490613))

(assert (=> b!509655 m!490611))

(assert (=> b!509655 m!490611))

(declare-fun m!490615 () Bool)

(assert (=> b!509655 m!490615))

(declare-fun m!490617 () Bool)

(assert (=> b!509654 m!490617))

(declare-fun m!490619 () Bool)

(assert (=> b!509657 m!490619))

(declare-fun m!490621 () Bool)

(assert (=> b!509657 m!490621))

(assert (=> b!509657 m!490611))

(declare-fun m!490623 () Bool)

(assert (=> b!509657 m!490623))

(assert (=> b!509657 m!490611))

(declare-fun m!490625 () Bool)

(assert (=> b!509657 m!490625))

(assert (=> b!509657 m!490621))

(declare-fun m!490627 () Bool)

(assert (=> b!509657 m!490627))

(assert (=> b!509657 m!490621))

(declare-fun m!490629 () Bool)

(assert (=> b!509657 m!490629))

(declare-fun m!490631 () Bool)

(assert (=> b!509657 m!490631))

(assert (=> b!509657 m!490611))

(declare-fun m!490633 () Bool)

(assert (=> b!509657 m!490633))

(declare-fun m!490635 () Bool)

(assert (=> b!509653 m!490635))

(declare-fun m!490637 () Bool)

(assert (=> b!509656 m!490637))

(declare-fun m!490639 () Bool)

(assert (=> b!509650 m!490639))

(push 1)

