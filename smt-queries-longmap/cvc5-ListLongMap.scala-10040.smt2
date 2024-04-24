; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118560 () Bool)

(assert start!118560)

(declare-fun b!1385530 () Bool)

(declare-fun res!926232 () Bool)

(declare-fun e!785249 () Bool)

(assert (=> b!1385530 (=> (not res!926232) (not e!785249))))

(declare-datatypes ((array!94761 0))(
  ( (array!94762 (arr!45756 (Array (_ BitVec 32) (_ BitVec 64))) (size!46307 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94761)

(declare-datatypes ((List!32271 0))(
  ( (Nil!32268) (Cons!32267 (h!33485 (_ BitVec 64)) (t!46957 List!32271)) )
))
(declare-fun arrayNoDuplicates!0 (array!94761 (_ BitVec 32) List!32271) Bool)

(assert (=> b!1385530 (= res!926232 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32268))))

(declare-fun b!1385531 () Bool)

(declare-datatypes ((Unit!46085 0))(
  ( (Unit!46086) )
))
(declare-fun e!785250 () Unit!46085)

(declare-fun Unit!46087 () Unit!46085)

(assert (=> b!1385531 (= e!785250 Unit!46087)))

(declare-fun b!1385532 () Bool)

(declare-fun res!926229 () Bool)

(assert (=> b!1385532 (=> (not res!926229) (not e!785249))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385532 (= res!926229 (validKeyInArray!0 (select (arr!45756 a!2938) i!1065)))))

(declare-fun b!1385533 () Bool)

(declare-fun lt!609298 () Unit!46085)

(assert (=> b!1385533 (= e!785250 lt!609298)))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun lt!609300 () Unit!46085)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94761 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46085)

(assert (=> b!1385533 (= lt!609300 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10052 0))(
  ( (MissingZero!10052 (index!42579 (_ BitVec 32))) (Found!10052 (index!42580 (_ BitVec 32))) (Intermediate!10052 (undefined!10864 Bool) (index!42581 (_ BitVec 32)) (x!124235 (_ BitVec 32))) (Undefined!10052) (MissingVacant!10052 (index!42582 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94761 (_ BitVec 32)) SeekEntryResult!10052)

(assert (=> b!1385533 (= (seekEntryOrOpen!0 (select (arr!45756 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45756 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94762 (store (arr!45756 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46307 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94761 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46085)

(assert (=> b!1385533 (= lt!609298 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94761 (_ BitVec 32)) Bool)

(assert (=> b!1385533 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1385534 () Bool)

(declare-fun res!926231 () Bool)

(assert (=> b!1385534 (=> (not res!926231) (not e!785249))))

(assert (=> b!1385534 (= res!926231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!926230 () Bool)

(assert (=> start!118560 (=> (not res!926230) (not e!785249))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118560 (= res!926230 (validMask!0 mask!2987))))

(assert (=> start!118560 e!785249))

(assert (=> start!118560 true))

(declare-fun array_inv!35037 (array!94761) Bool)

(assert (=> start!118560 (array_inv!35037 a!2938)))

(declare-fun b!1385535 () Bool)

(declare-fun res!926228 () Bool)

(assert (=> b!1385535 (=> (not res!926228) (not e!785249))))

(assert (=> b!1385535 (= res!926228 (and (not (= (select (arr!45756 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45756 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1385536 () Bool)

(declare-fun e!785251 () Bool)

(assert (=> b!1385536 (= e!785251 (validKeyInArray!0 (select (arr!45756 a!2938) startIndex!16)))))

(declare-fun b!1385537 () Bool)

(assert (=> b!1385537 (= e!785249 false)))

(declare-fun lt!609299 () Unit!46085)

(assert (=> b!1385537 (= lt!609299 e!785250)))

(declare-fun c!129099 () Bool)

(assert (=> b!1385537 (= c!129099 e!785251)))

(declare-fun res!926233 () Bool)

(assert (=> b!1385537 (=> (not res!926233) (not e!785251))))

(assert (=> b!1385537 (= res!926233 (not (= startIndex!16 i!1065)))))

(declare-fun b!1385538 () Bool)

(declare-fun res!926227 () Bool)

(assert (=> b!1385538 (=> (not res!926227) (not e!785249))))

(assert (=> b!1385538 (= res!926227 (and (= (size!46307 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46307 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46307 a!2938))))))

(assert (= (and start!118560 res!926230) b!1385538))

(assert (= (and b!1385538 res!926227) b!1385532))

(assert (= (and b!1385532 res!926229) b!1385530))

(assert (= (and b!1385530 res!926232) b!1385534))

(assert (= (and b!1385534 res!926231) b!1385535))

(assert (= (and b!1385535 res!926228) b!1385537))

(assert (= (and b!1385537 res!926233) b!1385536))

(assert (= (and b!1385537 c!129099) b!1385533))

(assert (= (and b!1385537 (not c!129099)) b!1385531))

(declare-fun m!1271073 () Bool)

(assert (=> b!1385534 m!1271073))

(declare-fun m!1271075 () Bool)

(assert (=> start!118560 m!1271075))

(declare-fun m!1271077 () Bool)

(assert (=> start!118560 m!1271077))

(declare-fun m!1271079 () Bool)

(assert (=> b!1385530 m!1271079))

(declare-fun m!1271081 () Bool)

(assert (=> b!1385535 m!1271081))

(declare-fun m!1271083 () Bool)

(assert (=> b!1385536 m!1271083))

(assert (=> b!1385536 m!1271083))

(declare-fun m!1271085 () Bool)

(assert (=> b!1385536 m!1271085))

(assert (=> b!1385532 m!1271081))

(assert (=> b!1385532 m!1271081))

(declare-fun m!1271087 () Bool)

(assert (=> b!1385532 m!1271087))

(declare-fun m!1271089 () Bool)

(assert (=> b!1385533 m!1271089))

(declare-fun m!1271091 () Bool)

(assert (=> b!1385533 m!1271091))

(assert (=> b!1385533 m!1271091))

(declare-fun m!1271093 () Bool)

(assert (=> b!1385533 m!1271093))

(declare-fun m!1271095 () Bool)

(assert (=> b!1385533 m!1271095))

(declare-fun m!1271097 () Bool)

(assert (=> b!1385533 m!1271097))

(assert (=> b!1385533 m!1271083))

(declare-fun m!1271099 () Bool)

(assert (=> b!1385533 m!1271099))

(assert (=> b!1385533 m!1271083))

(declare-fun m!1271101 () Bool)

(assert (=> b!1385533 m!1271101))

(push 1)

(assert (not b!1385536))

(assert (not b!1385534))

(assert (not b!1385533))

(assert (not b!1385532))

(assert (not start!118560))

(assert (not b!1385530))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

