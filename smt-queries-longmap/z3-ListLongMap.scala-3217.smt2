; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45050 () Bool)

(assert start!45050)

(declare-fun b!494396 () Bool)

(declare-fun res!296973 () Bool)

(declare-fun e!290167 () Bool)

(assert (=> b!494396 (=> (not res!296973) (not e!290167))))

(declare-datatypes ((array!31995 0))(
  ( (array!31996 (arr!15382 (Array (_ BitVec 32) (_ BitVec 64))) (size!15746 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31995)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31995 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494396 (= res!296973 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494397 () Bool)

(declare-fun e!290168 () Bool)

(assert (=> b!494397 (= e!290168 true)))

(declare-datatypes ((SeekEntryResult!3849 0))(
  ( (MissingZero!3849 (index!17575 (_ BitVec 32))) (Found!3849 (index!17576 (_ BitVec 32))) (Intermediate!3849 (undefined!4661 Bool) (index!17577 (_ BitVec 32)) (x!46647 (_ BitVec 32))) (Undefined!3849) (MissingVacant!3849 (index!17578 (_ BitVec 32))) )
))
(declare-fun lt!223746 () SeekEntryResult!3849)

(assert (=> b!494397 (= lt!223746 Undefined!3849)))

(declare-fun b!494398 () Bool)

(declare-fun res!296969 () Bool)

(assert (=> b!494398 (=> res!296969 e!290168)))

(declare-fun lt!223745 () SeekEntryResult!3849)

(get-info :version)

(assert (=> b!494398 (= res!296969 (or (not ((_ is Intermediate!3849) lt!223745)) (not (undefined!4661 lt!223745))))))

(declare-fun b!494399 () Bool)

(declare-fun e!290166 () Bool)

(assert (=> b!494399 (= e!290167 e!290166)))

(declare-fun res!296970 () Bool)

(assert (=> b!494399 (=> (not res!296970) (not e!290166))))

(declare-fun lt!223749 () SeekEntryResult!3849)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!494399 (= res!296970 (or (= lt!223749 (MissingZero!3849 i!1204)) (= lt!223749 (MissingVacant!3849 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31995 (_ BitVec 32)) SeekEntryResult!3849)

(assert (=> b!494399 (= lt!223749 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!296966 () Bool)

(assert (=> start!45050 (=> (not res!296966) (not e!290167))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45050 (= res!296966 (validMask!0 mask!3524))))

(assert (=> start!45050 e!290167))

(assert (=> start!45050 true))

(declare-fun array_inv!11178 (array!31995) Bool)

(assert (=> start!45050 (array_inv!11178 a!3235)))

(declare-fun b!494400 () Bool)

(declare-fun res!296971 () Bool)

(assert (=> b!494400 (=> (not res!296971) (not e!290167))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!494400 (= res!296971 (and (= (size!15746 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15746 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15746 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494401 () Bool)

(declare-fun res!296974 () Bool)

(assert (=> b!494401 (=> (not res!296974) (not e!290166))))

(declare-datatypes ((List!9540 0))(
  ( (Nil!9537) (Cons!9536 (h!10404 (_ BitVec 64)) (t!15768 List!9540)) )
))
(declare-fun arrayNoDuplicates!0 (array!31995 (_ BitVec 32) List!9540) Bool)

(assert (=> b!494401 (= res!296974 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9537))))

(declare-fun b!494402 () Bool)

(declare-fun res!296975 () Bool)

(assert (=> b!494402 (=> (not res!296975) (not e!290167))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494402 (= res!296975 (validKeyInArray!0 k0!2280))))

(declare-fun b!494403 () Bool)

(assert (=> b!494403 (= e!290166 (not e!290168))))

(declare-fun res!296972 () Bool)

(assert (=> b!494403 (=> res!296972 e!290168)))

(declare-fun lt!223747 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31995 (_ BitVec 32)) SeekEntryResult!3849)

(assert (=> b!494403 (= res!296972 (= lt!223745 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223747 (select (store (arr!15382 a!3235) i!1204 k0!2280) j!176) (array!31996 (store (arr!15382 a!3235) i!1204 k0!2280) (size!15746 a!3235)) mask!3524)))))

(declare-fun lt!223748 () (_ BitVec 32))

(assert (=> b!494403 (= lt!223745 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223748 (select (arr!15382 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494403 (= lt!223747 (toIndex!0 (select (store (arr!15382 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!494403 (= lt!223748 (toIndex!0 (select (arr!15382 a!3235) j!176) mask!3524))))

(assert (=> b!494403 (= lt!223746 (Found!3849 j!176))))

(assert (=> b!494403 (= lt!223746 (seekEntryOrOpen!0 (select (arr!15382 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31995 (_ BitVec 32)) Bool)

(assert (=> b!494403 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14644 0))(
  ( (Unit!14645) )
))
(declare-fun lt!223750 () Unit!14644)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31995 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14644)

(assert (=> b!494403 (= lt!223750 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494404 () Bool)

(declare-fun res!296967 () Bool)

(assert (=> b!494404 (=> (not res!296967) (not e!290166))))

(assert (=> b!494404 (= res!296967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494405 () Bool)

(declare-fun res!296968 () Bool)

(assert (=> b!494405 (=> (not res!296968) (not e!290167))))

(assert (=> b!494405 (= res!296968 (validKeyInArray!0 (select (arr!15382 a!3235) j!176)))))

(assert (= (and start!45050 res!296966) b!494400))

(assert (= (and b!494400 res!296971) b!494405))

(assert (= (and b!494405 res!296968) b!494402))

(assert (= (and b!494402 res!296975) b!494396))

(assert (= (and b!494396 res!296973) b!494399))

(assert (= (and b!494399 res!296970) b!494404))

(assert (= (and b!494404 res!296967) b!494401))

(assert (= (and b!494401 res!296974) b!494403))

(assert (= (and b!494403 (not res!296972)) b!494398))

(assert (= (and b!494398 (not res!296969)) b!494397))

(declare-fun m!475431 () Bool)

(assert (=> b!494403 m!475431))

(declare-fun m!475433 () Bool)

(assert (=> b!494403 m!475433))

(declare-fun m!475435 () Bool)

(assert (=> b!494403 m!475435))

(declare-fun m!475437 () Bool)

(assert (=> b!494403 m!475437))

(declare-fun m!475439 () Bool)

(assert (=> b!494403 m!475439))

(assert (=> b!494403 m!475437))

(declare-fun m!475441 () Bool)

(assert (=> b!494403 m!475441))

(assert (=> b!494403 m!475437))

(declare-fun m!475443 () Bool)

(assert (=> b!494403 m!475443))

(assert (=> b!494403 m!475437))

(declare-fun m!475445 () Bool)

(assert (=> b!494403 m!475445))

(assert (=> b!494403 m!475435))

(declare-fun m!475447 () Bool)

(assert (=> b!494403 m!475447))

(assert (=> b!494403 m!475435))

(declare-fun m!475449 () Bool)

(assert (=> b!494403 m!475449))

(assert (=> b!494405 m!475437))

(assert (=> b!494405 m!475437))

(declare-fun m!475451 () Bool)

(assert (=> b!494405 m!475451))

(declare-fun m!475453 () Bool)

(assert (=> start!45050 m!475453))

(declare-fun m!475455 () Bool)

(assert (=> start!45050 m!475455))

(declare-fun m!475457 () Bool)

(assert (=> b!494401 m!475457))

(declare-fun m!475459 () Bool)

(assert (=> b!494402 m!475459))

(declare-fun m!475461 () Bool)

(assert (=> b!494396 m!475461))

(declare-fun m!475463 () Bool)

(assert (=> b!494404 m!475463))

(declare-fun m!475465 () Bool)

(assert (=> b!494399 m!475465))

(check-sat (not start!45050) (not b!494403) (not b!494396) (not b!494405) (not b!494399) (not b!494402) (not b!494401) (not b!494404))
(check-sat)
