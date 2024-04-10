; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120100 () Bool)

(assert start!120100)

(declare-fun b!1398318 () Bool)

(declare-fun res!937236 () Bool)

(declare-fun e!791625 () Bool)

(assert (=> b!1398318 (=> (not res!937236) (not e!791625))))

(declare-datatypes ((array!95629 0))(
  ( (array!95630 (arr!46168 (Array (_ BitVec 32) (_ BitVec 64))) (size!46718 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95629)

(declare-datatypes ((List!32687 0))(
  ( (Nil!32684) (Cons!32683 (h!33925 (_ BitVec 64)) (t!47381 List!32687)) )
))
(declare-fun arrayNoDuplicates!0 (array!95629 (_ BitVec 32) List!32687) Bool)

(assert (=> b!1398318 (= res!937236 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32684))))

(declare-fun b!1398319 () Bool)

(declare-fun e!791622 () Bool)

(declare-fun lt!614850 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398319 (= e!791622 (validKeyInArray!0 lt!614850))))

(declare-fun b!1398320 () Bool)

(declare-fun e!791626 () Bool)

(assert (=> b!1398320 (= e!791626 e!791622)))

(declare-fun res!937238 () Bool)

(assert (=> b!1398320 (=> res!937238 e!791622)))

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1398320 (= res!937238 (bvslt mask!2840 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!10485 0))(
  ( (MissingZero!10485 (index!44311 (_ BitVec 32))) (Found!10485 (index!44312 (_ BitVec 32))) (Intermediate!10485 (undefined!11297 Bool) (index!44313 (_ BitVec 32)) (x!125955 (_ BitVec 32))) (Undefined!10485) (MissingVacant!10485 (index!44314 (_ BitVec 32))) )
))
(declare-fun lt!614848 () SeekEntryResult!10485)

(declare-fun lt!614847 () SeekEntryResult!10485)

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1398320 (and (not (undefined!11297 lt!614847)) (= (index!44313 lt!614847) i!1037) (bvslt (x!125955 lt!614847) (x!125955 lt!614848)) (= (select (store (arr!46168 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44313 lt!614847)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!46974 0))(
  ( (Unit!46975) )
))
(declare-fun lt!614846 () Unit!46974)

(declare-fun lt!614845 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95629 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46974)

(assert (=> b!1398320 (= lt!614846 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!614845 (x!125955 lt!614848) (index!44313 lt!614848) (x!125955 lt!614847) (index!44313 lt!614847) (undefined!11297 lt!614847) mask!2840))))

(declare-fun b!1398321 () Bool)

(declare-fun e!791623 () Bool)

(assert (=> b!1398321 (= e!791625 (not e!791623))))

(declare-fun res!937240 () Bool)

(assert (=> b!1398321 (=> res!937240 e!791623)))

(assert (=> b!1398321 (= res!937240 (or (not (is-Intermediate!10485 lt!614848)) (undefined!11297 lt!614848)))))

(declare-fun e!791627 () Bool)

(assert (=> b!1398321 e!791627))

(declare-fun res!937234 () Bool)

(assert (=> b!1398321 (=> (not res!937234) (not e!791627))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95629 (_ BitVec 32)) Bool)

(assert (=> b!1398321 (= res!937234 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!614849 () Unit!46974)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95629 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46974)

(assert (=> b!1398321 (= lt!614849 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95629 (_ BitVec 32)) SeekEntryResult!10485)

(assert (=> b!1398321 (= lt!614848 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614845 (select (arr!46168 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398321 (= lt!614845 (toIndex!0 (select (arr!46168 a!2901) j!112) mask!2840))))

(declare-fun b!1398322 () Bool)

(declare-fun res!937239 () Bool)

(assert (=> b!1398322 (=> (not res!937239) (not e!791625))))

(assert (=> b!1398322 (= res!937239 (and (= (size!46718 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46718 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46718 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!937232 () Bool)

(assert (=> start!120100 (=> (not res!937232) (not e!791625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120100 (= res!937232 (validMask!0 mask!2840))))

(assert (=> start!120100 e!791625))

(assert (=> start!120100 true))

(declare-fun array_inv!35196 (array!95629) Bool)

(assert (=> start!120100 (array_inv!35196 a!2901)))

(declare-fun b!1398323 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95629 (_ BitVec 32)) SeekEntryResult!10485)

(assert (=> b!1398323 (= e!791627 (= (seekEntryOrOpen!0 (select (arr!46168 a!2901) j!112) a!2901 mask!2840) (Found!10485 j!112)))))

(declare-fun b!1398324 () Bool)

(declare-fun res!937231 () Bool)

(assert (=> b!1398324 (=> (not res!937231) (not e!791625))))

(assert (=> b!1398324 (= res!937231 (validKeyInArray!0 (select (arr!46168 a!2901) i!1037)))))

(declare-fun b!1398325 () Bool)

(declare-fun res!937235 () Bool)

(assert (=> b!1398325 (=> (not res!937235) (not e!791625))))

(assert (=> b!1398325 (= res!937235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398326 () Bool)

(declare-fun res!937233 () Bool)

(assert (=> b!1398326 (=> (not res!937233) (not e!791625))))

(assert (=> b!1398326 (= res!937233 (validKeyInArray!0 (select (arr!46168 a!2901) j!112)))))

(declare-fun b!1398327 () Bool)

(assert (=> b!1398327 (= e!791623 e!791626)))

(declare-fun res!937237 () Bool)

(assert (=> b!1398327 (=> res!937237 e!791626)))

(assert (=> b!1398327 (= res!937237 (or (= lt!614848 lt!614847) (not (is-Intermediate!10485 lt!614847))))))

(assert (=> b!1398327 (= lt!614847 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614850 mask!2840) lt!614850 (array!95630 (store (arr!46168 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46718 a!2901)) mask!2840))))

(assert (=> b!1398327 (= lt!614850 (select (store (arr!46168 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (= (and start!120100 res!937232) b!1398322))

(assert (= (and b!1398322 res!937239) b!1398324))

(assert (= (and b!1398324 res!937231) b!1398326))

(assert (= (and b!1398326 res!937233) b!1398325))

(assert (= (and b!1398325 res!937235) b!1398318))

(assert (= (and b!1398318 res!937236) b!1398321))

(assert (= (and b!1398321 res!937234) b!1398323))

(assert (= (and b!1398321 (not res!937240)) b!1398327))

(assert (= (and b!1398327 (not res!937237)) b!1398320))

(assert (= (and b!1398320 (not res!937238)) b!1398319))

(declare-fun m!1285397 () Bool)

(assert (=> b!1398320 m!1285397))

(declare-fun m!1285399 () Bool)

(assert (=> b!1398320 m!1285399))

(declare-fun m!1285401 () Bool)

(assert (=> b!1398320 m!1285401))

(declare-fun m!1285403 () Bool)

(assert (=> b!1398318 m!1285403))

(declare-fun m!1285405 () Bool)

(assert (=> b!1398325 m!1285405))

(declare-fun m!1285407 () Bool)

(assert (=> b!1398321 m!1285407))

(declare-fun m!1285409 () Bool)

(assert (=> b!1398321 m!1285409))

(assert (=> b!1398321 m!1285407))

(declare-fun m!1285411 () Bool)

(assert (=> b!1398321 m!1285411))

(assert (=> b!1398321 m!1285407))

(declare-fun m!1285413 () Bool)

(assert (=> b!1398321 m!1285413))

(declare-fun m!1285415 () Bool)

(assert (=> b!1398321 m!1285415))

(declare-fun m!1285417 () Bool)

(assert (=> start!120100 m!1285417))

(declare-fun m!1285419 () Bool)

(assert (=> start!120100 m!1285419))

(declare-fun m!1285421 () Bool)

(assert (=> b!1398324 m!1285421))

(assert (=> b!1398324 m!1285421))

(declare-fun m!1285423 () Bool)

(assert (=> b!1398324 m!1285423))

(assert (=> b!1398323 m!1285407))

(assert (=> b!1398323 m!1285407))

(declare-fun m!1285425 () Bool)

(assert (=> b!1398323 m!1285425))

(assert (=> b!1398326 m!1285407))

(assert (=> b!1398326 m!1285407))

(declare-fun m!1285427 () Bool)

(assert (=> b!1398326 m!1285427))

(declare-fun m!1285429 () Bool)

(assert (=> b!1398319 m!1285429))

(declare-fun m!1285431 () Bool)

(assert (=> b!1398327 m!1285431))

(assert (=> b!1398327 m!1285397))

(assert (=> b!1398327 m!1285431))

(declare-fun m!1285433 () Bool)

(assert (=> b!1398327 m!1285433))

(declare-fun m!1285435 () Bool)

(assert (=> b!1398327 m!1285435))

(push 1)

