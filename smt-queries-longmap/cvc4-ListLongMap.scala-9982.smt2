; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117902 () Bool)

(assert start!117902)

(declare-fun res!923123 () Bool)

(declare-fun e!783118 () Bool)

(assert (=> start!117902 (=> (not res!923123) (not e!783118))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117902 (= res!923123 (validMask!0 mask!3034))))

(assert (=> start!117902 e!783118))

(assert (=> start!117902 true))

(declare-datatypes ((array!94293 0))(
  ( (array!94294 (arr!45529 (Array (_ BitVec 32) (_ BitVec 64))) (size!46079 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94293)

(declare-fun array_inv!34557 (array!94293) Bool)

(assert (=> start!117902 (array_inv!34557 a!2971)))

(declare-fun b!1381495 () Bool)

(declare-fun res!923124 () Bool)

(assert (=> b!1381495 (=> (not res!923124) (not e!783118))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381495 (= res!923124 (and (= (size!46079 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46079 a!2971))))))

(declare-fun b!1381496 () Bool)

(declare-fun res!923125 () Bool)

(assert (=> b!1381496 (=> (not res!923125) (not e!783118))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381496 (= res!923125 (validKeyInArray!0 (select (arr!45529 a!2971) i!1094)))))

(declare-fun b!1381497 () Bool)

(assert (=> b!1381497 (= e!783118 false)))

(declare-fun lt!608223 () Bool)

(declare-datatypes ((List!32063 0))(
  ( (Nil!32060) (Cons!32059 (h!33268 (_ BitVec 64)) (t!46757 List!32063)) )
))
(declare-fun arrayNoDuplicates!0 (array!94293 (_ BitVec 32) List!32063) Bool)

(assert (=> b!1381497 (= lt!608223 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32060))))

(assert (= (and start!117902 res!923123) b!1381495))

(assert (= (and b!1381495 res!923124) b!1381496))

(assert (= (and b!1381496 res!923125) b!1381497))

(declare-fun m!1266683 () Bool)

(assert (=> start!117902 m!1266683))

(declare-fun m!1266685 () Bool)

(assert (=> start!117902 m!1266685))

(declare-fun m!1266687 () Bool)

(assert (=> b!1381496 m!1266687))

(assert (=> b!1381496 m!1266687))

(declare-fun m!1266689 () Bool)

(assert (=> b!1381496 m!1266689))

(declare-fun m!1266691 () Bool)

(assert (=> b!1381497 m!1266691))

(push 1)

(assert (not b!1381496))

(assert (not b!1381497))

(assert (not start!117902))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

