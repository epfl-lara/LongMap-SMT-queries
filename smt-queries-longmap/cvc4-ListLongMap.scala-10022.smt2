; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118240 () Bool)

(assert start!118240)

(declare-fun b!1383175 () Bool)

(declare-fun res!924769 () Bool)

(declare-fun e!783971 () Bool)

(assert (=> b!1383175 (=> (not res!924769) (not e!783971))))

(declare-datatypes ((array!94543 0))(
  ( (array!94544 (arr!45649 (Array (_ BitVec 32) (_ BitVec 64))) (size!46199 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94543)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383175 (= res!924769 (validKeyInArray!0 (select (arr!45649 a!2938) i!1065)))))

(declare-fun b!1383174 () Bool)

(declare-fun res!924768 () Bool)

(assert (=> b!1383174 (=> (not res!924768) (not e!783971))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1383174 (= res!924768 (and (= (size!46199 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46199 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46199 a!2938))))))

(declare-fun b!1383176 () Bool)

(declare-fun res!924766 () Bool)

(assert (=> b!1383176 (=> (not res!924766) (not e!783971))))

(declare-datatypes ((List!32177 0))(
  ( (Nil!32174) (Cons!32173 (h!33382 (_ BitVec 64)) (t!46871 List!32177)) )
))
(declare-fun arrayNoDuplicates!0 (array!94543 (_ BitVec 32) List!32177) Bool)

(assert (=> b!1383176 (= res!924766 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32174))))

(declare-fun res!924767 () Bool)

(assert (=> start!118240 (=> (not res!924767) (not e!783971))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118240 (= res!924767 (validMask!0 mask!2987))))

(assert (=> start!118240 e!783971))

(assert (=> start!118240 true))

(declare-fun array_inv!34677 (array!94543) Bool)

(assert (=> start!118240 (array_inv!34677 a!2938)))

(declare-fun b!1383177 () Bool)

(assert (=> b!1383177 (= e!783971 false)))

(declare-fun lt!608550 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94543 (_ BitVec 32)) Bool)

(assert (=> b!1383177 (= lt!608550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(assert (= (and start!118240 res!924767) b!1383174))

(assert (= (and b!1383174 res!924768) b!1383175))

(assert (= (and b!1383175 res!924769) b!1383176))

(assert (= (and b!1383176 res!924766) b!1383177))

(declare-fun m!1268277 () Bool)

(assert (=> b!1383175 m!1268277))

(assert (=> b!1383175 m!1268277))

(declare-fun m!1268279 () Bool)

(assert (=> b!1383175 m!1268279))

(declare-fun m!1268281 () Bool)

(assert (=> b!1383176 m!1268281))

(declare-fun m!1268283 () Bool)

(assert (=> start!118240 m!1268283))

(declare-fun m!1268285 () Bool)

(assert (=> start!118240 m!1268285))

(declare-fun m!1268287 () Bool)

(assert (=> b!1383177 m!1268287))

(push 1)

(assert (not b!1383177))

(assert (not start!118240))

(assert (not b!1383175))

(assert (not b!1383176))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

