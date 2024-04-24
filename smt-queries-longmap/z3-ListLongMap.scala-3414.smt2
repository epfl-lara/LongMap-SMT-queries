; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47396 () Bool)

(assert start!47396)

(declare-fun b!521433 () Bool)

(declare-fun res!319285 () Bool)

(declare-fun e!304203 () Bool)

(assert (=> b!521433 (=> (not res!319285) (not e!304203))))

(declare-datatypes ((array!33223 0))(
  ( (array!33224 (arr!15967 (Array (_ BitVec 32) (_ BitVec 64))) (size!16331 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33223)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33223 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!521433 (= res!319285 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!319287 () Bool)

(assert (=> start!47396 (=> (not res!319287) (not e!304203))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47396 (= res!319287 (validMask!0 mask!3524))))

(assert (=> start!47396 e!304203))

(assert (=> start!47396 true))

(declare-fun array_inv!11826 (array!33223) Bool)

(assert (=> start!47396 (array_inv!11826 a!3235)))

(declare-fun e!304204 () Bool)

(declare-fun b!521434 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4390 0))(
  ( (MissingZero!4390 (index!19763 (_ BitVec 32))) (Found!4390 (index!19764 (_ BitVec 32))) (Intermediate!4390 (undefined!5202 Bool) (index!19765 (_ BitVec 32)) (x!48893 (_ BitVec 32))) (Undefined!4390) (MissingVacant!4390 (index!19766 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33223 (_ BitVec 32)) SeekEntryResult!4390)

(assert (=> b!521434 (= e!304204 (= (seekEntryOrOpen!0 (select (arr!15967 a!3235) j!176) a!3235 mask!3524) (Found!4390 j!176)))))

(declare-fun b!521435 () Bool)

(declare-fun res!319279 () Bool)

(assert (=> b!521435 (=> (not res!319279) (not e!304203))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521435 (= res!319279 (validKeyInArray!0 (select (arr!15967 a!3235) j!176)))))

(declare-fun b!521436 () Bool)

(declare-datatypes ((Unit!16171 0))(
  ( (Unit!16172) )
))
(declare-fun e!304209 () Unit!16171)

(declare-fun Unit!16173 () Unit!16171)

(assert (=> b!521436 (= e!304209 Unit!16173)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!239013 () SeekEntryResult!4390)

(declare-fun lt!239006 () (_ BitVec 32))

(declare-fun lt!239008 () Unit!16171)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33223 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16171)

(assert (=> b!521436 (= lt!239008 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!239006 #b00000000000000000000000000000000 (index!19765 lt!239013) (x!48893 lt!239013) mask!3524))))

(declare-fun res!319278 () Bool)

(declare-fun lt!239010 () array!33223)

(declare-fun lt!239012 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33223 (_ BitVec 32)) SeekEntryResult!4390)

(assert (=> b!521436 (= res!319278 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239006 lt!239012 lt!239010 mask!3524) (Intermediate!4390 false (index!19765 lt!239013) (x!48893 lt!239013))))))

(declare-fun e!304208 () Bool)

(assert (=> b!521436 (=> (not res!319278) (not e!304208))))

(assert (=> b!521436 e!304208))

(declare-fun b!521437 () Bool)

(declare-fun res!319280 () Bool)

(assert (=> b!521437 (=> (not res!319280) (not e!304203))))

(assert (=> b!521437 (= res!319280 (validKeyInArray!0 k0!2280))))

(declare-fun b!521438 () Bool)

(declare-fun res!319283 () Bool)

(declare-fun e!304205 () Bool)

(assert (=> b!521438 (=> (not res!319283) (not e!304205))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33223 (_ BitVec 32)) Bool)

(assert (=> b!521438 (= res!319283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!521439 () Bool)

(assert (=> b!521439 (= e!304208 false)))

(declare-fun b!521440 () Bool)

(declare-fun Unit!16174 () Unit!16171)

(assert (=> b!521440 (= e!304209 Unit!16174)))

(declare-fun b!521441 () Bool)

(declare-fun res!319282 () Bool)

(declare-fun e!304206 () Bool)

(assert (=> b!521441 (=> res!319282 e!304206)))

(get-info :version)

(assert (=> b!521441 (= res!319282 (or (undefined!5202 lt!239013) (not ((_ is Intermediate!4390) lt!239013))))))

(declare-fun b!521442 () Bool)

(assert (=> b!521442 (= e!304205 (not e!304206))))

(declare-fun res!319277 () Bool)

(assert (=> b!521442 (=> res!319277 e!304206)))

(declare-fun lt!239014 () (_ BitVec 32))

(assert (=> b!521442 (= res!319277 (= lt!239013 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239014 lt!239012 lt!239010 mask!3524)))))

(assert (=> b!521442 (= lt!239013 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239006 (select (arr!15967 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!521442 (= lt!239014 (toIndex!0 lt!239012 mask!3524))))

(assert (=> b!521442 (= lt!239012 (select (store (arr!15967 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!521442 (= lt!239006 (toIndex!0 (select (arr!15967 a!3235) j!176) mask!3524))))

(assert (=> b!521442 (= lt!239010 (array!33224 (store (arr!15967 a!3235) i!1204 k0!2280) (size!16331 a!3235)))))

(assert (=> b!521442 e!304204))

(declare-fun res!319284 () Bool)

(assert (=> b!521442 (=> (not res!319284) (not e!304204))))

(assert (=> b!521442 (= res!319284 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!239009 () Unit!16171)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33223 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16171)

(assert (=> b!521442 (= lt!239009 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!521443 () Bool)

(assert (=> b!521443 (= e!304206 true)))

(assert (=> b!521443 (and (or (= (select (arr!15967 a!3235) (index!19765 lt!239013)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15967 a!3235) (index!19765 lt!239013)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15967 a!3235) (index!19765 lt!239013)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15967 a!3235) (index!19765 lt!239013)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!239011 () Unit!16171)

(assert (=> b!521443 (= lt!239011 e!304209)))

(declare-fun c!61379 () Bool)

(assert (=> b!521443 (= c!61379 (= (select (arr!15967 a!3235) (index!19765 lt!239013)) (select (arr!15967 a!3235) j!176)))))

(assert (=> b!521443 (and (bvslt (x!48893 lt!239013) #b01111111111111111111111111111110) (or (= (select (arr!15967 a!3235) (index!19765 lt!239013)) (select (arr!15967 a!3235) j!176)) (= (select (arr!15967 a!3235) (index!19765 lt!239013)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15967 a!3235) (index!19765 lt!239013)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!521444 () Bool)

(declare-fun res!319286 () Bool)

(assert (=> b!521444 (=> (not res!319286) (not e!304203))))

(assert (=> b!521444 (= res!319286 (and (= (size!16331 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16331 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16331 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!521445 () Bool)

(declare-fun res!319288 () Bool)

(assert (=> b!521445 (=> (not res!319288) (not e!304205))))

(declare-datatypes ((List!10032 0))(
  ( (Nil!10029) (Cons!10028 (h!10950 (_ BitVec 64)) (t!16252 List!10032)) )
))
(declare-fun arrayNoDuplicates!0 (array!33223 (_ BitVec 32) List!10032) Bool)

(assert (=> b!521445 (= res!319288 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10029))))

(declare-fun b!521446 () Bool)

(assert (=> b!521446 (= e!304203 e!304205)))

(declare-fun res!319281 () Bool)

(assert (=> b!521446 (=> (not res!319281) (not e!304205))))

(declare-fun lt!239007 () SeekEntryResult!4390)

(assert (=> b!521446 (= res!319281 (or (= lt!239007 (MissingZero!4390 i!1204)) (= lt!239007 (MissingVacant!4390 i!1204))))))

(assert (=> b!521446 (= lt!239007 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!47396 res!319287) b!521444))

(assert (= (and b!521444 res!319286) b!521435))

(assert (= (and b!521435 res!319279) b!521437))

(assert (= (and b!521437 res!319280) b!521433))

(assert (= (and b!521433 res!319285) b!521446))

(assert (= (and b!521446 res!319281) b!521438))

(assert (= (and b!521438 res!319283) b!521445))

(assert (= (and b!521445 res!319288) b!521442))

(assert (= (and b!521442 res!319284) b!521434))

(assert (= (and b!521442 (not res!319277)) b!521441))

(assert (= (and b!521441 (not res!319282)) b!521443))

(assert (= (and b!521443 c!61379) b!521436))

(assert (= (and b!521443 (not c!61379)) b!521440))

(assert (= (and b!521436 res!319278) b!521439))

(declare-fun m!502591 () Bool)

(assert (=> b!521446 m!502591))

(declare-fun m!502593 () Bool)

(assert (=> b!521437 m!502593))

(declare-fun m!502595 () Bool)

(assert (=> b!521443 m!502595))

(declare-fun m!502597 () Bool)

(assert (=> b!521443 m!502597))

(declare-fun m!502599 () Bool)

(assert (=> b!521433 m!502599))

(declare-fun m!502601 () Bool)

(assert (=> b!521438 m!502601))

(declare-fun m!502603 () Bool)

(assert (=> start!47396 m!502603))

(declare-fun m!502605 () Bool)

(assert (=> start!47396 m!502605))

(declare-fun m!502607 () Bool)

(assert (=> b!521445 m!502607))

(declare-fun m!502609 () Bool)

(assert (=> b!521442 m!502609))

(declare-fun m!502611 () Bool)

(assert (=> b!521442 m!502611))

(assert (=> b!521442 m!502597))

(declare-fun m!502613 () Bool)

(assert (=> b!521442 m!502613))

(assert (=> b!521442 m!502597))

(declare-fun m!502615 () Bool)

(assert (=> b!521442 m!502615))

(assert (=> b!521442 m!502597))

(declare-fun m!502617 () Bool)

(assert (=> b!521442 m!502617))

(declare-fun m!502619 () Bool)

(assert (=> b!521442 m!502619))

(declare-fun m!502621 () Bool)

(assert (=> b!521442 m!502621))

(declare-fun m!502623 () Bool)

(assert (=> b!521442 m!502623))

(declare-fun m!502625 () Bool)

(assert (=> b!521436 m!502625))

(declare-fun m!502627 () Bool)

(assert (=> b!521436 m!502627))

(assert (=> b!521434 m!502597))

(assert (=> b!521434 m!502597))

(declare-fun m!502629 () Bool)

(assert (=> b!521434 m!502629))

(assert (=> b!521435 m!502597))

(assert (=> b!521435 m!502597))

(declare-fun m!502631 () Bool)

(assert (=> b!521435 m!502631))

(check-sat (not b!521434) (not b!521436) (not b!521446) (not b!521437) (not b!521435) (not b!521445) (not b!521433) (not b!521438) (not b!521442) (not start!47396))
(check-sat)
