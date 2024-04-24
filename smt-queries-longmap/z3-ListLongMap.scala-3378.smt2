; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46670 () Bool)

(assert start!46670)

(declare-fun res!314640 () Bool)

(declare-fun e!300749 () Bool)

(assert (=> start!46670 (=> (not res!314640) (not e!300749))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46670 (= res!314640 (validMask!0 mask!3524))))

(assert (=> start!46670 e!300749))

(assert (=> start!46670 true))

(declare-datatypes ((array!32983 0))(
  ( (array!32984 (arr!15859 (Array (_ BitVec 32) (_ BitVec 64))) (size!16223 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32983)

(declare-fun array_inv!11718 (array!32983) Bool)

(assert (=> start!46670 (array_inv!11718 a!3235)))

(declare-fun b!515022 () Bool)

(declare-fun res!314645 () Bool)

(declare-fun e!300746 () Bool)

(assert (=> b!515022 (=> res!314645 e!300746)))

(declare-datatypes ((SeekEntryResult!4282 0))(
  ( (MissingZero!4282 (index!19316 (_ BitVec 32))) (Found!4282 (index!19317 (_ BitVec 32))) (Intermediate!4282 (undefined!5094 Bool) (index!19318 (_ BitVec 32)) (x!48434 (_ BitVec 32))) (Undefined!4282) (MissingVacant!4282 (index!19319 (_ BitVec 32))) )
))
(declare-fun lt!235816 () SeekEntryResult!4282)

(get-info :version)

(assert (=> b!515022 (= res!314645 (or (undefined!5094 lt!235816) (not ((_ is Intermediate!4282) lt!235816))))))

(declare-fun b!515023 () Bool)

(declare-fun res!314649 () Bool)

(declare-fun e!300750 () Bool)

(assert (=> b!515023 (=> (not res!314649) (not e!300750))))

(declare-datatypes ((List!9924 0))(
  ( (Nil!9921) (Cons!9920 (h!10818 (_ BitVec 64)) (t!16144 List!9924)) )
))
(declare-fun arrayNoDuplicates!0 (array!32983 (_ BitVec 32) List!9924) Bool)

(assert (=> b!515023 (= res!314649 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9921))))

(declare-fun b!515024 () Bool)

(declare-fun res!314643 () Bool)

(assert (=> b!515024 (=> (not res!314643) (not e!300749))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!515024 (= res!314643 (and (= (size!16223 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16223 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16223 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!515025 () Bool)

(assert (=> b!515025 (= e!300750 (not e!300746))))

(declare-fun res!314646 () Bool)

(assert (=> b!515025 (=> res!314646 e!300746)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lt!235815 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32983 (_ BitVec 32)) SeekEntryResult!4282)

(assert (=> b!515025 (= res!314646 (= lt!235816 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235815 (select (store (arr!15859 a!3235) i!1204 k0!2280) j!176) (array!32984 (store (arr!15859 a!3235) i!1204 k0!2280) (size!16223 a!3235)) mask!3524)))))

(declare-fun lt!235814 () (_ BitVec 32))

(assert (=> b!515025 (= lt!235816 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235814 (select (arr!15859 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515025 (= lt!235815 (toIndex!0 (select (store (arr!15859 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!515025 (= lt!235814 (toIndex!0 (select (arr!15859 a!3235) j!176) mask!3524))))

(declare-fun e!300747 () Bool)

(assert (=> b!515025 e!300747))

(declare-fun res!314641 () Bool)

(assert (=> b!515025 (=> (not res!314641) (not e!300747))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32983 (_ BitVec 32)) Bool)

(assert (=> b!515025 (= res!314641 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15883 0))(
  ( (Unit!15884) )
))
(declare-fun lt!235812 () Unit!15883)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32983 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15883)

(assert (=> b!515025 (= lt!235812 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515026 () Bool)

(declare-fun res!314647 () Bool)

(assert (=> b!515026 (=> (not res!314647) (not e!300750))))

(assert (=> b!515026 (= res!314647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!515027 () Bool)

(declare-fun res!314648 () Bool)

(assert (=> b!515027 (=> (not res!314648) (not e!300749))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515027 (= res!314648 (validKeyInArray!0 (select (arr!15859 a!3235) j!176)))))

(declare-fun b!515028 () Bool)

(declare-fun res!314650 () Bool)

(assert (=> b!515028 (=> (not res!314650) (not e!300749))))

(assert (=> b!515028 (= res!314650 (validKeyInArray!0 k0!2280))))

(declare-fun b!515029 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32983 (_ BitVec 32)) SeekEntryResult!4282)

(assert (=> b!515029 (= e!300747 (= (seekEntryOrOpen!0 (select (arr!15859 a!3235) j!176) a!3235 mask!3524) (Found!4282 j!176)))))

(declare-fun b!515030 () Bool)

(assert (=> b!515030 (= e!300749 e!300750)))

(declare-fun res!314644 () Bool)

(assert (=> b!515030 (=> (not res!314644) (not e!300750))))

(declare-fun lt!235813 () SeekEntryResult!4282)

(assert (=> b!515030 (= res!314644 (or (= lt!235813 (MissingZero!4282 i!1204)) (= lt!235813 (MissingVacant!4282 i!1204))))))

(assert (=> b!515030 (= lt!235813 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!515031 () Bool)

(assert (=> b!515031 (= e!300746 true)))

(assert (=> b!515031 (and (bvslt (x!48434 lt!235816) #b01111111111111111111111111111110) (or (= (select (arr!15859 a!3235) (index!19318 lt!235816)) (select (arr!15859 a!3235) j!176)) (= (select (arr!15859 a!3235) (index!19318 lt!235816)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15859 a!3235) (index!19318 lt!235816)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515032 () Bool)

(declare-fun res!314642 () Bool)

(assert (=> b!515032 (=> (not res!314642) (not e!300749))))

(declare-fun arrayContainsKey!0 (array!32983 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515032 (= res!314642 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!46670 res!314640) b!515024))

(assert (= (and b!515024 res!314643) b!515027))

(assert (= (and b!515027 res!314648) b!515028))

(assert (= (and b!515028 res!314650) b!515032))

(assert (= (and b!515032 res!314642) b!515030))

(assert (= (and b!515030 res!314644) b!515026))

(assert (= (and b!515026 res!314647) b!515023))

(assert (= (and b!515023 res!314649) b!515025))

(assert (= (and b!515025 res!314641) b!515029))

(assert (= (and b!515025 (not res!314646)) b!515022))

(assert (= (and b!515022 (not res!314645)) b!515031))

(declare-fun m!496549 () Bool)

(assert (=> b!515032 m!496549))

(declare-fun m!496551 () Bool)

(assert (=> b!515031 m!496551))

(declare-fun m!496553 () Bool)

(assert (=> b!515031 m!496553))

(declare-fun m!496555 () Bool)

(assert (=> b!515028 m!496555))

(assert (=> b!515027 m!496553))

(assert (=> b!515027 m!496553))

(declare-fun m!496557 () Bool)

(assert (=> b!515027 m!496557))

(declare-fun m!496559 () Bool)

(assert (=> b!515025 m!496559))

(declare-fun m!496561 () Bool)

(assert (=> b!515025 m!496561))

(declare-fun m!496563 () Bool)

(assert (=> b!515025 m!496563))

(declare-fun m!496565 () Bool)

(assert (=> b!515025 m!496565))

(assert (=> b!515025 m!496559))

(assert (=> b!515025 m!496553))

(declare-fun m!496567 () Bool)

(assert (=> b!515025 m!496567))

(assert (=> b!515025 m!496553))

(declare-fun m!496569 () Bool)

(assert (=> b!515025 m!496569))

(assert (=> b!515025 m!496553))

(declare-fun m!496571 () Bool)

(assert (=> b!515025 m!496571))

(assert (=> b!515025 m!496559))

(declare-fun m!496573 () Bool)

(assert (=> b!515025 m!496573))

(declare-fun m!496575 () Bool)

(assert (=> b!515026 m!496575))

(declare-fun m!496577 () Bool)

(assert (=> b!515023 m!496577))

(declare-fun m!496579 () Bool)

(assert (=> start!46670 m!496579))

(declare-fun m!496581 () Bool)

(assert (=> start!46670 m!496581))

(declare-fun m!496583 () Bool)

(assert (=> b!515030 m!496583))

(assert (=> b!515029 m!496553))

(assert (=> b!515029 m!496553))

(declare-fun m!496585 () Bool)

(assert (=> b!515029 m!496585))

(check-sat (not b!515026) (not start!46670) (not b!515029) (not b!515023) (not b!515025) (not b!515028) (not b!515027) (not b!515030) (not b!515032))
(check-sat)
