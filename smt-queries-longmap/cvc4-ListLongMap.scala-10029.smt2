; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118276 () Bool)

(assert start!118276)

(declare-fun b!1383346 () Bool)

(declare-fun res!924981 () Bool)

(declare-fun e!784059 () Bool)

(assert (=> b!1383346 (=> (not res!924981) (not e!784059))))

(declare-datatypes ((array!94532 0))(
  ( (array!94533 (arr!45644 (Array (_ BitVec 32) (_ BitVec 64))) (size!46196 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94532)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383346 (= res!924981 (validKeyInArray!0 (select (arr!45644 a!2938) i!1065)))))

(declare-fun res!924980 () Bool)

(assert (=> start!118276 (=> (not res!924980) (not e!784059))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118276 (= res!924980 (validMask!0 mask!2987))))

(assert (=> start!118276 e!784059))

(assert (=> start!118276 true))

(declare-fun array_inv!34877 (array!94532) Bool)

(assert (=> start!118276 (array_inv!34877 a!2938)))

(declare-fun b!1383348 () Bool)

(assert (=> b!1383348 (= e!784059 false)))

(declare-fun lt!608426 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94532 (_ BitVec 32)) Bool)

(assert (=> b!1383348 (= lt!608426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383347 () Bool)

(declare-fun res!924982 () Bool)

(assert (=> b!1383347 (=> (not res!924982) (not e!784059))))

(declare-datatypes ((List!32250 0))(
  ( (Nil!32247) (Cons!32246 (h!33455 (_ BitVec 64)) (t!46936 List!32250)) )
))
(declare-fun arrayNoDuplicates!0 (array!94532 (_ BitVec 32) List!32250) Bool)

(assert (=> b!1383347 (= res!924982 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32247))))

(declare-fun b!1383345 () Bool)

(declare-fun res!924983 () Bool)

(assert (=> b!1383345 (=> (not res!924983) (not e!784059))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383345 (= res!924983 (and (= (size!46196 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46196 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46196 a!2938))))))

(assert (= (and start!118276 res!924980) b!1383345))

(assert (= (and b!1383345 res!924983) b!1383346))

(assert (= (and b!1383346 res!924981) b!1383347))

(assert (= (and b!1383347 res!924982) b!1383348))

(declare-fun m!1268013 () Bool)

(assert (=> b!1383346 m!1268013))

(assert (=> b!1383346 m!1268013))

(declare-fun m!1268015 () Bool)

(assert (=> b!1383346 m!1268015))

(declare-fun m!1268017 () Bool)

(assert (=> start!118276 m!1268017))

(declare-fun m!1268019 () Bool)

(assert (=> start!118276 m!1268019))

(declare-fun m!1268021 () Bool)

(assert (=> b!1383348 m!1268021))

(declare-fun m!1268023 () Bool)

(assert (=> b!1383347 m!1268023))

(push 1)

(assert (not b!1383346))

(assert (not start!118276))

(assert (not b!1383347))

(assert (not b!1383348))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

