; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127600 () Bool)

(assert start!127600)

(declare-fun b!1499027 () Bool)

(declare-fun res!1020106 () Bool)

(declare-fun e!839179 () Bool)

(assert (=> b!1499027 (=> (not res!1020106) (not e!839179))))

(declare-datatypes ((array!99981 0))(
  ( (array!99982 (arr!48250 (Array (_ BitVec 32) (_ BitVec 64))) (size!48800 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99981)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499027 (= res!1020106 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48800 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48800 a!2850)) (= (select (arr!48250 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48250 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48800 a!2850))))))

(declare-fun b!1499028 () Bool)

(declare-fun res!1020107 () Bool)

(assert (=> b!1499028 (=> (not res!1020107) (not e!839179))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499028 (= res!1020107 (validKeyInArray!0 (select (arr!48250 a!2850) i!996)))))

(declare-fun b!1499029 () Bool)

(declare-fun res!1020104 () Bool)

(assert (=> b!1499029 (=> (not res!1020104) (not e!839179))))

(declare-datatypes ((List!34742 0))(
  ( (Nil!34739) (Cons!34738 (h!36135 (_ BitVec 64)) (t!49436 List!34742)) )
))
(declare-fun arrayNoDuplicates!0 (array!99981 (_ BitVec 32) List!34742) Bool)

(assert (=> b!1499029 (= res!1020104 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34739))))

(declare-fun b!1499030 () Bool)

(declare-fun res!1020108 () Bool)

(assert (=> b!1499030 (=> (not res!1020108) (not e!839179))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1499030 (= res!1020108 (and (= (size!48800 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48800 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48800 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499031 () Bool)

(declare-fun res!1020109 () Bool)

(assert (=> b!1499031 (=> (not res!1020109) (not e!839179))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99981 (_ BitVec 32)) Bool)

(assert (=> b!1499031 (= res!1020109 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499033 () Bool)

(assert (=> b!1499033 (= e!839179 false)))

(declare-datatypes ((SeekEntryResult!12460 0))(
  ( (MissingZero!12460 (index!52232 (_ BitVec 32))) (Found!12460 (index!52233 (_ BitVec 32))) (Intermediate!12460 (undefined!13272 Bool) (index!52234 (_ BitVec 32)) (x!133918 (_ BitVec 32))) (Undefined!12460) (MissingVacant!12460 (index!52235 (_ BitVec 32))) )
))
(declare-fun lt!652687 () SeekEntryResult!12460)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99981 (_ BitVec 32)) SeekEntryResult!12460)

(assert (=> b!1499033 (= lt!652687 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48250 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1499032 () Bool)

(declare-fun res!1020105 () Bool)

(assert (=> b!1499032 (=> (not res!1020105) (not e!839179))))

(assert (=> b!1499032 (= res!1020105 (validKeyInArray!0 (select (arr!48250 a!2850) j!87)))))

(declare-fun res!1020103 () Bool)

(assert (=> start!127600 (=> (not res!1020103) (not e!839179))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127600 (= res!1020103 (validMask!0 mask!2661))))

(assert (=> start!127600 e!839179))

(assert (=> start!127600 true))

(declare-fun array_inv!37278 (array!99981) Bool)

(assert (=> start!127600 (array_inv!37278 a!2850)))

(assert (= (and start!127600 res!1020103) b!1499030))

(assert (= (and b!1499030 res!1020108) b!1499028))

(assert (= (and b!1499028 res!1020107) b!1499032))

(assert (= (and b!1499032 res!1020105) b!1499031))

(assert (= (and b!1499031 res!1020109) b!1499029))

(assert (= (and b!1499029 res!1020104) b!1499027))

(assert (= (and b!1499027 res!1020106) b!1499033))

(declare-fun m!1382203 () Bool)

(assert (=> b!1499031 m!1382203))

(declare-fun m!1382205 () Bool)

(assert (=> b!1499027 m!1382205))

(declare-fun m!1382207 () Bool)

(assert (=> b!1499027 m!1382207))

(declare-fun m!1382209 () Bool)

(assert (=> b!1499027 m!1382209))

(declare-fun m!1382211 () Bool)

(assert (=> b!1499028 m!1382211))

(assert (=> b!1499028 m!1382211))

(declare-fun m!1382213 () Bool)

(assert (=> b!1499028 m!1382213))

(declare-fun m!1382215 () Bool)

(assert (=> start!127600 m!1382215))

(declare-fun m!1382217 () Bool)

(assert (=> start!127600 m!1382217))

(declare-fun m!1382219 () Bool)

(assert (=> b!1499032 m!1382219))

(assert (=> b!1499032 m!1382219))

(declare-fun m!1382221 () Bool)

(assert (=> b!1499032 m!1382221))

(assert (=> b!1499033 m!1382219))

(assert (=> b!1499033 m!1382219))

(declare-fun m!1382223 () Bool)

(assert (=> b!1499033 m!1382223))

(declare-fun m!1382225 () Bool)

(assert (=> b!1499029 m!1382225))

(push 1)

(assert (not start!127600))

(assert (not b!1499031))

(assert (not b!1499029))

(assert (not b!1499032))

(assert (not b!1499033))

(assert (not b!1499028))

(check-sat)

(pop 1)

(push 1)

