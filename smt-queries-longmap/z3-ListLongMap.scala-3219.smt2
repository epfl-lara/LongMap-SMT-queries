; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45062 () Bool)

(assert start!45062)

(declare-fun b!494576 () Bool)

(declare-fun e!290241 () Bool)

(assert (=> b!494576 (= e!290241 true)))

(declare-datatypes ((SeekEntryResult!3855 0))(
  ( (MissingZero!3855 (index!17599 (_ BitVec 32))) (Found!3855 (index!17600 (_ BitVec 32))) (Intermediate!3855 (undefined!4667 Bool) (index!17601 (_ BitVec 32)) (x!46669 (_ BitVec 32))) (Undefined!3855) (MissingVacant!3855 (index!17602 (_ BitVec 32))) )
))
(declare-fun lt!223857 () SeekEntryResult!3855)

(assert (=> b!494576 (= lt!223857 Undefined!3855)))

(declare-fun b!494577 () Bool)

(declare-fun e!290239 () Bool)

(declare-fun e!290238 () Bool)

(assert (=> b!494577 (= e!290239 e!290238)))

(declare-fun res!297155 () Bool)

(assert (=> b!494577 (=> (not res!297155) (not e!290238))))

(declare-fun lt!223858 () SeekEntryResult!3855)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!494577 (= res!297155 (or (= lt!223858 (MissingZero!3855 i!1204)) (= lt!223858 (MissingVacant!3855 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32007 0))(
  ( (array!32008 (arr!15388 (Array (_ BitVec 32) (_ BitVec 64))) (size!15752 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32007)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32007 (_ BitVec 32)) SeekEntryResult!3855)

(assert (=> b!494577 (= lt!223858 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!494578 () Bool)

(declare-fun res!297147 () Bool)

(assert (=> b!494578 (=> (not res!297147) (not e!290238))))

(declare-datatypes ((List!9546 0))(
  ( (Nil!9543) (Cons!9542 (h!10410 (_ BitVec 64)) (t!15774 List!9546)) )
))
(declare-fun arrayNoDuplicates!0 (array!32007 (_ BitVec 32) List!9546) Bool)

(assert (=> b!494578 (= res!297147 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9543))))

(declare-fun b!494579 () Bool)

(declare-fun res!297152 () Bool)

(assert (=> b!494579 (=> (not res!297152) (not e!290239))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494579 (= res!297152 (validKeyInArray!0 (select (arr!15388 a!3235) j!176)))))

(declare-fun b!494580 () Bool)

(declare-fun res!297153 () Bool)

(assert (=> b!494580 (=> (not res!297153) (not e!290239))))

(assert (=> b!494580 (= res!297153 (and (= (size!15752 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15752 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15752 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494581 () Bool)

(declare-fun res!297154 () Bool)

(assert (=> b!494581 (=> (not res!297154) (not e!290239))))

(assert (=> b!494581 (= res!297154 (validKeyInArray!0 k0!2280))))

(declare-fun b!494582 () Bool)

(assert (=> b!494582 (= e!290238 (not e!290241))))

(declare-fun res!297149 () Bool)

(assert (=> b!494582 (=> res!297149 e!290241)))

(declare-fun lt!223855 () SeekEntryResult!3855)

(declare-fun lt!223853 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32007 (_ BitVec 32)) SeekEntryResult!3855)

(assert (=> b!494582 (= res!297149 (= lt!223855 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223853 (select (store (arr!15388 a!3235) i!1204 k0!2280) j!176) (array!32008 (store (arr!15388 a!3235) i!1204 k0!2280) (size!15752 a!3235)) mask!3524)))))

(declare-fun lt!223854 () (_ BitVec 32))

(assert (=> b!494582 (= lt!223855 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223854 (select (arr!15388 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494582 (= lt!223853 (toIndex!0 (select (store (arr!15388 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!494582 (= lt!223854 (toIndex!0 (select (arr!15388 a!3235) j!176) mask!3524))))

(assert (=> b!494582 (= lt!223857 (Found!3855 j!176))))

(assert (=> b!494582 (= lt!223857 (seekEntryOrOpen!0 (select (arr!15388 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32007 (_ BitVec 32)) Bool)

(assert (=> b!494582 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14656 0))(
  ( (Unit!14657) )
))
(declare-fun lt!223856 () Unit!14656)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32007 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14656)

(assert (=> b!494582 (= lt!223856 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494583 () Bool)

(declare-fun res!297148 () Bool)

(assert (=> b!494583 (=> (not res!297148) (not e!290238))))

(assert (=> b!494583 (= res!297148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!297150 () Bool)

(assert (=> start!45062 (=> (not res!297150) (not e!290239))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45062 (= res!297150 (validMask!0 mask!3524))))

(assert (=> start!45062 e!290239))

(assert (=> start!45062 true))

(declare-fun array_inv!11184 (array!32007) Bool)

(assert (=> start!45062 (array_inv!11184 a!3235)))

(declare-fun b!494584 () Bool)

(declare-fun res!297146 () Bool)

(assert (=> b!494584 (=> res!297146 e!290241)))

(get-info :version)

(assert (=> b!494584 (= res!297146 (or (not ((_ is Intermediate!3855) lt!223855)) (not (undefined!4667 lt!223855))))))

(declare-fun b!494585 () Bool)

(declare-fun res!297151 () Bool)

(assert (=> b!494585 (=> (not res!297151) (not e!290239))))

(declare-fun arrayContainsKey!0 (array!32007 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494585 (= res!297151 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45062 res!297150) b!494580))

(assert (= (and b!494580 res!297153) b!494579))

(assert (= (and b!494579 res!297152) b!494581))

(assert (= (and b!494581 res!297154) b!494585))

(assert (= (and b!494585 res!297151) b!494577))

(assert (= (and b!494577 res!297155) b!494583))

(assert (= (and b!494583 res!297148) b!494578))

(assert (= (and b!494578 res!297147) b!494582))

(assert (= (and b!494582 (not res!297149)) b!494584))

(assert (= (and b!494584 (not res!297146)) b!494576))

(declare-fun m!475647 () Bool)

(assert (=> b!494582 m!475647))

(declare-fun m!475649 () Bool)

(assert (=> b!494582 m!475649))

(declare-fun m!475651 () Bool)

(assert (=> b!494582 m!475651))

(declare-fun m!475653 () Bool)

(assert (=> b!494582 m!475653))

(declare-fun m!475655 () Bool)

(assert (=> b!494582 m!475655))

(assert (=> b!494582 m!475655))

(declare-fun m!475657 () Bool)

(assert (=> b!494582 m!475657))

(assert (=> b!494582 m!475647))

(declare-fun m!475659 () Bool)

(assert (=> b!494582 m!475659))

(assert (=> b!494582 m!475647))

(declare-fun m!475661 () Bool)

(assert (=> b!494582 m!475661))

(assert (=> b!494582 m!475647))

(declare-fun m!475663 () Bool)

(assert (=> b!494582 m!475663))

(assert (=> b!494582 m!475655))

(declare-fun m!475665 () Bool)

(assert (=> b!494582 m!475665))

(declare-fun m!475667 () Bool)

(assert (=> start!45062 m!475667))

(declare-fun m!475669 () Bool)

(assert (=> start!45062 m!475669))

(declare-fun m!475671 () Bool)

(assert (=> b!494583 m!475671))

(assert (=> b!494579 m!475647))

(assert (=> b!494579 m!475647))

(declare-fun m!475673 () Bool)

(assert (=> b!494579 m!475673))

(declare-fun m!475675 () Bool)

(assert (=> b!494585 m!475675))

(declare-fun m!475677 () Bool)

(assert (=> b!494581 m!475677))

(declare-fun m!475679 () Bool)

(assert (=> b!494578 m!475679))

(declare-fun m!475681 () Bool)

(assert (=> b!494577 m!475681))

(check-sat (not b!494578) (not b!494583) (not start!45062) (not b!494582) (not b!494581) (not b!494579) (not b!494585) (not b!494577))
(check-sat)
