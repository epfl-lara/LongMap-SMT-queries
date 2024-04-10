; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78130 () Bool)

(assert start!78130)

(declare-fun b_free!16641 () Bool)

(declare-fun b_next!16641 () Bool)

(assert (=> start!78130 (= b_free!16641 (not b_next!16641))))

(declare-fun tp!58196 () Bool)

(declare-fun b_and!27215 () Bool)

(assert (=> start!78130 (= tp!58196 b_and!27215)))

(declare-fun b!911872 () Bool)

(declare-fun e!511465 () Bool)

(assert (=> b!911872 (= e!511465 false)))

(declare-datatypes ((V!30377 0))(
  ( (V!30378 (val!9580 Int)) )
))
(declare-datatypes ((ValueCell!9048 0))(
  ( (ValueCellFull!9048 (v!12090 V!30377)) (EmptyCell!9048) )
))
(declare-datatypes ((array!54118 0))(
  ( (array!54119 (arr!26014 (Array (_ BitVec 32) ValueCell!9048)) (size!26473 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54118)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30377)

(declare-datatypes ((array!54120 0))(
  ( (array!54121 (arr!26015 (Array (_ BitVec 32) (_ BitVec 64))) (size!26474 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54120)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30377)

(declare-fun lt!410522 () Bool)

(declare-datatypes ((tuple2!12480 0))(
  ( (tuple2!12481 (_1!6251 (_ BitVec 64)) (_2!6251 V!30377)) )
))
(declare-datatypes ((List!18271 0))(
  ( (Nil!18268) (Cons!18267 (h!19413 tuple2!12480) (t!25858 List!18271)) )
))
(declare-datatypes ((ListLongMap!11177 0))(
  ( (ListLongMap!11178 (toList!5604 List!18271)) )
))
(declare-fun contains!4649 (ListLongMap!11177 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2866 (array!54120 array!54118 (_ BitVec 32) (_ BitVec 32) V!30377 V!30377 (_ BitVec 32) Int) ListLongMap!11177)

(assert (=> b!911872 (= lt!410522 (contains!4649 (getCurrentListMap!2866 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!911873 () Bool)

(declare-fun res!615171 () Bool)

(assert (=> b!911873 (=> (not res!615171) (not e!511465))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54120 (_ BitVec 32)) Bool)

(assert (=> b!911873 (= res!615171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!911874 () Bool)

(declare-fun e!511466 () Bool)

(declare-fun tp_is_empty!19059 () Bool)

(assert (=> b!911874 (= e!511466 tp_is_empty!19059)))

(declare-fun b!911875 () Bool)

(declare-fun res!615174 () Bool)

(assert (=> b!911875 (=> (not res!615174) (not e!511465))))

(assert (=> b!911875 (= res!615174 (and (= (size!26473 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26474 _keys!1386) (size!26473 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!615172 () Bool)

(assert (=> start!78130 (=> (not res!615172) (not e!511465))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78130 (= res!615172 (validMask!0 mask!1756))))

(assert (=> start!78130 e!511465))

(declare-fun e!511463 () Bool)

(declare-fun array_inv!20332 (array!54118) Bool)

(assert (=> start!78130 (and (array_inv!20332 _values!1152) e!511463)))

(assert (=> start!78130 tp!58196))

(assert (=> start!78130 true))

(assert (=> start!78130 tp_is_empty!19059))

(declare-fun array_inv!20333 (array!54120) Bool)

(assert (=> start!78130 (array_inv!20333 _keys!1386)))

(declare-fun mapIsEmpty!30313 () Bool)

(declare-fun mapRes!30313 () Bool)

(assert (=> mapIsEmpty!30313 mapRes!30313))

(declare-fun b!911876 () Bool)

(declare-fun e!511464 () Bool)

(assert (=> b!911876 (= e!511464 tp_is_empty!19059)))

(declare-fun b!911877 () Bool)

(declare-fun res!615173 () Bool)

(assert (=> b!911877 (=> (not res!615173) (not e!511465))))

(declare-datatypes ((List!18272 0))(
  ( (Nil!18269) (Cons!18268 (h!19414 (_ BitVec 64)) (t!25859 List!18272)) )
))
(declare-fun arrayNoDuplicates!0 (array!54120 (_ BitVec 32) List!18272) Bool)

(assert (=> b!911877 (= res!615173 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18269))))

(declare-fun b!911878 () Bool)

(assert (=> b!911878 (= e!511463 (and e!511464 mapRes!30313))))

(declare-fun condMapEmpty!30313 () Bool)

(declare-fun mapDefault!30313 () ValueCell!9048)

(assert (=> b!911878 (= condMapEmpty!30313 (= (arr!26014 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9048)) mapDefault!30313)))))

(declare-fun mapNonEmpty!30313 () Bool)

(declare-fun tp!58197 () Bool)

(assert (=> mapNonEmpty!30313 (= mapRes!30313 (and tp!58197 e!511466))))

(declare-fun mapKey!30313 () (_ BitVec 32))

(declare-fun mapRest!30313 () (Array (_ BitVec 32) ValueCell!9048))

(declare-fun mapValue!30313 () ValueCell!9048)

(assert (=> mapNonEmpty!30313 (= (arr!26014 _values!1152) (store mapRest!30313 mapKey!30313 mapValue!30313))))

(assert (= (and start!78130 res!615172) b!911875))

(assert (= (and b!911875 res!615174) b!911873))

(assert (= (and b!911873 res!615171) b!911877))

(assert (= (and b!911877 res!615173) b!911872))

(assert (= (and b!911878 condMapEmpty!30313) mapIsEmpty!30313))

(assert (= (and b!911878 (not condMapEmpty!30313)) mapNonEmpty!30313))

(get-info :version)

(assert (= (and mapNonEmpty!30313 ((_ is ValueCellFull!9048) mapValue!30313)) b!911874))

(assert (= (and b!911878 ((_ is ValueCellFull!9048) mapDefault!30313)) b!911876))

(assert (= start!78130 b!911878))

(declare-fun m!846519 () Bool)

(assert (=> mapNonEmpty!30313 m!846519))

(declare-fun m!846521 () Bool)

(assert (=> b!911872 m!846521))

(assert (=> b!911872 m!846521))

(declare-fun m!846523 () Bool)

(assert (=> b!911872 m!846523))

(declare-fun m!846525 () Bool)

(assert (=> b!911877 m!846525))

(declare-fun m!846527 () Bool)

(assert (=> start!78130 m!846527))

(declare-fun m!846529 () Bool)

(assert (=> start!78130 m!846529))

(declare-fun m!846531 () Bool)

(assert (=> start!78130 m!846531))

(declare-fun m!846533 () Bool)

(assert (=> b!911873 m!846533))

(check-sat (not mapNonEmpty!30313) (not b!911873) (not start!78130) tp_is_empty!19059 (not b!911872) (not b!911877) (not b_next!16641) b_and!27215)
(check-sat b_and!27215 (not b_next!16641))
