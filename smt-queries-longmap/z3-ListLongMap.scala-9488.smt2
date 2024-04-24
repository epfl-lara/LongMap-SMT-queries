; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112760 () Bool)

(assert start!112760)

(declare-fun b_free!30931 () Bool)

(declare-fun b_next!30931 () Bool)

(assert (=> start!112760 (= b_free!30931 (not b_next!30931))))

(declare-fun tp!108430 () Bool)

(declare-fun b_and!49841 () Bool)

(assert (=> start!112760 (= tp!108430 b_and!49841)))

(declare-fun mapIsEmpty!56935 () Bool)

(declare-fun mapRes!56935 () Bool)

(assert (=> mapIsEmpty!56935 mapRes!56935))

(declare-fun mapNonEmpty!56935 () Bool)

(declare-fun tp!108429 () Bool)

(declare-fun e!761107 () Bool)

(assert (=> mapNonEmpty!56935 (= mapRes!56935 (and tp!108429 e!761107))))

(declare-datatypes ((V!54225 0))(
  ( (V!54226 (val!18495 Int)) )
))
(declare-datatypes ((ValueCell!17522 0))(
  ( (ValueCellFull!17522 (v!21127 V!54225)) (EmptyCell!17522) )
))
(declare-fun mapRest!56935 () (Array (_ BitVec 32) ValueCell!17522))

(declare-datatypes ((array!90653 0))(
  ( (array!90654 (arr!43788 (Array (_ BitVec 32) ValueCell!17522)) (size!44339 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90653)

(declare-fun mapValue!56935 () ValueCell!17522)

(declare-fun mapKey!56935 () (_ BitVec 32))

(assert (=> mapNonEmpty!56935 (= (arr!43788 _values!1320) (store mapRest!56935 mapKey!56935 mapValue!56935))))

(declare-fun b!1336185 () Bool)

(declare-fun e!761110 () Bool)

(declare-fun tp_is_empty!36841 () Bool)

(assert (=> b!1336185 (= e!761110 tp_is_empty!36841)))

(declare-fun b!1336186 () Bool)

(assert (=> b!1336186 (= e!761107 tp_is_empty!36841)))

(declare-fun b!1336187 () Bool)

(declare-fun res!886459 () Bool)

(declare-fun e!761106 () Bool)

(assert (=> b!1336187 (=> (not res!886459) (not e!761106))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90655 0))(
  ( (array!90656 (arr!43789 (Array (_ BitVec 32) (_ BitVec 64))) (size!44340 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90655)

(declare-fun mask!1998 () (_ BitVec 32))

(assert (=> b!1336187 (= res!886459 (and (= (size!44339 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44340 _keys!1590) (size!44339 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1336188 () Bool)

(declare-fun e!761109 () Bool)

(assert (=> b!1336188 (= e!761109 (and e!761110 mapRes!56935))))

(declare-fun condMapEmpty!56935 () Bool)

(declare-fun mapDefault!56935 () ValueCell!17522)

(assert (=> b!1336188 (= condMapEmpty!56935 (= (arr!43788 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17522)) mapDefault!56935)))))

(declare-fun b!1336189 () Bool)

(declare-fun res!886457 () Bool)

(assert (=> b!1336189 (=> (not res!886457) (not e!761106))))

(declare-datatypes ((List!31021 0))(
  ( (Nil!31018) (Cons!31017 (h!32235 (_ BitVec 64)) (t!45277 List!31021)) )
))
(declare-fun arrayNoDuplicates!0 (array!90655 (_ BitVec 32) List!31021) Bool)

(assert (=> b!1336189 (= res!886457 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31018))))

(declare-fun res!886460 () Bool)

(assert (=> start!112760 (=> (not res!886460) (not e!761106))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112760 (= res!886460 (validMask!0 mask!1998))))

(assert (=> start!112760 e!761106))

(declare-fun array_inv!33289 (array!90653) Bool)

(assert (=> start!112760 (and (array_inv!33289 _values!1320) e!761109)))

(assert (=> start!112760 true))

(declare-fun array_inv!33290 (array!90655) Bool)

(assert (=> start!112760 (array_inv!33290 _keys!1590)))

(assert (=> start!112760 tp!108430))

(assert (=> start!112760 tp_is_empty!36841))

(declare-fun b!1336190 () Bool)

(declare-fun res!886456 () Bool)

(assert (=> b!1336190 (=> (not res!886456) (not e!761106))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90655 (_ BitVec 32)) Bool)

(assert (=> b!1336190 (= res!886456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1336191 () Bool)

(assert (=> b!1336191 (= e!761106 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54225)

(declare-fun zeroValue!1262 () V!54225)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun lt!592878 () Bool)

(declare-datatypes ((tuple2!23872 0))(
  ( (tuple2!23873 (_1!11947 (_ BitVec 64)) (_2!11947 V!54225)) )
))
(declare-datatypes ((List!31022 0))(
  ( (Nil!31019) (Cons!31018 (h!32236 tuple2!23872) (t!45278 List!31022)) )
))
(declare-datatypes ((ListLongMap!21537 0))(
  ( (ListLongMap!21538 (toList!10784 List!31022)) )
))
(declare-fun contains!8960 (ListLongMap!21537 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5743 (array!90655 array!90653 (_ BitVec 32) (_ BitVec 32) V!54225 V!54225 (_ BitVec 32) Int) ListLongMap!21537)

(assert (=> b!1336191 (= lt!592878 (contains!8960 (getCurrentListMap!5743 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1336192 () Bool)

(declare-fun res!886458 () Bool)

(assert (=> b!1336192 (=> (not res!886458) (not e!761106))))

(assert (=> b!1336192 (= res!886458 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44340 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!112760 res!886460) b!1336187))

(assert (= (and b!1336187 res!886459) b!1336190))

(assert (= (and b!1336190 res!886456) b!1336189))

(assert (= (and b!1336189 res!886457) b!1336192))

(assert (= (and b!1336192 res!886458) b!1336191))

(assert (= (and b!1336188 condMapEmpty!56935) mapIsEmpty!56935))

(assert (= (and b!1336188 (not condMapEmpty!56935)) mapNonEmpty!56935))

(get-info :version)

(assert (= (and mapNonEmpty!56935 ((_ is ValueCellFull!17522) mapValue!56935)) b!1336186))

(assert (= (and b!1336188 ((_ is ValueCellFull!17522) mapDefault!56935)) b!1336185))

(assert (= start!112760 b!1336188))

(declare-fun m!1224737 () Bool)

(assert (=> start!112760 m!1224737))

(declare-fun m!1224739 () Bool)

(assert (=> start!112760 m!1224739))

(declare-fun m!1224741 () Bool)

(assert (=> start!112760 m!1224741))

(declare-fun m!1224743 () Bool)

(assert (=> mapNonEmpty!56935 m!1224743))

(declare-fun m!1224745 () Bool)

(assert (=> b!1336191 m!1224745))

(assert (=> b!1336191 m!1224745))

(declare-fun m!1224747 () Bool)

(assert (=> b!1336191 m!1224747))

(declare-fun m!1224749 () Bool)

(assert (=> b!1336190 m!1224749))

(declare-fun m!1224751 () Bool)

(assert (=> b!1336189 m!1224751))

(check-sat b_and!49841 (not b!1336189) (not start!112760) tp_is_empty!36841 (not b_next!30931) (not mapNonEmpty!56935) (not b!1336191) (not b!1336190))
(check-sat b_and!49841 (not b_next!30931))
