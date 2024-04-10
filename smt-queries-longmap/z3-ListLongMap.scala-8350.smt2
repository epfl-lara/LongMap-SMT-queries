; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101652 () Bool)

(assert start!101652)

(declare-fun b_free!26373 () Bool)

(declare-fun b_next!26373 () Bool)

(assert (=> start!101652 (= b_free!26373 (not b_next!26373))))

(declare-fun tp!92162 () Bool)

(declare-fun b_and!43989 () Bool)

(assert (=> start!101652 (= tp!92162 b_and!43989)))

(declare-fun b!1222790 () Bool)

(declare-fun res!812466 () Bool)

(declare-fun e!694451 () Bool)

(assert (=> b!1222790 (=> (not res!812466) (not e!694451))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!46563 0))(
  ( (V!46564 (val!15595 Int)) )
))
(declare-datatypes ((ValueCell!14829 0))(
  ( (ValueCellFull!14829 (v!18256 V!46563)) (EmptyCell!14829) )
))
(declare-datatypes ((array!78937 0))(
  ( (array!78938 (arr!38096 (Array (_ BitVec 32) ValueCell!14829)) (size!38632 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78937)

(declare-datatypes ((array!78939 0))(
  ( (array!78940 (arr!38097 (Array (_ BitVec 32) (_ BitVec 64))) (size!38633 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78939)

(assert (=> b!1222790 (= res!812466 (and (= (size!38632 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38633 _keys!1208) (size!38632 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1222791 () Bool)

(declare-fun res!812455 () Bool)

(assert (=> b!1222791 (=> (not res!812455) (not e!694451))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1222791 (= res!812455 (validKeyInArray!0 k0!934))))

(declare-fun b!1222792 () Bool)

(declare-fun e!694444 () Bool)

(declare-fun tp_is_empty!31077 () Bool)

(assert (=> b!1222792 (= e!694444 tp_is_empty!31077)))

(declare-fun res!812461 () Bool)

(assert (=> start!101652 (=> (not res!812461) (not e!694451))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!101652 (= res!812461 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38633 _keys!1208))))))

(assert (=> start!101652 e!694451))

(assert (=> start!101652 tp_is_empty!31077))

(declare-fun array_inv!28988 (array!78939) Bool)

(assert (=> start!101652 (array_inv!28988 _keys!1208)))

(assert (=> start!101652 true))

(assert (=> start!101652 tp!92162))

(declare-fun e!694453 () Bool)

(declare-fun array_inv!28989 (array!78937) Bool)

(assert (=> start!101652 (and (array_inv!28989 _values!996) e!694453)))

(declare-fun b!1222793 () Bool)

(declare-fun res!812463 () Bool)

(assert (=> b!1222793 (=> (not res!812463) (not e!694451))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1222793 (= res!812463 (validMask!0 mask!1564))))

(declare-fun b!1222794 () Bool)

(declare-fun e!694454 () Bool)

(declare-fun e!694452 () Bool)

(assert (=> b!1222794 (= e!694454 (not e!694452))))

(declare-fun res!812467 () Bool)

(assert (=> b!1222794 (=> res!812467 e!694452)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1222794 (= res!812467 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78939 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1222794 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40504 0))(
  ( (Unit!40505) )
))
(declare-fun lt!556407 () Unit!40504)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78939 (_ BitVec 64) (_ BitVec 32)) Unit!40504)

(assert (=> b!1222794 (= lt!556407 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1222795 () Bool)

(declare-fun e!694449 () Unit!40504)

(declare-fun Unit!40506 () Unit!40504)

(assert (=> b!1222795 (= e!694449 Unit!40506)))

(declare-fun lt!556419 () Unit!40504)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78939 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40504)

(assert (=> b!1222795 (= lt!556419 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1222795 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!556420 () Unit!40504)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78939 (_ BitVec 32) (_ BitVec 32)) Unit!40504)

(assert (=> b!1222795 (= lt!556420 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26890 0))(
  ( (Nil!26887) (Cons!26886 (h!28095 (_ BitVec 64)) (t!40243 List!26890)) )
))
(declare-fun arrayNoDuplicates!0 (array!78939 (_ BitVec 32) List!26890) Bool)

(assert (=> b!1222795 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26887)))

(declare-fun lt!556416 () Unit!40504)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78939 (_ BitVec 64) (_ BitVec 32) List!26890) Unit!40504)

(assert (=> b!1222795 (= lt!556416 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26887))))

(assert (=> b!1222795 false))

(declare-fun b!1222796 () Bool)

(declare-fun res!812468 () Bool)

(assert (=> b!1222796 (=> (not res!812468) (not e!694451))))

(assert (=> b!1222796 (= res!812468 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26887))))

(declare-fun b!1222797 () Bool)

(declare-fun e!694445 () Bool)

(assert (=> b!1222797 (= e!694445 tp_is_empty!31077)))

(declare-fun b!1222798 () Bool)

(declare-fun Unit!40507 () Unit!40504)

(assert (=> b!1222798 (= e!694449 Unit!40507)))

(declare-fun b!1222799 () Bool)

(declare-fun e!694450 () Bool)

(assert (=> b!1222799 (= e!694450 (bvslt from!1455 (size!38633 _keys!1208)))))

(assert (=> b!1222799 (not (= (select (arr!38097 _keys!1208) from!1455) k0!934))))

(declare-fun lt!556411 () Unit!40504)

(assert (=> b!1222799 (= lt!556411 e!694449)))

(declare-fun c!120341 () Bool)

(assert (=> b!1222799 (= c!120341 (= (select (arr!38097 _keys!1208) from!1455) k0!934))))

(declare-fun e!694448 () Bool)

(assert (=> b!1222799 e!694448))

(declare-fun res!812464 () Bool)

(assert (=> b!1222799 (=> (not res!812464) (not e!694448))))

(declare-fun lt!556414 () V!46563)

(declare-datatypes ((tuple2!20090 0))(
  ( (tuple2!20091 (_1!10056 (_ BitVec 64)) (_2!10056 V!46563)) )
))
(declare-datatypes ((List!26891 0))(
  ( (Nil!26888) (Cons!26887 (h!28096 tuple2!20090) (t!40244 List!26891)) )
))
(declare-datatypes ((ListLongMap!18059 0))(
  ( (ListLongMap!18060 (toList!9045 List!26891)) )
))
(declare-fun lt!556410 () ListLongMap!18059)

(declare-fun lt!556415 () ListLongMap!18059)

(declare-fun +!4105 (ListLongMap!18059 tuple2!20090) ListLongMap!18059)

(declare-fun get!19450 (ValueCell!14829 V!46563) V!46563)

(assert (=> b!1222799 (= res!812464 (= lt!556415 (+!4105 lt!556410 (tuple2!20091 (select (arr!38097 _keys!1208) from!1455) (get!19450 (select (arr!38096 _values!996) from!1455) lt!556414)))))))

(declare-fun b!1222800 () Bool)

(declare-fun res!812460 () Bool)

(assert (=> b!1222800 (=> (not res!812460) (not e!694454))))

(declare-fun lt!556413 () array!78939)

(assert (=> b!1222800 (= res!812460 (arrayNoDuplicates!0 lt!556413 #b00000000000000000000000000000000 Nil!26887))))

(declare-fun b!1222801 () Bool)

(declare-fun res!812458 () Bool)

(assert (=> b!1222801 (=> (not res!812458) (not e!694451))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78939 (_ BitVec 32)) Bool)

(assert (=> b!1222801 (= res!812458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1222802 () Bool)

(declare-fun e!694446 () Bool)

(assert (=> b!1222802 (= e!694448 e!694446)))

(declare-fun res!812465 () Bool)

(assert (=> b!1222802 (=> res!812465 e!694446)))

(assert (=> b!1222802 (= res!812465 (not (= (select (arr!38097 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1222803 () Bool)

(declare-fun res!812457 () Bool)

(assert (=> b!1222803 (=> (not res!812457) (not e!694451))))

(assert (=> b!1222803 (= res!812457 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38633 _keys!1208))))))

(declare-fun b!1222804 () Bool)

(assert (=> b!1222804 (= e!694446 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!48511 () Bool)

(declare-fun mapRes!48511 () Bool)

(assert (=> mapIsEmpty!48511 mapRes!48511))

(declare-fun b!1222805 () Bool)

(declare-fun e!694455 () Bool)

(assert (=> b!1222805 (= e!694452 e!694455)))

(declare-fun res!812454 () Bool)

(assert (=> b!1222805 (=> res!812454 e!694455)))

(assert (=> b!1222805 (= res!812454 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46563)

(declare-fun lt!556409 () array!78937)

(declare-fun minValue!944 () V!46563)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5467 (array!78939 array!78937 (_ BitVec 32) (_ BitVec 32) V!46563 V!46563 (_ BitVec 32) Int) ListLongMap!18059)

(assert (=> b!1222805 (= lt!556415 (getCurrentListMapNoExtraKeys!5467 lt!556413 lt!556409 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1222805 (= lt!556409 (array!78938 (store (arr!38096 _values!996) i!673 (ValueCellFull!14829 lt!556414)) (size!38632 _values!996)))))

(declare-fun dynLambda!3343 (Int (_ BitVec 64)) V!46563)

(assert (=> b!1222805 (= lt!556414 (dynLambda!3343 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!556412 () ListLongMap!18059)

(assert (=> b!1222805 (= lt!556412 (getCurrentListMapNoExtraKeys!5467 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1222806 () Bool)

(declare-fun res!812462 () Bool)

(assert (=> b!1222806 (=> (not res!812462) (not e!694451))))

(assert (=> b!1222806 (= res!812462 (= (select (arr!38097 _keys!1208) i!673) k0!934))))

(declare-fun b!1222807 () Bool)

(assert (=> b!1222807 (= e!694455 e!694450)))

(declare-fun res!812456 () Bool)

(assert (=> b!1222807 (=> res!812456 e!694450)))

(assert (=> b!1222807 (= res!812456 (not (validKeyInArray!0 (select (arr!38097 _keys!1208) from!1455))))))

(declare-fun lt!556418 () ListLongMap!18059)

(assert (=> b!1222807 (= lt!556418 lt!556410)))

(declare-fun lt!556417 () ListLongMap!18059)

(declare-fun -!1948 (ListLongMap!18059 (_ BitVec 64)) ListLongMap!18059)

(assert (=> b!1222807 (= lt!556410 (-!1948 lt!556417 k0!934))))

(assert (=> b!1222807 (= lt!556418 (getCurrentListMapNoExtraKeys!5467 lt!556413 lt!556409 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1222807 (= lt!556417 (getCurrentListMapNoExtraKeys!5467 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!556408 () Unit!40504)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1155 (array!78939 array!78937 (_ BitVec 32) (_ BitVec 32) V!46563 V!46563 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40504)

(assert (=> b!1222807 (= lt!556408 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1155 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1222808 () Bool)

(assert (=> b!1222808 (= e!694453 (and e!694445 mapRes!48511))))

(declare-fun condMapEmpty!48511 () Bool)

(declare-fun mapDefault!48511 () ValueCell!14829)

(assert (=> b!1222808 (= condMapEmpty!48511 (= (arr!38096 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14829)) mapDefault!48511)))))

(declare-fun mapNonEmpty!48511 () Bool)

(declare-fun tp!92161 () Bool)

(assert (=> mapNonEmpty!48511 (= mapRes!48511 (and tp!92161 e!694444))))

(declare-fun mapValue!48511 () ValueCell!14829)

(declare-fun mapRest!48511 () (Array (_ BitVec 32) ValueCell!14829))

(declare-fun mapKey!48511 () (_ BitVec 32))

(assert (=> mapNonEmpty!48511 (= (arr!38096 _values!996) (store mapRest!48511 mapKey!48511 mapValue!48511))))

(declare-fun b!1222809 () Bool)

(assert (=> b!1222809 (= e!694451 e!694454)))

(declare-fun res!812459 () Bool)

(assert (=> b!1222809 (=> (not res!812459) (not e!694454))))

(assert (=> b!1222809 (= res!812459 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!556413 mask!1564))))

(assert (=> b!1222809 (= lt!556413 (array!78940 (store (arr!38097 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38633 _keys!1208)))))

(assert (= (and start!101652 res!812461) b!1222793))

(assert (= (and b!1222793 res!812463) b!1222790))

(assert (= (and b!1222790 res!812466) b!1222801))

(assert (= (and b!1222801 res!812458) b!1222796))

(assert (= (and b!1222796 res!812468) b!1222803))

(assert (= (and b!1222803 res!812457) b!1222791))

(assert (= (and b!1222791 res!812455) b!1222806))

(assert (= (and b!1222806 res!812462) b!1222809))

(assert (= (and b!1222809 res!812459) b!1222800))

(assert (= (and b!1222800 res!812460) b!1222794))

(assert (= (and b!1222794 (not res!812467)) b!1222805))

(assert (= (and b!1222805 (not res!812454)) b!1222807))

(assert (= (and b!1222807 (not res!812456)) b!1222799))

(assert (= (and b!1222799 res!812464) b!1222802))

(assert (= (and b!1222802 (not res!812465)) b!1222804))

(assert (= (and b!1222799 c!120341) b!1222795))

(assert (= (and b!1222799 (not c!120341)) b!1222798))

(assert (= (and b!1222808 condMapEmpty!48511) mapIsEmpty!48511))

(assert (= (and b!1222808 (not condMapEmpty!48511)) mapNonEmpty!48511))

(get-info :version)

(assert (= (and mapNonEmpty!48511 ((_ is ValueCellFull!14829) mapValue!48511)) b!1222792))

(assert (= (and b!1222808 ((_ is ValueCellFull!14829) mapDefault!48511)) b!1222797))

(assert (= start!101652 b!1222808))

(declare-fun b_lambda!22315 () Bool)

(assert (=> (not b_lambda!22315) (not b!1222805)))

(declare-fun t!40242 () Bool)

(declare-fun tb!11173 () Bool)

(assert (=> (and start!101652 (= defaultEntry!1004 defaultEntry!1004) t!40242) tb!11173))

(declare-fun result!22957 () Bool)

(assert (=> tb!11173 (= result!22957 tp_is_empty!31077)))

(assert (=> b!1222805 t!40242))

(declare-fun b_and!43991 () Bool)

(assert (= b_and!43989 (and (=> t!40242 result!22957) b_and!43991)))

(declare-fun m!1127733 () Bool)

(assert (=> b!1222807 m!1127733))

(declare-fun m!1127735 () Bool)

(assert (=> b!1222807 m!1127735))

(declare-fun m!1127737 () Bool)

(assert (=> b!1222807 m!1127737))

(declare-fun m!1127739 () Bool)

(assert (=> b!1222807 m!1127739))

(assert (=> b!1222807 m!1127735))

(declare-fun m!1127741 () Bool)

(assert (=> b!1222807 m!1127741))

(declare-fun m!1127743 () Bool)

(assert (=> b!1222807 m!1127743))

(declare-fun m!1127745 () Bool)

(assert (=> b!1222806 m!1127745))

(assert (=> b!1222802 m!1127735))

(assert (=> b!1222799 m!1127735))

(declare-fun m!1127747 () Bool)

(assert (=> b!1222799 m!1127747))

(assert (=> b!1222799 m!1127747))

(declare-fun m!1127749 () Bool)

(assert (=> b!1222799 m!1127749))

(declare-fun m!1127751 () Bool)

(assert (=> b!1222799 m!1127751))

(declare-fun m!1127753 () Bool)

(assert (=> b!1222801 m!1127753))

(declare-fun m!1127755 () Bool)

(assert (=> mapNonEmpty!48511 m!1127755))

(declare-fun m!1127757 () Bool)

(assert (=> b!1222809 m!1127757))

(declare-fun m!1127759 () Bool)

(assert (=> b!1222809 m!1127759))

(declare-fun m!1127761 () Bool)

(assert (=> b!1222800 m!1127761))

(declare-fun m!1127763 () Bool)

(assert (=> b!1222794 m!1127763))

(declare-fun m!1127765 () Bool)

(assert (=> b!1222794 m!1127765))

(declare-fun m!1127767 () Bool)

(assert (=> b!1222793 m!1127767))

(declare-fun m!1127769 () Bool)

(assert (=> b!1222796 m!1127769))

(declare-fun m!1127771 () Bool)

(assert (=> b!1222795 m!1127771))

(declare-fun m!1127773 () Bool)

(assert (=> b!1222795 m!1127773))

(declare-fun m!1127775 () Bool)

(assert (=> b!1222795 m!1127775))

(declare-fun m!1127777 () Bool)

(assert (=> b!1222795 m!1127777))

(declare-fun m!1127779 () Bool)

(assert (=> b!1222795 m!1127779))

(declare-fun m!1127781 () Bool)

(assert (=> b!1222805 m!1127781))

(declare-fun m!1127783 () Bool)

(assert (=> b!1222805 m!1127783))

(declare-fun m!1127785 () Bool)

(assert (=> b!1222805 m!1127785))

(declare-fun m!1127787 () Bool)

(assert (=> b!1222805 m!1127787))

(declare-fun m!1127789 () Bool)

(assert (=> start!101652 m!1127789))

(declare-fun m!1127791 () Bool)

(assert (=> start!101652 m!1127791))

(declare-fun m!1127793 () Bool)

(assert (=> b!1222791 m!1127793))

(declare-fun m!1127795 () Bool)

(assert (=> b!1222804 m!1127795))

(check-sat (not b!1222801) (not b_next!26373) (not b!1222796) (not b!1222809) (not b!1222794) b_and!43991 (not b!1222800) (not b!1222795) (not b!1222805) (not b!1222804) (not start!101652) (not b!1222793) (not b_lambda!22315) tp_is_empty!31077 (not b!1222791) (not b!1222799) (not mapNonEmpty!48511) (not b!1222807))
(check-sat b_and!43991 (not b_next!26373))
