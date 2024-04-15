; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127580 () Bool)

(assert start!127580)

(declare-fun b!1499035 () Bool)

(declare-fun e!839070 () Bool)

(assert (=> b!1499035 (= e!839070 false)))

(declare-datatypes ((SeekEntryResult!12469 0))(
  ( (MissingZero!12469 (index!52268 (_ BitVec 32))) (Found!12469 (index!52269 (_ BitVec 32))) (Intermediate!12469 (undefined!13281 Bool) (index!52270 (_ BitVec 32)) (x!133962 (_ BitVec 32))) (Undefined!12469) (MissingVacant!12469 (index!52271 (_ BitVec 32))) )
))
(declare-fun lt!652440 () SeekEntryResult!12469)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!99955 0))(
  ( (array!99956 (arr!48238 (Array (_ BitVec 32) (_ BitVec 64))) (size!48790 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99955)

(declare-fun lt!652441 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99955 (_ BitVec 32)) SeekEntryResult!12469)

(assert (=> b!1499035 (= lt!652440 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652441 vacantBefore!10 (select (arr!48238 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1499036 () Bool)

(declare-fun res!1020302 () Bool)

(declare-fun e!839068 () Bool)

(assert (=> b!1499036 (=> (not res!1020302) (not e!839068))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499036 (= res!1020302 (validKeyInArray!0 (select (arr!48238 a!2850) i!996)))))

(declare-fun b!1499037 () Bool)

(assert (=> b!1499037 (= e!839068 e!839070)))

(declare-fun res!1020306 () Bool)

(assert (=> b!1499037 (=> (not res!1020306) (not e!839070))))

(assert (=> b!1499037 (= res!1020306 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652441 #b00000000000000000000000000000000) (bvslt lt!652441 (size!48790 a!2850))))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1499037 (= lt!652441 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun res!1020301 () Bool)

(assert (=> start!127580 (=> (not res!1020301) (not e!839068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127580 (= res!1020301 (validMask!0 mask!2661))))

(assert (=> start!127580 e!839068))

(assert (=> start!127580 true))

(declare-fun array_inv!37471 (array!99955) Bool)

(assert (=> start!127580 (array_inv!37471 a!2850)))

(declare-fun b!1499038 () Bool)

(declare-fun res!1020300 () Bool)

(assert (=> b!1499038 (=> (not res!1020300) (not e!839068))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99955 (_ BitVec 32)) Bool)

(assert (=> b!1499038 (= res!1020300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499039 () Bool)

(declare-fun res!1020307 () Bool)

(assert (=> b!1499039 (=> (not res!1020307) (not e!839068))))

(assert (=> b!1499039 (= res!1020307 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48238 a!2850) j!87) a!2850 mask!2661) (Found!12469 j!87)))))

(declare-fun b!1499040 () Bool)

(declare-fun res!1020303 () Bool)

(assert (=> b!1499040 (=> (not res!1020303) (not e!839068))))

(assert (=> b!1499040 (= res!1020303 (not (= (select (arr!48238 a!2850) index!625) (select (arr!48238 a!2850) j!87))))))

(declare-fun b!1499041 () Bool)

(declare-fun res!1020305 () Bool)

(assert (=> b!1499041 (=> (not res!1020305) (not e!839068))))

(declare-datatypes ((List!34808 0))(
  ( (Nil!34805) (Cons!34804 (h!36202 (_ BitVec 64)) (t!49494 List!34808)) )
))
(declare-fun arrayNoDuplicates!0 (array!99955 (_ BitVec 32) List!34808) Bool)

(assert (=> b!1499041 (= res!1020305 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34805))))

(declare-fun b!1499042 () Bool)

(declare-fun res!1020299 () Bool)

(assert (=> b!1499042 (=> (not res!1020299) (not e!839068))))

(assert (=> b!1499042 (= res!1020299 (validKeyInArray!0 (select (arr!48238 a!2850) j!87)))))

(declare-fun b!1499043 () Bool)

(declare-fun res!1020308 () Bool)

(assert (=> b!1499043 (=> (not res!1020308) (not e!839068))))

(assert (=> b!1499043 (= res!1020308 (and (= (size!48790 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48790 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48790 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499044 () Bool)

(declare-fun res!1020304 () Bool)

(assert (=> b!1499044 (=> (not res!1020304) (not e!839068))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499044 (= res!1020304 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48790 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48790 a!2850)) (= (select (arr!48238 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48238 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48790 a!2850))))))

(assert (= (and start!127580 res!1020301) b!1499043))

(assert (= (and b!1499043 res!1020308) b!1499036))

(assert (= (and b!1499036 res!1020302) b!1499042))

(assert (= (and b!1499042 res!1020299) b!1499038))

(assert (= (and b!1499038 res!1020300) b!1499041))

(assert (= (and b!1499041 res!1020305) b!1499044))

(assert (= (and b!1499044 res!1020304) b!1499039))

(assert (= (and b!1499039 res!1020307) b!1499040))

(assert (= (and b!1499040 res!1020303) b!1499037))

(assert (= (and b!1499037 res!1020306) b!1499035))

(declare-fun m!1381675 () Bool)

(assert (=> b!1499041 m!1381675))

(declare-fun m!1381677 () Bool)

(assert (=> b!1499038 m!1381677))

(declare-fun m!1381679 () Bool)

(assert (=> b!1499039 m!1381679))

(assert (=> b!1499039 m!1381679))

(declare-fun m!1381681 () Bool)

(assert (=> b!1499039 m!1381681))

(declare-fun m!1381683 () Bool)

(assert (=> b!1499037 m!1381683))

(declare-fun m!1381685 () Bool)

(assert (=> start!127580 m!1381685))

(declare-fun m!1381687 () Bool)

(assert (=> start!127580 m!1381687))

(assert (=> b!1499035 m!1381679))

(assert (=> b!1499035 m!1381679))

(declare-fun m!1381689 () Bool)

(assert (=> b!1499035 m!1381689))

(declare-fun m!1381691 () Bool)

(assert (=> b!1499044 m!1381691))

(declare-fun m!1381693 () Bool)

(assert (=> b!1499044 m!1381693))

(declare-fun m!1381695 () Bool)

(assert (=> b!1499044 m!1381695))

(declare-fun m!1381697 () Bool)

(assert (=> b!1499040 m!1381697))

(assert (=> b!1499040 m!1381679))

(declare-fun m!1381699 () Bool)

(assert (=> b!1499036 m!1381699))

(assert (=> b!1499036 m!1381699))

(declare-fun m!1381701 () Bool)

(assert (=> b!1499036 m!1381701))

(assert (=> b!1499042 m!1381679))

(assert (=> b!1499042 m!1381679))

(declare-fun m!1381703 () Bool)

(assert (=> b!1499042 m!1381703))

(check-sat (not b!1499039) (not b!1499042) (not b!1499037) (not b!1499036) (not b!1499035) (not b!1499038) (not start!127580) (not b!1499041))
(check-sat)
