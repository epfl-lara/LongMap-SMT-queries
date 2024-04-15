; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45822 () Bool)

(assert start!45822)

(declare-fun b!507273 () Bool)

(declare-fun res!308383 () Bool)

(declare-fun e!296850 () Bool)

(assert (=> b!507273 (=> (not res!308383) (not e!296850))))

(declare-datatypes ((array!32588 0))(
  ( (array!32589 (arr!15674 (Array (_ BitVec 32) (_ BitVec 64))) (size!16039 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32588)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32588 (_ BitVec 32)) Bool)

(assert (=> b!507273 (= res!308383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!308374 () Bool)

(declare-fun e!296846 () Bool)

(assert (=> start!45822 (=> (not res!308374) (not e!296846))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45822 (= res!308374 (validMask!0 mask!3524))))

(assert (=> start!45822 e!296846))

(assert (=> start!45822 true))

(declare-fun array_inv!11557 (array!32588) Bool)

(assert (=> start!45822 (array_inv!11557 a!3235)))

(declare-fun b!507274 () Bool)

(declare-fun res!308376 () Bool)

(assert (=> b!507274 (=> (not res!308376) (not e!296846))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32588 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507274 (= res!308376 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507275 () Bool)

(declare-fun res!308378 () Bool)

(assert (=> b!507275 (=> (not res!308378) (not e!296846))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!507275 (= res!308378 (and (= (size!16039 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16039 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16039 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507276 () Bool)

(declare-fun e!296845 () Bool)

(declare-fun e!296847 () Bool)

(assert (=> b!507276 (= e!296845 e!296847)))

(declare-fun res!308381 () Bool)

(assert (=> b!507276 (=> res!308381 e!296847)))

(declare-fun lt!231576 () Bool)

(declare-datatypes ((SeekEntryResult!4138 0))(
  ( (MissingZero!4138 (index!18740 (_ BitVec 32))) (Found!4138 (index!18741 (_ BitVec 32))) (Intermediate!4138 (undefined!4950 Bool) (index!18742 (_ BitVec 32)) (x!47742 (_ BitVec 32))) (Undefined!4138) (MissingVacant!4138 (index!18743 (_ BitVec 32))) )
))
(declare-fun lt!231575 () SeekEntryResult!4138)

(assert (=> b!507276 (= res!308381 (or (and (not lt!231576) (undefined!4950 lt!231575)) (and (not lt!231576) (not (undefined!4950 lt!231575)))))))

(get-info :version)

(assert (=> b!507276 (= lt!231576 (not ((_ is Intermediate!4138) lt!231575)))))

(declare-fun b!507277 () Bool)

(assert (=> b!507277 (= e!296850 (not e!296845))))

(declare-fun res!308382 () Bool)

(assert (=> b!507277 (=> res!308382 e!296845)))

(declare-fun lt!231582 () array!32588)

(declare-fun lt!231580 () (_ BitVec 32))

(declare-fun lt!231581 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32588 (_ BitVec 32)) SeekEntryResult!4138)

(assert (=> b!507277 (= res!308382 (= lt!231575 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231580 lt!231581 lt!231582 mask!3524)))))

(declare-fun lt!231577 () (_ BitVec 32))

(assert (=> b!507277 (= lt!231575 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231577 (select (arr!15674 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507277 (= lt!231580 (toIndex!0 lt!231581 mask!3524))))

(assert (=> b!507277 (= lt!231581 (select (store (arr!15674 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!507277 (= lt!231577 (toIndex!0 (select (arr!15674 a!3235) j!176) mask!3524))))

(assert (=> b!507277 (= lt!231582 (array!32589 (store (arr!15674 a!3235) i!1204 k0!2280) (size!16039 a!3235)))))

(declare-fun e!296849 () Bool)

(assert (=> b!507277 e!296849))

(declare-fun res!308379 () Bool)

(assert (=> b!507277 (=> (not res!308379) (not e!296849))))

(assert (=> b!507277 (= res!308379 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15550 0))(
  ( (Unit!15551) )
))
(declare-fun lt!231579 () Unit!15550)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32588 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15550)

(assert (=> b!507277 (= lt!231579 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!507278 () Bool)

(declare-fun res!308384 () Bool)

(assert (=> b!507278 (=> (not res!308384) (not e!296850))))

(declare-datatypes ((List!9871 0))(
  ( (Nil!9868) (Cons!9867 (h!10744 (_ BitVec 64)) (t!16090 List!9871)) )
))
(declare-fun arrayNoDuplicates!0 (array!32588 (_ BitVec 32) List!9871) Bool)

(assert (=> b!507278 (= res!308384 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9868))))

(declare-fun b!507279 () Bool)

(declare-fun res!308377 () Bool)

(assert (=> b!507279 (=> (not res!308377) (not e!296846))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507279 (= res!308377 (validKeyInArray!0 k0!2280))))

(declare-fun b!507280 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32588 (_ BitVec 32)) SeekEntryResult!4138)

(assert (=> b!507280 (= e!296849 (= (seekEntryOrOpen!0 (select (arr!15674 a!3235) j!176) a!3235 mask!3524) (Found!4138 j!176)))))

(declare-fun b!507281 () Bool)

(assert (=> b!507281 (= e!296846 e!296850)))

(declare-fun res!308380 () Bool)

(assert (=> b!507281 (=> (not res!308380) (not e!296850))))

(declare-fun lt!231583 () SeekEntryResult!4138)

(assert (=> b!507281 (= res!308380 (or (= lt!231583 (MissingZero!4138 i!1204)) (= lt!231583 (MissingVacant!4138 i!1204))))))

(assert (=> b!507281 (= lt!231583 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!507282 () Bool)

(assert (=> b!507282 (= e!296847 true)))

(declare-fun lt!231578 () SeekEntryResult!4138)

(assert (=> b!507282 (= lt!231578 (seekEntryOrOpen!0 lt!231581 lt!231582 mask!3524))))

(assert (=> b!507282 false))

(declare-fun b!507283 () Bool)

(declare-fun res!308375 () Bool)

(assert (=> b!507283 (=> (not res!308375) (not e!296846))))

(assert (=> b!507283 (= res!308375 (validKeyInArray!0 (select (arr!15674 a!3235) j!176)))))

(assert (= (and start!45822 res!308374) b!507275))

(assert (= (and b!507275 res!308378) b!507283))

(assert (= (and b!507283 res!308375) b!507279))

(assert (= (and b!507279 res!308377) b!507274))

(assert (= (and b!507274 res!308376) b!507281))

(assert (= (and b!507281 res!308380) b!507273))

(assert (= (and b!507273 res!308383) b!507278))

(assert (= (and b!507278 res!308384) b!507277))

(assert (= (and b!507277 res!308379) b!507280))

(assert (= (and b!507277 (not res!308382)) b!507276))

(assert (= (and b!507276 (not res!308381)) b!507282))

(declare-fun m!487579 () Bool)

(assert (=> b!507277 m!487579))

(declare-fun m!487581 () Bool)

(assert (=> b!507277 m!487581))

(declare-fun m!487583 () Bool)

(assert (=> b!507277 m!487583))

(declare-fun m!487585 () Bool)

(assert (=> b!507277 m!487585))

(declare-fun m!487587 () Bool)

(assert (=> b!507277 m!487587))

(declare-fun m!487589 () Bool)

(assert (=> b!507277 m!487589))

(assert (=> b!507277 m!487585))

(declare-fun m!487591 () Bool)

(assert (=> b!507277 m!487591))

(assert (=> b!507277 m!487585))

(declare-fun m!487593 () Bool)

(assert (=> b!507277 m!487593))

(declare-fun m!487595 () Bool)

(assert (=> b!507277 m!487595))

(declare-fun m!487597 () Bool)

(assert (=> b!507279 m!487597))

(assert (=> b!507280 m!487585))

(assert (=> b!507280 m!487585))

(declare-fun m!487599 () Bool)

(assert (=> b!507280 m!487599))

(declare-fun m!487601 () Bool)

(assert (=> b!507273 m!487601))

(declare-fun m!487603 () Bool)

(assert (=> start!45822 m!487603))

(declare-fun m!487605 () Bool)

(assert (=> start!45822 m!487605))

(declare-fun m!487607 () Bool)

(assert (=> b!507278 m!487607))

(declare-fun m!487609 () Bool)

(assert (=> b!507281 m!487609))

(declare-fun m!487611 () Bool)

(assert (=> b!507282 m!487611))

(declare-fun m!487613 () Bool)

(assert (=> b!507274 m!487613))

(assert (=> b!507283 m!487585))

(assert (=> b!507283 m!487585))

(declare-fun m!487615 () Bool)

(assert (=> b!507283 m!487615))

(check-sat (not start!45822) (not b!507282) (not b!507283) (not b!507281) (not b!507273) (not b!507280) (not b!507277) (not b!507274) (not b!507278) (not b!507279))
(check-sat)
