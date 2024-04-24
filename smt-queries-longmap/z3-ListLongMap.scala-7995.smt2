; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99046 () Bool)

(assert start!99046)

(declare-fun b_free!24415 () Bool)

(declare-fun b_next!24415 () Bool)

(assert (=> start!99046 (= b_free!24415 (not b_next!24415))))

(declare-fun tp!85955 () Bool)

(declare-fun b_and!39681 () Bool)

(assert (=> start!99046 (= tp!85955 b_and!39681)))

(declare-fun b!1155391 () Bool)

(declare-datatypes ((Unit!37970 0))(
  ( (Unit!37971) )
))
(declare-fun e!657209 () Unit!37970)

(declare-fun e!657201 () Unit!37970)

(assert (=> b!1155391 (= e!657209 e!657201)))

(declare-fun c!114992 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!517915 () Bool)

(assert (=> b!1155391 (= c!114992 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!517915))))

(declare-datatypes ((array!74781 0))(
  ( (array!74782 (arr!36035 (Array (_ BitVec 32) (_ BitVec 64))) (size!36572 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74781)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!657198 () Bool)

(declare-fun b!1155392 () Bool)

(declare-fun arrayContainsKey!0 (array!74781 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1155392 (= e!657198 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1155393 () Bool)

(declare-fun e!657212 () Bool)

(assert (=> b!1155393 (= e!657212 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapIsEmpty!45242 () Bool)

(declare-fun mapRes!45242 () Bool)

(assert (=> mapIsEmpty!45242 mapRes!45242))

(declare-fun bm!54584 () Bool)

(declare-datatypes ((V!43721 0))(
  ( (V!43722 (val!14529 Int)) )
))
(declare-datatypes ((tuple2!18484 0))(
  ( (tuple2!18485 (_1!9253 (_ BitVec 64)) (_2!9253 V!43721)) )
))
(declare-datatypes ((List!25229 0))(
  ( (Nil!25226) (Cons!25225 (h!26443 tuple2!18484) (t!36628 List!25229)) )
))
(declare-datatypes ((ListLongMap!16461 0))(
  ( (ListLongMap!16462 (toList!8246 List!25229)) )
))
(declare-fun call!54590 () ListLongMap!16461)

(declare-fun call!54592 () ListLongMap!16461)

(assert (=> bm!54584 (= call!54590 call!54592)))

(declare-fun zeroValue!944 () V!43721)

(declare-datatypes ((ValueCell!13763 0))(
  ( (ValueCellFull!13763 (v!17162 V!43721)) (EmptyCell!13763) )
))
(declare-datatypes ((array!74783 0))(
  ( (array!74784 (arr!36036 (Array (_ BitVec 32) ValueCell!13763)) (size!36573 (_ BitVec 32))) )
))
(declare-fun lt!517912 () array!74783)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!517929 () ListLongMap!16461)

(declare-fun e!657206 () Bool)

(declare-fun lt!517925 () array!74781)

(declare-fun minValue!944 () V!43721)

(declare-fun b!1155394 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4742 (array!74781 array!74783 (_ BitVec 32) (_ BitVec 32) V!43721 V!43721 (_ BitVec 32) Int) ListLongMap!16461)

(assert (=> b!1155394 (= e!657206 (= lt!517929 (getCurrentListMapNoExtraKeys!4742 lt!517925 lt!517912 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!54585 () Bool)

(declare-fun call!54588 () ListLongMap!16461)

(assert (=> bm!54585 (= call!54588 (getCurrentListMapNoExtraKeys!4742 lt!517925 lt!517912 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155395 () Bool)

(declare-fun e!657204 () Bool)

(declare-fun tp_is_empty!28945 () Bool)

(assert (=> b!1155395 (= e!657204 tp_is_empty!28945)))

(declare-fun b!1155396 () Bool)

(declare-fun e!657214 () Bool)

(declare-fun e!657211 () Bool)

(assert (=> b!1155396 (= e!657214 e!657211)))

(declare-fun res!767520 () Bool)

(assert (=> b!1155396 (=> res!767520 e!657211)))

(assert (=> b!1155396 (= res!767520 (not (= (select (arr!36035 _keys!1208) from!1455) k0!934)))))

(declare-fun e!657213 () Bool)

(assert (=> b!1155396 e!657213))

(declare-fun c!114994 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1155396 (= c!114994 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun _values!996 () array!74783)

(declare-fun lt!517932 () Unit!37970)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!595 (array!74781 array!74783 (_ BitVec 32) (_ BitVec 32) V!43721 V!43721 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37970)

(assert (=> b!1155396 (= lt!517932 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!595 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155398 () Bool)

(declare-fun e!657203 () Bool)

(declare-fun e!657205 () Bool)

(assert (=> b!1155398 (= e!657203 (not e!657205))))

(declare-fun res!767514 () Bool)

(assert (=> b!1155398 (=> res!767514 e!657205)))

(assert (=> b!1155398 (= res!767514 (bvsgt from!1455 i!673))))

(assert (=> b!1155398 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!517933 () Unit!37970)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74781 (_ BitVec 64) (_ BitVec 32)) Unit!37970)

(assert (=> b!1155398 (= lt!517933 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!54586 () Bool)

(declare-fun call!54594 () Bool)

(declare-fun call!54587 () Bool)

(assert (=> bm!54586 (= call!54594 call!54587)))

(declare-fun lt!517917 () ListLongMap!16461)

(declare-fun c!114995 () Bool)

(declare-fun c!114991 () Bool)

(declare-fun bm!54587 () Bool)

(declare-fun call!54593 () Unit!37970)

(declare-fun addStillContains!896 (ListLongMap!16461 (_ BitVec 64) V!43721 (_ BitVec 64)) Unit!37970)

(assert (=> bm!54587 (= call!54593 (addStillContains!896 lt!517917 (ite (or c!114991 c!114995) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!114991 c!114995) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1155399 () Bool)

(declare-fun call!54591 () ListLongMap!16461)

(declare-fun -!1354 (ListLongMap!16461 (_ BitVec 64)) ListLongMap!16461)

(assert (=> b!1155399 (= e!657213 (= call!54588 (-!1354 call!54591 k0!934)))))

(declare-fun lt!517920 () ListLongMap!16461)

(declare-fun bm!54588 () Bool)

(declare-fun contains!6773 (ListLongMap!16461 (_ BitVec 64)) Bool)

(assert (=> bm!54588 (= call!54587 (contains!6773 (ite c!114991 lt!517920 call!54590) k0!934))))

(declare-fun b!1155400 () Bool)

(declare-fun res!767519 () Bool)

(declare-fun e!657208 () Bool)

(assert (=> b!1155400 (=> (not res!767519) (not e!657208))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74781 (_ BitVec 32)) Bool)

(assert (=> b!1155400 (= res!767519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1155401 () Bool)

(assert (=> b!1155401 (= e!657211 true)))

(assert (=> b!1155401 e!657206))

(declare-fun res!767526 () Bool)

(assert (=> b!1155401 (=> (not res!767526) (not e!657206))))

(assert (=> b!1155401 (= res!767526 (= lt!517929 lt!517917))))

(declare-fun lt!517927 () ListLongMap!16461)

(assert (=> b!1155401 (= lt!517929 (-!1354 lt!517927 k0!934))))

(declare-fun lt!517914 () V!43721)

(declare-fun +!3674 (ListLongMap!16461 tuple2!18484) ListLongMap!16461)

(assert (=> b!1155401 (= (-!1354 (+!3674 lt!517917 (tuple2!18485 (select (arr!36035 _keys!1208) from!1455) lt!517914)) (select (arr!36035 _keys!1208) from!1455)) lt!517917)))

(declare-fun lt!517931 () Unit!37970)

(declare-fun addThenRemoveForNewKeyIsSame!196 (ListLongMap!16461 (_ BitVec 64) V!43721) Unit!37970)

(assert (=> b!1155401 (= lt!517931 (addThenRemoveForNewKeyIsSame!196 lt!517917 (select (arr!36035 _keys!1208) from!1455) lt!517914))))

(declare-fun lt!517913 () V!43721)

(declare-fun get!18379 (ValueCell!13763 V!43721) V!43721)

(assert (=> b!1155401 (= lt!517914 (get!18379 (select (arr!36036 _values!996) from!1455) lt!517913))))

(declare-fun lt!517916 () Unit!37970)

(declare-fun e!657207 () Unit!37970)

(assert (=> b!1155401 (= lt!517916 e!657207)))

(declare-fun c!114993 () Bool)

(assert (=> b!1155401 (= c!114993 (contains!6773 lt!517917 k0!934))))

(assert (=> b!1155401 (= lt!517917 (getCurrentListMapNoExtraKeys!4742 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155402 () Bool)

(assert (=> b!1155402 (= e!657205 e!657214)))

(declare-fun res!767523 () Bool)

(assert (=> b!1155402 (=> res!767523 e!657214)))

(assert (=> b!1155402 (= res!767523 (not (= from!1455 i!673)))))

(declare-fun lt!517930 () ListLongMap!16461)

(assert (=> b!1155402 (= lt!517930 (getCurrentListMapNoExtraKeys!4742 lt!517925 lt!517912 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1155402 (= lt!517912 (array!74784 (store (arr!36036 _values!996) i!673 (ValueCellFull!13763 lt!517913)) (size!36573 _values!996)))))

(declare-fun dynLambda!2761 (Int (_ BitVec 64)) V!43721)

(assert (=> b!1155402 (= lt!517913 (dynLambda!2761 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1155402 (= lt!517927 (getCurrentListMapNoExtraKeys!4742 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1155403 () Bool)

(declare-fun Unit!37972 () Unit!37970)

(assert (=> b!1155403 (= e!657207 Unit!37972)))

(declare-fun b!1155404 () Bool)

(assert (=> b!1155404 (= e!657198 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!517915) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1155405 () Bool)

(declare-fun res!767522 () Bool)

(assert (=> b!1155405 (=> (not res!767522) (not e!657208))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1155405 (= res!767522 (validKeyInArray!0 k0!934))))

(declare-fun b!1155406 () Bool)

(declare-fun res!767515 () Bool)

(assert (=> b!1155406 (=> (not res!767515) (not e!657203))))

(declare-datatypes ((List!25230 0))(
  ( (Nil!25227) (Cons!25226 (h!26444 (_ BitVec 64)) (t!36629 List!25230)) )
))
(declare-fun arrayNoDuplicates!0 (array!74781 (_ BitVec 32) List!25230) Bool)

(assert (=> b!1155406 (= res!767515 (arrayNoDuplicates!0 lt!517925 #b00000000000000000000000000000000 Nil!25227))))

(declare-fun b!1155407 () Bool)

(declare-fun res!767518 () Bool)

(assert (=> b!1155407 (=> (not res!767518) (not e!657208))))

(assert (=> b!1155407 (= res!767518 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36572 _keys!1208))))))

(declare-fun b!1155408 () Bool)

(assert (=> b!1155408 (contains!6773 (+!3674 lt!517920 (tuple2!18485 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!517922 () Unit!37970)

(assert (=> b!1155408 (= lt!517922 (addStillContains!896 lt!517920 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1155408 call!54587))

(assert (=> b!1155408 (= lt!517920 call!54592)))

(declare-fun lt!517928 () Unit!37970)

(assert (=> b!1155408 (= lt!517928 call!54593)))

(declare-fun e!657200 () Unit!37970)

(assert (=> b!1155408 (= e!657200 lt!517922)))

(declare-fun b!1155409 () Bool)

(declare-fun res!767517 () Bool)

(assert (=> b!1155409 (=> (not res!767517) (not e!657208))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1155409 (= res!767517 (validMask!0 mask!1564))))

(declare-fun b!1155410 () Bool)

(declare-fun Unit!37973 () Unit!37970)

(assert (=> b!1155410 (= e!657207 Unit!37973)))

(assert (=> b!1155410 (= lt!517915 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1155410 (= c!114991 (and (not lt!517915) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!517926 () Unit!37970)

(assert (=> b!1155410 (= lt!517926 e!657200)))

(declare-fun lt!517919 () Unit!37970)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!489 (array!74781 array!74783 (_ BitVec 32) (_ BitVec 32) V!43721 V!43721 (_ BitVec 64) (_ BitVec 32) Int) Unit!37970)

(assert (=> b!1155410 (= lt!517919 (lemmaListMapContainsThenArrayContainsFrom!489 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114996 () Bool)

(assert (=> b!1155410 (= c!114996 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!767524 () Bool)

(assert (=> b!1155410 (= res!767524 e!657198)))

(assert (=> b!1155410 (=> (not res!767524) (not e!657212))))

(assert (=> b!1155410 e!657212))

(declare-fun lt!517924 () Unit!37970)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74781 (_ BitVec 32) (_ BitVec 32)) Unit!37970)

(assert (=> b!1155410 (= lt!517924 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1155410 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25227)))

(declare-fun lt!517923 () Unit!37970)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74781 (_ BitVec 64) (_ BitVec 32) List!25230) Unit!37970)

(assert (=> b!1155410 (= lt!517923 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25227))))

(assert (=> b!1155410 false))

(declare-fun b!1155411 () Bool)

(declare-fun res!767525 () Bool)

(assert (=> b!1155411 (=> (not res!767525) (not e!657208))))

(assert (=> b!1155411 (= res!767525 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25227))))

(declare-fun b!1155412 () Bool)

(assert (=> b!1155412 (= e!657213 (= call!54588 call!54591))))

(declare-fun b!1155413 () Bool)

(assert (=> b!1155413 call!54594))

(declare-fun lt!517921 () Unit!37970)

(declare-fun call!54589 () Unit!37970)

(assert (=> b!1155413 (= lt!517921 call!54589)))

(assert (=> b!1155413 (= e!657201 lt!517921)))

(declare-fun mapNonEmpty!45242 () Bool)

(declare-fun tp!85956 () Bool)

(declare-fun e!657210 () Bool)

(assert (=> mapNonEmpty!45242 (= mapRes!45242 (and tp!85956 e!657210))))

(declare-fun mapKey!45242 () (_ BitVec 32))

(declare-fun mapValue!45242 () ValueCell!13763)

(declare-fun mapRest!45242 () (Array (_ BitVec 32) ValueCell!13763))

(assert (=> mapNonEmpty!45242 (= (arr!36036 _values!996) (store mapRest!45242 mapKey!45242 mapValue!45242))))

(declare-fun b!1155414 () Bool)

(declare-fun Unit!37974 () Unit!37970)

(assert (=> b!1155414 (= e!657201 Unit!37974)))

(declare-fun bm!54589 () Bool)

(assert (=> bm!54589 (= call!54591 (getCurrentListMapNoExtraKeys!4742 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155415 () Bool)

(declare-fun res!767512 () Bool)

(assert (=> b!1155415 (=> (not res!767512) (not e!657208))))

(assert (=> b!1155415 (= res!767512 (= (select (arr!36035 _keys!1208) i!673) k0!934))))

(declare-fun b!1155416 () Bool)

(declare-fun lt!517918 () Unit!37970)

(assert (=> b!1155416 (= e!657209 lt!517918)))

(assert (=> b!1155416 (= lt!517918 call!54589)))

(assert (=> b!1155416 call!54594))

(declare-fun bm!54590 () Bool)

(assert (=> bm!54590 (= call!54589 call!54593)))

(declare-fun b!1155417 () Bool)

(assert (=> b!1155417 (= e!657210 tp_is_empty!28945)))

(declare-fun bm!54591 () Bool)

(assert (=> bm!54591 (= call!54592 (+!3674 lt!517917 (ite (or c!114991 c!114995) (tuple2!18485 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18485 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1155418 () Bool)

(declare-fun res!767521 () Bool)

(assert (=> b!1155418 (=> (not res!767521) (not e!657208))))

(assert (=> b!1155418 (= res!767521 (and (= (size!36573 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36572 _keys!1208) (size!36573 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!767513 () Bool)

(assert (=> start!99046 (=> (not res!767513) (not e!657208))))

(assert (=> start!99046 (= res!767513 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36572 _keys!1208))))))

(assert (=> start!99046 e!657208))

(assert (=> start!99046 tp_is_empty!28945))

(declare-fun array_inv!27640 (array!74781) Bool)

(assert (=> start!99046 (array_inv!27640 _keys!1208)))

(assert (=> start!99046 true))

(assert (=> start!99046 tp!85955))

(declare-fun e!657199 () Bool)

(declare-fun array_inv!27641 (array!74783) Bool)

(assert (=> start!99046 (and (array_inv!27641 _values!996) e!657199)))

(declare-fun b!1155397 () Bool)

(assert (=> b!1155397 (= e!657208 e!657203)))

(declare-fun res!767516 () Bool)

(assert (=> b!1155397 (=> (not res!767516) (not e!657203))))

(assert (=> b!1155397 (= res!767516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!517925 mask!1564))))

(assert (=> b!1155397 (= lt!517925 (array!74782 (store (arr!36035 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36572 _keys!1208)))))

(declare-fun b!1155419 () Bool)

(assert (=> b!1155419 (= e!657199 (and e!657204 mapRes!45242))))

(declare-fun condMapEmpty!45242 () Bool)

(declare-fun mapDefault!45242 () ValueCell!13763)

(assert (=> b!1155419 (= condMapEmpty!45242 (= (arr!36036 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13763)) mapDefault!45242)))))

(declare-fun b!1155420 () Bool)

(assert (=> b!1155420 (= c!114995 (and (not lt!517915) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1155420 (= e!657200 e!657209)))

(assert (= (and start!99046 res!767513) b!1155409))

(assert (= (and b!1155409 res!767517) b!1155418))

(assert (= (and b!1155418 res!767521) b!1155400))

(assert (= (and b!1155400 res!767519) b!1155411))

(assert (= (and b!1155411 res!767525) b!1155407))

(assert (= (and b!1155407 res!767518) b!1155405))

(assert (= (and b!1155405 res!767522) b!1155415))

(assert (= (and b!1155415 res!767512) b!1155397))

(assert (= (and b!1155397 res!767516) b!1155406))

(assert (= (and b!1155406 res!767515) b!1155398))

(assert (= (and b!1155398 (not res!767514)) b!1155402))

(assert (= (and b!1155402 (not res!767523)) b!1155396))

(assert (= (and b!1155396 c!114994) b!1155399))

(assert (= (and b!1155396 (not c!114994)) b!1155412))

(assert (= (or b!1155399 b!1155412) bm!54585))

(assert (= (or b!1155399 b!1155412) bm!54589))

(assert (= (and b!1155396 (not res!767520)) b!1155401))

(assert (= (and b!1155401 c!114993) b!1155410))

(assert (= (and b!1155401 (not c!114993)) b!1155403))

(assert (= (and b!1155410 c!114991) b!1155408))

(assert (= (and b!1155410 (not c!114991)) b!1155420))

(assert (= (and b!1155420 c!114995) b!1155416))

(assert (= (and b!1155420 (not c!114995)) b!1155391))

(assert (= (and b!1155391 c!114992) b!1155413))

(assert (= (and b!1155391 (not c!114992)) b!1155414))

(assert (= (or b!1155416 b!1155413) bm!54590))

(assert (= (or b!1155416 b!1155413) bm!54584))

(assert (= (or b!1155416 b!1155413) bm!54586))

(assert (= (or b!1155408 bm!54586) bm!54588))

(assert (= (or b!1155408 bm!54590) bm!54587))

(assert (= (or b!1155408 bm!54584) bm!54591))

(assert (= (and b!1155410 c!114996) b!1155392))

(assert (= (and b!1155410 (not c!114996)) b!1155404))

(assert (= (and b!1155410 res!767524) b!1155393))

(assert (= (and b!1155401 res!767526) b!1155394))

(assert (= (and b!1155419 condMapEmpty!45242) mapIsEmpty!45242))

(assert (= (and b!1155419 (not condMapEmpty!45242)) mapNonEmpty!45242))

(get-info :version)

(assert (= (and mapNonEmpty!45242 ((_ is ValueCellFull!13763) mapValue!45242)) b!1155417))

(assert (= (and b!1155419 ((_ is ValueCellFull!13763) mapDefault!45242)) b!1155395))

(assert (= start!99046 b!1155419))

(declare-fun b_lambda!19515 () Bool)

(assert (=> (not b_lambda!19515) (not b!1155402)))

(declare-fun t!36627 () Bool)

(declare-fun tb!9219 () Bool)

(assert (=> (and start!99046 (= defaultEntry!1004 defaultEntry!1004) t!36627) tb!9219))

(declare-fun result!19011 () Bool)

(assert (=> tb!9219 (= result!19011 tp_is_empty!28945)))

(assert (=> b!1155402 t!36627))

(declare-fun b_and!39683 () Bool)

(assert (= b_and!39681 (and (=> t!36627 result!19011) b_and!39683)))

(declare-fun m!1065433 () Bool)

(assert (=> b!1155396 m!1065433))

(declare-fun m!1065435 () Bool)

(assert (=> b!1155396 m!1065435))

(declare-fun m!1065437 () Bool)

(assert (=> b!1155401 m!1065437))

(assert (=> b!1155401 m!1065433))

(declare-fun m!1065439 () Bool)

(assert (=> b!1155401 m!1065439))

(declare-fun m!1065441 () Bool)

(assert (=> b!1155401 m!1065441))

(declare-fun m!1065443 () Bool)

(assert (=> b!1155401 m!1065443))

(declare-fun m!1065445 () Bool)

(assert (=> b!1155401 m!1065445))

(assert (=> b!1155401 m!1065441))

(assert (=> b!1155401 m!1065433))

(declare-fun m!1065447 () Bool)

(assert (=> b!1155401 m!1065447))

(declare-fun m!1065449 () Bool)

(assert (=> b!1155401 m!1065449))

(assert (=> b!1155401 m!1065433))

(assert (=> b!1155401 m!1065443))

(declare-fun m!1065451 () Bool)

(assert (=> b!1155401 m!1065451))

(declare-fun m!1065453 () Bool)

(assert (=> b!1155411 m!1065453))

(declare-fun m!1065455 () Bool)

(assert (=> b!1155397 m!1065455))

(declare-fun m!1065457 () Bool)

(assert (=> b!1155397 m!1065457))

(declare-fun m!1065459 () Bool)

(assert (=> b!1155415 m!1065459))

(declare-fun m!1065461 () Bool)

(assert (=> start!99046 m!1065461))

(declare-fun m!1065463 () Bool)

(assert (=> start!99046 m!1065463))

(declare-fun m!1065465 () Bool)

(assert (=> b!1155405 m!1065465))

(declare-fun m!1065467 () Bool)

(assert (=> b!1155393 m!1065467))

(declare-fun m!1065469 () Bool)

(assert (=> b!1155399 m!1065469))

(declare-fun m!1065471 () Bool)

(assert (=> mapNonEmpty!45242 m!1065471))

(declare-fun m!1065473 () Bool)

(assert (=> b!1155400 m!1065473))

(assert (=> bm!54589 m!1065437))

(declare-fun m!1065475 () Bool)

(assert (=> b!1155408 m!1065475))

(assert (=> b!1155408 m!1065475))

(declare-fun m!1065477 () Bool)

(assert (=> b!1155408 m!1065477))

(declare-fun m!1065479 () Bool)

(assert (=> b!1155408 m!1065479))

(declare-fun m!1065481 () Bool)

(assert (=> b!1155398 m!1065481))

(declare-fun m!1065483 () Bool)

(assert (=> b!1155398 m!1065483))

(declare-fun m!1065485 () Bool)

(assert (=> bm!54588 m!1065485))

(declare-fun m!1065487 () Bool)

(assert (=> b!1155410 m!1065487))

(declare-fun m!1065489 () Bool)

(assert (=> b!1155410 m!1065489))

(declare-fun m!1065491 () Bool)

(assert (=> b!1155410 m!1065491))

(declare-fun m!1065493 () Bool)

(assert (=> b!1155410 m!1065493))

(declare-fun m!1065495 () Bool)

(assert (=> bm!54591 m!1065495))

(declare-fun m!1065497 () Bool)

(assert (=> b!1155409 m!1065497))

(declare-fun m!1065499 () Bool)

(assert (=> bm!54585 m!1065499))

(declare-fun m!1065501 () Bool)

(assert (=> b!1155406 m!1065501))

(declare-fun m!1065503 () Bool)

(assert (=> b!1155402 m!1065503))

(declare-fun m!1065505 () Bool)

(assert (=> b!1155402 m!1065505))

(declare-fun m!1065507 () Bool)

(assert (=> b!1155402 m!1065507))

(declare-fun m!1065509 () Bool)

(assert (=> b!1155402 m!1065509))

(assert (=> b!1155394 m!1065499))

(declare-fun m!1065511 () Bool)

(assert (=> bm!54587 m!1065511))

(assert (=> b!1155392 m!1065467))

(check-sat (not b!1155408) (not b!1155401) (not b!1155392) (not b!1155393) (not bm!54588) (not b!1155394) (not b!1155411) (not mapNonEmpty!45242) (not b_lambda!19515) (not start!99046) (not b_next!24415) (not b!1155409) tp_is_empty!28945 (not bm!54589) (not b!1155399) (not bm!54591) (not b!1155396) (not b!1155402) (not b!1155398) (not b!1155410) (not bm!54585) (not b!1155406) (not b!1155405) b_and!39683 (not b!1155397) (not b!1155400) (not bm!54587))
(check-sat b_and!39683 (not b_next!24415))
