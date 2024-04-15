; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101464 () Bool)

(assert start!101464)

(declare-fun b_free!26287 () Bool)

(declare-fun b_next!26287 () Bool)

(assert (=> start!101464 (= b_free!26287 (not b_next!26287))))

(declare-fun tp!91894 () Bool)

(declare-fun b_and!43745 () Bool)

(assert (=> start!101464 (= tp!91894 b_and!43745)))

(declare-fun res!810047 () Bool)

(declare-fun e!692467 () Bool)

(assert (=> start!101464 (=> (not res!810047) (not e!692467))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!78680 0))(
  ( (array!78681 (arr!37971 (Array (_ BitVec 32) (_ BitVec 64))) (size!38509 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78680)

(assert (=> start!101464 (= res!810047 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38509 _keys!1208))))))

(assert (=> start!101464 e!692467))

(declare-fun tp_is_empty!30991 () Bool)

(assert (=> start!101464 tp_is_empty!30991))

(declare-fun array_inv!29022 (array!78680) Bool)

(assert (=> start!101464 (array_inv!29022 _keys!1208)))

(assert (=> start!101464 true))

(assert (=> start!101464 tp!91894))

(declare-datatypes ((V!46449 0))(
  ( (V!46450 (val!15552 Int)) )
))
(declare-datatypes ((ValueCell!14786 0))(
  ( (ValueCellFull!14786 (v!18208 V!46449)) (EmptyCell!14786) )
))
(declare-datatypes ((array!78682 0))(
  ( (array!78683 (arr!37972 (Array (_ BitVec 32) ValueCell!14786)) (size!38510 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78682)

(declare-fun e!692465 () Bool)

(declare-fun array_inv!29023 (array!78682) Bool)

(assert (=> start!101464 (and (array_inv!29023 _values!996) e!692465)))

(declare-fun b!1219555 () Bool)

(declare-fun e!692460 () Bool)

(declare-fun e!692466 () Bool)

(assert (=> b!1219555 (= e!692460 e!692466)))

(declare-fun res!810054 () Bool)

(assert (=> b!1219555 (=> res!810054 e!692466)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1219555 (= res!810054 (not (validKeyInArray!0 (select (arr!37971 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!20098 0))(
  ( (tuple2!20099 (_1!10060 (_ BitVec 64)) (_2!10060 V!46449)) )
))
(declare-datatypes ((List!26878 0))(
  ( (Nil!26875) (Cons!26874 (h!28083 tuple2!20098) (t!40136 List!26878)) )
))
(declare-datatypes ((ListLongMap!18067 0))(
  ( (ListLongMap!18068 (toList!9049 List!26878)) )
))
(declare-fun lt!554374 () ListLongMap!18067)

(declare-fun lt!554379 () ListLongMap!18067)

(assert (=> b!1219555 (= lt!554374 lt!554379)))

(declare-fun lt!554381 () ListLongMap!18067)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1881 (ListLongMap!18067 (_ BitVec 64)) ListLongMap!18067)

(assert (=> b!1219555 (= lt!554379 (-!1881 lt!554381 k0!934))))

(declare-fun zeroValue!944 () V!46449)

(declare-fun lt!554377 () array!78682)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46449)

(declare-fun lt!554384 () array!78680)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5487 (array!78680 array!78682 (_ BitVec 32) (_ BitVec 32) V!46449 V!46449 (_ BitVec 32) Int) ListLongMap!18067)

(assert (=> b!1219555 (= lt!554374 (getCurrentListMapNoExtraKeys!5487 lt!554384 lt!554377 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1219555 (= lt!554381 (getCurrentListMapNoExtraKeys!5487 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!40271 0))(
  ( (Unit!40272) )
))
(declare-fun lt!554378 () Unit!40271)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1116 (array!78680 array!78682 (_ BitVec 32) (_ BitVec 32) V!46449 V!46449 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40271)

(assert (=> b!1219555 (= lt!554378 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1116 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1219556 () Bool)

(declare-fun e!692463 () Bool)

(declare-fun mapRes!48373 () Bool)

(assert (=> b!1219556 (= e!692465 (and e!692463 mapRes!48373))))

(declare-fun condMapEmpty!48373 () Bool)

(declare-fun mapDefault!48373 () ValueCell!14786)

(assert (=> b!1219556 (= condMapEmpty!48373 (= (arr!37972 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14786)) mapDefault!48373)))))

(declare-fun mapIsEmpty!48373 () Bool)

(assert (=> mapIsEmpty!48373 mapRes!48373))

(declare-fun b!1219557 () Bool)

(declare-fun e!692462 () Bool)

(declare-fun e!692456 () Bool)

(assert (=> b!1219557 (= e!692462 e!692456)))

(declare-fun res!810051 () Bool)

(assert (=> b!1219557 (=> res!810051 e!692456)))

(assert (=> b!1219557 (= res!810051 (not (= (select (arr!37971 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1219558 () Bool)

(declare-fun res!810044 () Bool)

(assert (=> b!1219558 (=> (not res!810044) (not e!692467))))

(assert (=> b!1219558 (= res!810044 (and (= (size!38510 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38509 _keys!1208) (size!38510 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!48373 () Bool)

(declare-fun tp!91895 () Bool)

(declare-fun e!692457 () Bool)

(assert (=> mapNonEmpty!48373 (= mapRes!48373 (and tp!91895 e!692457))))

(declare-fun mapRest!48373 () (Array (_ BitVec 32) ValueCell!14786))

(declare-fun mapValue!48373 () ValueCell!14786)

(declare-fun mapKey!48373 () (_ BitVec 32))

(assert (=> mapNonEmpty!48373 (= (arr!37972 _values!996) (store mapRest!48373 mapKey!48373 mapValue!48373))))

(declare-fun b!1219559 () Bool)

(declare-fun res!810058 () Bool)

(assert (=> b!1219559 (=> (not res!810058) (not e!692467))))

(declare-datatypes ((List!26879 0))(
  ( (Nil!26876) (Cons!26875 (h!28084 (_ BitVec 64)) (t!40137 List!26879)) )
))
(declare-fun arrayNoDuplicates!0 (array!78680 (_ BitVec 32) List!26879) Bool)

(assert (=> b!1219559 (= res!810058 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26876))))

(declare-fun b!1219560 () Bool)

(declare-fun res!810050 () Bool)

(declare-fun e!692458 () Bool)

(assert (=> b!1219560 (=> (not res!810050) (not e!692458))))

(assert (=> b!1219560 (= res!810050 (arrayNoDuplicates!0 lt!554384 #b00000000000000000000000000000000 Nil!26876))))

(declare-fun b!1219561 () Bool)

(declare-fun e!692464 () Bool)

(assert (=> b!1219561 (= e!692464 e!692460)))

(declare-fun res!810052 () Bool)

(assert (=> b!1219561 (=> res!810052 e!692460)))

(assert (=> b!1219561 (= res!810052 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!554383 () ListLongMap!18067)

(assert (=> b!1219561 (= lt!554383 (getCurrentListMapNoExtraKeys!5487 lt!554384 lt!554377 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!554375 () V!46449)

(assert (=> b!1219561 (= lt!554377 (array!78683 (store (arr!37972 _values!996) i!673 (ValueCellFull!14786 lt!554375)) (size!38510 _values!996)))))

(declare-fun dynLambda!3337 (Int (_ BitVec 64)) V!46449)

(assert (=> b!1219561 (= lt!554375 (dynLambda!3337 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!554380 () ListLongMap!18067)

(assert (=> b!1219561 (= lt!554380 (getCurrentListMapNoExtraKeys!5487 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1219562 () Bool)

(declare-fun res!810049 () Bool)

(assert (=> b!1219562 (=> (not res!810049) (not e!692467))))

(assert (=> b!1219562 (= res!810049 (validKeyInArray!0 k0!934))))

(declare-fun b!1219563 () Bool)

(declare-fun arrayContainsKey!0 (array!78680 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1219563 (= e!692456 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1219564 () Bool)

(assert (=> b!1219564 (= e!692467 e!692458)))

(declare-fun res!810046 () Bool)

(assert (=> b!1219564 (=> (not res!810046) (not e!692458))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78680 (_ BitVec 32)) Bool)

(assert (=> b!1219564 (= res!810046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554384 mask!1564))))

(assert (=> b!1219564 (= lt!554384 (array!78681 (store (arr!37971 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38509 _keys!1208)))))

(declare-fun b!1219565 () Bool)

(declare-fun res!810059 () Bool)

(assert (=> b!1219565 (=> (not res!810059) (not e!692467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1219565 (= res!810059 (validMask!0 mask!1564))))

(declare-fun b!1219566 () Bool)

(assert (=> b!1219566 (= e!692457 tp_is_empty!30991)))

(declare-fun b!1219567 () Bool)

(declare-fun res!810056 () Bool)

(assert (=> b!1219567 (=> (not res!810056) (not e!692467))))

(assert (=> b!1219567 (= res!810056 (= (select (arr!37971 _keys!1208) i!673) k0!934))))

(declare-fun b!1219568 () Bool)

(assert (=> b!1219568 (= e!692458 (not e!692464))))

(declare-fun res!810045 () Bool)

(assert (=> b!1219568 (=> res!810045 e!692464)))

(assert (=> b!1219568 (= res!810045 (bvsgt from!1455 i!673))))

(assert (=> b!1219568 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!554382 () Unit!40271)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78680 (_ BitVec 64) (_ BitVec 32)) Unit!40271)

(assert (=> b!1219568 (= lt!554382 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1219569 () Bool)

(declare-fun e!692461 () Bool)

(assert (=> b!1219569 (= e!692461 true)))

(assert (=> b!1219569 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!554376 () Unit!40271)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78680 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40271)

(assert (=> b!1219569 (= lt!554376 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1219570 () Bool)

(declare-fun res!810057 () Bool)

(assert (=> b!1219570 (=> (not res!810057) (not e!692467))))

(assert (=> b!1219570 (= res!810057 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38509 _keys!1208))))))

(declare-fun b!1219571 () Bool)

(assert (=> b!1219571 (= e!692466 e!692461)))

(declare-fun res!810048 () Bool)

(assert (=> b!1219571 (=> res!810048 e!692461)))

(assert (=> b!1219571 (= res!810048 (not (= (select (arr!37971 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1219571 e!692462))

(declare-fun res!810053 () Bool)

(assert (=> b!1219571 (=> (not res!810053) (not e!692462))))

(declare-fun +!4116 (ListLongMap!18067 tuple2!20098) ListLongMap!18067)

(declare-fun get!19379 (ValueCell!14786 V!46449) V!46449)

(assert (=> b!1219571 (= res!810053 (= lt!554383 (+!4116 lt!554379 (tuple2!20099 (select (arr!37971 _keys!1208) from!1455) (get!19379 (select (arr!37972 _values!996) from!1455) lt!554375)))))))

(declare-fun b!1219572 () Bool)

(assert (=> b!1219572 (= e!692463 tp_is_empty!30991)))

(declare-fun b!1219573 () Bool)

(declare-fun res!810055 () Bool)

(assert (=> b!1219573 (=> (not res!810055) (not e!692467))))

(assert (=> b!1219573 (= res!810055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!101464 res!810047) b!1219565))

(assert (= (and b!1219565 res!810059) b!1219558))

(assert (= (and b!1219558 res!810044) b!1219573))

(assert (= (and b!1219573 res!810055) b!1219559))

(assert (= (and b!1219559 res!810058) b!1219570))

(assert (= (and b!1219570 res!810057) b!1219562))

(assert (= (and b!1219562 res!810049) b!1219567))

(assert (= (and b!1219567 res!810056) b!1219564))

(assert (= (and b!1219564 res!810046) b!1219560))

(assert (= (and b!1219560 res!810050) b!1219568))

(assert (= (and b!1219568 (not res!810045)) b!1219561))

(assert (= (and b!1219561 (not res!810052)) b!1219555))

(assert (= (and b!1219555 (not res!810054)) b!1219571))

(assert (= (and b!1219571 res!810053) b!1219557))

(assert (= (and b!1219557 (not res!810051)) b!1219563))

(assert (= (and b!1219571 (not res!810048)) b!1219569))

(assert (= (and b!1219556 condMapEmpty!48373) mapIsEmpty!48373))

(assert (= (and b!1219556 (not condMapEmpty!48373)) mapNonEmpty!48373))

(get-info :version)

(assert (= (and mapNonEmpty!48373 ((_ is ValueCellFull!14786) mapValue!48373)) b!1219566))

(assert (= (and b!1219556 ((_ is ValueCellFull!14786) mapDefault!48373)) b!1219572))

(assert (= start!101464 b!1219556))

(declare-fun b_lambda!22105 () Bool)

(assert (=> (not b_lambda!22105) (not b!1219561)))

(declare-fun t!40135 () Bool)

(declare-fun tb!11079 () Bool)

(assert (=> (and start!101464 (= defaultEntry!1004 defaultEntry!1004) t!40135) tb!11079))

(declare-fun result!22771 () Bool)

(assert (=> tb!11079 (= result!22771 tp_is_empty!30991)))

(assert (=> b!1219561 t!40135))

(declare-fun b_and!43747 () Bool)

(assert (= b_and!43745 (and (=> t!40135 result!22771) b_and!43747)))

(declare-fun m!1123877 () Bool)

(assert (=> b!1219559 m!1123877))

(declare-fun m!1123879 () Bool)

(assert (=> b!1219562 m!1123879))

(declare-fun m!1123881 () Bool)

(assert (=> b!1219560 m!1123881))

(declare-fun m!1123883 () Bool)

(assert (=> b!1219564 m!1123883))

(declare-fun m!1123885 () Bool)

(assert (=> b!1219564 m!1123885))

(declare-fun m!1123887 () Bool)

(assert (=> mapNonEmpty!48373 m!1123887))

(declare-fun m!1123889 () Bool)

(assert (=> b!1219561 m!1123889))

(declare-fun m!1123891 () Bool)

(assert (=> b!1219561 m!1123891))

(declare-fun m!1123893 () Bool)

(assert (=> b!1219561 m!1123893))

(declare-fun m!1123895 () Bool)

(assert (=> b!1219561 m!1123895))

(declare-fun m!1123897 () Bool)

(assert (=> b!1219568 m!1123897))

(declare-fun m!1123899 () Bool)

(assert (=> b!1219568 m!1123899))

(declare-fun m!1123901 () Bool)

(assert (=> b!1219567 m!1123901))

(declare-fun m!1123903 () Bool)

(assert (=> start!101464 m!1123903))

(declare-fun m!1123905 () Bool)

(assert (=> start!101464 m!1123905))

(declare-fun m!1123907 () Bool)

(assert (=> b!1219565 m!1123907))

(declare-fun m!1123909 () Bool)

(assert (=> b!1219573 m!1123909))

(declare-fun m!1123911 () Bool)

(assert (=> b!1219557 m!1123911))

(declare-fun m!1123913 () Bool)

(assert (=> b!1219563 m!1123913))

(assert (=> b!1219571 m!1123911))

(declare-fun m!1123915 () Bool)

(assert (=> b!1219571 m!1123915))

(assert (=> b!1219571 m!1123915))

(declare-fun m!1123917 () Bool)

(assert (=> b!1219571 m!1123917))

(declare-fun m!1123919 () Bool)

(assert (=> b!1219571 m!1123919))

(declare-fun m!1123921 () Bool)

(assert (=> b!1219555 m!1123921))

(declare-fun m!1123923 () Bool)

(assert (=> b!1219555 m!1123923))

(declare-fun m!1123925 () Bool)

(assert (=> b!1219555 m!1123925))

(declare-fun m!1123927 () Bool)

(assert (=> b!1219555 m!1123927))

(assert (=> b!1219555 m!1123911))

(declare-fun m!1123929 () Bool)

(assert (=> b!1219555 m!1123929))

(assert (=> b!1219555 m!1123911))

(declare-fun m!1123931 () Bool)

(assert (=> b!1219569 m!1123931))

(declare-fun m!1123933 () Bool)

(assert (=> b!1219569 m!1123933))

(check-sat (not b!1219560) (not b!1219561) (not b!1219565) (not b!1219571) b_and!43747 (not b!1219562) (not b!1219563) (not b!1219573) (not b!1219559) (not b!1219555) (not b!1219569) (not b!1219564) (not b_next!26287) (not b_lambda!22105) tp_is_empty!30991 (not b!1219568) (not mapNonEmpty!48373) (not start!101464))
(check-sat b_and!43747 (not b_next!26287))
