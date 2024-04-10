; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127680 () Bool)

(assert start!127680)

(declare-fun b!1500161 () Bool)

(declare-fun res!1021237 () Bool)

(declare-fun e!839510 () Bool)

(assert (=> b!1500161 (=> (not res!1021237) (not e!839510))))

(declare-datatypes ((array!100061 0))(
  ( (array!100062 (arr!48290 (Array (_ BitVec 32) (_ BitVec 64))) (size!48840 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100061)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100061 (_ BitVec 32)) Bool)

(assert (=> b!1500161 (= res!1021237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500162 () Bool)

(declare-fun res!1021243 () Bool)

(assert (=> b!1500162 (=> (not res!1021243) (not e!839510))))

(declare-datatypes ((List!34782 0))(
  ( (Nil!34779) (Cons!34778 (h!36175 (_ BitVec 64)) (t!49476 List!34782)) )
))
(declare-fun arrayNoDuplicates!0 (array!100061 (_ BitVec 32) List!34782) Bool)

(assert (=> b!1500162 (= res!1021243 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34779))))

(declare-fun b!1500163 () Bool)

(declare-fun res!1021242 () Bool)

(assert (=> b!1500163 (=> (not res!1021242) (not e!839510))))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500163 (= res!1021242 (validKeyInArray!0 (select (arr!48290 a!2850) j!87)))))

(declare-fun b!1500164 () Bool)

(declare-fun res!1021244 () Bool)

(assert (=> b!1500164 (=> (not res!1021244) (not e!839510))))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1500164 (= res!1021244 (not (= (select (arr!48290 a!2850) index!625) (select (arr!48290 a!2850) j!87))))))

(declare-fun b!1500166 () Bool)

(declare-fun res!1021240 () Bool)

(assert (=> b!1500166 (=> (not res!1021240) (not e!839510))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1500166 (= res!1021240 (and (= (size!48840 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48840 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48840 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500167 () Bool)

(declare-fun res!1021239 () Bool)

(assert (=> b!1500167 (=> (not res!1021239) (not e!839510))))

(assert (=> b!1500167 (= res!1021239 (validKeyInArray!0 (select (arr!48290 a!2850) i!996)))))

(declare-fun b!1500168 () Bool)

(declare-fun res!1021246 () Bool)

(assert (=> b!1500168 (=> (not res!1021246) (not e!839510))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12500 0))(
  ( (MissingZero!12500 (index!52392 (_ BitVec 32))) (Found!12500 (index!52393 (_ BitVec 32))) (Intermediate!12500 (undefined!13312 Bool) (index!52394 (_ BitVec 32)) (x!134070 (_ BitVec 32))) (Undefined!12500) (MissingVacant!12500 (index!52395 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100061 (_ BitVec 32)) SeekEntryResult!12500)

(assert (=> b!1500168 (= res!1021246 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48290 a!2850) j!87) a!2850 mask!2661) (Found!12500 j!87)))))

(declare-fun res!1021241 () Bool)

(assert (=> start!127680 (=> (not res!1021241) (not e!839510))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127680 (= res!1021241 (validMask!0 mask!2661))))

(assert (=> start!127680 e!839510))

(assert (=> start!127680 true))

(declare-fun array_inv!37318 (array!100061) Bool)

(assert (=> start!127680 (array_inv!37318 a!2850)))

(declare-fun b!1500165 () Bool)

(declare-fun e!839512 () Bool)

(assert (=> b!1500165 (= e!839510 e!839512)))

(declare-fun res!1021238 () Bool)

(assert (=> b!1500165 (=> (not res!1021238) (not e!839512))))

(declare-fun lt!652882 () (_ BitVec 32))

(assert (=> b!1500165 (= res!1021238 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652882 #b00000000000000000000000000000000) (bvslt lt!652882 (size!48840 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500165 (= lt!652882 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1500169 () Bool)

(declare-fun res!1021245 () Bool)

(assert (=> b!1500169 (=> (not res!1021245) (not e!839510))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500169 (= res!1021245 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48840 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48840 a!2850)) (= (select (arr!48290 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48290 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48840 a!2850))))))

(declare-fun b!1500170 () Bool)

(assert (=> b!1500170 (= e!839512 false)))

(declare-fun lt!652881 () SeekEntryResult!12500)

(assert (=> b!1500170 (= lt!652881 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652882 vacantBefore!10 (select (arr!48290 a!2850) j!87) a!2850 mask!2661))))

(assert (= (and start!127680 res!1021241) b!1500166))

(assert (= (and b!1500166 res!1021240) b!1500167))

(assert (= (and b!1500167 res!1021239) b!1500163))

(assert (= (and b!1500163 res!1021242) b!1500161))

(assert (= (and b!1500161 res!1021237) b!1500162))

(assert (= (and b!1500162 res!1021243) b!1500169))

(assert (= (and b!1500169 res!1021245) b!1500168))

(assert (= (and b!1500168 res!1021246) b!1500164))

(assert (= (and b!1500164 res!1021244) b!1500165))

(assert (= (and b!1500165 res!1021238) b!1500170))

(declare-fun m!1383355 () Bool)

(assert (=> b!1500168 m!1383355))

(assert (=> b!1500168 m!1383355))

(declare-fun m!1383357 () Bool)

(assert (=> b!1500168 m!1383357))

(declare-fun m!1383359 () Bool)

(assert (=> b!1500167 m!1383359))

(assert (=> b!1500167 m!1383359))

(declare-fun m!1383361 () Bool)

(assert (=> b!1500167 m!1383361))

(assert (=> b!1500170 m!1383355))

(assert (=> b!1500170 m!1383355))

(declare-fun m!1383363 () Bool)

(assert (=> b!1500170 m!1383363))

(declare-fun m!1383365 () Bool)

(assert (=> b!1500164 m!1383365))

(assert (=> b!1500164 m!1383355))

(declare-fun m!1383367 () Bool)

(assert (=> start!127680 m!1383367))

(declare-fun m!1383369 () Bool)

(assert (=> start!127680 m!1383369))

(declare-fun m!1383371 () Bool)

(assert (=> b!1500169 m!1383371))

(declare-fun m!1383373 () Bool)

(assert (=> b!1500169 m!1383373))

(declare-fun m!1383375 () Bool)

(assert (=> b!1500169 m!1383375))

(declare-fun m!1383377 () Bool)

(assert (=> b!1500161 m!1383377))

(assert (=> b!1500163 m!1383355))

(assert (=> b!1500163 m!1383355))

(declare-fun m!1383379 () Bool)

(assert (=> b!1500163 m!1383379))

(declare-fun m!1383381 () Bool)

(assert (=> b!1500165 m!1383381))

(declare-fun m!1383383 () Bool)

(assert (=> b!1500162 m!1383383))

(push 1)

