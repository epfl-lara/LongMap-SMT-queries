; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78126 () Bool)

(assert start!78126)

(declare-fun b_free!16501 () Bool)

(declare-fun b_next!16501 () Bool)

(assert (=> start!78126 (= b_free!16501 (not b_next!16501))))

(declare-fun tp!57772 () Bool)

(declare-fun b_and!27081 () Bool)

(assert (=> start!78126 (= tp!57772 b_and!27081)))

(declare-fun b!911051 () Bool)

(declare-fun e!510853 () Bool)

(declare-fun tp_is_empty!18919 () Bool)

(assert (=> b!911051 (= e!510853 tp_is_empty!18919)))

(declare-fun b!911052 () Bool)

(declare-fun res!614549 () Bool)

(declare-fun e!510851 () Bool)

(assert (=> b!911052 (=> (not res!614549) (not e!510851))))

(declare-datatypes ((V!30191 0))(
  ( (V!30192 (val!9510 Int)) )
))
(declare-datatypes ((ValueCell!8978 0))(
  ( (ValueCellFull!8978 (v!12015 V!30191)) (EmptyCell!8978) )
))
(declare-datatypes ((array!53907 0))(
  ( (array!53908 (arr!25906 (Array (_ BitVec 32) ValueCell!8978)) (size!26366 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53907)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53909 0))(
  ( (array!53910 (arr!25907 (Array (_ BitVec 32) (_ BitVec 64))) (size!26367 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53909)

(assert (=> b!911052 (= res!614549 (and (= (size!26366 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26367 _keys!1386) (size!26366 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!911053 () Bool)

(declare-fun res!614550 () Bool)

(assert (=> b!911053 (=> (not res!614550) (not e!510851))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53909 (_ BitVec 32)) Bool)

(assert (=> b!911053 (= res!614550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!30097 () Bool)

(declare-fun mapRes!30097 () Bool)

(declare-fun tp!57771 () Bool)

(assert (=> mapNonEmpty!30097 (= mapRes!30097 (and tp!57771 e!510853))))

(declare-fun mapRest!30097 () (Array (_ BitVec 32) ValueCell!8978))

(declare-fun mapValue!30097 () ValueCell!8978)

(declare-fun mapKey!30097 () (_ BitVec 32))

(assert (=> mapNonEmpty!30097 (= (arr!25906 _values!1152) (store mapRest!30097 mapKey!30097 mapValue!30097))))

(declare-fun res!614552 () Bool)

(assert (=> start!78126 (=> (not res!614552) (not e!510851))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78126 (= res!614552 (validMask!0 mask!1756))))

(assert (=> start!78126 e!510851))

(declare-fun e!510854 () Bool)

(declare-fun array_inv!20328 (array!53907) Bool)

(assert (=> start!78126 (and (array_inv!20328 _values!1152) e!510854)))

(assert (=> start!78126 tp!57772))

(assert (=> start!78126 true))

(assert (=> start!78126 tp_is_empty!18919))

(declare-fun array_inv!20329 (array!53909) Bool)

(assert (=> start!78126 (array_inv!20329 _keys!1386)))

(declare-fun b!911054 () Bool)

(declare-fun e!510855 () Bool)

(assert (=> b!911054 (= e!510855 tp_is_empty!18919)))

(declare-fun mapIsEmpty!30097 () Bool)

(assert (=> mapIsEmpty!30097 mapRes!30097))

(declare-fun b!911055 () Bool)

(assert (=> b!911055 (= e!510854 (and e!510855 mapRes!30097))))

(declare-fun condMapEmpty!30097 () Bool)

(declare-fun mapDefault!30097 () ValueCell!8978)

(assert (=> b!911055 (= condMapEmpty!30097 (= (arr!25906 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8978)) mapDefault!30097)))))

(declare-fun b!911056 () Bool)

(assert (=> b!911056 (= e!510851 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30191)

(declare-fun lt!410517 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30191)

(declare-datatypes ((tuple2!12350 0))(
  ( (tuple2!12351 (_1!6186 (_ BitVec 64)) (_2!6186 V!30191)) )
))
(declare-datatypes ((List!18169 0))(
  ( (Nil!18166) (Cons!18165 (h!19317 tuple2!12350) (t!25744 List!18169)) )
))
(declare-datatypes ((ListLongMap!11049 0))(
  ( (ListLongMap!11050 (toList!5540 List!18169)) )
))
(declare-fun contains!4592 (ListLongMap!11049 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2801 (array!53909 array!53907 (_ BitVec 32) (_ BitVec 32) V!30191 V!30191 (_ BitVec 32) Int) ListLongMap!11049)

(assert (=> b!911056 (= lt!410517 (contains!4592 (getCurrentListMap!2801 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!911057 () Bool)

(declare-fun res!614551 () Bool)

(assert (=> b!911057 (=> (not res!614551) (not e!510851))))

(declare-datatypes ((List!18170 0))(
  ( (Nil!18167) (Cons!18166 (h!19318 (_ BitVec 64)) (t!25745 List!18170)) )
))
(declare-fun arrayNoDuplicates!0 (array!53909 (_ BitVec 32) List!18170) Bool)

(assert (=> b!911057 (= res!614551 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18167))))

(assert (= (and start!78126 res!614552) b!911052))

(assert (= (and b!911052 res!614549) b!911053))

(assert (= (and b!911053 res!614550) b!911057))

(assert (= (and b!911057 res!614551) b!911056))

(assert (= (and b!911055 condMapEmpty!30097) mapIsEmpty!30097))

(assert (= (and b!911055 (not condMapEmpty!30097)) mapNonEmpty!30097))

(get-info :version)

(assert (= (and mapNonEmpty!30097 ((_ is ValueCellFull!8978) mapValue!30097)) b!911051))

(assert (= (and b!911055 ((_ is ValueCellFull!8978) mapDefault!30097)) b!911054))

(assert (= start!78126 b!911055))

(declare-fun m!846515 () Bool)

(assert (=> mapNonEmpty!30097 m!846515))

(declare-fun m!846517 () Bool)

(assert (=> b!911057 m!846517))

(declare-fun m!846519 () Bool)

(assert (=> b!911056 m!846519))

(assert (=> b!911056 m!846519))

(declare-fun m!846521 () Bool)

(assert (=> b!911056 m!846521))

(declare-fun m!846523 () Bool)

(assert (=> b!911053 m!846523))

(declare-fun m!846525 () Bool)

(assert (=> start!78126 m!846525))

(declare-fun m!846527 () Bool)

(assert (=> start!78126 m!846527))

(declare-fun m!846529 () Bool)

(assert (=> start!78126 m!846529))

(check-sat (not b!911056) (not b!911053) (not b!911057) b_and!27081 (not mapNonEmpty!30097) tp_is_empty!18919 (not start!78126) (not b_next!16501))
(check-sat b_and!27081 (not b_next!16501))
