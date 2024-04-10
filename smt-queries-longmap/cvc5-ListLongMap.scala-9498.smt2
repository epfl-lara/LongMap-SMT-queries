; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112654 () Bool)

(assert start!112654)

(declare-fun b_free!30991 () Bool)

(declare-fun b_next!30991 () Bool)

(assert (=> start!112654 (= b_free!30991 (not b_next!30991))))

(declare-fun tp!108614 () Bool)

(declare-fun b_and!49919 () Bool)

(assert (=> start!112654 (= tp!108614 b_and!49919)))

(declare-fun b!1336139 () Bool)

(declare-fun res!886693 () Bool)

(declare-fun e!760958 () Bool)

(assert (=> b!1336139 (=> (not res!886693) (not e!760958))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90662 0))(
  ( (array!90663 (arr!43796 (Array (_ BitVec 32) (_ BitVec 64))) (size!44346 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90662)

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1336139 (= res!886693 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44346 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1336140 () Bool)

(declare-fun res!886699 () Bool)

(assert (=> b!1336140 (=> (not res!886699) (not e!760958))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1336140 (= res!886699 (validKeyInArray!0 (select (arr!43796 _keys!1590) from!1980)))))

(declare-fun b!1336141 () Bool)

(assert (=> b!1336141 (= e!760958 false)))

(declare-datatypes ((V!54305 0))(
  ( (V!54306 (val!18525 Int)) )
))
(declare-datatypes ((ValueCell!17552 0))(
  ( (ValueCellFull!17552 (v!21165 V!54305)) (EmptyCell!17552) )
))
(declare-datatypes ((array!90664 0))(
  ( (array!90665 (arr!43797 (Array (_ BitVec 32) ValueCell!17552)) (size!44347 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90664)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun lt!592733 () Bool)

(declare-fun minValue!1262 () V!54305)

(declare-fun zeroValue!1262 () V!54305)

(declare-datatypes ((tuple2!23890 0))(
  ( (tuple2!23891 (_1!11956 (_ BitVec 64)) (_2!11956 V!54305)) )
))
(declare-datatypes ((List!31032 0))(
  ( (Nil!31029) (Cons!31028 (h!32237 tuple2!23890) (t!45304 List!31032)) )
))
(declare-datatypes ((ListLongMap!21547 0))(
  ( (ListLongMap!21548 (toList!10789 List!31032)) )
))
(declare-fun contains!8954 (ListLongMap!21547 (_ BitVec 64)) Bool)

(declare-fun +!4732 (ListLongMap!21547 tuple2!23890) ListLongMap!21547)

(declare-fun getCurrentListMapNoExtraKeys!6374 (array!90662 array!90664 (_ BitVec 32) (_ BitVec 32) V!54305 V!54305 (_ BitVec 32) Int) ListLongMap!21547)

(declare-fun get!22095 (ValueCell!17552 V!54305) V!54305)

(declare-fun dynLambda!3671 (Int (_ BitVec 64)) V!54305)

(assert (=> b!1336141 (= lt!592733 (contains!8954 (+!4732 (+!4732 (getCurrentListMapNoExtraKeys!6374 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23891 (select (arr!43796 _keys!1590) from!1980) (get!22095 (select (arr!43797 _values!1320) from!1980) (dynLambda!3671 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23891 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k!1153))))

(declare-fun b!1336142 () Bool)

(declare-fun e!760960 () Bool)

(declare-fun tp_is_empty!36901 () Bool)

(assert (=> b!1336142 (= e!760960 tp_is_empty!36901)))

(declare-fun b!1336143 () Bool)

(declare-fun res!886695 () Bool)

(assert (=> b!1336143 (=> (not res!886695) (not e!760958))))

(assert (=> b!1336143 (= res!886695 (not (= (select (arr!43796 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1336144 () Bool)

(declare-fun res!886694 () Bool)

(assert (=> b!1336144 (=> (not res!886694) (not e!760958))))

(assert (=> b!1336144 (= res!886694 (and (= (size!44347 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44346 _keys!1590) (size!44347 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57029 () Bool)

(declare-fun mapRes!57029 () Bool)

(declare-fun tp!108613 () Bool)

(declare-fun e!760956 () Bool)

(assert (=> mapNonEmpty!57029 (= mapRes!57029 (and tp!108613 e!760956))))

(declare-fun mapValue!57029 () ValueCell!17552)

(declare-fun mapRest!57029 () (Array (_ BitVec 32) ValueCell!17552))

(declare-fun mapKey!57029 () (_ BitVec 32))

(assert (=> mapNonEmpty!57029 (= (arr!43797 _values!1320) (store mapRest!57029 mapKey!57029 mapValue!57029))))

(declare-fun b!1336145 () Bool)

(declare-fun res!886698 () Bool)

(assert (=> b!1336145 (=> (not res!886698) (not e!760958))))

(declare-datatypes ((List!31033 0))(
  ( (Nil!31030) (Cons!31029 (h!32238 (_ BitVec 64)) (t!45305 List!31033)) )
))
(declare-fun arrayNoDuplicates!0 (array!90662 (_ BitVec 32) List!31033) Bool)

(assert (=> b!1336145 (= res!886698 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31030))))

(declare-fun b!1336146 () Bool)

(declare-fun res!886692 () Bool)

(assert (=> b!1336146 (=> (not res!886692) (not e!760958))))

(assert (=> b!1336146 (= res!886692 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!886700 () Bool)

(assert (=> start!112654 (=> (not res!886700) (not e!760958))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112654 (= res!886700 (validMask!0 mask!1998))))

(assert (=> start!112654 e!760958))

(declare-fun e!760959 () Bool)

(declare-fun array_inv!33027 (array!90664) Bool)

(assert (=> start!112654 (and (array_inv!33027 _values!1320) e!760959)))

(assert (=> start!112654 true))

(declare-fun array_inv!33028 (array!90662) Bool)

(assert (=> start!112654 (array_inv!33028 _keys!1590)))

(assert (=> start!112654 tp!108614))

(assert (=> start!112654 tp_is_empty!36901))

(declare-fun b!1336147 () Bool)

(declare-fun res!886697 () Bool)

(assert (=> b!1336147 (=> (not res!886697) (not e!760958))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90662 (_ BitVec 32)) Bool)

(assert (=> b!1336147 (= res!886697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapIsEmpty!57029 () Bool)

(assert (=> mapIsEmpty!57029 mapRes!57029))

(declare-fun b!1336148 () Bool)

(assert (=> b!1336148 (= e!760959 (and e!760960 mapRes!57029))))

(declare-fun condMapEmpty!57029 () Bool)

(declare-fun mapDefault!57029 () ValueCell!17552)

