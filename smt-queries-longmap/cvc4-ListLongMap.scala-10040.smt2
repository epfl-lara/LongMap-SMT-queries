; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118348 () Bool)

(assert start!118348)

(declare-fun b!1384222 () Bool)

(declare-fun res!925714 () Bool)

(declare-fun e!784400 () Bool)

(assert (=> b!1384222 (=> (not res!925714) (not e!784400))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94651 0))(
  ( (array!94652 (arr!45703 (Array (_ BitVec 32) (_ BitVec 64))) (size!46253 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94651)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1384222 (= res!925714 (and (= (size!46253 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46253 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46253 a!2938))))))

(declare-fun b!1384223 () Bool)

(declare-fun res!925709 () Bool)

(assert (=> b!1384223 (=> (not res!925709) (not e!784400))))

(assert (=> b!1384223 (= res!925709 (and (not (= (select (arr!45703 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45703 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!925710 () Bool)

(assert (=> start!118348 (=> (not res!925710) (not e!784400))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118348 (= res!925710 (validMask!0 mask!2987))))

(assert (=> start!118348 e!784400))

(assert (=> start!118348 true))

(declare-fun array_inv!34731 (array!94651) Bool)

(assert (=> start!118348 (array_inv!34731 a!2938)))

(declare-fun b!1384224 () Bool)

(declare-datatypes ((Unit!46146 0))(
  ( (Unit!46147) )
))
(declare-fun e!784401 () Unit!46146)

(declare-fun Unit!46148 () Unit!46146)

(assert (=> b!1384224 (= e!784401 Unit!46148)))

(declare-fun b!1384225 () Bool)

(assert (=> b!1384225 (= e!784400 false)))

(declare-fun lt!608819 () Unit!46146)

(assert (=> b!1384225 (= lt!608819 e!784401)))

(declare-fun c!128697 () Bool)

(declare-fun e!784403 () Bool)

(assert (=> b!1384225 (= c!128697 e!784403)))

(declare-fun res!925713 () Bool)

(assert (=> b!1384225 (=> (not res!925713) (not e!784403))))

(assert (=> b!1384225 (= res!925713 (not (= startIndex!16 i!1065)))))

(declare-fun b!1384226 () Bool)

(declare-fun lt!608820 () Unit!46146)

(assert (=> b!1384226 (= e!784401 lt!608820)))

(declare-fun lt!608818 () Unit!46146)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94651 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46146)

(assert (=> b!1384226 (= lt!608818 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10096 0))(
  ( (MissingZero!10096 (index!42755 (_ BitVec 32))) (Found!10096 (index!42756 (_ BitVec 32))) (Intermediate!10096 (undefined!10908 Bool) (index!42757 (_ BitVec 32)) (x!124257 (_ BitVec 32))) (Undefined!10096) (MissingVacant!10096 (index!42758 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94651 (_ BitVec 32)) SeekEntryResult!10096)

(assert (=> b!1384226 (= (seekEntryOrOpen!0 (select (arr!45703 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45703 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94652 (store (arr!45703 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46253 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94651 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46146)

(assert (=> b!1384226 (= lt!608820 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94651 (_ BitVec 32)) Bool)

(assert (=> b!1384226 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1384227 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384227 (= e!784403 (validKeyInArray!0 (select (arr!45703 a!2938) startIndex!16)))))

(declare-fun b!1384228 () Bool)

(declare-fun res!925711 () Bool)

(assert (=> b!1384228 (=> (not res!925711) (not e!784400))))

(assert (=> b!1384228 (= res!925711 (validKeyInArray!0 (select (arr!45703 a!2938) i!1065)))))

(declare-fun b!1384229 () Bool)

(declare-fun res!925712 () Bool)

(assert (=> b!1384229 (=> (not res!925712) (not e!784400))))

(assert (=> b!1384229 (= res!925712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384230 () Bool)

(declare-fun res!925708 () Bool)

(assert (=> b!1384230 (=> (not res!925708) (not e!784400))))

(declare-datatypes ((List!32231 0))(
  ( (Nil!32228) (Cons!32227 (h!33436 (_ BitVec 64)) (t!46925 List!32231)) )
))
(declare-fun arrayNoDuplicates!0 (array!94651 (_ BitVec 32) List!32231) Bool)

(assert (=> b!1384230 (= res!925708 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32228))))

(assert (= (and start!118348 res!925710) b!1384222))

(assert (= (and b!1384222 res!925714) b!1384228))

(assert (= (and b!1384228 res!925711) b!1384230))

(assert (= (and b!1384230 res!925708) b!1384229))

(assert (= (and b!1384229 res!925712) b!1384223))

(assert (= (and b!1384223 res!925709) b!1384225))

(assert (= (and b!1384225 res!925713) b!1384227))

(assert (= (and b!1384225 c!128697) b!1384226))

(assert (= (and b!1384225 (not c!128697)) b!1384224))

(declare-fun m!1269441 () Bool)

(assert (=> b!1384230 m!1269441))

(declare-fun m!1269443 () Bool)

(assert (=> start!118348 m!1269443))

(declare-fun m!1269445 () Bool)

(assert (=> start!118348 m!1269445))

(declare-fun m!1269447 () Bool)

(assert (=> b!1384228 m!1269447))

(assert (=> b!1384228 m!1269447))

(declare-fun m!1269449 () Bool)

(assert (=> b!1384228 m!1269449))

(declare-fun m!1269451 () Bool)

(assert (=> b!1384227 m!1269451))

(assert (=> b!1384227 m!1269451))

(declare-fun m!1269453 () Bool)

(assert (=> b!1384227 m!1269453))

(assert (=> b!1384223 m!1269447))

(declare-fun m!1269455 () Bool)

(assert (=> b!1384226 m!1269455))

(declare-fun m!1269457 () Bool)

(assert (=> b!1384226 m!1269457))

(assert (=> b!1384226 m!1269457))

(declare-fun m!1269459 () Bool)

(assert (=> b!1384226 m!1269459))

(declare-fun m!1269461 () Bool)

(assert (=> b!1384226 m!1269461))

(declare-fun m!1269463 () Bool)

(assert (=> b!1384226 m!1269463))

(assert (=> b!1384226 m!1269451))

(declare-fun m!1269465 () Bool)

(assert (=> b!1384226 m!1269465))

(assert (=> b!1384226 m!1269451))

(declare-fun m!1269467 () Bool)

(assert (=> b!1384226 m!1269467))

(declare-fun m!1269469 () Bool)

(assert (=> b!1384229 m!1269469))

(push 1)

(assert (not b!1384228))

(assert (not b!1384229))

(assert (not start!118348))

(assert (not b!1384230))

(assert (not b!1384227))

(assert (not b!1384226))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

