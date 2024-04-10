; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113462 () Bool)

(assert start!113462)

(declare-fun b_free!31513 () Bool)

(declare-fun b_next!31513 () Bool)

(assert (=> start!113462 (= b_free!31513 (not b_next!31513))))

(declare-fun tp!110344 () Bool)

(declare-fun b_and!50801 () Bool)

(assert (=> start!113462 (= tp!110344 b_and!50801)))

(declare-fun b!1347005 () Bool)

(declare-fun res!893825 () Bool)

(declare-fun e!766407 () Bool)

(assert (=> b!1347005 (=> (not res!893825) (not e!766407))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91858 0))(
  ( (array!91859 (arr!44385 (Array (_ BitVec 32) (_ BitVec 64))) (size!44935 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91858)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1347005 (= res!893825 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44935 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1347006 () Bool)

(declare-fun res!893819 () Bool)

(assert (=> b!1347006 (=> (not res!893819) (not e!766407))))

(declare-datatypes ((List!31431 0))(
  ( (Nil!31428) (Cons!31427 (h!32636 (_ BitVec 64)) (t!46023 List!31431)) )
))
(declare-fun arrayNoDuplicates!0 (array!91858 (_ BitVec 32) List!31431) Bool)

(assert (=> b!1347006 (= res!893819 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31428))))

(declare-fun b!1347007 () Bool)

(declare-fun res!893824 () Bool)

(assert (=> b!1347007 (=> (not res!893824) (not e!766407))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1347007 (= res!893824 (validKeyInArray!0 (select (arr!44385 _keys!1571) from!1960)))))

(declare-datatypes ((V!55121 0))(
  ( (V!55122 (val!18831 Int)) )
))
(declare-fun minValue!1245 () V!55121)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!55121)

(declare-datatypes ((ValueCell!17858 0))(
  ( (ValueCellFull!17858 (v!21479 V!55121)) (EmptyCell!17858) )
))
(declare-datatypes ((array!91860 0))(
  ( (array!91861 (arr!44386 (Array (_ BitVec 32) ValueCell!17858)) (size!44936 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91860)

(declare-fun defaultEntry!1306 () Int)

(declare-fun b!1347008 () Bool)

(declare-datatypes ((tuple2!24276 0))(
  ( (tuple2!24277 (_1!12149 (_ BitVec 64)) (_2!12149 V!55121)) )
))
(declare-datatypes ((List!31432 0))(
  ( (Nil!31429) (Cons!31428 (h!32637 tuple2!24276) (t!46024 List!31432)) )
))
(declare-datatypes ((ListLongMap!21933 0))(
  ( (ListLongMap!21934 (toList!10982 List!31432)) )
))
(declare-fun contains!9158 (ListLongMap!21933 (_ BitVec 64)) Bool)

(declare-fun +!4837 (ListLongMap!21933 tuple2!24276) ListLongMap!21933)

(declare-fun getCurrentListMapNoExtraKeys!6483 (array!91858 array!91860 (_ BitVec 32) (_ BitVec 32) V!55121 V!55121 (_ BitVec 32) Int) ListLongMap!21933)

(declare-fun get!22414 (ValueCell!17858 V!55121) V!55121)

(declare-fun dynLambda!3776 (Int (_ BitVec 64)) V!55121)

(assert (=> b!1347008 (= e!766407 (not (contains!9158 (+!4837 (+!4837 (getCurrentListMapNoExtraKeys!6483 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24277 (select (arr!44385 _keys!1571) from!1960) (get!22414 (select (arr!44386 _values!1303) from!1960) (dynLambda!3776 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24277 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k!1142)))))

(declare-fun b!1347009 () Bool)

(declare-fun e!766408 () Bool)

(declare-fun tp_is_empty!37513 () Bool)

(assert (=> b!1347009 (= e!766408 tp_is_empty!37513)))

(declare-fun mapIsEmpty!57976 () Bool)

(declare-fun mapRes!57976 () Bool)

(assert (=> mapIsEmpty!57976 mapRes!57976))

(declare-fun b!1347010 () Bool)

(declare-fun e!766405 () Bool)

(assert (=> b!1347010 (= e!766405 tp_is_empty!37513)))

(declare-fun res!893820 () Bool)

(assert (=> start!113462 (=> (not res!893820) (not e!766407))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113462 (= res!893820 (validMask!0 mask!1977))))

(assert (=> start!113462 e!766407))

(assert (=> start!113462 tp_is_empty!37513))

(assert (=> start!113462 true))

(declare-fun array_inv!33439 (array!91858) Bool)

(assert (=> start!113462 (array_inv!33439 _keys!1571)))

(declare-fun e!766409 () Bool)

(declare-fun array_inv!33440 (array!91860) Bool)

(assert (=> start!113462 (and (array_inv!33440 _values!1303) e!766409)))

(assert (=> start!113462 tp!110344))

(declare-fun mapNonEmpty!57976 () Bool)

(declare-fun tp!110343 () Bool)

(assert (=> mapNonEmpty!57976 (= mapRes!57976 (and tp!110343 e!766405))))

(declare-fun mapValue!57976 () ValueCell!17858)

(declare-fun mapRest!57976 () (Array (_ BitVec 32) ValueCell!17858))

(declare-fun mapKey!57976 () (_ BitVec 32))

(assert (=> mapNonEmpty!57976 (= (arr!44386 _values!1303) (store mapRest!57976 mapKey!57976 mapValue!57976))))

(declare-fun b!1347011 () Bool)

(assert (=> b!1347011 (= e!766409 (and e!766408 mapRes!57976))))

(declare-fun condMapEmpty!57976 () Bool)

(declare-fun mapDefault!57976 () ValueCell!17858)

