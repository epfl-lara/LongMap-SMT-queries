; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118408 () Bool)

(assert start!118408)

(declare-fun b!1385068 () Bool)

(declare-fun res!926375 () Bool)

(declare-fun e!784796 () Bool)

(assert (=> b!1385068 (=> (not res!926375) (not e!784796))))

(declare-datatypes ((array!94711 0))(
  ( (array!94712 (arr!45733 (Array (_ BitVec 32) (_ BitVec 64))) (size!46283 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94711)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385068 (= res!926375 (validKeyInArray!0 (select (arr!45733 a!2938) i!1065)))))

(declare-fun b!1385069 () Bool)

(declare-fun e!784799 () Bool)

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385069 (= e!784799 (validKeyInArray!0 (select (arr!45733 a!2938) startIndex!16)))))

(declare-fun b!1385070 () Bool)

(declare-fun res!926378 () Bool)

(assert (=> b!1385070 (=> (not res!926378) (not e!784796))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94711 (_ BitVec 32)) Bool)

(assert (=> b!1385070 (= res!926378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385071 () Bool)

(declare-fun res!926377 () Bool)

(assert (=> b!1385071 (=> (not res!926377) (not e!784796))))

(declare-datatypes ((List!32261 0))(
  ( (Nil!32258) (Cons!32257 (h!33466 (_ BitVec 64)) (t!46955 List!32261)) )
))
(declare-fun arrayNoDuplicates!0 (array!94711 (_ BitVec 32) List!32261) Bool)

(assert (=> b!1385071 (= res!926377 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32258))))

(declare-fun b!1385072 () Bool)

(assert (=> b!1385072 (= e!784796 false)))

(declare-datatypes ((Unit!46236 0))(
  ( (Unit!46237) )
))
(declare-fun lt!609160 () Unit!46236)

(declare-fun e!784798 () Unit!46236)

(assert (=> b!1385072 (= lt!609160 e!784798)))

(declare-fun c!128787 () Bool)

(assert (=> b!1385072 (= c!128787 e!784799)))

(declare-fun res!926374 () Bool)

(assert (=> b!1385072 (=> (not res!926374) (not e!784799))))

(assert (=> b!1385072 (= res!926374 (not (= startIndex!16 i!1065)))))

(declare-fun b!1385073 () Bool)

(declare-fun lt!609161 () Unit!46236)

(assert (=> b!1385073 (= e!784798 lt!609161)))

(declare-fun lt!609162 () Unit!46236)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94711 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46236)

(assert (=> b!1385073 (= lt!609162 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10126 0))(
  ( (MissingZero!10126 (index!42875 (_ BitVec 32))) (Found!10126 (index!42876 (_ BitVec 32))) (Intermediate!10126 (undefined!10938 Bool) (index!42877 (_ BitVec 32)) (x!124367 (_ BitVec 32))) (Undefined!10126) (MissingVacant!10126 (index!42878 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94711 (_ BitVec 32)) SeekEntryResult!10126)

(assert (=> b!1385073 (= (seekEntryOrOpen!0 (select (arr!45733 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45733 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94712 (store (arr!45733 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46283 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94711 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46236)

(assert (=> b!1385073 (= lt!609161 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1385073 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1385074 () Bool)

(declare-fun res!926379 () Bool)

(assert (=> b!1385074 (=> (not res!926379) (not e!784796))))

(assert (=> b!1385074 (= res!926379 (and (not (= (select (arr!45733 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45733 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!926380 () Bool)

(assert (=> start!118408 (=> (not res!926380) (not e!784796))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118408 (= res!926380 (validMask!0 mask!2987))))

(assert (=> start!118408 e!784796))

(assert (=> start!118408 true))

(declare-fun array_inv!34761 (array!94711) Bool)

(assert (=> start!118408 (array_inv!34761 a!2938)))

(declare-fun b!1385075 () Bool)

(declare-fun Unit!46238 () Unit!46236)

(assert (=> b!1385075 (= e!784798 Unit!46238)))

(declare-fun b!1385076 () Bool)

(declare-fun res!926376 () Bool)

(assert (=> b!1385076 (=> (not res!926376) (not e!784796))))

(assert (=> b!1385076 (= res!926376 (and (= (size!46283 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46283 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46283 a!2938))))))

(assert (= (and start!118408 res!926380) b!1385076))

(assert (= (and b!1385076 res!926376) b!1385068))

(assert (= (and b!1385068 res!926375) b!1385071))

(assert (= (and b!1385071 res!926377) b!1385070))

(assert (= (and b!1385070 res!926378) b!1385074))

(assert (= (and b!1385074 res!926379) b!1385072))

(assert (= (and b!1385072 res!926374) b!1385069))

(assert (= (and b!1385072 c!128787) b!1385073))

(assert (= (and b!1385072 (not c!128787)) b!1385075))

(declare-fun m!1270389 () Bool)

(assert (=> b!1385068 m!1270389))

(assert (=> b!1385068 m!1270389))

(declare-fun m!1270391 () Bool)

(assert (=> b!1385068 m!1270391))

(declare-fun m!1270393 () Bool)

(assert (=> start!118408 m!1270393))

(declare-fun m!1270395 () Bool)

(assert (=> start!118408 m!1270395))

(assert (=> b!1385074 m!1270389))

(declare-fun m!1270397 () Bool)

(assert (=> b!1385073 m!1270397))

(declare-fun m!1270399 () Bool)

(assert (=> b!1385073 m!1270399))

(assert (=> b!1385073 m!1270399))

(declare-fun m!1270401 () Bool)

(assert (=> b!1385073 m!1270401))

(declare-fun m!1270403 () Bool)

(assert (=> b!1385073 m!1270403))

(declare-fun m!1270405 () Bool)

(assert (=> b!1385073 m!1270405))

(declare-fun m!1270407 () Bool)

(assert (=> b!1385073 m!1270407))

(declare-fun m!1270409 () Bool)

(assert (=> b!1385073 m!1270409))

(assert (=> b!1385073 m!1270407))

(declare-fun m!1270411 () Bool)

(assert (=> b!1385073 m!1270411))

(assert (=> b!1385069 m!1270407))

(assert (=> b!1385069 m!1270407))

(declare-fun m!1270413 () Bool)

(assert (=> b!1385069 m!1270413))

(declare-fun m!1270415 () Bool)

(assert (=> b!1385070 m!1270415))

(declare-fun m!1270417 () Bool)

(assert (=> b!1385071 m!1270417))

(push 1)

(assert (not b!1385070))

(assert (not b!1385068))

(assert (not b!1385069))

(assert (not b!1385073))

(assert (not start!118408))

(assert (not b!1385071))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

