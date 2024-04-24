; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112754 () Bool)

(assert start!112754)

(declare-fun b_free!30925 () Bool)

(declare-fun b_next!30925 () Bool)

(assert (=> start!112754 (= b_free!30925 (not b_next!30925))))

(declare-fun tp!108412 () Bool)

(declare-fun b_and!49835 () Bool)

(assert (=> start!112754 (= tp!108412 b_and!49835)))

(declare-fun b!1336113 () Bool)

(declare-fun e!761063 () Bool)

(declare-fun tp_is_empty!36835 () Bool)

(assert (=> b!1336113 (= e!761063 tp_is_empty!36835)))

(declare-fun b!1336114 () Bool)

(declare-fun res!886411 () Bool)

(declare-fun e!761065 () Bool)

(assert (=> b!1336114 (=> (not res!886411) (not e!761065))))

(declare-datatypes ((array!90641 0))(
  ( (array!90642 (arr!43782 (Array (_ BitVec 32) (_ BitVec 64))) (size!44333 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90641)

(declare-datatypes ((List!31017 0))(
  ( (Nil!31014) (Cons!31013 (h!32231 (_ BitVec 64)) (t!45273 List!31017)) )
))
(declare-fun arrayNoDuplicates!0 (array!90641 (_ BitVec 32) List!31017) Bool)

(assert (=> b!1336114 (= res!886411 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31014))))

(declare-fun mapIsEmpty!56926 () Bool)

(declare-fun mapRes!56926 () Bool)

(assert (=> mapIsEmpty!56926 mapRes!56926))

(declare-fun b!1336115 () Bool)

(declare-fun e!761061 () Bool)

(assert (=> b!1336115 (= e!761061 (and e!761063 mapRes!56926))))

(declare-fun condMapEmpty!56926 () Bool)

(declare-datatypes ((V!54217 0))(
  ( (V!54218 (val!18492 Int)) )
))
(declare-datatypes ((ValueCell!17519 0))(
  ( (ValueCellFull!17519 (v!21124 V!54217)) (EmptyCell!17519) )
))
(declare-datatypes ((array!90643 0))(
  ( (array!90644 (arr!43783 (Array (_ BitVec 32) ValueCell!17519)) (size!44334 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90643)

(declare-fun mapDefault!56926 () ValueCell!17519)

(assert (=> b!1336115 (= condMapEmpty!56926 (= (arr!43783 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17519)) mapDefault!56926)))))

(declare-fun res!886413 () Bool)

(assert (=> start!112754 (=> (not res!886413) (not e!761065))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112754 (= res!886413 (validMask!0 mask!1998))))

(assert (=> start!112754 e!761065))

(declare-fun array_inv!33285 (array!90643) Bool)

(assert (=> start!112754 (and (array_inv!33285 _values!1320) e!761061)))

(assert (=> start!112754 true))

(declare-fun array_inv!33286 (array!90641) Bool)

(assert (=> start!112754 (array_inv!33286 _keys!1590)))

(assert (=> start!112754 tp!108412))

(assert (=> start!112754 tp_is_empty!36835))

(declare-fun b!1336116 () Bool)

(declare-fun res!886414 () Bool)

(assert (=> b!1336116 (=> (not res!886414) (not e!761065))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90641 (_ BitVec 32)) Bool)

(assert (=> b!1336116 (= res!886414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1336117 () Bool)

(declare-fun res!886412 () Bool)

(assert (=> b!1336117 (=> (not res!886412) (not e!761065))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1336117 (= res!886412 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44333 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!56926 () Bool)

(declare-fun tp!108411 () Bool)

(declare-fun e!761064 () Bool)

(assert (=> mapNonEmpty!56926 (= mapRes!56926 (and tp!108411 e!761064))))

(declare-fun mapValue!56926 () ValueCell!17519)

(declare-fun mapKey!56926 () (_ BitVec 32))

(declare-fun mapRest!56926 () (Array (_ BitVec 32) ValueCell!17519))

(assert (=> mapNonEmpty!56926 (= (arr!43783 _values!1320) (store mapRest!56926 mapKey!56926 mapValue!56926))))

(declare-fun b!1336118 () Bool)

(assert (=> b!1336118 (= e!761065 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun lt!592869 () Bool)

(declare-fun minValue!1262 () V!54217)

(declare-fun zeroValue!1262 () V!54217)

(declare-datatypes ((tuple2!23868 0))(
  ( (tuple2!23869 (_1!11945 (_ BitVec 64)) (_2!11945 V!54217)) )
))
(declare-datatypes ((List!31018 0))(
  ( (Nil!31015) (Cons!31014 (h!32232 tuple2!23868) (t!45274 List!31018)) )
))
(declare-datatypes ((ListLongMap!21533 0))(
  ( (ListLongMap!21534 (toList!10782 List!31018)) )
))
(declare-fun contains!8958 (ListLongMap!21533 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5741 (array!90641 array!90643 (_ BitVec 32) (_ BitVec 32) V!54217 V!54217 (_ BitVec 32) Int) ListLongMap!21533)

(assert (=> b!1336118 (= lt!592869 (contains!8958 (getCurrentListMap!5741 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1336119 () Bool)

(assert (=> b!1336119 (= e!761064 tp_is_empty!36835)))

(declare-fun b!1336120 () Bool)

(declare-fun res!886415 () Bool)

(assert (=> b!1336120 (=> (not res!886415) (not e!761065))))

(assert (=> b!1336120 (= res!886415 (and (= (size!44334 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44333 _keys!1590) (size!44334 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(assert (= (and start!112754 res!886413) b!1336120))

(assert (= (and b!1336120 res!886415) b!1336116))

(assert (= (and b!1336116 res!886414) b!1336114))

(assert (= (and b!1336114 res!886411) b!1336117))

(assert (= (and b!1336117 res!886412) b!1336118))

(assert (= (and b!1336115 condMapEmpty!56926) mapIsEmpty!56926))

(assert (= (and b!1336115 (not condMapEmpty!56926)) mapNonEmpty!56926))

(get-info :version)

(assert (= (and mapNonEmpty!56926 ((_ is ValueCellFull!17519) mapValue!56926)) b!1336119))

(assert (= (and b!1336115 ((_ is ValueCellFull!17519) mapDefault!56926)) b!1336113))

(assert (= start!112754 b!1336115))

(declare-fun m!1224689 () Bool)

(assert (=> b!1336114 m!1224689))

(declare-fun m!1224691 () Bool)

(assert (=> b!1336118 m!1224691))

(assert (=> b!1336118 m!1224691))

(declare-fun m!1224693 () Bool)

(assert (=> b!1336118 m!1224693))

(declare-fun m!1224695 () Bool)

(assert (=> mapNonEmpty!56926 m!1224695))

(declare-fun m!1224697 () Bool)

(assert (=> start!112754 m!1224697))

(declare-fun m!1224699 () Bool)

(assert (=> start!112754 m!1224699))

(declare-fun m!1224701 () Bool)

(assert (=> start!112754 m!1224701))

(declare-fun m!1224703 () Bool)

(assert (=> b!1336116 m!1224703))

(check-sat (not mapNonEmpty!56926) (not b_next!30925) b_and!49835 (not b!1336116) tp_is_empty!36835 (not start!112754) (not b!1336118) (not b!1336114))
(check-sat b_and!49835 (not b_next!30925))
