; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100572 () Bool)

(assert start!100572)

(declare-fun b_free!25895 () Bool)

(declare-fun b_next!25895 () Bool)

(assert (=> start!100572 (= b_free!25895 (not b_next!25895))))

(declare-fun tp!90675 () Bool)

(declare-fun b_and!42677 () Bool)

(assert (=> start!100572 (= tp!90675 b_and!42677)))

(declare-fun b!1203062 () Bool)

(declare-fun res!800665 () Bool)

(declare-fun e!683142 () Bool)

(assert (=> b!1203062 (=> (not res!800665) (not e!683142))))

(declare-datatypes ((array!77971 0))(
  ( (array!77972 (arr!37630 (Array (_ BitVec 32) (_ BitVec 64))) (size!38166 (_ BitVec 32))) )
))
(declare-fun lt!545350 () array!77971)

(declare-datatypes ((List!26494 0))(
  ( (Nil!26491) (Cons!26490 (h!27699 (_ BitVec 64)) (t!39369 List!26494)) )
))
(declare-fun arrayNoDuplicates!0 (array!77971 (_ BitVec 32) List!26494) Bool)

(assert (=> b!1203062 (= res!800665 (arrayNoDuplicates!0 lt!545350 #b00000000000000000000000000000000 Nil!26491))))

(declare-fun b!1203063 () Bool)

(declare-fun e!683150 () Bool)

(declare-fun tp_is_empty!30599 () Bool)

(assert (=> b!1203063 (= e!683150 tp_is_empty!30599)))

(declare-fun b!1203064 () Bool)

(declare-fun e!683149 () Bool)

(assert (=> b!1203064 (= e!683149 e!683142)))

(declare-fun res!800664 () Bool)

(assert (=> b!1203064 (=> (not res!800664) (not e!683142))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77971 (_ BitVec 32)) Bool)

(assert (=> b!1203064 (= res!800664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!545350 mask!1564))))

(declare-fun _keys!1208 () array!77971)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1203064 (= lt!545350 (array!77972 (store (arr!37630 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38166 _keys!1208)))))

(declare-fun mapNonEmpty!47741 () Bool)

(declare-fun mapRes!47741 () Bool)

(declare-fun tp!90674 () Bool)

(assert (=> mapNonEmpty!47741 (= mapRes!47741 (and tp!90674 e!683150))))

(declare-datatypes ((V!45925 0))(
  ( (V!45926 (val!15356 Int)) )
))
(declare-datatypes ((ValueCell!14590 0))(
  ( (ValueCellFull!14590 (v!17994 V!45925)) (EmptyCell!14590) )
))
(declare-fun mapValue!47741 () ValueCell!14590)

(declare-fun mapRest!47741 () (Array (_ BitVec 32) ValueCell!14590))

(declare-datatypes ((array!77973 0))(
  ( (array!77974 (arr!37631 (Array (_ BitVec 32) ValueCell!14590)) (size!38167 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77973)

(declare-fun mapKey!47741 () (_ BitVec 32))

(assert (=> mapNonEmpty!47741 (= (arr!37631 _values!996) (store mapRest!47741 mapKey!47741 mapValue!47741))))

(declare-fun b!1203065 () Bool)

(declare-fun res!800667 () Bool)

(assert (=> b!1203065 (=> (not res!800667) (not e!683149))))

(assert (=> b!1203065 (= res!800667 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26491))))

(declare-fun mapIsEmpty!47741 () Bool)

(assert (=> mapIsEmpty!47741 mapRes!47741))

(declare-fun b!1203066 () Bool)

(declare-fun e!683143 () Bool)

(assert (=> b!1203066 (= e!683142 (not e!683143))))

(declare-fun res!800661 () Bool)

(assert (=> b!1203066 (=> res!800661 e!683143)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1203066 (= res!800661 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77971 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1203066 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39883 0))(
  ( (Unit!39884) )
))
(declare-fun lt!545339 () Unit!39883)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77971 (_ BitVec 64) (_ BitVec 32)) Unit!39883)

(assert (=> b!1203066 (= lt!545339 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1203067 () Bool)

(declare-fun e!683147 () Bool)

(assert (=> b!1203067 (= e!683143 e!683147)))

(declare-fun res!800660 () Bool)

(assert (=> b!1203067 (=> res!800660 e!683147)))

(assert (=> b!1203067 (= res!800660 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45925)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!545348 () array!77973)

(declare-datatypes ((tuple2!19684 0))(
  ( (tuple2!19685 (_1!9853 (_ BitVec 64)) (_2!9853 V!45925)) )
))
(declare-datatypes ((List!26495 0))(
  ( (Nil!26492) (Cons!26491 (h!27700 tuple2!19684) (t!39370 List!26495)) )
))
(declare-datatypes ((ListLongMap!17653 0))(
  ( (ListLongMap!17654 (toList!8842 List!26495)) )
))
(declare-fun lt!545347 () ListLongMap!17653)

(declare-fun minValue!944 () V!45925)

(declare-fun getCurrentListMapNoExtraKeys!5278 (array!77971 array!77973 (_ BitVec 32) (_ BitVec 32) V!45925 V!45925 (_ BitVec 32) Int) ListLongMap!17653)

(assert (=> b!1203067 (= lt!545347 (getCurrentListMapNoExtraKeys!5278 lt!545350 lt!545348 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3190 (Int (_ BitVec 64)) V!45925)

(assert (=> b!1203067 (= lt!545348 (array!77974 (store (arr!37631 _values!996) i!673 (ValueCellFull!14590 (dynLambda!3190 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38167 _values!996)))))

(declare-fun lt!545337 () ListLongMap!17653)

(assert (=> b!1203067 (= lt!545337 (getCurrentListMapNoExtraKeys!5278 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!57937 () Bool)

(declare-fun call!57943 () ListLongMap!17653)

(declare-fun call!57946 () ListLongMap!17653)

(assert (=> bm!57937 (= call!57943 call!57946)))

(declare-fun b!1203068 () Bool)

(declare-fun e!683153 () Unit!39883)

(declare-fun Unit!39885 () Unit!39883)

(assert (=> b!1203068 (= e!683153 Unit!39885)))

(declare-fun b!1203069 () Bool)

(declare-fun res!800669 () Bool)

(assert (=> b!1203069 (=> (not res!800669) (not e!683149))))

(assert (=> b!1203069 (= res!800669 (= (select (arr!37630 _keys!1208) i!673) k!934))))

(declare-fun b!1203070 () Bool)

(declare-fun res!800658 () Bool)

(assert (=> b!1203070 (=> (not res!800658) (not e!683149))))

(assert (=> b!1203070 (= res!800658 (and (= (size!38167 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38166 _keys!1208) (size!38167 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1203071 () Bool)

(declare-fun res!800663 () Bool)

(assert (=> b!1203071 (=> (not res!800663) (not e!683149))))

(assert (=> b!1203071 (= res!800663 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38166 _keys!1208))))))

(declare-fun b!1203072 () Bool)

(declare-fun e!683146 () Bool)

(assert (=> b!1203072 (= e!683146 true)))

(declare-fun lt!545343 () Unit!39883)

(declare-fun e!683154 () Unit!39883)

(assert (=> b!1203072 (= lt!545343 e!683154)))

(declare-fun c!117767 () Bool)

(declare-fun lt!545345 () Bool)

(assert (=> b!1203072 (= c!117767 (and (not lt!545345) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1203072 (= lt!545345 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1203073 () Bool)

(declare-fun e!683148 () Bool)

(declare-fun call!57945 () ListLongMap!17653)

(declare-fun call!57940 () ListLongMap!17653)

(assert (=> b!1203073 (= e!683148 (= call!57945 call!57940))))

(declare-fun call!57944 () Bool)

(declare-fun lt!545344 () ListLongMap!17653)

(declare-fun bm!57938 () Bool)

(declare-fun contains!6896 (ListLongMap!17653 (_ BitVec 64)) Bool)

(assert (=> bm!57938 (= call!57944 (contains!6896 (ite c!117767 lt!545344 call!57943) k!934))))

(declare-fun bm!57939 () Bool)

(assert (=> bm!57939 (= call!57940 (getCurrentListMapNoExtraKeys!5278 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!57940 () Bool)

(assert (=> bm!57940 (= call!57945 (getCurrentListMapNoExtraKeys!5278 lt!545350 lt!545348 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1203074 () Bool)

(declare-fun e!683155 () Bool)

(assert (=> b!1203074 (= e!683147 e!683155)))

(declare-fun res!800670 () Bool)

(assert (=> b!1203074 (=> res!800670 e!683155)))

(assert (=> b!1203074 (= res!800670 (not (= (select (arr!37630 _keys!1208) from!1455) k!934)))))

(assert (=> b!1203074 e!683148))

(declare-fun c!117768 () Bool)

(assert (=> b!1203074 (= c!117768 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!545346 () Unit!39883)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1014 (array!77971 array!77973 (_ BitVec 32) (_ BitVec 32) V!45925 V!45925 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39883)

(assert (=> b!1203074 (= lt!545346 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1014 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1203075 () Bool)

(declare-fun e!683145 () Unit!39883)

(assert (=> b!1203075 (= e!683154 e!683145)))

(declare-fun c!117769 () Bool)

(assert (=> b!1203075 (= c!117769 (and (not lt!545345) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1203076 () Bool)

(declare-fun c!117770 () Bool)

(assert (=> b!1203076 (= c!117770 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!545345))))

(assert (=> b!1203076 (= e!683145 e!683153)))

(declare-fun bm!57941 () Bool)

(declare-fun call!57942 () Bool)

(assert (=> bm!57941 (= call!57942 call!57944)))

(declare-fun b!1203077 () Bool)

(declare-fun res!800668 () Bool)

(assert (=> b!1203077 (=> (not res!800668) (not e!683149))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1203077 (= res!800668 (validKeyInArray!0 k!934))))

(declare-fun b!1203078 () Bool)

(declare-fun lt!545341 () Unit!39883)

(assert (=> b!1203078 (= e!683154 lt!545341)))

(declare-fun lt!545340 () Unit!39883)

(declare-fun lt!545349 () ListLongMap!17653)

(declare-fun addStillContains!997 (ListLongMap!17653 (_ BitVec 64) V!45925 (_ BitVec 64)) Unit!39883)

(assert (=> b!1203078 (= lt!545340 (addStillContains!997 lt!545349 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(assert (=> b!1203078 (= lt!545344 call!57946)))

(assert (=> b!1203078 call!57944))

(declare-fun call!57947 () Unit!39883)

(assert (=> b!1203078 (= lt!545341 call!57947)))

(declare-fun +!3968 (ListLongMap!17653 tuple2!19684) ListLongMap!17653)

(assert (=> b!1203078 (contains!6896 (+!3968 lt!545344 (tuple2!19685 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun b!1203079 () Bool)

(assert (=> b!1203079 (= e!683155 e!683146)))

(declare-fun res!800666 () Bool)

(assert (=> b!1203079 (=> res!800666 e!683146)))

(assert (=> b!1203079 (= res!800666 (not (contains!6896 lt!545349 k!934)))))

(assert (=> b!1203079 (= lt!545349 (getCurrentListMapNoExtraKeys!5278 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!57942 () Bool)

(assert (=> bm!57942 (= call!57946 (+!3968 lt!545349 (ite (or c!117767 c!117769) (tuple2!19685 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19685 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1203080 () Bool)

(declare-fun lt!545342 () Unit!39883)

(assert (=> b!1203080 (= e!683153 lt!545342)))

(declare-fun call!57941 () Unit!39883)

(assert (=> b!1203080 (= lt!545342 call!57941)))

(assert (=> b!1203080 call!57942))

(declare-fun b!1203081 () Bool)

(declare-fun -!1809 (ListLongMap!17653 (_ BitVec 64)) ListLongMap!17653)

(assert (=> b!1203081 (= e!683148 (= call!57945 (-!1809 call!57940 k!934)))))

(declare-fun b!1203082 () Bool)

(declare-fun res!800657 () Bool)

(assert (=> b!1203082 (=> (not res!800657) (not e!683149))))

(assert (=> b!1203082 (= res!800657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!57943 () Bool)

(assert (=> bm!57943 (= call!57941 call!57947)))

(declare-fun b!1203083 () Bool)

(assert (=> b!1203083 call!57942))

(declare-fun lt!545338 () Unit!39883)

(assert (=> b!1203083 (= lt!545338 call!57941)))

(assert (=> b!1203083 (= e!683145 lt!545338)))

(declare-fun bm!57944 () Bool)

(assert (=> bm!57944 (= call!57947 (addStillContains!997 (ite c!117767 lt!545344 lt!545349) (ite c!117767 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!117769 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!117767 minValue!944 (ite c!117769 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1203084 () Bool)

(declare-fun res!800659 () Bool)

(assert (=> b!1203084 (=> (not res!800659) (not e!683149))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1203084 (= res!800659 (validMask!0 mask!1564))))

(declare-fun res!800662 () Bool)

(assert (=> start!100572 (=> (not res!800662) (not e!683149))))

(assert (=> start!100572 (= res!800662 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38166 _keys!1208))))))

(assert (=> start!100572 e!683149))

(assert (=> start!100572 tp_is_empty!30599))

(declare-fun array_inv!28670 (array!77971) Bool)

(assert (=> start!100572 (array_inv!28670 _keys!1208)))

(assert (=> start!100572 true))

(assert (=> start!100572 tp!90675))

(declare-fun e!683144 () Bool)

(declare-fun array_inv!28671 (array!77973) Bool)

(assert (=> start!100572 (and (array_inv!28671 _values!996) e!683144)))

(declare-fun b!1203085 () Bool)

(declare-fun e!683152 () Bool)

(assert (=> b!1203085 (= e!683144 (and e!683152 mapRes!47741))))

(declare-fun condMapEmpty!47741 () Bool)

(declare-fun mapDefault!47741 () ValueCell!14590)

