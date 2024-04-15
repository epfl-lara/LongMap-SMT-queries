; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47898 () Bool)

(assert start!47898)

(declare-fun res!323880 () Bool)

(declare-fun e!307380 () Bool)

(assert (=> start!47898 (=> (not res!323880) (not e!307380))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47898 (= res!323880 (validMask!0 mask!3524))))

(assert (=> start!47898 e!307380))

(assert (=> start!47898 true))

(declare-datatypes ((array!33476 0))(
  ( (array!33477 (arr!16088 (Array (_ BitVec 32) (_ BitVec 64))) (size!16453 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33476)

(declare-fun array_inv!11971 (array!33476) Bool)

(assert (=> start!47898 (array_inv!11971 a!3235)))

(declare-fun b!527454 () Bool)

(declare-fun e!307376 () Bool)

(assert (=> b!527454 (= e!307380 e!307376)))

(declare-fun res!323886 () Bool)

(assert (=> b!527454 (=> (not res!323886) (not e!307376))))

(declare-datatypes ((SeekEntryResult!4552 0))(
  ( (MissingZero!4552 (index!20426 (_ BitVec 32))) (Found!4552 (index!20427 (_ BitVec 32))) (Intermediate!4552 (undefined!5364 Bool) (index!20428 (_ BitVec 32)) (x!49404 (_ BitVec 32))) (Undefined!4552) (MissingVacant!4552 (index!20429 (_ BitVec 32))) )
))
(declare-fun lt!242716 () SeekEntryResult!4552)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!527454 (= res!323886 (or (= lt!242716 (MissingZero!4552 i!1204)) (= lt!242716 (MissingVacant!4552 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33476 (_ BitVec 32)) SeekEntryResult!4552)

(assert (=> b!527454 (= lt!242716 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!527455 () Bool)

(declare-fun e!307378 () Bool)

(assert (=> b!527455 (= e!307378 false)))

(declare-fun b!527456 () Bool)

(declare-fun res!323890 () Bool)

(assert (=> b!527456 (=> (not res!323890) (not e!307380))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!527456 (= res!323890 (validKeyInArray!0 (select (arr!16088 a!3235) j!176)))))

(declare-fun b!527457 () Bool)

(declare-fun res!323889 () Bool)

(assert (=> b!527457 (=> (not res!323889) (not e!307380))))

(assert (=> b!527457 (= res!323889 (validKeyInArray!0 k0!2280))))

(declare-fun b!527458 () Bool)

(declare-fun res!323885 () Bool)

(assert (=> b!527458 (=> (not res!323885) (not e!307380))))

(assert (=> b!527458 (= res!323885 (and (= (size!16453 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16453 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16453 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!527459 () Bool)

(declare-datatypes ((Unit!16654 0))(
  ( (Unit!16655) )
))
(declare-fun e!307375 () Unit!16654)

(declare-fun Unit!16656 () Unit!16654)

(assert (=> b!527459 (= e!307375 Unit!16656)))

(declare-fun lt!242714 () (_ BitVec 32))

(declare-fun lt!242718 () SeekEntryResult!4552)

(declare-fun lt!242720 () Unit!16654)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33476 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16654)

(assert (=> b!527459 (= lt!242720 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!242714 #b00000000000000000000000000000000 (index!20428 lt!242718) (x!49404 lt!242718) mask!3524))))

(declare-fun res!323884 () Bool)

(declare-fun lt!242721 () (_ BitVec 64))

(declare-fun lt!242719 () array!33476)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33476 (_ BitVec 32)) SeekEntryResult!4552)

(assert (=> b!527459 (= res!323884 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242714 lt!242721 lt!242719 mask!3524) (Intermediate!4552 false (index!20428 lt!242718) (x!49404 lt!242718))))))

(assert (=> b!527459 (=> (not res!323884) (not e!307378))))

(assert (=> b!527459 e!307378))

(declare-fun b!527460 () Bool)

(declare-fun res!323888 () Bool)

(declare-fun e!307379 () Bool)

(assert (=> b!527460 (=> res!323888 e!307379)))

(get-info :version)

(assert (=> b!527460 (= res!323888 (or (undefined!5364 lt!242718) (not ((_ is Intermediate!4552) lt!242718))))))

(declare-fun b!527461 () Bool)

(declare-fun e!307374 () Bool)

(assert (=> b!527461 (= e!307374 (= (seekEntryOrOpen!0 (select (arr!16088 a!3235) j!176) a!3235 mask!3524) (Found!4552 j!176)))))

(declare-fun b!527462 () Bool)

(declare-fun res!323882 () Bool)

(assert (=> b!527462 (=> (not res!323882) (not e!307376))))

(declare-datatypes ((List!10285 0))(
  ( (Nil!10282) (Cons!10281 (h!11215 (_ BitVec 64)) (t!16504 List!10285)) )
))
(declare-fun arrayNoDuplicates!0 (array!33476 (_ BitVec 32) List!10285) Bool)

(assert (=> b!527462 (= res!323882 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10282))))

(declare-fun b!527463 () Bool)

(declare-fun res!323881 () Bool)

(assert (=> b!527463 (=> (not res!323881) (not e!307380))))

(declare-fun arrayContainsKey!0 (array!33476 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!527463 (= res!323881 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!527464 () Bool)

(declare-fun Unit!16657 () Unit!16654)

(assert (=> b!527464 (= e!307375 Unit!16657)))

(declare-fun b!527465 () Bool)

(assert (=> b!527465 (= e!307376 (not e!307379))))

(declare-fun res!323887 () Bool)

(assert (=> b!527465 (=> res!323887 e!307379)))

(declare-fun lt!242717 () (_ BitVec 32))

(assert (=> b!527465 (= res!323887 (= lt!242718 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242717 lt!242721 lt!242719 mask!3524)))))

(assert (=> b!527465 (= lt!242718 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242714 (select (arr!16088 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!527465 (= lt!242717 (toIndex!0 lt!242721 mask!3524))))

(assert (=> b!527465 (= lt!242721 (select (store (arr!16088 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!527465 (= lt!242714 (toIndex!0 (select (arr!16088 a!3235) j!176) mask!3524))))

(assert (=> b!527465 (= lt!242719 (array!33477 (store (arr!16088 a!3235) i!1204 k0!2280) (size!16453 a!3235)))))

(assert (=> b!527465 e!307374))

(declare-fun res!323891 () Bool)

(assert (=> b!527465 (=> (not res!323891) (not e!307374))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33476 (_ BitVec 32)) Bool)

(assert (=> b!527465 (= res!323891 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!242713 () Unit!16654)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33476 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16654)

(assert (=> b!527465 (= lt!242713 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!527466 () Bool)

(declare-fun res!323883 () Bool)

(assert (=> b!527466 (=> (not res!323883) (not e!307376))))

(assert (=> b!527466 (= res!323883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!527467 () Bool)

(assert (=> b!527467 (= e!307379 true)))

(assert (=> b!527467 (= (index!20428 lt!242718) i!1204)))

(declare-fun lt!242722 () Unit!16654)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33476 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16654)

(assert (=> b!527467 (= lt!242722 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!242714 #b00000000000000000000000000000000 (index!20428 lt!242718) (x!49404 lt!242718) mask!3524))))

(assert (=> b!527467 (and (or (= (select (arr!16088 a!3235) (index!20428 lt!242718)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16088 a!3235) (index!20428 lt!242718)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16088 a!3235) (index!20428 lt!242718)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16088 a!3235) (index!20428 lt!242718)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242715 () Unit!16654)

(assert (=> b!527467 (= lt!242715 e!307375)))

(declare-fun c!62094 () Bool)

(assert (=> b!527467 (= c!62094 (= (select (arr!16088 a!3235) (index!20428 lt!242718)) (select (arr!16088 a!3235) j!176)))))

(assert (=> b!527467 (and (bvslt (x!49404 lt!242718) #b01111111111111111111111111111110) (or (= (select (arr!16088 a!3235) (index!20428 lt!242718)) (select (arr!16088 a!3235) j!176)) (= (select (arr!16088 a!3235) (index!20428 lt!242718)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16088 a!3235) (index!20428 lt!242718)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!47898 res!323880) b!527458))

(assert (= (and b!527458 res!323885) b!527456))

(assert (= (and b!527456 res!323890) b!527457))

(assert (= (and b!527457 res!323889) b!527463))

(assert (= (and b!527463 res!323881) b!527454))

(assert (= (and b!527454 res!323886) b!527466))

(assert (= (and b!527466 res!323883) b!527462))

(assert (= (and b!527462 res!323882) b!527465))

(assert (= (and b!527465 res!323891) b!527461))

(assert (= (and b!527465 (not res!323887)) b!527460))

(assert (= (and b!527460 (not res!323888)) b!527467))

(assert (= (and b!527467 c!62094) b!527459))

(assert (= (and b!527467 (not c!62094)) b!527464))

(assert (= (and b!527459 res!323884) b!527455))

(declare-fun m!507637 () Bool)

(assert (=> start!47898 m!507637))

(declare-fun m!507639 () Bool)

(assert (=> start!47898 m!507639))

(declare-fun m!507641 () Bool)

(assert (=> b!527461 m!507641))

(assert (=> b!527461 m!507641))

(declare-fun m!507643 () Bool)

(assert (=> b!527461 m!507643))

(declare-fun m!507645 () Bool)

(assert (=> b!527457 m!507645))

(declare-fun m!507647 () Bool)

(assert (=> b!527466 m!507647))

(declare-fun m!507649 () Bool)

(assert (=> b!527463 m!507649))

(declare-fun m!507651 () Bool)

(assert (=> b!527467 m!507651))

(declare-fun m!507653 () Bool)

(assert (=> b!527467 m!507653))

(assert (=> b!527467 m!507641))

(declare-fun m!507655 () Bool)

(assert (=> b!527462 m!507655))

(assert (=> b!527456 m!507641))

(assert (=> b!527456 m!507641))

(declare-fun m!507657 () Bool)

(assert (=> b!527456 m!507657))

(declare-fun m!507659 () Bool)

(assert (=> b!527459 m!507659))

(declare-fun m!507661 () Bool)

(assert (=> b!527459 m!507661))

(declare-fun m!507663 () Bool)

(assert (=> b!527465 m!507663))

(declare-fun m!507665 () Bool)

(assert (=> b!527465 m!507665))

(declare-fun m!507667 () Bool)

(assert (=> b!527465 m!507667))

(declare-fun m!507669 () Bool)

(assert (=> b!527465 m!507669))

(assert (=> b!527465 m!507641))

(declare-fun m!507671 () Bool)

(assert (=> b!527465 m!507671))

(assert (=> b!527465 m!507641))

(declare-fun m!507673 () Bool)

(assert (=> b!527465 m!507673))

(assert (=> b!527465 m!507641))

(declare-fun m!507675 () Bool)

(assert (=> b!527465 m!507675))

(declare-fun m!507677 () Bool)

(assert (=> b!527465 m!507677))

(declare-fun m!507679 () Bool)

(assert (=> b!527454 m!507679))

(check-sat (not b!527466) (not b!527457) (not b!527462) (not b!527459) (not b!527465) (not b!527454) (not b!527463) (not start!47898) (not b!527461) (not b!527456) (not b!527467))
(check-sat)
