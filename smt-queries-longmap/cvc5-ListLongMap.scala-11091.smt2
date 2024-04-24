; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129942 () Bool)

(assert start!129942)

(declare-fun b!1523287 () Bool)

(declare-fun e!849806 () Bool)

(assert (=> b!1523287 (= e!849806 false)))

(declare-datatypes ((SeekEntryResult!12967 0))(
  ( (MissingZero!12967 (index!54263 (_ BitVec 32))) (Found!12967 (index!54264 (_ BitVec 32))) (Intermediate!12967 (undefined!13779 Bool) (index!54265 (_ BitVec 32)) (x!136168 (_ BitVec 32))) (Undefined!12967) (MissingVacant!12967 (index!54266 (_ BitVec 32))) )
))
(declare-fun lt!660145 () SeekEntryResult!12967)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101366 0))(
  ( (array!101367 (arr!48909 (Array (_ BitVec 32) (_ BitVec 64))) (size!49460 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101366)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101366 (_ BitVec 32)) SeekEntryResult!12967)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523287 (= lt!660145 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48909 a!2804) j!70) mask!2512) (select (arr!48909 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523288 () Bool)

(declare-fun res!1041089 () Bool)

(assert (=> b!1523288 (=> (not res!1041089) (not e!849806))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523288 (= res!1041089 (validKeyInArray!0 (select (arr!48909 a!2804) j!70)))))

(declare-fun b!1523289 () Bool)

(declare-fun res!1041086 () Bool)

(assert (=> b!1523289 (=> (not res!1041086) (not e!849806))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1523289 (= res!1041086 (validKeyInArray!0 (select (arr!48909 a!2804) i!961)))))

(declare-fun res!1041088 () Bool)

(assert (=> start!129942 (=> (not res!1041088) (not e!849806))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129942 (= res!1041088 (validMask!0 mask!2512))))

(assert (=> start!129942 e!849806))

(assert (=> start!129942 true))

(declare-fun array_inv!38190 (array!101366) Bool)

(assert (=> start!129942 (array_inv!38190 a!2804)))

(declare-fun b!1523290 () Bool)

(declare-fun res!1041087 () Bool)

(assert (=> b!1523290 (=> (not res!1041087) (not e!849806))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101366 (_ BitVec 32)) Bool)

(assert (=> b!1523290 (= res!1041087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1523291 () Bool)

(declare-fun res!1041084 () Bool)

(assert (=> b!1523291 (=> (not res!1041084) (not e!849806))))

(assert (=> b!1523291 (= res!1041084 (and (= (size!49460 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49460 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49460 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1523292 () Bool)

(declare-fun res!1041085 () Bool)

(assert (=> b!1523292 (=> (not res!1041085) (not e!849806))))

(declare-datatypes ((List!35379 0))(
  ( (Nil!35376) (Cons!35375 (h!36814 (_ BitVec 64)) (t!50065 List!35379)) )
))
(declare-fun arrayNoDuplicates!0 (array!101366 (_ BitVec 32) List!35379) Bool)

(assert (=> b!1523292 (= res!1041085 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35376))))

(declare-fun b!1523293 () Bool)

(declare-fun res!1041083 () Bool)

(assert (=> b!1523293 (=> (not res!1041083) (not e!849806))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1523293 (= res!1041083 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49460 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49460 a!2804))))))

(assert (= (and start!129942 res!1041088) b!1523291))

(assert (= (and b!1523291 res!1041084) b!1523289))

(assert (= (and b!1523289 res!1041086) b!1523288))

(assert (= (and b!1523288 res!1041089) b!1523290))

(assert (= (and b!1523290 res!1041087) b!1523292))

(assert (= (and b!1523292 res!1041085) b!1523293))

(assert (= (and b!1523293 res!1041083) b!1523287))

(declare-fun m!1406269 () Bool)

(assert (=> b!1523292 m!1406269))

(declare-fun m!1406271 () Bool)

(assert (=> b!1523290 m!1406271))

(declare-fun m!1406273 () Bool)

(assert (=> b!1523289 m!1406273))

(assert (=> b!1523289 m!1406273))

(declare-fun m!1406275 () Bool)

(assert (=> b!1523289 m!1406275))

(declare-fun m!1406277 () Bool)

(assert (=> start!129942 m!1406277))

(declare-fun m!1406279 () Bool)

(assert (=> start!129942 m!1406279))

(declare-fun m!1406281 () Bool)

(assert (=> b!1523288 m!1406281))

(assert (=> b!1523288 m!1406281))

(declare-fun m!1406283 () Bool)

(assert (=> b!1523288 m!1406283))

(assert (=> b!1523287 m!1406281))

(assert (=> b!1523287 m!1406281))

(declare-fun m!1406285 () Bool)

(assert (=> b!1523287 m!1406285))

(assert (=> b!1523287 m!1406285))

(assert (=> b!1523287 m!1406281))

(declare-fun m!1406287 () Bool)

(assert (=> b!1523287 m!1406287))

(push 1)

(assert (not b!1523289))

(assert (not b!1523287))

(assert (not b!1523288))

(assert (not b!1523290))

(assert (not start!129942))

(assert (not b!1523292))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

