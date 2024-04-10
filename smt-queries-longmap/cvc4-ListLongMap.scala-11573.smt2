; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134844 () Bool)

(assert start!134844)

(declare-fun res!1073987 () Bool)

(declare-fun e!876460 () Bool)

(assert (=> start!134844 (=> (not res!1073987) (not e!876460))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134844 (= res!1073987 (validMask!0 mask!889))))

(assert (=> start!134844 e!876460))

(assert (=> start!134844 true))

(declare-datatypes ((array!104941 0))(
  ( (array!104942 (arr!50640 (Array (_ BitVec 32) (_ BitVec 64))) (size!51190 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104941)

(declare-fun array_inv!39367 (array!104941) Bool)

(assert (=> start!134844 (array_inv!39367 _keys!600)))

(declare-fun b!1571869 () Bool)

(declare-fun res!1073988 () Bool)

(assert (=> b!1571869 (=> (not res!1073988) (not e!876460))))

(assert (=> b!1571869 (= res!1073988 (= (size!51190 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571870 () Bool)

(declare-fun res!1073986 () Bool)

(assert (=> b!1571870 (=> (not res!1073986) (not e!876460))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571870 (= res!1073986 (validKeyInArray!0 k!754))))

(declare-fun b!1571871 () Bool)

(assert (=> b!1571871 (= e!876460 false)))

(declare-datatypes ((SeekEntryResult!13553 0))(
  ( (MissingZero!13553 (index!56610 (_ BitVec 32))) (Found!13553 (index!56611 (_ BitVec 32))) (Intermediate!13553 (undefined!14365 Bool) (index!56612 (_ BitVec 32)) (x!141373 (_ BitVec 32))) (Undefined!13553) (MissingVacant!13553 (index!56613 (_ BitVec 32))) )
))
(declare-fun lt!673768 () SeekEntryResult!13553)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104941 (_ BitVec 32)) SeekEntryResult!13553)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571871 (= lt!673768 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!134844 res!1073987) b!1571869))

(assert (= (and b!1571869 res!1073988) b!1571870))

(assert (= (and b!1571870 res!1073986) b!1571871))

(declare-fun m!1445757 () Bool)

(assert (=> start!134844 m!1445757))

(declare-fun m!1445759 () Bool)

(assert (=> start!134844 m!1445759))

(declare-fun m!1445761 () Bool)

(assert (=> b!1571870 m!1445761))

(declare-fun m!1445763 () Bool)

(assert (=> b!1571871 m!1445763))

(assert (=> b!1571871 m!1445763))

(declare-fun m!1445765 () Bool)

(assert (=> b!1571871 m!1445765))

(push 1)

(assert (not b!1571870))

(assert (not b!1571871))

(assert (not start!134844))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

