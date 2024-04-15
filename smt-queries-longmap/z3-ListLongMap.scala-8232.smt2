; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100294 () Bool)

(assert start!100294)

(declare-fun b_free!25687 () Bool)

(declare-fun b_next!25687 () Bool)

(assert (=> start!100294 (= b_free!25687 (not b_next!25687))))

(declare-fun tp!90009 () Bool)

(declare-fun b_and!42219 () Bool)

(assert (=> start!100294 (= tp!90009 b_and!42219)))

(declare-fun b!1196639 () Bool)

(declare-fun res!796402 () Bool)

(declare-fun e!679844 () Bool)

(assert (=> b!1196639 (=> (not res!796402) (not e!679844))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1196639 (= res!796402 (validKeyInArray!0 k0!934))))

(declare-datatypes ((V!45617 0))(
  ( (V!45618 (val!15240 Int)) )
))
(declare-fun zeroValue!944 () V!45617)

(declare-datatypes ((tuple2!19608 0))(
  ( (tuple2!19609 (_1!9815 (_ BitVec 64)) (_2!9815 V!45617)) )
))
(declare-datatypes ((List!26384 0))(
  ( (Nil!26381) (Cons!26380 (h!27589 tuple2!19608) (t!39054 List!26384)) )
))
(declare-datatypes ((ListLongMap!17577 0))(
  ( (ListLongMap!17578 (toList!8804 List!26384)) )
))
(declare-fun call!57160 () ListLongMap!17577)

(declare-fun bm!57156 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14474 0))(
  ( (ValueCellFull!14474 (v!17877 V!45617)) (EmptyCell!14474) )
))
(declare-datatypes ((array!77444 0))(
  ( (array!77445 (arr!37369 (Array (_ BitVec 32) ValueCell!14474)) (size!37907 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77444)

(declare-datatypes ((array!77446 0))(
  ( (array!77447 (arr!37370 (Array (_ BitVec 32) (_ BitVec 64))) (size!37908 (_ BitVec 32))) )
))
(declare-fun lt!542945 () array!77446)

(declare-fun minValue!944 () V!45617)

(declare-fun getCurrentListMapNoExtraKeys!5254 (array!77446 array!77444 (_ BitVec 32) (_ BitVec 32) V!45617 V!45617 (_ BitVec 32) Int) ListLongMap!17577)

(declare-fun dynLambda!3138 (Int (_ BitVec 64)) V!45617)

(assert (=> bm!57156 (= call!57160 (getCurrentListMapNoExtraKeys!5254 lt!542945 (array!77445 (store (arr!37369 _values!996) i!673 (ValueCellFull!14474 (dynLambda!3138 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37907 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _keys!1208 () array!77446)

(declare-fun bm!57157 () Bool)

(declare-fun call!57159 () ListLongMap!17577)

(assert (=> bm!57157 (= call!57159 (getCurrentListMapNoExtraKeys!5254 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1196641 () Bool)

(declare-fun e!679848 () Bool)

(assert (=> b!1196641 (= e!679848 (= call!57160 call!57159))))

(declare-fun b!1196642 () Bool)

(declare-fun res!796399 () Bool)

(assert (=> b!1196642 (=> (not res!796399) (not e!679844))))

(assert (=> b!1196642 (= res!796399 (and (= (size!37907 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37908 _keys!1208) (size!37907 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1196643 () Bool)

(declare-fun e!679843 () Bool)

(declare-fun e!679849 () Bool)

(declare-fun mapRes!47387 () Bool)

(assert (=> b!1196643 (= e!679843 (and e!679849 mapRes!47387))))

(declare-fun condMapEmpty!47387 () Bool)

(declare-fun mapDefault!47387 () ValueCell!14474)

(assert (=> b!1196643 (= condMapEmpty!47387 (= (arr!37369 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14474)) mapDefault!47387)))))

(declare-fun mapIsEmpty!47387 () Bool)

(assert (=> mapIsEmpty!47387 mapRes!47387))

(declare-fun b!1196644 () Bool)

(declare-fun res!796394 () Bool)

(assert (=> b!1196644 (=> (not res!796394) (not e!679844))))

(assert (=> b!1196644 (= res!796394 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37908 _keys!1208))))))

(declare-fun b!1196645 () Bool)

(declare-fun e!679846 () Bool)

(assert (=> b!1196645 (= e!679844 e!679846)))

(declare-fun res!796396 () Bool)

(assert (=> b!1196645 (=> (not res!796396) (not e!679846))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77446 (_ BitVec 32)) Bool)

(assert (=> b!1196645 (= res!796396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542945 mask!1564))))

(assert (=> b!1196645 (= lt!542945 (array!77447 (store (arr!37370 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37908 _keys!1208)))))

(declare-fun b!1196646 () Bool)

(declare-fun -!1741 (ListLongMap!17577 (_ BitVec 64)) ListLongMap!17577)

(assert (=> b!1196646 (= e!679848 (= call!57160 (-!1741 call!57159 k0!934)))))

(declare-fun res!796392 () Bool)

(assert (=> start!100294 (=> (not res!796392) (not e!679844))))

(assert (=> start!100294 (= res!796392 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37908 _keys!1208))))))

(assert (=> start!100294 e!679844))

(declare-fun tp_is_empty!30367 () Bool)

(assert (=> start!100294 tp_is_empty!30367))

(declare-fun array_inv!28608 (array!77446) Bool)

(assert (=> start!100294 (array_inv!28608 _keys!1208)))

(assert (=> start!100294 true))

(assert (=> start!100294 tp!90009))

(declare-fun array_inv!28609 (array!77444) Bool)

(assert (=> start!100294 (and (array_inv!28609 _values!996) e!679843)))

(declare-fun b!1196640 () Bool)

(declare-fun res!796397 () Bool)

(assert (=> b!1196640 (=> (not res!796397) (not e!679844))))

(assert (=> b!1196640 (= res!796397 (= (select (arr!37370 _keys!1208) i!673) k0!934))))

(declare-fun b!1196647 () Bool)

(declare-fun res!796398 () Bool)

(assert (=> b!1196647 (=> (not res!796398) (not e!679846))))

(declare-datatypes ((List!26385 0))(
  ( (Nil!26382) (Cons!26381 (h!27590 (_ BitVec 64)) (t!39055 List!26385)) )
))
(declare-fun arrayNoDuplicates!0 (array!77446 (_ BitVec 32) List!26385) Bool)

(assert (=> b!1196647 (= res!796398 (arrayNoDuplicates!0 lt!542945 #b00000000000000000000000000000000 Nil!26382))))

(declare-fun b!1196648 () Bool)

(declare-fun res!796395 () Bool)

(assert (=> b!1196648 (=> (not res!796395) (not e!679844))))

(assert (=> b!1196648 (= res!796395 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26382))))

(declare-fun b!1196649 () Bool)

(declare-fun res!796400 () Bool)

(assert (=> b!1196649 (=> (not res!796400) (not e!679844))))

(assert (=> b!1196649 (= res!796400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1196650 () Bool)

(declare-fun e!679842 () Bool)

(assert (=> b!1196650 (= e!679842 true)))

(assert (=> b!1196650 e!679848))

(declare-fun c!117319 () Bool)

(assert (=> b!1196650 (= c!117319 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!39553 0))(
  ( (Unit!39554) )
))
(declare-fun lt!542944 () Unit!39553)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!992 (array!77446 array!77444 (_ BitVec 32) (_ BitVec 32) V!45617 V!45617 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39553)

(assert (=> b!1196650 (= lt!542944 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!992 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1196651 () Bool)

(assert (=> b!1196651 (= e!679849 tp_is_empty!30367)))

(declare-fun b!1196652 () Bool)

(assert (=> b!1196652 (= e!679846 (not e!679842))))

(declare-fun res!796401 () Bool)

(assert (=> b!1196652 (=> res!796401 e!679842)))

(assert (=> b!1196652 (= res!796401 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!37908 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!77446 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1196652 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!542946 () Unit!39553)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77446 (_ BitVec 64) (_ BitVec 32)) Unit!39553)

(assert (=> b!1196652 (= lt!542946 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1196653 () Bool)

(declare-fun e!679847 () Bool)

(assert (=> b!1196653 (= e!679847 tp_is_empty!30367)))

(declare-fun mapNonEmpty!47387 () Bool)

(declare-fun tp!90008 () Bool)

(assert (=> mapNonEmpty!47387 (= mapRes!47387 (and tp!90008 e!679847))))

(declare-fun mapRest!47387 () (Array (_ BitVec 32) ValueCell!14474))

(declare-fun mapValue!47387 () ValueCell!14474)

(declare-fun mapKey!47387 () (_ BitVec 32))

(assert (=> mapNonEmpty!47387 (= (arr!37369 _values!996) (store mapRest!47387 mapKey!47387 mapValue!47387))))

(declare-fun b!1196654 () Bool)

(declare-fun res!796393 () Bool)

(assert (=> b!1196654 (=> (not res!796393) (not e!679844))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1196654 (= res!796393 (validMask!0 mask!1564))))

(assert (= (and start!100294 res!796392) b!1196654))

(assert (= (and b!1196654 res!796393) b!1196642))

(assert (= (and b!1196642 res!796399) b!1196649))

(assert (= (and b!1196649 res!796400) b!1196648))

(assert (= (and b!1196648 res!796395) b!1196644))

(assert (= (and b!1196644 res!796394) b!1196639))

(assert (= (and b!1196639 res!796402) b!1196640))

(assert (= (and b!1196640 res!796397) b!1196645))

(assert (= (and b!1196645 res!796396) b!1196647))

(assert (= (and b!1196647 res!796398) b!1196652))

(assert (= (and b!1196652 (not res!796401)) b!1196650))

(assert (= (and b!1196650 c!117319) b!1196646))

(assert (= (and b!1196650 (not c!117319)) b!1196641))

(assert (= (or b!1196646 b!1196641) bm!57156))

(assert (= (or b!1196646 b!1196641) bm!57157))

(assert (= (and b!1196643 condMapEmpty!47387) mapIsEmpty!47387))

(assert (= (and b!1196643 (not condMapEmpty!47387)) mapNonEmpty!47387))

(get-info :version)

(assert (= (and mapNonEmpty!47387 ((_ is ValueCellFull!14474) mapValue!47387)) b!1196653))

(assert (= (and b!1196643 ((_ is ValueCellFull!14474) mapDefault!47387)) b!1196651))

(assert (= start!100294 b!1196643))

(declare-fun b_lambda!20813 () Bool)

(assert (=> (not b_lambda!20813) (not bm!57156)))

(declare-fun t!39053 () Bool)

(declare-fun tb!10491 () Bool)

(assert (=> (and start!100294 (= defaultEntry!1004 defaultEntry!1004) t!39053) tb!10491))

(declare-fun result!21563 () Bool)

(assert (=> tb!10491 (= result!21563 tp_is_empty!30367)))

(assert (=> bm!57156 t!39053))

(declare-fun b_and!42221 () Bool)

(assert (= b_and!42219 (and (=> t!39053 result!21563) b_and!42221)))

(declare-fun m!1103291 () Bool)

(assert (=> b!1196639 m!1103291))

(declare-fun m!1103293 () Bool)

(assert (=> bm!57157 m!1103293))

(declare-fun m!1103295 () Bool)

(assert (=> b!1196648 m!1103295))

(declare-fun m!1103297 () Bool)

(assert (=> start!100294 m!1103297))

(declare-fun m!1103299 () Bool)

(assert (=> start!100294 m!1103299))

(declare-fun m!1103301 () Bool)

(assert (=> b!1196646 m!1103301))

(declare-fun m!1103303 () Bool)

(assert (=> b!1196654 m!1103303))

(declare-fun m!1103305 () Bool)

(assert (=> b!1196640 m!1103305))

(declare-fun m!1103307 () Bool)

(assert (=> bm!57156 m!1103307))

(declare-fun m!1103309 () Bool)

(assert (=> bm!57156 m!1103309))

(declare-fun m!1103311 () Bool)

(assert (=> bm!57156 m!1103311))

(declare-fun m!1103313 () Bool)

(assert (=> b!1196649 m!1103313))

(declare-fun m!1103315 () Bool)

(assert (=> b!1196652 m!1103315))

(declare-fun m!1103317 () Bool)

(assert (=> b!1196652 m!1103317))

(declare-fun m!1103319 () Bool)

(assert (=> b!1196645 m!1103319))

(declare-fun m!1103321 () Bool)

(assert (=> b!1196645 m!1103321))

(declare-fun m!1103323 () Bool)

(assert (=> b!1196650 m!1103323))

(declare-fun m!1103325 () Bool)

(assert (=> mapNonEmpty!47387 m!1103325))

(declare-fun m!1103327 () Bool)

(assert (=> b!1196647 m!1103327))

(check-sat (not b!1196654) (not b_next!25687) (not b!1196647) (not b!1196652) (not b!1196645) (not b!1196648) (not mapNonEmpty!47387) (not bm!57156) (not bm!57157) (not start!100294) tp_is_empty!30367 (not b!1196639) (not b_lambda!20813) b_and!42221 (not b!1196646) (not b!1196649) (not b!1196650))
(check-sat b_and!42221 (not b_next!25687))
