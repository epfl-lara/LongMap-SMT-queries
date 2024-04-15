; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45024 () Bool)

(assert start!45024)

(declare-fun b!493915 () Bool)

(declare-fun e!289909 () Bool)

(assert (=> b!493915 (= e!289909 true)))

(declare-datatypes ((SeekEntryResult!3838 0))(
  ( (MissingZero!3838 (index!17531 (_ BitVec 32))) (Found!3838 (index!17532 (_ BitVec 32))) (Intermediate!3838 (undefined!4650 Bool) (index!17533 (_ BitVec 32)) (x!46615 (_ BitVec 32))) (Undefined!3838) (MissingVacant!3838 (index!17534 (_ BitVec 32))) )
))
(declare-fun lt!223388 () SeekEntryResult!3838)

(assert (=> b!493915 (= lt!223388 Undefined!3838)))

(declare-fun b!493916 () Bool)

(declare-fun res!296628 () Bool)

(declare-fun e!289910 () Bool)

(assert (=> b!493916 (=> (not res!296628) (not e!289910))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493916 (= res!296628 (validKeyInArray!0 k0!2280))))

(declare-fun b!493917 () Bool)

(declare-fun res!296633 () Bool)

(assert (=> b!493917 (=> (not res!296633) (not e!289910))))

(declare-datatypes ((array!31979 0))(
  ( (array!31980 (arr!15374 (Array (_ BitVec 32) (_ BitVec 64))) (size!15739 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31979)

(declare-fun arrayContainsKey!0 (array!31979 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493917 (= res!296633 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493918 () Bool)

(declare-fun res!296627 () Bool)

(declare-fun e!289911 () Bool)

(assert (=> b!493918 (=> (not res!296627) (not e!289911))))

(declare-datatypes ((List!9571 0))(
  ( (Nil!9568) (Cons!9567 (h!10435 (_ BitVec 64)) (t!15790 List!9571)) )
))
(declare-fun arrayNoDuplicates!0 (array!31979 (_ BitVec 32) List!9571) Bool)

(assert (=> b!493918 (= res!296627 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9568))))

(declare-fun b!493919 () Bool)

(assert (=> b!493919 (= e!289910 e!289911)))

(declare-fun res!296635 () Bool)

(assert (=> b!493919 (=> (not res!296635) (not e!289911))))

(declare-fun lt!223385 () SeekEntryResult!3838)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!493919 (= res!296635 (or (= lt!223385 (MissingZero!3838 i!1204)) (= lt!223385 (MissingVacant!3838 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31979 (_ BitVec 32)) SeekEntryResult!3838)

(assert (=> b!493919 (= lt!223385 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!296631 () Bool)

(assert (=> start!45024 (=> (not res!296631) (not e!289910))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45024 (= res!296631 (validMask!0 mask!3524))))

(assert (=> start!45024 e!289910))

(assert (=> start!45024 true))

(declare-fun array_inv!11257 (array!31979) Bool)

(assert (=> start!45024 (array_inv!11257 a!3235)))

(declare-fun b!493920 () Bool)

(declare-fun res!296629 () Bool)

(assert (=> b!493920 (=> (not res!296629) (not e!289910))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!493920 (= res!296629 (validKeyInArray!0 (select (arr!15374 a!3235) j!176)))))

(declare-fun b!493921 () Bool)

(assert (=> b!493921 (= e!289911 (not e!289909))))

(declare-fun res!296636 () Bool)

(assert (=> b!493921 (=> res!296636 e!289909)))

(declare-fun lt!223387 () SeekEntryResult!3838)

(declare-fun lt!223386 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31979 (_ BitVec 32)) SeekEntryResult!3838)

(assert (=> b!493921 (= res!296636 (= lt!223387 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223386 (select (store (arr!15374 a!3235) i!1204 k0!2280) j!176) (array!31980 (store (arr!15374 a!3235) i!1204 k0!2280) (size!15739 a!3235)) mask!3524)))))

(declare-fun lt!223389 () (_ BitVec 32))

(assert (=> b!493921 (= lt!223387 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223389 (select (arr!15374 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493921 (= lt!223386 (toIndex!0 (select (store (arr!15374 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!493921 (= lt!223389 (toIndex!0 (select (arr!15374 a!3235) j!176) mask!3524))))

(assert (=> b!493921 (= lt!223388 (Found!3838 j!176))))

(assert (=> b!493921 (= lt!223388 (seekEntryOrOpen!0 (select (arr!15374 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31979 (_ BitVec 32)) Bool)

(assert (=> b!493921 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14608 0))(
  ( (Unit!14609) )
))
(declare-fun lt!223390 () Unit!14608)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31979 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14608)

(assert (=> b!493921 (= lt!223390 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493922 () Bool)

(declare-fun res!296632 () Bool)

(assert (=> b!493922 (=> res!296632 e!289909)))

(get-info :version)

(assert (=> b!493922 (= res!296632 (or (not ((_ is Intermediate!3838) lt!223387)) (not (undefined!4650 lt!223387))))))

(declare-fun b!493923 () Bool)

(declare-fun res!296630 () Bool)

(assert (=> b!493923 (=> (not res!296630) (not e!289911))))

(assert (=> b!493923 (= res!296630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493924 () Bool)

(declare-fun res!296634 () Bool)

(assert (=> b!493924 (=> (not res!296634) (not e!289910))))

(assert (=> b!493924 (= res!296634 (and (= (size!15739 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15739 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15739 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45024 res!296631) b!493924))

(assert (= (and b!493924 res!296634) b!493920))

(assert (= (and b!493920 res!296629) b!493916))

(assert (= (and b!493916 res!296628) b!493917))

(assert (= (and b!493917 res!296633) b!493919))

(assert (= (and b!493919 res!296635) b!493923))

(assert (= (and b!493923 res!296630) b!493918))

(assert (= (and b!493918 res!296627) b!493921))

(assert (= (and b!493921 (not res!296636)) b!493922))

(assert (= (and b!493922 (not res!296632)) b!493915))

(declare-fun m!474427 () Bool)

(assert (=> b!493919 m!474427))

(declare-fun m!474429 () Bool)

(assert (=> start!45024 m!474429))

(declare-fun m!474431 () Bool)

(assert (=> start!45024 m!474431))

(declare-fun m!474433 () Bool)

(assert (=> b!493916 m!474433))

(declare-fun m!474435 () Bool)

(assert (=> b!493918 m!474435))

(declare-fun m!474437 () Bool)

(assert (=> b!493923 m!474437))

(declare-fun m!474439 () Bool)

(assert (=> b!493921 m!474439))

(declare-fun m!474441 () Bool)

(assert (=> b!493921 m!474441))

(declare-fun m!474443 () Bool)

(assert (=> b!493921 m!474443))

(declare-fun m!474445 () Bool)

(assert (=> b!493921 m!474445))

(assert (=> b!493921 m!474439))

(declare-fun m!474447 () Bool)

(assert (=> b!493921 m!474447))

(declare-fun m!474449 () Bool)

(assert (=> b!493921 m!474449))

(assert (=> b!493921 m!474447))

(declare-fun m!474451 () Bool)

(assert (=> b!493921 m!474451))

(assert (=> b!493921 m!474447))

(declare-fun m!474453 () Bool)

(assert (=> b!493921 m!474453))

(assert (=> b!493921 m!474439))

(declare-fun m!474455 () Bool)

(assert (=> b!493921 m!474455))

(assert (=> b!493921 m!474447))

(declare-fun m!474457 () Bool)

(assert (=> b!493921 m!474457))

(assert (=> b!493920 m!474447))

(assert (=> b!493920 m!474447))

(declare-fun m!474459 () Bool)

(assert (=> b!493920 m!474459))

(declare-fun m!474461 () Bool)

(assert (=> b!493917 m!474461))

(check-sat (not b!493921) (not b!493916) (not start!45024) (not b!493923) (not b!493917) (not b!493919) (not b!493918) (not b!493920))
(check-sat)
