; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112668 () Bool)

(assert start!112668)

(declare-fun b_free!31005 () Bool)

(declare-fun b_next!31005 () Bool)

(assert (=> start!112668 (= b_free!31005 (not b_next!31005))))

(declare-fun tp!108656 () Bool)

(declare-fun b_and!49947 () Bool)

(assert (=> start!112668 (= tp!108656 b_and!49947)))

(declare-fun b!1336405 () Bool)

(declare-fun e!761062 () Bool)

(declare-fun e!761065 () Bool)

(declare-fun mapRes!57050 () Bool)

(assert (=> b!1336405 (= e!761062 (and e!761065 mapRes!57050))))

(declare-fun condMapEmpty!57050 () Bool)

(declare-datatypes ((V!54323 0))(
  ( (V!54324 (val!18532 Int)) )
))
(declare-datatypes ((ValueCell!17559 0))(
  ( (ValueCellFull!17559 (v!21172 V!54323)) (EmptyCell!17559) )
))
(declare-datatypes ((array!90690 0))(
  ( (array!90691 (arr!43810 (Array (_ BitVec 32) ValueCell!17559)) (size!44360 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90690)

(declare-fun mapDefault!57050 () ValueCell!17559)

(assert (=> b!1336405 (= condMapEmpty!57050 (= (arr!43810 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17559)) mapDefault!57050)))))

(declare-fun b!1336406 () Bool)

(declare-fun res!886887 () Bool)

(declare-fun e!761061 () Bool)

(assert (=> b!1336406 (=> (not res!886887) (not e!761061))))

(declare-datatypes ((array!90692 0))(
  ( (array!90693 (arr!43811 (Array (_ BitVec 32) (_ BitVec 64))) (size!44361 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90692)

(declare-datatypes ((List!31044 0))(
  ( (Nil!31041) (Cons!31040 (h!32249 (_ BitVec 64)) (t!45330 List!31044)) )
))
(declare-fun arrayNoDuplicates!0 (array!90692 (_ BitVec 32) List!31044) Bool)

(assert (=> b!1336406 (= res!886887 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31041))))

(declare-fun b!1336407 () Bool)

(declare-fun from!1980 () (_ BitVec 32))

(assert (=> b!1336407 (= e!761061 (not (bvslt from!1980 (size!44360 _values!1320))))))

(declare-datatypes ((tuple2!23902 0))(
  ( (tuple2!23903 (_1!11962 (_ BitVec 64)) (_2!11962 V!54323)) )
))
(declare-datatypes ((List!31045 0))(
  ( (Nil!31042) (Cons!31041 (h!32250 tuple2!23902) (t!45331 List!31045)) )
))
(declare-datatypes ((ListLongMap!21559 0))(
  ( (ListLongMap!21560 (toList!10795 List!31045)) )
))
(declare-fun lt!592769 () ListLongMap!21559)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun contains!8960 (ListLongMap!21559 (_ BitVec 64)) Bool)

(assert (=> b!1336407 (contains!8960 lt!592769 k0!1153)))

(declare-datatypes ((Unit!43922 0))(
  ( (Unit!43923) )
))
(declare-fun lt!592768 () Unit!43922)

(declare-fun minValue!1262 () V!54323)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!316 ((_ BitVec 64) (_ BitVec 64) V!54323 ListLongMap!21559) Unit!43922)

(assert (=> b!1336407 (= lt!592768 (lemmaInListMapAfterAddingDiffThenInBefore!316 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!592769))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun zeroValue!1262 () V!54323)

(declare-fun +!4737 (ListLongMap!21559 tuple2!23902) ListLongMap!21559)

(declare-fun getCurrentListMapNoExtraKeys!6379 (array!90692 array!90690 (_ BitVec 32) (_ BitVec 32) V!54323 V!54323 (_ BitVec 32) Int) ListLongMap!21559)

(declare-fun get!22104 (ValueCell!17559 V!54323) V!54323)

(declare-fun dynLambda!3676 (Int (_ BitVec 64)) V!54323)

(assert (=> b!1336407 (= lt!592769 (+!4737 (getCurrentListMapNoExtraKeys!6379 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23903 (select (arr!43811 _keys!1590) from!1980) (get!22104 (select (arr!43810 _values!1320) from!1980) (dynLambda!3676 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1336408 () Bool)

(declare-fun res!886889 () Bool)

(assert (=> b!1336408 (=> (not res!886889) (not e!761061))))

(declare-fun getCurrentListMap!5767 (array!90692 array!90690 (_ BitVec 32) (_ BitVec 32) V!54323 V!54323 (_ BitVec 32) Int) ListLongMap!21559)

(assert (=> b!1336408 (= res!886889 (contains!8960 (getCurrentListMap!5767 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapIsEmpty!57050 () Bool)

(assert (=> mapIsEmpty!57050 mapRes!57050))

(declare-fun mapNonEmpty!57050 () Bool)

(declare-fun tp!108655 () Bool)

(declare-fun e!761063 () Bool)

(assert (=> mapNonEmpty!57050 (= mapRes!57050 (and tp!108655 e!761063))))

(declare-fun mapValue!57050 () ValueCell!17559)

(declare-fun mapRest!57050 () (Array (_ BitVec 32) ValueCell!17559))

(declare-fun mapKey!57050 () (_ BitVec 32))

(assert (=> mapNonEmpty!57050 (= (arr!43810 _values!1320) (store mapRest!57050 mapKey!57050 mapValue!57050))))

(declare-fun b!1336410 () Bool)

(declare-fun res!886881 () Bool)

(assert (=> b!1336410 (=> (not res!886881) (not e!761061))))

(assert (=> b!1336410 (= res!886881 (not (= (select (arr!43811 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1336411 () Bool)

(declare-fun tp_is_empty!36915 () Bool)

(assert (=> b!1336411 (= e!761063 tp_is_empty!36915)))

(declare-fun b!1336412 () Bool)

(declare-fun res!886888 () Bool)

(assert (=> b!1336412 (=> (not res!886888) (not e!761061))))

(assert (=> b!1336412 (= res!886888 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44361 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1336413 () Bool)

(declare-fun res!886884 () Bool)

(assert (=> b!1336413 (=> (not res!886884) (not e!761061))))

(assert (=> b!1336413 (= res!886884 (and (= (size!44360 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44361 _keys!1590) (size!44360 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1336414 () Bool)

(declare-fun res!886883 () Bool)

(assert (=> b!1336414 (=> (not res!886883) (not e!761061))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90692 (_ BitVec 32)) Bool)

(assert (=> b!1336414 (= res!886883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun res!886885 () Bool)

(assert (=> start!112668 (=> (not res!886885) (not e!761061))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112668 (= res!886885 (validMask!0 mask!1998))))

(assert (=> start!112668 e!761061))

(declare-fun array_inv!33039 (array!90690) Bool)

(assert (=> start!112668 (and (array_inv!33039 _values!1320) e!761062)))

(assert (=> start!112668 true))

(declare-fun array_inv!33040 (array!90692) Bool)

(assert (=> start!112668 (array_inv!33040 _keys!1590)))

(assert (=> start!112668 tp!108656))

(assert (=> start!112668 tp_is_empty!36915))

(declare-fun b!1336409 () Bool)

(declare-fun res!886886 () Bool)

(assert (=> b!1336409 (=> (not res!886886) (not e!761061))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1336409 (= res!886886 (validKeyInArray!0 (select (arr!43811 _keys!1590) from!1980)))))

(declare-fun b!1336415 () Bool)

(assert (=> b!1336415 (= e!761065 tp_is_empty!36915)))

(declare-fun b!1336416 () Bool)

(declare-fun res!886882 () Bool)

(assert (=> b!1336416 (=> (not res!886882) (not e!761061))))

(assert (=> b!1336416 (= res!886882 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!112668 res!886885) b!1336413))

(assert (= (and b!1336413 res!886884) b!1336414))

(assert (= (and b!1336414 res!886883) b!1336406))

(assert (= (and b!1336406 res!886887) b!1336412))

(assert (= (and b!1336412 res!886888) b!1336408))

(assert (= (and b!1336408 res!886889) b!1336410))

(assert (= (and b!1336410 res!886881) b!1336409))

(assert (= (and b!1336409 res!886886) b!1336416))

(assert (= (and b!1336416 res!886882) b!1336407))

(assert (= (and b!1336405 condMapEmpty!57050) mapIsEmpty!57050))

(assert (= (and b!1336405 (not condMapEmpty!57050)) mapNonEmpty!57050))

(get-info :version)

(assert (= (and mapNonEmpty!57050 ((_ is ValueCellFull!17559) mapValue!57050)) b!1336411))

(assert (= (and b!1336405 ((_ is ValueCellFull!17559) mapDefault!57050)) b!1336415))

(assert (= start!112668 b!1336405))

(declare-fun b_lambda!24163 () Bool)

(assert (=> (not b_lambda!24163) (not b!1336407)))

(declare-fun t!45329 () Bool)

(declare-fun tb!12089 () Bool)

(assert (=> (and start!112668 (= defaultEntry!1323 defaultEntry!1323) t!45329) tb!12089))

(declare-fun result!25251 () Bool)

(assert (=> tb!12089 (= result!25251 tp_is_empty!36915)))

(assert (=> b!1336407 t!45329))

(declare-fun b_and!49949 () Bool)

(assert (= b_and!49947 (and (=> t!45329 result!25251) b_and!49949)))

(declare-fun m!1224497 () Bool)

(assert (=> b!1336414 m!1224497))

(declare-fun m!1224499 () Bool)

(assert (=> mapNonEmpty!57050 m!1224499))

(declare-fun m!1224501 () Bool)

(assert (=> b!1336408 m!1224501))

(assert (=> b!1336408 m!1224501))

(declare-fun m!1224503 () Bool)

(assert (=> b!1336408 m!1224503))

(declare-fun m!1224505 () Bool)

(assert (=> b!1336409 m!1224505))

(assert (=> b!1336409 m!1224505))

(declare-fun m!1224507 () Bool)

(assert (=> b!1336409 m!1224507))

(assert (=> b!1336410 m!1224505))

(declare-fun m!1224509 () Bool)

(assert (=> b!1336406 m!1224509))

(declare-fun m!1224511 () Bool)

(assert (=> b!1336407 m!1224511))

(declare-fun m!1224513 () Bool)

(assert (=> b!1336407 m!1224513))

(declare-fun m!1224515 () Bool)

(assert (=> b!1336407 m!1224515))

(declare-fun m!1224517 () Bool)

(assert (=> b!1336407 m!1224517))

(assert (=> b!1336407 m!1224511))

(declare-fun m!1224519 () Bool)

(assert (=> b!1336407 m!1224519))

(declare-fun m!1224521 () Bool)

(assert (=> b!1336407 m!1224521))

(assert (=> b!1336407 m!1224517))

(assert (=> b!1336407 m!1224505))

(assert (=> b!1336407 m!1224513))

(declare-fun m!1224523 () Bool)

(assert (=> b!1336407 m!1224523))

(declare-fun m!1224525 () Bool)

(assert (=> start!112668 m!1224525))

(declare-fun m!1224527 () Bool)

(assert (=> start!112668 m!1224527))

(declare-fun m!1224529 () Bool)

(assert (=> start!112668 m!1224529))

(check-sat (not start!112668) (not b!1336414) (not b!1336408) (not b_lambda!24163) tp_is_empty!36915 (not b!1336407) (not b_next!31005) (not mapNonEmpty!57050) (not b!1336406) (not b!1336409) b_and!49949)
(check-sat b_and!49949 (not b_next!31005))
