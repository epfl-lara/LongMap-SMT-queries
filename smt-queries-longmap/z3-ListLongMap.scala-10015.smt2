; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118196 () Bool)

(assert start!118196)

(declare-fun res!924524 () Bool)

(declare-fun e!783838 () Bool)

(assert (=> start!118196 (=> (not res!924524) (not e!783838))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118196 (= res!924524 (validMask!0 mask!2987))))

(assert (=> start!118196 e!783838))

(assert (=> start!118196 true))

(declare-datatypes ((array!94499 0))(
  ( (array!94500 (arr!45627 (Array (_ BitVec 32) (_ BitVec 64))) (size!46177 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94499)

(declare-fun array_inv!34655 (array!94499) Bool)

(assert (=> start!118196 (array_inv!34655 a!2938)))

(declare-fun b!1382932 () Bool)

(declare-fun res!924526 () Bool)

(assert (=> b!1382932 (=> (not res!924526) (not e!783838))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1382932 (= res!924526 (and (= (size!46177 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46177 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46177 a!2938))))))

(declare-fun b!1382933 () Bool)

(declare-fun res!924525 () Bool)

(assert (=> b!1382933 (=> (not res!924525) (not e!783838))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382933 (= res!924525 (validKeyInArray!0 (select (arr!45627 a!2938) i!1065)))))

(declare-fun b!1382934 () Bool)

(assert (=> b!1382934 (= e!783838 false)))

(declare-fun lt!608493 () Bool)

(declare-datatypes ((List!32155 0))(
  ( (Nil!32152) (Cons!32151 (h!33360 (_ BitVec 64)) (t!46849 List!32155)) )
))
(declare-fun arrayNoDuplicates!0 (array!94499 (_ BitVec 32) List!32155) Bool)

(assert (=> b!1382934 (= lt!608493 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32152))))

(assert (= (and start!118196 res!924524) b!1382932))

(assert (= (and b!1382932 res!924526) b!1382933))

(assert (= (and b!1382933 res!924525) b!1382934))

(declare-fun m!1268035 () Bool)

(assert (=> start!118196 m!1268035))

(declare-fun m!1268037 () Bool)

(assert (=> start!118196 m!1268037))

(declare-fun m!1268039 () Bool)

(assert (=> b!1382933 m!1268039))

(assert (=> b!1382933 m!1268039))

(declare-fun m!1268041 () Bool)

(assert (=> b!1382933 m!1268041))

(declare-fun m!1268043 () Bool)

(assert (=> b!1382934 m!1268043))

(check-sat (not start!118196) (not b!1382934) (not b!1382933))
