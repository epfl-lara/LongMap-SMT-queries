; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118228 () Bool)

(assert start!118228)

(declare-fun b!1383103 () Bool)

(declare-fun res!924696 () Bool)

(declare-fun e!783935 () Bool)

(assert (=> b!1383103 (=> (not res!924696) (not e!783935))))

(declare-datatypes ((array!94531 0))(
  ( (array!94532 (arr!45643 (Array (_ BitVec 32) (_ BitVec 64))) (size!46193 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94531)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383103 (= res!924696 (validKeyInArray!0 (select (arr!45643 a!2938) i!1065)))))

(declare-fun b!1383105 () Bool)

(assert (=> b!1383105 (= e!783935 false)))

(declare-fun lt!608532 () Bool)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94531 (_ BitVec 32)) Bool)

(assert (=> b!1383105 (= lt!608532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!924695 () Bool)

(assert (=> start!118228 (=> (not res!924695) (not e!783935))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118228 (= res!924695 (validMask!0 mask!2987))))

(assert (=> start!118228 e!783935))

(assert (=> start!118228 true))

(declare-fun array_inv!34671 (array!94531) Bool)

(assert (=> start!118228 (array_inv!34671 a!2938)))

(declare-fun b!1383102 () Bool)

(declare-fun res!924694 () Bool)

(assert (=> b!1383102 (=> (not res!924694) (not e!783935))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383102 (= res!924694 (and (= (size!46193 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46193 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46193 a!2938))))))

(declare-fun b!1383104 () Bool)

(declare-fun res!924697 () Bool)

(assert (=> b!1383104 (=> (not res!924697) (not e!783935))))

(declare-datatypes ((List!32171 0))(
  ( (Nil!32168) (Cons!32167 (h!33376 (_ BitVec 64)) (t!46865 List!32171)) )
))
(declare-fun arrayNoDuplicates!0 (array!94531 (_ BitVec 32) List!32171) Bool)

(assert (=> b!1383104 (= res!924697 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32168))))

(assert (= (and start!118228 res!924695) b!1383102))

(assert (= (and b!1383102 res!924694) b!1383103))

(assert (= (and b!1383103 res!924696) b!1383104))

(assert (= (and b!1383104 res!924697) b!1383105))

(declare-fun m!1268205 () Bool)

(assert (=> b!1383103 m!1268205))

(assert (=> b!1383103 m!1268205))

(declare-fun m!1268207 () Bool)

(assert (=> b!1383103 m!1268207))

(declare-fun m!1268209 () Bool)

(assert (=> b!1383105 m!1268209))

(declare-fun m!1268211 () Bool)

(assert (=> start!118228 m!1268211))

(declare-fun m!1268213 () Bool)

(assert (=> start!118228 m!1268213))

(declare-fun m!1268215 () Bool)

(assert (=> b!1383104 m!1268215))

(push 1)

(assert (not b!1383104))

(assert (not start!118228))

(assert (not b!1383103))

(assert (not b!1383105))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

