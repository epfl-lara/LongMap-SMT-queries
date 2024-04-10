; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128256 () Bool)

(assert start!128256)

(declare-fun b!1505515 () Bool)

(declare-fun e!841452 () Bool)

(declare-datatypes ((array!100409 0))(
  ( (array!100410 (arr!48455 (Array (_ BitVec 32) (_ BitVec 64))) (size!49005 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100409)

(assert (=> b!1505515 (= e!841452 (and (bvsle #b00000000000000000000000000000000 (size!49005 a!2804)) (bvsge (size!49005 a!2804) #b01111111111111111111111111111111)))))

(declare-fun b!1505516 () Bool)

(declare-fun res!1025962 () Bool)

(assert (=> b!1505516 (=> (not res!1025962) (not e!841452))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505516 (= res!1025962 (validKeyInArray!0 (select (arr!48455 a!2804) i!961)))))

(declare-fun b!1505517 () Bool)

(declare-fun res!1025964 () Bool)

(assert (=> b!1505517 (=> (not res!1025964) (not e!841452))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1505517 (= res!1025964 (and (= (size!49005 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49005 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49005 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1505518 () Bool)

(declare-fun res!1025961 () Bool)

(assert (=> b!1505518 (=> (not res!1025961) (not e!841452))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100409 (_ BitVec 32)) Bool)

(assert (=> b!1505518 (= res!1025961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1025963 () Bool)

(assert (=> start!128256 (=> (not res!1025963) (not e!841452))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128256 (= res!1025963 (validMask!0 mask!2512))))

(assert (=> start!128256 e!841452))

(assert (=> start!128256 true))

(declare-fun array_inv!37483 (array!100409) Bool)

(assert (=> start!128256 (array_inv!37483 a!2804)))

(declare-fun b!1505519 () Bool)

(declare-fun res!1025965 () Bool)

(assert (=> b!1505519 (=> (not res!1025965) (not e!841452))))

(assert (=> b!1505519 (= res!1025965 (validKeyInArray!0 (select (arr!48455 a!2804) j!70)))))

(assert (= (and start!128256 res!1025963) b!1505517))

(assert (= (and b!1505517 res!1025964) b!1505516))

(assert (= (and b!1505516 res!1025962) b!1505519))

(assert (= (and b!1505519 res!1025965) b!1505518))

(assert (= (and b!1505518 res!1025961) b!1505515))

(declare-fun m!1388611 () Bool)

(assert (=> b!1505516 m!1388611))

(assert (=> b!1505516 m!1388611))

(declare-fun m!1388613 () Bool)

(assert (=> b!1505516 m!1388613))

(declare-fun m!1388615 () Bool)

(assert (=> b!1505518 m!1388615))

(declare-fun m!1388617 () Bool)

(assert (=> start!128256 m!1388617))

(declare-fun m!1388619 () Bool)

(assert (=> start!128256 m!1388619))

(declare-fun m!1388621 () Bool)

(assert (=> b!1505519 m!1388621))

(assert (=> b!1505519 m!1388621))

(declare-fun m!1388623 () Bool)

(assert (=> b!1505519 m!1388623))

(push 1)

(assert (not b!1505519))

(assert (not b!1505518))

(assert (not b!1505516))

(assert (not start!128256))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!158033 () Bool)

(assert (=> d!158033 (= (validKeyInArray!0 (select (arr!48455 a!2804) j!70)) (and (not (= (select (arr!48455 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48455 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1505519 d!158033))

(declare-fun b!1505576 () Bool)

(declare-fun e!841489 () Bool)

(declare-fun call!68181 () Bool)

(assert (=> b!1505576 (= e!841489 call!68181)))

(declare-fun b!1505577 () Bool)

(declare-fun e!841486 () Bool)

(assert (=> b!1505577 (= e!841486 call!68181)))

(declare-fun b!1505578 () Bool)

(declare-fun e!841488 () Bool)

(assert (=> b!1505578 (= e!841488 e!841489)))

(declare-fun c!139318 () Bool)

(assert (=> b!1505578 (= c!139318 (validKeyInArray!0 (select (arr!48455 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!158037 () Bool)

(declare-fun res!1026011 () Bool)

(assert (=> d!158037 (=> res!1026011 e!841488)))

(assert (=> d!158037 (= res!1026011 (bvsge #b00000000000000000000000000000000 (size!49005 a!2804)))))

(assert (=> d!158037 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!841488)))

