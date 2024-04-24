; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118440 () Bool)

(assert start!118440)

(declare-fun b!1384410 () Bool)

(declare-fun res!925216 () Bool)

(declare-fun e!784783 () Bool)

(assert (=> b!1384410 (=> (not res!925216) (not e!784783))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94641 0))(
  ( (array!94642 (arr!45696 (Array (_ BitVec 32) (_ BitVec 64))) (size!46247 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94641)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1384410 (= res!925216 (and (= (size!46247 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46247 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46247 a!2938))))))

(declare-fun b!1384411 () Bool)

(declare-fun res!925214 () Bool)

(assert (=> b!1384411 (=> (not res!925214) (not e!784783))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384411 (= res!925214 (validKeyInArray!0 (select (arr!45696 a!2938) i!1065)))))

(declare-fun b!1384412 () Bool)

(declare-fun res!925215 () Bool)

(assert (=> b!1384412 (=> (not res!925215) (not e!784783))))

(declare-datatypes ((List!32211 0))(
  ( (Nil!32208) (Cons!32207 (h!33425 (_ BitVec 64)) (t!46897 List!32211)) )
))
(declare-fun arrayNoDuplicates!0 (array!94641 (_ BitVec 32) List!32211) Bool)

(assert (=> b!1384412 (= res!925215 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32208))))

(declare-fun b!1384413 () Bool)

(assert (=> b!1384413 (= e!784783 false)))

(declare-fun lt!609012 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94641 (_ BitVec 32)) Bool)

(assert (=> b!1384413 (= lt!609012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!925213 () Bool)

(assert (=> start!118440 (=> (not res!925213) (not e!784783))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118440 (= res!925213 (validMask!0 mask!2987))))

(assert (=> start!118440 e!784783))

(assert (=> start!118440 true))

(declare-fun array_inv!34977 (array!94641) Bool)

(assert (=> start!118440 (array_inv!34977 a!2938)))

(assert (= (and start!118440 res!925213) b!1384410))

(assert (= (and b!1384410 res!925216) b!1384411))

(assert (= (and b!1384411 res!925214) b!1384412))

(assert (= (and b!1384412 res!925215) b!1384413))

(declare-fun m!1269837 () Bool)

(assert (=> b!1384411 m!1269837))

(assert (=> b!1384411 m!1269837))

(declare-fun m!1269839 () Bool)

(assert (=> b!1384411 m!1269839))

(declare-fun m!1269841 () Bool)

(assert (=> b!1384412 m!1269841))

(declare-fun m!1269843 () Bool)

(assert (=> b!1384413 m!1269843))

(declare-fun m!1269845 () Bool)

(assert (=> start!118440 m!1269845))

(declare-fun m!1269847 () Bool)

(assert (=> start!118440 m!1269847))

(push 1)

(assert (not b!1384413))

(assert (not start!118440))

(assert (not b!1384412))

(assert (not b!1384411))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

