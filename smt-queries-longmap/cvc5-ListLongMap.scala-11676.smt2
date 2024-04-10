; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136606 () Bool)

(assert start!136606)

(declare-fun b!1578018 () Bool)

(declare-fun res!1078067 () Bool)

(declare-fun e!880165 () Bool)

(assert (=> b!1578018 (=> (not res!1078067) (not e!880165))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-datatypes ((array!105668 0))(
  ( (array!105669 (arr!50947 (Array (_ BitVec 32) (_ BitVec 64))) (size!51497 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105668)

(assert (=> b!1578018 (= res!1078067 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51497 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50947 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1578021 () Bool)

(declare-fun lt!676174 () (_ BitVec 32))

(assert (=> b!1578021 (= e!880165 (and (bvsge lt!676174 #b00000000000000000000000000000000) (bvslt lt!676174 (bvadd #b00000000000000000000000000000001 mask!918)) (bvslt (bvadd #b00000000000000000000000000000001 x!466) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578021 (= lt!676174 (nextIndex!0 ee!18 x!466 mask!918))))

(declare-fun res!1078065 () Bool)

(assert (=> start!136606 (=> (not res!1078065) (not e!880165))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136606 (= res!1078065 (validMask!0 mask!918))))

(assert (=> start!136606 e!880165))

(assert (=> start!136606 true))

(declare-fun array_inv!39674 (array!105668) Bool)

(assert (=> start!136606 (array_inv!39674 _keys!614)))

(declare-fun b!1578020 () Bool)

(declare-fun res!1078068 () Bool)

(assert (=> b!1578020 (=> (not res!1078068) (not e!880165))))

(declare-fun k!772 () (_ BitVec 64))

(assert (=> b!1578020 (= res!1078068 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50947 _keys!614) ee!18) k!772)) (not (= (select (arr!50947 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1578019 () Bool)

(declare-fun res!1078066 () Bool)

(assert (=> b!1578019 (=> (not res!1078066) (not e!880165))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578019 (= res!1078066 (validKeyInArray!0 k!772))))

(assert (= (and start!136606 res!1078065) b!1578018))

(assert (= (and b!1578018 res!1078067) b!1578019))

(assert (= (and b!1578019 res!1078066) b!1578020))

(assert (= (and b!1578020 res!1078068) b!1578021))

(declare-fun m!1450117 () Bool)

(assert (=> b!1578020 m!1450117))

(declare-fun m!1450119 () Bool)

(assert (=> b!1578021 m!1450119))

(declare-fun m!1450121 () Bool)

(assert (=> start!136606 m!1450121))

(declare-fun m!1450123 () Bool)

(assert (=> start!136606 m!1450123))

(declare-fun m!1450125 () Bool)

(assert (=> b!1578018 m!1450125))

(declare-fun m!1450127 () Bool)

(assert (=> b!1578019 m!1450127))

(push 1)

(assert (not b!1578021))

(assert (not b!1578019))

(assert (not start!136606))

(check-sat)

(pop 1)

(push 1)

(check-sat)

