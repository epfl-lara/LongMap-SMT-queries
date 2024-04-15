; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46104 () Bool)

(assert start!46104)

(declare-fun e!298382 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32825 0))(
  ( (array!32826 (arr!15791 (Array (_ BitVec 32) (_ BitVec 64))) (size!16156 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32825)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!510593 () Bool)

(declare-datatypes ((SeekEntryResult!4255 0))(
  ( (MissingZero!4255 (index!19208 (_ BitVec 32))) (Found!4255 (index!19209 (_ BitVec 32))) (Intermediate!4255 (undefined!5067 Bool) (index!19210 (_ BitVec 32)) (x!48171 (_ BitVec 32))) (Undefined!4255) (MissingVacant!4255 (index!19211 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32825 (_ BitVec 32)) SeekEntryResult!4255)

(assert (=> b!510593 (= e!298382 (= (seekEntryOrOpen!0 (select (arr!15791 a!3235) j!176) a!3235 mask!3524) (Found!4255 j!176)))))

(declare-fun b!510594 () Bool)

(declare-fun res!311584 () Bool)

(declare-fun e!298380 () Bool)

(assert (=> b!510594 (=> (not res!311584) (not e!298380))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32825 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510594 (= res!311584 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510595 () Bool)

(declare-fun res!311585 () Bool)

(assert (=> b!510595 (=> (not res!311585) (not e!298380))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!510595 (= res!311585 (and (= (size!16156 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16156 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16156 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510596 () Bool)

(declare-fun res!311580 () Bool)

(assert (=> b!510596 (=> (not res!311580) (not e!298380))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510596 (= res!311580 (validKeyInArray!0 k0!2280))))

(declare-fun b!510597 () Bool)

(declare-fun res!311586 () Bool)

(declare-fun e!298381 () Bool)

(assert (=> b!510597 (=> (not res!311586) (not e!298381))))

(declare-datatypes ((List!9988 0))(
  ( (Nil!9985) (Cons!9984 (h!10861 (_ BitVec 64)) (t!16207 List!9988)) )
))
(declare-fun arrayNoDuplicates!0 (array!32825 (_ BitVec 32) List!9988) Bool)

(assert (=> b!510597 (= res!311586 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9985))))

(declare-fun b!510598 () Bool)

(declare-fun res!311581 () Bool)

(assert (=> b!510598 (=> (not res!311581) (not e!298380))))

(assert (=> b!510598 (= res!311581 (validKeyInArray!0 (select (arr!15791 a!3235) j!176)))))

(declare-fun b!510599 () Bool)

(assert (=> b!510599 (= e!298381 (not true))))

(declare-fun lt!233433 () (_ BitVec 32))

(declare-fun lt!233435 () SeekEntryResult!4255)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32825 (_ BitVec 32)) SeekEntryResult!4255)

(assert (=> b!510599 (= lt!233435 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233433 (select (store (arr!15791 a!3235) i!1204 k0!2280) j!176) (array!32826 (store (arr!15791 a!3235) i!1204 k0!2280) (size!16156 a!3235)) mask!3524))))

(declare-fun lt!233437 () (_ BitVec 32))

(declare-fun lt!233434 () SeekEntryResult!4255)

(assert (=> b!510599 (= lt!233434 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233437 (select (arr!15791 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510599 (= lt!233433 (toIndex!0 (select (store (arr!15791 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!510599 (= lt!233437 (toIndex!0 (select (arr!15791 a!3235) j!176) mask!3524))))

(assert (=> b!510599 e!298382))

(declare-fun res!311583 () Bool)

(assert (=> b!510599 (=> (not res!311583) (not e!298382))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32825 (_ BitVec 32)) Bool)

(assert (=> b!510599 (= res!311583 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15754 0))(
  ( (Unit!15755) )
))
(declare-fun lt!233436 () Unit!15754)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32825 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15754)

(assert (=> b!510599 (= lt!233436 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510600 () Bool)

(declare-fun res!311588 () Bool)

(assert (=> b!510600 (=> (not res!311588) (not e!298381))))

(assert (=> b!510600 (= res!311588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510601 () Bool)

(assert (=> b!510601 (= e!298380 e!298381)))

(declare-fun res!311587 () Bool)

(assert (=> b!510601 (=> (not res!311587) (not e!298381))))

(declare-fun lt!233432 () SeekEntryResult!4255)

(assert (=> b!510601 (= res!311587 (or (= lt!233432 (MissingZero!4255 i!1204)) (= lt!233432 (MissingVacant!4255 i!1204))))))

(assert (=> b!510601 (= lt!233432 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!311582 () Bool)

(assert (=> start!46104 (=> (not res!311582) (not e!298380))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46104 (= res!311582 (validMask!0 mask!3524))))

(assert (=> start!46104 e!298380))

(assert (=> start!46104 true))

(declare-fun array_inv!11674 (array!32825) Bool)

(assert (=> start!46104 (array_inv!11674 a!3235)))

(assert (= (and start!46104 res!311582) b!510595))

(assert (= (and b!510595 res!311585) b!510598))

(assert (= (and b!510598 res!311581) b!510596))

(assert (= (and b!510596 res!311580) b!510594))

(assert (= (and b!510594 res!311584) b!510601))

(assert (= (and b!510601 res!311587) b!510600))

(assert (= (and b!510600 res!311588) b!510597))

(assert (= (and b!510597 res!311586) b!510599))

(assert (= (and b!510599 res!311583) b!510593))

(declare-fun m!491569 () Bool)

(assert (=> b!510598 m!491569))

(assert (=> b!510598 m!491569))

(declare-fun m!491571 () Bool)

(assert (=> b!510598 m!491571))

(declare-fun m!491573 () Bool)

(assert (=> b!510597 m!491573))

(declare-fun m!491575 () Bool)

(assert (=> b!510594 m!491575))

(assert (=> b!510599 m!491569))

(declare-fun m!491577 () Bool)

(assert (=> b!510599 m!491577))

(declare-fun m!491579 () Bool)

(assert (=> b!510599 m!491579))

(declare-fun m!491581 () Bool)

(assert (=> b!510599 m!491581))

(declare-fun m!491583 () Bool)

(assert (=> b!510599 m!491583))

(assert (=> b!510599 m!491569))

(declare-fun m!491585 () Bool)

(assert (=> b!510599 m!491585))

(assert (=> b!510599 m!491569))

(declare-fun m!491587 () Bool)

(assert (=> b!510599 m!491587))

(assert (=> b!510599 m!491583))

(declare-fun m!491589 () Bool)

(assert (=> b!510599 m!491589))

(assert (=> b!510599 m!491583))

(declare-fun m!491591 () Bool)

(assert (=> b!510599 m!491591))

(declare-fun m!491593 () Bool)

(assert (=> b!510601 m!491593))

(declare-fun m!491595 () Bool)

(assert (=> start!46104 m!491595))

(declare-fun m!491597 () Bool)

(assert (=> start!46104 m!491597))

(assert (=> b!510593 m!491569))

(assert (=> b!510593 m!491569))

(declare-fun m!491599 () Bool)

(assert (=> b!510593 m!491599))

(declare-fun m!491601 () Bool)

(assert (=> b!510596 m!491601))

(declare-fun m!491603 () Bool)

(assert (=> b!510600 m!491603))

(check-sat (not b!510599) (not b!510593) (not b!510597) (not b!510600) (not start!46104) (not b!510594) (not b!510598) (not b!510596) (not b!510601))
(check-sat)
