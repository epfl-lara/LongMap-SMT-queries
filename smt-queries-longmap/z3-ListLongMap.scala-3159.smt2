; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44516 () Bool)

(assert start!44516)

(declare-fun b!488669 () Bool)

(declare-fun e!287457 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(assert (=> b!488669 (= e!287457 (not (bvsge mask!3524 #b00000000000000000000000000000000)))))

(declare-fun lt!220525 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31627 0))(
  ( (array!31628 (arr!15202 (Array (_ BitVec 32) (_ BitVec 64))) (size!15566 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31627)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!488669 (= lt!220525 (toIndex!0 (select (store (arr!15202 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(declare-fun e!287458 () Bool)

(assert (=> b!488669 e!287458))

(declare-fun res!291774 () Bool)

(assert (=> b!488669 (=> (not res!291774) (not e!287458))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31627 (_ BitVec 32)) Bool)

(assert (=> b!488669 (= res!291774 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14257 0))(
  ( (Unit!14258) )
))
(declare-fun lt!220524 () Unit!14257)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31627 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14257)

(assert (=> b!488669 (= lt!220524 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!488670 () Bool)

(declare-fun res!291778 () Bool)

(declare-fun e!287459 () Bool)

(assert (=> b!488670 (=> (not res!291778) (not e!287459))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488670 (= res!291778 (validKeyInArray!0 k0!2280))))

(declare-fun res!291776 () Bool)

(assert (=> start!44516 (=> (not res!291776) (not e!287459))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44516 (= res!291776 (validMask!0 mask!3524))))

(assert (=> start!44516 e!287459))

(assert (=> start!44516 true))

(declare-fun array_inv!11061 (array!31627) Bool)

(assert (=> start!44516 (array_inv!11061 a!3235)))

(declare-fun b!488671 () Bool)

(declare-fun res!291770 () Bool)

(assert (=> b!488671 (=> (not res!291770) (not e!287459))))

(assert (=> b!488671 (= res!291770 (and (= (size!15566 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15566 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15566 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!488672 () Bool)

(assert (=> b!488672 (= e!287459 e!287457)))

(declare-fun res!291772 () Bool)

(assert (=> b!488672 (=> (not res!291772) (not e!287457))))

(declare-datatypes ((SeekEntryResult!3625 0))(
  ( (MissingZero!3625 (index!16679 (_ BitVec 32))) (Found!3625 (index!16680 (_ BitVec 32))) (Intermediate!3625 (undefined!4437 Bool) (index!16681 (_ BitVec 32)) (x!45941 (_ BitVec 32))) (Undefined!3625) (MissingVacant!3625 (index!16682 (_ BitVec 32))) )
))
(declare-fun lt!220523 () SeekEntryResult!3625)

(assert (=> b!488672 (= res!291772 (or (= lt!220523 (MissingZero!3625 i!1204)) (= lt!220523 (MissingVacant!3625 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31627 (_ BitVec 32)) SeekEntryResult!3625)

(assert (=> b!488672 (= lt!220523 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!488673 () Bool)

(declare-fun res!291773 () Bool)

(assert (=> b!488673 (=> (not res!291773) (not e!287459))))

(declare-fun arrayContainsKey!0 (array!31627 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488673 (= res!291773 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!488674 () Bool)

(declare-fun res!291771 () Bool)

(assert (=> b!488674 (=> (not res!291771) (not e!287459))))

(assert (=> b!488674 (= res!291771 (validKeyInArray!0 (select (arr!15202 a!3235) j!176)))))

(declare-fun b!488675 () Bool)

(assert (=> b!488675 (= e!287458 (= (seekEntryOrOpen!0 (select (arr!15202 a!3235) j!176) a!3235 mask!3524) (Found!3625 j!176)))))

(declare-fun b!488676 () Bool)

(declare-fun res!291777 () Bool)

(assert (=> b!488676 (=> (not res!291777) (not e!287457))))

(declare-datatypes ((List!9267 0))(
  ( (Nil!9264) (Cons!9263 (h!10122 (_ BitVec 64)) (t!15487 List!9267)) )
))
(declare-fun arrayNoDuplicates!0 (array!31627 (_ BitVec 32) List!9267) Bool)

(assert (=> b!488676 (= res!291777 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9264))))

(declare-fun b!488677 () Bool)

(declare-fun res!291775 () Bool)

(assert (=> b!488677 (=> (not res!291775) (not e!287457))))

(assert (=> b!488677 (= res!291775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44516 res!291776) b!488671))

(assert (= (and b!488671 res!291770) b!488674))

(assert (= (and b!488674 res!291771) b!488670))

(assert (= (and b!488670 res!291778) b!488673))

(assert (= (and b!488673 res!291773) b!488672))

(assert (= (and b!488672 res!291772) b!488677))

(assert (= (and b!488677 res!291775) b!488676))

(assert (= (and b!488676 res!291777) b!488669))

(assert (= (and b!488669 res!291774) b!488675))

(declare-fun m!468631 () Bool)

(assert (=> b!488670 m!468631))

(declare-fun m!468633 () Bool)

(assert (=> b!488673 m!468633))

(declare-fun m!468635 () Bool)

(assert (=> b!488669 m!468635))

(declare-fun m!468637 () Bool)

(assert (=> b!488669 m!468637))

(declare-fun m!468639 () Bool)

(assert (=> b!488669 m!468639))

(declare-fun m!468641 () Bool)

(assert (=> b!488669 m!468641))

(assert (=> b!488669 m!468639))

(declare-fun m!468643 () Bool)

(assert (=> b!488669 m!468643))

(declare-fun m!468645 () Bool)

(assert (=> b!488674 m!468645))

(assert (=> b!488674 m!468645))

(declare-fun m!468647 () Bool)

(assert (=> b!488674 m!468647))

(declare-fun m!468649 () Bool)

(assert (=> b!488672 m!468649))

(declare-fun m!468651 () Bool)

(assert (=> b!488677 m!468651))

(declare-fun m!468653 () Bool)

(assert (=> start!44516 m!468653))

(declare-fun m!468655 () Bool)

(assert (=> start!44516 m!468655))

(assert (=> b!488675 m!468645))

(assert (=> b!488675 m!468645))

(declare-fun m!468657 () Bool)

(assert (=> b!488675 m!468657))

(declare-fun m!468659 () Bool)

(assert (=> b!488676 m!468659))

(check-sat (not start!44516) (not b!488676) (not b!488673) (not b!488677) (not b!488672) (not b!488675) (not b!488669) (not b!488674) (not b!488670))
(check-sat)
