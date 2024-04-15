; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41838 () Bool)

(assert start!41838)

(declare-fun b_free!11455 () Bool)

(declare-fun b_next!11455 () Bool)

(assert (=> start!41838 (= b_free!11455 (not b_next!11455))))

(declare-fun tp!40374 () Bool)

(declare-fun b_and!19809 () Bool)

(assert (=> start!41838 (= tp!40374 b_and!19809)))

(declare-fun b!467053 () Bool)

(declare-fun e!273180 () Bool)

(assert (=> b!467053 (= e!273180 (not true))))

(declare-datatypes ((V!18283 0))(
  ( (V!18284 (val!6486 Int)) )
))
(declare-datatypes ((tuple2!8554 0))(
  ( (tuple2!8555 (_1!4288 (_ BitVec 64)) (_2!4288 V!18283)) )
))
(declare-datatypes ((List!8634 0))(
  ( (Nil!8631) (Cons!8630 (h!9486 tuple2!8554) (t!14579 List!8634)) )
))
(declare-datatypes ((ListLongMap!7457 0))(
  ( (ListLongMap!7458 (toList!3744 List!8634)) )
))
(declare-fun lt!211065 () ListLongMap!7457)

(declare-fun lt!211067 () ListLongMap!7457)

(assert (=> b!467053 (= lt!211065 lt!211067)))

(declare-fun zeroValue!794 () V!18283)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueBefore!38 () V!18283)

(declare-datatypes ((Unit!13592 0))(
  ( (Unit!13593) )
))
(declare-fun lt!211066 () Unit!13592)

(declare-datatypes ((array!29539 0))(
  ( (array!29540 (arr!14197 (Array (_ BitVec 32) (_ BitVec 64))) (size!14550 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29539)

(declare-datatypes ((ValueCell!6098 0))(
  ( (ValueCellFull!6098 (v!8769 V!18283)) (EmptyCell!6098) )
))
(declare-datatypes ((array!29541 0))(
  ( (array!29542 (arr!14198 (Array (_ BitVec 32) ValueCell!6098)) (size!14551 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29541)

(declare-fun minValueAfter!38 () V!18283)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!85 (array!29539 array!29541 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18283 V!18283 V!18283 V!18283 (_ BitVec 32) Int) Unit!13592)

(assert (=> b!467053 (= lt!211066 (lemmaNoChangeToArrayThenSameMapNoExtras!85 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1928 (array!29539 array!29541 (_ BitVec 32) (_ BitVec 32) V!18283 V!18283 (_ BitVec 32) Int) ListLongMap!7457)

(assert (=> b!467053 (= lt!211067 (getCurrentListMapNoExtraKeys!1928 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467053 (= lt!211065 (getCurrentListMapNoExtraKeys!1928 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467054 () Bool)

(declare-fun e!273178 () Bool)

(declare-fun e!273179 () Bool)

(declare-fun mapRes!21013 () Bool)

(assert (=> b!467054 (= e!273178 (and e!273179 mapRes!21013))))

(declare-fun condMapEmpty!21013 () Bool)

(declare-fun mapDefault!21013 () ValueCell!6098)

(assert (=> b!467054 (= condMapEmpty!21013 (= (arr!14198 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6098)) mapDefault!21013)))))

(declare-fun mapIsEmpty!21013 () Bool)

(assert (=> mapIsEmpty!21013 mapRes!21013))

(declare-fun res!279182 () Bool)

(assert (=> start!41838 (=> (not res!279182) (not e!273180))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41838 (= res!279182 (validMask!0 mask!1365))))

(assert (=> start!41838 e!273180))

(declare-fun tp_is_empty!12883 () Bool)

(assert (=> start!41838 tp_is_empty!12883))

(assert (=> start!41838 tp!40374))

(assert (=> start!41838 true))

(declare-fun array_inv!10332 (array!29539) Bool)

(assert (=> start!41838 (array_inv!10332 _keys!1025)))

(declare-fun array_inv!10333 (array!29541) Bool)

(assert (=> start!41838 (and (array_inv!10333 _values!833) e!273178)))

(declare-fun b!467055 () Bool)

(declare-fun e!273176 () Bool)

(assert (=> b!467055 (= e!273176 tp_is_empty!12883)))

(declare-fun b!467056 () Bool)

(assert (=> b!467056 (= e!273179 tp_is_empty!12883)))

(declare-fun b!467057 () Bool)

(declare-fun res!279181 () Bool)

(assert (=> b!467057 (=> (not res!279181) (not e!273180))))

(assert (=> b!467057 (= res!279181 (and (= (size!14551 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14550 _keys!1025) (size!14551 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!467058 () Bool)

(declare-fun res!279183 () Bool)

(assert (=> b!467058 (=> (not res!279183) (not e!273180))))

(declare-datatypes ((List!8635 0))(
  ( (Nil!8632) (Cons!8631 (h!9487 (_ BitVec 64)) (t!14580 List!8635)) )
))
(declare-fun arrayNoDuplicates!0 (array!29539 (_ BitVec 32) List!8635) Bool)

(assert (=> b!467058 (= res!279183 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8632))))

(declare-fun b!467059 () Bool)

(declare-fun res!279180 () Bool)

(assert (=> b!467059 (=> (not res!279180) (not e!273180))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29539 (_ BitVec 32)) Bool)

(assert (=> b!467059 (= res!279180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!21013 () Bool)

(declare-fun tp!40375 () Bool)

(assert (=> mapNonEmpty!21013 (= mapRes!21013 (and tp!40375 e!273176))))

(declare-fun mapValue!21013 () ValueCell!6098)

(declare-fun mapRest!21013 () (Array (_ BitVec 32) ValueCell!6098))

(declare-fun mapKey!21013 () (_ BitVec 32))

(assert (=> mapNonEmpty!21013 (= (arr!14198 _values!833) (store mapRest!21013 mapKey!21013 mapValue!21013))))

(assert (= (and start!41838 res!279182) b!467057))

(assert (= (and b!467057 res!279181) b!467059))

(assert (= (and b!467059 res!279180) b!467058))

(assert (= (and b!467058 res!279183) b!467053))

(assert (= (and b!467054 condMapEmpty!21013) mapIsEmpty!21013))

(assert (= (and b!467054 (not condMapEmpty!21013)) mapNonEmpty!21013))

(get-info :version)

(assert (= (and mapNonEmpty!21013 ((_ is ValueCellFull!6098) mapValue!21013)) b!467055))

(assert (= (and b!467054 ((_ is ValueCellFull!6098) mapDefault!21013)) b!467056))

(assert (= start!41838 b!467054))

(declare-fun m!448759 () Bool)

(assert (=> mapNonEmpty!21013 m!448759))

(declare-fun m!448761 () Bool)

(assert (=> b!467058 m!448761))

(declare-fun m!448763 () Bool)

(assert (=> b!467059 m!448763))

(declare-fun m!448765 () Bool)

(assert (=> b!467053 m!448765))

(declare-fun m!448767 () Bool)

(assert (=> b!467053 m!448767))

(declare-fun m!448769 () Bool)

(assert (=> b!467053 m!448769))

(declare-fun m!448771 () Bool)

(assert (=> start!41838 m!448771))

(declare-fun m!448773 () Bool)

(assert (=> start!41838 m!448773))

(declare-fun m!448775 () Bool)

(assert (=> start!41838 m!448775))

(check-sat (not b_next!11455) tp_is_empty!12883 (not mapNonEmpty!21013) (not start!41838) (not b!467058) (not b!467059) b_and!19809 (not b!467053))
(check-sat b_and!19809 (not b_next!11455))
