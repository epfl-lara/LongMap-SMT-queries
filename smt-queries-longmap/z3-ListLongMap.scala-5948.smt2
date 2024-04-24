; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77682 () Bool)

(assert start!77682)

(declare-fun b_free!16099 () Bool)

(declare-fun b_next!16099 () Bool)

(assert (=> start!77682 (= b_free!16099 (not b_next!16099))))

(declare-fun tp!56560 () Bool)

(declare-fun b_and!26475 () Bool)

(assert (=> start!77682 (= tp!56560 b_and!26475)))

(declare-fun b!904076 () Bool)

(declare-fun e!506575 () Bool)

(declare-fun tp_is_empty!18517 () Bool)

(assert (=> b!904076 (= e!506575 tp_is_empty!18517)))

(declare-fun b!904077 () Bool)

(declare-fun res!609735 () Bool)

(declare-fun e!506573 () Bool)

(assert (=> b!904077 (=> (not res!609735) (not e!506573))))

(declare-datatypes ((array!53129 0))(
  ( (array!53130 (arr!25519 (Array (_ BitVec 32) (_ BitVec 64))) (size!25979 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53129)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53129 (_ BitVec 32)) Bool)

(assert (=> b!904077 (= res!609735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun res!609733 () Bool)

(assert (=> start!77682 (=> (not res!609733) (not e!506573))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77682 (= res!609733 (validMask!0 mask!1756))))

(assert (=> start!77682 e!506573))

(declare-datatypes ((V!29655 0))(
  ( (V!29656 (val!9309 Int)) )
))
(declare-datatypes ((ValueCell!8777 0))(
  ( (ValueCellFull!8777 (v!11811 V!29655)) (EmptyCell!8777) )
))
(declare-datatypes ((array!53131 0))(
  ( (array!53132 (arr!25520 (Array (_ BitVec 32) ValueCell!8777)) (size!25980 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53131)

(declare-fun e!506574 () Bool)

(declare-fun array_inv!20066 (array!53131) Bool)

(assert (=> start!77682 (and (array_inv!20066 _values!1152) e!506574)))

(assert (=> start!77682 tp!56560))

(assert (=> start!77682 true))

(assert (=> start!77682 tp_is_empty!18517))

(declare-fun array_inv!20067 (array!53129) Bool)

(assert (=> start!77682 (array_inv!20067 _keys!1386)))

(declare-fun b!904078 () Bool)

(declare-fun e!506576 () Bool)

(assert (=> b!904078 (= e!506576 tp_is_empty!18517)))

(declare-fun b!904079 () Bool)

(declare-fun res!609736 () Bool)

(assert (=> b!904079 (=> (not res!609736) (not e!506573))))

(declare-datatypes ((List!17867 0))(
  ( (Nil!17864) (Cons!17863 (h!19015 (_ BitVec 64)) (t!25242 List!17867)) )
))
(declare-fun arrayNoDuplicates!0 (array!53129 (_ BitVec 32) List!17867) Bool)

(assert (=> b!904079 (= res!609736 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17864))))

(declare-fun mapNonEmpty!29488 () Bool)

(declare-fun mapRes!29488 () Bool)

(declare-fun tp!56559 () Bool)

(assert (=> mapNonEmpty!29488 (= mapRes!29488 (and tp!56559 e!506576))))

(declare-fun mapKey!29488 () (_ BitVec 32))

(declare-fun mapRest!29488 () (Array (_ BitVec 32) ValueCell!8777))

(declare-fun mapValue!29488 () ValueCell!8777)

(assert (=> mapNonEmpty!29488 (= (arr!25520 _values!1152) (store mapRest!29488 mapKey!29488 mapValue!29488))))

(declare-fun mapIsEmpty!29488 () Bool)

(assert (=> mapIsEmpty!29488 mapRes!29488))

(declare-fun b!904080 () Bool)

(assert (=> b!904080 (= e!506573 false)))

(declare-fun zeroValue!1094 () V!29655)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29655)

(declare-fun lt!408331 () Bool)

(declare-fun defaultEntry!1160 () Int)

(declare-datatypes ((tuple2!12016 0))(
  ( (tuple2!12017 (_1!6019 (_ BitVec 64)) (_2!6019 V!29655)) )
))
(declare-datatypes ((List!17868 0))(
  ( (Nil!17865) (Cons!17864 (h!19016 tuple2!12016) (t!25243 List!17868)) )
))
(declare-datatypes ((ListLongMap!10715 0))(
  ( (ListLongMap!10716 (toList!5373 List!17868)) )
))
(declare-fun contains!4431 (ListLongMap!10715 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2642 (array!53129 array!53131 (_ BitVec 32) (_ BitVec 32) V!29655 V!29655 (_ BitVec 32) Int) ListLongMap!10715)

(assert (=> b!904080 (= lt!408331 (contains!4431 (getCurrentListMap!2642 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!904081 () Bool)

(declare-fun res!609734 () Bool)

(assert (=> b!904081 (=> (not res!609734) (not e!506573))))

(assert (=> b!904081 (= res!609734 (and (= (size!25980 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25979 _keys!1386) (size!25980 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!904082 () Bool)

(assert (=> b!904082 (= e!506574 (and e!506575 mapRes!29488))))

(declare-fun condMapEmpty!29488 () Bool)

(declare-fun mapDefault!29488 () ValueCell!8777)

(assert (=> b!904082 (= condMapEmpty!29488 (= (arr!25520 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8777)) mapDefault!29488)))))

(assert (= (and start!77682 res!609733) b!904081))

(assert (= (and b!904081 res!609734) b!904077))

(assert (= (and b!904077 res!609735) b!904079))

(assert (= (and b!904079 res!609736) b!904080))

(assert (= (and b!904082 condMapEmpty!29488) mapIsEmpty!29488))

(assert (= (and b!904082 (not condMapEmpty!29488)) mapNonEmpty!29488))

(get-info :version)

(assert (= (and mapNonEmpty!29488 ((_ is ValueCellFull!8777) mapValue!29488)) b!904078))

(assert (= (and b!904082 ((_ is ValueCellFull!8777) mapDefault!29488)) b!904076))

(assert (= start!77682 b!904082))

(declare-fun m!840215 () Bool)

(assert (=> mapNonEmpty!29488 m!840215))

(declare-fun m!840217 () Bool)

(assert (=> b!904077 m!840217))

(declare-fun m!840219 () Bool)

(assert (=> start!77682 m!840219))

(declare-fun m!840221 () Bool)

(assert (=> start!77682 m!840221))

(declare-fun m!840223 () Bool)

(assert (=> start!77682 m!840223))

(declare-fun m!840225 () Bool)

(assert (=> b!904079 m!840225))

(declare-fun m!840227 () Bool)

(assert (=> b!904080 m!840227))

(assert (=> b!904080 m!840227))

(declare-fun m!840229 () Bool)

(assert (=> b!904080 m!840229))

(check-sat b_and!26475 (not b!904080) (not mapNonEmpty!29488) (not b!904079) (not b_next!16099) tp_is_empty!18517 (not start!77682) (not b!904077))
(check-sat b_and!26475 (not b_next!16099))
