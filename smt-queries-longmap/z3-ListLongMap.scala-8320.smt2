; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101270 () Bool)

(assert start!101270)

(declare-fun b_free!26193 () Bool)

(declare-fun b_next!26193 () Bool)

(assert (=> start!101270 (= b_free!26193 (not b_next!26193))))

(declare-fun tp!91600 () Bool)

(declare-fun b_and!43503 () Bool)

(assert (=> start!101270 (= tp!91600 b_and!43503)))

(declare-fun b!1216534 () Bool)

(declare-fun e!690672 () Bool)

(declare-fun tp_is_empty!30897 () Bool)

(assert (=> b!1216534 (= e!690672 tp_is_empty!30897)))

(declare-fun b!1216535 () Bool)

(declare-fun res!807836 () Bool)

(declare-fun e!690678 () Bool)

(assert (=> b!1216535 (=> (not res!807836) (not e!690678))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1216535 (= res!807836 (validMask!0 mask!1564))))

(declare-fun b!1216536 () Bool)

(declare-fun res!807833 () Bool)

(declare-fun e!690676 () Bool)

(assert (=> b!1216536 (=> (not res!807833) (not e!690676))))

(declare-datatypes ((array!78567 0))(
  ( (array!78568 (arr!37918 (Array (_ BitVec 32) (_ BitVec 64))) (size!38454 (_ BitVec 32))) )
))
(declare-fun lt!552941 () array!78567)

(declare-datatypes ((List!26733 0))(
  ( (Nil!26730) (Cons!26729 (h!27938 (_ BitVec 64)) (t!39906 List!26733)) )
))
(declare-fun arrayNoDuplicates!0 (array!78567 (_ BitVec 32) List!26733) Bool)

(assert (=> b!1216536 (= res!807833 (arrayNoDuplicates!0 lt!552941 #b00000000000000000000000000000000 Nil!26730))))

(declare-fun b!1216537 () Bool)

(declare-fun res!807832 () Bool)

(assert (=> b!1216537 (=> (not res!807832) (not e!690678))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun _keys!1208 () array!78567)

(assert (=> b!1216537 (= res!807832 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38454 _keys!1208))))))

(declare-fun b!1216538 () Bool)

(assert (=> b!1216538 (= e!690678 e!690676)))

(declare-fun res!807831 () Bool)

(assert (=> b!1216538 (=> (not res!807831) (not e!690676))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78567 (_ BitVec 32)) Bool)

(assert (=> b!1216538 (= res!807831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552941 mask!1564))))

(assert (=> b!1216538 (= lt!552941 (array!78568 (store (arr!37918 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38454 _keys!1208)))))

(declare-fun b!1216539 () Bool)

(declare-fun e!690674 () Bool)

(assert (=> b!1216539 (= e!690674 tp_is_empty!30897)))

(declare-fun b!1216540 () Bool)

(declare-fun res!807828 () Bool)

(assert (=> b!1216540 (=> (not res!807828) (not e!690678))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1216540 (= res!807828 (validKeyInArray!0 k0!934))))

(declare-fun res!807835 () Bool)

(assert (=> start!101270 (=> (not res!807835) (not e!690678))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!101270 (= res!807835 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38454 _keys!1208))))))

(assert (=> start!101270 e!690678))

(assert (=> start!101270 tp_is_empty!30897))

(declare-fun array_inv!28870 (array!78567) Bool)

(assert (=> start!101270 (array_inv!28870 _keys!1208)))

(assert (=> start!101270 true))

(assert (=> start!101270 tp!91600))

(declare-datatypes ((V!46323 0))(
  ( (V!46324 (val!15505 Int)) )
))
(declare-datatypes ((ValueCell!14739 0))(
  ( (ValueCellFull!14739 (v!18158 V!46323)) (EmptyCell!14739) )
))
(declare-datatypes ((array!78569 0))(
  ( (array!78570 (arr!37919 (Array (_ BitVec 32) ValueCell!14739)) (size!38455 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78569)

(declare-fun e!690675 () Bool)

(declare-fun array_inv!28871 (array!78569) Bool)

(assert (=> start!101270 (and (array_inv!28871 _values!996) e!690675)))

(declare-fun mapIsEmpty!48220 () Bool)

(declare-fun mapRes!48220 () Bool)

(assert (=> mapIsEmpty!48220 mapRes!48220))

(declare-fun b!1216541 () Bool)

(declare-fun res!807837 () Bool)

(assert (=> b!1216541 (=> (not res!807837) (not e!690678))))

(assert (=> b!1216541 (= res!807837 (= (select (arr!37918 _keys!1208) i!673) k0!934))))

(declare-fun b!1216542 () Bool)

(declare-fun res!807838 () Bool)

(assert (=> b!1216542 (=> (not res!807838) (not e!690678))))

(assert (=> b!1216542 (= res!807838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1216543 () Bool)

(declare-fun e!690677 () Bool)

(assert (=> b!1216543 (= e!690676 (not e!690677))))

(declare-fun res!807829 () Bool)

(assert (=> b!1216543 (=> res!807829 e!690677)))

(assert (=> b!1216543 (= res!807829 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78567 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1216543 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40336 0))(
  ( (Unit!40337) )
))
(declare-fun lt!552940 () Unit!40336)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78567 (_ BitVec 64) (_ BitVec 32)) Unit!40336)

(assert (=> b!1216543 (= lt!552940 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1216544 () Bool)

(declare-fun e!690673 () Bool)

(assert (=> b!1216544 (= e!690673 true)))

(declare-fun zeroValue!944 () V!46323)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!552939 () array!78569)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46323)

(declare-datatypes ((tuple2!19928 0))(
  ( (tuple2!19929 (_1!9975 (_ BitVec 64)) (_2!9975 V!46323)) )
))
(declare-datatypes ((List!26734 0))(
  ( (Nil!26731) (Cons!26730 (h!27939 tuple2!19928) (t!39907 List!26734)) )
))
(declare-datatypes ((ListLongMap!17897 0))(
  ( (ListLongMap!17898 (toList!8964 List!26734)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5391 (array!78567 array!78569 (_ BitVec 32) (_ BitVec 32) V!46323 V!46323 (_ BitVec 32) Int) ListLongMap!17897)

(declare-fun -!1883 (ListLongMap!17897 (_ BitVec 64)) ListLongMap!17897)

(assert (=> b!1216544 (= (getCurrentListMapNoExtraKeys!5391 lt!552941 lt!552939 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1883 (getCurrentListMapNoExtraKeys!5391 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!552938 () Unit!40336)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1090 (array!78567 array!78569 (_ BitVec 32) (_ BitVec 32) V!46323 V!46323 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40336)

(assert (=> b!1216544 (= lt!552938 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1090 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1216545 () Bool)

(declare-fun res!807839 () Bool)

(assert (=> b!1216545 (=> (not res!807839) (not e!690678))))

(assert (=> b!1216545 (= res!807839 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26730))))

(declare-fun b!1216546 () Bool)

(assert (=> b!1216546 (= e!690677 e!690673)))

(declare-fun res!807830 () Bool)

(assert (=> b!1216546 (=> res!807830 e!690673)))

(assert (=> b!1216546 (= res!807830 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!552937 () ListLongMap!17897)

(assert (=> b!1216546 (= lt!552937 (getCurrentListMapNoExtraKeys!5391 lt!552941 lt!552939 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3280 (Int (_ BitVec 64)) V!46323)

(assert (=> b!1216546 (= lt!552939 (array!78570 (store (arr!37919 _values!996) i!673 (ValueCellFull!14739 (dynLambda!3280 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38455 _values!996)))))

(declare-fun lt!552942 () ListLongMap!17897)

(assert (=> b!1216546 (= lt!552942 (getCurrentListMapNoExtraKeys!5391 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1216547 () Bool)

(declare-fun res!807834 () Bool)

(assert (=> b!1216547 (=> (not res!807834) (not e!690678))))

(assert (=> b!1216547 (= res!807834 (and (= (size!38455 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38454 _keys!1208) (size!38455 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!48220 () Bool)

(declare-fun tp!91601 () Bool)

(assert (=> mapNonEmpty!48220 (= mapRes!48220 (and tp!91601 e!690672))))

(declare-fun mapRest!48220 () (Array (_ BitVec 32) ValueCell!14739))

(declare-fun mapValue!48220 () ValueCell!14739)

(declare-fun mapKey!48220 () (_ BitVec 32))

(assert (=> mapNonEmpty!48220 (= (arr!37919 _values!996) (store mapRest!48220 mapKey!48220 mapValue!48220))))

(declare-fun b!1216548 () Bool)

(assert (=> b!1216548 (= e!690675 (and e!690674 mapRes!48220))))

(declare-fun condMapEmpty!48220 () Bool)

(declare-fun mapDefault!48220 () ValueCell!14739)

(assert (=> b!1216548 (= condMapEmpty!48220 (= (arr!37919 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14739)) mapDefault!48220)))))

(assert (= (and start!101270 res!807835) b!1216535))

(assert (= (and b!1216535 res!807836) b!1216547))

(assert (= (and b!1216547 res!807834) b!1216542))

(assert (= (and b!1216542 res!807838) b!1216545))

(assert (= (and b!1216545 res!807839) b!1216537))

(assert (= (and b!1216537 res!807832) b!1216540))

(assert (= (and b!1216540 res!807828) b!1216541))

(assert (= (and b!1216541 res!807837) b!1216538))

(assert (= (and b!1216538 res!807831) b!1216536))

(assert (= (and b!1216536 res!807833) b!1216543))

(assert (= (and b!1216543 (not res!807829)) b!1216546))

(assert (= (and b!1216546 (not res!807830)) b!1216544))

(assert (= (and b!1216548 condMapEmpty!48220) mapIsEmpty!48220))

(assert (= (and b!1216548 (not condMapEmpty!48220)) mapNonEmpty!48220))

(get-info :version)

(assert (= (and mapNonEmpty!48220 ((_ is ValueCellFull!14739) mapValue!48220)) b!1216534))

(assert (= (and b!1216548 ((_ is ValueCellFull!14739) mapDefault!48220)) b!1216539))

(assert (= start!101270 b!1216548))

(declare-fun b_lambda!21869 () Bool)

(assert (=> (not b_lambda!21869) (not b!1216546)))

(declare-fun t!39905 () Bool)

(declare-fun tb!10993 () Bool)

(assert (=> (and start!101270 (= defaultEntry!1004 defaultEntry!1004) t!39905) tb!10993))

(declare-fun result!22583 () Bool)

(assert (=> tb!10993 (= result!22583 tp_is_empty!30897)))

(assert (=> b!1216546 t!39905))

(declare-fun b_and!43505 () Bool)

(assert (= b_and!43503 (and (=> t!39905 result!22583) b_and!43505)))

(declare-fun m!1121277 () Bool)

(assert (=> start!101270 m!1121277))

(declare-fun m!1121279 () Bool)

(assert (=> start!101270 m!1121279))

(declare-fun m!1121281 () Bool)

(assert (=> b!1216544 m!1121281))

(declare-fun m!1121283 () Bool)

(assert (=> b!1216544 m!1121283))

(assert (=> b!1216544 m!1121283))

(declare-fun m!1121285 () Bool)

(assert (=> b!1216544 m!1121285))

(declare-fun m!1121287 () Bool)

(assert (=> b!1216544 m!1121287))

(declare-fun m!1121289 () Bool)

(assert (=> mapNonEmpty!48220 m!1121289))

(declare-fun m!1121291 () Bool)

(assert (=> b!1216546 m!1121291))

(declare-fun m!1121293 () Bool)

(assert (=> b!1216546 m!1121293))

(declare-fun m!1121295 () Bool)

(assert (=> b!1216546 m!1121295))

(declare-fun m!1121297 () Bool)

(assert (=> b!1216546 m!1121297))

(declare-fun m!1121299 () Bool)

(assert (=> b!1216543 m!1121299))

(declare-fun m!1121301 () Bool)

(assert (=> b!1216543 m!1121301))

(declare-fun m!1121303 () Bool)

(assert (=> b!1216536 m!1121303))

(declare-fun m!1121305 () Bool)

(assert (=> b!1216542 m!1121305))

(declare-fun m!1121307 () Bool)

(assert (=> b!1216538 m!1121307))

(declare-fun m!1121309 () Bool)

(assert (=> b!1216538 m!1121309))

(declare-fun m!1121311 () Bool)

(assert (=> b!1216540 m!1121311))

(declare-fun m!1121313 () Bool)

(assert (=> b!1216541 m!1121313))

(declare-fun m!1121315 () Bool)

(assert (=> b!1216545 m!1121315))

(declare-fun m!1121317 () Bool)

(assert (=> b!1216535 m!1121317))

(check-sat (not b!1216536) (not b!1216545) (not b!1216546) (not b_lambda!21869) (not b_next!26193) (not mapNonEmpty!48220) tp_is_empty!30897 (not b!1216543) (not b!1216538) b_and!43505 (not b!1216535) (not b!1216544) (not b!1216540) (not b!1216542) (not start!101270))
(check-sat b_and!43505 (not b_next!26193))
