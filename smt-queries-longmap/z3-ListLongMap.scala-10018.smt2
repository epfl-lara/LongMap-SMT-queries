; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118424 () Bool)

(assert start!118424)

(declare-fun b!1384315 () Bool)

(declare-fun res!925117 () Bool)

(declare-fun e!784735 () Bool)

(assert (=> b!1384315 (=> (not res!925117) (not e!784735))))

(declare-datatypes ((array!94625 0))(
  ( (array!94626 (arr!45688 (Array (_ BitVec 32) (_ BitVec 64))) (size!46239 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94625)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384315 (= res!925117 (validKeyInArray!0 (select (arr!45688 a!2938) i!1065)))))

(declare-fun b!1384314 () Bool)

(declare-fun res!925119 () Bool)

(assert (=> b!1384314 (=> (not res!925119) (not e!784735))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1384314 (= res!925119 (and (= (size!46239 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46239 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46239 a!2938))))))

(declare-fun res!925118 () Bool)

(assert (=> start!118424 (=> (not res!925118) (not e!784735))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118424 (= res!925118 (validMask!0 mask!2987))))

(assert (=> start!118424 e!784735))

(assert (=> start!118424 true))

(declare-fun array_inv!34969 (array!94625) Bool)

(assert (=> start!118424 (array_inv!34969 a!2938)))

(declare-fun b!1384317 () Bool)

(assert (=> b!1384317 (= e!784735 (bvsgt #b00000000000000000000000000000000 (size!46239 a!2938)))))

(declare-fun b!1384316 () Bool)

(declare-fun res!925120 () Bool)

(assert (=> b!1384316 (=> (not res!925120) (not e!784735))))

(declare-datatypes ((List!32203 0))(
  ( (Nil!32200) (Cons!32199 (h!33417 (_ BitVec 64)) (t!46889 List!32203)) )
))
(declare-fun arrayNoDuplicates!0 (array!94625 (_ BitVec 32) List!32203) Bool)

(assert (=> b!1384316 (= res!925120 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32200))))

(assert (= (and start!118424 res!925118) b!1384314))

(assert (= (and b!1384314 res!925119) b!1384315))

(assert (= (and b!1384315 res!925117) b!1384316))

(assert (= (and b!1384316 res!925120) b!1384317))

(declare-fun m!1269747 () Bool)

(assert (=> b!1384315 m!1269747))

(assert (=> b!1384315 m!1269747))

(declare-fun m!1269749 () Bool)

(assert (=> b!1384315 m!1269749))

(declare-fun m!1269751 () Bool)

(assert (=> start!118424 m!1269751))

(declare-fun m!1269753 () Bool)

(assert (=> start!118424 m!1269753))

(declare-fun m!1269755 () Bool)

(assert (=> b!1384316 m!1269755))

(check-sat (not start!118424) (not b!1384315) (not b!1384316))
(check-sat)
