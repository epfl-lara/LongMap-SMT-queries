; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118250 () Bool)

(assert start!118250)

(declare-fun b!1383235 () Bool)

(declare-fun res!924826 () Bool)

(declare-fun e!784000 () Bool)

(assert (=> b!1383235 (=> (not res!924826) (not e!784000))))

(declare-datatypes ((array!94553 0))(
  ( (array!94554 (arr!45654 (Array (_ BitVec 32) (_ BitVec 64))) (size!46204 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94553)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383235 (= res!924826 (validKeyInArray!0 (select (arr!45654 a!2938) i!1065)))))

(declare-fun b!1383234 () Bool)

(declare-fun res!924827 () Bool)

(assert (=> b!1383234 (=> (not res!924827) (not e!784000))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1383234 (= res!924827 (and (= (size!46204 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46204 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46204 a!2938))))))

(declare-fun b!1383237 () Bool)

(assert (=> b!1383237 (= e!784000 false)))

(declare-fun lt!608565 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94553 (_ BitVec 32)) Bool)

(assert (=> b!1383237 (= lt!608565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383236 () Bool)

(declare-fun res!924829 () Bool)

(assert (=> b!1383236 (=> (not res!924829) (not e!784000))))

(declare-datatypes ((List!32182 0))(
  ( (Nil!32179) (Cons!32178 (h!33387 (_ BitVec 64)) (t!46876 List!32182)) )
))
(declare-fun arrayNoDuplicates!0 (array!94553 (_ BitVec 32) List!32182) Bool)

(assert (=> b!1383236 (= res!924829 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32179))))

(declare-fun res!924828 () Bool)

(assert (=> start!118250 (=> (not res!924828) (not e!784000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118250 (= res!924828 (validMask!0 mask!2987))))

(assert (=> start!118250 e!784000))

(assert (=> start!118250 true))

(declare-fun array_inv!34682 (array!94553) Bool)

(assert (=> start!118250 (array_inv!34682 a!2938)))

(assert (= (and start!118250 res!924828) b!1383234))

(assert (= (and b!1383234 res!924827) b!1383235))

(assert (= (and b!1383235 res!924826) b!1383236))

(assert (= (and b!1383236 res!924829) b!1383237))

(declare-fun m!1268337 () Bool)

(assert (=> b!1383235 m!1268337))

(assert (=> b!1383235 m!1268337))

(declare-fun m!1268339 () Bool)

(assert (=> b!1383235 m!1268339))

(declare-fun m!1268341 () Bool)

(assert (=> b!1383237 m!1268341))

(declare-fun m!1268343 () Bool)

(assert (=> b!1383236 m!1268343))

(declare-fun m!1268345 () Bool)

(assert (=> start!118250 m!1268345))

(declare-fun m!1268347 () Bool)

(assert (=> start!118250 m!1268347))

(check-sat (not b!1383235) (not start!118250) (not b!1383236) (not b!1383237))
