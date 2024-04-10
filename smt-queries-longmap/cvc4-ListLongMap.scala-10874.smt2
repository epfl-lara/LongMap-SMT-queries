; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127510 () Bool)

(assert start!127510)

(declare-fun b!1498128 () Bool)

(declare-fun res!1019208 () Bool)

(declare-fun e!838908 () Bool)

(assert (=> b!1498128 (=> (not res!1019208) (not e!838908))))

(declare-datatypes ((array!99891 0))(
  ( (array!99892 (arr!48205 (Array (_ BitVec 32) (_ BitVec 64))) (size!48755 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99891)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99891 (_ BitVec 32)) Bool)

(assert (=> b!1498128 (= res!1019208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498129 () Bool)

(declare-fun res!1019204 () Bool)

(assert (=> b!1498129 (=> (not res!1019204) (not e!838908))))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498129 (= res!1019204 (validKeyInArray!0 (select (arr!48205 a!2850) j!87)))))

(declare-fun res!1019209 () Bool)

(assert (=> start!127510 (=> (not res!1019209) (not e!838908))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127510 (= res!1019209 (validMask!0 mask!2661))))

(assert (=> start!127510 e!838908))

(assert (=> start!127510 true))

(declare-fun array_inv!37233 (array!99891) Bool)

(assert (=> start!127510 (array_inv!37233 a!2850)))

(declare-fun b!1498130 () Bool)

(declare-fun res!1019207 () Bool)

(assert (=> b!1498130 (=> (not res!1019207) (not e!838908))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1498130 (= res!1019207 (and (= (size!48755 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48755 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48755 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498131 () Bool)

(declare-fun res!1019206 () Bool)

(assert (=> b!1498131 (=> (not res!1019206) (not e!838908))))

(assert (=> b!1498131 (= res!1019206 (validKeyInArray!0 (select (arr!48205 a!2850) i!996)))))

(declare-fun b!1498132 () Bool)

(declare-fun res!1019205 () Bool)

(assert (=> b!1498132 (=> (not res!1019205) (not e!838908))))

(declare-datatypes ((List!34697 0))(
  ( (Nil!34694) (Cons!34693 (h!36090 (_ BitVec 64)) (t!49391 List!34697)) )
))
(declare-fun arrayNoDuplicates!0 (array!99891 (_ BitVec 32) List!34697) Bool)

(assert (=> b!1498132 (= res!1019205 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34694))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun b!1498133 () Bool)

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1498133 (= e!838908 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48755 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48755 a!2850)) (= (select (arr!48205 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48205 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48755 a!2850)) (bvslt mask!2661 #b00000000000000000000000000000000)))))

(assert (= (and start!127510 res!1019209) b!1498130))

(assert (= (and b!1498130 res!1019207) b!1498131))

(assert (= (and b!1498131 res!1019206) b!1498129))

(assert (= (and b!1498129 res!1019204) b!1498128))

(assert (= (and b!1498128 res!1019208) b!1498132))

(assert (= (and b!1498132 res!1019205) b!1498133))

(declare-fun m!1381197 () Bool)

(assert (=> b!1498132 m!1381197))

(declare-fun m!1381199 () Bool)

(assert (=> b!1498129 m!1381199))

(assert (=> b!1498129 m!1381199))

(declare-fun m!1381201 () Bool)

(assert (=> b!1498129 m!1381201))

(declare-fun m!1381203 () Bool)

(assert (=> b!1498133 m!1381203))

(declare-fun m!1381205 () Bool)

(assert (=> b!1498133 m!1381205))

(declare-fun m!1381207 () Bool)

(assert (=> b!1498133 m!1381207))

(declare-fun m!1381209 () Bool)

(assert (=> b!1498131 m!1381209))

(assert (=> b!1498131 m!1381209))

(declare-fun m!1381211 () Bool)

(assert (=> b!1498131 m!1381211))

(declare-fun m!1381213 () Bool)

(assert (=> start!127510 m!1381213))

(declare-fun m!1381215 () Bool)

(assert (=> start!127510 m!1381215))

(declare-fun m!1381217 () Bool)

(assert (=> b!1498128 m!1381217))

(push 1)

(assert (not b!1498128))

(assert (not start!127510))

(assert (not b!1498129))

(assert (not b!1498131))

(assert (not b!1498132))

(check-sat)

(pop 1)

(push 1)

(check-sat)

