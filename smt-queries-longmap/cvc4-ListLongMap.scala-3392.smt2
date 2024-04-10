; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46768 () Bool)

(assert start!46768)

(declare-fun b!516535 () Bool)

(declare-fun e!301445 () Bool)

(assert (=> b!516535 (= e!301445 true)))

(declare-datatypes ((SeekEntryResult!4375 0))(
  ( (MissingZero!4375 (index!19688 (_ BitVec 32))) (Found!4375 (index!19689 (_ BitVec 32))) (Intermediate!4375 (undefined!5187 Bool) (index!19690 (_ BitVec 32)) (x!48642 (_ BitVec 32))) (Undefined!4375) (MissingVacant!4375 (index!19691 (_ BitVec 32))) )
))
(declare-fun lt!236463 () SeekEntryResult!4375)

(declare-datatypes ((array!33080 0))(
  ( (array!33081 (arr!15908 (Array (_ BitVec 32) (_ BitVec 64))) (size!16272 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33080)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!516535 (and (bvslt (x!48642 lt!236463) #b01111111111111111111111111111110) (or (= (select (arr!15908 a!3235) (index!19690 lt!236463)) (select (arr!15908 a!3235) j!176)) (= (select (arr!15908 a!3235) (index!19690 lt!236463)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15908 a!3235) (index!19690 lt!236463)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!316107 () Bool)

(declare-fun e!301446 () Bool)

(assert (=> start!46768 (=> (not res!316107) (not e!301446))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46768 (= res!316107 (validMask!0 mask!3524))))

(assert (=> start!46768 e!301446))

(assert (=> start!46768 true))

(declare-fun array_inv!11704 (array!33080) Bool)

(assert (=> start!46768 (array_inv!11704 a!3235)))

(declare-fun b!516536 () Bool)

(declare-fun e!301447 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33080 (_ BitVec 32)) SeekEntryResult!4375)

(assert (=> b!516536 (= e!301447 (= (seekEntryOrOpen!0 (select (arr!15908 a!3235) j!176) a!3235 mask!3524) (Found!4375 j!176)))))

(declare-fun b!516537 () Bool)

(declare-fun res!316109 () Bool)

(declare-fun e!301448 () Bool)

(assert (=> b!516537 (=> (not res!316109) (not e!301448))))

(declare-datatypes ((List!10066 0))(
  ( (Nil!10063) (Cons!10062 (h!10960 (_ BitVec 64)) (t!16294 List!10066)) )
))
(declare-fun arrayNoDuplicates!0 (array!33080 (_ BitVec 32) List!10066) Bool)

(assert (=> b!516537 (= res!316109 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10063))))

(declare-fun b!516538 () Bool)

(declare-fun res!316101 () Bool)

(assert (=> b!516538 (=> (not res!316101) (not e!301446))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!516538 (= res!316101 (and (= (size!16272 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16272 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16272 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!516539 () Bool)

(declare-fun res!316105 () Bool)

(assert (=> b!516539 (=> res!316105 e!301445)))

(assert (=> b!516539 (= res!316105 (or (undefined!5187 lt!236463) (not (is-Intermediate!4375 lt!236463))))))

(declare-fun b!516540 () Bool)

(assert (=> b!516540 (= e!301446 e!301448)))

(declare-fun res!316103 () Bool)

(assert (=> b!516540 (=> (not res!316103) (not e!301448))))

(declare-fun lt!236461 () SeekEntryResult!4375)

(assert (=> b!516540 (= res!316103 (or (= lt!236461 (MissingZero!4375 i!1204)) (= lt!236461 (MissingVacant!4375 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!516540 (= lt!236461 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!516541 () Bool)

(assert (=> b!516541 (= e!301448 (not e!301445))))

(declare-fun res!316108 () Bool)

(assert (=> b!516541 (=> res!316108 e!301445)))

(declare-fun lt!236462 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33080 (_ BitVec 32)) SeekEntryResult!4375)

(assert (=> b!516541 (= res!316108 (= lt!236463 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236462 (select (store (arr!15908 a!3235) i!1204 k!2280) j!176) (array!33081 (store (arr!15908 a!3235) i!1204 k!2280) (size!16272 a!3235)) mask!3524)))))

(declare-fun lt!236464 () (_ BitVec 32))

(assert (=> b!516541 (= lt!236463 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236464 (select (arr!15908 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516541 (= lt!236462 (toIndex!0 (select (store (arr!15908 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!516541 (= lt!236464 (toIndex!0 (select (arr!15908 a!3235) j!176) mask!3524))))

(assert (=> b!516541 e!301447))

(declare-fun res!316106 () Bool)

(assert (=> b!516541 (=> (not res!316106) (not e!301447))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33080 (_ BitVec 32)) Bool)

(assert (=> b!516541 (= res!316106 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16008 0))(
  ( (Unit!16009) )
))
(declare-fun lt!236460 () Unit!16008)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33080 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16008)

(assert (=> b!516541 (= lt!236460 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!516542 () Bool)

(declare-fun res!316104 () Bool)

(assert (=> b!516542 (=> (not res!316104) (not e!301446))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!516542 (= res!316104 (validKeyInArray!0 (select (arr!15908 a!3235) j!176)))))

(declare-fun b!516543 () Bool)

(declare-fun res!316100 () Bool)

(assert (=> b!516543 (=> (not res!316100) (not e!301448))))

(assert (=> b!516543 (= res!316100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!516544 () Bool)

(declare-fun res!316099 () Bool)

(assert (=> b!516544 (=> (not res!316099) (not e!301446))))

(declare-fun arrayContainsKey!0 (array!33080 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!516544 (= res!316099 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!516545 () Bool)

(declare-fun res!316102 () Bool)

(assert (=> b!516545 (=> (not res!316102) (not e!301446))))

(assert (=> b!516545 (= res!316102 (validKeyInArray!0 k!2280))))

(assert (= (and start!46768 res!316107) b!516538))

(assert (= (and b!516538 res!316101) b!516542))

(assert (= (and b!516542 res!316104) b!516545))

(assert (= (and b!516545 res!316102) b!516544))

(assert (= (and b!516544 res!316099) b!516540))

(assert (= (and b!516540 res!316103) b!516543))

(assert (= (and b!516543 res!316100) b!516537))

(assert (= (and b!516537 res!316109) b!516541))

(assert (= (and b!516541 res!316106) b!516536))

(assert (= (and b!516541 (not res!316108)) b!516539))

(assert (= (and b!516539 (not res!316105)) b!516535))

(declare-fun m!498037 () Bool)

(assert (=> b!516545 m!498037))

(declare-fun m!498039 () Bool)

(assert (=> b!516544 m!498039))

(declare-fun m!498041 () Bool)

(assert (=> start!46768 m!498041))

(declare-fun m!498043 () Bool)

(assert (=> start!46768 m!498043))

(declare-fun m!498045 () Bool)

(assert (=> b!516541 m!498045))

(declare-fun m!498047 () Bool)

(assert (=> b!516541 m!498047))

(declare-fun m!498049 () Bool)

(assert (=> b!516541 m!498049))

(declare-fun m!498051 () Bool)

(assert (=> b!516541 m!498051))

(declare-fun m!498053 () Bool)

(assert (=> b!516541 m!498053))

(assert (=> b!516541 m!498051))

(declare-fun m!498055 () Bool)

(assert (=> b!516541 m!498055))

(assert (=> b!516541 m!498049))

(declare-fun m!498057 () Bool)

(assert (=> b!516541 m!498057))

(assert (=> b!516541 m!498049))

(declare-fun m!498059 () Bool)

(assert (=> b!516541 m!498059))

(assert (=> b!516541 m!498051))

(declare-fun m!498061 () Bool)

(assert (=> b!516541 m!498061))

(declare-fun m!498063 () Bool)

(assert (=> b!516535 m!498063))

(assert (=> b!516535 m!498051))

(declare-fun m!498065 () Bool)

(assert (=> b!516543 m!498065))

(assert (=> b!516536 m!498051))

(assert (=> b!516536 m!498051))

(declare-fun m!498067 () Bool)

(assert (=> b!516536 m!498067))

(declare-fun m!498069 () Bool)

(assert (=> b!516540 m!498069))

(assert (=> b!516542 m!498051))

(assert (=> b!516542 m!498051))

(declare-fun m!498071 () Bool)

(assert (=> b!516542 m!498071))

(declare-fun m!498073 () Bool)

(assert (=> b!516537 m!498073))

(push 1)

