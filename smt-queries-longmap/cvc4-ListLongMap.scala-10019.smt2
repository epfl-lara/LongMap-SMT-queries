; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118222 () Bool)

(assert start!118222)

(declare-fun b!1383067 () Bool)

(declare-fun res!924661 () Bool)

(declare-fun e!783916 () Bool)

(assert (=> b!1383067 (=> (not res!924661) (not e!783916))))

(declare-datatypes ((array!94525 0))(
  ( (array!94526 (arr!45640 (Array (_ BitVec 32) (_ BitVec 64))) (size!46190 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94525)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383067 (= res!924661 (validKeyInArray!0 (select (arr!45640 a!2938) i!1065)))))

(declare-fun res!924659 () Bool)

(assert (=> start!118222 (=> (not res!924659) (not e!783916))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118222 (= res!924659 (validMask!0 mask!2987))))

(assert (=> start!118222 e!783916))

(assert (=> start!118222 true))

(declare-fun array_inv!34668 (array!94525) Bool)

(assert (=> start!118222 (array_inv!34668 a!2938)))

(declare-fun b!1383066 () Bool)

(declare-fun res!924658 () Bool)

(assert (=> b!1383066 (=> (not res!924658) (not e!783916))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383066 (= res!924658 (and (= (size!46190 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46190 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46190 a!2938))))))

(declare-fun b!1383069 () Bool)

(assert (=> b!1383069 (= e!783916 false)))

(declare-fun lt!608523 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94525 (_ BitVec 32)) Bool)

(assert (=> b!1383069 (= lt!608523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383068 () Bool)

(declare-fun res!924660 () Bool)

(assert (=> b!1383068 (=> (not res!924660) (not e!783916))))

(declare-datatypes ((List!32168 0))(
  ( (Nil!32165) (Cons!32164 (h!33373 (_ BitVec 64)) (t!46862 List!32168)) )
))
(declare-fun arrayNoDuplicates!0 (array!94525 (_ BitVec 32) List!32168) Bool)

(assert (=> b!1383068 (= res!924660 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32165))))

(assert (= (and start!118222 res!924659) b!1383066))

(assert (= (and b!1383066 res!924658) b!1383067))

(assert (= (and b!1383067 res!924661) b!1383068))

(assert (= (and b!1383068 res!924660) b!1383069))

(declare-fun m!1268169 () Bool)

(assert (=> b!1383067 m!1268169))

(assert (=> b!1383067 m!1268169))

(declare-fun m!1268171 () Bool)

(assert (=> b!1383067 m!1268171))

(declare-fun m!1268173 () Bool)

(assert (=> start!118222 m!1268173))

(declare-fun m!1268175 () Bool)

(assert (=> start!118222 m!1268175))

(declare-fun m!1268177 () Bool)

(assert (=> b!1383069 m!1268177))

(declare-fun m!1268179 () Bool)

(assert (=> b!1383068 m!1268179))

(push 1)

(assert (not b!1383067))

(assert (not start!118222))

(assert (not b!1383068))

(assert (not b!1383069))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

