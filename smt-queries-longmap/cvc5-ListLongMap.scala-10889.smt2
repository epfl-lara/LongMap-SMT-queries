; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127596 () Bool)

(assert start!127596)

(declare-fun res!1020065 () Bool)

(declare-fun e!839167 () Bool)

(assert (=> start!127596 (=> (not res!1020065) (not e!839167))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127596 (= res!1020065 (validMask!0 mask!2661))))

(assert (=> start!127596 e!839167))

(assert (=> start!127596 true))

(declare-datatypes ((array!99977 0))(
  ( (array!99978 (arr!48248 (Array (_ BitVec 32) (_ BitVec 64))) (size!48798 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99977)

(declare-fun array_inv!37276 (array!99977) Bool)

(assert (=> start!127596 (array_inv!37276 a!2850)))

(declare-fun b!1498985 () Bool)

(declare-fun res!1020061 () Bool)

(assert (=> b!1498985 (=> (not res!1020061) (not e!839167))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99977 (_ BitVec 32)) Bool)

(assert (=> b!1498985 (= res!1020061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498986 () Bool)

(declare-fun res!1020066 () Bool)

(assert (=> b!1498986 (=> (not res!1020066) (not e!839167))))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498986 (= res!1020066 (validKeyInArray!0 (select (arr!48248 a!2850) j!87)))))

(declare-fun b!1498987 () Bool)

(declare-fun res!1020064 () Bool)

(assert (=> b!1498987 (=> (not res!1020064) (not e!839167))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1498987 (= res!1020064 (and (= (size!48798 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48798 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48798 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498988 () Bool)

(assert (=> b!1498988 (= e!839167 false)))

(declare-fun index!625 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12458 0))(
  ( (MissingZero!12458 (index!52224 (_ BitVec 32))) (Found!12458 (index!52225 (_ BitVec 32))) (Intermediate!12458 (undefined!13270 Bool) (index!52226 (_ BitVec 32)) (x!133916 (_ BitVec 32))) (Undefined!12458) (MissingVacant!12458 (index!52227 (_ BitVec 32))) )
))
(declare-fun lt!652681 () SeekEntryResult!12458)

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99977 (_ BitVec 32)) SeekEntryResult!12458)

(assert (=> b!1498988 (= lt!652681 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48248 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1498989 () Bool)

(declare-fun res!1020062 () Bool)

(assert (=> b!1498989 (=> (not res!1020062) (not e!839167))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1498989 (= res!1020062 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48798 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48798 a!2850)) (= (select (arr!48248 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48248 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48798 a!2850))))))

(declare-fun b!1498990 () Bool)

(declare-fun res!1020063 () Bool)

(assert (=> b!1498990 (=> (not res!1020063) (not e!839167))))

(assert (=> b!1498990 (= res!1020063 (validKeyInArray!0 (select (arr!48248 a!2850) i!996)))))

(declare-fun b!1498991 () Bool)

(declare-fun res!1020067 () Bool)

(assert (=> b!1498991 (=> (not res!1020067) (not e!839167))))

(declare-datatypes ((List!34740 0))(
  ( (Nil!34737) (Cons!34736 (h!36133 (_ BitVec 64)) (t!49434 List!34740)) )
))
(declare-fun arrayNoDuplicates!0 (array!99977 (_ BitVec 32) List!34740) Bool)

(assert (=> b!1498991 (= res!1020067 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34737))))

(assert (= (and start!127596 res!1020065) b!1498987))

(assert (= (and b!1498987 res!1020064) b!1498990))

(assert (= (and b!1498990 res!1020063) b!1498986))

(assert (= (and b!1498986 res!1020066) b!1498985))

(assert (= (and b!1498985 res!1020061) b!1498991))

(assert (= (and b!1498991 res!1020067) b!1498989))

(assert (= (and b!1498989 res!1020062) b!1498988))

(declare-fun m!1382155 () Bool)

(assert (=> b!1498986 m!1382155))

(assert (=> b!1498986 m!1382155))

(declare-fun m!1382157 () Bool)

(assert (=> b!1498986 m!1382157))

(declare-fun m!1382159 () Bool)

(assert (=> b!1498985 m!1382159))

(declare-fun m!1382161 () Bool)

(assert (=> b!1498990 m!1382161))

(assert (=> b!1498990 m!1382161))

(declare-fun m!1382163 () Bool)

(assert (=> b!1498990 m!1382163))

(assert (=> b!1498988 m!1382155))

(assert (=> b!1498988 m!1382155))

(declare-fun m!1382165 () Bool)

(assert (=> b!1498988 m!1382165))

(declare-fun m!1382167 () Bool)

(assert (=> b!1498989 m!1382167))

(declare-fun m!1382169 () Bool)

(assert (=> b!1498989 m!1382169))

(declare-fun m!1382171 () Bool)

(assert (=> b!1498989 m!1382171))

(declare-fun m!1382173 () Bool)

(assert (=> start!127596 m!1382173))

(declare-fun m!1382175 () Bool)

(assert (=> start!127596 m!1382175))

(declare-fun m!1382177 () Bool)

(assert (=> b!1498991 m!1382177))

(push 1)

(assert (not b!1498990))

(assert (not b!1498991))

(assert (not b!1498985))

(assert (not start!127596))

(assert (not b!1498986))

(assert (not b!1498988))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

