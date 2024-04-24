; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101486 () Bool)

(assert start!101486)

(declare-fun b_free!26173 () Bool)

(declare-fun b_next!26173 () Bool)

(assert (=> start!101486 (= b_free!26173 (not b_next!26173))))

(declare-fun tp!91541 () Bool)

(declare-fun b_and!43465 () Bool)

(assert (=> start!101486 (= tp!91541 b_and!43465)))

(declare-fun b!1217367 () Bool)

(declare-fun res!807993 () Bool)

(declare-fun e!691279 () Bool)

(assert (=> b!1217367 (=> (not res!807993) (not e!691279))))

(declare-datatypes ((array!78569 0))(
  ( (array!78570 (arr!37913 (Array (_ BitVec 32) (_ BitVec 64))) (size!38450 (_ BitVec 32))) )
))
(declare-fun lt!553270 () array!78569)

(declare-datatypes ((List!26739 0))(
  ( (Nil!26736) (Cons!26735 (h!27953 (_ BitVec 64)) (t!39884 List!26739)) )
))
(declare-fun arrayNoDuplicates!0 (array!78569 (_ BitVec 32) List!26739) Bool)

(assert (=> b!1217367 (= res!807993 (arrayNoDuplicates!0 lt!553270 #b00000000000000000000000000000000 Nil!26736))))

(declare-fun mapIsEmpty!48190 () Bool)

(declare-fun mapRes!48190 () Bool)

(assert (=> mapIsEmpty!48190 mapRes!48190))

(declare-fun b!1217368 () Bool)

(declare-fun e!691282 () Bool)

(declare-fun tp_is_empty!30877 () Bool)

(assert (=> b!1217368 (= e!691282 tp_is_empty!30877)))

(declare-fun b!1217369 () Bool)

(declare-fun e!691285 () Bool)

(assert (=> b!1217369 (= e!691279 (not e!691285))))

(declare-fun res!807998 () Bool)

(assert (=> b!1217369 (=> res!807998 e!691285)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1217369 (= res!807998 (bvsgt from!1455 i!673))))

(declare-fun _keys!1208 () array!78569)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78569 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1217369 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40294 0))(
  ( (Unit!40295) )
))
(declare-fun lt!553272 () Unit!40294)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78569 (_ BitVec 64) (_ BitVec 32)) Unit!40294)

(assert (=> b!1217369 (= lt!553272 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!48190 () Bool)

(declare-fun tp!91540 () Bool)

(declare-fun e!691281 () Bool)

(assert (=> mapNonEmpty!48190 (= mapRes!48190 (and tp!91540 e!691281))))

(declare-datatypes ((V!46297 0))(
  ( (V!46298 (val!15495 Int)) )
))
(declare-datatypes ((ValueCell!14729 0))(
  ( (ValueCellFull!14729 (v!18144 V!46297)) (EmptyCell!14729) )
))
(declare-fun mapValue!48190 () ValueCell!14729)

(declare-fun mapKey!48190 () (_ BitVec 32))

(declare-fun mapRest!48190 () (Array (_ BitVec 32) ValueCell!14729))

(declare-datatypes ((array!78571 0))(
  ( (array!78572 (arr!37914 (Array (_ BitVec 32) ValueCell!14729)) (size!38451 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78571)

(assert (=> mapNonEmpty!48190 (= (arr!37914 _values!996) (store mapRest!48190 mapKey!48190 mapValue!48190))))

(declare-fun b!1217370 () Bool)

(assert (=> b!1217370 (= e!691281 tp_is_empty!30877)))

(declare-fun res!807997 () Bool)

(declare-fun e!691283 () Bool)

(assert (=> start!101486 (=> (not res!807997) (not e!691283))))

(assert (=> start!101486 (= res!807997 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38450 _keys!1208))))))

(assert (=> start!101486 e!691283))

(assert (=> start!101486 tp_is_empty!30877))

(declare-fun array_inv!28928 (array!78569) Bool)

(assert (=> start!101486 (array_inv!28928 _keys!1208)))

(assert (=> start!101486 true))

(assert (=> start!101486 tp!91541))

(declare-fun e!691284 () Bool)

(declare-fun array_inv!28929 (array!78571) Bool)

(assert (=> start!101486 (and (array_inv!28929 _values!996) e!691284)))

(declare-fun b!1217371 () Bool)

(declare-fun res!807995 () Bool)

(assert (=> b!1217371 (=> (not res!807995) (not e!691283))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1217371 (= res!807995 (validMask!0 mask!1564))))

(declare-fun b!1217372 () Bool)

(assert (=> b!1217372 (= e!691285 true)))

(declare-fun zeroValue!944 () V!46297)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19930 0))(
  ( (tuple2!19931 (_1!9976 (_ BitVec 64)) (_2!9976 V!46297)) )
))
(declare-datatypes ((List!26740 0))(
  ( (Nil!26737) (Cons!26736 (h!27954 tuple2!19930) (t!39885 List!26740)) )
))
(declare-datatypes ((ListLongMap!17907 0))(
  ( (ListLongMap!17908 (toList!8969 List!26740)) )
))
(declare-fun lt!553271 () ListLongMap!17907)

(declare-fun minValue!944 () V!46297)

(declare-fun getCurrentListMapNoExtraKeys!5426 (array!78569 array!78571 (_ BitVec 32) (_ BitVec 32) V!46297 V!46297 (_ BitVec 32) Int) ListLongMap!17907)

(declare-fun dynLambda!3338 (Int (_ BitVec 64)) V!46297)

(assert (=> b!1217372 (= lt!553271 (getCurrentListMapNoExtraKeys!5426 lt!553270 (array!78572 (store (arr!37914 _values!996) i!673 (ValueCellFull!14729 (dynLambda!3338 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38451 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!553269 () ListLongMap!17907)

(assert (=> b!1217372 (= lt!553269 (getCurrentListMapNoExtraKeys!5426 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1217373 () Bool)

(declare-fun res!807990 () Bool)

(assert (=> b!1217373 (=> (not res!807990) (not e!691283))))

(assert (=> b!1217373 (= res!807990 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26736))))

(declare-fun b!1217374 () Bool)

(declare-fun res!807991 () Bool)

(assert (=> b!1217374 (=> (not res!807991) (not e!691283))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78569 (_ BitVec 32)) Bool)

(assert (=> b!1217374 (= res!807991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1217375 () Bool)

(declare-fun res!808000 () Bool)

(assert (=> b!1217375 (=> (not res!808000) (not e!691283))))

(assert (=> b!1217375 (= res!808000 (and (= (size!38451 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38450 _keys!1208) (size!38451 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1217376 () Bool)

(declare-fun res!807994 () Bool)

(assert (=> b!1217376 (=> (not res!807994) (not e!691283))))

(assert (=> b!1217376 (= res!807994 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38450 _keys!1208))))))

(declare-fun b!1217377 () Bool)

(assert (=> b!1217377 (= e!691284 (and e!691282 mapRes!48190))))

(declare-fun condMapEmpty!48190 () Bool)

(declare-fun mapDefault!48190 () ValueCell!14729)

(assert (=> b!1217377 (= condMapEmpty!48190 (= (arr!37914 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14729)) mapDefault!48190)))))

(declare-fun b!1217378 () Bool)

(declare-fun res!807992 () Bool)

(assert (=> b!1217378 (=> (not res!807992) (not e!691283))))

(assert (=> b!1217378 (= res!807992 (= (select (arr!37913 _keys!1208) i!673) k0!934))))

(declare-fun b!1217379 () Bool)

(declare-fun res!807996 () Bool)

(assert (=> b!1217379 (=> (not res!807996) (not e!691283))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1217379 (= res!807996 (validKeyInArray!0 k0!934))))

(declare-fun b!1217380 () Bool)

(assert (=> b!1217380 (= e!691283 e!691279)))

(declare-fun res!807999 () Bool)

(assert (=> b!1217380 (=> (not res!807999) (not e!691279))))

(assert (=> b!1217380 (= res!807999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553270 mask!1564))))

(assert (=> b!1217380 (= lt!553270 (array!78570 (store (arr!37913 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38450 _keys!1208)))))

(assert (= (and start!101486 res!807997) b!1217371))

(assert (= (and b!1217371 res!807995) b!1217375))

(assert (= (and b!1217375 res!808000) b!1217374))

(assert (= (and b!1217374 res!807991) b!1217373))

(assert (= (and b!1217373 res!807990) b!1217376))

(assert (= (and b!1217376 res!807994) b!1217379))

(assert (= (and b!1217379 res!807996) b!1217378))

(assert (= (and b!1217378 res!807992) b!1217380))

(assert (= (and b!1217380 res!807999) b!1217367))

(assert (= (and b!1217367 res!807993) b!1217369))

(assert (= (and b!1217369 (not res!807998)) b!1217372))

(assert (= (and b!1217377 condMapEmpty!48190) mapIsEmpty!48190))

(assert (= (and b!1217377 (not condMapEmpty!48190)) mapNonEmpty!48190))

(get-info :version)

(assert (= (and mapNonEmpty!48190 ((_ is ValueCellFull!14729) mapValue!48190)) b!1217370))

(assert (= (and b!1217377 ((_ is ValueCellFull!14729) mapDefault!48190)) b!1217368))

(assert (= start!101486 b!1217377))

(declare-fun b_lambda!21843 () Bool)

(assert (=> (not b_lambda!21843) (not b!1217372)))

(declare-fun t!39883 () Bool)

(declare-fun tb!10965 () Bool)

(assert (=> (and start!101486 (= defaultEntry!1004 defaultEntry!1004) t!39883) tb!10965))

(declare-fun result!22535 () Bool)

(assert (=> tb!10965 (= result!22535 tp_is_empty!30877)))

(assert (=> b!1217372 t!39883))

(declare-fun b_and!43467 () Bool)

(assert (= b_and!43465 (and (=> t!39883 result!22535) b_and!43467)))

(declare-fun m!1122495 () Bool)

(assert (=> b!1217371 m!1122495))

(declare-fun m!1122497 () Bool)

(assert (=> b!1217372 m!1122497))

(declare-fun m!1122499 () Bool)

(assert (=> b!1217372 m!1122499))

(declare-fun m!1122501 () Bool)

(assert (=> b!1217372 m!1122501))

(declare-fun m!1122503 () Bool)

(assert (=> b!1217372 m!1122503))

(declare-fun m!1122505 () Bool)

(assert (=> b!1217373 m!1122505))

(declare-fun m!1122507 () Bool)

(assert (=> start!101486 m!1122507))

(declare-fun m!1122509 () Bool)

(assert (=> start!101486 m!1122509))

(declare-fun m!1122511 () Bool)

(assert (=> b!1217380 m!1122511))

(declare-fun m!1122513 () Bool)

(assert (=> b!1217380 m!1122513))

(declare-fun m!1122515 () Bool)

(assert (=> mapNonEmpty!48190 m!1122515))

(declare-fun m!1122517 () Bool)

(assert (=> b!1217379 m!1122517))

(declare-fun m!1122519 () Bool)

(assert (=> b!1217367 m!1122519))

(declare-fun m!1122521 () Bool)

(assert (=> b!1217378 m!1122521))

(declare-fun m!1122523 () Bool)

(assert (=> b!1217369 m!1122523))

(declare-fun m!1122525 () Bool)

(assert (=> b!1217369 m!1122525))

(declare-fun m!1122527 () Bool)

(assert (=> b!1217374 m!1122527))

(check-sat (not b!1217380) (not b!1217373) (not start!101486) (not b!1217371) (not b!1217367) tp_is_empty!30877 (not b!1217369) (not mapNonEmpty!48190) (not b!1217379) (not b!1217374) (not b!1217372) b_and!43467 (not b_lambda!21843) (not b_next!26173))
(check-sat b_and!43467 (not b_next!26173))
