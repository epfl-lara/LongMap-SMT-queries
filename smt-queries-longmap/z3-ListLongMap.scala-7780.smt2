; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97418 () Bool)

(assert start!97418)

(declare-fun b_free!23395 () Bool)

(declare-fun b_next!23395 () Bool)

(assert (=> start!97418 (= b_free!23395 (not b_next!23395))))

(declare-fun tp!82484 () Bool)

(declare-fun b_and!37605 () Bool)

(assert (=> start!97418 (= tp!82484 b_and!37605)))

(declare-fun b!1111152 () Bool)

(declare-fun res!741516 () Bool)

(declare-fun e!633614 () Bool)

(assert (=> b!1111152 (=> (not res!741516) (not e!633614))))

(declare-datatypes ((array!72120 0))(
  ( (array!72121 (arr!34713 (Array (_ BitVec 32) (_ BitVec 64))) (size!35251 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72120)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42001 0))(
  ( (V!42002 (val!13884 Int)) )
))
(declare-datatypes ((ValueCell!13118 0))(
  ( (ValueCellFull!13118 (v!16516 V!42001)) (EmptyCell!13118) )
))
(declare-datatypes ((array!72122 0))(
  ( (array!72123 (arr!34714 (Array (_ BitVec 32) ValueCell!13118)) (size!35252 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72122)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1111152 (= res!741516 (and (= (size!35252 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35251 _keys!1208) (size!35252 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1111153 () Bool)

(declare-fun res!741522 () Bool)

(assert (=> b!1111153 (=> (not res!741522) (not e!633614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1111153 (= res!741522 (validMask!0 mask!1564))))

(declare-datatypes ((tuple2!17628 0))(
  ( (tuple2!17629 (_1!8825 (_ BitVec 64)) (_2!8825 V!42001)) )
))
(declare-datatypes ((List!24282 0))(
  ( (Nil!24279) (Cons!24278 (h!25487 tuple2!17628) (t!34714 List!24282)) )
))
(declare-datatypes ((ListLongMap!15597 0))(
  ( (ListLongMap!15598 (toList!7814 List!24282)) )
))
(declare-fun call!46859 () ListLongMap!15597)

(declare-fun e!633612 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun call!46858 () ListLongMap!15597)

(declare-fun b!1111154 () Bool)

(declare-fun -!1027 (ListLongMap!15597 (_ BitVec 64)) ListLongMap!15597)

(assert (=> b!1111154 (= e!633612 (= call!46858 (-!1027 call!46859 k0!934)))))

(declare-fun b!1111155 () Bool)

(declare-fun res!741519 () Bool)

(assert (=> b!1111155 (=> (not res!741519) (not e!633614))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72120 (_ BitVec 32)) Bool)

(assert (=> b!1111155 (= res!741519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1111156 () Bool)

(declare-fun res!741520 () Bool)

(assert (=> b!1111156 (=> (not res!741520) (not e!633614))))

(declare-datatypes ((List!24283 0))(
  ( (Nil!24280) (Cons!24279 (h!25488 (_ BitVec 64)) (t!34715 List!24283)) )
))
(declare-fun arrayNoDuplicates!0 (array!72120 (_ BitVec 32) List!24283) Bool)

(assert (=> b!1111156 (= res!741520 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24280))))

(declare-fun mapNonEmpty!43300 () Bool)

(declare-fun mapRes!43300 () Bool)

(declare-fun tp!82483 () Bool)

(declare-fun e!633616 () Bool)

(assert (=> mapNonEmpty!43300 (= mapRes!43300 (and tp!82483 e!633616))))

(declare-fun mapRest!43300 () (Array (_ BitVec 32) ValueCell!13118))

(declare-fun mapValue!43300 () ValueCell!13118)

(declare-fun mapKey!43300 () (_ BitVec 32))

(assert (=> mapNonEmpty!43300 (= (arr!34714 _values!996) (store mapRest!43300 mapKey!43300 mapValue!43300))))

(declare-fun zeroValue!944 () V!42001)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42001)

(declare-fun bm!46855 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4327 (array!72120 array!72122 (_ BitVec 32) (_ BitVec 32) V!42001 V!42001 (_ BitVec 32) Int) ListLongMap!15597)

(assert (=> bm!46855 (= call!46859 (getCurrentListMapNoExtraKeys!4327 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111157 () Bool)

(assert (=> b!1111157 (= e!633612 (= call!46858 call!46859))))

(declare-fun b!1111158 () Bool)

(declare-fun res!741513 () Bool)

(assert (=> b!1111158 (=> (not res!741513) (not e!633614))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1111158 (= res!741513 (validKeyInArray!0 k0!934))))

(declare-fun b!1111159 () Bool)

(declare-fun res!741517 () Bool)

(assert (=> b!1111159 (=> (not res!741517) (not e!633614))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1111159 (= res!741517 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35251 _keys!1208))))))

(declare-fun b!1111160 () Bool)

(declare-fun tp_is_empty!27655 () Bool)

(assert (=> b!1111160 (= e!633616 tp_is_empty!27655)))

(declare-fun b!1111162 () Bool)

(declare-fun e!633611 () Bool)

(declare-fun e!633615 () Bool)

(assert (=> b!1111162 (= e!633611 (and e!633615 mapRes!43300))))

(declare-fun condMapEmpty!43300 () Bool)

(declare-fun mapDefault!43300 () ValueCell!13118)

(assert (=> b!1111162 (= condMapEmpty!43300 (= (arr!34714 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13118)) mapDefault!43300)))))

(declare-fun b!1111163 () Bool)

(declare-fun e!633613 () Bool)

(assert (=> b!1111163 (= e!633613 true)))

(assert (=> b!1111163 e!633612))

(declare-fun c!109263 () Bool)

(assert (=> b!1111163 (= c!109263 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36279 0))(
  ( (Unit!36280) )
))
(declare-fun lt!496114 () Unit!36279)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!301 (array!72120 array!72122 (_ BitVec 32) (_ BitVec 32) V!42001 V!42001 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36279)

(assert (=> b!1111163 (= lt!496114 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!301 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111164 () Bool)

(declare-fun e!633617 () Bool)

(assert (=> b!1111164 (= e!633617 (not e!633613))))

(declare-fun res!741521 () Bool)

(assert (=> b!1111164 (=> res!741521 e!633613)))

(assert (=> b!1111164 (= res!741521 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35251 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72120 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1111164 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!496115 () Unit!36279)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72120 (_ BitVec 64) (_ BitVec 32)) Unit!36279)

(assert (=> b!1111164 (= lt!496115 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!43300 () Bool)

(assert (=> mapIsEmpty!43300 mapRes!43300))

(declare-fun b!1111165 () Bool)

(declare-fun res!741523 () Bool)

(assert (=> b!1111165 (=> (not res!741523) (not e!633614))))

(assert (=> b!1111165 (= res!741523 (= (select (arr!34713 _keys!1208) i!673) k0!934))))

(declare-fun bm!46856 () Bool)

(declare-fun lt!496116 () array!72120)

(declare-fun dynLambda!2390 (Int (_ BitVec 64)) V!42001)

(assert (=> bm!46856 (= call!46858 (getCurrentListMapNoExtraKeys!4327 lt!496116 (array!72123 (store (arr!34714 _values!996) i!673 (ValueCellFull!13118 (dynLambda!2390 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35252 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111166 () Bool)

(assert (=> b!1111166 (= e!633614 e!633617)))

(declare-fun res!741515 () Bool)

(assert (=> b!1111166 (=> (not res!741515) (not e!633617))))

(assert (=> b!1111166 (= res!741515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496116 mask!1564))))

(assert (=> b!1111166 (= lt!496116 (array!72121 (store (arr!34713 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35251 _keys!1208)))))

(declare-fun b!1111167 () Bool)

(declare-fun res!741514 () Bool)

(assert (=> b!1111167 (=> (not res!741514) (not e!633617))))

(assert (=> b!1111167 (= res!741514 (arrayNoDuplicates!0 lt!496116 #b00000000000000000000000000000000 Nil!24280))))

(declare-fun b!1111161 () Bool)

(assert (=> b!1111161 (= e!633615 tp_is_empty!27655)))

(declare-fun res!741518 () Bool)

(assert (=> start!97418 (=> (not res!741518) (not e!633614))))

(assert (=> start!97418 (= res!741518 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35251 _keys!1208))))))

(assert (=> start!97418 e!633614))

(assert (=> start!97418 tp_is_empty!27655))

(declare-fun array_inv!26758 (array!72120) Bool)

(assert (=> start!97418 (array_inv!26758 _keys!1208)))

(assert (=> start!97418 true))

(assert (=> start!97418 tp!82484))

(declare-fun array_inv!26759 (array!72122) Bool)

(assert (=> start!97418 (and (array_inv!26759 _values!996) e!633611)))

(assert (= (and start!97418 res!741518) b!1111153))

(assert (= (and b!1111153 res!741522) b!1111152))

(assert (= (and b!1111152 res!741516) b!1111155))

(assert (= (and b!1111155 res!741519) b!1111156))

(assert (= (and b!1111156 res!741520) b!1111159))

(assert (= (and b!1111159 res!741517) b!1111158))

(assert (= (and b!1111158 res!741513) b!1111165))

(assert (= (and b!1111165 res!741523) b!1111166))

(assert (= (and b!1111166 res!741515) b!1111167))

(assert (= (and b!1111167 res!741514) b!1111164))

(assert (= (and b!1111164 (not res!741521)) b!1111163))

(assert (= (and b!1111163 c!109263) b!1111154))

(assert (= (and b!1111163 (not c!109263)) b!1111157))

(assert (= (or b!1111154 b!1111157) bm!46856))

(assert (= (or b!1111154 b!1111157) bm!46855))

(assert (= (and b!1111162 condMapEmpty!43300) mapIsEmpty!43300))

(assert (= (and b!1111162 (not condMapEmpty!43300)) mapNonEmpty!43300))

(get-info :version)

(assert (= (and mapNonEmpty!43300 ((_ is ValueCellFull!13118) mapValue!43300)) b!1111160))

(assert (= (and b!1111162 ((_ is ValueCellFull!13118) mapDefault!43300)) b!1111161))

(assert (= start!97418 b!1111162))

(declare-fun b_lambda!18401 () Bool)

(assert (=> (not b_lambda!18401) (not bm!46856)))

(declare-fun t!34713 () Bool)

(declare-fun tb!8253 () Bool)

(assert (=> (and start!97418 (= defaultEntry!1004 defaultEntry!1004) t!34713) tb!8253))

(declare-fun result!17075 () Bool)

(assert (=> tb!8253 (= result!17075 tp_is_empty!27655)))

(assert (=> bm!46856 t!34713))

(declare-fun b_and!37607 () Bool)

(assert (= b_and!37605 (and (=> t!34713 result!17075) b_and!37607)))

(declare-fun m!1028481 () Bool)

(assert (=> b!1111154 m!1028481))

(declare-fun m!1028483 () Bool)

(assert (=> mapNonEmpty!43300 m!1028483))

(declare-fun m!1028485 () Bool)

(assert (=> b!1111165 m!1028485))

(declare-fun m!1028487 () Bool)

(assert (=> bm!46855 m!1028487))

(declare-fun m!1028489 () Bool)

(assert (=> b!1111163 m!1028489))

(declare-fun m!1028491 () Bool)

(assert (=> start!97418 m!1028491))

(declare-fun m!1028493 () Bool)

(assert (=> start!97418 m!1028493))

(declare-fun m!1028495 () Bool)

(assert (=> b!1111156 m!1028495))

(declare-fun m!1028497 () Bool)

(assert (=> b!1111164 m!1028497))

(declare-fun m!1028499 () Bool)

(assert (=> b!1111164 m!1028499))

(declare-fun m!1028501 () Bool)

(assert (=> bm!46856 m!1028501))

(declare-fun m!1028503 () Bool)

(assert (=> bm!46856 m!1028503))

(declare-fun m!1028505 () Bool)

(assert (=> bm!46856 m!1028505))

(declare-fun m!1028507 () Bool)

(assert (=> b!1111153 m!1028507))

(declare-fun m!1028509 () Bool)

(assert (=> b!1111167 m!1028509))

(declare-fun m!1028511 () Bool)

(assert (=> b!1111166 m!1028511))

(declare-fun m!1028513 () Bool)

(assert (=> b!1111166 m!1028513))

(declare-fun m!1028515 () Bool)

(assert (=> b!1111158 m!1028515))

(declare-fun m!1028517 () Bool)

(assert (=> b!1111155 m!1028517))

(check-sat (not b_next!23395) (not b!1111155) (not b!1111167) (not b!1111153) (not bm!46855) (not mapNonEmpty!43300) (not b!1111164) tp_is_empty!27655 (not bm!46856) (not b!1111158) b_and!37607 (not b!1111163) (not b!1111156) (not b_lambda!18401) (not b!1111166) (not b!1111154) (not start!97418))
(check-sat b_and!37607 (not b_next!23395))
