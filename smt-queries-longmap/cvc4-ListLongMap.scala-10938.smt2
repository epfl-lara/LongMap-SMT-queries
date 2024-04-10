; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127966 () Bool)

(assert start!127966)

(declare-fun b!1503309 () Bool)

(declare-fun res!1024192 () Bool)

(declare-fun e!840583 () Bool)

(assert (=> b!1503309 (=> (not res!1024192) (not e!840583))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100281 0))(
  ( (array!100282 (arr!48397 (Array (_ BitVec 32) (_ BitVec 64))) (size!48947 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100281)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1503309 (= res!1024192 (and (= (size!48947 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48947 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48947 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1024188 () Bool)

(assert (=> start!127966 (=> (not res!1024188) (not e!840583))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127966 (= res!1024188 (validMask!0 mask!2661))))

(assert (=> start!127966 e!840583))

(assert (=> start!127966 true))

(declare-fun array_inv!37425 (array!100281) Bool)

(assert (=> start!127966 (array_inv!37425 a!2850)))

(declare-fun b!1503310 () Bool)

(declare-fun res!1024190 () Bool)

(assert (=> b!1503310 (=> (not res!1024190) (not e!840583))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12595 0))(
  ( (MissingZero!12595 (index!52772 (_ BitVec 32))) (Found!12595 (index!52773 (_ BitVec 32))) (Intermediate!12595 (undefined!13407 Bool) (index!52774 (_ BitVec 32)) (x!134451 (_ BitVec 32))) (Undefined!12595) (MissingVacant!12595 (index!52775 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100281 (_ BitVec 32)) SeekEntryResult!12595)

(assert (=> b!1503310 (= res!1024190 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48397 a!2850) j!87) a!2850 mask!2661) (Found!12595 j!87)))))

(declare-fun b!1503311 () Bool)

(declare-fun res!1024194 () Bool)

(assert (=> b!1503311 (=> (not res!1024194) (not e!840583))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503311 (= res!1024194 (validKeyInArray!0 (select (arr!48397 a!2850) i!996)))))

(declare-fun b!1503312 () Bool)

(declare-fun res!1024193 () Bool)

(assert (=> b!1503312 (=> (not res!1024193) (not e!840583))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100281 (_ BitVec 32)) Bool)

(assert (=> b!1503312 (= res!1024193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503313 () Bool)

(assert (=> b!1503313 (= e!840583 false)))

(declare-fun lt!653512 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503313 (= lt!653512 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1503314 () Bool)

(declare-fun res!1024195 () Bool)

(assert (=> b!1503314 (=> (not res!1024195) (not e!840583))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503314 (= res!1024195 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48947 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48947 a!2850)) (= (select (arr!48397 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48397 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48947 a!2850))))))

(declare-fun b!1503315 () Bool)

(declare-fun res!1024187 () Bool)

(assert (=> b!1503315 (=> (not res!1024187) (not e!840583))))

(assert (=> b!1503315 (= res!1024187 (validKeyInArray!0 (select (arr!48397 a!2850) j!87)))))

(declare-fun b!1503316 () Bool)

(declare-fun res!1024191 () Bool)

(assert (=> b!1503316 (=> (not res!1024191) (not e!840583))))

(declare-datatypes ((List!34889 0))(
  ( (Nil!34886) (Cons!34885 (h!36282 (_ BitVec 64)) (t!49583 List!34889)) )
))
(declare-fun arrayNoDuplicates!0 (array!100281 (_ BitVec 32) List!34889) Bool)

(assert (=> b!1503316 (= res!1024191 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34886))))

(declare-fun b!1503317 () Bool)

(declare-fun res!1024189 () Bool)

(assert (=> b!1503317 (=> (not res!1024189) (not e!840583))))

(assert (=> b!1503317 (= res!1024189 (not (= (select (arr!48397 a!2850) index!625) (select (arr!48397 a!2850) j!87))))))

(assert (= (and start!127966 res!1024188) b!1503309))

(assert (= (and b!1503309 res!1024192) b!1503311))

(assert (= (and b!1503311 res!1024194) b!1503315))

(assert (= (and b!1503315 res!1024187) b!1503312))

(assert (= (and b!1503312 res!1024193) b!1503316))

(assert (= (and b!1503316 res!1024191) b!1503314))

(assert (= (and b!1503314 res!1024195) b!1503310))

(assert (= (and b!1503310 res!1024190) b!1503317))

(assert (= (and b!1503317 res!1024189) b!1503313))

(declare-fun m!1386555 () Bool)

(assert (=> b!1503313 m!1386555))

(declare-fun m!1386557 () Bool)

(assert (=> b!1503316 m!1386557))

(declare-fun m!1386559 () Bool)

(assert (=> b!1503312 m!1386559))

(declare-fun m!1386561 () Bool)

(assert (=> b!1503314 m!1386561))

(declare-fun m!1386563 () Bool)

(assert (=> b!1503314 m!1386563))

(declare-fun m!1386565 () Bool)

(assert (=> b!1503314 m!1386565))

(declare-fun m!1386567 () Bool)

(assert (=> b!1503311 m!1386567))

(assert (=> b!1503311 m!1386567))

(declare-fun m!1386569 () Bool)

(assert (=> b!1503311 m!1386569))

(declare-fun m!1386571 () Bool)

(assert (=> b!1503315 m!1386571))

(assert (=> b!1503315 m!1386571))

(declare-fun m!1386573 () Bool)

(assert (=> b!1503315 m!1386573))

(assert (=> b!1503310 m!1386571))

(assert (=> b!1503310 m!1386571))

(declare-fun m!1386575 () Bool)

(assert (=> b!1503310 m!1386575))

(declare-fun m!1386577 () Bool)

(assert (=> start!127966 m!1386577))

(declare-fun m!1386579 () Bool)

(assert (=> start!127966 m!1386579))

(declare-fun m!1386581 () Bool)

(assert (=> b!1503317 m!1386581))

(assert (=> b!1503317 m!1386571))

(push 1)

(assert (not b!1503313))

(assert (not b!1503315))

(assert (not b!1503310))

(assert (not b!1503312))

(assert (not start!127966))

(assert (not b!1503316))

(assert (not b!1503311))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

