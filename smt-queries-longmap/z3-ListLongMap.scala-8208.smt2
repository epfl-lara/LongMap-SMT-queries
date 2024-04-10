; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100116 () Bool)

(assert start!100116)

(declare-fun mapIsEmpty!47165 () Bool)

(declare-fun mapRes!47165 () Bool)

(assert (=> mapIsEmpty!47165 mapRes!47165))

(declare-fun b!1193871 () Bool)

(declare-fun e!678519 () Bool)

(declare-fun e!678523 () Bool)

(assert (=> b!1193871 (= e!678519 (and e!678523 mapRes!47165))))

(declare-fun condMapEmpty!47165 () Bool)

(declare-datatypes ((V!45427 0))(
  ( (V!45428 (val!15169 Int)) )
))
(declare-datatypes ((ValueCell!14403 0))(
  ( (ValueCellFull!14403 (v!17807 V!45427)) (EmptyCell!14403) )
))
(declare-datatypes ((array!77229 0))(
  ( (array!77230 (arr!37264 (Array (_ BitVec 32) ValueCell!14403)) (size!37800 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77229)

(declare-fun mapDefault!47165 () ValueCell!14403)

(assert (=> b!1193871 (= condMapEmpty!47165 (= (arr!37264 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14403)) mapDefault!47165)))))

(declare-fun b!1193872 () Bool)

(declare-fun tp_is_empty!30225 () Bool)

(assert (=> b!1193872 (= e!678523 tp_is_empty!30225)))

(declare-fun b!1193873 () Bool)

(declare-fun e!678521 () Bool)

(assert (=> b!1193873 (= e!678521 false)))

(declare-fun lt!542691 () Bool)

(declare-datatypes ((array!77231 0))(
  ( (array!77232 (arr!37265 (Array (_ BitVec 32) (_ BitVec 64))) (size!37801 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77231)

(declare-datatypes ((List!26247 0))(
  ( (Nil!26244) (Cons!26243 (h!27452 (_ BitVec 64)) (t!38918 List!26247)) )
))
(declare-fun arrayNoDuplicates!0 (array!77231 (_ BitVec 32) List!26247) Bool)

(assert (=> b!1193873 (= lt!542691 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26244))))

(declare-fun b!1193874 () Bool)

(declare-fun e!678520 () Bool)

(assert (=> b!1193874 (= e!678520 tp_is_empty!30225)))

(declare-fun res!794308 () Bool)

(assert (=> start!100116 (=> (not res!794308) (not e!678521))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100116 (= res!794308 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37801 _keys!1208))))))

(assert (=> start!100116 e!678521))

(declare-fun array_inv!28410 (array!77231) Bool)

(assert (=> start!100116 (array_inv!28410 _keys!1208)))

(assert (=> start!100116 true))

(declare-fun array_inv!28411 (array!77229) Bool)

(assert (=> start!100116 (and (array_inv!28411 _values!996) e!678519)))

(declare-fun mapNonEmpty!47165 () Bool)

(declare-fun tp!89775 () Bool)

(assert (=> mapNonEmpty!47165 (= mapRes!47165 (and tp!89775 e!678520))))

(declare-fun mapKey!47165 () (_ BitVec 32))

(declare-fun mapValue!47165 () ValueCell!14403)

(declare-fun mapRest!47165 () (Array (_ BitVec 32) ValueCell!14403))

(assert (=> mapNonEmpty!47165 (= (arr!37264 _values!996) (store mapRest!47165 mapKey!47165 mapValue!47165))))

(declare-fun b!1193875 () Bool)

(declare-fun res!794306 () Bool)

(assert (=> b!1193875 (=> (not res!794306) (not e!678521))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77231 (_ BitVec 32)) Bool)

(assert (=> b!1193875 (= res!794306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1193876 () Bool)

(declare-fun res!794305 () Bool)

(assert (=> b!1193876 (=> (not res!794305) (not e!678521))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1193876 (= res!794305 (validMask!0 mask!1564))))

(declare-fun b!1193877 () Bool)

(declare-fun res!794307 () Bool)

(assert (=> b!1193877 (=> (not res!794307) (not e!678521))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1193877 (= res!794307 (and (= (size!37800 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37801 _keys!1208) (size!37800 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!100116 res!794308) b!1193876))

(assert (= (and b!1193876 res!794305) b!1193877))

(assert (= (and b!1193877 res!794307) b!1193875))

(assert (= (and b!1193875 res!794306) b!1193873))

(assert (= (and b!1193871 condMapEmpty!47165) mapIsEmpty!47165))

(assert (= (and b!1193871 (not condMapEmpty!47165)) mapNonEmpty!47165))

(get-info :version)

(assert (= (and mapNonEmpty!47165 ((_ is ValueCellFull!14403) mapValue!47165)) b!1193874))

(assert (= (and b!1193871 ((_ is ValueCellFull!14403) mapDefault!47165)) b!1193872))

(assert (= start!100116 b!1193871))

(declare-fun m!1102011 () Bool)

(assert (=> b!1193873 m!1102011))

(declare-fun m!1102013 () Bool)

(assert (=> start!100116 m!1102013))

(declare-fun m!1102015 () Bool)

(assert (=> start!100116 m!1102015))

(declare-fun m!1102017 () Bool)

(assert (=> b!1193875 m!1102017))

(declare-fun m!1102019 () Bool)

(assert (=> b!1193876 m!1102019))

(declare-fun m!1102021 () Bool)

(assert (=> mapNonEmpty!47165 m!1102021))

(check-sat tp_is_empty!30225 (not start!100116) (not b!1193876) (not b!1193873) (not b!1193875) (not mapNonEmpty!47165))
(check-sat)
