; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127500 () Bool)

(assert start!127500)

(declare-fun res!1019121 () Bool)

(declare-fun e!838878 () Bool)

(assert (=> start!127500 (=> (not res!1019121) (not e!838878))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127500 (= res!1019121 (validMask!0 mask!2661))))

(assert (=> start!127500 e!838878))

(assert (=> start!127500 true))

(declare-datatypes ((array!99881 0))(
  ( (array!99882 (arr!48200 (Array (_ BitVec 32) (_ BitVec 64))) (size!48750 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99881)

(declare-fun array_inv!37228 (array!99881) Bool)

(assert (=> start!127500 (array_inv!37228 a!2850)))

(declare-fun b!1498045 () Bool)

(declare-fun res!1019122 () Bool)

(assert (=> b!1498045 (=> (not res!1019122) (not e!838878))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99881 (_ BitVec 32)) Bool)

(assert (=> b!1498045 (= res!1019122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498046 () Bool)

(assert (=> b!1498046 (= e!838878 false)))

(declare-fun lt!652600 () Bool)

(declare-datatypes ((List!34692 0))(
  ( (Nil!34689) (Cons!34688 (h!36085 (_ BitVec 64)) (t!49386 List!34692)) )
))
(declare-fun arrayNoDuplicates!0 (array!99881 (_ BitVec 32) List!34692) Bool)

(assert (=> b!1498046 (= lt!652600 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34689))))

(declare-fun b!1498047 () Bool)

(declare-fun res!1019123 () Bool)

(assert (=> b!1498047 (=> (not res!1019123) (not e!838878))))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498047 (= res!1019123 (validKeyInArray!0 (select (arr!48200 a!2850) j!87)))))

(declare-fun b!1498048 () Bool)

(declare-fun res!1019124 () Bool)

(assert (=> b!1498048 (=> (not res!1019124) (not e!838878))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1498048 (= res!1019124 (validKeyInArray!0 (select (arr!48200 a!2850) i!996)))))

(declare-fun b!1498049 () Bool)

(declare-fun res!1019125 () Bool)

(assert (=> b!1498049 (=> (not res!1019125) (not e!838878))))

(assert (=> b!1498049 (= res!1019125 (and (= (size!48750 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48750 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48750 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!127500 res!1019121) b!1498049))

(assert (= (and b!1498049 res!1019125) b!1498048))

(assert (= (and b!1498048 res!1019124) b!1498047))

(assert (= (and b!1498047 res!1019123) b!1498045))

(assert (= (and b!1498045 res!1019122) b!1498046))

(declare-fun m!1381105 () Bool)

(assert (=> b!1498046 m!1381105))

(declare-fun m!1381107 () Bool)

(assert (=> b!1498045 m!1381107))

(declare-fun m!1381109 () Bool)

(assert (=> start!127500 m!1381109))

(declare-fun m!1381111 () Bool)

(assert (=> start!127500 m!1381111))

(declare-fun m!1381113 () Bool)

(assert (=> b!1498048 m!1381113))

(assert (=> b!1498048 m!1381113))

(declare-fun m!1381115 () Bool)

(assert (=> b!1498048 m!1381115))

(declare-fun m!1381117 () Bool)

(assert (=> b!1498047 m!1381117))

(assert (=> b!1498047 m!1381117))

(declare-fun m!1381119 () Bool)

(assert (=> b!1498047 m!1381119))

(push 1)

(assert (not b!1498046))

(assert (not b!1498047))

(assert (not b!1498048))

(assert (not b!1498045))

(assert (not start!127500))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

