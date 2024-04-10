; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127984 () Bool)

(assert start!127984)

(declare-fun b!1503552 () Bool)

(declare-fun res!1024435 () Bool)

(declare-fun e!840636 () Bool)

(assert (=> b!1503552 (=> (not res!1024435) (not e!840636))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100299 0))(
  ( (array!100300 (arr!48406 (Array (_ BitVec 32) (_ BitVec 64))) (size!48956 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100299)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12604 0))(
  ( (MissingZero!12604 (index!52808 (_ BitVec 32))) (Found!12604 (index!52809 (_ BitVec 32))) (Intermediate!12604 (undefined!13416 Bool) (index!52810 (_ BitVec 32)) (x!134484 (_ BitVec 32))) (Undefined!12604) (MissingVacant!12604 (index!52811 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100299 (_ BitVec 32)) SeekEntryResult!12604)

(assert (=> b!1503552 (= res!1024435 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48406 a!2850) j!87) a!2850 mask!2661) (Found!12604 j!87)))))

(declare-fun res!1024432 () Bool)

(assert (=> start!127984 (=> (not res!1024432) (not e!840636))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127984 (= res!1024432 (validMask!0 mask!2661))))

(assert (=> start!127984 e!840636))

(assert (=> start!127984 true))

(declare-fun array_inv!37434 (array!100299) Bool)

(assert (=> start!127984 (array_inv!37434 a!2850)))

(declare-fun b!1503553 () Bool)

(declare-fun res!1024438 () Bool)

(assert (=> b!1503553 (=> (not res!1024438) (not e!840636))))

(declare-datatypes ((List!34898 0))(
  ( (Nil!34895) (Cons!34894 (h!36291 (_ BitVec 64)) (t!49592 List!34898)) )
))
(declare-fun arrayNoDuplicates!0 (array!100299 (_ BitVec 32) List!34898) Bool)

(assert (=> b!1503553 (= res!1024438 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34895))))

(declare-fun b!1503554 () Bool)

(declare-fun res!1024436 () Bool)

(assert (=> b!1503554 (=> (not res!1024436) (not e!840636))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1503554 (= res!1024436 (and (= (size!48956 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48956 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48956 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503555 () Bool)

(declare-fun res!1024433 () Bool)

(assert (=> b!1503555 (=> (not res!1024433) (not e!840636))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503555 (= res!1024433 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48956 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48956 a!2850)) (= (select (arr!48406 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48406 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48956 a!2850))))))

(declare-fun b!1503556 () Bool)

(declare-fun res!1024434 () Bool)

(assert (=> b!1503556 (=> (not res!1024434) (not e!840636))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100299 (_ BitVec 32)) Bool)

(assert (=> b!1503556 (= res!1024434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503557 () Bool)

(declare-fun res!1024437 () Bool)

(assert (=> b!1503557 (=> (not res!1024437) (not e!840636))))

(assert (=> b!1503557 (= res!1024437 (not (= (select (arr!48406 a!2850) index!625) (select (arr!48406 a!2850) j!87))))))

(declare-fun b!1503558 () Bool)

(declare-fun res!1024430 () Bool)

(assert (=> b!1503558 (=> (not res!1024430) (not e!840636))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503558 (= res!1024430 (validKeyInArray!0 (select (arr!48406 a!2850) j!87)))))

(declare-fun b!1503559 () Bool)

(declare-fun res!1024431 () Bool)

(assert (=> b!1503559 (=> (not res!1024431) (not e!840636))))

(assert (=> b!1503559 (= res!1024431 (validKeyInArray!0 (select (arr!48406 a!2850) i!996)))))

(declare-fun b!1503560 () Bool)

(assert (=> b!1503560 (= e!840636 false)))

(declare-fun lt!653539 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503560 (= lt!653539 (nextIndex!0 index!625 x!647 mask!2661))))

(assert (= (and start!127984 res!1024432) b!1503554))

(assert (= (and b!1503554 res!1024436) b!1503559))

(assert (= (and b!1503559 res!1024431) b!1503558))

(assert (= (and b!1503558 res!1024430) b!1503556))

(assert (= (and b!1503556 res!1024434) b!1503553))

(assert (= (and b!1503553 res!1024438) b!1503555))

(assert (= (and b!1503555 res!1024433) b!1503552))

(assert (= (and b!1503552 res!1024435) b!1503557))

(assert (= (and b!1503557 res!1024437) b!1503560))

(declare-fun m!1386807 () Bool)

(assert (=> b!1503556 m!1386807))

(declare-fun m!1386809 () Bool)

(assert (=> b!1503553 m!1386809))

(declare-fun m!1386811 () Bool)

(assert (=> b!1503555 m!1386811))

(declare-fun m!1386813 () Bool)

(assert (=> b!1503555 m!1386813))

(declare-fun m!1386815 () Bool)

(assert (=> b!1503555 m!1386815))

(declare-fun m!1386817 () Bool)

(assert (=> b!1503552 m!1386817))

(assert (=> b!1503552 m!1386817))

(declare-fun m!1386819 () Bool)

(assert (=> b!1503552 m!1386819))

(assert (=> b!1503558 m!1386817))

(assert (=> b!1503558 m!1386817))

(declare-fun m!1386821 () Bool)

(assert (=> b!1503558 m!1386821))

(declare-fun m!1386823 () Bool)

(assert (=> start!127984 m!1386823))

(declare-fun m!1386825 () Bool)

(assert (=> start!127984 m!1386825))

(declare-fun m!1386827 () Bool)

(assert (=> b!1503560 m!1386827))

(declare-fun m!1386829 () Bool)

(assert (=> b!1503559 m!1386829))

(assert (=> b!1503559 m!1386829))

(declare-fun m!1386831 () Bool)

(assert (=> b!1503559 m!1386831))

(declare-fun m!1386833 () Bool)

(assert (=> b!1503557 m!1386833))

(assert (=> b!1503557 m!1386817))

(push 1)

(assert (not b!1503558))

(assert (not b!1503560))

(assert (not start!127984))

(assert (not b!1503559))

(assert (not b!1503552))

(assert (not b!1503556))

(assert (not b!1503553))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

