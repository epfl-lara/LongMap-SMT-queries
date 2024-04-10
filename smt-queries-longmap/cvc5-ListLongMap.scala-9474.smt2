; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112452 () Bool)

(assert start!112452)

(declare-fun b_free!30847 () Bool)

(declare-fun b_next!30847 () Bool)

(assert (=> start!112452 (= b_free!30847 (not b_next!30847))))

(declare-fun tp!108177 () Bool)

(declare-fun b_and!49695 () Bool)

(assert (=> start!112452 (= tp!108177 b_and!49695)))

(declare-fun mapNonEmpty!56809 () Bool)

(declare-fun mapRes!56809 () Bool)

(declare-fun tp!108178 () Bool)

(declare-fun e!759554 () Bool)

(assert (=> mapNonEmpty!56809 (= mapRes!56809 (and tp!108178 e!759554))))

(declare-datatypes ((V!54113 0))(
  ( (V!54114 (val!18453 Int)) )
))
(declare-datatypes ((ValueCell!17480 0))(
  ( (ValueCellFull!17480 (v!21090 V!54113)) (EmptyCell!17480) )
))
(declare-fun mapRest!56809 () (Array (_ BitVec 32) ValueCell!17480))

(declare-datatypes ((array!90388 0))(
  ( (array!90389 (arr!43660 (Array (_ BitVec 32) ValueCell!17480)) (size!44210 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90388)

(declare-fun mapKey!56809 () (_ BitVec 32))

(declare-fun mapValue!56809 () ValueCell!17480)

(assert (=> mapNonEmpty!56809 (= (arr!43660 _values!1320) (store mapRest!56809 mapKey!56809 mapValue!56809))))

(declare-fun b!1333304 () Bool)

(declare-fun res!884797 () Bool)

(declare-fun e!759553 () Bool)

(assert (=> b!1333304 (=> (not res!884797) (not e!759553))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-datatypes ((array!90390 0))(
  ( (array!90391 (arr!43661 (Array (_ BitVec 32) (_ BitVec 64))) (size!44211 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90390)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54113)

(declare-fun zeroValue!1262 () V!54113)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((tuple2!23784 0))(
  ( (tuple2!23785 (_1!11903 (_ BitVec 64)) (_2!11903 V!54113)) )
))
(declare-datatypes ((List!30929 0))(
  ( (Nil!30926) (Cons!30925 (h!32134 tuple2!23784) (t!45135 List!30929)) )
))
(declare-datatypes ((ListLongMap!21441 0))(
  ( (ListLongMap!21442 (toList!10736 List!30929)) )
))
(declare-fun contains!8900 (ListLongMap!21441 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5717 (array!90390 array!90388 (_ BitVec 32) (_ BitVec 32) V!54113 V!54113 (_ BitVec 32) Int) ListLongMap!21441)

(assert (=> b!1333304 (= res!884797 (contains!8900 (getCurrentListMap!5717 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun res!884796 () Bool)

(assert (=> start!112452 (=> (not res!884796) (not e!759553))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112452 (= res!884796 (validMask!0 mask!1998))))

(assert (=> start!112452 e!759553))

(declare-fun e!759556 () Bool)

(declare-fun array_inv!32929 (array!90388) Bool)

(assert (=> start!112452 (and (array_inv!32929 _values!1320) e!759556)))

(assert (=> start!112452 true))

(declare-fun array_inv!32930 (array!90390) Bool)

(assert (=> start!112452 (array_inv!32930 _keys!1590)))

(assert (=> start!112452 tp!108177))

(declare-fun tp_is_empty!36757 () Bool)

(assert (=> start!112452 tp_is_empty!36757))

(declare-fun b!1333305 () Bool)

(declare-fun res!884802 () Bool)

(assert (=> b!1333305 (=> (not res!884802) (not e!759553))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90390 (_ BitVec 32)) Bool)

(assert (=> b!1333305 (= res!884802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1333306 () Bool)

(declare-fun res!884798 () Bool)

(assert (=> b!1333306 (=> (not res!884798) (not e!759553))))

(assert (=> b!1333306 (= res!884798 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44211 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1333307 () Bool)

(declare-fun res!884795 () Bool)

(assert (=> b!1333307 (=> (not res!884795) (not e!759553))))

(assert (=> b!1333307 (= res!884795 (not (= (select (arr!43661 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1333308 () Bool)

(declare-fun res!884799 () Bool)

(assert (=> b!1333308 (=> (not res!884799) (not e!759553))))

(declare-datatypes ((List!30930 0))(
  ( (Nil!30927) (Cons!30926 (h!32135 (_ BitVec 64)) (t!45136 List!30930)) )
))
(declare-fun arrayNoDuplicates!0 (array!90390 (_ BitVec 32) List!30930) Bool)

(assert (=> b!1333308 (= res!884799 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30927))))

(declare-fun b!1333309 () Bool)

(declare-fun res!884800 () Bool)

(assert (=> b!1333309 (=> (not res!884800) (not e!759553))))

(assert (=> b!1333309 (= res!884800 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1333310 () Bool)

(declare-fun res!884801 () Bool)

(assert (=> b!1333310 (=> (not res!884801) (not e!759553))))

(assert (=> b!1333310 (= res!884801 (and (= (size!44210 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44211 _keys!1590) (size!44210 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1333311 () Bool)

(assert (=> b!1333311 (= e!759553 false)))

(declare-fun lt!592114 () Bool)

(declare-fun +!4710 (ListLongMap!21441 tuple2!23784) ListLongMap!21441)

(declare-fun getCurrentListMapNoExtraKeys!6348 (array!90390 array!90388 (_ BitVec 32) (_ BitVec 32) V!54113 V!54113 (_ BitVec 32) Int) ListLongMap!21441)

(declare-fun get!22022 (ValueCell!17480 V!54113) V!54113)

(declare-fun dynLambda!3649 (Int (_ BitVec 64)) V!54113)

(assert (=> b!1333311 (= lt!592114 (contains!8900 (+!4710 (getCurrentListMapNoExtraKeys!6348 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23785 (select (arr!43661 _keys!1590) from!1980) (get!22022 (select (arr!43660 _values!1320) from!1980) (dynLambda!3649 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) k!1153))))

(declare-fun b!1333312 () Bool)

(declare-fun e!759552 () Bool)

(assert (=> b!1333312 (= e!759556 (and e!759552 mapRes!56809))))

(declare-fun condMapEmpty!56809 () Bool)

(declare-fun mapDefault!56809 () ValueCell!17480)

