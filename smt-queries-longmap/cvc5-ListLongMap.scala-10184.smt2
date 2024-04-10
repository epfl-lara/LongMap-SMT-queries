; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120030 () Bool)

(assert start!120030)

(declare-fun res!936279 () Bool)

(declare-fun e!791091 () Bool)

(assert (=> start!120030 (=> (not res!936279) (not e!791091))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120030 (= res!936279 (validMask!0 mask!2840))))

(assert (=> start!120030 e!791091))

(assert (=> start!120030 true))

(declare-datatypes ((array!95559 0))(
  ( (array!95560 (arr!46133 (Array (_ BitVec 32) (_ BitVec 64))) (size!46683 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95559)

(declare-fun array_inv!35161 (array!95559) Bool)

(assert (=> start!120030 (array_inv!35161 a!2901)))

(declare-fun b!1397365 () Bool)

(declare-fun res!936284 () Bool)

(assert (=> b!1397365 (=> (not res!936284) (not e!791091))))

(declare-datatypes ((List!32652 0))(
  ( (Nil!32649) (Cons!32648 (h!33890 (_ BitVec 64)) (t!47346 List!32652)) )
))
(declare-fun arrayNoDuplicates!0 (array!95559 (_ BitVec 32) List!32652) Bool)

(assert (=> b!1397365 (= res!936284 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32649))))

(declare-fun b!1397366 () Bool)

(declare-fun e!791093 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10450 0))(
  ( (MissingZero!10450 (index!44171 (_ BitVec 32))) (Found!10450 (index!44172 (_ BitVec 32))) (Intermediate!10450 (undefined!11262 Bool) (index!44173 (_ BitVec 32)) (x!125832 (_ BitVec 32))) (Undefined!10450) (MissingVacant!10450 (index!44174 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95559 (_ BitVec 32)) SeekEntryResult!10450)

(assert (=> b!1397366 (= e!791093 (= (seekEntryOrOpen!0 (select (arr!46133 a!2901) j!112) a!2901 mask!2840) (Found!10450 j!112)))))

(declare-fun b!1397367 () Bool)

(declare-fun res!936282 () Bool)

(assert (=> b!1397367 (=> (not res!936282) (not e!791091))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95559 (_ BitVec 32)) Bool)

(assert (=> b!1397367 (= res!936282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397368 () Bool)

(declare-fun e!791089 () Bool)

(assert (=> b!1397368 (= e!791089 true)))

(declare-fun lt!614145 () array!95559)

(declare-fun lt!614147 () SeekEntryResult!10450)

(declare-fun lt!614149 () (_ BitVec 64))

(declare-fun lt!614148 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95559 (_ BitVec 32)) SeekEntryResult!10450)

(assert (=> b!1397368 (= lt!614147 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614148 lt!614149 lt!614145 mask!2840))))

(declare-fun b!1397369 () Bool)

(declare-fun e!791092 () Bool)

(assert (=> b!1397369 (= e!791091 (not e!791092))))

(declare-fun res!936278 () Bool)

(assert (=> b!1397369 (=> res!936278 e!791092)))

(declare-fun lt!614146 () SeekEntryResult!10450)

(assert (=> b!1397369 (= res!936278 (or (not (is-Intermediate!10450 lt!614146)) (undefined!11262 lt!614146)))))

(assert (=> b!1397369 e!791093))

(declare-fun res!936286 () Bool)

(assert (=> b!1397369 (=> (not res!936286) (not e!791093))))

(assert (=> b!1397369 (= res!936286 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46904 0))(
  ( (Unit!46905) )
))
(declare-fun lt!614150 () Unit!46904)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95559 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46904)

(assert (=> b!1397369 (= lt!614150 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1397369 (= lt!614146 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614148 (select (arr!46133 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397369 (= lt!614148 (toIndex!0 (select (arr!46133 a!2901) j!112) mask!2840))))

(declare-fun b!1397370 () Bool)

(declare-fun res!936281 () Bool)

(assert (=> b!1397370 (=> (not res!936281) (not e!791091))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397370 (= res!936281 (validKeyInArray!0 (select (arr!46133 a!2901) j!112)))))

(declare-fun b!1397371 () Bool)

(declare-fun res!936283 () Bool)

(assert (=> b!1397371 (=> (not res!936283) (not e!791091))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1397371 (= res!936283 (validKeyInArray!0 (select (arr!46133 a!2901) i!1037)))))

(declare-fun b!1397372 () Bool)

(assert (=> b!1397372 (= e!791092 e!791089)))

(declare-fun res!936280 () Bool)

(assert (=> b!1397372 (=> res!936280 e!791089)))

(declare-fun lt!614151 () SeekEntryResult!10450)

(assert (=> b!1397372 (= res!936280 (or (= lt!614146 lt!614151) (not (is-Intermediate!10450 lt!614151)) (bvslt (x!125832 lt!614146) #b00000000000000000000000000000000) (bvsgt (x!125832 lt!614146) #b01111111111111111111111111111110) (bvslt lt!614148 #b00000000000000000000000000000000) (bvsge lt!614148 (size!46683 a!2901)) (bvslt (index!44173 lt!614146) #b00000000000000000000000000000000) (bvsge (index!44173 lt!614146) (size!46683 a!2901)) (not (= lt!614146 (Intermediate!10450 false (index!44173 lt!614146) (x!125832 lt!614146)))) (not (= lt!614151 (Intermediate!10450 (undefined!11262 lt!614151) (index!44173 lt!614151) (x!125832 lt!614151))))))))

(assert (=> b!1397372 (= lt!614151 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614149 mask!2840) lt!614149 lt!614145 mask!2840))))

(assert (=> b!1397372 (= lt!614149 (select (store (arr!46133 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397372 (= lt!614145 (array!95560 (store (arr!46133 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46683 a!2901)))))

(declare-fun b!1397373 () Bool)

(declare-fun res!936285 () Bool)

(assert (=> b!1397373 (=> (not res!936285) (not e!791091))))

(assert (=> b!1397373 (= res!936285 (and (= (size!46683 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46683 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46683 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120030 res!936279) b!1397373))

(assert (= (and b!1397373 res!936285) b!1397371))

(assert (= (and b!1397371 res!936283) b!1397370))

(assert (= (and b!1397370 res!936281) b!1397367))

(assert (= (and b!1397367 res!936282) b!1397365))

(assert (= (and b!1397365 res!936284) b!1397369))

(assert (= (and b!1397369 res!936286) b!1397366))

(assert (= (and b!1397369 (not res!936278)) b!1397372))

(assert (= (and b!1397372 (not res!936280)) b!1397368))

(declare-fun m!1284111 () Bool)

(assert (=> b!1397365 m!1284111))

(declare-fun m!1284113 () Bool)

(assert (=> b!1397370 m!1284113))

(assert (=> b!1397370 m!1284113))

(declare-fun m!1284115 () Bool)

(assert (=> b!1397370 m!1284115))

(declare-fun m!1284117 () Bool)

(assert (=> b!1397367 m!1284117))

(declare-fun m!1284119 () Bool)

(assert (=> b!1397372 m!1284119))

(assert (=> b!1397372 m!1284119))

(declare-fun m!1284121 () Bool)

(assert (=> b!1397372 m!1284121))

(declare-fun m!1284123 () Bool)

(assert (=> b!1397372 m!1284123))

(declare-fun m!1284125 () Bool)

(assert (=> b!1397372 m!1284125))

(assert (=> b!1397366 m!1284113))

(assert (=> b!1397366 m!1284113))

(declare-fun m!1284127 () Bool)

(assert (=> b!1397366 m!1284127))

(declare-fun m!1284129 () Bool)

(assert (=> b!1397371 m!1284129))

(assert (=> b!1397371 m!1284129))

(declare-fun m!1284131 () Bool)

(assert (=> b!1397371 m!1284131))

(assert (=> b!1397369 m!1284113))

(declare-fun m!1284133 () Bool)

(assert (=> b!1397369 m!1284133))

(assert (=> b!1397369 m!1284113))

(declare-fun m!1284135 () Bool)

(assert (=> b!1397369 m!1284135))

(assert (=> b!1397369 m!1284113))

(declare-fun m!1284137 () Bool)

(assert (=> b!1397369 m!1284137))

(declare-fun m!1284139 () Bool)

(assert (=> b!1397369 m!1284139))

(declare-fun m!1284141 () Bool)

(assert (=> b!1397368 m!1284141))

(declare-fun m!1284143 () Bool)

(assert (=> start!120030 m!1284143))

(declare-fun m!1284145 () Bool)

(assert (=> start!120030 m!1284145))

(push 1)

