; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101256 () Bool)

(assert start!101256)

(declare-fun b_free!26185 () Bool)

(declare-fun b_next!26185 () Bool)

(assert (=> start!101256 (= b_free!26185 (not b_next!26185))))

(declare-fun tp!91577 () Bool)

(declare-fun b_and!43469 () Bool)

(assert (=> start!101256 (= tp!91577 b_and!43469)))

(declare-fun b!1216237 () Bool)

(declare-fun e!690510 () Bool)

(declare-fun e!690513 () Bool)

(assert (=> b!1216237 (= e!690510 (not e!690513))))

(declare-fun res!807626 () Bool)

(assert (=> b!1216237 (=> res!807626 e!690513)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1216237 (= res!807626 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!78472 0))(
  ( (array!78473 (arr!37871 (Array (_ BitVec 32) (_ BitVec 64))) (size!38409 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78472)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78472 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1216237 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40187 0))(
  ( (Unit!40188) )
))
(declare-fun lt!552687 () Unit!40187)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78472 (_ BitVec 64) (_ BitVec 32)) Unit!40187)

(assert (=> b!1216237 (= lt!552687 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1216238 () Bool)

(declare-fun e!690507 () Bool)

(declare-fun tp_is_empty!30889 () Bool)

(assert (=> b!1216238 (= e!690507 tp_is_empty!30889)))

(declare-fun b!1216240 () Bool)

(declare-fun e!690511 () Bool)

(assert (=> b!1216240 (= e!690511 (bvslt from!1455 (size!38409 _keys!1208)))))

(declare-datatypes ((V!46313 0))(
  ( (V!46314 (val!15501 Int)) )
))
(declare-fun zeroValue!944 () V!46313)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!552689 () array!78472)

(declare-datatypes ((ValueCell!14735 0))(
  ( (ValueCellFull!14735 (v!18153 V!46313)) (EmptyCell!14735) )
))
(declare-datatypes ((array!78474 0))(
  ( (array!78475 (arr!37872 (Array (_ BitVec 32) ValueCell!14735)) (size!38410 (_ BitVec 32))) )
))
(declare-fun lt!552684 () array!78474)

(declare-fun _values!996 () array!78474)

(declare-fun minValue!944 () V!46313)

(declare-datatypes ((tuple2!20016 0))(
  ( (tuple2!20017 (_1!10019 (_ BitVec 64)) (_2!10019 V!46313)) )
))
(declare-datatypes ((List!26794 0))(
  ( (Nil!26791) (Cons!26790 (h!27999 tuple2!20016) (t!39950 List!26794)) )
))
(declare-datatypes ((ListLongMap!17985 0))(
  ( (ListLongMap!17986 (toList!9008 List!26794)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5447 (array!78472 array!78474 (_ BitVec 32) (_ BitVec 32) V!46313 V!46313 (_ BitVec 32) Int) ListLongMap!17985)

(declare-fun -!1847 (ListLongMap!17985 (_ BitVec 64)) ListLongMap!17985)

(assert (=> b!1216240 (= (getCurrentListMapNoExtraKeys!5447 lt!552689 lt!552684 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1847 (getCurrentListMapNoExtraKeys!5447 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!552685 () Unit!40187)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1082 (array!78472 array!78474 (_ BitVec 32) (_ BitVec 32) V!46313 V!46313 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40187)

(assert (=> b!1216240 (= lt!552685 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1082 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1216241 () Bool)

(declare-fun res!807634 () Bool)

(declare-fun e!690514 () Bool)

(assert (=> b!1216241 (=> (not res!807634) (not e!690514))))

(assert (=> b!1216241 (= res!807634 (and (= (size!38410 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38409 _keys!1208) (size!38410 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1216242 () Bool)

(declare-fun e!690509 () Bool)

(assert (=> b!1216242 (= e!690509 tp_is_empty!30889)))

(declare-fun b!1216243 () Bool)

(declare-fun res!807624 () Bool)

(assert (=> b!1216243 (=> (not res!807624) (not e!690514))))

(assert (=> b!1216243 (= res!807624 (= (select (arr!37871 _keys!1208) i!673) k0!934))))

(declare-fun b!1216244 () Bool)

(declare-fun res!807628 () Bool)

(assert (=> b!1216244 (=> (not res!807628) (not e!690510))))

(declare-datatypes ((List!26795 0))(
  ( (Nil!26792) (Cons!26791 (h!28000 (_ BitVec 64)) (t!39951 List!26795)) )
))
(declare-fun arrayNoDuplicates!0 (array!78472 (_ BitVec 32) List!26795) Bool)

(assert (=> b!1216244 (= res!807628 (arrayNoDuplicates!0 lt!552689 #b00000000000000000000000000000000 Nil!26792))))

(declare-fun b!1216245 () Bool)

(declare-fun res!807627 () Bool)

(assert (=> b!1216245 (=> (not res!807627) (not e!690514))))

(assert (=> b!1216245 (= res!807627 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38409 _keys!1208))))))

(declare-fun b!1216246 () Bool)

(assert (=> b!1216246 (= e!690514 e!690510)))

(declare-fun res!807631 () Bool)

(assert (=> b!1216246 (=> (not res!807631) (not e!690510))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78472 (_ BitVec 32)) Bool)

(assert (=> b!1216246 (= res!807631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552689 mask!1564))))

(assert (=> b!1216246 (= lt!552689 (array!78473 (store (arr!37871 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38409 _keys!1208)))))

(declare-fun b!1216247 () Bool)

(declare-fun res!807630 () Bool)

(assert (=> b!1216247 (=> (not res!807630) (not e!690514))))

(assert (=> b!1216247 (= res!807630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!48208 () Bool)

(declare-fun mapRes!48208 () Bool)

(assert (=> mapIsEmpty!48208 mapRes!48208))

(declare-fun b!1216248 () Bool)

(declare-fun res!807632 () Bool)

(assert (=> b!1216248 (=> (not res!807632) (not e!690514))))

(assert (=> b!1216248 (= res!807632 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26792))))

(declare-fun b!1216239 () Bool)

(assert (=> b!1216239 (= e!690513 e!690511)))

(declare-fun res!807633 () Bool)

(assert (=> b!1216239 (=> res!807633 e!690511)))

(assert (=> b!1216239 (= res!807633 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!552686 () ListLongMap!17985)

(assert (=> b!1216239 (= lt!552686 (getCurrentListMapNoExtraKeys!5447 lt!552689 lt!552684 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3299 (Int (_ BitVec 64)) V!46313)

(assert (=> b!1216239 (= lt!552684 (array!78475 (store (arr!37872 _values!996) i!673 (ValueCellFull!14735 (dynLambda!3299 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38410 _values!996)))))

(declare-fun lt!552688 () ListLongMap!17985)

(assert (=> b!1216239 (= lt!552688 (getCurrentListMapNoExtraKeys!5447 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!807629 () Bool)

(assert (=> start!101256 (=> (not res!807629) (not e!690514))))

(assert (=> start!101256 (= res!807629 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38409 _keys!1208))))))

(assert (=> start!101256 e!690514))

(assert (=> start!101256 tp_is_empty!30889))

(declare-fun array_inv!28948 (array!78472) Bool)

(assert (=> start!101256 (array_inv!28948 _keys!1208)))

(assert (=> start!101256 true))

(assert (=> start!101256 tp!91577))

(declare-fun e!690508 () Bool)

(declare-fun array_inv!28949 (array!78474) Bool)

(assert (=> start!101256 (and (array_inv!28949 _values!996) e!690508)))

(declare-fun mapNonEmpty!48208 () Bool)

(declare-fun tp!91576 () Bool)

(assert (=> mapNonEmpty!48208 (= mapRes!48208 (and tp!91576 e!690509))))

(declare-fun mapKey!48208 () (_ BitVec 32))

(declare-fun mapValue!48208 () ValueCell!14735)

(declare-fun mapRest!48208 () (Array (_ BitVec 32) ValueCell!14735))

(assert (=> mapNonEmpty!48208 (= (arr!37872 _values!996) (store mapRest!48208 mapKey!48208 mapValue!48208))))

(declare-fun b!1216249 () Bool)

(assert (=> b!1216249 (= e!690508 (and e!690507 mapRes!48208))))

(declare-fun condMapEmpty!48208 () Bool)

(declare-fun mapDefault!48208 () ValueCell!14735)

(assert (=> b!1216249 (= condMapEmpty!48208 (= (arr!37872 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14735)) mapDefault!48208)))))

(declare-fun b!1216250 () Bool)

(declare-fun res!807623 () Bool)

(assert (=> b!1216250 (=> (not res!807623) (not e!690514))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1216250 (= res!807623 (validKeyInArray!0 k0!934))))

(declare-fun b!1216251 () Bool)

(declare-fun res!807625 () Bool)

(assert (=> b!1216251 (=> (not res!807625) (not e!690514))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1216251 (= res!807625 (validMask!0 mask!1564))))

(assert (= (and start!101256 res!807629) b!1216251))

(assert (= (and b!1216251 res!807625) b!1216241))

(assert (= (and b!1216241 res!807634) b!1216247))

(assert (= (and b!1216247 res!807630) b!1216248))

(assert (= (and b!1216248 res!807632) b!1216245))

(assert (= (and b!1216245 res!807627) b!1216250))

(assert (= (and b!1216250 res!807623) b!1216243))

(assert (= (and b!1216243 res!807624) b!1216246))

(assert (= (and b!1216246 res!807631) b!1216244))

(assert (= (and b!1216244 res!807628) b!1216237))

(assert (= (and b!1216237 (not res!807626)) b!1216239))

(assert (= (and b!1216239 (not res!807633)) b!1216240))

(assert (= (and b!1216249 condMapEmpty!48208) mapIsEmpty!48208))

(assert (= (and b!1216249 (not condMapEmpty!48208)) mapNonEmpty!48208))

(get-info :version)

(assert (= (and mapNonEmpty!48208 ((_ is ValueCellFull!14735) mapValue!48208)) b!1216242))

(assert (= (and b!1216249 ((_ is ValueCellFull!14735) mapDefault!48208)) b!1216238))

(assert (= start!101256 b!1216249))

(declare-fun b_lambda!21851 () Bool)

(assert (=> (not b_lambda!21851) (not b!1216239)))

(declare-fun t!39949 () Bool)

(declare-fun tb!10977 () Bool)

(assert (=> (and start!101256 (= defaultEntry!1004 defaultEntry!1004) t!39949) tb!10977))

(declare-fun result!22559 () Bool)

(assert (=> tb!10977 (= result!22559 tp_is_empty!30889)))

(assert (=> b!1216239 t!39949))

(declare-fun b_and!43471 () Bool)

(assert (= b_and!43469 (and (=> t!39949 result!22559) b_and!43471)))

(declare-fun m!1120545 () Bool)

(assert (=> b!1216244 m!1120545))

(declare-fun m!1120547 () Bool)

(assert (=> b!1216237 m!1120547))

(declare-fun m!1120549 () Bool)

(assert (=> b!1216237 m!1120549))

(declare-fun m!1120551 () Bool)

(assert (=> b!1216243 m!1120551))

(declare-fun m!1120553 () Bool)

(assert (=> b!1216248 m!1120553))

(declare-fun m!1120555 () Bool)

(assert (=> b!1216251 m!1120555))

(declare-fun m!1120557 () Bool)

(assert (=> mapNonEmpty!48208 m!1120557))

(declare-fun m!1120559 () Bool)

(assert (=> start!101256 m!1120559))

(declare-fun m!1120561 () Bool)

(assert (=> start!101256 m!1120561))

(declare-fun m!1120563 () Bool)

(assert (=> b!1216240 m!1120563))

(declare-fun m!1120565 () Bool)

(assert (=> b!1216240 m!1120565))

(assert (=> b!1216240 m!1120565))

(declare-fun m!1120567 () Bool)

(assert (=> b!1216240 m!1120567))

(declare-fun m!1120569 () Bool)

(assert (=> b!1216240 m!1120569))

(declare-fun m!1120571 () Bool)

(assert (=> b!1216250 m!1120571))

(declare-fun m!1120573 () Bool)

(assert (=> b!1216247 m!1120573))

(declare-fun m!1120575 () Bool)

(assert (=> b!1216239 m!1120575))

(declare-fun m!1120577 () Bool)

(assert (=> b!1216239 m!1120577))

(declare-fun m!1120579 () Bool)

(assert (=> b!1216239 m!1120579))

(declare-fun m!1120581 () Bool)

(assert (=> b!1216239 m!1120581))

(declare-fun m!1120583 () Bool)

(assert (=> b!1216246 m!1120583))

(declare-fun m!1120585 () Bool)

(assert (=> b!1216246 m!1120585))

(check-sat (not b!1216244) (not b!1216247) tp_is_empty!30889 (not start!101256) (not b_next!26185) (not b!1216250) b_and!43471 (not b!1216239) (not b_lambda!21851) (not mapNonEmpty!48208) (not b!1216240) (not b!1216246) (not b!1216248) (not b!1216237) (not b!1216251))
(check-sat b_and!43471 (not b_next!26185))
