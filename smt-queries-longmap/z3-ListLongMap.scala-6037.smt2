; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78124 () Bool)

(assert start!78124)

(declare-fun b_free!16635 () Bool)

(declare-fun b_next!16635 () Bool)

(assert (=> start!78124 (= b_free!16635 (not b_next!16635))))

(declare-fun tp!58179 () Bool)

(declare-fun b_and!27209 () Bool)

(assert (=> start!78124 (= tp!58179 b_and!27209)))

(declare-fun b!911809 () Bool)

(declare-fun res!615137 () Bool)

(declare-fun e!511420 () Bool)

(assert (=> b!911809 (=> (not res!615137) (not e!511420))))

(declare-datatypes ((array!54106 0))(
  ( (array!54107 (arr!26008 (Array (_ BitVec 32) (_ BitVec 64))) (size!26467 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54106)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54106 (_ BitVec 32)) Bool)

(assert (=> b!911809 (= res!615137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!911810 () Bool)

(declare-fun e!511418 () Bool)

(declare-fun tp_is_empty!19053 () Bool)

(assert (=> b!911810 (= e!511418 tp_is_empty!19053)))

(declare-fun b!911811 () Bool)

(assert (=> b!911811 (= e!511420 false)))

(declare-datatypes ((V!30369 0))(
  ( (V!30370 (val!9577 Int)) )
))
(declare-datatypes ((ValueCell!9045 0))(
  ( (ValueCellFull!9045 (v!12087 V!30369)) (EmptyCell!9045) )
))
(declare-datatypes ((array!54108 0))(
  ( (array!54109 (arr!26009 (Array (_ BitVec 32) ValueCell!9045)) (size!26468 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54108)

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30369)

(declare-fun lt!410513 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30369)

(declare-datatypes ((tuple2!12474 0))(
  ( (tuple2!12475 (_1!6248 (_ BitVec 64)) (_2!6248 V!30369)) )
))
(declare-datatypes ((List!18267 0))(
  ( (Nil!18264) (Cons!18263 (h!19409 tuple2!12474) (t!25854 List!18267)) )
))
(declare-datatypes ((ListLongMap!11171 0))(
  ( (ListLongMap!11172 (toList!5601 List!18267)) )
))
(declare-fun contains!4646 (ListLongMap!11171 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2863 (array!54106 array!54108 (_ BitVec 32) (_ BitVec 32) V!30369 V!30369 (_ BitVec 32) Int) ListLongMap!11171)

(assert (=> b!911811 (= lt!410513 (contains!4646 (getCurrentListMap!2863 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!911812 () Bool)

(declare-fun res!615136 () Bool)

(assert (=> b!911812 (=> (not res!615136) (not e!511420))))

(declare-datatypes ((List!18268 0))(
  ( (Nil!18265) (Cons!18264 (h!19410 (_ BitVec 64)) (t!25855 List!18268)) )
))
(declare-fun arrayNoDuplicates!0 (array!54106 (_ BitVec 32) List!18268) Bool)

(assert (=> b!911812 (= res!615136 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18265))))

(declare-fun b!911813 () Bool)

(declare-fun e!511422 () Bool)

(declare-fun mapRes!30304 () Bool)

(assert (=> b!911813 (= e!511422 (and e!511418 mapRes!30304))))

(declare-fun condMapEmpty!30304 () Bool)

(declare-fun mapDefault!30304 () ValueCell!9045)

(assert (=> b!911813 (= condMapEmpty!30304 (= (arr!26009 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9045)) mapDefault!30304)))))

(declare-fun mapNonEmpty!30304 () Bool)

(declare-fun tp!58178 () Bool)

(declare-fun e!511421 () Bool)

(assert (=> mapNonEmpty!30304 (= mapRes!30304 (and tp!58178 e!511421))))

(declare-fun mapRest!30304 () (Array (_ BitVec 32) ValueCell!9045))

(declare-fun mapValue!30304 () ValueCell!9045)

(declare-fun mapKey!30304 () (_ BitVec 32))

(assert (=> mapNonEmpty!30304 (= (arr!26009 _values!1152) (store mapRest!30304 mapKey!30304 mapValue!30304))))

(declare-fun res!615135 () Bool)

(assert (=> start!78124 (=> (not res!615135) (not e!511420))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78124 (= res!615135 (validMask!0 mask!1756))))

(assert (=> start!78124 e!511420))

(declare-fun array_inv!20328 (array!54108) Bool)

(assert (=> start!78124 (and (array_inv!20328 _values!1152) e!511422)))

(assert (=> start!78124 tp!58179))

(assert (=> start!78124 true))

(assert (=> start!78124 tp_is_empty!19053))

(declare-fun array_inv!20329 (array!54106) Bool)

(assert (=> start!78124 (array_inv!20329 _keys!1386)))

(declare-fun mapIsEmpty!30304 () Bool)

(assert (=> mapIsEmpty!30304 mapRes!30304))

(declare-fun b!911814 () Bool)

(assert (=> b!911814 (= e!511421 tp_is_empty!19053)))

(declare-fun b!911815 () Bool)

(declare-fun res!615138 () Bool)

(assert (=> b!911815 (=> (not res!615138) (not e!511420))))

(assert (=> b!911815 (= res!615138 (and (= (size!26468 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26467 _keys!1386) (size!26468 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(assert (= (and start!78124 res!615135) b!911815))

(assert (= (and b!911815 res!615138) b!911809))

(assert (= (and b!911809 res!615137) b!911812))

(assert (= (and b!911812 res!615136) b!911811))

(assert (= (and b!911813 condMapEmpty!30304) mapIsEmpty!30304))

(assert (= (and b!911813 (not condMapEmpty!30304)) mapNonEmpty!30304))

(get-info :version)

(assert (= (and mapNonEmpty!30304 ((_ is ValueCellFull!9045) mapValue!30304)) b!911814))

(assert (= (and b!911813 ((_ is ValueCellFull!9045) mapDefault!30304)) b!911810))

(assert (= start!78124 b!911813))

(declare-fun m!846471 () Bool)

(assert (=> b!911809 m!846471))

(declare-fun m!846473 () Bool)

(assert (=> mapNonEmpty!30304 m!846473))

(declare-fun m!846475 () Bool)

(assert (=> b!911811 m!846475))

(assert (=> b!911811 m!846475))

(declare-fun m!846477 () Bool)

(assert (=> b!911811 m!846477))

(declare-fun m!846479 () Bool)

(assert (=> b!911812 m!846479))

(declare-fun m!846481 () Bool)

(assert (=> start!78124 m!846481))

(declare-fun m!846483 () Bool)

(assert (=> start!78124 m!846483))

(declare-fun m!846485 () Bool)

(assert (=> start!78124 m!846485))

(check-sat (not mapNonEmpty!30304) (not b!911809) (not b!911812) b_and!27209 (not b_next!16635) (not b!911811) tp_is_empty!19053 (not start!78124))
(check-sat b_and!27209 (not b_next!16635))
