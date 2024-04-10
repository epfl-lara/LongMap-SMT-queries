; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128934 () Bool)

(assert start!128934)

(declare-fun b!1511401 () Bool)

(declare-fun res!1031314 () Bool)

(declare-fun e!843808 () Bool)

(assert (=> b!1511401 (=> (not res!1031314) (not e!843808))))

(declare-datatypes ((array!100790 0))(
  ( (array!100791 (arr!48632 (Array (_ BitVec 32) (_ BitVec 64))) (size!49182 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100790)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511401 (= res!1031314 (validKeyInArray!0 (select (arr!48632 a!2804) j!70)))))

(declare-fun b!1511403 () Bool)

(declare-fun res!1031312 () Bool)

(assert (=> b!1511403 (=> (not res!1031312) (not e!843808))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1511403 (= res!1031312 (and (= (size!49182 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49182 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49182 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1511404 () Bool)

(declare-fun res!1031304 () Bool)

(assert (=> b!1511404 (=> (not res!1031304) (not e!843808))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1511404 (= res!1031304 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49182 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49182 a!2804))))))

(declare-fun b!1511405 () Bool)

(declare-fun e!843810 () Bool)

(assert (=> b!1511405 (= e!843808 e!843810)))

(declare-fun res!1031313 () Bool)

(assert (=> b!1511405 (=> (not res!1031313) (not e!843810))))

(declare-datatypes ((SeekEntryResult!12803 0))(
  ( (MissingZero!12803 (index!53607 (_ BitVec 32))) (Found!12803 (index!53608 (_ BitVec 32))) (Intermediate!12803 (undefined!13615 Bool) (index!53609 (_ BitVec 32)) (x!135345 (_ BitVec 32))) (Undefined!12803) (MissingVacant!12803 (index!53610 (_ BitVec 32))) )
))
(declare-fun lt!655432 () SeekEntryResult!12803)

(declare-fun lt!655430 () SeekEntryResult!12803)

(assert (=> b!1511405 (= res!1031313 (= lt!655432 lt!655430))))

(assert (=> b!1511405 (= lt!655430 (Intermediate!12803 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100790 (_ BitVec 32)) SeekEntryResult!12803)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511405 (= lt!655432 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48632 a!2804) j!70) mask!2512) (select (arr!48632 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1511406 () Bool)

(assert (=> b!1511406 (= e!843810 (not true))))

(declare-fun e!843811 () Bool)

(assert (=> b!1511406 e!843811))

(declare-fun res!1031306 () Bool)

(assert (=> b!1511406 (=> (not res!1031306) (not e!843811))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100790 (_ BitVec 32)) Bool)

(assert (=> b!1511406 (= res!1031306 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50474 0))(
  ( (Unit!50475) )
))
(declare-fun lt!655431 () Unit!50474)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100790 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50474)

(assert (=> b!1511406 (= lt!655431 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1511407 () Bool)

(declare-fun res!1031311 () Bool)

(assert (=> b!1511407 (=> (not res!1031311) (not e!843808))))

(assert (=> b!1511407 (= res!1031311 (validKeyInArray!0 (select (arr!48632 a!2804) i!961)))))

(declare-fun b!1511408 () Bool)

(declare-fun res!1031308 () Bool)

(assert (=> b!1511408 (=> (not res!1031308) (not e!843808))))

(assert (=> b!1511408 (= res!1031308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511409 () Bool)

(declare-fun res!1031307 () Bool)

(assert (=> b!1511409 (=> (not res!1031307) (not e!843810))))

(assert (=> b!1511409 (= res!1031307 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48632 a!2804) j!70) a!2804 mask!2512) lt!655430))))

(declare-fun b!1511402 () Bool)

(declare-fun res!1031305 () Bool)

(assert (=> b!1511402 (=> (not res!1031305) (not e!843810))))

(assert (=> b!1511402 (= res!1031305 (= lt!655432 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48632 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48632 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100791 (store (arr!48632 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49182 a!2804)) mask!2512)))))

(declare-fun res!1031310 () Bool)

(assert (=> start!128934 (=> (not res!1031310) (not e!843808))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128934 (= res!1031310 (validMask!0 mask!2512))))

(assert (=> start!128934 e!843808))

(assert (=> start!128934 true))

(declare-fun array_inv!37660 (array!100790) Bool)

(assert (=> start!128934 (array_inv!37660 a!2804)))

(declare-fun b!1511410 () Bool)

(declare-fun res!1031309 () Bool)

(assert (=> b!1511410 (=> (not res!1031309) (not e!843808))))

(declare-datatypes ((List!35115 0))(
  ( (Nil!35112) (Cons!35111 (h!36523 (_ BitVec 64)) (t!49809 List!35115)) )
))
(declare-fun arrayNoDuplicates!0 (array!100790 (_ BitVec 32) List!35115) Bool)

(assert (=> b!1511410 (= res!1031309 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35112))))

(declare-fun b!1511411 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100790 (_ BitVec 32)) SeekEntryResult!12803)

(assert (=> b!1511411 (= e!843811 (= (seekEntry!0 (select (arr!48632 a!2804) j!70) a!2804 mask!2512) (Found!12803 j!70)))))

(assert (= (and start!128934 res!1031310) b!1511403))

(assert (= (and b!1511403 res!1031312) b!1511407))

(assert (= (and b!1511407 res!1031311) b!1511401))

(assert (= (and b!1511401 res!1031314) b!1511408))

(assert (= (and b!1511408 res!1031308) b!1511410))

(assert (= (and b!1511410 res!1031309) b!1511404))

(assert (= (and b!1511404 res!1031304) b!1511405))

(assert (= (and b!1511405 res!1031313) b!1511409))

(assert (= (and b!1511409 res!1031307) b!1511402))

(assert (= (and b!1511402 res!1031305) b!1511406))

(assert (= (and b!1511406 res!1031306) b!1511411))

(declare-fun m!1394095 () Bool)

(assert (=> b!1511408 m!1394095))

(declare-fun m!1394097 () Bool)

(assert (=> start!128934 m!1394097))

(declare-fun m!1394099 () Bool)

(assert (=> start!128934 m!1394099))

(declare-fun m!1394101 () Bool)

(assert (=> b!1511407 m!1394101))

(assert (=> b!1511407 m!1394101))

(declare-fun m!1394103 () Bool)

(assert (=> b!1511407 m!1394103))

(declare-fun m!1394105 () Bool)

(assert (=> b!1511401 m!1394105))

(assert (=> b!1511401 m!1394105))

(declare-fun m!1394107 () Bool)

(assert (=> b!1511401 m!1394107))

(assert (=> b!1511409 m!1394105))

(assert (=> b!1511409 m!1394105))

(declare-fun m!1394109 () Bool)

(assert (=> b!1511409 m!1394109))

(assert (=> b!1511405 m!1394105))

(assert (=> b!1511405 m!1394105))

(declare-fun m!1394111 () Bool)

(assert (=> b!1511405 m!1394111))

(assert (=> b!1511405 m!1394111))

(assert (=> b!1511405 m!1394105))

(declare-fun m!1394113 () Bool)

(assert (=> b!1511405 m!1394113))

(declare-fun m!1394115 () Bool)

(assert (=> b!1511410 m!1394115))

(assert (=> b!1511411 m!1394105))

(assert (=> b!1511411 m!1394105))

(declare-fun m!1394117 () Bool)

(assert (=> b!1511411 m!1394117))

(declare-fun m!1394119 () Bool)

(assert (=> b!1511402 m!1394119))

(declare-fun m!1394121 () Bool)

(assert (=> b!1511402 m!1394121))

(assert (=> b!1511402 m!1394121))

(declare-fun m!1394123 () Bool)

(assert (=> b!1511402 m!1394123))

(assert (=> b!1511402 m!1394123))

(assert (=> b!1511402 m!1394121))

(declare-fun m!1394125 () Bool)

(assert (=> b!1511402 m!1394125))

(declare-fun m!1394127 () Bool)

(assert (=> b!1511406 m!1394127))

(declare-fun m!1394129 () Bool)

(assert (=> b!1511406 m!1394129))

(push 1)

