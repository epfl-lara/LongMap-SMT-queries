; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120028 () Bool)

(assert start!120028)

(declare-fun b!1397338 () Bool)

(declare-fun res!936255 () Bool)

(declare-fun e!791075 () Bool)

(assert (=> b!1397338 (=> (not res!936255) (not e!791075))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95557 0))(
  ( (array!95558 (arr!46132 (Array (_ BitVec 32) (_ BitVec 64))) (size!46682 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95557)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1397338 (= res!936255 (and (= (size!46682 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46682 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46682 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397339 () Bool)

(declare-fun res!936253 () Bool)

(assert (=> b!1397339 (=> (not res!936253) (not e!791075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95557 (_ BitVec 32)) Bool)

(assert (=> b!1397339 (= res!936253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397340 () Bool)

(declare-fun e!791074 () Bool)

(assert (=> b!1397340 (= e!791074 true)))

(declare-fun lt!614130 () (_ BitVec 64))

(declare-fun lt!614126 () (_ BitVec 32))

(declare-fun lt!614124 () array!95557)

(declare-datatypes ((SeekEntryResult!10449 0))(
  ( (MissingZero!10449 (index!44167 (_ BitVec 32))) (Found!10449 (index!44168 (_ BitVec 32))) (Intermediate!10449 (undefined!11261 Bool) (index!44169 (_ BitVec 32)) (x!125823 (_ BitVec 32))) (Undefined!10449) (MissingVacant!10449 (index!44170 (_ BitVec 32))) )
))
(declare-fun lt!614127 () SeekEntryResult!10449)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95557 (_ BitVec 32)) SeekEntryResult!10449)

(assert (=> b!1397340 (= lt!614127 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614126 lt!614130 lt!614124 mask!2840))))

(declare-fun e!791076 () Bool)

(declare-fun b!1397341 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95557 (_ BitVec 32)) SeekEntryResult!10449)

(assert (=> b!1397341 (= e!791076 (= (seekEntryOrOpen!0 (select (arr!46132 a!2901) j!112) a!2901 mask!2840) (Found!10449 j!112)))))

(declare-fun b!1397343 () Bool)

(declare-fun e!791078 () Bool)

(assert (=> b!1397343 (= e!791075 (not e!791078))))

(declare-fun res!936256 () Bool)

(assert (=> b!1397343 (=> res!936256 e!791078)))

(declare-fun lt!614129 () SeekEntryResult!10449)

(assert (=> b!1397343 (= res!936256 (or (not (is-Intermediate!10449 lt!614129)) (undefined!11261 lt!614129)))))

(assert (=> b!1397343 e!791076))

(declare-fun res!936251 () Bool)

(assert (=> b!1397343 (=> (not res!936251) (not e!791076))))

(assert (=> b!1397343 (= res!936251 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46902 0))(
  ( (Unit!46903) )
))
(declare-fun lt!614128 () Unit!46902)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95557 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46902)

(assert (=> b!1397343 (= lt!614128 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1397343 (= lt!614129 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614126 (select (arr!46132 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397343 (= lt!614126 (toIndex!0 (select (arr!46132 a!2901) j!112) mask!2840))))

(declare-fun b!1397344 () Bool)

(declare-fun res!936252 () Bool)

(assert (=> b!1397344 (=> (not res!936252) (not e!791075))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397344 (= res!936252 (validKeyInArray!0 (select (arr!46132 a!2901) i!1037)))))

(declare-fun b!1397345 () Bool)

(assert (=> b!1397345 (= e!791078 e!791074)))

(declare-fun res!936259 () Bool)

(assert (=> b!1397345 (=> res!936259 e!791074)))

(declare-fun lt!614125 () SeekEntryResult!10449)

(assert (=> b!1397345 (= res!936259 (or (= lt!614129 lt!614125) (not (is-Intermediate!10449 lt!614125)) (bvslt (x!125823 lt!614129) #b00000000000000000000000000000000) (bvsgt (x!125823 lt!614129) #b01111111111111111111111111111110) (bvslt lt!614126 #b00000000000000000000000000000000) (bvsge lt!614126 (size!46682 a!2901)) (bvslt (index!44169 lt!614129) #b00000000000000000000000000000000) (bvsge (index!44169 lt!614129) (size!46682 a!2901)) (not (= lt!614129 (Intermediate!10449 false (index!44169 lt!614129) (x!125823 lt!614129)))) (not (= lt!614125 (Intermediate!10449 (undefined!11261 lt!614125) (index!44169 lt!614125) (x!125823 lt!614125))))))))

(assert (=> b!1397345 (= lt!614125 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614130 mask!2840) lt!614130 lt!614124 mask!2840))))

(assert (=> b!1397345 (= lt!614130 (select (store (arr!46132 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397345 (= lt!614124 (array!95558 (store (arr!46132 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46682 a!2901)))))

(declare-fun b!1397346 () Bool)

(declare-fun res!936258 () Bool)

(assert (=> b!1397346 (=> (not res!936258) (not e!791075))))

(declare-datatypes ((List!32651 0))(
  ( (Nil!32648) (Cons!32647 (h!33889 (_ BitVec 64)) (t!47345 List!32651)) )
))
(declare-fun arrayNoDuplicates!0 (array!95557 (_ BitVec 32) List!32651) Bool)

(assert (=> b!1397346 (= res!936258 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32648))))

(declare-fun res!936254 () Bool)

(assert (=> start!120028 (=> (not res!936254) (not e!791075))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120028 (= res!936254 (validMask!0 mask!2840))))

(assert (=> start!120028 e!791075))

(assert (=> start!120028 true))

(declare-fun array_inv!35160 (array!95557) Bool)

(assert (=> start!120028 (array_inv!35160 a!2901)))

(declare-fun b!1397342 () Bool)

(declare-fun res!936257 () Bool)

(assert (=> b!1397342 (=> (not res!936257) (not e!791075))))

(assert (=> b!1397342 (= res!936257 (validKeyInArray!0 (select (arr!46132 a!2901) j!112)))))

(assert (= (and start!120028 res!936254) b!1397338))

(assert (= (and b!1397338 res!936255) b!1397344))

(assert (= (and b!1397344 res!936252) b!1397342))

(assert (= (and b!1397342 res!936257) b!1397339))

(assert (= (and b!1397339 res!936253) b!1397346))

(assert (= (and b!1397346 res!936258) b!1397343))

(assert (= (and b!1397343 res!936251) b!1397341))

(assert (= (and b!1397343 (not res!936256)) b!1397345))

(assert (= (and b!1397345 (not res!936259)) b!1397340))

(declare-fun m!1284075 () Bool)

(assert (=> start!120028 m!1284075))

(declare-fun m!1284077 () Bool)

(assert (=> start!120028 m!1284077))

(declare-fun m!1284079 () Bool)

(assert (=> b!1397342 m!1284079))

(assert (=> b!1397342 m!1284079))

(declare-fun m!1284081 () Bool)

(assert (=> b!1397342 m!1284081))

(assert (=> b!1397341 m!1284079))

(assert (=> b!1397341 m!1284079))

(declare-fun m!1284083 () Bool)

(assert (=> b!1397341 m!1284083))

(declare-fun m!1284085 () Bool)

(assert (=> b!1397345 m!1284085))

(assert (=> b!1397345 m!1284085))

(declare-fun m!1284087 () Bool)

(assert (=> b!1397345 m!1284087))

(declare-fun m!1284089 () Bool)

(assert (=> b!1397345 m!1284089))

(declare-fun m!1284091 () Bool)

(assert (=> b!1397345 m!1284091))

(declare-fun m!1284093 () Bool)

(assert (=> b!1397344 m!1284093))

(assert (=> b!1397344 m!1284093))

(declare-fun m!1284095 () Bool)

(assert (=> b!1397344 m!1284095))

(declare-fun m!1284097 () Bool)

(assert (=> b!1397346 m!1284097))

(assert (=> b!1397343 m!1284079))

(declare-fun m!1284099 () Bool)

(assert (=> b!1397343 m!1284099))

(assert (=> b!1397343 m!1284079))

(declare-fun m!1284101 () Bool)

(assert (=> b!1397343 m!1284101))

(declare-fun m!1284103 () Bool)

(assert (=> b!1397343 m!1284103))

(assert (=> b!1397343 m!1284079))

(declare-fun m!1284105 () Bool)

(assert (=> b!1397343 m!1284105))

(declare-fun m!1284107 () Bool)

(assert (=> b!1397339 m!1284107))

(declare-fun m!1284109 () Bool)

(assert (=> b!1397340 m!1284109))

(push 1)

