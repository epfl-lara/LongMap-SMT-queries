; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44774 () Bool)

(assert start!44774)

(declare-fun b!491626 () Bool)

(declare-fun e!288828 () Bool)

(declare-fun e!288830 () Bool)

(assert (=> b!491626 (= e!288828 e!288830)))

(declare-fun res!294618 () Bool)

(assert (=> b!491626 (=> (not res!294618) (not e!288830))))

(declare-datatypes ((SeekEntryResult!3727 0))(
  ( (MissingZero!3727 (index!17087 (_ BitVec 32))) (Found!3727 (index!17088 (_ BitVec 32))) (Intermediate!3727 (undefined!4539 Bool) (index!17089 (_ BitVec 32)) (x!46318 (_ BitVec 32))) (Undefined!3727) (MissingVacant!3727 (index!17090 (_ BitVec 32))) )
))
(declare-fun lt!222332 () SeekEntryResult!3727)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!491626 (= res!294618 (or (= lt!222332 (MissingZero!3727 i!1204)) (= lt!222332 (MissingVacant!3727 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31834 0))(
  ( (array!31835 (arr!15304 (Array (_ BitVec 32) (_ BitVec 64))) (size!15668 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31834)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31834 (_ BitVec 32)) SeekEntryResult!3727)

(assert (=> b!491626 (= lt!222332 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!294625 () Bool)

(assert (=> start!44774 (=> (not res!294625) (not e!288828))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44774 (= res!294625 (validMask!0 mask!3524))))

(assert (=> start!44774 e!288828))

(assert (=> start!44774 true))

(declare-fun array_inv!11163 (array!31834) Bool)

(assert (=> start!44774 (array_inv!11163 a!3235)))

(declare-fun b!491627 () Bool)

(declare-fun e!288829 () Bool)

(declare-fun e!288831 () Bool)

(assert (=> b!491627 (= e!288829 e!288831)))

(declare-fun res!294616 () Bool)

(assert (=> b!491627 (=> res!294616 e!288831)))

(assert (=> b!491627 (= res!294616 (bvslt mask!3524 #b00000000000000000000000000000000))))

(declare-fun lt!222329 () array!31834)

(declare-fun lt!222333 () (_ BitVec 64))

(declare-fun lt!222330 () SeekEntryResult!3727)

(assert (=> b!491627 (= lt!222330 (seekEntryOrOpen!0 lt!222333 lt!222329 mask!3524))))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((Unit!14461 0))(
  ( (Unit!14462) )
))
(declare-fun lt!222334 () Unit!14461)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31834 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14461)

(assert (=> b!491627 (= lt!222334 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!491628 () Bool)

(declare-fun res!294623 () Bool)

(assert (=> b!491628 (=> (not res!294623) (not e!288828))))

(declare-fun arrayContainsKey!0 (array!31834 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491628 (= res!294623 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491629 () Bool)

(assert (=> b!491629 (= e!288830 (not e!288829))))

(declare-fun res!294619 () Bool)

(assert (=> b!491629 (=> res!294619 e!288829)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31834 (_ BitVec 32)) SeekEntryResult!3727)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491629 (= res!294619 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15304 a!3235) j!176) mask!3524) (select (arr!15304 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!222333 mask!3524) lt!222333 lt!222329 mask!3524))))))

(assert (=> b!491629 (= lt!222333 (select (store (arr!15304 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!491629 (= lt!222329 (array!31835 (store (arr!15304 a!3235) i!1204 k0!2280) (size!15668 a!3235)))))

(assert (=> b!491629 (= lt!222330 (Found!3727 j!176))))

(assert (=> b!491629 (= lt!222330 (seekEntryOrOpen!0 (select (arr!15304 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31834 (_ BitVec 32)) Bool)

(assert (=> b!491629 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!222331 () Unit!14461)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31834 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14461)

(assert (=> b!491629 (= lt!222331 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491630 () Bool)

(declare-fun res!294621 () Bool)

(assert (=> b!491630 (=> (not res!294621) (not e!288828))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491630 (= res!294621 (validKeyInArray!0 k0!2280))))

(declare-fun b!491631 () Bool)

(declare-fun res!294622 () Bool)

(assert (=> b!491631 (=> (not res!294622) (not e!288830))))

(declare-datatypes ((List!9369 0))(
  ( (Nil!9366) (Cons!9365 (h!10227 (_ BitVec 64)) (t!15589 List!9369)) )
))
(declare-fun arrayNoDuplicates!0 (array!31834 (_ BitVec 32) List!9369) Bool)

(assert (=> b!491631 (= res!294622 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9366))))

(declare-fun b!491632 () Bool)

(declare-fun res!294617 () Bool)

(assert (=> b!491632 (=> (not res!294617) (not e!288830))))

(assert (=> b!491632 (= res!294617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491633 () Bool)

(declare-fun res!294624 () Bool)

(assert (=> b!491633 (=> (not res!294624) (not e!288828))))

(assert (=> b!491633 (= res!294624 (and (= (size!15668 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15668 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15668 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491634 () Bool)

(declare-fun res!294620 () Bool)

(assert (=> b!491634 (=> (not res!294620) (not e!288828))))

(assert (=> b!491634 (= res!294620 (validKeyInArray!0 (select (arr!15304 a!3235) j!176)))))

(declare-fun b!491635 () Bool)

(assert (=> b!491635 (= e!288831 (validKeyInArray!0 lt!222333))))

(assert (= (and start!44774 res!294625) b!491633))

(assert (= (and b!491633 res!294624) b!491634))

(assert (= (and b!491634 res!294620) b!491630))

(assert (= (and b!491630 res!294621) b!491628))

(assert (= (and b!491628 res!294623) b!491626))

(assert (= (and b!491626 res!294618) b!491632))

(assert (= (and b!491632 res!294617) b!491631))

(assert (= (and b!491631 res!294622) b!491629))

(assert (= (and b!491629 (not res!294619)) b!491627))

(assert (= (and b!491627 (not res!294616)) b!491635))

(declare-fun m!472567 () Bool)

(assert (=> b!491629 m!472567))

(declare-fun m!472569 () Bool)

(assert (=> b!491629 m!472569))

(declare-fun m!472571 () Bool)

(assert (=> b!491629 m!472571))

(declare-fun m!472573 () Bool)

(assert (=> b!491629 m!472573))

(declare-fun m!472575 () Bool)

(assert (=> b!491629 m!472575))

(assert (=> b!491629 m!472573))

(assert (=> b!491629 m!472571))

(assert (=> b!491629 m!472573))

(declare-fun m!472577 () Bool)

(assert (=> b!491629 m!472577))

(assert (=> b!491629 m!472573))

(declare-fun m!472579 () Bool)

(assert (=> b!491629 m!472579))

(declare-fun m!472581 () Bool)

(assert (=> b!491629 m!472581))

(declare-fun m!472583 () Bool)

(assert (=> b!491629 m!472583))

(assert (=> b!491629 m!472581))

(declare-fun m!472585 () Bool)

(assert (=> b!491629 m!472585))

(declare-fun m!472587 () Bool)

(assert (=> b!491626 m!472587))

(declare-fun m!472589 () Bool)

(assert (=> b!491628 m!472589))

(declare-fun m!472591 () Bool)

(assert (=> b!491627 m!472591))

(declare-fun m!472593 () Bool)

(assert (=> b!491627 m!472593))

(declare-fun m!472595 () Bool)

(assert (=> b!491631 m!472595))

(declare-fun m!472597 () Bool)

(assert (=> b!491635 m!472597))

(declare-fun m!472599 () Bool)

(assert (=> b!491632 m!472599))

(declare-fun m!472601 () Bool)

(assert (=> start!44774 m!472601))

(declare-fun m!472603 () Bool)

(assert (=> start!44774 m!472603))

(assert (=> b!491634 m!472573))

(assert (=> b!491634 m!472573))

(declare-fun m!472605 () Bool)

(assert (=> b!491634 m!472605))

(declare-fun m!472607 () Bool)

(assert (=> b!491630 m!472607))

(check-sat (not b!491628) (not b!491626) (not b!491630) (not b!491629) (not b!491627) (not b!491632) (not b!491631) (not b!491634) (not b!491635) (not start!44774))
(check-sat)
