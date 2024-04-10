; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134978 () Bool)

(assert start!134978)

(declare-fun res!1074274 () Bool)

(declare-fun e!876727 () Bool)

(assert (=> start!134978 (=> (not res!1074274) (not e!876727))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134978 (= res!1074274 (validMask!0 mask!889))))

(assert (=> start!134978 e!876727))

(assert (=> start!134978 true))

(declare-datatypes ((array!104994 0))(
  ( (array!104995 (arr!50662 (Array (_ BitVec 32) (_ BitVec 64))) (size!51212 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104994)

(declare-fun array_inv!39389 (array!104994) Bool)

(assert (=> start!134978 (array_inv!39389 _keys!600)))

(declare-fun b!1572310 () Bool)

(declare-fun res!1074276 () Bool)

(assert (=> b!1572310 (=> (not res!1074276) (not e!876727))))

(assert (=> b!1572310 (= res!1074276 (= (size!51212 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572311 () Bool)

(declare-fun res!1074275 () Bool)

(assert (=> b!1572311 (=> (not res!1074275) (not e!876727))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572311 (= res!1074275 (validKeyInArray!0 k!754))))

(declare-fun b!1572312 () Bool)

(assert (=> b!1572312 (= e!876727 false)))

(declare-datatypes ((SeekEntryResult!13575 0))(
  ( (MissingZero!13575 (index!56698 (_ BitVec 32))) (Found!13575 (index!56699 (_ BitVec 32))) (Intermediate!13575 (undefined!14387 Bool) (index!56700 (_ BitVec 32)) (x!141477 (_ BitVec 32))) (Undefined!13575) (MissingVacant!13575 (index!56701 (_ BitVec 32))) )
))
(declare-fun lt!673942 () SeekEntryResult!13575)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104994 (_ BitVec 32)) SeekEntryResult!13575)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572312 (= lt!673942 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!134978 res!1074274) b!1572310))

(assert (= (and b!1572310 res!1074276) b!1572311))

(assert (= (and b!1572311 res!1074275) b!1572312))

(declare-fun m!1446067 () Bool)

(assert (=> start!134978 m!1446067))

(declare-fun m!1446069 () Bool)

(assert (=> start!134978 m!1446069))

(declare-fun m!1446071 () Bool)

(assert (=> b!1572311 m!1446071))

(declare-fun m!1446073 () Bool)

(assert (=> b!1572312 m!1446073))

(assert (=> b!1572312 m!1446073))

(declare-fun m!1446075 () Bool)

(assert (=> b!1572312 m!1446075))

(push 1)

(assert (not b!1572312))

(assert (not start!134978))

(assert (not b!1572311))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

