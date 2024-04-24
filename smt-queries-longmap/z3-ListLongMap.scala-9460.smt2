; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112592 () Bool)

(assert start!112592)

(declare-fun b_free!30763 () Bool)

(declare-fun b_next!30763 () Bool)

(assert (=> start!112592 (= b_free!30763 (not b_next!30763))))

(declare-fun tp!107925 () Bool)

(declare-fun b_and!49583 () Bool)

(assert (=> start!112592 (= tp!107925 b_and!49583)))

(declare-fun b!1333358 () Bool)

(declare-fun res!884482 () Bool)

(declare-fun e!759766 () Bool)

(assert (=> b!1333358 (=> (not res!884482) (not e!759766))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1333358 (= res!884482 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1333359 () Bool)

(declare-fun e!759769 () Bool)

(declare-fun tp_is_empty!36673 () Bool)

(assert (=> b!1333359 (= e!759769 tp_is_empty!36673)))

(declare-fun b!1333360 () Bool)

(declare-fun res!884478 () Bool)

(assert (=> b!1333360 (=> (not res!884478) (not e!759766))))

(declare-datatypes ((array!90331 0))(
  ( (array!90332 (arr!43627 (Array (_ BitVec 32) (_ BitVec 64))) (size!44178 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90331)

(declare-datatypes ((List!30916 0))(
  ( (Nil!30913) (Cons!30912 (h!32130 (_ BitVec 64)) (t!45084 List!30916)) )
))
(declare-fun arrayNoDuplicates!0 (array!90331 (_ BitVec 32) List!30916) Bool)

(assert (=> b!1333360 (= res!884478 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30913))))

(declare-fun mapNonEmpty!56683 () Bool)

(declare-fun mapRes!56683 () Bool)

(declare-fun tp!107926 () Bool)

(assert (=> mapNonEmpty!56683 (= mapRes!56683 (and tp!107926 e!759769))))

(declare-datatypes ((V!54001 0))(
  ( (V!54002 (val!18411 Int)) )
))
(declare-datatypes ((ValueCell!17438 0))(
  ( (ValueCellFull!17438 (v!21043 V!54001)) (EmptyCell!17438) )
))
(declare-datatypes ((array!90333 0))(
  ( (array!90334 (arr!43628 (Array (_ BitVec 32) ValueCell!17438)) (size!44179 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90333)

(declare-fun mapValue!56683 () ValueCell!17438)

(declare-fun mapRest!56683 () (Array (_ BitVec 32) ValueCell!17438))

(declare-fun mapKey!56683 () (_ BitVec 32))

(assert (=> mapNonEmpty!56683 (= (arr!43628 _values!1320) (store mapRest!56683 mapKey!56683 mapValue!56683))))

(declare-fun b!1333361 () Bool)

(declare-fun res!884479 () Bool)

(assert (=> b!1333361 (=> (not res!884479) (not e!759766))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1333361 (= res!884479 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44178 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!56683 () Bool)

(assert (=> mapIsEmpty!56683 mapRes!56683))

(declare-fun b!1333362 () Bool)

(declare-fun res!884476 () Bool)

(assert (=> b!1333362 (=> (not res!884476) (not e!759766))))

(assert (=> b!1333362 (= res!884476 (not (= (select (arr!43627 _keys!1590) from!1980) k0!1153)))))

(declare-fun res!884483 () Bool)

(assert (=> start!112592 (=> (not res!884483) (not e!759766))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112592 (= res!884483 (validMask!0 mask!1998))))

(assert (=> start!112592 e!759766))

(declare-fun e!759767 () Bool)

(declare-fun array_inv!33185 (array!90333) Bool)

(assert (=> start!112592 (and (array_inv!33185 _values!1320) e!759767)))

(assert (=> start!112592 true))

(declare-fun array_inv!33186 (array!90331) Bool)

(assert (=> start!112592 (array_inv!33186 _keys!1590)))

(assert (=> start!112592 tp!107925))

(assert (=> start!112592 tp_is_empty!36673))

(declare-fun b!1333363 () Bool)

(declare-fun res!884477 () Bool)

(assert (=> b!1333363 (=> (not res!884477) (not e!759766))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54001)

(declare-fun zeroValue!1262 () V!54001)

(declare-datatypes ((tuple2!23756 0))(
  ( (tuple2!23757 (_1!11889 (_ BitVec 64)) (_2!11889 V!54001)) )
))
(declare-datatypes ((List!30917 0))(
  ( (Nil!30914) (Cons!30913 (h!32131 tuple2!23756) (t!45085 List!30917)) )
))
(declare-datatypes ((ListLongMap!21421 0))(
  ( (ListLongMap!21422 (toList!10726 List!30917)) )
))
(declare-fun contains!8902 (ListLongMap!21421 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5694 (array!90331 array!90333 (_ BitVec 32) (_ BitVec 32) V!54001 V!54001 (_ BitVec 32) Int) ListLongMap!21421)

(assert (=> b!1333363 (= res!884477 (contains!8902 (getCurrentListMap!5694 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1333364 () Bool)

(declare-fun e!759765 () Bool)

(assert (=> b!1333364 (= e!759765 tp_is_empty!36673)))

(declare-fun b!1333365 () Bool)

(assert (=> b!1333365 (= e!759766 (not true))))

(declare-fun lt!592308 () ListLongMap!21421)

(declare-fun +!4735 (ListLongMap!21421 tuple2!23756) ListLongMap!21421)

(assert (=> b!1333365 (contains!8902 (+!4735 lt!592308 (tuple2!23757 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153)))

(declare-datatypes ((Unit!43780 0))(
  ( (Unit!43781) )
))
(declare-fun lt!592303 () Unit!43780)

(declare-fun addStillContains!1181 (ListLongMap!21421 (_ BitVec 64) V!54001 (_ BitVec 64)) Unit!43780)

(assert (=> b!1333365 (= lt!592303 (addStillContains!1181 lt!592308 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k0!1153))))

(assert (=> b!1333365 (contains!8902 lt!592308 k0!1153)))

(declare-fun lt!592305 () Unit!43780)

(declare-fun lt!592304 () V!54001)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!278 ((_ BitVec 64) (_ BitVec 64) V!54001 ListLongMap!21421) Unit!43780)

(assert (=> b!1333365 (= lt!592305 (lemmaInListMapAfterAddingDiffThenInBefore!278 k0!1153 (select (arr!43627 _keys!1590) from!1980) lt!592304 lt!592308))))

(declare-fun lt!592306 () ListLongMap!21421)

(assert (=> b!1333365 (contains!8902 lt!592306 k0!1153)))

(declare-fun lt!592307 () Unit!43780)

(assert (=> b!1333365 (= lt!592307 (lemmaInListMapAfterAddingDiffThenInBefore!278 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!592306))))

(assert (=> b!1333365 (= lt!592306 (+!4735 lt!592308 (tuple2!23757 (select (arr!43627 _keys!1590) from!1980) lt!592304)))))

(declare-fun get!22022 (ValueCell!17438 V!54001) V!54001)

(declare-fun dynLambda!3689 (Int (_ BitVec 64)) V!54001)

(assert (=> b!1333365 (= lt!592304 (get!22022 (select (arr!43628 _values!1320) from!1980) (dynLambda!3689 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6379 (array!90331 array!90333 (_ BitVec 32) (_ BitVec 32) V!54001 V!54001 (_ BitVec 32) Int) ListLongMap!21421)

(assert (=> b!1333365 (= lt!592308 (getCurrentListMapNoExtraKeys!6379 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1333366 () Bool)

(assert (=> b!1333366 (= e!759767 (and e!759765 mapRes!56683))))

(declare-fun condMapEmpty!56683 () Bool)

(declare-fun mapDefault!56683 () ValueCell!17438)

(assert (=> b!1333366 (= condMapEmpty!56683 (= (arr!43628 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17438)) mapDefault!56683)))))

(declare-fun b!1333367 () Bool)

(declare-fun res!884475 () Bool)

(assert (=> b!1333367 (=> (not res!884475) (not e!759766))))

(assert (=> b!1333367 (= res!884475 (and (= (size!44179 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44178 _keys!1590) (size!44179 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1333368 () Bool)

(declare-fun res!884480 () Bool)

(assert (=> b!1333368 (=> (not res!884480) (not e!759766))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1333368 (= res!884480 (validKeyInArray!0 (select (arr!43627 _keys!1590) from!1980)))))

(declare-fun b!1333369 () Bool)

(declare-fun res!884481 () Bool)

(assert (=> b!1333369 (=> (not res!884481) (not e!759766))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90331 (_ BitVec 32)) Bool)

(assert (=> b!1333369 (= res!884481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(assert (= (and start!112592 res!884483) b!1333367))

(assert (= (and b!1333367 res!884475) b!1333369))

(assert (= (and b!1333369 res!884481) b!1333360))

(assert (= (and b!1333360 res!884478) b!1333361))

(assert (= (and b!1333361 res!884479) b!1333363))

(assert (= (and b!1333363 res!884477) b!1333362))

(assert (= (and b!1333362 res!884476) b!1333368))

(assert (= (and b!1333368 res!884480) b!1333358))

(assert (= (and b!1333358 res!884482) b!1333365))

(assert (= (and b!1333366 condMapEmpty!56683) mapIsEmpty!56683))

(assert (= (and b!1333366 (not condMapEmpty!56683)) mapNonEmpty!56683))

(get-info :version)

(assert (= (and mapNonEmpty!56683 ((_ is ValueCellFull!17438) mapValue!56683)) b!1333359))

(assert (= (and b!1333366 ((_ is ValueCellFull!17438) mapDefault!56683)) b!1333364))

(assert (= start!112592 b!1333366))

(declare-fun b_lambda!24017 () Bool)

(assert (=> (not b_lambda!24017) (not b!1333365)))

(declare-fun t!45083 () Bool)

(declare-fun tb!11971 () Bool)

(assert (=> (and start!112592 (= defaultEntry!1323 defaultEntry!1323) t!45083) tb!11971))

(declare-fun result!25021 () Bool)

(assert (=> tb!11971 (= result!25021 tp_is_empty!36673)))

(assert (=> b!1333365 t!45083))

(declare-fun b_and!49585 () Bool)

(assert (= b_and!49583 (and (=> t!45083 result!25021) b_and!49585)))

(declare-fun m!1222409 () Bool)

(assert (=> b!1333365 m!1222409))

(declare-fun m!1222411 () Bool)

(assert (=> b!1333365 m!1222411))

(declare-fun m!1222413 () Bool)

(assert (=> b!1333365 m!1222413))

(assert (=> b!1333365 m!1222411))

(declare-fun m!1222415 () Bool)

(assert (=> b!1333365 m!1222415))

(declare-fun m!1222417 () Bool)

(assert (=> b!1333365 m!1222417))

(declare-fun m!1222419 () Bool)

(assert (=> b!1333365 m!1222419))

(declare-fun m!1222421 () Bool)

(assert (=> b!1333365 m!1222421))

(declare-fun m!1222423 () Bool)

(assert (=> b!1333365 m!1222423))

(assert (=> b!1333365 m!1222413))

(declare-fun m!1222425 () Bool)

(assert (=> b!1333365 m!1222425))

(declare-fun m!1222427 () Bool)

(assert (=> b!1333365 m!1222427))

(declare-fun m!1222429 () Bool)

(assert (=> b!1333365 m!1222429))

(assert (=> b!1333365 m!1222419))

(declare-fun m!1222431 () Bool)

(assert (=> b!1333365 m!1222431))

(declare-fun m!1222433 () Bool)

(assert (=> b!1333365 m!1222433))

(assert (=> b!1333365 m!1222425))

(declare-fun m!1222435 () Bool)

(assert (=> start!112592 m!1222435))

(declare-fun m!1222437 () Bool)

(assert (=> start!112592 m!1222437))

(declare-fun m!1222439 () Bool)

(assert (=> start!112592 m!1222439))

(declare-fun m!1222441 () Bool)

(assert (=> b!1333363 m!1222441))

(assert (=> b!1333363 m!1222441))

(declare-fun m!1222443 () Bool)

(assert (=> b!1333363 m!1222443))

(declare-fun m!1222445 () Bool)

(assert (=> b!1333360 m!1222445))

(assert (=> b!1333368 m!1222425))

(assert (=> b!1333368 m!1222425))

(declare-fun m!1222447 () Bool)

(assert (=> b!1333368 m!1222447))

(declare-fun m!1222449 () Bool)

(assert (=> b!1333369 m!1222449))

(assert (=> b!1333362 m!1222425))

(declare-fun m!1222451 () Bool)

(assert (=> mapNonEmpty!56683 m!1222451))

(check-sat (not b_next!30763) (not b!1333360) (not b_lambda!24017) (not mapNonEmpty!56683) (not b!1333368) (not b!1333363) b_and!49585 (not start!112592) (not b!1333365) tp_is_empty!36673 (not b!1333369))
(check-sat b_and!49585 (not b_next!30763))
