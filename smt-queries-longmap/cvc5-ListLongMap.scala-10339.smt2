; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121584 () Bool)

(assert start!121584)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96522 0))(
  ( (array!96523 (arr!46598 (Array (_ BitVec 32) (_ BitVec 64))) (size!47148 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96522)

(declare-fun b!1412376 () Bool)

(declare-fun e!799267 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10909 0))(
  ( (MissingZero!10909 (index!46016 (_ BitVec 32))) (Found!10909 (index!46017 (_ BitVec 32))) (Intermediate!10909 (undefined!11721 Bool) (index!46018 (_ BitVec 32)) (x!127612 (_ BitVec 32))) (Undefined!10909) (MissingVacant!10909 (index!46019 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96522 (_ BitVec 32)) SeekEntryResult!10909)

(assert (=> b!1412376 (= e!799267 (= (seekEntryOrOpen!0 (select (arr!46598 a!2901) j!112) a!2901 mask!2840) (Found!10909 j!112)))))

(declare-fun res!949375 () Bool)

(declare-fun e!799264 () Bool)

(assert (=> start!121584 (=> (not res!949375) (not e!799264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121584 (= res!949375 (validMask!0 mask!2840))))

(assert (=> start!121584 e!799264))

(assert (=> start!121584 true))

(declare-fun array_inv!35626 (array!96522) Bool)

(assert (=> start!121584 (array_inv!35626 a!2901)))

(declare-fun lt!622290 () array!96522)

(declare-fun lt!622294 () SeekEntryResult!10909)

(declare-fun lt!622295 () (_ BitVec 64))

(declare-fun b!1412377 () Bool)

(declare-fun e!799268 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96522 (_ BitVec 32)) SeekEntryResult!10909)

(assert (=> b!1412377 (= e!799268 (= (seekEntryOrOpen!0 lt!622295 lt!622290 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127612 lt!622294) (index!46018 lt!622294) (index!46018 lt!622294) (select (arr!46598 a!2901) j!112) lt!622290 mask!2840)))))

(declare-fun b!1412378 () Bool)

(declare-fun res!949368 () Bool)

(assert (=> b!1412378 (=> (not res!949368) (not e!799264))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1412378 (= res!949368 (and (= (size!47148 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47148 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47148 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1412379 () Bool)

(declare-fun e!799265 () Bool)

(assert (=> b!1412379 (= e!799265 true)))

(assert (=> b!1412379 e!799268))

(declare-fun res!949370 () Bool)

(assert (=> b!1412379 (=> (not res!949370) (not e!799268))))

(declare-fun lt!622296 () SeekEntryResult!10909)

(assert (=> b!1412379 (= res!949370 (and (not (undefined!11721 lt!622294)) (= (index!46018 lt!622294) i!1037) (bvslt (x!127612 lt!622294) (x!127612 lt!622296)) (= (select (store (arr!46598 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46018 lt!622294)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!622293 () (_ BitVec 32))

(declare-datatypes ((Unit!47792 0))(
  ( (Unit!47793) )
))
(declare-fun lt!622292 () Unit!47792)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96522 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47792)

(assert (=> b!1412379 (= lt!622292 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622293 (x!127612 lt!622296) (index!46018 lt!622296) (x!127612 lt!622294) (index!46018 lt!622294) (undefined!11721 lt!622294) mask!2840))))

(declare-fun b!1412380 () Bool)

(declare-fun e!799263 () Bool)

(assert (=> b!1412380 (= e!799263 e!799265)))

(declare-fun res!949374 () Bool)

(assert (=> b!1412380 (=> res!949374 e!799265)))

(assert (=> b!1412380 (= res!949374 (or (= lt!622296 lt!622294) (not (is-Intermediate!10909 lt!622294))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96522 (_ BitVec 32)) SeekEntryResult!10909)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412380 (= lt!622294 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622295 mask!2840) lt!622295 lt!622290 mask!2840))))

(assert (=> b!1412380 (= lt!622295 (select (store (arr!46598 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1412380 (= lt!622290 (array!96523 (store (arr!46598 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47148 a!2901)))))

(declare-fun b!1412381 () Bool)

(declare-fun res!949366 () Bool)

(assert (=> b!1412381 (=> (not res!949366) (not e!799264))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412381 (= res!949366 (validKeyInArray!0 (select (arr!46598 a!2901) i!1037)))))

(declare-fun b!1412382 () Bool)

(declare-fun res!949373 () Bool)

(assert (=> b!1412382 (=> (not res!949373) (not e!799264))))

(assert (=> b!1412382 (= res!949373 (validKeyInArray!0 (select (arr!46598 a!2901) j!112)))))

(declare-fun b!1412383 () Bool)

(declare-fun res!949369 () Bool)

(assert (=> b!1412383 (=> (not res!949369) (not e!799264))))

(declare-datatypes ((List!33117 0))(
  ( (Nil!33114) (Cons!33113 (h!34388 (_ BitVec 64)) (t!47811 List!33117)) )
))
(declare-fun arrayNoDuplicates!0 (array!96522 (_ BitVec 32) List!33117) Bool)

(assert (=> b!1412383 (= res!949369 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33114))))

(declare-fun b!1412384 () Bool)

(declare-fun res!949371 () Bool)

(assert (=> b!1412384 (=> (not res!949371) (not e!799264))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96522 (_ BitVec 32)) Bool)

(assert (=> b!1412384 (= res!949371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1412385 () Bool)

(assert (=> b!1412385 (= e!799264 (not e!799263))))

(declare-fun res!949372 () Bool)

(assert (=> b!1412385 (=> res!949372 e!799263)))

(assert (=> b!1412385 (= res!949372 (or (not (is-Intermediate!10909 lt!622296)) (undefined!11721 lt!622296)))))

(assert (=> b!1412385 e!799267))

(declare-fun res!949367 () Bool)

(assert (=> b!1412385 (=> (not res!949367) (not e!799267))))

(assert (=> b!1412385 (= res!949367 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!622291 () Unit!47792)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96522 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47792)

(assert (=> b!1412385 (= lt!622291 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1412385 (= lt!622296 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622293 (select (arr!46598 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1412385 (= lt!622293 (toIndex!0 (select (arr!46598 a!2901) j!112) mask!2840))))

(assert (= (and start!121584 res!949375) b!1412378))

(assert (= (and b!1412378 res!949368) b!1412381))

(assert (= (and b!1412381 res!949366) b!1412382))

(assert (= (and b!1412382 res!949373) b!1412384))

(assert (= (and b!1412384 res!949371) b!1412383))

(assert (= (and b!1412383 res!949369) b!1412385))

(assert (= (and b!1412385 res!949367) b!1412376))

(assert (= (and b!1412385 (not res!949372)) b!1412380))

(assert (= (and b!1412380 (not res!949374)) b!1412379))

(assert (= (and b!1412379 res!949370) b!1412377))

(declare-fun m!1302375 () Bool)

(assert (=> start!121584 m!1302375))

(declare-fun m!1302377 () Bool)

(assert (=> start!121584 m!1302377))

(declare-fun m!1302379 () Bool)

(assert (=> b!1412385 m!1302379))

(declare-fun m!1302381 () Bool)

(assert (=> b!1412385 m!1302381))

(assert (=> b!1412385 m!1302379))

(declare-fun m!1302383 () Bool)

(assert (=> b!1412385 m!1302383))

(assert (=> b!1412385 m!1302379))

(declare-fun m!1302385 () Bool)

(assert (=> b!1412385 m!1302385))

(declare-fun m!1302387 () Bool)

(assert (=> b!1412385 m!1302387))

(declare-fun m!1302389 () Bool)

(assert (=> b!1412379 m!1302389))

(declare-fun m!1302391 () Bool)

(assert (=> b!1412379 m!1302391))

(declare-fun m!1302393 () Bool)

(assert (=> b!1412379 m!1302393))

(assert (=> b!1412382 m!1302379))

(assert (=> b!1412382 m!1302379))

(declare-fun m!1302395 () Bool)

(assert (=> b!1412382 m!1302395))

(declare-fun m!1302397 () Bool)

(assert (=> b!1412384 m!1302397))

(declare-fun m!1302399 () Bool)

(assert (=> b!1412381 m!1302399))

(assert (=> b!1412381 m!1302399))

(declare-fun m!1302401 () Bool)

(assert (=> b!1412381 m!1302401))

(declare-fun m!1302403 () Bool)

(assert (=> b!1412383 m!1302403))

(declare-fun m!1302405 () Bool)

(assert (=> b!1412380 m!1302405))

(assert (=> b!1412380 m!1302405))

(declare-fun m!1302407 () Bool)

(assert (=> b!1412380 m!1302407))

(assert (=> b!1412380 m!1302389))

(declare-fun m!1302409 () Bool)

(assert (=> b!1412380 m!1302409))

(declare-fun m!1302411 () Bool)

(assert (=> b!1412377 m!1302411))

(assert (=> b!1412377 m!1302379))

(assert (=> b!1412377 m!1302379))

(declare-fun m!1302413 () Bool)

(assert (=> b!1412377 m!1302413))

(assert (=> b!1412376 m!1302379))

(assert (=> b!1412376 m!1302379))

(declare-fun m!1302415 () Bool)

(assert (=> b!1412376 m!1302415))

(push 1)

