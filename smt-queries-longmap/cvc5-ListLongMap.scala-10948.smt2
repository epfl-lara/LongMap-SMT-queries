; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128064 () Bool)

(assert start!128064)

(declare-fun b!1504200 () Bool)

(declare-fun e!840841 () Bool)

(assert (=> b!1504200 (= e!840841 false)))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!653650 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1504200 (= lt!653650 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1504201 () Bool)

(declare-fun res!1024995 () Bool)

(assert (=> b!1504201 (=> (not res!1024995) (not e!840841))))

(declare-datatypes ((array!100340 0))(
  ( (array!100341 (arr!48425 (Array (_ BitVec 32) (_ BitVec 64))) (size!48975 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100340)

(declare-datatypes ((List!34917 0))(
  ( (Nil!34914) (Cons!34913 (h!36310 (_ BitVec 64)) (t!49611 List!34917)) )
))
(declare-fun arrayNoDuplicates!0 (array!100340 (_ BitVec 32) List!34917) Bool)

(assert (=> b!1504201 (= res!1024995 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34914))))

(declare-fun b!1504202 () Bool)

(declare-fun res!1024993 () Bool)

(assert (=> b!1504202 (=> (not res!1024993) (not e!840841))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1504202 (= res!1024993 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48975 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48975 a!2850)) (= (select (arr!48425 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48425 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48975 a!2850))))))

(declare-fun b!1504203 () Bool)

(declare-fun res!1024989 () Bool)

(assert (=> b!1504203 (=> (not res!1024989) (not e!840841))))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12623 0))(
  ( (MissingZero!12623 (index!52884 (_ BitVec 32))) (Found!12623 (index!52885 (_ BitVec 32))) (Intermediate!12623 (undefined!13435 Bool) (index!52886 (_ BitVec 32)) (x!134565 (_ BitVec 32))) (Undefined!12623) (MissingVacant!12623 (index!52887 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100340 (_ BitVec 32)) SeekEntryResult!12623)

(assert (=> b!1504203 (= res!1024989 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48425 a!2850) j!87) a!2850 mask!2661) (Found!12623 j!87)))))

(declare-fun b!1504204 () Bool)

(declare-fun res!1024988 () Bool)

(assert (=> b!1504204 (=> (not res!1024988) (not e!840841))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100340 (_ BitVec 32)) Bool)

(assert (=> b!1504204 (= res!1024988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1504205 () Bool)

(declare-fun res!1024994 () Bool)

(assert (=> b!1504205 (=> (not res!1024994) (not e!840841))))

(assert (=> b!1504205 (= res!1024994 (not (= (select (arr!48425 a!2850) index!625) (select (arr!48425 a!2850) j!87))))))

(declare-fun res!1024990 () Bool)

(assert (=> start!128064 (=> (not res!1024990) (not e!840841))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128064 (= res!1024990 (validMask!0 mask!2661))))

(assert (=> start!128064 e!840841))

(assert (=> start!128064 true))

(declare-fun array_inv!37453 (array!100340) Bool)

(assert (=> start!128064 (array_inv!37453 a!2850)))

(declare-fun b!1504206 () Bool)

(declare-fun res!1024992 () Bool)

(assert (=> b!1504206 (=> (not res!1024992) (not e!840841))))

(assert (=> b!1504206 (= res!1024992 (and (= (size!48975 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48975 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48975 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1504207 () Bool)

(declare-fun res!1024991 () Bool)

(assert (=> b!1504207 (=> (not res!1024991) (not e!840841))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1504207 (= res!1024991 (validKeyInArray!0 (select (arr!48425 a!2850) i!996)))))

(declare-fun b!1504208 () Bool)

(declare-fun res!1024996 () Bool)

(assert (=> b!1504208 (=> (not res!1024996) (not e!840841))))

(assert (=> b!1504208 (= res!1024996 (validKeyInArray!0 (select (arr!48425 a!2850) j!87)))))

(assert (= (and start!128064 res!1024990) b!1504206))

(assert (= (and b!1504206 res!1024992) b!1504207))

(assert (= (and b!1504207 res!1024991) b!1504208))

(assert (= (and b!1504208 res!1024996) b!1504204))

(assert (= (and b!1504204 res!1024988) b!1504201))

(assert (= (and b!1504201 res!1024995) b!1504202))

(assert (= (and b!1504202 res!1024993) b!1504203))

(assert (= (and b!1504203 res!1024989) b!1504205))

(assert (= (and b!1504205 res!1024994) b!1504200))

(declare-fun m!1387411 () Bool)

(assert (=> b!1504204 m!1387411))

(declare-fun m!1387413 () Bool)

(assert (=> b!1504207 m!1387413))

(assert (=> b!1504207 m!1387413))

(declare-fun m!1387415 () Bool)

(assert (=> b!1504207 m!1387415))

(declare-fun m!1387417 () Bool)

(assert (=> b!1504205 m!1387417))

(declare-fun m!1387419 () Bool)

(assert (=> b!1504205 m!1387419))

(declare-fun m!1387421 () Bool)

(assert (=> start!128064 m!1387421))

(declare-fun m!1387423 () Bool)

(assert (=> start!128064 m!1387423))

(declare-fun m!1387425 () Bool)

(assert (=> b!1504202 m!1387425))

(declare-fun m!1387427 () Bool)

(assert (=> b!1504202 m!1387427))

(declare-fun m!1387429 () Bool)

(assert (=> b!1504202 m!1387429))

(assert (=> b!1504208 m!1387419))

(assert (=> b!1504208 m!1387419))

(declare-fun m!1387431 () Bool)

(assert (=> b!1504208 m!1387431))

(declare-fun m!1387433 () Bool)

(assert (=> b!1504200 m!1387433))

(declare-fun m!1387435 () Bool)

(assert (=> b!1504201 m!1387435))

(assert (=> b!1504203 m!1387419))

(assert (=> b!1504203 m!1387419))

(declare-fun m!1387437 () Bool)

(assert (=> b!1504203 m!1387437))

(push 1)

(assert (not b!1504204))

(assert (not start!128064))

(assert (not b!1504200))

(assert (not b!1504201))

(assert (not b!1504203))

(assert (not b!1504207))

(assert (not b!1504208))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

