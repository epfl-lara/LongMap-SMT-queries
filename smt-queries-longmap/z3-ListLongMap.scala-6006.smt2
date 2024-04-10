; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77890 () Bool)

(assert start!77890)

(declare-fun b_free!16449 () Bool)

(declare-fun b_next!16449 () Bool)

(assert (=> start!77890 (= b_free!16449 (not b_next!16449))))

(declare-fun tp!57612 () Bool)

(declare-fun b_and!27017 () Bool)

(assert (=> start!77890 (= tp!57612 b_and!27017)))

(declare-fun b!909475 () Bool)

(declare-fun res!613832 () Bool)

(declare-fun e!509811 () Bool)

(assert (=> b!909475 (=> (not res!613832) (not e!509811))))

(declare-datatypes ((array!53758 0))(
  ( (array!53759 (arr!25837 (Array (_ BitVec 32) (_ BitVec 64))) (size!26296 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53758)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53758 (_ BitVec 32)) Bool)

(assert (=> b!909475 (= res!613832 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!909476 () Bool)

(declare-fun e!509808 () Bool)

(declare-fun e!509809 () Bool)

(declare-fun mapRes!30016 () Bool)

(assert (=> b!909476 (= e!509808 (and e!509809 mapRes!30016))))

(declare-fun condMapEmpty!30016 () Bool)

(declare-datatypes ((V!30121 0))(
  ( (V!30122 (val!9484 Int)) )
))
(declare-datatypes ((ValueCell!8952 0))(
  ( (ValueCellFull!8952 (v!11991 V!30121)) (EmptyCell!8952) )
))
(declare-datatypes ((array!53760 0))(
  ( (array!53761 (arr!25838 (Array (_ BitVec 32) ValueCell!8952)) (size!26297 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53760)

(declare-fun mapDefault!30016 () ValueCell!8952)

(assert (=> b!909476 (= condMapEmpty!30016 (= (arr!25838 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8952)) mapDefault!30016)))))

(declare-fun mapNonEmpty!30016 () Bool)

(declare-fun tp!57611 () Bool)

(declare-fun e!509807 () Bool)

(assert (=> mapNonEmpty!30016 (= mapRes!30016 (and tp!57611 e!509807))))

(declare-fun mapValue!30016 () ValueCell!8952)

(declare-fun mapKey!30016 () (_ BitVec 32))

(declare-fun mapRest!30016 () (Array (_ BitVec 32) ValueCell!8952))

(assert (=> mapNonEmpty!30016 (= (arr!25838 _values!1152) (store mapRest!30016 mapKey!30016 mapValue!30016))))

(declare-fun b!909477 () Bool)

(declare-fun res!613831 () Bool)

(assert (=> b!909477 (=> (not res!613831) (not e!509811))))

(declare-datatypes ((List!18153 0))(
  ( (Nil!18150) (Cons!18149 (h!19295 (_ BitVec 64)) (t!25734 List!18153)) )
))
(declare-fun arrayNoDuplicates!0 (array!53758 (_ BitVec 32) List!18153) Bool)

(assert (=> b!909477 (= res!613831 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18150))))

(declare-fun b!909478 () Bool)

(declare-fun tp_is_empty!18867 () Bool)

(assert (=> b!909478 (= e!509807 tp_is_empty!18867)))

(declare-fun mapIsEmpty!30016 () Bool)

(assert (=> mapIsEmpty!30016 mapRes!30016))

(declare-fun b!909480 () Bool)

(assert (=> b!909480 (= e!509809 tp_is_empty!18867)))

(declare-fun b!909481 () Bool)

(declare-fun res!613833 () Bool)

(assert (=> b!909481 (=> (not res!613833) (not e!509811))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!909481 (= res!613833 (and (= (size!26297 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26296 _keys!1386) (size!26297 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!613830 () Bool)

(assert (=> start!77890 (=> (not res!613830) (not e!509811))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77890 (= res!613830 (validMask!0 mask!1756))))

(assert (=> start!77890 e!509811))

(declare-fun array_inv!20212 (array!53760) Bool)

(assert (=> start!77890 (and (array_inv!20212 _values!1152) e!509808)))

(assert (=> start!77890 tp!57612))

(assert (=> start!77890 true))

(assert (=> start!77890 tp_is_empty!18867))

(declare-fun array_inv!20213 (array!53758) Bool)

(assert (=> start!77890 (array_inv!20213 _keys!1386)))

(declare-fun b!909479 () Bool)

(assert (=> b!909479 (= e!509811 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30121)

(declare-fun lt!410000 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30121)

(declare-datatypes ((tuple2!12362 0))(
  ( (tuple2!12363 (_1!6192 (_ BitVec 64)) (_2!6192 V!30121)) )
))
(declare-datatypes ((List!18154 0))(
  ( (Nil!18151) (Cons!18150 (h!19296 tuple2!12362) (t!25735 List!18154)) )
))
(declare-datatypes ((ListLongMap!11059 0))(
  ( (ListLongMap!11060 (toList!5545 List!18154)) )
))
(declare-fun contains!4587 (ListLongMap!11059 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2807 (array!53758 array!53760 (_ BitVec 32) (_ BitVec 32) V!30121 V!30121 (_ BitVec 32) Int) ListLongMap!11059)

(assert (=> b!909479 (= lt!410000 (contains!4587 (getCurrentListMap!2807 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(assert (= (and start!77890 res!613830) b!909481))

(assert (= (and b!909481 res!613833) b!909475))

(assert (= (and b!909475 res!613832) b!909477))

(assert (= (and b!909477 res!613831) b!909479))

(assert (= (and b!909476 condMapEmpty!30016) mapIsEmpty!30016))

(assert (= (and b!909476 (not condMapEmpty!30016)) mapNonEmpty!30016))

(get-info :version)

(assert (= (and mapNonEmpty!30016 ((_ is ValueCellFull!8952) mapValue!30016)) b!909478))

(assert (= (and b!909476 ((_ is ValueCellFull!8952) mapDefault!30016)) b!909480))

(assert (= start!77890 b!909476))

(declare-fun m!844713 () Bool)

(assert (=> start!77890 m!844713))

(declare-fun m!844715 () Bool)

(assert (=> start!77890 m!844715))

(declare-fun m!844717 () Bool)

(assert (=> start!77890 m!844717))

(declare-fun m!844719 () Bool)

(assert (=> b!909479 m!844719))

(assert (=> b!909479 m!844719))

(declare-fun m!844721 () Bool)

(assert (=> b!909479 m!844721))

(declare-fun m!844723 () Bool)

(assert (=> mapNonEmpty!30016 m!844723))

(declare-fun m!844725 () Bool)

(assert (=> b!909477 m!844725))

(declare-fun m!844727 () Bool)

(assert (=> b!909475 m!844727))

(check-sat (not mapNonEmpty!30016) tp_is_empty!18867 b_and!27017 (not start!77890) (not b_next!16449) (not b!909477) (not b!909479) (not b!909475))
(check-sat b_and!27017 (not b_next!16449))
