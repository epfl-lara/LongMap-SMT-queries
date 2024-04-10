; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101654 () Bool)

(assert start!101654)

(declare-fun b_free!26375 () Bool)

(declare-fun b_next!26375 () Bool)

(assert (=> start!101654 (= b_free!26375 (not b_next!26375))))

(declare-fun tp!92168 () Bool)

(declare-fun b_and!43993 () Bool)

(assert (=> start!101654 (= tp!92168 b_and!43993)))

(declare-fun b!1222852 () Bool)

(declare-fun res!812502 () Bool)

(declare-fun e!694485 () Bool)

(assert (=> b!1222852 (=> (not res!812502) (not e!694485))))

(declare-datatypes ((array!78941 0))(
  ( (array!78942 (arr!38098 (Array (_ BitVec 32) (_ BitVec 64))) (size!38634 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78941)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1222852 (= res!812502 (= (select (arr!38098 _keys!1208) i!673) k!934))))

(declare-fun b!1222853 () Bool)

(declare-datatypes ((Unit!40508 0))(
  ( (Unit!40509) )
))
(declare-fun e!694489 () Unit!40508)

(declare-fun Unit!40510 () Unit!40508)

(assert (=> b!1222853 (= e!694489 Unit!40510)))

(declare-fun lt!556452 () Unit!40508)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78941 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40508)

(assert (=> b!1222853 (= lt!556452 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!78941 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1222853 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!556454 () Unit!40508)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78941 (_ BitVec 32) (_ BitVec 32)) Unit!40508)

(assert (=> b!1222853 (= lt!556454 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26892 0))(
  ( (Nil!26889) (Cons!26888 (h!28097 (_ BitVec 64)) (t!40247 List!26892)) )
))
(declare-fun arrayNoDuplicates!0 (array!78941 (_ BitVec 32) List!26892) Bool)

(assert (=> b!1222853 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26889)))

(declare-fun lt!556456 () Unit!40508)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78941 (_ BitVec 64) (_ BitVec 32) List!26892) Unit!40508)

(assert (=> b!1222853 (= lt!556456 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!26889))))

(assert (=> b!1222853 false))

(declare-fun b!1222854 () Bool)

(declare-fun res!812501 () Bool)

(assert (=> b!1222854 (=> (not res!812501) (not e!694485))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!46565 0))(
  ( (V!46566 (val!15596 Int)) )
))
(declare-datatypes ((ValueCell!14830 0))(
  ( (ValueCellFull!14830 (v!18257 V!46565)) (EmptyCell!14830) )
))
(declare-datatypes ((array!78943 0))(
  ( (array!78944 (arr!38099 (Array (_ BitVec 32) ValueCell!14830)) (size!38635 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78943)

(assert (=> b!1222854 (= res!812501 (and (= (size!38635 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38634 _keys!1208) (size!38635 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1222855 () Bool)

(declare-fun e!694483 () Bool)

(assert (=> b!1222855 (= e!694483 (bvslt from!1455 (size!38634 _keys!1208)))))

(assert (=> b!1222855 (not (= (select (arr!38098 _keys!1208) from!1455) k!934))))

(declare-fun lt!556449 () Unit!40508)

(assert (=> b!1222855 (= lt!556449 e!694489)))

(declare-fun c!120344 () Bool)

(assert (=> b!1222855 (= c!120344 (= (select (arr!38098 _keys!1208) from!1455) k!934))))

(declare-fun e!694486 () Bool)

(assert (=> b!1222855 e!694486))

(declare-fun res!812504 () Bool)

(assert (=> b!1222855 (=> (not res!812504) (not e!694486))))

(declare-datatypes ((tuple2!20092 0))(
  ( (tuple2!20093 (_1!10057 (_ BitVec 64)) (_2!10057 V!46565)) )
))
(declare-datatypes ((List!26893 0))(
  ( (Nil!26890) (Cons!26889 (h!28098 tuple2!20092) (t!40248 List!26893)) )
))
(declare-datatypes ((ListLongMap!18061 0))(
  ( (ListLongMap!18062 (toList!9046 List!26893)) )
))
(declare-fun lt!556453 () ListLongMap!18061)

(declare-fun lt!556457 () ListLongMap!18061)

(declare-fun lt!556459 () V!46565)

(declare-fun +!4106 (ListLongMap!18061 tuple2!20092) ListLongMap!18061)

(declare-fun get!19451 (ValueCell!14830 V!46565) V!46565)

(assert (=> b!1222855 (= res!812504 (= lt!556453 (+!4106 lt!556457 (tuple2!20093 (select (arr!38098 _keys!1208) from!1455) (get!19451 (select (arr!38099 _values!996) from!1455) lt!556459)))))))

(declare-fun b!1222856 () Bool)

(declare-fun e!694484 () Bool)

(assert (=> b!1222856 (= e!694486 e!694484)))

(declare-fun res!812513 () Bool)

(assert (=> b!1222856 (=> res!812513 e!694484)))

(assert (=> b!1222856 (= res!812513 (not (= (select (arr!38098 _keys!1208) from!1455) k!934)))))

(declare-fun mapIsEmpty!48514 () Bool)

(declare-fun mapRes!48514 () Bool)

(assert (=> mapIsEmpty!48514 mapRes!48514))

(declare-fun b!1222857 () Bool)

(declare-fun e!694487 () Bool)

(declare-fun tp_is_empty!31079 () Bool)

(assert (=> b!1222857 (= e!694487 tp_is_empty!31079)))

(declare-fun b!1222858 () Bool)

(declare-fun e!694480 () Bool)

(assert (=> b!1222858 (= e!694480 e!694483)))

(declare-fun res!812507 () Bool)

(assert (=> b!1222858 (=> res!812507 e!694483)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1222858 (= res!812507 (not (validKeyInArray!0 (select (arr!38098 _keys!1208) from!1455))))))

(declare-fun lt!556458 () ListLongMap!18061)

(assert (=> b!1222858 (= lt!556458 lt!556457)))

(declare-fun lt!556461 () ListLongMap!18061)

(declare-fun -!1949 (ListLongMap!18061 (_ BitVec 64)) ListLongMap!18061)

(assert (=> b!1222858 (= lt!556457 (-!1949 lt!556461 k!934))))

(declare-fun zeroValue!944 () V!46565)

(declare-fun lt!556462 () array!78941)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!556460 () array!78943)

(declare-fun minValue!944 () V!46565)

(declare-fun getCurrentListMapNoExtraKeys!5468 (array!78941 array!78943 (_ BitVec 32) (_ BitVec 32) V!46565 V!46565 (_ BitVec 32) Int) ListLongMap!18061)

(assert (=> b!1222858 (= lt!556458 (getCurrentListMapNoExtraKeys!5468 lt!556462 lt!556460 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1222858 (= lt!556461 (getCurrentListMapNoExtraKeys!5468 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!556455 () Unit!40508)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1156 (array!78941 array!78943 (_ BitVec 32) (_ BitVec 32) V!46565 V!46565 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40508)

(assert (=> b!1222858 (= lt!556455 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1156 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1222859 () Bool)

(declare-fun e!694488 () Bool)

(declare-fun e!694482 () Bool)

(assert (=> b!1222859 (= e!694488 (not e!694482))))

(declare-fun res!812503 () Bool)

(assert (=> b!1222859 (=> res!812503 e!694482)))

(assert (=> b!1222859 (= res!812503 (bvsgt from!1455 i!673))))

(assert (=> b!1222859 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!556450 () Unit!40508)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78941 (_ BitVec 64) (_ BitVec 32)) Unit!40508)

(assert (=> b!1222859 (= lt!556450 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1222860 () Bool)

(declare-fun res!812509 () Bool)

(assert (=> b!1222860 (=> (not res!812509) (not e!694485))))

(assert (=> b!1222860 (= res!812509 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26889))))

(declare-fun res!812505 () Bool)

(assert (=> start!101654 (=> (not res!812505) (not e!694485))))

(assert (=> start!101654 (= res!812505 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38634 _keys!1208))))))

(assert (=> start!101654 e!694485))

(assert (=> start!101654 tp_is_empty!31079))

(declare-fun array_inv!28990 (array!78941) Bool)

(assert (=> start!101654 (array_inv!28990 _keys!1208)))

(assert (=> start!101654 true))

(assert (=> start!101654 tp!92168))

(declare-fun e!694481 () Bool)

(declare-fun array_inv!28991 (array!78943) Bool)

(assert (=> start!101654 (and (array_inv!28991 _values!996) e!694481)))

(declare-fun b!1222861 () Bool)

(declare-fun res!812499 () Bool)

(assert (=> b!1222861 (=> (not res!812499) (not e!694485))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1222861 (= res!812499 (validMask!0 mask!1564))))

(declare-fun b!1222862 () Bool)

(assert (=> b!1222862 (= e!694485 e!694488)))

(declare-fun res!812506 () Bool)

(assert (=> b!1222862 (=> (not res!812506) (not e!694488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78941 (_ BitVec 32)) Bool)

(assert (=> b!1222862 (= res!812506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!556462 mask!1564))))

(assert (=> b!1222862 (= lt!556462 (array!78942 (store (arr!38098 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38634 _keys!1208)))))

(declare-fun b!1222863 () Bool)

(declare-fun res!812511 () Bool)

(assert (=> b!1222863 (=> (not res!812511) (not e!694485))))

(assert (=> b!1222863 (= res!812511 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38634 _keys!1208))))))

(declare-fun mapNonEmpty!48514 () Bool)

(declare-fun tp!92167 () Bool)

(assert (=> mapNonEmpty!48514 (= mapRes!48514 (and tp!92167 e!694487))))

(declare-fun mapValue!48514 () ValueCell!14830)

(declare-fun mapKey!48514 () (_ BitVec 32))

(declare-fun mapRest!48514 () (Array (_ BitVec 32) ValueCell!14830))

(assert (=> mapNonEmpty!48514 (= (arr!38099 _values!996) (store mapRest!48514 mapKey!48514 mapValue!48514))))

(declare-fun b!1222864 () Bool)

(assert (=> b!1222864 (= e!694482 e!694480)))

(declare-fun res!812512 () Bool)

(assert (=> b!1222864 (=> res!812512 e!694480)))

(assert (=> b!1222864 (= res!812512 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1222864 (= lt!556453 (getCurrentListMapNoExtraKeys!5468 lt!556462 lt!556460 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1222864 (= lt!556460 (array!78944 (store (arr!38099 _values!996) i!673 (ValueCellFull!14830 lt!556459)) (size!38635 _values!996)))))

(declare-fun dynLambda!3344 (Int (_ BitVec 64)) V!46565)

(assert (=> b!1222864 (= lt!556459 (dynLambda!3344 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!556451 () ListLongMap!18061)

(assert (=> b!1222864 (= lt!556451 (getCurrentListMapNoExtraKeys!5468 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1222865 () Bool)

(declare-fun e!694491 () Bool)

(assert (=> b!1222865 (= e!694491 tp_is_empty!31079)))

(declare-fun b!1222866 () Bool)

(assert (=> b!1222866 (= e!694484 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1222867 () Bool)

(declare-fun res!812508 () Bool)

(assert (=> b!1222867 (=> (not res!812508) (not e!694485))))

(assert (=> b!1222867 (= res!812508 (validKeyInArray!0 k!934))))

(declare-fun b!1222868 () Bool)

(declare-fun res!812510 () Bool)

(assert (=> b!1222868 (=> (not res!812510) (not e!694488))))

(assert (=> b!1222868 (= res!812510 (arrayNoDuplicates!0 lt!556462 #b00000000000000000000000000000000 Nil!26889))))

(declare-fun b!1222869 () Bool)

(declare-fun res!812500 () Bool)

(assert (=> b!1222869 (=> (not res!812500) (not e!694485))))

(assert (=> b!1222869 (= res!812500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1222870 () Bool)

(assert (=> b!1222870 (= e!694481 (and e!694491 mapRes!48514))))

(declare-fun condMapEmpty!48514 () Bool)

(declare-fun mapDefault!48514 () ValueCell!14830)

