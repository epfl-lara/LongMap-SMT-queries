; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45044 () Bool)

(assert start!45044)

(declare-fun b!494306 () Bool)

(declare-fun res!296879 () Bool)

(declare-fun e!290133 () Bool)

(assert (=> b!494306 (=> (not res!296879) (not e!290133))))

(declare-datatypes ((array!31989 0))(
  ( (array!31990 (arr!15379 (Array (_ BitVec 32) (_ BitVec 64))) (size!15743 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31989)

(declare-datatypes ((List!9537 0))(
  ( (Nil!9534) (Cons!9533 (h!10401 (_ BitVec 64)) (t!15765 List!9537)) )
))
(declare-fun arrayNoDuplicates!0 (array!31989 (_ BitVec 32) List!9537) Bool)

(assert (=> b!494306 (= res!296879 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9534))))

(declare-fun b!494308 () Bool)

(declare-fun res!296883 () Bool)

(declare-fun e!290132 () Bool)

(assert (=> b!494308 (=> (not res!296883) (not e!290132))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31989 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494308 (= res!296883 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494309 () Bool)

(declare-fun res!296884 () Bool)

(assert (=> b!494309 (=> (not res!296884) (not e!290132))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!494309 (= res!296884 (and (= (size!15743 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15743 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15743 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494310 () Bool)

(declare-fun res!296885 () Bool)

(declare-fun e!290130 () Bool)

(assert (=> b!494310 (=> res!296885 e!290130)))

(declare-datatypes ((SeekEntryResult!3846 0))(
  ( (MissingZero!3846 (index!17563 (_ BitVec 32))) (Found!3846 (index!17564 (_ BitVec 32))) (Intermediate!3846 (undefined!4658 Bool) (index!17565 (_ BitVec 32)) (x!46636 (_ BitVec 32))) (Undefined!3846) (MissingVacant!3846 (index!17566 (_ BitVec 32))) )
))
(declare-fun lt!223691 () SeekEntryResult!3846)

(get-info :version)

(assert (=> b!494310 (= res!296885 (or (not ((_ is Intermediate!3846) lt!223691)) (not (undefined!4658 lt!223691))))))

(declare-fun b!494311 () Bool)

(assert (=> b!494311 (= e!290132 e!290133)))

(declare-fun res!296877 () Bool)

(assert (=> b!494311 (=> (not res!296877) (not e!290133))))

(declare-fun lt!223693 () SeekEntryResult!3846)

(assert (=> b!494311 (= res!296877 (or (= lt!223693 (MissingZero!3846 i!1204)) (= lt!223693 (MissingVacant!3846 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31989 (_ BitVec 32)) SeekEntryResult!3846)

(assert (=> b!494311 (= lt!223693 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!494312 () Bool)

(assert (=> b!494312 (= e!290130 true)))

(declare-fun lt!223694 () SeekEntryResult!3846)

(assert (=> b!494312 (= lt!223694 Undefined!3846)))

(declare-fun b!494313 () Bool)

(declare-fun res!296876 () Bool)

(assert (=> b!494313 (=> (not res!296876) (not e!290132))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494313 (= res!296876 (validKeyInArray!0 (select (arr!15379 a!3235) j!176)))))

(declare-fun b!494307 () Bool)

(declare-fun res!296881 () Bool)

(assert (=> b!494307 (=> (not res!296881) (not e!290132))))

(assert (=> b!494307 (= res!296881 (validKeyInArray!0 k0!2280))))

(declare-fun res!296880 () Bool)

(assert (=> start!45044 (=> (not res!296880) (not e!290132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45044 (= res!296880 (validMask!0 mask!3524))))

(assert (=> start!45044 e!290132))

(assert (=> start!45044 true))

(declare-fun array_inv!11175 (array!31989) Bool)

(assert (=> start!45044 (array_inv!11175 a!3235)))

(declare-fun b!494314 () Bool)

(assert (=> b!494314 (= e!290133 (not e!290130))))

(declare-fun res!296878 () Bool)

(assert (=> b!494314 (=> res!296878 e!290130)))

(declare-fun lt!223696 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31989 (_ BitVec 32)) SeekEntryResult!3846)

(assert (=> b!494314 (= res!296878 (= lt!223691 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223696 (select (store (arr!15379 a!3235) i!1204 k0!2280) j!176) (array!31990 (store (arr!15379 a!3235) i!1204 k0!2280) (size!15743 a!3235)) mask!3524)))))

(declare-fun lt!223692 () (_ BitVec 32))

(assert (=> b!494314 (= lt!223691 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223692 (select (arr!15379 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494314 (= lt!223696 (toIndex!0 (select (store (arr!15379 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!494314 (= lt!223692 (toIndex!0 (select (arr!15379 a!3235) j!176) mask!3524))))

(assert (=> b!494314 (= lt!223694 (Found!3846 j!176))))

(assert (=> b!494314 (= lt!223694 (seekEntryOrOpen!0 (select (arr!15379 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31989 (_ BitVec 32)) Bool)

(assert (=> b!494314 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14638 0))(
  ( (Unit!14639) )
))
(declare-fun lt!223695 () Unit!14638)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31989 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14638)

(assert (=> b!494314 (= lt!223695 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494315 () Bool)

(declare-fun res!296882 () Bool)

(assert (=> b!494315 (=> (not res!296882) (not e!290133))))

(assert (=> b!494315 (= res!296882 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45044 res!296880) b!494309))

(assert (= (and b!494309 res!296884) b!494313))

(assert (= (and b!494313 res!296876) b!494307))

(assert (= (and b!494307 res!296881) b!494308))

(assert (= (and b!494308 res!296883) b!494311))

(assert (= (and b!494311 res!296877) b!494315))

(assert (= (and b!494315 res!296882) b!494306))

(assert (= (and b!494306 res!296879) b!494314))

(assert (= (and b!494314 (not res!296878)) b!494310))

(assert (= (and b!494310 (not res!296885)) b!494312))

(declare-fun m!475323 () Bool)

(assert (=> b!494311 m!475323))

(declare-fun m!475325 () Bool)

(assert (=> b!494315 m!475325))

(declare-fun m!475327 () Bool)

(assert (=> b!494314 m!475327))

(declare-fun m!475329 () Bool)

(assert (=> b!494314 m!475329))

(declare-fun m!475331 () Bool)

(assert (=> b!494314 m!475331))

(assert (=> b!494314 m!475331))

(declare-fun m!475333 () Bool)

(assert (=> b!494314 m!475333))

(declare-fun m!475335 () Bool)

(assert (=> b!494314 m!475335))

(declare-fun m!475337 () Bool)

(assert (=> b!494314 m!475337))

(assert (=> b!494314 m!475335))

(declare-fun m!475339 () Bool)

(assert (=> b!494314 m!475339))

(assert (=> b!494314 m!475335))

(declare-fun m!475341 () Bool)

(assert (=> b!494314 m!475341))

(assert (=> b!494314 m!475335))

(declare-fun m!475343 () Bool)

(assert (=> b!494314 m!475343))

(assert (=> b!494314 m!475331))

(declare-fun m!475345 () Bool)

(assert (=> b!494314 m!475345))

(declare-fun m!475347 () Bool)

(assert (=> b!494307 m!475347))

(assert (=> b!494313 m!475335))

(assert (=> b!494313 m!475335))

(declare-fun m!475349 () Bool)

(assert (=> b!494313 m!475349))

(declare-fun m!475351 () Bool)

(assert (=> b!494306 m!475351))

(declare-fun m!475353 () Bool)

(assert (=> b!494308 m!475353))

(declare-fun m!475355 () Bool)

(assert (=> start!45044 m!475355))

(declare-fun m!475357 () Bool)

(assert (=> start!45044 m!475357))

(check-sat (not b!494308) (not b!494306) (not b!494314) (not start!45044) (not b!494311) (not b!494307) (not b!494315) (not b!494313))
(check-sat)
