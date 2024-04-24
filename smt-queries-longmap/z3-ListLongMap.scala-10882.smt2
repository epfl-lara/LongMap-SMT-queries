; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127822 () Bool)

(assert start!127822)

(declare-fun b!1500207 () Bool)

(declare-fun res!1020188 () Bool)

(declare-fun e!840099 () Bool)

(assert (=> b!1500207 (=> (not res!1020188) (not e!840099))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100048 0))(
  ( (array!100049 (arr!48280 (Array (_ BitVec 32) (_ BitVec 64))) (size!48831 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100048)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1500207 (= res!1020188 (and (= (size!48831 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48831 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48831 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500208 () Bool)

(declare-fun res!1020187 () Bool)

(assert (=> b!1500208 (=> (not res!1020187) (not e!840099))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100048 (_ BitVec 32)) Bool)

(assert (=> b!1500208 (= res!1020187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500209 () Bool)

(declare-fun res!1020185 () Bool)

(assert (=> b!1500209 (=> (not res!1020185) (not e!840099))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500209 (= res!1020185 (validKeyInArray!0 (select (arr!48280 a!2850) i!996)))))

(declare-fun b!1500210 () Bool)

(declare-fun res!1020186 () Bool)

(assert (=> b!1500210 (=> (not res!1020186) (not e!840099))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12383 0))(
  ( (MissingZero!12383 (index!51924 (_ BitVec 32))) (Found!12383 (index!51925 (_ BitVec 32))) (Intermediate!12383 (undefined!13195 Bool) (index!51926 (_ BitVec 32)) (x!133819 (_ BitVec 32))) (Undefined!12383) (MissingVacant!12383 (index!51927 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100048 (_ BitVec 32)) SeekEntryResult!12383)

(assert (=> b!1500210 (= res!1020186 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48280 a!2850) j!87) a!2850 mask!2661) (Found!12383 j!87)))))

(declare-fun b!1500211 () Bool)

(declare-fun res!1020190 () Bool)

(assert (=> b!1500211 (=> (not res!1020190) (not e!840099))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500211 (= res!1020190 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48831 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48831 a!2850)) (= (select (arr!48280 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48280 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48831 a!2850))))))

(declare-fun b!1500212 () Bool)

(declare-fun res!1020184 () Bool)

(assert (=> b!1500212 (=> (not res!1020184) (not e!840099))))

(assert (=> b!1500212 (= res!1020184 (validKeyInArray!0 (select (arr!48280 a!2850) j!87)))))

(declare-fun b!1500213 () Bool)

(declare-fun res!1020191 () Bool)

(assert (=> b!1500213 (=> (not res!1020191) (not e!840099))))

(declare-datatypes ((List!34759 0))(
  ( (Nil!34756) (Cons!34755 (h!36167 (_ BitVec 64)) (t!49445 List!34759)) )
))
(declare-fun arrayNoDuplicates!0 (array!100048 (_ BitVec 32) List!34759) Bool)

(assert (=> b!1500213 (= res!1020191 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34756))))

(declare-fun b!1500214 () Bool)

(assert (=> b!1500214 (= e!840099 (and (= (select (arr!48280 a!2850) index!625) (select (arr!48280 a!2850) j!87)) (= j!87 index!625) (bvslt mask!2661 #b00000000000000000000000000000000)))))

(declare-fun res!1020189 () Bool)

(assert (=> start!127822 (=> (not res!1020189) (not e!840099))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127822 (= res!1020189 (validMask!0 mask!2661))))

(assert (=> start!127822 e!840099))

(assert (=> start!127822 true))

(declare-fun array_inv!37561 (array!100048) Bool)

(assert (=> start!127822 (array_inv!37561 a!2850)))

(assert (= (and start!127822 res!1020189) b!1500207))

(assert (= (and b!1500207 res!1020188) b!1500209))

(assert (= (and b!1500209 res!1020185) b!1500212))

(assert (= (and b!1500212 res!1020184) b!1500208))

(assert (= (and b!1500208 res!1020187) b!1500213))

(assert (= (and b!1500213 res!1020191) b!1500211))

(assert (= (and b!1500211 res!1020190) b!1500210))

(assert (= (and b!1500210 res!1020186) b!1500214))

(declare-fun m!1383341 () Bool)

(assert (=> b!1500212 m!1383341))

(assert (=> b!1500212 m!1383341))

(declare-fun m!1383343 () Bool)

(assert (=> b!1500212 m!1383343))

(assert (=> b!1500210 m!1383341))

(assert (=> b!1500210 m!1383341))

(declare-fun m!1383345 () Bool)

(assert (=> b!1500210 m!1383345))

(declare-fun m!1383347 () Bool)

(assert (=> b!1500214 m!1383347))

(assert (=> b!1500214 m!1383341))

(declare-fun m!1383349 () Bool)

(assert (=> b!1500211 m!1383349))

(declare-fun m!1383351 () Bool)

(assert (=> b!1500211 m!1383351))

(declare-fun m!1383353 () Bool)

(assert (=> b!1500211 m!1383353))

(declare-fun m!1383355 () Bool)

(assert (=> start!127822 m!1383355))

(declare-fun m!1383357 () Bool)

(assert (=> start!127822 m!1383357))

(declare-fun m!1383359 () Bool)

(assert (=> b!1500213 m!1383359))

(declare-fun m!1383361 () Bool)

(assert (=> b!1500209 m!1383361))

(assert (=> b!1500209 m!1383361))

(declare-fun m!1383363 () Bool)

(assert (=> b!1500209 m!1383363))

(declare-fun m!1383365 () Bool)

(assert (=> b!1500208 m!1383365))

(check-sat (not b!1500213) (not start!127822) (not b!1500210) (not b!1500209) (not b!1500212) (not b!1500208))
(check-sat)
