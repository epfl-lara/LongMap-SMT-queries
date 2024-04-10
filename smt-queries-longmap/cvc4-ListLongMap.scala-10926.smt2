; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127822 () Bool)

(assert start!127822)

(declare-fun b!1502114 () Bool)

(declare-fun res!1023193 () Bool)

(declare-fun e!840168 () Bool)

(assert (=> b!1502114 (=> (not res!1023193) (not e!840168))))

(declare-datatypes ((array!100203 0))(
  ( (array!100204 (arr!48361 (Array (_ BitVec 32) (_ BitVec 64))) (size!48911 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100203)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1502114 (= res!1023193 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48911 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48911 a!2850)) (= (select (arr!48361 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48361 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48911 a!2850))))))

(declare-fun res!1023195 () Bool)

(assert (=> start!127822 (=> (not res!1023195) (not e!840168))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127822 (= res!1023195 (validMask!0 mask!2661))))

(assert (=> start!127822 e!840168))

(assert (=> start!127822 true))

(declare-fun array_inv!37389 (array!100203) Bool)

(assert (=> start!127822 (array_inv!37389 a!2850)))

(declare-fun b!1502115 () Bool)

(declare-fun res!1023194 () Bool)

(assert (=> b!1502115 (=> (not res!1023194) (not e!840168))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100203 (_ BitVec 32)) Bool)

(assert (=> b!1502115 (= res!1023194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502116 () Bool)

(declare-fun res!1023196 () Bool)

(assert (=> b!1502116 (=> (not res!1023196) (not e!840168))))

(declare-datatypes ((List!34853 0))(
  ( (Nil!34850) (Cons!34849 (h!36246 (_ BitVec 64)) (t!49547 List!34853)) )
))
(declare-fun arrayNoDuplicates!0 (array!100203 (_ BitVec 32) List!34853) Bool)

(assert (=> b!1502116 (= res!1023196 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34850))))

(declare-fun b!1502117 () Bool)

(declare-fun res!1023191 () Bool)

(assert (=> b!1502117 (=> (not res!1023191) (not e!840168))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1502117 (= res!1023191 (and (= (size!48911 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48911 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48911 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502118 () Bool)

(declare-fun res!1023190 () Bool)

(assert (=> b!1502118 (=> (not res!1023190) (not e!840168))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502118 (= res!1023190 (validKeyInArray!0 (select (arr!48361 a!2850) i!996)))))

(declare-fun b!1502119 () Bool)

(declare-fun res!1023192 () Bool)

(assert (=> b!1502119 (=> (not res!1023192) (not e!840168))))

(assert (=> b!1502119 (= res!1023192 (validKeyInArray!0 (select (arr!48361 a!2850) j!87)))))

(declare-fun b!1502120 () Bool)

(assert (=> b!1502120 (= e!840168 false)))

(declare-datatypes ((SeekEntryResult!12559 0))(
  ( (MissingZero!12559 (index!52628 (_ BitVec 32))) (Found!12559 (index!52629 (_ BitVec 32))) (Intermediate!12559 (undefined!13371 Bool) (index!52630 (_ BitVec 32)) (x!134313 (_ BitVec 32))) (Undefined!12559) (MissingVacant!12559 (index!52631 (_ BitVec 32))) )
))
(declare-fun lt!653317 () SeekEntryResult!12559)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100203 (_ BitVec 32)) SeekEntryResult!12559)

(assert (=> b!1502120 (= lt!653317 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48361 a!2850) j!87) a!2850 mask!2661))))

(assert (= (and start!127822 res!1023195) b!1502117))

(assert (= (and b!1502117 res!1023191) b!1502118))

(assert (= (and b!1502118 res!1023190) b!1502119))

(assert (= (and b!1502119 res!1023192) b!1502115))

(assert (= (and b!1502115 res!1023194) b!1502116))

(assert (= (and b!1502116 res!1023196) b!1502114))

(assert (= (and b!1502114 res!1023193) b!1502120))

(declare-fun m!1385419 () Bool)

(assert (=> b!1502119 m!1385419))

(assert (=> b!1502119 m!1385419))

(declare-fun m!1385421 () Bool)

(assert (=> b!1502119 m!1385421))

(declare-fun m!1385423 () Bool)

(assert (=> b!1502116 m!1385423))

(assert (=> b!1502120 m!1385419))

(assert (=> b!1502120 m!1385419))

(declare-fun m!1385425 () Bool)

(assert (=> b!1502120 m!1385425))

(declare-fun m!1385427 () Bool)

(assert (=> start!127822 m!1385427))

(declare-fun m!1385429 () Bool)

(assert (=> start!127822 m!1385429))

(declare-fun m!1385431 () Bool)

(assert (=> b!1502118 m!1385431))

(assert (=> b!1502118 m!1385431))

(declare-fun m!1385433 () Bool)

(assert (=> b!1502118 m!1385433))

(declare-fun m!1385435 () Bool)

(assert (=> b!1502114 m!1385435))

(declare-fun m!1385437 () Bool)

(assert (=> b!1502114 m!1385437))

(declare-fun m!1385439 () Bool)

(assert (=> b!1502114 m!1385439))

(declare-fun m!1385441 () Bool)

(assert (=> b!1502115 m!1385441))

(push 1)

(assert (not b!1502119))

(assert (not b!1502118))

(assert (not b!1502120))

(assert (not b!1502116))

(assert (not b!1502115))

(assert (not start!127822))

(check-sat)

(pop 1)

(push 1)

(check-sat)

