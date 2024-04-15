; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128132 () Bool)

(assert start!128132)

(declare-fun res!1025500 () Bool)

(declare-fun e!841000 () Bool)

(assert (=> start!128132 (=> (not res!1025500) (not e!841000))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128132 (= res!1025500 (validMask!0 mask!2661))))

(assert (=> start!128132 e!841000))

(assert (=> start!128132 true))

(declare-datatypes ((array!100330 0))(
  ( (array!100331 (arr!48418 (Array (_ BitVec 32) (_ BitVec 64))) (size!48970 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100330)

(declare-fun array_inv!37651 (array!100330) Bool)

(assert (=> start!128132 (array_inv!37651 a!2850)))

(declare-fun b!1504701 () Bool)

(declare-fun res!1025498 () Bool)

(declare-fun e!840999 () Bool)

(assert (=> b!1504701 (=> (not res!1025498) (not e!840999))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12637 0))(
  ( (MissingZero!12637 (index!52940 (_ BitVec 32))) (Found!12637 (index!52941 (_ BitVec 32))) (Intermediate!12637 (undefined!13449 Bool) (index!52942 (_ BitVec 32)) (x!134633 (_ BitVec 32))) (Undefined!12637) (MissingVacant!12637 (index!52943 (_ BitVec 32))) )
))
(declare-fun lt!653583 () SeekEntryResult!12637)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!653581 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100330 (_ BitVec 32)) SeekEntryResult!12637)

(assert (=> b!1504701 (= res!1025498 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653581 vacantBefore!10 (select (arr!48418 a!2850) j!87) a!2850 mask!2661) lt!653583))))

(declare-fun b!1504702 () Bool)

(declare-fun res!1025505 () Bool)

(assert (=> b!1504702 (=> (not res!1025505) (not e!841000))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1504702 (= res!1025505 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48970 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48970 a!2850)) (= (select (arr!48418 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48418 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48970 a!2850))))))

(declare-fun b!1504703 () Bool)

(declare-fun res!1025506 () Bool)

(assert (=> b!1504703 (=> (not res!1025506) (not e!841000))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1504703 (= res!1025506 (validKeyInArray!0 (select (arr!48418 a!2850) j!87)))))

(declare-fun b!1504704 () Bool)

(declare-fun res!1025507 () Bool)

(assert (=> b!1504704 (=> (not res!1025507) (not e!841000))))

(assert (=> b!1504704 (= res!1025507 (and (= (size!48970 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48970 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48970 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1504705 () Bool)

(declare-fun e!841002 () Bool)

(assert (=> b!1504705 (= e!841002 e!840999)))

(declare-fun res!1025501 () Bool)

(assert (=> b!1504705 (=> (not res!1025501) (not e!840999))))

(assert (=> b!1504705 (= res!1025501 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653581 #b00000000000000000000000000000000) (bvslt lt!653581 (size!48970 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1504705 (= lt!653581 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1504706 () Bool)

(assert (=> b!1504706 (= e!840999 (not true))))

(assert (=> b!1504706 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653581 vacantAfter!10 (select (store (arr!48418 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100331 (store (arr!48418 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48970 a!2850)) mask!2661) lt!653583)))

(declare-datatypes ((Unit!50119 0))(
  ( (Unit!50120) )
))
(declare-fun lt!653582 () Unit!50119)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100330 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50119)

(assert (=> b!1504706 (= lt!653582 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653581 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1504707 () Bool)

(declare-fun res!1025503 () Bool)

(assert (=> b!1504707 (=> (not res!1025503) (not e!841002))))

(assert (=> b!1504707 (= res!1025503 (not (= (select (arr!48418 a!2850) index!625) (select (arr!48418 a!2850) j!87))))))

(declare-fun b!1504708 () Bool)

(declare-fun res!1025504 () Bool)

(assert (=> b!1504708 (=> (not res!1025504) (not e!841000))))

(declare-datatypes ((List!34988 0))(
  ( (Nil!34985) (Cons!34984 (h!36382 (_ BitVec 64)) (t!49674 List!34988)) )
))
(declare-fun arrayNoDuplicates!0 (array!100330 (_ BitVec 32) List!34988) Bool)

(assert (=> b!1504708 (= res!1025504 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34985))))

(declare-fun b!1504709 () Bool)

(assert (=> b!1504709 (= e!841000 e!841002)))

(declare-fun res!1025499 () Bool)

(assert (=> b!1504709 (=> (not res!1025499) (not e!841002))))

(assert (=> b!1504709 (= res!1025499 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48418 a!2850) j!87) a!2850 mask!2661) lt!653583))))

(assert (=> b!1504709 (= lt!653583 (Found!12637 j!87))))

(declare-fun b!1504710 () Bool)

(declare-fun res!1025497 () Bool)

(assert (=> b!1504710 (=> (not res!1025497) (not e!841000))))

(assert (=> b!1504710 (= res!1025497 (validKeyInArray!0 (select (arr!48418 a!2850) i!996)))))

(declare-fun b!1504711 () Bool)

(declare-fun res!1025502 () Bool)

(assert (=> b!1504711 (=> (not res!1025502) (not e!841000))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100330 (_ BitVec 32)) Bool)

(assert (=> b!1504711 (= res!1025502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!128132 res!1025500) b!1504704))

(assert (= (and b!1504704 res!1025507) b!1504710))

(assert (= (and b!1504710 res!1025497) b!1504703))

(assert (= (and b!1504703 res!1025506) b!1504711))

(assert (= (and b!1504711 res!1025502) b!1504708))

(assert (= (and b!1504708 res!1025504) b!1504702))

(assert (= (and b!1504702 res!1025505) b!1504709))

(assert (= (and b!1504709 res!1025499) b!1504707))

(assert (= (and b!1504707 res!1025503) b!1504705))

(assert (= (and b!1504705 res!1025501) b!1504701))

(assert (= (and b!1504701 res!1025498) b!1504706))

(declare-fun m!1387241 () Bool)

(assert (=> b!1504705 m!1387241))

(declare-fun m!1387243 () Bool)

(assert (=> b!1504711 m!1387243))

(declare-fun m!1387245 () Bool)

(assert (=> b!1504707 m!1387245))

(declare-fun m!1387247 () Bool)

(assert (=> b!1504707 m!1387247))

(declare-fun m!1387249 () Bool)

(assert (=> b!1504710 m!1387249))

(assert (=> b!1504710 m!1387249))

(declare-fun m!1387251 () Bool)

(assert (=> b!1504710 m!1387251))

(assert (=> b!1504703 m!1387247))

(assert (=> b!1504703 m!1387247))

(declare-fun m!1387253 () Bool)

(assert (=> b!1504703 m!1387253))

(declare-fun m!1387255 () Bool)

(assert (=> b!1504708 m!1387255))

(assert (=> b!1504701 m!1387247))

(assert (=> b!1504701 m!1387247))

(declare-fun m!1387257 () Bool)

(assert (=> b!1504701 m!1387257))

(assert (=> b!1504709 m!1387247))

(assert (=> b!1504709 m!1387247))

(declare-fun m!1387259 () Bool)

(assert (=> b!1504709 m!1387259))

(declare-fun m!1387261 () Bool)

(assert (=> b!1504702 m!1387261))

(declare-fun m!1387263 () Bool)

(assert (=> b!1504702 m!1387263))

(declare-fun m!1387265 () Bool)

(assert (=> b!1504702 m!1387265))

(assert (=> b!1504706 m!1387263))

(declare-fun m!1387267 () Bool)

(assert (=> b!1504706 m!1387267))

(assert (=> b!1504706 m!1387267))

(declare-fun m!1387269 () Bool)

(assert (=> b!1504706 m!1387269))

(declare-fun m!1387271 () Bool)

(assert (=> b!1504706 m!1387271))

(declare-fun m!1387273 () Bool)

(assert (=> start!128132 m!1387273))

(declare-fun m!1387275 () Bool)

(assert (=> start!128132 m!1387275))

(check-sat (not b!1504706) (not b!1504709) (not b!1504701) (not b!1504708) (not b!1504711) (not start!128132) (not b!1504710) (not b!1504705) (not b!1504703))
(check-sat)
