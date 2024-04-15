; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98666 () Bool)

(assert start!98666)

(declare-fun b_free!24277 () Bool)

(declare-fun b_next!24277 () Bool)

(assert (=> start!98666 (= b_free!24277 (not b_next!24277))))

(declare-fun tp!85542 () Bool)

(declare-fun b_and!39381 () Bool)

(assert (=> start!98666 (= tp!85542 b_and!39381)))

(declare-fun b!1147630 () Bool)

(declare-datatypes ((Unit!37555 0))(
  ( (Unit!37556) )
))
(declare-fun e!652778 () Unit!37555)

(declare-fun e!652781 () Unit!37555)

(assert (=> b!1147630 (= e!652778 e!652781)))

(declare-fun c!113328 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!512730 () Bool)

(assert (=> b!1147630 (= c!113328 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!512730))))

(declare-fun b!1147632 () Bool)

(declare-fun e!652769 () Unit!37555)

(declare-fun Unit!37557 () Unit!37555)

(assert (=> b!1147632 (= e!652769 Unit!37557)))

(assert (=> b!1147632 (= lt!512730 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!113327 () Bool)

(assert (=> b!1147632 (= c!113327 (and (not lt!512730) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!512729 () Unit!37555)

(declare-fun e!652773 () Unit!37555)

(assert (=> b!1147632 (= lt!512729 e!652773)))

(declare-datatypes ((V!43537 0))(
  ( (V!43538 (val!14460 Int)) )
))
(declare-fun zeroValue!944 () V!43537)

(declare-datatypes ((array!74384 0))(
  ( (array!74385 (arr!35843 (Array (_ BitVec 32) (_ BitVec 64))) (size!36381 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74384)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!512735 () Unit!37555)

(declare-datatypes ((ValueCell!13694 0))(
  ( (ValueCellFull!13694 (v!17096 V!43537)) (EmptyCell!13694) )
))
(declare-datatypes ((array!74386 0))(
  ( (array!74387 (arr!35844 (Array (_ BitVec 32) ValueCell!13694)) (size!36382 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74386)

(declare-fun minValue!944 () V!43537)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!432 (array!74384 array!74386 (_ BitVec 32) (_ BitVec 32) V!43537 V!43537 (_ BitVec 64) (_ BitVec 32) Int) Unit!37555)

(assert (=> b!1147632 (= lt!512735 (lemmaListMapContainsThenArrayContainsFrom!432 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113330 () Bool)

(assert (=> b!1147632 (= c!113330 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!763833 () Bool)

(declare-fun e!652784 () Bool)

(assert (=> b!1147632 (= res!763833 e!652784)))

(declare-fun e!652772 () Bool)

(assert (=> b!1147632 (=> (not res!763833) (not e!652772))))

(assert (=> b!1147632 e!652772))

(declare-fun lt!512727 () Unit!37555)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74384 (_ BitVec 32) (_ BitVec 32)) Unit!37555)

(assert (=> b!1147632 (= lt!512727 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25151 0))(
  ( (Nil!25148) (Cons!25147 (h!26356 (_ BitVec 64)) (t!36411 List!25151)) )
))
(declare-fun arrayNoDuplicates!0 (array!74384 (_ BitVec 32) List!25151) Bool)

(assert (=> b!1147632 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25148)))

(declare-fun lt!512728 () Unit!37555)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74384 (_ BitVec 64) (_ BitVec 32) List!25151) Unit!37555)

(assert (=> b!1147632 (= lt!512728 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25148))))

(assert (=> b!1147632 false))

(declare-fun b!1147633 () Bool)

(assert (=> b!1147633 (= e!652784 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!512730) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1147634 () Bool)

(declare-fun res!763846 () Bool)

(declare-fun e!652771 () Bool)

(assert (=> b!1147634 (=> (not res!763846) (not e!652771))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1147634 (= res!763846 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36381 _keys!1208))))))

(declare-fun b!1147635 () Bool)

(declare-fun res!763841 () Bool)

(assert (=> b!1147635 (=> (not res!763841) (not e!652771))))

(assert (=> b!1147635 (= res!763841 (and (= (size!36382 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36381 _keys!1208) (size!36382 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!52840 () Bool)

(declare-fun call!52845 () Unit!37555)

(declare-fun call!52849 () Unit!37555)

(assert (=> bm!52840 (= call!52845 call!52849)))

(declare-fun b!1147636 () Bool)

(declare-fun res!763843 () Bool)

(assert (=> b!1147636 (=> (not res!763843) (not e!652771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1147636 (= res!763843 (validMask!0 mask!1564))))

(declare-fun b!1147637 () Bool)

(declare-fun res!763845 () Bool)

(assert (=> b!1147637 (=> (not res!763845) (not e!652771))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1147637 (= res!763845 (validKeyInArray!0 k0!934))))

(declare-fun bm!52841 () Bool)

(declare-datatypes ((tuple2!18414 0))(
  ( (tuple2!18415 (_1!9218 (_ BitVec 64)) (_2!9218 V!43537)) )
))
(declare-datatypes ((List!25152 0))(
  ( (Nil!25149) (Cons!25148 (h!26357 tuple2!18414) (t!36412 List!25152)) )
))
(declare-datatypes ((ListLongMap!16383 0))(
  ( (ListLongMap!16384 (toList!8207 List!25152)) )
))
(declare-fun call!52844 () ListLongMap!16383)

(declare-fun call!52848 () ListLongMap!16383)

(assert (=> bm!52841 (= call!52844 call!52848)))

(declare-fun b!1147638 () Bool)

(declare-fun e!652776 () Bool)

(declare-fun call!52850 () ListLongMap!16383)

(declare-fun call!52847 () ListLongMap!16383)

(assert (=> b!1147638 (= e!652776 (= call!52850 call!52847))))

(declare-fun b!1147639 () Bool)

(declare-fun Unit!37558 () Unit!37555)

(assert (=> b!1147639 (= e!652769 Unit!37558)))

(declare-fun b!1147640 () Bool)

(declare-fun e!652777 () Bool)

(declare-fun tp_is_empty!28807 () Bool)

(assert (=> b!1147640 (= e!652777 tp_is_empty!28807)))

(declare-fun b!1147641 () Bool)

(declare-fun e!652775 () Bool)

(assert (=> b!1147641 (= e!652771 e!652775)))

(declare-fun res!763842 () Bool)

(assert (=> b!1147641 (=> (not res!763842) (not e!652775))))

(declare-fun lt!512732 () array!74384)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74384 (_ BitVec 32)) Bool)

(assert (=> b!1147641 (= res!763842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!512732 mask!1564))))

(assert (=> b!1147641 (= lt!512732 (array!74385 (store (arr!35843 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36381 _keys!1208)))))

(declare-fun b!1147642 () Bool)

(declare-fun call!52846 () Bool)

(assert (=> b!1147642 call!52846))

(declare-fun lt!512736 () Unit!37555)

(assert (=> b!1147642 (= lt!512736 call!52845)))

(assert (=> b!1147642 (= e!652781 lt!512736)))

(declare-fun res!763838 () Bool)

(assert (=> start!98666 (=> (not res!763838) (not e!652771))))

(assert (=> start!98666 (= res!763838 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36381 _keys!1208))))))

(assert (=> start!98666 e!652771))

(assert (=> start!98666 tp_is_empty!28807))

(declare-fun array_inv!27544 (array!74384) Bool)

(assert (=> start!98666 (array_inv!27544 _keys!1208)))

(assert (=> start!98666 true))

(assert (=> start!98666 tp!85542))

(declare-fun e!652785 () Bool)

(declare-fun array_inv!27545 (array!74386) Bool)

(assert (=> start!98666 (and (array_inv!27545 _values!996) e!652785)))

(declare-fun b!1147631 () Bool)

(declare-fun e!652774 () Bool)

(declare-fun e!652779 () Bool)

(assert (=> b!1147631 (= e!652774 e!652779)))

(declare-fun res!763847 () Bool)

(assert (=> b!1147631 (=> res!763847 e!652779)))

(assert (=> b!1147631 (= res!763847 (not (= (select (arr!35843 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1147631 e!652776))

(declare-fun c!113329 () Bool)

(assert (=> b!1147631 (= c!113329 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!512733 () Unit!37555)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!557 (array!74384 array!74386 (_ BitVec 32) (_ BitVec 32) V!43537 V!43537 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37555)

(assert (=> b!1147631 (= lt!512733 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!557 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147643 () Bool)

(declare-fun contains!6669 (ListLongMap!16383 (_ BitVec 64)) Bool)

(assert (=> b!1147643 (contains!6669 call!52848 k0!934)))

(declare-fun lt!512745 () ListLongMap!16383)

(declare-fun lt!512731 () Unit!37555)

(declare-fun addStillContains!838 (ListLongMap!16383 (_ BitVec 64) V!43537 (_ BitVec 64)) Unit!37555)

(assert (=> b!1147643 (= lt!512731 (addStillContains!838 lt!512745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!52843 () Bool)

(assert (=> b!1147643 call!52843))

(declare-fun lt!512725 () ListLongMap!16383)

(declare-fun +!3626 (ListLongMap!16383 tuple2!18414) ListLongMap!16383)

(assert (=> b!1147643 (= lt!512745 (+!3626 lt!512725 (tuple2!18415 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!512744 () Unit!37555)

(assert (=> b!1147643 (= lt!512744 call!52849)))

(assert (=> b!1147643 (= e!652773 lt!512731)))

(declare-fun b!1147644 () Bool)

(declare-fun -!1279 (ListLongMap!16383 (_ BitVec 64)) ListLongMap!16383)

(assert (=> b!1147644 (= e!652776 (= call!52850 (-!1279 call!52847 k0!934)))))

(declare-fun b!1147645 () Bool)

(assert (=> b!1147645 (= e!652779 true)))

(declare-fun e!652770 () Bool)

(assert (=> b!1147645 e!652770))

(declare-fun res!763837 () Bool)

(assert (=> b!1147645 (=> (not res!763837) (not e!652770))))

(declare-fun lt!512741 () V!43537)

(assert (=> b!1147645 (= res!763837 (= (-!1279 (+!3626 lt!512725 (tuple2!18415 (select (arr!35843 _keys!1208) from!1455) lt!512741)) (select (arr!35843 _keys!1208) from!1455)) lt!512725))))

(declare-fun lt!512738 () Unit!37555)

(declare-fun addThenRemoveForNewKeyIsSame!141 (ListLongMap!16383 (_ BitVec 64) V!43537) Unit!37555)

(assert (=> b!1147645 (= lt!512738 (addThenRemoveForNewKeyIsSame!141 lt!512725 (select (arr!35843 _keys!1208) from!1455) lt!512741))))

(declare-fun lt!512743 () V!43537)

(declare-fun get!18247 (ValueCell!13694 V!43537) V!43537)

(assert (=> b!1147645 (= lt!512741 (get!18247 (select (arr!35844 _values!996) from!1455) lt!512743))))

(declare-fun lt!512726 () Unit!37555)

(assert (=> b!1147645 (= lt!512726 e!652769)))

(declare-fun c!113325 () Bool)

(assert (=> b!1147645 (= c!113325 (contains!6669 lt!512725 k0!934))))

(declare-fun getCurrentListMapNoExtraKeys!4693 (array!74384 array!74386 (_ BitVec 32) (_ BitVec 32) V!43537 V!43537 (_ BitVec 32) Int) ListLongMap!16383)

(assert (=> b!1147645 (= lt!512725 (getCurrentListMapNoExtraKeys!4693 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147646 () Bool)

(declare-fun lt!512734 () Unit!37555)

(assert (=> b!1147646 (= e!652778 lt!512734)))

(assert (=> b!1147646 (= lt!512734 call!52845)))

(assert (=> b!1147646 call!52846))

(declare-fun b!1147647 () Bool)

(declare-fun arrayContainsKey!0 (array!74384 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1147647 (= e!652772 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!52842 () Bool)

(declare-fun c!113326 () Bool)

(assert (=> bm!52842 (= call!52848 (+!3626 (ite c!113327 lt!512745 lt!512725) (ite c!113327 (tuple2!18415 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113326 (tuple2!18415 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18415 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1147648 () Bool)

(declare-fun mapRes!45035 () Bool)

(assert (=> b!1147648 (= e!652785 (and e!652777 mapRes!45035))))

(declare-fun condMapEmpty!45035 () Bool)

(declare-fun mapDefault!45035 () ValueCell!13694)

(assert (=> b!1147648 (= condMapEmpty!45035 (= (arr!35844 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13694)) mapDefault!45035)))))

(declare-fun b!1147649 () Bool)

(declare-fun e!652782 () Bool)

(assert (=> b!1147649 (= e!652775 (not e!652782))))

(declare-fun res!763844 () Bool)

(assert (=> b!1147649 (=> res!763844 e!652782)))

(assert (=> b!1147649 (= res!763844 (bvsgt from!1455 i!673))))

(assert (=> b!1147649 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!512737 () Unit!37555)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74384 (_ BitVec 64) (_ BitVec 32)) Unit!37555)

(assert (=> b!1147649 (= lt!512737 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1147650 () Bool)

(assert (=> b!1147650 (= c!113326 (and (not lt!512730) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1147650 (= e!652773 e!652778)))

(declare-fun mapIsEmpty!45035 () Bool)

(assert (=> mapIsEmpty!45035 mapRes!45035))

(declare-fun bm!52843 () Bool)

(assert (=> bm!52843 (= call!52849 (addStillContains!838 lt!512725 (ite (or c!113327 c!113326) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!113327 c!113326) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1147651 () Bool)

(assert (=> b!1147651 (= e!652784 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1147652 () Bool)

(declare-fun lt!512742 () ListLongMap!16383)

(assert (=> b!1147652 (= e!652770 (= (-!1279 lt!512742 k0!934) lt!512725))))

(declare-fun b!1147653 () Bool)

(declare-fun res!763834 () Bool)

(assert (=> b!1147653 (=> (not res!763834) (not e!652771))))

(assert (=> b!1147653 (= res!763834 (= (select (arr!35843 _keys!1208) i!673) k0!934))))

(declare-fun b!1147654 () Bool)

(declare-fun res!763836 () Bool)

(assert (=> b!1147654 (=> (not res!763836) (not e!652771))))

(assert (=> b!1147654 (= res!763836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1147655 () Bool)

(declare-fun Unit!37559 () Unit!37555)

(assert (=> b!1147655 (= e!652781 Unit!37559)))

(declare-fun bm!52844 () Bool)

(assert (=> bm!52844 (= call!52846 call!52843)))

(declare-fun bm!52845 () Bool)

(assert (=> bm!52845 (= call!52843 (contains!6669 (ite c!113327 lt!512745 call!52844) k0!934))))

(declare-fun b!1147656 () Bool)

(assert (=> b!1147656 (= e!652782 e!652774)))

(declare-fun res!763835 () Bool)

(assert (=> b!1147656 (=> res!763835 e!652774)))

(assert (=> b!1147656 (= res!763835 (not (= from!1455 i!673)))))

(declare-fun lt!512740 () array!74386)

(declare-fun lt!512739 () ListLongMap!16383)

(assert (=> b!1147656 (= lt!512739 (getCurrentListMapNoExtraKeys!4693 lt!512732 lt!512740 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1147656 (= lt!512740 (array!74387 (store (arr!35844 _values!996) i!673 (ValueCellFull!13694 lt!512743)) (size!36382 _values!996)))))

(declare-fun dynLambda!2662 (Int (_ BitVec 64)) V!43537)

(assert (=> b!1147656 (= lt!512743 (dynLambda!2662 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1147656 (= lt!512742 (getCurrentListMapNoExtraKeys!4693 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!52846 () Bool)

(assert (=> bm!52846 (= call!52850 (getCurrentListMapNoExtraKeys!4693 lt!512732 lt!512740 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147657 () Bool)

(declare-fun e!652783 () Bool)

(assert (=> b!1147657 (= e!652783 tp_is_empty!28807)))

(declare-fun mapNonEmpty!45035 () Bool)

(declare-fun tp!85541 () Bool)

(assert (=> mapNonEmpty!45035 (= mapRes!45035 (and tp!85541 e!652783))))

(declare-fun mapValue!45035 () ValueCell!13694)

(declare-fun mapKey!45035 () (_ BitVec 32))

(declare-fun mapRest!45035 () (Array (_ BitVec 32) ValueCell!13694))

(assert (=> mapNonEmpty!45035 (= (arr!35844 _values!996) (store mapRest!45035 mapKey!45035 mapValue!45035))))

(declare-fun b!1147658 () Bool)

(declare-fun res!763839 () Bool)

(assert (=> b!1147658 (=> (not res!763839) (not e!652771))))

(assert (=> b!1147658 (= res!763839 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25148))))

(declare-fun b!1147659 () Bool)

(declare-fun res!763840 () Bool)

(assert (=> b!1147659 (=> (not res!763840) (not e!652775))))

(assert (=> b!1147659 (= res!763840 (arrayNoDuplicates!0 lt!512732 #b00000000000000000000000000000000 Nil!25148))))

(declare-fun bm!52847 () Bool)

(assert (=> bm!52847 (= call!52847 (getCurrentListMapNoExtraKeys!4693 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98666 res!763838) b!1147636))

(assert (= (and b!1147636 res!763843) b!1147635))

(assert (= (and b!1147635 res!763841) b!1147654))

(assert (= (and b!1147654 res!763836) b!1147658))

(assert (= (and b!1147658 res!763839) b!1147634))

(assert (= (and b!1147634 res!763846) b!1147637))

(assert (= (and b!1147637 res!763845) b!1147653))

(assert (= (and b!1147653 res!763834) b!1147641))

(assert (= (and b!1147641 res!763842) b!1147659))

(assert (= (and b!1147659 res!763840) b!1147649))

(assert (= (and b!1147649 (not res!763844)) b!1147656))

(assert (= (and b!1147656 (not res!763835)) b!1147631))

(assert (= (and b!1147631 c!113329) b!1147644))

(assert (= (and b!1147631 (not c!113329)) b!1147638))

(assert (= (or b!1147644 b!1147638) bm!52846))

(assert (= (or b!1147644 b!1147638) bm!52847))

(assert (= (and b!1147631 (not res!763847)) b!1147645))

(assert (= (and b!1147645 c!113325) b!1147632))

(assert (= (and b!1147645 (not c!113325)) b!1147639))

(assert (= (and b!1147632 c!113327) b!1147643))

(assert (= (and b!1147632 (not c!113327)) b!1147650))

(assert (= (and b!1147650 c!113326) b!1147646))

(assert (= (and b!1147650 (not c!113326)) b!1147630))

(assert (= (and b!1147630 c!113328) b!1147642))

(assert (= (and b!1147630 (not c!113328)) b!1147655))

(assert (= (or b!1147646 b!1147642) bm!52840))

(assert (= (or b!1147646 b!1147642) bm!52841))

(assert (= (or b!1147646 b!1147642) bm!52844))

(assert (= (or b!1147643 bm!52844) bm!52845))

(assert (= (or b!1147643 bm!52840) bm!52843))

(assert (= (or b!1147643 bm!52841) bm!52842))

(assert (= (and b!1147632 c!113330) b!1147651))

(assert (= (and b!1147632 (not c!113330)) b!1147633))

(assert (= (and b!1147632 res!763833) b!1147647))

(assert (= (and b!1147645 res!763837) b!1147652))

(assert (= (and b!1147648 condMapEmpty!45035) mapIsEmpty!45035))

(assert (= (and b!1147648 (not condMapEmpty!45035)) mapNonEmpty!45035))

(get-info :version)

(assert (= (and mapNonEmpty!45035 ((_ is ValueCellFull!13694) mapValue!45035)) b!1147657))

(assert (= (and b!1147648 ((_ is ValueCellFull!13694) mapDefault!45035)) b!1147640))

(assert (= start!98666 b!1147648))

(declare-fun b_lambda!19365 () Bool)

(assert (=> (not b_lambda!19365) (not b!1147656)))

(declare-fun t!36410 () Bool)

(declare-fun tb!9081 () Bool)

(assert (=> (and start!98666 (= defaultEntry!1004 defaultEntry!1004) t!36410) tb!9081))

(declare-fun result!18735 () Bool)

(assert (=> tb!9081 (= result!18735 tp_is_empty!28807)))

(assert (=> b!1147656 t!36410))

(declare-fun b_and!39383 () Bool)

(assert (= b_and!39381 (and (=> t!36410 result!18735) b_and!39383)))

(declare-fun m!1057741 () Bool)

(assert (=> b!1147649 m!1057741))

(declare-fun m!1057743 () Bool)

(assert (=> b!1147649 m!1057743))

(declare-fun m!1057745 () Bool)

(assert (=> bm!52845 m!1057745))

(declare-fun m!1057747 () Bool)

(assert (=> start!98666 m!1057747))

(declare-fun m!1057749 () Bool)

(assert (=> start!98666 m!1057749))

(declare-fun m!1057751 () Bool)

(assert (=> b!1147645 m!1057751))

(declare-fun m!1057753 () Bool)

(assert (=> b!1147645 m!1057753))

(declare-fun m!1057755 () Bool)

(assert (=> b!1147645 m!1057755))

(declare-fun m!1057757 () Bool)

(assert (=> b!1147645 m!1057757))

(declare-fun m!1057759 () Bool)

(assert (=> b!1147645 m!1057759))

(declare-fun m!1057761 () Bool)

(assert (=> b!1147645 m!1057761))

(assert (=> b!1147645 m!1057753))

(assert (=> b!1147645 m!1057755))

(assert (=> b!1147645 m!1057755))

(declare-fun m!1057763 () Bool)

(assert (=> b!1147645 m!1057763))

(assert (=> b!1147645 m!1057759))

(declare-fun m!1057765 () Bool)

(assert (=> b!1147645 m!1057765))

(declare-fun m!1057767 () Bool)

(assert (=> b!1147654 m!1057767))

(declare-fun m!1057769 () Bool)

(assert (=> b!1147651 m!1057769))

(declare-fun m!1057771 () Bool)

(assert (=> b!1147658 m!1057771))

(declare-fun m!1057773 () Bool)

(assert (=> mapNonEmpty!45035 m!1057773))

(declare-fun m!1057775 () Bool)

(assert (=> b!1147656 m!1057775))

(declare-fun m!1057777 () Bool)

(assert (=> b!1147656 m!1057777))

(declare-fun m!1057779 () Bool)

(assert (=> b!1147656 m!1057779))

(declare-fun m!1057781 () Bool)

(assert (=> b!1147656 m!1057781))

(declare-fun m!1057783 () Bool)

(assert (=> bm!52842 m!1057783))

(declare-fun m!1057785 () Bool)

(assert (=> b!1147636 m!1057785))

(declare-fun m!1057787 () Bool)

(assert (=> b!1147659 m!1057787))

(declare-fun m!1057789 () Bool)

(assert (=> bm!52846 m!1057789))

(declare-fun m!1057791 () Bool)

(assert (=> b!1147652 m!1057791))

(declare-fun m!1057793 () Bool)

(assert (=> b!1147644 m!1057793))

(declare-fun m!1057795 () Bool)

(assert (=> bm!52843 m!1057795))

(declare-fun m!1057797 () Bool)

(assert (=> b!1147643 m!1057797))

(declare-fun m!1057799 () Bool)

(assert (=> b!1147643 m!1057799))

(declare-fun m!1057801 () Bool)

(assert (=> b!1147643 m!1057801))

(declare-fun m!1057803 () Bool)

(assert (=> b!1147637 m!1057803))

(declare-fun m!1057805 () Bool)

(assert (=> b!1147632 m!1057805))

(declare-fun m!1057807 () Bool)

(assert (=> b!1147632 m!1057807))

(declare-fun m!1057809 () Bool)

(assert (=> b!1147632 m!1057809))

(declare-fun m!1057811 () Bool)

(assert (=> b!1147632 m!1057811))

(declare-fun m!1057813 () Bool)

(assert (=> b!1147641 m!1057813))

(declare-fun m!1057815 () Bool)

(assert (=> b!1147641 m!1057815))

(assert (=> b!1147647 m!1057769))

(assert (=> bm!52847 m!1057751))

(declare-fun m!1057817 () Bool)

(assert (=> b!1147653 m!1057817))

(assert (=> b!1147631 m!1057755))

(declare-fun m!1057819 () Bool)

(assert (=> b!1147631 m!1057819))

(check-sat (not b!1147659) (not bm!52846) (not b_lambda!19365) (not b!1147658) (not bm!52842) (not b!1147652) (not bm!52847) (not bm!52845) (not b!1147649) (not b!1147636) (not b!1147644) b_and!39383 (not b!1147631) (not b_next!24277) (not b!1147643) (not b!1147654) (not start!98666) (not b!1147637) (not mapNonEmpty!45035) tp_is_empty!28807 (not b!1147645) (not b!1147632) (not bm!52843) (not b!1147651) (not b!1147641) (not b!1147656) (not b!1147647))
(check-sat b_and!39383 (not b_next!24277))
