; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112460 () Bool)

(assert start!112460)

(declare-fun b_free!30855 () Bool)

(declare-fun b_next!30855 () Bool)

(assert (=> start!112460 (= b_free!30855 (not b_next!30855))))

(declare-fun tp!108202 () Bool)

(declare-fun b_and!49711 () Bool)

(assert (=> start!112460 (= tp!108202 b_and!49711)))

(declare-fun b!1333466 () Bool)

(declare-fun res!884919 () Bool)

(declare-fun e!759621 () Bool)

(assert (=> b!1333466 (=> (not res!884919) (not e!759621))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((array!90404 0))(
  ( (array!90405 (arr!43668 (Array (_ BitVec 32) (_ BitVec 64))) (size!44218 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90404)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1333466 (= res!884919 (not (= k0!1153 (select (arr!43668 _keys!1590) from!1980))))))

(declare-fun b!1333467 () Bool)

(declare-fun res!884922 () Bool)

(declare-fun e!759618 () Bool)

(assert (=> b!1333467 (=> (not res!884922) (not e!759618))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1333467 (= res!884922 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun res!884916 () Bool)

(assert (=> start!112460 (=> (not res!884916) (not e!759618))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112460 (= res!884916 (validMask!0 mask!1998))))

(assert (=> start!112460 e!759618))

(declare-datatypes ((V!54123 0))(
  ( (V!54124 (val!18457 Int)) )
))
(declare-datatypes ((ValueCell!17484 0))(
  ( (ValueCellFull!17484 (v!21094 V!54123)) (EmptyCell!17484) )
))
(declare-datatypes ((array!90406 0))(
  ( (array!90407 (arr!43669 (Array (_ BitVec 32) ValueCell!17484)) (size!44219 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90406)

(declare-fun e!759617 () Bool)

(declare-fun array_inv!32937 (array!90406) Bool)

(assert (=> start!112460 (and (array_inv!32937 _values!1320) e!759617)))

(assert (=> start!112460 true))

(declare-fun array_inv!32938 (array!90404) Bool)

(assert (=> start!112460 (array_inv!32938 _keys!1590)))

(assert (=> start!112460 tp!108202))

(declare-fun tp_is_empty!36765 () Bool)

(assert (=> start!112460 tp_is_empty!36765))

(declare-fun mapNonEmpty!56821 () Bool)

(declare-fun mapRes!56821 () Bool)

(declare-fun tp!108201 () Bool)

(declare-fun e!759619 () Bool)

(assert (=> mapNonEmpty!56821 (= mapRes!56821 (and tp!108201 e!759619))))

(declare-fun mapValue!56821 () ValueCell!17484)

(declare-fun mapKey!56821 () (_ BitVec 32))

(declare-fun mapRest!56821 () (Array (_ BitVec 32) ValueCell!17484))

(assert (=> mapNonEmpty!56821 (= (arr!43669 _values!1320) (store mapRest!56821 mapKey!56821 mapValue!56821))))

(declare-fun b!1333468 () Bool)

(declare-fun e!759622 () Bool)

(assert (=> b!1333468 (= e!759617 (and e!759622 mapRes!56821))))

(declare-fun condMapEmpty!56821 () Bool)

(declare-fun mapDefault!56821 () ValueCell!17484)

(assert (=> b!1333468 (= condMapEmpty!56821 (= (arr!43669 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17484)) mapDefault!56821)))))

(declare-fun b!1333469 () Bool)

(assert (=> b!1333469 (= e!759618 e!759621)))

(declare-fun res!884917 () Bool)

(assert (=> b!1333469 (=> (not res!884917) (not e!759621))))

(declare-datatypes ((tuple2!23792 0))(
  ( (tuple2!23793 (_1!11907 (_ BitVec 64)) (_2!11907 V!54123)) )
))
(declare-datatypes ((List!30936 0))(
  ( (Nil!30933) (Cons!30932 (h!32141 tuple2!23792) (t!45150 List!30936)) )
))
(declare-datatypes ((ListLongMap!21449 0))(
  ( (ListLongMap!21450 (toList!10740 List!30936)) )
))
(declare-fun lt!592137 () ListLongMap!21449)

(declare-fun lt!592136 () V!54123)

(declare-fun contains!8904 (ListLongMap!21449 (_ BitVec 64)) Bool)

(declare-fun +!4713 (ListLongMap!21449 tuple2!23792) ListLongMap!21449)

(assert (=> b!1333469 (= res!884917 (contains!8904 (+!4713 lt!592137 (tuple2!23793 (select (arr!43668 _keys!1590) from!1980) lt!592136)) k0!1153))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54123)

(declare-fun zeroValue!1262 () V!54123)

(declare-fun getCurrentListMapNoExtraKeys!6351 (array!90404 array!90406 (_ BitVec 32) (_ BitVec 32) V!54123 V!54123 (_ BitVec 32) Int) ListLongMap!21449)

(assert (=> b!1333469 (= lt!592137 (getCurrentListMapNoExtraKeys!6351 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun get!22027 (ValueCell!17484 V!54123) V!54123)

(declare-fun dynLambda!3652 (Int (_ BitVec 64)) V!54123)

(assert (=> b!1333469 (= lt!592136 (get!22027 (select (arr!43669 _values!1320) from!1980) (dynLambda!3652 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1333470 () Bool)

(declare-fun res!884921 () Bool)

(assert (=> b!1333470 (=> (not res!884921) (not e!759618))))

(assert (=> b!1333470 (= res!884921 (not (= (select (arr!43668 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1333471 () Bool)

(declare-fun res!884918 () Bool)

(assert (=> b!1333471 (=> (not res!884918) (not e!759618))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1333471 (= res!884918 (validKeyInArray!0 (select (arr!43668 _keys!1590) from!1980)))))

(declare-fun b!1333472 () Bool)

(assert (=> b!1333472 (= e!759621 (not true))))

(assert (=> b!1333472 (contains!8904 lt!592137 k0!1153)))

(declare-datatypes ((Unit!43867 0))(
  ( (Unit!43868) )
))
(declare-fun lt!592138 () Unit!43867)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!296 ((_ BitVec 64) (_ BitVec 64) V!54123 ListLongMap!21449) Unit!43867)

(assert (=> b!1333472 (= lt!592138 (lemmaInListMapAfterAddingDiffThenInBefore!296 k0!1153 (select (arr!43668 _keys!1590) from!1980) lt!592136 lt!592137))))

(declare-fun b!1333473 () Bool)

(declare-fun res!884913 () Bool)

(assert (=> b!1333473 (=> (not res!884913) (not e!759618))))

(assert (=> b!1333473 (= res!884913 (and (= (size!44219 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44218 _keys!1590) (size!44219 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!56821 () Bool)

(assert (=> mapIsEmpty!56821 mapRes!56821))

(declare-fun b!1333474 () Bool)

(assert (=> b!1333474 (= e!759622 tp_is_empty!36765)))

(declare-fun b!1333475 () Bool)

(declare-fun res!884912 () Bool)

(assert (=> b!1333475 (=> (not res!884912) (not e!759618))))

(declare-datatypes ((List!30937 0))(
  ( (Nil!30934) (Cons!30933 (h!32142 (_ BitVec 64)) (t!45151 List!30937)) )
))
(declare-fun arrayNoDuplicates!0 (array!90404 (_ BitVec 32) List!30937) Bool)

(assert (=> b!1333475 (= res!884912 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30934))))

(declare-fun b!1333476 () Bool)

(declare-fun res!884920 () Bool)

(assert (=> b!1333476 (=> (not res!884920) (not e!759618))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90404 (_ BitVec 32)) Bool)

(assert (=> b!1333476 (= res!884920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1333477 () Bool)

(declare-fun res!884915 () Bool)

(assert (=> b!1333477 (=> (not res!884915) (not e!759618))))

(assert (=> b!1333477 (= res!884915 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44218 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1333478 () Bool)

(declare-fun res!884914 () Bool)

(assert (=> b!1333478 (=> (not res!884914) (not e!759618))))

(declare-fun getCurrentListMap!5721 (array!90404 array!90406 (_ BitVec 32) (_ BitVec 32) V!54123 V!54123 (_ BitVec 32) Int) ListLongMap!21449)

(assert (=> b!1333478 (= res!884914 (contains!8904 (getCurrentListMap!5721 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1333479 () Bool)

(assert (=> b!1333479 (= e!759619 tp_is_empty!36765)))

(assert (= (and start!112460 res!884916) b!1333473))

(assert (= (and b!1333473 res!884913) b!1333476))

(assert (= (and b!1333476 res!884920) b!1333475))

(assert (= (and b!1333475 res!884912) b!1333477))

(assert (= (and b!1333477 res!884915) b!1333478))

(assert (= (and b!1333478 res!884914) b!1333470))

(assert (= (and b!1333470 res!884921) b!1333471))

(assert (= (and b!1333471 res!884918) b!1333467))

(assert (= (and b!1333467 res!884922) b!1333469))

(assert (= (and b!1333469 res!884917) b!1333466))

(assert (= (and b!1333466 res!884919) b!1333472))

(assert (= (and b!1333468 condMapEmpty!56821) mapIsEmpty!56821))

(assert (= (and b!1333468 (not condMapEmpty!56821)) mapNonEmpty!56821))

(get-info :version)

(assert (= (and mapNonEmpty!56821 ((_ is ValueCellFull!17484) mapValue!56821)) b!1333479))

(assert (= (and b!1333468 ((_ is ValueCellFull!17484) mapDefault!56821)) b!1333474))

(assert (= start!112460 b!1333468))

(declare-fun b_lambda!24061 () Bool)

(assert (=> (not b_lambda!24061) (not b!1333469)))

(declare-fun t!45149 () Bool)

(declare-fun tb!12017 () Bool)

(assert (=> (and start!112460 (= defaultEntry!1323 defaultEntry!1323) t!45149) tb!12017))

(declare-fun result!25105 () Bool)

(assert (=> tb!12017 (= result!25105 tp_is_empty!36765)))

(assert (=> b!1333469 t!45149))

(declare-fun b_and!49713 () Bool)

(assert (= b_and!49711 (and (=> t!45149 result!25105) b_and!49713)))

(declare-fun m!1222011 () Bool)

(assert (=> b!1333472 m!1222011))

(declare-fun m!1222013 () Bool)

(assert (=> b!1333472 m!1222013))

(assert (=> b!1333472 m!1222013))

(declare-fun m!1222015 () Bool)

(assert (=> b!1333472 m!1222015))

(assert (=> b!1333471 m!1222013))

(assert (=> b!1333471 m!1222013))

(declare-fun m!1222017 () Bool)

(assert (=> b!1333471 m!1222017))

(assert (=> b!1333470 m!1222013))

(declare-fun m!1222019 () Bool)

(assert (=> b!1333478 m!1222019))

(assert (=> b!1333478 m!1222019))

(declare-fun m!1222021 () Bool)

(assert (=> b!1333478 m!1222021))

(declare-fun m!1222023 () Bool)

(assert (=> b!1333476 m!1222023))

(declare-fun m!1222025 () Bool)

(assert (=> mapNonEmpty!56821 m!1222025))

(declare-fun m!1222027 () Bool)

(assert (=> start!112460 m!1222027))

(declare-fun m!1222029 () Bool)

(assert (=> start!112460 m!1222029))

(declare-fun m!1222031 () Bool)

(assert (=> start!112460 m!1222031))

(declare-fun m!1222033 () Bool)

(assert (=> b!1333475 m!1222033))

(assert (=> b!1333466 m!1222013))

(declare-fun m!1222035 () Bool)

(assert (=> b!1333469 m!1222035))

(declare-fun m!1222037 () Bool)

(assert (=> b!1333469 m!1222037))

(assert (=> b!1333469 m!1222035))

(declare-fun m!1222039 () Bool)

(assert (=> b!1333469 m!1222039))

(declare-fun m!1222041 () Bool)

(assert (=> b!1333469 m!1222041))

(declare-fun m!1222043 () Bool)

(assert (=> b!1333469 m!1222043))

(assert (=> b!1333469 m!1222013))

(assert (=> b!1333469 m!1222037))

(assert (=> b!1333469 m!1222041))

(declare-fun m!1222045 () Bool)

(assert (=> b!1333469 m!1222045))

(check-sat (not b!1333476) (not start!112460) (not b!1333472) (not b_next!30855) (not b!1333469) tp_is_empty!36765 (not b!1333475) (not b!1333478) (not b_lambda!24061) b_and!49713 (not b!1333471) (not mapNonEmpty!56821))
(check-sat b_and!49713 (not b_next!30855))
