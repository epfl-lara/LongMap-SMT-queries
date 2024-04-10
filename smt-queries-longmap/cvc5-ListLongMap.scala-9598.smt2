; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113450 () Bool)

(assert start!113450)

(declare-fun b_free!31501 () Bool)

(declare-fun b_next!31501 () Bool)

(assert (=> start!113450 (= b_free!31501 (not b_next!31501))))

(declare-fun tp!110307 () Bool)

(declare-fun b_and!50789 () Bool)

(assert (=> start!113450 (= tp!110307 b_and!50789)))

(declare-fun b!1346789 () Bool)

(declare-fun res!893657 () Bool)

(declare-fun e!766318 () Bool)

(assert (=> b!1346789 (=> (not res!893657) (not e!766318))))

(declare-datatypes ((V!55105 0))(
  ( (V!55106 (val!18825 Int)) )
))
(declare-fun minValue!1245 () V!55105)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91834 0))(
  ( (array!91835 (arr!44373 (Array (_ BitVec 32) (_ BitVec 64))) (size!44923 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91834)

(declare-fun zeroValue!1245 () V!55105)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((ValueCell!17852 0))(
  ( (ValueCellFull!17852 (v!21473 V!55105)) (EmptyCell!17852) )
))
(declare-datatypes ((array!91836 0))(
  ( (array!91837 (arr!44374 (Array (_ BitVec 32) ValueCell!17852)) (size!44924 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91836)

(declare-datatypes ((tuple2!24264 0))(
  ( (tuple2!24265 (_1!12143 (_ BitVec 64)) (_2!12143 V!55105)) )
))
(declare-datatypes ((List!31420 0))(
  ( (Nil!31417) (Cons!31416 (h!32625 tuple2!24264) (t!46010 List!31420)) )
))
(declare-datatypes ((ListLongMap!21921 0))(
  ( (ListLongMap!21922 (toList!10976 List!31420)) )
))
(declare-fun contains!9152 (ListLongMap!21921 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5928 (array!91834 array!91836 (_ BitVec 32) (_ BitVec 32) V!55105 V!55105 (_ BitVec 32) Int) ListLongMap!21921)

(assert (=> b!1346789 (= res!893657 (contains!9152 (getCurrentListMap!5928 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1346790 () Bool)

(declare-fun e!766319 () Bool)

(declare-fun e!766317 () Bool)

(declare-fun mapRes!57958 () Bool)

(assert (=> b!1346790 (= e!766319 (and e!766317 mapRes!57958))))

(declare-fun condMapEmpty!57958 () Bool)

(declare-fun mapDefault!57958 () ValueCell!17852)

