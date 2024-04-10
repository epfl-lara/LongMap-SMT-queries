; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118260 () Bool)

(assert start!118260)

(declare-fun res!924886 () Bool)

(declare-fun e!784030 () Bool)

(assert (=> start!118260 (=> (not res!924886) (not e!784030))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118260 (= res!924886 (validMask!0 mask!2987))))

(assert (=> start!118260 e!784030))

(assert (=> start!118260 true))

(declare-datatypes ((array!94563 0))(
  ( (array!94564 (arr!45659 (Array (_ BitVec 32) (_ BitVec 64))) (size!46209 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94563)

(declare-fun array_inv!34687 (array!94563) Bool)

(assert (=> start!118260 (array_inv!34687 a!2938)))

(declare-fun b!1383297 () Bool)

(assert (=> b!1383297 (= e!784030 false)))

(declare-fun lt!608580 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94563 (_ BitVec 32)) Bool)

(assert (=> b!1383297 (= lt!608580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383296 () Bool)

(declare-fun res!924887 () Bool)

(assert (=> b!1383296 (=> (not res!924887) (not e!784030))))

(declare-datatypes ((List!32187 0))(
  ( (Nil!32184) (Cons!32183 (h!33392 (_ BitVec 64)) (t!46881 List!32187)) )
))
(declare-fun arrayNoDuplicates!0 (array!94563 (_ BitVec 32) List!32187) Bool)

(assert (=> b!1383296 (= res!924887 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32184))))

(declare-fun b!1383294 () Bool)

(declare-fun res!924888 () Bool)

(assert (=> b!1383294 (=> (not res!924888) (not e!784030))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383294 (= res!924888 (and (= (size!46209 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46209 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46209 a!2938))))))

(declare-fun b!1383295 () Bool)

(declare-fun res!924889 () Bool)

(assert (=> b!1383295 (=> (not res!924889) (not e!784030))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383295 (= res!924889 (validKeyInArray!0 (select (arr!45659 a!2938) i!1065)))))

(assert (= (and start!118260 res!924886) b!1383294))

(assert (= (and b!1383294 res!924888) b!1383295))

(assert (= (and b!1383295 res!924889) b!1383296))

(assert (= (and b!1383296 res!924887) b!1383297))

(declare-fun m!1268397 () Bool)

(assert (=> start!118260 m!1268397))

(declare-fun m!1268399 () Bool)

(assert (=> start!118260 m!1268399))

(declare-fun m!1268401 () Bool)

(assert (=> b!1383297 m!1268401))

(declare-fun m!1268403 () Bool)

(assert (=> b!1383296 m!1268403))

(declare-fun m!1268405 () Bool)

(assert (=> b!1383295 m!1268405))

(assert (=> b!1383295 m!1268405))

(declare-fun m!1268407 () Bool)

(assert (=> b!1383295 m!1268407))

(push 1)

(assert (not b!1383296))

(assert (not start!118260))

(assert (not b!1383297))

(assert (not b!1383295))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

