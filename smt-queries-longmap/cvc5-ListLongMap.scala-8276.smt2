; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100756 () Bool)

(assert start!100756)

(declare-fun b_free!25927 () Bool)

(declare-fun b_next!25927 () Bool)

(assert (=> start!100756 (= b_free!25927 (not b_next!25927))))

(declare-fun tp!90783 () Bool)

(declare-fun b_and!42837 () Bool)

(assert (=> start!100756 (= tp!90783 b_and!42837)))

(declare-datatypes ((array!78043 0))(
  ( (array!78044 (arr!37662 (Array (_ BitVec 32) (_ BitVec 64))) (size!38198 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78043)

(declare-fun b!1205435 () Bool)

(declare-fun e!684562 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!78043 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1205435 (= e!684562 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1205436 () Bool)

(declare-datatypes ((Unit!39963 0))(
  ( (Unit!39964) )
))
(declare-fun e!684561 () Unit!39963)

(declare-fun e!684560 () Unit!39963)

(assert (=> b!1205436 (= e!684561 e!684560)))

(declare-fun c!118283 () Bool)

(declare-fun lt!546750 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1205436 (= c!118283 (and (not lt!546750) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1205437 () Bool)

(declare-fun res!801788 () Bool)

(declare-fun e!684557 () Bool)

(assert (=> b!1205437 (=> (not res!801788) (not e!684557))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1205437 (= res!801788 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38198 _keys!1208))))))

(declare-fun b!1205438 () Bool)

(declare-fun e!684564 () Bool)

(declare-fun e!684559 () Bool)

(assert (=> b!1205438 (= e!684564 e!684559)))

(declare-fun res!801798 () Bool)

(assert (=> b!1205438 (=> res!801798 e!684559)))

(assert (=> b!1205438 (= res!801798 (not (= (select (arr!37662 _keys!1208) from!1455) k!934)))))

(declare-fun e!684551 () Bool)

(assert (=> b!1205438 e!684551))

(declare-fun c!118284 () Bool)

(assert (=> b!1205438 (= c!118284 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((V!45969 0))(
  ( (V!45970 (val!15372 Int)) )
))
(declare-datatypes ((ValueCell!14606 0))(
  ( (ValueCellFull!14606 (v!18016 V!45969)) (EmptyCell!14606) )
))
(declare-datatypes ((array!78045 0))(
  ( (array!78046 (arr!37663 (Array (_ BitVec 32) ValueCell!14606)) (size!38199 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78045)

(declare-fun minValue!944 () V!45969)

(declare-fun lt!546749 () Unit!39963)

(declare-fun zeroValue!944 () V!45969)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1026 (array!78043 array!78045 (_ BitVec 32) (_ BitVec 32) V!45969 V!45969 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39963)

(assert (=> b!1205438 (= lt!546749 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1026 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1205439 () Bool)

(assert (=> b!1205439 (= e!684562 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!546750) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!58449 () Bool)

(declare-datatypes ((tuple2!19716 0))(
  ( (tuple2!19717 (_1!9869 (_ BitVec 64)) (_2!9869 V!45969)) )
))
(declare-datatypes ((List!26522 0))(
  ( (Nil!26519) (Cons!26518 (h!27727 tuple2!19716) (t!39429 List!26522)) )
))
(declare-datatypes ((ListLongMap!17685 0))(
  ( (ListLongMap!17686 (toList!8858 List!26522)) )
))
(declare-fun call!58457 () ListLongMap!17685)

(declare-fun getCurrentListMapNoExtraKeys!5293 (array!78043 array!78045 (_ BitVec 32) (_ BitVec 32) V!45969 V!45969 (_ BitVec 32) Int) ListLongMap!17685)

(assert (=> bm!58449 (= call!58457 (getCurrentListMapNoExtraKeys!5293 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!58450 () Bool)

(declare-fun call!58454 () Bool)

(declare-fun call!58459 () Bool)

(assert (=> bm!58450 (= call!58454 call!58459)))

(declare-fun b!1205440 () Bool)

(declare-fun e!684556 () Bool)

(assert (=> b!1205440 (= e!684557 e!684556)))

(declare-fun res!801794 () Bool)

(assert (=> b!1205440 (=> (not res!801794) (not e!684556))))

(declare-fun lt!546754 () array!78043)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78043 (_ BitVec 32)) Bool)

(assert (=> b!1205440 (= res!801794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!546754 mask!1564))))

(assert (=> b!1205440 (= lt!546754 (array!78044 (store (arr!37662 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38198 _keys!1208)))))

(declare-fun mapIsEmpty!47802 () Bool)

(declare-fun mapRes!47802 () Bool)

(assert (=> mapIsEmpty!47802 mapRes!47802))

(declare-fun b!1205441 () Bool)

(declare-fun res!801797 () Bool)

(assert (=> b!1205441 (=> (not res!801797) (not e!684556))))

(declare-datatypes ((List!26523 0))(
  ( (Nil!26520) (Cons!26519 (h!27728 (_ BitVec 64)) (t!39430 List!26523)) )
))
(declare-fun arrayNoDuplicates!0 (array!78043 (_ BitVec 32) List!26523) Bool)

(assert (=> b!1205441 (= res!801797 (arrayNoDuplicates!0 lt!546754 #b00000000000000000000000000000000 Nil!26520))))

(declare-fun b!1205442 () Bool)

(declare-fun res!801801 () Bool)

(assert (=> b!1205442 (=> (not res!801801) (not e!684557))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1205442 (= res!801801 (validKeyInArray!0 k!934))))

(declare-fun b!1205443 () Bool)

(declare-fun e!684554 () Unit!39963)

(declare-fun Unit!39965 () Unit!39963)

(assert (=> b!1205443 (= e!684554 Unit!39965)))

(declare-fun b!1205444 () Bool)

(declare-fun lt!546753 () Unit!39963)

(assert (=> b!1205444 (= e!684554 lt!546753)))

(declare-fun call!58452 () Unit!39963)

(assert (=> b!1205444 (= lt!546753 call!58452)))

(assert (=> b!1205444 call!58454))

(declare-fun c!118280 () Bool)

(declare-fun bm!58451 () Bool)

(declare-fun lt!546748 () ListLongMap!17685)

(declare-fun call!58453 () ListLongMap!17685)

(declare-fun contains!6918 (ListLongMap!17685 (_ BitVec 64)) Bool)

(assert (=> bm!58451 (= call!58459 (contains!6918 (ite c!118280 lt!546748 call!58453) k!934))))

(declare-fun bm!58452 () Bool)

(declare-fun call!58455 () ListLongMap!17685)

(assert (=> bm!58452 (= call!58453 call!58455)))

(declare-fun b!1205445 () Bool)

(declare-fun e!684566 () Bool)

(declare-fun e!684552 () Bool)

(assert (=> b!1205445 (= e!684566 (and e!684552 mapRes!47802))))

(declare-fun condMapEmpty!47802 () Bool)

(declare-fun mapDefault!47802 () ValueCell!14606)

