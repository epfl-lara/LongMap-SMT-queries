; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120860 () Bool)

(assert start!120860)

(declare-fun b!1406264 () Bool)

(declare-fun res!944486 () Bool)

(declare-fun e!795953 () Bool)

(assert (=> b!1406264 (=> (not res!944486) (not e!795953))))

(declare-datatypes ((array!96167 0))(
  ( (array!96168 (arr!46431 (Array (_ BitVec 32) (_ BitVec 64))) (size!46981 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96167)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406264 (= res!944486 (validKeyInArray!0 (select (arr!46431 a!2901) j!112)))))

(declare-fun b!1406265 () Bool)

(declare-fun res!944483 () Bool)

(assert (=> b!1406265 (=> (not res!944483) (not e!795953))))

(declare-datatypes ((List!32950 0))(
  ( (Nil!32947) (Cons!32946 (h!34200 (_ BitVec 64)) (t!47644 List!32950)) )
))
(declare-fun arrayNoDuplicates!0 (array!96167 (_ BitVec 32) List!32950) Bool)

(assert (=> b!1406265 (= res!944483 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32947))))

(declare-fun b!1406267 () Bool)

(declare-fun e!795955 () Bool)

(assert (=> b!1406267 (= e!795955 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10742 0))(
  ( (MissingZero!10742 (index!45345 (_ BitVec 32))) (Found!10742 (index!45346 (_ BitVec 32))) (Intermediate!10742 (undefined!11554 Bool) (index!45347 (_ BitVec 32)) (x!126949 (_ BitVec 32))) (Undefined!10742) (MissingVacant!10742 (index!45348 (_ BitVec 32))) )
))
(declare-fun lt!619318 () SeekEntryResult!10742)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96167 (_ BitVec 32)) SeekEntryResult!10742)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406267 (= lt!619318 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46431 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46431 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96168 (store (arr!46431 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46981 a!2901)) mask!2840))))

(declare-fun b!1406268 () Bool)

(declare-fun res!944481 () Bool)

(assert (=> b!1406268 (=> (not res!944481) (not e!795953))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96167 (_ BitVec 32)) Bool)

(assert (=> b!1406268 (= res!944481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406269 () Bool)

(declare-fun res!944487 () Bool)

(assert (=> b!1406269 (=> (not res!944487) (not e!795953))))

(assert (=> b!1406269 (= res!944487 (and (= (size!46981 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46981 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46981 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406270 () Bool)

(declare-fun res!944488 () Bool)

(assert (=> b!1406270 (=> (not res!944488) (not e!795953))))

(assert (=> b!1406270 (= res!944488 (validKeyInArray!0 (select (arr!46431 a!2901) i!1037)))))

(declare-fun b!1406271 () Bool)

(declare-fun e!795956 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96167 (_ BitVec 32)) SeekEntryResult!10742)

(assert (=> b!1406271 (= e!795956 (= (seekEntryOrOpen!0 (select (arr!46431 a!2901) j!112) a!2901 mask!2840) (Found!10742 j!112)))))

(declare-fun res!944485 () Bool)

(assert (=> start!120860 (=> (not res!944485) (not e!795953))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120860 (= res!944485 (validMask!0 mask!2840))))

(assert (=> start!120860 e!795953))

(assert (=> start!120860 true))

(declare-fun array_inv!35459 (array!96167) Bool)

(assert (=> start!120860 (array_inv!35459 a!2901)))

(declare-fun b!1406266 () Bool)

(assert (=> b!1406266 (= e!795953 (not e!795955))))

(declare-fun res!944482 () Bool)

(assert (=> b!1406266 (=> res!944482 e!795955)))

(declare-fun lt!619319 () SeekEntryResult!10742)

(get-info :version)

(assert (=> b!1406266 (= res!944482 (or (not ((_ is Intermediate!10742) lt!619319)) (undefined!11554 lt!619319)))))

(assert (=> b!1406266 e!795956))

(declare-fun res!944484 () Bool)

(assert (=> b!1406266 (=> (not res!944484) (not e!795956))))

(assert (=> b!1406266 (= res!944484 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47458 0))(
  ( (Unit!47459) )
))
(declare-fun lt!619320 () Unit!47458)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96167 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47458)

(assert (=> b!1406266 (= lt!619320 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1406266 (= lt!619319 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46431 a!2901) j!112) mask!2840) (select (arr!46431 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!120860 res!944485) b!1406269))

(assert (= (and b!1406269 res!944487) b!1406270))

(assert (= (and b!1406270 res!944488) b!1406264))

(assert (= (and b!1406264 res!944486) b!1406268))

(assert (= (and b!1406268 res!944481) b!1406265))

(assert (= (and b!1406265 res!944483) b!1406266))

(assert (= (and b!1406266 res!944484) b!1406271))

(assert (= (and b!1406266 (not res!944482)) b!1406267))

(declare-fun m!1295335 () Bool)

(assert (=> b!1406264 m!1295335))

(assert (=> b!1406264 m!1295335))

(declare-fun m!1295337 () Bool)

(assert (=> b!1406264 m!1295337))

(assert (=> b!1406266 m!1295335))

(declare-fun m!1295339 () Bool)

(assert (=> b!1406266 m!1295339))

(assert (=> b!1406266 m!1295335))

(declare-fun m!1295341 () Bool)

(assert (=> b!1406266 m!1295341))

(assert (=> b!1406266 m!1295339))

(assert (=> b!1406266 m!1295335))

(declare-fun m!1295343 () Bool)

(assert (=> b!1406266 m!1295343))

(declare-fun m!1295345 () Bool)

(assert (=> b!1406266 m!1295345))

(declare-fun m!1295347 () Bool)

(assert (=> b!1406270 m!1295347))

(assert (=> b!1406270 m!1295347))

(declare-fun m!1295349 () Bool)

(assert (=> b!1406270 m!1295349))

(declare-fun m!1295351 () Bool)

(assert (=> b!1406265 m!1295351))

(declare-fun m!1295353 () Bool)

(assert (=> start!120860 m!1295353))

(declare-fun m!1295355 () Bool)

(assert (=> start!120860 m!1295355))

(declare-fun m!1295357 () Bool)

(assert (=> b!1406268 m!1295357))

(assert (=> b!1406271 m!1295335))

(assert (=> b!1406271 m!1295335))

(declare-fun m!1295359 () Bool)

(assert (=> b!1406271 m!1295359))

(declare-fun m!1295361 () Bool)

(assert (=> b!1406267 m!1295361))

(declare-fun m!1295363 () Bool)

(assert (=> b!1406267 m!1295363))

(assert (=> b!1406267 m!1295363))

(declare-fun m!1295365 () Bool)

(assert (=> b!1406267 m!1295365))

(assert (=> b!1406267 m!1295365))

(assert (=> b!1406267 m!1295363))

(declare-fun m!1295367 () Bool)

(assert (=> b!1406267 m!1295367))

(check-sat (not b!1406271) (not b!1406264) (not b!1406268) (not b!1406266) (not b!1406265) (not b!1406267) (not b!1406270) (not start!120860))
