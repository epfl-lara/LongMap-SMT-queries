; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118220 () Bool)

(assert start!118220)

(declare-fun b!1383054 () Bool)

(declare-fun res!924646 () Bool)

(declare-fun e!783911 () Bool)

(assert (=> b!1383054 (=> (not res!924646) (not e!783911))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94523 0))(
  ( (array!94524 (arr!45639 (Array (_ BitVec 32) (_ BitVec 64))) (size!46189 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94523)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1383054 (= res!924646 (and (= (size!46189 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46189 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46189 a!2938))))))

(declare-fun res!924648 () Bool)

(assert (=> start!118220 (=> (not res!924648) (not e!783911))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118220 (= res!924648 (validMask!0 mask!2987))))

(assert (=> start!118220 e!783911))

(assert (=> start!118220 true))

(declare-fun array_inv!34667 (array!94523) Bool)

(assert (=> start!118220 (array_inv!34667 a!2938)))

(declare-fun b!1383057 () Bool)

(assert (=> b!1383057 (= e!783911 false)))

(declare-fun lt!608520 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94523 (_ BitVec 32)) Bool)

(assert (=> b!1383057 (= lt!608520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383056 () Bool)

(declare-fun res!924649 () Bool)

(assert (=> b!1383056 (=> (not res!924649) (not e!783911))))

(declare-datatypes ((List!32167 0))(
  ( (Nil!32164) (Cons!32163 (h!33372 (_ BitVec 64)) (t!46861 List!32167)) )
))
(declare-fun arrayNoDuplicates!0 (array!94523 (_ BitVec 32) List!32167) Bool)

(assert (=> b!1383056 (= res!924649 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32164))))

(declare-fun b!1383055 () Bool)

(declare-fun res!924647 () Bool)

(assert (=> b!1383055 (=> (not res!924647) (not e!783911))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383055 (= res!924647 (validKeyInArray!0 (select (arr!45639 a!2938) i!1065)))))

(assert (= (and start!118220 res!924648) b!1383054))

(assert (= (and b!1383054 res!924646) b!1383055))

(assert (= (and b!1383055 res!924647) b!1383056))

(assert (= (and b!1383056 res!924649) b!1383057))

(declare-fun m!1268157 () Bool)

(assert (=> start!118220 m!1268157))

(declare-fun m!1268159 () Bool)

(assert (=> start!118220 m!1268159))

(declare-fun m!1268161 () Bool)

(assert (=> b!1383057 m!1268161))

(declare-fun m!1268163 () Bool)

(assert (=> b!1383056 m!1268163))

(declare-fun m!1268165 () Bool)

(assert (=> b!1383055 m!1268165))

(assert (=> b!1383055 m!1268165))

(declare-fun m!1268167 () Bool)

(assert (=> b!1383055 m!1268167))

(check-sat (not b!1383057) (not b!1383055) (not start!118220) (not b!1383056))
