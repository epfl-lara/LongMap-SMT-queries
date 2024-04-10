; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100184 () Bool)

(assert start!100184)

(declare-fun b!1194724 () Bool)

(declare-fun e!678958 () Bool)

(declare-fun e!678963 () Bool)

(declare-fun mapRes!47234 () Bool)

(assert (=> b!1194724 (= e!678958 (and e!678963 mapRes!47234))))

(declare-fun condMapEmpty!47234 () Bool)

(declare-datatypes ((V!45483 0))(
  ( (V!45484 (val!15190 Int)) )
))
(declare-datatypes ((ValueCell!14424 0))(
  ( (ValueCellFull!14424 (v!17828 V!45483)) (EmptyCell!14424) )
))
(declare-datatypes ((array!77315 0))(
  ( (array!77316 (arr!37305 (Array (_ BitVec 32) ValueCell!14424)) (size!37841 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77315)

(declare-fun mapDefault!47234 () ValueCell!14424)

(assert (=> b!1194724 (= condMapEmpty!47234 (= (arr!37305 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14424)) mapDefault!47234)))))

(declare-fun b!1194725 () Bool)

(declare-fun res!794923 () Bool)

(declare-fun e!678961 () Bool)

(assert (=> b!1194725 (=> (not res!794923) (not e!678961))))

(declare-datatypes ((array!77317 0))(
  ( (array!77318 (arr!37306 (Array (_ BitVec 32) (_ BitVec 64))) (size!37842 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77317)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1194725 (= res!794923 (= (select (arr!37306 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!47234 () Bool)

(declare-fun tp!89844 () Bool)

(declare-fun e!678960 () Bool)

(assert (=> mapNonEmpty!47234 (= mapRes!47234 (and tp!89844 e!678960))))

(declare-fun mapRest!47234 () (Array (_ BitVec 32) ValueCell!14424))

(declare-fun mapKey!47234 () (_ BitVec 32))

(declare-fun mapValue!47234 () ValueCell!14424)

(assert (=> mapNonEmpty!47234 (= (arr!37305 _values!996) (store mapRest!47234 mapKey!47234 mapValue!47234))))

(declare-fun b!1194726 () Bool)

(declare-fun res!794921 () Bool)

(declare-fun e!678959 () Bool)

(assert (=> b!1194726 (=> (not res!794921) (not e!678959))))

(declare-fun lt!542811 () array!77317)

(declare-datatypes ((List!26265 0))(
  ( (Nil!26262) (Cons!26261 (h!27470 (_ BitVec 64)) (t!38936 List!26265)) )
))
(declare-fun arrayNoDuplicates!0 (array!77317 (_ BitVec 32) List!26265) Bool)

(assert (=> b!1194726 (= res!794921 (arrayNoDuplicates!0 lt!542811 #b00000000000000000000000000000000 Nil!26262))))

(declare-fun b!1194727 () Bool)

(declare-fun res!794927 () Bool)

(assert (=> b!1194727 (=> (not res!794927) (not e!678961))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1194727 (= res!794927 (validMask!0 mask!1564))))

(declare-fun b!1194728 () Bool)

(declare-fun res!794926 () Bool)

(assert (=> b!1194728 (=> (not res!794926) (not e!678961))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77317 (_ BitVec 32)) Bool)

(assert (=> b!1194728 (= res!794926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1194729 () Bool)

(declare-fun tp_is_empty!30267 () Bool)

(assert (=> b!1194729 (= e!678960 tp_is_empty!30267)))

(declare-fun b!1194730 () Bool)

(declare-fun res!794924 () Bool)

(assert (=> b!1194730 (=> (not res!794924) (not e!678961))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1194730 (= res!794924 (validKeyInArray!0 k0!934))))

(declare-fun b!1194731 () Bool)

(assert (=> b!1194731 (= e!678959 (not true))))

(declare-fun arrayContainsKey!0 (array!77317 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1194731 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39608 0))(
  ( (Unit!39609) )
))
(declare-fun lt!542810 () Unit!39608)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77317 (_ BitVec 64) (_ BitVec 32)) Unit!39608)

(assert (=> b!1194731 (= lt!542810 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1194732 () Bool)

(assert (=> b!1194732 (= e!678961 e!678959)))

(declare-fun res!794922 () Bool)

(assert (=> b!1194732 (=> (not res!794922) (not e!678959))))

(assert (=> b!1194732 (= res!794922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542811 mask!1564))))

(assert (=> b!1194732 (= lt!542811 (array!77318 (store (arr!37306 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37842 _keys!1208)))))

(declare-fun mapIsEmpty!47234 () Bool)

(assert (=> mapIsEmpty!47234 mapRes!47234))

(declare-fun b!1194733 () Bool)

(declare-fun res!794925 () Bool)

(assert (=> b!1194733 (=> (not res!794925) (not e!678961))))

(assert (=> b!1194733 (= res!794925 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37842 _keys!1208))))))

(declare-fun res!794928 () Bool)

(assert (=> start!100184 (=> (not res!794928) (not e!678961))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100184 (= res!794928 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37842 _keys!1208))))))

(assert (=> start!100184 e!678961))

(declare-fun array_inv!28436 (array!77317) Bool)

(assert (=> start!100184 (array_inv!28436 _keys!1208)))

(assert (=> start!100184 true))

(declare-fun array_inv!28437 (array!77315) Bool)

(assert (=> start!100184 (and (array_inv!28437 _values!996) e!678958)))

(declare-fun b!1194734 () Bool)

(assert (=> b!1194734 (= e!678963 tp_is_empty!30267)))

(declare-fun b!1194735 () Bool)

(declare-fun res!794930 () Bool)

(assert (=> b!1194735 (=> (not res!794930) (not e!678961))))

(assert (=> b!1194735 (= res!794930 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26262))))

(declare-fun b!1194736 () Bool)

(declare-fun res!794929 () Bool)

(assert (=> b!1194736 (=> (not res!794929) (not e!678961))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1194736 (= res!794929 (and (= (size!37841 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37842 _keys!1208) (size!37841 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!100184 res!794928) b!1194727))

(assert (= (and b!1194727 res!794927) b!1194736))

(assert (= (and b!1194736 res!794929) b!1194728))

(assert (= (and b!1194728 res!794926) b!1194735))

(assert (= (and b!1194735 res!794930) b!1194733))

(assert (= (and b!1194733 res!794925) b!1194730))

(assert (= (and b!1194730 res!794924) b!1194725))

(assert (= (and b!1194725 res!794923) b!1194732))

(assert (= (and b!1194732 res!794922) b!1194726))

(assert (= (and b!1194726 res!794921) b!1194731))

(assert (= (and b!1194724 condMapEmpty!47234) mapIsEmpty!47234))

(assert (= (and b!1194724 (not condMapEmpty!47234)) mapNonEmpty!47234))

(get-info :version)

(assert (= (and mapNonEmpty!47234 ((_ is ValueCellFull!14424) mapValue!47234)) b!1194729))

(assert (= (and b!1194724 ((_ is ValueCellFull!14424) mapDefault!47234)) b!1194734))

(assert (= start!100184 b!1194724))

(declare-fun m!1102527 () Bool)

(assert (=> start!100184 m!1102527))

(declare-fun m!1102529 () Bool)

(assert (=> start!100184 m!1102529))

(declare-fun m!1102531 () Bool)

(assert (=> b!1194731 m!1102531))

(declare-fun m!1102533 () Bool)

(assert (=> b!1194731 m!1102533))

(declare-fun m!1102535 () Bool)

(assert (=> b!1194732 m!1102535))

(declare-fun m!1102537 () Bool)

(assert (=> b!1194732 m!1102537))

(declare-fun m!1102539 () Bool)

(assert (=> b!1194727 m!1102539))

(declare-fun m!1102541 () Bool)

(assert (=> b!1194728 m!1102541))

(declare-fun m!1102543 () Bool)

(assert (=> b!1194730 m!1102543))

(declare-fun m!1102545 () Bool)

(assert (=> mapNonEmpty!47234 m!1102545))

(declare-fun m!1102547 () Bool)

(assert (=> b!1194726 m!1102547))

(declare-fun m!1102549 () Bool)

(assert (=> b!1194735 m!1102549))

(declare-fun m!1102551 () Bool)

(assert (=> b!1194725 m!1102551))

(check-sat (not b!1194728) (not start!100184) (not b!1194735) (not b!1194731) (not b!1194730) tp_is_empty!30267 (not b!1194726) (not mapNonEmpty!47234) (not b!1194727) (not b!1194732))
(check-sat)
