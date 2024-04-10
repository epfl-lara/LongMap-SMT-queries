; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134834 () Bool)

(assert start!134834)

(declare-fun res!1073942 () Bool)

(declare-fun e!876430 () Bool)

(assert (=> start!134834 (=> (not res!1073942) (not e!876430))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134834 (= res!1073942 (validMask!0 mask!889))))

(assert (=> start!134834 e!876430))

(assert (=> start!134834 true))

(declare-datatypes ((array!104931 0))(
  ( (array!104932 (arr!50635 (Array (_ BitVec 32) (_ BitVec 64))) (size!51185 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104931)

(declare-fun array_inv!39362 (array!104931) Bool)

(assert (=> start!134834 (array_inv!39362 _keys!600)))

(declare-fun b!1571824 () Bool)

(declare-fun res!1073943 () Bool)

(assert (=> b!1571824 (=> (not res!1073943) (not e!876430))))

(assert (=> b!1571824 (= res!1073943 (= (size!51185 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571825 () Bool)

(declare-fun res!1073941 () Bool)

(assert (=> b!1571825 (=> (not res!1073941) (not e!876430))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571825 (= res!1073941 (validKeyInArray!0 k!754))))

(declare-fun b!1571826 () Bool)

(declare-datatypes ((SeekEntryResult!13548 0))(
  ( (MissingZero!13548 (index!56590 (_ BitVec 32))) (Found!13548 (index!56591 (_ BitVec 32))) (Intermediate!13548 (undefined!14360 Bool) (index!56592 (_ BitVec 32)) (x!141360 (_ BitVec 32))) (Undefined!13548) (MissingVacant!13548 (index!56593 (_ BitVec 32))) )
))
(declare-fun lt!673753 () SeekEntryResult!13548)

(assert (=> b!1571826 (= e!876430 (and (is-Intermediate!13548 lt!673753) (not (undefined!14360 lt!673753)) (not (= (select (arr!50635 _keys!600) (index!56592 lt!673753)) k!754)) (not (= (select (arr!50635 _keys!600) (index!56592 lt!673753)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50635 _keys!600) (index!56592 lt!673753)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56592 lt!673753) #b00000000000000000000000000000000) (bvslt (index!56592 lt!673753) (bvadd #b00000000000000000000000000000001 mask!889)) (bvslt mask!889 #b00000000000000000000000000000000)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104931 (_ BitVec 32)) SeekEntryResult!13548)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571826 (= lt!673753 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!134834 res!1073942) b!1571824))

(assert (= (and b!1571824 res!1073943) b!1571825))

(assert (= (and b!1571825 res!1073941) b!1571826))

(declare-fun m!1445701 () Bool)

(assert (=> start!134834 m!1445701))

(declare-fun m!1445703 () Bool)

(assert (=> start!134834 m!1445703))

(declare-fun m!1445705 () Bool)

(assert (=> b!1571825 m!1445705))

(declare-fun m!1445707 () Bool)

(assert (=> b!1571826 m!1445707))

(declare-fun m!1445709 () Bool)

(assert (=> b!1571826 m!1445709))

(assert (=> b!1571826 m!1445709))

(declare-fun m!1445711 () Bool)

(assert (=> b!1571826 m!1445711))

(push 1)

(assert (not b!1571826))

