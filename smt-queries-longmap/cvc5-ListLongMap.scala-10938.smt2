; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127962 () Bool)

(assert start!127962)

(declare-fun b!1503255 () Bool)

(declare-fun res!1024134 () Bool)

(declare-fun e!840570 () Bool)

(assert (=> b!1503255 (=> (not res!1024134) (not e!840570))))

(declare-datatypes ((array!100277 0))(
  ( (array!100278 (arr!48395 (Array (_ BitVec 32) (_ BitVec 64))) (size!48945 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100277)

(declare-datatypes ((List!34887 0))(
  ( (Nil!34884) (Cons!34883 (h!36280 (_ BitVec 64)) (t!49581 List!34887)) )
))
(declare-fun arrayNoDuplicates!0 (array!100277 (_ BitVec 32) List!34887) Bool)

(assert (=> b!1503255 (= res!1024134 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34884))))

(declare-fun b!1503256 () Bool)

(assert (=> b!1503256 (= e!840570 false)))

(declare-fun lt!653506 () (_ BitVec 32))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503256 (= lt!653506 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1503257 () Bool)

(declare-fun res!1024141 () Bool)

(assert (=> b!1503257 (=> (not res!1024141) (not e!840570))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503257 (= res!1024141 (validKeyInArray!0 (select (arr!48395 a!2850) i!996)))))

(declare-fun b!1503258 () Bool)

(declare-fun res!1024135 () Bool)

(assert (=> b!1503258 (=> (not res!1024135) (not e!840570))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1503258 (= res!1024135 (not (= (select (arr!48395 a!2850) index!625) (select (arr!48395 a!2850) j!87))))))

(declare-fun b!1503259 () Bool)

(declare-fun res!1024140 () Bool)

(assert (=> b!1503259 (=> (not res!1024140) (not e!840570))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100277 (_ BitVec 32)) Bool)

(assert (=> b!1503259 (= res!1024140 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun res!1024139 () Bool)

(assert (=> start!127962 (=> (not res!1024139) (not e!840570))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127962 (= res!1024139 (validMask!0 mask!2661))))

(assert (=> start!127962 e!840570))

(assert (=> start!127962 true))

(declare-fun array_inv!37423 (array!100277) Bool)

(assert (=> start!127962 (array_inv!37423 a!2850)))

(declare-fun b!1503260 () Bool)

(declare-fun res!1024136 () Bool)

(assert (=> b!1503260 (=> (not res!1024136) (not e!840570))))

(assert (=> b!1503260 (= res!1024136 (and (= (size!48945 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48945 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48945 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503261 () Bool)

(declare-fun res!1024133 () Bool)

(assert (=> b!1503261 (=> (not res!1024133) (not e!840570))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12593 0))(
  ( (MissingZero!12593 (index!52764 (_ BitVec 32))) (Found!12593 (index!52765 (_ BitVec 32))) (Intermediate!12593 (undefined!13405 Bool) (index!52766 (_ BitVec 32)) (x!134449 (_ BitVec 32))) (Undefined!12593) (MissingVacant!12593 (index!52767 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100277 (_ BitVec 32)) SeekEntryResult!12593)

(assert (=> b!1503261 (= res!1024133 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48395 a!2850) j!87) a!2850 mask!2661) (Found!12593 j!87)))))

(declare-fun b!1503262 () Bool)

(declare-fun res!1024137 () Bool)

(assert (=> b!1503262 (=> (not res!1024137) (not e!840570))))

(assert (=> b!1503262 (= res!1024137 (validKeyInArray!0 (select (arr!48395 a!2850) j!87)))))

(declare-fun b!1503263 () Bool)

(declare-fun res!1024138 () Bool)

(assert (=> b!1503263 (=> (not res!1024138) (not e!840570))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503263 (= res!1024138 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48945 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48945 a!2850)) (= (select (arr!48395 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48395 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48945 a!2850))))))

(assert (= (and start!127962 res!1024139) b!1503260))

(assert (= (and b!1503260 res!1024136) b!1503257))

(assert (= (and b!1503257 res!1024141) b!1503262))

(assert (= (and b!1503262 res!1024137) b!1503259))

(assert (= (and b!1503259 res!1024140) b!1503255))

(assert (= (and b!1503255 res!1024134) b!1503263))

(assert (= (and b!1503263 res!1024138) b!1503261))

(assert (= (and b!1503261 res!1024133) b!1503258))

(assert (= (and b!1503258 res!1024135) b!1503256))

(declare-fun m!1386499 () Bool)

(assert (=> b!1503259 m!1386499))

(declare-fun m!1386501 () Bool)

(assert (=> b!1503262 m!1386501))

(assert (=> b!1503262 m!1386501))

(declare-fun m!1386503 () Bool)

(assert (=> b!1503262 m!1386503))

(declare-fun m!1386505 () Bool)

(assert (=> start!127962 m!1386505))

(declare-fun m!1386507 () Bool)

(assert (=> start!127962 m!1386507))

(declare-fun m!1386509 () Bool)

(assert (=> b!1503256 m!1386509))

(declare-fun m!1386511 () Bool)

(assert (=> b!1503258 m!1386511))

(assert (=> b!1503258 m!1386501))

(declare-fun m!1386513 () Bool)

(assert (=> b!1503255 m!1386513))

(declare-fun m!1386515 () Bool)

(assert (=> b!1503257 m!1386515))

(assert (=> b!1503257 m!1386515))

(declare-fun m!1386517 () Bool)

(assert (=> b!1503257 m!1386517))

(declare-fun m!1386519 () Bool)

(assert (=> b!1503263 m!1386519))

(declare-fun m!1386521 () Bool)

(assert (=> b!1503263 m!1386521))

(declare-fun m!1386523 () Bool)

(assert (=> b!1503263 m!1386523))

(assert (=> b!1503261 m!1386501))

(assert (=> b!1503261 m!1386501))

(declare-fun m!1386525 () Bool)

(assert (=> b!1503261 m!1386525))

(push 1)

(assert (not b!1503262))

(assert (not start!127962))

(assert (not b!1503257))

(assert (not b!1503259))

(assert (not b!1503261))

(assert (not b!1503255))

(assert (not b!1503256))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

