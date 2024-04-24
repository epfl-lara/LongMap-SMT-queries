; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44984 () Bool)

(assert start!44984)

(declare-fun b!493495 () Bool)

(declare-fun res!296127 () Bool)

(declare-fun e!289794 () Bool)

(assert (=> b!493495 (=> res!296127 e!289794)))

(declare-datatypes ((SeekEntryResult!3772 0))(
  ( (MissingZero!3772 (index!17267 (_ BitVec 32))) (Found!3772 (index!17268 (_ BitVec 32))) (Intermediate!3772 (undefined!4584 Bool) (index!17269 (_ BitVec 32)) (x!46495 (_ BitVec 32))) (Undefined!3772) (MissingVacant!3772 (index!17270 (_ BitVec 32))) )
))
(declare-fun lt!223255 () SeekEntryResult!3772)

(get-info :version)

(assert (=> b!493495 (= res!296127 (or (not ((_ is Intermediate!3772) lt!223255)) (not (undefined!4584 lt!223255))))))

(declare-fun b!493496 () Bool)

(declare-fun e!289792 () Bool)

(declare-fun e!289793 () Bool)

(assert (=> b!493496 (= e!289792 e!289793)))

(declare-fun res!296126 () Bool)

(assert (=> b!493496 (=> (not res!296126) (not e!289793))))

(declare-fun lt!223254 () SeekEntryResult!3772)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!493496 (= res!296126 (or (= lt!223254 (MissingZero!3772 i!1204)) (= lt!223254 (MissingVacant!3772 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31930 0))(
  ( (array!31931 (arr!15349 (Array (_ BitVec 32) (_ BitVec 64))) (size!15713 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31930)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31930 (_ BitVec 32)) SeekEntryResult!3772)

(assert (=> b!493496 (= lt!223254 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!493497 () Bool)

(declare-fun res!296120 () Bool)

(assert (=> b!493497 (=> (not res!296120) (not e!289792))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493497 (= res!296120 (validKeyInArray!0 k0!2280))))

(declare-fun b!493498 () Bool)

(declare-fun res!296128 () Bool)

(assert (=> b!493498 (=> (not res!296128) (not e!289793))))

(declare-datatypes ((List!9414 0))(
  ( (Nil!9411) (Cons!9410 (h!10278 (_ BitVec 64)) (t!15634 List!9414)) )
))
(declare-fun arrayNoDuplicates!0 (array!31930 (_ BitVec 32) List!9414) Bool)

(assert (=> b!493498 (= res!296128 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9411))))

(declare-fun b!493499 () Bool)

(assert (=> b!493499 (= e!289794 true)))

(declare-fun lt!223256 () SeekEntryResult!3772)

(assert (=> b!493499 (= lt!223256 Undefined!3772)))

(declare-fun b!493500 () Bool)

(declare-fun res!296121 () Bool)

(assert (=> b!493500 (=> (not res!296121) (not e!289792))))

(declare-fun arrayContainsKey!0 (array!31930 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493500 (= res!296121 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!296125 () Bool)

(assert (=> start!44984 (=> (not res!296125) (not e!289792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44984 (= res!296125 (validMask!0 mask!3524))))

(assert (=> start!44984 e!289792))

(assert (=> start!44984 true))

(declare-fun array_inv!11208 (array!31930) Bool)

(assert (=> start!44984 (array_inv!11208 a!3235)))

(declare-fun b!493501 () Bool)

(assert (=> b!493501 (= e!289793 (not e!289794))))

(declare-fun res!296122 () Bool)

(assert (=> b!493501 (=> res!296122 e!289794)))

(declare-fun lt!223258 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31930 (_ BitVec 32)) SeekEntryResult!3772)

(assert (=> b!493501 (= res!296122 (= lt!223255 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223258 (select (store (arr!15349 a!3235) i!1204 k0!2280) j!176) (array!31931 (store (arr!15349 a!3235) i!1204 k0!2280) (size!15713 a!3235)) mask!3524)))))

(declare-fun lt!223257 () (_ BitVec 32))

(assert (=> b!493501 (= lt!223255 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223257 (select (arr!15349 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493501 (= lt!223258 (toIndex!0 (select (store (arr!15349 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!493501 (= lt!223257 (toIndex!0 (select (arr!15349 a!3235) j!176) mask!3524))))

(assert (=> b!493501 (= lt!223256 (Found!3772 j!176))))

(assert (=> b!493501 (= lt!223256 (seekEntryOrOpen!0 (select (arr!15349 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31930 (_ BitVec 32)) Bool)

(assert (=> b!493501 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14551 0))(
  ( (Unit!14552) )
))
(declare-fun lt!223253 () Unit!14551)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31930 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14551)

(assert (=> b!493501 (= lt!223253 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493502 () Bool)

(declare-fun res!296124 () Bool)

(assert (=> b!493502 (=> (not res!296124) (not e!289792))))

(assert (=> b!493502 (= res!296124 (and (= (size!15713 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15713 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15713 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493503 () Bool)

(declare-fun res!296119 () Bool)

(assert (=> b!493503 (=> (not res!296119) (not e!289793))))

(assert (=> b!493503 (= res!296119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493504 () Bool)

(declare-fun res!296123 () Bool)

(assert (=> b!493504 (=> (not res!296123) (not e!289792))))

(assert (=> b!493504 (= res!296123 (validKeyInArray!0 (select (arr!15349 a!3235) j!176)))))

(assert (= (and start!44984 res!296125) b!493502))

(assert (= (and b!493502 res!296124) b!493504))

(assert (= (and b!493504 res!296123) b!493497))

(assert (= (and b!493497 res!296120) b!493500))

(assert (= (and b!493500 res!296121) b!493496))

(assert (= (and b!493496 res!296126) b!493503))

(assert (= (and b!493503 res!296119) b!493498))

(assert (= (and b!493498 res!296128) b!493501))

(assert (= (and b!493501 (not res!296122)) b!493495))

(assert (= (and b!493495 (not res!296127)) b!493499))

(declare-fun m!474607 () Bool)

(assert (=> start!44984 m!474607))

(declare-fun m!474609 () Bool)

(assert (=> start!44984 m!474609))

(declare-fun m!474611 () Bool)

(assert (=> b!493504 m!474611))

(assert (=> b!493504 m!474611))

(declare-fun m!474613 () Bool)

(assert (=> b!493504 m!474613))

(declare-fun m!474615 () Bool)

(assert (=> b!493497 m!474615))

(declare-fun m!474617 () Bool)

(assert (=> b!493503 m!474617))

(declare-fun m!474619 () Bool)

(assert (=> b!493501 m!474619))

(declare-fun m!474621 () Bool)

(assert (=> b!493501 m!474621))

(assert (=> b!493501 m!474611))

(declare-fun m!474623 () Bool)

(assert (=> b!493501 m!474623))

(assert (=> b!493501 m!474611))

(declare-fun m!474625 () Bool)

(assert (=> b!493501 m!474625))

(assert (=> b!493501 m!474611))

(declare-fun m!474627 () Bool)

(assert (=> b!493501 m!474627))

(assert (=> b!493501 m!474611))

(declare-fun m!474629 () Bool)

(assert (=> b!493501 m!474629))

(assert (=> b!493501 m!474621))

(declare-fun m!474631 () Bool)

(assert (=> b!493501 m!474631))

(declare-fun m!474633 () Bool)

(assert (=> b!493501 m!474633))

(assert (=> b!493501 m!474621))

(declare-fun m!474635 () Bool)

(assert (=> b!493501 m!474635))

(declare-fun m!474637 () Bool)

(assert (=> b!493498 m!474637))

(declare-fun m!474639 () Bool)

(assert (=> b!493496 m!474639))

(declare-fun m!474641 () Bool)

(assert (=> b!493500 m!474641))

(check-sat (not b!493501) (not b!493500) (not b!493503) (not b!493497) (not b!493498) (not start!44984) (not b!493496) (not b!493504))
(check-sat)
