; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98782 () Bool)

(assert start!98782)

(declare-fun b_free!24387 () Bool)

(declare-fun b_next!24387 () Bool)

(assert (=> start!98782 (= b_free!24387 (not b_next!24387))))

(declare-fun tp!85871 () Bool)

(declare-fun b_and!39623 () Bool)

(assert (=> start!98782 (= tp!85871 b_and!39623)))

(declare-fun b!1152814 () Bool)

(declare-fun res!766376 () Bool)

(declare-fun e!655658 () Bool)

(assert (=> b!1152814 (=> (not res!766376) (not e!655658))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1152814 (= res!766376 (validMask!0 mask!1564))))

(declare-fun b!1152815 () Bool)

(declare-fun e!655661 () Bool)

(declare-datatypes ((V!43683 0))(
  ( (V!43684 (val!14515 Int)) )
))
(declare-datatypes ((tuple2!18438 0))(
  ( (tuple2!18439 (_1!9230 (_ BitVec 64)) (_2!9230 V!43683)) )
))
(declare-datatypes ((List!25185 0))(
  ( (Nil!25182) (Cons!25181 (h!26390 tuple2!18438) (t!36564 List!25185)) )
))
(declare-datatypes ((ListLongMap!16407 0))(
  ( (ListLongMap!16408 (toList!8219 List!25185)) )
))
(declare-fun call!54188 () ListLongMap!16407)

(declare-fun call!54186 () ListLongMap!16407)

(assert (=> b!1152815 (= e!655661 (= call!54188 call!54186))))

(declare-fun zeroValue!944 () V!43683)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!54183 () Bool)

(declare-datatypes ((ValueCell!13749 0))(
  ( (ValueCellFull!13749 (v!17152 V!43683)) (EmptyCell!13749) )
))
(declare-datatypes ((array!74681 0))(
  ( (array!74682 (arr!35991 (Array (_ BitVec 32) ValueCell!13749)) (size!36527 (_ BitVec 32))) )
))
(declare-fun lt!516507 () array!74681)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74683 0))(
  ( (array!74684 (arr!35992 (Array (_ BitVec 32) (_ BitVec 64))) (size!36528 (_ BitVec 32))) )
))
(declare-fun lt!516516 () array!74683)

(declare-fun minValue!944 () V!43683)

(declare-fun getCurrentListMapNoExtraKeys!4690 (array!74683 array!74681 (_ BitVec 32) (_ BitVec 32) V!43683 V!43683 (_ BitVec 32) Int) ListLongMap!16407)

(assert (=> bm!54183 (= call!54188 (getCurrentListMapNoExtraKeys!4690 lt!516516 lt!516507 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152816 () Bool)

(declare-fun e!655667 () Bool)

(declare-fun e!655654 () Bool)

(assert (=> b!1152816 (= e!655667 (not e!655654))))

(declare-fun res!766387 () Bool)

(assert (=> b!1152816 (=> res!766387 e!655654)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1152816 (= res!766387 (bvsgt from!1455 i!673))))

(declare-fun _keys!1208 () array!74683)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!74683 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1152816 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37937 0))(
  ( (Unit!37938) )
))
(declare-fun lt!516506 () Unit!37937)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74683 (_ BitVec 64) (_ BitVec 32)) Unit!37937)

(assert (=> b!1152816 (= lt!516506 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1152817 () Bool)

(assert (=> b!1152817 (= e!655658 e!655667)))

(declare-fun res!766375 () Bool)

(assert (=> b!1152817 (=> (not res!766375) (not e!655667))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74683 (_ BitVec 32)) Bool)

(assert (=> b!1152817 (= res!766375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!516516 mask!1564))))

(assert (=> b!1152817 (= lt!516516 (array!74684 (store (arr!35992 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36528 _keys!1208)))))

(declare-fun b!1152818 () Bool)

(declare-fun e!655655 () Bool)

(declare-fun tp_is_empty!28917 () Bool)

(assert (=> b!1152818 (= e!655655 tp_is_empty!28917)))

(declare-fun b!1152819 () Bool)

(declare-fun res!766386 () Bool)

(assert (=> b!1152819 (=> (not res!766386) (not e!655658))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1152819 (= res!766386 (validKeyInArray!0 k0!934))))

(declare-fun b!1152820 () Bool)

(declare-fun call!54191 () ListLongMap!16407)

(declare-fun contains!6737 (ListLongMap!16407 (_ BitVec 64)) Bool)

(assert (=> b!1152820 (contains!6737 call!54191 k0!934)))

(declare-fun lt!516512 () Unit!37937)

(declare-fun lt!516513 () ListLongMap!16407)

(declare-fun addStillContains!883 (ListLongMap!16407 (_ BitVec 64) V!43683 (_ BitVec 64)) Unit!37937)

(assert (=> b!1152820 (= lt!516512 (addStillContains!883 lt!516513 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!54193 () Bool)

(assert (=> b!1152820 call!54193))

(declare-fun lt!516514 () ListLongMap!16407)

(declare-fun +!3636 (ListLongMap!16407 tuple2!18438) ListLongMap!16407)

(assert (=> b!1152820 (= lt!516513 (+!3636 lt!516514 (tuple2!18439 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!516523 () Unit!37937)

(declare-fun call!54192 () Unit!37937)

(assert (=> b!1152820 (= lt!516523 call!54192)))

(declare-fun e!655665 () Unit!37937)

(assert (=> b!1152820 (= e!655665 lt!516512)))

(declare-fun b!1152821 () Bool)

(declare-fun e!655666 () Bool)

(assert (=> b!1152821 (= e!655654 e!655666)))

(declare-fun res!766388 () Bool)

(assert (=> b!1152821 (=> res!766388 e!655666)))

(assert (=> b!1152821 (= res!766388 (not (= from!1455 i!673)))))

(declare-fun lt!516509 () ListLongMap!16407)

(assert (=> b!1152821 (= lt!516509 (getCurrentListMapNoExtraKeys!4690 lt!516516 lt!516507 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!516521 () V!43683)

(declare-fun _values!996 () array!74681)

(assert (=> b!1152821 (= lt!516507 (array!74682 (store (arr!35991 _values!996) i!673 (ValueCellFull!13749 lt!516521)) (size!36527 _values!996)))))

(declare-fun dynLambda!2709 (Int (_ BitVec 64)) V!43683)

(assert (=> b!1152821 (= lt!516521 (dynLambda!2709 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!516525 () ListLongMap!16407)

(assert (=> b!1152821 (= lt!516525 (getCurrentListMapNoExtraKeys!4690 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1152822 () Bool)

(declare-fun res!766381 () Bool)

(assert (=> b!1152822 (=> (not res!766381) (not e!655658))))

(assert (=> b!1152822 (= res!766381 (and (= (size!36527 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36528 _keys!1208) (size!36527 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1152823 () Bool)

(declare-fun e!655668 () Bool)

(assert (=> b!1152823 (= e!655668 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun res!766384 () Bool)

(assert (=> start!98782 (=> (not res!766384) (not e!655658))))

(assert (=> start!98782 (= res!766384 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36528 _keys!1208))))))

(assert (=> start!98782 e!655658))

(assert (=> start!98782 tp_is_empty!28917))

(declare-fun array_inv!27560 (array!74683) Bool)

(assert (=> start!98782 (array_inv!27560 _keys!1208)))

(assert (=> start!98782 true))

(assert (=> start!98782 tp!85871))

(declare-fun e!655652 () Bool)

(declare-fun array_inv!27561 (array!74681) Bool)

(assert (=> start!98782 (and (array_inv!27561 _values!996) e!655652)))

(declare-fun b!1152824 () Bool)

(declare-fun res!766374 () Bool)

(assert (=> b!1152824 (=> (not res!766374) (not e!655658))))

(declare-datatypes ((List!25186 0))(
  ( (Nil!25183) (Cons!25182 (h!26391 (_ BitVec 64)) (t!36565 List!25186)) )
))
(declare-fun arrayNoDuplicates!0 (array!74683 (_ BitVec 32) List!25186) Bool)

(assert (=> b!1152824 (= res!766374 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25183))))

(declare-fun b!1152825 () Bool)

(declare-fun e!655657 () Bool)

(assert (=> b!1152825 (= e!655657 true)))

(declare-fun e!655662 () Bool)

(assert (=> b!1152825 e!655662))

(declare-fun res!766382 () Bool)

(assert (=> b!1152825 (=> (not res!766382) (not e!655662))))

(declare-fun lt!516510 () ListLongMap!16407)

(assert (=> b!1152825 (= res!766382 (= lt!516510 lt!516514))))

(declare-fun -!1347 (ListLongMap!16407 (_ BitVec 64)) ListLongMap!16407)

(assert (=> b!1152825 (= lt!516510 (-!1347 lt!516525 k0!934))))

(declare-fun lt!516515 () V!43683)

(assert (=> b!1152825 (= (-!1347 (+!3636 lt!516514 (tuple2!18439 (select (arr!35992 _keys!1208) from!1455) lt!516515)) (select (arr!35992 _keys!1208) from!1455)) lt!516514)))

(declare-fun lt!516518 () Unit!37937)

(declare-fun addThenRemoveForNewKeyIsSame!188 (ListLongMap!16407 (_ BitVec 64) V!43683) Unit!37937)

(assert (=> b!1152825 (= lt!516518 (addThenRemoveForNewKeyIsSame!188 lt!516514 (select (arr!35992 _keys!1208) from!1455) lt!516515))))

(declare-fun get!18330 (ValueCell!13749 V!43683) V!43683)

(assert (=> b!1152825 (= lt!516515 (get!18330 (select (arr!35991 _values!996) from!1455) lt!516521))))

(declare-fun lt!516511 () Unit!37937)

(declare-fun e!655660 () Unit!37937)

(assert (=> b!1152825 (= lt!516511 e!655660)))

(declare-fun c!114344 () Bool)

(assert (=> b!1152825 (= c!114344 (contains!6737 lt!516514 k0!934))))

(assert (=> b!1152825 (= lt!516514 (getCurrentListMapNoExtraKeys!4690 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152826 () Bool)

(declare-fun e!655653 () Unit!37937)

(declare-fun lt!516517 () Unit!37937)

(assert (=> b!1152826 (= e!655653 lt!516517)))

(declare-fun call!54190 () Unit!37937)

(assert (=> b!1152826 (= lt!516517 call!54190)))

(declare-fun call!54187 () Bool)

(assert (=> b!1152826 call!54187))

(declare-fun bm!54184 () Bool)

(declare-fun call!54189 () ListLongMap!16407)

(assert (=> bm!54184 (= call!54189 call!54191)))

(declare-fun b!1152827 () Bool)

(assert (=> b!1152827 (= e!655662 (= lt!516510 (getCurrentListMapNoExtraKeys!4690 lt!516516 lt!516507 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun mapNonEmpty!45200 () Bool)

(declare-fun mapRes!45200 () Bool)

(declare-fun tp!85872 () Bool)

(assert (=> mapNonEmpty!45200 (= mapRes!45200 (and tp!85872 e!655655))))

(declare-fun mapRest!45200 () (Array (_ BitVec 32) ValueCell!13749))

(declare-fun mapValue!45200 () ValueCell!13749)

(declare-fun mapKey!45200 () (_ BitVec 32))

(assert (=> mapNonEmpty!45200 (= (arr!35991 _values!996) (store mapRest!45200 mapKey!45200 mapValue!45200))))

(declare-fun bm!54185 () Bool)

(declare-fun c!114341 () Bool)

(declare-fun c!114343 () Bool)

(assert (=> bm!54185 (= call!54192 (addStillContains!883 lt!516514 (ite (or c!114343 c!114341) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!114343 c!114341) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1152828 () Bool)

(assert (=> b!1152828 (= e!655666 e!655657)))

(declare-fun res!766378 () Bool)

(assert (=> b!1152828 (=> res!766378 e!655657)))

(assert (=> b!1152828 (= res!766378 (not (= (select (arr!35992 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1152828 e!655661))

(declare-fun c!114342 () Bool)

(assert (=> b!1152828 (= c!114342 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!516522 () Unit!37937)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!583 (array!74683 array!74681 (_ BitVec 32) (_ BitVec 32) V!43683 V!43683 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37937)

(assert (=> b!1152828 (= lt!516522 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!583 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152829 () Bool)

(declare-fun Unit!37939 () Unit!37937)

(assert (=> b!1152829 (= e!655660 Unit!37939)))

(declare-fun lt!516520 () Bool)

(assert (=> b!1152829 (= lt!516520 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1152829 (= c!114343 (and (not lt!516520) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!516508 () Unit!37937)

(assert (=> b!1152829 (= lt!516508 e!655665)))

(declare-fun lt!516524 () Unit!37937)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!476 (array!74683 array!74681 (_ BitVec 32) (_ BitVec 32) V!43683 V!43683 (_ BitVec 64) (_ BitVec 32) Int) Unit!37937)

(assert (=> b!1152829 (= lt!516524 (lemmaListMapContainsThenArrayContainsFrom!476 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114346 () Bool)

(assert (=> b!1152829 (= c!114346 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!766379 () Bool)

(declare-fun e!655656 () Bool)

(assert (=> b!1152829 (= res!766379 e!655656)))

(assert (=> b!1152829 (=> (not res!766379) (not e!655668))))

(assert (=> b!1152829 e!655668))

(declare-fun lt!516519 () Unit!37937)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74683 (_ BitVec 32) (_ BitVec 32)) Unit!37937)

(assert (=> b!1152829 (= lt!516519 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1152829 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25183)))

(declare-fun lt!516504 () Unit!37937)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74683 (_ BitVec 64) (_ BitVec 32) List!25186) Unit!37937)

(assert (=> b!1152829 (= lt!516504 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25183))))

(assert (=> b!1152829 false))

(declare-fun b!1152830 () Bool)

(assert (=> b!1152830 (= e!655656 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!516520) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1152831 () Bool)

(declare-fun Unit!37940 () Unit!37937)

(assert (=> b!1152831 (= e!655660 Unit!37940)))

(declare-fun bm!54186 () Bool)

(assert (=> bm!54186 (= call!54191 (+!3636 (ite c!114343 lt!516513 lt!516514) (ite c!114343 (tuple2!18439 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!114341 (tuple2!18439 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18439 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1152832 () Bool)

(assert (=> b!1152832 (= e!655656 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1152833 () Bool)

(assert (=> b!1152833 (= e!655661 (= call!54188 (-!1347 call!54186 k0!934)))))

(declare-fun b!1152834 () Bool)

(declare-fun res!766380 () Bool)

(assert (=> b!1152834 (=> (not res!766380) (not e!655658))))

(assert (=> b!1152834 (= res!766380 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36528 _keys!1208))))))

(declare-fun bm!54187 () Bool)

(assert (=> bm!54187 (= call!54193 (contains!6737 (ite c!114343 lt!516513 call!54189) k0!934))))

(declare-fun bm!54188 () Bool)

(assert (=> bm!54188 (= call!54186 (getCurrentListMapNoExtraKeys!4690 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152835 () Bool)

(declare-fun e!655663 () Bool)

(assert (=> b!1152835 (= e!655652 (and e!655663 mapRes!45200))))

(declare-fun condMapEmpty!45200 () Bool)

(declare-fun mapDefault!45200 () ValueCell!13749)

(assert (=> b!1152835 (= condMapEmpty!45200 (= (arr!35991 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13749)) mapDefault!45200)))))

(declare-fun b!1152836 () Bool)

(assert (=> b!1152836 (= e!655663 tp_is_empty!28917)))

(declare-fun b!1152837 () Bool)

(declare-fun res!766383 () Bool)

(assert (=> b!1152837 (=> (not res!766383) (not e!655658))))

(assert (=> b!1152837 (= res!766383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!54189 () Bool)

(assert (=> bm!54189 (= call!54187 call!54193)))

(declare-fun mapIsEmpty!45200 () Bool)

(assert (=> mapIsEmpty!45200 mapRes!45200))

(declare-fun b!1152838 () Bool)

(declare-fun e!655664 () Unit!37937)

(declare-fun Unit!37941 () Unit!37937)

(assert (=> b!1152838 (= e!655664 Unit!37941)))

(declare-fun b!1152839 () Bool)

(assert (=> b!1152839 (= e!655653 e!655664)))

(declare-fun c!114345 () Bool)

(assert (=> b!1152839 (= c!114345 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!516520))))

(declare-fun b!1152840 () Bool)

(declare-fun res!766385 () Bool)

(assert (=> b!1152840 (=> (not res!766385) (not e!655658))))

(assert (=> b!1152840 (= res!766385 (= (select (arr!35992 _keys!1208) i!673) k0!934))))

(declare-fun b!1152841 () Bool)

(assert (=> b!1152841 call!54187))

(declare-fun lt!516505 () Unit!37937)

(assert (=> b!1152841 (= lt!516505 call!54190)))

(assert (=> b!1152841 (= e!655664 lt!516505)))

(declare-fun bm!54190 () Bool)

(assert (=> bm!54190 (= call!54190 call!54192)))

(declare-fun b!1152842 () Bool)

(assert (=> b!1152842 (= c!114341 (and (not lt!516520) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1152842 (= e!655665 e!655653)))

(declare-fun b!1152843 () Bool)

(declare-fun res!766377 () Bool)

(assert (=> b!1152843 (=> (not res!766377) (not e!655667))))

(assert (=> b!1152843 (= res!766377 (arrayNoDuplicates!0 lt!516516 #b00000000000000000000000000000000 Nil!25183))))

(assert (= (and start!98782 res!766384) b!1152814))

(assert (= (and b!1152814 res!766376) b!1152822))

(assert (= (and b!1152822 res!766381) b!1152837))

(assert (= (and b!1152837 res!766383) b!1152824))

(assert (= (and b!1152824 res!766374) b!1152834))

(assert (= (and b!1152834 res!766380) b!1152819))

(assert (= (and b!1152819 res!766386) b!1152840))

(assert (= (and b!1152840 res!766385) b!1152817))

(assert (= (and b!1152817 res!766375) b!1152843))

(assert (= (and b!1152843 res!766377) b!1152816))

(assert (= (and b!1152816 (not res!766387)) b!1152821))

(assert (= (and b!1152821 (not res!766388)) b!1152828))

(assert (= (and b!1152828 c!114342) b!1152833))

(assert (= (and b!1152828 (not c!114342)) b!1152815))

(assert (= (or b!1152833 b!1152815) bm!54183))

(assert (= (or b!1152833 b!1152815) bm!54188))

(assert (= (and b!1152828 (not res!766378)) b!1152825))

(assert (= (and b!1152825 c!114344) b!1152829))

(assert (= (and b!1152825 (not c!114344)) b!1152831))

(assert (= (and b!1152829 c!114343) b!1152820))

(assert (= (and b!1152829 (not c!114343)) b!1152842))

(assert (= (and b!1152842 c!114341) b!1152826))

(assert (= (and b!1152842 (not c!114341)) b!1152839))

(assert (= (and b!1152839 c!114345) b!1152841))

(assert (= (and b!1152839 (not c!114345)) b!1152838))

(assert (= (or b!1152826 b!1152841) bm!54190))

(assert (= (or b!1152826 b!1152841) bm!54184))

(assert (= (or b!1152826 b!1152841) bm!54189))

(assert (= (or b!1152820 bm!54189) bm!54187))

(assert (= (or b!1152820 bm!54190) bm!54185))

(assert (= (or b!1152820 bm!54184) bm!54186))

(assert (= (and b!1152829 c!114346) b!1152832))

(assert (= (and b!1152829 (not c!114346)) b!1152830))

(assert (= (and b!1152829 res!766379) b!1152823))

(assert (= (and b!1152825 res!766382) b!1152827))

(assert (= (and b!1152835 condMapEmpty!45200) mapIsEmpty!45200))

(assert (= (and b!1152835 (not condMapEmpty!45200)) mapNonEmpty!45200))

(get-info :version)

(assert (= (and mapNonEmpty!45200 ((_ is ValueCellFull!13749) mapValue!45200)) b!1152818))

(assert (= (and b!1152835 ((_ is ValueCellFull!13749) mapDefault!45200)) b!1152836))

(assert (= start!98782 b!1152835))

(declare-fun b_lambda!19493 () Bool)

(assert (=> (not b_lambda!19493) (not b!1152821)))

(declare-fun t!36563 () Bool)

(declare-fun tb!9199 () Bool)

(assert (=> (and start!98782 (= defaultEntry!1004 defaultEntry!1004) t!36563) tb!9199))

(declare-fun result!18963 () Bool)

(assert (=> tb!9199 (= result!18963 tp_is_empty!28917)))

(assert (=> b!1152821 t!36563))

(declare-fun b_and!39625 () Bool)

(assert (= b_and!39623 (and (=> t!36563 result!18963) b_and!39625)))

(declare-fun m!1062745 () Bool)

(assert (=> b!1152827 m!1062745))

(declare-fun m!1062747 () Bool)

(assert (=> b!1152825 m!1062747))

(declare-fun m!1062749 () Bool)

(assert (=> b!1152825 m!1062749))

(declare-fun m!1062751 () Bool)

(assert (=> b!1152825 m!1062751))

(declare-fun m!1062753 () Bool)

(assert (=> b!1152825 m!1062753))

(assert (=> b!1152825 m!1062753))

(declare-fun m!1062755 () Bool)

(assert (=> b!1152825 m!1062755))

(declare-fun m!1062757 () Bool)

(assert (=> b!1152825 m!1062757))

(declare-fun m!1062759 () Bool)

(assert (=> b!1152825 m!1062759))

(assert (=> b!1152825 m!1062749))

(declare-fun m!1062761 () Bool)

(assert (=> b!1152825 m!1062761))

(assert (=> b!1152825 m!1062759))

(declare-fun m!1062763 () Bool)

(assert (=> b!1152825 m!1062763))

(assert (=> b!1152825 m!1062749))

(declare-fun m!1062765 () Bool)

(assert (=> b!1152820 m!1062765))

(declare-fun m!1062767 () Bool)

(assert (=> b!1152820 m!1062767))

(declare-fun m!1062769 () Bool)

(assert (=> b!1152820 m!1062769))

(assert (=> b!1152828 m!1062749))

(declare-fun m!1062771 () Bool)

(assert (=> b!1152828 m!1062771))

(declare-fun m!1062773 () Bool)

(assert (=> b!1152823 m!1062773))

(declare-fun m!1062775 () Bool)

(assert (=> bm!54186 m!1062775))

(declare-fun m!1062777 () Bool)

(assert (=> b!1152840 m!1062777))

(declare-fun m!1062779 () Bool)

(assert (=> b!1152819 m!1062779))

(declare-fun m!1062781 () Bool)

(assert (=> bm!54185 m!1062781))

(assert (=> bm!54183 m!1062745))

(declare-fun m!1062783 () Bool)

(assert (=> b!1152816 m!1062783))

(declare-fun m!1062785 () Bool)

(assert (=> b!1152816 m!1062785))

(declare-fun m!1062787 () Bool)

(assert (=> b!1152814 m!1062787))

(declare-fun m!1062789 () Bool)

(assert (=> bm!54187 m!1062789))

(assert (=> b!1152832 m!1062773))

(declare-fun m!1062791 () Bool)

(assert (=> b!1152821 m!1062791))

(declare-fun m!1062793 () Bool)

(assert (=> b!1152821 m!1062793))

(declare-fun m!1062795 () Bool)

(assert (=> b!1152821 m!1062795))

(declare-fun m!1062797 () Bool)

(assert (=> b!1152821 m!1062797))

(declare-fun m!1062799 () Bool)

(assert (=> b!1152817 m!1062799))

(declare-fun m!1062801 () Bool)

(assert (=> b!1152817 m!1062801))

(declare-fun m!1062803 () Bool)

(assert (=> b!1152833 m!1062803))

(declare-fun m!1062805 () Bool)

(assert (=> b!1152837 m!1062805))

(assert (=> bm!54188 m!1062747))

(declare-fun m!1062807 () Bool)

(assert (=> start!98782 m!1062807))

(declare-fun m!1062809 () Bool)

(assert (=> start!98782 m!1062809))

(declare-fun m!1062811 () Bool)

(assert (=> b!1152824 m!1062811))

(declare-fun m!1062813 () Bool)

(assert (=> b!1152843 m!1062813))

(declare-fun m!1062815 () Bool)

(assert (=> b!1152829 m!1062815))

(declare-fun m!1062817 () Bool)

(assert (=> b!1152829 m!1062817))

(declare-fun m!1062819 () Bool)

(assert (=> b!1152829 m!1062819))

(declare-fun m!1062821 () Bool)

(assert (=> b!1152829 m!1062821))

(declare-fun m!1062823 () Bool)

(assert (=> mapNonEmpty!45200 m!1062823))

(check-sat (not b!1152843) (not b!1152837) (not b!1152825) (not bm!54187) (not bm!54185) (not bm!54188) (not b!1152814) (not b!1152821) b_and!39625 (not bm!54186) (not b!1152832) (not b!1152833) (not b!1152816) (not b_next!24387) tp_is_empty!28917 (not bm!54183) (not mapNonEmpty!45200) (not b!1152820) (not b_lambda!19493) (not b!1152817) (not b!1152827) (not b!1152829) (not b!1152824) (not b!1152828) (not b!1152823) (not start!98782) (not b!1152819))
(check-sat b_and!39625 (not b_next!24387))
