; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77878 () Bool)

(assert start!77878)

(declare-fun b_free!16437 () Bool)

(declare-fun b_next!16437 () Bool)

(assert (=> start!77878 (= b_free!16437 (not b_next!16437))))

(declare-fun tp!57576 () Bool)

(declare-fun b_and!27005 () Bool)

(assert (=> start!77878 (= tp!57576 b_and!27005)))

(declare-fun b!909349 () Bool)

(declare-fun e!509721 () Bool)

(assert (=> b!909349 (= e!509721 false)))

(declare-datatypes ((V!30105 0))(
  ( (V!30106 (val!9478 Int)) )
))
(declare-datatypes ((ValueCell!8946 0))(
  ( (ValueCellFull!8946 (v!11985 V!30105)) (EmptyCell!8946) )
))
(declare-datatypes ((array!53736 0))(
  ( (array!53737 (arr!25826 (Array (_ BitVec 32) ValueCell!8946)) (size!26285 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53736)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30105)

(declare-datatypes ((array!53738 0))(
  ( (array!53739 (arr!25827 (Array (_ BitVec 32) (_ BitVec 64))) (size!26286 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53738)

(declare-fun lt!409982 () Bool)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30105)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-datatypes ((tuple2!12354 0))(
  ( (tuple2!12355 (_1!6188 (_ BitVec 64)) (_2!6188 V!30105)) )
))
(declare-datatypes ((List!18146 0))(
  ( (Nil!18143) (Cons!18142 (h!19288 tuple2!12354) (t!25727 List!18146)) )
))
(declare-datatypes ((ListLongMap!11051 0))(
  ( (ListLongMap!11052 (toList!5541 List!18146)) )
))
(declare-fun contains!4583 (ListLongMap!11051 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2803 (array!53738 array!53736 (_ BitVec 32) (_ BitVec 32) V!30105 V!30105 (_ BitVec 32) Int) ListLongMap!11051)

(assert (=> b!909349 (= lt!409982 (contains!4583 (getCurrentListMap!2803 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!909350 () Bool)

(declare-fun e!509717 () Bool)

(declare-fun tp_is_empty!18855 () Bool)

(assert (=> b!909350 (= e!509717 tp_is_empty!18855)))

(declare-fun mapNonEmpty!29998 () Bool)

(declare-fun mapRes!29998 () Bool)

(declare-fun tp!57575 () Bool)

(declare-fun e!509718 () Bool)

(assert (=> mapNonEmpty!29998 (= mapRes!29998 (and tp!57575 e!509718))))

(declare-fun mapValue!29998 () ValueCell!8946)

(declare-fun mapKey!29998 () (_ BitVec 32))

(declare-fun mapRest!29998 () (Array (_ BitVec 32) ValueCell!8946))

(assert (=> mapNonEmpty!29998 (= (arr!25826 _values!1152) (store mapRest!29998 mapKey!29998 mapValue!29998))))

(declare-fun b!909351 () Bool)

(declare-fun res!613761 () Bool)

(assert (=> b!909351 (=> (not res!613761) (not e!509721))))

(assert (=> b!909351 (= res!613761 (and (= (size!26285 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26286 _keys!1386) (size!26285 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!613758 () Bool)

(assert (=> start!77878 (=> (not res!613758) (not e!509721))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77878 (= res!613758 (validMask!0 mask!1756))))

(assert (=> start!77878 e!509721))

(declare-fun e!509720 () Bool)

(declare-fun array_inv!20206 (array!53736) Bool)

(assert (=> start!77878 (and (array_inv!20206 _values!1152) e!509720)))

(assert (=> start!77878 tp!57576))

(assert (=> start!77878 true))

(assert (=> start!77878 tp_is_empty!18855))

(declare-fun array_inv!20207 (array!53738) Bool)

(assert (=> start!77878 (array_inv!20207 _keys!1386)))

(declare-fun b!909352 () Bool)

(declare-fun res!613760 () Bool)

(assert (=> b!909352 (=> (not res!613760) (not e!509721))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53738 (_ BitVec 32)) Bool)

(assert (=> b!909352 (= res!613760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!29998 () Bool)

(assert (=> mapIsEmpty!29998 mapRes!29998))

(declare-fun b!909353 () Bool)

(declare-fun res!613759 () Bool)

(assert (=> b!909353 (=> (not res!613759) (not e!509721))))

(declare-datatypes ((List!18147 0))(
  ( (Nil!18144) (Cons!18143 (h!19289 (_ BitVec 64)) (t!25728 List!18147)) )
))
(declare-fun arrayNoDuplicates!0 (array!53738 (_ BitVec 32) List!18147) Bool)

(assert (=> b!909353 (= res!613759 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18144))))

(declare-fun b!909354 () Bool)

(assert (=> b!909354 (= e!509720 (and e!509717 mapRes!29998))))

(declare-fun condMapEmpty!29998 () Bool)

(declare-fun mapDefault!29998 () ValueCell!8946)

(assert (=> b!909354 (= condMapEmpty!29998 (= (arr!25826 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8946)) mapDefault!29998)))))

(declare-fun b!909355 () Bool)

(assert (=> b!909355 (= e!509718 tp_is_empty!18855)))

(assert (= (and start!77878 res!613758) b!909351))

(assert (= (and b!909351 res!613761) b!909352))

(assert (= (and b!909352 res!613760) b!909353))

(assert (= (and b!909353 res!613759) b!909349))

(assert (= (and b!909354 condMapEmpty!29998) mapIsEmpty!29998))

(assert (= (and b!909354 (not condMapEmpty!29998)) mapNonEmpty!29998))

(get-info :version)

(assert (= (and mapNonEmpty!29998 ((_ is ValueCellFull!8946) mapValue!29998)) b!909355))

(assert (= (and b!909354 ((_ is ValueCellFull!8946) mapDefault!29998)) b!909350))

(assert (= start!77878 b!909354))

(declare-fun m!844617 () Bool)

(assert (=> b!909349 m!844617))

(assert (=> b!909349 m!844617))

(declare-fun m!844619 () Bool)

(assert (=> b!909349 m!844619))

(declare-fun m!844621 () Bool)

(assert (=> b!909352 m!844621))

(declare-fun m!844623 () Bool)

(assert (=> mapNonEmpty!29998 m!844623))

(declare-fun m!844625 () Bool)

(assert (=> start!77878 m!844625))

(declare-fun m!844627 () Bool)

(assert (=> start!77878 m!844627))

(declare-fun m!844629 () Bool)

(assert (=> start!77878 m!844629))

(declare-fun m!844631 () Bool)

(assert (=> b!909353 m!844631))

(check-sat (not mapNonEmpty!29998) tp_is_empty!18855 b_and!27005 (not b!909352) (not b!909349) (not b!909353) (not b_next!16437) (not start!77878))
(check-sat b_and!27005 (not b_next!16437))
