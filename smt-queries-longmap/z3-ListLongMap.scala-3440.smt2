; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47748 () Bool)

(assert start!47748)

(declare-fun b!525489 () Bool)

(declare-fun e!306347 () Bool)

(assert (=> b!525489 (= e!306347 false)))

(declare-fun b!525490 () Bool)

(declare-fun res!322356 () Bool)

(declare-fun e!306350 () Bool)

(assert (=> b!525490 (=> (not res!322356) (not e!306350))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!525490 (= res!322356 (validKeyInArray!0 k0!2280))))

(declare-fun b!525491 () Bool)

(declare-datatypes ((Unit!16498 0))(
  ( (Unit!16499) )
))
(declare-fun e!306351 () Unit!16498)

(declare-fun Unit!16500 () Unit!16498)

(assert (=> b!525491 (= e!306351 Unit!16500)))

(declare-fun b!525492 () Bool)

(declare-fun res!322352 () Bool)

(assert (=> b!525492 (=> (not res!322352) (not e!306350))))

(declare-datatypes ((array!33395 0))(
  ( (array!33396 (arr!16049 (Array (_ BitVec 32) (_ BitVec 64))) (size!16414 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33395)

(declare-fun arrayContainsKey!0 (array!33395 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!525492 (= res!322352 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!525493 () Bool)

(declare-fun res!322357 () Bool)

(assert (=> b!525493 (=> (not res!322357) (not e!306350))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!525493 (= res!322357 (validKeyInArray!0 (select (arr!16049 a!3235) j!176)))))

(declare-fun b!525494 () Bool)

(declare-fun e!306349 () Bool)

(assert (=> b!525494 (= e!306349 true)))

(declare-datatypes ((SeekEntryResult!4513 0))(
  ( (MissingZero!4513 (index!20264 (_ BitVec 32))) (Found!4513 (index!20265 (_ BitVec 32))) (Intermediate!4513 (undefined!5325 Bool) (index!20266 (_ BitVec 32)) (x!49249 (_ BitVec 32))) (Undefined!4513) (MissingVacant!4513 (index!20267 (_ BitVec 32))) )
))
(declare-fun lt!241397 () SeekEntryResult!4513)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!525494 (= (index!20266 lt!241397) i!1204)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!241392 () Unit!16498)

(declare-fun lt!241391 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33395 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16498)

(assert (=> b!525494 (= lt!241392 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!241391 #b00000000000000000000000000000000 (index!20266 lt!241397) (x!49249 lt!241397) mask!3524))))

(assert (=> b!525494 (and (or (= (select (arr!16049 a!3235) (index!20266 lt!241397)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16049 a!3235) (index!20266 lt!241397)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16049 a!3235) (index!20266 lt!241397)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16049 a!3235) (index!20266 lt!241397)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241399 () Unit!16498)

(assert (=> b!525494 (= lt!241399 e!306351)))

(declare-fun c!61875 () Bool)

(assert (=> b!525494 (= c!61875 (= (select (arr!16049 a!3235) (index!20266 lt!241397)) (select (arr!16049 a!3235) j!176)))))

(assert (=> b!525494 (and (bvslt (x!49249 lt!241397) #b01111111111111111111111111111110) (or (= (select (arr!16049 a!3235) (index!20266 lt!241397)) (select (arr!16049 a!3235) j!176)) (= (select (arr!16049 a!3235) (index!20266 lt!241397)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16049 a!3235) (index!20266 lt!241397)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!525495 () Bool)

(declare-fun e!306345 () Bool)

(assert (=> b!525495 (= e!306350 e!306345)))

(declare-fun res!322361 () Bool)

(assert (=> b!525495 (=> (not res!322361) (not e!306345))))

(declare-fun lt!241396 () SeekEntryResult!4513)

(assert (=> b!525495 (= res!322361 (or (= lt!241396 (MissingZero!4513 i!1204)) (= lt!241396 (MissingVacant!4513 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33395 (_ BitVec 32)) SeekEntryResult!4513)

(assert (=> b!525495 (= lt!241396 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!525496 () Bool)

(declare-fun res!322358 () Bool)

(assert (=> b!525496 (=> (not res!322358) (not e!306345))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33395 (_ BitVec 32)) Bool)

(assert (=> b!525496 (= res!322358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!525497 () Bool)

(declare-fun res!322353 () Bool)

(assert (=> b!525497 (=> res!322353 e!306349)))

(get-info :version)

(assert (=> b!525497 (= res!322353 (or (undefined!5325 lt!241397) (not ((_ is Intermediate!4513) lt!241397))))))

(declare-fun b!525498 () Bool)

(declare-fun res!322355 () Bool)

(assert (=> b!525498 (=> (not res!322355) (not e!306350))))

(assert (=> b!525498 (= res!322355 (and (= (size!16414 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16414 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16414 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!322350 () Bool)

(assert (=> start!47748 (=> (not res!322350) (not e!306350))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47748 (= res!322350 (validMask!0 mask!3524))))

(assert (=> start!47748 e!306350))

(assert (=> start!47748 true))

(declare-fun array_inv!11932 (array!33395) Bool)

(assert (=> start!47748 (array_inv!11932 a!3235)))

(declare-fun b!525499 () Bool)

(declare-fun res!322351 () Bool)

(assert (=> b!525499 (=> (not res!322351) (not e!306345))))

(declare-datatypes ((List!10246 0))(
  ( (Nil!10243) (Cons!10242 (h!11173 (_ BitVec 64)) (t!16465 List!10246)) )
))
(declare-fun arrayNoDuplicates!0 (array!33395 (_ BitVec 32) List!10246) Bool)

(assert (=> b!525499 (= res!322351 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10243))))

(declare-fun e!306346 () Bool)

(declare-fun b!525500 () Bool)

(assert (=> b!525500 (= e!306346 (= (seekEntryOrOpen!0 (select (arr!16049 a!3235) j!176) a!3235 mask!3524) (Found!4513 j!176)))))

(declare-fun b!525501 () Bool)

(declare-fun Unit!16501 () Unit!16498)

(assert (=> b!525501 (= e!306351 Unit!16501)))

(declare-fun lt!241390 () Unit!16498)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33395 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16498)

(assert (=> b!525501 (= lt!241390 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!241391 #b00000000000000000000000000000000 (index!20266 lt!241397) (x!49249 lt!241397) mask!3524))))

(declare-fun res!322359 () Bool)

(declare-fun lt!241398 () (_ BitVec 64))

(declare-fun lt!241394 () array!33395)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33395 (_ BitVec 32)) SeekEntryResult!4513)

(assert (=> b!525501 (= res!322359 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241391 lt!241398 lt!241394 mask!3524) (Intermediate!4513 false (index!20266 lt!241397) (x!49249 lt!241397))))))

(assert (=> b!525501 (=> (not res!322359) (not e!306347))))

(assert (=> b!525501 e!306347))

(declare-fun b!525502 () Bool)

(assert (=> b!525502 (= e!306345 (not e!306349))))

(declare-fun res!322360 () Bool)

(assert (=> b!525502 (=> res!322360 e!306349)))

(declare-fun lt!241393 () (_ BitVec 32))

(assert (=> b!525502 (= res!322360 (= lt!241397 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241393 lt!241398 lt!241394 mask!3524)))))

(assert (=> b!525502 (= lt!241397 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241391 (select (arr!16049 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!525502 (= lt!241393 (toIndex!0 lt!241398 mask!3524))))

(assert (=> b!525502 (= lt!241398 (select (store (arr!16049 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!525502 (= lt!241391 (toIndex!0 (select (arr!16049 a!3235) j!176) mask!3524))))

(assert (=> b!525502 (= lt!241394 (array!33396 (store (arr!16049 a!3235) i!1204 k0!2280) (size!16414 a!3235)))))

(assert (=> b!525502 e!306346))

(declare-fun res!322354 () Bool)

(assert (=> b!525502 (=> (not res!322354) (not e!306346))))

(assert (=> b!525502 (= res!322354 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241395 () Unit!16498)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33395 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16498)

(assert (=> b!525502 (= lt!241395 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!47748 res!322350) b!525498))

(assert (= (and b!525498 res!322355) b!525493))

(assert (= (and b!525493 res!322357) b!525490))

(assert (= (and b!525490 res!322356) b!525492))

(assert (= (and b!525492 res!322352) b!525495))

(assert (= (and b!525495 res!322361) b!525496))

(assert (= (and b!525496 res!322358) b!525499))

(assert (= (and b!525499 res!322351) b!525502))

(assert (= (and b!525502 res!322354) b!525500))

(assert (= (and b!525502 (not res!322360)) b!525497))

(assert (= (and b!525497 (not res!322353)) b!525494))

(assert (= (and b!525494 c!61875) b!525501))

(assert (= (and b!525494 (not c!61875)) b!525491))

(assert (= (and b!525501 res!322359) b!525489))

(declare-fun m!505681 () Bool)

(assert (=> b!525493 m!505681))

(assert (=> b!525493 m!505681))

(declare-fun m!505683 () Bool)

(assert (=> b!525493 m!505683))

(declare-fun m!505685 () Bool)

(assert (=> b!525495 m!505685))

(declare-fun m!505687 () Bool)

(assert (=> b!525492 m!505687))

(declare-fun m!505689 () Bool)

(assert (=> b!525499 m!505689))

(declare-fun m!505691 () Bool)

(assert (=> start!47748 m!505691))

(declare-fun m!505693 () Bool)

(assert (=> start!47748 m!505693))

(declare-fun m!505695 () Bool)

(assert (=> b!525502 m!505695))

(declare-fun m!505697 () Bool)

(assert (=> b!525502 m!505697))

(declare-fun m!505699 () Bool)

(assert (=> b!525502 m!505699))

(declare-fun m!505701 () Bool)

(assert (=> b!525502 m!505701))

(declare-fun m!505703 () Bool)

(assert (=> b!525502 m!505703))

(assert (=> b!525502 m!505681))

(declare-fun m!505705 () Bool)

(assert (=> b!525502 m!505705))

(assert (=> b!525502 m!505681))

(assert (=> b!525502 m!505681))

(declare-fun m!505707 () Bool)

(assert (=> b!525502 m!505707))

(declare-fun m!505709 () Bool)

(assert (=> b!525502 m!505709))

(declare-fun m!505711 () Bool)

(assert (=> b!525490 m!505711))

(declare-fun m!505713 () Bool)

(assert (=> b!525496 m!505713))

(declare-fun m!505715 () Bool)

(assert (=> b!525501 m!505715))

(declare-fun m!505717 () Bool)

(assert (=> b!525501 m!505717))

(declare-fun m!505719 () Bool)

(assert (=> b!525494 m!505719))

(declare-fun m!505721 () Bool)

(assert (=> b!525494 m!505721))

(assert (=> b!525494 m!505681))

(assert (=> b!525500 m!505681))

(assert (=> b!525500 m!505681))

(declare-fun m!505723 () Bool)

(assert (=> b!525500 m!505723))

(check-sat (not b!525493) (not start!47748) (not b!525501) (not b!525496) (not b!525502) (not b!525500) (not b!525490) (not b!525492) (not b!525495) (not b!525494) (not b!525499))
(check-sat)
