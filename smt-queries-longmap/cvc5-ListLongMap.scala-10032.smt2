; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118512 () Bool)

(assert start!118512)

(declare-fun b!1384920 () Bool)

(declare-fun res!925725 () Bool)

(declare-fun e!784998 () Bool)

(assert (=> b!1384920 (=> (not res!925725) (not e!784998))))

(declare-datatypes ((array!94713 0))(
  ( (array!94714 (arr!45732 (Array (_ BitVec 32) (_ BitVec 64))) (size!46283 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94713)

(declare-datatypes ((List!32247 0))(
  ( (Nil!32244) (Cons!32243 (h!33461 (_ BitVec 64)) (t!46933 List!32247)) )
))
(declare-fun arrayNoDuplicates!0 (array!94713 (_ BitVec 32) List!32247) Bool)

(assert (=> b!1384920 (= res!925725 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32244))))

(declare-fun b!1384921 () Bool)

(declare-fun res!925729 () Bool)

(assert (=> b!1384921 (=> (not res!925729) (not e!784998))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1384921 (= res!925729 (and (not (= (select (arr!45732 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45732 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun res!925727 () Bool)

(assert (=> start!118512 (=> (not res!925727) (not e!784998))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118512 (= res!925727 (validMask!0 mask!2987))))

(assert (=> start!118512 e!784998))

(assert (=> start!118512 true))

(declare-fun array_inv!35013 (array!94713) Bool)

(assert (=> start!118512 (array_inv!35013 a!2938)))

(declare-fun b!1384922 () Bool)

(declare-fun res!925724 () Bool)

(assert (=> b!1384922 (=> (not res!925724) (not e!784998))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94713 (_ BitVec 32)) Bool)

(assert (=> b!1384922 (= res!925724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384923 () Bool)

(declare-fun res!925726 () Bool)

(assert (=> b!1384923 (=> (not res!925726) (not e!784998))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384923 (= res!925726 (validKeyInArray!0 (select (arr!45732 a!2938) i!1065)))))

(declare-fun b!1384924 () Bool)

(declare-fun res!925723 () Bool)

(assert (=> b!1384924 (=> (not res!925723) (not e!784998))))

(assert (=> b!1384924 (= res!925723 (and (= (size!46283 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46283 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46283 a!2938))))))

(declare-fun b!1384925 () Bool)

(assert (=> b!1384925 (= e!784998 (not true))))

(declare-datatypes ((SeekEntryResult!10028 0))(
  ( (MissingZero!10028 (index!42483 (_ BitVec 32))) (Found!10028 (index!42484 (_ BitVec 32))) (Intermediate!10028 (undefined!10840 Bool) (index!42485 (_ BitVec 32)) (x!124147 (_ BitVec 32))) (Undefined!10028) (MissingVacant!10028 (index!42486 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94713 (_ BitVec 32)) SeekEntryResult!10028)

(assert (=> b!1384925 (= (seekEntryOrOpen!0 (select (arr!45732 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45732 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94714 (store (arr!45732 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46283 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46020 0))(
  ( (Unit!46021) )
))
(declare-fun lt!609120 () Unit!46020)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94713 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46020)

(assert (=> b!1384925 (= lt!609120 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun b!1384926 () Bool)

(declare-fun res!925728 () Bool)

(assert (=> b!1384926 (=> (not res!925728) (not e!784998))))

(assert (=> b!1384926 (= res!925728 (validKeyInArray!0 (select (arr!45732 a!2938) startIndex!16)))))

(assert (= (and start!118512 res!925727) b!1384924))

(assert (= (and b!1384924 res!925723) b!1384923))

(assert (= (and b!1384923 res!925726) b!1384920))

(assert (= (and b!1384920 res!925725) b!1384922))

(assert (= (and b!1384922 res!925724) b!1384921))

(assert (= (and b!1384921 res!925729) b!1384926))

(assert (= (and b!1384926 res!925728) b!1384925))

(declare-fun m!1270381 () Bool)

(assert (=> b!1384925 m!1270381))

(assert (=> b!1384925 m!1270381))

(declare-fun m!1270383 () Bool)

(assert (=> b!1384925 m!1270383))

(declare-fun m!1270385 () Bool)

(assert (=> b!1384925 m!1270385))

(declare-fun m!1270387 () Bool)

(assert (=> b!1384925 m!1270387))

(declare-fun m!1270389 () Bool)

(assert (=> b!1384925 m!1270389))

(assert (=> b!1384925 m!1270389))

(declare-fun m!1270391 () Bool)

(assert (=> b!1384925 m!1270391))

(assert (=> b!1384926 m!1270389))

(assert (=> b!1384926 m!1270389))

(declare-fun m!1270393 () Bool)

(assert (=> b!1384926 m!1270393))

(declare-fun m!1270395 () Bool)

(assert (=> start!118512 m!1270395))

(declare-fun m!1270397 () Bool)

(assert (=> start!118512 m!1270397))

(declare-fun m!1270399 () Bool)

(assert (=> b!1384920 m!1270399))

(declare-fun m!1270401 () Bool)

(assert (=> b!1384922 m!1270401))

(declare-fun m!1270403 () Bool)

(assert (=> b!1384923 m!1270403))

(assert (=> b!1384923 m!1270403))

(declare-fun m!1270405 () Bool)

(assert (=> b!1384923 m!1270405))

(assert (=> b!1384921 m!1270403))

(push 1)

(assert (not start!118512))

(assert (not b!1384926))

(assert (not b!1384920))

(assert (not b!1384923))

(assert (not b!1384922))

(assert (not b!1384925))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

