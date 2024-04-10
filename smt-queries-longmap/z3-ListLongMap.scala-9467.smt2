; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112412 () Bool)

(assert start!112412)

(declare-fun b_free!30807 () Bool)

(declare-fun b_next!30807 () Bool)

(assert (=> start!112412 (= b_free!30807 (not b_next!30807))))

(declare-fun tp!108058 () Bool)

(declare-fun b_and!49649 () Bool)

(assert (=> start!112412 (= tp!108058 b_and!49649)))

(declare-fun mapIsEmpty!56749 () Bool)

(declare-fun mapRes!56749 () Bool)

(assert (=> mapIsEmpty!56749 mapRes!56749))

(declare-fun res!884426 () Bool)

(declare-fun e!759255 () Bool)

(assert (=> start!112412 (=> (not res!884426) (not e!759255))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112412 (= res!884426 (validMask!0 mask!1998))))

(assert (=> start!112412 e!759255))

(declare-datatypes ((V!54059 0))(
  ( (V!54060 (val!18433 Int)) )
))
(declare-datatypes ((ValueCell!17460 0))(
  ( (ValueCellFull!17460 (v!21070 V!54059)) (EmptyCell!17460) )
))
(declare-datatypes ((array!90310 0))(
  ( (array!90311 (arr!43621 (Array (_ BitVec 32) ValueCell!17460)) (size!44171 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90310)

(declare-fun e!759252 () Bool)

(declare-fun array_inv!32903 (array!90310) Bool)

(assert (=> start!112412 (and (array_inv!32903 _values!1320) e!759252)))

(assert (=> start!112412 true))

(declare-datatypes ((array!90312 0))(
  ( (array!90313 (arr!43622 (Array (_ BitVec 32) (_ BitVec 64))) (size!44172 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90312)

(declare-fun array_inv!32904 (array!90312) Bool)

(assert (=> start!112412 (array_inv!32904 _keys!1590)))

(assert (=> start!112412 tp!108058))

(declare-fun tp_is_empty!36717 () Bool)

(assert (=> start!112412 tp_is_empty!36717))

(declare-fun mapNonEmpty!56749 () Bool)

(declare-fun tp!108057 () Bool)

(declare-fun e!759254 () Bool)

(assert (=> mapNonEmpty!56749 (= mapRes!56749 (and tp!108057 e!759254))))

(declare-fun mapKey!56749 () (_ BitVec 32))

(declare-fun mapValue!56749 () ValueCell!17460)

(declare-fun mapRest!56749 () (Array (_ BitVec 32) ValueCell!17460))

(assert (=> mapNonEmpty!56749 (= (arr!43621 _values!1320) (store mapRest!56749 mapKey!56749 mapValue!56749))))

(declare-fun b!1332747 () Bool)

(assert (=> b!1332747 (= e!759255 false)))

(declare-fun lt!592063 () Bool)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54059)

(declare-fun zeroValue!1262 () V!54059)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23754 0))(
  ( (tuple2!23755 (_1!11888 (_ BitVec 64)) (_2!11888 V!54059)) )
))
(declare-datatypes ((List!30899 0))(
  ( (Nil!30896) (Cons!30895 (h!32104 tuple2!23754) (t!45097 List!30899)) )
))
(declare-datatypes ((ListLongMap!21411 0))(
  ( (ListLongMap!21412 (toList!10721 List!30899)) )
))
(declare-fun contains!8885 (ListLongMap!21411 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5702 (array!90312 array!90310 (_ BitVec 32) (_ BitVec 32) V!54059 V!54059 (_ BitVec 32) Int) ListLongMap!21411)

(assert (=> b!1332747 (= lt!592063 (contains!8885 (getCurrentListMap!5702 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1332748 () Bool)

(declare-fun res!884427 () Bool)

(assert (=> b!1332748 (=> (not res!884427) (not e!759255))))

(assert (=> b!1332748 (= res!884427 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44172 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1332749 () Bool)

(assert (=> b!1332749 (= e!759254 tp_is_empty!36717)))

(declare-fun b!1332750 () Bool)

(declare-fun res!884423 () Bool)

(assert (=> b!1332750 (=> (not res!884423) (not e!759255))))

(declare-datatypes ((List!30900 0))(
  ( (Nil!30897) (Cons!30896 (h!32105 (_ BitVec 64)) (t!45098 List!30900)) )
))
(declare-fun arrayNoDuplicates!0 (array!90312 (_ BitVec 32) List!30900) Bool)

(assert (=> b!1332750 (= res!884423 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30897))))

(declare-fun b!1332751 () Bool)

(declare-fun e!759256 () Bool)

(assert (=> b!1332751 (= e!759252 (and e!759256 mapRes!56749))))

(declare-fun condMapEmpty!56749 () Bool)

(declare-fun mapDefault!56749 () ValueCell!17460)

(assert (=> b!1332751 (= condMapEmpty!56749 (= (arr!43621 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17460)) mapDefault!56749)))))

(declare-fun b!1332752 () Bool)

(assert (=> b!1332752 (= e!759256 tp_is_empty!36717)))

(declare-fun b!1332753 () Bool)

(declare-fun res!884424 () Bool)

(assert (=> b!1332753 (=> (not res!884424) (not e!759255))))

(assert (=> b!1332753 (= res!884424 (and (= (size!44171 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44172 _keys!1590) (size!44171 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1332754 () Bool)

(declare-fun res!884425 () Bool)

(assert (=> b!1332754 (=> (not res!884425) (not e!759255))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90312 (_ BitVec 32)) Bool)

(assert (=> b!1332754 (= res!884425 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(assert (= (and start!112412 res!884426) b!1332753))

(assert (= (and b!1332753 res!884424) b!1332754))

(assert (= (and b!1332754 res!884425) b!1332750))

(assert (= (and b!1332750 res!884423) b!1332748))

(assert (= (and b!1332748 res!884427) b!1332747))

(assert (= (and b!1332751 condMapEmpty!56749) mapIsEmpty!56749))

(assert (= (and b!1332751 (not condMapEmpty!56749)) mapNonEmpty!56749))

(get-info :version)

(assert (= (and mapNonEmpty!56749 ((_ is ValueCellFull!17460) mapValue!56749)) b!1332749))

(assert (= (and b!1332751 ((_ is ValueCellFull!17460) mapDefault!56749)) b!1332752))

(assert (= start!112412 b!1332751))

(declare-fun m!1221499 () Bool)

(assert (=> b!1332750 m!1221499))

(declare-fun m!1221501 () Bool)

(assert (=> b!1332747 m!1221501))

(assert (=> b!1332747 m!1221501))

(declare-fun m!1221503 () Bool)

(assert (=> b!1332747 m!1221503))

(declare-fun m!1221505 () Bool)

(assert (=> start!112412 m!1221505))

(declare-fun m!1221507 () Bool)

(assert (=> start!112412 m!1221507))

(declare-fun m!1221509 () Bool)

(assert (=> start!112412 m!1221509))

(declare-fun m!1221511 () Bool)

(assert (=> mapNonEmpty!56749 m!1221511))

(declare-fun m!1221513 () Bool)

(assert (=> b!1332754 m!1221513))

(check-sat b_and!49649 tp_is_empty!36717 (not b_next!30807) (not b!1332750) (not b!1332747) (not mapNonEmpty!56749) (not b!1332754) (not start!112412))
(check-sat b_and!49649 (not b_next!30807))
