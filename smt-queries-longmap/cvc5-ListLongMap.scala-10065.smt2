; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118524 () Bool)

(assert start!118524)

(declare-fun b!1385761 () Bool)

(declare-fun res!927013 () Bool)

(declare-fun e!785137 () Bool)

(assert (=> b!1385761 (=> (not res!927013) (not e!785137))))

(declare-datatypes ((array!94800 0))(
  ( (array!94801 (arr!45776 (Array (_ BitVec 32) (_ BitVec 64))) (size!46326 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94800)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385761 (= res!927013 (validKeyInArray!0 (select (arr!45776 a!2938) i!1065)))))

(declare-fun b!1385760 () Bool)

(declare-fun res!927010 () Bool)

(assert (=> b!1385760 (=> (not res!927010) (not e!785137))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1385760 (= res!927010 (and (= (size!46326 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46326 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46326 a!2938))))))

(declare-fun b!1385762 () Bool)

(declare-fun res!927011 () Bool)

(assert (=> b!1385762 (=> (not res!927011) (not e!785137))))

(declare-datatypes ((List!32304 0))(
  ( (Nil!32301) (Cons!32300 (h!33509 (_ BitVec 64)) (t!46998 List!32304)) )
))
(declare-fun arrayNoDuplicates!0 (array!94800 (_ BitVec 32) List!32304) Bool)

(assert (=> b!1385762 (= res!927011 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32301))))

(declare-fun b!1385763 () Bool)

(assert (=> b!1385763 (= e!785137 false)))

(declare-fun lt!609309 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94800 (_ BitVec 32)) Bool)

(assert (=> b!1385763 (= lt!609309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!927012 () Bool)

(assert (=> start!118524 (=> (not res!927012) (not e!785137))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118524 (= res!927012 (validMask!0 mask!2987))))

(assert (=> start!118524 e!785137))

(assert (=> start!118524 true))

(declare-fun array_inv!34804 (array!94800) Bool)

(assert (=> start!118524 (array_inv!34804 a!2938)))

(assert (= (and start!118524 res!927012) b!1385760))

(assert (= (and b!1385760 res!927010) b!1385761))

(assert (= (and b!1385761 res!927013) b!1385762))

(assert (= (and b!1385762 res!927011) b!1385763))

(declare-fun m!1271037 () Bool)

(assert (=> b!1385761 m!1271037))

(assert (=> b!1385761 m!1271037))

(declare-fun m!1271039 () Bool)

(assert (=> b!1385761 m!1271039))

(declare-fun m!1271041 () Bool)

(assert (=> b!1385762 m!1271041))

(declare-fun m!1271043 () Bool)

(assert (=> b!1385763 m!1271043))

(declare-fun m!1271045 () Bool)

(assert (=> start!118524 m!1271045))

(declare-fun m!1271047 () Bool)

(assert (=> start!118524 m!1271047))

(push 1)

(assert (not b!1385761))

(assert (not b!1385762))

(assert (not start!118524))

(assert (not b!1385763))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

