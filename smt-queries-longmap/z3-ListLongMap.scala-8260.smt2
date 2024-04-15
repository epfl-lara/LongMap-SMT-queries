; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100502 () Bool)

(assert start!100502)

(declare-fun b_free!25831 () Bool)

(declare-fun b_next!25831 () Bool)

(assert (=> start!100502 (= b_free!25831 (not b_next!25831))))

(declare-fun tp!90482 () Bool)

(declare-fun b_and!42527 () Bool)

(assert (=> start!100502 (= tp!90482 b_and!42527)))

(declare-fun b!1200635 () Bool)

(declare-fun e!681816 () Bool)

(declare-fun e!681818 () Bool)

(assert (=> b!1200635 (= e!681816 e!681818)))

(declare-fun res!799260 () Bool)

(assert (=> b!1200635 (=> res!799260 e!681818)))

(declare-datatypes ((array!77768 0))(
  ( (array!77769 (arr!37529 (Array (_ BitVec 32) (_ BitVec 64))) (size!38067 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77768)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1200635 (= res!799260 (not (= (select (arr!37529 _keys!1208) from!1455) k0!934)))))

(declare-fun e!681817 () Bool)

(assert (=> b!1200635 e!681817))

(declare-fun c!117432 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1200635 (= c!117432 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!45841 0))(
  ( (V!45842 (val!15324 Int)) )
))
(declare-fun zeroValue!944 () V!45841)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((Unit!39665 0))(
  ( (Unit!39666) )
))
(declare-fun lt!543970 () Unit!39665)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14558 0))(
  ( (ValueCellFull!14558 (v!17961 V!45841)) (EmptyCell!14558) )
))
(declare-datatypes ((array!77770 0))(
  ( (array!77771 (arr!37530 (Array (_ BitVec 32) ValueCell!14558)) (size!38068 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77770)

(declare-fun minValue!944 () V!45841)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1002 (array!77768 array!77770 (_ BitVec 32) (_ BitVec 32) V!45841 V!45841 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39665)

(assert (=> b!1200635 (= lt!543970 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1002 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1200636 () Bool)

(declare-fun res!799270 () Bool)

(declare-fun e!681821 () Bool)

(assert (=> b!1200636 (=> res!799270 e!681821)))

(assert (=> b!1200636 (= res!799270 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1200637 () Bool)

(assert (=> b!1200637 (= e!681821 true)))

(declare-datatypes ((tuple2!19706 0))(
  ( (tuple2!19707 (_1!9864 (_ BitVec 64)) (_2!9864 V!45841)) )
))
(declare-datatypes ((List!26496 0))(
  ( (Nil!26493) (Cons!26492 (h!27701 tuple2!19706) (t!39298 List!26496)) )
))
(declare-datatypes ((ListLongMap!17675 0))(
  ( (ListLongMap!17676 (toList!8853 List!26496)) )
))
(declare-fun lt!543974 () ListLongMap!17675)

(declare-fun contains!6850 (ListLongMap!17675 (_ BitVec 64)) Bool)

(declare-fun +!3998 (ListLongMap!17675 tuple2!19706) ListLongMap!17675)

(assert (=> b!1200637 (contains!6850 (+!3998 lt!543974 (tuple2!19707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!543976 () Unit!39665)

(declare-fun addStillContains!982 (ListLongMap!17675 (_ BitVec 64) V!45841 (_ BitVec 64)) Unit!39665)

(assert (=> b!1200637 (= lt!543976 (addStillContains!982 lt!543974 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun b!1200638 () Bool)

(declare-fun res!799269 () Bool)

(declare-fun e!681813 () Bool)

(assert (=> b!1200638 (=> (not res!799269) (not e!681813))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1200638 (= res!799269 (validKeyInArray!0 k0!934))))

(declare-fun b!1200639 () Bool)

(declare-fun e!681820 () Bool)

(assert (=> b!1200639 (= e!681813 e!681820)))

(declare-fun res!799268 () Bool)

(assert (=> b!1200639 (=> (not res!799268) (not e!681820))))

(declare-fun lt!543975 () array!77768)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77768 (_ BitVec 32)) Bool)

(assert (=> b!1200639 (= res!799268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543975 mask!1564))))

(assert (=> b!1200639 (= lt!543975 (array!77769 (store (arr!37529 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38067 _keys!1208)))))

(declare-fun b!1200640 () Bool)

(declare-fun res!799262 () Bool)

(assert (=> b!1200640 (=> (not res!799262) (not e!681813))))

(assert (=> b!1200640 (= res!799262 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38067 _keys!1208))))))

(declare-fun b!1200641 () Bool)

(declare-fun e!681822 () Bool)

(assert (=> b!1200641 (= e!681822 e!681816)))

(declare-fun res!799258 () Bool)

(assert (=> b!1200641 (=> res!799258 e!681816)))

(assert (=> b!1200641 (= res!799258 (not (= from!1455 i!673)))))

(declare-fun lt!543973 () ListLongMap!17675)

(declare-fun lt!543969 () array!77770)

(declare-fun getCurrentListMapNoExtraKeys!5302 (array!77768 array!77770 (_ BitVec 32) (_ BitVec 32) V!45841 V!45841 (_ BitVec 32) Int) ListLongMap!17675)

(assert (=> b!1200641 (= lt!543973 (getCurrentListMapNoExtraKeys!5302 lt!543975 lt!543969 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3181 (Int (_ BitVec 64)) V!45841)

(assert (=> b!1200641 (= lt!543969 (array!77771 (store (arr!37530 _values!996) i!673 (ValueCellFull!14558 (dynLambda!3181 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38068 _values!996)))))

(declare-fun lt!543971 () ListLongMap!17675)

(assert (=> b!1200641 (= lt!543971 (getCurrentListMapNoExtraKeys!5302 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1200642 () Bool)

(declare-fun res!799272 () Bool)

(assert (=> b!1200642 (=> (not res!799272) (not e!681820))))

(declare-datatypes ((List!26497 0))(
  ( (Nil!26494) (Cons!26493 (h!27702 (_ BitVec 64)) (t!39299 List!26497)) )
))
(declare-fun arrayNoDuplicates!0 (array!77768 (_ BitVec 32) List!26497) Bool)

(assert (=> b!1200642 (= res!799272 (arrayNoDuplicates!0 lt!543975 #b00000000000000000000000000000000 Nil!26494))))

(declare-fun b!1200644 () Bool)

(assert (=> b!1200644 (= e!681820 (not e!681822))))

(declare-fun res!799271 () Bool)

(assert (=> b!1200644 (=> res!799271 e!681822)))

(assert (=> b!1200644 (= res!799271 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77768 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1200644 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!543972 () Unit!39665)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77768 (_ BitVec 64) (_ BitVec 32)) Unit!39665)

(assert (=> b!1200644 (= lt!543972 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!47645 () Bool)

(declare-fun mapRes!47645 () Bool)

(assert (=> mapIsEmpty!47645 mapRes!47645))

(declare-fun b!1200645 () Bool)

(declare-fun call!57300 () ListLongMap!17675)

(declare-fun call!57299 () ListLongMap!17675)

(assert (=> b!1200645 (= e!681817 (= call!57300 call!57299))))

(declare-fun mapNonEmpty!47645 () Bool)

(declare-fun tp!90483 () Bool)

(declare-fun e!681814 () Bool)

(assert (=> mapNonEmpty!47645 (= mapRes!47645 (and tp!90483 e!681814))))

(declare-fun mapRest!47645 () (Array (_ BitVec 32) ValueCell!14558))

(declare-fun mapValue!47645 () ValueCell!14558)

(declare-fun mapKey!47645 () (_ BitVec 32))

(assert (=> mapNonEmpty!47645 (= (arr!37530 _values!996) (store mapRest!47645 mapKey!47645 mapValue!47645))))

(declare-fun b!1200646 () Bool)

(declare-fun tp_is_empty!30535 () Bool)

(assert (=> b!1200646 (= e!681814 tp_is_empty!30535)))

(declare-fun bm!57296 () Bool)

(assert (=> bm!57296 (= call!57300 (getCurrentListMapNoExtraKeys!5302 lt!543975 lt!543969 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1200647 () Bool)

(declare-fun res!799265 () Bool)

(assert (=> b!1200647 (=> (not res!799265) (not e!681813))))

(assert (=> b!1200647 (= res!799265 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26494))))

(declare-fun b!1200648 () Bool)

(declare-fun e!681823 () Bool)

(declare-fun e!681815 () Bool)

(assert (=> b!1200648 (= e!681823 (and e!681815 mapRes!47645))))

(declare-fun condMapEmpty!47645 () Bool)

(declare-fun mapDefault!47645 () ValueCell!14558)

(assert (=> b!1200648 (= condMapEmpty!47645 (= (arr!37530 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14558)) mapDefault!47645)))))

(declare-fun b!1200649 () Bool)

(declare-fun res!799264 () Bool)

(assert (=> b!1200649 (=> (not res!799264) (not e!681813))))

(assert (=> b!1200649 (= res!799264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1200650 () Bool)

(declare-fun -!1752 (ListLongMap!17675 (_ BitVec 64)) ListLongMap!17675)

(assert (=> b!1200650 (= e!681817 (= call!57300 (-!1752 call!57299 k0!934)))))

(declare-fun b!1200643 () Bool)

(declare-fun res!799267 () Bool)

(assert (=> b!1200643 (=> (not res!799267) (not e!681813))))

(assert (=> b!1200643 (= res!799267 (and (= (size!38068 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38067 _keys!1208) (size!38068 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!799261 () Bool)

(assert (=> start!100502 (=> (not res!799261) (not e!681813))))

(assert (=> start!100502 (= res!799261 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38067 _keys!1208))))))

(assert (=> start!100502 e!681813))

(assert (=> start!100502 tp_is_empty!30535))

(declare-fun array_inv!28708 (array!77768) Bool)

(assert (=> start!100502 (array_inv!28708 _keys!1208)))

(assert (=> start!100502 true))

(assert (=> start!100502 tp!90482))

(declare-fun array_inv!28709 (array!77770) Bool)

(assert (=> start!100502 (and (array_inv!28709 _values!996) e!681823)))

(declare-fun b!1200651 () Bool)

(assert (=> b!1200651 (= e!681818 e!681821)))

(declare-fun res!799259 () Bool)

(assert (=> b!1200651 (=> res!799259 e!681821)))

(assert (=> b!1200651 (= res!799259 (not (contains!6850 lt!543974 k0!934)))))

(assert (=> b!1200651 (= lt!543974 (getCurrentListMapNoExtraKeys!5302 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!57297 () Bool)

(assert (=> bm!57297 (= call!57299 (getCurrentListMapNoExtraKeys!5302 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1200652 () Bool)

(declare-fun res!799266 () Bool)

(assert (=> b!1200652 (=> (not res!799266) (not e!681813))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1200652 (= res!799266 (validMask!0 mask!1564))))

(declare-fun b!1200653 () Bool)

(assert (=> b!1200653 (= e!681815 tp_is_empty!30535)))

(declare-fun b!1200654 () Bool)

(declare-fun res!799263 () Bool)

(assert (=> b!1200654 (=> (not res!799263) (not e!681813))))

(assert (=> b!1200654 (= res!799263 (= (select (arr!37529 _keys!1208) i!673) k0!934))))

(assert (= (and start!100502 res!799261) b!1200652))

(assert (= (and b!1200652 res!799266) b!1200643))

(assert (= (and b!1200643 res!799267) b!1200649))

(assert (= (and b!1200649 res!799264) b!1200647))

(assert (= (and b!1200647 res!799265) b!1200640))

(assert (= (and b!1200640 res!799262) b!1200638))

(assert (= (and b!1200638 res!799269) b!1200654))

(assert (= (and b!1200654 res!799263) b!1200639))

(assert (= (and b!1200639 res!799268) b!1200642))

(assert (= (and b!1200642 res!799272) b!1200644))

(assert (= (and b!1200644 (not res!799271)) b!1200641))

(assert (= (and b!1200641 (not res!799258)) b!1200635))

(assert (= (and b!1200635 c!117432) b!1200650))

(assert (= (and b!1200635 (not c!117432)) b!1200645))

(assert (= (or b!1200650 b!1200645) bm!57296))

(assert (= (or b!1200650 b!1200645) bm!57297))

(assert (= (and b!1200635 (not res!799260)) b!1200651))

(assert (= (and b!1200651 (not res!799259)) b!1200636))

(assert (= (and b!1200636 (not res!799270)) b!1200637))

(assert (= (and b!1200648 condMapEmpty!47645) mapIsEmpty!47645))

(assert (= (and b!1200648 (not condMapEmpty!47645)) mapNonEmpty!47645))

(get-info :version)

(assert (= (and mapNonEmpty!47645 ((_ is ValueCellFull!14558) mapValue!47645)) b!1200646))

(assert (= (and b!1200648 ((_ is ValueCellFull!14558) mapDefault!47645)) b!1200653))

(assert (= start!100502 b!1200648))

(declare-fun b_lambda!21009 () Bool)

(assert (=> (not b_lambda!21009) (not b!1200641)))

(declare-fun t!39297 () Bool)

(declare-fun tb!10623 () Bool)

(assert (=> (and start!100502 (= defaultEntry!1004 defaultEntry!1004) t!39297) tb!10623))

(declare-fun result!21831 () Bool)

(assert (=> tb!10623 (= result!21831 tp_is_empty!30535)))

(assert (=> b!1200641 t!39297))

(declare-fun b_and!42529 () Bool)

(assert (= b_and!42527 (and (=> t!39297 result!21831) b_and!42529)))

(declare-fun m!1106389 () Bool)

(assert (=> b!1200651 m!1106389))

(declare-fun m!1106391 () Bool)

(assert (=> b!1200651 m!1106391))

(declare-fun m!1106393 () Bool)

(assert (=> b!1200641 m!1106393))

(declare-fun m!1106395 () Bool)

(assert (=> b!1200641 m!1106395))

(declare-fun m!1106397 () Bool)

(assert (=> b!1200641 m!1106397))

(declare-fun m!1106399 () Bool)

(assert (=> b!1200641 m!1106399))

(declare-fun m!1106401 () Bool)

(assert (=> start!100502 m!1106401))

(declare-fun m!1106403 () Bool)

(assert (=> start!100502 m!1106403))

(declare-fun m!1106405 () Bool)

(assert (=> b!1200637 m!1106405))

(assert (=> b!1200637 m!1106405))

(declare-fun m!1106407 () Bool)

(assert (=> b!1200637 m!1106407))

(declare-fun m!1106409 () Bool)

(assert (=> b!1200637 m!1106409))

(declare-fun m!1106411 () Bool)

(assert (=> b!1200647 m!1106411))

(declare-fun m!1106413 () Bool)

(assert (=> b!1200649 m!1106413))

(declare-fun m!1106415 () Bool)

(assert (=> b!1200635 m!1106415))

(declare-fun m!1106417 () Bool)

(assert (=> b!1200635 m!1106417))

(declare-fun m!1106419 () Bool)

(assert (=> b!1200650 m!1106419))

(declare-fun m!1106421 () Bool)

(assert (=> bm!57296 m!1106421))

(declare-fun m!1106423 () Bool)

(assert (=> b!1200652 m!1106423))

(declare-fun m!1106425 () Bool)

(assert (=> mapNonEmpty!47645 m!1106425))

(declare-fun m!1106427 () Bool)

(assert (=> b!1200638 m!1106427))

(assert (=> bm!57297 m!1106391))

(declare-fun m!1106429 () Bool)

(assert (=> b!1200644 m!1106429))

(declare-fun m!1106431 () Bool)

(assert (=> b!1200644 m!1106431))

(declare-fun m!1106433 () Bool)

(assert (=> b!1200639 m!1106433))

(declare-fun m!1106435 () Bool)

(assert (=> b!1200639 m!1106435))

(declare-fun m!1106437 () Bool)

(assert (=> b!1200642 m!1106437))

(declare-fun m!1106439 () Bool)

(assert (=> b!1200654 m!1106439))

(check-sat (not b!1200650) b_and!42529 (not b_next!25831) (not bm!57296) (not b!1200647) (not mapNonEmpty!47645) (not b!1200641) (not bm!57297) (not start!100502) (not b!1200644) (not b!1200639) tp_is_empty!30535 (not b_lambda!21009) (not b!1200651) (not b!1200635) (not b!1200642) (not b!1200649) (not b!1200652) (not b!1200638) (not b!1200637))
(check-sat b_and!42529 (not b_next!25831))
