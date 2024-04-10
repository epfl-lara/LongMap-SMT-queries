; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118238 () Bool)

(assert start!118238)

(declare-fun res!924756 () Bool)

(declare-fun e!783965 () Bool)

(assert (=> start!118238 (=> (not res!924756) (not e!783965))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118238 (= res!924756 (validMask!0 mask!2987))))

(assert (=> start!118238 e!783965))

(assert (=> start!118238 true))

(declare-datatypes ((array!94541 0))(
  ( (array!94542 (arr!45648 (Array (_ BitVec 32) (_ BitVec 64))) (size!46198 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94541)

(declare-fun array_inv!34676 (array!94541) Bool)

(assert (=> start!118238 (array_inv!34676 a!2938)))

(declare-fun b!1383164 () Bool)

(declare-fun res!924757 () Bool)

(assert (=> b!1383164 (=> (not res!924757) (not e!783965))))

(declare-datatypes ((List!32176 0))(
  ( (Nil!32173) (Cons!32172 (h!33381 (_ BitVec 64)) (t!46870 List!32176)) )
))
(declare-fun arrayNoDuplicates!0 (array!94541 (_ BitVec 32) List!32176) Bool)

(assert (=> b!1383164 (= res!924757 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32173))))

(declare-fun b!1383163 () Bool)

(declare-fun res!924754 () Bool)

(assert (=> b!1383163 (=> (not res!924754) (not e!783965))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383163 (= res!924754 (validKeyInArray!0 (select (arr!45648 a!2938) i!1065)))))

(declare-fun b!1383165 () Bool)

(assert (=> b!1383165 (= e!783965 false)))

(declare-fun lt!608547 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94541 (_ BitVec 32)) Bool)

(assert (=> b!1383165 (= lt!608547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383162 () Bool)

(declare-fun res!924755 () Bool)

(assert (=> b!1383162 (=> (not res!924755) (not e!783965))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383162 (= res!924755 (and (= (size!46198 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46198 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46198 a!2938))))))

(assert (= (and start!118238 res!924756) b!1383162))

(assert (= (and b!1383162 res!924755) b!1383163))

(assert (= (and b!1383163 res!924754) b!1383164))

(assert (= (and b!1383164 res!924757) b!1383165))

(declare-fun m!1268265 () Bool)

(assert (=> start!118238 m!1268265))

(declare-fun m!1268267 () Bool)

(assert (=> start!118238 m!1268267))

(declare-fun m!1268269 () Bool)

(assert (=> b!1383164 m!1268269))

(declare-fun m!1268271 () Bool)

(assert (=> b!1383163 m!1268271))

(assert (=> b!1383163 m!1268271))

(declare-fun m!1268273 () Bool)

(assert (=> b!1383163 m!1268273))

(declare-fun m!1268275 () Bool)

(assert (=> b!1383165 m!1268275))

(check-sat (not b!1383163) (not b!1383165) (not start!118238) (not b!1383164))
