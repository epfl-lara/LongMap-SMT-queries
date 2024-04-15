; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46212 () Bool)

(assert start!46212)

(declare-fun b!511579 () Bool)

(declare-fun res!312384 () Bool)

(declare-fun e!298857 () Bool)

(assert (=> b!511579 (=> (not res!312384) (not e!298857))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32876 0))(
  ( (array!32877 (arr!15815 (Array (_ BitVec 32) (_ BitVec 64))) (size!16180 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32876)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!511579 (= res!312384 (and (= (size!16180 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16180 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16180 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!511580 () Bool)

(declare-fun res!312385 () Bool)

(assert (=> b!511580 (=> (not res!312385) (not e!298857))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32876 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511580 (= res!312385 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!312387 () Bool)

(assert (=> start!46212 (=> (not res!312387) (not e!298857))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46212 (= res!312387 (validMask!0 mask!3524))))

(assert (=> start!46212 e!298857))

(assert (=> start!46212 true))

(declare-fun array_inv!11698 (array!32876) Bool)

(assert (=> start!46212 (array_inv!11698 a!3235)))

(declare-fun b!511581 () Bool)

(declare-fun res!312390 () Bool)

(assert (=> b!511581 (=> (not res!312390) (not e!298857))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511581 (= res!312390 (validKeyInArray!0 (select (arr!15815 a!3235) j!176)))))

(declare-fun b!511582 () Bool)

(declare-fun res!312391 () Bool)

(declare-fun e!298855 () Bool)

(assert (=> b!511582 (=> (not res!312391) (not e!298855))))

(declare-datatypes ((List!10012 0))(
  ( (Nil!10009) (Cons!10008 (h!10888 (_ BitVec 64)) (t!16231 List!10012)) )
))
(declare-fun arrayNoDuplicates!0 (array!32876 (_ BitVec 32) List!10012) Bool)

(assert (=> b!511582 (= res!312391 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10009))))

(declare-fun b!511583 () Bool)

(declare-fun e!298854 () Bool)

(assert (=> b!511583 (= e!298855 (not e!298854))))

(declare-fun res!312388 () Bool)

(assert (=> b!511583 (=> res!312388 e!298854)))

(declare-fun lt!233995 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4279 0))(
  ( (MissingZero!4279 (index!19304 (_ BitVec 32))) (Found!4279 (index!19305 (_ BitVec 32))) (Intermediate!4279 (undefined!5091 Bool) (index!19306 (_ BitVec 32)) (x!48265 (_ BitVec 32))) (Undefined!4279) (MissingVacant!4279 (index!19307 (_ BitVec 32))) )
))
(declare-fun lt!233994 () SeekEntryResult!4279)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32876 (_ BitVec 32)) SeekEntryResult!4279)

(assert (=> b!511583 (= res!312388 (= lt!233994 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233995 (select (store (arr!15815 a!3235) i!1204 k0!2280) j!176) (array!32877 (store (arr!15815 a!3235) i!1204 k0!2280) (size!16180 a!3235)) mask!3524)))))

(declare-fun lt!233997 () (_ BitVec 32))

(assert (=> b!511583 (= lt!233994 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233997 (select (arr!15815 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511583 (= lt!233995 (toIndex!0 (select (store (arr!15815 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!511583 (= lt!233997 (toIndex!0 (select (arr!15815 a!3235) j!176) mask!3524))))

(declare-fun lt!233998 () SeekEntryResult!4279)

(assert (=> b!511583 (= lt!233998 (Found!4279 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32876 (_ BitVec 32)) SeekEntryResult!4279)

(assert (=> b!511583 (= lt!233998 (seekEntryOrOpen!0 (select (arr!15815 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32876 (_ BitVec 32)) Bool)

(assert (=> b!511583 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15802 0))(
  ( (Unit!15803) )
))
(declare-fun lt!233996 () Unit!15802)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32876 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15802)

(assert (=> b!511583 (= lt!233996 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!511584 () Bool)

(assert (=> b!511584 (= e!298854 true)))

(assert (=> b!511584 (= lt!233998 Undefined!4279)))

(declare-fun b!511585 () Bool)

(declare-fun res!312383 () Bool)

(assert (=> b!511585 (=> res!312383 e!298854)))

(get-info :version)

(assert (=> b!511585 (= res!312383 (or (not ((_ is Intermediate!4279) lt!233994)) (not (undefined!5091 lt!233994))))))

(declare-fun b!511586 () Bool)

(declare-fun res!312389 () Bool)

(assert (=> b!511586 (=> (not res!312389) (not e!298857))))

(assert (=> b!511586 (= res!312389 (validKeyInArray!0 k0!2280))))

(declare-fun b!511587 () Bool)

(declare-fun res!312392 () Bool)

(assert (=> b!511587 (=> (not res!312392) (not e!298855))))

(assert (=> b!511587 (= res!312392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!511588 () Bool)

(assert (=> b!511588 (= e!298857 e!298855)))

(declare-fun res!312386 () Bool)

(assert (=> b!511588 (=> (not res!312386) (not e!298855))))

(declare-fun lt!233993 () SeekEntryResult!4279)

(assert (=> b!511588 (= res!312386 (or (= lt!233993 (MissingZero!4279 i!1204)) (= lt!233993 (MissingVacant!4279 i!1204))))))

(assert (=> b!511588 (= lt!233993 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!46212 res!312387) b!511579))

(assert (= (and b!511579 res!312384) b!511581))

(assert (= (and b!511581 res!312390) b!511586))

(assert (= (and b!511586 res!312389) b!511580))

(assert (= (and b!511580 res!312385) b!511588))

(assert (= (and b!511588 res!312386) b!511587))

(assert (= (and b!511587 res!312392) b!511582))

(assert (= (and b!511582 res!312391) b!511583))

(assert (= (and b!511583 (not res!312388)) b!511585))

(assert (= (and b!511585 (not res!312383)) b!511584))

(declare-fun m!492637 () Bool)

(assert (=> start!46212 m!492637))

(declare-fun m!492639 () Bool)

(assert (=> start!46212 m!492639))

(declare-fun m!492641 () Bool)

(assert (=> b!511588 m!492641))

(declare-fun m!492643 () Bool)

(assert (=> b!511583 m!492643))

(declare-fun m!492645 () Bool)

(assert (=> b!511583 m!492645))

(declare-fun m!492647 () Bool)

(assert (=> b!511583 m!492647))

(declare-fun m!492649 () Bool)

(assert (=> b!511583 m!492649))

(assert (=> b!511583 m!492643))

(declare-fun m!492651 () Bool)

(assert (=> b!511583 m!492651))

(declare-fun m!492653 () Bool)

(assert (=> b!511583 m!492653))

(assert (=> b!511583 m!492651))

(declare-fun m!492655 () Bool)

(assert (=> b!511583 m!492655))

(assert (=> b!511583 m!492651))

(declare-fun m!492657 () Bool)

(assert (=> b!511583 m!492657))

(assert (=> b!511583 m!492651))

(declare-fun m!492659 () Bool)

(assert (=> b!511583 m!492659))

(assert (=> b!511583 m!492643))

(declare-fun m!492661 () Bool)

(assert (=> b!511583 m!492661))

(declare-fun m!492663 () Bool)

(assert (=> b!511586 m!492663))

(declare-fun m!492665 () Bool)

(assert (=> b!511580 m!492665))

(assert (=> b!511581 m!492651))

(assert (=> b!511581 m!492651))

(declare-fun m!492667 () Bool)

(assert (=> b!511581 m!492667))

(declare-fun m!492669 () Bool)

(assert (=> b!511582 m!492669))

(declare-fun m!492671 () Bool)

(assert (=> b!511587 m!492671))

(check-sat (not b!511586) (not b!511581) (not b!511588) (not b!511582) (not b!511580) (not b!511583) (not b!511587) (not start!46212))
(check-sat)
