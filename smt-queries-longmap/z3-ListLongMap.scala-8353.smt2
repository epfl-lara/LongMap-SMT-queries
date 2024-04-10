; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101702 () Bool)

(assert start!101702)

(declare-fun b_free!26391 () Bool)

(declare-fun b_next!26391 () Bool)

(assert (=> start!101702 (= b_free!26391 (not b_next!26391))))

(declare-fun tp!92219 () Bool)

(declare-fun b_and!44043 () Bool)

(assert (=> start!101702 (= tp!92219 b_and!44043)))

(declare-fun b!1223507 () Bool)

(declare-fun res!812934 () Bool)

(declare-fun e!694883 () Bool)

(assert (=> b!1223507 (=> (not res!812934) (not e!694883))))

(declare-datatypes ((array!78973 0))(
  ( (array!78974 (arr!38113 (Array (_ BitVec 32) (_ BitVec 64))) (size!38649 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78973)

(declare-datatypes ((List!26905 0))(
  ( (Nil!26902) (Cons!26901 (h!28110 (_ BitVec 64)) (t!40276 List!26905)) )
))
(declare-fun arrayNoDuplicates!0 (array!78973 (_ BitVec 32) List!26905) Bool)

(assert (=> b!1223507 (= res!812934 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26902))))

(declare-fun b!1223508 () Bool)

(declare-fun res!812943 () Bool)

(assert (=> b!1223508 (=> (not res!812943) (not e!694883))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1223508 (= res!812943 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38649 _keys!1208))))))

(declare-fun b!1223509 () Bool)

(declare-fun e!694887 () Bool)

(assert (=> b!1223509 (= e!694887 true)))

(declare-fun e!694878 () Bool)

(assert (=> b!1223509 e!694878))

(declare-fun res!812944 () Bool)

(assert (=> b!1223509 (=> (not res!812944) (not e!694878))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1223509 (= res!812944 (not (= (select (arr!38113 _keys!1208) from!1455) k0!934)))))

(declare-datatypes ((Unit!40532 0))(
  ( (Unit!40533) )
))
(declare-fun lt!556895 () Unit!40532)

(declare-fun e!694881 () Unit!40532)

(assert (=> b!1223509 (= lt!556895 e!694881)))

(declare-fun c!120407 () Bool)

(assert (=> b!1223509 (= c!120407 (= (select (arr!38113 _keys!1208) from!1455) k0!934))))

(declare-fun e!694888 () Bool)

(assert (=> b!1223509 e!694888))

(declare-fun res!812933 () Bool)

(assert (=> b!1223509 (=> (not res!812933) (not e!694888))))

(declare-datatypes ((V!46587 0))(
  ( (V!46588 (val!15604 Int)) )
))
(declare-datatypes ((tuple2!20104 0))(
  ( (tuple2!20105 (_1!10063 (_ BitVec 64)) (_2!10063 V!46587)) )
))
(declare-datatypes ((List!26906 0))(
  ( (Nil!26903) (Cons!26902 (h!28111 tuple2!20104) (t!40277 List!26906)) )
))
(declare-datatypes ((ListLongMap!18073 0))(
  ( (ListLongMap!18074 (toList!9052 List!26906)) )
))
(declare-fun lt!556891 () ListLongMap!18073)

(declare-fun lt!556890 () tuple2!20104)

(declare-fun lt!556889 () ListLongMap!18073)

(declare-fun +!4111 (ListLongMap!18073 tuple2!20104) ListLongMap!18073)

(assert (=> b!1223509 (= res!812933 (= lt!556889 (+!4111 lt!556891 lt!556890)))))

(declare-fun lt!556888 () V!46587)

(declare-datatypes ((ValueCell!14838 0))(
  ( (ValueCellFull!14838 (v!18266 V!46587)) (EmptyCell!14838) )
))
(declare-datatypes ((array!78975 0))(
  ( (array!78976 (arr!38114 (Array (_ BitVec 32) ValueCell!14838)) (size!38650 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78975)

(declare-fun get!19463 (ValueCell!14838 V!46587) V!46587)

(assert (=> b!1223509 (= lt!556890 (tuple2!20105 (select (arr!38113 _keys!1208) from!1455) (get!19463 (select (arr!38114 _values!996) from!1455) lt!556888)))))

(declare-fun b!1223510 () Bool)

(declare-fun e!694886 () Bool)

(declare-fun e!694885 () Bool)

(declare-fun mapRes!48541 () Bool)

(assert (=> b!1223510 (= e!694886 (and e!694885 mapRes!48541))))

(declare-fun condMapEmpty!48541 () Bool)

(declare-fun mapDefault!48541 () ValueCell!14838)

(assert (=> b!1223510 (= condMapEmpty!48541 (= (arr!38114 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14838)) mapDefault!48541)))))

(declare-fun b!1223511 () Bool)

(declare-fun e!694882 () Bool)

(assert (=> b!1223511 (= e!694882 e!694887)))

(declare-fun res!812932 () Bool)

(assert (=> b!1223511 (=> res!812932 e!694887)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1223511 (= res!812932 (not (validKeyInArray!0 (select (arr!38113 _keys!1208) from!1455))))))

(declare-fun lt!556900 () ListLongMap!18073)

(assert (=> b!1223511 (= lt!556900 lt!556891)))

(declare-fun lt!556899 () ListLongMap!18073)

(declare-fun -!1954 (ListLongMap!18073 (_ BitVec 64)) ListLongMap!18073)

(assert (=> b!1223511 (= lt!556891 (-!1954 lt!556899 k0!934))))

(declare-fun zeroValue!944 () V!46587)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!556893 () array!78973)

(declare-fun lt!556898 () array!78975)

(declare-fun minValue!944 () V!46587)

(declare-fun getCurrentListMapNoExtraKeys!5474 (array!78973 array!78975 (_ BitVec 32) (_ BitVec 32) V!46587 V!46587 (_ BitVec 32) Int) ListLongMap!18073)

(assert (=> b!1223511 (= lt!556900 (getCurrentListMapNoExtraKeys!5474 lt!556893 lt!556898 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1223511 (= lt!556899 (getCurrentListMapNoExtraKeys!5474 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!556897 () Unit!40532)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1161 (array!78973 array!78975 (_ BitVec 32) (_ BitVec 32) V!46587 V!46587 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40532)

(assert (=> b!1223511 (= lt!556897 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1161 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1223512 () Bool)

(declare-fun res!812939 () Bool)

(assert (=> b!1223512 (=> (not res!812939) (not e!694883))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78973 (_ BitVec 32)) Bool)

(assert (=> b!1223512 (= res!812939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1223513 () Bool)

(declare-fun Unit!40534 () Unit!40532)

(assert (=> b!1223513 (= e!694881 Unit!40534)))

(declare-fun b!1223514 () Bool)

(declare-fun res!812942 () Bool)

(assert (=> b!1223514 (=> (not res!812942) (not e!694883))))

(assert (=> b!1223514 (= res!812942 (and (= (size!38650 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38649 _keys!1208) (size!38650 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1223515 () Bool)

(declare-fun res!812947 () Bool)

(assert (=> b!1223515 (=> (not res!812947) (not e!694883))))

(assert (=> b!1223515 (= res!812947 (= (select (arr!38113 _keys!1208) i!673) k0!934))))

(declare-fun b!1223516 () Bool)

(declare-fun res!812941 () Bool)

(assert (=> b!1223516 (=> (not res!812941) (not e!694883))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1223516 (= res!812941 (validMask!0 mask!1564))))

(declare-fun b!1223517 () Bool)

(declare-fun e!694877 () Bool)

(assert (=> b!1223517 (= e!694888 e!694877)))

(declare-fun res!812936 () Bool)

(assert (=> b!1223517 (=> res!812936 e!694877)))

(assert (=> b!1223517 (= res!812936 (not (= (select (arr!38113 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1223518 () Bool)

(declare-fun lt!556901 () ListLongMap!18073)

(assert (=> b!1223518 (= e!694878 (= lt!556901 (+!4111 lt!556899 lt!556890)))))

(declare-fun mapNonEmpty!48541 () Bool)

(declare-fun tp!92218 () Bool)

(declare-fun e!694876 () Bool)

(assert (=> mapNonEmpty!48541 (= mapRes!48541 (and tp!92218 e!694876))))

(declare-fun mapValue!48541 () ValueCell!14838)

(declare-fun mapKey!48541 () (_ BitVec 32))

(declare-fun mapRest!48541 () (Array (_ BitVec 32) ValueCell!14838))

(assert (=> mapNonEmpty!48541 (= (arr!38114 _values!996) (store mapRest!48541 mapKey!48541 mapValue!48541))))

(declare-fun b!1223519 () Bool)

(declare-fun e!694884 () Bool)

(assert (=> b!1223519 (= e!694883 e!694884)))

(declare-fun res!812945 () Bool)

(assert (=> b!1223519 (=> (not res!812945) (not e!694884))))

(assert (=> b!1223519 (= res!812945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!556893 mask!1564))))

(assert (=> b!1223519 (= lt!556893 (array!78974 (store (arr!38113 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38649 _keys!1208)))))

(declare-fun b!1223520 () Bool)

(declare-fun res!812937 () Bool)

(assert (=> b!1223520 (=> (not res!812937) (not e!694884))))

(assert (=> b!1223520 (= res!812937 (arrayNoDuplicates!0 lt!556893 #b00000000000000000000000000000000 Nil!26902))))

(declare-fun mapIsEmpty!48541 () Bool)

(assert (=> mapIsEmpty!48541 mapRes!48541))

(declare-fun b!1223521 () Bool)

(declare-fun arrayContainsKey!0 (array!78973 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1223521 (= e!694877 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1223522 () Bool)

(declare-fun tp_is_empty!31095 () Bool)

(assert (=> b!1223522 (= e!694876 tp_is_empty!31095)))

(declare-fun b!1223523 () Bool)

(declare-fun res!812946 () Bool)

(assert (=> b!1223523 (=> (not res!812946) (not e!694883))))

(assert (=> b!1223523 (= res!812946 (validKeyInArray!0 k0!934))))

(declare-fun b!1223524 () Bool)

(declare-fun Unit!40535 () Unit!40532)

(assert (=> b!1223524 (= e!694881 Unit!40535)))

(declare-fun lt!556892 () Unit!40532)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78973 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40532)

(assert (=> b!1223524 (= lt!556892 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1223524 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!556896 () Unit!40532)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78973 (_ BitVec 32) (_ BitVec 32)) Unit!40532)

(assert (=> b!1223524 (= lt!556896 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1223524 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26902)))

(declare-fun lt!556894 () Unit!40532)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78973 (_ BitVec 64) (_ BitVec 32) List!26905) Unit!40532)

(assert (=> b!1223524 (= lt!556894 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26902))))

(assert (=> b!1223524 false))

(declare-fun b!1223525 () Bool)

(assert (=> b!1223525 (= e!694885 tp_is_empty!31095)))

(declare-fun b!1223526 () Bool)

(declare-fun e!694879 () Bool)

(assert (=> b!1223526 (= e!694884 (not e!694879))))

(declare-fun res!812935 () Bool)

(assert (=> b!1223526 (=> res!812935 e!694879)))

(assert (=> b!1223526 (= res!812935 (bvsgt from!1455 i!673))))

(assert (=> b!1223526 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!556887 () Unit!40532)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78973 (_ BitVec 64) (_ BitVec 32)) Unit!40532)

(assert (=> b!1223526 (= lt!556887 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!812940 () Bool)

(assert (=> start!101702 (=> (not res!812940) (not e!694883))))

(assert (=> start!101702 (= res!812940 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38649 _keys!1208))))))

(assert (=> start!101702 e!694883))

(assert (=> start!101702 tp_is_empty!31095))

(declare-fun array_inv!28996 (array!78973) Bool)

(assert (=> start!101702 (array_inv!28996 _keys!1208)))

(assert (=> start!101702 true))

(assert (=> start!101702 tp!92219))

(declare-fun array_inv!28997 (array!78975) Bool)

(assert (=> start!101702 (and (array_inv!28997 _values!996) e!694886)))

(declare-fun b!1223527 () Bool)

(assert (=> b!1223527 (= e!694879 e!694882)))

(declare-fun res!812938 () Bool)

(assert (=> b!1223527 (=> res!812938 e!694882)))

(assert (=> b!1223527 (= res!812938 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1223527 (= lt!556889 (getCurrentListMapNoExtraKeys!5474 lt!556893 lt!556898 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1223527 (= lt!556898 (array!78976 (store (arr!38114 _values!996) i!673 (ValueCellFull!14838 lt!556888)) (size!38650 _values!996)))))

(declare-fun dynLambda!3349 (Int (_ BitVec 64)) V!46587)

(assert (=> b!1223527 (= lt!556888 (dynLambda!3349 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1223527 (= lt!556901 (getCurrentListMapNoExtraKeys!5474 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!101702 res!812940) b!1223516))

(assert (= (and b!1223516 res!812941) b!1223514))

(assert (= (and b!1223514 res!812942) b!1223512))

(assert (= (and b!1223512 res!812939) b!1223507))

(assert (= (and b!1223507 res!812934) b!1223508))

(assert (= (and b!1223508 res!812943) b!1223523))

(assert (= (and b!1223523 res!812946) b!1223515))

(assert (= (and b!1223515 res!812947) b!1223519))

(assert (= (and b!1223519 res!812945) b!1223520))

(assert (= (and b!1223520 res!812937) b!1223526))

(assert (= (and b!1223526 (not res!812935)) b!1223527))

(assert (= (and b!1223527 (not res!812938)) b!1223511))

(assert (= (and b!1223511 (not res!812932)) b!1223509))

(assert (= (and b!1223509 res!812933) b!1223517))

(assert (= (and b!1223517 (not res!812936)) b!1223521))

(assert (= (and b!1223509 c!120407) b!1223524))

(assert (= (and b!1223509 (not c!120407)) b!1223513))

(assert (= (and b!1223509 res!812944) b!1223518))

(assert (= (and b!1223510 condMapEmpty!48541) mapIsEmpty!48541))

(assert (= (and b!1223510 (not condMapEmpty!48541)) mapNonEmpty!48541))

(get-info :version)

(assert (= (and mapNonEmpty!48541 ((_ is ValueCellFull!14838) mapValue!48541)) b!1223522))

(assert (= (and b!1223510 ((_ is ValueCellFull!14838) mapDefault!48541)) b!1223525))

(assert (= start!101702 b!1223510))

(declare-fun b_lambda!22371 () Bool)

(assert (=> (not b_lambda!22371) (not b!1223527)))

(declare-fun t!40275 () Bool)

(declare-fun tb!11191 () Bool)

(assert (=> (and start!101702 (= defaultEntry!1004 defaultEntry!1004) t!40275) tb!11191))

(declare-fun result!22995 () Bool)

(assert (=> tb!11191 (= result!22995 tp_is_empty!31095)))

(assert (=> b!1223527 t!40275))

(declare-fun b_and!44045 () Bool)

(assert (= b_and!44043 (and (=> t!40275 result!22995) b_and!44045)))

(declare-fun m!1128515 () Bool)

(assert (=> b!1223516 m!1128515))

(declare-fun m!1128517 () Bool)

(assert (=> b!1223523 m!1128517))

(declare-fun m!1128519 () Bool)

(assert (=> mapNonEmpty!48541 m!1128519))

(declare-fun m!1128521 () Bool)

(assert (=> b!1223527 m!1128521))

(declare-fun m!1128523 () Bool)

(assert (=> b!1223527 m!1128523))

(declare-fun m!1128525 () Bool)

(assert (=> b!1223527 m!1128525))

(declare-fun m!1128527 () Bool)

(assert (=> b!1223527 m!1128527))

(declare-fun m!1128529 () Bool)

(assert (=> b!1223524 m!1128529))

(declare-fun m!1128531 () Bool)

(assert (=> b!1223524 m!1128531))

(declare-fun m!1128533 () Bool)

(assert (=> b!1223524 m!1128533))

(declare-fun m!1128535 () Bool)

(assert (=> b!1223524 m!1128535))

(declare-fun m!1128537 () Bool)

(assert (=> b!1223524 m!1128537))

(declare-fun m!1128539 () Bool)

(assert (=> b!1223518 m!1128539))

(declare-fun m!1128541 () Bool)

(assert (=> b!1223520 m!1128541))

(declare-fun m!1128543 () Bool)

(assert (=> b!1223521 m!1128543))

(declare-fun m!1128545 () Bool)

(assert (=> b!1223512 m!1128545))

(declare-fun m!1128547 () Bool)

(assert (=> b!1223526 m!1128547))

(declare-fun m!1128549 () Bool)

(assert (=> b!1223526 m!1128549))

(declare-fun m!1128551 () Bool)

(assert (=> b!1223519 m!1128551))

(declare-fun m!1128553 () Bool)

(assert (=> b!1223519 m!1128553))

(declare-fun m!1128555 () Bool)

(assert (=> b!1223515 m!1128555))

(declare-fun m!1128557 () Bool)

(assert (=> b!1223509 m!1128557))

(declare-fun m!1128559 () Bool)

(assert (=> b!1223509 m!1128559))

(declare-fun m!1128561 () Bool)

(assert (=> b!1223509 m!1128561))

(assert (=> b!1223509 m!1128561))

(declare-fun m!1128563 () Bool)

(assert (=> b!1223509 m!1128563))

(declare-fun m!1128565 () Bool)

(assert (=> b!1223511 m!1128565))

(declare-fun m!1128567 () Bool)

(assert (=> b!1223511 m!1128567))

(declare-fun m!1128569 () Bool)

(assert (=> b!1223511 m!1128569))

(declare-fun m!1128571 () Bool)

(assert (=> b!1223511 m!1128571))

(assert (=> b!1223511 m!1128557))

(declare-fun m!1128573 () Bool)

(assert (=> b!1223511 m!1128573))

(assert (=> b!1223511 m!1128557))

(assert (=> b!1223517 m!1128557))

(declare-fun m!1128575 () Bool)

(assert (=> start!101702 m!1128575))

(declare-fun m!1128577 () Bool)

(assert (=> start!101702 m!1128577))

(declare-fun m!1128579 () Bool)

(assert (=> b!1223507 m!1128579))

(check-sat (not mapNonEmpty!48541) (not b!1223509) tp_is_empty!31095 (not b!1223524) (not start!101702) (not b!1223526) (not b!1223519) (not b!1223516) b_and!44045 (not b!1223521) (not b!1223507) (not b_lambda!22371) (not b!1223523) (not b!1223518) (not b_next!26391) (not b!1223512) (not b!1223520) (not b!1223527) (not b!1223511))
(check-sat b_and!44045 (not b_next!26391))
