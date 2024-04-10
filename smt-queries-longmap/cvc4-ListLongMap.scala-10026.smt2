; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118264 () Bool)

(assert start!118264)

(declare-fun b!1383319 () Bool)

(declare-fun res!924911 () Bool)

(declare-fun e!784043 () Bool)

(assert (=> b!1383319 (=> (not res!924911) (not e!784043))))

(declare-datatypes ((array!94567 0))(
  ( (array!94568 (arr!45661 (Array (_ BitVec 32) (_ BitVec 64))) (size!46211 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94567)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383319 (= res!924911 (validKeyInArray!0 (select (arr!45661 a!2938) i!1065)))))

(declare-fun b!1383318 () Bool)

(declare-fun res!924913 () Bool)

(assert (=> b!1383318 (=> (not res!924913) (not e!784043))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1383318 (= res!924913 (and (= (size!46211 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46211 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46211 a!2938))))))

(declare-fun b!1383321 () Bool)

(assert (=> b!1383321 (= e!784043 false)))

(declare-fun lt!608586 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94567 (_ BitVec 32)) Bool)

(assert (=> b!1383321 (= lt!608586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383320 () Bool)

(declare-fun res!924910 () Bool)

(assert (=> b!1383320 (=> (not res!924910) (not e!784043))))

(declare-datatypes ((List!32189 0))(
  ( (Nil!32186) (Cons!32185 (h!33394 (_ BitVec 64)) (t!46883 List!32189)) )
))
(declare-fun arrayNoDuplicates!0 (array!94567 (_ BitVec 32) List!32189) Bool)

(assert (=> b!1383320 (= res!924910 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32186))))

(declare-fun res!924912 () Bool)

(assert (=> start!118264 (=> (not res!924912) (not e!784043))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118264 (= res!924912 (validMask!0 mask!2987))))

(assert (=> start!118264 e!784043))

(assert (=> start!118264 true))

(declare-fun array_inv!34689 (array!94567) Bool)

(assert (=> start!118264 (array_inv!34689 a!2938)))

(assert (= (and start!118264 res!924912) b!1383318))

(assert (= (and b!1383318 res!924913) b!1383319))

(assert (= (and b!1383319 res!924911) b!1383320))

(assert (= (and b!1383320 res!924910) b!1383321))

(declare-fun m!1268421 () Bool)

(assert (=> b!1383319 m!1268421))

(assert (=> b!1383319 m!1268421))

(declare-fun m!1268423 () Bool)

(assert (=> b!1383319 m!1268423))

(declare-fun m!1268425 () Bool)

(assert (=> b!1383321 m!1268425))

(declare-fun m!1268427 () Bool)

(assert (=> b!1383320 m!1268427))

(declare-fun m!1268429 () Bool)

(assert (=> start!118264 m!1268429))

(declare-fun m!1268431 () Bool)

(assert (=> start!118264 m!1268431))

(push 1)

(assert (not b!1383319))

(assert (not start!118264))

(assert (not b!1383320))

(assert (not b!1383321))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

