; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118208 () Bool)

(assert start!118208)

(declare-fun res!924579 () Bool)

(declare-fun e!783875 () Bool)

(assert (=> start!118208 (=> (not res!924579) (not e!783875))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118208 (= res!924579 (validMask!0 mask!2987))))

(assert (=> start!118208 e!783875))

(assert (=> start!118208 true))

(declare-datatypes ((array!94511 0))(
  ( (array!94512 (arr!45633 (Array (_ BitVec 32) (_ BitVec 64))) (size!46183 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94511)

(declare-fun array_inv!34661 (array!94511) Bool)

(assert (=> start!118208 (array_inv!34661 a!2938)))

(declare-fun b!1382986 () Bool)

(declare-fun res!924578 () Bool)

(assert (=> b!1382986 (=> (not res!924578) (not e!783875))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1382986 (= res!924578 (and (= (size!46183 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46183 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46183 a!2938))))))

(declare-fun b!1382987 () Bool)

(declare-fun res!924580 () Bool)

(assert (=> b!1382987 (=> (not res!924580) (not e!783875))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382987 (= res!924580 (validKeyInArray!0 (select (arr!45633 a!2938) i!1065)))))

(declare-fun b!1382988 () Bool)

(assert (=> b!1382988 (= e!783875 false)))

(declare-fun lt!608511 () Bool)

(declare-datatypes ((List!32161 0))(
  ( (Nil!32158) (Cons!32157 (h!33366 (_ BitVec 64)) (t!46855 List!32161)) )
))
(declare-fun arrayNoDuplicates!0 (array!94511 (_ BitVec 32) List!32161) Bool)

(assert (=> b!1382988 (= lt!608511 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32158))))

(assert (= (and start!118208 res!924579) b!1382986))

(assert (= (and b!1382986 res!924578) b!1382987))

(assert (= (and b!1382987 res!924580) b!1382988))

(declare-fun m!1268095 () Bool)

(assert (=> start!118208 m!1268095))

(declare-fun m!1268097 () Bool)

(assert (=> start!118208 m!1268097))

(declare-fun m!1268099 () Bool)

(assert (=> b!1382987 m!1268099))

(assert (=> b!1382987 m!1268099))

(declare-fun m!1268101 () Bool)

(assert (=> b!1382987 m!1268101))

(declare-fun m!1268103 () Bool)

(assert (=> b!1382988 m!1268103))

(check-sat (not b!1382988) (not start!118208) (not b!1382987))
