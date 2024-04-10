; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78106 () Bool)

(assert start!78106)

(declare-fun b_free!16617 () Bool)

(declare-fun b_next!16617 () Bool)

(assert (=> start!78106 (= b_free!16617 (not b_next!16617))))

(declare-fun tp!58124 () Bool)

(declare-fun b_and!27191 () Bool)

(assert (=> start!78106 (= tp!58124 b_and!27191)))

(declare-fun b!911620 () Bool)

(declare-fun e!511283 () Bool)

(declare-fun e!511286 () Bool)

(declare-fun mapRes!30277 () Bool)

(assert (=> b!911620 (= e!511283 (and e!511286 mapRes!30277))))

(declare-fun condMapEmpty!30277 () Bool)

(declare-datatypes ((V!30345 0))(
  ( (V!30346 (val!9568 Int)) )
))
(declare-datatypes ((ValueCell!9036 0))(
  ( (ValueCellFull!9036 (v!12078 V!30345)) (EmptyCell!9036) )
))
(declare-datatypes ((array!54072 0))(
  ( (array!54073 (arr!25991 (Array (_ BitVec 32) ValueCell!9036)) (size!26450 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54072)

(declare-fun mapDefault!30277 () ValueCell!9036)

(assert (=> b!911620 (= condMapEmpty!30277 (= (arr!25991 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9036)) mapDefault!30277)))))

(declare-fun res!615027 () Bool)

(declare-fun e!511287 () Bool)

(assert (=> start!78106 (=> (not res!615027) (not e!511287))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78106 (= res!615027 (validMask!0 mask!1756))))

(assert (=> start!78106 e!511287))

(declare-fun array_inv!20316 (array!54072) Bool)

(assert (=> start!78106 (and (array_inv!20316 _values!1152) e!511283)))

(assert (=> start!78106 tp!58124))

(assert (=> start!78106 true))

(declare-fun tp_is_empty!19035 () Bool)

(assert (=> start!78106 tp_is_empty!19035))

(declare-datatypes ((array!54074 0))(
  ( (array!54075 (arr!25992 (Array (_ BitVec 32) (_ BitVec 64))) (size!26451 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54074)

(declare-fun array_inv!20317 (array!54074) Bool)

(assert (=> start!78106 (array_inv!20317 _keys!1386)))

(declare-fun b!911621 () Bool)

(assert (=> b!911621 (= e!511286 tp_is_empty!19035)))

(declare-fun mapNonEmpty!30277 () Bool)

(declare-fun tp!58125 () Bool)

(declare-fun e!511284 () Bool)

(assert (=> mapNonEmpty!30277 (= mapRes!30277 (and tp!58125 e!511284))))

(declare-fun mapKey!30277 () (_ BitVec 32))

(declare-fun mapRest!30277 () (Array (_ BitVec 32) ValueCell!9036))

(declare-fun mapValue!30277 () ValueCell!9036)

(assert (=> mapNonEmpty!30277 (= (arr!25991 _values!1152) (store mapRest!30277 mapKey!30277 mapValue!30277))))

(declare-fun b!911622 () Bool)

(assert (=> b!911622 (= e!511287 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!410486 () Bool)

(declare-fun zeroValue!1094 () V!30345)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30345)

(declare-datatypes ((tuple2!12464 0))(
  ( (tuple2!12465 (_1!6243 (_ BitVec 64)) (_2!6243 V!30345)) )
))
(declare-datatypes ((List!18256 0))(
  ( (Nil!18253) (Cons!18252 (h!19398 tuple2!12464) (t!25843 List!18256)) )
))
(declare-datatypes ((ListLongMap!11161 0))(
  ( (ListLongMap!11162 (toList!5596 List!18256)) )
))
(declare-fun contains!4641 (ListLongMap!11161 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2858 (array!54074 array!54072 (_ BitVec 32) (_ BitVec 32) V!30345 V!30345 (_ BitVec 32) Int) ListLongMap!11161)

(assert (=> b!911622 (= lt!410486 (contains!4641 (getCurrentListMap!2858 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!911623 () Bool)

(declare-fun res!615030 () Bool)

(assert (=> b!911623 (=> (not res!615030) (not e!511287))))

(assert (=> b!911623 (= res!615030 (and (= (size!26450 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26451 _keys!1386) (size!26450 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!911624 () Bool)

(declare-fun res!615028 () Bool)

(assert (=> b!911624 (=> (not res!615028) (not e!511287))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54074 (_ BitVec 32)) Bool)

(assert (=> b!911624 (= res!615028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!30277 () Bool)

(assert (=> mapIsEmpty!30277 mapRes!30277))

(declare-fun b!911625 () Bool)

(assert (=> b!911625 (= e!511284 tp_is_empty!19035)))

(declare-fun b!911626 () Bool)

(declare-fun res!615029 () Bool)

(assert (=> b!911626 (=> (not res!615029) (not e!511287))))

(declare-datatypes ((List!18257 0))(
  ( (Nil!18254) (Cons!18253 (h!19399 (_ BitVec 64)) (t!25844 List!18257)) )
))
(declare-fun arrayNoDuplicates!0 (array!54074 (_ BitVec 32) List!18257) Bool)

(assert (=> b!911626 (= res!615029 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18254))))

(assert (= (and start!78106 res!615027) b!911623))

(assert (= (and b!911623 res!615030) b!911624))

(assert (= (and b!911624 res!615028) b!911626))

(assert (= (and b!911626 res!615029) b!911622))

(assert (= (and b!911620 condMapEmpty!30277) mapIsEmpty!30277))

(assert (= (and b!911620 (not condMapEmpty!30277)) mapNonEmpty!30277))

(get-info :version)

(assert (= (and mapNonEmpty!30277 ((_ is ValueCellFull!9036) mapValue!30277)) b!911625))

(assert (= (and b!911620 ((_ is ValueCellFull!9036) mapDefault!30277)) b!911621))

(assert (= start!78106 b!911620))

(declare-fun m!846327 () Bool)

(assert (=> b!911624 m!846327))

(declare-fun m!846329 () Bool)

(assert (=> b!911622 m!846329))

(assert (=> b!911622 m!846329))

(declare-fun m!846331 () Bool)

(assert (=> b!911622 m!846331))

(declare-fun m!846333 () Bool)

(assert (=> b!911626 m!846333))

(declare-fun m!846335 () Bool)

(assert (=> start!78106 m!846335))

(declare-fun m!846337 () Bool)

(assert (=> start!78106 m!846337))

(declare-fun m!846339 () Bool)

(assert (=> start!78106 m!846339))

(declare-fun m!846341 () Bool)

(assert (=> mapNonEmpty!30277 m!846341))

(check-sat tp_is_empty!19035 (not mapNonEmpty!30277) (not b!911624) (not b!911622) (not b_next!16617) (not b!911626) (not start!78106) b_and!27191)
(check-sat b_and!27191 (not b_next!16617))
