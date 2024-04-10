; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47912 () Bool)

(assert start!47912)

(declare-fun b!527767 () Bool)

(declare-datatypes ((Unit!16680 0))(
  ( (Unit!16681) )
))
(declare-fun e!307573 () Unit!16680)

(declare-fun Unit!16682 () Unit!16680)

(assert (=> b!527767 (= e!307573 Unit!16682)))

(declare-datatypes ((SeekEntryResult!4557 0))(
  ( (MissingZero!4557 (index!20446 (_ BitVec 32))) (Found!4557 (index!20447 (_ BitVec 32))) (Intermediate!4557 (undefined!5369 Bool) (index!20448 (_ BitVec 32)) (x!49414 (_ BitVec 32))) (Undefined!4557) (MissingVacant!4557 (index!20449 (_ BitVec 32))) )
))
(declare-fun lt!242979 () SeekEntryResult!4557)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33480 0))(
  ( (array!33481 (arr!16090 (Array (_ BitVec 32) (_ BitVec 64))) (size!16454 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33480)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!242985 () (_ BitVec 32))

(declare-fun lt!242980 () Unit!16680)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33480 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16680)

(assert (=> b!527767 (= lt!242980 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!242985 #b00000000000000000000000000000000 (index!20448 lt!242979) (x!49414 lt!242979) mask!3524))))

(declare-fun res!324056 () Bool)

(declare-fun lt!242981 () array!33480)

(declare-fun lt!242978 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33480 (_ BitVec 32)) SeekEntryResult!4557)

(assert (=> b!527767 (= res!324056 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242985 lt!242978 lt!242981 mask!3524) (Intermediate!4557 false (index!20448 lt!242979) (x!49414 lt!242979))))))

(declare-fun e!307571 () Bool)

(assert (=> b!527767 (=> (not res!324056) (not e!307571))))

(assert (=> b!527767 e!307571))

(declare-fun b!527768 () Bool)

(declare-fun e!307575 () Bool)

(assert (=> b!527768 (= e!307575 true)))

(assert (=> b!527768 (= (index!20448 lt!242979) i!1204)))

(declare-fun lt!242982 () Unit!16680)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33480 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16680)

(assert (=> b!527768 (= lt!242982 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!242985 #b00000000000000000000000000000000 (index!20448 lt!242979) (x!49414 lt!242979) mask!3524))))

(assert (=> b!527768 (and (or (= (select (arr!16090 a!3235) (index!20448 lt!242979)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16090 a!3235) (index!20448 lt!242979)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16090 a!3235) (index!20448 lt!242979)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16090 a!3235) (index!20448 lt!242979)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242984 () Unit!16680)

(assert (=> b!527768 (= lt!242984 e!307573)))

(declare-fun c!62168 () Bool)

(assert (=> b!527768 (= c!62168 (= (select (arr!16090 a!3235) (index!20448 lt!242979)) (select (arr!16090 a!3235) j!176)))))

(assert (=> b!527768 (and (bvslt (x!49414 lt!242979) #b01111111111111111111111111111110) (or (= (select (arr!16090 a!3235) (index!20448 lt!242979)) (select (arr!16090 a!3235) j!176)) (= (select (arr!16090 a!3235) (index!20448 lt!242979)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16090 a!3235) (index!20448 lt!242979)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!527769 () Bool)

(declare-fun e!307572 () Bool)

(declare-fun e!307569 () Bool)

(assert (=> b!527769 (= e!307572 e!307569)))

(declare-fun res!324054 () Bool)

(assert (=> b!527769 (=> (not res!324054) (not e!307569))))

(declare-fun lt!242983 () SeekEntryResult!4557)

(assert (=> b!527769 (= res!324054 (or (= lt!242983 (MissingZero!4557 i!1204)) (= lt!242983 (MissingVacant!4557 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33480 (_ BitVec 32)) SeekEntryResult!4557)

(assert (=> b!527769 (= lt!242983 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!527770 () Bool)

(declare-fun res!324051 () Bool)

(assert (=> b!527770 (=> res!324051 e!307575)))

(get-info :version)

(assert (=> b!527770 (= res!324051 (or (undefined!5369 lt!242979) (not ((_ is Intermediate!4557) lt!242979))))))

(declare-fun b!527771 () Bool)

(declare-fun res!324050 () Bool)

(assert (=> b!527771 (=> (not res!324050) (not e!307569))))

(declare-datatypes ((List!10248 0))(
  ( (Nil!10245) (Cons!10244 (h!11178 (_ BitVec 64)) (t!16476 List!10248)) )
))
(declare-fun arrayNoDuplicates!0 (array!33480 (_ BitVec 32) List!10248) Bool)

(assert (=> b!527771 (= res!324050 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10245))))

(declare-fun b!527772 () Bool)

(declare-fun Unit!16683 () Unit!16680)

(assert (=> b!527772 (= e!307573 Unit!16683)))

(declare-fun res!324053 () Bool)

(assert (=> start!47912 (=> (not res!324053) (not e!307572))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47912 (= res!324053 (validMask!0 mask!3524))))

(assert (=> start!47912 e!307572))

(assert (=> start!47912 true))

(declare-fun array_inv!11886 (array!33480) Bool)

(assert (=> start!47912 (array_inv!11886 a!3235)))

(declare-fun b!527773 () Bool)

(declare-fun res!324049 () Bool)

(assert (=> b!527773 (=> (not res!324049) (not e!307572))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!527773 (= res!324049 (validKeyInArray!0 (select (arr!16090 a!3235) j!176)))))

(declare-fun b!527774 () Bool)

(assert (=> b!527774 (= e!307571 false)))

(declare-fun b!527775 () Bool)

(declare-fun res!324052 () Bool)

(assert (=> b!527775 (=> (not res!324052) (not e!307569))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33480 (_ BitVec 32)) Bool)

(assert (=> b!527775 (= res!324052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!527776 () Bool)

(assert (=> b!527776 (= e!307569 (not e!307575))))

(declare-fun res!324055 () Bool)

(assert (=> b!527776 (=> res!324055 e!307575)))

(declare-fun lt!242977 () (_ BitVec 32))

(assert (=> b!527776 (= res!324055 (= lt!242979 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242977 lt!242978 lt!242981 mask!3524)))))

(assert (=> b!527776 (= lt!242979 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242985 (select (arr!16090 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!527776 (= lt!242977 (toIndex!0 lt!242978 mask!3524))))

(assert (=> b!527776 (= lt!242978 (select (store (arr!16090 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!527776 (= lt!242985 (toIndex!0 (select (arr!16090 a!3235) j!176) mask!3524))))

(assert (=> b!527776 (= lt!242981 (array!33481 (store (arr!16090 a!3235) i!1204 k0!2280) (size!16454 a!3235)))))

(declare-fun e!307574 () Bool)

(assert (=> b!527776 e!307574))

(declare-fun res!324048 () Bool)

(assert (=> b!527776 (=> (not res!324048) (not e!307574))))

(assert (=> b!527776 (= res!324048 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!242986 () Unit!16680)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33480 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16680)

(assert (=> b!527776 (= lt!242986 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!527777 () Bool)

(declare-fun res!324047 () Bool)

(assert (=> b!527777 (=> (not res!324047) (not e!307572))))

(declare-fun arrayContainsKey!0 (array!33480 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!527777 (= res!324047 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!527778 () Bool)

(declare-fun res!324045 () Bool)

(assert (=> b!527778 (=> (not res!324045) (not e!307572))))

(assert (=> b!527778 (= res!324045 (and (= (size!16454 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16454 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16454 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!527779 () Bool)

(assert (=> b!527779 (= e!307574 (= (seekEntryOrOpen!0 (select (arr!16090 a!3235) j!176) a!3235 mask!3524) (Found!4557 j!176)))))

(declare-fun b!527780 () Bool)

(declare-fun res!324046 () Bool)

(assert (=> b!527780 (=> (not res!324046) (not e!307572))))

(assert (=> b!527780 (= res!324046 (validKeyInArray!0 k0!2280))))

(assert (= (and start!47912 res!324053) b!527778))

(assert (= (and b!527778 res!324045) b!527773))

(assert (= (and b!527773 res!324049) b!527780))

(assert (= (and b!527780 res!324046) b!527777))

(assert (= (and b!527777 res!324047) b!527769))

(assert (= (and b!527769 res!324054) b!527775))

(assert (= (and b!527775 res!324052) b!527771))

(assert (= (and b!527771 res!324050) b!527776))

(assert (= (and b!527776 res!324048) b!527779))

(assert (= (and b!527776 (not res!324055)) b!527770))

(assert (= (and b!527770 (not res!324051)) b!527768))

(assert (= (and b!527768 c!62168) b!527767))

(assert (= (and b!527768 (not c!62168)) b!527772))

(assert (= (and b!527767 res!324056) b!527774))

(declare-fun m!508433 () Bool)

(assert (=> b!527780 m!508433))

(declare-fun m!508435 () Bool)

(assert (=> b!527776 m!508435))

(declare-fun m!508437 () Bool)

(assert (=> b!527776 m!508437))

(declare-fun m!508439 () Bool)

(assert (=> b!527776 m!508439))

(declare-fun m!508441 () Bool)

(assert (=> b!527776 m!508441))

(declare-fun m!508443 () Bool)

(assert (=> b!527776 m!508443))

(declare-fun m!508445 () Bool)

(assert (=> b!527776 m!508445))

(assert (=> b!527776 m!508443))

(declare-fun m!508447 () Bool)

(assert (=> b!527776 m!508447))

(assert (=> b!527776 m!508443))

(declare-fun m!508449 () Bool)

(assert (=> b!527776 m!508449))

(declare-fun m!508451 () Bool)

(assert (=> b!527776 m!508451))

(declare-fun m!508453 () Bool)

(assert (=> b!527767 m!508453))

(declare-fun m!508455 () Bool)

(assert (=> b!527767 m!508455))

(declare-fun m!508457 () Bool)

(assert (=> b!527775 m!508457))

(assert (=> b!527773 m!508443))

(assert (=> b!527773 m!508443))

(declare-fun m!508459 () Bool)

(assert (=> b!527773 m!508459))

(declare-fun m!508461 () Bool)

(assert (=> start!47912 m!508461))

(declare-fun m!508463 () Bool)

(assert (=> start!47912 m!508463))

(assert (=> b!527779 m!508443))

(assert (=> b!527779 m!508443))

(declare-fun m!508465 () Bool)

(assert (=> b!527779 m!508465))

(declare-fun m!508467 () Bool)

(assert (=> b!527771 m!508467))

(declare-fun m!508469 () Bool)

(assert (=> b!527768 m!508469))

(declare-fun m!508471 () Bool)

(assert (=> b!527768 m!508471))

(assert (=> b!527768 m!508443))

(declare-fun m!508473 () Bool)

(assert (=> b!527777 m!508473))

(declare-fun m!508475 () Bool)

(assert (=> b!527769 m!508475))

(check-sat (not b!527768) (not b!527779) (not start!47912) (not b!527775) (not b!527776) (not b!527773) (not b!527771) (not b!527769) (not b!527777) (not b!527767) (not b!527780))
(check-sat)
