; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112484 () Bool)

(assert start!112484)

(declare-fun b_free!30879 () Bool)

(declare-fun b_next!30879 () Bool)

(assert (=> start!112484 (= b_free!30879 (not b_next!30879))))

(declare-fun tp!108274 () Bool)

(declare-fun b_and!49759 () Bool)

(assert (=> start!112484 (= tp!108274 b_and!49759)))

(declare-fun b!1333994 () Bool)

(declare-fun e!759835 () Bool)

(declare-fun e!759833 () Bool)

(declare-fun mapRes!56857 () Bool)

(assert (=> b!1333994 (= e!759835 (and e!759833 mapRes!56857))))

(declare-fun condMapEmpty!56857 () Bool)

(declare-datatypes ((V!54155 0))(
  ( (V!54156 (val!18469 Int)) )
))
(declare-datatypes ((ValueCell!17496 0))(
  ( (ValueCellFull!17496 (v!21106 V!54155)) (EmptyCell!17496) )
))
(declare-datatypes ((array!90444 0))(
  ( (array!90445 (arr!43688 (Array (_ BitVec 32) ValueCell!17496)) (size!44238 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90444)

(declare-fun mapDefault!56857 () ValueCell!17496)

(assert (=> b!1333994 (= condMapEmpty!56857 (= (arr!43688 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17496)) mapDefault!56857)))))

(declare-fun b!1333995 () Bool)

(declare-fun tp_is_empty!36789 () Bool)

(assert (=> b!1333995 (= e!759833 tp_is_empty!36789)))

(declare-fun res!885316 () Bool)

(declare-fun e!759834 () Bool)

(assert (=> start!112484 (=> (not res!885316) (not e!759834))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112484 (= res!885316 (validMask!0 mask!1998))))

(assert (=> start!112484 e!759834))

(declare-fun array_inv!32949 (array!90444) Bool)

(assert (=> start!112484 (and (array_inv!32949 _values!1320) e!759835)))

(assert (=> start!112484 true))

(declare-datatypes ((array!90446 0))(
  ( (array!90447 (arr!43689 (Array (_ BitVec 32) (_ BitVec 64))) (size!44239 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90446)

(declare-fun array_inv!32950 (array!90446) Bool)

(assert (=> start!112484 (array_inv!32950 _keys!1590)))

(assert (=> start!112484 tp!108274))

(assert (=> start!112484 tp_is_empty!36789))

(declare-fun b!1333996 () Bool)

(declare-fun res!885315 () Bool)

(assert (=> b!1333996 (=> (not res!885315) (not e!759834))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1333996 (= res!885315 (validKeyInArray!0 (select (arr!43689 _keys!1590) from!1980)))))

(declare-fun b!1333997 () Bool)

(declare-fun res!885309 () Bool)

(assert (=> b!1333997 (=> (not res!885309) (not e!759834))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1333997 (= res!885309 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1333998 () Bool)

(declare-fun res!885314 () Bool)

(declare-fun e!759836 () Bool)

(assert (=> b!1333998 (=> (not res!885314) (not e!759836))))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1333998 (= res!885314 (not (= k0!1153 (select (arr!43689 _keys!1590) from!1980))))))

(declare-fun b!1333999 () Bool)

(declare-fun res!885308 () Bool)

(assert (=> b!1333999 (=> (not res!885308) (not e!759834))))

(assert (=> b!1333999 (= res!885308 (not (= (select (arr!43689 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1334000 () Bool)

(declare-fun e!759838 () Bool)

(assert (=> b!1334000 (= e!759838 tp_is_empty!36789)))

(declare-fun b!1334001 () Bool)

(declare-fun res!885312 () Bool)

(assert (=> b!1334001 (=> (not res!885312) (not e!759834))))

(assert (=> b!1334001 (= res!885312 (and (= (size!44238 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44239 _keys!1590) (size!44238 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56857 () Bool)

(declare-fun tp!108273 () Bool)

(assert (=> mapNonEmpty!56857 (= mapRes!56857 (and tp!108273 e!759838))))

(declare-fun mapRest!56857 () (Array (_ BitVec 32) ValueCell!17496))

(declare-fun mapValue!56857 () ValueCell!17496)

(declare-fun mapKey!56857 () (_ BitVec 32))

(assert (=> mapNonEmpty!56857 (= (arr!43688 _values!1320) (store mapRest!56857 mapKey!56857 mapValue!56857))))

(declare-fun b!1334002 () Bool)

(declare-fun res!885318 () Bool)

(assert (=> b!1334002 (=> (not res!885318) (not e!759834))))

(declare-datatypes ((List!30951 0))(
  ( (Nil!30948) (Cons!30947 (h!32156 (_ BitVec 64)) (t!45189 List!30951)) )
))
(declare-fun arrayNoDuplicates!0 (array!90446 (_ BitVec 32) List!30951) Bool)

(assert (=> b!1334002 (= res!885318 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30948))))

(declare-fun mapIsEmpty!56857 () Bool)

(assert (=> mapIsEmpty!56857 mapRes!56857))

(declare-fun b!1334003 () Bool)

(declare-fun res!885310 () Bool)

(assert (=> b!1334003 (=> (not res!885310) (not e!759834))))

(assert (=> b!1334003 (= res!885310 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44239 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1334004 () Bool)

(assert (=> b!1334004 (= e!759834 e!759836)))

(declare-fun res!885313 () Bool)

(assert (=> b!1334004 (=> (not res!885313) (not e!759836))))

(declare-fun lt!592244 () V!54155)

(declare-datatypes ((tuple2!23808 0))(
  ( (tuple2!23809 (_1!11915 (_ BitVec 64)) (_2!11915 V!54155)) )
))
(declare-datatypes ((List!30952 0))(
  ( (Nil!30949) (Cons!30948 (h!32157 tuple2!23808) (t!45190 List!30952)) )
))
(declare-datatypes ((ListLongMap!21465 0))(
  ( (ListLongMap!21466 (toList!10748 List!30952)) )
))
(declare-fun lt!592246 () ListLongMap!21465)

(declare-fun contains!8912 (ListLongMap!21465 (_ BitVec 64)) Bool)

(declare-fun +!4719 (ListLongMap!21465 tuple2!23808) ListLongMap!21465)

(assert (=> b!1334004 (= res!885313 (contains!8912 (+!4719 lt!592246 (tuple2!23809 (select (arr!43689 _keys!1590) from!1980) lt!592244)) k0!1153))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54155)

(declare-fun zeroValue!1262 () V!54155)

(declare-fun getCurrentListMapNoExtraKeys!6357 (array!90446 array!90444 (_ BitVec 32) (_ BitVec 32) V!54155 V!54155 (_ BitVec 32) Int) ListLongMap!21465)

(assert (=> b!1334004 (= lt!592246 (getCurrentListMapNoExtraKeys!6357 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun get!22041 (ValueCell!17496 V!54155) V!54155)

(declare-fun dynLambda!3658 (Int (_ BitVec 64)) V!54155)

(assert (=> b!1334004 (= lt!592244 (get!22041 (select (arr!43688 _values!1320) from!1980) (dynLambda!3658 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1334005 () Bool)

(declare-fun res!885317 () Bool)

(assert (=> b!1334005 (=> (not res!885317) (not e!759834))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90446 (_ BitVec 32)) Bool)

(assert (=> b!1334005 (= res!885317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1334006 () Bool)

(assert (=> b!1334006 (= e!759836 (not true))))

(assert (=> b!1334006 (contains!8912 lt!592246 k0!1153)))

(declare-datatypes ((Unit!43879 0))(
  ( (Unit!43880) )
))
(declare-fun lt!592245 () Unit!43879)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!302 ((_ BitVec 64) (_ BitVec 64) V!54155 ListLongMap!21465) Unit!43879)

(assert (=> b!1334006 (= lt!592245 (lemmaInListMapAfterAddingDiffThenInBefore!302 k0!1153 (select (arr!43689 _keys!1590) from!1980) lt!592244 lt!592246))))

(declare-fun b!1334007 () Bool)

(declare-fun res!885311 () Bool)

(assert (=> b!1334007 (=> (not res!885311) (not e!759834))))

(declare-fun getCurrentListMap!5725 (array!90446 array!90444 (_ BitVec 32) (_ BitVec 32) V!54155 V!54155 (_ BitVec 32) Int) ListLongMap!21465)

(assert (=> b!1334007 (= res!885311 (contains!8912 (getCurrentListMap!5725 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(assert (= (and start!112484 res!885316) b!1334001))

(assert (= (and b!1334001 res!885312) b!1334005))

(assert (= (and b!1334005 res!885317) b!1334002))

(assert (= (and b!1334002 res!885318) b!1334003))

(assert (= (and b!1334003 res!885310) b!1334007))

(assert (= (and b!1334007 res!885311) b!1333999))

(assert (= (and b!1333999 res!885308) b!1333996))

(assert (= (and b!1333996 res!885315) b!1333997))

(assert (= (and b!1333997 res!885309) b!1334004))

(assert (= (and b!1334004 res!885313) b!1333998))

(assert (= (and b!1333998 res!885314) b!1334006))

(assert (= (and b!1333994 condMapEmpty!56857) mapIsEmpty!56857))

(assert (= (and b!1333994 (not condMapEmpty!56857)) mapNonEmpty!56857))

(get-info :version)

(assert (= (and mapNonEmpty!56857 ((_ is ValueCellFull!17496) mapValue!56857)) b!1334000))

(assert (= (and b!1333994 ((_ is ValueCellFull!17496) mapDefault!56857)) b!1333995))

(assert (= start!112484 b!1333994))

(declare-fun b_lambda!24085 () Bool)

(assert (=> (not b_lambda!24085) (not b!1334004)))

(declare-fun t!45188 () Bool)

(declare-fun tb!12041 () Bool)

(assert (=> (and start!112484 (= defaultEntry!1323 defaultEntry!1323) t!45188) tb!12041))

(declare-fun result!25153 () Bool)

(assert (=> tb!12041 (= result!25153 tp_is_empty!36789)))

(assert (=> b!1334004 t!45188))

(declare-fun b_and!49761 () Bool)

(assert (= b_and!49759 (and (=> t!45188 result!25153) b_and!49761)))

(declare-fun m!1222443 () Bool)

(assert (=> b!1334004 m!1222443))

(declare-fun m!1222445 () Bool)

(assert (=> b!1334004 m!1222445))

(assert (=> b!1334004 m!1222443))

(declare-fun m!1222447 () Bool)

(assert (=> b!1334004 m!1222447))

(assert (=> b!1334004 m!1222445))

(declare-fun m!1222449 () Bool)

(assert (=> b!1334004 m!1222449))

(declare-fun m!1222451 () Bool)

(assert (=> b!1334004 m!1222451))

(declare-fun m!1222453 () Bool)

(assert (=> b!1334004 m!1222453))

(assert (=> b!1334004 m!1222449))

(declare-fun m!1222455 () Bool)

(assert (=> b!1334004 m!1222455))

(declare-fun m!1222457 () Bool)

(assert (=> start!112484 m!1222457))

(declare-fun m!1222459 () Bool)

(assert (=> start!112484 m!1222459))

(declare-fun m!1222461 () Bool)

(assert (=> start!112484 m!1222461))

(declare-fun m!1222463 () Bool)

(assert (=> b!1334006 m!1222463))

(assert (=> b!1334006 m!1222451))

(assert (=> b!1334006 m!1222451))

(declare-fun m!1222465 () Bool)

(assert (=> b!1334006 m!1222465))

(assert (=> b!1333996 m!1222451))

(assert (=> b!1333996 m!1222451))

(declare-fun m!1222467 () Bool)

(assert (=> b!1333996 m!1222467))

(declare-fun m!1222469 () Bool)

(assert (=> b!1334005 m!1222469))

(assert (=> b!1333999 m!1222451))

(assert (=> b!1333998 m!1222451))

(declare-fun m!1222471 () Bool)

(assert (=> mapNonEmpty!56857 m!1222471))

(declare-fun m!1222473 () Bool)

(assert (=> b!1334002 m!1222473))

(declare-fun m!1222475 () Bool)

(assert (=> b!1334007 m!1222475))

(assert (=> b!1334007 m!1222475))

(declare-fun m!1222477 () Bool)

(assert (=> b!1334007 m!1222477))

(check-sat (not b_lambda!24085) (not b_next!30879) (not mapNonEmpty!56857) (not b!1334002) (not b!1334007) (not b!1334004) (not start!112484) b_and!49761 tp_is_empty!36789 (not b!1334005) (not b!1333996) (not b!1334006))
(check-sat b_and!49761 (not b_next!30879))
