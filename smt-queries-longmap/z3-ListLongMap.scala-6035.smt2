; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78112 () Bool)

(assert start!78112)

(declare-fun b_free!16623 () Bool)

(declare-fun b_next!16623 () Bool)

(assert (=> start!78112 (= b_free!16623 (not b_next!16623))))

(declare-fun tp!58142 () Bool)

(declare-fun b_and!27197 () Bool)

(assert (=> start!78112 (= tp!58142 b_and!27197)))

(declare-fun b!911683 () Bool)

(declare-fun res!615066 () Bool)

(declare-fun e!511328 () Bool)

(assert (=> b!911683 (=> (not res!615066) (not e!511328))))

(declare-datatypes ((array!54082 0))(
  ( (array!54083 (arr!25996 (Array (_ BitVec 32) (_ BitVec 64))) (size!26455 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54082)

(declare-datatypes ((List!18258 0))(
  ( (Nil!18255) (Cons!18254 (h!19400 (_ BitVec 64)) (t!25845 List!18258)) )
))
(declare-fun arrayNoDuplicates!0 (array!54082 (_ BitVec 32) List!18258) Bool)

(assert (=> b!911683 (= res!615066 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18255))))

(declare-fun b!911684 () Bool)

(declare-fun e!511329 () Bool)

(declare-fun tp_is_empty!19041 () Bool)

(assert (=> b!911684 (= e!511329 tp_is_empty!19041)))

(declare-fun b!911685 () Bool)

(declare-fun res!615064 () Bool)

(assert (=> b!911685 (=> (not res!615064) (not e!511328))))

(declare-datatypes ((V!30353 0))(
  ( (V!30354 (val!9571 Int)) )
))
(declare-datatypes ((ValueCell!9039 0))(
  ( (ValueCellFull!9039 (v!12081 V!30353)) (EmptyCell!9039) )
))
(declare-datatypes ((array!54084 0))(
  ( (array!54085 (arr!25997 (Array (_ BitVec 32) ValueCell!9039)) (size!26456 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54084)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(assert (=> b!911685 (= res!615064 (and (= (size!26456 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26455 _keys!1386) (size!26456 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30286 () Bool)

(declare-fun mapRes!30286 () Bool)

(declare-fun tp!58143 () Bool)

(assert (=> mapNonEmpty!30286 (= mapRes!30286 (and tp!58143 e!511329))))

(declare-fun mapKey!30286 () (_ BitVec 32))

(declare-fun mapRest!30286 () (Array (_ BitVec 32) ValueCell!9039))

(declare-fun mapValue!30286 () ValueCell!9039)

(assert (=> mapNonEmpty!30286 (= (arr!25997 _values!1152) (store mapRest!30286 mapKey!30286 mapValue!30286))))

(declare-fun res!615065 () Bool)

(assert (=> start!78112 (=> (not res!615065) (not e!511328))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78112 (= res!615065 (validMask!0 mask!1756))))

(assert (=> start!78112 e!511328))

(declare-fun e!511332 () Bool)

(declare-fun array_inv!20320 (array!54084) Bool)

(assert (=> start!78112 (and (array_inv!20320 _values!1152) e!511332)))

(assert (=> start!78112 tp!58142))

(assert (=> start!78112 true))

(assert (=> start!78112 tp_is_empty!19041))

(declare-fun array_inv!20321 (array!54082) Bool)

(assert (=> start!78112 (array_inv!20321 _keys!1386)))

(declare-fun b!911686 () Bool)

(assert (=> b!911686 (= e!511328 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!410495 () Bool)

(declare-fun zeroValue!1094 () V!30353)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30353)

(declare-datatypes ((tuple2!12466 0))(
  ( (tuple2!12467 (_1!6244 (_ BitVec 64)) (_2!6244 V!30353)) )
))
(declare-datatypes ((List!18259 0))(
  ( (Nil!18256) (Cons!18255 (h!19401 tuple2!12466) (t!25846 List!18259)) )
))
(declare-datatypes ((ListLongMap!11163 0))(
  ( (ListLongMap!11164 (toList!5597 List!18259)) )
))
(declare-fun contains!4642 (ListLongMap!11163 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2859 (array!54082 array!54084 (_ BitVec 32) (_ BitVec 32) V!30353 V!30353 (_ BitVec 32) Int) ListLongMap!11163)

(assert (=> b!911686 (= lt!410495 (contains!4642 (getCurrentListMap!2859 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!911687 () Bool)

(declare-fun e!511331 () Bool)

(assert (=> b!911687 (= e!511332 (and e!511331 mapRes!30286))))

(declare-fun condMapEmpty!30286 () Bool)

(declare-fun mapDefault!30286 () ValueCell!9039)

(assert (=> b!911687 (= condMapEmpty!30286 (= (arr!25997 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9039)) mapDefault!30286)))))

(declare-fun b!911688 () Bool)

(assert (=> b!911688 (= e!511331 tp_is_empty!19041)))

(declare-fun mapIsEmpty!30286 () Bool)

(assert (=> mapIsEmpty!30286 mapRes!30286))

(declare-fun b!911689 () Bool)

(declare-fun res!615063 () Bool)

(assert (=> b!911689 (=> (not res!615063) (not e!511328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54082 (_ BitVec 32)) Bool)

(assert (=> b!911689 (= res!615063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(assert (= (and start!78112 res!615065) b!911685))

(assert (= (and b!911685 res!615064) b!911689))

(assert (= (and b!911689 res!615063) b!911683))

(assert (= (and b!911683 res!615066) b!911686))

(assert (= (and b!911687 condMapEmpty!30286) mapIsEmpty!30286))

(assert (= (and b!911687 (not condMapEmpty!30286)) mapNonEmpty!30286))

(get-info :version)

(assert (= (and mapNonEmpty!30286 ((_ is ValueCellFull!9039) mapValue!30286)) b!911684))

(assert (= (and b!911687 ((_ is ValueCellFull!9039) mapDefault!30286)) b!911688))

(assert (= start!78112 b!911687))

(declare-fun m!846375 () Bool)

(assert (=> start!78112 m!846375))

(declare-fun m!846377 () Bool)

(assert (=> start!78112 m!846377))

(declare-fun m!846379 () Bool)

(assert (=> start!78112 m!846379))

(declare-fun m!846381 () Bool)

(assert (=> b!911686 m!846381))

(assert (=> b!911686 m!846381))

(declare-fun m!846383 () Bool)

(assert (=> b!911686 m!846383))

(declare-fun m!846385 () Bool)

(assert (=> b!911683 m!846385))

(declare-fun m!846387 () Bool)

(assert (=> mapNonEmpty!30286 m!846387))

(declare-fun m!846389 () Bool)

(assert (=> b!911689 m!846389))

(check-sat (not b_next!16623) tp_is_empty!19041 (not b!911689) (not b!911686) (not start!78112) (not mapNonEmpty!30286) (not b!911683) b_and!27197)
(check-sat b_and!27197 (not b_next!16623))
