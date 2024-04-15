; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120332 () Bool)

(assert start!120332)

(declare-fun b!1400471 () Bool)

(declare-fun e!792935 () Bool)

(declare-fun e!792934 () Bool)

(assert (=> b!1400471 (= e!792935 e!792934)))

(declare-fun res!939034 () Bool)

(assert (=> b!1400471 (=> res!939034 e!792934)))

(declare-datatypes ((SeekEntryResult!10541 0))(
  ( (MissingZero!10541 (index!44541 (_ BitVec 32))) (Found!10541 (index!44542 (_ BitVec 32))) (Intermediate!10541 (undefined!11353 Bool) (index!44543 (_ BitVec 32)) (x!126181 (_ BitVec 32))) (Undefined!10541) (MissingVacant!10541 (index!44544 (_ BitVec 32))) )
))
(declare-fun lt!616098 () SeekEntryResult!10541)

(declare-fun lt!616101 () SeekEntryResult!10541)

(get-info :version)

(assert (=> b!1400471 (= res!939034 (or (= lt!616098 lt!616101) (not ((_ is Intermediate!10541) lt!616101))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!616102 () (_ BitVec 64))

(declare-datatypes ((array!95694 0))(
  ( (array!95695 (arr!46198 (Array (_ BitVec 32) (_ BitVec 64))) (size!46750 (_ BitVec 32))) )
))
(declare-fun lt!616103 () array!95694)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95694 (_ BitVec 32)) SeekEntryResult!10541)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400471 (= lt!616101 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616102 mask!2840) lt!616102 lt!616103 mask!2840))))

(declare-fun a!2901 () array!95694)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1400471 (= lt!616102 (select (store (arr!46198 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400471 (= lt!616103 (array!95695 (store (arr!46198 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46750 a!2901)))))

(declare-fun b!1400472 () Bool)

(declare-fun res!939040 () Bool)

(declare-fun e!792929 () Bool)

(assert (=> b!1400472 (=> (not res!939040) (not e!792929))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400472 (= res!939040 (validKeyInArray!0 (select (arr!46198 a!2901) j!112)))))

(declare-fun b!1400473 () Bool)

(assert (=> b!1400473 (= e!792929 (not e!792935))))

(declare-fun res!939035 () Bool)

(assert (=> b!1400473 (=> res!939035 e!792935)))

(assert (=> b!1400473 (= res!939035 (or (not ((_ is Intermediate!10541) lt!616098)) (undefined!11353 lt!616098)))))

(declare-fun e!792932 () Bool)

(assert (=> b!1400473 e!792932))

(declare-fun res!939037 () Bool)

(assert (=> b!1400473 (=> (not res!939037) (not e!792932))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95694 (_ BitVec 32)) Bool)

(assert (=> b!1400473 (= res!939037 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46929 0))(
  ( (Unit!46930) )
))
(declare-fun lt!616099 () Unit!46929)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95694 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46929)

(assert (=> b!1400473 (= lt!616099 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!616100 () (_ BitVec 32))

(assert (=> b!1400473 (= lt!616098 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616100 (select (arr!46198 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1400473 (= lt!616100 (toIndex!0 (select (arr!46198 a!2901) j!112) mask!2840))))

(declare-fun b!1400474 () Bool)

(declare-fun e!792931 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95694 (_ BitVec 32)) SeekEntryResult!10541)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95694 (_ BitVec 32)) SeekEntryResult!10541)

(assert (=> b!1400474 (= e!792931 (= (seekEntryOrOpen!0 lt!616102 lt!616103 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126181 lt!616101) (index!44543 lt!616101) (index!44543 lt!616101) (select (arr!46198 a!2901) j!112) lt!616103 mask!2840)))))

(declare-fun b!1400476 () Bool)

(declare-fun e!792930 () Bool)

(assert (=> b!1400476 (= e!792930 true)))

(declare-fun lt!616097 () SeekEntryResult!10541)

(assert (=> b!1400476 (= lt!616097 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616100 lt!616102 lt!616103 mask!2840))))

(declare-fun b!1400477 () Bool)

(declare-fun res!939038 () Bool)

(assert (=> b!1400477 (=> (not res!939038) (not e!792929))))

(assert (=> b!1400477 (= res!939038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1400478 () Bool)

(assert (=> b!1400478 (= e!792932 (= (seekEntryOrOpen!0 (select (arr!46198 a!2901) j!112) a!2901 mask!2840) (Found!10541 j!112)))))

(declare-fun b!1400479 () Bool)

(declare-fun res!939042 () Bool)

(assert (=> b!1400479 (=> (not res!939042) (not e!792929))))

(assert (=> b!1400479 (= res!939042 (and (= (size!46750 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46750 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46750 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1400480 () Bool)

(declare-fun res!939041 () Bool)

(assert (=> b!1400480 (=> (not res!939041) (not e!792929))))

(assert (=> b!1400480 (= res!939041 (validKeyInArray!0 (select (arr!46198 a!2901) i!1037)))))

(declare-fun b!1400481 () Bool)

(assert (=> b!1400481 (= e!792934 e!792930)))

(declare-fun res!939036 () Bool)

(assert (=> b!1400481 (=> res!939036 e!792930)))

(assert (=> b!1400481 (= res!939036 (or (bvslt (x!126181 lt!616098) #b00000000000000000000000000000000) (bvsgt (x!126181 lt!616098) #b01111111111111111111111111111110) (bvslt (x!126181 lt!616101) #b00000000000000000000000000000000) (bvsgt (x!126181 lt!616101) #b01111111111111111111111111111110) (bvslt lt!616100 #b00000000000000000000000000000000) (bvsge lt!616100 (size!46750 a!2901)) (bvslt (index!44543 lt!616098) #b00000000000000000000000000000000) (bvsge (index!44543 lt!616098) (size!46750 a!2901)) (bvslt (index!44543 lt!616101) #b00000000000000000000000000000000) (bvsge (index!44543 lt!616101) (size!46750 a!2901)) (not (= lt!616098 (Intermediate!10541 false (index!44543 lt!616098) (x!126181 lt!616098)))) (not (= lt!616101 (Intermediate!10541 false (index!44543 lt!616101) (x!126181 lt!616101))))))))

(assert (=> b!1400481 e!792931))

(declare-fun res!939033 () Bool)

(assert (=> b!1400481 (=> (not res!939033) (not e!792931))))

(assert (=> b!1400481 (= res!939033 (and (not (undefined!11353 lt!616101)) (= (index!44543 lt!616101) i!1037) (bvslt (x!126181 lt!616101) (x!126181 lt!616098)) (= (select (store (arr!46198 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44543 lt!616101)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616096 () Unit!46929)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95694 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46929)

(assert (=> b!1400481 (= lt!616096 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616100 (x!126181 lt!616098) (index!44543 lt!616098) (x!126181 lt!616101) (index!44543 lt!616101) (undefined!11353 lt!616101) mask!2840))))

(declare-fun res!939039 () Bool)

(assert (=> start!120332 (=> (not res!939039) (not e!792929))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120332 (= res!939039 (validMask!0 mask!2840))))

(assert (=> start!120332 e!792929))

(assert (=> start!120332 true))

(declare-fun array_inv!35431 (array!95694) Bool)

(assert (=> start!120332 (array_inv!35431 a!2901)))

(declare-fun b!1400475 () Bool)

(declare-fun res!939043 () Bool)

(assert (=> b!1400475 (=> (not res!939043) (not e!792929))))

(declare-datatypes ((List!32795 0))(
  ( (Nil!32792) (Cons!32791 (h!34039 (_ BitVec 64)) (t!47481 List!32795)) )
))
(declare-fun arrayNoDuplicates!0 (array!95694 (_ BitVec 32) List!32795) Bool)

(assert (=> b!1400475 (= res!939043 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32792))))

(assert (= (and start!120332 res!939039) b!1400479))

(assert (= (and b!1400479 res!939042) b!1400480))

(assert (= (and b!1400480 res!939041) b!1400472))

(assert (= (and b!1400472 res!939040) b!1400477))

(assert (= (and b!1400477 res!939038) b!1400475))

(assert (= (and b!1400475 res!939043) b!1400473))

(assert (= (and b!1400473 res!939037) b!1400478))

(assert (= (and b!1400473 (not res!939035)) b!1400471))

(assert (= (and b!1400471 (not res!939034)) b!1400481))

(assert (= (and b!1400481 res!939033) b!1400474))

(assert (= (and b!1400481 (not res!939036)) b!1400476))

(declare-fun m!1287505 () Bool)

(assert (=> b!1400476 m!1287505))

(declare-fun m!1287507 () Bool)

(assert (=> b!1400478 m!1287507))

(assert (=> b!1400478 m!1287507))

(declare-fun m!1287509 () Bool)

(assert (=> b!1400478 m!1287509))

(declare-fun m!1287511 () Bool)

(assert (=> b!1400471 m!1287511))

(assert (=> b!1400471 m!1287511))

(declare-fun m!1287513 () Bool)

(assert (=> b!1400471 m!1287513))

(declare-fun m!1287515 () Bool)

(assert (=> b!1400471 m!1287515))

(declare-fun m!1287517 () Bool)

(assert (=> b!1400471 m!1287517))

(declare-fun m!1287519 () Bool)

(assert (=> b!1400475 m!1287519))

(assert (=> b!1400473 m!1287507))

(declare-fun m!1287521 () Bool)

(assert (=> b!1400473 m!1287521))

(assert (=> b!1400473 m!1287507))

(declare-fun m!1287523 () Bool)

(assert (=> b!1400473 m!1287523))

(declare-fun m!1287525 () Bool)

(assert (=> b!1400473 m!1287525))

(assert (=> b!1400473 m!1287507))

(declare-fun m!1287527 () Bool)

(assert (=> b!1400473 m!1287527))

(declare-fun m!1287529 () Bool)

(assert (=> b!1400477 m!1287529))

(declare-fun m!1287531 () Bool)

(assert (=> b!1400480 m!1287531))

(assert (=> b!1400480 m!1287531))

(declare-fun m!1287533 () Bool)

(assert (=> b!1400480 m!1287533))

(assert (=> b!1400481 m!1287515))

(declare-fun m!1287535 () Bool)

(assert (=> b!1400481 m!1287535))

(declare-fun m!1287537 () Bool)

(assert (=> b!1400481 m!1287537))

(assert (=> b!1400472 m!1287507))

(assert (=> b!1400472 m!1287507))

(declare-fun m!1287539 () Bool)

(assert (=> b!1400472 m!1287539))

(declare-fun m!1287541 () Bool)

(assert (=> b!1400474 m!1287541))

(assert (=> b!1400474 m!1287507))

(assert (=> b!1400474 m!1287507))

(declare-fun m!1287543 () Bool)

(assert (=> b!1400474 m!1287543))

(declare-fun m!1287545 () Bool)

(assert (=> start!120332 m!1287545))

(declare-fun m!1287547 () Bool)

(assert (=> start!120332 m!1287547))

(check-sat (not start!120332) (not b!1400476) (not b!1400480) (not b!1400475) (not b!1400477) (not b!1400474) (not b!1400472) (not b!1400471) (not b!1400478) (not b!1400481) (not b!1400473))
(check-sat)
