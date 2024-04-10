; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111800 () Bool)

(assert start!111800)

(declare-fun b_free!30457 () Bool)

(declare-fun b_next!30457 () Bool)

(assert (=> start!111800 (= b_free!30457 (not b_next!30457))))

(declare-fun tp!106847 () Bool)

(declare-fun b_and!48995 () Bool)

(assert (=> start!111800 (= tp!106847 b_and!48995)))

(declare-fun res!879393 () Bool)

(declare-fun e!755266 () Bool)

(assert (=> start!111800 (=> (not res!879393) (not e!755266))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111800 (= res!879393 (validMask!0 mask!2019))))

(assert (=> start!111800 e!755266))

(declare-datatypes ((array!89462 0))(
  ( (array!89463 (arr!43205 (Array (_ BitVec 32) (_ BitVec 64))) (size!43755 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89462)

(declare-fun array_inv!32611 (array!89462) Bool)

(assert (=> start!111800 (array_inv!32611 _keys!1609)))

(assert (=> start!111800 true))

(declare-fun tp_is_empty!36277 () Bool)

(assert (=> start!111800 tp_is_empty!36277))

(declare-datatypes ((V!53473 0))(
  ( (V!53474 (val!18213 Int)) )
))
(declare-datatypes ((ValueCell!17240 0))(
  ( (ValueCellFull!17240 (v!20843 V!53473)) (EmptyCell!17240) )
))
(declare-datatypes ((array!89464 0))(
  ( (array!89465 (arr!43206 (Array (_ BitVec 32) ValueCell!17240)) (size!43756 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89464)

(declare-fun e!755268 () Bool)

(declare-fun array_inv!32612 (array!89464) Bool)

(assert (=> start!111800 (and (array_inv!32612 _values!1337) e!755268)))

(assert (=> start!111800 tp!106847))

(declare-fun b!1324867 () Bool)

(declare-fun e!755267 () Bool)

(assert (=> b!1324867 (= e!755267 tp_is_empty!36277)))

(declare-fun b!1324868 () Bool)

(declare-fun mapRes!56063 () Bool)

(assert (=> b!1324868 (= e!755268 (and e!755267 mapRes!56063))))

(declare-fun condMapEmpty!56063 () Bool)

(declare-fun mapDefault!56063 () ValueCell!17240)

