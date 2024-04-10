; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129320 () Bool)

(assert start!129320)

(declare-fun b!1519036 () Bool)

(declare-fun res!1038943 () Bool)

(declare-fun e!847375 () Bool)

(assert (=> b!1519036 (=> (not res!1038943) (not e!847375))))

(declare-datatypes ((array!101176 0))(
  ( (array!101177 (arr!48825 (Array (_ BitVec 32) (_ BitVec 64))) (size!49375 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101176)

(declare-datatypes ((List!35308 0))(
  ( (Nil!35305) (Cons!35304 (h!36716 (_ BitVec 64)) (t!50002 List!35308)) )
))
(declare-fun arrayNoDuplicates!0 (array!101176 (_ BitVec 32) List!35308) Bool)

(assert (=> b!1519036 (= res!1038943 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35305))))

(declare-fun b!1519037 () Bool)

(declare-fun e!847373 () Bool)

(declare-fun e!847372 () Bool)

(assert (=> b!1519037 (= e!847373 e!847372)))

(declare-fun res!1038948 () Bool)

(assert (=> b!1519037 (=> (not res!1038948) (not e!847372))))

(declare-fun lt!658467 () array!101176)

(declare-datatypes ((SeekEntryResult!12996 0))(
  ( (MissingZero!12996 (index!54379 (_ BitVec 32))) (Found!12996 (index!54380 (_ BitVec 32))) (Intermediate!12996 (undefined!13808 Bool) (index!54381 (_ BitVec 32)) (x!136050 (_ BitVec 32))) (Undefined!12996) (MissingVacant!12996 (index!54382 (_ BitVec 32))) )
))
(declare-fun lt!658471 () SeekEntryResult!12996)

(declare-fun lt!658468 () (_ BitVec 64))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101176 (_ BitVec 32)) SeekEntryResult!12996)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519037 (= res!1038948 (= lt!658471 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!658468 mask!2512) lt!658468 lt!658467 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1519037 (= lt!658468 (select (store (arr!48825 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1519037 (= lt!658467 (array!101177 (store (arr!48825 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49375 a!2804)))))

(declare-fun e!847374 () Bool)

(declare-fun b!1519038 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101176 (_ BitVec 32)) SeekEntryResult!12996)

(assert (=> b!1519038 (= e!847374 (= (seekEntry!0 (select (arr!48825 a!2804) j!70) a!2804 mask!2512) (Found!12996 j!70)))))

(declare-fun b!1519039 () Bool)

(declare-fun res!1038946 () Bool)

(assert (=> b!1519039 (=> (not res!1038946) (not e!847375))))

(assert (=> b!1519039 (= res!1038946 (and (= (size!49375 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49375 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49375 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1519040 () Bool)

(declare-fun res!1038949 () Bool)

(assert (=> b!1519040 (=> (not res!1038949) (not e!847375))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101176 (_ BitVec 32)) Bool)

(assert (=> b!1519040 (= res!1038949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1519041 () Bool)

(declare-fun res!1038947 () Bool)

(assert (=> b!1519041 (=> (not res!1038947) (not e!847375))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1519041 (= res!1038947 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49375 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49375 a!2804))))))

(declare-fun b!1519042 () Bool)

(declare-fun res!1038950 () Bool)

(assert (=> b!1519042 (=> (not res!1038950) (not e!847373))))

(declare-fun lt!658469 () SeekEntryResult!12996)

(assert (=> b!1519042 (= res!1038950 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48825 a!2804) j!70) a!2804 mask!2512) lt!658469))))

(declare-fun b!1519043 () Bool)

(declare-fun e!847376 () Bool)

(assert (=> b!1519043 (= e!847372 (not e!847376))))

(declare-fun res!1038940 () Bool)

(assert (=> b!1519043 (=> res!1038940 e!847376)))

(assert (=> b!1519043 (= res!1038940 (or (not (= (select (arr!48825 a!2804) j!70) lt!658468)) (= x!534 resX!21)))))

(assert (=> b!1519043 e!847374))

(declare-fun res!1038951 () Bool)

(assert (=> b!1519043 (=> (not res!1038951) (not e!847374))))

(assert (=> b!1519043 (= res!1038951 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50860 0))(
  ( (Unit!50861) )
))
(declare-fun lt!658466 () Unit!50860)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101176 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50860)

(assert (=> b!1519043 (= lt!658466 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1519044 () Bool)

(declare-fun res!1038944 () Bool)

(assert (=> b!1519044 (=> (not res!1038944) (not e!847375))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1519044 (= res!1038944 (validKeyInArray!0 (select (arr!48825 a!2804) i!961)))))

(declare-fun b!1519045 () Bool)

(declare-fun res!1038939 () Bool)

(assert (=> b!1519045 (=> (not res!1038939) (not e!847375))))

(assert (=> b!1519045 (= res!1038939 (validKeyInArray!0 (select (arr!48825 a!2804) j!70)))))

(declare-fun b!1519046 () Bool)

(declare-fun e!847377 () Bool)

(assert (=> b!1519046 (= e!847377 true)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101176 (_ BitVec 32)) SeekEntryResult!12996)

(assert (=> b!1519046 (= (seekEntryOrOpen!0 (select (arr!48825 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!658468 lt!658467 mask!2512))))

(declare-fun lt!658470 () Unit!50860)

(declare-fun lt!658465 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101176 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50860)

(assert (=> b!1519046 (= lt!658470 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!658465 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1519047 () Bool)

(assert (=> b!1519047 (= e!847376 e!847377)))

(declare-fun res!1038952 () Bool)

(assert (=> b!1519047 (=> res!1038952 e!847377)))

(assert (=> b!1519047 (= res!1038952 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658465 #b00000000000000000000000000000000) (bvsge lt!658465 (size!49375 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519047 (= lt!658465 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun res!1038941 () Bool)

(assert (=> start!129320 (=> (not res!1038941) (not e!847375))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129320 (= res!1038941 (validMask!0 mask!2512))))

(assert (=> start!129320 e!847375))

(assert (=> start!129320 true))

(declare-fun array_inv!37853 (array!101176) Bool)

(assert (=> start!129320 (array_inv!37853 a!2804)))

(declare-fun b!1519048 () Bool)

(declare-fun res!1038942 () Bool)

(assert (=> b!1519048 (=> res!1038942 e!847377)))

(assert (=> b!1519048 (= res!1038942 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658465 (select (arr!48825 a!2804) j!70) a!2804 mask!2512) lt!658469)))))

(declare-fun b!1519049 () Bool)

(assert (=> b!1519049 (= e!847375 e!847373)))

(declare-fun res!1038945 () Bool)

(assert (=> b!1519049 (=> (not res!1038945) (not e!847373))))

(assert (=> b!1519049 (= res!1038945 (= lt!658471 lt!658469))))

(assert (=> b!1519049 (= lt!658469 (Intermediate!12996 false resIndex!21 resX!21))))

(assert (=> b!1519049 (= lt!658471 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48825 a!2804) j!70) mask!2512) (select (arr!48825 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129320 res!1038941) b!1519039))

(assert (= (and b!1519039 res!1038946) b!1519044))

(assert (= (and b!1519044 res!1038944) b!1519045))

(assert (= (and b!1519045 res!1038939) b!1519040))

(assert (= (and b!1519040 res!1038949) b!1519036))

(assert (= (and b!1519036 res!1038943) b!1519041))

(assert (= (and b!1519041 res!1038947) b!1519049))

(assert (= (and b!1519049 res!1038945) b!1519042))

(assert (= (and b!1519042 res!1038950) b!1519037))

(assert (= (and b!1519037 res!1038948) b!1519043))

(assert (= (and b!1519043 res!1038951) b!1519038))

(assert (= (and b!1519043 (not res!1038940)) b!1519047))

(assert (= (and b!1519047 (not res!1038952)) b!1519048))

(assert (= (and b!1519048 (not res!1038942)) b!1519046))

(declare-fun m!1402403 () Bool)

(assert (=> b!1519047 m!1402403))

(declare-fun m!1402405 () Bool)

(assert (=> b!1519038 m!1402405))

(assert (=> b!1519038 m!1402405))

(declare-fun m!1402407 () Bool)

(assert (=> b!1519038 m!1402407))

(assert (=> b!1519046 m!1402405))

(assert (=> b!1519046 m!1402405))

(declare-fun m!1402409 () Bool)

(assert (=> b!1519046 m!1402409))

(declare-fun m!1402411 () Bool)

(assert (=> b!1519046 m!1402411))

(declare-fun m!1402413 () Bool)

(assert (=> b!1519046 m!1402413))

(declare-fun m!1402415 () Bool)

(assert (=> start!129320 m!1402415))

(declare-fun m!1402417 () Bool)

(assert (=> start!129320 m!1402417))

(declare-fun m!1402419 () Bool)

(assert (=> b!1519040 m!1402419))

(assert (=> b!1519045 m!1402405))

(assert (=> b!1519045 m!1402405))

(declare-fun m!1402421 () Bool)

(assert (=> b!1519045 m!1402421))

(declare-fun m!1402423 () Bool)

(assert (=> b!1519036 m!1402423))

(assert (=> b!1519048 m!1402405))

(assert (=> b!1519048 m!1402405))

(declare-fun m!1402425 () Bool)

(assert (=> b!1519048 m!1402425))

(assert (=> b!1519049 m!1402405))

(assert (=> b!1519049 m!1402405))

(declare-fun m!1402427 () Bool)

(assert (=> b!1519049 m!1402427))

(assert (=> b!1519049 m!1402427))

(assert (=> b!1519049 m!1402405))

(declare-fun m!1402429 () Bool)

(assert (=> b!1519049 m!1402429))

(assert (=> b!1519043 m!1402405))

(declare-fun m!1402431 () Bool)

(assert (=> b!1519043 m!1402431))

(declare-fun m!1402433 () Bool)

(assert (=> b!1519043 m!1402433))

(declare-fun m!1402435 () Bool)

(assert (=> b!1519037 m!1402435))

(assert (=> b!1519037 m!1402435))

(declare-fun m!1402437 () Bool)

(assert (=> b!1519037 m!1402437))

(declare-fun m!1402439 () Bool)

(assert (=> b!1519037 m!1402439))

(declare-fun m!1402441 () Bool)

(assert (=> b!1519037 m!1402441))

(assert (=> b!1519042 m!1402405))

(assert (=> b!1519042 m!1402405))

(declare-fun m!1402443 () Bool)

(assert (=> b!1519042 m!1402443))

(declare-fun m!1402445 () Bool)

(assert (=> b!1519044 m!1402445))

(assert (=> b!1519044 m!1402445))

(declare-fun m!1402447 () Bool)

(assert (=> b!1519044 m!1402447))

(check-sat (not b!1519036) (not b!1519038) (not b!1519040) (not b!1519037) (not start!129320) (not b!1519047) (not b!1519044) (not b!1519045) (not b!1519042) (not b!1519048) (not b!1519043) (not b!1519046) (not b!1519049))
(check-sat)
