; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48092 () Bool)

(assert start!48092)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33529 0))(
  ( (array!33530 (arr!16111 (Array (_ BitVec 32) (_ BitVec 64))) (size!16475 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33529)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!308591 () Bool)

(declare-fun b!529581 () Bool)

(declare-datatypes ((SeekEntryResult!4534 0))(
  ( (MissingZero!4534 (index!20360 (_ BitVec 32))) (Found!4534 (index!20361 (_ BitVec 32))) (Intermediate!4534 (undefined!5346 Bool) (index!20362 (_ BitVec 32)) (x!49481 (_ BitVec 32))) (Undefined!4534) (MissingVacant!4534 (index!20363 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33529 (_ BitVec 32)) SeekEntryResult!4534)

(assert (=> b!529581 (= e!308591 (= (seekEntryOrOpen!0 (select (arr!16111 a!3235) j!176) a!3235 mask!3524) (Found!4534 j!176)))))

(declare-fun b!529582 () Bool)

(declare-fun e!308588 () Bool)

(declare-fun e!308592 () Bool)

(assert (=> b!529582 (= e!308588 e!308592)))

(declare-fun res!325348 () Bool)

(assert (=> b!529582 (=> res!325348 e!308592)))

(declare-fun lt!244190 () Bool)

(declare-fun lt!244187 () SeekEntryResult!4534)

(assert (=> b!529582 (= res!325348 (or (and (not lt!244190) (undefined!5346 lt!244187)) (and (not lt!244190) (not (undefined!5346 lt!244187)))))))

(get-info :version)

(assert (=> b!529582 (= lt!244190 (not ((_ is Intermediate!4534) lt!244187)))))

(declare-fun b!529583 () Bool)

(declare-fun res!325350 () Bool)

(declare-fun e!308587 () Bool)

(assert (=> b!529583 (=> (not res!325350) (not e!308587))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33529 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!529583 (= res!325350 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!529585 () Bool)

(assert (=> b!529585 (= e!308592 true)))

(assert (=> b!529585 false))

(declare-fun b!529586 () Bool)

(declare-fun res!325343 () Bool)

(declare-fun e!308590 () Bool)

(assert (=> b!529586 (=> (not res!325343) (not e!308590))))

(declare-datatypes ((List!10176 0))(
  ( (Nil!10173) (Cons!10172 (h!11112 (_ BitVec 64)) (t!16396 List!10176)) )
))
(declare-fun arrayNoDuplicates!0 (array!33529 (_ BitVec 32) List!10176) Bool)

(assert (=> b!529586 (= res!325343 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10173))))

(declare-fun b!529587 () Bool)

(declare-fun res!325344 () Bool)

(assert (=> b!529587 (=> (not res!325344) (not e!308590))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33529 (_ BitVec 32)) Bool)

(assert (=> b!529587 (= res!325344 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!529584 () Bool)

(declare-fun res!325342 () Bool)

(assert (=> b!529584 (=> (not res!325342) (not e!308587))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!529584 (= res!325342 (validKeyInArray!0 k0!2280))))

(declare-fun res!325349 () Bool)

(assert (=> start!48092 (=> (not res!325349) (not e!308587))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48092 (= res!325349 (validMask!0 mask!3524))))

(assert (=> start!48092 e!308587))

(assert (=> start!48092 true))

(declare-fun array_inv!11970 (array!33529) Bool)

(assert (=> start!48092 (array_inv!11970 a!3235)))

(declare-fun b!529588 () Bool)

(declare-fun res!325346 () Bool)

(assert (=> b!529588 (=> (not res!325346) (not e!308587))))

(assert (=> b!529588 (= res!325346 (validKeyInArray!0 (select (arr!16111 a!3235) j!176)))))

(declare-fun b!529589 () Bool)

(assert (=> b!529589 (= e!308587 e!308590)))

(declare-fun res!325345 () Bool)

(assert (=> b!529589 (=> (not res!325345) (not e!308590))))

(declare-fun lt!244191 () SeekEntryResult!4534)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!529589 (= res!325345 (or (= lt!244191 (MissingZero!4534 i!1204)) (= lt!244191 (MissingVacant!4534 i!1204))))))

(assert (=> b!529589 (= lt!244191 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!529590 () Bool)

(declare-fun res!325341 () Bool)

(assert (=> b!529590 (=> (not res!325341) (not e!308587))))

(assert (=> b!529590 (= res!325341 (and (= (size!16475 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16475 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16475 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!529591 () Bool)

(assert (=> b!529591 (= e!308590 (not e!308588))))

(declare-fun res!325351 () Bool)

(assert (=> b!529591 (=> res!325351 e!308588)))

(declare-fun lt!244192 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33529 (_ BitVec 32)) SeekEntryResult!4534)

(assert (=> b!529591 (= res!325351 (= lt!244187 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244192 (select (store (arr!16111 a!3235) i!1204 k0!2280) j!176) (array!33530 (store (arr!16111 a!3235) i!1204 k0!2280) (size!16475 a!3235)) mask!3524)))))

(declare-fun lt!244188 () (_ BitVec 32))

(assert (=> b!529591 (= lt!244187 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244188 (select (arr!16111 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!529591 (= lt!244192 (toIndex!0 (select (store (arr!16111 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!529591 (= lt!244188 (toIndex!0 (select (arr!16111 a!3235) j!176) mask!3524))))

(assert (=> b!529591 e!308591))

(declare-fun res!325347 () Bool)

(assert (=> b!529591 (=> (not res!325347) (not e!308591))))

(assert (=> b!529591 (= res!325347 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16741 0))(
  ( (Unit!16742) )
))
(declare-fun lt!244189 () Unit!16741)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33529 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16741)

(assert (=> b!529591 (= lt!244189 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!48092 res!325349) b!529590))

(assert (= (and b!529590 res!325341) b!529588))

(assert (= (and b!529588 res!325346) b!529584))

(assert (= (and b!529584 res!325342) b!529583))

(assert (= (and b!529583 res!325350) b!529589))

(assert (= (and b!529589 res!325345) b!529587))

(assert (= (and b!529587 res!325344) b!529586))

(assert (= (and b!529586 res!325343) b!529591))

(assert (= (and b!529591 res!325347) b!529581))

(assert (= (and b!529591 (not res!325351)) b!529582))

(assert (= (and b!529582 (not res!325348)) b!529585))

(declare-fun m!510301 () Bool)

(assert (=> b!529584 m!510301))

(declare-fun m!510303 () Bool)

(assert (=> b!529589 m!510303))

(declare-fun m!510305 () Bool)

(assert (=> b!529581 m!510305))

(assert (=> b!529581 m!510305))

(declare-fun m!510307 () Bool)

(assert (=> b!529581 m!510307))

(declare-fun m!510309 () Bool)

(assert (=> b!529583 m!510309))

(declare-fun m!510311 () Bool)

(assert (=> b!529587 m!510311))

(declare-fun m!510313 () Bool)

(assert (=> b!529586 m!510313))

(declare-fun m!510315 () Bool)

(assert (=> start!48092 m!510315))

(declare-fun m!510317 () Bool)

(assert (=> start!48092 m!510317))

(declare-fun m!510319 () Bool)

(assert (=> b!529591 m!510319))

(declare-fun m!510321 () Bool)

(assert (=> b!529591 m!510321))

(assert (=> b!529591 m!510305))

(declare-fun m!510323 () Bool)

(assert (=> b!529591 m!510323))

(declare-fun m!510325 () Bool)

(assert (=> b!529591 m!510325))

(declare-fun m!510327 () Bool)

(assert (=> b!529591 m!510327))

(assert (=> b!529591 m!510319))

(assert (=> b!529591 m!510305))

(declare-fun m!510329 () Bool)

(assert (=> b!529591 m!510329))

(assert (=> b!529591 m!510305))

(declare-fun m!510331 () Bool)

(assert (=> b!529591 m!510331))

(assert (=> b!529591 m!510319))

(declare-fun m!510333 () Bool)

(assert (=> b!529591 m!510333))

(assert (=> b!529588 m!510305))

(assert (=> b!529588 m!510305))

(declare-fun m!510335 () Bool)

(assert (=> b!529588 m!510335))

(check-sat (not start!48092) (not b!529583) (not b!529587) (not b!529586) (not b!529584) (not b!529591) (not b!529588) (not b!529589) (not b!529581))
(check-sat)
