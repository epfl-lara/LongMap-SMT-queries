; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112242 () Bool)

(assert start!112242)

(declare-fun b_free!30637 () Bool)

(declare-fun b_next!30637 () Bool)

(assert (=> start!112242 (= b_free!30637 (not b_next!30637))))

(declare-fun tp!107548 () Bool)

(declare-fun b_and!49329 () Bool)

(assert (=> start!112242 (= tp!107548 b_and!49329)))

(declare-fun b!1329665 () Bool)

(declare-fun res!882256 () Bool)

(declare-fun e!757978 () Bool)

(assert (=> b!1329665 (=> (not res!882256) (not e!757978))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89986 0))(
  ( (array!89987 (arr!43459 (Array (_ BitVec 32) (_ BitVec 64))) (size!44009 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89986)

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1329665 (= res!882256 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44009 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1329666 () Bool)

(declare-fun e!757977 () Bool)

(declare-fun tp_is_empty!36547 () Bool)

(assert (=> b!1329666 (= e!757977 tp_is_empty!36547)))

(declare-fun b!1329667 () Bool)

(declare-fun res!882259 () Bool)

(assert (=> b!1329667 (=> (not res!882259) (not e!757978))))

(assert (=> b!1329667 (= res!882259 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!56494 () Bool)

(declare-fun mapRes!56494 () Bool)

(assert (=> mapIsEmpty!56494 mapRes!56494))

(declare-fun b!1329669 () Bool)

(declare-fun res!882258 () Bool)

(assert (=> b!1329669 (=> (not res!882258) (not e!757978))))

(assert (=> b!1329669 (= res!882258 (not (= (select (arr!43459 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1329670 () Bool)

(declare-fun res!882261 () Bool)

(assert (=> b!1329670 (=> (not res!882261) (not e!757978))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1329670 (= res!882261 (validKeyInArray!0 (select (arr!43459 _keys!1590) from!1980)))))

(declare-fun b!1329671 () Bool)

(declare-fun res!882264 () Bool)

(assert (=> b!1329671 (=> (not res!882264) (not e!757978))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89986 (_ BitVec 32)) Bool)

(assert (=> b!1329671 (= res!882264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1329672 () Bool)

(assert (=> b!1329672 (= e!757978 (not true))))

(declare-datatypes ((V!53833 0))(
  ( (V!53834 (val!18348 Int)) )
))
(declare-datatypes ((tuple2!23624 0))(
  ( (tuple2!23625 (_1!11823 (_ BitVec 64)) (_2!11823 V!53833)) )
))
(declare-datatypes ((List!30775 0))(
  ( (Nil!30772) (Cons!30771 (h!31980 tuple2!23624) (t!44825 List!30775)) )
))
(declare-datatypes ((ListLongMap!21281 0))(
  ( (ListLongMap!21282 (toList!10656 List!30775)) )
))
(declare-fun lt!590992 () ListLongMap!21281)

(declare-fun contains!8820 (ListLongMap!21281 (_ BitVec 64)) Bool)

(assert (=> b!1329672 (contains!8820 lt!590992 k!1153)))

(declare-datatypes ((Unit!43759 0))(
  ( (Unit!43760) )
))
(declare-fun lt!590991 () Unit!43759)

(declare-fun minValue!1262 () V!53833)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!242 ((_ BitVec 64) (_ BitVec 64) V!53833 ListLongMap!21281) Unit!43759)

(assert (=> b!1329672 (= lt!590991 (lemmaInListMapAfterAddingDiffThenInBefore!242 k!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!590992))))

(declare-datatypes ((ValueCell!17375 0))(
  ( (ValueCellFull!17375 (v!20985 V!53833)) (EmptyCell!17375) )
))
(declare-datatypes ((array!89988 0))(
  ( (array!89989 (arr!43460 (Array (_ BitVec 32) ValueCell!17375)) (size!44010 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89988)

(declare-fun defaultEntry!1323 () Int)

(declare-fun zeroValue!1262 () V!53833)

(declare-fun +!4655 (ListLongMap!21281 tuple2!23624) ListLongMap!21281)

(declare-fun getCurrentListMapNoExtraKeys!6293 (array!89986 array!89988 (_ BitVec 32) (_ BitVec 32) V!53833 V!53833 (_ BitVec 32) Int) ListLongMap!21281)

(declare-fun get!21897 (ValueCell!17375 V!53833) V!53833)

(declare-fun dynLambda!3594 (Int (_ BitVec 64)) V!53833)

(assert (=> b!1329672 (= lt!590992 (+!4655 (getCurrentListMapNoExtraKeys!6293 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23625 (select (arr!43459 _keys!1590) from!1980) (get!21897 (select (arr!43460 _values!1320) from!1980) (dynLambda!3594 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1329673 () Bool)

(declare-fun res!882260 () Bool)

(assert (=> b!1329673 (=> (not res!882260) (not e!757978))))

(declare-datatypes ((List!30776 0))(
  ( (Nil!30773) (Cons!30772 (h!31981 (_ BitVec 64)) (t!44826 List!30776)) )
))
(declare-fun arrayNoDuplicates!0 (array!89986 (_ BitVec 32) List!30776) Bool)

(assert (=> b!1329673 (= res!882260 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30773))))

(declare-fun res!882262 () Bool)

(assert (=> start!112242 (=> (not res!882262) (not e!757978))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112242 (= res!882262 (validMask!0 mask!1998))))

(assert (=> start!112242 e!757978))

(declare-fun e!757981 () Bool)

(declare-fun array_inv!32791 (array!89988) Bool)

(assert (=> start!112242 (and (array_inv!32791 _values!1320) e!757981)))

(assert (=> start!112242 true))

(declare-fun array_inv!32792 (array!89986) Bool)

(assert (=> start!112242 (array_inv!32792 _keys!1590)))

(assert (=> start!112242 tp!107548))

(assert (=> start!112242 tp_is_empty!36547))

(declare-fun b!1329668 () Bool)

(declare-fun res!882263 () Bool)

(assert (=> b!1329668 (=> (not res!882263) (not e!757978))))

(declare-fun getCurrentListMap!5645 (array!89986 array!89988 (_ BitVec 32) (_ BitVec 32) V!53833 V!53833 (_ BitVec 32) Int) ListLongMap!21281)

(assert (=> b!1329668 (= res!882263 (contains!8820 (getCurrentListMap!5645 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1329674 () Bool)

(declare-fun res!882257 () Bool)

(assert (=> b!1329674 (=> (not res!882257) (not e!757978))))

(assert (=> b!1329674 (= res!882257 (and (= (size!44010 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44009 _keys!1590) (size!44010 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1329675 () Bool)

(declare-fun e!757979 () Bool)

(assert (=> b!1329675 (= e!757979 tp_is_empty!36547)))

(declare-fun mapNonEmpty!56494 () Bool)

(declare-fun tp!107547 () Bool)

(assert (=> mapNonEmpty!56494 (= mapRes!56494 (and tp!107547 e!757977))))

(declare-fun mapKey!56494 () (_ BitVec 32))

(declare-fun mapRest!56494 () (Array (_ BitVec 32) ValueCell!17375))

(declare-fun mapValue!56494 () ValueCell!17375)

(assert (=> mapNonEmpty!56494 (= (arr!43460 _values!1320) (store mapRest!56494 mapKey!56494 mapValue!56494))))

(declare-fun b!1329676 () Bool)

(assert (=> b!1329676 (= e!757981 (and e!757979 mapRes!56494))))

(declare-fun condMapEmpty!56494 () Bool)

(declare-fun mapDefault!56494 () ValueCell!17375)

