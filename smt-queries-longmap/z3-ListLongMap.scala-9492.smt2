; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112560 () Bool)

(assert start!112560)

(declare-fun b_free!30955 () Bool)

(declare-fun b_next!30955 () Bool)

(assert (=> start!112560 (= b_free!30955 (not b_next!30955))))

(declare-fun tp!108503 () Bool)

(declare-fun b_and!49845 () Bool)

(assert (=> start!112560 (= tp!108503 b_and!49845)))

(declare-fun b!1335110 () Bool)

(declare-fun res!886099 () Bool)

(declare-fun e!760411 () Bool)

(assert (=> b!1335110 (=> (not res!886099) (not e!760411))))

(declare-datatypes ((array!90535 0))(
  ( (array!90536 (arr!43734 (Array (_ BitVec 32) (_ BitVec 64))) (size!44286 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90535)

(declare-datatypes ((List!31062 0))(
  ( (Nil!31059) (Cons!31058 (h!32267 (_ BitVec 64)) (t!45318 List!31062)) )
))
(declare-fun arrayNoDuplicates!0 (array!90535 (_ BitVec 32) List!31062) Bool)

(assert (=> b!1335110 (= res!886099 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31059))))

(declare-fun b!1335111 () Bool)

(declare-fun e!760410 () Bool)

(declare-fun tp_is_empty!36865 () Bool)

(assert (=> b!1335111 (= e!760410 tp_is_empty!36865)))

(declare-fun b!1335112 () Bool)

(declare-fun e!760414 () Bool)

(assert (=> b!1335112 (= e!760414 tp_is_empty!36865)))

(declare-fun b!1335113 () Bool)

(declare-fun res!886102 () Bool)

(assert (=> b!1335113 (=> (not res!886102) (not e!760411))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1335113 (= res!886102 (not (validKeyInArray!0 (select (arr!43734 _keys!1590) from!1980))))))

(declare-fun mapIsEmpty!56971 () Bool)

(declare-fun mapRes!56971 () Bool)

(assert (=> mapIsEmpty!56971 mapRes!56971))

(declare-fun b!1335114 () Bool)

(declare-fun res!886095 () Bool)

(assert (=> b!1335114 (=> (not res!886095) (not e!760411))))

(declare-datatypes ((V!54257 0))(
  ( (V!54258 (val!18507 Int)) )
))
(declare-datatypes ((ValueCell!17534 0))(
  ( (ValueCellFull!17534 (v!21143 V!54257)) (EmptyCell!17534) )
))
(declare-datatypes ((array!90537 0))(
  ( (array!90538 (arr!43735 (Array (_ BitVec 32) ValueCell!17534)) (size!44287 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90537)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54257)

(declare-fun zeroValue!1262 () V!54257)

(declare-datatypes ((tuple2!23926 0))(
  ( (tuple2!23927 (_1!11974 (_ BitVec 64)) (_2!11974 V!54257)) )
))
(declare-datatypes ((List!31063 0))(
  ( (Nil!31060) (Cons!31059 (h!32268 tuple2!23926) (t!45319 List!31063)) )
))
(declare-datatypes ((ListLongMap!21583 0))(
  ( (ListLongMap!21584 (toList!10807 List!31063)) )
))
(declare-fun contains!8899 (ListLongMap!21583 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5661 (array!90535 array!90537 (_ BitVec 32) (_ BitVec 32) V!54257 V!54257 (_ BitVec 32) Int) ListLongMap!21583)

(assert (=> b!1335114 (= res!886095 (contains!8899 (getCurrentListMap!5661 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1335116 () Bool)

(declare-fun res!886097 () Bool)

(assert (=> b!1335116 (=> (not res!886097) (not e!760411))))

(assert (=> b!1335116 (= res!886097 (and (= (size!44287 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44286 _keys!1590) (size!44287 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56971 () Bool)

(declare-fun tp!108502 () Bool)

(assert (=> mapNonEmpty!56971 (= mapRes!56971 (and tp!108502 e!760414))))

(declare-fun mapValue!56971 () ValueCell!17534)

(declare-fun mapRest!56971 () (Array (_ BitVec 32) ValueCell!17534))

(declare-fun mapKey!56971 () (_ BitVec 32))

(assert (=> mapNonEmpty!56971 (= (arr!43735 _values!1320) (store mapRest!56971 mapKey!56971 mapValue!56971))))

(declare-fun b!1335117 () Bool)

(declare-fun res!886098 () Bool)

(assert (=> b!1335117 (=> (not res!886098) (not e!760411))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90535 (_ BitVec 32)) Bool)

(assert (=> b!1335117 (= res!886098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1335118 () Bool)

(declare-fun res!886096 () Bool)

(assert (=> b!1335118 (=> (not res!886096) (not e!760411))))

(assert (=> b!1335118 (= res!886096 (not (= (select (arr!43734 _keys!1590) from!1980) k0!1153)))))

(declare-fun res!886100 () Bool)

(assert (=> start!112560 (=> (not res!886100) (not e!760411))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112560 (= res!886100 (validMask!0 mask!1998))))

(assert (=> start!112560 e!760411))

(declare-fun e!760413 () Bool)

(declare-fun array_inv!33181 (array!90537) Bool)

(assert (=> start!112560 (and (array_inv!33181 _values!1320) e!760413)))

(assert (=> start!112560 true))

(declare-fun array_inv!33182 (array!90535) Bool)

(assert (=> start!112560 (array_inv!33182 _keys!1590)))

(assert (=> start!112560 tp!108503))

(assert (=> start!112560 tp_is_empty!36865))

(declare-fun b!1335115 () Bool)

(assert (=> b!1335115 (= e!760413 (and e!760410 mapRes!56971))))

(declare-fun condMapEmpty!56971 () Bool)

(declare-fun mapDefault!56971 () ValueCell!17534)

(assert (=> b!1335115 (= condMapEmpty!56971 (= (arr!43735 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17534)) mapDefault!56971)))))

(declare-fun b!1335119 () Bool)

(assert (=> b!1335119 (= e!760411 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000))))

(declare-fun b!1335120 () Bool)

(declare-fun res!886101 () Bool)

(assert (=> b!1335120 (=> (not res!886101) (not e!760411))))

(assert (=> b!1335120 (= res!886101 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44286 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!112560 res!886100) b!1335116))

(assert (= (and b!1335116 res!886097) b!1335117))

(assert (= (and b!1335117 res!886098) b!1335110))

(assert (= (and b!1335110 res!886099) b!1335120))

(assert (= (and b!1335120 res!886101) b!1335114))

(assert (= (and b!1335114 res!886095) b!1335118))

(assert (= (and b!1335118 res!886096) b!1335113))

(assert (= (and b!1335113 res!886102) b!1335119))

(assert (= (and b!1335115 condMapEmpty!56971) mapIsEmpty!56971))

(assert (= (and b!1335115 (not condMapEmpty!56971)) mapNonEmpty!56971))

(get-info :version)

(assert (= (and mapNonEmpty!56971 ((_ is ValueCellFull!17534) mapValue!56971)) b!1335112))

(assert (= (and b!1335115 ((_ is ValueCellFull!17534) mapDefault!56971)) b!1335111))

(assert (= start!112560 b!1335115))

(declare-fun m!1222815 () Bool)

(assert (=> b!1335118 m!1222815))

(declare-fun m!1222817 () Bool)

(assert (=> b!1335110 m!1222817))

(declare-fun m!1222819 () Bool)

(assert (=> mapNonEmpty!56971 m!1222819))

(declare-fun m!1222821 () Bool)

(assert (=> start!112560 m!1222821))

(declare-fun m!1222823 () Bool)

(assert (=> start!112560 m!1222823))

(declare-fun m!1222825 () Bool)

(assert (=> start!112560 m!1222825))

(declare-fun m!1222827 () Bool)

(assert (=> b!1335117 m!1222827))

(declare-fun m!1222829 () Bool)

(assert (=> b!1335114 m!1222829))

(assert (=> b!1335114 m!1222829))

(declare-fun m!1222831 () Bool)

(assert (=> b!1335114 m!1222831))

(assert (=> b!1335113 m!1222815))

(assert (=> b!1335113 m!1222815))

(declare-fun m!1222833 () Bool)

(assert (=> b!1335113 m!1222833))

(check-sat (not b!1335110) b_and!49845 (not b!1335117) (not b!1335114) (not mapNonEmpty!56971) tp_is_empty!36865 (not b!1335113) (not b_next!30955) (not start!112560))
(check-sat b_and!49845 (not b_next!30955))
