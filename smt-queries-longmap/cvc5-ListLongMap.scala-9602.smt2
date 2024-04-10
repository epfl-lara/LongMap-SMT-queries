; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113532 () Bool)

(assert start!113532)

(declare-fun b_free!31525 () Bool)

(declare-fun b_next!31525 () Bool)

(assert (=> start!113532 (= b_free!31525 (not b_next!31525))))

(declare-fun tp!110384 () Bool)

(declare-fun b_and!50839 () Bool)

(assert (=> start!113532 (= tp!110384 b_and!50839)))

(declare-fun b!1347617 () Bool)

(declare-fun e!766742 () Bool)

(declare-fun tp_is_empty!37525 () Bool)

(assert (=> b!1347617 (= e!766742 tp_is_empty!37525)))

(declare-fun b!1347618 () Bool)

(declare-fun res!894145 () Bool)

(declare-fun e!766741 () Bool)

(assert (=> b!1347618 (=> (not res!894145) (not e!766741))))

(declare-datatypes ((V!55137 0))(
  ( (V!55138 (val!18837 Int)) )
))
(declare-fun minValue!1245 () V!55137)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91884 0))(
  ( (array!91885 (arr!44397 (Array (_ BitVec 32) (_ BitVec 64))) (size!44947 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91884)

(declare-fun zeroValue!1245 () V!55137)

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17864 0))(
  ( (ValueCellFull!17864 (v!21488 V!55137)) (EmptyCell!17864) )
))
(declare-datatypes ((array!91886 0))(
  ( (array!91887 (arr!44398 (Array (_ BitVec 32) ValueCell!17864)) (size!44948 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91886)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((tuple2!24284 0))(
  ( (tuple2!24285 (_1!12153 (_ BitVec 64)) (_2!12153 V!55137)) )
))
(declare-datatypes ((List!31439 0))(
  ( (Nil!31436) (Cons!31435 (h!32644 tuple2!24284) (t!46043 List!31439)) )
))
(declare-datatypes ((ListLongMap!21941 0))(
  ( (ListLongMap!21942 (toList!10986 List!31439)) )
))
(declare-fun contains!9164 (ListLongMap!21941 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5937 (array!91884 array!91886 (_ BitVec 32) (_ BitVec 32) V!55137 V!55137 (_ BitVec 32) Int) ListLongMap!21941)

(assert (=> b!1347618 (= res!894145 (contains!9164 (getCurrentListMap!5937 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun mapNonEmpty!57998 () Bool)

(declare-fun mapRes!57998 () Bool)

(declare-fun tp!110383 () Bool)

(assert (=> mapNonEmpty!57998 (= mapRes!57998 (and tp!110383 e!766742))))

(declare-fun mapValue!57998 () ValueCell!17864)

(declare-fun mapRest!57998 () (Array (_ BitVec 32) ValueCell!17864))

(declare-fun mapKey!57998 () (_ BitVec 32))

(assert (=> mapNonEmpty!57998 (= (arr!44398 _values!1303) (store mapRest!57998 mapKey!57998 mapValue!57998))))

(declare-fun b!1347619 () Bool)

(declare-fun res!894143 () Bool)

(assert (=> b!1347619 (=> (not res!894143) (not e!766741))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1347619 (= res!894143 (validKeyInArray!0 (select (arr!44397 _keys!1571) from!1960)))))

(declare-fun b!1347620 () Bool)

(declare-fun res!894148 () Bool)

(assert (=> b!1347620 (=> (not res!894148) (not e!766741))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91884 (_ BitVec 32)) Bool)

(assert (=> b!1347620 (= res!894148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1347621 () Bool)

(declare-fun res!894149 () Bool)

(assert (=> b!1347621 (=> (not res!894149) (not e!766741))))

(assert (=> b!1347621 (= res!894149 (not (= (select (arr!44397 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1347622 () Bool)

(declare-fun res!894144 () Bool)

(assert (=> b!1347622 (=> (not res!894144) (not e!766741))))

(assert (=> b!1347622 (= res!894144 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44947 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1347623 () Bool)

(declare-fun res!894147 () Bool)

(assert (=> b!1347623 (=> (not res!894147) (not e!766741))))

(assert (=> b!1347623 (= res!894147 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1347624 () Bool)

(declare-fun res!894146 () Bool)

(assert (=> b!1347624 (=> (not res!894146) (not e!766741))))

(declare-datatypes ((List!31440 0))(
  ( (Nil!31437) (Cons!31436 (h!32645 (_ BitVec 64)) (t!46044 List!31440)) )
))
(declare-fun arrayNoDuplicates!0 (array!91884 (_ BitVec 32) List!31440) Bool)

(assert (=> b!1347624 (= res!894146 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31437))))

(declare-fun res!894142 () Bool)

(assert (=> start!113532 (=> (not res!894142) (not e!766741))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113532 (= res!894142 (validMask!0 mask!1977))))

(assert (=> start!113532 e!766741))

(assert (=> start!113532 tp_is_empty!37525))

(assert (=> start!113532 true))

(declare-fun array_inv!33449 (array!91884) Bool)

(assert (=> start!113532 (array_inv!33449 _keys!1571)))

(declare-fun e!766739 () Bool)

(declare-fun array_inv!33450 (array!91886) Bool)

(assert (=> start!113532 (and (array_inv!33450 _values!1303) e!766739)))

(assert (=> start!113532 tp!110384))

(declare-fun b!1347625 () Bool)

(declare-fun e!766738 () Bool)

(assert (=> b!1347625 (= e!766739 (and e!766738 mapRes!57998))))

(declare-fun condMapEmpty!57998 () Bool)

(declare-fun mapDefault!57998 () ValueCell!17864)

