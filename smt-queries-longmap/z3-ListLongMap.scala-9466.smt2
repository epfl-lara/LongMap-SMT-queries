; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112406 () Bool)

(assert start!112406)

(declare-fun b_free!30801 () Bool)

(declare-fun b_next!30801 () Bool)

(assert (=> start!112406 (= b_free!30801 (not b_next!30801))))

(declare-fun tp!108040 () Bool)

(declare-fun b_and!49643 () Bool)

(assert (=> start!112406 (= tp!108040 b_and!49643)))

(declare-fun b!1332675 () Bool)

(declare-fun res!884380 () Bool)

(declare-fun e!759210 () Bool)

(assert (=> b!1332675 (=> (not res!884380) (not e!759210))))

(declare-datatypes ((V!54051 0))(
  ( (V!54052 (val!18430 Int)) )
))
(declare-datatypes ((ValueCell!17457 0))(
  ( (ValueCellFull!17457 (v!21067 V!54051)) (EmptyCell!17457) )
))
(declare-datatypes ((array!90298 0))(
  ( (array!90299 (arr!43615 (Array (_ BitVec 32) ValueCell!17457)) (size!44165 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90298)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90300 0))(
  ( (array!90301 (arr!43616 (Array (_ BitVec 32) (_ BitVec 64))) (size!44166 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90300)

(assert (=> b!1332675 (= res!884380 (and (= (size!44165 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44166 _keys!1590) (size!44165 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1332676 () Bool)

(declare-fun e!759208 () Bool)

(declare-fun tp_is_empty!36711 () Bool)

(assert (=> b!1332676 (= e!759208 tp_is_empty!36711)))

(declare-fun b!1332677 () Bool)

(declare-fun res!884379 () Bool)

(assert (=> b!1332677 (=> (not res!884379) (not e!759210))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90300 (_ BitVec 32)) Bool)

(assert (=> b!1332677 (= res!884379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1332678 () Bool)

(declare-fun res!884381 () Bool)

(assert (=> b!1332678 (=> (not res!884381) (not e!759210))))

(declare-datatypes ((List!30896 0))(
  ( (Nil!30893) (Cons!30892 (h!32101 (_ BitVec 64)) (t!45094 List!30896)) )
))
(declare-fun arrayNoDuplicates!0 (array!90300 (_ BitVec 32) List!30896) Bool)

(assert (=> b!1332678 (= res!884381 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30893))))

(declare-fun b!1332679 () Bool)

(declare-fun e!759211 () Bool)

(declare-fun e!759209 () Bool)

(declare-fun mapRes!56740 () Bool)

(assert (=> b!1332679 (= e!759211 (and e!759209 mapRes!56740))))

(declare-fun condMapEmpty!56740 () Bool)

(declare-fun mapDefault!56740 () ValueCell!17457)

(assert (=> b!1332679 (= condMapEmpty!56740 (= (arr!43615 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17457)) mapDefault!56740)))))

(declare-fun b!1332680 () Bool)

(declare-fun res!884382 () Bool)

(assert (=> b!1332680 (=> (not res!884382) (not e!759210))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1332680 (= res!884382 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44166 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!56740 () Bool)

(assert (=> mapIsEmpty!56740 mapRes!56740))

(declare-fun b!1332681 () Bool)

(assert (=> b!1332681 (= e!759209 tp_is_empty!36711)))

(declare-fun b!1332682 () Bool)

(assert (=> b!1332682 (= e!759210 false)))

(declare-fun lt!592054 () Bool)

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54051)

(declare-fun zeroValue!1262 () V!54051)

(declare-datatypes ((tuple2!23752 0))(
  ( (tuple2!23753 (_1!11887 (_ BitVec 64)) (_2!11887 V!54051)) )
))
(declare-datatypes ((List!30897 0))(
  ( (Nil!30894) (Cons!30893 (h!32102 tuple2!23752) (t!45095 List!30897)) )
))
(declare-datatypes ((ListLongMap!21409 0))(
  ( (ListLongMap!21410 (toList!10720 List!30897)) )
))
(declare-fun contains!8884 (ListLongMap!21409 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5701 (array!90300 array!90298 (_ BitVec 32) (_ BitVec 32) V!54051 V!54051 (_ BitVec 32) Int) ListLongMap!21409)

(assert (=> b!1332682 (= lt!592054 (contains!8884 (getCurrentListMap!5701 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun res!884378 () Bool)

(assert (=> start!112406 (=> (not res!884378) (not e!759210))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112406 (= res!884378 (validMask!0 mask!1998))))

(assert (=> start!112406 e!759210))

(declare-fun array_inv!32899 (array!90298) Bool)

(assert (=> start!112406 (and (array_inv!32899 _values!1320) e!759211)))

(assert (=> start!112406 true))

(declare-fun array_inv!32900 (array!90300) Bool)

(assert (=> start!112406 (array_inv!32900 _keys!1590)))

(assert (=> start!112406 tp!108040))

(assert (=> start!112406 tp_is_empty!36711))

(declare-fun mapNonEmpty!56740 () Bool)

(declare-fun tp!108039 () Bool)

(assert (=> mapNonEmpty!56740 (= mapRes!56740 (and tp!108039 e!759208))))

(declare-fun mapKey!56740 () (_ BitVec 32))

(declare-fun mapRest!56740 () (Array (_ BitVec 32) ValueCell!17457))

(declare-fun mapValue!56740 () ValueCell!17457)

(assert (=> mapNonEmpty!56740 (= (arr!43615 _values!1320) (store mapRest!56740 mapKey!56740 mapValue!56740))))

(assert (= (and start!112406 res!884378) b!1332675))

(assert (= (and b!1332675 res!884380) b!1332677))

(assert (= (and b!1332677 res!884379) b!1332678))

(assert (= (and b!1332678 res!884381) b!1332680))

(assert (= (and b!1332680 res!884382) b!1332682))

(assert (= (and b!1332679 condMapEmpty!56740) mapIsEmpty!56740))

(assert (= (and b!1332679 (not condMapEmpty!56740)) mapNonEmpty!56740))

(get-info :version)

(assert (= (and mapNonEmpty!56740 ((_ is ValueCellFull!17457) mapValue!56740)) b!1332676))

(assert (= (and b!1332679 ((_ is ValueCellFull!17457) mapDefault!56740)) b!1332681))

(assert (= start!112406 b!1332679))

(declare-fun m!1221451 () Bool)

(assert (=> start!112406 m!1221451))

(declare-fun m!1221453 () Bool)

(assert (=> start!112406 m!1221453))

(declare-fun m!1221455 () Bool)

(assert (=> start!112406 m!1221455))

(declare-fun m!1221457 () Bool)

(assert (=> mapNonEmpty!56740 m!1221457))

(declare-fun m!1221459 () Bool)

(assert (=> b!1332677 m!1221459))

(declare-fun m!1221461 () Bool)

(assert (=> b!1332682 m!1221461))

(assert (=> b!1332682 m!1221461))

(declare-fun m!1221463 () Bool)

(assert (=> b!1332682 m!1221463))

(declare-fun m!1221465 () Bool)

(assert (=> b!1332678 m!1221465))

(check-sat b_and!49643 (not b!1332678) (not b_next!30801) (not mapNonEmpty!56740) (not b!1332677) (not start!112406) tp_is_empty!36711 (not b!1332682))
(check-sat b_and!49643 (not b_next!30801))
