; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118458 () Bool)

(assert start!118458)

(declare-fun b!1385295 () Bool)

(declare-fun e!784920 () Bool)

(assert (=> b!1385295 (= e!784920 false)))

(declare-fun lt!609041 () Bool)

(declare-datatypes ((array!94687 0))(
  ( (array!94688 (arr!45720 (Array (_ BitVec 32) (_ BitVec 64))) (size!46272 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94687)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94687 (_ BitVec 32)) Bool)

(assert (=> b!1385295 (= lt!609041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385292 () Bool)

(declare-fun res!926586 () Bool)

(assert (=> b!1385292 (=> (not res!926586) (not e!784920))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1385292 (= res!926586 (and (= (size!46272 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46272 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46272 a!2938))))))

(declare-fun res!926587 () Bool)

(assert (=> start!118458 (=> (not res!926587) (not e!784920))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118458 (= res!926587 (validMask!0 mask!2987))))

(assert (=> start!118458 e!784920))

(assert (=> start!118458 true))

(declare-fun array_inv!34953 (array!94687) Bool)

(assert (=> start!118458 (array_inv!34953 a!2938)))

(declare-fun b!1385294 () Bool)

(declare-fun res!926588 () Bool)

(assert (=> b!1385294 (=> (not res!926588) (not e!784920))))

(declare-datatypes ((List!32326 0))(
  ( (Nil!32323) (Cons!32322 (h!33531 (_ BitVec 64)) (t!47012 List!32326)) )
))
(declare-fun arrayNoDuplicates!0 (array!94687 (_ BitVec 32) List!32326) Bool)

(assert (=> b!1385294 (= res!926588 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32323))))

(declare-fun b!1385293 () Bool)

(declare-fun res!926585 () Bool)

(assert (=> b!1385293 (=> (not res!926585) (not e!784920))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385293 (= res!926585 (validKeyInArray!0 (select (arr!45720 a!2938) i!1065)))))

(assert (= (and start!118458 res!926587) b!1385292))

(assert (= (and b!1385292 res!926586) b!1385293))

(assert (= (and b!1385293 res!926585) b!1385294))

(assert (= (and b!1385294 res!926588) b!1385295))

(declare-fun m!1270149 () Bool)

(assert (=> b!1385295 m!1270149))

(declare-fun m!1270151 () Bool)

(assert (=> start!118458 m!1270151))

(declare-fun m!1270153 () Bool)

(assert (=> start!118458 m!1270153))

(declare-fun m!1270155 () Bool)

(assert (=> b!1385294 m!1270155))

(declare-fun m!1270157 () Bool)

(assert (=> b!1385293 m!1270157))

(assert (=> b!1385293 m!1270157))

(declare-fun m!1270159 () Bool)

(assert (=> b!1385293 m!1270159))

(push 1)

(assert (not b!1385295))

(assert (not start!118458))

(assert (not b!1385294))

(assert (not b!1385293))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

