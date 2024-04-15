; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78612 () Bool)

(assert start!78612)

(declare-fun b_free!16843 () Bool)

(declare-fun b_next!16843 () Bool)

(assert (=> start!78612 (= b_free!16843 (not b_next!16843))))

(declare-fun tp!58970 () Bool)

(declare-fun b_and!27439 () Bool)

(assert (=> start!78612 (= tp!58970 b_and!27439)))

(declare-fun b!916408 () Bool)

(declare-fun e!514425 () Bool)

(declare-fun tp_is_empty!19351 () Bool)

(assert (=> b!916408 (= e!514425 tp_is_empty!19351)))

(declare-fun res!617844 () Bool)

(declare-fun e!514427 () Bool)

(assert (=> start!78612 (=> (not res!617844) (not e!514427))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78612 (= res!617844 (validMask!0 mask!1881))))

(assert (=> start!78612 e!514427))

(assert (=> start!78612 true))

(declare-datatypes ((V!30767 0))(
  ( (V!30768 (val!9726 Int)) )
))
(declare-datatypes ((ValueCell!9194 0))(
  ( (ValueCellFull!9194 (v!12243 V!30767)) (EmptyCell!9194) )
))
(declare-datatypes ((array!54679 0))(
  ( (array!54680 (arr!26285 (Array (_ BitVec 32) ValueCell!9194)) (size!26746 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54679)

(declare-fun e!514428 () Bool)

(declare-fun array_inv!20588 (array!54679) Bool)

(assert (=> start!78612 (and (array_inv!20588 _values!1231) e!514428)))

(assert (=> start!78612 tp!58970))

(declare-datatypes ((array!54681 0))(
  ( (array!54682 (arr!26286 (Array (_ BitVec 32) (_ BitVec 64))) (size!26747 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54681)

(declare-fun array_inv!20589 (array!54681) Bool)

(assert (=> start!78612 (array_inv!20589 _keys!1487)))

(assert (=> start!78612 tp_is_empty!19351))

(declare-fun b!916409 () Bool)

(declare-fun e!514423 () Bool)

(declare-fun mapRes!30783 () Bool)

(assert (=> b!916409 (= e!514428 (and e!514423 mapRes!30783))))

(declare-fun condMapEmpty!30783 () Bool)

(declare-fun mapDefault!30783 () ValueCell!9194)

(assert (=> b!916409 (= condMapEmpty!30783 (= (arr!26285 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9194)) mapDefault!30783)))))

(declare-fun b!916410 () Bool)

(declare-fun e!514426 () Bool)

(assert (=> b!916410 (= e!514426 false)))

(declare-fun lt!411602 () V!30767)

(declare-datatypes ((tuple2!12666 0))(
  ( (tuple2!12667 (_1!6344 (_ BitVec 64)) (_2!6344 V!30767)) )
))
(declare-datatypes ((List!18462 0))(
  ( (Nil!18459) (Cons!18458 (h!19604 tuple2!12666) (t!26066 List!18462)) )
))
(declare-datatypes ((ListLongMap!11353 0))(
  ( (ListLongMap!11354 (toList!5692 List!18462)) )
))
(declare-fun lt!411601 () ListLongMap!11353)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!536 (ListLongMap!11353 (_ BitVec 64)) V!30767)

(assert (=> b!916410 (= lt!411602 (apply!536 lt!411601 k0!1099))))

(declare-fun mapNonEmpty!30783 () Bool)

(declare-fun tp!58971 () Bool)

(assert (=> mapNonEmpty!30783 (= mapRes!30783 (and tp!58971 e!514425))))

(declare-fun mapKey!30783 () (_ BitVec 32))

(declare-fun mapRest!30783 () (Array (_ BitVec 32) ValueCell!9194))

(declare-fun mapValue!30783 () ValueCell!9194)

(assert (=> mapNonEmpty!30783 (= (arr!26285 _values!1231) (store mapRest!30783 mapKey!30783 mapValue!30783))))

(declare-fun b!916411 () Bool)

(declare-fun res!617849 () Bool)

(assert (=> b!916411 (=> (not res!617849) (not e!514427))))

(declare-datatypes ((List!18463 0))(
  ( (Nil!18460) (Cons!18459 (h!19605 (_ BitVec 64)) (t!26067 List!18463)) )
))
(declare-fun arrayNoDuplicates!0 (array!54681 (_ BitVec 32) List!18463) Bool)

(assert (=> b!916411 (= res!617849 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18460))))

(declare-fun b!916412 () Bool)

(declare-fun res!617845 () Bool)

(assert (=> b!916412 (=> (not res!617845) (not e!514427))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!916412 (= res!617845 (and (= (size!26746 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26747 _keys!1487) (size!26746 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!916413 () Bool)

(declare-fun res!617847 () Bool)

(assert (=> b!916413 (=> (not res!617847) (not e!514427))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54681 (_ BitVec 32)) Bool)

(assert (=> b!916413 (= res!617847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!916414 () Bool)

(assert (=> b!916414 (= e!514427 e!514426)))

(declare-fun res!617846 () Bool)

(assert (=> b!916414 (=> (not res!617846) (not e!514426))))

(declare-fun contains!4702 (ListLongMap!11353 (_ BitVec 64)) Bool)

(assert (=> b!916414 (= res!617846 (contains!4702 lt!411601 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!30767)

(declare-fun minValue!1173 () V!30767)

(declare-fun getCurrentListMap!2891 (array!54681 array!54679 (_ BitVec 32) (_ BitVec 32) V!30767 V!30767 (_ BitVec 32) Int) ListLongMap!11353)

(assert (=> b!916414 (= lt!411601 (getCurrentListMap!2891 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!916415 () Bool)

(declare-fun res!617848 () Bool)

(assert (=> b!916415 (=> (not res!617848) (not e!514427))))

(assert (=> b!916415 (= res!617848 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26747 _keys!1487))))))

(declare-fun b!916416 () Bool)

(assert (=> b!916416 (= e!514423 tp_is_empty!19351)))

(declare-fun mapIsEmpty!30783 () Bool)

(assert (=> mapIsEmpty!30783 mapRes!30783))

(assert (= (and start!78612 res!617844) b!916412))

(assert (= (and b!916412 res!617845) b!916413))

(assert (= (and b!916413 res!617847) b!916411))

(assert (= (and b!916411 res!617849) b!916415))

(assert (= (and b!916415 res!617848) b!916414))

(assert (= (and b!916414 res!617846) b!916410))

(assert (= (and b!916409 condMapEmpty!30783) mapIsEmpty!30783))

(assert (= (and b!916409 (not condMapEmpty!30783)) mapNonEmpty!30783))

(get-info :version)

(assert (= (and mapNonEmpty!30783 ((_ is ValueCellFull!9194) mapValue!30783)) b!916408))

(assert (= (and b!916409 ((_ is ValueCellFull!9194) mapDefault!30783)) b!916416))

(assert (= start!78612 b!916409))

(declare-fun m!849847 () Bool)

(assert (=> mapNonEmpty!30783 m!849847))

(declare-fun m!849849 () Bool)

(assert (=> b!916414 m!849849))

(declare-fun m!849851 () Bool)

(assert (=> b!916414 m!849851))

(declare-fun m!849853 () Bool)

(assert (=> b!916413 m!849853))

(declare-fun m!849855 () Bool)

(assert (=> b!916411 m!849855))

(declare-fun m!849857 () Bool)

(assert (=> b!916410 m!849857))

(declare-fun m!849859 () Bool)

(assert (=> start!78612 m!849859))

(declare-fun m!849861 () Bool)

(assert (=> start!78612 m!849861))

(declare-fun m!849863 () Bool)

(assert (=> start!78612 m!849863))

(check-sat (not b!916410) (not start!78612) b_and!27439 (not b!916414) (not b_next!16843) (not mapNonEmpty!30783) (not b!916411) (not b!916413) tp_is_empty!19351)
(check-sat b_and!27439 (not b_next!16843))
