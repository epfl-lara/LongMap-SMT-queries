; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100224 () Bool)

(assert start!100224)

(declare-fun b_free!25567 () Bool)

(declare-fun b_next!25567 () Bool)

(assert (=> start!100224 (= b_free!25567 (not b_next!25567))))

(declare-fun tp!89415 () Bool)

(declare-fun b_and!42003 () Bool)

(assert (=> start!100224 (= tp!89415 b_and!42003)))

(declare-fun b!1192287 () Bool)

(declare-fun e!677877 () Bool)

(declare-fun e!677881 () Bool)

(assert (=> b!1192287 (= e!677877 e!677881)))

(declare-fun res!792651 () Bool)

(assert (=> b!1192287 (=> (not res!792651) (not e!677881))))

(declare-datatypes ((array!77029 0))(
  ( (array!77030 (arr!37158 (Array (_ BitVec 32) (_ BitVec 64))) (size!37695 (_ BitVec 32))) )
))
(declare-fun lt!542151 () array!77029)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77029 (_ BitVec 32)) Bool)

(assert (=> b!1192287 (= res!792651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542151 mask!1564))))

(declare-fun _keys!1208 () array!77029)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1192287 (= lt!542151 (array!77030 (store (arr!37158 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37695 _keys!1208)))))

(declare-fun b!1192288 () Bool)

(declare-fun res!792659 () Bool)

(assert (=> b!1192288 (=> (not res!792659) (not e!677877))))

(assert (=> b!1192288 (= res!792659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1192289 () Bool)

(declare-fun res!792657 () Bool)

(assert (=> b!1192289 (=> (not res!792657) (not e!677877))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1192289 (= res!792657 (validKeyInArray!0 k0!934))))

(declare-fun b!1192290 () Bool)

(declare-fun e!677879 () Bool)

(declare-fun e!677882 () Bool)

(assert (=> b!1192290 (= e!677879 e!677882)))

(declare-fun res!792648 () Bool)

(assert (=> b!1192290 (=> res!792648 e!677882)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1192290 (= res!792648 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!45257 0))(
  ( (V!45258 (val!15105 Int)) )
))
(declare-fun zeroValue!944 () V!45257)

(declare-datatypes ((tuple2!19440 0))(
  ( (tuple2!19441 (_1!9731 (_ BitVec 64)) (_2!9731 V!45257)) )
))
(declare-datatypes ((List!26184 0))(
  ( (Nil!26181) (Cons!26180 (h!27398 tuple2!19440) (t!38735 List!26184)) )
))
(declare-datatypes ((ListLongMap!17417 0))(
  ( (ListLongMap!17418 (toList!8724 List!26184)) )
))
(declare-fun lt!542149 () ListLongMap!17417)

(declare-datatypes ((ValueCell!14339 0))(
  ( (ValueCellFull!14339 (v!17739 V!45257)) (EmptyCell!14339) )
))
(declare-datatypes ((array!77031 0))(
  ( (array!77032 (arr!37159 (Array (_ BitVec 32) ValueCell!14339)) (size!37696 (_ BitVec 32))) )
))
(declare-fun lt!542147 () array!77031)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45257)

(declare-fun getCurrentListMapNoExtraKeys!5192 (array!77029 array!77031 (_ BitVec 32) (_ BitVec 32) V!45257 V!45257 (_ BitVec 32) Int) ListLongMap!17417)

(assert (=> b!1192290 (= lt!542149 (getCurrentListMapNoExtraKeys!5192 lt!542151 lt!542147 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!77031)

(declare-fun dynLambda!3146 (Int (_ BitVec 64)) V!45257)

(assert (=> b!1192290 (= lt!542147 (array!77032 (store (arr!37159 _values!996) i!673 (ValueCellFull!14339 (dynLambda!3146 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37696 _values!996)))))

(declare-fun lt!542150 () ListLongMap!17417)

(assert (=> b!1192290 (= lt!542150 (getCurrentListMapNoExtraKeys!5192 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1192291 () Bool)

(declare-fun res!792656 () Bool)

(assert (=> b!1192291 (=> (not res!792656) (not e!677877))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1192291 (= res!792656 (validMask!0 mask!1564))))

(declare-fun b!1192292 () Bool)

(declare-fun e!677875 () Bool)

(declare-fun tp_is_empty!30097 () Bool)

(assert (=> b!1192292 (= e!677875 tp_is_empty!30097)))

(declare-fun b!1192293 () Bool)

(declare-fun res!792654 () Bool)

(assert (=> b!1192293 (=> (not res!792654) (not e!677877))))

(assert (=> b!1192293 (= res!792654 (and (= (size!37696 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37695 _keys!1208) (size!37696 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1192295 () Bool)

(declare-fun e!677878 () Bool)

(declare-fun mapRes!46973 () Bool)

(assert (=> b!1192295 (= e!677878 (and e!677875 mapRes!46973))))

(declare-fun condMapEmpty!46973 () Bool)

(declare-fun mapDefault!46973 () ValueCell!14339)

(assert (=> b!1192295 (= condMapEmpty!46973 (= (arr!37159 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14339)) mapDefault!46973)))))

(declare-fun b!1192296 () Bool)

(declare-fun res!792649 () Bool)

(assert (=> b!1192296 (=> (not res!792649) (not e!677877))))

(declare-datatypes ((List!26185 0))(
  ( (Nil!26182) (Cons!26181 (h!27399 (_ BitVec 64)) (t!38736 List!26185)) )
))
(declare-fun arrayNoDuplicates!0 (array!77029 (_ BitVec 32) List!26185) Bool)

(assert (=> b!1192296 (= res!792649 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26182))))

(declare-fun b!1192297 () Bool)

(declare-fun res!792650 () Bool)

(assert (=> b!1192297 (=> (not res!792650) (not e!677877))))

(assert (=> b!1192297 (= res!792650 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37695 _keys!1208))))))

(declare-fun mapIsEmpty!46973 () Bool)

(assert (=> mapIsEmpty!46973 mapRes!46973))

(declare-fun b!1192298 () Bool)

(assert (=> b!1192298 (= e!677882 true)))

(declare-fun -!1733 (ListLongMap!17417 (_ BitVec 64)) ListLongMap!17417)

(assert (=> b!1192298 (= (getCurrentListMapNoExtraKeys!5192 lt!542151 lt!542147 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1733 (getCurrentListMapNoExtraKeys!5192 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39489 0))(
  ( (Unit!39490) )
))
(declare-fun lt!542148 () Unit!39489)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!948 (array!77029 array!77031 (_ BitVec 32) (_ BitVec 32) V!45257 V!45257 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39489)

(assert (=> b!1192298 (= lt!542148 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!948 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1192299 () Bool)

(assert (=> b!1192299 (= e!677881 (not e!677879))))

(declare-fun res!792653 () Bool)

(assert (=> b!1192299 (=> res!792653 e!677879)))

(assert (=> b!1192299 (= res!792653 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77029 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1192299 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!542152 () Unit!39489)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77029 (_ BitVec 64) (_ BitVec 32)) Unit!39489)

(assert (=> b!1192299 (= lt!542152 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1192300 () Bool)

(declare-fun e!677880 () Bool)

(assert (=> b!1192300 (= e!677880 tp_is_empty!30097)))

(declare-fun b!1192294 () Bool)

(declare-fun res!792652 () Bool)

(assert (=> b!1192294 (=> (not res!792652) (not e!677881))))

(assert (=> b!1192294 (= res!792652 (arrayNoDuplicates!0 lt!542151 #b00000000000000000000000000000000 Nil!26182))))

(declare-fun res!792658 () Bool)

(assert (=> start!100224 (=> (not res!792658) (not e!677877))))

(assert (=> start!100224 (= res!792658 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37695 _keys!1208))))))

(assert (=> start!100224 e!677877))

(assert (=> start!100224 tp_is_empty!30097))

(declare-fun array_inv!28398 (array!77029) Bool)

(assert (=> start!100224 (array_inv!28398 _keys!1208)))

(assert (=> start!100224 true))

(assert (=> start!100224 tp!89415))

(declare-fun array_inv!28399 (array!77031) Bool)

(assert (=> start!100224 (and (array_inv!28399 _values!996) e!677878)))

(declare-fun mapNonEmpty!46973 () Bool)

(declare-fun tp!89414 () Bool)

(assert (=> mapNonEmpty!46973 (= mapRes!46973 (and tp!89414 e!677880))))

(declare-fun mapKey!46973 () (_ BitVec 32))

(declare-fun mapValue!46973 () ValueCell!14339)

(declare-fun mapRest!46973 () (Array (_ BitVec 32) ValueCell!14339))

(assert (=> mapNonEmpty!46973 (= (arr!37159 _values!996) (store mapRest!46973 mapKey!46973 mapValue!46973))))

(declare-fun b!1192301 () Bool)

(declare-fun res!792655 () Bool)

(assert (=> b!1192301 (=> (not res!792655) (not e!677877))))

(assert (=> b!1192301 (= res!792655 (= (select (arr!37158 _keys!1208) i!673) k0!934))))

(assert (= (and start!100224 res!792658) b!1192291))

(assert (= (and b!1192291 res!792656) b!1192293))

(assert (= (and b!1192293 res!792654) b!1192288))

(assert (= (and b!1192288 res!792659) b!1192296))

(assert (= (and b!1192296 res!792649) b!1192297))

(assert (= (and b!1192297 res!792650) b!1192289))

(assert (= (and b!1192289 res!792657) b!1192301))

(assert (= (and b!1192301 res!792655) b!1192287))

(assert (= (and b!1192287 res!792651) b!1192294))

(assert (= (and b!1192294 res!792652) b!1192299))

(assert (= (and b!1192299 (not res!792653)) b!1192290))

(assert (= (and b!1192290 (not res!792648)) b!1192298))

(assert (= (and b!1192295 condMapEmpty!46973) mapIsEmpty!46973))

(assert (= (and b!1192295 (not condMapEmpty!46973)) mapNonEmpty!46973))

(get-info :version)

(assert (= (and mapNonEmpty!46973 ((_ is ValueCellFull!14339) mapValue!46973)) b!1192300))

(assert (= (and b!1192295 ((_ is ValueCellFull!14339) mapDefault!46973)) b!1192292))

(assert (= start!100224 b!1192295))

(declare-fun b_lambda!20705 () Bool)

(assert (=> (not b_lambda!20705) (not b!1192290)))

(declare-fun t!38734 () Bool)

(declare-fun tb!10371 () Bool)

(assert (=> (and start!100224 (= defaultEntry!1004 defaultEntry!1004) t!38734) tb!10371))

(declare-fun result!21317 () Bool)

(assert (=> tb!10371 (= result!21317 tp_is_empty!30097)))

(assert (=> b!1192290 t!38734))

(declare-fun b_and!42005 () Bool)

(assert (= b_and!42003 (and (=> t!38734 result!21317) b_and!42005)))

(declare-fun m!1101081 () Bool)

(assert (=> b!1192299 m!1101081))

(declare-fun m!1101083 () Bool)

(assert (=> b!1192299 m!1101083))

(declare-fun m!1101085 () Bool)

(assert (=> b!1192290 m!1101085))

(declare-fun m!1101087 () Bool)

(assert (=> b!1192290 m!1101087))

(declare-fun m!1101089 () Bool)

(assert (=> b!1192290 m!1101089))

(declare-fun m!1101091 () Bool)

(assert (=> b!1192290 m!1101091))

(declare-fun m!1101093 () Bool)

(assert (=> b!1192291 m!1101093))

(declare-fun m!1101095 () Bool)

(assert (=> b!1192301 m!1101095))

(declare-fun m!1101097 () Bool)

(assert (=> mapNonEmpty!46973 m!1101097))

(declare-fun m!1101099 () Bool)

(assert (=> b!1192287 m!1101099))

(declare-fun m!1101101 () Bool)

(assert (=> b!1192287 m!1101101))

(declare-fun m!1101103 () Bool)

(assert (=> b!1192289 m!1101103))

(declare-fun m!1101105 () Bool)

(assert (=> start!100224 m!1101105))

(declare-fun m!1101107 () Bool)

(assert (=> start!100224 m!1101107))

(declare-fun m!1101109 () Bool)

(assert (=> b!1192298 m!1101109))

(declare-fun m!1101111 () Bool)

(assert (=> b!1192298 m!1101111))

(assert (=> b!1192298 m!1101111))

(declare-fun m!1101113 () Bool)

(assert (=> b!1192298 m!1101113))

(declare-fun m!1101115 () Bool)

(assert (=> b!1192298 m!1101115))

(declare-fun m!1101117 () Bool)

(assert (=> b!1192294 m!1101117))

(declare-fun m!1101119 () Bool)

(assert (=> b!1192296 m!1101119))

(declare-fun m!1101121 () Bool)

(assert (=> b!1192288 m!1101121))

(check-sat (not start!100224) (not mapNonEmpty!46973) (not b!1192287) (not b_next!25567) tp_is_empty!30097 (not b!1192289) (not b!1192288) b_and!42005 (not b!1192294) (not b!1192296) (not b!1192290) (not b!1192291) (not b_lambda!20705) (not b!1192298) (not b!1192299))
(check-sat b_and!42005 (not b_next!25567))
