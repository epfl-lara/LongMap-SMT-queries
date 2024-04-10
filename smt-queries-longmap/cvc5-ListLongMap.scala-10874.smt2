; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127506 () Bool)

(assert start!127506)

(declare-fun res!1019171 () Bool)

(declare-fun e!838897 () Bool)

(assert (=> start!127506 (=> (not res!1019171) (not e!838897))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127506 (= res!1019171 (validMask!0 mask!2661))))

(assert (=> start!127506 e!838897))

(assert (=> start!127506 true))

(declare-datatypes ((array!99887 0))(
  ( (array!99888 (arr!48203 (Array (_ BitVec 32) (_ BitVec 64))) (size!48753 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99887)

(declare-fun array_inv!37231 (array!99887) Bool)

(assert (=> start!127506 (array_inv!37231 a!2850)))

(declare-fun b!1498092 () Bool)

(declare-fun res!1019172 () Bool)

(assert (=> b!1498092 (=> (not res!1019172) (not e!838897))))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498092 (= res!1019172 (validKeyInArray!0 (select (arr!48203 a!2850) j!87)))))

(declare-fun b!1498093 () Bool)

(declare-fun res!1019168 () Bool)

(assert (=> b!1498093 (=> (not res!1019168) (not e!838897))))

(declare-datatypes ((List!34695 0))(
  ( (Nil!34692) (Cons!34691 (h!36088 (_ BitVec 64)) (t!49389 List!34695)) )
))
(declare-fun arrayNoDuplicates!0 (array!99887 (_ BitVec 32) List!34695) Bool)

(assert (=> b!1498093 (= res!1019168 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34692))))

(declare-fun b!1498094 () Bool)

(declare-fun res!1019173 () Bool)

(assert (=> b!1498094 (=> (not res!1019173) (not e!838897))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1498094 (= res!1019173 (and (= (size!48753 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48753 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48753 a!2850)) (not (= i!996 j!87))))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun b!1498095 () Bool)

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1498095 (= e!838897 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48753 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48753 a!2850)) (= (select (arr!48203 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48203 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48753 a!2850)) (bvslt mask!2661 #b00000000000000000000000000000000)))))

(declare-fun b!1498096 () Bool)

(declare-fun res!1019170 () Bool)

(assert (=> b!1498096 (=> (not res!1019170) (not e!838897))))

(assert (=> b!1498096 (= res!1019170 (validKeyInArray!0 (select (arr!48203 a!2850) i!996)))))

(declare-fun b!1498097 () Bool)

(declare-fun res!1019169 () Bool)

(assert (=> b!1498097 (=> (not res!1019169) (not e!838897))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99887 (_ BitVec 32)) Bool)

(assert (=> b!1498097 (= res!1019169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127506 res!1019171) b!1498094))

(assert (= (and b!1498094 res!1019173) b!1498096))

(assert (= (and b!1498096 res!1019170) b!1498092))

(assert (= (and b!1498092 res!1019172) b!1498097))

(assert (= (and b!1498097 res!1019169) b!1498093))

(assert (= (and b!1498093 res!1019168) b!1498095))

(declare-fun m!1381153 () Bool)

(assert (=> b!1498097 m!1381153))

(declare-fun m!1381155 () Bool)

(assert (=> start!127506 m!1381155))

(declare-fun m!1381157 () Bool)

(assert (=> start!127506 m!1381157))

(declare-fun m!1381159 () Bool)

(assert (=> b!1498096 m!1381159))

(assert (=> b!1498096 m!1381159))

(declare-fun m!1381161 () Bool)

(assert (=> b!1498096 m!1381161))

(declare-fun m!1381163 () Bool)

(assert (=> b!1498093 m!1381163))

(declare-fun m!1381165 () Bool)

(assert (=> b!1498095 m!1381165))

(declare-fun m!1381167 () Bool)

(assert (=> b!1498095 m!1381167))

(declare-fun m!1381169 () Bool)

(assert (=> b!1498095 m!1381169))

(declare-fun m!1381171 () Bool)

(assert (=> b!1498092 m!1381171))

(assert (=> b!1498092 m!1381171))

(declare-fun m!1381173 () Bool)

(assert (=> b!1498092 m!1381173))

(push 1)

(assert (not b!1498092))

(assert (not b!1498097))

(assert (not b!1498096))

(assert (not start!127506))

(assert (not b!1498093))

(check-sat)

(pop 1)

(push 1)

(check-sat)

