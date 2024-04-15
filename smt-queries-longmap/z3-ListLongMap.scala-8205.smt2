; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100090 () Bool)

(assert start!100090)

(declare-fun b_free!25669 () Bool)

(declare-fun b_next!25669 () Bool)

(assert (=> start!100090 (= b_free!25669 (not b_next!25669))))

(declare-fun tp!89729 () Bool)

(declare-fun b_and!42183 () Bool)

(assert (=> start!100090 (= tp!89729 b_and!42183)))

(declare-fun b!1193392 () Bool)

(declare-fun e!678248 () Bool)

(declare-datatypes ((V!45401 0))(
  ( (V!45402 (val!15159 Int)) )
))
(declare-datatypes ((tuple2!19596 0))(
  ( (tuple2!19597 (_1!9809 (_ BitVec 64)) (_2!9809 V!45401)) )
))
(declare-datatypes ((List!26313 0))(
  ( (Nil!26310) (Cons!26309 (h!27518 tuple2!19596) (t!38965 List!26313)) )
))
(declare-datatypes ((ListLongMap!17565 0))(
  ( (ListLongMap!17566 (toList!8798 List!26313)) )
))
(declare-fun call!57099 () ListLongMap!17565)

(declare-fun call!57100 () ListLongMap!17565)

(assert (=> b!1193392 (= e!678248 (= call!57099 call!57100))))

(declare-fun b!1193393 () Bool)

(declare-fun res!794007 () Bool)

(declare-fun e!678246 () Bool)

(assert (=> b!1193393 (=> (not res!794007) (not e!678246))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1193393 (= res!794007 (validMask!0 mask!1564))))

(declare-fun b!1193394 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1738 (ListLongMap!17565 (_ BitVec 64)) ListLongMap!17565)

(assert (=> b!1193394 (= e!678248 (= call!57099 (-!1738 call!57100 k0!934)))))

(declare-fun zeroValue!944 () V!45401)

(declare-datatypes ((array!77126 0))(
  ( (array!77127 (arr!37213 (Array (_ BitVec 32) (_ BitVec 64))) (size!37751 (_ BitVec 32))) )
))
(declare-fun lt!542409 () array!77126)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!57096 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14393 0))(
  ( (ValueCellFull!14393 (v!17796 V!45401)) (EmptyCell!14393) )
))
(declare-datatypes ((array!77128 0))(
  ( (array!77129 (arr!37214 (Array (_ BitVec 32) ValueCell!14393)) (size!37752 (_ BitVec 32))) )
))
(declare-fun lt!542410 () array!77128)

(declare-fun minValue!944 () V!45401)

(declare-fun getCurrentListMapNoExtraKeys!5248 (array!77126 array!77128 (_ BitVec 32) (_ BitVec 32) V!45401 V!45401 (_ BitVec 32) Int) ListLongMap!17565)

(assert (=> bm!57096 (= call!57099 (getCurrentListMapNoExtraKeys!5248 lt!542409 lt!542410 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1193395 () Bool)

(declare-fun res!794010 () Bool)

(assert (=> b!1193395 (=> (not res!794010) (not e!678246))))

(declare-fun _keys!1208 () array!77126)

(declare-fun _values!996 () array!77128)

(assert (=> b!1193395 (= res!794010 (and (= (size!37752 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37751 _keys!1208) (size!37752 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1193396 () Bool)

(declare-fun e!678247 () Bool)

(declare-fun e!678251 () Bool)

(declare-fun mapRes!47135 () Bool)

(assert (=> b!1193396 (= e!678247 (and e!678251 mapRes!47135))))

(declare-fun condMapEmpty!47135 () Bool)

(declare-fun mapDefault!47135 () ValueCell!14393)

(assert (=> b!1193396 (= condMapEmpty!47135 (= (arr!37214 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14393)) mapDefault!47135)))))

(declare-fun mapIsEmpty!47135 () Bool)

(assert (=> mapIsEmpty!47135 mapRes!47135))

(declare-fun b!1193397 () Bool)

(declare-fun tp_is_empty!30205 () Bool)

(assert (=> b!1193397 (= e!678251 tp_is_empty!30205)))

(declare-fun b!1193398 () Bool)

(declare-fun res!794006 () Bool)

(assert (=> b!1193398 (=> (not res!794006) (not e!678246))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1193398 (= res!794006 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!47135 () Bool)

(declare-fun tp!89730 () Bool)

(declare-fun e!678250 () Bool)

(assert (=> mapNonEmpty!47135 (= mapRes!47135 (and tp!89730 e!678250))))

(declare-fun mapValue!47135 () ValueCell!14393)

(declare-fun mapKey!47135 () (_ BitVec 32))

(declare-fun mapRest!47135 () (Array (_ BitVec 32) ValueCell!14393))

(assert (=> mapNonEmpty!47135 (= (arr!37214 _values!996) (store mapRest!47135 mapKey!47135 mapValue!47135))))

(declare-fun b!1193399 () Bool)

(declare-fun res!794009 () Bool)

(declare-fun e!678249 () Bool)

(assert (=> b!1193399 (=> (not res!794009) (not e!678249))))

(declare-datatypes ((List!26314 0))(
  ( (Nil!26311) (Cons!26310 (h!27519 (_ BitVec 64)) (t!38966 List!26314)) )
))
(declare-fun arrayNoDuplicates!0 (array!77126 (_ BitVec 32) List!26314) Bool)

(assert (=> b!1193399 (= res!794009 (arrayNoDuplicates!0 lt!542409 #b00000000000000000000000000000000 Nil!26311))))

(declare-fun b!1193400 () Bool)

(declare-fun res!794004 () Bool)

(assert (=> b!1193400 (=> (not res!794004) (not e!678246))))

(assert (=> b!1193400 (= res!794004 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26311))))

(declare-fun b!1193401 () Bool)

(declare-fun res!794000 () Bool)

(assert (=> b!1193401 (=> (not res!794000) (not e!678246))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1193401 (= res!794000 (= (select (arr!37213 _keys!1208) i!673) k0!934))))

(declare-fun bm!57097 () Bool)

(assert (=> bm!57097 (= call!57100 (getCurrentListMapNoExtraKeys!5248 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1193402 () Bool)

(declare-fun e!678245 () Bool)

(assert (=> b!1193402 (= e!678249 (not e!678245))))

(declare-fun res!794008 () Bool)

(assert (=> b!1193402 (=> res!794008 e!678245)))

(assert (=> b!1193402 (= res!794008 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77126 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1193402 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39465 0))(
  ( (Unit!39466) )
))
(declare-fun lt!542407 () Unit!39465)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77126 (_ BitVec 64) (_ BitVec 32)) Unit!39465)

(assert (=> b!1193402 (= lt!542407 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1193403 () Bool)

(declare-fun res!794002 () Bool)

(assert (=> b!1193403 (=> (not res!794002) (not e!678246))))

(assert (=> b!1193403 (= res!794002 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37751 _keys!1208))))))

(declare-fun b!1193404 () Bool)

(assert (=> b!1193404 (= e!678246 e!678249)))

(declare-fun res!794005 () Bool)

(assert (=> b!1193404 (=> (not res!794005) (not e!678249))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77126 (_ BitVec 32)) Bool)

(assert (=> b!1193404 (= res!794005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542409 mask!1564))))

(assert (=> b!1193404 (= lt!542409 (array!77127 (store (arr!37213 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37751 _keys!1208)))))

(declare-fun res!794003 () Bool)

(assert (=> start!100090 (=> (not res!794003) (not e!678246))))

(assert (=> start!100090 (= res!794003 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37751 _keys!1208))))))

(assert (=> start!100090 e!678246))

(assert (=> start!100090 tp_is_empty!30205))

(declare-fun array_inv!28494 (array!77126) Bool)

(assert (=> start!100090 (array_inv!28494 _keys!1208)))

(assert (=> start!100090 true))

(assert (=> start!100090 tp!89729))

(declare-fun array_inv!28495 (array!77128) Bool)

(assert (=> start!100090 (and (array_inv!28495 _values!996) e!678247)))

(declare-fun b!1193405 () Bool)

(declare-fun e!678252 () Bool)

(assert (=> b!1193405 (= e!678252 (= (select (arr!37213 _keys!1208) from!1455) k0!934))))

(assert (=> b!1193405 e!678248))

(declare-fun c!117277 () Bool)

(assert (=> b!1193405 (= c!117277 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!542412 () Unit!39465)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!988 (array!77126 array!77128 (_ BitVec 32) (_ BitVec 32) V!45401 V!45401 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39465)

(assert (=> b!1193405 (= lt!542412 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!988 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1193406 () Bool)

(assert (=> b!1193406 (= e!678250 tp_is_empty!30205)))

(declare-fun b!1193407 () Bool)

(assert (=> b!1193407 (= e!678245 e!678252)))

(declare-fun res!794011 () Bool)

(assert (=> b!1193407 (=> res!794011 e!678252)))

(assert (=> b!1193407 (= res!794011 (not (= from!1455 i!673)))))

(declare-fun lt!542408 () ListLongMap!17565)

(assert (=> b!1193407 (= lt!542408 (getCurrentListMapNoExtraKeys!5248 lt!542409 lt!542410 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3133 (Int (_ BitVec 64)) V!45401)

(assert (=> b!1193407 (= lt!542410 (array!77129 (store (arr!37214 _values!996) i!673 (ValueCellFull!14393 (dynLambda!3133 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37752 _values!996)))))

(declare-fun lt!542411 () ListLongMap!17565)

(assert (=> b!1193407 (= lt!542411 (getCurrentListMapNoExtraKeys!5248 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1193408 () Bool)

(declare-fun res!794001 () Bool)

(assert (=> b!1193408 (=> (not res!794001) (not e!678246))))

(assert (=> b!1193408 (= res!794001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!100090 res!794003) b!1193393))

(assert (= (and b!1193393 res!794007) b!1193395))

(assert (= (and b!1193395 res!794010) b!1193408))

(assert (= (and b!1193408 res!794001) b!1193400))

(assert (= (and b!1193400 res!794004) b!1193403))

(assert (= (and b!1193403 res!794002) b!1193398))

(assert (= (and b!1193398 res!794006) b!1193401))

(assert (= (and b!1193401 res!794000) b!1193404))

(assert (= (and b!1193404 res!794005) b!1193399))

(assert (= (and b!1193399 res!794009) b!1193402))

(assert (= (and b!1193402 (not res!794008)) b!1193407))

(assert (= (and b!1193407 (not res!794011)) b!1193405))

(assert (= (and b!1193405 c!117277) b!1193394))

(assert (= (and b!1193405 (not c!117277)) b!1193392))

(assert (= (or b!1193394 b!1193392) bm!57096))

(assert (= (or b!1193394 b!1193392) bm!57097))

(assert (= (and b!1193396 condMapEmpty!47135) mapIsEmpty!47135))

(assert (= (and b!1193396 (not condMapEmpty!47135)) mapNonEmpty!47135))

(get-info :version)

(assert (= (and mapNonEmpty!47135 ((_ is ValueCellFull!14393) mapValue!47135)) b!1193406))

(assert (= (and b!1193396 ((_ is ValueCellFull!14393) mapDefault!47135)) b!1193397))

(assert (= start!100090 b!1193396))

(declare-fun b_lambda!20795 () Bool)

(assert (=> (not b_lambda!20795) (not b!1193407)))

(declare-fun t!38964 () Bool)

(declare-fun tb!10473 () Bool)

(assert (=> (and start!100090 (= defaultEntry!1004 defaultEntry!1004) t!38964) tb!10473))

(declare-fun result!21521 () Bool)

(assert (=> tb!10473 (= result!21521 tp_is_empty!30205)))

(assert (=> b!1193407 t!38964))

(declare-fun b_and!42185 () Bool)

(assert (= b_and!42183 (and (=> t!38964 result!21521) b_and!42185)))

(declare-fun m!1101119 () Bool)

(assert (=> b!1193401 m!1101119))

(declare-fun m!1101121 () Bool)

(assert (=> mapNonEmpty!47135 m!1101121))

(declare-fun m!1101123 () Bool)

(assert (=> b!1193400 m!1101123))

(declare-fun m!1101125 () Bool)

(assert (=> b!1193402 m!1101125))

(declare-fun m!1101127 () Bool)

(assert (=> b!1193402 m!1101127))

(declare-fun m!1101129 () Bool)

(assert (=> b!1193408 m!1101129))

(declare-fun m!1101131 () Bool)

(assert (=> b!1193394 m!1101131))

(declare-fun m!1101133 () Bool)

(assert (=> b!1193405 m!1101133))

(declare-fun m!1101135 () Bool)

(assert (=> b!1193405 m!1101135))

(declare-fun m!1101137 () Bool)

(assert (=> b!1193393 m!1101137))

(declare-fun m!1101139 () Bool)

(assert (=> b!1193399 m!1101139))

(declare-fun m!1101141 () Bool)

(assert (=> bm!57097 m!1101141))

(declare-fun m!1101143 () Bool)

(assert (=> b!1193404 m!1101143))

(declare-fun m!1101145 () Bool)

(assert (=> b!1193404 m!1101145))

(declare-fun m!1101147 () Bool)

(assert (=> b!1193407 m!1101147))

(declare-fun m!1101149 () Bool)

(assert (=> b!1193407 m!1101149))

(declare-fun m!1101151 () Bool)

(assert (=> b!1193407 m!1101151))

(declare-fun m!1101153 () Bool)

(assert (=> b!1193407 m!1101153))

(declare-fun m!1101155 () Bool)

(assert (=> start!100090 m!1101155))

(declare-fun m!1101157 () Bool)

(assert (=> start!100090 m!1101157))

(declare-fun m!1101159 () Bool)

(assert (=> b!1193398 m!1101159))

(declare-fun m!1101161 () Bool)

(assert (=> bm!57096 m!1101161))

(check-sat (not start!100090) (not b!1193399) (not b!1193393) (not bm!57097) (not b!1193407) (not bm!57096) b_and!42185 (not b!1193400) (not b!1193394) (not b!1193408) (not mapNonEmpty!47135) (not b!1193402) (not b_lambda!20795) tp_is_empty!30205 (not b!1193398) (not b!1193405) (not b!1193404) (not b_next!25669))
(check-sat b_and!42185 (not b_next!25669))
