; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122024 () Bool)

(assert start!122024)

(declare-fun b!1416351 () Bool)

(declare-fun e!801616 () Bool)

(declare-fun e!801615 () Bool)

(assert (=> b!1416351 (= e!801616 e!801615)))

(declare-fun res!952402 () Bool)

(assert (=> b!1416351 (=> res!952402 e!801615)))

(declare-datatypes ((SeekEntryResult!10997 0))(
  ( (MissingZero!10997 (index!46380 (_ BitVec 32))) (Found!10997 (index!46381 (_ BitVec 32))) (Intermediate!10997 (undefined!11809 Bool) (index!46382 (_ BitVec 32)) (x!127980 (_ BitVec 32))) (Undefined!10997) (MissingVacant!10997 (index!46383 (_ BitVec 32))) )
))
(declare-fun lt!624906 () SeekEntryResult!10997)

(declare-fun lt!624910 () SeekEntryResult!10997)

(get-info :version)

(assert (=> b!1416351 (= res!952402 (or (= lt!624906 lt!624910) (not ((_ is Intermediate!10997) lt!624910))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96710 0))(
  ( (array!96711 (arr!46686 (Array (_ BitVec 32) (_ BitVec 64))) (size!47236 (_ BitVec 32))) )
))
(declare-fun lt!624908 () array!96710)

(declare-fun lt!624911 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96710 (_ BitVec 32)) SeekEntryResult!10997)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416351 (= lt!624910 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624911 mask!2840) lt!624911 lt!624908 mask!2840))))

(declare-fun a!2901 () array!96710)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1416351 (= lt!624911 (select (store (arr!46686 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1416351 (= lt!624908 (array!96711 (store (arr!46686 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47236 a!2901)))))

(declare-fun res!952393 () Bool)

(declare-fun e!801614 () Bool)

(assert (=> start!122024 (=> (not res!952393) (not e!801614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122024 (= res!952393 (validMask!0 mask!2840))))

(assert (=> start!122024 e!801614))

(assert (=> start!122024 true))

(declare-fun array_inv!35714 (array!96710) Bool)

(assert (=> start!122024 (array_inv!35714 a!2901)))

(declare-fun b!1416352 () Bool)

(assert (=> b!1416352 (= e!801614 (not e!801616))))

(declare-fun res!952395 () Bool)

(assert (=> b!1416352 (=> res!952395 e!801616)))

(assert (=> b!1416352 (= res!952395 (or (not ((_ is Intermediate!10997) lt!624906)) (undefined!11809 lt!624906)))))

(declare-fun lt!624909 () SeekEntryResult!10997)

(assert (=> b!1416352 (= lt!624909 (Found!10997 j!112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96710 (_ BitVec 32)) SeekEntryResult!10997)

(assert (=> b!1416352 (= lt!624909 (seekEntryOrOpen!0 (select (arr!46686 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96710 (_ BitVec 32)) Bool)

(assert (=> b!1416352 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47968 0))(
  ( (Unit!47969) )
))
(declare-fun lt!624904 () Unit!47968)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96710 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47968)

(assert (=> b!1416352 (= lt!624904 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!624907 () (_ BitVec 32))

(assert (=> b!1416352 (= lt!624906 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624907 (select (arr!46686 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1416352 (= lt!624907 (toIndex!0 (select (arr!46686 a!2901) j!112) mask!2840))))

(declare-fun b!1416353 () Bool)

(declare-fun res!952398 () Bool)

(assert (=> b!1416353 (=> (not res!952398) (not e!801614))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416353 (= res!952398 (validKeyInArray!0 (select (arr!46686 a!2901) j!112)))))

(declare-fun b!1416354 () Bool)

(declare-fun res!952401 () Bool)

(declare-fun e!801613 () Bool)

(assert (=> b!1416354 (=> res!952401 e!801613)))

(assert (=> b!1416354 (= res!952401 (not (= lt!624910 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624907 lt!624911 lt!624908 mask!2840))))))

(declare-fun b!1416355 () Bool)

(declare-fun res!952400 () Bool)

(assert (=> b!1416355 (=> (not res!952400) (not e!801614))))

(declare-datatypes ((List!33205 0))(
  ( (Nil!33202) (Cons!33201 (h!34488 (_ BitVec 64)) (t!47899 List!33205)) )
))
(declare-fun arrayNoDuplicates!0 (array!96710 (_ BitVec 32) List!33205) Bool)

(assert (=> b!1416355 (= res!952400 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33202))))

(declare-fun b!1416356 () Bool)

(declare-fun res!952399 () Bool)

(assert (=> b!1416356 (=> (not res!952399) (not e!801614))))

(assert (=> b!1416356 (= res!952399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1416357 () Bool)

(assert (=> b!1416357 (= e!801613 true)))

(declare-fun lt!624905 () SeekEntryResult!10997)

(assert (=> b!1416357 (= lt!624909 lt!624905)))

(declare-fun lt!624903 () Unit!47968)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!96710 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47968)

(assert (=> b!1416357 (= lt!624903 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624907 (x!127980 lt!624906) (index!46382 lt!624906) (x!127980 lt!624910) (index!46382 lt!624910) mask!2840))))

(declare-fun b!1416358 () Bool)

(assert (=> b!1416358 (= e!801615 e!801613)))

(declare-fun res!952394 () Bool)

(assert (=> b!1416358 (=> res!952394 e!801613)))

(assert (=> b!1416358 (= res!952394 (or (bvslt (x!127980 lt!624906) #b00000000000000000000000000000000) (bvsgt (x!127980 lt!624906) #b01111111111111111111111111111110) (bvslt (x!127980 lt!624910) #b00000000000000000000000000000000) (bvsgt (x!127980 lt!624910) #b01111111111111111111111111111110) (bvslt lt!624907 #b00000000000000000000000000000000) (bvsge lt!624907 (size!47236 a!2901)) (bvslt (index!46382 lt!624906) #b00000000000000000000000000000000) (bvsge (index!46382 lt!624906) (size!47236 a!2901)) (bvslt (index!46382 lt!624910) #b00000000000000000000000000000000) (bvsge (index!46382 lt!624910) (size!47236 a!2901)) (not (= lt!624906 (Intermediate!10997 false (index!46382 lt!624906) (x!127980 lt!624906)))) (not (= lt!624910 (Intermediate!10997 false (index!46382 lt!624910) (x!127980 lt!624910))))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96710 (_ BitVec 32)) SeekEntryResult!10997)

(assert (=> b!1416358 (= lt!624905 (seekKeyOrZeroReturnVacant!0 (x!127980 lt!624910) (index!46382 lt!624910) (index!46382 lt!624910) (select (arr!46686 a!2901) j!112) lt!624908 mask!2840))))

(assert (=> b!1416358 (= lt!624905 (seekEntryOrOpen!0 lt!624911 lt!624908 mask!2840))))

(assert (=> b!1416358 (and (not (undefined!11809 lt!624910)) (= (index!46382 lt!624910) i!1037) (bvslt (x!127980 lt!624910) (x!127980 lt!624906)) (= (select (store (arr!46686 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46382 lt!624910)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!624912 () Unit!47968)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96710 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47968)

(assert (=> b!1416358 (= lt!624912 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624907 (x!127980 lt!624906) (index!46382 lt!624906) (x!127980 lt!624910) (index!46382 lt!624910) (undefined!11809 lt!624910) mask!2840))))

(declare-fun b!1416359 () Bool)

(declare-fun res!952397 () Bool)

(assert (=> b!1416359 (=> (not res!952397) (not e!801614))))

(assert (=> b!1416359 (= res!952397 (and (= (size!47236 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47236 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47236 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1416360 () Bool)

(declare-fun res!952396 () Bool)

(assert (=> b!1416360 (=> (not res!952396) (not e!801614))))

(assert (=> b!1416360 (= res!952396 (validKeyInArray!0 (select (arr!46686 a!2901) i!1037)))))

(assert (= (and start!122024 res!952393) b!1416359))

(assert (= (and b!1416359 res!952397) b!1416360))

(assert (= (and b!1416360 res!952396) b!1416353))

(assert (= (and b!1416353 res!952398) b!1416356))

(assert (= (and b!1416356 res!952399) b!1416355))

(assert (= (and b!1416355 res!952400) b!1416352))

(assert (= (and b!1416352 (not res!952395)) b!1416351))

(assert (= (and b!1416351 (not res!952402)) b!1416358))

(assert (= (and b!1416358 (not res!952394)) b!1416354))

(assert (= (and b!1416354 (not res!952401)) b!1416357))

(declare-fun m!1307029 () Bool)

(assert (=> b!1416357 m!1307029))

(declare-fun m!1307031 () Bool)

(assert (=> b!1416358 m!1307031))

(declare-fun m!1307033 () Bool)

(assert (=> b!1416358 m!1307033))

(declare-fun m!1307035 () Bool)

(assert (=> b!1416358 m!1307035))

(declare-fun m!1307037 () Bool)

(assert (=> b!1416358 m!1307037))

(assert (=> b!1416358 m!1307033))

(declare-fun m!1307039 () Bool)

(assert (=> b!1416358 m!1307039))

(declare-fun m!1307041 () Bool)

(assert (=> b!1416358 m!1307041))

(assert (=> b!1416353 m!1307033))

(assert (=> b!1416353 m!1307033))

(declare-fun m!1307043 () Bool)

(assert (=> b!1416353 m!1307043))

(declare-fun m!1307045 () Bool)

(assert (=> b!1416356 m!1307045))

(declare-fun m!1307047 () Bool)

(assert (=> b!1416354 m!1307047))

(declare-fun m!1307049 () Bool)

(assert (=> b!1416360 m!1307049))

(assert (=> b!1416360 m!1307049))

(declare-fun m!1307051 () Bool)

(assert (=> b!1416360 m!1307051))

(declare-fun m!1307053 () Bool)

(assert (=> start!122024 m!1307053))

(declare-fun m!1307055 () Bool)

(assert (=> start!122024 m!1307055))

(declare-fun m!1307057 () Bool)

(assert (=> b!1416351 m!1307057))

(assert (=> b!1416351 m!1307057))

(declare-fun m!1307059 () Bool)

(assert (=> b!1416351 m!1307059))

(assert (=> b!1416351 m!1307041))

(declare-fun m!1307061 () Bool)

(assert (=> b!1416351 m!1307061))

(assert (=> b!1416352 m!1307033))

(declare-fun m!1307063 () Bool)

(assert (=> b!1416352 m!1307063))

(assert (=> b!1416352 m!1307033))

(declare-fun m!1307065 () Bool)

(assert (=> b!1416352 m!1307065))

(assert (=> b!1416352 m!1307033))

(declare-fun m!1307067 () Bool)

(assert (=> b!1416352 m!1307067))

(assert (=> b!1416352 m!1307033))

(declare-fun m!1307069 () Bool)

(assert (=> b!1416352 m!1307069))

(declare-fun m!1307071 () Bool)

(assert (=> b!1416352 m!1307071))

(declare-fun m!1307073 () Bool)

(assert (=> b!1416355 m!1307073))

(check-sat (not b!1416352) (not b!1416356) (not b!1416357) (not b!1416355) (not start!122024) (not b!1416358) (not b!1416360) (not b!1416353) (not b!1416351) (not b!1416354))
(check-sat)
