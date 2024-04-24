; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135502 () Bool)

(assert start!135502)

(declare-fun res!1075429 () Bool)

(declare-fun e!878482 () Bool)

(assert (=> start!135502 (=> (not res!1075429) (not e!878482))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135502 (= res!1075429 (validMask!0 mask!889))))

(assert (=> start!135502 e!878482))

(assert (=> start!135502 true))

(declare-datatypes ((array!105174 0))(
  ( (array!105175 (arr!50742 (Array (_ BitVec 32) (_ BitVec 64))) (size!51293 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105174)

(declare-fun array_inv!39697 (array!105174) Bool)

(assert (=> start!135502 (array_inv!39697 _keys!600)))

(declare-fun b!1575142 () Bool)

(declare-fun res!1075428 () Bool)

(assert (=> b!1575142 (=> (not res!1075428) (not e!878482))))

(assert (=> b!1575142 (= res!1075428 (= (size!51293 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1575143 () Bool)

(declare-fun res!1075430 () Bool)

(assert (=> b!1575143 (=> (not res!1075430) (not e!878482))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575143 (= res!1075430 (validKeyInArray!0 k!754))))

(declare-fun b!1575144 () Bool)

(assert (=> b!1575144 (= e!878482 false)))

(declare-datatypes ((SeekEntryResult!13549 0))(
  ( (MissingZero!13549 (index!56594 (_ BitVec 32))) (Found!13549 (index!56595 (_ BitVec 32))) (Intermediate!13549 (undefined!14361 Bool) (index!56596 (_ BitVec 32)) (x!141578 (_ BitVec 32))) (Undefined!13549) (MissingVacant!13549 (index!56597 (_ BitVec 32))) )
))
(declare-fun lt!675000 () SeekEntryResult!13549)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105174 (_ BitVec 32)) SeekEntryResult!13549)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575144 (= lt!675000 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135502 res!1075429) b!1575142))

(assert (= (and b!1575142 res!1075428) b!1575143))

(assert (= (and b!1575143 res!1075430) b!1575144))

(declare-fun m!1448639 () Bool)

(assert (=> start!135502 m!1448639))

(declare-fun m!1448641 () Bool)

(assert (=> start!135502 m!1448641))

(declare-fun m!1448643 () Bool)

(assert (=> b!1575143 m!1448643))

(declare-fun m!1448645 () Bool)

(assert (=> b!1575144 m!1448645))

(assert (=> b!1575144 m!1448645))

(declare-fun m!1448647 () Bool)

(assert (=> b!1575144 m!1448647))

(push 1)

(assert (not b!1575143))

(assert (not start!135502))

(assert (not b!1575144))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

