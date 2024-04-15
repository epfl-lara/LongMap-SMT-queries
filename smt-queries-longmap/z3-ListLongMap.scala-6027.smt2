; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78028 () Bool)

(assert start!78028)

(declare-fun b_free!16573 () Bool)

(declare-fun b_next!16573 () Bool)

(assert (=> start!78028 (= b_free!16573 (not b_next!16573))))

(declare-fun tp!57990 () Bool)

(declare-fun b_and!27119 () Bool)

(assert (=> start!78028 (= tp!57990 b_and!27119)))

(declare-fun b!910792 () Bool)

(declare-fun e!510737 () Bool)

(declare-fun tp_is_empty!18991 () Bool)

(assert (=> b!910792 (= e!510737 tp_is_empty!18991)))

(declare-fun mapNonEmpty!30208 () Bool)

(declare-fun mapRes!30208 () Bool)

(declare-fun tp!57991 () Bool)

(assert (=> mapNonEmpty!30208 (= mapRes!30208 (and tp!57991 e!510737))))

(declare-datatypes ((V!30287 0))(
  ( (V!30288 (val!9546 Int)) )
))
(declare-datatypes ((ValueCell!9014 0))(
  ( (ValueCellFull!9014 (v!12054 V!30287)) (EmptyCell!9014) )
))
(declare-datatypes ((array!53987 0))(
  ( (array!53988 (arr!25950 (Array (_ BitVec 32) ValueCell!9014)) (size!26411 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53987)

(declare-fun mapKey!30208 () (_ BitVec 32))

(declare-fun mapValue!30208 () ValueCell!9014)

(declare-fun mapRest!30208 () (Array (_ BitVec 32) ValueCell!9014))

(assert (=> mapNonEmpty!30208 (= (arr!25950 _values!1152) (store mapRest!30208 mapKey!30208 mapValue!30208))))

(declare-fun b!910793 () Bool)

(declare-fun e!510736 () Bool)

(assert (=> b!910793 (= e!510736 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30287)

(declare-datatypes ((array!53989 0))(
  ( (array!53990 (arr!25951 (Array (_ BitVec 32) (_ BitVec 64))) (size!26412 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53989)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30287)

(declare-fun lt!410106 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-datatypes ((tuple2!12474 0))(
  ( (tuple2!12475 (_1!6248 (_ BitVec 64)) (_2!6248 V!30287)) )
))
(declare-datatypes ((List!18260 0))(
  ( (Nil!18257) (Cons!18256 (h!19402 tuple2!12474) (t!25836 List!18260)) )
))
(declare-datatypes ((ListLongMap!11161 0))(
  ( (ListLongMap!11162 (toList!5596 List!18260)) )
))
(declare-fun contains!4597 (ListLongMap!11161 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2798 (array!53989 array!53987 (_ BitVec 32) (_ BitVec 32) V!30287 V!30287 (_ BitVec 32) Int) ListLongMap!11161)

(assert (=> b!910793 (= lt!410106 (contains!4597 (getCurrentListMap!2798 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!910794 () Bool)

(declare-fun res!614591 () Bool)

(assert (=> b!910794 (=> (not res!614591) (not e!510736))))

(declare-datatypes ((List!18261 0))(
  ( (Nil!18258) (Cons!18257 (h!19403 (_ BitVec 64)) (t!25837 List!18261)) )
))
(declare-fun arrayNoDuplicates!0 (array!53989 (_ BitVec 32) List!18261) Bool)

(assert (=> b!910794 (= res!614591 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18258))))

(declare-fun b!910795 () Bool)

(declare-fun e!510733 () Bool)

(assert (=> b!910795 (= e!510733 tp_is_empty!18991)))

(declare-fun b!910796 () Bool)

(declare-fun res!614592 () Bool)

(assert (=> b!910796 (=> (not res!614592) (not e!510736))))

(assert (=> b!910796 (= res!614592 (and (= (size!26411 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26412 _keys!1386) (size!26411 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910797 () Bool)

(declare-fun res!614590 () Bool)

(assert (=> b!910797 (=> (not res!614590) (not e!510736))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53989 (_ BitVec 32)) Bool)

(assert (=> b!910797 (= res!614590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!30208 () Bool)

(assert (=> mapIsEmpty!30208 mapRes!30208))

(declare-fun b!910798 () Bool)

(declare-fun e!510735 () Bool)

(assert (=> b!910798 (= e!510735 (and e!510733 mapRes!30208))))

(declare-fun condMapEmpty!30208 () Bool)

(declare-fun mapDefault!30208 () ValueCell!9014)

(assert (=> b!910798 (= condMapEmpty!30208 (= (arr!25950 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9014)) mapDefault!30208)))))

(declare-fun res!614593 () Bool)

(assert (=> start!78028 (=> (not res!614593) (not e!510736))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78028 (= res!614593 (validMask!0 mask!1756))))

(assert (=> start!78028 e!510736))

(declare-fun array_inv!20346 (array!53987) Bool)

(assert (=> start!78028 (and (array_inv!20346 _values!1152) e!510735)))

(assert (=> start!78028 tp!57990))

(assert (=> start!78028 true))

(assert (=> start!78028 tp_is_empty!18991))

(declare-fun array_inv!20347 (array!53989) Bool)

(assert (=> start!78028 (array_inv!20347 _keys!1386)))

(assert (= (and start!78028 res!614593) b!910796))

(assert (= (and b!910796 res!614592) b!910797))

(assert (= (and b!910797 res!614590) b!910794))

(assert (= (and b!910794 res!614591) b!910793))

(assert (= (and b!910798 condMapEmpty!30208) mapIsEmpty!30208))

(assert (= (and b!910798 (not condMapEmpty!30208)) mapNonEmpty!30208))

(get-info :version)

(assert (= (and mapNonEmpty!30208 ((_ is ValueCellFull!9014) mapValue!30208)) b!910792))

(assert (= (and b!910798 ((_ is ValueCellFull!9014) mapDefault!30208)) b!910795))

(assert (= start!78028 b!910798))

(declare-fun m!845131 () Bool)

(assert (=> start!78028 m!845131))

(declare-fun m!845133 () Bool)

(assert (=> start!78028 m!845133))

(declare-fun m!845135 () Bool)

(assert (=> start!78028 m!845135))

(declare-fun m!845137 () Bool)

(assert (=> b!910797 m!845137))

(declare-fun m!845139 () Bool)

(assert (=> b!910794 m!845139))

(declare-fun m!845141 () Bool)

(assert (=> b!910793 m!845141))

(assert (=> b!910793 m!845141))

(declare-fun m!845143 () Bool)

(assert (=> b!910793 m!845143))

(declare-fun m!845145 () Bool)

(assert (=> mapNonEmpty!30208 m!845145))

(check-sat b_and!27119 (not b!910794) (not b!910793) (not mapNonEmpty!30208) (not b!910797) (not b_next!16573) (not start!78028) tp_is_empty!18991)
(check-sat b_and!27119 (not b_next!16573))
