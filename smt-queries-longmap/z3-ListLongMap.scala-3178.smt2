; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44696 () Bool)

(assert start!44696)

(declare-fun b!490488 () Bool)

(declare-fun res!293427 () Bool)

(declare-fun e!288328 () Bool)

(assert (=> b!490488 (=> (not res!293427) (not e!288328))))

(declare-datatypes ((array!31755 0))(
  ( (array!31756 (arr!15265 (Array (_ BitVec 32) (_ BitVec 64))) (size!15629 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31755)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31755 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490488 (= res!293427 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490489 () Bool)

(declare-fun res!293425 () Bool)

(assert (=> b!490489 (=> (not res!293425) (not e!288328))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(assert (=> b!490489 (= res!293425 (and (= (size!15629 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15629 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15629 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490490 () Bool)

(declare-fun e!288327 () Bool)

(assert (=> b!490490 (= e!288327 true)))

(declare-fun lt!221529 () (_ BitVec 64))

(declare-fun lt!221526 () array!31755)

(declare-datatypes ((SeekEntryResult!3732 0))(
  ( (MissingZero!3732 (index!17107 (_ BitVec 32))) (Found!3732 (index!17108 (_ BitVec 32))) (Intermediate!3732 (undefined!4544 Bool) (index!17109 (_ BitVec 32)) (x!46206 (_ BitVec 32))) (Undefined!3732) (MissingVacant!3732 (index!17110 (_ BitVec 32))) )
))
(declare-fun lt!221527 () SeekEntryResult!3732)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31755 (_ BitVec 32)) SeekEntryResult!3732)

(assert (=> b!490490 (= lt!221527 (seekEntryOrOpen!0 lt!221529 lt!221526 mask!3524))))

(declare-datatypes ((Unit!14410 0))(
  ( (Unit!14411) )
))
(declare-fun lt!221530 () Unit!14410)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31755 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14410)

(assert (=> b!490490 (= lt!221530 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!490491 () Bool)

(declare-fun res!293432 () Bool)

(declare-fun e!288330 () Bool)

(assert (=> b!490491 (=> (not res!293432) (not e!288330))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31755 (_ BitVec 32)) Bool)

(assert (=> b!490491 (= res!293432 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490492 () Bool)

(assert (=> b!490492 (= e!288328 e!288330)))

(declare-fun res!293430 () Bool)

(assert (=> b!490492 (=> (not res!293430) (not e!288330))))

(declare-fun lt!221525 () SeekEntryResult!3732)

(assert (=> b!490492 (= res!293430 (or (= lt!221525 (MissingZero!3732 i!1204)) (= lt!221525 (MissingVacant!3732 i!1204))))))

(assert (=> b!490492 (= lt!221525 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!490493 () Bool)

(assert (=> b!490493 (= e!288330 (not e!288327))))

(declare-fun res!293426 () Bool)

(assert (=> b!490493 (=> res!293426 e!288327)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31755 (_ BitVec 32)) SeekEntryResult!3732)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490493 (= res!293426 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15265 a!3235) j!176) mask!3524) (select (arr!15265 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221529 mask!3524) lt!221529 lt!221526 mask!3524))))))

(assert (=> b!490493 (= lt!221529 (select (store (arr!15265 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!490493 (= lt!221526 (array!31756 (store (arr!15265 a!3235) i!1204 k0!2280) (size!15629 a!3235)))))

(assert (=> b!490493 (= lt!221527 (Found!3732 j!176))))

(assert (=> b!490493 (= lt!221527 (seekEntryOrOpen!0 (select (arr!15265 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!490493 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!221528 () Unit!14410)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31755 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14410)

(assert (=> b!490493 (= lt!221528 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!293428 () Bool)

(assert (=> start!44696 (=> (not res!293428) (not e!288328))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44696 (= res!293428 (validMask!0 mask!3524))))

(assert (=> start!44696 e!288328))

(assert (=> start!44696 true))

(declare-fun array_inv!11061 (array!31755) Bool)

(assert (=> start!44696 (array_inv!11061 a!3235)))

(declare-fun b!490494 () Bool)

(declare-fun res!293431 () Bool)

(assert (=> b!490494 (=> (not res!293431) (not e!288328))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490494 (= res!293431 (validKeyInArray!0 (select (arr!15265 a!3235) j!176)))))

(declare-fun b!490495 () Bool)

(declare-fun res!293424 () Bool)

(assert (=> b!490495 (=> (not res!293424) (not e!288328))))

(assert (=> b!490495 (= res!293424 (validKeyInArray!0 k0!2280))))

(declare-fun b!490496 () Bool)

(declare-fun res!293429 () Bool)

(assert (=> b!490496 (=> (not res!293429) (not e!288330))))

(declare-datatypes ((List!9423 0))(
  ( (Nil!9420) (Cons!9419 (h!10281 (_ BitVec 64)) (t!15651 List!9423)) )
))
(declare-fun arrayNoDuplicates!0 (array!31755 (_ BitVec 32) List!9423) Bool)

(assert (=> b!490496 (= res!293429 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9420))))

(assert (= (and start!44696 res!293428) b!490489))

(assert (= (and b!490489 res!293425) b!490494))

(assert (= (and b!490494 res!293431) b!490495))

(assert (= (and b!490495 res!293424) b!490488))

(assert (= (and b!490488 res!293427) b!490492))

(assert (= (and b!490492 res!293430) b!490491))

(assert (= (and b!490491 res!293432) b!490496))

(assert (= (and b!490496 res!293429) b!490493))

(assert (= (and b!490493 (not res!293426)) b!490490))

(declare-fun m!470617 () Bool)

(assert (=> b!490491 m!470617))

(declare-fun m!470619 () Bool)

(assert (=> b!490493 m!470619))

(declare-fun m!470621 () Bool)

(assert (=> b!490493 m!470621))

(declare-fun m!470623 () Bool)

(assert (=> b!490493 m!470623))

(declare-fun m!470625 () Bool)

(assert (=> b!490493 m!470625))

(declare-fun m!470627 () Bool)

(assert (=> b!490493 m!470627))

(declare-fun m!470629 () Bool)

(assert (=> b!490493 m!470629))

(declare-fun m!470631 () Bool)

(assert (=> b!490493 m!470631))

(declare-fun m!470633 () Bool)

(assert (=> b!490493 m!470633))

(assert (=> b!490493 m!470627))

(assert (=> b!490493 m!470625))

(assert (=> b!490493 m!470627))

(declare-fun m!470635 () Bool)

(assert (=> b!490493 m!470635))

(assert (=> b!490493 m!470627))

(declare-fun m!470637 () Bool)

(assert (=> b!490493 m!470637))

(assert (=> b!490493 m!470631))

(declare-fun m!470639 () Bool)

(assert (=> b!490488 m!470639))

(declare-fun m!470641 () Bool)

(assert (=> start!44696 m!470641))

(declare-fun m!470643 () Bool)

(assert (=> start!44696 m!470643))

(declare-fun m!470645 () Bool)

(assert (=> b!490496 m!470645))

(declare-fun m!470647 () Bool)

(assert (=> b!490492 m!470647))

(assert (=> b!490494 m!470627))

(assert (=> b!490494 m!470627))

(declare-fun m!470649 () Bool)

(assert (=> b!490494 m!470649))

(declare-fun m!470651 () Bool)

(assert (=> b!490490 m!470651))

(declare-fun m!470653 () Bool)

(assert (=> b!490490 m!470653))

(declare-fun m!470655 () Bool)

(assert (=> b!490495 m!470655))

(check-sat (not b!490488) (not start!44696) (not b!490496) (not b!490492) (not b!490493) (not b!490495) (not b!490491) (not b!490494) (not b!490490))
(check-sat)
