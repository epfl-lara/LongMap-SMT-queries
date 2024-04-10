; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100278 () Bool)

(assert start!100278)

(declare-fun b!1196295 () Bool)

(declare-fun res!796124 () Bool)

(declare-fun e!679701 () Bool)

(assert (=> b!1196295 (=> (not res!796124) (not e!679701))))

(declare-datatypes ((array!77471 0))(
  ( (array!77472 (arr!37382 (Array (_ BitVec 32) (_ BitVec 64))) (size!37918 (_ BitVec 32))) )
))
(declare-fun lt!543059 () array!77471)

(declare-datatypes ((List!26300 0))(
  ( (Nil!26297) (Cons!26296 (h!27505 (_ BitVec 64)) (t!38971 List!26300)) )
))
(declare-fun arrayNoDuplicates!0 (array!77471 (_ BitVec 32) List!26300) Bool)

(assert (=> b!1196295 (= res!796124 (arrayNoDuplicates!0 lt!543059 #b00000000000000000000000000000000 Nil!26297))))

(declare-fun b!1196296 () Bool)

(assert (=> b!1196296 (= e!679701 (not true))))

(declare-fun _keys!1208 () array!77471)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77471 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1196296 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39666 0))(
  ( (Unit!39667) )
))
(declare-fun lt!543060 () Unit!39666)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77471 (_ BitVec 64) (_ BitVec 32)) Unit!39666)

(assert (=> b!1196296 (= lt!543060 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1196297 () Bool)

(declare-fun res!796121 () Bool)

(declare-fun e!679700 () Bool)

(assert (=> b!1196297 (=> (not res!796121) (not e!679700))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1196297 (= res!796121 (validMask!0 mask!1564))))

(declare-fun b!1196298 () Bool)

(declare-fun res!796126 () Bool)

(assert (=> b!1196298 (=> (not res!796126) (not e!679700))))

(assert (=> b!1196298 (= res!796126 (= (select (arr!37382 _keys!1208) i!673) k0!934))))

(declare-fun b!1196300 () Bool)

(declare-fun res!796120 () Bool)

(assert (=> b!1196300 (=> (not res!796120) (not e!679700))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45587 0))(
  ( (V!45588 (val!15229 Int)) )
))
(declare-datatypes ((ValueCell!14463 0))(
  ( (ValueCellFull!14463 (v!17867 V!45587)) (EmptyCell!14463) )
))
(declare-datatypes ((array!77473 0))(
  ( (array!77474 (arr!37383 (Array (_ BitVec 32) ValueCell!14463)) (size!37919 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77473)

(assert (=> b!1196300 (= res!796120 (and (= (size!37919 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37918 _keys!1208) (size!37919 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!47354 () Bool)

(declare-fun mapRes!47354 () Bool)

(declare-fun tp!89964 () Bool)

(declare-fun e!679702 () Bool)

(assert (=> mapNonEmpty!47354 (= mapRes!47354 (and tp!89964 e!679702))))

(declare-fun mapValue!47354 () ValueCell!14463)

(declare-fun mapRest!47354 () (Array (_ BitVec 32) ValueCell!14463))

(declare-fun mapKey!47354 () (_ BitVec 32))

(assert (=> mapNonEmpty!47354 (= (arr!37383 _values!996) (store mapRest!47354 mapKey!47354 mapValue!47354))))

(declare-fun b!1196301 () Bool)

(declare-fun res!796118 () Bool)

(assert (=> b!1196301 (=> (not res!796118) (not e!679700))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1196301 (= res!796118 (validKeyInArray!0 k0!934))))

(declare-fun b!1196302 () Bool)

(declare-fun res!796125 () Bool)

(assert (=> b!1196302 (=> (not res!796125) (not e!679700))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77471 (_ BitVec 32)) Bool)

(assert (=> b!1196302 (= res!796125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1196303 () Bool)

(declare-fun e!679704 () Bool)

(declare-fun tp_is_empty!30345 () Bool)

(assert (=> b!1196303 (= e!679704 tp_is_empty!30345)))

(declare-fun b!1196304 () Bool)

(declare-fun res!796119 () Bool)

(assert (=> b!1196304 (=> (not res!796119) (not e!679700))))

(assert (=> b!1196304 (= res!796119 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37918 _keys!1208))))))

(declare-fun b!1196305 () Bool)

(declare-fun res!796117 () Bool)

(assert (=> b!1196305 (=> (not res!796117) (not e!679700))))

(assert (=> b!1196305 (= res!796117 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26297))))

(declare-fun b!1196306 () Bool)

(declare-fun e!679705 () Bool)

(assert (=> b!1196306 (= e!679705 (and e!679704 mapRes!47354))))

(declare-fun condMapEmpty!47354 () Bool)

(declare-fun mapDefault!47354 () ValueCell!14463)

(assert (=> b!1196306 (= condMapEmpty!47354 (= (arr!37383 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14463)) mapDefault!47354)))))

(declare-fun res!796122 () Bool)

(assert (=> start!100278 (=> (not res!796122) (not e!679700))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100278 (= res!796122 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37918 _keys!1208))))))

(assert (=> start!100278 e!679700))

(declare-fun array_inv!28492 (array!77471) Bool)

(assert (=> start!100278 (array_inv!28492 _keys!1208)))

(assert (=> start!100278 true))

(declare-fun array_inv!28493 (array!77473) Bool)

(assert (=> start!100278 (and (array_inv!28493 _values!996) e!679705)))

(declare-fun b!1196299 () Bool)

(assert (=> b!1196299 (= e!679702 tp_is_empty!30345)))

(declare-fun b!1196307 () Bool)

(assert (=> b!1196307 (= e!679700 e!679701)))

(declare-fun res!796123 () Bool)

(assert (=> b!1196307 (=> (not res!796123) (not e!679701))))

(assert (=> b!1196307 (= res!796123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543059 mask!1564))))

(assert (=> b!1196307 (= lt!543059 (array!77472 (store (arr!37382 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37918 _keys!1208)))))

(declare-fun mapIsEmpty!47354 () Bool)

(assert (=> mapIsEmpty!47354 mapRes!47354))

(assert (= (and start!100278 res!796122) b!1196297))

(assert (= (and b!1196297 res!796121) b!1196300))

(assert (= (and b!1196300 res!796120) b!1196302))

(assert (= (and b!1196302 res!796125) b!1196305))

(assert (= (and b!1196305 res!796117) b!1196304))

(assert (= (and b!1196304 res!796119) b!1196301))

(assert (= (and b!1196301 res!796118) b!1196298))

(assert (= (and b!1196298 res!796126) b!1196307))

(assert (= (and b!1196307 res!796123) b!1196295))

(assert (= (and b!1196295 res!796124) b!1196296))

(assert (= (and b!1196306 condMapEmpty!47354) mapIsEmpty!47354))

(assert (= (and b!1196306 (not condMapEmpty!47354)) mapNonEmpty!47354))

(get-info :version)

(assert (= (and mapNonEmpty!47354 ((_ is ValueCellFull!14463) mapValue!47354)) b!1196299))

(assert (= (and b!1196306 ((_ is ValueCellFull!14463) mapDefault!47354)) b!1196303))

(assert (= start!100278 b!1196306))

(declare-fun m!1103579 () Bool)

(assert (=> b!1196301 m!1103579))

(declare-fun m!1103581 () Bool)

(assert (=> b!1196305 m!1103581))

(declare-fun m!1103583 () Bool)

(assert (=> mapNonEmpty!47354 m!1103583))

(declare-fun m!1103585 () Bool)

(assert (=> b!1196302 m!1103585))

(declare-fun m!1103587 () Bool)

(assert (=> b!1196298 m!1103587))

(declare-fun m!1103589 () Bool)

(assert (=> b!1196307 m!1103589))

(declare-fun m!1103591 () Bool)

(assert (=> b!1196307 m!1103591))

(declare-fun m!1103593 () Bool)

(assert (=> start!100278 m!1103593))

(declare-fun m!1103595 () Bool)

(assert (=> start!100278 m!1103595))

(declare-fun m!1103597 () Bool)

(assert (=> b!1196296 m!1103597))

(declare-fun m!1103599 () Bool)

(assert (=> b!1196296 m!1103599))

(declare-fun m!1103601 () Bool)

(assert (=> b!1196297 m!1103601))

(declare-fun m!1103603 () Bool)

(assert (=> b!1196295 m!1103603))

(check-sat (not b!1196307) (not b!1196302) tp_is_empty!30345 (not b!1196296) (not b!1196305) (not b!1196301) (not b!1196297) (not mapNonEmpty!47354) (not start!100278) (not b!1196295))
(check-sat)
