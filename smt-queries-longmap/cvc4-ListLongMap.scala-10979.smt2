; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128530 () Bool)

(assert start!128530)

(declare-fun b!1507092 () Bool)

(declare-fun res!1027522 () Bool)

(declare-fun e!842049 () Bool)

(assert (=> b!1507092 (=> (not res!1027522) (not e!842049))))

(declare-datatypes ((array!100503 0))(
  ( (array!100504 (arr!48494 (Array (_ BitVec 32) (_ BitVec 64))) (size!49046 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100503)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507092 (= res!1027522 (validKeyInArray!0 (select (arr!48494 a!2804) j!70)))))

(declare-fun b!1507093 () Bool)

(declare-fun res!1027517 () Bool)

(assert (=> b!1507093 (=> (not res!1027517) (not e!842049))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1507093 (= res!1027517 (and (= (size!49046 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49046 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49046 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1507094 () Bool)

(declare-fun res!1027519 () Bool)

(assert (=> b!1507094 (=> (not res!1027519) (not e!842049))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12688 0))(
  ( (MissingZero!12688 (index!53147 (_ BitVec 32))) (Found!12688 (index!53148 (_ BitVec 32))) (Intermediate!12688 (undefined!13500 Bool) (index!53149 (_ BitVec 32)) (x!134902 (_ BitVec 32))) (Undefined!12688) (MissingVacant!12688 (index!53150 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100503 (_ BitVec 32)) SeekEntryResult!12688)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507094 (= res!1027519 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48494 a!2804) j!70) mask!2512) (select (arr!48494 a!2804) j!70) a!2804 mask!2512) (Intermediate!12688 false resIndex!21 resX!21)))))

(declare-fun b!1507095 () Bool)

(declare-fun res!1027516 () Bool)

(assert (=> b!1507095 (=> (not res!1027516) (not e!842049))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1507095 (= res!1027516 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49046 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49046 a!2804))))))

(declare-fun b!1507097 () Bool)

(declare-fun res!1027523 () Bool)

(assert (=> b!1507097 (=> (not res!1027523) (not e!842049))))

(assert (=> b!1507097 (= res!1027523 (validKeyInArray!0 (select (arr!48494 a!2804) i!961)))))

(declare-fun b!1507098 () Bool)

(declare-fun res!1027521 () Bool)

(assert (=> b!1507098 (=> (not res!1027521) (not e!842049))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100503 (_ BitVec 32)) Bool)

(assert (=> b!1507098 (= res!1027521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1507099 () Bool)

(assert (=> b!1507099 (= e!842049 false)))

(declare-fun lt!654093 () SeekEntryResult!12688)

(assert (=> b!1507099 (= lt!654093 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48494 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1027518 () Bool)

(assert (=> start!128530 (=> (not res!1027518) (not e!842049))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128530 (= res!1027518 (validMask!0 mask!2512))))

(assert (=> start!128530 e!842049))

(assert (=> start!128530 true))

(declare-fun array_inv!37727 (array!100503) Bool)

(assert (=> start!128530 (array_inv!37727 a!2804)))

(declare-fun b!1507096 () Bool)

(declare-fun res!1027520 () Bool)

(assert (=> b!1507096 (=> (not res!1027520) (not e!842049))))

(declare-datatypes ((List!35055 0))(
  ( (Nil!35052) (Cons!35051 (h!36455 (_ BitVec 64)) (t!49741 List!35055)) )
))
(declare-fun arrayNoDuplicates!0 (array!100503 (_ BitVec 32) List!35055) Bool)

(assert (=> b!1507096 (= res!1027520 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35052))))

(assert (= (and start!128530 res!1027518) b!1507093))

(assert (= (and b!1507093 res!1027517) b!1507097))

(assert (= (and b!1507097 res!1027523) b!1507092))

(assert (= (and b!1507092 res!1027522) b!1507098))

(assert (= (and b!1507098 res!1027521) b!1507096))

(assert (= (and b!1507096 res!1027520) b!1507095))

(assert (= (and b!1507095 res!1027516) b!1507094))

(assert (= (and b!1507094 res!1027519) b!1507099))

(declare-fun m!1389273 () Bool)

(assert (=> b!1507097 m!1389273))

(assert (=> b!1507097 m!1389273))

(declare-fun m!1389275 () Bool)

(assert (=> b!1507097 m!1389275))

(declare-fun m!1389277 () Bool)

(assert (=> b!1507098 m!1389277))

(declare-fun m!1389279 () Bool)

(assert (=> start!128530 m!1389279))

(declare-fun m!1389281 () Bool)

(assert (=> start!128530 m!1389281))

(declare-fun m!1389283 () Bool)

(assert (=> b!1507096 m!1389283))

(declare-fun m!1389285 () Bool)

(assert (=> b!1507099 m!1389285))

(assert (=> b!1507099 m!1389285))

(declare-fun m!1389287 () Bool)

(assert (=> b!1507099 m!1389287))

(assert (=> b!1507092 m!1389285))

(assert (=> b!1507092 m!1389285))

(declare-fun m!1389289 () Bool)

(assert (=> b!1507092 m!1389289))

(assert (=> b!1507094 m!1389285))

(assert (=> b!1507094 m!1389285))

(declare-fun m!1389291 () Bool)

(assert (=> b!1507094 m!1389291))

(assert (=> b!1507094 m!1389291))

(assert (=> b!1507094 m!1389285))

(declare-fun m!1389293 () Bool)

(assert (=> b!1507094 m!1389293))

(push 1)

(assert (not b!1507094))

(assert (not b!1507098))

(assert (not b!1507097))

(assert (not b!1507092))

(assert (not b!1507099))

(assert (not start!128530))

(assert (not b!1507096))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

