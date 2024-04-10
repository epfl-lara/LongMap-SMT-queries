; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118258 () Bool)

(assert start!118258)

(declare-fun b!1383284 () Bool)

(declare-fun res!924874 () Bool)

(declare-fun e!784025 () Bool)

(assert (=> b!1383284 (=> (not res!924874) (not e!784025))))

(declare-datatypes ((array!94561 0))(
  ( (array!94562 (arr!45658 (Array (_ BitVec 32) (_ BitVec 64))) (size!46208 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94561)

(declare-datatypes ((List!32186 0))(
  ( (Nil!32183) (Cons!32182 (h!33391 (_ BitVec 64)) (t!46880 List!32186)) )
))
(declare-fun arrayNoDuplicates!0 (array!94561 (_ BitVec 32) List!32186) Bool)

(assert (=> b!1383284 (= res!924874 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32183))))

(declare-fun res!924875 () Bool)

(assert (=> start!118258 (=> (not res!924875) (not e!784025))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118258 (= res!924875 (validMask!0 mask!2987))))

(assert (=> start!118258 e!784025))

(assert (=> start!118258 true))

(declare-fun array_inv!34686 (array!94561) Bool)

(assert (=> start!118258 (array_inv!34686 a!2938)))

(declare-fun b!1383285 () Bool)

(assert (=> b!1383285 (= e!784025 false)))

(declare-fun lt!608577 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94561 (_ BitVec 32)) Bool)

(assert (=> b!1383285 (= lt!608577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383283 () Bool)

(declare-fun res!924876 () Bool)

(assert (=> b!1383283 (=> (not res!924876) (not e!784025))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383283 (= res!924876 (validKeyInArray!0 (select (arr!45658 a!2938) i!1065)))))

(declare-fun b!1383282 () Bool)

(declare-fun res!924877 () Bool)

(assert (=> b!1383282 (=> (not res!924877) (not e!784025))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383282 (= res!924877 (and (= (size!46208 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46208 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46208 a!2938))))))

(assert (= (and start!118258 res!924875) b!1383282))

(assert (= (and b!1383282 res!924877) b!1383283))

(assert (= (and b!1383283 res!924876) b!1383284))

(assert (= (and b!1383284 res!924874) b!1383285))

(declare-fun m!1268385 () Bool)

(assert (=> b!1383284 m!1268385))

(declare-fun m!1268387 () Bool)

(assert (=> start!118258 m!1268387))

(declare-fun m!1268389 () Bool)

(assert (=> start!118258 m!1268389))

(declare-fun m!1268391 () Bool)

(assert (=> b!1383285 m!1268391))

(declare-fun m!1268393 () Bool)

(assert (=> b!1383283 m!1268393))

(assert (=> b!1383283 m!1268393))

(declare-fun m!1268395 () Bool)

(assert (=> b!1383283 m!1268395))

(push 1)

(assert (not b!1383283))

(assert (not start!118258))

(assert (not b!1383284))

(assert (not b!1383285))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

