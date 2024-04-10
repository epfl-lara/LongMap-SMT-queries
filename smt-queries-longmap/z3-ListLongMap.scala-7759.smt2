; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97300 () Bool)

(assert start!97300)

(declare-fun b_free!23271 () Bool)

(declare-fun b_next!23271 () Bool)

(assert (=> start!97300 (= b_free!23271 (not b_next!23271))))

(declare-fun tp!82111 () Bool)

(declare-fun b_and!37373 () Bool)

(assert (=> start!97300 (= tp!82111 b_and!37373)))

(declare-fun b!1108145 () Bool)

(declare-fun res!739542 () Bool)

(declare-fun e!632190 () Bool)

(assert (=> b!1108145 (=> (not res!739542) (not e!632190))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1108145 (= res!739542 (validKeyInArray!0 k0!934))))

(declare-fun b!1108146 () Bool)

(declare-fun e!632191 () Bool)

(declare-fun e!632189 () Bool)

(declare-fun mapRes!43114 () Bool)

(assert (=> b!1108146 (= e!632191 (and e!632189 mapRes!43114))))

(declare-fun condMapEmpty!43114 () Bool)

(declare-datatypes ((V!41835 0))(
  ( (V!41836 (val!13822 Int)) )
))
(declare-datatypes ((ValueCell!13056 0))(
  ( (ValueCellFull!13056 (v!16455 V!41835)) (EmptyCell!13056) )
))
(declare-datatypes ((array!71979 0))(
  ( (array!71980 (arr!34642 (Array (_ BitVec 32) ValueCell!13056)) (size!35178 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71979)

(declare-fun mapDefault!43114 () ValueCell!13056)

(assert (=> b!1108146 (= condMapEmpty!43114 (= (arr!34642 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13056)) mapDefault!43114)))))

(declare-fun b!1108147 () Bool)

(declare-fun e!632192 () Bool)

(assert (=> b!1108147 (= e!632190 e!632192)))

(declare-fun res!739545 () Bool)

(assert (=> b!1108147 (=> (not res!739545) (not e!632192))))

(declare-datatypes ((array!71981 0))(
  ( (array!71982 (arr!34643 (Array (_ BitVec 32) (_ BitVec 64))) (size!35179 (_ BitVec 32))) )
))
(declare-fun lt!495756 () array!71981)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71981 (_ BitVec 32)) Bool)

(assert (=> b!1108147 (= res!739545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495756 mask!1564))))

(declare-fun _keys!1208 () array!71981)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1108147 (= lt!495756 (array!71982 (store (arr!34643 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35179 _keys!1208)))))

(declare-fun b!1108148 () Bool)

(declare-fun e!632193 () Bool)

(declare-fun tp_is_empty!27531 () Bool)

(assert (=> b!1108148 (= e!632193 tp_is_empty!27531)))

(declare-fun zeroValue!944 () V!41835)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!46506 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!41835)

(declare-datatypes ((tuple2!17468 0))(
  ( (tuple2!17469 (_1!8745 (_ BitVec 64)) (_2!8745 V!41835)) )
))
(declare-datatypes ((List!24151 0))(
  ( (Nil!24148) (Cons!24147 (h!25356 tuple2!17468) (t!34468 List!24151)) )
))
(declare-datatypes ((ListLongMap!15437 0))(
  ( (ListLongMap!15438 (toList!7734 List!24151)) )
))
(declare-fun call!46510 () ListLongMap!15437)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4230 (array!71981 array!71979 (_ BitVec 32) (_ BitVec 32) V!41835 V!41835 (_ BitVec 32) Int) ListLongMap!15437)

(assert (=> bm!46506 (= call!46510 (getCurrentListMapNoExtraKeys!4230 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108150 () Bool)

(declare-fun res!739541 () Bool)

(assert (=> b!1108150 (=> (not res!739541) (not e!632190))))

(assert (=> b!1108150 (= res!739541 (and (= (size!35178 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35179 _keys!1208) (size!35178 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!46507 () Bool)

(declare-fun call!46509 () ListLongMap!15437)

(declare-fun dynLambda!2362 (Int (_ BitVec 64)) V!41835)

(assert (=> bm!46507 (= call!46509 (getCurrentListMapNoExtraKeys!4230 lt!495756 (array!71980 (store (arr!34642 _values!996) i!673 (ValueCellFull!13056 (dynLambda!2362 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35178 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108151 () Bool)

(declare-fun res!739546 () Bool)

(assert (=> b!1108151 (=> (not res!739546) (not e!632190))))

(declare-datatypes ((List!24152 0))(
  ( (Nil!24149) (Cons!24148 (h!25357 (_ BitVec 64)) (t!34469 List!24152)) )
))
(declare-fun arrayNoDuplicates!0 (array!71981 (_ BitVec 32) List!24152) Bool)

(assert (=> b!1108151 (= res!739546 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24149))))

(declare-fun b!1108152 () Bool)

(declare-fun res!739538 () Bool)

(assert (=> b!1108152 (=> (not res!739538) (not e!632190))))

(assert (=> b!1108152 (= res!739538 (= (select (arr!34643 _keys!1208) i!673) k0!934))))

(declare-fun e!632186 () Bool)

(declare-fun b!1108153 () Bool)

(declare-fun -!1013 (ListLongMap!15437 (_ BitVec 64)) ListLongMap!15437)

(assert (=> b!1108153 (= e!632186 (= call!46509 (-!1013 call!46510 k0!934)))))

(declare-fun mapIsEmpty!43114 () Bool)

(assert (=> mapIsEmpty!43114 mapRes!43114))

(declare-fun b!1108154 () Bool)

(declare-fun res!739543 () Bool)

(assert (=> b!1108154 (=> (not res!739543) (not e!632192))))

(assert (=> b!1108154 (= res!739543 (arrayNoDuplicates!0 lt!495756 #b00000000000000000000000000000000 Nil!24149))))

(declare-fun b!1108155 () Bool)

(assert (=> b!1108155 (= e!632189 tp_is_empty!27531)))

(declare-fun b!1108156 () Bool)

(declare-fun e!632188 () Bool)

(assert (=> b!1108156 (= e!632192 (not e!632188))))

(declare-fun res!739540 () Bool)

(assert (=> b!1108156 (=> res!739540 e!632188)))

(assert (=> b!1108156 (= res!739540 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35179 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!71981 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1108156 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36372 0))(
  ( (Unit!36373) )
))
(declare-fun lt!495757 () Unit!36372)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71981 (_ BitVec 64) (_ BitVec 32)) Unit!36372)

(assert (=> b!1108156 (= lt!495757 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1108157 () Bool)

(assert (=> b!1108157 (= e!632188 true)))

(assert (=> b!1108157 e!632186))

(declare-fun c!109086 () Bool)

(assert (=> b!1108157 (= c!109086 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!495758 () Unit!36372)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!258 (array!71981 array!71979 (_ BitVec 32) (_ BitVec 32) V!41835 V!41835 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36372)

(assert (=> b!1108157 (= lt!495758 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!258 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!43114 () Bool)

(declare-fun tp!82112 () Bool)

(assert (=> mapNonEmpty!43114 (= mapRes!43114 (and tp!82112 e!632193))))

(declare-fun mapKey!43114 () (_ BitVec 32))

(declare-fun mapValue!43114 () ValueCell!13056)

(declare-fun mapRest!43114 () (Array (_ BitVec 32) ValueCell!13056))

(assert (=> mapNonEmpty!43114 (= (arr!34642 _values!996) (store mapRest!43114 mapKey!43114 mapValue!43114))))

(declare-fun b!1108158 () Bool)

(declare-fun res!739539 () Bool)

(assert (=> b!1108158 (=> (not res!739539) (not e!632190))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1108158 (= res!739539 (validMask!0 mask!1564))))

(declare-fun res!739537 () Bool)

(assert (=> start!97300 (=> (not res!739537) (not e!632190))))

(assert (=> start!97300 (= res!739537 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35179 _keys!1208))))))

(assert (=> start!97300 e!632190))

(assert (=> start!97300 tp_is_empty!27531))

(declare-fun array_inv!26660 (array!71981) Bool)

(assert (=> start!97300 (array_inv!26660 _keys!1208)))

(assert (=> start!97300 true))

(assert (=> start!97300 tp!82111))

(declare-fun array_inv!26661 (array!71979) Bool)

(assert (=> start!97300 (and (array_inv!26661 _values!996) e!632191)))

(declare-fun b!1108149 () Bool)

(declare-fun res!739544 () Bool)

(assert (=> b!1108149 (=> (not res!739544) (not e!632190))))

(assert (=> b!1108149 (= res!739544 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35179 _keys!1208))))))

(declare-fun b!1108159 () Bool)

(assert (=> b!1108159 (= e!632186 (= call!46509 call!46510))))

(declare-fun b!1108160 () Bool)

(declare-fun res!739536 () Bool)

(assert (=> b!1108160 (=> (not res!739536) (not e!632190))))

(assert (=> b!1108160 (= res!739536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!97300 res!739537) b!1108158))

(assert (= (and b!1108158 res!739539) b!1108150))

(assert (= (and b!1108150 res!739541) b!1108160))

(assert (= (and b!1108160 res!739536) b!1108151))

(assert (= (and b!1108151 res!739546) b!1108149))

(assert (= (and b!1108149 res!739544) b!1108145))

(assert (= (and b!1108145 res!739542) b!1108152))

(assert (= (and b!1108152 res!739538) b!1108147))

(assert (= (and b!1108147 res!739545) b!1108154))

(assert (= (and b!1108154 res!739543) b!1108156))

(assert (= (and b!1108156 (not res!739540)) b!1108157))

(assert (= (and b!1108157 c!109086) b!1108153))

(assert (= (and b!1108157 (not c!109086)) b!1108159))

(assert (= (or b!1108153 b!1108159) bm!46507))

(assert (= (or b!1108153 b!1108159) bm!46506))

(assert (= (and b!1108146 condMapEmpty!43114) mapIsEmpty!43114))

(assert (= (and b!1108146 (not condMapEmpty!43114)) mapNonEmpty!43114))

(get-info :version)

(assert (= (and mapNonEmpty!43114 ((_ is ValueCellFull!13056) mapValue!43114)) b!1108148))

(assert (= (and b!1108146 ((_ is ValueCellFull!13056) mapDefault!43114)) b!1108155))

(assert (= start!97300 b!1108146))

(declare-fun b_lambda!18289 () Bool)

(assert (=> (not b_lambda!18289) (not bm!46507)))

(declare-fun t!34467 () Bool)

(declare-fun tb!8137 () Bool)

(assert (=> (and start!97300 (= defaultEntry!1004 defaultEntry!1004) t!34467) tb!8137))

(declare-fun result!16835 () Bool)

(assert (=> tb!8137 (= result!16835 tp_is_empty!27531)))

(assert (=> bm!46507 t!34467))

(declare-fun b_and!37375 () Bool)

(assert (= b_and!37373 (and (=> t!34467 result!16835) b_and!37375)))

(declare-fun m!1026751 () Bool)

(assert (=> b!1108158 m!1026751))

(declare-fun m!1026753 () Bool)

(assert (=> b!1108154 m!1026753))

(declare-fun m!1026755 () Bool)

(assert (=> b!1108147 m!1026755))

(declare-fun m!1026757 () Bool)

(assert (=> b!1108147 m!1026757))

(declare-fun m!1026759 () Bool)

(assert (=> b!1108157 m!1026759))

(declare-fun m!1026761 () Bool)

(assert (=> b!1108152 m!1026761))

(declare-fun m!1026763 () Bool)

(assert (=> b!1108156 m!1026763))

(declare-fun m!1026765 () Bool)

(assert (=> b!1108156 m!1026765))

(declare-fun m!1026767 () Bool)

(assert (=> b!1108153 m!1026767))

(declare-fun m!1026769 () Bool)

(assert (=> b!1108151 m!1026769))

(declare-fun m!1026771 () Bool)

(assert (=> mapNonEmpty!43114 m!1026771))

(declare-fun m!1026773 () Bool)

(assert (=> bm!46507 m!1026773))

(declare-fun m!1026775 () Bool)

(assert (=> bm!46507 m!1026775))

(declare-fun m!1026777 () Bool)

(assert (=> bm!46507 m!1026777))

(declare-fun m!1026779 () Bool)

(assert (=> bm!46506 m!1026779))

(declare-fun m!1026781 () Bool)

(assert (=> b!1108145 m!1026781))

(declare-fun m!1026783 () Bool)

(assert (=> b!1108160 m!1026783))

(declare-fun m!1026785 () Bool)

(assert (=> start!97300 m!1026785))

(declare-fun m!1026787 () Bool)

(assert (=> start!97300 m!1026787))

(check-sat (not b!1108156) (not b!1108151) (not b_next!23271) (not b!1108153) (not bm!46506) (not b!1108158) (not b!1108154) (not b!1108147) b_and!37375 (not bm!46507) tp_is_empty!27531 (not b!1108160) (not mapNonEmpty!43114) (not b!1108145) (not b_lambda!18289) (not b!1108157) (not start!97300))
(check-sat b_and!37375 (not b_next!23271))
