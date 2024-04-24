; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123494 () Bool)

(assert start!123494)

(declare-fun b!1430625 () Bool)

(declare-fun res!964371 () Bool)

(declare-fun e!807965 () Bool)

(assert (=> b!1430625 (=> (not res!964371) (not e!807965))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-datatypes ((array!97526 0))(
  ( (array!97527 (arr!47071 (Array (_ BitVec 32) (_ BitVec 64))) (size!47622 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97526)

(assert (=> b!1430625 (= res!964371 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47622 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47622 a!2831))))))

(declare-fun b!1430626 () Bool)

(declare-fun res!964379 () Bool)

(declare-fun e!807968 () Bool)

(assert (=> b!1430626 (=> (not res!964379) (not e!807968))))

(declare-datatypes ((SeekEntryResult!11252 0))(
  ( (MissingZero!11252 (index!47400 (_ BitVec 32))) (Found!11252 (index!47401 (_ BitVec 32))) (Intermediate!11252 (undefined!12064 Bool) (index!47402 (_ BitVec 32)) (x!129199 (_ BitVec 32))) (Undefined!11252) (MissingVacant!11252 (index!47403 (_ BitVec 32))) )
))
(declare-fun lt!629797 () SeekEntryResult!11252)

(declare-fun lt!629798 () (_ BitVec 64))

(declare-fun lt!629794 () array!97526)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97526 (_ BitVec 32)) SeekEntryResult!11252)

(assert (=> b!1430626 (= res!964379 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629798 lt!629794 mask!2608) lt!629797))))

(declare-fun e!807966 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun b!1430627 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97526 (_ BitVec 32)) SeekEntryResult!11252)

(assert (=> b!1430627 (= e!807966 (= (seekEntryOrOpen!0 (select (arr!47071 a!2831) j!81) a!2831 mask!2608) (Found!11252 j!81)))))

(declare-fun b!1430628 () Bool)

(declare-fun res!964373 () Bool)

(assert (=> b!1430628 (=> (not res!964373) (not e!807965))))

(declare-datatypes ((List!33568 0))(
  ( (Nil!33565) (Cons!33564 (h!34889 (_ BitVec 64)) (t!48254 List!33568)) )
))
(declare-fun arrayNoDuplicates!0 (array!97526 (_ BitVec 32) List!33568) Bool)

(assert (=> b!1430628 (= res!964373 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33565))))

(declare-fun b!1430629 () Bool)

(declare-fun res!964369 () Bool)

(assert (=> b!1430629 (=> (not res!964369) (not e!807968))))

(declare-fun lt!629796 () SeekEntryResult!11252)

(assert (=> b!1430629 (= res!964369 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47071 a!2831) j!81) a!2831 mask!2608) lt!629796))))

(declare-fun b!1430631 () Bool)

(declare-fun res!964381 () Bool)

(assert (=> b!1430631 (=> (not res!964381) (not e!807965))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1430631 (= res!964381 (and (= (size!47622 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47622 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47622 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1430632 () Bool)

(declare-fun res!964375 () Bool)

(assert (=> b!1430632 (=> (not res!964375) (not e!807965))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1430632 (= res!964375 (validKeyInArray!0 (select (arr!47071 a!2831) j!81)))))

(declare-fun b!1430633 () Bool)

(declare-fun res!964374 () Bool)

(assert (=> b!1430633 (=> (not res!964374) (not e!807968))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1430633 (= res!964374 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1430634 () Bool)

(declare-fun res!964380 () Bool)

(assert (=> b!1430634 (=> (not res!964380) (not e!807965))))

(assert (=> b!1430634 (= res!964380 (validKeyInArray!0 (select (arr!47071 a!2831) i!982)))))

(declare-fun b!1430635 () Bool)

(declare-fun e!807967 () Bool)

(assert (=> b!1430635 (= e!807965 e!807967)))

(declare-fun res!964372 () Bool)

(assert (=> b!1430635 (=> (not res!964372) (not e!807967))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1430635 (= res!964372 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47071 a!2831) j!81) mask!2608) (select (arr!47071 a!2831) j!81) a!2831 mask!2608) lt!629796))))

(assert (=> b!1430635 (= lt!629796 (Intermediate!11252 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun res!964370 () Bool)

(assert (=> start!123494 (=> (not res!964370) (not e!807965))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123494 (= res!964370 (validMask!0 mask!2608))))

(assert (=> start!123494 e!807965))

(assert (=> start!123494 true))

(declare-fun array_inv!36352 (array!97526) Bool)

(assert (=> start!123494 (array_inv!36352 a!2831)))

(declare-fun b!1430630 () Bool)

(assert (=> b!1430630 (= e!807968 (not true))))

(assert (=> b!1430630 e!807966))

(declare-fun res!964378 () Bool)

(assert (=> b!1430630 (=> (not res!964378) (not e!807966))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97526 (_ BitVec 32)) Bool)

(assert (=> b!1430630 (= res!964378 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48281 0))(
  ( (Unit!48282) )
))
(declare-fun lt!629795 () Unit!48281)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97526 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48281)

(assert (=> b!1430630 (= lt!629795 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1430636 () Bool)

(declare-fun res!964377 () Bool)

(assert (=> b!1430636 (=> (not res!964377) (not e!807965))))

(assert (=> b!1430636 (= res!964377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1430637 () Bool)

(assert (=> b!1430637 (= e!807967 e!807968)))

(declare-fun res!964376 () Bool)

(assert (=> b!1430637 (=> (not res!964376) (not e!807968))))

(assert (=> b!1430637 (= res!964376 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629798 mask!2608) lt!629798 lt!629794 mask!2608) lt!629797))))

(assert (=> b!1430637 (= lt!629797 (Intermediate!11252 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1430637 (= lt!629798 (select (store (arr!47071 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1430637 (= lt!629794 (array!97527 (store (arr!47071 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47622 a!2831)))))

(assert (= (and start!123494 res!964370) b!1430631))

(assert (= (and b!1430631 res!964381) b!1430634))

(assert (= (and b!1430634 res!964380) b!1430632))

(assert (= (and b!1430632 res!964375) b!1430636))

(assert (= (and b!1430636 res!964377) b!1430628))

(assert (= (and b!1430628 res!964373) b!1430625))

(assert (= (and b!1430625 res!964371) b!1430635))

(assert (= (and b!1430635 res!964372) b!1430637))

(assert (= (and b!1430637 res!964376) b!1430629))

(assert (= (and b!1430629 res!964369) b!1430626))

(assert (= (and b!1430626 res!964379) b!1430633))

(assert (= (and b!1430633 res!964374) b!1430630))

(assert (= (and b!1430630 res!964378) b!1430627))

(declare-fun m!1320849 () Bool)

(assert (=> b!1430630 m!1320849))

(declare-fun m!1320851 () Bool)

(assert (=> b!1430630 m!1320851))

(declare-fun m!1320853 () Bool)

(assert (=> start!123494 m!1320853))

(declare-fun m!1320855 () Bool)

(assert (=> start!123494 m!1320855))

(declare-fun m!1320857 () Bool)

(assert (=> b!1430627 m!1320857))

(assert (=> b!1430627 m!1320857))

(declare-fun m!1320859 () Bool)

(assert (=> b!1430627 m!1320859))

(declare-fun m!1320861 () Bool)

(assert (=> b!1430634 m!1320861))

(assert (=> b!1430634 m!1320861))

(declare-fun m!1320863 () Bool)

(assert (=> b!1430634 m!1320863))

(assert (=> b!1430632 m!1320857))

(assert (=> b!1430632 m!1320857))

(declare-fun m!1320865 () Bool)

(assert (=> b!1430632 m!1320865))

(assert (=> b!1430635 m!1320857))

(assert (=> b!1430635 m!1320857))

(declare-fun m!1320867 () Bool)

(assert (=> b!1430635 m!1320867))

(assert (=> b!1430635 m!1320867))

(assert (=> b!1430635 m!1320857))

(declare-fun m!1320869 () Bool)

(assert (=> b!1430635 m!1320869))

(declare-fun m!1320871 () Bool)

(assert (=> b!1430636 m!1320871))

(declare-fun m!1320873 () Bool)

(assert (=> b!1430637 m!1320873))

(assert (=> b!1430637 m!1320873))

(declare-fun m!1320875 () Bool)

(assert (=> b!1430637 m!1320875))

(declare-fun m!1320877 () Bool)

(assert (=> b!1430637 m!1320877))

(declare-fun m!1320879 () Bool)

(assert (=> b!1430637 m!1320879))

(declare-fun m!1320881 () Bool)

(assert (=> b!1430626 m!1320881))

(assert (=> b!1430629 m!1320857))

(assert (=> b!1430629 m!1320857))

(declare-fun m!1320883 () Bool)

(assert (=> b!1430629 m!1320883))

(declare-fun m!1320885 () Bool)

(assert (=> b!1430628 m!1320885))

(check-sat (not start!123494) (not b!1430626) (not b!1430636) (not b!1430637) (not b!1430630) (not b!1430628) (not b!1430634) (not b!1430629) (not b!1430635) (not b!1430632) (not b!1430627))
(check-sat)
