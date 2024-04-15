; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118494 () Bool)

(assert start!118494)

(declare-fun b!1385508 () Bool)

(declare-fun res!926803 () Bool)

(declare-fun e!785028 () Bool)

(assert (=> b!1385508 (=> (not res!926803) (not e!785028))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94723 0))(
  ( (array!94724 (arr!45738 (Array (_ BitVec 32) (_ BitVec 64))) (size!46290 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94723)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1385508 (= res!926803 (and (= (size!46290 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46290 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46290 a!2938))))))

(declare-fun b!1385510 () Bool)

(declare-fun res!926804 () Bool)

(assert (=> b!1385510 (=> (not res!926804) (not e!785028))))

(declare-datatypes ((List!32344 0))(
  ( (Nil!32341) (Cons!32340 (h!33549 (_ BitVec 64)) (t!47030 List!32344)) )
))
(declare-fun arrayNoDuplicates!0 (array!94723 (_ BitVec 32) List!32344) Bool)

(assert (=> b!1385510 (= res!926804 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32341))))

(declare-fun res!926801 () Bool)

(assert (=> start!118494 (=> (not res!926801) (not e!785028))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118494 (= res!926801 (validMask!0 mask!2987))))

(assert (=> start!118494 e!785028))

(assert (=> start!118494 true))

(declare-fun array_inv!34971 (array!94723) Bool)

(assert (=> start!118494 (array_inv!34971 a!2938)))

(declare-fun b!1385511 () Bool)

(assert (=> b!1385511 (= e!785028 false)))

(declare-fun lt!609095 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94723 (_ BitVec 32)) Bool)

(assert (=> b!1385511 (= lt!609095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385509 () Bool)

(declare-fun res!926802 () Bool)

(assert (=> b!1385509 (=> (not res!926802) (not e!785028))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385509 (= res!926802 (validKeyInArray!0 (select (arr!45738 a!2938) i!1065)))))

(assert (= (and start!118494 res!926801) b!1385508))

(assert (= (and b!1385508 res!926803) b!1385509))

(assert (= (and b!1385509 res!926802) b!1385510))

(assert (= (and b!1385510 res!926804) b!1385511))

(declare-fun m!1270365 () Bool)

(assert (=> b!1385510 m!1270365))

(declare-fun m!1270367 () Bool)

(assert (=> start!118494 m!1270367))

(declare-fun m!1270369 () Bool)

(assert (=> start!118494 m!1270369))

(declare-fun m!1270371 () Bool)

(assert (=> b!1385511 m!1270371))

(declare-fun m!1270373 () Bool)

(assert (=> b!1385509 m!1270373))

(assert (=> b!1385509 m!1270373))

(declare-fun m!1270375 () Bool)

(assert (=> b!1385509 m!1270375))

(push 1)

(assert (not b!1385511))

(assert (not b!1385509))

(assert (not start!118494))

(assert (not b!1385510))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

