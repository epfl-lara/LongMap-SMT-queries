; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98552 () Bool)

(assert start!98552)

(declare-fun b_free!24163 () Bool)

(declare-fun b_next!24163 () Bool)

(assert (=> start!98552 (= b_free!24163 (not b_next!24163))))

(declare-fun tp!85200 () Bool)

(declare-fun b_and!39153 () Bool)

(assert (=> start!98552 (= tp!85200 b_and!39153)))

(declare-fun b!1142438 () Bool)

(declare-fun e!649926 () Bool)

(declare-fun tp_is_empty!28693 () Bool)

(assert (=> b!1142438 (= e!649926 tp_is_empty!28693)))

(declare-fun b!1142439 () Bool)

(declare-fun res!761330 () Bool)

(declare-fun e!649914 () Bool)

(assert (=> b!1142439 (=> (not res!761330) (not e!649914))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1142439 (= res!761330 (validMask!0 mask!1564))))

(declare-fun b!1142440 () Bool)

(declare-fun e!649929 () Bool)

(declare-fun e!649917 () Bool)

(declare-fun mapRes!44864 () Bool)

(assert (=> b!1142440 (= e!649929 (and e!649917 mapRes!44864))))

(declare-fun condMapEmpty!44864 () Bool)

(declare-datatypes ((V!43385 0))(
  ( (V!43386 (val!14403 Int)) )
))
(declare-datatypes ((ValueCell!13637 0))(
  ( (ValueCellFull!13637 (v!17039 V!43385)) (EmptyCell!13637) )
))
(declare-datatypes ((array!74166 0))(
  ( (array!74167 (arr!35734 (Array (_ BitVec 32) ValueCell!13637)) (size!36272 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74166)

(declare-fun mapDefault!44864 () ValueCell!13637)

(assert (=> b!1142440 (= condMapEmpty!44864 (= (arr!35734 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13637)) mapDefault!44864)))))

(declare-fun zeroValue!944 () V!43385)

(declare-datatypes ((tuple2!18316 0))(
  ( (tuple2!18317 (_1!9169 (_ BitVec 64)) (_2!9169 V!43385)) )
))
(declare-datatypes ((List!25054 0))(
  ( (Nil!25051) (Cons!25050 (h!26259 tuple2!18316) (t!36200 List!25054)) )
))
(declare-datatypes ((ListLongMap!16285 0))(
  ( (ListLongMap!16286 (toList!8158 List!25054)) )
))
(declare-fun call!51476 () ListLongMap!16285)

(declare-fun lt!509148 () ListLongMap!16285)

(declare-fun bm!51472 () Bool)

(declare-fun lt!509140 () ListLongMap!16285)

(declare-fun minValue!944 () V!43385)

(declare-fun c!112301 () Bool)

(declare-fun c!112300 () Bool)

(declare-fun +!3582 (ListLongMap!16285 tuple2!18316) ListLongMap!16285)

(assert (=> bm!51472 (= call!51476 (+!3582 (ite c!112300 lt!509140 lt!509148) (ite c!112300 (tuple2!18317 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112301 (tuple2!18317 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18317 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1142441 () Bool)

(declare-fun res!761327 () Bool)

(assert (=> b!1142441 (=> (not res!761327) (not e!649914))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!74168 0))(
  ( (array!74169 (arr!35735 (Array (_ BitVec 32) (_ BitVec 64))) (size!36273 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74168)

(assert (=> b!1142441 (= res!761327 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36273 _keys!1208))))))

(declare-datatypes ((Unit!37343 0))(
  ( (Unit!37344) )
))
(declare-fun call!51478 () Unit!37343)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun bm!51473 () Bool)

(declare-fun addStillContains!797 (ListLongMap!16285 (_ BitVec 64) V!43385 (_ BitVec 64)) Unit!37343)

(assert (=> bm!51473 (= call!51478 (addStillContains!797 lt!509148 (ite (or c!112300 c!112301) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112300 c!112301) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1142442 () Bool)

(declare-fun e!649925 () Bool)

(declare-fun e!649927 () Bool)

(assert (=> b!1142442 (= e!649925 e!649927)))

(declare-fun res!761323 () Bool)

(assert (=> b!1142442 (=> res!761323 e!649927)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1142442 (= res!761323 (not (= from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!509139 () array!74168)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!509150 () ListLongMap!16285)

(declare-fun lt!509146 () array!74166)

(declare-fun getCurrentListMapNoExtraKeys!4649 (array!74168 array!74166 (_ BitVec 32) (_ BitVec 32) V!43385 V!43385 (_ BitVec 32) Int) ListLongMap!16285)

(assert (=> b!1142442 (= lt!509150 (getCurrentListMapNoExtraKeys!4649 lt!509139 lt!509146 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!509147 () V!43385)

(assert (=> b!1142442 (= lt!509146 (array!74167 (store (arr!35734 _values!996) i!673 (ValueCellFull!13637 lt!509147)) (size!36272 _values!996)))))

(declare-fun dynLambda!2628 (Int (_ BitVec 64)) V!43385)

(assert (=> b!1142442 (= lt!509147 (dynLambda!2628 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!509137 () ListLongMap!16285)

(assert (=> b!1142442 (= lt!509137 (getCurrentListMapNoExtraKeys!4649 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1142443 () Bool)

(declare-fun res!761325 () Bool)

(assert (=> b!1142443 (=> (not res!761325) (not e!649914))))

(assert (=> b!1142443 (= res!761325 (= (select (arr!35735 _keys!1208) i!673) k0!934))))

(declare-fun b!1142444 () Bool)

(declare-fun res!761332 () Bool)

(assert (=> b!1142444 (=> (not res!761332) (not e!649914))))

(declare-datatypes ((List!25055 0))(
  ( (Nil!25052) (Cons!25051 (h!26260 (_ BitVec 64)) (t!36201 List!25055)) )
))
(declare-fun arrayNoDuplicates!0 (array!74168 (_ BitVec 32) List!25055) Bool)

(assert (=> b!1142444 (= res!761332 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25052))))

(declare-fun b!1142445 () Bool)

(declare-fun contains!6627 (ListLongMap!16285 (_ BitVec 64)) Bool)

(assert (=> b!1142445 (contains!6627 call!51476 k0!934)))

(declare-fun lt!509154 () Unit!37343)

(assert (=> b!1142445 (= lt!509154 (addStillContains!797 lt!509140 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!51481 () Bool)

(assert (=> b!1142445 call!51481))

(assert (=> b!1142445 (= lt!509140 (+!3582 lt!509148 (tuple2!18317 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!509143 () Unit!37343)

(assert (=> b!1142445 (= lt!509143 call!51478)))

(declare-fun e!649916 () Unit!37343)

(assert (=> b!1142445 (= e!649916 lt!509154)))

(declare-fun b!1142446 () Bool)

(declare-fun res!761329 () Bool)

(assert (=> b!1142446 (=> (not res!761329) (not e!649914))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1142446 (= res!761329 (validKeyInArray!0 k0!934))))

(declare-fun b!1142447 () Bool)

(declare-fun e!649920 () Bool)

(declare-fun call!51477 () ListLongMap!16285)

(declare-fun call!51480 () ListLongMap!16285)

(assert (=> b!1142447 (= e!649920 (= call!51477 call!51480))))

(declare-fun b!1142448 () Bool)

(declare-fun res!761324 () Bool)

(assert (=> b!1142448 (=> (not res!761324) (not e!649914))))

(assert (=> b!1142448 (= res!761324 (and (= (size!36272 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36273 _keys!1208) (size!36272 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1142449 () Bool)

(declare-fun e!649918 () Bool)

(declare-fun arrayContainsKey!0 (array!74168 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1142449 (= e!649918 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!51474 () Bool)

(declare-fun call!51479 () ListLongMap!16285)

(assert (=> bm!51474 (= call!51479 call!51476)))

(declare-fun res!761320 () Bool)

(assert (=> start!98552 (=> (not res!761320) (not e!649914))))

(assert (=> start!98552 (= res!761320 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36273 _keys!1208))))))

(assert (=> start!98552 e!649914))

(assert (=> start!98552 tp_is_empty!28693))

(declare-fun array_inv!27460 (array!74168) Bool)

(assert (=> start!98552 (array_inv!27460 _keys!1208)))

(assert (=> start!98552 true))

(assert (=> start!98552 tp!85200))

(declare-fun array_inv!27461 (array!74166) Bool)

(assert (=> start!98552 (and (array_inv!27461 _values!996) e!649929)))

(declare-fun b!1142450 () Bool)

(declare-fun e!649919 () Unit!37343)

(declare-fun Unit!37345 () Unit!37343)

(assert (=> b!1142450 (= e!649919 Unit!37345)))

(declare-fun bm!51475 () Bool)

(declare-fun call!51482 () Bool)

(assert (=> bm!51475 (= call!51482 call!51481)))

(declare-fun mapNonEmpty!44864 () Bool)

(declare-fun tp!85199 () Bool)

(assert (=> mapNonEmpty!44864 (= mapRes!44864 (and tp!85199 e!649926))))

(declare-fun mapValue!44864 () ValueCell!13637)

(declare-fun mapKey!44864 () (_ BitVec 32))

(declare-fun mapRest!44864 () (Array (_ BitVec 32) ValueCell!13637))

(assert (=> mapNonEmpty!44864 (= (arr!35734 _values!996) (store mapRest!44864 mapKey!44864 mapValue!44864))))

(declare-fun bm!51476 () Bool)

(assert (=> bm!51476 (= call!51481 (contains!6627 (ite c!112300 lt!509140 call!51479) k0!934))))

(declare-fun mapIsEmpty!44864 () Bool)

(assert (=> mapIsEmpty!44864 mapRes!44864))

(declare-fun b!1142451 () Bool)

(declare-fun e!649923 () Unit!37343)

(declare-fun Unit!37346 () Unit!37343)

(assert (=> b!1142451 (= e!649923 Unit!37346)))

(declare-fun lt!509153 () Bool)

(assert (=> b!1142451 (= lt!509153 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1142451 (= c!112300 (and (not lt!509153) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!509135 () Unit!37343)

(assert (=> b!1142451 (= lt!509135 e!649916)))

(declare-fun lt!509136 () Unit!37343)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!397 (array!74168 array!74166 (_ BitVec 32) (_ BitVec 32) V!43385 V!43385 (_ BitVec 64) (_ BitVec 32) Int) Unit!37343)

(assert (=> b!1142451 (= lt!509136 (lemmaListMapContainsThenArrayContainsFrom!397 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112303 () Bool)

(assert (=> b!1142451 (= c!112303 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!761333 () Bool)

(assert (=> b!1142451 (= res!761333 e!649918)))

(declare-fun e!649915 () Bool)

(assert (=> b!1142451 (=> (not res!761333) (not e!649915))))

(assert (=> b!1142451 e!649915))

(declare-fun lt!509142 () Unit!37343)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74168 (_ BitVec 32) (_ BitVec 32)) Unit!37343)

(assert (=> b!1142451 (= lt!509142 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1142451 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25052)))

(declare-fun lt!509145 () Unit!37343)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74168 (_ BitVec 64) (_ BitVec 32) List!25055) Unit!37343)

(assert (=> b!1142451 (= lt!509145 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25052))))

(assert (=> b!1142451 false))

(declare-fun b!1142452 () Bool)

(declare-fun e!649921 () Bool)

(assert (=> b!1142452 (= e!649927 e!649921)))

(declare-fun res!761328 () Bool)

(assert (=> b!1142452 (=> res!761328 e!649921)))

(assert (=> b!1142452 (= res!761328 (not (= (select (arr!35735 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1142452 e!649920))

(declare-fun c!112304 () Bool)

(assert (=> b!1142452 (= c!112304 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!509138 () Unit!37343)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!520 (array!74168 array!74166 (_ BitVec 32) (_ BitVec 32) V!43385 V!43385 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37343)

(assert (=> b!1142452 (= lt!509138 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!520 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!51477 () Bool)

(declare-fun call!51475 () Unit!37343)

(assert (=> bm!51477 (= call!51475 call!51478)))

(declare-fun b!1142453 () Bool)

(assert (=> b!1142453 (= e!649921 true)))

(declare-fun lt!509149 () V!43385)

(declare-fun -!1239 (ListLongMap!16285 (_ BitVec 64)) ListLongMap!16285)

(assert (=> b!1142453 (= (-!1239 (+!3582 lt!509148 (tuple2!18317 (select (arr!35735 _keys!1208) from!1455) lt!509149)) (select (arr!35735 _keys!1208) from!1455)) lt!509148)))

(declare-fun lt!509144 () Unit!37343)

(declare-fun addThenRemoveForNewKeyIsSame!105 (ListLongMap!16285 (_ BitVec 64) V!43385) Unit!37343)

(assert (=> b!1142453 (= lt!509144 (addThenRemoveForNewKeyIsSame!105 lt!509148 (select (arr!35735 _keys!1208) from!1455) lt!509149))))

(declare-fun get!18173 (ValueCell!13637 V!43385) V!43385)

(assert (=> b!1142453 (= lt!509149 (get!18173 (select (arr!35734 _values!996) from!1455) lt!509147))))

(declare-fun lt!509151 () Unit!37343)

(assert (=> b!1142453 (= lt!509151 e!649923)))

(declare-fun c!112299 () Bool)

(assert (=> b!1142453 (= c!112299 (contains!6627 lt!509148 k0!934))))

(assert (=> b!1142453 (= lt!509148 (getCurrentListMapNoExtraKeys!4649 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142454 () Bool)

(declare-fun Unit!37347 () Unit!37343)

(assert (=> b!1142454 (= e!649923 Unit!37347)))

(declare-fun b!1142455 () Bool)

(assert (=> b!1142455 call!51482))

(declare-fun lt!509152 () Unit!37343)

(assert (=> b!1142455 (= lt!509152 call!51475)))

(assert (=> b!1142455 (= e!649919 lt!509152)))

(declare-fun b!1142456 () Bool)

(assert (=> b!1142456 (= e!649915 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1142457 () Bool)

(assert (=> b!1142457 (= e!649920 (= call!51477 (-!1239 call!51480 k0!934)))))

(declare-fun b!1142458 () Bool)

(assert (=> b!1142458 (= e!649917 tp_is_empty!28693)))

(declare-fun b!1142459 () Bool)

(declare-fun e!649928 () Unit!37343)

(assert (=> b!1142459 (= e!649928 e!649919)))

(declare-fun c!112302 () Bool)

(assert (=> b!1142459 (= c!112302 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!509153))))

(declare-fun b!1142460 () Bool)

(declare-fun res!761321 () Bool)

(assert (=> b!1142460 (=> (not res!761321) (not e!649914))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74168 (_ BitVec 32)) Bool)

(assert (=> b!1142460 (= res!761321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!51478 () Bool)

(assert (=> bm!51478 (= call!51477 (getCurrentListMapNoExtraKeys!4649 lt!509139 lt!509146 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142461 () Bool)

(declare-fun lt!509141 () Unit!37343)

(assert (=> b!1142461 (= e!649928 lt!509141)))

(assert (=> b!1142461 (= lt!509141 call!51475)))

(assert (=> b!1142461 call!51482))

(declare-fun b!1142462 () Bool)

(declare-fun e!649922 () Bool)

(assert (=> b!1142462 (= e!649914 e!649922)))

(declare-fun res!761331 () Bool)

(assert (=> b!1142462 (=> (not res!761331) (not e!649922))))

(assert (=> b!1142462 (= res!761331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!509139 mask!1564))))

(assert (=> b!1142462 (= lt!509139 (array!74169 (store (arr!35735 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36273 _keys!1208)))))

(declare-fun bm!51479 () Bool)

(assert (=> bm!51479 (= call!51480 (getCurrentListMapNoExtraKeys!4649 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142463 () Bool)

(assert (=> b!1142463 (= c!112301 (and (not lt!509153) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1142463 (= e!649916 e!649928)))

(declare-fun b!1142464 () Bool)

(assert (=> b!1142464 (= e!649918 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!509153) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1142465 () Bool)

(declare-fun res!761322 () Bool)

(assert (=> b!1142465 (=> (not res!761322) (not e!649922))))

(assert (=> b!1142465 (= res!761322 (arrayNoDuplicates!0 lt!509139 #b00000000000000000000000000000000 Nil!25052))))

(declare-fun b!1142466 () Bool)

(assert (=> b!1142466 (= e!649922 (not e!649925))))

(declare-fun res!761326 () Bool)

(assert (=> b!1142466 (=> res!761326 e!649925)))

(assert (=> b!1142466 (= res!761326 (bvsgt from!1455 i!673))))

(assert (=> b!1142466 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!509134 () Unit!37343)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74168 (_ BitVec 64) (_ BitVec 32)) Unit!37343)

(assert (=> b!1142466 (= lt!509134 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!98552 res!761320) b!1142439))

(assert (= (and b!1142439 res!761330) b!1142448))

(assert (= (and b!1142448 res!761324) b!1142460))

(assert (= (and b!1142460 res!761321) b!1142444))

(assert (= (and b!1142444 res!761332) b!1142441))

(assert (= (and b!1142441 res!761327) b!1142446))

(assert (= (and b!1142446 res!761329) b!1142443))

(assert (= (and b!1142443 res!761325) b!1142462))

(assert (= (and b!1142462 res!761331) b!1142465))

(assert (= (and b!1142465 res!761322) b!1142466))

(assert (= (and b!1142466 (not res!761326)) b!1142442))

(assert (= (and b!1142442 (not res!761323)) b!1142452))

(assert (= (and b!1142452 c!112304) b!1142457))

(assert (= (and b!1142452 (not c!112304)) b!1142447))

(assert (= (or b!1142457 b!1142447) bm!51479))

(assert (= (or b!1142457 b!1142447) bm!51478))

(assert (= (and b!1142452 (not res!761328)) b!1142453))

(assert (= (and b!1142453 c!112299) b!1142451))

(assert (= (and b!1142453 (not c!112299)) b!1142454))

(assert (= (and b!1142451 c!112300) b!1142445))

(assert (= (and b!1142451 (not c!112300)) b!1142463))

(assert (= (and b!1142463 c!112301) b!1142461))

(assert (= (and b!1142463 (not c!112301)) b!1142459))

(assert (= (and b!1142459 c!112302) b!1142455))

(assert (= (and b!1142459 (not c!112302)) b!1142450))

(assert (= (or b!1142461 b!1142455) bm!51477))

(assert (= (or b!1142461 b!1142455) bm!51474))

(assert (= (or b!1142461 b!1142455) bm!51475))

(assert (= (or b!1142445 bm!51475) bm!51476))

(assert (= (or b!1142445 bm!51477) bm!51473))

(assert (= (or b!1142445 bm!51474) bm!51472))

(assert (= (and b!1142451 c!112303) b!1142449))

(assert (= (and b!1142451 (not c!112303)) b!1142464))

(assert (= (and b!1142451 res!761333) b!1142456))

(assert (= (and b!1142440 condMapEmpty!44864) mapIsEmpty!44864))

(assert (= (and b!1142440 (not condMapEmpty!44864)) mapNonEmpty!44864))

(get-info :version)

(assert (= (and mapNonEmpty!44864 ((_ is ValueCellFull!13637) mapValue!44864)) b!1142438))

(assert (= (and b!1142440 ((_ is ValueCellFull!13637) mapDefault!44864)) b!1142458))

(assert (= start!98552 b!1142440))

(declare-fun b_lambda!19251 () Bool)

(assert (=> (not b_lambda!19251) (not b!1142442)))

(declare-fun t!36199 () Bool)

(declare-fun tb!8967 () Bool)

(assert (=> (and start!98552 (= defaultEntry!1004 defaultEntry!1004) t!36199) tb!8967))

(declare-fun result!18507 () Bool)

(assert (=> tb!8967 (= result!18507 tp_is_empty!28693)))

(assert (=> b!1142442 t!36199))

(declare-fun b_and!39155 () Bool)

(assert (= b_and!39153 (and (=> t!36199 result!18507) b_and!39155)))

(declare-fun m!1053213 () Bool)

(assert (=> b!1142445 m!1053213))

(declare-fun m!1053215 () Bool)

(assert (=> b!1142445 m!1053215))

(declare-fun m!1053217 () Bool)

(assert (=> b!1142445 m!1053217))

(declare-fun m!1053219 () Bool)

(assert (=> b!1142466 m!1053219))

(declare-fun m!1053221 () Bool)

(assert (=> b!1142466 m!1053221))

(declare-fun m!1053223 () Bool)

(assert (=> bm!51476 m!1053223))

(declare-fun m!1053225 () Bool)

(assert (=> b!1142460 m!1053225))

(declare-fun m!1053227 () Bool)

(assert (=> b!1142451 m!1053227))

(declare-fun m!1053229 () Bool)

(assert (=> b!1142451 m!1053229))

(declare-fun m!1053231 () Bool)

(assert (=> b!1142451 m!1053231))

(declare-fun m!1053233 () Bool)

(assert (=> b!1142451 m!1053233))

(declare-fun m!1053235 () Bool)

(assert (=> b!1142457 m!1053235))

(declare-fun m!1053237 () Bool)

(assert (=> b!1142452 m!1053237))

(declare-fun m!1053239 () Bool)

(assert (=> b!1142452 m!1053239))

(declare-fun m!1053241 () Bool)

(assert (=> bm!51473 m!1053241))

(declare-fun m!1053243 () Bool)

(assert (=> b!1142449 m!1053243))

(declare-fun m!1053245 () Bool)

(assert (=> bm!51478 m!1053245))

(declare-fun m!1053247 () Bool)

(assert (=> start!98552 m!1053247))

(declare-fun m!1053249 () Bool)

(assert (=> start!98552 m!1053249))

(assert (=> b!1142456 m!1053243))

(declare-fun m!1053251 () Bool)

(assert (=> b!1142465 m!1053251))

(declare-fun m!1053253 () Bool)

(assert (=> b!1142446 m!1053253))

(declare-fun m!1053255 () Bool)

(assert (=> bm!51479 m!1053255))

(assert (=> b!1142453 m!1053255))

(declare-fun m!1053257 () Bool)

(assert (=> b!1142453 m!1053257))

(declare-fun m!1053259 () Bool)

(assert (=> b!1142453 m!1053259))

(declare-fun m!1053261 () Bool)

(assert (=> b!1142453 m!1053261))

(assert (=> b!1142453 m!1053237))

(declare-fun m!1053263 () Bool)

(assert (=> b!1142453 m!1053263))

(assert (=> b!1142453 m!1053237))

(declare-fun m!1053265 () Bool)

(assert (=> b!1142453 m!1053265))

(assert (=> b!1142453 m!1053257))

(declare-fun m!1053267 () Bool)

(assert (=> b!1142453 m!1053267))

(assert (=> b!1142453 m!1053261))

(assert (=> b!1142453 m!1053237))

(declare-fun m!1053269 () Bool)

(assert (=> bm!51472 m!1053269))

(declare-fun m!1053271 () Bool)

(assert (=> mapNonEmpty!44864 m!1053271))

(declare-fun m!1053273 () Bool)

(assert (=> b!1142439 m!1053273))

(declare-fun m!1053275 () Bool)

(assert (=> b!1142443 m!1053275))

(declare-fun m!1053277 () Bool)

(assert (=> b!1142462 m!1053277))

(declare-fun m!1053279 () Bool)

(assert (=> b!1142462 m!1053279))

(declare-fun m!1053281 () Bool)

(assert (=> b!1142442 m!1053281))

(declare-fun m!1053283 () Bool)

(assert (=> b!1142442 m!1053283))

(declare-fun m!1053285 () Bool)

(assert (=> b!1142442 m!1053285))

(declare-fun m!1053287 () Bool)

(assert (=> b!1142442 m!1053287))

(declare-fun m!1053289 () Bool)

(assert (=> b!1142444 m!1053289))

(check-sat (not b_next!24163) (not b!1142456) (not b!1142444) (not b!1142445) (not bm!51478) (not start!98552) (not b!1142449) (not bm!51479) (not b!1142462) (not b!1142439) (not b!1142452) (not bm!51476) (not bm!51473) (not mapNonEmpty!44864) b_and!39155 (not b!1142460) (not b!1142442) (not b!1142446) (not b!1142451) tp_is_empty!28693 (not b!1142457) (not b_lambda!19251) (not b!1142453) (not bm!51472) (not b!1142466) (not b!1142465))
(check-sat b_and!39155 (not b_next!24163))
