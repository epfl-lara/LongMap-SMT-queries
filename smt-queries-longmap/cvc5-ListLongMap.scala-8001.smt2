; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98846 () Bool)

(assert start!98846)

(declare-fun b_free!24451 () Bool)

(declare-fun b_next!24451 () Bool)

(assert (=> start!98846 (= b_free!24451 (not b_next!24451))))

(declare-fun tp!86064 () Bool)

(declare-fun b_and!39751 () Bool)

(assert (=> start!98846 (= tp!86064 b_and!39751)))

(declare-fun mapNonEmpty!45296 () Bool)

(declare-fun mapRes!45296 () Bool)

(declare-fun tp!86063 () Bool)

(declare-fun e!657289 () Bool)

(assert (=> mapNonEmpty!45296 (= mapRes!45296 (and tp!86063 e!657289))))

(declare-datatypes ((V!43769 0))(
  ( (V!43770 (val!14547 Int)) )
))
(declare-datatypes ((ValueCell!13781 0))(
  ( (ValueCellFull!13781 (v!17184 V!43769)) (EmptyCell!13781) )
))
(declare-fun mapRest!45296 () (Array (_ BitVec 32) ValueCell!13781))

(declare-fun mapValue!45296 () ValueCell!13781)

(declare-fun mapKey!45296 () (_ BitVec 32))

(declare-datatypes ((array!74809 0))(
  ( (array!74810 (arr!36055 (Array (_ BitVec 32) ValueCell!13781)) (size!36591 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74809)

(assert (=> mapNonEmpty!45296 (= (arr!36055 _values!996) (store mapRest!45296 mapKey!45296 mapValue!45296))))

(declare-datatypes ((array!74811 0))(
  ( (array!74812 (arr!36056 (Array (_ BitVec 32) (_ BitVec 64))) (size!36592 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74811)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!518616 () array!74811)

(declare-fun bm!54951 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!518632 () array!74809)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!18502 0))(
  ( (tuple2!18503 (_1!9262 (_ BitVec 64)) (_2!9262 V!43769)) )
))
(declare-datatypes ((List!25245 0))(
  ( (Nil!25242) (Cons!25241 (h!26450 tuple2!18502) (t!36688 List!25245)) )
))
(declare-datatypes ((ListLongMap!16471 0))(
  ( (ListLongMap!16472 (toList!8251 List!25245)) )
))
(declare-fun call!54961 () ListLongMap!16471)

(declare-fun minValue!944 () V!43769)

(declare-fun zeroValue!944 () V!43769)

(declare-fun c!114921 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4720 (array!74811 array!74809 (_ BitVec 32) (_ BitVec 32) V!43769 V!43769 (_ BitVec 32) Int) ListLongMap!16471)

(assert (=> bm!54951 (= call!54961 (getCurrentListMapNoExtraKeys!4720 (ite c!114921 lt!518616 _keys!1208) (ite c!114921 lt!518632 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155758 () Bool)

(declare-fun res!767824 () Bool)

(declare-fun e!657297 () Bool)

(assert (=> b!1155758 (=> (not res!767824) (not e!657297))))

(assert (=> b!1155758 (= res!767824 (and (= (size!36591 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36592 _keys!1208) (size!36591 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!54952 () Bool)

(declare-fun call!54955 () ListLongMap!16471)

(declare-fun call!54954 () ListLongMap!16471)

(assert (=> bm!54952 (= call!54955 call!54954)))

(declare-fun b!1155759 () Bool)

(declare-fun res!767815 () Bool)

(declare-fun e!657284 () Bool)

(assert (=> b!1155759 (=> (not res!767815) (not e!657284))))

(declare-datatypes ((List!25246 0))(
  ( (Nil!25243) (Cons!25242 (h!26451 (_ BitVec 64)) (t!36689 List!25246)) )
))
(declare-fun arrayNoDuplicates!0 (array!74811 (_ BitVec 32) List!25246) Bool)

(assert (=> b!1155759 (= res!767815 (arrayNoDuplicates!0 lt!518616 #b00000000000000000000000000000000 Nil!25243))))

(declare-fun b!1155760 () Bool)

(declare-fun res!767817 () Bool)

(assert (=> b!1155760 (=> (not res!767817) (not e!657297))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74811 (_ BitVec 32)) Bool)

(assert (=> b!1155760 (= res!767817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1155761 () Bool)

(declare-datatypes ((Unit!38063 0))(
  ( (Unit!38064) )
))
(declare-fun e!657300 () Unit!38063)

(declare-fun Unit!38065 () Unit!38063)

(assert (=> b!1155761 (= e!657300 Unit!38065)))

(declare-fun lt!518620 () Bool)

(assert (=> b!1155761 (= lt!518620 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!114917 () Bool)

(assert (=> b!1155761 (= c!114917 (and (not lt!518620) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!518628 () Unit!38063)

(declare-fun e!657293 () Unit!38063)

(assert (=> b!1155761 (= lt!518628 e!657293)))

(declare-fun lt!518627 () Unit!38063)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!496 (array!74811 array!74809 (_ BitVec 32) (_ BitVec 32) V!43769 V!43769 (_ BitVec 64) (_ BitVec 32) Int) Unit!38063)

(assert (=> b!1155761 (= lt!518627 (lemmaListMapContainsThenArrayContainsFrom!496 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114919 () Bool)

(assert (=> b!1155761 (= c!114919 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!767816 () Bool)

(declare-fun e!657288 () Bool)

(assert (=> b!1155761 (= res!767816 e!657288)))

(declare-fun e!657286 () Bool)

(assert (=> b!1155761 (=> (not res!767816) (not e!657286))))

(assert (=> b!1155761 e!657286))

(declare-fun lt!518634 () Unit!38063)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74811 (_ BitVec 32) (_ BitVec 32)) Unit!38063)

(assert (=> b!1155761 (= lt!518634 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1155761 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25243)))

(declare-fun lt!518636 () Unit!38063)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74811 (_ BitVec 64) (_ BitVec 32) List!25246) Unit!38063)

(assert (=> b!1155761 (= lt!518636 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25243))))

(assert (=> b!1155761 false))

(declare-fun b!1155762 () Bool)

(declare-fun res!767823 () Bool)

(assert (=> b!1155762 (=> (not res!767823) (not e!657297))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1155762 (= res!767823 (validKeyInArray!0 k!934))))

(declare-fun b!1155763 () Bool)

(assert (=> b!1155763 (= e!657297 e!657284)))

(declare-fun res!767826 () Bool)

(assert (=> b!1155763 (=> (not res!767826) (not e!657284))))

(assert (=> b!1155763 (= res!767826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!518616 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1155763 (= lt!518616 (array!74812 (store (arr!36056 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36592 _keys!1208)))))

(declare-fun b!1155764 () Bool)

(declare-fun Unit!38066 () Unit!38063)

(assert (=> b!1155764 (= e!657300 Unit!38066)))

(declare-fun bm!54954 () Bool)

(declare-fun call!54958 () Bool)

(declare-fun call!54959 () Bool)

(assert (=> bm!54954 (= call!54958 call!54959)))

(declare-fun b!1155765 () Bool)

(declare-fun c!114918 () Bool)

(assert (=> b!1155765 (= c!114918 (and (not lt!518620) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!657285 () Unit!38063)

(assert (=> b!1155765 (= e!657293 e!657285)))

(declare-fun lt!518617 () ListLongMap!16471)

(declare-fun bm!54955 () Bool)

(declare-fun +!3664 (ListLongMap!16471 tuple2!18502) ListLongMap!16471)

(assert (=> bm!54955 (= call!54954 (+!3664 lt!518617 (ite (or c!114917 c!114918) (tuple2!18503 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18503 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1155766 () Bool)

(declare-fun e!657291 () Bool)

(declare-fun e!657294 () Bool)

(assert (=> b!1155766 (= e!657291 e!657294)))

(declare-fun res!767814 () Bool)

(assert (=> b!1155766 (=> res!767814 e!657294)))

(assert (=> b!1155766 (= res!767814 (not (= (select (arr!36056 _keys!1208) from!1455) k!934)))))

(declare-fun e!657287 () Bool)

(assert (=> b!1155766 e!657287))

(assert (=> b!1155766 (= c!114921 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!518635 () Unit!38063)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!601 (array!74811 array!74809 (_ BitVec 32) (_ BitVec 32) V!43769 V!43769 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38063)

(assert (=> b!1155766 (= lt!518635 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!601 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155767 () Bool)

(declare-fun res!767825 () Bool)

(assert (=> b!1155767 (=> (not res!767825) (not e!657297))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1155767 (= res!767825 (validMask!0 mask!1564))))

(declare-fun b!1155768 () Bool)

(declare-fun lt!518637 () ListLongMap!16471)

(declare-fun e!657290 () Bool)

(assert (=> b!1155768 (= e!657290 (= lt!518637 (getCurrentListMapNoExtraKeys!4720 lt!518616 lt!518632 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!54956 () Bool)

(declare-fun call!54957 () Unit!38063)

(declare-fun call!54960 () Unit!38063)

(assert (=> bm!54956 (= call!54957 call!54960)))

(declare-fun b!1155769 () Bool)

(declare-fun e!657292 () Bool)

(declare-fun tp_is_empty!28981 () Bool)

(assert (=> b!1155769 (= e!657292 tp_is_empty!28981)))

(declare-fun b!1155770 () Bool)

(declare-fun e!657299 () Unit!38063)

(assert (=> b!1155770 (= e!657285 e!657299)))

(declare-fun c!114922 () Bool)

(assert (=> b!1155770 (= c!114922 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!518620))))

(declare-fun b!1155771 () Bool)

(declare-fun e!657295 () Bool)

(assert (=> b!1155771 (= e!657295 (and e!657292 mapRes!45296))))

(declare-fun condMapEmpty!45296 () Bool)

(declare-fun mapDefault!45296 () ValueCell!13781)

