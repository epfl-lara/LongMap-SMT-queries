; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47454 () Bool)

(assert start!47454)

(declare-fun b!522502 () Bool)

(declare-fun e!304752 () Bool)

(declare-fun e!304747 () Bool)

(assert (=> b!522502 (= e!304752 (not e!304747))))

(declare-fun res!320150 () Bool)

(assert (=> b!522502 (=> res!320150 e!304747)))

(declare-datatypes ((array!33280 0))(
  ( (array!33281 (arr!15996 (Array (_ BitVec 32) (_ BitVec 64))) (size!16360 (_ BitVec 32))) )
))
(declare-fun lt!239642 () array!33280)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4463 0))(
  ( (MissingZero!4463 (index!20055 (_ BitVec 32))) (Found!4463 (index!20056 (_ BitVec 32))) (Intermediate!4463 (undefined!5275 Bool) (index!20057 (_ BitVec 32)) (x!49033 (_ BitVec 32))) (Undefined!4463) (MissingVacant!4463 (index!20058 (_ BitVec 32))) )
))
(declare-fun lt!239644 () SeekEntryResult!4463)

(declare-fun lt!239649 () (_ BitVec 32))

(declare-fun lt!239645 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33280 (_ BitVec 32)) SeekEntryResult!4463)

(assert (=> b!522502 (= res!320150 (= lt!239644 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239649 lt!239645 lt!239642 mask!3524)))))

(declare-fun lt!239646 () (_ BitVec 32))

(declare-fun a!3235 () array!33280)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!522502 (= lt!239644 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239646 (select (arr!15996 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!522502 (= lt!239649 (toIndex!0 lt!239645 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!522502 (= lt!239645 (select (store (arr!15996 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!522502 (= lt!239646 (toIndex!0 (select (arr!15996 a!3235) j!176) mask!3524))))

(assert (=> b!522502 (= lt!239642 (array!33281 (store (arr!15996 a!3235) i!1204 k!2280) (size!16360 a!3235)))))

(declare-fun e!304746 () Bool)

(assert (=> b!522502 e!304746))

(declare-fun res!320152 () Bool)

(assert (=> b!522502 (=> (not res!320152) (not e!304746))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33280 (_ BitVec 32)) Bool)

(assert (=> b!522502 (= res!320152 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16304 0))(
  ( (Unit!16305) )
))
(declare-fun lt!239643 () Unit!16304)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33280 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16304)

(assert (=> b!522502 (= lt!239643 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!522503 () Bool)

(declare-fun e!304751 () Unit!16304)

(declare-fun Unit!16306 () Unit!16304)

(assert (=> b!522503 (= e!304751 Unit!16306)))

(declare-fun lt!239650 () Unit!16304)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33280 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16304)

(assert (=> b!522503 (= lt!239650 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!239646 #b00000000000000000000000000000000 (index!20057 lt!239644) (x!49033 lt!239644) mask!3524))))

(declare-fun res!320157 () Bool)

(assert (=> b!522503 (= res!320157 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239646 lt!239645 lt!239642 mask!3524) (Intermediate!4463 false (index!20057 lt!239644) (x!49033 lt!239644))))))

(declare-fun e!304748 () Bool)

(assert (=> b!522503 (=> (not res!320157) (not e!304748))))

(assert (=> b!522503 e!304748))

(declare-fun b!522504 () Bool)

(assert (=> b!522504 (= e!304747 true)))

(assert (=> b!522504 (and (or (= (select (arr!15996 a!3235) (index!20057 lt!239644)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15996 a!3235) (index!20057 lt!239644)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15996 a!3235) (index!20057 lt!239644)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15996 a!3235) (index!20057 lt!239644)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!239647 () Unit!16304)

(assert (=> b!522504 (= lt!239647 e!304751)))

(declare-fun c!61478 () Bool)

(assert (=> b!522504 (= c!61478 (= (select (arr!15996 a!3235) (index!20057 lt!239644)) (select (arr!15996 a!3235) j!176)))))

(assert (=> b!522504 (and (bvslt (x!49033 lt!239644) #b01111111111111111111111111111110) (or (= (select (arr!15996 a!3235) (index!20057 lt!239644)) (select (arr!15996 a!3235) j!176)) (= (select (arr!15996 a!3235) (index!20057 lt!239644)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15996 a!3235) (index!20057 lt!239644)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!522505 () Bool)

(declare-fun e!304749 () Bool)

(assert (=> b!522505 (= e!304749 e!304752)))

(declare-fun res!320148 () Bool)

(assert (=> b!522505 (=> (not res!320148) (not e!304752))))

(declare-fun lt!239648 () SeekEntryResult!4463)

(assert (=> b!522505 (= res!320148 (or (= lt!239648 (MissingZero!4463 i!1204)) (= lt!239648 (MissingVacant!4463 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33280 (_ BitVec 32)) SeekEntryResult!4463)

(assert (=> b!522505 (= lt!239648 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!522506 () Bool)

(declare-fun res!320153 () Bool)

(assert (=> b!522506 (=> (not res!320153) (not e!304749))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!522506 (= res!320153 (validKeyInArray!0 k!2280))))

(declare-fun res!320156 () Bool)

(assert (=> start!47454 (=> (not res!320156) (not e!304749))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47454 (= res!320156 (validMask!0 mask!3524))))

(assert (=> start!47454 e!304749))

(assert (=> start!47454 true))

(declare-fun array_inv!11792 (array!33280) Bool)

(assert (=> start!47454 (array_inv!11792 a!3235)))

(declare-fun b!522507 () Bool)

(assert (=> b!522507 (= e!304746 (= (seekEntryOrOpen!0 (select (arr!15996 a!3235) j!176) a!3235 mask!3524) (Found!4463 j!176)))))

(declare-fun b!522508 () Bool)

(declare-fun Unit!16307 () Unit!16304)

(assert (=> b!522508 (= e!304751 Unit!16307)))

(declare-fun b!522509 () Bool)

(declare-fun res!320159 () Bool)

(assert (=> b!522509 (=> (not res!320159) (not e!304749))))

(assert (=> b!522509 (= res!320159 (and (= (size!16360 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16360 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16360 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!522510 () Bool)

(declare-fun res!320158 () Bool)

(assert (=> b!522510 (=> (not res!320158) (not e!304749))))

(assert (=> b!522510 (= res!320158 (validKeyInArray!0 (select (arr!15996 a!3235) j!176)))))

(declare-fun b!522511 () Bool)

(declare-fun res!320155 () Bool)

(assert (=> b!522511 (=> (not res!320155) (not e!304749))))

(declare-fun arrayContainsKey!0 (array!33280 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!522511 (= res!320155 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!522512 () Bool)

(declare-fun res!320149 () Bool)

(assert (=> b!522512 (=> (not res!320149) (not e!304752))))

(declare-datatypes ((List!10154 0))(
  ( (Nil!10151) (Cons!10150 (h!11072 (_ BitVec 64)) (t!16382 List!10154)) )
))
(declare-fun arrayNoDuplicates!0 (array!33280 (_ BitVec 32) List!10154) Bool)

(assert (=> b!522512 (= res!320149 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10151))))

(declare-fun b!522513 () Bool)

(declare-fun res!320154 () Bool)

(assert (=> b!522513 (=> res!320154 e!304747)))

(assert (=> b!522513 (= res!320154 (or (undefined!5275 lt!239644) (not (is-Intermediate!4463 lt!239644))))))

(declare-fun b!522514 () Bool)

(declare-fun res!320151 () Bool)

(assert (=> b!522514 (=> (not res!320151) (not e!304752))))

(assert (=> b!522514 (= res!320151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!522515 () Bool)

(assert (=> b!522515 (= e!304748 false)))

(assert (= (and start!47454 res!320156) b!522509))

(assert (= (and b!522509 res!320159) b!522510))

(assert (= (and b!522510 res!320158) b!522506))

(assert (= (and b!522506 res!320153) b!522511))

(assert (= (and b!522511 res!320155) b!522505))

(assert (= (and b!522505 res!320148) b!522514))

(assert (= (and b!522514 res!320151) b!522512))

(assert (= (and b!522512 res!320149) b!522502))

(assert (= (and b!522502 res!320152) b!522507))

(assert (= (and b!522502 (not res!320150)) b!522513))

(assert (= (and b!522513 (not res!320154)) b!522504))

(assert (= (and b!522504 c!61478) b!522503))

(assert (= (and b!522504 (not c!61478)) b!522508))

(assert (= (and b!522503 res!320157) b!522515))

(declare-fun m!503415 () Bool)

(assert (=> b!522503 m!503415))

(declare-fun m!503417 () Bool)

(assert (=> b!522503 m!503417))

(declare-fun m!503419 () Bool)

(assert (=> start!47454 m!503419))

(declare-fun m!503421 () Bool)

(assert (=> start!47454 m!503421))

(declare-fun m!503423 () Bool)

(assert (=> b!522514 m!503423))

(declare-fun m!503425 () Bool)

(assert (=> b!522505 m!503425))

(declare-fun m!503427 () Bool)

(assert (=> b!522502 m!503427))

(declare-fun m!503429 () Bool)

(assert (=> b!522502 m!503429))

(declare-fun m!503431 () Bool)

(assert (=> b!522502 m!503431))

(declare-fun m!503433 () Bool)

(assert (=> b!522502 m!503433))

(declare-fun m!503435 () Bool)

(assert (=> b!522502 m!503435))

(declare-fun m!503437 () Bool)

(assert (=> b!522502 m!503437))

(declare-fun m!503439 () Bool)

(assert (=> b!522502 m!503439))

(assert (=> b!522502 m!503437))

(declare-fun m!503441 () Bool)

(assert (=> b!522502 m!503441))

(assert (=> b!522502 m!503437))

(declare-fun m!503443 () Bool)

(assert (=> b!522502 m!503443))

(declare-fun m!503445 () Bool)

(assert (=> b!522512 m!503445))

(declare-fun m!503447 () Bool)

(assert (=> b!522511 m!503447))

(assert (=> b!522510 m!503437))

(assert (=> b!522510 m!503437))

(declare-fun m!503449 () Bool)

(assert (=> b!522510 m!503449))

(assert (=> b!522507 m!503437))

(assert (=> b!522507 m!503437))

(declare-fun m!503451 () Bool)

(assert (=> b!522507 m!503451))

(declare-fun m!503453 () Bool)

(assert (=> b!522504 m!503453))

(assert (=> b!522504 m!503437))

(declare-fun m!503455 () Bool)

(assert (=> b!522506 m!503455))

(push 1)

