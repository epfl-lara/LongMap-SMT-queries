; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47798 () Bool)

(assert start!47798)

(declare-fun b!526707 () Bool)

(declare-fun res!323346 () Bool)

(declare-fun e!306985 () Bool)

(assert (=> b!526707 (=> (not res!323346) (not e!306985))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!526707 (= res!323346 (validKeyInArray!0 k0!2280))))

(declare-fun b!526708 () Bool)

(declare-fun e!306989 () Bool)

(declare-datatypes ((SeekEntryResult!4492 0))(
  ( (MissingZero!4492 (index!20180 (_ BitVec 32))) (Found!4492 (index!20181 (_ BitVec 32))) (Intermediate!4492 (undefined!5304 Bool) (index!20182 (_ BitVec 32)) (x!49294 (_ BitVec 32))) (Undefined!4492) (MissingVacant!4492 (index!20183 (_ BitVec 32))) )
))
(declare-fun lt!242362 () SeekEntryResult!4492)

(assert (=> b!526708 (= e!306989 (bvsle (x!49294 lt!242362) #b01111111111111111111111111111110))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!526708 (= (index!20182 lt!242362) i!1204)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33436 0))(
  ( (array!33437 (arr!16069 (Array (_ BitVec 32) (_ BitVec 64))) (size!16433 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33436)

(declare-fun lt!242363 () (_ BitVec 32))

(declare-datatypes ((Unit!16579 0))(
  ( (Unit!16580) )
))
(declare-fun lt!242360 () Unit!16579)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33436 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16579)

(assert (=> b!526708 (= lt!242360 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!242363 #b00000000000000000000000000000000 (index!20182 lt!242362) (x!49294 lt!242362) mask!3524))))

(assert (=> b!526708 (and (or (= (select (arr!16069 a!3235) (index!20182 lt!242362)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16069 a!3235) (index!20182 lt!242362)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16069 a!3235) (index!20182 lt!242362)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16069 a!3235) (index!20182 lt!242362)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242359 () Unit!16579)

(declare-fun e!306986 () Unit!16579)

(assert (=> b!526708 (= lt!242359 e!306986)))

(declare-fun c!61991 () Bool)

(assert (=> b!526708 (= c!61991 (= (select (arr!16069 a!3235) (index!20182 lt!242362)) (select (arr!16069 a!3235) j!176)))))

(assert (=> b!526708 (and (bvslt (x!49294 lt!242362) #b01111111111111111111111111111110) (or (= (select (arr!16069 a!3235) (index!20182 lt!242362)) (select (arr!16069 a!3235) j!176)) (= (select (arr!16069 a!3235) (index!20182 lt!242362)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16069 a!3235) (index!20182 lt!242362)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!526709 () Bool)

(declare-fun res!323336 () Bool)

(assert (=> b!526709 (=> (not res!323336) (not e!306985))))

(assert (=> b!526709 (= res!323336 (validKeyInArray!0 (select (arr!16069 a!3235) j!176)))))

(declare-fun b!526710 () Bool)

(declare-fun e!306984 () Bool)

(assert (=> b!526710 (= e!306984 (not e!306989))))

(declare-fun res!323342 () Bool)

(assert (=> b!526710 (=> res!323342 e!306989)))

(declare-fun lt!242358 () (_ BitVec 32))

(declare-fun lt!242361 () (_ BitVec 64))

(declare-fun lt!242365 () array!33436)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33436 (_ BitVec 32)) SeekEntryResult!4492)

(assert (=> b!526710 (= res!323342 (= lt!242362 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242358 lt!242361 lt!242365 mask!3524)))))

(assert (=> b!526710 (= lt!242362 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242363 (select (arr!16069 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!526710 (= lt!242358 (toIndex!0 lt!242361 mask!3524))))

(assert (=> b!526710 (= lt!242361 (select (store (arr!16069 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!526710 (= lt!242363 (toIndex!0 (select (arr!16069 a!3235) j!176) mask!3524))))

(assert (=> b!526710 (= lt!242365 (array!33437 (store (arr!16069 a!3235) i!1204 k0!2280) (size!16433 a!3235)))))

(declare-fun e!306988 () Bool)

(assert (=> b!526710 e!306988))

(declare-fun res!323343 () Bool)

(assert (=> b!526710 (=> (not res!323343) (not e!306988))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33436 (_ BitVec 32)) Bool)

(assert (=> b!526710 (= res!323343 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!242356 () Unit!16579)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33436 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16579)

(assert (=> b!526710 (= lt!242356 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!526712 () Bool)

(declare-fun res!323337 () Bool)

(assert (=> b!526712 (=> (not res!323337) (not e!306984))))

(assert (=> b!526712 (= res!323337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!526713 () Bool)

(declare-fun Unit!16581 () Unit!16579)

(assert (=> b!526713 (= e!306986 Unit!16581)))

(declare-fun b!526714 () Bool)

(declare-fun e!306987 () Bool)

(assert (=> b!526714 (= e!306987 false)))

(declare-fun b!526715 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33436 (_ BitVec 32)) SeekEntryResult!4492)

(assert (=> b!526715 (= e!306988 (= (seekEntryOrOpen!0 (select (arr!16069 a!3235) j!176) a!3235 mask!3524) (Found!4492 j!176)))))

(declare-fun b!526716 () Bool)

(declare-fun res!323347 () Bool)

(assert (=> b!526716 (=> (not res!323347) (not e!306985))))

(assert (=> b!526716 (= res!323347 (and (= (size!16433 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16433 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16433 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!526717 () Bool)

(declare-fun res!323339 () Bool)

(assert (=> b!526717 (=> (not res!323339) (not e!306984))))

(declare-datatypes ((List!10134 0))(
  ( (Nil!10131) (Cons!10130 (h!11061 (_ BitVec 64)) (t!16354 List!10134)) )
))
(declare-fun arrayNoDuplicates!0 (array!33436 (_ BitVec 32) List!10134) Bool)

(assert (=> b!526717 (= res!323339 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10131))))

(declare-fun b!526718 () Bool)

(declare-fun Unit!16582 () Unit!16579)

(assert (=> b!526718 (= e!306986 Unit!16582)))

(declare-fun lt!242364 () Unit!16579)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33436 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16579)

(assert (=> b!526718 (= lt!242364 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!242363 #b00000000000000000000000000000000 (index!20182 lt!242362) (x!49294 lt!242362) mask!3524))))

(declare-fun res!323340 () Bool)

(assert (=> b!526718 (= res!323340 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242363 lt!242361 lt!242365 mask!3524) (Intermediate!4492 false (index!20182 lt!242362) (x!49294 lt!242362))))))

(assert (=> b!526718 (=> (not res!323340) (not e!306987))))

(assert (=> b!526718 e!306987))

(declare-fun b!526719 () Bool)

(assert (=> b!526719 (= e!306985 e!306984)))

(declare-fun res!323338 () Bool)

(assert (=> b!526719 (=> (not res!323338) (not e!306984))))

(declare-fun lt!242357 () SeekEntryResult!4492)

(assert (=> b!526719 (= res!323338 (or (= lt!242357 (MissingZero!4492 i!1204)) (= lt!242357 (MissingVacant!4492 i!1204))))))

(assert (=> b!526719 (= lt!242357 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!526720 () Bool)

(declare-fun res!323344 () Bool)

(assert (=> b!526720 (=> (not res!323344) (not e!306985))))

(declare-fun arrayContainsKey!0 (array!33436 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!526720 (= res!323344 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!526711 () Bool)

(declare-fun res!323341 () Bool)

(assert (=> b!526711 (=> res!323341 e!306989)))

(get-info :version)

(assert (=> b!526711 (= res!323341 (or (undefined!5304 lt!242362) (not ((_ is Intermediate!4492) lt!242362))))))

(declare-fun res!323345 () Bool)

(assert (=> start!47798 (=> (not res!323345) (not e!306985))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47798 (= res!323345 (validMask!0 mask!3524))))

(assert (=> start!47798 e!306985))

(assert (=> start!47798 true))

(declare-fun array_inv!11928 (array!33436) Bool)

(assert (=> start!47798 (array_inv!11928 a!3235)))

(assert (= (and start!47798 res!323345) b!526716))

(assert (= (and b!526716 res!323347) b!526709))

(assert (= (and b!526709 res!323336) b!526707))

(assert (= (and b!526707 res!323346) b!526720))

(assert (= (and b!526720 res!323344) b!526719))

(assert (= (and b!526719 res!323338) b!526712))

(assert (= (and b!526712 res!323337) b!526717))

(assert (= (and b!526717 res!323339) b!526710))

(assert (= (and b!526710 res!323343) b!526715))

(assert (= (and b!526710 (not res!323342)) b!526711))

(assert (= (and b!526711 (not res!323341)) b!526708))

(assert (= (and b!526708 c!61991) b!526718))

(assert (= (and b!526708 (not c!61991)) b!526713))

(assert (= (and b!526718 res!323340) b!526714))

(declare-fun m!507673 () Bool)

(assert (=> b!526718 m!507673))

(declare-fun m!507675 () Bool)

(assert (=> b!526718 m!507675))

(declare-fun m!507677 () Bool)

(assert (=> start!47798 m!507677))

(declare-fun m!507679 () Bool)

(assert (=> start!47798 m!507679))

(declare-fun m!507681 () Bool)

(assert (=> b!526720 m!507681))

(declare-fun m!507683 () Bool)

(assert (=> b!526710 m!507683))

(declare-fun m!507685 () Bool)

(assert (=> b!526710 m!507685))

(declare-fun m!507687 () Bool)

(assert (=> b!526710 m!507687))

(declare-fun m!507689 () Bool)

(assert (=> b!526710 m!507689))

(declare-fun m!507691 () Bool)

(assert (=> b!526710 m!507691))

(declare-fun m!507693 () Bool)

(assert (=> b!526710 m!507693))

(assert (=> b!526710 m!507691))

(assert (=> b!526710 m!507691))

(declare-fun m!507695 () Bool)

(assert (=> b!526710 m!507695))

(declare-fun m!507697 () Bool)

(assert (=> b!526710 m!507697))

(declare-fun m!507699 () Bool)

(assert (=> b!526710 m!507699))

(assert (=> b!526709 m!507691))

(assert (=> b!526709 m!507691))

(declare-fun m!507701 () Bool)

(assert (=> b!526709 m!507701))

(assert (=> b!526715 m!507691))

(assert (=> b!526715 m!507691))

(declare-fun m!507703 () Bool)

(assert (=> b!526715 m!507703))

(declare-fun m!507705 () Bool)

(assert (=> b!526717 m!507705))

(declare-fun m!507707 () Bool)

(assert (=> b!526712 m!507707))

(declare-fun m!507709 () Bool)

(assert (=> b!526707 m!507709))

(declare-fun m!507711 () Bool)

(assert (=> b!526708 m!507711))

(declare-fun m!507713 () Bool)

(assert (=> b!526708 m!507713))

(assert (=> b!526708 m!507691))

(declare-fun m!507715 () Bool)

(assert (=> b!526719 m!507715))

(check-sat (not b!526712) (not b!526708) (not b!526720) (not b!526707) (not b!526719) (not b!526709) (not b!526717) (not start!47798) (not b!526715) (not b!526710) (not b!526718))
(check-sat)
