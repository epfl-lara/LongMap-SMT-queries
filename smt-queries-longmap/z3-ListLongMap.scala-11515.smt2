; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134476 () Bool)

(assert start!134476)

(declare-fun b_free!32191 () Bool)

(declare-fun b_next!32191 () Bool)

(assert (=> start!134476 (= b_free!32191 (not b_next!32191))))

(declare-fun tp!113892 () Bool)

(declare-fun b_and!51837 () Bool)

(assert (=> start!134476 (= tp!113892 b_and!51837)))

(declare-fun b!1569259 () Bool)

(declare-fun e!874878 () Bool)

(declare-fun tp_is_empty!38971 () Bool)

(assert (=> b!1569259 (= e!874878 tp_is_empty!38971)))

(declare-fun b!1569260 () Bool)

(declare-fun e!874882 () Bool)

(assert (=> b!1569260 (= e!874882 tp_is_empty!38971)))

(declare-fun b!1569261 () Bool)

(declare-fun e!874879 () Bool)

(assert (=> b!1569261 (= e!874879 false)))

(declare-fun lt!673716 () Bool)

(declare-datatypes ((V!60169 0))(
  ( (V!60170 (val!19569 Int)) )
))
(declare-datatypes ((tuple2!25306 0))(
  ( (tuple2!25307 (_1!12664 (_ BitVec 64)) (_2!12664 V!60169)) )
))
(declare-datatypes ((List!36669 0))(
  ( (Nil!36666) (Cons!36665 (h!38130 tuple2!25306) (t!51565 List!36669)) )
))
(declare-datatypes ((ListLongMap!22749 0))(
  ( (ListLongMap!22750 (toList!11390 List!36669)) )
))
(declare-fun lt!673717 () ListLongMap!22749)

(declare-fun contains!10395 (ListLongMap!22749 (_ BitVec 64)) Bool)

(assert (=> b!1569261 (= lt!673716 (contains!10395 lt!673717 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1569262 () Bool)

(declare-fun res!1071712 () Bool)

(declare-fun e!874881 () Bool)

(assert (=> b!1569262 (=> (not res!1071712) (not e!874881))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104754 0))(
  ( (array!104755 (arr!50555 (Array (_ BitVec 32) (_ BitVec 64))) (size!51106 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104754)

(declare-datatypes ((ValueCell!18455 0))(
  ( (ValueCellFull!18455 (v!22320 V!60169)) (EmptyCell!18455) )
))
(declare-datatypes ((array!104756 0))(
  ( (array!104757 (arr!50556 (Array (_ BitVec 32) ValueCell!18455)) (size!51107 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104756)

(assert (=> b!1569262 (= res!1071712 (and (= (size!51107 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51106 _keys!637) (size!51107 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun res!1071711 () Bool)

(assert (=> start!134476 (=> (not res!1071711) (not e!874881))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134476 (= res!1071711 (validMask!0 mask!947))))

(assert (=> start!134476 e!874881))

(assert (=> start!134476 tp!113892))

(assert (=> start!134476 tp_is_empty!38971))

(assert (=> start!134476 true))

(declare-fun array_inv!39519 (array!104754) Bool)

(assert (=> start!134476 (array_inv!39519 _keys!637)))

(declare-fun e!874880 () Bool)

(declare-fun array_inv!39520 (array!104756) Bool)

(assert (=> start!134476 (and (array_inv!39520 _values!487) e!874880)))

(declare-fun b!1569263 () Bool)

(declare-fun res!1071717 () Bool)

(assert (=> b!1569263 (=> (not res!1071717) (not e!874881))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104754 (_ BitVec 32)) Bool)

(assert (=> b!1569263 (= res!1071717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1569264 () Bool)

(declare-fun res!1071715 () Bool)

(assert (=> b!1569264 (=> (not res!1071715) (not e!874881))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1569264 (= res!1071715 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51106 _keys!637)) (bvslt from!782 (size!51106 _keys!637))))))

(declare-fun mapIsEmpty!59856 () Bool)

(declare-fun mapRes!59856 () Bool)

(assert (=> mapIsEmpty!59856 mapRes!59856))

(declare-fun b!1569265 () Bool)

(declare-fun res!1071714 () Bool)

(assert (=> b!1569265 (=> (not res!1071714) (not e!874881))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1569265 (= res!1071714 (not (validKeyInArray!0 (select (arr!50555 _keys!637) from!782))))))

(declare-fun mapNonEmpty!59856 () Bool)

(declare-fun tp!113891 () Bool)

(assert (=> mapNonEmpty!59856 (= mapRes!59856 (and tp!113891 e!874878))))

(declare-fun mapValue!59856 () ValueCell!18455)

(declare-fun mapKey!59856 () (_ BitVec 32))

(declare-fun mapRest!59856 () (Array (_ BitVec 32) ValueCell!18455))

(assert (=> mapNonEmpty!59856 (= (arr!50556 _values!487) (store mapRest!59856 mapKey!59856 mapValue!59856))))

(declare-fun b!1569266 () Bool)

(assert (=> b!1569266 (= e!874881 e!874879)))

(declare-fun res!1071716 () Bool)

(assert (=> b!1569266 (=> (not res!1071716) (not e!874879))))

(assert (=> b!1569266 (= res!1071716 (not (contains!10395 lt!673717 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!60169)

(declare-fun minValue!453 () V!60169)

(declare-fun getCurrentListMapNoExtraKeys!6770 (array!104754 array!104756 (_ BitVec 32) (_ BitVec 32) V!60169 V!60169 (_ BitVec 32) Int) ListLongMap!22749)

(assert (=> b!1569266 (= lt!673717 (getCurrentListMapNoExtraKeys!6770 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1569267 () Bool)

(declare-fun res!1071713 () Bool)

(assert (=> b!1569267 (=> (not res!1071713) (not e!874881))))

(declare-datatypes ((List!36670 0))(
  ( (Nil!36667) (Cons!36666 (h!38131 (_ BitVec 64)) (t!51566 List!36670)) )
))
(declare-fun arrayNoDuplicates!0 (array!104754 (_ BitVec 32) List!36670) Bool)

(assert (=> b!1569267 (= res!1071713 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36667))))

(declare-fun b!1569268 () Bool)

(assert (=> b!1569268 (= e!874880 (and e!874882 mapRes!59856))))

(declare-fun condMapEmpty!59856 () Bool)

(declare-fun mapDefault!59856 () ValueCell!18455)

(assert (=> b!1569268 (= condMapEmpty!59856 (= (arr!50556 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18455)) mapDefault!59856)))))

(assert (= (and start!134476 res!1071711) b!1569262))

(assert (= (and b!1569262 res!1071712) b!1569263))

(assert (= (and b!1569263 res!1071717) b!1569267))

(assert (= (and b!1569267 res!1071713) b!1569264))

(assert (= (and b!1569264 res!1071715) b!1569265))

(assert (= (and b!1569265 res!1071714) b!1569266))

(assert (= (and b!1569266 res!1071716) b!1569261))

(assert (= (and b!1569268 condMapEmpty!59856) mapIsEmpty!59856))

(assert (= (and b!1569268 (not condMapEmpty!59856)) mapNonEmpty!59856))

(get-info :version)

(assert (= (and mapNonEmpty!59856 ((_ is ValueCellFull!18455) mapValue!59856)) b!1569259))

(assert (= (and b!1569268 ((_ is ValueCellFull!18455) mapDefault!59856)) b!1569260))

(assert (= start!134476 b!1569268))

(declare-fun m!1444105 () Bool)

(assert (=> mapNonEmpty!59856 m!1444105))

(declare-fun m!1444107 () Bool)

(assert (=> b!1569261 m!1444107))

(declare-fun m!1444109 () Bool)

(assert (=> b!1569265 m!1444109))

(assert (=> b!1569265 m!1444109))

(declare-fun m!1444111 () Bool)

(assert (=> b!1569265 m!1444111))

(declare-fun m!1444113 () Bool)

(assert (=> b!1569266 m!1444113))

(declare-fun m!1444115 () Bool)

(assert (=> b!1569266 m!1444115))

(declare-fun m!1444117 () Bool)

(assert (=> start!134476 m!1444117))

(declare-fun m!1444119 () Bool)

(assert (=> start!134476 m!1444119))

(declare-fun m!1444121 () Bool)

(assert (=> start!134476 m!1444121))

(declare-fun m!1444123 () Bool)

(assert (=> b!1569263 m!1444123))

(declare-fun m!1444125 () Bool)

(assert (=> b!1569267 m!1444125))

(check-sat (not mapNonEmpty!59856) (not b!1569265) tp_is_empty!38971 (not start!134476) (not b!1569263) b_and!51837 (not b_next!32191) (not b!1569261) (not b!1569267) (not b!1569266))
(check-sat b_and!51837 (not b_next!32191))
