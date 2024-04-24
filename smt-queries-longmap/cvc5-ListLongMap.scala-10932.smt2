; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128232 () Bool)

(assert start!128232)

(declare-fun b!1504655 () Bool)

(declare-fun res!1024363 () Bool)

(declare-fun e!841610 () Bool)

(assert (=> b!1504655 (=> (not res!1024363) (not e!841610))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100361 0))(
  ( (array!100362 (arr!48432 (Array (_ BitVec 32) (_ BitVec 64))) (size!48983 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100361)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1504655 (= res!1024363 (and (= (size!48983 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48983 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48983 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1504656 () Bool)

(declare-fun res!1024360 () Bool)

(assert (=> b!1504656 (=> (not res!1024360) (not e!841610))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12523 0))(
  ( (MissingZero!12523 (index!52484 (_ BitVec 32))) (Found!12523 (index!52485 (_ BitVec 32))) (Intermediate!12523 (undefined!13335 Bool) (index!52486 (_ BitVec 32)) (x!134368 (_ BitVec 32))) (Undefined!12523) (MissingVacant!12523 (index!52487 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100361 (_ BitVec 32)) SeekEntryResult!12523)

(assert (=> b!1504656 (= res!1024360 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48432 a!2850) j!87) a!2850 mask!2661) (Found!12523 j!87)))))

(declare-fun b!1504657 () Bool)

(declare-fun res!1024358 () Bool)

(assert (=> b!1504657 (=> (not res!1024358) (not e!841610))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100361 (_ BitVec 32)) Bool)

(assert (=> b!1504657 (= res!1024358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1504658 () Bool)

(declare-fun res!1024359 () Bool)

(assert (=> b!1504658 (=> (not res!1024359) (not e!841610))))

(declare-datatypes ((List!34911 0))(
  ( (Nil!34908) (Cons!34907 (h!36319 (_ BitVec 64)) (t!49597 List!34911)) )
))
(declare-fun arrayNoDuplicates!0 (array!100361 (_ BitVec 32) List!34911) Bool)

(assert (=> b!1504658 (= res!1024359 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34908))))

(declare-fun b!1504659 () Bool)

(assert (=> b!1504659 (= e!841610 false)))

(declare-fun lt!654121 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1504659 (= lt!654121 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1504660 () Bool)

(declare-fun res!1024357 () Bool)

(assert (=> b!1504660 (=> (not res!1024357) (not e!841610))))

(assert (=> b!1504660 (= res!1024357 (not (= (select (arr!48432 a!2850) index!625) (select (arr!48432 a!2850) j!87))))))

(declare-fun b!1504661 () Bool)

(declare-fun res!1024362 () Bool)

(assert (=> b!1504661 (=> (not res!1024362) (not e!841610))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1504661 (= res!1024362 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48983 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48983 a!2850)) (= (select (arr!48432 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48432 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48983 a!2850))))))

(declare-fun res!1024364 () Bool)

(assert (=> start!128232 (=> (not res!1024364) (not e!841610))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128232 (= res!1024364 (validMask!0 mask!2661))))

(assert (=> start!128232 e!841610))

(assert (=> start!128232 true))

(declare-fun array_inv!37713 (array!100361) Bool)

(assert (=> start!128232 (array_inv!37713 a!2850)))

(declare-fun b!1504662 () Bool)

(declare-fun res!1024361 () Bool)

(assert (=> b!1504662 (=> (not res!1024361) (not e!841610))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1504662 (= res!1024361 (validKeyInArray!0 (select (arr!48432 a!2850) j!87)))))

(declare-fun b!1504663 () Bool)

(declare-fun res!1024356 () Bool)

(assert (=> b!1504663 (=> (not res!1024356) (not e!841610))))

(assert (=> b!1504663 (= res!1024356 (validKeyInArray!0 (select (arr!48432 a!2850) i!996)))))

(assert (= (and start!128232 res!1024364) b!1504655))

(assert (= (and b!1504655 res!1024363) b!1504663))

(assert (= (and b!1504663 res!1024356) b!1504662))

(assert (= (and b!1504662 res!1024361) b!1504657))

(assert (= (and b!1504657 res!1024358) b!1504658))

(assert (= (and b!1504658 res!1024359) b!1504661))

(assert (= (and b!1504661 res!1024362) b!1504656))

(assert (= (and b!1504656 res!1024360) b!1504660))

(assert (= (and b!1504660 res!1024357) b!1504659))

(declare-fun m!1387823 () Bool)

(assert (=> b!1504656 m!1387823))

(assert (=> b!1504656 m!1387823))

(declare-fun m!1387825 () Bool)

(assert (=> b!1504656 m!1387825))

(declare-fun m!1387827 () Bool)

(assert (=> b!1504661 m!1387827))

(declare-fun m!1387829 () Bool)

(assert (=> b!1504661 m!1387829))

(declare-fun m!1387831 () Bool)

(assert (=> b!1504661 m!1387831))

(declare-fun m!1387833 () Bool)

(assert (=> b!1504659 m!1387833))

(declare-fun m!1387835 () Bool)

(assert (=> b!1504660 m!1387835))

(assert (=> b!1504660 m!1387823))

(declare-fun m!1387837 () Bool)

(assert (=> b!1504657 m!1387837))

(assert (=> b!1504662 m!1387823))

(assert (=> b!1504662 m!1387823))

(declare-fun m!1387839 () Bool)

(assert (=> b!1504662 m!1387839))

(declare-fun m!1387841 () Bool)

(assert (=> b!1504658 m!1387841))

(declare-fun m!1387843 () Bool)

(assert (=> start!128232 m!1387843))

(declare-fun m!1387845 () Bool)

(assert (=> start!128232 m!1387845))

(declare-fun m!1387847 () Bool)

(assert (=> b!1504663 m!1387847))

(assert (=> b!1504663 m!1387847))

(declare-fun m!1387849 () Bool)

(assert (=> b!1504663 m!1387849))

(push 1)

(assert (not b!1504662))

(assert (not start!128232))

(assert (not b!1504658))

(assert (not b!1504663))

(assert (not b!1504656))

(assert (not b!1504657))

(assert (not b!1504659))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

