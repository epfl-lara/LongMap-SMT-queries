; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127576 () Bool)

(assert start!127576)

(declare-fun b!1498748 () Bool)

(declare-fun e!839106 () Bool)

(assert (=> b!1498748 (= e!839106 false)))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!99957 0))(
  ( (array!99958 (arr!48238 (Array (_ BitVec 32) (_ BitVec 64))) (size!48788 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99957)

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12448 0))(
  ( (MissingZero!12448 (index!52184 (_ BitVec 32))) (Found!12448 (index!52185 (_ BitVec 32))) (Intermediate!12448 (undefined!13260 Bool) (index!52186 (_ BitVec 32)) (x!133874 (_ BitVec 32))) (Undefined!12448) (MissingVacant!12448 (index!52187 (_ BitVec 32))) )
))
(declare-fun lt!652669 () SeekEntryResult!12448)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99957 (_ BitVec 32)) SeekEntryResult!12448)

(assert (=> b!1498748 (= lt!652669 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48238 a!2850) j!87) a!2850 mask!2661))))

(declare-fun res!1019826 () Bool)

(assert (=> start!127576 (=> (not res!1019826) (not e!839106))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127576 (= res!1019826 (validMask!0 mask!2661))))

(assert (=> start!127576 e!839106))

(assert (=> start!127576 true))

(declare-fun array_inv!37266 (array!99957) Bool)

(assert (=> start!127576 (array_inv!37266 a!2850)))

(declare-fun b!1498749 () Bool)

(declare-fun res!1019829 () Bool)

(assert (=> b!1498749 (=> (not res!1019829) (not e!839106))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1498749 (= res!1019829 (and (= (size!48788 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48788 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48788 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498750 () Bool)

(declare-fun res!1019830 () Bool)

(assert (=> b!1498750 (=> (not res!1019830) (not e!839106))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498750 (= res!1019830 (validKeyInArray!0 (select (arr!48238 a!2850) i!996)))))

(declare-fun b!1498751 () Bool)

(declare-fun res!1019827 () Bool)

(assert (=> b!1498751 (=> (not res!1019827) (not e!839106))))

(assert (=> b!1498751 (= res!1019827 (validKeyInArray!0 (select (arr!48238 a!2850) j!87)))))

(declare-fun b!1498752 () Bool)

(declare-fun res!1019825 () Bool)

(assert (=> b!1498752 (=> (not res!1019825) (not e!839106))))

(declare-datatypes ((List!34730 0))(
  ( (Nil!34727) (Cons!34726 (h!36123 (_ BitVec 64)) (t!49424 List!34730)) )
))
(declare-fun arrayNoDuplicates!0 (array!99957 (_ BitVec 32) List!34730) Bool)

(assert (=> b!1498752 (= res!1019825 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34727))))

(declare-fun b!1498753 () Bool)

(declare-fun res!1019828 () Bool)

(assert (=> b!1498753 (=> (not res!1019828) (not e!839106))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1498753 (= res!1019828 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48788 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48788 a!2850)) (= (select (arr!48238 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48238 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48788 a!2850))))))

(declare-fun b!1498754 () Bool)

(declare-fun res!1019824 () Bool)

(assert (=> b!1498754 (=> (not res!1019824) (not e!839106))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99957 (_ BitVec 32)) Bool)

(assert (=> b!1498754 (= res!1019824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127576 res!1019826) b!1498749))

(assert (= (and b!1498749 res!1019829) b!1498750))

(assert (= (and b!1498750 res!1019830) b!1498751))

(assert (= (and b!1498751 res!1019827) b!1498754))

(assert (= (and b!1498754 res!1019824) b!1498752))

(assert (= (and b!1498752 res!1019825) b!1498753))

(assert (= (and b!1498753 res!1019828) b!1498748))

(declare-fun m!1381891 () Bool)

(assert (=> b!1498748 m!1381891))

(assert (=> b!1498748 m!1381891))

(declare-fun m!1381893 () Bool)

(assert (=> b!1498748 m!1381893))

(declare-fun m!1381895 () Bool)

(assert (=> b!1498753 m!1381895))

(declare-fun m!1381897 () Bool)

(assert (=> b!1498753 m!1381897))

(declare-fun m!1381899 () Bool)

(assert (=> b!1498753 m!1381899))

(declare-fun m!1381901 () Bool)

(assert (=> b!1498754 m!1381901))

(declare-fun m!1381903 () Bool)

(assert (=> start!127576 m!1381903))

(declare-fun m!1381905 () Bool)

(assert (=> start!127576 m!1381905))

(declare-fun m!1381907 () Bool)

(assert (=> b!1498750 m!1381907))

(assert (=> b!1498750 m!1381907))

(declare-fun m!1381909 () Bool)

(assert (=> b!1498750 m!1381909))

(declare-fun m!1381911 () Bool)

(assert (=> b!1498752 m!1381911))

(assert (=> b!1498751 m!1381891))

(assert (=> b!1498751 m!1381891))

(declare-fun m!1381913 () Bool)

(assert (=> b!1498751 m!1381913))

(push 1)

(assert (not b!1498754))

(assert (not b!1498751))

(assert (not b!1498750))

(assert (not start!127576))

(assert (not b!1498752))

(assert (not b!1498748))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

