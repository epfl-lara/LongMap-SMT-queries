; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120042 () Bool)

(assert start!120042)

(declare-fun b!1397527 () Bool)

(declare-fun res!936442 () Bool)

(declare-fun e!791183 () Bool)

(assert (=> b!1397527 (=> (not res!936442) (not e!791183))))

(declare-datatypes ((array!95571 0))(
  ( (array!95572 (arr!46139 (Array (_ BitVec 32) (_ BitVec 64))) (size!46689 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95571)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397527 (= res!936442 (validKeyInArray!0 (select (arr!46139 a!2901) j!112)))))

(declare-fun b!1397528 () Bool)

(declare-fun res!936444 () Bool)

(assert (=> b!1397528 (=> (not res!936444) (not e!791183))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95571 (_ BitVec 32)) Bool)

(assert (=> b!1397528 (= res!936444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397529 () Bool)

(declare-fun res!936447 () Bool)

(assert (=> b!1397529 (=> (not res!936447) (not e!791183))))

(declare-datatypes ((List!32658 0))(
  ( (Nil!32655) (Cons!32654 (h!33896 (_ BitVec 64)) (t!47352 List!32658)) )
))
(declare-fun arrayNoDuplicates!0 (array!95571 (_ BitVec 32) List!32658) Bool)

(assert (=> b!1397529 (= res!936447 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32655))))

(declare-fun b!1397530 () Bool)

(declare-fun res!936446 () Bool)

(assert (=> b!1397530 (=> (not res!936446) (not e!791183))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1397530 (= res!936446 (and (= (size!46689 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46689 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46689 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397531 () Bool)

(declare-fun res!936448 () Bool)

(assert (=> b!1397531 (=> (not res!936448) (not e!791183))))

(assert (=> b!1397531 (= res!936448 (validKeyInArray!0 (select (arr!46139 a!2901) i!1037)))))

(declare-fun b!1397532 () Bool)

(declare-fun e!791179 () Bool)

(assert (=> b!1397532 (= e!791179 true)))

(declare-fun lt!614274 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10456 0))(
  ( (MissingZero!10456 (index!44195 (_ BitVec 32))) (Found!10456 (index!44196 (_ BitVec 32))) (Intermediate!10456 (undefined!11268 Bool) (index!44197 (_ BitVec 32)) (x!125854 (_ BitVec 32))) (Undefined!10456) (MissingVacant!10456 (index!44198 (_ BitVec 32))) )
))
(declare-fun lt!614271 () SeekEntryResult!10456)

(declare-fun lt!614276 () array!95571)

(declare-fun lt!614277 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95571 (_ BitVec 32)) SeekEntryResult!10456)

(assert (=> b!1397532 (= lt!614271 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614277 lt!614274 lt!614276 mask!2840))))

(declare-fun b!1397533 () Bool)

(declare-fun e!791181 () Bool)

(assert (=> b!1397533 (= e!791181 e!791179)))

(declare-fun res!936441 () Bool)

(assert (=> b!1397533 (=> res!936441 e!791179)))

(declare-fun lt!614275 () SeekEntryResult!10456)

(declare-fun lt!614273 () SeekEntryResult!10456)

(assert (=> b!1397533 (= res!936441 (or (= lt!614275 lt!614273) (not (is-Intermediate!10456 lt!614273)) (bvslt (x!125854 lt!614275) #b00000000000000000000000000000000) (bvsgt (x!125854 lt!614275) #b01111111111111111111111111111110) (bvslt lt!614277 #b00000000000000000000000000000000) (bvsge lt!614277 (size!46689 a!2901)) (bvslt (index!44197 lt!614275) #b00000000000000000000000000000000) (bvsge (index!44197 lt!614275) (size!46689 a!2901)) (not (= lt!614275 (Intermediate!10456 false (index!44197 lt!614275) (x!125854 lt!614275)))) (not (= lt!614273 (Intermediate!10456 (undefined!11268 lt!614273) (index!44197 lt!614273) (x!125854 lt!614273))))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397533 (= lt!614273 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614274 mask!2840) lt!614274 lt!614276 mask!2840))))

(assert (=> b!1397533 (= lt!614274 (select (store (arr!46139 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397533 (= lt!614276 (array!95572 (store (arr!46139 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46689 a!2901)))))

(declare-fun res!936443 () Bool)

(assert (=> start!120042 (=> (not res!936443) (not e!791183))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120042 (= res!936443 (validMask!0 mask!2840))))

(assert (=> start!120042 e!791183))

(assert (=> start!120042 true))

(declare-fun array_inv!35167 (array!95571) Bool)

(assert (=> start!120042 (array_inv!35167 a!2901)))

(declare-fun b!1397534 () Bool)

(assert (=> b!1397534 (= e!791183 (not e!791181))))

(declare-fun res!936445 () Bool)

(assert (=> b!1397534 (=> res!936445 e!791181)))

(assert (=> b!1397534 (= res!936445 (or (not (is-Intermediate!10456 lt!614275)) (undefined!11268 lt!614275)))))

(declare-fun e!791180 () Bool)

(assert (=> b!1397534 e!791180))

(declare-fun res!936440 () Bool)

(assert (=> b!1397534 (=> (not res!936440) (not e!791180))))

(assert (=> b!1397534 (= res!936440 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46916 0))(
  ( (Unit!46917) )
))
(declare-fun lt!614272 () Unit!46916)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95571 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46916)

(assert (=> b!1397534 (= lt!614272 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1397534 (= lt!614275 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614277 (select (arr!46139 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1397534 (= lt!614277 (toIndex!0 (select (arr!46139 a!2901) j!112) mask!2840))))

(declare-fun b!1397535 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95571 (_ BitVec 32)) SeekEntryResult!10456)

(assert (=> b!1397535 (= e!791180 (= (seekEntryOrOpen!0 (select (arr!46139 a!2901) j!112) a!2901 mask!2840) (Found!10456 j!112)))))

(assert (= (and start!120042 res!936443) b!1397530))

(assert (= (and b!1397530 res!936446) b!1397531))

(assert (= (and b!1397531 res!936448) b!1397527))

(assert (= (and b!1397527 res!936442) b!1397528))

(assert (= (and b!1397528 res!936444) b!1397529))

(assert (= (and b!1397529 res!936447) b!1397534))

(assert (= (and b!1397534 res!936440) b!1397535))

(assert (= (and b!1397534 (not res!936445)) b!1397533))

(assert (= (and b!1397533 (not res!936441)) b!1397532))

(declare-fun m!1284327 () Bool)

(assert (=> b!1397528 m!1284327))

(declare-fun m!1284329 () Bool)

(assert (=> start!120042 m!1284329))

(declare-fun m!1284331 () Bool)

(assert (=> start!120042 m!1284331))

(declare-fun m!1284333 () Bool)

(assert (=> b!1397531 m!1284333))

(assert (=> b!1397531 m!1284333))

(declare-fun m!1284335 () Bool)

(assert (=> b!1397531 m!1284335))

(declare-fun m!1284337 () Bool)

(assert (=> b!1397534 m!1284337))

(declare-fun m!1284339 () Bool)

(assert (=> b!1397534 m!1284339))

(assert (=> b!1397534 m!1284337))

(declare-fun m!1284341 () Bool)

(assert (=> b!1397534 m!1284341))

(assert (=> b!1397534 m!1284337))

(declare-fun m!1284343 () Bool)

(assert (=> b!1397534 m!1284343))

(declare-fun m!1284345 () Bool)

(assert (=> b!1397534 m!1284345))

(assert (=> b!1397535 m!1284337))

(assert (=> b!1397535 m!1284337))

(declare-fun m!1284347 () Bool)

(assert (=> b!1397535 m!1284347))

(assert (=> b!1397527 m!1284337))

(assert (=> b!1397527 m!1284337))

(declare-fun m!1284349 () Bool)

(assert (=> b!1397527 m!1284349))

(declare-fun m!1284351 () Bool)

(assert (=> b!1397529 m!1284351))

(declare-fun m!1284353 () Bool)

(assert (=> b!1397532 m!1284353))

(declare-fun m!1284355 () Bool)

(assert (=> b!1397533 m!1284355))

(assert (=> b!1397533 m!1284355))

(declare-fun m!1284357 () Bool)

(assert (=> b!1397533 m!1284357))

(declare-fun m!1284359 () Bool)

(assert (=> b!1397533 m!1284359))

(declare-fun m!1284361 () Bool)

(assert (=> b!1397533 m!1284361))

(push 1)

