; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127592 () Bool)

(assert start!127592)

(declare-fun b!1498935 () Bool)

(declare-fun res!1020017 () Bool)

(declare-fun e!839155 () Bool)

(assert (=> b!1498935 (=> (not res!1020017) (not e!839155))))

(declare-datatypes ((array!99973 0))(
  ( (array!99974 (arr!48246 (Array (_ BitVec 32) (_ BitVec 64))) (size!48796 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99973)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498935 (= res!1020017 (validKeyInArray!0 (select (arr!48246 a!2850) i!996)))))

(declare-fun res!1020013 () Bool)

(assert (=> start!127592 (=> (not res!1020013) (not e!839155))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127592 (= res!1020013 (validMask!0 mask!2661))))

(assert (=> start!127592 e!839155))

(assert (=> start!127592 true))

(declare-fun array_inv!37274 (array!99973) Bool)

(assert (=> start!127592 (array_inv!37274 a!2850)))

(declare-fun b!1498936 () Bool)

(declare-fun res!1020014 () Bool)

(assert (=> b!1498936 (=> (not res!1020014) (not e!839155))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1498936 (= res!1020014 (and (= (select (arr!48246 a!2850) index!625) (select (arr!48246 a!2850) j!87)) (= j!87 index!625) (bvsge mask!2661 #b00000000000000000000000000000000) (bvslt index!625 (bvadd #b00000000000000000000000000000001 mask!2661)) (bvslt vacantAfter!10 (bvadd #b00000000000000000000000000000001 mask!2661))))))

(declare-fun b!1498937 () Bool)

(assert (=> b!1498937 (= e!839155 (not (validKeyInArray!0 (select (store (arr!48246 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87))))))

(declare-fun b!1498938 () Bool)

(declare-fun res!1020018 () Bool)

(assert (=> b!1498938 (=> (not res!1020018) (not e!839155))))

(declare-datatypes ((List!34738 0))(
  ( (Nil!34735) (Cons!34734 (h!36131 (_ BitVec 64)) (t!49432 List!34738)) )
))
(declare-fun arrayNoDuplicates!0 (array!99973 (_ BitVec 32) List!34738) Bool)

(assert (=> b!1498938 (= res!1020018 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34735))))

(declare-fun b!1498939 () Bool)

(declare-fun res!1020019 () Bool)

(assert (=> b!1498939 (=> (not res!1020019) (not e!839155))))

(assert (=> b!1498939 (= res!1020019 (validKeyInArray!0 (select (arr!48246 a!2850) j!87)))))

(declare-fun b!1498940 () Bool)

(declare-fun res!1020012 () Bool)

(assert (=> b!1498940 (=> (not res!1020012) (not e!839155))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99973 (_ BitVec 32)) Bool)

(assert (=> b!1498940 (= res!1020012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498941 () Bool)

(declare-fun res!1020015 () Bool)

(assert (=> b!1498941 (=> (not res!1020015) (not e!839155))))

(assert (=> b!1498941 (= res!1020015 (and (= (size!48796 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48796 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48796 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498942 () Bool)

(declare-fun res!1020011 () Bool)

(assert (=> b!1498942 (=> (not res!1020011) (not e!839155))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12456 0))(
  ( (MissingZero!12456 (index!52216 (_ BitVec 32))) (Found!12456 (index!52217 (_ BitVec 32))) (Intermediate!12456 (undefined!13268 Bool) (index!52218 (_ BitVec 32)) (x!133906 (_ BitVec 32))) (Undefined!12456) (MissingVacant!12456 (index!52219 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99973 (_ BitVec 32)) SeekEntryResult!12456)

(assert (=> b!1498942 (= res!1020011 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48246 a!2850) j!87) a!2850 mask!2661) (Found!12456 j!87)))))

(declare-fun b!1498943 () Bool)

(declare-fun res!1020016 () Bool)

(assert (=> b!1498943 (=> (not res!1020016) (not e!839155))))

(assert (=> b!1498943 (= res!1020016 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48796 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48796 a!2850)) (= (select (arr!48246 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48246 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48796 a!2850))))))

(assert (= (and start!127592 res!1020013) b!1498941))

(assert (= (and b!1498941 res!1020015) b!1498935))

(assert (= (and b!1498935 res!1020017) b!1498939))

(assert (= (and b!1498939 res!1020019) b!1498940))

(assert (= (and b!1498940 res!1020012) b!1498938))

(assert (= (and b!1498938 res!1020018) b!1498943))

(assert (= (and b!1498943 res!1020016) b!1498942))

(assert (= (and b!1498942 res!1020011) b!1498936))

(assert (= (and b!1498936 res!1020014) b!1498937))

(declare-fun m!1382095 () Bool)

(assert (=> b!1498938 m!1382095))

(declare-fun m!1382097 () Bool)

(assert (=> b!1498939 m!1382097))

(assert (=> b!1498939 m!1382097))

(declare-fun m!1382099 () Bool)

(assert (=> b!1498939 m!1382099))

(declare-fun m!1382101 () Bool)

(assert (=> b!1498935 m!1382101))

(assert (=> b!1498935 m!1382101))

(declare-fun m!1382103 () Bool)

(assert (=> b!1498935 m!1382103))

(declare-fun m!1382105 () Bool)

(assert (=> b!1498943 m!1382105))

(declare-fun m!1382107 () Bool)

(assert (=> b!1498943 m!1382107))

(declare-fun m!1382109 () Bool)

(assert (=> b!1498943 m!1382109))

(assert (=> b!1498942 m!1382097))

(assert (=> b!1498942 m!1382097))

(declare-fun m!1382111 () Bool)

(assert (=> b!1498942 m!1382111))

(declare-fun m!1382113 () Bool)

(assert (=> b!1498936 m!1382113))

(assert (=> b!1498936 m!1382097))

(assert (=> b!1498937 m!1382107))

(declare-fun m!1382115 () Bool)

(assert (=> b!1498937 m!1382115))

(assert (=> b!1498937 m!1382115))

(declare-fun m!1382117 () Bool)

(assert (=> b!1498937 m!1382117))

(declare-fun m!1382119 () Bool)

(assert (=> b!1498940 m!1382119))

(declare-fun m!1382121 () Bool)

(assert (=> start!127592 m!1382121))

(declare-fun m!1382123 () Bool)

(assert (=> start!127592 m!1382123))

(check-sat (not b!1498942) (not start!127592) (not b!1498938) (not b!1498935) (not b!1498940) (not b!1498939) (not b!1498937))
(check-sat)
