; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120204 () Bool)

(assert start!120204)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95676 0))(
  ( (array!95677 (arr!46190 (Array (_ BitVec 32) (_ BitVec 64))) (size!46740 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95676)

(declare-fun e!792114 () Bool)

(declare-fun b!1399168 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10507 0))(
  ( (MissingZero!10507 (index!44402 (_ BitVec 32))) (Found!10507 (index!44403 (_ BitVec 32))) (Intermediate!10507 (undefined!11319 Bool) (index!44404 (_ BitVec 32)) (x!126050 (_ BitVec 32))) (Undefined!10507) (MissingVacant!10507 (index!44405 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95676 (_ BitVec 32)) SeekEntryResult!10507)

(assert (=> b!1399168 (= e!792114 (= (seekEntryOrOpen!0 (select (arr!46190 a!2901) j!112) a!2901 mask!2840) (Found!10507 j!112)))))

(declare-fun b!1399169 () Bool)

(declare-fun e!792116 () Bool)

(declare-fun e!792115 () Bool)

(assert (=> b!1399169 (= e!792116 e!792115)))

(declare-fun res!937917 () Bool)

(assert (=> b!1399169 (=> res!937917 e!792115)))

(declare-fun lt!615373 () SeekEntryResult!10507)

(declare-fun lt!615370 () SeekEntryResult!10507)

(assert (=> b!1399169 (= res!937917 (or (= lt!615373 lt!615370) (not (is-Intermediate!10507 lt!615370))))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!615374 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95676 (_ BitVec 32)) SeekEntryResult!10507)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399169 (= lt!615370 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615374 mask!2840) lt!615374 (array!95677 (store (arr!46190 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46740 a!2901)) mask!2840))))

(assert (=> b!1399169 (= lt!615374 (select (store (arr!46190 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1399170 () Bool)

(declare-fun e!792113 () Bool)

(assert (=> b!1399170 (= e!792113 (not e!792116))))

(declare-fun res!937916 () Bool)

(assert (=> b!1399170 (=> res!937916 e!792116)))

(assert (=> b!1399170 (= res!937916 (or (not (is-Intermediate!10507 lt!615373)) (undefined!11319 lt!615373)))))

(assert (=> b!1399170 e!792114))

(declare-fun res!937922 () Bool)

(assert (=> b!1399170 (=> (not res!937922) (not e!792114))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95676 (_ BitVec 32)) Bool)

(assert (=> b!1399170 (= res!937922 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47018 0))(
  ( (Unit!47019) )
))
(declare-fun lt!615371 () Unit!47018)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95676 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47018)

(assert (=> b!1399170 (= lt!615371 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!615375 () (_ BitVec 32))

(assert (=> b!1399170 (= lt!615373 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615375 (select (arr!46190 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1399170 (= lt!615375 (toIndex!0 (select (arr!46190 a!2901) j!112) mask!2840))))

(declare-fun b!1399171 () Bool)

(declare-fun res!937921 () Bool)

(assert (=> b!1399171 (=> (not res!937921) (not e!792113))))

(assert (=> b!1399171 (= res!937921 (and (= (size!46740 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46740 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46740 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1399172 () Bool)

(declare-fun res!937919 () Bool)

(assert (=> b!1399172 (=> (not res!937919) (not e!792113))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399172 (= res!937919 (validKeyInArray!0 (select (arr!46190 a!2901) j!112)))))

(declare-fun b!1399173 () Bool)

(assert (=> b!1399173 (= e!792115 true)))

(assert (=> b!1399173 (and (not (undefined!11319 lt!615370)) (= (index!44404 lt!615370) i!1037) (bvslt (x!126050 lt!615370) (x!126050 lt!615373)) (= (select (store (arr!46190 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44404 lt!615370)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!615372 () Unit!47018)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95676 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47018)

(assert (=> b!1399173 (= lt!615372 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615375 (x!126050 lt!615373) (index!44404 lt!615373) (x!126050 lt!615370) (index!44404 lt!615370) (undefined!11319 lt!615370) mask!2840))))

(declare-fun b!1399174 () Bool)

(declare-fun res!937918 () Bool)

(assert (=> b!1399174 (=> (not res!937918) (not e!792113))))

(declare-datatypes ((List!32709 0))(
  ( (Nil!32706) (Cons!32705 (h!33950 (_ BitVec 64)) (t!47403 List!32709)) )
))
(declare-fun arrayNoDuplicates!0 (array!95676 (_ BitVec 32) List!32709) Bool)

(assert (=> b!1399174 (= res!937918 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32706))))

(declare-fun res!937924 () Bool)

(assert (=> start!120204 (=> (not res!937924) (not e!792113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120204 (= res!937924 (validMask!0 mask!2840))))

(assert (=> start!120204 e!792113))

(assert (=> start!120204 true))

(declare-fun array_inv!35218 (array!95676) Bool)

(assert (=> start!120204 (array_inv!35218 a!2901)))

(declare-fun b!1399175 () Bool)

(declare-fun res!937920 () Bool)

(assert (=> b!1399175 (=> (not res!937920) (not e!792113))))

(assert (=> b!1399175 (= res!937920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1399176 () Bool)

(declare-fun res!937923 () Bool)

(assert (=> b!1399176 (=> (not res!937923) (not e!792113))))

(assert (=> b!1399176 (= res!937923 (validKeyInArray!0 (select (arr!46190 a!2901) i!1037)))))

(assert (= (and start!120204 res!937924) b!1399171))

(assert (= (and b!1399171 res!937921) b!1399176))

(assert (= (and b!1399176 res!937923) b!1399172))

(assert (= (and b!1399172 res!937919) b!1399175))

(assert (= (and b!1399175 res!937920) b!1399174))

(assert (= (and b!1399174 res!937918) b!1399170))

(assert (= (and b!1399170 res!937922) b!1399168))

(assert (= (and b!1399170 (not res!937916)) b!1399169))

(assert (= (and b!1399169 (not res!937917)) b!1399173))

(declare-fun m!1286397 () Bool)

(assert (=> b!1399170 m!1286397))

(declare-fun m!1286399 () Bool)

(assert (=> b!1399170 m!1286399))

(assert (=> b!1399170 m!1286397))

(declare-fun m!1286401 () Bool)

(assert (=> b!1399170 m!1286401))

(declare-fun m!1286403 () Bool)

(assert (=> b!1399170 m!1286403))

(assert (=> b!1399170 m!1286397))

(declare-fun m!1286405 () Bool)

(assert (=> b!1399170 m!1286405))

(assert (=> b!1399172 m!1286397))

(assert (=> b!1399172 m!1286397))

(declare-fun m!1286407 () Bool)

(assert (=> b!1399172 m!1286407))

(declare-fun m!1286409 () Bool)

(assert (=> b!1399175 m!1286409))

(declare-fun m!1286411 () Bool)

(assert (=> b!1399169 m!1286411))

(declare-fun m!1286413 () Bool)

(assert (=> b!1399169 m!1286413))

(assert (=> b!1399169 m!1286411))

(declare-fun m!1286415 () Bool)

(assert (=> b!1399169 m!1286415))

(declare-fun m!1286417 () Bool)

(assert (=> b!1399169 m!1286417))

(assert (=> b!1399168 m!1286397))

(assert (=> b!1399168 m!1286397))

(declare-fun m!1286419 () Bool)

(assert (=> b!1399168 m!1286419))

(assert (=> b!1399173 m!1286413))

(declare-fun m!1286421 () Bool)

(assert (=> b!1399173 m!1286421))

(declare-fun m!1286423 () Bool)

(assert (=> b!1399173 m!1286423))

(declare-fun m!1286425 () Bool)

(assert (=> b!1399174 m!1286425))

(declare-fun m!1286427 () Bool)

(assert (=> start!120204 m!1286427))

(declare-fun m!1286429 () Bool)

(assert (=> start!120204 m!1286429))

(declare-fun m!1286431 () Bool)

(assert (=> b!1399176 m!1286431))

(assert (=> b!1399176 m!1286431))

(declare-fun m!1286433 () Bool)

(assert (=> b!1399176 m!1286433))

(push 1)

