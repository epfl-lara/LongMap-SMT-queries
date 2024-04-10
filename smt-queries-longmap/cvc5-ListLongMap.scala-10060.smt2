; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118494 () Bool)

(assert start!118494)

(declare-fun b!1385553 () Bool)

(declare-fun res!926805 () Bool)

(declare-fun e!785048 () Bool)

(assert (=> b!1385553 (=> (not res!926805) (not e!785048))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94770 0))(
  ( (array!94771 (arr!45761 (Array (_ BitVec 32) (_ BitVec 64))) (size!46311 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94770)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1385553 (= res!926805 (and (= (size!46311 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46311 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46311 a!2938))))))

(declare-fun res!926806 () Bool)

(assert (=> start!118494 (=> (not res!926806) (not e!785048))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118494 (= res!926806 (validMask!0 mask!2987))))

(assert (=> start!118494 e!785048))

(assert (=> start!118494 true))

(declare-fun array_inv!34789 (array!94770) Bool)

(assert (=> start!118494 (array_inv!34789 a!2938)))

(declare-fun b!1385555 () Bool)

(declare-fun res!926804 () Bool)

(assert (=> b!1385555 (=> (not res!926804) (not e!785048))))

(declare-datatypes ((List!32289 0))(
  ( (Nil!32286) (Cons!32285 (h!33494 (_ BitVec 64)) (t!46983 List!32289)) )
))
(declare-fun arrayNoDuplicates!0 (array!94770 (_ BitVec 32) List!32289) Bool)

(assert (=> b!1385555 (= res!926804 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32286))))

(declare-fun b!1385556 () Bool)

(assert (=> b!1385556 (= e!785048 false)))

(declare-fun lt!609273 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94770 (_ BitVec 32)) Bool)

(assert (=> b!1385556 (= lt!609273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385554 () Bool)

(declare-fun res!926803 () Bool)

(assert (=> b!1385554 (=> (not res!926803) (not e!785048))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385554 (= res!926803 (validKeyInArray!0 (select (arr!45761 a!2938) i!1065)))))

(assert (= (and start!118494 res!926806) b!1385553))

(assert (= (and b!1385553 res!926805) b!1385554))

(assert (= (and b!1385554 res!926803) b!1385555))

(assert (= (and b!1385555 res!926804) b!1385556))

(declare-fun m!1270845 () Bool)

(assert (=> start!118494 m!1270845))

(declare-fun m!1270847 () Bool)

(assert (=> start!118494 m!1270847))

(declare-fun m!1270849 () Bool)

(assert (=> b!1385555 m!1270849))

(declare-fun m!1270851 () Bool)

(assert (=> b!1385556 m!1270851))

(declare-fun m!1270853 () Bool)

(assert (=> b!1385554 m!1270853))

(assert (=> b!1385554 m!1270853))

(declare-fun m!1270855 () Bool)

(assert (=> b!1385554 m!1270855))

(push 1)

(assert (not b!1385554))

(assert (not b!1385555))

(assert (not start!118494))

(assert (not b!1385556))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

