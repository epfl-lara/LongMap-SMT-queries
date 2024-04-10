; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127684 () Bool)

(assert start!127684)

(declare-fun b!1500221 () Bool)

(declare-fun e!839529 () Bool)

(declare-fun e!839528 () Bool)

(assert (=> b!1500221 (= e!839529 e!839528)))

(declare-fun res!1021300 () Bool)

(assert (=> b!1500221 (=> (not res!1021300) (not e!839528))))

(declare-datatypes ((array!100065 0))(
  ( (array!100066 (arr!48292 (Array (_ BitVec 32) (_ BitVec 64))) (size!48842 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100065)

(declare-fun lt!652893 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(assert (=> b!1500221 (= res!1021300 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652893 #b00000000000000000000000000000000) (bvslt lt!652893 (size!48842 a!2850))))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500221 (= lt!652893 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1500222 () Bool)

(declare-fun res!1021303 () Bool)

(assert (=> b!1500222 (=> (not res!1021303) (not e!839529))))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500222 (= res!1021303 (validKeyInArray!0 (select (arr!48292 a!2850) j!87)))))

(declare-fun b!1500223 () Bool)

(declare-fun res!1021302 () Bool)

(assert (=> b!1500223 (=> (not res!1021302) (not e!839529))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100065 (_ BitVec 32)) Bool)

(assert (=> b!1500223 (= res!1021302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500224 () Bool)

(declare-fun res!1021305 () Bool)

(assert (=> b!1500224 (=> (not res!1021305) (not e!839529))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1500224 (= res!1021305 (and (= (size!48842 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48842 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48842 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500225 () Bool)

(assert (=> b!1500225 (= e!839528 false)))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12502 0))(
  ( (MissingZero!12502 (index!52400 (_ BitVec 32))) (Found!12502 (index!52401 (_ BitVec 32))) (Intermediate!12502 (undefined!13314 Bool) (index!52402 (_ BitVec 32)) (x!134072 (_ BitVec 32))) (Undefined!12502) (MissingVacant!12502 (index!52403 (_ BitVec 32))) )
))
(declare-fun lt!652894 () SeekEntryResult!12502)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100065 (_ BitVec 32)) SeekEntryResult!12502)

(assert (=> b!1500225 (= lt!652894 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652893 vacantBefore!10 (select (arr!48292 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1500226 () Bool)

(declare-fun res!1021298 () Bool)

(assert (=> b!1500226 (=> (not res!1021298) (not e!839529))))

(assert (=> b!1500226 (= res!1021298 (validKeyInArray!0 (select (arr!48292 a!2850) i!996)))))

(declare-fun b!1500227 () Bool)

(declare-fun res!1021297 () Bool)

(assert (=> b!1500227 (=> (not res!1021297) (not e!839529))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500227 (= res!1021297 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48842 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48842 a!2850)) (= (select (arr!48292 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48292 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48842 a!2850))))))

(declare-fun b!1500228 () Bool)

(declare-fun res!1021306 () Bool)

(assert (=> b!1500228 (=> (not res!1021306) (not e!839529))))

(assert (=> b!1500228 (= res!1021306 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48292 a!2850) j!87) a!2850 mask!2661) (Found!12502 j!87)))))

(declare-fun b!1500229 () Bool)

(declare-fun res!1021299 () Bool)

(assert (=> b!1500229 (=> (not res!1021299) (not e!839529))))

(declare-datatypes ((List!34784 0))(
  ( (Nil!34781) (Cons!34780 (h!36177 (_ BitVec 64)) (t!49478 List!34784)) )
))
(declare-fun arrayNoDuplicates!0 (array!100065 (_ BitVec 32) List!34784) Bool)

(assert (=> b!1500229 (= res!1021299 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34781))))

(declare-fun res!1021301 () Bool)

(assert (=> start!127684 (=> (not res!1021301) (not e!839529))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127684 (= res!1021301 (validMask!0 mask!2661))))

(assert (=> start!127684 e!839529))

(assert (=> start!127684 true))

(declare-fun array_inv!37320 (array!100065) Bool)

(assert (=> start!127684 (array_inv!37320 a!2850)))

(declare-fun b!1500230 () Bool)

(declare-fun res!1021304 () Bool)

(assert (=> b!1500230 (=> (not res!1021304) (not e!839529))))

(assert (=> b!1500230 (= res!1021304 (not (= (select (arr!48292 a!2850) index!625) (select (arr!48292 a!2850) j!87))))))

(assert (= (and start!127684 res!1021301) b!1500224))

(assert (= (and b!1500224 res!1021305) b!1500226))

(assert (= (and b!1500226 res!1021298) b!1500222))

(assert (= (and b!1500222 res!1021303) b!1500223))

(assert (= (and b!1500223 res!1021302) b!1500229))

(assert (= (and b!1500229 res!1021299) b!1500227))

(assert (= (and b!1500227 res!1021297) b!1500228))

(assert (= (and b!1500228 res!1021306) b!1500230))

(assert (= (and b!1500230 res!1021304) b!1500221))

(assert (= (and b!1500221 res!1021300) b!1500225))

(declare-fun m!1383415 () Bool)

(assert (=> b!1500229 m!1383415))

(declare-fun m!1383417 () Bool)

(assert (=> b!1500222 m!1383417))

(assert (=> b!1500222 m!1383417))

(declare-fun m!1383419 () Bool)

(assert (=> b!1500222 m!1383419))

(declare-fun m!1383421 () Bool)

(assert (=> b!1500230 m!1383421))

(assert (=> b!1500230 m!1383417))

(assert (=> b!1500225 m!1383417))

(assert (=> b!1500225 m!1383417))

(declare-fun m!1383423 () Bool)

(assert (=> b!1500225 m!1383423))

(declare-fun m!1383425 () Bool)

(assert (=> b!1500221 m!1383425))

(declare-fun m!1383427 () Bool)

(assert (=> b!1500227 m!1383427))

(declare-fun m!1383429 () Bool)

(assert (=> b!1500227 m!1383429))

(declare-fun m!1383431 () Bool)

(assert (=> b!1500227 m!1383431))

(assert (=> b!1500228 m!1383417))

(assert (=> b!1500228 m!1383417))

(declare-fun m!1383433 () Bool)

(assert (=> b!1500228 m!1383433))

(declare-fun m!1383435 () Bool)

(assert (=> b!1500226 m!1383435))

(assert (=> b!1500226 m!1383435))

(declare-fun m!1383437 () Bool)

(assert (=> b!1500226 m!1383437))

(declare-fun m!1383439 () Bool)

(assert (=> start!127684 m!1383439))

(declare-fun m!1383441 () Bool)

(assert (=> start!127684 m!1383441))

(declare-fun m!1383443 () Bool)

(assert (=> b!1500223 m!1383443))

(push 1)

(assert (not start!127684))

(assert (not b!1500225))

(assert (not b!1500221))

(assert (not b!1500222))

(assert (not b!1500229))

(assert (not b!1500223))

(assert (not b!1500226))

(assert (not b!1500228))

(check-sat)

(pop 1)

(push 1)

