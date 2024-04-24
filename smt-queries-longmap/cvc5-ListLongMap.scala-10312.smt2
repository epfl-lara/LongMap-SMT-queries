; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121386 () Bool)

(assert start!121386)

(declare-fun b!1410362 () Bool)

(declare-fun res!947404 () Bool)

(declare-fun e!798227 () Bool)

(assert (=> b!1410362 (=> (not res!947404) (not e!798227))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((array!96462 0))(
  ( (array!96463 (arr!46572 (Array (_ BitVec 32) (_ BitVec 64))) (size!47123 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96462)

(assert (=> b!1410362 (= res!947404 (and (= (size!47123 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47123 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47123 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1410363 () Bool)

(declare-fun e!798226 () Bool)

(declare-datatypes ((SeekEntryResult!10786 0))(
  ( (MissingZero!10786 (index!45521 (_ BitVec 32))) (Found!10786 (index!45522 (_ BitVec 32))) (Intermediate!10786 (undefined!11598 Bool) (index!45523 (_ BitVec 32)) (x!127262 (_ BitVec 32))) (Undefined!10786) (MissingVacant!10786 (index!45524 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96462 (_ BitVec 32)) SeekEntryResult!10786)

(assert (=> b!1410363 (= e!798226 (= (seekEntryOrOpen!0 (select (arr!46572 a!2901) j!112) a!2901 mask!2840) (Found!10786 j!112)))))

(declare-fun b!1410364 () Bool)

(declare-fun res!947401 () Bool)

(assert (=> b!1410364 (=> (not res!947401) (not e!798227))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1410364 (= res!947401 (validKeyInArray!0 (select (arr!46572 a!2901) j!112)))))

(declare-fun b!1410365 () Bool)

(declare-fun res!947400 () Bool)

(assert (=> b!1410365 (=> (not res!947400) (not e!798227))))

(declare-datatypes ((List!33078 0))(
  ( (Nil!33075) (Cons!33074 (h!34345 (_ BitVec 64)) (t!47764 List!33078)) )
))
(declare-fun arrayNoDuplicates!0 (array!96462 (_ BitVec 32) List!33078) Bool)

(assert (=> b!1410365 (= res!947400 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33075))))

(declare-fun b!1410366 () Bool)

(declare-fun res!947403 () Bool)

(assert (=> b!1410366 (=> (not res!947403) (not e!798227))))

(assert (=> b!1410366 (= res!947403 (validKeyInArray!0 (select (arr!46572 a!2901) i!1037)))))

(declare-fun b!1410367 () Bool)

(declare-fun e!798224 () Bool)

(assert (=> b!1410367 (= e!798227 (not e!798224))))

(declare-fun res!947405 () Bool)

(assert (=> b!1410367 (=> res!947405 e!798224)))

(declare-fun lt!621039 () SeekEntryResult!10786)

(assert (=> b!1410367 (= res!947405 (or (not (is-Intermediate!10786 lt!621039)) (undefined!11598 lt!621039)))))

(assert (=> b!1410367 e!798226))

(declare-fun res!947406 () Bool)

(assert (=> b!1410367 (=> (not res!947406) (not e!798226))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96462 (_ BitVec 32)) Bool)

(assert (=> b!1410367 (= res!947406 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47573 0))(
  ( (Unit!47574) )
))
(declare-fun lt!621040 () Unit!47573)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96462 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47573)

(assert (=> b!1410367 (= lt!621040 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96462 (_ BitVec 32)) SeekEntryResult!10786)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410367 (= lt!621039 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46572 a!2901) j!112) mask!2840) (select (arr!46572 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1410368 () Bool)

(assert (=> b!1410368 (= e!798224 true)))

(declare-fun lt!621041 () SeekEntryResult!10786)

(assert (=> b!1410368 (= lt!621041 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46572 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46572 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96463 (store (arr!46572 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47123 a!2901)) mask!2840))))

(declare-fun res!947407 () Bool)

(assert (=> start!121386 (=> (not res!947407) (not e!798227))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121386 (= res!947407 (validMask!0 mask!2840))))

(assert (=> start!121386 e!798227))

(assert (=> start!121386 true))

(declare-fun array_inv!35853 (array!96462) Bool)

(assert (=> start!121386 (array_inv!35853 a!2901)))

(declare-fun b!1410369 () Bool)

(declare-fun res!947402 () Bool)

(assert (=> b!1410369 (=> (not res!947402) (not e!798227))))

(assert (=> b!1410369 (= res!947402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!121386 res!947407) b!1410362))

(assert (= (and b!1410362 res!947404) b!1410366))

(assert (= (and b!1410366 res!947403) b!1410364))

(assert (= (and b!1410364 res!947401) b!1410369))

(assert (= (and b!1410369 res!947402) b!1410365))

(assert (= (and b!1410365 res!947400) b!1410367))

(assert (= (and b!1410367 res!947406) b!1410363))

(assert (= (and b!1410367 (not res!947405)) b!1410368))

(declare-fun m!1300221 () Bool)

(assert (=> b!1410363 m!1300221))

(assert (=> b!1410363 m!1300221))

(declare-fun m!1300223 () Bool)

(assert (=> b!1410363 m!1300223))

(declare-fun m!1300225 () Bool)

(assert (=> b!1410368 m!1300225))

(declare-fun m!1300227 () Bool)

(assert (=> b!1410368 m!1300227))

(assert (=> b!1410368 m!1300227))

(declare-fun m!1300229 () Bool)

(assert (=> b!1410368 m!1300229))

(assert (=> b!1410368 m!1300229))

(assert (=> b!1410368 m!1300227))

(declare-fun m!1300231 () Bool)

(assert (=> b!1410368 m!1300231))

(assert (=> b!1410364 m!1300221))

(assert (=> b!1410364 m!1300221))

(declare-fun m!1300233 () Bool)

(assert (=> b!1410364 m!1300233))

(declare-fun m!1300235 () Bool)

(assert (=> b!1410369 m!1300235))

(declare-fun m!1300237 () Bool)

(assert (=> b!1410365 m!1300237))

(declare-fun m!1300239 () Bool)

(assert (=> b!1410366 m!1300239))

(assert (=> b!1410366 m!1300239))

(declare-fun m!1300241 () Bool)

(assert (=> b!1410366 m!1300241))

(assert (=> b!1410367 m!1300221))

(declare-fun m!1300243 () Bool)

(assert (=> b!1410367 m!1300243))

(assert (=> b!1410367 m!1300221))

(declare-fun m!1300245 () Bool)

(assert (=> b!1410367 m!1300245))

(assert (=> b!1410367 m!1300243))

(assert (=> b!1410367 m!1300221))

(declare-fun m!1300247 () Bool)

(assert (=> b!1410367 m!1300247))

(declare-fun m!1300249 () Bool)

(assert (=> b!1410367 m!1300249))

(declare-fun m!1300251 () Bool)

(assert (=> start!121386 m!1300251))

(declare-fun m!1300253 () Bool)

(assert (=> start!121386 m!1300253))

(push 1)

(assert (not b!1410368))

(assert (not b!1410365))

(assert (not b!1410367))

(assert (not start!121386))

(assert (not b!1410369))

(assert (not b!1410364))

(assert (not b!1410363))

(assert (not b!1410366))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

