; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127572 () Bool)

(assert start!127572)

(declare-fun res!1019782 () Bool)

(declare-fun e!839094 () Bool)

(assert (=> start!127572 (=> (not res!1019782) (not e!839094))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127572 (= res!1019782 (validMask!0 mask!2661))))

(assert (=> start!127572 e!839094))

(assert (=> start!127572 true))

(declare-datatypes ((array!99953 0))(
  ( (array!99954 (arr!48236 (Array (_ BitVec 32) (_ BitVec 64))) (size!48786 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99953)

(declare-fun array_inv!37264 (array!99953) Bool)

(assert (=> start!127572 (array_inv!37264 a!2850)))

(declare-fun b!1498706 () Bool)

(declare-fun res!1019788 () Bool)

(assert (=> b!1498706 (=> (not res!1019788) (not e!839094))))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1498706 (= res!1019788 (and (= (size!48786 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48786 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48786 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498707 () Bool)

(declare-fun res!1019786 () Bool)

(assert (=> b!1498707 (=> (not res!1019786) (not e!839094))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498707 (= res!1019786 (validKeyInArray!0 (select (arr!48236 a!2850) i!996)))))

(declare-fun b!1498708 () Bool)

(declare-fun res!1019787 () Bool)

(assert (=> b!1498708 (=> (not res!1019787) (not e!839094))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99953 (_ BitVec 32)) Bool)

(assert (=> b!1498708 (= res!1019787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498709 () Bool)

(assert (=> b!1498709 (= e!839094 false)))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12446 0))(
  ( (MissingZero!12446 (index!52176 (_ BitVec 32))) (Found!12446 (index!52177 (_ BitVec 32))) (Intermediate!12446 (undefined!13258 Bool) (index!52178 (_ BitVec 32)) (x!133872 (_ BitVec 32))) (Undefined!12446) (MissingVacant!12446 (index!52179 (_ BitVec 32))) )
))
(declare-fun lt!652663 () SeekEntryResult!12446)

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99953 (_ BitVec 32)) SeekEntryResult!12446)

(assert (=> b!1498709 (= lt!652663 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48236 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1498710 () Bool)

(declare-fun res!1019783 () Bool)

(assert (=> b!1498710 (=> (not res!1019783) (not e!839094))))

(assert (=> b!1498710 (= res!1019783 (validKeyInArray!0 (select (arr!48236 a!2850) j!87)))))

(declare-fun b!1498711 () Bool)

(declare-fun res!1019785 () Bool)

(assert (=> b!1498711 (=> (not res!1019785) (not e!839094))))

(declare-datatypes ((List!34728 0))(
  ( (Nil!34725) (Cons!34724 (h!36121 (_ BitVec 64)) (t!49422 List!34728)) )
))
(declare-fun arrayNoDuplicates!0 (array!99953 (_ BitVec 32) List!34728) Bool)

(assert (=> b!1498711 (= res!1019785 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34725))))

(declare-fun b!1498712 () Bool)

(declare-fun res!1019784 () Bool)

(assert (=> b!1498712 (=> (not res!1019784) (not e!839094))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1498712 (= res!1019784 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48786 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48786 a!2850)) (= (select (arr!48236 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48236 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48786 a!2850))))))

(assert (= (and start!127572 res!1019782) b!1498706))

(assert (= (and b!1498706 res!1019788) b!1498707))

(assert (= (and b!1498707 res!1019786) b!1498710))

(assert (= (and b!1498710 res!1019783) b!1498708))

(assert (= (and b!1498708 res!1019787) b!1498711))

(assert (= (and b!1498711 res!1019785) b!1498712))

(assert (= (and b!1498712 res!1019784) b!1498709))

(declare-fun m!1381843 () Bool)

(assert (=> b!1498708 m!1381843))

(declare-fun m!1381845 () Bool)

(assert (=> b!1498710 m!1381845))

(assert (=> b!1498710 m!1381845))

(declare-fun m!1381847 () Bool)

(assert (=> b!1498710 m!1381847))

(declare-fun m!1381849 () Bool)

(assert (=> b!1498711 m!1381849))

(declare-fun m!1381851 () Bool)

(assert (=> b!1498707 m!1381851))

(assert (=> b!1498707 m!1381851))

(declare-fun m!1381853 () Bool)

(assert (=> b!1498707 m!1381853))

(declare-fun m!1381855 () Bool)

(assert (=> start!127572 m!1381855))

(declare-fun m!1381857 () Bool)

(assert (=> start!127572 m!1381857))

(assert (=> b!1498709 m!1381845))

(assert (=> b!1498709 m!1381845))

(declare-fun m!1381859 () Bool)

(assert (=> b!1498709 m!1381859))

(declare-fun m!1381861 () Bool)

(assert (=> b!1498712 m!1381861))

(declare-fun m!1381863 () Bool)

(assert (=> b!1498712 m!1381863))

(declare-fun m!1381865 () Bool)

(assert (=> b!1498712 m!1381865))

(push 1)

(assert (not b!1498707))

(assert (not b!1498708))

(assert (not b!1498711))

(assert (not start!127572))

(assert (not b!1498710))

(assert (not b!1498709))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

