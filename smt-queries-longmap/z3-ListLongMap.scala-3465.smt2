; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48122 () Bool)

(assert start!48122)

(declare-fun b!529972 () Bool)

(declare-fun res!325688 () Bool)

(declare-fun e!308810 () Bool)

(assert (=> b!529972 (=> (not res!325688) (not e!308810))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!529972 (= res!325688 (validKeyInArray!0 k0!2280))))

(declare-fun b!529973 () Bool)

(declare-fun res!325682 () Bool)

(declare-fun e!308811 () Bool)

(assert (=> b!529973 (=> (not res!325682) (not e!308811))))

(declare-datatypes ((array!33558 0))(
  ( (array!33559 (arr!16126 (Array (_ BitVec 32) (_ BitVec 64))) (size!16490 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33558)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33558 (_ BitVec 32)) Bool)

(assert (=> b!529973 (= res!325682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!529974 () Bool)

(declare-fun res!325681 () Bool)

(assert (=> b!529974 (=> (not res!325681) (not e!308810))))

(declare-fun arrayContainsKey!0 (array!33558 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!529974 (= res!325681 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!529975 () Bool)

(assert (=> b!529975 (= e!308810 e!308811)))

(declare-fun res!325678 () Bool)

(assert (=> b!529975 (=> (not res!325678) (not e!308811))))

(declare-datatypes ((SeekEntryResult!4593 0))(
  ( (MissingZero!4593 (index!20596 (_ BitVec 32))) (Found!4593 (index!20597 (_ BitVec 32))) (Intermediate!4593 (undefined!5405 Bool) (index!20598 (_ BitVec 32)) (x!49567 (_ BitVec 32))) (Undefined!4593) (MissingVacant!4593 (index!20599 (_ BitVec 32))) )
))
(declare-fun lt!244397 () SeekEntryResult!4593)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!529975 (= res!325678 (or (= lt!244397 (MissingZero!4593 i!1204)) (= lt!244397 (MissingVacant!4593 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33558 (_ BitVec 32)) SeekEntryResult!4593)

(assert (=> b!529975 (= lt!244397 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!529976 () Bool)

(declare-fun e!308809 () Bool)

(assert (=> b!529976 (= e!308811 (not e!308809))))

(declare-fun res!325680 () Bool)

(assert (=> b!529976 (=> res!325680 e!308809)))

(declare-fun lt!244404 () SeekEntryResult!4593)

(declare-fun lt!244405 () array!33558)

(declare-fun lt!244400 () (_ BitVec 32))

(declare-fun lt!244401 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33558 (_ BitVec 32)) SeekEntryResult!4593)

(assert (=> b!529976 (= res!325680 (= lt!244404 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244400 lt!244401 lt!244405 mask!3524)))))

(declare-fun lt!244398 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!529976 (= lt!244404 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244398 (select (arr!16126 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!529976 (= lt!244400 (toIndex!0 lt!244401 mask!3524))))

(assert (=> b!529976 (= lt!244401 (select (store (arr!16126 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!529976 (= lt!244398 (toIndex!0 (select (arr!16126 a!3235) j!176) mask!3524))))

(assert (=> b!529976 (= lt!244405 (array!33559 (store (arr!16126 a!3235) i!1204 k0!2280) (size!16490 a!3235)))))

(declare-fun e!308807 () Bool)

(assert (=> b!529976 e!308807))

(declare-fun res!325683 () Bool)

(assert (=> b!529976 (=> (not res!325683) (not e!308807))))

(assert (=> b!529976 (= res!325683 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16798 0))(
  ( (Unit!16799) )
))
(declare-fun lt!244399 () Unit!16798)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33558 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16798)

(assert (=> b!529976 (= lt!244399 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!529977 () Bool)

(assert (=> b!529977 (= e!308807 (= (seekEntryOrOpen!0 (select (arr!16126 a!3235) j!176) a!3235 mask!3524) (Found!4593 j!176)))))

(declare-fun b!529978 () Bool)

(declare-fun res!325679 () Bool)

(assert (=> b!529978 (=> (not res!325679) (not e!308810))))

(assert (=> b!529978 (= res!325679 (and (= (size!16490 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16490 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16490 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!325687 () Bool)

(assert (=> start!48122 (=> (not res!325687) (not e!308810))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48122 (= res!325687 (validMask!0 mask!3524))))

(assert (=> start!48122 e!308810))

(assert (=> start!48122 true))

(declare-fun array_inv!11922 (array!33558) Bool)

(assert (=> start!48122 (array_inv!11922 a!3235)))

(declare-fun b!529979 () Bool)

(declare-fun res!325686 () Bool)

(assert (=> b!529979 (=> (not res!325686) (not e!308810))))

(assert (=> b!529979 (= res!325686 (validKeyInArray!0 (select (arr!16126 a!3235) j!176)))))

(declare-fun b!529980 () Bool)

(declare-fun res!325685 () Bool)

(assert (=> b!529980 (=> (not res!325685) (not e!308811))))

(declare-datatypes ((List!10284 0))(
  ( (Nil!10281) (Cons!10280 (h!11220 (_ BitVec 64)) (t!16512 List!10284)) )
))
(declare-fun arrayNoDuplicates!0 (array!33558 (_ BitVec 32) List!10284) Bool)

(assert (=> b!529980 (= res!325685 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10281))))

(declare-fun b!529981 () Bool)

(declare-fun e!308806 () Bool)

(assert (=> b!529981 (= e!308806 true)))

(declare-fun lt!244403 () SeekEntryResult!4593)

(assert (=> b!529981 (= lt!244403 (seekEntryOrOpen!0 lt!244401 lt!244405 mask!3524))))

(assert (=> b!529981 false))

(declare-fun b!529982 () Bool)

(assert (=> b!529982 (= e!308809 e!308806)))

(declare-fun res!325684 () Bool)

(assert (=> b!529982 (=> res!325684 e!308806)))

(declare-fun lt!244402 () Bool)

(assert (=> b!529982 (= res!325684 (or (and (not lt!244402) (undefined!5405 lt!244404)) (and (not lt!244402) (not (undefined!5405 lt!244404)))))))

(get-info :version)

(assert (=> b!529982 (= lt!244402 (not ((_ is Intermediate!4593) lt!244404)))))

(assert (= (and start!48122 res!325687) b!529978))

(assert (= (and b!529978 res!325679) b!529979))

(assert (= (and b!529979 res!325686) b!529972))

(assert (= (and b!529972 res!325688) b!529974))

(assert (= (and b!529974 res!325681) b!529975))

(assert (= (and b!529975 res!325678) b!529973))

(assert (= (and b!529973 res!325682) b!529980))

(assert (= (and b!529980 res!325685) b!529976))

(assert (= (and b!529976 res!325683) b!529977))

(assert (= (and b!529976 (not res!325680)) b!529982))

(assert (= (and b!529982 (not res!325684)) b!529981))

(declare-fun m!510485 () Bool)

(assert (=> b!529974 m!510485))

(declare-fun m!510487 () Bool)

(assert (=> b!529979 m!510487))

(assert (=> b!529979 m!510487))

(declare-fun m!510489 () Bool)

(assert (=> b!529979 m!510489))

(declare-fun m!510491 () Bool)

(assert (=> b!529973 m!510491))

(declare-fun m!510493 () Bool)

(assert (=> b!529976 m!510493))

(declare-fun m!510495 () Bool)

(assert (=> b!529976 m!510495))

(declare-fun m!510497 () Bool)

(assert (=> b!529976 m!510497))

(declare-fun m!510499 () Bool)

(assert (=> b!529976 m!510499))

(assert (=> b!529976 m!510487))

(declare-fun m!510501 () Bool)

(assert (=> b!529976 m!510501))

(assert (=> b!529976 m!510487))

(declare-fun m!510503 () Bool)

(assert (=> b!529976 m!510503))

(assert (=> b!529976 m!510487))

(declare-fun m!510505 () Bool)

(assert (=> b!529976 m!510505))

(declare-fun m!510507 () Bool)

(assert (=> b!529976 m!510507))

(declare-fun m!510509 () Bool)

(assert (=> start!48122 m!510509))

(declare-fun m!510511 () Bool)

(assert (=> start!48122 m!510511))

(assert (=> b!529977 m!510487))

(assert (=> b!529977 m!510487))

(declare-fun m!510513 () Bool)

(assert (=> b!529977 m!510513))

(declare-fun m!510515 () Bool)

(assert (=> b!529980 m!510515))

(declare-fun m!510517 () Bool)

(assert (=> b!529981 m!510517))

(declare-fun m!510519 () Bool)

(assert (=> b!529975 m!510519))

(declare-fun m!510521 () Bool)

(assert (=> b!529972 m!510521))

(check-sat (not start!48122) (not b!529972) (not b!529980) (not b!529981) (not b!529976) (not b!529974) (not b!529973) (not b!529977) (not b!529979) (not b!529975))
(check-sat)
