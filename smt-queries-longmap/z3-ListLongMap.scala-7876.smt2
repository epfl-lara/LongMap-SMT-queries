; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98236 () Bool)

(assert start!98236)

(declare-fun b_free!23701 () Bool)

(declare-fun b_next!23701 () Bool)

(assert (=> start!98236 (= b_free!23701 (not b_next!23701))))

(declare-fun tp!83806 () Bool)

(declare-fun b_and!38195 () Bool)

(assert (=> start!98236 (= tp!83806 b_and!38195)))

(declare-fun b!1125405 () Bool)

(declare-fun res!751558 () Bool)

(declare-fun e!640772 () Bool)

(assert (=> b!1125405 (=> (not res!751558) (not e!640772))))

(declare-datatypes ((array!73375 0))(
  ( (array!73376 (arr!35334 (Array (_ BitVec 32) (_ BitVec 64))) (size!35871 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73375)

(declare-datatypes ((List!24604 0))(
  ( (Nil!24601) (Cons!24600 (h!25818 (_ BitVec 64)) (t!35289 List!24604)) )
))
(declare-fun arrayNoDuplicates!0 (array!73375 (_ BitVec 32) List!24604) Bool)

(assert (=> b!1125405 (= res!751558 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24601))))

(declare-fun mapNonEmpty!44164 () Bool)

(declare-fun mapRes!44164 () Bool)

(declare-fun tp!83807 () Bool)

(declare-fun e!640770 () Bool)

(assert (=> mapNonEmpty!44164 (= mapRes!44164 (and tp!83807 e!640770))))

(declare-datatypes ((V!42769 0))(
  ( (V!42770 (val!14172 Int)) )
))
(declare-datatypes ((ValueCell!13406 0))(
  ( (ValueCellFull!13406 (v!16801 V!42769)) (EmptyCell!13406) )
))
(declare-fun mapValue!44164 () ValueCell!13406)

(declare-fun mapRest!44164 () (Array (_ BitVec 32) ValueCell!13406))

(declare-datatypes ((array!73377 0))(
  ( (array!73378 (arr!35335 (Array (_ BitVec 32) ValueCell!13406)) (size!35872 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73377)

(declare-fun mapKey!44164 () (_ BitVec 32))

(assert (=> mapNonEmpty!44164 (= (arr!35335 _values!996) (store mapRest!44164 mapKey!44164 mapValue!44164))))

(declare-fun b!1125406 () Bool)

(declare-fun e!640766 () Bool)

(declare-fun e!640771 () Bool)

(assert (=> b!1125406 (= e!640766 e!640771)))

(declare-fun res!751554 () Bool)

(assert (=> b!1125406 (=> res!751554 e!640771)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1125406 (= res!751554 (not (= (select (arr!35334 _keys!1208) from!1455) k0!934)))))

(declare-fun e!640773 () Bool)

(assert (=> b!1125406 e!640773))

(declare-fun c!109952 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1125406 (= c!109952 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!42769)

(declare-datatypes ((Unit!36845 0))(
  ( (Unit!36846) )
))
(declare-fun lt!499841 () Unit!36845)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42769)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!362 (array!73375 array!73377 (_ BitVec 32) (_ BitVec 32) V!42769 V!42769 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36845)

(assert (=> b!1125406 (= lt!499841 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!362 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125407 () Bool)

(declare-fun res!751561 () Bool)

(declare-fun e!640764 () Bool)

(assert (=> b!1125407 (=> (not res!751561) (not e!640764))))

(declare-fun lt!499836 () array!73375)

(assert (=> b!1125407 (= res!751561 (arrayNoDuplicates!0 lt!499836 #b00000000000000000000000000000000 Nil!24601))))

(declare-datatypes ((tuple2!17814 0))(
  ( (tuple2!17815 (_1!8918 (_ BitVec 64)) (_2!8918 V!42769)) )
))
(declare-datatypes ((List!24605 0))(
  ( (Nil!24602) (Cons!24601 (h!25819 tuple2!17814) (t!35290 List!24605)) )
))
(declare-datatypes ((ListLongMap!15791 0))(
  ( (ListLongMap!15792 (toList!7911 List!24605)) )
))
(declare-fun call!47453 () ListLongMap!15791)

(declare-fun lt!499837 () array!73377)

(declare-fun bm!47449 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4437 (array!73375 array!73377 (_ BitVec 32) (_ BitVec 32) V!42769 V!42769 (_ BitVec 32) Int) ListLongMap!15791)

(assert (=> bm!47449 (= call!47453 (getCurrentListMapNoExtraKeys!4437 lt!499836 lt!499837 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125408 () Bool)

(declare-fun res!751557 () Bool)

(declare-fun e!640769 () Bool)

(assert (=> b!1125408 (=> res!751557 e!640769)))

(assert (=> b!1125408 (= res!751557 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1125409 () Bool)

(declare-fun res!751565 () Bool)

(assert (=> b!1125409 (=> (not res!751565) (not e!640772))))

(assert (=> b!1125409 (= res!751565 (= (select (arr!35334 _keys!1208) i!673) k0!934))))

(declare-fun b!1125410 () Bool)

(declare-fun res!751560 () Bool)

(assert (=> b!1125410 (=> (not res!751560) (not e!640772))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1125410 (= res!751560 (validMask!0 mask!1564))))

(declare-fun b!1125411 () Bool)

(declare-fun res!751553 () Bool)

(assert (=> b!1125411 (=> (not res!751553) (not e!640772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73375 (_ BitVec 32)) Bool)

(assert (=> b!1125411 (= res!751553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1125412 () Bool)

(declare-fun e!640767 () Bool)

(assert (=> b!1125412 (= e!640764 (not e!640767))))

(declare-fun res!751563 () Bool)

(assert (=> b!1125412 (=> res!751563 e!640767)))

(assert (=> b!1125412 (= res!751563 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1125412 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!499842 () Unit!36845)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73375 (_ BitVec 64) (_ BitVec 32)) Unit!36845)

(assert (=> b!1125412 (= lt!499842 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!44164 () Bool)

(assert (=> mapIsEmpty!44164 mapRes!44164))

(declare-fun b!1125414 () Bool)

(assert (=> b!1125414 (= e!640772 e!640764)))

(declare-fun res!751564 () Bool)

(assert (=> b!1125414 (=> (not res!751564) (not e!640764))))

(assert (=> b!1125414 (= res!751564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499836 mask!1564))))

(assert (=> b!1125414 (= lt!499836 (array!73376 (store (arr!35334 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35871 _keys!1208)))))

(declare-fun bm!47450 () Bool)

(declare-fun call!47452 () ListLongMap!15791)

(assert (=> bm!47450 (= call!47452 (getCurrentListMapNoExtraKeys!4437 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125415 () Bool)

(assert (=> b!1125415 (= e!640773 (= call!47453 call!47452))))

(declare-fun b!1125416 () Bool)

(declare-fun res!751555 () Bool)

(assert (=> b!1125416 (=> (not res!751555) (not e!640772))))

(assert (=> b!1125416 (= res!751555 (and (= (size!35872 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35871 _keys!1208) (size!35872 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1125417 () Bool)

(declare-fun e!640765 () Bool)

(declare-fun tp_is_empty!28231 () Bool)

(assert (=> b!1125417 (= e!640765 tp_is_empty!28231)))

(declare-fun b!1125418 () Bool)

(declare-fun res!751566 () Bool)

(assert (=> b!1125418 (=> (not res!751566) (not e!640772))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1125418 (= res!751566 (validKeyInArray!0 k0!934))))

(declare-fun b!1125419 () Bool)

(declare-fun res!751567 () Bool)

(assert (=> b!1125419 (=> (not res!751567) (not e!640772))))

(assert (=> b!1125419 (= res!751567 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35871 _keys!1208))))))

(declare-fun b!1125420 () Bool)

(assert (=> b!1125420 (= e!640767 e!640766)))

(declare-fun res!751556 () Bool)

(assert (=> b!1125420 (=> res!751556 e!640766)))

(assert (=> b!1125420 (= res!751556 (not (= from!1455 i!673)))))

(declare-fun lt!499839 () ListLongMap!15791)

(assert (=> b!1125420 (= lt!499839 (getCurrentListMapNoExtraKeys!4437 lt!499836 lt!499837 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2517 (Int (_ BitVec 64)) V!42769)

(assert (=> b!1125420 (= lt!499837 (array!73378 (store (arr!35335 _values!996) i!673 (ValueCellFull!13406 (dynLambda!2517 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35872 _values!996)))))

(declare-fun lt!499843 () ListLongMap!15791)

(assert (=> b!1125420 (= lt!499843 (getCurrentListMapNoExtraKeys!4437 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1125421 () Bool)

(declare-fun -!1100 (ListLongMap!15791 (_ BitVec 64)) ListLongMap!15791)

(assert (=> b!1125421 (= e!640773 (= call!47453 (-!1100 call!47452 k0!934)))))

(declare-fun b!1125422 () Bool)

(assert (=> b!1125422 (= e!640769 true)))

(declare-fun lt!499838 () ListLongMap!15791)

(declare-fun contains!6466 (ListLongMap!15791 (_ BitVec 64)) Bool)

(declare-fun +!3444 (ListLongMap!15791 tuple2!17814) ListLongMap!15791)

(assert (=> b!1125422 (contains!6466 (+!3444 lt!499838 (tuple2!17815 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!499840 () Unit!36845)

(declare-fun addStillContains!670 (ListLongMap!15791 (_ BitVec 64) V!42769 (_ BitVec 64)) Unit!36845)

(assert (=> b!1125422 (= lt!499840 (addStillContains!670 lt!499838 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun b!1125423 () Bool)

(declare-fun e!640768 () Bool)

(assert (=> b!1125423 (= e!640768 (and e!640765 mapRes!44164))))

(declare-fun condMapEmpty!44164 () Bool)

(declare-fun mapDefault!44164 () ValueCell!13406)

(assert (=> b!1125423 (= condMapEmpty!44164 (= (arr!35335 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13406)) mapDefault!44164)))))

(declare-fun b!1125424 () Bool)

(assert (=> b!1125424 (= e!640770 tp_is_empty!28231)))

(declare-fun b!1125413 () Bool)

(assert (=> b!1125413 (= e!640771 e!640769)))

(declare-fun res!751559 () Bool)

(assert (=> b!1125413 (=> res!751559 e!640769)))

(assert (=> b!1125413 (= res!751559 (not (contains!6466 lt!499838 k0!934)))))

(assert (=> b!1125413 (= lt!499838 (getCurrentListMapNoExtraKeys!4437 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!751562 () Bool)

(assert (=> start!98236 (=> (not res!751562) (not e!640772))))

(assert (=> start!98236 (= res!751562 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35871 _keys!1208))))))

(assert (=> start!98236 e!640772))

(assert (=> start!98236 tp_is_empty!28231))

(declare-fun array_inv!27188 (array!73375) Bool)

(assert (=> start!98236 (array_inv!27188 _keys!1208)))

(assert (=> start!98236 true))

(assert (=> start!98236 tp!83806))

(declare-fun array_inv!27189 (array!73377) Bool)

(assert (=> start!98236 (and (array_inv!27189 _values!996) e!640768)))

(assert (= (and start!98236 res!751562) b!1125410))

(assert (= (and b!1125410 res!751560) b!1125416))

(assert (= (and b!1125416 res!751555) b!1125411))

(assert (= (and b!1125411 res!751553) b!1125405))

(assert (= (and b!1125405 res!751558) b!1125419))

(assert (= (and b!1125419 res!751567) b!1125418))

(assert (= (and b!1125418 res!751566) b!1125409))

(assert (= (and b!1125409 res!751565) b!1125414))

(assert (= (and b!1125414 res!751564) b!1125407))

(assert (= (and b!1125407 res!751561) b!1125412))

(assert (= (and b!1125412 (not res!751563)) b!1125420))

(assert (= (and b!1125420 (not res!751556)) b!1125406))

(assert (= (and b!1125406 c!109952) b!1125421))

(assert (= (and b!1125406 (not c!109952)) b!1125415))

(assert (= (or b!1125421 b!1125415) bm!47449))

(assert (= (or b!1125421 b!1125415) bm!47450))

(assert (= (and b!1125406 (not res!751554)) b!1125413))

(assert (= (and b!1125413 (not res!751559)) b!1125408))

(assert (= (and b!1125408 (not res!751557)) b!1125422))

(assert (= (and b!1125423 condMapEmpty!44164) mapIsEmpty!44164))

(assert (= (and b!1125423 (not condMapEmpty!44164)) mapNonEmpty!44164))

(get-info :version)

(assert (= (and mapNonEmpty!44164 ((_ is ValueCellFull!13406) mapValue!44164)) b!1125424))

(assert (= (and b!1125423 ((_ is ValueCellFull!13406) mapDefault!44164)) b!1125417))

(assert (= start!98236 b!1125423))

(declare-fun b_lambda!18681 () Bool)

(assert (=> (not b_lambda!18681) (not b!1125420)))

(declare-fun t!35288 () Bool)

(declare-fun tb!8505 () Bool)

(assert (=> (and start!98236 (= defaultEntry!1004 defaultEntry!1004) t!35288) tb!8505))

(declare-fun result!17579 () Bool)

(assert (=> tb!8505 (= result!17579 tp_is_empty!28231)))

(assert (=> b!1125420 t!35288))

(declare-fun b_and!38197 () Bool)

(assert (= b_and!38195 (and (=> t!35288 result!17579) b_and!38197)))

(declare-fun m!1040105 () Bool)

(assert (=> b!1125412 m!1040105))

(declare-fun m!1040107 () Bool)

(assert (=> b!1125412 m!1040107))

(declare-fun m!1040109 () Bool)

(assert (=> b!1125411 m!1040109))

(declare-fun m!1040111 () Bool)

(assert (=> b!1125413 m!1040111))

(declare-fun m!1040113 () Bool)

(assert (=> b!1125413 m!1040113))

(declare-fun m!1040115 () Bool)

(assert (=> b!1125407 m!1040115))

(declare-fun m!1040117 () Bool)

(assert (=> b!1125421 m!1040117))

(declare-fun m!1040119 () Bool)

(assert (=> b!1125409 m!1040119))

(declare-fun m!1040121 () Bool)

(assert (=> bm!47449 m!1040121))

(declare-fun m!1040123 () Bool)

(assert (=> b!1125406 m!1040123))

(declare-fun m!1040125 () Bool)

(assert (=> b!1125406 m!1040125))

(assert (=> bm!47450 m!1040113))

(declare-fun m!1040127 () Bool)

(assert (=> b!1125414 m!1040127))

(declare-fun m!1040129 () Bool)

(assert (=> b!1125414 m!1040129))

(declare-fun m!1040131 () Bool)

(assert (=> b!1125410 m!1040131))

(declare-fun m!1040133 () Bool)

(assert (=> mapNonEmpty!44164 m!1040133))

(declare-fun m!1040135 () Bool)

(assert (=> b!1125405 m!1040135))

(declare-fun m!1040137 () Bool)

(assert (=> b!1125420 m!1040137))

(declare-fun m!1040139 () Bool)

(assert (=> b!1125420 m!1040139))

(declare-fun m!1040141 () Bool)

(assert (=> b!1125420 m!1040141))

(declare-fun m!1040143 () Bool)

(assert (=> b!1125420 m!1040143))

(declare-fun m!1040145 () Bool)

(assert (=> start!98236 m!1040145))

(declare-fun m!1040147 () Bool)

(assert (=> start!98236 m!1040147))

(declare-fun m!1040149 () Bool)

(assert (=> b!1125418 m!1040149))

(declare-fun m!1040151 () Bool)

(assert (=> b!1125422 m!1040151))

(assert (=> b!1125422 m!1040151))

(declare-fun m!1040153 () Bool)

(assert (=> b!1125422 m!1040153))

(declare-fun m!1040155 () Bool)

(assert (=> b!1125422 m!1040155))

(check-sat (not bm!47449) (not b!1125420) (not b!1125422) (not b!1125414) (not b_lambda!18681) tp_is_empty!28231 (not bm!47450) (not b!1125407) (not b!1125410) (not b!1125412) (not mapNonEmpty!44164) (not start!98236) (not b!1125406) (not b!1125405) (not b_next!23701) b_and!38197 (not b!1125413) (not b!1125418) (not b!1125421) (not b!1125411))
(check-sat b_and!38197 (not b_next!23701))
