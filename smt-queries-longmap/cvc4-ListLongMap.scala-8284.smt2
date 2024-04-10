; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100910 () Bool)

(assert start!100910)

(declare-fun b_free!25979 () Bool)

(declare-fun b_next!25979 () Bool)

(assert (=> start!100910 (= b_free!25979 (not b_next!25979))))

(declare-fun tp!90947 () Bool)

(declare-fun b_and!42999 () Bool)

(assert (=> start!100910 (= tp!90947 b_and!42999)))

(declare-fun b!1208377 () Bool)

(declare-fun res!803251 () Bool)

(declare-fun e!686267 () Bool)

(assert (=> b!1208377 (=> (not res!803251) (not e!686267))))

(declare-datatypes ((array!78147 0))(
  ( (array!78148 (arr!37712 (Array (_ BitVec 32) (_ BitVec 64))) (size!38248 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78147)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78147 (_ BitVec 32)) Bool)

(assert (=> b!1208377 (= res!803251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1208378 () Bool)

(declare-fun res!803254 () Bool)

(declare-fun e!686266 () Bool)

(assert (=> b!1208378 (=> (not res!803254) (not e!686266))))

(declare-fun lt!548398 () array!78147)

(declare-datatypes ((List!26565 0))(
  ( (Nil!26562) (Cons!26561 (h!27770 (_ BitVec 64)) (t!39524 List!26565)) )
))
(declare-fun arrayNoDuplicates!0 (array!78147 (_ BitVec 32) List!26565) Bool)

(assert (=> b!1208378 (= res!803254 (arrayNoDuplicates!0 lt!548398 #b00000000000000000000000000000000 Nil!26562))))

(declare-fun b!1208379 () Bool)

(declare-fun res!803256 () Bool)

(assert (=> b!1208379 (=> (not res!803256) (not e!686267))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1208379 (= res!803256 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38248 _keys!1208))))))

(declare-fun e!686260 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1208380 () Bool)

(declare-fun arrayContainsKey!0 (array!78147 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1208380 (= e!686260 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-datatypes ((V!46037 0))(
  ( (V!46038 (val!15398 Int)) )
))
(declare-fun zeroValue!944 () V!46037)

(declare-datatypes ((tuple2!19764 0))(
  ( (tuple2!19765 (_1!9893 (_ BitVec 64)) (_2!9893 V!46037)) )
))
(declare-datatypes ((List!26566 0))(
  ( (Nil!26563) (Cons!26562 (h!27771 tuple2!19764) (t!39525 List!26566)) )
))
(declare-datatypes ((ListLongMap!17733 0))(
  ( (ListLongMap!17734 (toList!8882 List!26566)) )
))
(declare-fun call!59153 () ListLongMap!17733)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14632 0))(
  ( (ValueCellFull!14632 (v!18046 V!46037)) (EmptyCell!14632) )
))
(declare-datatypes ((array!78149 0))(
  ( (array!78150 (arr!37713 (Array (_ BitVec 32) ValueCell!14632)) (size!38249 (_ BitVec 32))) )
))
(declare-fun lt!548388 () array!78149)

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!59143 () Bool)

(declare-fun minValue!944 () V!46037)

(declare-fun getCurrentListMapNoExtraKeys!5316 (array!78147 array!78149 (_ BitVec 32) (_ BitVec 32) V!46037 V!46037 (_ BitVec 32) Int) ListLongMap!17733)

(assert (=> bm!59143 (= call!59153 (getCurrentListMapNoExtraKeys!5316 lt!548398 lt!548388 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40057 0))(
  ( (Unit!40058) )
))
(declare-fun call!59149 () Unit!40057)

(declare-fun c!118870 () Bool)

(declare-fun lt!548391 () ListLongMap!17733)

(declare-fun c!118872 () Bool)

(declare-fun lt!548393 () ListLongMap!17733)

(declare-fun bm!59144 () Bool)

(declare-fun addStillContains!1030 (ListLongMap!17733 (_ BitVec 64) V!46037 (_ BitVec 64)) Unit!40057)

(assert (=> bm!59144 (= call!59149 (addStillContains!1030 (ite c!118870 lt!548393 lt!548391) (ite c!118870 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118872 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118870 minValue!944 (ite c!118872 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1208381 () Bool)

(declare-fun e!686272 () Bool)

(declare-fun call!59147 () ListLongMap!17733)

(assert (=> b!1208381 (= e!686272 (= call!59153 call!59147))))

(declare-fun b!1208382 () Bool)

(declare-fun call!59152 () Bool)

(assert (=> b!1208382 call!59152))

(declare-fun lt!548394 () Unit!40057)

(declare-fun call!59146 () Unit!40057)

(assert (=> b!1208382 (= lt!548394 call!59146)))

(declare-fun e!686270 () Unit!40057)

(assert (=> b!1208382 (= e!686270 lt!548394)))

(declare-fun b!1208383 () Bool)

(assert (=> b!1208383 (= e!686267 e!686266)))

(declare-fun res!803258 () Bool)

(assert (=> b!1208383 (=> (not res!803258) (not e!686266))))

(assert (=> b!1208383 (= res!803258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!548398 mask!1564))))

(assert (=> b!1208383 (= lt!548398 (array!78148 (store (arr!37712 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38248 _keys!1208)))))

(declare-fun b!1208384 () Bool)

(declare-fun c!118868 () Bool)

(declare-fun lt!548390 () Bool)

(assert (=> b!1208384 (= c!118868 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!548390))))

(declare-fun e!686265 () Unit!40057)

(assert (=> b!1208384 (= e!686270 e!686265)))

(declare-fun mapIsEmpty!47887 () Bool)

(declare-fun mapRes!47887 () Bool)

(assert (=> mapIsEmpty!47887 mapRes!47887))

(declare-fun bm!59145 () Bool)

(assert (=> bm!59145 (= call!59146 call!59149)))

(declare-fun b!1208386 () Bool)

(declare-fun -!1836 (ListLongMap!17733 (_ BitVec 64)) ListLongMap!17733)

(assert (=> b!1208386 (= e!686272 (= call!59153 (-!1836 call!59147 k!934)))))

(declare-fun b!1208387 () Bool)

(declare-fun e!686273 () Unit!40057)

(declare-fun lt!548399 () Unit!40057)

(assert (=> b!1208387 (= e!686273 lt!548399)))

(declare-fun lt!548400 () Unit!40057)

(assert (=> b!1208387 (= lt!548400 (addStillContains!1030 lt!548391 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun +!4001 (ListLongMap!17733 tuple2!19764) ListLongMap!17733)

(assert (=> b!1208387 (= lt!548393 (+!4001 lt!548391 (tuple2!19765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun call!59150 () Bool)

(assert (=> b!1208387 call!59150))

(assert (=> b!1208387 (= lt!548399 call!59149)))

(declare-fun call!59148 () ListLongMap!17733)

(declare-fun contains!6942 (ListLongMap!17733 (_ BitVec 64)) Bool)

(assert (=> b!1208387 (contains!6942 call!59148 k!934)))

(declare-fun _values!996 () array!78149)

(declare-fun bm!59146 () Bool)

(assert (=> bm!59146 (= call!59147 (getCurrentListMapNoExtraKeys!5316 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!59151 () ListLongMap!17733)

(declare-fun bm!59147 () Bool)

(assert (=> bm!59147 (= call!59150 (contains!6942 (ite c!118870 lt!548393 call!59151) k!934))))

(declare-fun b!1208388 () Bool)

(declare-fun e!686263 () Bool)

(assert (=> b!1208388 (= e!686266 (not e!686263))))

(declare-fun res!803255 () Bool)

(assert (=> b!1208388 (=> res!803255 e!686263)))

(assert (=> b!1208388 (= res!803255 (bvsgt from!1455 i!673))))

(assert (=> b!1208388 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!548403 () Unit!40057)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78147 (_ BitVec 64) (_ BitVec 32)) Unit!40057)

(assert (=> b!1208388 (= lt!548403 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun bm!59148 () Bool)

(assert (=> bm!59148 (= call!59151 call!59148)))

(declare-fun b!1208389 () Bool)

(declare-fun e!686269 () Bool)

(assert (=> b!1208389 (= e!686269 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1208390 () Bool)

(declare-fun e!686268 () Bool)

(declare-fun tp_is_empty!30683 () Bool)

(assert (=> b!1208390 (= e!686268 tp_is_empty!30683)))

(declare-fun b!1208391 () Bool)

(declare-fun Unit!40059 () Unit!40057)

(assert (=> b!1208391 (= e!686265 Unit!40059)))

(declare-fun b!1208392 () Bool)

(declare-fun e!686271 () Bool)

(assert (=> b!1208392 (= e!686271 tp_is_empty!30683)))

(declare-fun b!1208393 () Bool)

(declare-fun res!803246 () Bool)

(assert (=> b!1208393 (=> (not res!803246) (not e!686267))))

(assert (=> b!1208393 (= res!803246 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26562))))

(declare-fun b!1208394 () Bool)

(declare-fun res!803259 () Bool)

(assert (=> b!1208394 (=> (not res!803259) (not e!686267))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1208394 (= res!803259 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!47887 () Bool)

(declare-fun tp!90946 () Bool)

(assert (=> mapNonEmpty!47887 (= mapRes!47887 (and tp!90946 e!686268))))

(declare-fun mapKey!47887 () (_ BitVec 32))

(declare-fun mapRest!47887 () (Array (_ BitVec 32) ValueCell!14632))

(declare-fun mapValue!47887 () ValueCell!14632)

(assert (=> mapNonEmpty!47887 (= (arr!37713 _values!996) (store mapRest!47887 mapKey!47887 mapValue!47887))))

(declare-fun b!1208395 () Bool)

(assert (=> b!1208395 (= e!686273 e!686270)))

(assert (=> b!1208395 (= c!118872 (and (not lt!548390) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1208396 () Bool)

(declare-fun res!803249 () Bool)

(assert (=> b!1208396 (=> (not res!803249) (not e!686267))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1208396 (= res!803249 (validKeyInArray!0 k!934))))

(declare-fun b!1208397 () Bool)

(declare-fun res!803260 () Bool)

(assert (=> b!1208397 (=> (not res!803260) (not e!686267))))

(assert (=> b!1208397 (= res!803260 (= (select (arr!37712 _keys!1208) i!673) k!934))))

(declare-fun b!1208398 () Bool)

(declare-fun e!686261 () Bool)

(assert (=> b!1208398 (= e!686263 e!686261)))

(declare-fun res!803252 () Bool)

(assert (=> b!1208398 (=> res!803252 e!686261)))

(assert (=> b!1208398 (= res!803252 (not (= from!1455 i!673)))))

(declare-fun lt!548402 () ListLongMap!17733)

(assert (=> b!1208398 (= lt!548402 (getCurrentListMapNoExtraKeys!5316 lt!548398 lt!548388 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3217 (Int (_ BitVec 64)) V!46037)

(assert (=> b!1208398 (= lt!548388 (array!78150 (store (arr!37713 _values!996) i!673 (ValueCellFull!14632 (dynLambda!3217 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38249 _values!996)))))

(declare-fun lt!548396 () ListLongMap!17733)

(assert (=> b!1208398 (= lt!548396 (getCurrentListMapNoExtraKeys!5316 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!803261 () Bool)

(assert (=> start!100910 (=> (not res!803261) (not e!686267))))

(assert (=> start!100910 (= res!803261 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38248 _keys!1208))))))

(assert (=> start!100910 e!686267))

(assert (=> start!100910 tp_is_empty!30683))

(declare-fun array_inv!28726 (array!78147) Bool)

(assert (=> start!100910 (array_inv!28726 _keys!1208)))

(assert (=> start!100910 true))

(assert (=> start!100910 tp!90947))

(declare-fun e!686259 () Bool)

(declare-fun array_inv!28727 (array!78149) Bool)

(assert (=> start!100910 (and (array_inv!28727 _values!996) e!686259)))

(declare-fun b!1208385 () Bool)

(declare-fun e!686258 () Bool)

(assert (=> b!1208385 (= e!686261 e!686258)))

(declare-fun res!803257 () Bool)

(assert (=> b!1208385 (=> res!803257 e!686258)))

(assert (=> b!1208385 (= res!803257 (not (= (select (arr!37712 _keys!1208) from!1455) k!934)))))

(assert (=> b!1208385 e!686272))

(declare-fun c!118871 () Bool)

(assert (=> b!1208385 (= c!118871 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!548389 () Unit!40057)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1044 (array!78147 array!78149 (_ BitVec 32) (_ BitVec 32) V!46037 V!46037 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40057)

(assert (=> b!1208385 (= lt!548389 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1044 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1208399 () Bool)

(declare-fun e!686262 () Bool)

(declare-fun e!686257 () Bool)

(assert (=> b!1208399 (= e!686262 e!686257)))

(declare-fun res!803247 () Bool)

(assert (=> b!1208399 (=> res!803247 e!686257)))

(assert (=> b!1208399 (= res!803247 (or (bvsge (size!38248 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38248 _keys!1208)) (bvsge from!1455 (size!38248 _keys!1208))))))

(assert (=> b!1208399 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26562)))

(declare-fun lt!548397 () Unit!40057)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78147 (_ BitVec 32) (_ BitVec 32)) Unit!40057)

(assert (=> b!1208399 (= lt!548397 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1208399 e!686269))

(declare-fun res!803248 () Bool)

(assert (=> b!1208399 (=> (not res!803248) (not e!686269))))

(assert (=> b!1208399 (= res!803248 e!686260)))

(declare-fun c!118869 () Bool)

(assert (=> b!1208399 (= c!118869 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!548401 () Unit!40057)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!584 (array!78147 array!78149 (_ BitVec 32) (_ BitVec 32) V!46037 V!46037 (_ BitVec 64) (_ BitVec 32) Int) Unit!40057)

(assert (=> b!1208399 (= lt!548401 (lemmaListMapContainsThenArrayContainsFrom!584 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!548395 () Unit!40057)

(assert (=> b!1208399 (= lt!548395 e!686273)))

(assert (=> b!1208399 (= c!118870 (and (not lt!548390) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1208399 (= lt!548390 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!59149 () Bool)

(assert (=> bm!59149 (= call!59152 call!59150)))

(declare-fun b!1208400 () Bool)

(assert (=> b!1208400 (= e!686259 (and e!686271 mapRes!47887))))

(declare-fun condMapEmpty!47887 () Bool)

(declare-fun mapDefault!47887 () ValueCell!14632)

