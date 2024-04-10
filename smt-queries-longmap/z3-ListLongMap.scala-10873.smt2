; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127502 () Bool)

(assert start!127502)

(declare-fun b!1498060 () Bool)

(declare-fun res!1019136 () Bool)

(declare-fun e!838884 () Bool)

(assert (=> b!1498060 (=> (not res!1019136) (not e!838884))))

(declare-datatypes ((array!99883 0))(
  ( (array!99884 (arr!48201 (Array (_ BitVec 32) (_ BitVec 64))) (size!48751 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99883)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498060 (= res!1019136 (validKeyInArray!0 (select (arr!48201 a!2850) j!87)))))

(declare-fun b!1498061 () Bool)

(declare-fun res!1019137 () Bool)

(assert (=> b!1498061 (=> (not res!1019137) (not e!838884))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99883 (_ BitVec 32)) Bool)

(assert (=> b!1498061 (= res!1019137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun res!1019140 () Bool)

(assert (=> start!127502 (=> (not res!1019140) (not e!838884))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127502 (= res!1019140 (validMask!0 mask!2661))))

(assert (=> start!127502 e!838884))

(assert (=> start!127502 true))

(declare-fun array_inv!37229 (array!99883) Bool)

(assert (=> start!127502 (array_inv!37229 a!2850)))

(declare-fun b!1498062 () Bool)

(declare-fun res!1019138 () Bool)

(assert (=> b!1498062 (=> (not res!1019138) (not e!838884))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1498062 (= res!1019138 (and (= (size!48751 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48751 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48751 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498063 () Bool)

(assert (=> b!1498063 (= e!838884 false)))

(declare-fun lt!652603 () Bool)

(declare-datatypes ((List!34693 0))(
  ( (Nil!34690) (Cons!34689 (h!36086 (_ BitVec 64)) (t!49387 List!34693)) )
))
(declare-fun arrayNoDuplicates!0 (array!99883 (_ BitVec 32) List!34693) Bool)

(assert (=> b!1498063 (= lt!652603 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34690))))

(declare-fun b!1498064 () Bool)

(declare-fun res!1019139 () Bool)

(assert (=> b!1498064 (=> (not res!1019139) (not e!838884))))

(assert (=> b!1498064 (= res!1019139 (validKeyInArray!0 (select (arr!48201 a!2850) i!996)))))

(assert (= (and start!127502 res!1019140) b!1498062))

(assert (= (and b!1498062 res!1019138) b!1498064))

(assert (= (and b!1498064 res!1019139) b!1498060))

(assert (= (and b!1498060 res!1019136) b!1498061))

(assert (= (and b!1498061 res!1019137) b!1498063))

(declare-fun m!1381121 () Bool)

(assert (=> b!1498061 m!1381121))

(declare-fun m!1381123 () Bool)

(assert (=> b!1498063 m!1381123))

(declare-fun m!1381125 () Bool)

(assert (=> start!127502 m!1381125))

(declare-fun m!1381127 () Bool)

(assert (=> start!127502 m!1381127))

(declare-fun m!1381129 () Bool)

(assert (=> b!1498064 m!1381129))

(assert (=> b!1498064 m!1381129))

(declare-fun m!1381131 () Bool)

(assert (=> b!1498064 m!1381131))

(declare-fun m!1381133 () Bool)

(assert (=> b!1498060 m!1381133))

(assert (=> b!1498060 m!1381133))

(declare-fun m!1381135 () Bool)

(assert (=> b!1498060 m!1381135))

(check-sat (not start!127502) (not b!1498061) (not b!1498064) (not b!1498063) (not b!1498060))
