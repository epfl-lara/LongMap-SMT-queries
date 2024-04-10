; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44624 () Bool)

(assert start!44624)

(declare-fun b!489516 () Bool)

(declare-fun res!292460 () Bool)

(declare-fun e!287898 () Bool)

(assert (=> b!489516 (=> (not res!292460) (not e!287898))))

(declare-datatypes ((array!31683 0))(
  ( (array!31684 (arr!15229 (Array (_ BitVec 32) (_ BitVec 64))) (size!15593 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31683)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489516 (= res!292460 (validKeyInArray!0 (select (arr!15229 a!3235) j!176)))))

(declare-fun res!292457 () Bool)

(assert (=> start!44624 (=> (not res!292457) (not e!287898))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44624 (= res!292457 (validMask!0 mask!3524))))

(assert (=> start!44624 e!287898))

(assert (=> start!44624 true))

(declare-fun array_inv!11025 (array!31683) Bool)

(assert (=> start!44624 (array_inv!11025 a!3235)))

(declare-fun b!489517 () Bool)

(declare-fun res!292458 () Bool)

(assert (=> b!489517 (=> (not res!292458) (not e!287898))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31683 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489517 (= res!292458 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489518 () Bool)

(declare-fun e!287897 () Bool)

(assert (=> b!489518 (= e!287897 (not true))))

(declare-fun lt!220877 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3696 0))(
  ( (MissingZero!3696 (index!16963 (_ BitVec 32))) (Found!3696 (index!16964 (_ BitVec 32))) (Intermediate!3696 (undefined!4508 Bool) (index!16965 (_ BitVec 32)) (x!46074 (_ BitVec 32))) (Undefined!3696) (MissingVacant!3696 (index!16966 (_ BitVec 32))) )
))
(declare-fun lt!220882 () SeekEntryResult!3696)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31683 (_ BitVec 32)) SeekEntryResult!3696)

(assert (=> b!489518 (= lt!220882 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220877 (select (store (arr!15229 a!3235) i!1204 k0!2280) j!176) (array!31684 (store (arr!15229 a!3235) i!1204 k0!2280) (size!15593 a!3235)) mask!3524))))

(declare-fun lt!220880 () (_ BitVec 32))

(declare-fun lt!220879 () SeekEntryResult!3696)

(assert (=> b!489518 (= lt!220879 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220880 (select (arr!15229 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489518 (= lt!220877 (toIndex!0 (select (store (arr!15229 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!489518 (= lt!220880 (toIndex!0 (select (arr!15229 a!3235) j!176) mask!3524))))

(declare-fun e!287895 () Bool)

(assert (=> b!489518 e!287895))

(declare-fun res!292454 () Bool)

(assert (=> b!489518 (=> (not res!292454) (not e!287895))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31683 (_ BitVec 32)) Bool)

(assert (=> b!489518 (= res!292454 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14338 0))(
  ( (Unit!14339) )
))
(declare-fun lt!220878 () Unit!14338)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31683 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14338)

(assert (=> b!489518 (= lt!220878 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489519 () Bool)

(declare-fun res!292453 () Bool)

(assert (=> b!489519 (=> (not res!292453) (not e!287898))))

(assert (=> b!489519 (= res!292453 (validKeyInArray!0 k0!2280))))

(declare-fun b!489520 () Bool)

(declare-fun res!292459 () Bool)

(assert (=> b!489520 (=> (not res!292459) (not e!287898))))

(assert (=> b!489520 (= res!292459 (and (= (size!15593 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15593 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15593 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489521 () Bool)

(declare-fun res!292455 () Bool)

(assert (=> b!489521 (=> (not res!292455) (not e!287897))))

(assert (=> b!489521 (= res!292455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489522 () Bool)

(assert (=> b!489522 (= e!287898 e!287897)))

(declare-fun res!292456 () Bool)

(assert (=> b!489522 (=> (not res!292456) (not e!287897))))

(declare-fun lt!220881 () SeekEntryResult!3696)

(assert (=> b!489522 (= res!292456 (or (= lt!220881 (MissingZero!3696 i!1204)) (= lt!220881 (MissingVacant!3696 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31683 (_ BitVec 32)) SeekEntryResult!3696)

(assert (=> b!489522 (= lt!220881 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!489523 () Bool)

(declare-fun res!292452 () Bool)

(assert (=> b!489523 (=> (not res!292452) (not e!287897))))

(declare-datatypes ((List!9387 0))(
  ( (Nil!9384) (Cons!9383 (h!10245 (_ BitVec 64)) (t!15615 List!9387)) )
))
(declare-fun arrayNoDuplicates!0 (array!31683 (_ BitVec 32) List!9387) Bool)

(assert (=> b!489523 (= res!292452 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9384))))

(declare-fun b!489524 () Bool)

(assert (=> b!489524 (= e!287895 (= (seekEntryOrOpen!0 (select (arr!15229 a!3235) j!176) a!3235 mask!3524) (Found!3696 j!176)))))

(assert (= (and start!44624 res!292457) b!489520))

(assert (= (and b!489520 res!292459) b!489516))

(assert (= (and b!489516 res!292460) b!489519))

(assert (= (and b!489519 res!292453) b!489517))

(assert (= (and b!489517 res!292458) b!489522))

(assert (= (and b!489522 res!292456) b!489521))

(assert (= (and b!489521 res!292455) b!489523))

(assert (= (and b!489523 res!292452) b!489518))

(assert (= (and b!489518 res!292454) b!489524))

(declare-fun m!469317 () Bool)

(assert (=> start!44624 m!469317))

(declare-fun m!469319 () Bool)

(assert (=> start!44624 m!469319))

(declare-fun m!469321 () Bool)

(assert (=> b!489524 m!469321))

(assert (=> b!489524 m!469321))

(declare-fun m!469323 () Bool)

(assert (=> b!489524 m!469323))

(declare-fun m!469325 () Bool)

(assert (=> b!489518 m!469325))

(assert (=> b!489518 m!469321))

(declare-fun m!469327 () Bool)

(assert (=> b!489518 m!469327))

(assert (=> b!489518 m!469321))

(declare-fun m!469329 () Bool)

(assert (=> b!489518 m!469329))

(assert (=> b!489518 m!469325))

(declare-fun m!469331 () Bool)

(assert (=> b!489518 m!469331))

(assert (=> b!489518 m!469321))

(declare-fun m!469333 () Bool)

(assert (=> b!489518 m!469333))

(declare-fun m!469335 () Bool)

(assert (=> b!489518 m!469335))

(assert (=> b!489518 m!469325))

(declare-fun m!469337 () Bool)

(assert (=> b!489518 m!469337))

(declare-fun m!469339 () Bool)

(assert (=> b!489518 m!469339))

(declare-fun m!469341 () Bool)

(assert (=> b!489517 m!469341))

(declare-fun m!469343 () Bool)

(assert (=> b!489522 m!469343))

(declare-fun m!469345 () Bool)

(assert (=> b!489519 m!469345))

(declare-fun m!469347 () Bool)

(assert (=> b!489523 m!469347))

(assert (=> b!489516 m!469321))

(assert (=> b!489516 m!469321))

(declare-fun m!469349 () Bool)

(assert (=> b!489516 m!469349))

(declare-fun m!469351 () Bool)

(assert (=> b!489521 m!469351))

(check-sat (not b!489523) (not b!489524) (not b!489517) (not b!489518) (not b!489519) (not b!489516) (not b!489521) (not start!44624) (not b!489522))
(check-sat)
