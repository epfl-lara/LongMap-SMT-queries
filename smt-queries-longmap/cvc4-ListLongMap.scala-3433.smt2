; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47722 () Bool)

(assert start!47722)

(declare-fun res!321796 () Bool)

(declare-fun e!306125 () Bool)

(assert (=> start!47722 (=> (not res!321796) (not e!306125))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47722 (= res!321796 (validMask!0 mask!3524))))

(assert (=> start!47722 e!306125))

(assert (=> start!47722 true))

(declare-datatypes ((array!33359 0))(
  ( (array!33360 (arr!16031 (Array (_ BitVec 32) (_ BitVec 64))) (size!16395 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33359)

(declare-fun array_inv!11827 (array!33359) Bool)

(assert (=> start!47722 (array_inv!11827 a!3235)))

(declare-fun b!524962 () Bool)

(declare-fun res!321801 () Bool)

(assert (=> b!524962 (=> (not res!321801) (not e!306125))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33359 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!524962 (= res!321801 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!524963 () Bool)

(declare-fun res!321797 () Bool)

(assert (=> b!524963 (=> (not res!321797) (not e!306125))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!524963 (= res!321797 (and (= (size!16395 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16395 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16395 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!524964 () Bool)

(declare-fun res!321806 () Bool)

(declare-fun e!306122 () Bool)

(assert (=> b!524964 (=> (not res!321806) (not e!306122))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33359 (_ BitVec 32)) Bool)

(assert (=> b!524964 (= res!321806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!524965 () Bool)

(declare-fun res!321800 () Bool)

(assert (=> b!524965 (=> (not res!321800) (not e!306125))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!524965 (= res!321800 (validKeyInArray!0 k!2280))))

(declare-fun b!524966 () Bool)

(declare-datatypes ((Unit!16444 0))(
  ( (Unit!16445) )
))
(declare-fun e!306124 () Unit!16444)

(declare-fun Unit!16446 () Unit!16444)

(assert (=> b!524966 (= e!306124 Unit!16446)))

(declare-fun b!524967 () Bool)

(declare-fun e!306123 () Bool)

(declare-datatypes ((SeekEntryResult!4498 0))(
  ( (MissingZero!4498 (index!20204 (_ BitVec 32))) (Found!4498 (index!20205 (_ BitVec 32))) (Intermediate!4498 (undefined!5310 Bool) (index!20206 (_ BitVec 32)) (x!49183 (_ BitVec 32))) (Undefined!4498) (MissingVacant!4498 (index!20207 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33359 (_ BitVec 32)) SeekEntryResult!4498)

(assert (=> b!524967 (= e!306123 (= (seekEntryOrOpen!0 (select (arr!16031 a!3235) j!176) a!3235 mask!3524) (Found!4498 j!176)))))

(declare-fun b!524968 () Bool)

(declare-fun e!306120 () Bool)

(assert (=> b!524968 (= e!306120 false)))

(declare-fun b!524969 () Bool)

(declare-fun e!306121 () Bool)

(assert (=> b!524969 (= e!306121 true)))

(declare-fun lt!241060 () SeekEntryResult!4498)

(assert (=> b!524969 (= (index!20206 lt!241060) i!1204)))

(declare-fun lt!241054 () Unit!16444)

(declare-fun lt!241062 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33359 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16444)

(assert (=> b!524969 (= lt!241054 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!241062 #b00000000000000000000000000000000 (index!20206 lt!241060) (x!49183 lt!241060) mask!3524))))

(assert (=> b!524969 (and (or (= (select (arr!16031 a!3235) (index!20206 lt!241060)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16031 a!3235) (index!20206 lt!241060)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16031 a!3235) (index!20206 lt!241060)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16031 a!3235) (index!20206 lt!241060)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241056 () Unit!16444)

(assert (=> b!524969 (= lt!241056 e!306124)))

(declare-fun c!61889 () Bool)

(assert (=> b!524969 (= c!61889 (= (select (arr!16031 a!3235) (index!20206 lt!241060)) (select (arr!16031 a!3235) j!176)))))

(assert (=> b!524969 (and (bvslt (x!49183 lt!241060) #b01111111111111111111111111111110) (or (= (select (arr!16031 a!3235) (index!20206 lt!241060)) (select (arr!16031 a!3235) j!176)) (= (select (arr!16031 a!3235) (index!20206 lt!241060)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16031 a!3235) (index!20206 lt!241060)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!524970 () Bool)

(declare-fun Unit!16447 () Unit!16444)

(assert (=> b!524970 (= e!306124 Unit!16447)))

(declare-fun lt!241055 () Unit!16444)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33359 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16444)

(assert (=> b!524970 (= lt!241055 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!241062 #b00000000000000000000000000000000 (index!20206 lt!241060) (x!49183 lt!241060) mask!3524))))

(declare-fun lt!241063 () (_ BitVec 64))

(declare-fun lt!241057 () array!33359)

(declare-fun res!321803 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33359 (_ BitVec 32)) SeekEntryResult!4498)

(assert (=> b!524970 (= res!321803 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241062 lt!241063 lt!241057 mask!3524) (Intermediate!4498 false (index!20206 lt!241060) (x!49183 lt!241060))))))

(assert (=> b!524970 (=> (not res!321803) (not e!306120))))

(assert (=> b!524970 e!306120))

(declare-fun b!524971 () Bool)

(declare-fun res!321804 () Bool)

(assert (=> b!524971 (=> (not res!321804) (not e!306122))))

(declare-datatypes ((List!10189 0))(
  ( (Nil!10186) (Cons!10185 (h!11116 (_ BitVec 64)) (t!16417 List!10189)) )
))
(declare-fun arrayNoDuplicates!0 (array!33359 (_ BitVec 32) List!10189) Bool)

(assert (=> b!524971 (= res!321804 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10186))))

(declare-fun b!524972 () Bool)

(declare-fun res!321805 () Bool)

(assert (=> b!524972 (=> (not res!321805) (not e!306125))))

(assert (=> b!524972 (= res!321805 (validKeyInArray!0 (select (arr!16031 a!3235) j!176)))))

(declare-fun b!524973 () Bool)

(assert (=> b!524973 (= e!306122 (not e!306121))))

(declare-fun res!321799 () Bool)

(assert (=> b!524973 (=> res!321799 e!306121)))

(declare-fun lt!241058 () (_ BitVec 32))

(assert (=> b!524973 (= res!321799 (= lt!241060 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241058 lt!241063 lt!241057 mask!3524)))))

(assert (=> b!524973 (= lt!241060 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241062 (select (arr!16031 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!524973 (= lt!241058 (toIndex!0 lt!241063 mask!3524))))

(assert (=> b!524973 (= lt!241063 (select (store (arr!16031 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!524973 (= lt!241062 (toIndex!0 (select (arr!16031 a!3235) j!176) mask!3524))))

(assert (=> b!524973 (= lt!241057 (array!33360 (store (arr!16031 a!3235) i!1204 k!2280) (size!16395 a!3235)))))

(assert (=> b!524973 e!306123))

(declare-fun res!321802 () Bool)

(assert (=> b!524973 (=> (not res!321802) (not e!306123))))

(assert (=> b!524973 (= res!321802 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241059 () Unit!16444)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33359 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16444)

(assert (=> b!524973 (= lt!241059 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!524974 () Bool)

(assert (=> b!524974 (= e!306125 e!306122)))

(declare-fun res!321795 () Bool)

(assert (=> b!524974 (=> (not res!321795) (not e!306122))))

(declare-fun lt!241061 () SeekEntryResult!4498)

(assert (=> b!524974 (= res!321795 (or (= lt!241061 (MissingZero!4498 i!1204)) (= lt!241061 (MissingVacant!4498 i!1204))))))

(assert (=> b!524974 (= lt!241061 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!524975 () Bool)

(declare-fun res!321798 () Bool)

(assert (=> b!524975 (=> res!321798 e!306121)))

(assert (=> b!524975 (= res!321798 (or (undefined!5310 lt!241060) (not (is-Intermediate!4498 lt!241060))))))

(assert (= (and start!47722 res!321796) b!524963))

(assert (= (and b!524963 res!321797) b!524972))

(assert (= (and b!524972 res!321805) b!524965))

(assert (= (and b!524965 res!321800) b!524962))

(assert (= (and b!524962 res!321801) b!524974))

(assert (= (and b!524974 res!321795) b!524964))

(assert (= (and b!524964 res!321806) b!524971))

(assert (= (and b!524971 res!321804) b!524973))

(assert (= (and b!524973 res!321802) b!524967))

(assert (= (and b!524973 (not res!321799)) b!524975))

(assert (= (and b!524975 (not res!321798)) b!524969))

(assert (= (and b!524969 c!61889) b!524970))

(assert (= (and b!524969 (not c!61889)) b!524966))

(assert (= (and b!524970 res!321803) b!524968))

(declare-fun m!505597 () Bool)

(assert (=> b!524967 m!505597))

(assert (=> b!524967 m!505597))

(declare-fun m!505599 () Bool)

(assert (=> b!524967 m!505599))

(declare-fun m!505601 () Bool)

(assert (=> b!524962 m!505601))

(declare-fun m!505603 () Bool)

(assert (=> b!524964 m!505603))

(declare-fun m!505605 () Bool)

(assert (=> b!524970 m!505605))

(declare-fun m!505607 () Bool)

(assert (=> b!524970 m!505607))

(declare-fun m!505609 () Bool)

(assert (=> b!524971 m!505609))

(declare-fun m!505611 () Bool)

(assert (=> b!524974 m!505611))

(declare-fun m!505613 () Bool)

(assert (=> b!524965 m!505613))

(declare-fun m!505615 () Bool)

(assert (=> start!47722 m!505615))

(declare-fun m!505617 () Bool)

(assert (=> start!47722 m!505617))

(declare-fun m!505619 () Bool)

(assert (=> b!524973 m!505619))

(declare-fun m!505621 () Bool)

(assert (=> b!524973 m!505621))

(declare-fun m!505623 () Bool)

(assert (=> b!524973 m!505623))

(declare-fun m!505625 () Bool)

(assert (=> b!524973 m!505625))

(assert (=> b!524973 m!505597))

(declare-fun m!505627 () Bool)

(assert (=> b!524973 m!505627))

(assert (=> b!524973 m!505597))

(declare-fun m!505629 () Bool)

(assert (=> b!524973 m!505629))

(declare-fun m!505631 () Bool)

(assert (=> b!524973 m!505631))

(assert (=> b!524973 m!505597))

(declare-fun m!505633 () Bool)

(assert (=> b!524973 m!505633))

(declare-fun m!505635 () Bool)

(assert (=> b!524969 m!505635))

(declare-fun m!505637 () Bool)

(assert (=> b!524969 m!505637))

(assert (=> b!524969 m!505597))

(assert (=> b!524972 m!505597))

(assert (=> b!524972 m!505597))

(declare-fun m!505639 () Bool)

(assert (=> b!524972 m!505639))

(push 1)

