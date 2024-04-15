; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77904 () Bool)

(assert start!77904)

(declare-fun b_free!16465 () Bool)

(declare-fun b_next!16465 () Bool)

(assert (=> start!77904 (= b_free!16465 (not b_next!16465))))

(declare-fun tp!57663 () Bool)

(declare-fun b_and!27009 () Bool)

(assert (=> start!77904 (= tp!57663 b_and!27009)))

(declare-fun b!909531 () Bool)

(declare-fun e!509851 () Bool)

(declare-fun tp_is_empty!18883 () Bool)

(assert (=> b!909531 (= e!509851 tp_is_empty!18883)))

(declare-fun b!909532 () Bool)

(declare-fun res!613879 () Bool)

(declare-fun e!509852 () Bool)

(assert (=> b!909532 (=> (not res!613879) (not e!509852))))

(declare-datatypes ((array!53773 0))(
  ( (array!53774 (arr!25844 (Array (_ BitVec 32) (_ BitVec 64))) (size!26305 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53773)

(declare-datatypes ((List!18179 0))(
  ( (Nil!18176) (Cons!18175 (h!19321 (_ BitVec 64)) (t!25753 List!18179)) )
))
(declare-fun arrayNoDuplicates!0 (array!53773 (_ BitVec 32) List!18179) Bool)

(assert (=> b!909532 (= res!613879 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18176))))

(declare-fun mapIsEmpty!30043 () Bool)

(declare-fun mapRes!30043 () Bool)

(assert (=> mapIsEmpty!30043 mapRes!30043))

(declare-fun res!613881 () Bool)

(assert (=> start!77904 (=> (not res!613881) (not e!509852))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77904 (= res!613881 (validMask!0 mask!1756))))

(assert (=> start!77904 e!509852))

(declare-datatypes ((V!30143 0))(
  ( (V!30144 (val!9492 Int)) )
))
(declare-datatypes ((ValueCell!8960 0))(
  ( (ValueCellFull!8960 (v!11999 V!30143)) (EmptyCell!8960) )
))
(declare-datatypes ((array!53775 0))(
  ( (array!53776 (arr!25845 (Array (_ BitVec 32) ValueCell!8960)) (size!26306 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53775)

(declare-fun e!509853 () Bool)

(declare-fun array_inv!20264 (array!53775) Bool)

(assert (=> start!77904 (and (array_inv!20264 _values!1152) e!509853)))

(assert (=> start!77904 tp!57663))

(assert (=> start!77904 true))

(assert (=> start!77904 tp_is_empty!18883))

(declare-fun array_inv!20265 (array!53773) Bool)

(assert (=> start!77904 (array_inv!20265 _keys!1386)))

(declare-fun b!909533 () Bool)

(declare-fun res!613882 () Bool)

(assert (=> b!909533 (=> (not res!613882) (not e!509852))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53773 (_ BitVec 32)) Bool)

(assert (=> b!909533 (= res!613882 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!909534 () Bool)

(assert (=> b!909534 (= e!509852 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30143)

(declare-fun lt!409866 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30143)

(declare-datatypes ((tuple2!12396 0))(
  ( (tuple2!12397 (_1!6209 (_ BitVec 64)) (_2!6209 V!30143)) )
))
(declare-datatypes ((List!18180 0))(
  ( (Nil!18177) (Cons!18176 (h!19322 tuple2!12396) (t!25754 List!18180)) )
))
(declare-datatypes ((ListLongMap!11083 0))(
  ( (ListLongMap!11084 (toList!5557 List!18180)) )
))
(declare-fun contains!4557 (ListLongMap!11083 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2759 (array!53773 array!53775 (_ BitVec 32) (_ BitVec 32) V!30143 V!30143 (_ BitVec 32) Int) ListLongMap!11083)

(assert (=> b!909534 (= lt!409866 (contains!4557 (getCurrentListMap!2759 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!909535 () Bool)

(declare-fun e!509855 () Bool)

(assert (=> b!909535 (= e!509853 (and e!509855 mapRes!30043))))

(declare-fun condMapEmpty!30043 () Bool)

(declare-fun mapDefault!30043 () ValueCell!8960)

(assert (=> b!909535 (= condMapEmpty!30043 (= (arr!25845 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8960)) mapDefault!30043)))))

(declare-fun mapNonEmpty!30043 () Bool)

(declare-fun tp!57664 () Bool)

(assert (=> mapNonEmpty!30043 (= mapRes!30043 (and tp!57664 e!509851))))

(declare-fun mapValue!30043 () ValueCell!8960)

(declare-fun mapKey!30043 () (_ BitVec 32))

(declare-fun mapRest!30043 () (Array (_ BitVec 32) ValueCell!8960))

(assert (=> mapNonEmpty!30043 (= (arr!25845 _values!1152) (store mapRest!30043 mapKey!30043 mapValue!30043))))

(declare-fun b!909536 () Bool)

(assert (=> b!909536 (= e!509855 tp_is_empty!18883)))

(declare-fun b!909537 () Bool)

(declare-fun res!613880 () Bool)

(assert (=> b!909537 (=> (not res!613880) (not e!509852))))

(assert (=> b!909537 (= res!613880 (and (= (size!26306 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26305 _keys!1386) (size!26306 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(assert (= (and start!77904 res!613881) b!909537))

(assert (= (and b!909537 res!613880) b!909533))

(assert (= (and b!909533 res!613882) b!909532))

(assert (= (and b!909532 res!613879) b!909534))

(assert (= (and b!909535 condMapEmpty!30043) mapIsEmpty!30043))

(assert (= (and b!909535 (not condMapEmpty!30043)) mapNonEmpty!30043))

(get-info :version)

(assert (= (and mapNonEmpty!30043 ((_ is ValueCellFull!8960) mapValue!30043)) b!909531))

(assert (= (and b!909535 ((_ is ValueCellFull!8960) mapDefault!30043)) b!909536))

(assert (= start!77904 b!909535))

(declare-fun m!844175 () Bool)

(assert (=> mapNonEmpty!30043 m!844175))

(declare-fun m!844177 () Bool)

(assert (=> start!77904 m!844177))

(declare-fun m!844179 () Bool)

(assert (=> start!77904 m!844179))

(declare-fun m!844181 () Bool)

(assert (=> start!77904 m!844181))

(declare-fun m!844183 () Bool)

(assert (=> b!909534 m!844183))

(assert (=> b!909534 m!844183))

(declare-fun m!844185 () Bool)

(assert (=> b!909534 m!844185))

(declare-fun m!844187 () Bool)

(assert (=> b!909532 m!844187))

(declare-fun m!844189 () Bool)

(assert (=> b!909533 m!844189))

(check-sat b_and!27009 (not mapNonEmpty!30043) (not b_next!16465) (not b!909534) (not b!909533) (not start!77904) (not b!909532) tp_is_empty!18883)
(check-sat b_and!27009 (not b_next!16465))
