; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100548 () Bool)

(assert start!100548)

(declare-fun b_free!25871 () Bool)

(declare-fun b_next!25871 () Bool)

(assert (=> start!100548 (= b_free!25871 (not b_next!25871))))

(declare-fun tp!90603 () Bool)

(declare-fun b_and!42629 () Bool)

(assert (=> start!100548 (= tp!90603 b_and!42629)))

(declare-fun bm!57649 () Bool)

(declare-datatypes ((V!45893 0))(
  ( (V!45894 (val!15344 Int)) )
))
(declare-datatypes ((tuple2!19660 0))(
  ( (tuple2!19661 (_1!9841 (_ BitVec 64)) (_2!9841 V!45893)) )
))
(declare-datatypes ((List!26474 0))(
  ( (Nil!26471) (Cons!26470 (h!27679 tuple2!19660) (t!39325 List!26474)) )
))
(declare-datatypes ((ListLongMap!17629 0))(
  ( (ListLongMap!17630 (toList!8830 List!26474)) )
))
(declare-fun call!57658 () ListLongMap!17629)

(declare-fun call!57655 () ListLongMap!17629)

(assert (=> bm!57649 (= call!57658 call!57655)))

(declare-fun b!1202138 () Bool)

(declare-fun res!800161 () Bool)

(declare-fun e!682647 () Bool)

(assert (=> b!1202138 (=> (not res!800161) (not e!682647))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!77923 0))(
  ( (array!77924 (arr!37606 (Array (_ BitVec 32) (_ BitVec 64))) (size!38142 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77923)

(assert (=> b!1202138 (= res!800161 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38142 _keys!1208))))))

(declare-fun mapNonEmpty!47705 () Bool)

(declare-fun mapRes!47705 () Bool)

(declare-fun tp!90602 () Bool)

(declare-fun e!682640 () Bool)

(assert (=> mapNonEmpty!47705 (= mapRes!47705 (and tp!90602 e!682640))))

(declare-datatypes ((ValueCell!14578 0))(
  ( (ValueCellFull!14578 (v!17982 V!45893)) (EmptyCell!14578) )
))
(declare-fun mapRest!47705 () (Array (_ BitVec 32) ValueCell!14578))

(declare-datatypes ((array!77925 0))(
  ( (array!77926 (arr!37607 (Array (_ BitVec 32) ValueCell!14578)) (size!38143 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77925)

(declare-fun mapKey!47705 () (_ BitVec 32))

(declare-fun mapValue!47705 () ValueCell!14578)

(assert (=> mapNonEmpty!47705 (= (arr!37607 _values!996) (store mapRest!47705 mapKey!47705 mapValue!47705))))

(declare-fun b!1202139 () Bool)

(declare-fun e!682643 () Bool)

(declare-fun tp_is_empty!30575 () Bool)

(assert (=> b!1202139 (= e!682643 tp_is_empty!30575)))

(declare-fun zeroValue!944 () V!45893)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun call!57654 () ListLongMap!17629)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!57650 () Bool)

(declare-fun minValue!944 () V!45893)

(declare-fun getCurrentListMapNoExtraKeys!5268 (array!77923 array!77925 (_ BitVec 32) (_ BitVec 32) V!45893 V!45893 (_ BitVec 32) Int) ListLongMap!17629)

(assert (=> bm!57650 (= call!57654 (getCurrentListMapNoExtraKeys!5268 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202140 () Bool)

(declare-fun call!57652 () Bool)

(assert (=> b!1202140 call!57652))

(declare-datatypes ((Unit!39855 0))(
  ( (Unit!39856) )
))
(declare-fun lt!544844 () Unit!39855)

(declare-fun call!57656 () Unit!39855)

(assert (=> b!1202140 (= lt!544844 call!57656)))

(declare-fun e!682638 () Unit!39855)

(assert (=> b!1202140 (= e!682638 lt!544844)))

(declare-fun b!1202141 () Bool)

(declare-fun e!682642 () Bool)

(declare-fun e!682646 () Bool)

(assert (=> b!1202141 (= e!682642 e!682646)))

(declare-fun res!800155 () Bool)

(assert (=> b!1202141 (=> res!800155 e!682646)))

(assert (=> b!1202141 (= res!800155 (not (= from!1455 i!673)))))

(declare-fun lt!544842 () array!77925)

(declare-fun lt!544841 () array!77923)

(declare-fun lt!544835 () ListLongMap!17629)

(assert (=> b!1202141 (= lt!544835 (getCurrentListMapNoExtraKeys!5268 lt!544841 lt!544842 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3183 (Int (_ BitVec 64)) V!45893)

(assert (=> b!1202141 (= lt!544842 (array!77926 (store (arr!37607 _values!996) i!673 (ValueCellFull!14578 (dynLambda!3183 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38143 _values!996)))))

(declare-fun lt!544837 () ListLongMap!17629)

(assert (=> b!1202141 (= lt!544837 (getCurrentListMapNoExtraKeys!5268 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1202142 () Bool)

(declare-fun c!117624 () Bool)

(declare-fun lt!544846 () Bool)

(assert (=> b!1202142 (= c!117624 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!544846))))

(declare-fun e!682639 () Unit!39855)

(assert (=> b!1202142 (= e!682638 e!682639)))

(declare-fun b!1202144 () Bool)

(declare-fun res!800154 () Bool)

(assert (=> b!1202144 (=> (not res!800154) (not e!682647))))

(assert (=> b!1202144 (= res!800154 (and (= (size!38143 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38142 _keys!1208) (size!38143 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!57651 () Bool)

(declare-fun call!57653 () Unit!39855)

(assert (=> bm!57651 (= call!57656 call!57653)))

(declare-fun bm!57652 () Bool)

(declare-fun call!57659 () Bool)

(assert (=> bm!57652 (= call!57652 call!57659)))

(declare-fun call!57657 () ListLongMap!17629)

(declare-fun bm!57653 () Bool)

(assert (=> bm!57653 (= call!57657 (getCurrentListMapNoExtraKeys!5268 lt!544841 lt!544842 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202145 () Bool)

(declare-fun res!800153 () Bool)

(declare-fun e!682645 () Bool)

(assert (=> b!1202145 (=> (not res!800153) (not e!682645))))

(declare-datatypes ((List!26475 0))(
  ( (Nil!26472) (Cons!26471 (h!27680 (_ BitVec 64)) (t!39326 List!26475)) )
))
(declare-fun arrayNoDuplicates!0 (array!77923 (_ BitVec 32) List!26475) Bool)

(assert (=> b!1202145 (= res!800153 (arrayNoDuplicates!0 lt!544841 #b00000000000000000000000000000000 Nil!26472))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun c!117626 () Bool)

(declare-fun bm!57654 () Bool)

(declare-fun lt!544840 () ListLongMap!17629)

(declare-fun contains!6886 (ListLongMap!17629 (_ BitVec 64)) Bool)

(assert (=> bm!57654 (= call!57659 (contains!6886 (ite c!117626 lt!544840 call!57658) k!934))))

(declare-fun b!1202146 () Bool)

(declare-fun res!800159 () Bool)

(assert (=> b!1202146 (=> (not res!800159) (not e!682647))))

(assert (=> b!1202146 (= res!800159 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26472))))

(declare-fun b!1202147 () Bool)

(declare-fun res!800157 () Bool)

(assert (=> b!1202147 (=> (not res!800157) (not e!682647))))

(assert (=> b!1202147 (= res!800157 (= (select (arr!37606 _keys!1208) i!673) k!934))))

(declare-fun b!1202148 () Bool)

(declare-fun res!800164 () Bool)

(assert (=> b!1202148 (=> (not res!800164) (not e!682647))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1202148 (= res!800164 (validMask!0 mask!1564))))

(declare-fun b!1202149 () Bool)

(declare-fun e!682644 () Unit!39855)

(assert (=> b!1202149 (= e!682644 e!682638)))

(declare-fun c!117623 () Bool)

(assert (=> b!1202149 (= c!117623 (and (not lt!544846) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1202150 () Bool)

(declare-fun e!682649 () Bool)

(assert (=> b!1202150 (= e!682649 true)))

(declare-fun lt!544838 () Unit!39855)

(assert (=> b!1202150 (= lt!544838 e!682644)))

(assert (=> b!1202150 (= c!117626 (and (not lt!544846) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1202150 (= lt!544846 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1202151 () Bool)

(declare-fun res!800163 () Bool)

(assert (=> b!1202151 (=> (not res!800163) (not e!682647))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77923 (_ BitVec 32)) Bool)

(assert (=> b!1202151 (= res!800163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1202152 () Bool)

(assert (=> b!1202152 (= e!682640 tp_is_empty!30575)))

(declare-fun b!1202153 () Bool)

(declare-fun e!682641 () Bool)

(assert (=> b!1202153 (= e!682641 e!682649)))

(declare-fun res!800158 () Bool)

(assert (=> b!1202153 (=> res!800158 e!682649)))

(declare-fun lt!544836 () ListLongMap!17629)

(assert (=> b!1202153 (= res!800158 (not (contains!6886 lt!544836 k!934)))))

(assert (=> b!1202153 (= lt!544836 (getCurrentListMapNoExtraKeys!5268 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!57655 () Bool)

(declare-fun addStillContains!987 (ListLongMap!17629 (_ BitVec 64) V!45893 (_ BitVec 64)) Unit!39855)

(assert (=> bm!57655 (= call!57653 (addStillContains!987 lt!544836 (ite (or c!117626 c!117623) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117626 c!117623) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1202154 () Bool)

(declare-fun res!800160 () Bool)

(assert (=> b!1202154 (=> (not res!800160) (not e!682647))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1202154 (= res!800160 (validKeyInArray!0 k!934))))

(declare-fun b!1202155 () Bool)

(declare-fun lt!544833 () Unit!39855)

(assert (=> b!1202155 (= e!682644 lt!544833)))

(declare-fun lt!544845 () Unit!39855)

(assert (=> b!1202155 (= lt!544845 call!57653)))

(assert (=> b!1202155 (= lt!544840 call!57655)))

(assert (=> b!1202155 call!57659))

(assert (=> b!1202155 (= lt!544833 (addStillContains!987 lt!544840 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun +!3959 (ListLongMap!17629 tuple2!19660) ListLongMap!17629)

(assert (=> b!1202155 (contains!6886 (+!3959 lt!544840 (tuple2!19661 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun b!1202156 () Bool)

(assert (=> b!1202156 (= e!682645 (not e!682642))))

(declare-fun res!800162 () Bool)

(assert (=> b!1202156 (=> res!800162 e!682642)))

(assert (=> b!1202156 (= res!800162 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77923 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1202156 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!544839 () Unit!39855)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77923 (_ BitVec 64) (_ BitVec 32)) Unit!39855)

(assert (=> b!1202156 (= lt!544839 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapIsEmpty!47705 () Bool)

(assert (=> mapIsEmpty!47705 mapRes!47705))

(declare-fun b!1202157 () Bool)

(assert (=> b!1202157 (= e!682646 e!682641)))

(declare-fun res!800156 () Bool)

(assert (=> b!1202157 (=> res!800156 e!682641)))

(assert (=> b!1202157 (= res!800156 (not (= (select (arr!37606 _keys!1208) from!1455) k!934)))))

(declare-fun e!682651 () Bool)

(assert (=> b!1202157 e!682651))

(declare-fun c!117625 () Bool)

(assert (=> b!1202157 (= c!117625 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!544843 () Unit!39855)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1006 (array!77923 array!77925 (_ BitVec 32) (_ BitVec 32) V!45893 V!45893 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39855)

(assert (=> b!1202157 (= lt!544843 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1006 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202158 () Bool)

(declare-fun -!1800 (ListLongMap!17629 (_ BitVec 64)) ListLongMap!17629)

(assert (=> b!1202158 (= e!682651 (= call!57657 (-!1800 call!57654 k!934)))))

(declare-fun b!1202159 () Bool)

(declare-fun Unit!39857 () Unit!39855)

(assert (=> b!1202159 (= e!682639 Unit!39857)))

(declare-fun b!1202160 () Bool)

(assert (=> b!1202160 (= e!682651 (= call!57657 call!57654))))

(declare-fun b!1202161 () Bool)

(declare-fun e!682650 () Bool)

(assert (=> b!1202161 (= e!682650 (and e!682643 mapRes!47705))))

(declare-fun condMapEmpty!47705 () Bool)

(declare-fun mapDefault!47705 () ValueCell!14578)

