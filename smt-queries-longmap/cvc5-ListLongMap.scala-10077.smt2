; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118596 () Bool)

(assert start!118596)

(declare-fun b!1386457 () Bool)

(declare-fun res!927685 () Bool)

(declare-fun e!785405 () Bool)

(assert (=> b!1386457 (=> (not res!927685) (not e!785405))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94825 0))(
  ( (array!94826 (arr!45789 (Array (_ BitVec 32) (_ BitVec 64))) (size!46341 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94825)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1386457 (= res!927685 (and (= (size!46341 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46341 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46341 a!2938))))))

(declare-fun b!1386458 () Bool)

(assert (=> b!1386458 (= e!785405 false)))

(declare-datatypes ((Unit!46158 0))(
  ( (Unit!46159) )
))
(declare-fun lt!609309 () Unit!46158)

(declare-fun e!785407 () Unit!46158)

(assert (=> b!1386458 (= lt!609309 e!785407)))

(declare-fun c!128831 () Bool)

(declare-fun e!785406 () Bool)

(assert (=> b!1386458 (= c!128831 e!785406)))

(declare-fun res!927683 () Bool)

(assert (=> b!1386458 (=> (not res!927683) (not e!785406))))

(assert (=> b!1386458 (= res!927683 (not (= startIndex!16 i!1065)))))

(declare-fun b!1386459 () Bool)

(declare-fun res!927684 () Bool)

(assert (=> b!1386459 (=> (not res!927684) (not e!785405))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94825 (_ BitVec 32)) Bool)

(assert (=> b!1386459 (= res!927684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386460 () Bool)

(declare-fun lt!609310 () Unit!46158)

(assert (=> b!1386460 (= e!785407 lt!609310)))

(declare-fun lt!609311 () Unit!46158)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94825 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46158)

(assert (=> b!1386460 (= lt!609311 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10158 0))(
  ( (MissingZero!10158 (index!43003 (_ BitVec 32))) (Found!10158 (index!43004 (_ BitVec 32))) (Intermediate!10158 (undefined!10970 Bool) (index!43005 (_ BitVec 32)) (x!124612 (_ BitVec 32))) (Undefined!10158) (MissingVacant!10158 (index!43006 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94825 (_ BitVec 32)) SeekEntryResult!10158)

(assert (=> b!1386460 (= (seekEntryOrOpen!0 (select (arr!45789 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45789 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94826 (store (arr!45789 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46341 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94825 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46158)

(assert (=> b!1386460 (= lt!609310 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1386460 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1386461 () Bool)

(declare-fun res!927681 () Bool)

(assert (=> b!1386461 (=> (not res!927681) (not e!785405))))

(assert (=> b!1386461 (= res!927681 (and (not (= (select (arr!45789 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45789 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386462 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386462 (= e!785406 (validKeyInArray!0 (select (arr!45789 a!2938) startIndex!16)))))

(declare-fun b!1386463 () Bool)

(declare-fun Unit!46160 () Unit!46158)

(assert (=> b!1386463 (= e!785407 Unit!46160)))

(declare-fun b!1386464 () Bool)

(declare-fun res!927682 () Bool)

(assert (=> b!1386464 (=> (not res!927682) (not e!785405))))

(assert (=> b!1386464 (= res!927682 (validKeyInArray!0 (select (arr!45789 a!2938) i!1065)))))

(declare-fun res!927680 () Bool)

(assert (=> start!118596 (=> (not res!927680) (not e!785405))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118596 (= res!927680 (validMask!0 mask!2987))))

(assert (=> start!118596 e!785405))

(assert (=> start!118596 true))

(declare-fun array_inv!35022 (array!94825) Bool)

(assert (=> start!118596 (array_inv!35022 a!2938)))

(declare-fun b!1386465 () Bool)

(declare-fun res!927686 () Bool)

(assert (=> b!1386465 (=> (not res!927686) (not e!785405))))

(declare-datatypes ((List!32395 0))(
  ( (Nil!32392) (Cons!32391 (h!33600 (_ BitVec 64)) (t!47081 List!32395)) )
))
(declare-fun arrayNoDuplicates!0 (array!94825 (_ BitVec 32) List!32395) Bool)

(assert (=> b!1386465 (= res!927686 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32392))))

(assert (= (and start!118596 res!927680) b!1386457))

(assert (= (and b!1386457 res!927685) b!1386464))

(assert (= (and b!1386464 res!927682) b!1386465))

(assert (= (and b!1386465 res!927686) b!1386459))

(assert (= (and b!1386459 res!927684) b!1386461))

(assert (= (and b!1386461 res!927681) b!1386458))

(assert (= (and b!1386458 res!927683) b!1386462))

(assert (= (and b!1386458 c!128831) b!1386460))

(assert (= (and b!1386458 (not c!128831)) b!1386463))

(declare-fun m!1271397 () Bool)

(assert (=> b!1386460 m!1271397))

(declare-fun m!1271399 () Bool)

(assert (=> b!1386460 m!1271399))

(assert (=> b!1386460 m!1271399))

(declare-fun m!1271401 () Bool)

(assert (=> b!1386460 m!1271401))

(declare-fun m!1271403 () Bool)

(assert (=> b!1386460 m!1271403))

(declare-fun m!1271405 () Bool)

(assert (=> b!1386460 m!1271405))

(declare-fun m!1271407 () Bool)

(assert (=> b!1386460 m!1271407))

(declare-fun m!1271409 () Bool)

(assert (=> b!1386460 m!1271409))

(assert (=> b!1386460 m!1271407))

(declare-fun m!1271411 () Bool)

(assert (=> b!1386460 m!1271411))

(declare-fun m!1271413 () Bool)

(assert (=> b!1386461 m!1271413))

(assert (=> b!1386464 m!1271413))

(assert (=> b!1386464 m!1271413))

(declare-fun m!1271415 () Bool)

(assert (=> b!1386464 m!1271415))

(declare-fun m!1271417 () Bool)

(assert (=> b!1386465 m!1271417))

(declare-fun m!1271419 () Bool)

(assert (=> b!1386459 m!1271419))

(assert (=> b!1386462 m!1271407))

(assert (=> b!1386462 m!1271407))

(declare-fun m!1271421 () Bool)

(assert (=> b!1386462 m!1271421))

(declare-fun m!1271423 () Bool)

(assert (=> start!118596 m!1271423))

(declare-fun m!1271425 () Bool)

(assert (=> start!118596 m!1271425))

(push 1)

(assert (not b!1386460))

(assert (not b!1386459))

(assert (not b!1386464))

(assert (not start!118596))

(assert (not b!1386462))

(assert (not b!1386465))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

