; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118268 () Bool)

(assert start!118268)

(declare-fun b!1383342 () Bool)

(declare-fun res!924937 () Bool)

(declare-fun e!784055 () Bool)

(assert (=> b!1383342 (=> (not res!924937) (not e!784055))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94571 0))(
  ( (array!94572 (arr!45663 (Array (_ BitVec 32) (_ BitVec 64))) (size!46213 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94571)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1383342 (= res!924937 (and (= (size!46213 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46213 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46213 a!2938))))))

(declare-fun b!1383343 () Bool)

(declare-fun res!924934 () Bool)

(assert (=> b!1383343 (=> (not res!924934) (not e!784055))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383343 (= res!924934 (validKeyInArray!0 (select (arr!45663 a!2938) i!1065)))))

(declare-fun b!1383344 () Bool)

(declare-fun res!924936 () Bool)

(assert (=> b!1383344 (=> (not res!924936) (not e!784055))))

(declare-datatypes ((List!32191 0))(
  ( (Nil!32188) (Cons!32187 (h!33396 (_ BitVec 64)) (t!46885 List!32191)) )
))
(declare-fun arrayNoDuplicates!0 (array!94571 (_ BitVec 32) List!32191) Bool)

(assert (=> b!1383344 (= res!924936 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32188))))

(declare-fun b!1383345 () Bool)

(assert (=> b!1383345 (= e!784055 false)))

(declare-fun lt!608592 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94571 (_ BitVec 32)) Bool)

(assert (=> b!1383345 (= lt!608592 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!924935 () Bool)

(assert (=> start!118268 (=> (not res!924935) (not e!784055))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118268 (= res!924935 (validMask!0 mask!2987))))

(assert (=> start!118268 e!784055))

(assert (=> start!118268 true))

(declare-fun array_inv!34691 (array!94571) Bool)

(assert (=> start!118268 (array_inv!34691 a!2938)))

(assert (= (and start!118268 res!924935) b!1383342))

(assert (= (and b!1383342 res!924937) b!1383343))

(assert (= (and b!1383343 res!924934) b!1383344))

(assert (= (and b!1383344 res!924936) b!1383345))

(declare-fun m!1268445 () Bool)

(assert (=> b!1383343 m!1268445))

(assert (=> b!1383343 m!1268445))

(declare-fun m!1268447 () Bool)

(assert (=> b!1383343 m!1268447))

(declare-fun m!1268449 () Bool)

(assert (=> b!1383344 m!1268449))

(declare-fun m!1268451 () Bool)

(assert (=> b!1383345 m!1268451))

(declare-fun m!1268453 () Bool)

(assert (=> start!118268 m!1268453))

(declare-fun m!1268455 () Bool)

(assert (=> start!118268 m!1268455))

(check-sat (not b!1383345) (not b!1383343) (not start!118268) (not b!1383344))
