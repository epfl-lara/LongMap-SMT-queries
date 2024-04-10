; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127818 () Bool)

(assert start!127818)

(declare-fun b!1502072 () Bool)

(declare-fun res!1023151 () Bool)

(declare-fun e!840156 () Bool)

(assert (=> b!1502072 (=> (not res!1023151) (not e!840156))))

(declare-datatypes ((array!100199 0))(
  ( (array!100200 (arr!48359 (Array (_ BitVec 32) (_ BitVec 64))) (size!48909 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100199)

(declare-datatypes ((List!34851 0))(
  ( (Nil!34848) (Cons!34847 (h!36244 (_ BitVec 64)) (t!49545 List!34851)) )
))
(declare-fun arrayNoDuplicates!0 (array!100199 (_ BitVec 32) List!34851) Bool)

(assert (=> b!1502072 (= res!1023151 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34848))))

(declare-fun b!1502073 () Bool)

(declare-fun res!1023154 () Bool)

(assert (=> b!1502073 (=> (not res!1023154) (not e!840156))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1502073 (= res!1023154 (and (= (size!48909 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48909 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48909 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502074 () Bool)

(declare-fun res!1023152 () Bool)

(assert (=> b!1502074 (=> (not res!1023152) (not e!840156))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100199 (_ BitVec 32)) Bool)

(assert (=> b!1502074 (= res!1023152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun res!1023150 () Bool)

(assert (=> start!127818 (=> (not res!1023150) (not e!840156))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127818 (= res!1023150 (validMask!0 mask!2661))))

(assert (=> start!127818 e!840156))

(assert (=> start!127818 true))

(declare-fun array_inv!37387 (array!100199) Bool)

(assert (=> start!127818 (array_inv!37387 a!2850)))

(declare-fun b!1502075 () Bool)

(declare-fun res!1023148 () Bool)

(assert (=> b!1502075 (=> (not res!1023148) (not e!840156))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502075 (= res!1023148 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48909 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48909 a!2850)) (= (select (arr!48359 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48359 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48909 a!2850))))))

(declare-fun b!1502076 () Bool)

(declare-fun res!1023153 () Bool)

(assert (=> b!1502076 (=> (not res!1023153) (not e!840156))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502076 (= res!1023153 (validKeyInArray!0 (select (arr!48359 a!2850) i!996)))))

(declare-fun b!1502077 () Bool)

(declare-fun res!1023149 () Bool)

(assert (=> b!1502077 (=> (not res!1023149) (not e!840156))))

(assert (=> b!1502077 (= res!1023149 (validKeyInArray!0 (select (arr!48359 a!2850) j!87)))))

(declare-fun b!1502078 () Bool)

(assert (=> b!1502078 (= e!840156 false)))

(declare-datatypes ((SeekEntryResult!12557 0))(
  ( (MissingZero!12557 (index!52620 (_ BitVec 32))) (Found!12557 (index!52621 (_ BitVec 32))) (Intermediate!12557 (undefined!13369 Bool) (index!52622 (_ BitVec 32)) (x!134311 (_ BitVec 32))) (Undefined!12557) (MissingVacant!12557 (index!52623 (_ BitVec 32))) )
))
(declare-fun lt!653311 () SeekEntryResult!12557)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100199 (_ BitVec 32)) SeekEntryResult!12557)

(assert (=> b!1502078 (= lt!653311 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48359 a!2850) j!87) a!2850 mask!2661))))

(assert (= (and start!127818 res!1023150) b!1502073))

(assert (= (and b!1502073 res!1023154) b!1502076))

(assert (= (and b!1502076 res!1023153) b!1502077))

(assert (= (and b!1502077 res!1023149) b!1502074))

(assert (= (and b!1502074 res!1023152) b!1502072))

(assert (= (and b!1502072 res!1023151) b!1502075))

(assert (= (and b!1502075 res!1023148) b!1502078))

(declare-fun m!1385371 () Bool)

(assert (=> b!1502074 m!1385371))

(declare-fun m!1385373 () Bool)

(assert (=> b!1502072 m!1385373))

(declare-fun m!1385375 () Bool)

(assert (=> b!1502076 m!1385375))

(assert (=> b!1502076 m!1385375))

(declare-fun m!1385377 () Bool)

(assert (=> b!1502076 m!1385377))

(declare-fun m!1385379 () Bool)

(assert (=> start!127818 m!1385379))

(declare-fun m!1385381 () Bool)

(assert (=> start!127818 m!1385381))

(declare-fun m!1385383 () Bool)

(assert (=> b!1502078 m!1385383))

(assert (=> b!1502078 m!1385383))

(declare-fun m!1385385 () Bool)

(assert (=> b!1502078 m!1385385))

(assert (=> b!1502077 m!1385383))

(assert (=> b!1502077 m!1385383))

(declare-fun m!1385387 () Bool)

(assert (=> b!1502077 m!1385387))

(declare-fun m!1385389 () Bool)

(assert (=> b!1502075 m!1385389))

(declare-fun m!1385391 () Bool)

(assert (=> b!1502075 m!1385391))

(declare-fun m!1385393 () Bool)

(assert (=> b!1502075 m!1385393))

(push 1)

(assert (not b!1502074))

(assert (not b!1502072))

(assert (not b!1502077))

(assert (not start!127818))

(assert (not b!1502076))

(assert (not b!1502078))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

