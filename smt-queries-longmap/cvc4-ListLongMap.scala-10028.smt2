; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118270 () Bool)

(assert start!118270)

(declare-fun b!1383309 () Bool)

(declare-fun res!924945 () Bool)

(declare-fun e!784042 () Bool)

(assert (=> b!1383309 (=> (not res!924945) (not e!784042))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94526 0))(
  ( (array!94527 (arr!45641 (Array (_ BitVec 32) (_ BitVec 64))) (size!46193 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94526)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1383309 (= res!924945 (and (= (size!46193 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46193 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46193 a!2938))))))

(declare-fun b!1383311 () Bool)

(declare-fun res!924947 () Bool)

(assert (=> b!1383311 (=> (not res!924947) (not e!784042))))

(declare-datatypes ((List!32247 0))(
  ( (Nil!32244) (Cons!32243 (h!33452 (_ BitVec 64)) (t!46933 List!32247)) )
))
(declare-fun arrayNoDuplicates!0 (array!94526 (_ BitVec 32) List!32247) Bool)

(assert (=> b!1383311 (= res!924947 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32244))))

(declare-fun res!924946 () Bool)

(assert (=> start!118270 (=> (not res!924946) (not e!784042))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118270 (= res!924946 (validMask!0 mask!2987))))

(assert (=> start!118270 e!784042))

(assert (=> start!118270 true))

(declare-fun array_inv!34874 (array!94526) Bool)

(assert (=> start!118270 (array_inv!34874 a!2938)))

(declare-fun b!1383312 () Bool)

(assert (=> b!1383312 (= e!784042 false)))

(declare-fun lt!608417 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94526 (_ BitVec 32)) Bool)

(assert (=> b!1383312 (= lt!608417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383310 () Bool)

(declare-fun res!924944 () Bool)

(assert (=> b!1383310 (=> (not res!924944) (not e!784042))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383310 (= res!924944 (validKeyInArray!0 (select (arr!45641 a!2938) i!1065)))))

(assert (= (and start!118270 res!924946) b!1383309))

(assert (= (and b!1383309 res!924945) b!1383310))

(assert (= (and b!1383310 res!924944) b!1383311))

(assert (= (and b!1383311 res!924947) b!1383312))

(declare-fun m!1267977 () Bool)

(assert (=> b!1383311 m!1267977))

(declare-fun m!1267979 () Bool)

(assert (=> start!118270 m!1267979))

(declare-fun m!1267981 () Bool)

(assert (=> start!118270 m!1267981))

(declare-fun m!1267983 () Bool)

(assert (=> b!1383312 m!1267983))

(declare-fun m!1267985 () Bool)

(assert (=> b!1383310 m!1267985))

(assert (=> b!1383310 m!1267985))

(declare-fun m!1267987 () Bool)

(assert (=> b!1383310 m!1267987))

(push 1)

(assert (not b!1383310))

(assert (not start!118270))

(assert (not b!1383311))

(assert (not b!1383312))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

