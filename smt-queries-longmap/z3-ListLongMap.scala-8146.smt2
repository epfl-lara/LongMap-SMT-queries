; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99978 () Bool)

(assert start!99978)

(declare-fun b_free!25321 () Bool)

(declare-fun b_next!25321 () Bool)

(assert (=> start!99978 (= b_free!25321 (not b_next!25321))))

(declare-fun tp!88677 () Bool)

(declare-fun b_and!41511 () Bool)

(assert (=> start!99978 (= tp!88677 b_and!41511)))

(declare-fun b!1185526 () Bool)

(declare-fun res!787639 () Bool)

(declare-fun e!674149 () Bool)

(assert (=> b!1185526 (=> (not res!787639) (not e!674149))))

(declare-datatypes ((array!76547 0))(
  ( (array!76548 (arr!36917 (Array (_ BitVec 32) (_ BitVec 64))) (size!37454 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76547)

(declare-datatypes ((List!25984 0))(
  ( (Nil!25981) (Cons!25980 (h!27198 (_ BitVec 64)) (t!38289 List!25984)) )
))
(declare-fun arrayNoDuplicates!0 (array!76547 (_ BitVec 32) List!25984) Bool)

(assert (=> b!1185526 (= res!787639 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25981))))

(declare-fun b!1185527 () Bool)

(declare-fun res!787646 () Bool)

(declare-fun e!674148 () Bool)

(assert (=> b!1185527 (=> (not res!787646) (not e!674148))))

(declare-fun lt!537391 () array!76547)

(assert (=> b!1185527 (= res!787646 (arrayNoDuplicates!0 lt!537391 #b00000000000000000000000000000000 Nil!25981))))

(declare-fun b!1185528 () Bool)

(declare-fun res!787645 () Bool)

(assert (=> b!1185528 (=> (not res!787645) (not e!674149))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76547 (_ BitVec 32)) Bool)

(assert (=> b!1185528 (= res!787645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1185529 () Bool)

(declare-fun e!674144 () Bool)

(declare-fun e!674150 () Bool)

(assert (=> b!1185529 (= e!674144 e!674150)))

(declare-fun res!787640 () Bool)

(assert (=> b!1185529 (=> res!787640 e!674150)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1185529 (= res!787640 (not (validKeyInArray!0 (select (arr!36917 _keys!1208) from!1455))))))

(declare-datatypes ((V!44929 0))(
  ( (V!44930 (val!14982 Int)) )
))
(declare-datatypes ((tuple2!19252 0))(
  ( (tuple2!19253 (_1!9637 (_ BitVec 64)) (_2!9637 V!44929)) )
))
(declare-datatypes ((List!25985 0))(
  ( (Nil!25982) (Cons!25981 (h!27199 tuple2!19252) (t!38290 List!25985)) )
))
(declare-datatypes ((ListLongMap!17229 0))(
  ( (ListLongMap!17230 (toList!8630 List!25985)) )
))
(declare-fun lt!537400 () ListLongMap!17229)

(declare-fun lt!537401 () ListLongMap!17229)

(assert (=> b!1185529 (= lt!537400 lt!537401)))

(declare-fun lt!537399 () ListLongMap!17229)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1651 (ListLongMap!17229 (_ BitVec 64)) ListLongMap!17229)

(assert (=> b!1185529 (= lt!537401 (-!1651 lt!537399 k0!934))))

(declare-fun zeroValue!944 () V!44929)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14216 0))(
  ( (ValueCellFull!14216 (v!17616 V!44929)) (EmptyCell!14216) )
))
(declare-datatypes ((array!76549 0))(
  ( (array!76550 (arr!36918 (Array (_ BitVec 32) ValueCell!14216)) (size!37455 (_ BitVec 32))) )
))
(declare-fun lt!537395 () array!76549)

(declare-fun minValue!944 () V!44929)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5101 (array!76547 array!76549 (_ BitVec 32) (_ BitVec 32) V!44929 V!44929 (_ BitVec 32) Int) ListLongMap!17229)

(assert (=> b!1185529 (= lt!537400 (getCurrentListMapNoExtraKeys!5101 lt!537391 lt!537395 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!76549)

(assert (=> b!1185529 (= lt!537399 (getCurrentListMapNoExtraKeys!5101 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39204 0))(
  ( (Unit!39205) )
))
(declare-fun lt!537387 () Unit!39204)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!872 (array!76547 array!76549 (_ BitVec 32) (_ BitVec 32) V!44929 V!44929 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39204)

(assert (=> b!1185529 (= lt!537387 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!872 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1185530 () Bool)

(declare-fun e!674143 () Bool)

(declare-fun e!674145 () Bool)

(declare-fun mapRes!46604 () Bool)

(assert (=> b!1185530 (= e!674143 (and e!674145 mapRes!46604))))

(declare-fun condMapEmpty!46604 () Bool)

(declare-fun mapDefault!46604 () ValueCell!14216)

(assert (=> b!1185530 (= condMapEmpty!46604 (= (arr!36918 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14216)) mapDefault!46604)))))

(declare-fun b!1185531 () Bool)

(declare-fun res!787635 () Bool)

(assert (=> b!1185531 (=> (not res!787635) (not e!674149))))

(assert (=> b!1185531 (= res!787635 (validKeyInArray!0 k0!934))))

(declare-fun b!1185532 () Bool)

(declare-fun e!674147 () Bool)

(declare-fun e!674140 () Bool)

(assert (=> b!1185532 (= e!674147 e!674140)))

(declare-fun res!787636 () Bool)

(assert (=> b!1185532 (=> res!787636 e!674140)))

(assert (=> b!1185532 (= res!787636 (not (= (select (arr!36917 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1185533 () Bool)

(declare-fun res!787633 () Bool)

(assert (=> b!1185533 (=> (not res!787633) (not e!674149))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1185533 (= res!787633 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!46604 () Bool)

(assert (=> mapIsEmpty!46604 mapRes!46604))

(declare-fun res!787643 () Bool)

(assert (=> start!99978 (=> (not res!787643) (not e!674149))))

(assert (=> start!99978 (= res!787643 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37454 _keys!1208))))))

(assert (=> start!99978 e!674149))

(declare-fun tp_is_empty!29851 () Bool)

(assert (=> start!99978 tp_is_empty!29851))

(declare-fun array_inv!28248 (array!76547) Bool)

(assert (=> start!99978 (array_inv!28248 _keys!1208)))

(assert (=> start!99978 true))

(assert (=> start!99978 tp!88677))

(declare-fun array_inv!28249 (array!76549) Bool)

(assert (=> start!99978 (and (array_inv!28249 _values!996) e!674143)))

(declare-fun b!1185534 () Bool)

(assert (=> b!1185534 (= e!674145 tp_is_empty!29851)))

(declare-fun b!1185535 () Bool)

(assert (=> b!1185535 (= e!674150 true)))

(declare-fun lt!537403 () ListLongMap!17229)

(declare-fun lt!537392 () ListLongMap!17229)

(assert (=> b!1185535 (= (-!1651 lt!537403 k0!934) lt!537392)))

(declare-fun lt!537390 () Unit!39204)

(declare-fun lt!537389 () V!44929)

(declare-fun addRemoveCommutativeForDiffKeys!165 (ListLongMap!17229 (_ BitVec 64) V!44929 (_ BitVec 64)) Unit!39204)

(assert (=> b!1185535 (= lt!537390 (addRemoveCommutativeForDiffKeys!165 lt!537399 (select (arr!36917 _keys!1208) from!1455) lt!537389 k0!934))))

(declare-fun lt!537397 () ListLongMap!17229)

(assert (=> b!1185535 (and (= lt!537397 lt!537403) (= lt!537401 lt!537400))))

(declare-fun lt!537402 () tuple2!19252)

(declare-fun +!3949 (ListLongMap!17229 tuple2!19252) ListLongMap!17229)

(assert (=> b!1185535 (= lt!537403 (+!3949 lt!537399 lt!537402))))

(assert (=> b!1185535 (not (= (select (arr!36917 _keys!1208) from!1455) k0!934))))

(declare-fun lt!537388 () Unit!39204)

(declare-fun e!674142 () Unit!39204)

(assert (=> b!1185535 (= lt!537388 e!674142)))

(declare-fun c!117503 () Bool)

(assert (=> b!1185535 (= c!117503 (= (select (arr!36917 _keys!1208) from!1455) k0!934))))

(assert (=> b!1185535 e!674147))

(declare-fun res!787644 () Bool)

(assert (=> b!1185535 (=> (not res!787644) (not e!674147))))

(declare-fun lt!537385 () ListLongMap!17229)

(assert (=> b!1185535 (= res!787644 (= lt!537385 lt!537392))))

(assert (=> b!1185535 (= lt!537392 (+!3949 lt!537401 lt!537402))))

(assert (=> b!1185535 (= lt!537402 (tuple2!19253 (select (arr!36917 _keys!1208) from!1455) lt!537389))))

(declare-fun lt!537386 () V!44929)

(declare-fun get!18934 (ValueCell!14216 V!44929) V!44929)

(assert (=> b!1185535 (= lt!537389 (get!18934 (select (arr!36918 _values!996) from!1455) lt!537386))))

(declare-fun mapNonEmpty!46604 () Bool)

(declare-fun tp!88676 () Bool)

(declare-fun e!674146 () Bool)

(assert (=> mapNonEmpty!46604 (= mapRes!46604 (and tp!88676 e!674146))))

(declare-fun mapValue!46604 () ValueCell!14216)

(declare-fun mapRest!46604 () (Array (_ BitVec 32) ValueCell!14216))

(declare-fun mapKey!46604 () (_ BitVec 32))

(assert (=> mapNonEmpty!46604 (= (arr!36918 _values!996) (store mapRest!46604 mapKey!46604 mapValue!46604))))

(declare-fun b!1185536 () Bool)

(declare-fun res!787634 () Bool)

(assert (=> b!1185536 (=> (not res!787634) (not e!674149))))

(assert (=> b!1185536 (= res!787634 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37454 _keys!1208))))))

(declare-fun b!1185537 () Bool)

(declare-fun res!787642 () Bool)

(assert (=> b!1185537 (=> (not res!787642) (not e!674149))))

(assert (=> b!1185537 (= res!787642 (= (select (arr!36917 _keys!1208) i!673) k0!934))))

(declare-fun b!1185538 () Bool)

(declare-fun e!674139 () Bool)

(assert (=> b!1185538 (= e!674139 e!674144)))

(declare-fun res!787632 () Bool)

(assert (=> b!1185538 (=> res!787632 e!674144)))

(assert (=> b!1185538 (= res!787632 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1185538 (= lt!537385 (getCurrentListMapNoExtraKeys!5101 lt!537391 lt!537395 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1185538 (= lt!537395 (array!76550 (store (arr!36918 _values!996) i!673 (ValueCellFull!14216 lt!537386)) (size!37455 _values!996)))))

(declare-fun dynLambda!3064 (Int (_ BitVec 64)) V!44929)

(assert (=> b!1185538 (= lt!537386 (dynLambda!3064 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1185538 (= lt!537397 (getCurrentListMapNoExtraKeys!5101 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1185539 () Bool)

(declare-fun Unit!39206 () Unit!39204)

(assert (=> b!1185539 (= e!674142 Unit!39206)))

(declare-fun b!1185540 () Bool)

(assert (=> b!1185540 (= e!674149 e!674148)))

(declare-fun res!787638 () Bool)

(assert (=> b!1185540 (=> (not res!787638) (not e!674148))))

(assert (=> b!1185540 (= res!787638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!537391 mask!1564))))

(assert (=> b!1185540 (= lt!537391 (array!76548 (store (arr!36917 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37454 _keys!1208)))))

(declare-fun b!1185541 () Bool)

(declare-fun res!787637 () Bool)

(assert (=> b!1185541 (=> (not res!787637) (not e!674149))))

(assert (=> b!1185541 (= res!787637 (and (= (size!37455 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37454 _keys!1208) (size!37455 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1185542 () Bool)

(declare-fun arrayContainsKey!0 (array!76547 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1185542 (= e!674140 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1185543 () Bool)

(assert (=> b!1185543 (= e!674146 tp_is_empty!29851)))

(declare-fun b!1185544 () Bool)

(declare-fun Unit!39207 () Unit!39204)

(assert (=> b!1185544 (= e!674142 Unit!39207)))

(declare-fun lt!537396 () Unit!39204)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76547 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39204)

(assert (=> b!1185544 (= lt!537396 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1185544 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!537398 () Unit!39204)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76547 (_ BitVec 32) (_ BitVec 32)) Unit!39204)

(assert (=> b!1185544 (= lt!537398 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1185544 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25981)))

(declare-fun lt!537393 () Unit!39204)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76547 (_ BitVec 64) (_ BitVec 32) List!25984) Unit!39204)

(assert (=> b!1185544 (= lt!537393 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25981))))

(assert (=> b!1185544 false))

(declare-fun b!1185545 () Bool)

(assert (=> b!1185545 (= e!674148 (not e!674139))))

(declare-fun res!787641 () Bool)

(assert (=> b!1185545 (=> res!787641 e!674139)))

(assert (=> b!1185545 (= res!787641 (bvsgt from!1455 i!673))))

(assert (=> b!1185545 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!537394 () Unit!39204)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76547 (_ BitVec 64) (_ BitVec 32)) Unit!39204)

(assert (=> b!1185545 (= lt!537394 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!99978 res!787643) b!1185533))

(assert (= (and b!1185533 res!787633) b!1185541))

(assert (= (and b!1185541 res!787637) b!1185528))

(assert (= (and b!1185528 res!787645) b!1185526))

(assert (= (and b!1185526 res!787639) b!1185536))

(assert (= (and b!1185536 res!787634) b!1185531))

(assert (= (and b!1185531 res!787635) b!1185537))

(assert (= (and b!1185537 res!787642) b!1185540))

(assert (= (and b!1185540 res!787638) b!1185527))

(assert (= (and b!1185527 res!787646) b!1185545))

(assert (= (and b!1185545 (not res!787641)) b!1185538))

(assert (= (and b!1185538 (not res!787632)) b!1185529))

(assert (= (and b!1185529 (not res!787640)) b!1185535))

(assert (= (and b!1185535 res!787644) b!1185532))

(assert (= (and b!1185532 (not res!787636)) b!1185542))

(assert (= (and b!1185535 c!117503) b!1185544))

(assert (= (and b!1185535 (not c!117503)) b!1185539))

(assert (= (and b!1185530 condMapEmpty!46604) mapIsEmpty!46604))

(assert (= (and b!1185530 (not condMapEmpty!46604)) mapNonEmpty!46604))

(get-info :version)

(assert (= (and mapNonEmpty!46604 ((_ is ValueCellFull!14216) mapValue!46604)) b!1185543))

(assert (= (and b!1185530 ((_ is ValueCellFull!14216) mapDefault!46604)) b!1185534))

(assert (= start!99978 b!1185530))

(declare-fun b_lambda!20459 () Bool)

(assert (=> (not b_lambda!20459) (not b!1185538)))

(declare-fun t!38288 () Bool)

(declare-fun tb!10125 () Bool)

(assert (=> (and start!99978 (= defaultEntry!1004 defaultEntry!1004) t!38288) tb!10125))

(declare-fun result!20825 () Bool)

(assert (=> tb!10125 (= result!20825 tp_is_empty!29851)))

(assert (=> b!1185538 t!38288))

(declare-fun b_and!41513 () Bool)

(assert (= b_and!41511 (and (=> t!38288 result!20825) b_and!41513)))

(declare-fun m!1094067 () Bool)

(assert (=> start!99978 m!1094067))

(declare-fun m!1094069 () Bool)

(assert (=> start!99978 m!1094069))

(declare-fun m!1094071 () Bool)

(assert (=> b!1185545 m!1094071))

(declare-fun m!1094073 () Bool)

(assert (=> b!1185545 m!1094073))

(declare-fun m!1094075 () Bool)

(assert (=> b!1185535 m!1094075))

(assert (=> b!1185535 m!1094075))

(declare-fun m!1094077 () Bool)

(assert (=> b!1185535 m!1094077))

(declare-fun m!1094079 () Bool)

(assert (=> b!1185535 m!1094079))

(declare-fun m!1094081 () Bool)

(assert (=> b!1185535 m!1094081))

(declare-fun m!1094083 () Bool)

(assert (=> b!1185535 m!1094083))

(declare-fun m!1094085 () Bool)

(assert (=> b!1185535 m!1094085))

(declare-fun m!1094087 () Bool)

(assert (=> b!1185535 m!1094087))

(assert (=> b!1185535 m!1094083))

(declare-fun m!1094089 () Bool)

(assert (=> b!1185538 m!1094089))

(declare-fun m!1094091 () Bool)

(assert (=> b!1185538 m!1094091))

(declare-fun m!1094093 () Bool)

(assert (=> b!1185538 m!1094093))

(declare-fun m!1094095 () Bool)

(assert (=> b!1185538 m!1094095))

(declare-fun m!1094097 () Bool)

(assert (=> b!1185529 m!1094097))

(declare-fun m!1094099 () Bool)

(assert (=> b!1185529 m!1094099))

(declare-fun m!1094101 () Bool)

(assert (=> b!1185529 m!1094101))

(assert (=> b!1185529 m!1094083))

(declare-fun m!1094103 () Bool)

(assert (=> b!1185529 m!1094103))

(declare-fun m!1094105 () Bool)

(assert (=> b!1185529 m!1094105))

(assert (=> b!1185529 m!1094083))

(declare-fun m!1094107 () Bool)

(assert (=> b!1185527 m!1094107))

(declare-fun m!1094109 () Bool)

(assert (=> b!1185544 m!1094109))

(declare-fun m!1094111 () Bool)

(assert (=> b!1185544 m!1094111))

(declare-fun m!1094113 () Bool)

(assert (=> b!1185544 m!1094113))

(declare-fun m!1094115 () Bool)

(assert (=> b!1185544 m!1094115))

(declare-fun m!1094117 () Bool)

(assert (=> b!1185544 m!1094117))

(declare-fun m!1094119 () Bool)

(assert (=> b!1185528 m!1094119))

(declare-fun m!1094121 () Bool)

(assert (=> b!1185526 m!1094121))

(declare-fun m!1094123 () Bool)

(assert (=> b!1185533 m!1094123))

(declare-fun m!1094125 () Bool)

(assert (=> b!1185531 m!1094125))

(assert (=> b!1185532 m!1094083))

(declare-fun m!1094127 () Bool)

(assert (=> mapNonEmpty!46604 m!1094127))

(declare-fun m!1094129 () Bool)

(assert (=> b!1185542 m!1094129))

(declare-fun m!1094131 () Bool)

(assert (=> b!1185537 m!1094131))

(declare-fun m!1094133 () Bool)

(assert (=> b!1185540 m!1094133))

(declare-fun m!1094135 () Bool)

(assert (=> b!1185540 m!1094135))

(check-sat (not b!1185531) (not b!1185545) (not b!1185540) (not b!1185533) (not b!1185529) (not start!99978) (not b_lambda!20459) (not b!1185527) (not b!1185528) (not b!1185535) (not b!1185538) (not b!1185544) (not b!1185526) tp_is_empty!29851 (not b_next!25321) (not mapNonEmpty!46604) (not b!1185542) b_and!41513)
(check-sat b_and!41513 (not b_next!25321))
