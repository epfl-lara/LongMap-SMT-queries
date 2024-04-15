; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47754 () Bool)

(assert start!47754)

(declare-fun b!525615 () Bool)

(declare-datatypes ((Unit!16510 0))(
  ( (Unit!16511) )
))
(declare-fun e!306408 () Unit!16510)

(declare-fun Unit!16512 () Unit!16510)

(assert (=> b!525615 (= e!306408 Unit!16512)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!241487 () Unit!16510)

(declare-datatypes ((array!33401 0))(
  ( (array!33402 (arr!16052 (Array (_ BitVec 32) (_ BitVec 64))) (size!16417 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33401)

(declare-datatypes ((SeekEntryResult!4516 0))(
  ( (MissingZero!4516 (index!20276 (_ BitVec 32))) (Found!4516 (index!20277 (_ BitVec 32))) (Intermediate!4516 (undefined!5328 Bool) (index!20278 (_ BitVec 32)) (x!49260 (_ BitVec 32))) (Undefined!4516) (MissingVacant!4516 (index!20279 (_ BitVec 32))) )
))
(declare-fun lt!241489 () SeekEntryResult!4516)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!241481 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33401 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16510)

(assert (=> b!525615 (= lt!241487 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!241481 #b00000000000000000000000000000000 (index!20278 lt!241489) (x!49260 lt!241489) mask!3524))))

(declare-fun res!322463 () Bool)

(declare-fun lt!241485 () (_ BitVec 64))

(declare-fun lt!241483 () array!33401)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33401 (_ BitVec 32)) SeekEntryResult!4516)

(assert (=> b!525615 (= res!322463 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241481 lt!241485 lt!241483 mask!3524) (Intermediate!4516 false (index!20278 lt!241489) (x!49260 lt!241489))))))

(declare-fun e!306411 () Bool)

(assert (=> b!525615 (=> (not res!322463) (not e!306411))))

(assert (=> b!525615 e!306411))

(declare-fun b!525616 () Bool)

(declare-fun res!322465 () Bool)

(declare-fun e!306412 () Bool)

(assert (=> b!525616 (=> (not res!322465) (not e!306412))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!525616 (= res!322465 (validKeyInArray!0 (select (arr!16052 a!3235) j!176)))))

(declare-fun b!525617 () Bool)

(declare-fun e!306413 () Bool)

(assert (=> b!525617 (= e!306412 e!306413)))

(declare-fun res!322462 () Bool)

(assert (=> b!525617 (=> (not res!322462) (not e!306413))))

(declare-fun lt!241486 () SeekEntryResult!4516)

(assert (=> b!525617 (= res!322462 (or (= lt!241486 (MissingZero!4516 i!1204)) (= lt!241486 (MissingVacant!4516 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33401 (_ BitVec 32)) SeekEntryResult!4516)

(assert (=> b!525617 (= lt!241486 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!525618 () Bool)

(assert (=> b!525618 (= e!306411 false)))

(declare-fun b!525619 () Bool)

(declare-fun Unit!16513 () Unit!16510)

(assert (=> b!525619 (= e!306408 Unit!16513)))

(declare-fun b!525621 () Bool)

(declare-fun res!322461 () Bool)

(assert (=> b!525621 (=> (not res!322461) (not e!306413))))

(declare-datatypes ((List!10249 0))(
  ( (Nil!10246) (Cons!10245 (h!11176 (_ BitVec 64)) (t!16468 List!10249)) )
))
(declare-fun arrayNoDuplicates!0 (array!33401 (_ BitVec 32) List!10249) Bool)

(assert (=> b!525621 (= res!322461 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10246))))

(declare-fun b!525622 () Bool)

(declare-fun e!306410 () Bool)

(assert (=> b!525622 (= e!306413 (not e!306410))))

(declare-fun res!322458 () Bool)

(assert (=> b!525622 (=> res!322458 e!306410)))

(declare-fun lt!241484 () (_ BitVec 32))

(assert (=> b!525622 (= res!322458 (= lt!241489 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241484 lt!241485 lt!241483 mask!3524)))))

(assert (=> b!525622 (= lt!241489 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241481 (select (arr!16052 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!525622 (= lt!241484 (toIndex!0 lt!241485 mask!3524))))

(assert (=> b!525622 (= lt!241485 (select (store (arr!16052 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!525622 (= lt!241481 (toIndex!0 (select (arr!16052 a!3235) j!176) mask!3524))))

(assert (=> b!525622 (= lt!241483 (array!33402 (store (arr!16052 a!3235) i!1204 k0!2280) (size!16417 a!3235)))))

(declare-fun e!306409 () Bool)

(assert (=> b!525622 e!306409))

(declare-fun res!322459 () Bool)

(assert (=> b!525622 (=> (not res!322459) (not e!306409))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33401 (_ BitVec 32)) Bool)

(assert (=> b!525622 (= res!322459 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241480 () Unit!16510)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33401 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16510)

(assert (=> b!525622 (= lt!241480 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!525623 () Bool)

(declare-fun res!322460 () Bool)

(assert (=> b!525623 (=> (not res!322460) (not e!306412))))

(declare-fun arrayContainsKey!0 (array!33401 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!525623 (= res!322460 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!525624 () Bool)

(declare-fun res!322464 () Bool)

(assert (=> b!525624 (=> (not res!322464) (not e!306412))))

(assert (=> b!525624 (= res!322464 (validKeyInArray!0 k0!2280))))

(declare-fun b!525625 () Bool)

(assert (=> b!525625 (= e!306410 true)))

(assert (=> b!525625 (= (index!20278 lt!241489) i!1204)))

(declare-fun lt!241482 () Unit!16510)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33401 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16510)

(assert (=> b!525625 (= lt!241482 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!241481 #b00000000000000000000000000000000 (index!20278 lt!241489) (x!49260 lt!241489) mask!3524))))

(assert (=> b!525625 (and (or (= (select (arr!16052 a!3235) (index!20278 lt!241489)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16052 a!3235) (index!20278 lt!241489)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16052 a!3235) (index!20278 lt!241489)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16052 a!3235) (index!20278 lt!241489)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241488 () Unit!16510)

(assert (=> b!525625 (= lt!241488 e!306408)))

(declare-fun c!61884 () Bool)

(assert (=> b!525625 (= c!61884 (= (select (arr!16052 a!3235) (index!20278 lt!241489)) (select (arr!16052 a!3235) j!176)))))

(assert (=> b!525625 (and (bvslt (x!49260 lt!241489) #b01111111111111111111111111111110) (or (= (select (arr!16052 a!3235) (index!20278 lt!241489)) (select (arr!16052 a!3235) j!176)) (= (select (arr!16052 a!3235) (index!20278 lt!241489)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16052 a!3235) (index!20278 lt!241489)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!525626 () Bool)

(declare-fun res!322469 () Bool)

(assert (=> b!525626 (=> res!322469 e!306410)))

(get-info :version)

(assert (=> b!525626 (= res!322469 (or (undefined!5328 lt!241489) (not ((_ is Intermediate!4516) lt!241489))))))

(declare-fun res!322466 () Bool)

(assert (=> start!47754 (=> (not res!322466) (not e!306412))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47754 (= res!322466 (validMask!0 mask!3524))))

(assert (=> start!47754 e!306412))

(assert (=> start!47754 true))

(declare-fun array_inv!11935 (array!33401) Bool)

(assert (=> start!47754 (array_inv!11935 a!3235)))

(declare-fun b!525620 () Bool)

(assert (=> b!525620 (= e!306409 (= (seekEntryOrOpen!0 (select (arr!16052 a!3235) j!176) a!3235 mask!3524) (Found!4516 j!176)))))

(declare-fun b!525627 () Bool)

(declare-fun res!322467 () Bool)

(assert (=> b!525627 (=> (not res!322467) (not e!306412))))

(assert (=> b!525627 (= res!322467 (and (= (size!16417 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16417 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16417 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!525628 () Bool)

(declare-fun res!322468 () Bool)

(assert (=> b!525628 (=> (not res!322468) (not e!306413))))

(assert (=> b!525628 (= res!322468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!47754 res!322466) b!525627))

(assert (= (and b!525627 res!322467) b!525616))

(assert (= (and b!525616 res!322465) b!525624))

(assert (= (and b!525624 res!322464) b!525623))

(assert (= (and b!525623 res!322460) b!525617))

(assert (= (and b!525617 res!322462) b!525628))

(assert (= (and b!525628 res!322468) b!525621))

(assert (= (and b!525621 res!322461) b!525622))

(assert (= (and b!525622 res!322459) b!525620))

(assert (= (and b!525622 (not res!322458)) b!525626))

(assert (= (and b!525626 (not res!322469)) b!525625))

(assert (= (and b!525625 c!61884) b!525615))

(assert (= (and b!525625 (not c!61884)) b!525619))

(assert (= (and b!525615 res!322463) b!525618))

(declare-fun m!505813 () Bool)

(assert (=> b!525616 m!505813))

(assert (=> b!525616 m!505813))

(declare-fun m!505815 () Bool)

(assert (=> b!525616 m!505815))

(declare-fun m!505817 () Bool)

(assert (=> b!525625 m!505817))

(declare-fun m!505819 () Bool)

(assert (=> b!525625 m!505819))

(assert (=> b!525625 m!505813))

(declare-fun m!505821 () Bool)

(assert (=> b!525621 m!505821))

(assert (=> b!525620 m!505813))

(assert (=> b!525620 m!505813))

(declare-fun m!505823 () Bool)

(assert (=> b!525620 m!505823))

(declare-fun m!505825 () Bool)

(assert (=> b!525617 m!505825))

(declare-fun m!505827 () Bool)

(assert (=> b!525615 m!505827))

(declare-fun m!505829 () Bool)

(assert (=> b!525615 m!505829))

(declare-fun m!505831 () Bool)

(assert (=> start!47754 m!505831))

(declare-fun m!505833 () Bool)

(assert (=> start!47754 m!505833))

(declare-fun m!505835 () Bool)

(assert (=> b!525623 m!505835))

(declare-fun m!505837 () Bool)

(assert (=> b!525624 m!505837))

(declare-fun m!505839 () Bool)

(assert (=> b!525628 m!505839))

(declare-fun m!505841 () Bool)

(assert (=> b!525622 m!505841))

(declare-fun m!505843 () Bool)

(assert (=> b!525622 m!505843))

(declare-fun m!505845 () Bool)

(assert (=> b!525622 m!505845))

(declare-fun m!505847 () Bool)

(assert (=> b!525622 m!505847))

(assert (=> b!525622 m!505813))

(declare-fun m!505849 () Bool)

(assert (=> b!525622 m!505849))

(declare-fun m!505851 () Bool)

(assert (=> b!525622 m!505851))

(declare-fun m!505853 () Bool)

(assert (=> b!525622 m!505853))

(assert (=> b!525622 m!505813))

(declare-fun m!505855 () Bool)

(assert (=> b!525622 m!505855))

(assert (=> b!525622 m!505813))

(check-sat (not b!525625) (not b!525616) (not b!525620) (not b!525622) (not b!525623) (not b!525615) (not start!47754) (not b!525628) (not b!525624) (not b!525617) (not b!525621))
(check-sat)
