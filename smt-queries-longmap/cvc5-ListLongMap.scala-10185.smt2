; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120036 () Bool)

(assert start!120036)

(declare-fun b!1397446 () Bool)

(declare-fun res!936363 () Bool)

(declare-fun e!791138 () Bool)

(assert (=> b!1397446 (=> (not res!936363) (not e!791138))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95565 0))(
  ( (array!95566 (arr!46136 (Array (_ BitVec 32) (_ BitVec 64))) (size!46686 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95565)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1397446 (= res!936363 (and (= (size!46686 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46686 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46686 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397447 () Bool)

(declare-fun e!791137 () Bool)

(declare-datatypes ((SeekEntryResult!10453 0))(
  ( (MissingZero!10453 (index!44183 (_ BitVec 32))) (Found!10453 (index!44184 (_ BitVec 32))) (Intermediate!10453 (undefined!11265 Bool) (index!44185 (_ BitVec 32)) (x!125843 (_ BitVec 32))) (Undefined!10453) (MissingVacant!10453 (index!44186 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95565 (_ BitVec 32)) SeekEntryResult!10453)

(assert (=> b!1397447 (= e!791137 (= (seekEntryOrOpen!0 (select (arr!46136 a!2901) j!112) a!2901 mask!2840) (Found!10453 j!112)))))

(declare-fun res!936366 () Bool)

(assert (=> start!120036 (=> (not res!936366) (not e!791138))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120036 (= res!936366 (validMask!0 mask!2840))))

(assert (=> start!120036 e!791138))

(assert (=> start!120036 true))

(declare-fun array_inv!35164 (array!95565) Bool)

(assert (=> start!120036 (array_inv!35164 a!2901)))

(declare-fun b!1397448 () Bool)

(declare-fun e!791134 () Bool)

(assert (=> b!1397448 (= e!791138 (not e!791134))))

(declare-fun res!936365 () Bool)

(assert (=> b!1397448 (=> res!936365 e!791134)))

(declare-fun lt!614213 () SeekEntryResult!10453)

(assert (=> b!1397448 (= res!936365 (or (not (is-Intermediate!10453 lt!614213)) (undefined!11265 lt!614213)))))

(assert (=> b!1397448 e!791137))

(declare-fun res!936359 () Bool)

(assert (=> b!1397448 (=> (not res!936359) (not e!791137))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95565 (_ BitVec 32)) Bool)

(assert (=> b!1397448 (= res!936359 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46910 0))(
  ( (Unit!46911) )
))
(declare-fun lt!614214 () Unit!46910)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95565 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46910)

(assert (=> b!1397448 (= lt!614214 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!614210 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95565 (_ BitVec 32)) SeekEntryResult!10453)

(assert (=> b!1397448 (= lt!614213 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614210 (select (arr!46136 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397448 (= lt!614210 (toIndex!0 (select (arr!46136 a!2901) j!112) mask!2840))))

(declare-fun b!1397449 () Bool)

(declare-fun e!791135 () Bool)

(assert (=> b!1397449 (= e!791134 e!791135)))

(declare-fun res!936362 () Bool)

(assert (=> b!1397449 (=> res!936362 e!791135)))

(declare-fun lt!614209 () SeekEntryResult!10453)

(assert (=> b!1397449 (= res!936362 (or (= lt!614213 lt!614209) (not (is-Intermediate!10453 lt!614209)) (bvslt (x!125843 lt!614213) #b00000000000000000000000000000000) (bvsgt (x!125843 lt!614213) #b01111111111111111111111111111110) (bvslt lt!614210 #b00000000000000000000000000000000) (bvsge lt!614210 (size!46686 a!2901)) (bvslt (index!44185 lt!614213) #b00000000000000000000000000000000) (bvsge (index!44185 lt!614213) (size!46686 a!2901)) (not (= lt!614213 (Intermediate!10453 false (index!44185 lt!614213) (x!125843 lt!614213)))) (not (= lt!614209 (Intermediate!10453 (undefined!11265 lt!614209) (index!44185 lt!614209) (x!125843 lt!614209))))))))

(declare-fun lt!614208 () array!95565)

(declare-fun lt!614211 () (_ BitVec 64))

(assert (=> b!1397449 (= lt!614209 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614211 mask!2840) lt!614211 lt!614208 mask!2840))))

(assert (=> b!1397449 (= lt!614211 (select (store (arr!46136 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397449 (= lt!614208 (array!95566 (store (arr!46136 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46686 a!2901)))))

(declare-fun b!1397450 () Bool)

(declare-fun res!936367 () Bool)

(assert (=> b!1397450 (=> (not res!936367) (not e!791138))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397450 (= res!936367 (validKeyInArray!0 (select (arr!46136 a!2901) i!1037)))))

(declare-fun b!1397451 () Bool)

(declare-fun res!936364 () Bool)

(assert (=> b!1397451 (=> (not res!936364) (not e!791138))))

(assert (=> b!1397451 (= res!936364 (validKeyInArray!0 (select (arr!46136 a!2901) j!112)))))

(declare-fun b!1397452 () Bool)

(declare-fun res!936360 () Bool)

(assert (=> b!1397452 (=> (not res!936360) (not e!791138))))

(declare-datatypes ((List!32655 0))(
  ( (Nil!32652) (Cons!32651 (h!33893 (_ BitVec 64)) (t!47349 List!32655)) )
))
(declare-fun arrayNoDuplicates!0 (array!95565 (_ BitVec 32) List!32655) Bool)

(assert (=> b!1397452 (= res!936360 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32652))))

(declare-fun b!1397453 () Bool)

(declare-fun res!936361 () Bool)

(assert (=> b!1397453 (=> (not res!936361) (not e!791138))))

(assert (=> b!1397453 (= res!936361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397454 () Bool)

(assert (=> b!1397454 (= e!791135 true)))

(declare-fun lt!614212 () SeekEntryResult!10453)

(assert (=> b!1397454 (= lt!614212 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614210 lt!614211 lt!614208 mask!2840))))

(assert (= (and start!120036 res!936366) b!1397446))

(assert (= (and b!1397446 res!936363) b!1397450))

(assert (= (and b!1397450 res!936367) b!1397451))

(assert (= (and b!1397451 res!936364) b!1397453))

(assert (= (and b!1397453 res!936361) b!1397452))

(assert (= (and b!1397452 res!936360) b!1397448))

(assert (= (and b!1397448 res!936359) b!1397447))

(assert (= (and b!1397448 (not res!936365)) b!1397449))

(assert (= (and b!1397449 (not res!936362)) b!1397454))

(declare-fun m!1284219 () Bool)

(assert (=> b!1397447 m!1284219))

(assert (=> b!1397447 m!1284219))

(declare-fun m!1284221 () Bool)

(assert (=> b!1397447 m!1284221))

(declare-fun m!1284223 () Bool)

(assert (=> b!1397450 m!1284223))

(assert (=> b!1397450 m!1284223))

(declare-fun m!1284225 () Bool)

(assert (=> b!1397450 m!1284225))

(assert (=> b!1397448 m!1284219))

(declare-fun m!1284227 () Bool)

(assert (=> b!1397448 m!1284227))

(assert (=> b!1397448 m!1284219))

(declare-fun m!1284229 () Bool)

(assert (=> b!1397448 m!1284229))

(assert (=> b!1397448 m!1284219))

(declare-fun m!1284231 () Bool)

(assert (=> b!1397448 m!1284231))

(declare-fun m!1284233 () Bool)

(assert (=> b!1397448 m!1284233))

(declare-fun m!1284235 () Bool)

(assert (=> b!1397449 m!1284235))

(assert (=> b!1397449 m!1284235))

(declare-fun m!1284237 () Bool)

(assert (=> b!1397449 m!1284237))

(declare-fun m!1284239 () Bool)

(assert (=> b!1397449 m!1284239))

(declare-fun m!1284241 () Bool)

(assert (=> b!1397449 m!1284241))

(assert (=> b!1397451 m!1284219))

(assert (=> b!1397451 m!1284219))

(declare-fun m!1284243 () Bool)

(assert (=> b!1397451 m!1284243))

(declare-fun m!1284245 () Bool)

(assert (=> b!1397454 m!1284245))

(declare-fun m!1284247 () Bool)

(assert (=> start!120036 m!1284247))

(declare-fun m!1284249 () Bool)

(assert (=> start!120036 m!1284249))

(declare-fun m!1284251 () Bool)

(assert (=> b!1397452 m!1284251))

(declare-fun m!1284253 () Bool)

(assert (=> b!1397453 m!1284253))

(push 1)

