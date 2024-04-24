; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47894 () Bool)

(assert start!47894)

(declare-fun b!527538 () Bool)

(declare-fun res!323898 () Bool)

(declare-fun e!307450 () Bool)

(assert (=> b!527538 (=> (not res!323898) (not e!307450))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33463 0))(
  ( (array!33464 (arr!16081 (Array (_ BitVec 32) (_ BitVec 64))) (size!16445 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33463)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!527538 (= res!323898 (and (= (size!16445 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16445 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16445 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!527539 () Bool)

(declare-fun e!307446 () Bool)

(assert (=> b!527539 (= e!307446 false)))

(declare-fun b!527540 () Bool)

(declare-fun res!323894 () Bool)

(declare-fun e!307449 () Bool)

(assert (=> b!527540 (=> (not res!323894) (not e!307449))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33463 (_ BitVec 32)) Bool)

(assert (=> b!527540 (= res!323894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!527541 () Bool)

(declare-fun res!323896 () Bool)

(declare-fun e!307448 () Bool)

(assert (=> b!527541 (=> res!323896 e!307448)))

(declare-datatypes ((SeekEntryResult!4504 0))(
  ( (MissingZero!4504 (index!20234 (_ BitVec 32))) (Found!4504 (index!20235 (_ BitVec 32))) (Intermediate!4504 (undefined!5316 Bool) (index!20236 (_ BitVec 32)) (x!49350 (_ BitVec 32))) (Undefined!4504) (MissingVacant!4504 (index!20237 (_ BitVec 32))) )
))
(declare-fun lt!242874 () SeekEntryResult!4504)

(get-info :version)

(assert (=> b!527541 (= res!323896 (or (undefined!5316 lt!242874) (not ((_ is Intermediate!4504) lt!242874))))))

(declare-fun b!527542 () Bool)

(declare-fun res!323897 () Bool)

(assert (=> b!527542 (=> (not res!323897) (not e!307449))))

(declare-datatypes ((List!10146 0))(
  ( (Nil!10143) (Cons!10142 (h!11076 (_ BitVec 64)) (t!16366 List!10146)) )
))
(declare-fun arrayNoDuplicates!0 (array!33463 (_ BitVec 32) List!10146) Bool)

(assert (=> b!527542 (= res!323897 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10143))))

(declare-fun b!527543 () Bool)

(assert (=> b!527543 (= e!307449 (not e!307448))))

(declare-fun res!323902 () Bool)

(assert (=> b!527543 (=> res!323902 e!307448)))

(declare-fun lt!242873 () (_ BitVec 64))

(declare-fun lt!242869 () array!33463)

(declare-fun lt!242876 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33463 (_ BitVec 32)) SeekEntryResult!4504)

(assert (=> b!527543 (= res!323902 (= lt!242874 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242876 lt!242873 lt!242869 mask!3524)))))

(declare-fun lt!242872 () (_ BitVec 32))

(assert (=> b!527543 (= lt!242874 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242872 (select (arr!16081 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!527543 (= lt!242876 (toIndex!0 lt!242873 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!527543 (= lt!242873 (select (store (arr!16081 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!527543 (= lt!242872 (toIndex!0 (select (arr!16081 a!3235) j!176) mask!3524))))

(assert (=> b!527543 (= lt!242869 (array!33464 (store (arr!16081 a!3235) i!1204 k0!2280) (size!16445 a!3235)))))

(declare-fun e!307447 () Bool)

(assert (=> b!527543 e!307447))

(declare-fun res!323899 () Bool)

(assert (=> b!527543 (=> (not res!323899) (not e!307447))))

(assert (=> b!527543 (= res!323899 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16627 0))(
  ( (Unit!16628) )
))
(declare-fun lt!242878 () Unit!16627)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33463 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16627)

(assert (=> b!527543 (= lt!242878 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!527544 () Bool)

(declare-fun res!323895 () Bool)

(assert (=> b!527544 (=> (not res!323895) (not e!307450))))

(declare-fun arrayContainsKey!0 (array!33463 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!527544 (= res!323895 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!527546 () Bool)

(assert (=> b!527546 (= e!307450 e!307449)))

(declare-fun res!323903 () Bool)

(assert (=> b!527546 (=> (not res!323903) (not e!307449))))

(declare-fun lt!242870 () SeekEntryResult!4504)

(assert (=> b!527546 (= res!323903 (or (= lt!242870 (MissingZero!4504 i!1204)) (= lt!242870 (MissingVacant!4504 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33463 (_ BitVec 32)) SeekEntryResult!4504)

(assert (=> b!527546 (= lt!242870 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!527547 () Bool)

(assert (=> b!527547 (= e!307447 (= (seekEntryOrOpen!0 (select (arr!16081 a!3235) j!176) a!3235 mask!3524) (Found!4504 j!176)))))

(declare-fun b!527548 () Bool)

(declare-fun e!307452 () Unit!16627)

(declare-fun Unit!16629 () Unit!16627)

(assert (=> b!527548 (= e!307452 Unit!16629)))

(declare-fun b!527549 () Bool)

(declare-fun res!323904 () Bool)

(assert (=> b!527549 (=> (not res!323904) (not e!307450))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!527549 (= res!323904 (validKeyInArray!0 (select (arr!16081 a!3235) j!176)))))

(declare-fun b!527550 () Bool)

(declare-fun res!323905 () Bool)

(assert (=> b!527550 (=> (not res!323905) (not e!307450))))

(assert (=> b!527550 (= res!323905 (validKeyInArray!0 k0!2280))))

(declare-fun b!527551 () Bool)

(declare-fun Unit!16630 () Unit!16627)

(assert (=> b!527551 (= e!307452 Unit!16630)))

(declare-fun lt!242877 () Unit!16627)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33463 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16627)

(assert (=> b!527551 (= lt!242877 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!242872 #b00000000000000000000000000000000 (index!20236 lt!242874) (x!49350 lt!242874) mask!3524))))

(declare-fun res!323900 () Bool)

(assert (=> b!527551 (= res!323900 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242872 lt!242873 lt!242869 mask!3524) (Intermediate!4504 false (index!20236 lt!242874) (x!49350 lt!242874))))))

(assert (=> b!527551 (=> (not res!323900) (not e!307446))))

(assert (=> b!527551 e!307446))

(declare-fun res!323901 () Bool)

(assert (=> start!47894 (=> (not res!323901) (not e!307450))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47894 (= res!323901 (validMask!0 mask!3524))))

(assert (=> start!47894 e!307450))

(assert (=> start!47894 true))

(declare-fun array_inv!11940 (array!33463) Bool)

(assert (=> start!47894 (array_inv!11940 a!3235)))

(declare-fun b!527545 () Bool)

(assert (=> b!527545 (= e!307448 true)))

(assert (=> b!527545 (= (index!20236 lt!242874) i!1204)))

(declare-fun lt!242871 () Unit!16627)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33463 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16627)

(assert (=> b!527545 (= lt!242871 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!242872 #b00000000000000000000000000000000 (index!20236 lt!242874) (x!49350 lt!242874) mask!3524))))

(assert (=> b!527545 (and (or (= (select (arr!16081 a!3235) (index!20236 lt!242874)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16081 a!3235) (index!20236 lt!242874)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16081 a!3235) (index!20236 lt!242874)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16081 a!3235) (index!20236 lt!242874)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242875 () Unit!16627)

(assert (=> b!527545 (= lt!242875 e!307452)))

(declare-fun c!62129 () Bool)

(assert (=> b!527545 (= c!62129 (= (select (arr!16081 a!3235) (index!20236 lt!242874)) (select (arr!16081 a!3235) j!176)))))

(assert (=> b!527545 (and (bvslt (x!49350 lt!242874) #b01111111111111111111111111111110) (or (= (select (arr!16081 a!3235) (index!20236 lt!242874)) (select (arr!16081 a!3235) j!176)) (= (select (arr!16081 a!3235) (index!20236 lt!242874)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16081 a!3235) (index!20236 lt!242874)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!47894 res!323901) b!527538))

(assert (= (and b!527538 res!323898) b!527549))

(assert (= (and b!527549 res!323904) b!527550))

(assert (= (and b!527550 res!323905) b!527544))

(assert (= (and b!527544 res!323895) b!527546))

(assert (= (and b!527546 res!323903) b!527540))

(assert (= (and b!527540 res!323894) b!527542))

(assert (= (and b!527542 res!323897) b!527543))

(assert (= (and b!527543 res!323899) b!527547))

(assert (= (and b!527543 (not res!323902)) b!527541))

(assert (= (and b!527541 (not res!323896)) b!527545))

(assert (= (and b!527545 c!62129) b!527551))

(assert (= (and b!527545 (not c!62129)) b!527548))

(assert (= (and b!527551 res!323900) b!527539))

(declare-fun m!508441 () Bool)

(assert (=> b!527546 m!508441))

(declare-fun m!508443 () Bool)

(assert (=> start!47894 m!508443))

(declare-fun m!508445 () Bool)

(assert (=> start!47894 m!508445))

(declare-fun m!508447 () Bool)

(assert (=> b!527549 m!508447))

(assert (=> b!527549 m!508447))

(declare-fun m!508449 () Bool)

(assert (=> b!527549 m!508449))

(declare-fun m!508451 () Bool)

(assert (=> b!527545 m!508451))

(declare-fun m!508453 () Bool)

(assert (=> b!527545 m!508453))

(assert (=> b!527545 m!508447))

(declare-fun m!508455 () Bool)

(assert (=> b!527540 m!508455))

(declare-fun m!508457 () Bool)

(assert (=> b!527550 m!508457))

(declare-fun m!508459 () Bool)

(assert (=> b!527544 m!508459))

(assert (=> b!527547 m!508447))

(assert (=> b!527547 m!508447))

(declare-fun m!508461 () Bool)

(assert (=> b!527547 m!508461))

(declare-fun m!508463 () Bool)

(assert (=> b!527543 m!508463))

(declare-fun m!508465 () Bool)

(assert (=> b!527543 m!508465))

(assert (=> b!527543 m!508447))

(declare-fun m!508467 () Bool)

(assert (=> b!527543 m!508467))

(declare-fun m!508469 () Bool)

(assert (=> b!527543 m!508469))

(assert (=> b!527543 m!508447))

(declare-fun m!508471 () Bool)

(assert (=> b!527543 m!508471))

(declare-fun m!508473 () Bool)

(assert (=> b!527543 m!508473))

(assert (=> b!527543 m!508447))

(declare-fun m!508475 () Bool)

(assert (=> b!527543 m!508475))

(declare-fun m!508477 () Bool)

(assert (=> b!527543 m!508477))

(declare-fun m!508479 () Bool)

(assert (=> b!527542 m!508479))

(declare-fun m!508481 () Bool)

(assert (=> b!527551 m!508481))

(declare-fun m!508483 () Bool)

(assert (=> b!527551 m!508483))

(check-sat (not b!527547) (not b!527543) (not b!527549) (not b!527540) (not b!527545) (not b!527550) (not b!527544) (not start!47894) (not b!527551) (not b!527546) (not b!527542))
(check-sat)
