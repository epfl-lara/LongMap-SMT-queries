; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118226 () Bool)

(assert start!118226)

(declare-fun res!924684 () Bool)

(declare-fun e!783928 () Bool)

(assert (=> start!118226 (=> (not res!924684) (not e!783928))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118226 (= res!924684 (validMask!0 mask!2987))))

(assert (=> start!118226 e!783928))

(assert (=> start!118226 true))

(declare-datatypes ((array!94529 0))(
  ( (array!94530 (arr!45642 (Array (_ BitVec 32) (_ BitVec 64))) (size!46192 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94529)

(declare-fun array_inv!34670 (array!94529) Bool)

(assert (=> start!118226 (array_inv!34670 a!2938)))

(declare-fun b!1383092 () Bool)

(declare-fun res!924682 () Bool)

(assert (=> b!1383092 (=> (not res!924682) (not e!783928))))

(declare-datatypes ((List!32170 0))(
  ( (Nil!32167) (Cons!32166 (h!33375 (_ BitVec 64)) (t!46864 List!32170)) )
))
(declare-fun arrayNoDuplicates!0 (array!94529 (_ BitVec 32) List!32170) Bool)

(assert (=> b!1383092 (= res!924682 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32167))))

(declare-fun b!1383091 () Bool)

(declare-fun res!924685 () Bool)

(assert (=> b!1383091 (=> (not res!924685) (not e!783928))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383091 (= res!924685 (validKeyInArray!0 (select (arr!45642 a!2938) i!1065)))))

(declare-fun b!1383093 () Bool)

(assert (=> b!1383093 (= e!783928 false)))

(declare-fun lt!608529 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94529 (_ BitVec 32)) Bool)

(assert (=> b!1383093 (= lt!608529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383090 () Bool)

(declare-fun res!924683 () Bool)

(assert (=> b!1383090 (=> (not res!924683) (not e!783928))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383090 (= res!924683 (and (= (size!46192 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46192 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46192 a!2938))))))

(assert (= (and start!118226 res!924684) b!1383090))

(assert (= (and b!1383090 res!924683) b!1383091))

(assert (= (and b!1383091 res!924685) b!1383092))

(assert (= (and b!1383092 res!924682) b!1383093))

(declare-fun m!1268193 () Bool)

(assert (=> start!118226 m!1268193))

(declare-fun m!1268195 () Bool)

(assert (=> start!118226 m!1268195))

(declare-fun m!1268197 () Bool)

(assert (=> b!1383092 m!1268197))

(declare-fun m!1268199 () Bool)

(assert (=> b!1383091 m!1268199))

(assert (=> b!1383091 m!1268199))

(declare-fun m!1268201 () Bool)

(assert (=> b!1383091 m!1268201))

(declare-fun m!1268203 () Bool)

(assert (=> b!1383093 m!1268203))

(check-sat (not b!1383093) (not start!118226) (not b!1383092) (not b!1383091))
