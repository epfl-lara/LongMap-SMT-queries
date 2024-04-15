; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99784 () Bool)

(assert start!99784)

(declare-fun b_free!25369 () Bool)

(declare-fun b_next!25369 () Bool)

(assert (=> start!99784 (= b_free!25369 (not b_next!25369))))

(declare-fun tp!88821 () Bool)

(declare-fun b_and!41583 () Bool)

(assert (=> start!99784 (= tp!88821 b_and!41583)))

(declare-fun b!1185601 () Bool)

(declare-fun e!674094 () Bool)

(declare-fun tp_is_empty!29899 () Bool)

(assert (=> b!1185601 (= e!674094 tp_is_empty!29899)))

(declare-fun b!1185602 () Bool)

(declare-datatypes ((Unit!39156 0))(
  ( (Unit!39157) )
))
(declare-fun e!674097 () Unit!39156)

(declare-fun Unit!39158 () Unit!39156)

(assert (=> b!1185602 (= e!674097 Unit!39158)))

(declare-datatypes ((array!76532 0))(
  ( (array!76533 (arr!36916 (Array (_ BitVec 32) (_ BitVec 64))) (size!37454 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76532)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!538088 () Unit!39156)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76532 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39156)

(assert (=> b!1185602 (= lt!538088 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76532 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1185602 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!538094 () Unit!39156)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76532 (_ BitVec 32) (_ BitVec 32)) Unit!39156)

(assert (=> b!1185602 (= lt!538094 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26076 0))(
  ( (Nil!26073) (Cons!26072 (h!27281 (_ BitVec 64)) (t!38428 List!26076)) )
))
(declare-fun arrayNoDuplicates!0 (array!76532 (_ BitVec 32) List!26076) Bool)

(assert (=> b!1185602 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26073)))

(declare-fun lt!538077 () Unit!39156)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76532 (_ BitVec 64) (_ BitVec 32) List!26076) Unit!39156)

(assert (=> b!1185602 (= lt!538077 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26073))))

(assert (=> b!1185602 false))

(declare-fun b!1185603 () Bool)

(declare-fun e!674104 () Bool)

(declare-fun e!674102 () Bool)

(assert (=> b!1185603 (= e!674104 e!674102)))

(declare-fun res!788145 () Bool)

(assert (=> b!1185603 (=> res!788145 e!674102)))

(assert (=> b!1185603 (= res!788145 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44993 0))(
  ( (V!44994 (val!15006 Int)) )
))
(declare-fun zeroValue!944 () V!44993)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19364 0))(
  ( (tuple2!19365 (_1!9693 (_ BitVec 64)) (_2!9693 V!44993)) )
))
(declare-datatypes ((List!26077 0))(
  ( (Nil!26074) (Cons!26073 (h!27282 tuple2!19364) (t!38429 List!26077)) )
))
(declare-datatypes ((ListLongMap!17333 0))(
  ( (ListLongMap!17334 (toList!8682 List!26077)) )
))
(declare-fun lt!538079 () ListLongMap!17333)

(declare-fun lt!538091 () array!76532)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14240 0))(
  ( (ValueCellFull!14240 (v!17643 V!44993)) (EmptyCell!14240) )
))
(declare-datatypes ((array!76534 0))(
  ( (array!76535 (arr!36917 (Array (_ BitVec 32) ValueCell!14240)) (size!37455 (_ BitVec 32))) )
))
(declare-fun lt!538080 () array!76534)

(declare-fun minValue!944 () V!44993)

(declare-fun getCurrentListMapNoExtraKeys!5135 (array!76532 array!76534 (_ BitVec 32) (_ BitVec 32) V!44993 V!44993 (_ BitVec 32) Int) ListLongMap!17333)

(assert (=> b!1185603 (= lt!538079 (getCurrentListMapNoExtraKeys!5135 lt!538091 lt!538080 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!76534)

(declare-fun lt!538085 () V!44993)

(assert (=> b!1185603 (= lt!538080 (array!76535 (store (arr!36917 _values!996) i!673 (ValueCellFull!14240 lt!538085)) (size!37455 _values!996)))))

(declare-fun dynLambda!3036 (Int (_ BitVec 64)) V!44993)

(assert (=> b!1185603 (= lt!538085 (dynLambda!3036 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!538093 () ListLongMap!17333)

(assert (=> b!1185603 (= lt!538093 (getCurrentListMapNoExtraKeys!5135 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1185604 () Bool)

(declare-fun e!674103 () Bool)

(assert (=> b!1185604 (= e!674103 true)))

(declare-fun lt!538081 () ListLongMap!17333)

(declare-fun lt!538078 () ListLongMap!17333)

(declare-fun -!1634 (ListLongMap!17333 (_ BitVec 64)) ListLongMap!17333)

(assert (=> b!1185604 (= (-!1634 lt!538081 k0!934) lt!538078)))

(declare-fun lt!538086 () V!44993)

(declare-fun lt!538089 () ListLongMap!17333)

(declare-fun lt!538083 () Unit!39156)

(declare-fun addRemoveCommutativeForDiffKeys!177 (ListLongMap!17333 (_ BitVec 64) V!44993 (_ BitVec 64)) Unit!39156)

(assert (=> b!1185604 (= lt!538083 (addRemoveCommutativeForDiffKeys!177 lt!538089 (select (arr!36916 _keys!1208) from!1455) lt!538086 k0!934))))

(declare-fun lt!538092 () ListLongMap!17333)

(declare-fun lt!538082 () ListLongMap!17333)

(assert (=> b!1185604 (and (= lt!538093 lt!538081) (= lt!538082 lt!538092))))

(declare-fun lt!538084 () tuple2!19364)

(declare-fun +!3963 (ListLongMap!17333 tuple2!19364) ListLongMap!17333)

(assert (=> b!1185604 (= lt!538081 (+!3963 lt!538089 lt!538084))))

(assert (=> b!1185604 (not (= (select (arr!36916 _keys!1208) from!1455) k0!934))))

(declare-fun lt!538095 () Unit!39156)

(assert (=> b!1185604 (= lt!538095 e!674097)))

(declare-fun c!117151 () Bool)

(assert (=> b!1185604 (= c!117151 (= (select (arr!36916 _keys!1208) from!1455) k0!934))))

(declare-fun e!674095 () Bool)

(assert (=> b!1185604 e!674095))

(declare-fun res!788138 () Bool)

(assert (=> b!1185604 (=> (not res!788138) (not e!674095))))

(assert (=> b!1185604 (= res!788138 (= lt!538079 lt!538078))))

(assert (=> b!1185604 (= lt!538078 (+!3963 lt!538082 lt!538084))))

(assert (=> b!1185604 (= lt!538084 (tuple2!19365 (select (arr!36916 _keys!1208) from!1455) lt!538086))))

(declare-fun get!18908 (ValueCell!14240 V!44993) V!44993)

(assert (=> b!1185604 (= lt!538086 (get!18908 (select (arr!36917 _values!996) from!1455) lt!538085))))

(declare-fun mapNonEmpty!46676 () Bool)

(declare-fun mapRes!46676 () Bool)

(declare-fun tp!88820 () Bool)

(declare-fun e!674093 () Bool)

(assert (=> mapNonEmpty!46676 (= mapRes!46676 (and tp!88820 e!674093))))

(declare-fun mapRest!46676 () (Array (_ BitVec 32) ValueCell!14240))

(declare-fun mapValue!46676 () ValueCell!14240)

(declare-fun mapKey!46676 () (_ BitVec 32))

(assert (=> mapNonEmpty!46676 (= (arr!36917 _values!996) (store mapRest!46676 mapKey!46676 mapValue!46676))))

(declare-fun b!1185605 () Bool)

(assert (=> b!1185605 (= e!674093 tp_is_empty!29899)))

(declare-fun b!1185606 () Bool)

(declare-fun res!788142 () Bool)

(declare-fun e!674101 () Bool)

(assert (=> b!1185606 (=> (not res!788142) (not e!674101))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1185606 (= res!788142 (validMask!0 mask!1564))))

(declare-fun b!1185607 () Bool)

(declare-fun res!788147 () Bool)

(declare-fun e!674098 () Bool)

(assert (=> b!1185607 (=> (not res!788147) (not e!674098))))

(assert (=> b!1185607 (= res!788147 (arrayNoDuplicates!0 lt!538091 #b00000000000000000000000000000000 Nil!26073))))

(declare-fun b!1185608 () Bool)

(declare-fun res!788149 () Bool)

(assert (=> b!1185608 (=> (not res!788149) (not e!674101))))

(assert (=> b!1185608 (= res!788149 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26073))))

(declare-fun b!1185609 () Bool)

(declare-fun res!788150 () Bool)

(assert (=> b!1185609 (=> (not res!788150) (not e!674101))))

(assert (=> b!1185609 (= res!788150 (= (select (arr!36916 _keys!1208) i!673) k0!934))))

(declare-fun b!1185611 () Bool)

(declare-fun res!788144 () Bool)

(assert (=> b!1185611 (=> (not res!788144) (not e!674101))))

(assert (=> b!1185611 (= res!788144 (and (= (size!37455 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37454 _keys!1208) (size!37455 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1185612 () Bool)

(declare-fun Unit!39159 () Unit!39156)

(assert (=> b!1185612 (= e!674097 Unit!39159)))

(declare-fun b!1185613 () Bool)

(declare-fun e!674099 () Bool)

(assert (=> b!1185613 (= e!674099 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1185614 () Bool)

(declare-fun res!788151 () Bool)

(assert (=> b!1185614 (=> (not res!788151) (not e!674101))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1185614 (= res!788151 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!46676 () Bool)

(assert (=> mapIsEmpty!46676 mapRes!46676))

(declare-fun b!1185615 () Bool)

(declare-fun res!788141 () Bool)

(assert (=> b!1185615 (=> (not res!788141) (not e!674101))))

(assert (=> b!1185615 (= res!788141 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37454 _keys!1208))))))

(declare-fun b!1185616 () Bool)

(assert (=> b!1185616 (= e!674101 e!674098)))

(declare-fun res!788139 () Bool)

(assert (=> b!1185616 (=> (not res!788139) (not e!674098))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76532 (_ BitVec 32)) Bool)

(assert (=> b!1185616 (= res!788139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!538091 mask!1564))))

(assert (=> b!1185616 (= lt!538091 (array!76533 (store (arr!36916 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37454 _keys!1208)))))

(declare-fun b!1185617 () Bool)

(assert (=> b!1185617 (= e!674102 e!674103)))

(declare-fun res!788148 () Bool)

(assert (=> b!1185617 (=> res!788148 e!674103)))

(assert (=> b!1185617 (= res!788148 (not (validKeyInArray!0 (select (arr!36916 _keys!1208) from!1455))))))

(assert (=> b!1185617 (= lt!538092 lt!538082)))

(assert (=> b!1185617 (= lt!538082 (-!1634 lt!538089 k0!934))))

(assert (=> b!1185617 (= lt!538092 (getCurrentListMapNoExtraKeys!5135 lt!538091 lt!538080 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1185617 (= lt!538089 (getCurrentListMapNoExtraKeys!5135 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!538087 () Unit!39156)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!892 (array!76532 array!76534 (_ BitVec 32) (_ BitVec 32) V!44993 V!44993 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39156)

(assert (=> b!1185617 (= lt!538087 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!892 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1185618 () Bool)

(assert (=> b!1185618 (= e!674098 (not e!674104))))

(declare-fun res!788152 () Bool)

(assert (=> b!1185618 (=> res!788152 e!674104)))

(assert (=> b!1185618 (= res!788152 (bvsgt from!1455 i!673))))

(assert (=> b!1185618 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!538090 () Unit!39156)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76532 (_ BitVec 64) (_ BitVec 32)) Unit!39156)

(assert (=> b!1185618 (= lt!538090 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1185619 () Bool)

(assert (=> b!1185619 (= e!674095 e!674099)))

(declare-fun res!788146 () Bool)

(assert (=> b!1185619 (=> res!788146 e!674099)))

(assert (=> b!1185619 (= res!788146 (not (= (select (arr!36916 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1185620 () Bool)

(declare-fun e!674096 () Bool)

(assert (=> b!1185620 (= e!674096 (and e!674094 mapRes!46676))))

(declare-fun condMapEmpty!46676 () Bool)

(declare-fun mapDefault!46676 () ValueCell!14240)

(assert (=> b!1185620 (= condMapEmpty!46676 (= (arr!36917 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14240)) mapDefault!46676)))))

(declare-fun b!1185610 () Bool)

(declare-fun res!788140 () Bool)

(assert (=> b!1185610 (=> (not res!788140) (not e!674101))))

(assert (=> b!1185610 (= res!788140 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!788143 () Bool)

(assert (=> start!99784 (=> (not res!788143) (not e!674101))))

(assert (=> start!99784 (= res!788143 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37454 _keys!1208))))))

(assert (=> start!99784 e!674101))

(assert (=> start!99784 tp_is_empty!29899))

(declare-fun array_inv!28284 (array!76532) Bool)

(assert (=> start!99784 (array_inv!28284 _keys!1208)))

(assert (=> start!99784 true))

(assert (=> start!99784 tp!88821))

(declare-fun array_inv!28285 (array!76534) Bool)

(assert (=> start!99784 (and (array_inv!28285 _values!996) e!674096)))

(assert (= (and start!99784 res!788143) b!1185606))

(assert (= (and b!1185606 res!788142) b!1185611))

(assert (= (and b!1185611 res!788144) b!1185610))

(assert (= (and b!1185610 res!788140) b!1185608))

(assert (= (and b!1185608 res!788149) b!1185615))

(assert (= (and b!1185615 res!788141) b!1185614))

(assert (= (and b!1185614 res!788151) b!1185609))

(assert (= (and b!1185609 res!788150) b!1185616))

(assert (= (and b!1185616 res!788139) b!1185607))

(assert (= (and b!1185607 res!788147) b!1185618))

(assert (= (and b!1185618 (not res!788152)) b!1185603))

(assert (= (and b!1185603 (not res!788145)) b!1185617))

(assert (= (and b!1185617 (not res!788148)) b!1185604))

(assert (= (and b!1185604 res!788138) b!1185619))

(assert (= (and b!1185619 (not res!788146)) b!1185613))

(assert (= (and b!1185604 c!117151) b!1185602))

(assert (= (and b!1185604 (not c!117151)) b!1185612))

(assert (= (and b!1185620 condMapEmpty!46676) mapIsEmpty!46676))

(assert (= (and b!1185620 (not condMapEmpty!46676)) mapNonEmpty!46676))

(get-info :version)

(assert (= (and mapNonEmpty!46676 ((_ is ValueCellFull!14240) mapValue!46676)) b!1185605))

(assert (= (and b!1185620 ((_ is ValueCellFull!14240) mapDefault!46676)) b!1185601))

(assert (= start!99784 b!1185620))

(declare-fun b_lambda!20495 () Bool)

(assert (=> (not b_lambda!20495) (not b!1185603)))

(declare-fun t!38427 () Bool)

(declare-fun tb!10173 () Bool)

(assert (=> (and start!99784 (= defaultEntry!1004 defaultEntry!1004) t!38427) tb!10173))

(declare-fun result!20921 () Bool)

(assert (=> tb!10173 (= result!20921 tp_is_empty!29899)))

(assert (=> b!1185603 t!38427))

(declare-fun b_and!41585 () Bool)

(assert (= b_and!41583 (and (=> t!38427 result!20921) b_and!41585)))

(declare-fun m!1093565 () Bool)

(assert (=> mapNonEmpty!46676 m!1093565))

(declare-fun m!1093567 () Bool)

(assert (=> b!1185606 m!1093567))

(declare-fun m!1093569 () Bool)

(assert (=> b!1185607 m!1093569))

(declare-fun m!1093571 () Bool)

(assert (=> b!1185603 m!1093571))

(declare-fun m!1093573 () Bool)

(assert (=> b!1185603 m!1093573))

(declare-fun m!1093575 () Bool)

(assert (=> b!1185603 m!1093575))

(declare-fun m!1093577 () Bool)

(assert (=> b!1185603 m!1093577))

(declare-fun m!1093579 () Bool)

(assert (=> b!1185613 m!1093579))

(declare-fun m!1093581 () Bool)

(assert (=> b!1185614 m!1093581))

(declare-fun m!1093583 () Bool)

(assert (=> start!99784 m!1093583))

(declare-fun m!1093585 () Bool)

(assert (=> start!99784 m!1093585))

(declare-fun m!1093587 () Bool)

(assert (=> b!1185608 m!1093587))

(declare-fun m!1093589 () Bool)

(assert (=> b!1185618 m!1093589))

(declare-fun m!1093591 () Bool)

(assert (=> b!1185618 m!1093591))

(declare-fun m!1093593 () Bool)

(assert (=> b!1185609 m!1093593))

(declare-fun m!1093595 () Bool)

(assert (=> b!1185610 m!1093595))

(declare-fun m!1093597 () Bool)

(assert (=> b!1185616 m!1093597))

(declare-fun m!1093599 () Bool)

(assert (=> b!1185616 m!1093599))

(declare-fun m!1093601 () Bool)

(assert (=> b!1185604 m!1093601))

(declare-fun m!1093603 () Bool)

(assert (=> b!1185604 m!1093603))

(assert (=> b!1185604 m!1093601))

(declare-fun m!1093605 () Bool)

(assert (=> b!1185604 m!1093605))

(declare-fun m!1093607 () Bool)

(assert (=> b!1185604 m!1093607))

(declare-fun m!1093609 () Bool)

(assert (=> b!1185604 m!1093609))

(assert (=> b!1185604 m!1093607))

(declare-fun m!1093611 () Bool)

(assert (=> b!1185604 m!1093611))

(declare-fun m!1093613 () Bool)

(assert (=> b!1185604 m!1093613))

(declare-fun m!1093615 () Bool)

(assert (=> b!1185602 m!1093615))

(declare-fun m!1093617 () Bool)

(assert (=> b!1185602 m!1093617))

(declare-fun m!1093619 () Bool)

(assert (=> b!1185602 m!1093619))

(declare-fun m!1093621 () Bool)

(assert (=> b!1185602 m!1093621))

(declare-fun m!1093623 () Bool)

(assert (=> b!1185602 m!1093623))

(assert (=> b!1185619 m!1093607))

(declare-fun m!1093625 () Bool)

(assert (=> b!1185617 m!1093625))

(declare-fun m!1093627 () Bool)

(assert (=> b!1185617 m!1093627))

(declare-fun m!1093629 () Bool)

(assert (=> b!1185617 m!1093629))

(assert (=> b!1185617 m!1093607))

(declare-fun m!1093631 () Bool)

(assert (=> b!1185617 m!1093631))

(assert (=> b!1185617 m!1093607))

(declare-fun m!1093633 () Bool)

(assert (=> b!1185617 m!1093633))

(check-sat (not b!1185610) (not start!99784) (not b_next!25369) tp_is_empty!29899 (not b!1185616) (not b!1185606) (not b!1185617) (not b!1185613) (not b!1185604) (not b!1185603) (not b!1185614) (not b!1185608) (not mapNonEmpty!46676) (not b!1185607) (not b!1185602) b_and!41585 (not b_lambda!20495) (not b!1185618))
(check-sat b_and!41585 (not b_next!25369))
