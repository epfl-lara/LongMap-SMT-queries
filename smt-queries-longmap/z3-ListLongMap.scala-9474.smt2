; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112452 () Bool)

(assert start!112452)

(declare-fun b_free!30847 () Bool)

(declare-fun b_next!30847 () Bool)

(assert (=> start!112452 (= b_free!30847 (not b_next!30847))))

(declare-fun tp!108178 () Bool)

(declare-fun b_and!49677 () Bool)

(assert (=> start!112452 (= tp!108178 b_and!49677)))

(declare-fun mapIsEmpty!56809 () Bool)

(declare-fun mapRes!56809 () Bool)

(assert (=> mapIsEmpty!56809 mapRes!56809))

(declare-fun b!1333234 () Bool)

(declare-fun res!884772 () Bool)

(declare-fun e!759521 () Bool)

(assert (=> b!1333234 (=> (not res!884772) (not e!759521))))

(declare-datatypes ((array!90327 0))(
  ( (array!90328 (arr!43630 (Array (_ BitVec 32) (_ BitVec 64))) (size!44182 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90327)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1333234 (= res!884772 (validKeyInArray!0 (select (arr!43630 _keys!1590) from!1980)))))

(declare-fun b!1333235 () Bool)

(declare-fun res!884768 () Bool)

(assert (=> b!1333235 (=> (not res!884768) (not e!759521))))

(declare-datatypes ((List!30988 0))(
  ( (Nil!30985) (Cons!30984 (h!32193 (_ BitVec 64)) (t!45186 List!30988)) )
))
(declare-fun arrayNoDuplicates!0 (array!90327 (_ BitVec 32) List!30988) Bool)

(assert (=> b!1333235 (= res!884768 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30985))))

(declare-fun b!1333236 () Bool)

(declare-fun res!884769 () Bool)

(assert (=> b!1333236 (=> (not res!884769) (not e!759521))))

(declare-datatypes ((V!54113 0))(
  ( (V!54114 (val!18453 Int)) )
))
(declare-datatypes ((ValueCell!17480 0))(
  ( (ValueCellFull!17480 (v!21089 V!54113)) (EmptyCell!17480) )
))
(declare-datatypes ((array!90329 0))(
  ( (array!90330 (arr!43631 (Array (_ BitVec 32) ValueCell!17480)) (size!44183 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90329)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1333236 (= res!884769 (and (= (size!44183 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44182 _keys!1590) (size!44183 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1333237 () Bool)

(declare-fun res!884770 () Bool)

(assert (=> b!1333237 (=> (not res!884770) (not e!759521))))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1333237 (= res!884770 (not (= (select (arr!43630 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1333238 () Bool)

(declare-fun res!884765 () Bool)

(assert (=> b!1333238 (=> (not res!884765) (not e!759521))))

(assert (=> b!1333238 (= res!884765 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1333239 () Bool)

(declare-fun res!884773 () Bool)

(assert (=> b!1333239 (=> (not res!884773) (not e!759521))))

(assert (=> b!1333239 (= res!884773 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44182 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1333240 () Bool)

(declare-fun e!759523 () Bool)

(declare-fun tp_is_empty!36757 () Bool)

(assert (=> b!1333240 (= e!759523 tp_is_empty!36757)))

(declare-fun mapNonEmpty!56809 () Bool)

(declare-fun tp!108179 () Bool)

(assert (=> mapNonEmpty!56809 (= mapRes!56809 (and tp!108179 e!759523))))

(declare-fun mapValue!56809 () ValueCell!17480)

(declare-fun mapKey!56809 () (_ BitVec 32))

(declare-fun mapRest!56809 () (Array (_ BitVec 32) ValueCell!17480))

(assert (=> mapNonEmpty!56809 (= (arr!43631 _values!1320) (store mapRest!56809 mapKey!56809 mapValue!56809))))

(declare-fun b!1333241 () Bool)

(declare-fun res!884767 () Bool)

(assert (=> b!1333241 (=> (not res!884767) (not e!759521))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54113)

(declare-fun zeroValue!1262 () V!54113)

(declare-datatypes ((tuple2!23848 0))(
  ( (tuple2!23849 (_1!11935 (_ BitVec 64)) (_2!11935 V!54113)) )
))
(declare-datatypes ((List!30989 0))(
  ( (Nil!30986) (Cons!30985 (h!32194 tuple2!23848) (t!45187 List!30989)) )
))
(declare-datatypes ((ListLongMap!21505 0))(
  ( (ListLongMap!21506 (toList!10768 List!30989)) )
))
(declare-fun contains!8860 (ListLongMap!21505 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5627 (array!90327 array!90329 (_ BitVec 32) (_ BitVec 32) V!54113 V!54113 (_ BitVec 32) Int) ListLongMap!21505)

(assert (=> b!1333241 (= res!884767 (contains!8860 (getCurrentListMap!5627 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1333243 () Bool)

(declare-fun e!759522 () Bool)

(assert (=> b!1333243 (= e!759522 tp_is_empty!36757)))

(declare-fun b!1333244 () Bool)

(declare-fun res!884771 () Bool)

(assert (=> b!1333244 (=> (not res!884771) (not e!759521))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90327 (_ BitVec 32)) Bool)

(assert (=> b!1333244 (= res!884771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1333245 () Bool)

(assert (=> b!1333245 (= e!759521 false)))

(declare-fun lt!591928 () Bool)

(declare-fun +!4731 (ListLongMap!21505 tuple2!23848) ListLongMap!21505)

(declare-fun getCurrentListMapNoExtraKeys!6369 (array!90327 array!90329 (_ BitVec 32) (_ BitVec 32) V!54113 V!54113 (_ BitVec 32) Int) ListLongMap!21505)

(declare-fun get!22010 (ValueCell!17480 V!54113) V!54113)

(declare-fun dynLambda!3661 (Int (_ BitVec 64)) V!54113)

(assert (=> b!1333245 (= lt!591928 (contains!8860 (+!4731 (getCurrentListMapNoExtraKeys!6369 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23849 (select (arr!43630 _keys!1590) from!1980) (get!22010 (select (arr!43631 _values!1320) from!1980) (dynLambda!3661 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) k0!1153))))

(declare-fun b!1333242 () Bool)

(declare-fun e!759519 () Bool)

(assert (=> b!1333242 (= e!759519 (and e!759522 mapRes!56809))))

(declare-fun condMapEmpty!56809 () Bool)

(declare-fun mapDefault!56809 () ValueCell!17480)

(assert (=> b!1333242 (= condMapEmpty!56809 (= (arr!43631 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17480)) mapDefault!56809)))))

(declare-fun res!884766 () Bool)

(assert (=> start!112452 (=> (not res!884766) (not e!759521))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112452 (= res!884766 (validMask!0 mask!1998))))

(assert (=> start!112452 e!759521))

(declare-fun array_inv!33103 (array!90329) Bool)

(assert (=> start!112452 (and (array_inv!33103 _values!1320) e!759519)))

(assert (=> start!112452 true))

(declare-fun array_inv!33104 (array!90327) Bool)

(assert (=> start!112452 (array_inv!33104 _keys!1590)))

(assert (=> start!112452 tp!108178))

(assert (=> start!112452 tp_is_empty!36757))

(assert (= (and start!112452 res!884766) b!1333236))

(assert (= (and b!1333236 res!884769) b!1333244))

(assert (= (and b!1333244 res!884771) b!1333235))

(assert (= (and b!1333235 res!884768) b!1333239))

(assert (= (and b!1333239 res!884773) b!1333241))

(assert (= (and b!1333241 res!884767) b!1333237))

(assert (= (and b!1333237 res!884770) b!1333234))

(assert (= (and b!1333234 res!884772) b!1333238))

(assert (= (and b!1333238 res!884765) b!1333245))

(assert (= (and b!1333242 condMapEmpty!56809) mapIsEmpty!56809))

(assert (= (and b!1333242 (not condMapEmpty!56809)) mapNonEmpty!56809))

(get-info :version)

(assert (= (and mapNonEmpty!56809 ((_ is ValueCellFull!17480) mapValue!56809)) b!1333240))

(assert (= (and b!1333242 ((_ is ValueCellFull!17480) mapDefault!56809)) b!1333243))

(assert (= start!112452 b!1333242))

(declare-fun b_lambda!24043 () Bool)

(assert (=> (not b_lambda!24043) (not b!1333245)))

(declare-fun t!45185 () Bool)

(declare-fun tb!12001 () Bool)

(assert (=> (and start!112452 (= defaultEntry!1323 defaultEntry!1323) t!45185) tb!12001))

(declare-fun result!25081 () Bool)

(assert (=> tb!12001 (= result!25081 tp_is_empty!36757)))

(assert (=> b!1333245 t!45185))

(declare-fun b_and!49679 () Bool)

(assert (= b_and!49677 (and (=> t!45185 result!25081) b_and!49679)))

(declare-fun m!1221363 () Bool)

(assert (=> mapNonEmpty!56809 m!1221363))

(declare-fun m!1221365 () Bool)

(assert (=> b!1333241 m!1221365))

(assert (=> b!1333241 m!1221365))

(declare-fun m!1221367 () Bool)

(assert (=> b!1333241 m!1221367))

(declare-fun m!1221369 () Bool)

(assert (=> b!1333237 m!1221369))

(declare-fun m!1221371 () Bool)

(assert (=> start!112452 m!1221371))

(declare-fun m!1221373 () Bool)

(assert (=> start!112452 m!1221373))

(declare-fun m!1221375 () Bool)

(assert (=> start!112452 m!1221375))

(declare-fun m!1221377 () Bool)

(assert (=> b!1333235 m!1221377))

(declare-fun m!1221379 () Bool)

(assert (=> b!1333245 m!1221379))

(declare-fun m!1221381 () Bool)

(assert (=> b!1333245 m!1221381))

(declare-fun m!1221383 () Bool)

(assert (=> b!1333245 m!1221383))

(declare-fun m!1221385 () Bool)

(assert (=> b!1333245 m!1221385))

(assert (=> b!1333245 m!1221379))

(declare-fun m!1221387 () Bool)

(assert (=> b!1333245 m!1221387))

(assert (=> b!1333245 m!1221383))

(declare-fun m!1221389 () Bool)

(assert (=> b!1333245 m!1221389))

(assert (=> b!1333245 m!1221381))

(assert (=> b!1333245 m!1221385))

(assert (=> b!1333245 m!1221369))

(assert (=> b!1333234 m!1221369))

(assert (=> b!1333234 m!1221369))

(declare-fun m!1221391 () Bool)

(assert (=> b!1333234 m!1221391))

(declare-fun m!1221393 () Bool)

(assert (=> b!1333244 m!1221393))

(check-sat b_and!49679 (not start!112452) (not b!1333235) tp_is_empty!36757 (not mapNonEmpty!56809) (not b!1333245) (not b_next!30847) (not b!1333244) (not b_lambda!24043) (not b!1333241) (not b!1333234))
(check-sat b_and!49679 (not b_next!30847))
