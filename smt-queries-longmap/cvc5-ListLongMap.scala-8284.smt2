; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100906 () Bool)

(assert start!100906)

(declare-fun b_free!25975 () Bool)

(declare-fun b_next!25975 () Bool)

(assert (=> start!100906 (= b_free!25975 (not b_next!25975))))

(declare-fun tp!90935 () Bool)

(declare-fun b_and!42991 () Bool)

(assert (=> start!100906 (= tp!90935 b_and!42991)))

(declare-fun bm!59095 () Bool)

(declare-datatypes ((Unit!40051 0))(
  ( (Unit!40052) )
))
(declare-fun call!59102 () Unit!40051)

(declare-fun call!59105 () Unit!40051)

(assert (=> bm!59095 (= call!59102 call!59105)))

(declare-fun b!1208199 () Bool)

(declare-fun res!803157 () Bool)

(declare-fun e!686164 () Bool)

(assert (=> b!1208199 (=> (not res!803157) (not e!686164))))

(declare-datatypes ((array!78139 0))(
  ( (array!78140 (arr!37708 (Array (_ BitVec 32) (_ BitVec 64))) (size!38244 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78139)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78139 (_ BitVec 32)) Bool)

(assert (=> b!1208199 (= res!803157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1208200 () Bool)

(declare-fun res!803158 () Bool)

(assert (=> b!1208200 (=> (not res!803158) (not e!686164))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1208200 (= res!803158 (validKeyInArray!0 k!934))))

(declare-fun b!1208201 () Bool)

(declare-fun e!686163 () Bool)

(declare-fun e!686165 () Bool)

(assert (=> b!1208201 (= e!686163 e!686165)))

(declare-fun res!803160 () Bool)

(assert (=> b!1208201 (=> res!803160 e!686165)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1208201 (= res!803160 (not (= (select (arr!37708 _keys!1208) from!1455) k!934)))))

(declare-fun e!686156 () Bool)

(assert (=> b!1208201 e!686156))

(declare-fun c!118838 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1208201 (= c!118838 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!46033 0))(
  ( (V!46034 (val!15396 Int)) )
))
(declare-fun zeroValue!944 () V!46033)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!548302 () Unit!40051)

(declare-datatypes ((ValueCell!14630 0))(
  ( (ValueCellFull!14630 (v!18044 V!46033)) (EmptyCell!14630) )
))
(declare-datatypes ((array!78141 0))(
  ( (array!78142 (arr!37709 (Array (_ BitVec 32) ValueCell!14630)) (size!38245 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78141)

(declare-fun minValue!944 () V!46033)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1042 (array!78139 array!78141 (_ BitVec 32) (_ BitVec 32) V!46033 V!46033 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40051)

(assert (=> b!1208201 (= lt!548302 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1042 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!118839 () Bool)

(declare-fun c!118841 () Bool)

(declare-fun bm!59096 () Bool)

(declare-datatypes ((tuple2!19760 0))(
  ( (tuple2!19761 (_1!9891 (_ BitVec 64)) (_2!9891 V!46033)) )
))
(declare-datatypes ((List!26561 0))(
  ( (Nil!26558) (Cons!26557 (h!27766 tuple2!19760) (t!39516 List!26561)) )
))
(declare-datatypes ((ListLongMap!17729 0))(
  ( (ListLongMap!17730 (toList!8880 List!26561)) )
))
(declare-fun lt!548307 () ListLongMap!17729)

(declare-fun lt!548297 () ListLongMap!17729)

(declare-fun addStillContains!1028 (ListLongMap!17729 (_ BitVec 64) V!46033 (_ BitVec 64)) Unit!40051)

(assert (=> bm!59096 (= call!59105 (addStillContains!1028 (ite c!118839 lt!548297 lt!548307) (ite c!118839 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118841 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118839 minValue!944 (ite c!118841 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1208202 () Bool)

(declare-fun res!803164 () Bool)

(declare-fun e!686162 () Bool)

(assert (=> b!1208202 (=> (not res!803164) (not e!686162))))

(declare-fun lt!548298 () array!78139)

(declare-datatypes ((List!26562 0))(
  ( (Nil!26559) (Cons!26558 (h!27767 (_ BitVec 64)) (t!39517 List!26562)) )
))
(declare-fun arrayNoDuplicates!0 (array!78139 (_ BitVec 32) List!26562) Bool)

(assert (=> b!1208202 (= res!803164 (arrayNoDuplicates!0 lt!548298 #b00000000000000000000000000000000 Nil!26559))))

(declare-fun b!1208203 () Bool)

(declare-fun c!118840 () Bool)

(declare-fun lt!548306 () Bool)

(assert (=> b!1208203 (= c!118840 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!548306))))

(declare-fun e!686159 () Unit!40051)

(declare-fun e!686169 () Unit!40051)

(assert (=> b!1208203 (= e!686159 e!686169)))

(declare-fun b!1208204 () Bool)

(declare-fun e!686157 () Bool)

(assert (=> b!1208204 (= e!686165 e!686157)))

(declare-fun res!803156 () Bool)

(assert (=> b!1208204 (=> res!803156 e!686157)))

(declare-fun contains!6940 (ListLongMap!17729 (_ BitVec 64)) Bool)

(assert (=> b!1208204 (= res!803156 (not (contains!6940 lt!548307 k!934)))))

(declare-fun getCurrentListMapNoExtraKeys!5314 (array!78139 array!78141 (_ BitVec 32) (_ BitVec 32) V!46033 V!46033 (_ BitVec 32) Int) ListLongMap!17729)

(assert (=> b!1208204 (= lt!548307 (getCurrentListMapNoExtraKeys!5314 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!803152 () Bool)

(assert (=> start!100906 (=> (not res!803152) (not e!686164))))

(assert (=> start!100906 (= res!803152 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38244 _keys!1208))))))

(assert (=> start!100906 e!686164))

(declare-fun tp_is_empty!30679 () Bool)

(assert (=> start!100906 tp_is_empty!30679))

(declare-fun array_inv!28722 (array!78139) Bool)

(assert (=> start!100906 (array_inv!28722 _keys!1208)))

(assert (=> start!100906 true))

(assert (=> start!100906 tp!90935))

(declare-fun e!686168 () Bool)

(declare-fun array_inv!28723 (array!78141) Bool)

(assert (=> start!100906 (and (array_inv!28723 _values!996) e!686168)))

(declare-fun call!59101 () ListLongMap!17729)

(declare-fun bm!59097 () Bool)

(declare-fun +!3999 (ListLongMap!17729 tuple2!19760) ListLongMap!17729)

(assert (=> bm!59097 (= call!59101 (+!3999 (ite c!118839 lt!548297 lt!548307) (ite c!118839 (tuple2!19761 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118841 (tuple2!19761 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19761 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!59098 () Bool)

(declare-fun call!59104 () Bool)

(declare-fun call!59100 () Bool)

(assert (=> bm!59098 (= call!59104 call!59100)))

(declare-fun b!1208205 () Bool)

(declare-fun res!803153 () Bool)

(assert (=> b!1208205 (=> (not res!803153) (not e!686164))))

(assert (=> b!1208205 (= res!803153 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26559))))

(declare-fun b!1208206 () Bool)

(declare-fun e!686166 () Unit!40051)

(assert (=> b!1208206 (= e!686166 e!686159)))

(assert (=> b!1208206 (= c!118841 (and (not lt!548306) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1208207 () Bool)

(declare-fun Unit!40053 () Unit!40051)

(assert (=> b!1208207 (= e!686169 Unit!40053)))

(declare-fun b!1208208 () Bool)

(declare-fun res!803150 () Bool)

(assert (=> b!1208208 (=> (not res!803150) (not e!686164))))

(assert (=> b!1208208 (= res!803150 (and (= (size!38245 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38244 _keys!1208) (size!38245 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1208209 () Bool)

(declare-fun e!686155 () Bool)

(assert (=> b!1208209 (= e!686155 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!548306) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1208210 () Bool)

(declare-fun e!686167 () Bool)

(declare-fun arrayContainsKey!0 (array!78139 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1208210 (= e!686167 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1208211 () Bool)

(assert (=> b!1208211 call!59104))

(declare-fun lt!548300 () Unit!40051)

(assert (=> b!1208211 (= lt!548300 call!59102)))

(assert (=> b!1208211 (= e!686159 lt!548300)))

(declare-fun b!1208212 () Bool)

(declare-fun res!803162 () Bool)

(assert (=> b!1208212 (=> (not res!803162) (not e!686164))))

(assert (=> b!1208212 (= res!803162 (= (select (arr!37708 _keys!1208) i!673) k!934))))

(declare-fun b!1208213 () Bool)

(declare-fun e!686158 () Bool)

(assert (=> b!1208213 (= e!686158 tp_is_empty!30679)))

(declare-fun mapIsEmpty!47881 () Bool)

(declare-fun mapRes!47881 () Bool)

(assert (=> mapIsEmpty!47881 mapRes!47881))

(declare-fun b!1208214 () Bool)

(declare-fun e!686171 () Bool)

(declare-fun noDuplicate!1623 (List!26562) Bool)

(assert (=> b!1208214 (= e!686171 (noDuplicate!1623 Nil!26559))))

(declare-fun call!59103 () ListLongMap!17729)

(declare-fun bm!59099 () Bool)

(assert (=> bm!59099 (= call!59100 (contains!6940 (ite c!118839 lt!548297 call!59103) k!934))))

(declare-fun bm!59100 () Bool)

(assert (=> bm!59100 (= call!59103 call!59101)))

(declare-fun b!1208215 () Bool)

(assert (=> b!1208215 (= e!686157 e!686171)))

(declare-fun res!803155 () Bool)

(assert (=> b!1208215 (=> res!803155 e!686171)))

(assert (=> b!1208215 (= res!803155 (or (bvsge (size!38244 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38244 _keys!1208)) (bvsge from!1455 (size!38244 _keys!1208))))))

(assert (=> b!1208215 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26559)))

(declare-fun lt!548304 () Unit!40051)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78139 (_ BitVec 32) (_ BitVec 32)) Unit!40051)

(assert (=> b!1208215 (= lt!548304 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1208215 e!686167))

(declare-fun res!803163 () Bool)

(assert (=> b!1208215 (=> (not res!803163) (not e!686167))))

(assert (=> b!1208215 (= res!803163 e!686155)))

(declare-fun c!118842 () Bool)

(assert (=> b!1208215 (= c!118842 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!548294 () Unit!40051)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!582 (array!78139 array!78141 (_ BitVec 32) (_ BitVec 32) V!46033 V!46033 (_ BitVec 64) (_ BitVec 32) Int) Unit!40051)

(assert (=> b!1208215 (= lt!548294 (lemmaListMapContainsThenArrayContainsFrom!582 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!548301 () Unit!40051)

(assert (=> b!1208215 (= lt!548301 e!686166)))

(assert (=> b!1208215 (= c!118839 (and (not lt!548306) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1208215 (= lt!548306 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1208216 () Bool)

(declare-fun lt!548292 () Unit!40051)

(assert (=> b!1208216 (= e!686169 lt!548292)))

(assert (=> b!1208216 (= lt!548292 call!59102)))

(assert (=> b!1208216 call!59104))

(declare-fun b!1208217 () Bool)

(declare-fun e!686161 () Bool)

(assert (=> b!1208217 (= e!686168 (and e!686161 mapRes!47881))))

(declare-fun condMapEmpty!47881 () Bool)

(declare-fun mapDefault!47881 () ValueCell!14630)

