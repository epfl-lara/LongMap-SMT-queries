; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98840 () Bool)

(assert start!98840)

(declare-fun b_free!24445 () Bool)

(declare-fun b_next!24445 () Bool)

(assert (=> start!98840 (= b_free!24445 (not b_next!24445))))

(declare-fun tp!86045 () Bool)

(declare-fun b_and!39739 () Bool)

(assert (=> start!98840 (= tp!86045 b_and!39739)))

(declare-fun b!1155482 () Bool)

(declare-fun e!657131 () Bool)

(declare-datatypes ((V!43761 0))(
  ( (V!43762 (val!14544 Int)) )
))
(declare-datatypes ((tuple2!18496 0))(
  ( (tuple2!18497 (_1!9259 (_ BitVec 64)) (_2!9259 V!43761)) )
))
(declare-datatypes ((List!25239 0))(
  ( (Nil!25236) (Cons!25235 (h!26444 tuple2!18496) (t!36676 List!25239)) )
))
(declare-datatypes ((ListLongMap!16465 0))(
  ( (ListLongMap!16466 (toList!8248 List!25239)) )
))
(declare-fun call!54885 () ListLongMap!16465)

(declare-fun call!54882 () ListLongMap!16465)

(assert (=> b!1155482 (= e!657131 (= call!54885 call!54882))))

(declare-fun b!1155483 () Bool)

(declare-fun e!657136 () Bool)

(declare-fun tp_is_empty!28975 () Bool)

(assert (=> b!1155483 (= e!657136 tp_is_empty!28975)))

(declare-fun b!1155484 () Bool)

(declare-datatypes ((array!74797 0))(
  ( (array!74798 (arr!36049 (Array (_ BitVec 32) (_ BitVec 64))) (size!36585 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74797)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!657135 () Bool)

(declare-fun arrayContainsKey!0 (array!74797 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1155484 (= e!657135 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun zeroValue!944 () V!43761)

(declare-fun c!114866 () Bool)

(declare-fun c!114864 () Bool)

(declare-fun lt!518422 () ListLongMap!16465)

(declare-fun lt!518429 () ListLongMap!16465)

(declare-datatypes ((Unit!38049 0))(
  ( (Unit!38050) )
))
(declare-fun call!54888 () Unit!38049)

(declare-fun minValue!944 () V!43761)

(declare-fun bm!54879 () Bool)

(declare-fun addStillContains!905 (ListLongMap!16465 (_ BitVec 64) V!43761 (_ BitVec 64)) Unit!38049)

(assert (=> bm!54879 (= call!54888 (addStillContains!905 (ite c!114866 lt!518429 lt!518422) (ite c!114866 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114864 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114866 minValue!944 (ite c!114864 zeroValue!944 minValue!944)) k!934))))

(declare-fun bm!54880 () Bool)

(declare-fun call!54886 () ListLongMap!16465)

(declare-fun call!54884 () ListLongMap!16465)

(assert (=> bm!54880 (= call!54886 call!54884)))

(declare-fun b!1155485 () Bool)

(declare-fun contains!6761 (ListLongMap!16465 (_ BitVec 64)) Bool)

(declare-fun +!3661 (ListLongMap!16465 tuple2!18496) ListLongMap!16465)

(assert (=> b!1155485 (contains!6761 (+!3661 lt!518429 (tuple2!18497 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!518421 () Unit!38049)

(assert (=> b!1155485 (= lt!518421 call!54888)))

(declare-fun call!54887 () Bool)

(assert (=> b!1155485 call!54887))

(assert (=> b!1155485 (= lt!518429 call!54884)))

(declare-fun lt!518418 () Unit!38049)

(assert (=> b!1155485 (= lt!518418 (addStillContains!905 lt!518422 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun e!657140 () Unit!38049)

(assert (=> b!1155485 (= e!657140 lt!518421)))

(declare-fun b!1155486 () Bool)

(declare-fun e!657143 () Unit!38049)

(declare-fun lt!518425 () Unit!38049)

(assert (=> b!1155486 (= e!657143 lt!518425)))

(declare-fun call!54883 () Unit!38049)

(assert (=> b!1155486 (= lt!518425 call!54883)))

(declare-fun call!54889 () Bool)

(assert (=> b!1155486 call!54889))

(declare-fun b!1155487 () Bool)

(declare-fun res!767679 () Bool)

(declare-fun e!657138 () Bool)

(assert (=> b!1155487 (=> (not res!767679) (not e!657138))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1155487 (= res!767679 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36585 _keys!1208))))))

(declare-fun bm!54881 () Bool)

(assert (=> bm!54881 (= call!54889 call!54887)))

(declare-fun b!1155488 () Bool)

(declare-fun res!767681 () Bool)

(assert (=> b!1155488 (=> (not res!767681) (not e!657138))))

(declare-datatypes ((List!25240 0))(
  ( (Nil!25237) (Cons!25236 (h!26445 (_ BitVec 64)) (t!36677 List!25240)) )
))
(declare-fun arrayNoDuplicates!0 (array!74797 (_ BitVec 32) List!25240) Bool)

(assert (=> b!1155488 (= res!767681 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25237))))

(declare-fun b!1155489 () Bool)

(assert (=> b!1155489 call!54889))

(declare-fun lt!518433 () Unit!38049)

(assert (=> b!1155489 (= lt!518433 call!54883)))

(declare-fun e!657133 () Unit!38049)

(assert (=> b!1155489 (= e!657133 lt!518433)))

(declare-fun b!1155490 () Bool)

(declare-fun Unit!38051 () Unit!38049)

(assert (=> b!1155490 (= e!657133 Unit!38051)))

(declare-fun b!1155491 () Bool)

(declare-fun e!657146 () Bool)

(assert (=> b!1155491 (= e!657146 tp_is_empty!28975)))

(declare-fun b!1155492 () Bool)

(declare-fun res!767688 () Bool)

(assert (=> b!1155492 (=> (not res!767688) (not e!657138))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13778 0))(
  ( (ValueCellFull!13778 (v!17181 V!43761)) (EmptyCell!13778) )
))
(declare-datatypes ((array!74799 0))(
  ( (array!74800 (arr!36050 (Array (_ BitVec 32) ValueCell!13778)) (size!36586 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74799)

(assert (=> b!1155492 (= res!767688 (and (= (size!36586 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36585 _keys!1208) (size!36586 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1155493 () Bool)

(declare-fun e!657142 () Bool)

(declare-fun e!657134 () Bool)

(assert (=> b!1155493 (= e!657142 (not e!657134))))

(declare-fun res!767692 () Bool)

(assert (=> b!1155493 (=> res!767692 e!657134)))

(assert (=> b!1155493 (= res!767692 (bvsgt from!1455 i!673))))

(assert (=> b!1155493 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!518424 () Unit!38049)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74797 (_ BitVec 64) (_ BitVec 32)) Unit!38049)

(assert (=> b!1155493 (= lt!518424 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1155494 () Bool)

(assert (=> b!1155494 (= e!657143 e!657133)))

(declare-fun c!114863 () Bool)

(declare-fun lt!518426 () Bool)

(assert (=> b!1155494 (= c!114863 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!518426))))

(declare-fun bm!54882 () Bool)

(assert (=> bm!54882 (= call!54884 (+!3661 lt!518422 (ite (or c!114866 c!114864) (tuple2!18497 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18497 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun res!767686 () Bool)

(assert (=> start!98840 (=> (not res!767686) (not e!657138))))

(assert (=> start!98840 (= res!767686 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36585 _keys!1208))))))

(assert (=> start!98840 e!657138))

(assert (=> start!98840 tp_is_empty!28975))

(declare-fun array_inv!27590 (array!74797) Bool)

(assert (=> start!98840 (array_inv!27590 _keys!1208)))

(assert (=> start!98840 true))

(assert (=> start!98840 tp!86045))

(declare-fun e!657139 () Bool)

(declare-fun array_inv!27591 (array!74799) Bool)

(assert (=> start!98840 (and (array_inv!27591 _values!996) e!657139)))

(declare-fun b!1155495 () Bool)

(declare-fun e!657147 () Unit!38049)

(declare-fun Unit!38052 () Unit!38049)

(assert (=> b!1155495 (= e!657147 Unit!38052)))

(declare-fun b!1155496 () Bool)

(assert (=> b!1155496 (= c!114864 (and (not lt!518426) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1155496 (= e!657140 e!657143)))

(declare-fun b!1155497 () Bool)

(declare-fun -!1368 (ListLongMap!16465 (_ BitVec 64)) ListLongMap!16465)

(assert (=> b!1155497 (= e!657131 (= call!54885 (-!1368 call!54882 k!934)))))

(declare-fun b!1155498 () Bool)

(declare-fun res!767687 () Bool)

(assert (=> b!1155498 (=> (not res!767687) (not e!657138))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1155498 (= res!767687 (validKeyInArray!0 k!934))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!518436 () ListLongMap!16465)

(declare-fun e!657141 () Bool)

(declare-fun lt!518423 () array!74797)

(declare-fun lt!518438 () array!74799)

(declare-fun b!1155499 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4717 (array!74797 array!74799 (_ BitVec 32) (_ BitVec 32) V!43761 V!43761 (_ BitVec 32) Int) ListLongMap!16465)

(assert (=> b!1155499 (= e!657141 (= lt!518436 (getCurrentListMapNoExtraKeys!4717 lt!518423 lt!518438 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1155500 () Bool)

(assert (=> b!1155500 (= e!657135 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!518426) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1155501 () Bool)

(declare-fun e!657145 () Bool)

(assert (=> b!1155501 (= e!657145 true)))

(assert (=> b!1155501 e!657141))

(declare-fun res!767690 () Bool)

(assert (=> b!1155501 (=> (not res!767690) (not e!657141))))

(assert (=> b!1155501 (= res!767690 (= lt!518436 lt!518422))))

(declare-fun lt!518431 () ListLongMap!16465)

(assert (=> b!1155501 (= lt!518436 (-!1368 lt!518431 k!934))))

(declare-fun lt!518419 () V!43761)

(assert (=> b!1155501 (= (-!1368 (+!3661 lt!518422 (tuple2!18497 (select (arr!36049 _keys!1208) from!1455) lt!518419)) (select (arr!36049 _keys!1208) from!1455)) lt!518422)))

(declare-fun lt!518428 () Unit!38049)

(declare-fun addThenRemoveForNewKeyIsSame!207 (ListLongMap!16465 (_ BitVec 64) V!43761) Unit!38049)

(assert (=> b!1155501 (= lt!518428 (addThenRemoveForNewKeyIsSame!207 lt!518422 (select (arr!36049 _keys!1208) from!1455) lt!518419))))

(declare-fun lt!518430 () V!43761)

(declare-fun get!18369 (ValueCell!13778 V!43761) V!43761)

(assert (=> b!1155501 (= lt!518419 (get!18369 (select (arr!36050 _values!996) from!1455) lt!518430))))

(declare-fun lt!518434 () Unit!38049)

(assert (=> b!1155501 (= lt!518434 e!657147)))

(declare-fun c!114868 () Bool)

(assert (=> b!1155501 (= c!114868 (contains!6761 lt!518422 k!934))))

(assert (=> b!1155501 (= lt!518422 (getCurrentListMapNoExtraKeys!4717 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155502 () Bool)

(declare-fun res!767680 () Bool)

(assert (=> b!1155502 (=> (not res!767680) (not e!657138))))

(assert (=> b!1155502 (= res!767680 (= (select (arr!36049 _keys!1208) i!673) k!934))))

(declare-fun bm!54883 () Bool)

(assert (=> bm!54883 (= call!54887 (contains!6761 (ite c!114866 lt!518429 call!54886) k!934))))

(declare-fun mapNonEmpty!45287 () Bool)

(declare-fun mapRes!45287 () Bool)

(declare-fun tp!86046 () Bool)

(assert (=> mapNonEmpty!45287 (= mapRes!45287 (and tp!86046 e!657146))))

(declare-fun mapRest!45287 () (Array (_ BitVec 32) ValueCell!13778))

(declare-fun mapValue!45287 () ValueCell!13778)

(declare-fun mapKey!45287 () (_ BitVec 32))

(assert (=> mapNonEmpty!45287 (= (arr!36050 _values!996) (store mapRest!45287 mapKey!45287 mapValue!45287))))

(declare-fun b!1155503 () Bool)

(declare-fun e!657132 () Bool)

(assert (=> b!1155503 (= e!657132 e!657145)))

(declare-fun res!767685 () Bool)

(assert (=> b!1155503 (=> res!767685 e!657145)))

(assert (=> b!1155503 (= res!767685 (not (= (select (arr!36049 _keys!1208) from!1455) k!934)))))

(assert (=> b!1155503 e!657131))

(declare-fun c!114865 () Bool)

(assert (=> b!1155503 (= c!114865 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!518427 () Unit!38049)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!598 (array!74797 array!74799 (_ BitVec 32) (_ BitVec 32) V!43761 V!43761 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38049)

(assert (=> b!1155503 (= lt!518427 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!598 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155504 () Bool)

(declare-fun res!767683 () Bool)

(assert (=> b!1155504 (=> (not res!767683) (not e!657138))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1155504 (= res!767683 (validMask!0 mask!1564))))

(declare-fun b!1155505 () Bool)

(declare-fun Unit!38053 () Unit!38049)

(assert (=> b!1155505 (= e!657147 Unit!38053)))

(assert (=> b!1155505 (= lt!518426 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1155505 (= c!114866 (and (not lt!518426) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!518437 () Unit!38049)

(assert (=> b!1155505 (= lt!518437 e!657140)))

(declare-fun lt!518420 () Unit!38049)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!494 (array!74797 array!74799 (_ BitVec 32) (_ BitVec 32) V!43761 V!43761 (_ BitVec 64) (_ BitVec 32) Int) Unit!38049)

(assert (=> b!1155505 (= lt!518420 (lemmaListMapContainsThenArrayContainsFrom!494 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114867 () Bool)

(assert (=> b!1155505 (= c!114867 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!767691 () Bool)

(assert (=> b!1155505 (= res!767691 e!657135)))

(declare-fun e!657144 () Bool)

(assert (=> b!1155505 (=> (not res!767691) (not e!657144))))

(assert (=> b!1155505 e!657144))

(declare-fun lt!518435 () Unit!38049)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74797 (_ BitVec 32) (_ BitVec 32)) Unit!38049)

(assert (=> b!1155505 (= lt!518435 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1155505 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25237)))

(declare-fun lt!518432 () Unit!38049)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74797 (_ BitVec 64) (_ BitVec 32) List!25240) Unit!38049)

(assert (=> b!1155505 (= lt!518432 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25237))))

(assert (=> b!1155505 false))

(declare-fun bm!54884 () Bool)

(assert (=> bm!54884 (= call!54883 call!54888)))

(declare-fun b!1155506 () Bool)

(assert (=> b!1155506 (= e!657138 e!657142)))

(declare-fun res!767682 () Bool)

(assert (=> b!1155506 (=> (not res!767682) (not e!657142))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74797 (_ BitVec 32)) Bool)

(assert (=> b!1155506 (= res!767682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!518423 mask!1564))))

(assert (=> b!1155506 (= lt!518423 (array!74798 (store (arr!36049 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36585 _keys!1208)))))

(declare-fun b!1155507 () Bool)

(declare-fun res!767689 () Bool)

(assert (=> b!1155507 (=> (not res!767689) (not e!657142))))

(assert (=> b!1155507 (= res!767689 (arrayNoDuplicates!0 lt!518423 #b00000000000000000000000000000000 Nil!25237))))

(declare-fun bm!54885 () Bool)

(assert (=> bm!54885 (= call!54882 (getCurrentListMapNoExtraKeys!4717 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155508 () Bool)

(assert (=> b!1155508 (= e!657144 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1155509 () Bool)

(assert (=> b!1155509 (= e!657134 e!657132)))

(declare-fun res!767693 () Bool)

(assert (=> b!1155509 (=> res!767693 e!657132)))

(assert (=> b!1155509 (= res!767693 (not (= from!1455 i!673)))))

(declare-fun lt!518439 () ListLongMap!16465)

(assert (=> b!1155509 (= lt!518439 (getCurrentListMapNoExtraKeys!4717 lt!518423 lt!518438 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1155509 (= lt!518438 (array!74800 (store (arr!36050 _values!996) i!673 (ValueCellFull!13778 lt!518430)) (size!36586 _values!996)))))

(declare-fun dynLambda!2726 (Int (_ BitVec 64)) V!43761)

(assert (=> b!1155509 (= lt!518430 (dynLambda!2726 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1155509 (= lt!518431 (getCurrentListMapNoExtraKeys!4717 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!45287 () Bool)

(assert (=> mapIsEmpty!45287 mapRes!45287))

(declare-fun b!1155510 () Bool)

(assert (=> b!1155510 (= e!657139 (and e!657136 mapRes!45287))))

(declare-fun condMapEmpty!45287 () Bool)

(declare-fun mapDefault!45287 () ValueCell!13778)

