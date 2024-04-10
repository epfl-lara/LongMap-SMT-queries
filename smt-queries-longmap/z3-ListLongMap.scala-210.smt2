; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3944 () Bool)

(assert start!3944)

(declare-fun b_free!849 () Bool)

(declare-fun b_next!849 () Bool)

(assert (=> start!3944 (= b_free!849 (not b_next!849))))

(declare-fun tp!3967 () Bool)

(declare-fun b_and!1659 () Bool)

(assert (=> start!3944 (= tp!3967 b_and!1659)))

(declare-fun b!28116 () Bool)

(declare-fun res!16714 () Bool)

(declare-fun e!18215 () Bool)

(assert (=> b!28116 (=> (not res!16714) (not e!18215))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28116 (= res!16714 (validKeyInArray!0 k0!1304))))

(declare-fun b!28117 () Bool)

(declare-fun res!16715 () Bool)

(assert (=> b!28117 (=> (not res!16715) (not e!18215))))

(declare-datatypes ((array!1647 0))(
  ( (array!1648 (arr!777 (Array (_ BitVec 32) (_ BitVec 64))) (size!878 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1647)

(declare-fun arrayContainsKey!0 (array!1647 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28117 (= res!16715 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28118 () Bool)

(declare-fun res!16718 () Bool)

(assert (=> b!28118 (=> (not res!16718) (not e!18215))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1647 (_ BitVec 32)) Bool)

(assert (=> b!28118 (= res!16718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!28119 () Bool)

(declare-fun res!16719 () Bool)

(assert (=> b!28119 (=> (not res!16719) (not e!18215))))

(declare-datatypes ((List!649 0))(
  ( (Nil!646) (Cons!645 (h!1212 (_ BitVec 64)) (t!3342 List!649)) )
))
(declare-fun arrayNoDuplicates!0 (array!1647 (_ BitVec 32) List!649) Bool)

(assert (=> b!28119 (= res!16719 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!646))))

(declare-fun b!28121 () Bool)

(declare-fun e!18218 () Bool)

(declare-fun tp_is_empty!1203 () Bool)

(assert (=> b!28121 (= e!18218 tp_is_empty!1203)))

(declare-fun mapNonEmpty!1333 () Bool)

(declare-fun mapRes!1333 () Bool)

(declare-fun tp!3966 () Bool)

(declare-fun e!18216 () Bool)

(assert (=> mapNonEmpty!1333 (= mapRes!1333 (and tp!3966 e!18216))))

(declare-datatypes ((V!1429 0))(
  ( (V!1430 (val!628 Int)) )
))
(declare-datatypes ((ValueCell!402 0))(
  ( (ValueCellFull!402 (v!1717 V!1429)) (EmptyCell!402) )
))
(declare-datatypes ((array!1649 0))(
  ( (array!1650 (arr!778 (Array (_ BitVec 32) ValueCell!402)) (size!879 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1649)

(declare-fun mapKey!1333 () (_ BitVec 32))

(declare-fun mapRest!1333 () (Array (_ BitVec 32) ValueCell!402))

(declare-fun mapValue!1333 () ValueCell!402)

(assert (=> mapNonEmpty!1333 (= (arr!778 _values!1501) (store mapRest!1333 mapKey!1333 mapValue!1333))))

(declare-fun b!28122 () Bool)

(declare-fun res!16717 () Bool)

(assert (=> b!28122 (=> (not res!16717) (not e!18215))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!28122 (= res!16717 (and (= (size!879 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!878 _keys!1833) (size!879 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!28123 () Bool)

(declare-fun e!18214 () Bool)

(assert (=> b!28123 (= e!18214 (and e!18218 mapRes!1333))))

(declare-fun condMapEmpty!1333 () Bool)

(declare-fun mapDefault!1333 () ValueCell!402)

(assert (=> b!28123 (= condMapEmpty!1333 (= (arr!778 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!402)) mapDefault!1333)))))

(declare-fun mapIsEmpty!1333 () Bool)

(assert (=> mapIsEmpty!1333 mapRes!1333))

(declare-fun b!28124 () Bool)

(assert (=> b!28124 (= e!18216 tp_is_empty!1203)))

(declare-fun b!28125 () Bool)

(assert (=> b!28125 (= e!18215 false)))

(declare-fun lt!10748 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1647 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28125 (= lt!10748 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28120 () Bool)

(declare-fun res!16716 () Bool)

(assert (=> b!28120 (=> (not res!16716) (not e!18215))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1429)

(declare-fun minValue!1443 () V!1429)

(declare-datatypes ((tuple2!1048 0))(
  ( (tuple2!1049 (_1!535 (_ BitVec 64)) (_2!535 V!1429)) )
))
(declare-datatypes ((List!650 0))(
  ( (Nil!647) (Cons!646 (h!1213 tuple2!1048) (t!3343 List!650)) )
))
(declare-datatypes ((ListLongMap!625 0))(
  ( (ListLongMap!626 (toList!328 List!650)) )
))
(declare-fun contains!268 (ListLongMap!625 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!158 (array!1647 array!1649 (_ BitVec 32) (_ BitVec 32) V!1429 V!1429 (_ BitVec 32) Int) ListLongMap!625)

(assert (=> b!28120 (= res!16716 (not (contains!268 (getCurrentListMap!158 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun res!16713 () Bool)

(assert (=> start!3944 (=> (not res!16713) (not e!18215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3944 (= res!16713 (validMask!0 mask!2294))))

(assert (=> start!3944 e!18215))

(assert (=> start!3944 true))

(assert (=> start!3944 tp!3967))

(declare-fun array_inv!533 (array!1649) Bool)

(assert (=> start!3944 (and (array_inv!533 _values!1501) e!18214)))

(declare-fun array_inv!534 (array!1647) Bool)

(assert (=> start!3944 (array_inv!534 _keys!1833)))

(assert (=> start!3944 tp_is_empty!1203))

(assert (= (and start!3944 res!16713) b!28122))

(assert (= (and b!28122 res!16717) b!28118))

(assert (= (and b!28118 res!16718) b!28119))

(assert (= (and b!28119 res!16719) b!28116))

(assert (= (and b!28116 res!16714) b!28120))

(assert (= (and b!28120 res!16716) b!28117))

(assert (= (and b!28117 res!16715) b!28125))

(assert (= (and b!28123 condMapEmpty!1333) mapIsEmpty!1333))

(assert (= (and b!28123 (not condMapEmpty!1333)) mapNonEmpty!1333))

(get-info :version)

(assert (= (and mapNonEmpty!1333 ((_ is ValueCellFull!402) mapValue!1333)) b!28124))

(assert (= (and b!28123 ((_ is ValueCellFull!402) mapDefault!1333)) b!28121))

(assert (= start!3944 b!28123))

(declare-fun m!22391 () Bool)

(assert (=> b!28118 m!22391))

(declare-fun m!22393 () Bool)

(assert (=> b!28120 m!22393))

(assert (=> b!28120 m!22393))

(declare-fun m!22395 () Bool)

(assert (=> b!28120 m!22395))

(declare-fun m!22397 () Bool)

(assert (=> b!28125 m!22397))

(declare-fun m!22399 () Bool)

(assert (=> mapNonEmpty!1333 m!22399))

(declare-fun m!22401 () Bool)

(assert (=> b!28117 m!22401))

(declare-fun m!22403 () Bool)

(assert (=> b!28119 m!22403))

(declare-fun m!22405 () Bool)

(assert (=> start!3944 m!22405))

(declare-fun m!22407 () Bool)

(assert (=> start!3944 m!22407))

(declare-fun m!22409 () Bool)

(assert (=> start!3944 m!22409))

(declare-fun m!22411 () Bool)

(assert (=> b!28116 m!22411))

(check-sat (not b_next!849) (not mapNonEmpty!1333) (not b!28120) (not b!28117) b_and!1659 (not b!28125) tp_is_empty!1203 (not start!3944) (not b!28116) (not b!28119) (not b!28118))
(check-sat b_and!1659 (not b_next!849))
