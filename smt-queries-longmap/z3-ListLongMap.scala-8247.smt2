; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100666 () Bool)

(assert start!100666)

(declare-fun b_free!25753 () Bool)

(declare-fun b_next!25753 () Bool)

(assert (=> start!100666 (= b_free!25753 (not b_next!25753))))

(declare-fun tp!90249 () Bool)

(declare-fun b_and!42395 () Bool)

(assert (=> start!100666 (= tp!90249 b_and!42395)))

(declare-fun b!1200257 () Bool)

(declare-fun res!798513 () Bool)

(declare-fun e!681851 () Bool)

(assert (=> b!1200257 (=> (not res!798513) (not e!681851))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!77729 0))(
  ( (array!77730 (arr!37503 (Array (_ BitVec 32) (_ BitVec 64))) (size!38040 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77729)

(assert (=> b!1200257 (= res!798513 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38040 _keys!1208))))))

(declare-fun b!1200258 () Bool)

(declare-fun res!798510 () Bool)

(declare-fun e!681852 () Bool)

(assert (=> b!1200258 (=> (not res!798510) (not e!681852))))

(declare-fun lt!544125 () array!77729)

(declare-datatypes ((List!26397 0))(
  ( (Nil!26394) (Cons!26393 (h!27611 (_ BitVec 64)) (t!39122 List!26397)) )
))
(declare-fun arrayNoDuplicates!0 (array!77729 (_ BitVec 32) List!26397) Bool)

(assert (=> b!1200258 (= res!798510 (arrayNoDuplicates!0 lt!544125 #b00000000000000000000000000000000 Nil!26394))))

(declare-fun b!1200259 () Bool)

(declare-fun e!681853 () Bool)

(declare-fun tp_is_empty!30457 () Bool)

(assert (=> b!1200259 (= e!681853 tp_is_empty!30457)))

(declare-fun mapIsEmpty!47528 () Bool)

(declare-fun mapRes!47528 () Bool)

(assert (=> mapIsEmpty!47528 mapRes!47528))

(declare-fun b!1200260 () Bool)

(declare-fun res!798514 () Bool)

(assert (=> b!1200260 (=> (not res!798514) (not e!681851))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1200260 (= res!798514 (validMask!0 mask!1564))))

(declare-fun b!1200261 () Bool)

(declare-fun res!798512 () Bool)

(assert (=> b!1200261 (=> (not res!798512) (not e!681851))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1200261 (= res!798512 (validKeyInArray!0 k0!934))))

(declare-fun b!1200262 () Bool)

(declare-fun e!681857 () Bool)

(assert (=> b!1200262 (= e!681857 tp_is_empty!30457)))

(declare-fun b!1200263 () Bool)

(declare-fun res!798519 () Bool)

(assert (=> b!1200263 (=> (not res!798519) (not e!681851))))

(assert (=> b!1200263 (= res!798519 (= (select (arr!37503 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!47528 () Bool)

(declare-fun tp!90248 () Bool)

(assert (=> mapNonEmpty!47528 (= mapRes!47528 (and tp!90248 e!681857))))

(declare-fun mapKey!47528 () (_ BitVec 32))

(declare-datatypes ((V!45737 0))(
  ( (V!45738 (val!15285 Int)) )
))
(declare-datatypes ((ValueCell!14519 0))(
  ( (ValueCellFull!14519 (v!17919 V!45737)) (EmptyCell!14519) )
))
(declare-fun mapRest!47528 () (Array (_ BitVec 32) ValueCell!14519))

(declare-datatypes ((array!77731 0))(
  ( (array!77732 (arr!37504 (Array (_ BitVec 32) ValueCell!14519)) (size!38041 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77731)

(declare-fun mapValue!47528 () ValueCell!14519)

(assert (=> mapNonEmpty!47528 (= (arr!37504 _values!996) (store mapRest!47528 mapKey!47528 mapValue!47528))))

(declare-fun b!1200264 () Bool)

(declare-fun res!798517 () Bool)

(assert (=> b!1200264 (=> (not res!798517) (not e!681851))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1200264 (= res!798517 (and (= (size!38041 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38040 _keys!1208) (size!38041 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1200265 () Bool)

(declare-fun res!798520 () Bool)

(assert (=> b!1200265 (=> (not res!798520) (not e!681851))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77729 (_ BitVec 32)) Bool)

(assert (=> b!1200265 (= res!798520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!798516 () Bool)

(assert (=> start!100666 (=> (not res!798516) (not e!681851))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100666 (= res!798516 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38040 _keys!1208))))))

(assert (=> start!100666 e!681851))

(assert (=> start!100666 tp_is_empty!30457))

(declare-fun array_inv!28650 (array!77729) Bool)

(assert (=> start!100666 (array_inv!28650 _keys!1208)))

(assert (=> start!100666 true))

(assert (=> start!100666 tp!90249))

(declare-fun e!681855 () Bool)

(declare-fun array_inv!28651 (array!77731) Bool)

(assert (=> start!100666 (and (array_inv!28651 _values!996) e!681855)))

(declare-fun b!1200266 () Bool)

(declare-fun e!681856 () Bool)

(assert (=> b!1200266 (= e!681856 true)))

(declare-fun zeroValue!944 () V!45737)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19580 0))(
  ( (tuple2!19581 (_1!9801 (_ BitVec 64)) (_2!9801 V!45737)) )
))
(declare-datatypes ((List!26398 0))(
  ( (Nil!26395) (Cons!26394 (h!27612 tuple2!19580) (t!39123 List!26398)) )
))
(declare-datatypes ((ListLongMap!17557 0))(
  ( (ListLongMap!17558 (toList!8794 List!26398)) )
))
(declare-fun lt!544124 () ListLongMap!17557)

(declare-fun minValue!944 () V!45737)

(declare-fun getCurrentListMapNoExtraKeys!5261 (array!77729 array!77731 (_ BitVec 32) (_ BitVec 32) V!45737 V!45737 (_ BitVec 32) Int) ListLongMap!17557)

(declare-fun dynLambda!3205 (Int (_ BitVec 64)) V!45737)

(assert (=> b!1200266 (= lt!544124 (getCurrentListMapNoExtraKeys!5261 lt!544125 (array!77732 (store (arr!37504 _values!996) i!673 (ValueCellFull!14519 (dynLambda!3205 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38041 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!544126 () ListLongMap!17557)

(assert (=> b!1200266 (= lt!544126 (getCurrentListMapNoExtraKeys!5261 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1200267 () Bool)

(assert (=> b!1200267 (= e!681852 (not e!681856))))

(declare-fun res!798515 () Bool)

(assert (=> b!1200267 (=> res!798515 e!681856)))

(assert (=> b!1200267 (= res!798515 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77729 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1200267 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39717 0))(
  ( (Unit!39718) )
))
(declare-fun lt!544127 () Unit!39717)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77729 (_ BitVec 64) (_ BitVec 32)) Unit!39717)

(assert (=> b!1200267 (= lt!544127 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1200268 () Bool)

(declare-fun res!798518 () Bool)

(assert (=> b!1200268 (=> (not res!798518) (not e!681851))))

(assert (=> b!1200268 (= res!798518 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26394))))

(declare-fun b!1200269 () Bool)

(assert (=> b!1200269 (= e!681855 (and e!681853 mapRes!47528))))

(declare-fun condMapEmpty!47528 () Bool)

(declare-fun mapDefault!47528 () ValueCell!14519)

(assert (=> b!1200269 (= condMapEmpty!47528 (= (arr!37504 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14519)) mapDefault!47528)))))

(declare-fun b!1200270 () Bool)

(assert (=> b!1200270 (= e!681851 e!681852)))

(declare-fun res!798511 () Bool)

(assert (=> b!1200270 (=> (not res!798511) (not e!681852))))

(assert (=> b!1200270 (= res!798511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544125 mask!1564))))

(assert (=> b!1200270 (= lt!544125 (array!77730 (store (arr!37503 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38040 _keys!1208)))))

(assert (= (and start!100666 res!798516) b!1200260))

(assert (= (and b!1200260 res!798514) b!1200264))

(assert (= (and b!1200264 res!798517) b!1200265))

(assert (= (and b!1200265 res!798520) b!1200268))

(assert (= (and b!1200268 res!798518) b!1200257))

(assert (= (and b!1200257 res!798513) b!1200261))

(assert (= (and b!1200261 res!798512) b!1200263))

(assert (= (and b!1200263 res!798519) b!1200270))

(assert (= (and b!1200270 res!798511) b!1200258))

(assert (= (and b!1200258 res!798510) b!1200267))

(assert (= (and b!1200267 (not res!798515)) b!1200266))

(assert (= (and b!1200269 condMapEmpty!47528) mapIsEmpty!47528))

(assert (= (and b!1200269 (not condMapEmpty!47528)) mapNonEmpty!47528))

(get-info :version)

(assert (= (and mapNonEmpty!47528 ((_ is ValueCellFull!14519) mapValue!47528)) b!1200262))

(assert (= (and b!1200269 ((_ is ValueCellFull!14519) mapDefault!47528)) b!1200259))

(assert (= start!100666 b!1200269))

(declare-fun b_lambda!20943 () Bool)

(assert (=> (not b_lambda!20943) (not b!1200266)))

(declare-fun t!39121 () Bool)

(declare-fun tb!10545 () Bool)

(assert (=> (and start!100666 (= defaultEntry!1004 defaultEntry!1004) t!39121) tb!10545))

(declare-fun result!21675 () Bool)

(assert (=> tb!10545 (= result!21675 tp_is_empty!30457)))

(assert (=> b!1200266 t!39121))

(declare-fun b_and!42397 () Bool)

(assert (= b_and!42395 (and (=> t!39121 result!21675) b_and!42397)))

(declare-fun m!1107185 () Bool)

(assert (=> b!1200270 m!1107185))

(declare-fun m!1107187 () Bool)

(assert (=> b!1200270 m!1107187))

(declare-fun m!1107189 () Bool)

(assert (=> b!1200263 m!1107189))

(declare-fun m!1107191 () Bool)

(assert (=> b!1200267 m!1107191))

(declare-fun m!1107193 () Bool)

(assert (=> b!1200267 m!1107193))

(declare-fun m!1107195 () Bool)

(assert (=> b!1200268 m!1107195))

(declare-fun m!1107197 () Bool)

(assert (=> start!100666 m!1107197))

(declare-fun m!1107199 () Bool)

(assert (=> start!100666 m!1107199))

(declare-fun m!1107201 () Bool)

(assert (=> b!1200260 m!1107201))

(declare-fun m!1107203 () Bool)

(assert (=> b!1200266 m!1107203))

(declare-fun m!1107205 () Bool)

(assert (=> b!1200266 m!1107205))

(declare-fun m!1107207 () Bool)

(assert (=> b!1200266 m!1107207))

(declare-fun m!1107209 () Bool)

(assert (=> b!1200266 m!1107209))

(declare-fun m!1107211 () Bool)

(assert (=> mapNonEmpty!47528 m!1107211))

(declare-fun m!1107213 () Bool)

(assert (=> b!1200261 m!1107213))

(declare-fun m!1107215 () Bool)

(assert (=> b!1200265 m!1107215))

(declare-fun m!1107217 () Bool)

(assert (=> b!1200258 m!1107217))

(check-sat (not b_next!25753) (not b!1200267) b_and!42397 (not b_lambda!20943) (not b!1200261) (not b!1200260) (not mapNonEmpty!47528) (not b!1200268) tp_is_empty!30457 (not start!100666) (not b!1200265) (not b!1200270) (not b!1200266) (not b!1200258))
(check-sat b_and!42397 (not b_next!25753))
