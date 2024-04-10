; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77860 () Bool)

(assert start!77860)

(declare-fun b_free!16419 () Bool)

(declare-fun b_next!16419 () Bool)

(assert (=> start!77860 (= b_free!16419 (not b_next!16419))))

(declare-fun tp!57521 () Bool)

(declare-fun b_and!26987 () Bool)

(assert (=> start!77860 (= tp!57521 b_and!26987)))

(declare-fun b!909160 () Bool)

(declare-fun res!613651 () Bool)

(declare-fun e!509585 () Bool)

(assert (=> b!909160 (=> (not res!613651) (not e!509585))))

(declare-datatypes ((V!30081 0))(
  ( (V!30082 (val!9469 Int)) )
))
(declare-datatypes ((ValueCell!8937 0))(
  ( (ValueCellFull!8937 (v!11976 V!30081)) (EmptyCell!8937) )
))
(declare-datatypes ((array!53702 0))(
  ( (array!53703 (arr!25809 (Array (_ BitVec 32) ValueCell!8937)) (size!26268 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53702)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53704 0))(
  ( (array!53705 (arr!25810 (Array (_ BitVec 32) (_ BitVec 64))) (size!26269 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53704)

(assert (=> b!909160 (= res!613651 (and (= (size!26268 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26269 _keys!1386) (size!26268 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!909161 () Bool)

(declare-fun e!509583 () Bool)

(declare-fun tp_is_empty!18837 () Bool)

(assert (=> b!909161 (= e!509583 tp_is_empty!18837)))

(declare-fun b!909162 () Bool)

(declare-fun e!509582 () Bool)

(declare-fun e!509586 () Bool)

(declare-fun mapRes!29971 () Bool)

(assert (=> b!909162 (= e!509582 (and e!509586 mapRes!29971))))

(declare-fun condMapEmpty!29971 () Bool)

(declare-fun mapDefault!29971 () ValueCell!8937)

(assert (=> b!909162 (= condMapEmpty!29971 (= (arr!25809 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8937)) mapDefault!29971)))))

(declare-fun b!909163 () Bool)

(assert (=> b!909163 (= e!509585 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30081)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!409955 () Bool)

(declare-fun minValue!1094 () V!30081)

(declare-datatypes ((tuple2!12344 0))(
  ( (tuple2!12345 (_1!6183 (_ BitVec 64)) (_2!6183 V!30081)) )
))
(declare-datatypes ((List!18135 0))(
  ( (Nil!18132) (Cons!18131 (h!19277 tuple2!12344) (t!25716 List!18135)) )
))
(declare-datatypes ((ListLongMap!11041 0))(
  ( (ListLongMap!11042 (toList!5536 List!18135)) )
))
(declare-fun contains!4578 (ListLongMap!11041 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2798 (array!53704 array!53702 (_ BitVec 32) (_ BitVec 32) V!30081 V!30081 (_ BitVec 32) Int) ListLongMap!11041)

(assert (=> b!909163 (= lt!409955 (contains!4578 (getCurrentListMap!2798 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!909164 () Bool)

(declare-fun res!613653 () Bool)

(assert (=> b!909164 (=> (not res!613653) (not e!509585))))

(declare-datatypes ((List!18136 0))(
  ( (Nil!18133) (Cons!18132 (h!19278 (_ BitVec 64)) (t!25717 List!18136)) )
))
(declare-fun arrayNoDuplicates!0 (array!53704 (_ BitVec 32) List!18136) Bool)

(assert (=> b!909164 (= res!613653 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18133))))

(declare-fun mapNonEmpty!29971 () Bool)

(declare-fun tp!57522 () Bool)

(assert (=> mapNonEmpty!29971 (= mapRes!29971 (and tp!57522 e!509583))))

(declare-fun mapKey!29971 () (_ BitVec 32))

(declare-fun mapRest!29971 () (Array (_ BitVec 32) ValueCell!8937))

(declare-fun mapValue!29971 () ValueCell!8937)

(assert (=> mapNonEmpty!29971 (= (arr!25809 _values!1152) (store mapRest!29971 mapKey!29971 mapValue!29971))))

(declare-fun b!909165 () Bool)

(declare-fun res!613652 () Bool)

(assert (=> b!909165 (=> (not res!613652) (not e!509585))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53704 (_ BitVec 32)) Bool)

(assert (=> b!909165 (= res!613652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!29971 () Bool)

(assert (=> mapIsEmpty!29971 mapRes!29971))

(declare-fun b!909166 () Bool)

(assert (=> b!909166 (= e!509586 tp_is_empty!18837)))

(declare-fun res!613650 () Bool)

(assert (=> start!77860 (=> (not res!613650) (not e!509585))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77860 (= res!613650 (validMask!0 mask!1756))))

(assert (=> start!77860 e!509585))

(declare-fun array_inv!20198 (array!53702) Bool)

(assert (=> start!77860 (and (array_inv!20198 _values!1152) e!509582)))

(assert (=> start!77860 tp!57521))

(assert (=> start!77860 true))

(assert (=> start!77860 tp_is_empty!18837))

(declare-fun array_inv!20199 (array!53704) Bool)

(assert (=> start!77860 (array_inv!20199 _keys!1386)))

(assert (= (and start!77860 res!613650) b!909160))

(assert (= (and b!909160 res!613651) b!909165))

(assert (= (and b!909165 res!613652) b!909164))

(assert (= (and b!909164 res!613653) b!909163))

(assert (= (and b!909162 condMapEmpty!29971) mapIsEmpty!29971))

(assert (= (and b!909162 (not condMapEmpty!29971)) mapNonEmpty!29971))

(get-info :version)

(assert (= (and mapNonEmpty!29971 ((_ is ValueCellFull!8937) mapValue!29971)) b!909161))

(assert (= (and b!909162 ((_ is ValueCellFull!8937) mapDefault!29971)) b!909166))

(assert (= start!77860 b!909162))

(declare-fun m!844473 () Bool)

(assert (=> b!909164 m!844473))

(declare-fun m!844475 () Bool)

(assert (=> mapNonEmpty!29971 m!844475))

(declare-fun m!844477 () Bool)

(assert (=> start!77860 m!844477))

(declare-fun m!844479 () Bool)

(assert (=> start!77860 m!844479))

(declare-fun m!844481 () Bool)

(assert (=> start!77860 m!844481))

(declare-fun m!844483 () Bool)

(assert (=> b!909165 m!844483))

(declare-fun m!844485 () Bool)

(assert (=> b!909163 m!844485))

(assert (=> b!909163 m!844485))

(declare-fun m!844487 () Bool)

(assert (=> b!909163 m!844487))

(check-sat (not mapNonEmpty!29971) tp_is_empty!18837 (not b!909165) b_and!26987 (not b!909163) (not start!77860) (not b_next!16419) (not b!909164))
(check-sat b_and!26987 (not b_next!16419))
