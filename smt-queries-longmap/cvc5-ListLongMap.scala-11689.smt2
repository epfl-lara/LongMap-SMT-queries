; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137144 () Bool)

(assert start!137144)

(declare-fun b!1580921 () Bool)

(declare-fun res!1079338 () Bool)

(declare-fun e!881947 () Bool)

(assert (=> b!1580921 (=> (not res!1079338) (not e!881947))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun k!772 () (_ BitVec 64))

(declare-datatypes ((array!105879 0))(
  ( (array!105880 (arr!51042 (Array (_ BitVec 32) (_ BitVec 64))) (size!51593 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105879)

(declare-fun ee!18 () (_ BitVec 32))

(assert (=> b!1580921 (= res!1079338 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!51042 _keys!614) ee!18) k!772)) (not (= (select (arr!51042 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1580920 () Bool)

(declare-fun res!1079337 () Bool)

(assert (=> b!1580920 (=> (not res!1079337) (not e!881947))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1580920 (= res!1079337 (validKeyInArray!0 k!772))))

(declare-datatypes ((SeekEntryResult!13717 0))(
  ( (MissingZero!13717 (index!57266 (_ BitVec 32))) (Found!13717 (index!57267 (_ BitVec 32))) (Intermediate!13717 (undefined!14529 Bool) (index!57268 (_ BitVec 32)) (x!142750 (_ BitVec 32))) (Undefined!13717) (MissingVacant!13717 (index!57269 (_ BitVec 32))) )
))
(declare-fun lt!677169 () SeekEntryResult!13717)

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun b!1580922 () Bool)

(assert (=> b!1580922 (= e!881947 (and (not (is-Undefined!13717 lt!677169)) (not (is-Found!13717 lt!677169)) (is-MissingVacant!13717 lt!677169) (= (index!57269 lt!677169) vacantSpotIndex!10) (or (bvslt (index!57269 lt!677169) #b00000000000000000000000000000000) (bvsge (index!57269 lt!677169) (size!51593 _keys!614)))))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105879 (_ BitVec 32)) SeekEntryResult!13717)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1580922 (= lt!677169 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!466) (nextIndex!0 ee!18 (bvadd #b00000000000000000000000000000001 x!466) mask!918) vacantSpotIndex!10 k!772 _keys!614 mask!918))))

(declare-fun b!1580919 () Bool)

(declare-fun res!1079336 () Bool)

(assert (=> b!1580919 (=> (not res!1079336) (not e!881947))))

(assert (=> b!1580919 (= res!1079336 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51593 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!51042 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1079339 () Bool)

(assert (=> start!137144 (=> (not res!1079339) (not e!881947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!137144 (= res!1079339 (validMask!0 mask!918))))

(assert (=> start!137144 e!881947))

(assert (=> start!137144 true))

(declare-fun array_inv!39997 (array!105879) Bool)

(assert (=> start!137144 (array_inv!39997 _keys!614)))

(assert (= (and start!137144 res!1079339) b!1580919))

(assert (= (and b!1580919 res!1079336) b!1580920))

(assert (= (and b!1580920 res!1079337) b!1580921))

(assert (= (and b!1580921 res!1079338) b!1580922))

(declare-fun m!1452835 () Bool)

(assert (=> start!137144 m!1452835))

(declare-fun m!1452837 () Bool)

(assert (=> start!137144 m!1452837))

(declare-fun m!1452839 () Bool)

(assert (=> b!1580919 m!1452839))

(declare-fun m!1452841 () Bool)

(assert (=> b!1580920 m!1452841))

(declare-fun m!1452843 () Bool)

(assert (=> b!1580921 m!1452843))

(declare-fun m!1452845 () Bool)

(assert (=> b!1580922 m!1452845))

(assert (=> b!1580922 m!1452845))

(declare-fun m!1452847 () Bool)

(assert (=> b!1580922 m!1452847))

(push 1)

(assert (not b!1580920))

(assert (not start!137144))

(assert (not b!1580922))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

