; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122210 () Bool)

(assert start!122210)

(declare-fun b!1417461 () Bool)

(declare-fun res!952821 () Bool)

(declare-fun e!802338 () Bool)

(assert (=> b!1417461 (=> (not res!952821) (not e!802338))))

(declare-datatypes ((array!96818 0))(
  ( (array!96819 (arr!46738 (Array (_ BitVec 32) (_ BitVec 64))) (size!47289 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96818)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96818 (_ BitVec 32)) Bool)

(assert (=> b!1417461 (= res!952821 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1417463 () Bool)

(declare-fun res!952824 () Bool)

(assert (=> b!1417463 (=> (not res!952824) (not e!802338))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417463 (= res!952824 (validKeyInArray!0 (select (arr!46738 a!2901) j!112)))))

(declare-fun b!1417464 () Bool)

(declare-fun res!952826 () Bool)

(assert (=> b!1417464 (=> (not res!952826) (not e!802338))))

(declare-datatypes ((List!33244 0))(
  ( (Nil!33241) (Cons!33240 (h!34535 (_ BitVec 64)) (t!47930 List!33244)) )
))
(declare-fun arrayNoDuplicates!0 (array!96818 (_ BitVec 32) List!33244) Bool)

(assert (=> b!1417464 (= res!952826 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33241))))

(declare-fun b!1417465 () Bool)

(declare-fun e!802337 () Bool)

(assert (=> b!1417465 (= e!802337 true)))

(declare-datatypes ((SeekEntryResult!10952 0))(
  ( (MissingZero!10952 (index!46200 (_ BitVec 32))) (Found!10952 (index!46201 (_ BitVec 32))) (Intermediate!10952 (undefined!11764 Bool) (index!46202 (_ BitVec 32)) (x!127954 (_ BitVec 32))) (Undefined!10952) (MissingVacant!10952 (index!46203 (_ BitVec 32))) )
))
(declare-fun lt!625275 () SeekEntryResult!10952)

(declare-fun lt!625278 () SeekEntryResult!10952)

(assert (=> b!1417465 (= lt!625275 lt!625278)))

(declare-fun lt!625272 () (_ BitVec 32))

(declare-fun lt!625279 () SeekEntryResult!10952)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!625273 () SeekEntryResult!10952)

(declare-datatypes ((Unit!47905 0))(
  ( (Unit!47906) )
))
(declare-fun lt!625280 () Unit!47905)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!96818 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47905)

(assert (=> b!1417465 (= lt!625280 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!625272 (x!127954 lt!625273) (index!46202 lt!625273) (x!127954 lt!625279) (index!46202 lt!625279) mask!2840))))

(declare-fun b!1417466 () Bool)

(declare-fun res!952823 () Bool)

(assert (=> b!1417466 (=> (not res!952823) (not e!802338))))

(assert (=> b!1417466 (= res!952823 (validKeyInArray!0 (select (arr!46738 a!2901) i!1037)))))

(declare-fun b!1417467 () Bool)

(declare-fun res!952825 () Bool)

(assert (=> b!1417467 (=> res!952825 e!802337)))

(declare-fun lt!625274 () array!96818)

(declare-fun lt!625276 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96818 (_ BitVec 32)) SeekEntryResult!10952)

(assert (=> b!1417467 (= res!952825 (not (= lt!625279 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!625272 lt!625276 lt!625274 mask!2840))))))

(declare-fun b!1417468 () Bool)

(declare-fun e!802339 () Bool)

(assert (=> b!1417468 (= e!802338 (not e!802339))))

(declare-fun res!952820 () Bool)

(assert (=> b!1417468 (=> res!952820 e!802339)))

(get-info :version)

(assert (=> b!1417468 (= res!952820 (or (not ((_ is Intermediate!10952) lt!625273)) (undefined!11764 lt!625273)))))

(assert (=> b!1417468 (= lt!625275 (Found!10952 j!112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96818 (_ BitVec 32)) SeekEntryResult!10952)

(assert (=> b!1417468 (= lt!625275 (seekEntryOrOpen!0 (select (arr!46738 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1417468 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!625271 () Unit!47905)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96818 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47905)

(assert (=> b!1417468 (= lt!625271 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1417468 (= lt!625273 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!625272 (select (arr!46738 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417468 (= lt!625272 (toIndex!0 (select (arr!46738 a!2901) j!112) mask!2840))))

(declare-fun b!1417462 () Bool)

(declare-fun res!952819 () Bool)

(assert (=> b!1417462 (=> (not res!952819) (not e!802338))))

(assert (=> b!1417462 (= res!952819 (and (= (size!47289 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47289 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47289 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!952827 () Bool)

(assert (=> start!122210 (=> (not res!952827) (not e!802338))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122210 (= res!952827 (validMask!0 mask!2840))))

(assert (=> start!122210 e!802338))

(assert (=> start!122210 true))

(declare-fun array_inv!36019 (array!96818) Bool)

(assert (=> start!122210 (array_inv!36019 a!2901)))

(declare-fun b!1417469 () Bool)

(declare-fun e!802336 () Bool)

(assert (=> b!1417469 (= e!802336 e!802337)))

(declare-fun res!952822 () Bool)

(assert (=> b!1417469 (=> res!952822 e!802337)))

(assert (=> b!1417469 (= res!952822 (or (bvslt (x!127954 lt!625273) #b00000000000000000000000000000000) (bvsgt (x!127954 lt!625273) #b01111111111111111111111111111110) (bvslt (x!127954 lt!625279) #b00000000000000000000000000000000) (bvsgt (x!127954 lt!625279) #b01111111111111111111111111111110) (bvslt lt!625272 #b00000000000000000000000000000000) (bvsge lt!625272 (size!47289 a!2901)) (bvslt (index!46202 lt!625273) #b00000000000000000000000000000000) (bvsge (index!46202 lt!625273) (size!47289 a!2901)) (bvslt (index!46202 lt!625279) #b00000000000000000000000000000000) (bvsge (index!46202 lt!625279) (size!47289 a!2901)) (not (= lt!625273 (Intermediate!10952 false (index!46202 lt!625273) (x!127954 lt!625273)))) (not (= lt!625279 (Intermediate!10952 false (index!46202 lt!625279) (x!127954 lt!625279))))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96818 (_ BitVec 32)) SeekEntryResult!10952)

(assert (=> b!1417469 (= lt!625278 (seekKeyOrZeroReturnVacant!0 (x!127954 lt!625279) (index!46202 lt!625279) (index!46202 lt!625279) (select (arr!46738 a!2901) j!112) lt!625274 mask!2840))))

(assert (=> b!1417469 (= lt!625278 (seekEntryOrOpen!0 lt!625276 lt!625274 mask!2840))))

(assert (=> b!1417469 (and (not (undefined!11764 lt!625279)) (= (index!46202 lt!625279) i!1037) (bvslt (x!127954 lt!625279) (x!127954 lt!625273)) (= (select (store (arr!46738 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46202 lt!625279)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!625277 () Unit!47905)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96818 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47905)

(assert (=> b!1417469 (= lt!625277 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!625272 (x!127954 lt!625273) (index!46202 lt!625273) (x!127954 lt!625279) (index!46202 lt!625279) (undefined!11764 lt!625279) mask!2840))))

(declare-fun b!1417470 () Bool)

(assert (=> b!1417470 (= e!802339 e!802336)))

(declare-fun res!952828 () Bool)

(assert (=> b!1417470 (=> res!952828 e!802336)))

(assert (=> b!1417470 (= res!952828 (or (= lt!625273 lt!625279) (not ((_ is Intermediate!10952) lt!625279))))))

(assert (=> b!1417470 (= lt!625279 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!625276 mask!2840) lt!625276 lt!625274 mask!2840))))

(assert (=> b!1417470 (= lt!625276 (select (store (arr!46738 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1417470 (= lt!625274 (array!96819 (store (arr!46738 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47289 a!2901)))))

(assert (= (and start!122210 res!952827) b!1417462))

(assert (= (and b!1417462 res!952819) b!1417466))

(assert (= (and b!1417466 res!952823) b!1417463))

(assert (= (and b!1417463 res!952824) b!1417461))

(assert (= (and b!1417461 res!952821) b!1417464))

(assert (= (and b!1417464 res!952826) b!1417468))

(assert (= (and b!1417468 (not res!952820)) b!1417470))

(assert (= (and b!1417470 (not res!952828)) b!1417469))

(assert (= (and b!1417469 (not res!952822)) b!1417467))

(assert (= (and b!1417467 (not res!952825)) b!1417465))

(declare-fun m!1308355 () Bool)

(assert (=> b!1417461 m!1308355))

(declare-fun m!1308357 () Bool)

(assert (=> b!1417464 m!1308357))

(declare-fun m!1308359 () Bool)

(assert (=> start!122210 m!1308359))

(declare-fun m!1308361 () Bool)

(assert (=> start!122210 m!1308361))

(declare-fun m!1308363 () Bool)

(assert (=> b!1417468 m!1308363))

(declare-fun m!1308365 () Bool)

(assert (=> b!1417468 m!1308365))

(assert (=> b!1417468 m!1308363))

(assert (=> b!1417468 m!1308363))

(declare-fun m!1308367 () Bool)

(assert (=> b!1417468 m!1308367))

(declare-fun m!1308369 () Bool)

(assert (=> b!1417468 m!1308369))

(assert (=> b!1417468 m!1308363))

(declare-fun m!1308371 () Bool)

(assert (=> b!1417468 m!1308371))

(declare-fun m!1308373 () Bool)

(assert (=> b!1417468 m!1308373))

(declare-fun m!1308375 () Bool)

(assert (=> b!1417469 m!1308375))

(assert (=> b!1417469 m!1308363))

(declare-fun m!1308377 () Bool)

(assert (=> b!1417469 m!1308377))

(declare-fun m!1308379 () Bool)

(assert (=> b!1417469 m!1308379))

(assert (=> b!1417469 m!1308363))

(declare-fun m!1308381 () Bool)

(assert (=> b!1417469 m!1308381))

(declare-fun m!1308383 () Bool)

(assert (=> b!1417469 m!1308383))

(assert (=> b!1417463 m!1308363))

(assert (=> b!1417463 m!1308363))

(declare-fun m!1308385 () Bool)

(assert (=> b!1417463 m!1308385))

(declare-fun m!1308387 () Bool)

(assert (=> b!1417467 m!1308387))

(declare-fun m!1308389 () Bool)

(assert (=> b!1417470 m!1308389))

(assert (=> b!1417470 m!1308389))

(declare-fun m!1308391 () Bool)

(assert (=> b!1417470 m!1308391))

(assert (=> b!1417470 m!1308383))

(declare-fun m!1308393 () Bool)

(assert (=> b!1417470 m!1308393))

(declare-fun m!1308395 () Bool)

(assert (=> b!1417466 m!1308395))

(assert (=> b!1417466 m!1308395))

(declare-fun m!1308397 () Bool)

(assert (=> b!1417466 m!1308397))

(declare-fun m!1308399 () Bool)

(assert (=> b!1417465 m!1308399))

(check-sat (not b!1417469) (not b!1417470) (not b!1417466) (not b!1417461) (not b!1417468) (not b!1417463) (not b!1417465) (not b!1417467) (not start!122210) (not b!1417464))
(check-sat)
