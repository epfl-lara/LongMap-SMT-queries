; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112458 () Bool)

(assert start!112458)

(declare-fun b_free!30853 () Bool)

(declare-fun b_next!30853 () Bool)

(assert (=> start!112458 (= b_free!30853 (not b_next!30853))))

(declare-fun tp!108197 () Bool)

(declare-fun b_and!49689 () Bool)

(assert (=> start!112458 (= tp!108197 b_and!49689)))

(declare-fun res!884858 () Bool)

(declare-fun e!759571 () Bool)

(assert (=> start!112458 (=> (not res!884858) (not e!759571))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112458 (= res!884858 (validMask!0 mask!1998))))

(assert (=> start!112458 e!759571))

(declare-datatypes ((V!54121 0))(
  ( (V!54122 (val!18456 Int)) )
))
(declare-datatypes ((ValueCell!17483 0))(
  ( (ValueCellFull!17483 (v!21092 V!54121)) (EmptyCell!17483) )
))
(declare-datatypes ((array!90339 0))(
  ( (array!90340 (arr!43636 (Array (_ BitVec 32) ValueCell!17483)) (size!44188 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90339)

(declare-fun e!759567 () Bool)

(declare-fun array_inv!33107 (array!90339) Bool)

(assert (=> start!112458 (and (array_inv!33107 _values!1320) e!759567)))

(assert (=> start!112458 true))

(declare-datatypes ((array!90341 0))(
  ( (array!90342 (arr!43637 (Array (_ BitVec 32) (_ BitVec 64))) (size!44189 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90341)

(declare-fun array_inv!33108 (array!90341) Bool)

(assert (=> start!112458 (array_inv!33108 _keys!1590)))

(assert (=> start!112458 tp!108197))

(declare-fun tp_is_empty!36763 () Bool)

(assert (=> start!112458 tp_is_empty!36763))

(declare-fun mapIsEmpty!56818 () Bool)

(declare-fun mapRes!56818 () Bool)

(assert (=> mapIsEmpty!56818 mapRes!56818))

(declare-fun b!1333352 () Bool)

(declare-fun res!884850 () Bool)

(assert (=> b!1333352 (=> (not res!884850) (not e!759571))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1333352 (= res!884850 (not (= (select (arr!43637 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1333353 () Bool)

(declare-fun res!884852 () Bool)

(assert (=> b!1333353 (=> (not res!884852) (not e!759571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90341 (_ BitVec 32)) Bool)

(assert (=> b!1333353 (= res!884852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1333354 () Bool)

(declare-fun res!884859 () Bool)

(assert (=> b!1333354 (=> (not res!884859) (not e!759571))))

(declare-datatypes ((List!30992 0))(
  ( (Nil!30989) (Cons!30988 (h!32197 (_ BitVec 64)) (t!45196 List!30992)) )
))
(declare-fun arrayNoDuplicates!0 (array!90341 (_ BitVec 32) List!30992) Bool)

(assert (=> b!1333354 (= res!884859 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30989))))

(declare-fun b!1333355 () Bool)

(declare-fun res!884856 () Bool)

(assert (=> b!1333355 (=> (not res!884856) (not e!759571))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1333355 (= res!884856 (validKeyInArray!0 (select (arr!43637 _keys!1590) from!1980)))))

(declare-fun b!1333356 () Bool)

(declare-fun res!884854 () Bool)

(assert (=> b!1333356 (=> (not res!884854) (not e!759571))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1333356 (= res!884854 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1333357 () Bool)

(declare-fun e!759570 () Bool)

(assert (=> b!1333357 (= e!759570 tp_is_empty!36763)))

(declare-fun b!1333358 () Bool)

(declare-fun e!759566 () Bool)

(assert (=> b!1333358 (= e!759567 (and e!759566 mapRes!56818))))

(declare-fun condMapEmpty!56818 () Bool)

(declare-fun mapDefault!56818 () ValueCell!17483)

(assert (=> b!1333358 (= condMapEmpty!56818 (= (arr!43636 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17483)) mapDefault!56818)))))

(declare-fun b!1333359 () Bool)

(declare-fun e!759569 () Bool)

(assert (=> b!1333359 (= e!759571 e!759569)))

(declare-fun res!884851 () Bool)

(assert (=> b!1333359 (=> (not res!884851) (not e!759569))))

(declare-fun lt!591942 () V!54121)

(declare-datatypes ((tuple2!23852 0))(
  ( (tuple2!23853 (_1!11937 (_ BitVec 64)) (_2!11937 V!54121)) )
))
(declare-datatypes ((List!30993 0))(
  ( (Nil!30990) (Cons!30989 (h!32198 tuple2!23852) (t!45197 List!30993)) )
))
(declare-datatypes ((ListLongMap!21509 0))(
  ( (ListLongMap!21510 (toList!10770 List!30993)) )
))
(declare-fun lt!591943 () ListLongMap!21509)

(declare-fun contains!8862 (ListLongMap!21509 (_ BitVec 64)) Bool)

(declare-fun +!4733 (ListLongMap!21509 tuple2!23852) ListLongMap!21509)

(assert (=> b!1333359 (= res!884851 (contains!8862 (+!4733 lt!591943 (tuple2!23853 (select (arr!43637 _keys!1590) from!1980) lt!591942)) k0!1153))))

(declare-fun minValue!1262 () V!54121)

(declare-fun zeroValue!1262 () V!54121)

(declare-fun defaultEntry!1323 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6371 (array!90341 array!90339 (_ BitVec 32) (_ BitVec 32) V!54121 V!54121 (_ BitVec 32) Int) ListLongMap!21509)

(assert (=> b!1333359 (= lt!591943 (getCurrentListMapNoExtraKeys!6371 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun get!22014 (ValueCell!17483 V!54121) V!54121)

(declare-fun dynLambda!3663 (Int (_ BitVec 64)) V!54121)

(assert (=> b!1333359 (= lt!591942 (get!22014 (select (arr!43636 _values!1320) from!1980) (dynLambda!3663 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1333360 () Bool)

(assert (=> b!1333360 (= e!759569 (not true))))

(assert (=> b!1333360 (contains!8862 lt!591943 k0!1153)))

(declare-datatypes ((Unit!43670 0))(
  ( (Unit!43671) )
))
(declare-fun lt!591941 () Unit!43670)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!285 ((_ BitVec 64) (_ BitVec 64) V!54121 ListLongMap!21509) Unit!43670)

(assert (=> b!1333360 (= lt!591941 (lemmaInListMapAfterAddingDiffThenInBefore!285 k0!1153 (select (arr!43637 _keys!1590) from!1980) lt!591942 lt!591943))))

(declare-fun b!1333361 () Bool)

(declare-fun res!884855 () Bool)

(assert (=> b!1333361 (=> (not res!884855) (not e!759571))))

(declare-fun getCurrentListMap!5628 (array!90341 array!90339 (_ BitVec 32) (_ BitVec 32) V!54121 V!54121 (_ BitVec 32) Int) ListLongMap!21509)

(assert (=> b!1333361 (= res!884855 (contains!8862 (getCurrentListMap!5628 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1333362 () Bool)

(declare-fun res!884857 () Bool)

(assert (=> b!1333362 (=> (not res!884857) (not e!759571))))

(assert (=> b!1333362 (= res!884857 (and (= (size!44188 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44189 _keys!1590) (size!44188 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1333363 () Bool)

(declare-fun res!884853 () Bool)

(assert (=> b!1333363 (=> (not res!884853) (not e!759571))))

(assert (=> b!1333363 (= res!884853 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44189 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1333364 () Bool)

(assert (=> b!1333364 (= e!759566 tp_is_empty!36763)))

(declare-fun mapNonEmpty!56818 () Bool)

(declare-fun tp!108196 () Bool)

(assert (=> mapNonEmpty!56818 (= mapRes!56818 (and tp!108196 e!759570))))

(declare-fun mapValue!56818 () ValueCell!17483)

(declare-fun mapKey!56818 () (_ BitVec 32))

(declare-fun mapRest!56818 () (Array (_ BitVec 32) ValueCell!17483))

(assert (=> mapNonEmpty!56818 (= (arr!43636 _values!1320) (store mapRest!56818 mapKey!56818 mapValue!56818))))

(declare-fun b!1333365 () Bool)

(declare-fun res!884860 () Bool)

(assert (=> b!1333365 (=> (not res!884860) (not e!759569))))

(assert (=> b!1333365 (= res!884860 (not (= k0!1153 (select (arr!43637 _keys!1590) from!1980))))))

(assert (= (and start!112458 res!884858) b!1333362))

(assert (= (and b!1333362 res!884857) b!1333353))

(assert (= (and b!1333353 res!884852) b!1333354))

(assert (= (and b!1333354 res!884859) b!1333363))

(assert (= (and b!1333363 res!884853) b!1333361))

(assert (= (and b!1333361 res!884855) b!1333352))

(assert (= (and b!1333352 res!884850) b!1333355))

(assert (= (and b!1333355 res!884856) b!1333356))

(assert (= (and b!1333356 res!884854) b!1333359))

(assert (= (and b!1333359 res!884851) b!1333365))

(assert (= (and b!1333365 res!884860) b!1333360))

(assert (= (and b!1333358 condMapEmpty!56818) mapIsEmpty!56818))

(assert (= (and b!1333358 (not condMapEmpty!56818)) mapNonEmpty!56818))

(get-info :version)

(assert (= (and mapNonEmpty!56818 ((_ is ValueCellFull!17483) mapValue!56818)) b!1333357))

(assert (= (and b!1333358 ((_ is ValueCellFull!17483) mapDefault!56818)) b!1333364))

(assert (= start!112458 b!1333358))

(declare-fun b_lambda!24049 () Bool)

(assert (=> (not b_lambda!24049) (not b!1333359)))

(declare-fun t!45195 () Bool)

(declare-fun tb!12007 () Bool)

(assert (=> (and start!112458 (= defaultEntry!1323 defaultEntry!1323) t!45195) tb!12007))

(declare-fun result!25093 () Bool)

(assert (=> tb!12007 (= result!25093 tp_is_empty!36763)))

(assert (=> b!1333359 t!45195))

(declare-fun b_and!49691 () Bool)

(assert (= b_and!49689 (and (=> t!45195 result!25093) b_and!49691)))

(declare-fun m!1221459 () Bool)

(assert (=> b!1333354 m!1221459))

(declare-fun m!1221461 () Bool)

(assert (=> b!1333365 m!1221461))

(assert (=> b!1333355 m!1221461))

(assert (=> b!1333355 m!1221461))

(declare-fun m!1221463 () Bool)

(assert (=> b!1333355 m!1221463))

(declare-fun m!1221465 () Bool)

(assert (=> b!1333359 m!1221465))

(declare-fun m!1221467 () Bool)

(assert (=> b!1333359 m!1221467))

(assert (=> b!1333359 m!1221465))

(declare-fun m!1221469 () Bool)

(assert (=> b!1333359 m!1221469))

(declare-fun m!1221471 () Bool)

(assert (=> b!1333359 m!1221471))

(assert (=> b!1333359 m!1221471))

(declare-fun m!1221473 () Bool)

(assert (=> b!1333359 m!1221473))

(declare-fun m!1221475 () Bool)

(assert (=> b!1333359 m!1221475))

(assert (=> b!1333359 m!1221467))

(assert (=> b!1333359 m!1221461))

(declare-fun m!1221477 () Bool)

(assert (=> b!1333361 m!1221477))

(assert (=> b!1333361 m!1221477))

(declare-fun m!1221479 () Bool)

(assert (=> b!1333361 m!1221479))

(assert (=> b!1333352 m!1221461))

(declare-fun m!1221481 () Bool)

(assert (=> b!1333360 m!1221481))

(assert (=> b!1333360 m!1221461))

(assert (=> b!1333360 m!1221461))

(declare-fun m!1221483 () Bool)

(assert (=> b!1333360 m!1221483))

(declare-fun m!1221485 () Bool)

(assert (=> b!1333353 m!1221485))

(declare-fun m!1221487 () Bool)

(assert (=> mapNonEmpty!56818 m!1221487))

(declare-fun m!1221489 () Bool)

(assert (=> start!112458 m!1221489))

(declare-fun m!1221491 () Bool)

(assert (=> start!112458 m!1221491))

(declare-fun m!1221493 () Bool)

(assert (=> start!112458 m!1221493))

(check-sat (not b!1333353) tp_is_empty!36763 (not start!112458) (not b!1333354) (not b_next!30853) (not b!1333359) (not b!1333361) (not b_lambda!24049) (not b!1333355) (not mapNonEmpty!56818) (not b!1333360) b_and!49691)
(check-sat b_and!49691 (not b_next!30853))
