; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78030 () Bool)

(assert start!78030)

(declare-fun b_free!16557 () Bool)

(declare-fun b_next!16557 () Bool)

(assert (=> start!78030 (= b_free!16557 (not b_next!16557))))

(declare-fun tp!57941 () Bool)

(declare-fun b_and!27129 () Bool)

(assert (=> start!78030 (= tp!57941 b_and!27129)))

(declare-fun b!910863 () Bool)

(declare-fun e!510761 () Bool)

(declare-fun tp_is_empty!18975 () Bool)

(assert (=> b!910863 (= e!510761 tp_is_empty!18975)))

(declare-fun b!910864 () Bool)

(declare-fun res!614606 () Bool)

(declare-fun e!510762 () Bool)

(assert (=> b!910864 (=> (not res!614606) (not e!510762))))

(declare-datatypes ((array!53960 0))(
  ( (array!53961 (arr!25936 (Array (_ BitVec 32) (_ BitVec 64))) (size!26395 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53960)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53960 (_ BitVec 32)) Bool)

(assert (=> b!910864 (= res!614606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!910865 () Bool)

(assert (=> b!910865 (= e!510762 false)))

(declare-datatypes ((V!30265 0))(
  ( (V!30266 (val!9538 Int)) )
))
(declare-datatypes ((ValueCell!9006 0))(
  ( (ValueCellFull!9006 (v!12047 V!30265)) (EmptyCell!9006) )
))
(declare-datatypes ((array!53962 0))(
  ( (array!53963 (arr!25937 (Array (_ BitVec 32) ValueCell!9006)) (size!26396 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53962)

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30265)

(declare-fun lt!410318 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30265)

(declare-datatypes ((tuple2!12428 0))(
  ( (tuple2!12429 (_1!6225 (_ BitVec 64)) (_2!6225 V!30265)) )
))
(declare-datatypes ((List!18219 0))(
  ( (Nil!18216) (Cons!18215 (h!19361 tuple2!12428) (t!25804 List!18219)) )
))
(declare-datatypes ((ListLongMap!11125 0))(
  ( (ListLongMap!11126 (toList!5578 List!18219)) )
))
(declare-fun contains!4622 (ListLongMap!11125 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2840 (array!53960 array!53962 (_ BitVec 32) (_ BitVec 32) V!30265 V!30265 (_ BitVec 32) Int) ListLongMap!11125)

(assert (=> b!910865 (= lt!410318 (contains!4622 (getCurrentListMap!2840 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapIsEmpty!30184 () Bool)

(declare-fun mapRes!30184 () Bool)

(assert (=> mapIsEmpty!30184 mapRes!30184))

(declare-fun b!910866 () Bool)

(declare-fun res!614605 () Bool)

(assert (=> b!910866 (=> (not res!614605) (not e!510762))))

(declare-datatypes ((List!18220 0))(
  ( (Nil!18217) (Cons!18216 (h!19362 (_ BitVec 64)) (t!25805 List!18220)) )
))
(declare-fun arrayNoDuplicates!0 (array!53960 (_ BitVec 32) List!18220) Bool)

(assert (=> b!910866 (= res!614605 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18217))))

(declare-fun res!614604 () Bool)

(assert (=> start!78030 (=> (not res!614604) (not e!510762))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78030 (= res!614604 (validMask!0 mask!1756))))

(assert (=> start!78030 e!510762))

(declare-fun e!510765 () Bool)

(declare-fun array_inv!20276 (array!53962) Bool)

(assert (=> start!78030 (and (array_inv!20276 _values!1152) e!510765)))

(assert (=> start!78030 tp!57941))

(assert (=> start!78030 true))

(assert (=> start!78030 tp_is_empty!18975))

(declare-fun array_inv!20277 (array!53960) Bool)

(assert (=> start!78030 (array_inv!20277 _keys!1386)))

(declare-fun b!910867 () Bool)

(assert (=> b!910867 (= e!510765 (and e!510761 mapRes!30184))))

(declare-fun condMapEmpty!30184 () Bool)

(declare-fun mapDefault!30184 () ValueCell!9006)

(assert (=> b!910867 (= condMapEmpty!30184 (= (arr!25937 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9006)) mapDefault!30184)))))

(declare-fun b!910868 () Bool)

(declare-fun e!510764 () Bool)

(assert (=> b!910868 (= e!510764 tp_is_empty!18975)))

(declare-fun b!910869 () Bool)

(declare-fun res!614607 () Bool)

(assert (=> b!910869 (=> (not res!614607) (not e!510762))))

(assert (=> b!910869 (= res!614607 (and (= (size!26396 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26395 _keys!1386) (size!26396 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30184 () Bool)

(declare-fun tp!57942 () Bool)

(assert (=> mapNonEmpty!30184 (= mapRes!30184 (and tp!57942 e!510764))))

(declare-fun mapRest!30184 () (Array (_ BitVec 32) ValueCell!9006))

(declare-fun mapValue!30184 () ValueCell!9006)

(declare-fun mapKey!30184 () (_ BitVec 32))

(assert (=> mapNonEmpty!30184 (= (arr!25937 _values!1152) (store mapRest!30184 mapKey!30184 mapValue!30184))))

(assert (= (and start!78030 res!614604) b!910869))

(assert (= (and b!910869 res!614607) b!910864))

(assert (= (and b!910864 res!614606) b!910866))

(assert (= (and b!910866 res!614605) b!910865))

(assert (= (and b!910867 condMapEmpty!30184) mapIsEmpty!30184))

(assert (= (and b!910867 (not condMapEmpty!30184)) mapNonEmpty!30184))

(get-info :version)

(assert (= (and mapNonEmpty!30184 ((_ is ValueCellFull!9006) mapValue!30184)) b!910868))

(assert (= (and b!910867 ((_ is ValueCellFull!9006) mapDefault!30184)) b!910863))

(assert (= start!78030 b!910867))

(declare-fun m!845761 () Bool)

(assert (=> b!910866 m!845761))

(declare-fun m!845763 () Bool)

(assert (=> mapNonEmpty!30184 m!845763))

(declare-fun m!845765 () Bool)

(assert (=> b!910865 m!845765))

(assert (=> b!910865 m!845765))

(declare-fun m!845767 () Bool)

(assert (=> b!910865 m!845767))

(declare-fun m!845769 () Bool)

(assert (=> start!78030 m!845769))

(declare-fun m!845771 () Bool)

(assert (=> start!78030 m!845771))

(declare-fun m!845773 () Bool)

(assert (=> start!78030 m!845773))

(declare-fun m!845775 () Bool)

(assert (=> b!910864 m!845775))

(check-sat (not b!910864) (not b_next!16557) tp_is_empty!18975 (not start!78030) (not b!910865) (not mapNonEmpty!30184) (not b!910866) b_and!27129)
(check-sat b_and!27129 (not b_next!16557))
