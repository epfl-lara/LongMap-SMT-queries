; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120104 () Bool)

(assert start!120104)

(declare-fun b!1398373 () Bool)

(declare-fun res!937286 () Bool)

(declare-fun e!791655 () Bool)

(assert (=> b!1398373 (=> (not res!937286) (not e!791655))))

(declare-datatypes ((array!95633 0))(
  ( (array!95634 (arr!46170 (Array (_ BitVec 32) (_ BitVec 64))) (size!46720 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95633)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398373 (= res!937286 (validKeyInArray!0 (select (arr!46170 a!2901) i!1037)))))

(declare-fun b!1398374 () Bool)

(declare-fun e!791654 () Bool)

(assert (=> b!1398374 (= e!791655 (not e!791654))))

(declare-fun res!937291 () Bool)

(assert (=> b!1398374 (=> res!937291 e!791654)))

(declare-datatypes ((SeekEntryResult!10487 0))(
  ( (MissingZero!10487 (index!44319 (_ BitVec 32))) (Found!10487 (index!44320 (_ BitVec 32))) (Intermediate!10487 (undefined!11299 Bool) (index!44321 (_ BitVec 32)) (x!125965 (_ BitVec 32))) (Undefined!10487) (MissingVacant!10487 (index!44322 (_ BitVec 32))) )
))
(declare-fun lt!614885 () SeekEntryResult!10487)

(get-info :version)

(assert (=> b!1398374 (= res!937291 (or (not ((_ is Intermediate!10487) lt!614885)) (undefined!11299 lt!614885)))))

(declare-fun e!791657 () Bool)

(assert (=> b!1398374 e!791657))

(declare-fun res!937292 () Bool)

(assert (=> b!1398374 (=> (not res!937292) (not e!791657))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95633 (_ BitVec 32)) Bool)

(assert (=> b!1398374 (= res!937292 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46978 0))(
  ( (Unit!46979) )
))
(declare-fun lt!614883 () Unit!46978)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95633 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46978)

(assert (=> b!1398374 (= lt!614883 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!614881 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95633 (_ BitVec 32)) SeekEntryResult!10487)

(assert (=> b!1398374 (= lt!614885 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614881 (select (arr!46170 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398374 (= lt!614881 (toIndex!0 (select (arr!46170 a!2901) j!112) mask!2840))))

(declare-fun res!937289 () Bool)

(assert (=> start!120104 (=> (not res!937289) (not e!791655))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120104 (= res!937289 (validMask!0 mask!2840))))

(assert (=> start!120104 e!791655))

(assert (=> start!120104 true))

(declare-fun array_inv!35198 (array!95633) Bool)

(assert (=> start!120104 (array_inv!35198 a!2901)))

(declare-fun b!1398375 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95633 (_ BitVec 32)) SeekEntryResult!10487)

(assert (=> b!1398375 (= e!791657 (= (seekEntryOrOpen!0 (select (arr!46170 a!2901) j!112) a!2901 mask!2840) (Found!10487 j!112)))))

(declare-fun b!1398376 () Bool)

(declare-fun res!937290 () Bool)

(assert (=> b!1398376 (=> (not res!937290) (not e!791655))))

(assert (=> b!1398376 (= res!937290 (validKeyInArray!0 (select (arr!46170 a!2901) j!112)))))

(declare-fun b!1398377 () Bool)

(declare-fun e!791653 () Bool)

(assert (=> b!1398377 (= e!791653 true)))

(declare-fun lt!614886 () SeekEntryResult!10487)

(assert (=> b!1398377 (and (not (undefined!11299 lt!614886)) (= (index!44321 lt!614886) i!1037) (bvslt (x!125965 lt!614886) (x!125965 lt!614885)) (= (select (store (arr!46170 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44321 lt!614886)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!614884 () Unit!46978)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95633 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46978)

(assert (=> b!1398377 (= lt!614884 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!614881 (x!125965 lt!614885) (index!44321 lt!614885) (x!125965 lt!614886) (index!44321 lt!614886) (undefined!11299 lt!614886) mask!2840))))

(declare-fun b!1398378 () Bool)

(declare-fun res!937288 () Bool)

(assert (=> b!1398378 (=> (not res!937288) (not e!791655))))

(assert (=> b!1398378 (= res!937288 (and (= (size!46720 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46720 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46720 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1398379 () Bool)

(declare-fun res!937293 () Bool)

(assert (=> b!1398379 (=> (not res!937293) (not e!791655))))

(assert (=> b!1398379 (= res!937293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398380 () Bool)

(assert (=> b!1398380 (= e!791654 e!791653)))

(declare-fun res!937294 () Bool)

(assert (=> b!1398380 (=> res!937294 e!791653)))

(assert (=> b!1398380 (= res!937294 (or (= lt!614885 lt!614886) (not ((_ is Intermediate!10487) lt!614886))))))

(declare-fun lt!614882 () (_ BitVec 64))

(assert (=> b!1398380 (= lt!614886 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614882 mask!2840) lt!614882 (array!95634 (store (arr!46170 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46720 a!2901)) mask!2840))))

(assert (=> b!1398380 (= lt!614882 (select (store (arr!46170 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1398381 () Bool)

(declare-fun res!937287 () Bool)

(assert (=> b!1398381 (=> (not res!937287) (not e!791655))))

(declare-datatypes ((List!32689 0))(
  ( (Nil!32686) (Cons!32685 (h!33927 (_ BitVec 64)) (t!47383 List!32689)) )
))
(declare-fun arrayNoDuplicates!0 (array!95633 (_ BitVec 32) List!32689) Bool)

(assert (=> b!1398381 (= res!937287 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32686))))

(assert (= (and start!120104 res!937289) b!1398378))

(assert (= (and b!1398378 res!937288) b!1398373))

(assert (= (and b!1398373 res!937286) b!1398376))

(assert (= (and b!1398376 res!937290) b!1398379))

(assert (= (and b!1398379 res!937293) b!1398381))

(assert (= (and b!1398381 res!937287) b!1398374))

(assert (= (and b!1398374 res!937292) b!1398375))

(assert (= (and b!1398374 (not res!937291)) b!1398380))

(assert (= (and b!1398380 (not res!937294)) b!1398377))

(declare-fun m!1285475 () Bool)

(assert (=> b!1398380 m!1285475))

(declare-fun m!1285477 () Bool)

(assert (=> b!1398380 m!1285477))

(assert (=> b!1398380 m!1285475))

(declare-fun m!1285479 () Bool)

(assert (=> b!1398380 m!1285479))

(declare-fun m!1285481 () Bool)

(assert (=> b!1398380 m!1285481))

(declare-fun m!1285483 () Bool)

(assert (=> start!120104 m!1285483))

(declare-fun m!1285485 () Bool)

(assert (=> start!120104 m!1285485))

(declare-fun m!1285487 () Bool)

(assert (=> b!1398375 m!1285487))

(assert (=> b!1398375 m!1285487))

(declare-fun m!1285489 () Bool)

(assert (=> b!1398375 m!1285489))

(assert (=> b!1398377 m!1285477))

(declare-fun m!1285491 () Bool)

(assert (=> b!1398377 m!1285491))

(declare-fun m!1285493 () Bool)

(assert (=> b!1398377 m!1285493))

(assert (=> b!1398376 m!1285487))

(assert (=> b!1398376 m!1285487))

(declare-fun m!1285495 () Bool)

(assert (=> b!1398376 m!1285495))

(assert (=> b!1398374 m!1285487))

(declare-fun m!1285497 () Bool)

(assert (=> b!1398374 m!1285497))

(assert (=> b!1398374 m!1285487))

(assert (=> b!1398374 m!1285487))

(declare-fun m!1285499 () Bool)

(assert (=> b!1398374 m!1285499))

(declare-fun m!1285501 () Bool)

(assert (=> b!1398374 m!1285501))

(declare-fun m!1285503 () Bool)

(assert (=> b!1398374 m!1285503))

(declare-fun m!1285505 () Bool)

(assert (=> b!1398381 m!1285505))

(declare-fun m!1285507 () Bool)

(assert (=> b!1398373 m!1285507))

(assert (=> b!1398373 m!1285507))

(declare-fun m!1285509 () Bool)

(assert (=> b!1398373 m!1285509))

(declare-fun m!1285511 () Bool)

(assert (=> b!1398379 m!1285511))

(check-sat (not b!1398376) (not b!1398373) (not start!120104) (not b!1398379) (not b!1398375) (not b!1398374) (not b!1398377) (not b!1398381) (not b!1398380))
(check-sat)
