; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129782 () Bool)

(assert start!129782)

(declare-fun b!1523380 () Bool)

(declare-fun res!1042293 () Bool)

(declare-fun e!849319 () Bool)

(assert (=> b!1523380 (=> (not res!1042293) (not e!849319))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101378 0))(
  ( (array!101379 (arr!48920 (Array (_ BitVec 32) (_ BitVec 64))) (size!49470 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101378)

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1523380 (= res!1042293 (and (= (size!49470 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49470 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49470 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1523381 () Bool)

(declare-fun res!1042287 () Bool)

(assert (=> b!1523381 (=> (not res!1042287) (not e!849319))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523381 (= res!1042287 (validKeyInArray!0 (select (arr!48920 a!2804) j!70)))))

(declare-fun b!1523382 () Bool)

(declare-fun res!1042290 () Bool)

(assert (=> b!1523382 (=> (not res!1042290) (not e!849319))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101378 (_ BitVec 32)) Bool)

(assert (=> b!1523382 (= res!1042290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1523383 () Bool)

(declare-fun res!1042292 () Bool)

(assert (=> b!1523383 (=> (not res!1042292) (not e!849319))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1523383 (= res!1042292 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49470 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49470 a!2804))))))

(declare-fun e!849316 () Bool)

(declare-fun b!1523384 () Bool)

(declare-datatypes ((SeekEntryResult!13085 0))(
  ( (MissingZero!13085 (index!54735 (_ BitVec 32))) (Found!13085 (index!54736 (_ BitVec 32))) (Intermediate!13085 (undefined!13897 Bool) (index!54737 (_ BitVec 32)) (x!136427 (_ BitVec 32))) (Undefined!13085) (MissingVacant!13085 (index!54738 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101378 (_ BitVec 32)) SeekEntryResult!13085)

(assert (=> b!1523384 (= e!849316 (= (seekEntry!0 (select (arr!48920 a!2804) j!70) a!2804 mask!2512) (Found!13085 j!70)))))

(declare-fun b!1523386 () Bool)

(declare-fun res!1042294 () Bool)

(declare-fun e!849317 () Bool)

(assert (=> b!1523386 (=> (not res!1042294) (not e!849317))))

(declare-fun lt!659938 () SeekEntryResult!13085)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101378 (_ BitVec 32)) SeekEntryResult!13085)

(assert (=> b!1523386 (= res!1042294 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48920 a!2804) j!70) a!2804 mask!2512) lt!659938))))

(declare-fun res!1042295 () Bool)

(assert (=> start!129782 (=> (not res!1042295) (not e!849319))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129782 (= res!1042295 (validMask!0 mask!2512))))

(assert (=> start!129782 e!849319))

(assert (=> start!129782 true))

(declare-fun array_inv!37948 (array!101378) Bool)

(assert (=> start!129782 (array_inv!37948 a!2804)))

(declare-fun b!1523385 () Bool)

(assert (=> b!1523385 (= e!849319 e!849317)))

(declare-fun res!1042288 () Bool)

(assert (=> b!1523385 (=> (not res!1042288) (not e!849317))))

(declare-fun lt!659937 () SeekEntryResult!13085)

(assert (=> b!1523385 (= res!1042288 (= lt!659937 lt!659938))))

(assert (=> b!1523385 (= lt!659938 (Intermediate!13085 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523385 (= lt!659937 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48920 a!2804) j!70) mask!2512) (select (arr!48920 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523387 () Bool)

(declare-fun res!1042296 () Bool)

(assert (=> b!1523387 (=> (not res!1042296) (not e!849319))))

(declare-datatypes ((List!35403 0))(
  ( (Nil!35400) (Cons!35399 (h!36823 (_ BitVec 64)) (t!50097 List!35403)) )
))
(declare-fun arrayNoDuplicates!0 (array!101378 (_ BitVec 32) List!35403) Bool)

(assert (=> b!1523387 (= res!1042296 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35400))))

(declare-fun b!1523388 () Bool)

(assert (=> b!1523388 (= e!849317 (not true))))

(assert (=> b!1523388 e!849316))

(declare-fun res!1042289 () Bool)

(assert (=> b!1523388 (=> (not res!1042289) (not e!849316))))

(assert (=> b!1523388 (= res!1042289 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50954 0))(
  ( (Unit!50955) )
))
(declare-fun lt!659936 () Unit!50954)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101378 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50954)

(assert (=> b!1523388 (= lt!659936 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1523389 () Bool)

(declare-fun res!1042291 () Bool)

(assert (=> b!1523389 (=> (not res!1042291) (not e!849319))))

(assert (=> b!1523389 (= res!1042291 (validKeyInArray!0 (select (arr!48920 a!2804) i!961)))))

(declare-fun b!1523390 () Bool)

(declare-fun res!1042297 () Bool)

(assert (=> b!1523390 (=> (not res!1042297) (not e!849317))))

(assert (=> b!1523390 (= res!1042297 (= lt!659937 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48920 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48920 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101379 (store (arr!48920 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49470 a!2804)) mask!2512)))))

(assert (= (and start!129782 res!1042295) b!1523380))

(assert (= (and b!1523380 res!1042293) b!1523389))

(assert (= (and b!1523389 res!1042291) b!1523381))

(assert (= (and b!1523381 res!1042287) b!1523382))

(assert (= (and b!1523382 res!1042290) b!1523387))

(assert (= (and b!1523387 res!1042296) b!1523383))

(assert (= (and b!1523383 res!1042292) b!1523385))

(assert (= (and b!1523385 res!1042288) b!1523386))

(assert (= (and b!1523386 res!1042294) b!1523390))

(assert (= (and b!1523390 res!1042297) b!1523388))

(assert (= (and b!1523388 res!1042289) b!1523384))

(declare-fun m!1406493 () Bool)

(assert (=> b!1523387 m!1406493))

(declare-fun m!1406495 () Bool)

(assert (=> start!129782 m!1406495))

(declare-fun m!1406497 () Bool)

(assert (=> start!129782 m!1406497))

(declare-fun m!1406499 () Bool)

(assert (=> b!1523384 m!1406499))

(assert (=> b!1523384 m!1406499))

(declare-fun m!1406501 () Bool)

(assert (=> b!1523384 m!1406501))

(declare-fun m!1406503 () Bool)

(assert (=> b!1523389 m!1406503))

(assert (=> b!1523389 m!1406503))

(declare-fun m!1406505 () Bool)

(assert (=> b!1523389 m!1406505))

(assert (=> b!1523381 m!1406499))

(assert (=> b!1523381 m!1406499))

(declare-fun m!1406507 () Bool)

(assert (=> b!1523381 m!1406507))

(assert (=> b!1523386 m!1406499))

(assert (=> b!1523386 m!1406499))

(declare-fun m!1406509 () Bool)

(assert (=> b!1523386 m!1406509))

(declare-fun m!1406511 () Bool)

(assert (=> b!1523388 m!1406511))

(declare-fun m!1406513 () Bool)

(assert (=> b!1523388 m!1406513))

(declare-fun m!1406515 () Bool)

(assert (=> b!1523390 m!1406515))

(declare-fun m!1406517 () Bool)

(assert (=> b!1523390 m!1406517))

(assert (=> b!1523390 m!1406517))

(declare-fun m!1406519 () Bool)

(assert (=> b!1523390 m!1406519))

(assert (=> b!1523390 m!1406519))

(assert (=> b!1523390 m!1406517))

(declare-fun m!1406521 () Bool)

(assert (=> b!1523390 m!1406521))

(assert (=> b!1523385 m!1406499))

(assert (=> b!1523385 m!1406499))

(declare-fun m!1406523 () Bool)

(assert (=> b!1523385 m!1406523))

(assert (=> b!1523385 m!1406523))

(assert (=> b!1523385 m!1406499))

(declare-fun m!1406525 () Bool)

(assert (=> b!1523385 m!1406525))

(declare-fun m!1406527 () Bool)

(assert (=> b!1523382 m!1406527))

(push 1)

