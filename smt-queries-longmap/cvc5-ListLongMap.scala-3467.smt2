; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48132 () Bool)

(assert start!48132)

(declare-fun b!530137 () Bool)

(declare-fun res!325849 () Bool)

(declare-fun e!308898 () Bool)

(assert (=> b!530137 (=> (not res!325849) (not e!308898))))

(declare-datatypes ((array!33568 0))(
  ( (array!33569 (arr!16131 (Array (_ BitVec 32) (_ BitVec 64))) (size!16495 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33568)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33568 (_ BitVec 32)) Bool)

(assert (=> b!530137 (= res!325849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!530138 () Bool)

(declare-fun e!308899 () Bool)

(assert (=> b!530138 (= e!308899 e!308898)))

(declare-fun res!325843 () Bool)

(assert (=> b!530138 (=> (not res!325843) (not e!308898))))

(declare-datatypes ((SeekEntryResult!4598 0))(
  ( (MissingZero!4598 (index!20616 (_ BitVec 32))) (Found!4598 (index!20617 (_ BitVec 32))) (Intermediate!4598 (undefined!5410 Bool) (index!20618 (_ BitVec 32)) (x!49588 (_ BitVec 32))) (Undefined!4598) (MissingVacant!4598 (index!20619 (_ BitVec 32))) )
))
(declare-fun lt!244536 () SeekEntryResult!4598)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!530138 (= res!325843 (or (= lt!244536 (MissingZero!4598 i!1204)) (= lt!244536 (MissingVacant!4598 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33568 (_ BitVec 32)) SeekEntryResult!4598)

(assert (=> b!530138 (= lt!244536 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!530139 () Bool)

(declare-fun res!325850 () Bool)

(assert (=> b!530139 (=> (not res!325850) (not e!308899))))

(declare-fun arrayContainsKey!0 (array!33568 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530139 (= res!325850 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!530140 () Bool)

(declare-fun e!308897 () Bool)

(assert (=> b!530140 (= e!308897 true)))

(declare-fun lt!244533 () SeekEntryResult!4598)

(declare-fun lt!244537 () (_ BitVec 64))

(declare-fun lt!244538 () array!33568)

(assert (=> b!530140 (= lt!244533 (seekEntryOrOpen!0 lt!244537 lt!244538 mask!3524))))

(assert (=> b!530140 false))

(declare-fun b!530141 () Bool)

(declare-fun e!308901 () Bool)

(assert (=> b!530141 (= e!308898 (not e!308901))))

(declare-fun res!325845 () Bool)

(assert (=> b!530141 (=> res!325845 e!308901)))

(declare-fun lt!244539 () (_ BitVec 32))

(declare-fun lt!244535 () SeekEntryResult!4598)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33568 (_ BitVec 32)) SeekEntryResult!4598)

(assert (=> b!530141 (= res!325845 (= lt!244535 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244539 lt!244537 lt!244538 mask!3524)))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!244534 () (_ BitVec 32))

(assert (=> b!530141 (= lt!244535 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244534 (select (arr!16131 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!530141 (= lt!244539 (toIndex!0 lt!244537 mask!3524))))

(assert (=> b!530141 (= lt!244537 (select (store (arr!16131 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!530141 (= lt!244534 (toIndex!0 (select (arr!16131 a!3235) j!176) mask!3524))))

(assert (=> b!530141 (= lt!244538 (array!33569 (store (arr!16131 a!3235) i!1204 k!2280) (size!16495 a!3235)))))

(declare-fun e!308900 () Bool)

(assert (=> b!530141 e!308900))

(declare-fun res!325846 () Bool)

(assert (=> b!530141 (=> (not res!325846) (not e!308900))))

(assert (=> b!530141 (= res!325846 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16808 0))(
  ( (Unit!16809) )
))
(declare-fun lt!244540 () Unit!16808)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33568 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16808)

(assert (=> b!530141 (= lt!244540 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!530142 () Bool)

(assert (=> b!530142 (= e!308901 e!308897)))

(declare-fun res!325848 () Bool)

(assert (=> b!530142 (=> res!325848 e!308897)))

(declare-fun lt!244532 () Bool)

(assert (=> b!530142 (= res!325848 (or (and (not lt!244532) (undefined!5410 lt!244535)) (and (not lt!244532) (not (undefined!5410 lt!244535)))))))

(assert (=> b!530142 (= lt!244532 (not (is-Intermediate!4598 lt!244535)))))

(declare-fun b!530143 () Bool)

(declare-fun res!325851 () Bool)

(assert (=> b!530143 (=> (not res!325851) (not e!308899))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530143 (= res!325851 (validKeyInArray!0 (select (arr!16131 a!3235) j!176)))))

(declare-fun b!530144 () Bool)

(assert (=> b!530144 (= e!308900 (= (seekEntryOrOpen!0 (select (arr!16131 a!3235) j!176) a!3235 mask!3524) (Found!4598 j!176)))))

(declare-fun res!325853 () Bool)

(assert (=> start!48132 (=> (not res!325853) (not e!308899))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48132 (= res!325853 (validMask!0 mask!3524))))

(assert (=> start!48132 e!308899))

(assert (=> start!48132 true))

(declare-fun array_inv!11927 (array!33568) Bool)

(assert (=> start!48132 (array_inv!11927 a!3235)))

(declare-fun b!530145 () Bool)

(declare-fun res!325844 () Bool)

(assert (=> b!530145 (=> (not res!325844) (not e!308898))))

(declare-datatypes ((List!10289 0))(
  ( (Nil!10286) (Cons!10285 (h!11225 (_ BitVec 64)) (t!16517 List!10289)) )
))
(declare-fun arrayNoDuplicates!0 (array!33568 (_ BitVec 32) List!10289) Bool)

(assert (=> b!530145 (= res!325844 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10286))))

(declare-fun b!530146 () Bool)

(declare-fun res!325847 () Bool)

(assert (=> b!530146 (=> (not res!325847) (not e!308899))))

(assert (=> b!530146 (= res!325847 (validKeyInArray!0 k!2280))))

(declare-fun b!530147 () Bool)

(declare-fun res!325852 () Bool)

(assert (=> b!530147 (=> (not res!325852) (not e!308899))))

(assert (=> b!530147 (= res!325852 (and (= (size!16495 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16495 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16495 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!48132 res!325853) b!530147))

(assert (= (and b!530147 res!325852) b!530143))

(assert (= (and b!530143 res!325851) b!530146))

(assert (= (and b!530146 res!325847) b!530139))

(assert (= (and b!530139 res!325850) b!530138))

(assert (= (and b!530138 res!325843) b!530137))

(assert (= (and b!530137 res!325849) b!530145))

(assert (= (and b!530145 res!325844) b!530141))

(assert (= (and b!530141 res!325846) b!530144))

(assert (= (and b!530141 (not res!325845)) b!530142))

(assert (= (and b!530142 (not res!325848)) b!530140))

(declare-fun m!510675 () Bool)

(assert (=> b!530138 m!510675))

(declare-fun m!510677 () Bool)

(assert (=> b!530143 m!510677))

(assert (=> b!530143 m!510677))

(declare-fun m!510679 () Bool)

(assert (=> b!530143 m!510679))

(declare-fun m!510681 () Bool)

(assert (=> start!48132 m!510681))

(declare-fun m!510683 () Bool)

(assert (=> start!48132 m!510683))

(declare-fun m!510685 () Bool)

(assert (=> b!530140 m!510685))

(declare-fun m!510687 () Bool)

(assert (=> b!530145 m!510687))

(assert (=> b!530144 m!510677))

(assert (=> b!530144 m!510677))

(declare-fun m!510689 () Bool)

(assert (=> b!530144 m!510689))

(declare-fun m!510691 () Bool)

(assert (=> b!530146 m!510691))

(declare-fun m!510693 () Bool)

(assert (=> b!530137 m!510693))

(declare-fun m!510695 () Bool)

(assert (=> b!530141 m!510695))

(declare-fun m!510697 () Bool)

(assert (=> b!530141 m!510697))

(declare-fun m!510699 () Bool)

(assert (=> b!530141 m!510699))

(assert (=> b!530141 m!510677))

(declare-fun m!510701 () Bool)

(assert (=> b!530141 m!510701))

(declare-fun m!510703 () Bool)

(assert (=> b!530141 m!510703))

(assert (=> b!530141 m!510677))

(declare-fun m!510705 () Bool)

(assert (=> b!530141 m!510705))

(assert (=> b!530141 m!510677))

(declare-fun m!510707 () Bool)

(assert (=> b!530141 m!510707))

(declare-fun m!510709 () Bool)

(assert (=> b!530141 m!510709))

(declare-fun m!510711 () Bool)

(assert (=> b!530139 m!510711))

(push 1)

