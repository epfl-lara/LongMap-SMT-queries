; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133744 () Bool)

(assert start!133744)

(declare-fun b_free!32107 () Bool)

(declare-fun b_next!32107 () Bool)

(assert (=> start!133744 (= b_free!32107 (not b_next!32107))))

(declare-fun tp!113525 () Bool)

(declare-fun b_and!51677 () Bool)

(assert (=> start!133744 (= tp!113525 b_and!51677)))

(declare-fun res!1069153 () Bool)

(declare-fun e!871615 () Bool)

(assert (=> start!133744 (=> (not res!1069153) (not e!871615))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133744 (= res!1069153 (validMask!0 mask!947))))

(assert (=> start!133744 e!871615))

(assert (=> start!133744 tp!113525))

(declare-fun tp_is_empty!38827 () Bool)

(assert (=> start!133744 tp_is_empty!38827))

(assert (=> start!133744 true))

(declare-datatypes ((array!104346 0))(
  ( (array!104347 (arr!50365 (Array (_ BitVec 32) (_ BitVec 64))) (size!50915 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104346)

(declare-fun array_inv!39139 (array!104346) Bool)

(assert (=> start!133744 (array_inv!39139 _keys!637)))

(declare-datatypes ((V!59977 0))(
  ( (V!59978 (val!19497 Int)) )
))
(declare-datatypes ((ValueCell!18383 0))(
  ( (ValueCellFull!18383 (v!22249 V!59977)) (EmptyCell!18383) )
))
(declare-datatypes ((array!104348 0))(
  ( (array!104349 (arr!50366 (Array (_ BitVec 32) ValueCell!18383)) (size!50916 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104348)

(declare-fun e!871618 () Bool)

(declare-fun array_inv!39140 (array!104348) Bool)

(assert (=> start!133744 (and (array_inv!39140 _values!487) e!871618)))

(declare-fun b!1563875 () Bool)

(declare-fun res!1069151 () Bool)

(assert (=> b!1563875 (=> (not res!1069151) (not e!871615))))

(declare-datatypes ((List!36540 0))(
  ( (Nil!36537) (Cons!36536 (h!37982 (_ BitVec 64)) (t!51387 List!36540)) )
))
(declare-fun arrayNoDuplicates!0 (array!104346 (_ BitVec 32) List!36540) Bool)

(assert (=> b!1563875 (= res!1069151 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36537))))

(declare-fun b!1563876 () Bool)

(declare-fun e!871613 () Bool)

(assert (=> b!1563876 (= e!871613 false)))

(declare-fun lt!671976 () Bool)

(declare-datatypes ((tuple2!25154 0))(
  ( (tuple2!25155 (_1!12588 (_ BitVec 64)) (_2!12588 V!59977)) )
))
(declare-datatypes ((List!36541 0))(
  ( (Nil!36538) (Cons!36537 (h!37983 tuple2!25154) (t!51388 List!36541)) )
))
(declare-datatypes ((ListLongMap!22589 0))(
  ( (ListLongMap!22590 (toList!11310 List!36541)) )
))
(declare-fun lt!671975 () ListLongMap!22589)

(declare-fun contains!10300 (ListLongMap!22589 (_ BitVec 64)) Bool)

(assert (=> b!1563876 (= lt!671976 (contains!10300 lt!671975 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!59616 () Bool)

(declare-fun mapRes!59616 () Bool)

(declare-fun tp!113526 () Bool)

(declare-fun e!871616 () Bool)

(assert (=> mapNonEmpty!59616 (= mapRes!59616 (and tp!113526 e!871616))))

(declare-fun mapValue!59616 () ValueCell!18383)

(declare-fun mapRest!59616 () (Array (_ BitVec 32) ValueCell!18383))

(declare-fun mapKey!59616 () (_ BitVec 32))

(assert (=> mapNonEmpty!59616 (= (arr!50366 _values!487) (store mapRest!59616 mapKey!59616 mapValue!59616))))

(declare-fun b!1563877 () Bool)

(declare-fun e!871617 () Bool)

(assert (=> b!1563877 (= e!871618 (and e!871617 mapRes!59616))))

(declare-fun condMapEmpty!59616 () Bool)

(declare-fun mapDefault!59616 () ValueCell!18383)

