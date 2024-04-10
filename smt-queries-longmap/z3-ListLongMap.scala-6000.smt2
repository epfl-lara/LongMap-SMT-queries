; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77854 () Bool)

(assert start!77854)

(declare-fun b_free!16413 () Bool)

(declare-fun b_next!16413 () Bool)

(assert (=> start!77854 (= b_free!16413 (not b_next!16413))))

(declare-fun tp!57504 () Bool)

(declare-fun b_and!26981 () Bool)

(assert (=> start!77854 (= tp!57504 b_and!26981)))

(declare-fun b!909097 () Bool)

(declare-fun res!613615 () Bool)

(declare-fun e!509537 () Bool)

(assert (=> b!909097 (=> (not res!613615) (not e!509537))))

(declare-datatypes ((array!53690 0))(
  ( (array!53691 (arr!25803 (Array (_ BitVec 32) (_ BitVec 64))) (size!26262 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53690)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53690 (_ BitVec 32)) Bool)

(assert (=> b!909097 (= res!613615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!909098 () Bool)

(declare-fun res!613616 () Bool)

(assert (=> b!909098 (=> (not res!613616) (not e!509537))))

(declare-datatypes ((List!18130 0))(
  ( (Nil!18127) (Cons!18126 (h!19272 (_ BitVec 64)) (t!25711 List!18130)) )
))
(declare-fun arrayNoDuplicates!0 (array!53690 (_ BitVec 32) List!18130) Bool)

(assert (=> b!909098 (= res!613616 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18127))))

(declare-fun b!909099 () Bool)

(declare-fun e!509540 () Bool)

(declare-fun tp_is_empty!18831 () Bool)

(assert (=> b!909099 (= e!509540 tp_is_empty!18831)))

(declare-fun b!909100 () Bool)

(declare-fun res!613617 () Bool)

(assert (=> b!909100 (=> (not res!613617) (not e!509537))))

(declare-datatypes ((V!30073 0))(
  ( (V!30074 (val!9466 Int)) )
))
(declare-datatypes ((ValueCell!8934 0))(
  ( (ValueCellFull!8934 (v!11973 V!30073)) (EmptyCell!8934) )
))
(declare-datatypes ((array!53692 0))(
  ( (array!53693 (arr!25804 (Array (_ BitVec 32) ValueCell!8934)) (size!26263 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53692)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!909100 (= res!613617 (and (= (size!26263 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26262 _keys!1386) (size!26263 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!909101 () Bool)

(declare-fun e!509538 () Bool)

(declare-fun e!509541 () Bool)

(declare-fun mapRes!29962 () Bool)

(assert (=> b!909101 (= e!509538 (and e!509541 mapRes!29962))))

(declare-fun condMapEmpty!29962 () Bool)

(declare-fun mapDefault!29962 () ValueCell!8934)

(assert (=> b!909101 (= condMapEmpty!29962 (= (arr!25804 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8934)) mapDefault!29962)))))

(declare-fun mapIsEmpty!29962 () Bool)

(assert (=> mapIsEmpty!29962 mapRes!29962))

(declare-fun b!909103 () Bool)

(assert (=> b!909103 (= e!509541 tp_is_empty!18831)))

(declare-fun mapNonEmpty!29962 () Bool)

(declare-fun tp!57503 () Bool)

(assert (=> mapNonEmpty!29962 (= mapRes!29962 (and tp!57503 e!509540))))

(declare-fun mapValue!29962 () ValueCell!8934)

(declare-fun mapKey!29962 () (_ BitVec 32))

(declare-fun mapRest!29962 () (Array (_ BitVec 32) ValueCell!8934))

(assert (=> mapNonEmpty!29962 (= (arr!25804 _values!1152) (store mapRest!29962 mapKey!29962 mapValue!29962))))

(declare-fun res!613614 () Bool)

(assert (=> start!77854 (=> (not res!613614) (not e!509537))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77854 (= res!613614 (validMask!0 mask!1756))))

(assert (=> start!77854 e!509537))

(declare-fun array_inv!20194 (array!53692) Bool)

(assert (=> start!77854 (and (array_inv!20194 _values!1152) e!509538)))

(assert (=> start!77854 tp!57504))

(assert (=> start!77854 true))

(assert (=> start!77854 tp_is_empty!18831))

(declare-fun array_inv!20195 (array!53690) Bool)

(assert (=> start!77854 (array_inv!20195 _keys!1386)))

(declare-fun b!909102 () Bool)

(assert (=> b!909102 (= e!509537 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30073)

(declare-fun lt!409946 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30073)

(declare-datatypes ((tuple2!12338 0))(
  ( (tuple2!12339 (_1!6180 (_ BitVec 64)) (_2!6180 V!30073)) )
))
(declare-datatypes ((List!18131 0))(
  ( (Nil!18128) (Cons!18127 (h!19273 tuple2!12338) (t!25712 List!18131)) )
))
(declare-datatypes ((ListLongMap!11035 0))(
  ( (ListLongMap!11036 (toList!5533 List!18131)) )
))
(declare-fun contains!4575 (ListLongMap!11035 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2795 (array!53690 array!53692 (_ BitVec 32) (_ BitVec 32) V!30073 V!30073 (_ BitVec 32) Int) ListLongMap!11035)

(assert (=> b!909102 (= lt!409946 (contains!4575 (getCurrentListMap!2795 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(assert (= (and start!77854 res!613614) b!909100))

(assert (= (and b!909100 res!613617) b!909097))

(assert (= (and b!909097 res!613615) b!909098))

(assert (= (and b!909098 res!613616) b!909102))

(assert (= (and b!909101 condMapEmpty!29962) mapIsEmpty!29962))

(assert (= (and b!909101 (not condMapEmpty!29962)) mapNonEmpty!29962))

(get-info :version)

(assert (= (and mapNonEmpty!29962 ((_ is ValueCellFull!8934) mapValue!29962)) b!909099))

(assert (= (and b!909101 ((_ is ValueCellFull!8934) mapDefault!29962)) b!909103))

(assert (= start!77854 b!909101))

(declare-fun m!844425 () Bool)

(assert (=> start!77854 m!844425))

(declare-fun m!844427 () Bool)

(assert (=> start!77854 m!844427))

(declare-fun m!844429 () Bool)

(assert (=> start!77854 m!844429))

(declare-fun m!844431 () Bool)

(assert (=> b!909097 m!844431))

(declare-fun m!844433 () Bool)

(assert (=> b!909098 m!844433))

(declare-fun m!844435 () Bool)

(assert (=> b!909102 m!844435))

(assert (=> b!909102 m!844435))

(declare-fun m!844437 () Bool)

(assert (=> b!909102 m!844437))

(declare-fun m!844439 () Bool)

(assert (=> mapNonEmpty!29962 m!844439))

(check-sat tp_is_empty!18831 (not b!909098) (not b!909097) b_and!26981 (not b_next!16413) (not mapNonEmpty!29962) (not b!909102) (not start!77854))
(check-sat b_and!26981 (not b_next!16413))
