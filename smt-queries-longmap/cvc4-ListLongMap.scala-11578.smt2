; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134904 () Bool)

(assert start!134904)

(declare-fun res!1074153 () Bool)

(declare-fun e!876595 () Bool)

(assert (=> start!134904 (=> (not res!1074153) (not e!876595))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134904 (= res!1074153 (validMask!0 mask!889))))

(assert (=> start!134904 e!876595))

(assert (=> start!134904 true))

(declare-datatypes ((array!104974 0))(
  ( (array!104975 (arr!50655 (Array (_ BitVec 32) (_ BitVec 64))) (size!51205 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104974)

(declare-fun array_inv!39382 (array!104974) Bool)

(assert (=> start!134904 (array_inv!39382 _keys!600)))

(declare-fun b!1572085 () Bool)

(declare-fun res!1074152 () Bool)

(assert (=> b!1572085 (=> (not res!1074152) (not e!876595))))

(assert (=> b!1572085 (= res!1074152 (= (size!51205 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572086 () Bool)

(declare-fun res!1074151 () Bool)

(assert (=> b!1572086 (=> (not res!1074151) (not e!876595))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572086 (= res!1074151 (validKeyInArray!0 k!754))))

(declare-fun b!1572087 () Bool)

(assert (=> b!1572087 (= e!876595 false)))

(declare-datatypes ((SeekEntryResult!13568 0))(
  ( (MissingZero!13568 (index!56670 (_ BitVec 32))) (Found!13568 (index!56671 (_ BitVec 32))) (Intermediate!13568 (undefined!14380 Bool) (index!56672 (_ BitVec 32)) (x!141434 (_ BitVec 32))) (Undefined!13568) (MissingVacant!13568 (index!56673 (_ BitVec 32))) )
))
(declare-fun lt!673849 () SeekEntryResult!13568)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104974 (_ BitVec 32)) SeekEntryResult!13568)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572087 (= lt!673849 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!134904 res!1074153) b!1572085))

(assert (= (and b!1572085 res!1074152) b!1572086))

(assert (= (and b!1572086 res!1074151) b!1572087))

(declare-fun m!1445937 () Bool)

(assert (=> start!134904 m!1445937))

(declare-fun m!1445939 () Bool)

(assert (=> start!134904 m!1445939))

(declare-fun m!1445941 () Bool)

(assert (=> b!1572086 m!1445941))

(declare-fun m!1445943 () Bool)

(assert (=> b!1572087 m!1445943))

(assert (=> b!1572087 m!1445943))

(declare-fun m!1445945 () Bool)

(assert (=> b!1572087 m!1445945))

(push 1)

(assert (not b!1572086))

(assert (not start!134904))

(assert (not b!1572087))

(check-sat)

(pop 1)

(push 1)

(check-sat)

