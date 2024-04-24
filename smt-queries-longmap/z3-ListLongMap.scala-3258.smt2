; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45410 () Bool)

(assert start!45410)

(declare-fun b!499352 () Bool)

(declare-datatypes ((Unit!14923 0))(
  ( (Unit!14924) )
))
(declare-fun e!292619 () Unit!14923)

(declare-fun Unit!14925 () Unit!14923)

(assert (=> b!499352 (= e!292619 Unit!14925)))

(declare-fun b!499353 () Bool)

(declare-fun e!292620 () Bool)

(declare-fun e!292617 () Bool)

(assert (=> b!499353 (= e!292620 e!292617)))

(declare-fun res!301377 () Bool)

(assert (=> b!499353 (=> (not res!301377) (not e!292617))))

(declare-datatypes ((SeekEntryResult!3922 0))(
  ( (MissingZero!3922 (index!17870 (_ BitVec 32))) (Found!3922 (index!17871 (_ BitVec 32))) (Intermediate!3922 (undefined!4734 Bool) (index!17872 (_ BitVec 32)) (x!47060 (_ BitVec 32))) (Undefined!3922) (MissingVacant!3922 (index!17873 (_ BitVec 32))) )
))
(declare-fun lt!226442 () SeekEntryResult!3922)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!499353 (= res!301377 (or (= lt!226442 (MissingZero!3922 i!1204)) (= lt!226442 (MissingVacant!3922 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32236 0))(
  ( (array!32237 (arr!15499 (Array (_ BitVec 32) (_ BitVec 64))) (size!15863 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32236)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32236 (_ BitVec 32)) SeekEntryResult!3922)

(assert (=> b!499353 (= lt!226442 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!499354 () Bool)

(declare-fun res!301374 () Bool)

(assert (=> b!499354 (=> (not res!301374) (not e!292617))))

(declare-datatypes ((List!9564 0))(
  ( (Nil!9561) (Cons!9560 (h!10434 (_ BitVec 64)) (t!15784 List!9564)) )
))
(declare-fun arrayNoDuplicates!0 (array!32236 (_ BitVec 32) List!9564) Bool)

(assert (=> b!499354 (= res!301374 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9561))))

(declare-fun res!301380 () Bool)

(assert (=> start!45410 (=> (not res!301380) (not e!292620))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45410 (= res!301380 (validMask!0 mask!3524))))

(assert (=> start!45410 e!292620))

(assert (=> start!45410 true))

(declare-fun array_inv!11358 (array!32236) Bool)

(assert (=> start!45410 (array_inv!11358 a!3235)))

(declare-fun b!499355 () Bool)

(declare-fun res!301381 () Bool)

(assert (=> b!499355 (=> (not res!301381) (not e!292620))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!499355 (= res!301381 (and (= (size!15863 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15863 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15863 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!499356 () Bool)

(declare-fun res!301373 () Bool)

(declare-fun e!292623 () Bool)

(assert (=> b!499356 (=> res!301373 e!292623)))

(declare-fun lt!226443 () SeekEntryResult!3922)

(get-info :version)

(assert (=> b!499356 (= res!301373 (or (undefined!4734 lt!226443) (not ((_ is Intermediate!3922) lt!226443))))))

(declare-fun b!499357 () Bool)

(declare-fun Unit!14926 () Unit!14923)

(assert (=> b!499357 (= e!292619 Unit!14926)))

(declare-fun lt!226448 () Unit!14923)

(declare-fun lt!226449 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32236 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14923)

(assert (=> b!499357 (= lt!226448 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!226449 #b00000000000000000000000000000000 (index!17872 lt!226443) (x!47060 lt!226443) mask!3524))))

(declare-fun lt!226447 () (_ BitVec 64))

(declare-fun lt!226444 () array!32236)

(declare-fun res!301376 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32236 (_ BitVec 32)) SeekEntryResult!3922)

(assert (=> b!499357 (= res!301376 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226449 lt!226447 lt!226444 mask!3524) (Intermediate!3922 false (index!17872 lt!226443) (x!47060 lt!226443))))))

(declare-fun e!292616 () Bool)

(assert (=> b!499357 (=> (not res!301376) (not e!292616))))

(assert (=> b!499357 e!292616))

(declare-fun b!499358 () Bool)

(assert (=> b!499358 (= e!292616 false)))

(declare-fun b!499359 () Bool)

(declare-fun res!301375 () Bool)

(assert (=> b!499359 (=> (not res!301375) (not e!292617))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32236 (_ BitVec 32)) Bool)

(assert (=> b!499359 (= res!301375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun e!292618 () Bool)

(declare-fun b!499360 () Bool)

(assert (=> b!499360 (= e!292618 (= (seekEntryOrOpen!0 (select (arr!15499 a!3235) j!176) a!3235 mask!3524) (Found!3922 j!176)))))

(declare-fun b!499361 () Bool)

(declare-fun e!292622 () Bool)

(assert (=> b!499361 (= e!292622 true)))

(declare-fun lt!226450 () SeekEntryResult!3922)

(assert (=> b!499361 (= lt!226450 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226449 lt!226447 lt!226444 mask!3524))))

(declare-fun b!499362 () Bool)

(declare-fun res!301382 () Bool)

(assert (=> b!499362 (=> (not res!301382) (not e!292620))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!499362 (= res!301382 (validKeyInArray!0 k0!2280))))

(declare-fun b!499363 () Bool)

(declare-fun res!301372 () Bool)

(assert (=> b!499363 (=> (not res!301372) (not e!292620))))

(assert (=> b!499363 (= res!301372 (validKeyInArray!0 (select (arr!15499 a!3235) j!176)))))

(declare-fun b!499364 () Bool)

(assert (=> b!499364 (= e!292617 (not e!292623))))

(declare-fun res!301383 () Bool)

(assert (=> b!499364 (=> res!301383 e!292623)))

(declare-fun lt!226446 () (_ BitVec 32))

(assert (=> b!499364 (= res!301383 (= lt!226443 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226446 lt!226447 lt!226444 mask!3524)))))

(assert (=> b!499364 (= lt!226443 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226449 (select (arr!15499 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!499364 (= lt!226446 (toIndex!0 lt!226447 mask!3524))))

(assert (=> b!499364 (= lt!226447 (select (store (arr!15499 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!499364 (= lt!226449 (toIndex!0 (select (arr!15499 a!3235) j!176) mask!3524))))

(assert (=> b!499364 (= lt!226444 (array!32237 (store (arr!15499 a!3235) i!1204 k0!2280) (size!15863 a!3235)))))

(assert (=> b!499364 e!292618))

(declare-fun res!301378 () Bool)

(assert (=> b!499364 (=> (not res!301378) (not e!292618))))

(assert (=> b!499364 (= res!301378 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226445 () Unit!14923)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32236 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14923)

(assert (=> b!499364 (= lt!226445 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!499365 () Bool)

(declare-fun res!301379 () Bool)

(assert (=> b!499365 (=> (not res!301379) (not e!292620))))

(declare-fun arrayContainsKey!0 (array!32236 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!499365 (= res!301379 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!499366 () Bool)

(assert (=> b!499366 (= e!292623 e!292622)))

(declare-fun res!301384 () Bool)

(assert (=> b!499366 (=> res!301384 e!292622)))

(assert (=> b!499366 (= res!301384 (or (bvsgt #b00000000000000000000000000000000 (x!47060 lt!226443)) (bvsgt (x!47060 lt!226443) #b01111111111111111111111111111110) (bvslt lt!226449 #b00000000000000000000000000000000) (bvsge lt!226449 (size!15863 a!3235)) (bvslt (index!17872 lt!226443) #b00000000000000000000000000000000) (bvsge (index!17872 lt!226443) (size!15863 a!3235)) (not (= lt!226443 (Intermediate!3922 false (index!17872 lt!226443) (x!47060 lt!226443))))))))

(assert (=> b!499366 (and (or (= (select (arr!15499 a!3235) (index!17872 lt!226443)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15499 a!3235) (index!17872 lt!226443)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15499 a!3235) (index!17872 lt!226443)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15499 a!3235) (index!17872 lt!226443)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226441 () Unit!14923)

(assert (=> b!499366 (= lt!226441 e!292619)))

(declare-fun c!59267 () Bool)

(assert (=> b!499366 (= c!59267 (= (select (arr!15499 a!3235) (index!17872 lt!226443)) (select (arr!15499 a!3235) j!176)))))

(assert (=> b!499366 (and (bvslt (x!47060 lt!226443) #b01111111111111111111111111111110) (or (= (select (arr!15499 a!3235) (index!17872 lt!226443)) (select (arr!15499 a!3235) j!176)) (= (select (arr!15499 a!3235) (index!17872 lt!226443)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15499 a!3235) (index!17872 lt!226443)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!45410 res!301380) b!499355))

(assert (= (and b!499355 res!301381) b!499363))

(assert (= (and b!499363 res!301372) b!499362))

(assert (= (and b!499362 res!301382) b!499365))

(assert (= (and b!499365 res!301379) b!499353))

(assert (= (and b!499353 res!301377) b!499359))

(assert (= (and b!499359 res!301375) b!499354))

(assert (= (and b!499354 res!301374) b!499364))

(assert (= (and b!499364 res!301378) b!499360))

(assert (= (and b!499364 (not res!301383)) b!499356))

(assert (= (and b!499356 (not res!301373)) b!499366))

(assert (= (and b!499366 c!59267) b!499357))

(assert (= (and b!499366 (not c!59267)) b!499352))

(assert (= (and b!499357 res!301376) b!499358))

(assert (= (and b!499366 (not res!301384)) b!499361))

(declare-fun m!480799 () Bool)

(assert (=> b!499366 m!480799))

(declare-fun m!480801 () Bool)

(assert (=> b!499366 m!480801))

(declare-fun m!480803 () Bool)

(assert (=> b!499364 m!480803))

(declare-fun m!480805 () Bool)

(assert (=> b!499364 m!480805))

(declare-fun m!480807 () Bool)

(assert (=> b!499364 m!480807))

(assert (=> b!499364 m!480801))

(declare-fun m!480809 () Bool)

(assert (=> b!499364 m!480809))

(assert (=> b!499364 m!480801))

(declare-fun m!480811 () Bool)

(assert (=> b!499364 m!480811))

(assert (=> b!499364 m!480801))

(declare-fun m!480813 () Bool)

(assert (=> b!499364 m!480813))

(declare-fun m!480815 () Bool)

(assert (=> b!499364 m!480815))

(declare-fun m!480817 () Bool)

(assert (=> b!499364 m!480817))

(declare-fun m!480819 () Bool)

(assert (=> b!499359 m!480819))

(declare-fun m!480821 () Bool)

(assert (=> b!499365 m!480821))

(declare-fun m!480823 () Bool)

(assert (=> start!45410 m!480823))

(declare-fun m!480825 () Bool)

(assert (=> start!45410 m!480825))

(declare-fun m!480827 () Bool)

(assert (=> b!499361 m!480827))

(assert (=> b!499360 m!480801))

(assert (=> b!499360 m!480801))

(declare-fun m!480829 () Bool)

(assert (=> b!499360 m!480829))

(declare-fun m!480831 () Bool)

(assert (=> b!499353 m!480831))

(assert (=> b!499363 m!480801))

(assert (=> b!499363 m!480801))

(declare-fun m!480833 () Bool)

(assert (=> b!499363 m!480833))

(declare-fun m!480835 () Bool)

(assert (=> b!499362 m!480835))

(declare-fun m!480837 () Bool)

(assert (=> b!499357 m!480837))

(assert (=> b!499357 m!480827))

(declare-fun m!480839 () Bool)

(assert (=> b!499354 m!480839))

(check-sat (not b!499363) (not b!499365) (not start!45410) (not b!499364) (not b!499354) (not b!499359) (not b!499362) (not b!499361) (not b!499360) (not b!499353) (not b!499357))
(check-sat)
