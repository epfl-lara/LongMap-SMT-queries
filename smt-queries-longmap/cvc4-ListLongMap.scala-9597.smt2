; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113448 () Bool)

(assert start!113448)

(declare-fun b_free!31499 () Bool)

(declare-fun b_next!31499 () Bool)

(assert (=> start!113448 (= b_free!31499 (not b_next!31499))))

(declare-fun tp!110301 () Bool)

(declare-fun b_and!50787 () Bool)

(assert (=> start!113448 (= tp!110301 b_and!50787)))

(declare-fun res!893635 () Bool)

(declare-fun e!766301 () Bool)

(assert (=> start!113448 (=> (not res!893635) (not e!766301))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113448 (= res!893635 (validMask!0 mask!1977))))

(assert (=> start!113448 e!766301))

(declare-fun tp_is_empty!37499 () Bool)

(assert (=> start!113448 tp_is_empty!37499))

(assert (=> start!113448 true))

(declare-datatypes ((array!91830 0))(
  ( (array!91831 (arr!44371 (Array (_ BitVec 32) (_ BitVec 64))) (size!44921 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91830)

(declare-fun array_inv!33427 (array!91830) Bool)

(assert (=> start!113448 (array_inv!33427 _keys!1571)))

(declare-datatypes ((V!55101 0))(
  ( (V!55102 (val!18824 Int)) )
))
(declare-datatypes ((ValueCell!17851 0))(
  ( (ValueCellFull!17851 (v!21472 V!55101)) (EmptyCell!17851) )
))
(declare-datatypes ((array!91832 0))(
  ( (array!91833 (arr!44372 (Array (_ BitVec 32) ValueCell!17851)) (size!44922 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91832)

(declare-fun e!766302 () Bool)

(declare-fun array_inv!33428 (array!91832) Bool)

(assert (=> start!113448 (and (array_inv!33428 _values!1303) e!766302)))

(assert (=> start!113448 tp!110301))

(declare-fun b!1346757 () Bool)

(declare-fun res!893634 () Bool)

(assert (=> b!1346757 (=> (not res!893634) (not e!766301))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1346757 (= res!893634 (and (= (size!44922 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44921 _keys!1571) (size!44922 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1346758 () Bool)

(declare-fun res!893633 () Bool)

(assert (=> b!1346758 (=> (not res!893633) (not e!766301))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1346758 (= res!893633 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44921 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1346759 () Bool)

(assert (=> b!1346759 (= e!766301 false)))

(declare-fun minValue!1245 () V!55101)

(declare-fun lt!595542 () Bool)

(declare-fun zeroValue!1245 () V!55101)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24262 0))(
  ( (tuple2!24263 (_1!12142 (_ BitVec 64)) (_2!12142 V!55101)) )
))
(declare-datatypes ((List!31419 0))(
  ( (Nil!31416) (Cons!31415 (h!32624 tuple2!24262) (t!46009 List!31419)) )
))
(declare-datatypes ((ListLongMap!21919 0))(
  ( (ListLongMap!21920 (toList!10975 List!31419)) )
))
(declare-fun contains!9151 (ListLongMap!21919 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5927 (array!91830 array!91832 (_ BitVec 32) (_ BitVec 32) V!55101 V!55101 (_ BitVec 32) Int) ListLongMap!21919)

(assert (=> b!1346759 (= lt!595542 (contains!9151 (getCurrentListMap!5927 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun mapIsEmpty!57955 () Bool)

(declare-fun mapRes!57955 () Bool)

(assert (=> mapIsEmpty!57955 mapRes!57955))

(declare-fun mapNonEmpty!57955 () Bool)

(declare-fun tp!110302 () Bool)

(declare-fun e!766304 () Bool)

(assert (=> mapNonEmpty!57955 (= mapRes!57955 (and tp!110302 e!766304))))

(declare-fun mapValue!57955 () ValueCell!17851)

(declare-fun mapRest!57955 () (Array (_ BitVec 32) ValueCell!17851))

(declare-fun mapKey!57955 () (_ BitVec 32))

(assert (=> mapNonEmpty!57955 (= (arr!44372 _values!1303) (store mapRest!57955 mapKey!57955 mapValue!57955))))

(declare-fun b!1346760 () Bool)

(assert (=> b!1346760 (= e!766304 tp_is_empty!37499)))

(declare-fun b!1346761 () Bool)

(declare-fun e!766300 () Bool)

(assert (=> b!1346761 (= e!766302 (and e!766300 mapRes!57955))))

(declare-fun condMapEmpty!57955 () Bool)

(declare-fun mapDefault!57955 () ValueCell!17851)

