; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47910 () Bool)

(assert start!47910)

(declare-fun b!527725 () Bool)

(declare-fun res!324016 () Bool)

(declare-fun e!307548 () Bool)

(assert (=> b!527725 (=> (not res!324016) (not e!307548))))

(declare-datatypes ((array!33478 0))(
  ( (array!33479 (arr!16089 (Array (_ BitVec 32) (_ BitVec 64))) (size!16453 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33478)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!527725 (= res!324016 (validKeyInArray!0 (select (arr!16089 a!3235) j!176)))))

(declare-fun b!527726 () Bool)

(declare-fun res!324017 () Bool)

(declare-fun e!307550 () Bool)

(assert (=> b!527726 (=> (not res!324017) (not e!307550))))

(declare-datatypes ((List!10247 0))(
  ( (Nil!10244) (Cons!10243 (h!11177 (_ BitVec 64)) (t!16475 List!10247)) )
))
(declare-fun arrayNoDuplicates!0 (array!33478 (_ BitVec 32) List!10247) Bool)

(assert (=> b!527726 (= res!324017 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10244))))

(declare-fun b!527727 () Bool)

(declare-datatypes ((Unit!16676 0))(
  ( (Unit!16677) )
))
(declare-fun e!307554 () Unit!16676)

(declare-fun Unit!16678 () Unit!16676)

(assert (=> b!527727 (= e!307554 Unit!16678)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!242954 () Unit!16676)

(declare-fun lt!242949 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4556 0))(
  ( (MissingZero!4556 (index!20442 (_ BitVec 32))) (Found!4556 (index!20443 (_ BitVec 32))) (Intermediate!4556 (undefined!5368 Bool) (index!20444 (_ BitVec 32)) (x!49413 (_ BitVec 32))) (Undefined!4556) (MissingVacant!4556 (index!20445 (_ BitVec 32))) )
))
(declare-fun lt!242955 () SeekEntryResult!4556)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33478 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16676)

(assert (=> b!527727 (= lt!242954 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!242949 #b00000000000000000000000000000000 (index!20444 lt!242955) (x!49413 lt!242955) mask!3524))))

(declare-fun lt!242951 () array!33478)

(declare-fun lt!242947 () (_ BitVec 64))

(declare-fun res!324009 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33478 (_ BitVec 32)) SeekEntryResult!4556)

(assert (=> b!527727 (= res!324009 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242949 lt!242947 lt!242951 mask!3524) (Intermediate!4556 false (index!20444 lt!242955) (x!49413 lt!242955))))))

(declare-fun e!307553 () Bool)

(assert (=> b!527727 (=> (not res!324009) (not e!307553))))

(assert (=> b!527727 e!307553))

(declare-fun b!527728 () Bool)

(declare-fun res!324010 () Bool)

(assert (=> b!527728 (=> (not res!324010) (not e!307548))))

(assert (=> b!527728 (= res!324010 (validKeyInArray!0 k!2280))))

(declare-fun b!527729 () Bool)

(declare-fun res!324014 () Bool)

(assert (=> b!527729 (=> (not res!324014) (not e!307550))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33478 (_ BitVec 32)) Bool)

(assert (=> b!527729 (= res!324014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!527730 () Bool)

(declare-fun res!324015 () Bool)

(declare-fun e!307551 () Bool)

(assert (=> b!527730 (=> res!324015 e!307551)))

(assert (=> b!527730 (= res!324015 (or (undefined!5368 lt!242955) (not (is-Intermediate!4556 lt!242955))))))

(declare-fun b!527731 () Bool)

(assert (=> b!527731 (= e!307551 true)))

(assert (=> b!527731 (= (index!20444 lt!242955) i!1204)))

(declare-fun lt!242953 () Unit!16676)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33478 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16676)

(assert (=> b!527731 (= lt!242953 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!242949 #b00000000000000000000000000000000 (index!20444 lt!242955) (x!49413 lt!242955) mask!3524))))

(assert (=> b!527731 (and (or (= (select (arr!16089 a!3235) (index!20444 lt!242955)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16089 a!3235) (index!20444 lt!242955)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16089 a!3235) (index!20444 lt!242955)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16089 a!3235) (index!20444 lt!242955)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242948 () Unit!16676)

(assert (=> b!527731 (= lt!242948 e!307554)))

(declare-fun c!62165 () Bool)

(assert (=> b!527731 (= c!62165 (= (select (arr!16089 a!3235) (index!20444 lt!242955)) (select (arr!16089 a!3235) j!176)))))

(assert (=> b!527731 (and (bvslt (x!49413 lt!242955) #b01111111111111111111111111111110) (or (= (select (arr!16089 a!3235) (index!20444 lt!242955)) (select (arr!16089 a!3235) j!176)) (= (select (arr!16089 a!3235) (index!20444 lt!242955)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16089 a!3235) (index!20444 lt!242955)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!307549 () Bool)

(declare-fun b!527732 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33478 (_ BitVec 32)) SeekEntryResult!4556)

(assert (=> b!527732 (= e!307549 (= (seekEntryOrOpen!0 (select (arr!16089 a!3235) j!176) a!3235 mask!3524) (Found!4556 j!176)))))

(declare-fun res!324012 () Bool)

(assert (=> start!47910 (=> (not res!324012) (not e!307548))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47910 (= res!324012 (validMask!0 mask!3524))))

(assert (=> start!47910 e!307548))

(assert (=> start!47910 true))

(declare-fun array_inv!11885 (array!33478) Bool)

(assert (=> start!47910 (array_inv!11885 a!3235)))

(declare-fun b!527733 () Bool)

(declare-fun res!324013 () Bool)

(assert (=> b!527733 (=> (not res!324013) (not e!307548))))

(assert (=> b!527733 (= res!324013 (and (= (size!16453 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16453 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16453 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!527734 () Bool)

(declare-fun res!324018 () Bool)

(assert (=> b!527734 (=> (not res!324018) (not e!307548))))

(declare-fun arrayContainsKey!0 (array!33478 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!527734 (= res!324018 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!527735 () Bool)

(assert (=> b!527735 (= e!307553 false)))

(declare-fun b!527736 () Bool)

(declare-fun Unit!16679 () Unit!16676)

(assert (=> b!527736 (= e!307554 Unit!16679)))

(declare-fun b!527737 () Bool)

(assert (=> b!527737 (= e!307550 (not e!307551))))

(declare-fun res!324011 () Bool)

(assert (=> b!527737 (=> res!324011 e!307551)))

(declare-fun lt!242950 () (_ BitVec 32))

(assert (=> b!527737 (= res!324011 (= lt!242955 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242950 lt!242947 lt!242951 mask!3524)))))

(assert (=> b!527737 (= lt!242955 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242949 (select (arr!16089 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!527737 (= lt!242950 (toIndex!0 lt!242947 mask!3524))))

(assert (=> b!527737 (= lt!242947 (select (store (arr!16089 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!527737 (= lt!242949 (toIndex!0 (select (arr!16089 a!3235) j!176) mask!3524))))

(assert (=> b!527737 (= lt!242951 (array!33479 (store (arr!16089 a!3235) i!1204 k!2280) (size!16453 a!3235)))))

(assert (=> b!527737 e!307549))

(declare-fun res!324019 () Bool)

(assert (=> b!527737 (=> (not res!324019) (not e!307549))))

(assert (=> b!527737 (= res!324019 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!242952 () Unit!16676)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33478 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16676)

(assert (=> b!527737 (= lt!242952 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!527738 () Bool)

(assert (=> b!527738 (= e!307548 e!307550)))

(declare-fun res!324020 () Bool)

(assert (=> b!527738 (=> (not res!324020) (not e!307550))))

(declare-fun lt!242956 () SeekEntryResult!4556)

(assert (=> b!527738 (= res!324020 (or (= lt!242956 (MissingZero!4556 i!1204)) (= lt!242956 (MissingVacant!4556 i!1204))))))

(assert (=> b!527738 (= lt!242956 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!47910 res!324012) b!527733))

(assert (= (and b!527733 res!324013) b!527725))

(assert (= (and b!527725 res!324016) b!527728))

(assert (= (and b!527728 res!324010) b!527734))

(assert (= (and b!527734 res!324018) b!527738))

(assert (= (and b!527738 res!324020) b!527729))

(assert (= (and b!527729 res!324014) b!527726))

(assert (= (and b!527726 res!324017) b!527737))

(assert (= (and b!527737 res!324019) b!527732))

(assert (= (and b!527737 (not res!324011)) b!527730))

(assert (= (and b!527730 (not res!324015)) b!527731))

(assert (= (and b!527731 c!62165) b!527727))

(assert (= (and b!527731 (not c!62165)) b!527736))

(assert (= (and b!527727 res!324009) b!527735))

(declare-fun m!508389 () Bool)

(assert (=> b!527732 m!508389))

(assert (=> b!527732 m!508389))

(declare-fun m!508391 () Bool)

(assert (=> b!527732 m!508391))

(declare-fun m!508393 () Bool)

(assert (=> start!47910 m!508393))

(declare-fun m!508395 () Bool)

(assert (=> start!47910 m!508395))

(assert (=> b!527725 m!508389))

(assert (=> b!527725 m!508389))

(declare-fun m!508397 () Bool)

(assert (=> b!527725 m!508397))

(declare-fun m!508399 () Bool)

(assert (=> b!527729 m!508399))

(declare-fun m!508401 () Bool)

(assert (=> b!527734 m!508401))

(declare-fun m!508403 () Bool)

(assert (=> b!527727 m!508403))

(declare-fun m!508405 () Bool)

(assert (=> b!527727 m!508405))

(declare-fun m!508407 () Bool)

(assert (=> b!527728 m!508407))

(declare-fun m!508409 () Bool)

(assert (=> b!527726 m!508409))

(declare-fun m!508411 () Bool)

(assert (=> b!527731 m!508411))

(declare-fun m!508413 () Bool)

(assert (=> b!527731 m!508413))

(assert (=> b!527731 m!508389))

(declare-fun m!508415 () Bool)

(assert (=> b!527738 m!508415))

(declare-fun m!508417 () Bool)

(assert (=> b!527737 m!508417))

(declare-fun m!508419 () Bool)

(assert (=> b!527737 m!508419))

(assert (=> b!527737 m!508389))

(declare-fun m!508421 () Bool)

(assert (=> b!527737 m!508421))

(declare-fun m!508423 () Bool)

(assert (=> b!527737 m!508423))

(assert (=> b!527737 m!508389))

(declare-fun m!508425 () Bool)

(assert (=> b!527737 m!508425))

(declare-fun m!508427 () Bool)

(assert (=> b!527737 m!508427))

(declare-fun m!508429 () Bool)

(assert (=> b!527737 m!508429))

(assert (=> b!527737 m!508389))

(declare-fun m!508431 () Bool)

(assert (=> b!527737 m!508431))

(push 1)

