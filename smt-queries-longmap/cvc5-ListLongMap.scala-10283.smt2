; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120858 () Bool)

(assert start!120858)

(declare-fun b!1406240 () Bool)

(declare-fun e!795943 () Bool)

(assert (=> b!1406240 (= e!795943 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96165 0))(
  ( (array!96166 (arr!46430 (Array (_ BitVec 32) (_ BitVec 64))) (size!46980 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96165)

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10741 0))(
  ( (MissingZero!10741 (index!45341 (_ BitVec 32))) (Found!10741 (index!45342 (_ BitVec 32))) (Intermediate!10741 (undefined!11553 Bool) (index!45343 (_ BitVec 32)) (x!126948 (_ BitVec 32))) (Undefined!10741) (MissingVacant!10741 (index!45344 (_ BitVec 32))) )
))
(declare-fun lt!619309 () SeekEntryResult!10741)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96165 (_ BitVec 32)) SeekEntryResult!10741)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406240 (= lt!619309 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46430 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46430 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96166 (store (arr!46430 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46980 a!2901)) mask!2840))))

(declare-fun b!1406241 () Bool)

(declare-fun e!795942 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96165 (_ BitVec 32)) SeekEntryResult!10741)

(assert (=> b!1406241 (= e!795942 (= (seekEntryOrOpen!0 (select (arr!46430 a!2901) j!112) a!2901 mask!2840) (Found!10741 j!112)))))

(declare-fun b!1406242 () Bool)

(declare-fun res!944457 () Bool)

(declare-fun e!795941 () Bool)

(assert (=> b!1406242 (=> (not res!944457) (not e!795941))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96165 (_ BitVec 32)) Bool)

(assert (=> b!1406242 (= res!944457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!944458 () Bool)

(assert (=> start!120858 (=> (not res!944458) (not e!795941))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120858 (= res!944458 (validMask!0 mask!2840))))

(assert (=> start!120858 e!795941))

(assert (=> start!120858 true))

(declare-fun array_inv!35458 (array!96165) Bool)

(assert (=> start!120858 (array_inv!35458 a!2901)))

(declare-fun b!1406243 () Bool)

(declare-fun res!944463 () Bool)

(assert (=> b!1406243 (=> (not res!944463) (not e!795941))))

(declare-datatypes ((List!32949 0))(
  ( (Nil!32946) (Cons!32945 (h!34199 (_ BitVec 64)) (t!47643 List!32949)) )
))
(declare-fun arrayNoDuplicates!0 (array!96165 (_ BitVec 32) List!32949) Bool)

(assert (=> b!1406243 (= res!944463 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32946))))

(declare-fun b!1406244 () Bool)

(assert (=> b!1406244 (= e!795941 (not e!795943))))

(declare-fun res!944464 () Bool)

(assert (=> b!1406244 (=> res!944464 e!795943)))

(declare-fun lt!619311 () SeekEntryResult!10741)

(assert (=> b!1406244 (= res!944464 (or (not (is-Intermediate!10741 lt!619311)) (undefined!11553 lt!619311)))))

(assert (=> b!1406244 e!795942))

(declare-fun res!944460 () Bool)

(assert (=> b!1406244 (=> (not res!944460) (not e!795942))))

(assert (=> b!1406244 (= res!944460 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47456 0))(
  ( (Unit!47457) )
))
(declare-fun lt!619310 () Unit!47456)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96165 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47456)

(assert (=> b!1406244 (= lt!619310 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1406244 (= lt!619311 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46430 a!2901) j!112) mask!2840) (select (arr!46430 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406245 () Bool)

(declare-fun res!944461 () Bool)

(assert (=> b!1406245 (=> (not res!944461) (not e!795941))))

(assert (=> b!1406245 (= res!944461 (and (= (size!46980 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46980 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46980 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406246 () Bool)

(declare-fun res!944459 () Bool)

(assert (=> b!1406246 (=> (not res!944459) (not e!795941))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406246 (= res!944459 (validKeyInArray!0 (select (arr!46430 a!2901) i!1037)))))

(declare-fun b!1406247 () Bool)

(declare-fun res!944462 () Bool)

(assert (=> b!1406247 (=> (not res!944462) (not e!795941))))

(assert (=> b!1406247 (= res!944462 (validKeyInArray!0 (select (arr!46430 a!2901) j!112)))))

(assert (= (and start!120858 res!944458) b!1406245))

(assert (= (and b!1406245 res!944461) b!1406246))

(assert (= (and b!1406246 res!944459) b!1406247))

(assert (= (and b!1406247 res!944462) b!1406242))

(assert (= (and b!1406242 res!944457) b!1406243))

(assert (= (and b!1406243 res!944463) b!1406244))

(assert (= (and b!1406244 res!944460) b!1406241))

(assert (= (and b!1406244 (not res!944464)) b!1406240))

(declare-fun m!1295301 () Bool)

(assert (=> b!1406241 m!1295301))

(assert (=> b!1406241 m!1295301))

(declare-fun m!1295303 () Bool)

(assert (=> b!1406241 m!1295303))

(declare-fun m!1295305 () Bool)

(assert (=> start!120858 m!1295305))

(declare-fun m!1295307 () Bool)

(assert (=> start!120858 m!1295307))

(declare-fun m!1295309 () Bool)

(assert (=> b!1406242 m!1295309))

(assert (=> b!1406244 m!1295301))

(declare-fun m!1295311 () Bool)

(assert (=> b!1406244 m!1295311))

(assert (=> b!1406244 m!1295301))

(declare-fun m!1295313 () Bool)

(assert (=> b!1406244 m!1295313))

(assert (=> b!1406244 m!1295311))

(assert (=> b!1406244 m!1295301))

(declare-fun m!1295315 () Bool)

(assert (=> b!1406244 m!1295315))

(declare-fun m!1295317 () Bool)

(assert (=> b!1406244 m!1295317))

(declare-fun m!1295319 () Bool)

(assert (=> b!1406246 m!1295319))

(assert (=> b!1406246 m!1295319))

(declare-fun m!1295321 () Bool)

(assert (=> b!1406246 m!1295321))

(declare-fun m!1295323 () Bool)

(assert (=> b!1406243 m!1295323))

(assert (=> b!1406247 m!1295301))

(assert (=> b!1406247 m!1295301))

(declare-fun m!1295325 () Bool)

(assert (=> b!1406247 m!1295325))

(declare-fun m!1295327 () Bool)

(assert (=> b!1406240 m!1295327))

(declare-fun m!1295329 () Bool)

(assert (=> b!1406240 m!1295329))

(assert (=> b!1406240 m!1295329))

(declare-fun m!1295331 () Bool)

(assert (=> b!1406240 m!1295331))

(assert (=> b!1406240 m!1295331))

(assert (=> b!1406240 m!1295329))

(declare-fun m!1295333 () Bool)

(assert (=> b!1406240 m!1295333))

(push 1)

(assert (not b!1406240))

(assert (not b!1406243))

(assert (not b!1406244))

(assert (not b!1406246))

(assert (not b!1406242))

(assert (not b!1406247))

(assert (not b!1406241))

(assert (not start!120858))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

