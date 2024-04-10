; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127504 () Bool)

(assert start!127504)

(declare-fun b!1498075 () Bool)

(declare-fun res!1019152 () Bool)

(declare-fun e!838890 () Bool)

(assert (=> b!1498075 (=> (not res!1019152) (not e!838890))))

(declare-datatypes ((array!99885 0))(
  ( (array!99886 (arr!48202 (Array (_ BitVec 32) (_ BitVec 64))) (size!48752 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99885)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1498075 (= res!1019152 (and (= (size!48752 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48752 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48752 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1019154 () Bool)

(assert (=> start!127504 (=> (not res!1019154) (not e!838890))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127504 (= res!1019154 (validMask!0 mask!2661))))

(assert (=> start!127504 e!838890))

(assert (=> start!127504 true))

(declare-fun array_inv!37230 (array!99885) Bool)

(assert (=> start!127504 (array_inv!37230 a!2850)))

(declare-fun b!1498076 () Bool)

(declare-fun res!1019151 () Bool)

(assert (=> b!1498076 (=> (not res!1019151) (not e!838890))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498076 (= res!1019151 (validKeyInArray!0 (select (arr!48202 a!2850) i!996)))))

(declare-fun b!1498077 () Bool)

(declare-fun res!1019155 () Bool)

(assert (=> b!1498077 (=> (not res!1019155) (not e!838890))))

(assert (=> b!1498077 (= res!1019155 (validKeyInArray!0 (select (arr!48202 a!2850) j!87)))))

(declare-fun b!1498078 () Bool)

(declare-fun res!1019153 () Bool)

(assert (=> b!1498078 (=> (not res!1019153) (not e!838890))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99885 (_ BitVec 32)) Bool)

(assert (=> b!1498078 (= res!1019153 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498079 () Bool)

(assert (=> b!1498079 (= e!838890 false)))

(declare-fun lt!652606 () Bool)

(declare-datatypes ((List!34694 0))(
  ( (Nil!34691) (Cons!34690 (h!36087 (_ BitVec 64)) (t!49388 List!34694)) )
))
(declare-fun arrayNoDuplicates!0 (array!99885 (_ BitVec 32) List!34694) Bool)

(assert (=> b!1498079 (= lt!652606 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34691))))

(assert (= (and start!127504 res!1019154) b!1498075))

(assert (= (and b!1498075 res!1019152) b!1498076))

(assert (= (and b!1498076 res!1019151) b!1498077))

(assert (= (and b!1498077 res!1019155) b!1498078))

(assert (= (and b!1498078 res!1019153) b!1498079))

(declare-fun m!1381137 () Bool)

(assert (=> b!1498076 m!1381137))

(assert (=> b!1498076 m!1381137))

(declare-fun m!1381139 () Bool)

(assert (=> b!1498076 m!1381139))

(declare-fun m!1381141 () Bool)

(assert (=> b!1498077 m!1381141))

(assert (=> b!1498077 m!1381141))

(declare-fun m!1381143 () Bool)

(assert (=> b!1498077 m!1381143))

(declare-fun m!1381145 () Bool)

(assert (=> start!127504 m!1381145))

(declare-fun m!1381147 () Bool)

(assert (=> start!127504 m!1381147))

(declare-fun m!1381149 () Bool)

(assert (=> b!1498078 m!1381149))

(declare-fun m!1381151 () Bool)

(assert (=> b!1498079 m!1381151))

(push 1)

(assert (not b!1498077))

(assert (not b!1498076))

(assert (not b!1498079))

(assert (not b!1498078))

(assert (not start!127504))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

