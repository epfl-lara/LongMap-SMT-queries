; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101450 () Bool)

(assert start!101450)

(declare-fun b_free!26137 () Bool)

(declare-fun b_next!26137 () Bool)

(assert (=> start!101450 (= b_free!26137 (not b_next!26137))))

(declare-fun tp!91432 () Bool)

(declare-fun b_and!43393 () Bool)

(assert (=> start!101450 (= tp!91432 b_and!43393)))

(declare-fun b!1216576 () Bool)

(declare-fun res!807403 () Bool)

(declare-fun e!690902 () Bool)

(assert (=> b!1216576 (=> (not res!807403) (not e!690902))))

(declare-datatypes ((array!78497 0))(
  ( (array!78498 (arr!37877 (Array (_ BitVec 32) (_ BitVec 64))) (size!38414 (_ BitVec 32))) )
))
(declare-fun lt!553054 () array!78497)

(declare-datatypes ((List!26715 0))(
  ( (Nil!26712) (Cons!26711 (h!27929 (_ BitVec 64)) (t!39824 List!26715)) )
))
(declare-fun arrayNoDuplicates!0 (array!78497 (_ BitVec 32) List!26715) Bool)

(assert (=> b!1216576 (= res!807403 (arrayNoDuplicates!0 lt!553054 #b00000000000000000000000000000000 Nil!26712))))

(declare-fun b!1216577 () Bool)

(declare-fun res!807398 () Bool)

(declare-fun e!690901 () Bool)

(assert (=> b!1216577 (=> (not res!807398) (not e!690901))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1216577 (= res!807398 (validKeyInArray!0 k0!934))))

(declare-fun b!1216578 () Bool)

(declare-fun res!807401 () Bool)

(assert (=> b!1216578 (=> (not res!807401) (not e!690901))))

(declare-fun _keys!1208 () array!78497)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78497 (_ BitVec 32)) Bool)

(assert (=> b!1216578 (= res!807401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!48136 () Bool)

(declare-fun mapRes!48136 () Bool)

(assert (=> mapIsEmpty!48136 mapRes!48136))

(declare-fun b!1216579 () Bool)

(declare-fun res!807406 () Bool)

(assert (=> b!1216579 (=> (not res!807406) (not e!690901))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1216579 (= res!807406 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38414 _keys!1208))))))

(declare-fun mapNonEmpty!48136 () Bool)

(declare-fun tp!91433 () Bool)

(declare-fun e!690906 () Bool)

(assert (=> mapNonEmpty!48136 (= mapRes!48136 (and tp!91433 e!690906))))

(declare-fun mapKey!48136 () (_ BitVec 32))

(declare-datatypes ((V!46249 0))(
  ( (V!46250 (val!15477 Int)) )
))
(declare-datatypes ((ValueCell!14711 0))(
  ( (ValueCellFull!14711 (v!18126 V!46249)) (EmptyCell!14711) )
))
(declare-datatypes ((array!78499 0))(
  ( (array!78500 (arr!37878 (Array (_ BitVec 32) ValueCell!14711)) (size!38415 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78499)

(declare-fun mapValue!48136 () ValueCell!14711)

(declare-fun mapRest!48136 () (Array (_ BitVec 32) ValueCell!14711))

(assert (=> mapNonEmpty!48136 (= (arr!37878 _values!996) (store mapRest!48136 mapKey!48136 mapValue!48136))))

(declare-fun b!1216580 () Bool)

(declare-fun res!807400 () Bool)

(assert (=> b!1216580 (=> (not res!807400) (not e!690901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1216580 (= res!807400 (validMask!0 mask!1564))))

(declare-fun b!1216581 () Bool)

(declare-fun e!690904 () Bool)

(declare-fun tp_is_empty!30841 () Bool)

(assert (=> b!1216581 (= e!690904 tp_is_empty!30841)))

(declare-fun b!1216582 () Bool)

(declare-fun res!807396 () Bool)

(assert (=> b!1216582 (=> (not res!807396) (not e!690901))))

(assert (=> b!1216582 (= res!807396 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26712))))

(declare-fun b!1216583 () Bool)

(declare-fun res!807397 () Bool)

(assert (=> b!1216583 (=> (not res!807397) (not e!690901))))

(assert (=> b!1216583 (= res!807397 (= (select (arr!37877 _keys!1208) i!673) k0!934))))

(declare-fun b!1216584 () Bool)

(assert (=> b!1216584 (= e!690906 tp_is_empty!30841)))

(declare-fun b!1216575 () Bool)

(declare-fun res!807399 () Bool)

(assert (=> b!1216575 (=> (not res!807399) (not e!690901))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1216575 (= res!807399 (and (= (size!38415 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38414 _keys!1208) (size!38415 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!807402 () Bool)

(assert (=> start!101450 (=> (not res!807402) (not e!690901))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!101450 (= res!807402 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38414 _keys!1208))))))

(assert (=> start!101450 e!690901))

(assert (=> start!101450 tp_is_empty!30841))

(declare-fun array_inv!28908 (array!78497) Bool)

(assert (=> start!101450 (array_inv!28908 _keys!1208)))

(assert (=> start!101450 true))

(assert (=> start!101450 tp!91432))

(declare-fun e!690905 () Bool)

(declare-fun array_inv!28909 (array!78499) Bool)

(assert (=> start!101450 (and (array_inv!28909 _values!996) e!690905)))

(declare-fun b!1216585 () Bool)

(declare-fun e!690907 () Bool)

(assert (=> b!1216585 (= e!690902 (not e!690907))))

(declare-fun res!807405 () Bool)

(assert (=> b!1216585 (=> res!807405 e!690907)))

(assert (=> b!1216585 (= res!807405 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1216585 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40272 0))(
  ( (Unit!40273) )
))
(declare-fun lt!553055 () Unit!40272)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78497 (_ BitVec 64) (_ BitVec 32)) Unit!40272)

(assert (=> b!1216585 (= lt!553055 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1216586 () Bool)

(assert (=> b!1216586 (= e!690901 e!690902)))

(declare-fun res!807404 () Bool)

(assert (=> b!1216586 (=> (not res!807404) (not e!690902))))

(assert (=> b!1216586 (= res!807404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553054 mask!1564))))

(assert (=> b!1216586 (= lt!553054 (array!78498 (store (arr!37877 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38414 _keys!1208)))))

(declare-fun b!1216587 () Bool)

(assert (=> b!1216587 (= e!690907 true)))

(declare-fun zeroValue!944 () V!46249)

(declare-fun minValue!944 () V!46249)

(declare-datatypes ((tuple2!19912 0))(
  ( (tuple2!19913 (_1!9967 (_ BitVec 64)) (_2!9967 V!46249)) )
))
(declare-datatypes ((List!26716 0))(
  ( (Nil!26713) (Cons!26712 (h!27930 tuple2!19912) (t!39825 List!26716)) )
))
(declare-datatypes ((ListLongMap!17889 0))(
  ( (ListLongMap!17890 (toList!8960 List!26716)) )
))
(declare-fun lt!553053 () ListLongMap!17889)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5417 (array!78497 array!78499 (_ BitVec 32) (_ BitVec 32) V!46249 V!46249 (_ BitVec 32) Int) ListLongMap!17889)

(declare-fun dynLambda!3329 (Int (_ BitVec 64)) V!46249)

(assert (=> b!1216587 (= lt!553053 (getCurrentListMapNoExtraKeys!5417 lt!553054 (array!78500 (store (arr!37878 _values!996) i!673 (ValueCellFull!14711 (dynLambda!3329 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38415 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!553056 () ListLongMap!17889)

(assert (=> b!1216587 (= lt!553056 (getCurrentListMapNoExtraKeys!5417 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1216588 () Bool)

(assert (=> b!1216588 (= e!690905 (and e!690904 mapRes!48136))))

(declare-fun condMapEmpty!48136 () Bool)

(declare-fun mapDefault!48136 () ValueCell!14711)

(assert (=> b!1216588 (= condMapEmpty!48136 (= (arr!37878 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14711)) mapDefault!48136)))))

(assert (= (and start!101450 res!807402) b!1216580))

(assert (= (and b!1216580 res!807400) b!1216575))

(assert (= (and b!1216575 res!807399) b!1216578))

(assert (= (and b!1216578 res!807401) b!1216582))

(assert (= (and b!1216582 res!807396) b!1216579))

(assert (= (and b!1216579 res!807406) b!1216577))

(assert (= (and b!1216577 res!807398) b!1216583))

(assert (= (and b!1216583 res!807397) b!1216586))

(assert (= (and b!1216586 res!807404) b!1216576))

(assert (= (and b!1216576 res!807403) b!1216585))

(assert (= (and b!1216585 (not res!807405)) b!1216587))

(assert (= (and b!1216588 condMapEmpty!48136) mapIsEmpty!48136))

(assert (= (and b!1216588 (not condMapEmpty!48136)) mapNonEmpty!48136))

(get-info :version)

(assert (= (and mapNonEmpty!48136 ((_ is ValueCellFull!14711) mapValue!48136)) b!1216584))

(assert (= (and b!1216588 ((_ is ValueCellFull!14711) mapDefault!48136)) b!1216581))

(assert (= start!101450 b!1216588))

(declare-fun b_lambda!21807 () Bool)

(assert (=> (not b_lambda!21807) (not b!1216587)))

(declare-fun t!39823 () Bool)

(declare-fun tb!10929 () Bool)

(assert (=> (and start!101450 (= defaultEntry!1004 defaultEntry!1004) t!39823) tb!10929))

(declare-fun result!22463 () Bool)

(assert (=> tb!10929 (= result!22463 tp_is_empty!30841)))

(assert (=> b!1216587 t!39823))

(declare-fun b_and!43395 () Bool)

(assert (= b_and!43393 (and (=> t!39823 result!22463) b_and!43395)))

(declare-fun m!1121883 () Bool)

(assert (=> b!1216578 m!1121883))

(declare-fun m!1121885 () Bool)

(assert (=> b!1216577 m!1121885))

(declare-fun m!1121887 () Bool)

(assert (=> b!1216582 m!1121887))

(declare-fun m!1121889 () Bool)

(assert (=> b!1216587 m!1121889))

(declare-fun m!1121891 () Bool)

(assert (=> b!1216587 m!1121891))

(declare-fun m!1121893 () Bool)

(assert (=> b!1216587 m!1121893))

(declare-fun m!1121895 () Bool)

(assert (=> b!1216587 m!1121895))

(declare-fun m!1121897 () Bool)

(assert (=> b!1216586 m!1121897))

(declare-fun m!1121899 () Bool)

(assert (=> b!1216586 m!1121899))

(declare-fun m!1121901 () Bool)

(assert (=> mapNonEmpty!48136 m!1121901))

(declare-fun m!1121903 () Bool)

(assert (=> b!1216576 m!1121903))

(declare-fun m!1121905 () Bool)

(assert (=> b!1216585 m!1121905))

(declare-fun m!1121907 () Bool)

(assert (=> b!1216585 m!1121907))

(declare-fun m!1121909 () Bool)

(assert (=> b!1216580 m!1121909))

(declare-fun m!1121911 () Bool)

(assert (=> b!1216583 m!1121911))

(declare-fun m!1121913 () Bool)

(assert (=> start!101450 m!1121913))

(declare-fun m!1121915 () Bool)

(assert (=> start!101450 m!1121915))

(check-sat (not mapNonEmpty!48136) tp_is_empty!30841 (not b!1216576) (not b!1216577) (not b_lambda!21807) (not b!1216580) (not b!1216587) (not start!101450) (not b!1216582) b_and!43395 (not b!1216585) (not b_next!26137) (not b!1216586) (not b!1216578))
(check-sat b_and!43395 (not b_next!26137))
