; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100520 () Bool)

(assert start!100520)

(declare-fun b_free!25843 () Bool)

(declare-fun b_next!25843 () Bool)

(assert (=> start!100520 (= b_free!25843 (not b_next!25843))))

(declare-fun tp!90518 () Bool)

(declare-fun b_and!42573 () Bool)

(assert (=> start!100520 (= tp!90518 b_and!42573)))

(declare-datatypes ((V!45857 0))(
  ( (V!45858 (val!15330 Int)) )
))
(declare-fun zeroValue!944 () V!45857)

(declare-datatypes ((ValueCell!14564 0))(
  ( (ValueCellFull!14564 (v!17968 V!45857)) (EmptyCell!14564) )
))
(declare-datatypes ((array!77867 0))(
  ( (array!77868 (arr!37578 (Array (_ BitVec 32) ValueCell!14564)) (size!38114 (_ BitVec 32))) )
))
(declare-fun lt!544298 () array!77867)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!57355 () Bool)

(declare-datatypes ((array!77869 0))(
  ( (array!77870 (arr!37579 (Array (_ BitVec 32) (_ BitVec 64))) (size!38115 (_ BitVec 32))) )
))
(declare-fun lt!544295 () array!77869)

(declare-fun minValue!944 () V!45857)

(declare-datatypes ((tuple2!19632 0))(
  ( (tuple2!19633 (_1!9827 (_ BitVec 64)) (_2!9827 V!45857)) )
))
(declare-datatypes ((List!26450 0))(
  ( (Nil!26447) (Cons!26446 (h!27655 tuple2!19632) (t!39273 List!26450)) )
))
(declare-datatypes ((ListLongMap!17601 0))(
  ( (ListLongMap!17602 (toList!8816 List!26450)) )
))
(declare-fun call!57359 () ListLongMap!17601)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5255 (array!77869 array!77867 (_ BitVec 32) (_ BitVec 32) V!45857 V!45857 (_ BitVec 32) Int) ListLongMap!17601)

(assert (=> bm!57355 (= call!57359 (getCurrentListMapNoExtraKeys!5255 lt!544295 lt!544298 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201109 () Bool)

(declare-fun e!682078 () Bool)

(declare-fun tp_is_empty!30547 () Bool)

(assert (=> b!1201109 (= e!682078 tp_is_empty!30547)))

(declare-fun res!799577 () Bool)

(declare-fun e!682083 () Bool)

(assert (=> start!100520 (=> (not res!799577) (not e!682083))))

(declare-fun _keys!1208 () array!77869)

(assert (=> start!100520 (= res!799577 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38115 _keys!1208))))))

(assert (=> start!100520 e!682083))

(assert (=> start!100520 tp_is_empty!30547))

(declare-fun array_inv!28638 (array!77869) Bool)

(assert (=> start!100520 (array_inv!28638 _keys!1208)))

(assert (=> start!100520 true))

(assert (=> start!100520 tp!90518))

(declare-fun _values!996 () array!77867)

(declare-fun e!682086 () Bool)

(declare-fun array_inv!28639 (array!77867) Bool)

(assert (=> start!100520 (and (array_inv!28639 _values!996) e!682086)))

(declare-fun b!1201110 () Bool)

(declare-fun e!682085 () Bool)

(assert (=> b!1201110 (= e!682083 e!682085)))

(declare-fun res!799574 () Bool)

(assert (=> b!1201110 (=> (not res!799574) (not e!682085))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77869 (_ BitVec 32)) Bool)

(assert (=> b!1201110 (= res!799574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544295 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1201110 (= lt!544295 (array!77870 (store (arr!37579 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38115 _keys!1208)))))

(declare-fun b!1201111 () Bool)

(declare-fun e!682081 () Bool)

(declare-fun e!682087 () Bool)

(assert (=> b!1201111 (= e!682081 e!682087)))

(declare-fun res!799581 () Bool)

(assert (=> b!1201111 (=> res!799581 e!682087)))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1201111 (= res!799581 (not (= (select (arr!37579 _keys!1208) from!1455) k!934)))))

(declare-fun e!682084 () Bool)

(assert (=> b!1201111 e!682084))

(declare-fun c!117476 () Bool)

(assert (=> b!1201111 (= c!117476 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!39820 0))(
  ( (Unit!39821) )
))
(declare-fun lt!544297 () Unit!39820)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!995 (array!77869 array!77867 (_ BitVec 32) (_ BitVec 32) V!45857 V!45857 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39820)

(assert (=> b!1201111 (= lt!544297 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!995 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201112 () Bool)

(declare-fun res!799584 () Bool)

(assert (=> b!1201112 (=> (not res!799584) (not e!682083))))

(assert (=> b!1201112 (= res!799584 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38115 _keys!1208))))))

(declare-fun b!1201113 () Bool)

(declare-fun call!57358 () ListLongMap!17601)

(assert (=> b!1201113 (= e!682084 (= call!57359 call!57358))))

(declare-fun mapNonEmpty!47663 () Bool)

(declare-fun mapRes!47663 () Bool)

(declare-fun tp!90519 () Bool)

(assert (=> mapNonEmpty!47663 (= mapRes!47663 (and tp!90519 e!682078))))

(declare-fun mapKey!47663 () (_ BitVec 32))

(declare-fun mapValue!47663 () ValueCell!14564)

(declare-fun mapRest!47663 () (Array (_ BitVec 32) ValueCell!14564))

(assert (=> mapNonEmpty!47663 (= (arr!37578 _values!996) (store mapRest!47663 mapKey!47663 mapValue!47663))))

(declare-fun b!1201114 () Bool)

(declare-fun res!799572 () Bool)

(assert (=> b!1201114 (=> (not res!799572) (not e!682083))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1201114 (= res!799572 (validKeyInArray!0 k!934))))

(declare-fun b!1201115 () Bool)

(declare-fun res!799575 () Bool)

(assert (=> b!1201115 (=> (not res!799575) (not e!682083))))

(assert (=> b!1201115 (= res!799575 (= (select (arr!37579 _keys!1208) i!673) k!934))))

(declare-fun b!1201116 () Bool)

(declare-fun e!682080 () Bool)

(assert (=> b!1201116 (= e!682080 e!682081)))

(declare-fun res!799582 () Bool)

(assert (=> b!1201116 (=> res!799582 e!682081)))

(assert (=> b!1201116 (= res!799582 (not (= from!1455 i!673)))))

(declare-fun lt!544300 () ListLongMap!17601)

(assert (=> b!1201116 (= lt!544300 (getCurrentListMapNoExtraKeys!5255 lt!544295 lt!544298 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3172 (Int (_ BitVec 64)) V!45857)

(assert (=> b!1201116 (= lt!544298 (array!77868 (store (arr!37578 _values!996) i!673 (ValueCellFull!14564 (dynLambda!3172 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38114 _values!996)))))

(declare-fun lt!544299 () ListLongMap!17601)

(assert (=> b!1201116 (= lt!544299 (getCurrentListMapNoExtraKeys!5255 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1201117 () Bool)

(declare-fun res!799578 () Bool)

(assert (=> b!1201117 (=> (not res!799578) (not e!682083))))

(assert (=> b!1201117 (= res!799578 (and (= (size!38114 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38115 _keys!1208) (size!38114 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1201118 () Bool)

(assert (=> b!1201118 (= e!682087 true)))

(declare-fun lt!544294 () Bool)

(declare-fun contains!6874 (ListLongMap!17601 (_ BitVec 64)) Bool)

(assert (=> b!1201118 (= lt!544294 (contains!6874 (getCurrentListMapNoExtraKeys!5255 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun b!1201119 () Bool)

(assert (=> b!1201119 (= e!682085 (not e!682080))))

(declare-fun res!799580 () Bool)

(assert (=> b!1201119 (=> res!799580 e!682080)))

(assert (=> b!1201119 (= res!799580 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77869 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1201119 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!544296 () Unit!39820)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77869 (_ BitVec 64) (_ BitVec 32)) Unit!39820)

(assert (=> b!1201119 (= lt!544296 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun bm!57356 () Bool)

(assert (=> bm!57356 (= call!57358 (getCurrentListMapNoExtraKeys!5255 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201120 () Bool)

(declare-fun -!1789 (ListLongMap!17601 (_ BitVec 64)) ListLongMap!17601)

(assert (=> b!1201120 (= e!682084 (= call!57359 (-!1789 call!57358 k!934)))))

(declare-fun b!1201121 () Bool)

(declare-fun res!799579 () Bool)

(assert (=> b!1201121 (=> (not res!799579) (not e!682083))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1201121 (= res!799579 (validMask!0 mask!1564))))

(declare-fun b!1201122 () Bool)

(declare-fun res!799576 () Bool)

(assert (=> b!1201122 (=> (not res!799576) (not e!682083))))

(declare-datatypes ((List!26451 0))(
  ( (Nil!26448) (Cons!26447 (h!27656 (_ BitVec 64)) (t!39274 List!26451)) )
))
(declare-fun arrayNoDuplicates!0 (array!77869 (_ BitVec 32) List!26451) Bool)

(assert (=> b!1201122 (= res!799576 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26448))))

(declare-fun mapIsEmpty!47663 () Bool)

(assert (=> mapIsEmpty!47663 mapRes!47663))

(declare-fun b!1201123 () Bool)

(declare-fun res!799573 () Bool)

(assert (=> b!1201123 (=> (not res!799573) (not e!682083))))

(assert (=> b!1201123 (= res!799573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1201124 () Bool)

(declare-fun e!682082 () Bool)

(assert (=> b!1201124 (= e!682082 tp_is_empty!30547)))

(declare-fun b!1201125 () Bool)

(assert (=> b!1201125 (= e!682086 (and e!682082 mapRes!47663))))

(declare-fun condMapEmpty!47663 () Bool)

(declare-fun mapDefault!47663 () ValueCell!14564)

