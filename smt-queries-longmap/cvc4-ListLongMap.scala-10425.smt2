; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122716 () Bool)

(assert start!122716)

(declare-fun b!1421853 () Bool)

(declare-fun res!957290 () Bool)

(declare-fun e!803893 () Bool)

(assert (=> b!1421853 (=> (not res!957290) (not e!803893))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97081 0))(
  ( (array!97082 (arr!46858 (Array (_ BitVec 32) (_ BitVec 64))) (size!47408 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97081)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1421853 (= res!957290 (and (= (size!47408 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47408 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47408 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1421854 () Bool)

(declare-fun res!957296 () Bool)

(declare-fun e!803892 () Bool)

(assert (=> b!1421854 (=> (not res!957296) (not e!803892))))

(declare-datatypes ((SeekEntryResult!11143 0))(
  ( (MissingZero!11143 (index!46964 (_ BitVec 32))) (Found!11143 (index!46965 (_ BitVec 32))) (Intermediate!11143 (undefined!11955 Bool) (index!46966 (_ BitVec 32)) (x!128609 (_ BitVec 32))) (Undefined!11143) (MissingVacant!11143 (index!46967 (_ BitVec 32))) )
))
(declare-fun lt!626429 () SeekEntryResult!11143)

(declare-fun lt!626428 () array!97081)

(declare-fun lt!626430 () (_ BitVec 64))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97081 (_ BitVec 32)) SeekEntryResult!11143)

(assert (=> b!1421854 (= res!957296 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626430 lt!626428 mask!2608) lt!626429))))

(declare-fun b!1421855 () Bool)

(declare-fun res!957297 () Bool)

(assert (=> b!1421855 (=> (not res!957297) (not e!803893))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1421855 (= res!957297 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47408 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47408 a!2831))))))

(declare-fun b!1421856 () Bool)

(assert (=> b!1421856 (= e!803892 (not (or (= (select (arr!46858 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46858 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46858 a!2831) index!585) (select (arr!46858 a!2831) j!81)) (= (select (store (arr!46858 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!2608 #b00000000000000000000000000000000) (bvslt index!585 (bvadd #b00000000000000000000000000000001 mask!2608)))))))

(declare-fun e!803890 () Bool)

(assert (=> b!1421856 e!803890))

(declare-fun res!957289 () Bool)

(assert (=> b!1421856 (=> (not res!957289) (not e!803890))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97081 (_ BitVec 32)) Bool)

(assert (=> b!1421856 (= res!957289 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48122 0))(
  ( (Unit!48123) )
))
(declare-fun lt!626427 () Unit!48122)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97081 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48122)

(assert (=> b!1421856 (= lt!626427 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1421857 () Bool)

(declare-fun res!957293 () Bool)

(assert (=> b!1421857 (=> (not res!957293) (not e!803893))))

(assert (=> b!1421857 (= res!957293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1421858 () Bool)

(declare-fun res!957291 () Bool)

(assert (=> b!1421858 (=> (not res!957291) (not e!803893))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421858 (= res!957291 (validKeyInArray!0 (select (arr!46858 a!2831) j!81)))))

(declare-fun b!1421859 () Bool)

(declare-fun res!957288 () Bool)

(assert (=> b!1421859 (=> (not res!957288) (not e!803892))))

(declare-fun lt!626426 () SeekEntryResult!11143)

(assert (=> b!1421859 (= res!957288 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46858 a!2831) j!81) a!2831 mask!2608) lt!626426))))

(declare-fun b!1421860 () Bool)

(declare-fun e!803894 () Bool)

(assert (=> b!1421860 (= e!803893 e!803894)))

(declare-fun res!957295 () Bool)

(assert (=> b!1421860 (=> (not res!957295) (not e!803894))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421860 (= res!957295 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46858 a!2831) j!81) mask!2608) (select (arr!46858 a!2831) j!81) a!2831 mask!2608) lt!626426))))

(assert (=> b!1421860 (= lt!626426 (Intermediate!11143 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1421861 () Bool)

(assert (=> b!1421861 (= e!803894 e!803892)))

(declare-fun res!957294 () Bool)

(assert (=> b!1421861 (=> (not res!957294) (not e!803892))))

(assert (=> b!1421861 (= res!957294 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626430 mask!2608) lt!626430 lt!626428 mask!2608) lt!626429))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1421861 (= lt!626429 (Intermediate!11143 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1421861 (= lt!626430 (select (store (arr!46858 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1421861 (= lt!626428 (array!97082 (store (arr!46858 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47408 a!2831)))))

(declare-fun b!1421862 () Bool)

(declare-fun res!957287 () Bool)

(assert (=> b!1421862 (=> (not res!957287) (not e!803892))))

(assert (=> b!1421862 (= res!957287 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1421863 () Bool)

(declare-fun res!957298 () Bool)

(assert (=> b!1421863 (=> (not res!957298) (not e!803893))))

(declare-datatypes ((List!33368 0))(
  ( (Nil!33365) (Cons!33364 (h!34666 (_ BitVec 64)) (t!48062 List!33368)) )
))
(declare-fun arrayNoDuplicates!0 (array!97081 (_ BitVec 32) List!33368) Bool)

(assert (=> b!1421863 (= res!957298 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33365))))

(declare-fun b!1421864 () Bool)

(declare-fun res!957292 () Bool)

(assert (=> b!1421864 (=> (not res!957292) (not e!803893))))

(assert (=> b!1421864 (= res!957292 (validKeyInArray!0 (select (arr!46858 a!2831) i!982)))))

(declare-fun res!957286 () Bool)

(assert (=> start!122716 (=> (not res!957286) (not e!803893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122716 (= res!957286 (validMask!0 mask!2608))))

(assert (=> start!122716 e!803893))

(assert (=> start!122716 true))

(declare-fun array_inv!35886 (array!97081) Bool)

(assert (=> start!122716 (array_inv!35886 a!2831)))

(declare-fun b!1421865 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97081 (_ BitVec 32)) SeekEntryResult!11143)

(assert (=> b!1421865 (= e!803890 (= (seekEntryOrOpen!0 (select (arr!46858 a!2831) j!81) a!2831 mask!2608) (Found!11143 j!81)))))

(assert (= (and start!122716 res!957286) b!1421853))

(assert (= (and b!1421853 res!957290) b!1421864))

(assert (= (and b!1421864 res!957292) b!1421858))

(assert (= (and b!1421858 res!957291) b!1421857))

(assert (= (and b!1421857 res!957293) b!1421863))

(assert (= (and b!1421863 res!957298) b!1421855))

(assert (= (and b!1421855 res!957297) b!1421860))

(assert (= (and b!1421860 res!957295) b!1421861))

(assert (= (and b!1421861 res!957294) b!1421859))

(assert (= (and b!1421859 res!957288) b!1421854))

(assert (= (and b!1421854 res!957296) b!1421862))

(assert (= (and b!1421862 res!957287) b!1421856))

(assert (= (and b!1421856 res!957289) b!1421865))

(declare-fun m!1312407 () Bool)

(assert (=> b!1421856 m!1312407))

(declare-fun m!1312409 () Bool)

(assert (=> b!1421856 m!1312409))

(declare-fun m!1312411 () Bool)

(assert (=> b!1421856 m!1312411))

(declare-fun m!1312413 () Bool)

(assert (=> b!1421856 m!1312413))

(declare-fun m!1312415 () Bool)

(assert (=> b!1421856 m!1312415))

(declare-fun m!1312417 () Bool)

(assert (=> b!1421856 m!1312417))

(declare-fun m!1312419 () Bool)

(assert (=> start!122716 m!1312419))

(declare-fun m!1312421 () Bool)

(assert (=> start!122716 m!1312421))

(assert (=> b!1421858 m!1312415))

(assert (=> b!1421858 m!1312415))

(declare-fun m!1312423 () Bool)

(assert (=> b!1421858 m!1312423))

(declare-fun m!1312425 () Bool)

(assert (=> b!1421863 m!1312425))

(declare-fun m!1312427 () Bool)

(assert (=> b!1421864 m!1312427))

(assert (=> b!1421864 m!1312427))

(declare-fun m!1312429 () Bool)

(assert (=> b!1421864 m!1312429))

(assert (=> b!1421860 m!1312415))

(assert (=> b!1421860 m!1312415))

(declare-fun m!1312431 () Bool)

(assert (=> b!1421860 m!1312431))

(assert (=> b!1421860 m!1312431))

(assert (=> b!1421860 m!1312415))

(declare-fun m!1312433 () Bool)

(assert (=> b!1421860 m!1312433))

(declare-fun m!1312435 () Bool)

(assert (=> b!1421861 m!1312435))

(assert (=> b!1421861 m!1312435))

(declare-fun m!1312437 () Bool)

(assert (=> b!1421861 m!1312437))

(assert (=> b!1421861 m!1312407))

(declare-fun m!1312439 () Bool)

(assert (=> b!1421861 m!1312439))

(assert (=> b!1421859 m!1312415))

(assert (=> b!1421859 m!1312415))

(declare-fun m!1312441 () Bool)

(assert (=> b!1421859 m!1312441))

(declare-fun m!1312443 () Bool)

(assert (=> b!1421854 m!1312443))

(declare-fun m!1312445 () Bool)

(assert (=> b!1421857 m!1312445))

(assert (=> b!1421865 m!1312415))

(assert (=> b!1421865 m!1312415))

(declare-fun m!1312447 () Bool)

(assert (=> b!1421865 m!1312447))

(push 1)

(assert (not b!1421856))

(assert (not b!1421858))

(assert (not b!1421860))

(assert (not b!1421864))

(assert (not b!1421854))

(assert (not b!1421859))

(assert (not b!1421861))

(assert (not start!122716))

(assert (not b!1421863))

(assert (not b!1421865))

(assert (not b!1421857))

(check-sat)

(pop 1)

(push 1)

(check-sat)

