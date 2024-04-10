; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127956 () Bool)

(assert start!127956)

(declare-fun res!1024056 () Bool)

(declare-fun e!840553 () Bool)

(assert (=> start!127956 (=> (not res!1024056) (not e!840553))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127956 (= res!1024056 (validMask!0 mask!2661))))

(assert (=> start!127956 e!840553))

(assert (=> start!127956 true))

(declare-datatypes ((array!100271 0))(
  ( (array!100272 (arr!48392 (Array (_ BitVec 32) (_ BitVec 64))) (size!48942 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100271)

(declare-fun array_inv!37420 (array!100271) Bool)

(assert (=> start!127956 (array_inv!37420 a!2850)))

(declare-fun b!1503174 () Bool)

(declare-fun res!1024060 () Bool)

(assert (=> b!1503174 (=> (not res!1024060) (not e!840553))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1503174 (= res!1024060 (and (= (size!48942 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48942 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48942 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503175 () Bool)

(declare-fun res!1024059 () Bool)

(assert (=> b!1503175 (=> (not res!1024059) (not e!840553))))

(declare-datatypes ((List!34884 0))(
  ( (Nil!34881) (Cons!34880 (h!36277 (_ BitVec 64)) (t!49578 List!34884)) )
))
(declare-fun arrayNoDuplicates!0 (array!100271 (_ BitVec 32) List!34884) Bool)

(assert (=> b!1503175 (= res!1024059 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34881))))

(declare-fun b!1503176 () Bool)

(declare-fun res!1024058 () Bool)

(assert (=> b!1503176 (=> (not res!1024058) (not e!840553))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100271 (_ BitVec 32)) Bool)

(assert (=> b!1503176 (= res!1024058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503177 () Bool)

(assert (=> b!1503177 (= e!840553 false)))

(declare-fun lt!653497 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503177 (= lt!653497 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1503178 () Bool)

(declare-fun res!1024052 () Bool)

(assert (=> b!1503178 (=> (not res!1024052) (not e!840553))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503178 (= res!1024052 (validKeyInArray!0 (select (arr!48392 a!2850) i!996)))))

(declare-fun b!1503179 () Bool)

(declare-fun res!1024054 () Bool)

(assert (=> b!1503179 (=> (not res!1024054) (not e!840553))))

(assert (=> b!1503179 (= res!1024054 (not (= (select (arr!48392 a!2850) index!625) (select (arr!48392 a!2850) j!87))))))

(declare-fun b!1503180 () Bool)

(declare-fun res!1024055 () Bool)

(assert (=> b!1503180 (=> (not res!1024055) (not e!840553))))

(assert (=> b!1503180 (= res!1024055 (validKeyInArray!0 (select (arr!48392 a!2850) j!87)))))

(declare-fun b!1503181 () Bool)

(declare-fun res!1024057 () Bool)

(assert (=> b!1503181 (=> (not res!1024057) (not e!840553))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12590 0))(
  ( (MissingZero!12590 (index!52752 (_ BitVec 32))) (Found!12590 (index!52753 (_ BitVec 32))) (Intermediate!12590 (undefined!13402 Bool) (index!52754 (_ BitVec 32)) (x!134438 (_ BitVec 32))) (Undefined!12590) (MissingVacant!12590 (index!52755 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100271 (_ BitVec 32)) SeekEntryResult!12590)

(assert (=> b!1503181 (= res!1024057 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48392 a!2850) j!87) a!2850 mask!2661) (Found!12590 j!87)))))

(declare-fun b!1503182 () Bool)

(declare-fun res!1024053 () Bool)

(assert (=> b!1503182 (=> (not res!1024053) (not e!840553))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503182 (= res!1024053 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48942 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48942 a!2850)) (= (select (arr!48392 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48392 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48942 a!2850))))))

(assert (= (and start!127956 res!1024056) b!1503174))

(assert (= (and b!1503174 res!1024060) b!1503178))

(assert (= (and b!1503178 res!1024052) b!1503180))

(assert (= (and b!1503180 res!1024055) b!1503176))

(assert (= (and b!1503176 res!1024058) b!1503175))

(assert (= (and b!1503175 res!1024059) b!1503182))

(assert (= (and b!1503182 res!1024053) b!1503181))

(assert (= (and b!1503181 res!1024057) b!1503179))

(assert (= (and b!1503179 res!1024054) b!1503177))

(declare-fun m!1386415 () Bool)

(assert (=> b!1503181 m!1386415))

(assert (=> b!1503181 m!1386415))

(declare-fun m!1386417 () Bool)

(assert (=> b!1503181 m!1386417))

(declare-fun m!1386419 () Bool)

(assert (=> b!1503175 m!1386419))

(assert (=> b!1503180 m!1386415))

(assert (=> b!1503180 m!1386415))

(declare-fun m!1386421 () Bool)

(assert (=> b!1503180 m!1386421))

(declare-fun m!1386423 () Bool)

(assert (=> b!1503177 m!1386423))

(declare-fun m!1386425 () Bool)

(assert (=> start!127956 m!1386425))

(declare-fun m!1386427 () Bool)

(assert (=> start!127956 m!1386427))

(declare-fun m!1386429 () Bool)

(assert (=> b!1503178 m!1386429))

(assert (=> b!1503178 m!1386429))

(declare-fun m!1386431 () Bool)

(assert (=> b!1503178 m!1386431))

(declare-fun m!1386433 () Bool)

(assert (=> b!1503176 m!1386433))

(declare-fun m!1386435 () Bool)

(assert (=> b!1503179 m!1386435))

(assert (=> b!1503179 m!1386415))

(declare-fun m!1386437 () Bool)

(assert (=> b!1503182 m!1386437))

(declare-fun m!1386439 () Bool)

(assert (=> b!1503182 m!1386439))

(declare-fun m!1386441 () Bool)

(assert (=> b!1503182 m!1386441))

(push 1)

(assert (not b!1503177))

(assert (not b!1503175))

(assert (not b!1503180))

(assert (not start!127956))

(assert (not b!1503178))

(assert (not b!1503181))

(assert (not b!1503176))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

