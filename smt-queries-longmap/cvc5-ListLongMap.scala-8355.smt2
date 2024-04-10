; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101712 () Bool)

(assert start!101712)

(declare-fun b_free!26401 () Bool)

(declare-fun b_next!26401 () Bool)

(assert (=> start!101712 (= b_free!26401 (not b_next!26401))))

(declare-fun tp!92248 () Bool)

(declare-fun b_and!44063 () Bool)

(assert (=> start!101712 (= tp!92248 b_and!44063)))

(declare-datatypes ((array!78993 0))(
  ( (array!78994 (arr!38123 (Array (_ BitVec 32) (_ BitVec 64))) (size!38659 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78993)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun e!695073 () Bool)

(declare-fun b!1223832 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!78993 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1223832 (= e!695073 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1223834 () Bool)

(declare-fun e!695072 () Bool)

(declare-datatypes ((V!46601 0))(
  ( (V!46602 (val!15609 Int)) )
))
(declare-datatypes ((tuple2!20114 0))(
  ( (tuple2!20115 (_1!10068 (_ BitVec 64)) (_2!10068 V!46601)) )
))
(declare-datatypes ((List!26914 0))(
  ( (Nil!26911) (Cons!26910 (h!28119 tuple2!20114) (t!40295 List!26914)) )
))
(declare-datatypes ((ListLongMap!18083 0))(
  ( (ListLongMap!18084 (toList!9057 List!26914)) )
))
(declare-fun lt!557113 () ListLongMap!18083)

(declare-fun lt!557126 () ListLongMap!18083)

(assert (=> b!1223834 (= e!695072 (= lt!557113 lt!557126))))

(declare-fun e!695076 () Bool)

(assert (=> b!1223834 e!695076))

(declare-fun res!813187 () Bool)

(assert (=> b!1223834 (=> (not res!813187) (not e!695076))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1223834 (= res!813187 (not (= (select (arr!38123 _keys!1208) from!1455) k!934)))))

(declare-datatypes ((Unit!40546 0))(
  ( (Unit!40547) )
))
(declare-fun lt!557114 () Unit!40546)

(declare-fun e!695074 () Unit!40546)

(assert (=> b!1223834 (= lt!557114 e!695074)))

(declare-fun c!120422 () Bool)

(assert (=> b!1223834 (= c!120422 (= (select (arr!38123 _keys!1208) from!1455) k!934))))

(declare-fun e!695083 () Bool)

(assert (=> b!1223834 e!695083))

(declare-fun res!813175 () Bool)

(assert (=> b!1223834 (=> (not res!813175) (not e!695083))))

(declare-fun lt!557122 () tuple2!20114)

(declare-fun lt!557120 () ListLongMap!18083)

(declare-fun +!4114 (ListLongMap!18083 tuple2!20114) ListLongMap!18083)

(assert (=> b!1223834 (= res!813175 (= lt!557120 (+!4114 lt!557113 lt!557122)))))

(declare-fun lt!557125 () V!46601)

(declare-datatypes ((ValueCell!14843 0))(
  ( (ValueCellFull!14843 (v!18271 V!46601)) (EmptyCell!14843) )
))
(declare-datatypes ((array!78995 0))(
  ( (array!78996 (arr!38124 (Array (_ BitVec 32) ValueCell!14843)) (size!38660 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78995)

(declare-fun get!19469 (ValueCell!14843 V!46601) V!46601)

(assert (=> b!1223834 (= lt!557122 (tuple2!20115 (select (arr!38123 _keys!1208) from!1455) (get!19469 (select (arr!38124 _values!996) from!1455) lt!557125)))))

(declare-fun b!1223835 () Bool)

(declare-fun res!813179 () Bool)

(declare-fun e!695071 () Bool)

(assert (=> b!1223835 (=> (not res!813179) (not e!695071))))

(declare-datatypes ((List!26915 0))(
  ( (Nil!26912) (Cons!26911 (h!28120 (_ BitVec 64)) (t!40296 List!26915)) )
))
(declare-fun arrayNoDuplicates!0 (array!78993 (_ BitVec 32) List!26915) Bool)

(assert (=> b!1223835 (= res!813179 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26912))))

(declare-fun b!1223836 () Bool)

(declare-fun e!695077 () Bool)

(declare-fun e!695078 () Bool)

(assert (=> b!1223836 (= e!695077 e!695078)))

(declare-fun res!813172 () Bool)

(assert (=> b!1223836 (=> res!813172 e!695078)))

(assert (=> b!1223836 (= res!813172 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46601)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!557112 () array!78993)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46601)

(declare-fun lt!557115 () array!78995)

(declare-fun getCurrentListMapNoExtraKeys!5479 (array!78993 array!78995 (_ BitVec 32) (_ BitVec 32) V!46601 V!46601 (_ BitVec 32) Int) ListLongMap!18083)

(assert (=> b!1223836 (= lt!557120 (getCurrentListMapNoExtraKeys!5479 lt!557112 lt!557115 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1223836 (= lt!557115 (array!78996 (store (arr!38124 _values!996) i!673 (ValueCellFull!14843 lt!557125)) (size!38660 _values!996)))))

(declare-fun dynLambda!3352 (Int (_ BitVec 64)) V!46601)

(assert (=> b!1223836 (= lt!557125 (dynLambda!3352 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!557121 () ListLongMap!18083)

(assert (=> b!1223836 (= lt!557121 (getCurrentListMapNoExtraKeys!5479 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1223837 () Bool)

(assert (=> b!1223837 (= e!695083 e!695073)))

(declare-fun res!813173 () Bool)

(assert (=> b!1223837 (=> res!813173 e!695073)))

(assert (=> b!1223837 (= res!813173 (not (= (select (arr!38123 _keys!1208) from!1455) k!934)))))

(declare-fun b!1223838 () Bool)

(declare-fun Unit!40548 () Unit!40546)

(assert (=> b!1223838 (= e!695074 Unit!40548)))

(declare-fun mapIsEmpty!48556 () Bool)

(declare-fun mapRes!48556 () Bool)

(assert (=> mapIsEmpty!48556 mapRes!48556))

(declare-fun b!1223839 () Bool)

(declare-fun e!695082 () Bool)

(declare-fun tp_is_empty!31105 () Bool)

(assert (=> b!1223839 (= e!695082 tp_is_empty!31105)))

(declare-fun b!1223840 () Bool)

(declare-fun res!813184 () Bool)

(assert (=> b!1223840 (=> (not res!813184) (not e!695071))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1223840 (= res!813184 (validMask!0 mask!1564))))

(declare-fun b!1223841 () Bool)

(declare-fun e!695080 () Bool)

(assert (=> b!1223841 (= e!695080 (not e!695077))))

(declare-fun res!813174 () Bool)

(assert (=> b!1223841 (=> res!813174 e!695077)))

(assert (=> b!1223841 (= res!813174 (bvsgt from!1455 i!673))))

(assert (=> b!1223841 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!557124 () Unit!40546)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78993 (_ BitVec 64) (_ BitVec 32)) Unit!40546)

(assert (=> b!1223841 (= lt!557124 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1223842 () Bool)

(assert (=> b!1223842 (= e!695078 e!695072)))

(declare-fun res!813183 () Bool)

(assert (=> b!1223842 (=> res!813183 e!695072)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1223842 (= res!813183 (not (validKeyInArray!0 (select (arr!38123 _keys!1208) from!1455))))))

(assert (=> b!1223842 (= lt!557126 lt!557113)))

(declare-fun lt!557123 () ListLongMap!18083)

(declare-fun -!1959 (ListLongMap!18083 (_ BitVec 64)) ListLongMap!18083)

(assert (=> b!1223842 (= lt!557113 (-!1959 lt!557123 k!934))))

(assert (=> b!1223842 (= lt!557126 (getCurrentListMapNoExtraKeys!5479 lt!557112 lt!557115 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1223842 (= lt!557123 (getCurrentListMapNoExtraKeys!5479 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!557119 () Unit!40546)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1166 (array!78993 array!78995 (_ BitVec 32) (_ BitVec 32) V!46601 V!46601 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40546)

(assert (=> b!1223842 (= lt!557119 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1166 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1223843 () Bool)

(declare-fun res!813186 () Bool)

(assert (=> b!1223843 (=> (not res!813186) (not e!695071))))

(assert (=> b!1223843 (= res!813186 (= (select (arr!38123 _keys!1208) i!673) k!934))))

(declare-fun b!1223844 () Bool)

(assert (=> b!1223844 (= e!695071 e!695080)))

(declare-fun res!813177 () Bool)

(assert (=> b!1223844 (=> (not res!813177) (not e!695080))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78993 (_ BitVec 32)) Bool)

(assert (=> b!1223844 (= res!813177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!557112 mask!1564))))

(assert (=> b!1223844 (= lt!557112 (array!78994 (store (arr!38123 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38659 _keys!1208)))))

(declare-fun res!813176 () Bool)

(assert (=> start!101712 (=> (not res!813176) (not e!695071))))

(assert (=> start!101712 (= res!813176 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38659 _keys!1208))))))

(assert (=> start!101712 e!695071))

(assert (=> start!101712 tp_is_empty!31105))

(declare-fun array_inv!29002 (array!78993) Bool)

(assert (=> start!101712 (array_inv!29002 _keys!1208)))

(assert (=> start!101712 true))

(assert (=> start!101712 tp!92248))

(declare-fun e!695075 () Bool)

(declare-fun array_inv!29003 (array!78995) Bool)

(assert (=> start!101712 (and (array_inv!29003 _values!996) e!695075)))

(declare-fun b!1223833 () Bool)

(assert (=> b!1223833 (= e!695075 (and e!695082 mapRes!48556))))

(declare-fun condMapEmpty!48556 () Bool)

(declare-fun mapDefault!48556 () ValueCell!14843)

