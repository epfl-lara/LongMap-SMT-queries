; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97558 () Bool)

(assert start!97558)

(declare-fun mapNonEmpty!43501 () Bool)

(declare-fun mapRes!43501 () Bool)

(declare-fun tp!82745 () Bool)

(declare-fun e!635022 () Bool)

(assert (=> mapNonEmpty!43501 (= mapRes!43501 (and tp!82745 e!635022))))

(declare-datatypes ((V!42179 0))(
  ( (V!42180 (val!13951 Int)) )
))
(declare-datatypes ((ValueCell!13185 0))(
  ( (ValueCellFull!13185 (v!16584 V!42179)) (EmptyCell!13185) )
))
(declare-fun mapRest!43501 () (Array (_ BitVec 32) ValueCell!13185))

(declare-fun mapValue!43501 () ValueCell!13185)

(declare-datatypes ((array!72485 0))(
  ( (array!72486 (arr!34895 (Array (_ BitVec 32) ValueCell!13185)) (size!35431 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72485)

(declare-fun mapKey!43501 () (_ BitVec 32))

(assert (=> mapNonEmpty!43501 (= (arr!34895 _values!996) (store mapRest!43501 mapKey!43501 mapValue!43501))))

(declare-fun mapIsEmpty!43501 () Bool)

(assert (=> mapIsEmpty!43501 mapRes!43501))

(declare-fun b!1114119 () Bool)

(declare-fun e!635021 () Bool)

(assert (=> b!1114119 (= e!635021 (not true))))

(declare-datatypes ((array!72487 0))(
  ( (array!72488 (arr!34896 (Array (_ BitVec 32) (_ BitVec 64))) (size!35432 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72487)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72487 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1114119 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36568 0))(
  ( (Unit!36569) )
))
(declare-fun lt!496777 () Unit!36568)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72487 (_ BitVec 64) (_ BitVec 32)) Unit!36568)

(assert (=> b!1114119 (= lt!496777 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!743659 () Bool)

(declare-fun e!635020 () Bool)

(assert (=> start!97558 (=> (not res!743659) (not e!635020))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97558 (= res!743659 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35432 _keys!1208))))))

(assert (=> start!97558 e!635020))

(declare-fun array_inv!26824 (array!72487) Bool)

(assert (=> start!97558 (array_inv!26824 _keys!1208)))

(assert (=> start!97558 true))

(declare-fun e!635025 () Bool)

(declare-fun array_inv!26825 (array!72485) Bool)

(assert (=> start!97558 (and (array_inv!26825 _values!996) e!635025)))

(declare-fun b!1114120 () Bool)

(declare-fun res!743654 () Bool)

(assert (=> b!1114120 (=> (not res!743654) (not e!635020))))

(assert (=> b!1114120 (= res!743654 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35432 _keys!1208))))))

(declare-fun b!1114121 () Bool)

(declare-fun e!635023 () Bool)

(declare-fun tp_is_empty!27789 () Bool)

(assert (=> b!1114121 (= e!635023 tp_is_empty!27789)))

(declare-fun b!1114122 () Bool)

(assert (=> b!1114122 (= e!635022 tp_is_empty!27789)))

(declare-fun b!1114123 () Bool)

(assert (=> b!1114123 (= e!635020 e!635021)))

(declare-fun res!743660 () Bool)

(assert (=> b!1114123 (=> (not res!743660) (not e!635021))))

(declare-fun lt!496778 () array!72487)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72487 (_ BitVec 32)) Bool)

(assert (=> b!1114123 (= res!743660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496778 mask!1564))))

(assert (=> b!1114123 (= lt!496778 (array!72488 (store (arr!34896 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35432 _keys!1208)))))

(declare-fun b!1114124 () Bool)

(declare-fun res!743661 () Bool)

(assert (=> b!1114124 (=> (not res!743661) (not e!635020))))

(assert (=> b!1114124 (= res!743661 (= (select (arr!34896 _keys!1208) i!673) k0!934))))

(declare-fun b!1114125 () Bool)

(declare-fun res!743658 () Bool)

(assert (=> b!1114125 (=> (not res!743658) (not e!635020))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1114125 (= res!743658 (validKeyInArray!0 k0!934))))

(declare-fun b!1114126 () Bool)

(declare-fun res!743656 () Bool)

(assert (=> b!1114126 (=> (not res!743656) (not e!635020))))

(assert (=> b!1114126 (= res!743656 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1114127 () Bool)

(declare-fun res!743657 () Bool)

(assert (=> b!1114127 (=> (not res!743657) (not e!635020))))

(declare-datatypes ((List!24323 0))(
  ( (Nil!24320) (Cons!24319 (h!25528 (_ BitVec 64)) (t!34804 List!24323)) )
))
(declare-fun arrayNoDuplicates!0 (array!72487 (_ BitVec 32) List!24323) Bool)

(assert (=> b!1114127 (= res!743657 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24320))))

(declare-fun b!1114128 () Bool)

(declare-fun res!743653 () Bool)

(assert (=> b!1114128 (=> (not res!743653) (not e!635020))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1114128 (= res!743653 (validMask!0 mask!1564))))

(declare-fun b!1114129 () Bool)

(assert (=> b!1114129 (= e!635025 (and e!635023 mapRes!43501))))

(declare-fun condMapEmpty!43501 () Bool)

(declare-fun mapDefault!43501 () ValueCell!13185)

(assert (=> b!1114129 (= condMapEmpty!43501 (= (arr!34895 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13185)) mapDefault!43501)))))

(declare-fun b!1114130 () Bool)

(declare-fun res!743662 () Bool)

(assert (=> b!1114130 (=> (not res!743662) (not e!635021))))

(assert (=> b!1114130 (= res!743662 (arrayNoDuplicates!0 lt!496778 #b00000000000000000000000000000000 Nil!24320))))

(declare-fun b!1114131 () Bool)

(declare-fun res!743655 () Bool)

(assert (=> b!1114131 (=> (not res!743655) (not e!635020))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1114131 (= res!743655 (and (= (size!35431 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35432 _keys!1208) (size!35431 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!97558 res!743659) b!1114128))

(assert (= (and b!1114128 res!743653) b!1114131))

(assert (= (and b!1114131 res!743655) b!1114126))

(assert (= (and b!1114126 res!743656) b!1114127))

(assert (= (and b!1114127 res!743657) b!1114120))

(assert (= (and b!1114120 res!743654) b!1114125))

(assert (= (and b!1114125 res!743658) b!1114124))

(assert (= (and b!1114124 res!743661) b!1114123))

(assert (= (and b!1114123 res!743660) b!1114130))

(assert (= (and b!1114130 res!743662) b!1114119))

(assert (= (and b!1114129 condMapEmpty!43501) mapIsEmpty!43501))

(assert (= (and b!1114129 (not condMapEmpty!43501)) mapNonEmpty!43501))

(get-info :version)

(assert (= (and mapNonEmpty!43501 ((_ is ValueCellFull!13185) mapValue!43501)) b!1114122))

(assert (= (and b!1114129 ((_ is ValueCellFull!13185) mapDefault!43501)) b!1114121))

(assert (= start!97558 b!1114129))

(declare-fun m!1031101 () Bool)

(assert (=> b!1114126 m!1031101))

(declare-fun m!1031103 () Bool)

(assert (=> b!1114124 m!1031103))

(declare-fun m!1031105 () Bool)

(assert (=> b!1114128 m!1031105))

(declare-fun m!1031107 () Bool)

(assert (=> b!1114127 m!1031107))

(declare-fun m!1031109 () Bool)

(assert (=> mapNonEmpty!43501 m!1031109))

(declare-fun m!1031111 () Bool)

(assert (=> b!1114125 m!1031111))

(declare-fun m!1031113 () Bool)

(assert (=> b!1114123 m!1031113))

(declare-fun m!1031115 () Bool)

(assert (=> b!1114123 m!1031115))

(declare-fun m!1031117 () Bool)

(assert (=> b!1114119 m!1031117))

(declare-fun m!1031119 () Bool)

(assert (=> b!1114119 m!1031119))

(declare-fun m!1031121 () Bool)

(assert (=> start!97558 m!1031121))

(declare-fun m!1031123 () Bool)

(assert (=> start!97558 m!1031123))

(declare-fun m!1031125 () Bool)

(assert (=> b!1114130 m!1031125))

(check-sat (not mapNonEmpty!43501) (not b!1114127) (not b!1114126) (not b!1114128) (not b!1114119) (not start!97558) (not b!1114123) (not b!1114125) (not b!1114130) tp_is_empty!27789)
(check-sat)
