; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46004 () Bool)

(assert start!46004)

(declare-fun b!509426 () Bool)

(declare-fun res!310333 () Bool)

(declare-fun e!297906 () Bool)

(assert (=> b!509426 (=> (not res!310333) (not e!297906))))

(declare-datatypes ((array!32716 0))(
  ( (array!32717 (arr!15736 (Array (_ BitVec 32) (_ BitVec 64))) (size!16100 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32716)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32716 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509426 (= res!310333 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509427 () Bool)

(declare-fun res!310329 () Bool)

(assert (=> b!509427 (=> (not res!310329) (not e!297906))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509427 (= res!310329 (validKeyInArray!0 (select (arr!15736 a!3235) j!176)))))

(declare-fun res!310332 () Bool)

(assert (=> start!46004 (=> (not res!310332) (not e!297906))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46004 (= res!310332 (validMask!0 mask!3524))))

(assert (=> start!46004 e!297906))

(assert (=> start!46004 true))

(declare-fun array_inv!11595 (array!32716) Bool)

(assert (=> start!46004 (array_inv!11595 a!3235)))

(declare-fun b!509428 () Bool)

(declare-fun res!310325 () Bool)

(assert (=> b!509428 (=> (not res!310325) (not e!297906))))

(assert (=> b!509428 (= res!310325 (validKeyInArray!0 k0!2280))))

(declare-fun e!297904 () Bool)

(declare-fun b!509429 () Bool)

(declare-datatypes ((SeekEntryResult!4159 0))(
  ( (MissingZero!4159 (index!18824 (_ BitVec 32))) (Found!4159 (index!18825 (_ BitVec 32))) (Intermediate!4159 (undefined!4971 Bool) (index!18826 (_ BitVec 32)) (x!47941 (_ BitVec 32))) (Undefined!4159) (MissingVacant!4159 (index!18827 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32716 (_ BitVec 32)) SeekEntryResult!4159)

(assert (=> b!509429 (= e!297904 (= (seekEntryOrOpen!0 (select (arr!15736 a!3235) j!176) a!3235 mask!3524) (Found!4159 j!176)))))

(declare-fun b!509430 () Bool)

(declare-fun res!310328 () Bool)

(declare-fun e!297905 () Bool)

(assert (=> b!509430 (=> (not res!310328) (not e!297905))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32716 (_ BitVec 32)) Bool)

(assert (=> b!509430 (= res!310328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509431 () Bool)

(declare-fun res!310331 () Bool)

(assert (=> b!509431 (=> (not res!310331) (not e!297906))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!509431 (= res!310331 (and (= (size!16100 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16100 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16100 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509432 () Bool)

(declare-fun res!310330 () Bool)

(assert (=> b!509432 (=> (not res!310330) (not e!297905))))

(declare-datatypes ((List!9801 0))(
  ( (Nil!9798) (Cons!9797 (h!10674 (_ BitVec 64)) (t!16021 List!9801)) )
))
(declare-fun arrayNoDuplicates!0 (array!32716 (_ BitVec 32) List!9801) Bool)

(assert (=> b!509432 (= res!310330 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9798))))

(declare-fun b!509433 () Bool)

(assert (=> b!509433 (= e!297906 e!297905)))

(declare-fun res!310326 () Bool)

(assert (=> b!509433 (=> (not res!310326) (not e!297905))))

(declare-fun lt!232760 () SeekEntryResult!4159)

(assert (=> b!509433 (= res!310326 (or (= lt!232760 (MissingZero!4159 i!1204)) (= lt!232760 (MissingVacant!4159 i!1204))))))

(assert (=> b!509433 (= lt!232760 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!509434 () Bool)

(assert (=> b!509434 (= e!297905 (not true))))

(declare-fun lt!232763 () SeekEntryResult!4159)

(declare-fun lt!232762 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32716 (_ BitVec 32)) SeekEntryResult!4159)

(assert (=> b!509434 (= lt!232763 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232762 (select (store (arr!15736 a!3235) i!1204 k0!2280) j!176) (array!32717 (store (arr!15736 a!3235) i!1204 k0!2280) (size!16100 a!3235)) mask!3524))))

(declare-fun lt!232764 () SeekEntryResult!4159)

(declare-fun lt!232765 () (_ BitVec 32))

(assert (=> b!509434 (= lt!232764 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232765 (select (arr!15736 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509434 (= lt!232762 (toIndex!0 (select (store (arr!15736 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!509434 (= lt!232765 (toIndex!0 (select (arr!15736 a!3235) j!176) mask!3524))))

(assert (=> b!509434 e!297904))

(declare-fun res!310327 () Bool)

(assert (=> b!509434 (=> (not res!310327) (not e!297904))))

(assert (=> b!509434 (= res!310327 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15637 0))(
  ( (Unit!15638) )
))
(declare-fun lt!232761 () Unit!15637)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32716 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15637)

(assert (=> b!509434 (= lt!232761 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!46004 res!310332) b!509431))

(assert (= (and b!509431 res!310331) b!509427))

(assert (= (and b!509427 res!310329) b!509428))

(assert (= (and b!509428 res!310325) b!509426))

(assert (= (and b!509426 res!310333) b!509433))

(assert (= (and b!509433 res!310326) b!509430))

(assert (= (and b!509430 res!310328) b!509432))

(assert (= (and b!509432 res!310330) b!509434))

(assert (= (and b!509434 res!310327) b!509429))

(declare-fun m!490573 () Bool)

(assert (=> b!509432 m!490573))

(declare-fun m!490575 () Bool)

(assert (=> b!509426 m!490575))

(declare-fun m!490577 () Bool)

(assert (=> start!46004 m!490577))

(declare-fun m!490579 () Bool)

(assert (=> start!46004 m!490579))

(declare-fun m!490581 () Bool)

(assert (=> b!509428 m!490581))

(declare-fun m!490583 () Bool)

(assert (=> b!509430 m!490583))

(declare-fun m!490585 () Bool)

(assert (=> b!509433 m!490585))

(declare-fun m!490587 () Bool)

(assert (=> b!509427 m!490587))

(assert (=> b!509427 m!490587))

(declare-fun m!490589 () Bool)

(assert (=> b!509427 m!490589))

(assert (=> b!509434 m!490587))

(declare-fun m!490591 () Bool)

(assert (=> b!509434 m!490591))

(declare-fun m!490593 () Bool)

(assert (=> b!509434 m!490593))

(declare-fun m!490595 () Bool)

(assert (=> b!509434 m!490595))

(declare-fun m!490597 () Bool)

(assert (=> b!509434 m!490597))

(declare-fun m!490599 () Bool)

(assert (=> b!509434 m!490599))

(assert (=> b!509434 m!490595))

(assert (=> b!509434 m!490587))

(declare-fun m!490601 () Bool)

(assert (=> b!509434 m!490601))

(assert (=> b!509434 m!490587))

(declare-fun m!490603 () Bool)

(assert (=> b!509434 m!490603))

(assert (=> b!509434 m!490595))

(declare-fun m!490605 () Bool)

(assert (=> b!509434 m!490605))

(assert (=> b!509429 m!490587))

(assert (=> b!509429 m!490587))

(declare-fun m!490607 () Bool)

(assert (=> b!509429 m!490607))

(check-sat (not b!509427) (not b!509434) (not b!509429) (not b!509426) (not b!509432) (not start!46004) (not b!509433) (not b!509430) (not b!509428))
(check-sat)
