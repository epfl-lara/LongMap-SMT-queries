; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100464 () Bool)

(assert start!100464)

(declare-fun b!1196609 () Bool)

(declare-fun res!795880 () Bool)

(declare-fun e!680086 () Bool)

(assert (=> b!1196609 (=> (not res!795880) (not e!680086))))

(declare-datatypes ((array!77411 0))(
  ( (array!77412 (arr!37346 (Array (_ BitVec 32) (_ BitVec 64))) (size!37883 (_ BitVec 32))) )
))
(declare-fun lt!543394 () array!77411)

(declare-datatypes ((List!26309 0))(
  ( (Nil!26306) (Cons!26305 (h!27523 (_ BitVec 64)) (t!38972 List!26309)) )
))
(declare-fun arrayNoDuplicates!0 (array!77411 (_ BitVec 32) List!26309) Bool)

(assert (=> b!1196609 (= res!795880 (arrayNoDuplicates!0 lt!543394 #b00000000000000000000000000000000 Nil!26306))))

(declare-fun mapNonEmpty!47279 () Bool)

(declare-fun mapRes!47279 () Bool)

(declare-fun tp!89889 () Bool)

(declare-fun e!680085 () Bool)

(assert (=> mapNonEmpty!47279 (= mapRes!47279 (and tp!89889 e!680085))))

(declare-fun mapKey!47279 () (_ BitVec 32))

(declare-datatypes ((V!45521 0))(
  ( (V!45522 (val!15204 Int)) )
))
(declare-datatypes ((ValueCell!14438 0))(
  ( (ValueCellFull!14438 (v!17838 V!45521)) (EmptyCell!14438) )
))
(declare-fun mapRest!47279 () (Array (_ BitVec 32) ValueCell!14438))

(declare-datatypes ((array!77413 0))(
  ( (array!77414 (arr!37347 (Array (_ BitVec 32) ValueCell!14438)) (size!37884 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77413)

(declare-fun mapValue!47279 () ValueCell!14438)

(assert (=> mapNonEmpty!47279 (= (arr!37347 _values!996) (store mapRest!47279 mapKey!47279 mapValue!47279))))

(declare-fun b!1196610 () Bool)

(declare-fun res!795881 () Bool)

(declare-fun e!680087 () Bool)

(assert (=> b!1196610 (=> (not res!795881) (not e!680087))))

(declare-fun _keys!1208 () array!77411)

(assert (=> b!1196610 (= res!795881 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26306))))

(declare-fun b!1196611 () Bool)

(declare-fun res!795877 () Bool)

(assert (=> b!1196611 (=> (not res!795877) (not e!680087))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1196611 (= res!795877 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!47279 () Bool)

(assert (=> mapIsEmpty!47279 mapRes!47279))

(declare-fun b!1196612 () Bool)

(declare-fun res!795884 () Bool)

(assert (=> b!1196612 (=> (not res!795884) (not e!680087))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77411 (_ BitVec 32)) Bool)

(assert (=> b!1196612 (= res!795884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1196613 () Bool)

(declare-fun e!680084 () Bool)

(declare-fun tp_is_empty!30295 () Bool)

(assert (=> b!1196613 (= e!680084 tp_is_empty!30295)))

(declare-fun b!1196614 () Bool)

(declare-fun res!795879 () Bool)

(assert (=> b!1196614 (=> (not res!795879) (not e!680087))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1196614 (= res!795879 (and (= (size!37884 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37883 _keys!1208) (size!37884 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1196615 () Bool)

(declare-fun res!795882 () Bool)

(assert (=> b!1196615 (=> (not res!795882) (not e!680087))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1196615 (= res!795882 (= (select (arr!37346 _keys!1208) i!673) k0!934))))

(declare-fun res!795876 () Bool)

(assert (=> start!100464 (=> (not res!795876) (not e!680087))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100464 (= res!795876 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37883 _keys!1208))))))

(assert (=> start!100464 e!680087))

(declare-fun array_inv!28540 (array!77411) Bool)

(assert (=> start!100464 (array_inv!28540 _keys!1208)))

(assert (=> start!100464 true))

(declare-fun e!680083 () Bool)

(declare-fun array_inv!28541 (array!77413) Bool)

(assert (=> start!100464 (and (array_inv!28541 _values!996) e!680083)))

(declare-fun b!1196616 () Bool)

(assert (=> b!1196616 (= e!680083 (and e!680084 mapRes!47279))))

(declare-fun condMapEmpty!47279 () Bool)

(declare-fun mapDefault!47279 () ValueCell!14438)

(assert (=> b!1196616 (= condMapEmpty!47279 (= (arr!37347 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14438)) mapDefault!47279)))))

(declare-fun b!1196617 () Bool)

(declare-fun res!795875 () Bool)

(assert (=> b!1196617 (=> (not res!795875) (not e!680087))))

(assert (=> b!1196617 (= res!795875 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37883 _keys!1208))))))

(declare-fun b!1196618 () Bool)

(assert (=> b!1196618 (= e!680087 e!680086)))

(declare-fun res!795878 () Bool)

(assert (=> b!1196618 (=> (not res!795878) (not e!680086))))

(assert (=> b!1196618 (= res!795878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543394 mask!1564))))

(assert (=> b!1196618 (= lt!543394 (array!77412 (store (arr!37346 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37883 _keys!1208)))))

(declare-fun b!1196619 () Bool)

(assert (=> b!1196619 (= e!680085 tp_is_empty!30295)))

(declare-fun b!1196620 () Bool)

(assert (=> b!1196620 (= e!680086 (not true))))

(declare-fun arrayContainsKey!0 (array!77411 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1196620 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39605 0))(
  ( (Unit!39606) )
))
(declare-fun lt!543393 () Unit!39605)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77411 (_ BitVec 64) (_ BitVec 32)) Unit!39605)

(assert (=> b!1196620 (= lt!543393 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1196621 () Bool)

(declare-fun res!795883 () Bool)

(assert (=> b!1196621 (=> (not res!795883) (not e!680087))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1196621 (= res!795883 (validMask!0 mask!1564))))

(assert (= (and start!100464 res!795876) b!1196621))

(assert (= (and b!1196621 res!795883) b!1196614))

(assert (= (and b!1196614 res!795879) b!1196612))

(assert (= (and b!1196612 res!795884) b!1196610))

(assert (= (and b!1196610 res!795881) b!1196617))

(assert (= (and b!1196617 res!795875) b!1196611))

(assert (= (and b!1196611 res!795877) b!1196615))

(assert (= (and b!1196615 res!795882) b!1196618))

(assert (= (and b!1196618 res!795878) b!1196609))

(assert (= (and b!1196609 res!795880) b!1196620))

(assert (= (and b!1196616 condMapEmpty!47279) mapIsEmpty!47279))

(assert (= (and b!1196616 (not condMapEmpty!47279)) mapNonEmpty!47279))

(get-info :version)

(assert (= (and mapNonEmpty!47279 ((_ is ValueCellFull!14438) mapValue!47279)) b!1196619))

(assert (= (and b!1196616 ((_ is ValueCellFull!14438) mapDefault!47279)) b!1196613))

(assert (= start!100464 b!1196616))

(declare-fun m!1104501 () Bool)

(assert (=> mapNonEmpty!47279 m!1104501))

(declare-fun m!1104503 () Bool)

(assert (=> b!1196621 m!1104503))

(declare-fun m!1104505 () Bool)

(assert (=> start!100464 m!1104505))

(declare-fun m!1104507 () Bool)

(assert (=> start!100464 m!1104507))

(declare-fun m!1104509 () Bool)

(assert (=> b!1196618 m!1104509))

(declare-fun m!1104511 () Bool)

(assert (=> b!1196618 m!1104511))

(declare-fun m!1104513 () Bool)

(assert (=> b!1196610 m!1104513))

(declare-fun m!1104515 () Bool)

(assert (=> b!1196620 m!1104515))

(declare-fun m!1104517 () Bool)

(assert (=> b!1196620 m!1104517))

(declare-fun m!1104519 () Bool)

(assert (=> b!1196612 m!1104519))

(declare-fun m!1104521 () Bool)

(assert (=> b!1196615 m!1104521))

(declare-fun m!1104523 () Bool)

(assert (=> b!1196611 m!1104523))

(declare-fun m!1104525 () Bool)

(assert (=> b!1196609 m!1104525))

(check-sat (not b!1196618) tp_is_empty!30295 (not mapNonEmpty!47279) (not b!1196609) (not b!1196611) (not start!100464) (not b!1196620) (not b!1196621) (not b!1196612) (not b!1196610))
(check-sat)
