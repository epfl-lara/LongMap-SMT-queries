; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78142 () Bool)

(assert start!78142)

(declare-fun b_free!16653 () Bool)

(declare-fun b_next!16653 () Bool)

(assert (=> start!78142 (= b_free!16653 (not b_next!16653))))

(declare-fun tp!58232 () Bool)

(declare-fun b_and!27227 () Bool)

(assert (=> start!78142 (= tp!58232 b_and!27227)))

(declare-fun b!911998 () Bool)

(declare-fun e!511554 () Bool)

(declare-fun e!511557 () Bool)

(declare-fun mapRes!30331 () Bool)

(assert (=> b!911998 (= e!511554 (and e!511557 mapRes!30331))))

(declare-fun condMapEmpty!30331 () Bool)

(declare-datatypes ((V!30393 0))(
  ( (V!30394 (val!9586 Int)) )
))
(declare-datatypes ((ValueCell!9054 0))(
  ( (ValueCellFull!9054 (v!12096 V!30393)) (EmptyCell!9054) )
))
(declare-datatypes ((array!54142 0))(
  ( (array!54143 (arr!26026 (Array (_ BitVec 32) ValueCell!9054)) (size!26485 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54142)

(declare-fun mapDefault!30331 () ValueCell!9054)

(assert (=> b!911998 (= condMapEmpty!30331 (= (arr!26026 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9054)) mapDefault!30331)))))

(declare-fun res!615245 () Bool)

(declare-fun e!511553 () Bool)

(assert (=> start!78142 (=> (not res!615245) (not e!511553))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78142 (= res!615245 (validMask!0 mask!1756))))

(assert (=> start!78142 e!511553))

(declare-fun array_inv!20338 (array!54142) Bool)

(assert (=> start!78142 (and (array_inv!20338 _values!1152) e!511554)))

(assert (=> start!78142 tp!58232))

(assert (=> start!78142 true))

(declare-fun tp_is_empty!19071 () Bool)

(assert (=> start!78142 tp_is_empty!19071))

(declare-datatypes ((array!54144 0))(
  ( (array!54145 (arr!26027 (Array (_ BitVec 32) (_ BitVec 64))) (size!26486 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54144)

(declare-fun array_inv!20339 (array!54144) Bool)

(assert (=> start!78142 (array_inv!20339 _keys!1386)))

(declare-fun mapNonEmpty!30331 () Bool)

(declare-fun tp!58233 () Bool)

(declare-fun e!511555 () Bool)

(assert (=> mapNonEmpty!30331 (= mapRes!30331 (and tp!58233 e!511555))))

(declare-fun mapValue!30331 () ValueCell!9054)

(declare-fun mapRest!30331 () (Array (_ BitVec 32) ValueCell!9054))

(declare-fun mapKey!30331 () (_ BitVec 32))

(assert (=> mapNonEmpty!30331 (= (arr!26026 _values!1152) (store mapRest!30331 mapKey!30331 mapValue!30331))))

(declare-fun b!911999 () Bool)

(assert (=> b!911999 (= e!511557 tp_is_empty!19071)))

(declare-fun mapIsEmpty!30331 () Bool)

(assert (=> mapIsEmpty!30331 mapRes!30331))

(declare-fun b!912000 () Bool)

(assert (=> b!912000 (= e!511553 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30393)

(declare-fun lt!410540 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30393)

(declare-datatypes ((tuple2!12490 0))(
  ( (tuple2!12491 (_1!6256 (_ BitVec 64)) (_2!6256 V!30393)) )
))
(declare-datatypes ((List!18280 0))(
  ( (Nil!18277) (Cons!18276 (h!19422 tuple2!12490) (t!25867 List!18280)) )
))
(declare-datatypes ((ListLongMap!11187 0))(
  ( (ListLongMap!11188 (toList!5609 List!18280)) )
))
(declare-fun contains!4654 (ListLongMap!11187 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2871 (array!54144 array!54142 (_ BitVec 32) (_ BitVec 32) V!30393 V!30393 (_ BitVec 32) Int) ListLongMap!11187)

(assert (=> b!912000 (= lt!410540 (contains!4654 (getCurrentListMap!2871 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!912001 () Bool)

(assert (=> b!912001 (= e!511555 tp_is_empty!19071)))

(declare-fun b!912002 () Bool)

(declare-fun res!615243 () Bool)

(assert (=> b!912002 (=> (not res!615243) (not e!511553))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54144 (_ BitVec 32)) Bool)

(assert (=> b!912002 (= res!615243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!912003 () Bool)

(declare-fun res!615244 () Bool)

(assert (=> b!912003 (=> (not res!615244) (not e!511553))))

(assert (=> b!912003 (= res!615244 (and (= (size!26485 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26486 _keys!1386) (size!26485 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!912004 () Bool)

(declare-fun res!615246 () Bool)

(assert (=> b!912004 (=> (not res!615246) (not e!511553))))

(declare-datatypes ((List!18281 0))(
  ( (Nil!18278) (Cons!18277 (h!19423 (_ BitVec 64)) (t!25868 List!18281)) )
))
(declare-fun arrayNoDuplicates!0 (array!54144 (_ BitVec 32) List!18281) Bool)

(assert (=> b!912004 (= res!615246 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18278))))

(assert (= (and start!78142 res!615245) b!912003))

(assert (= (and b!912003 res!615244) b!912002))

(assert (= (and b!912002 res!615243) b!912004))

(assert (= (and b!912004 res!615246) b!912000))

(assert (= (and b!911998 condMapEmpty!30331) mapIsEmpty!30331))

(assert (= (and b!911998 (not condMapEmpty!30331)) mapNonEmpty!30331))

(get-info :version)

(assert (= (and mapNonEmpty!30331 ((_ is ValueCellFull!9054) mapValue!30331)) b!912001))

(assert (= (and b!911998 ((_ is ValueCellFull!9054) mapDefault!30331)) b!911999))

(assert (= start!78142 b!911998))

(declare-fun m!846615 () Bool)

(assert (=> b!912004 m!846615))

(declare-fun m!846617 () Bool)

(assert (=> start!78142 m!846617))

(declare-fun m!846619 () Bool)

(assert (=> start!78142 m!846619))

(declare-fun m!846621 () Bool)

(assert (=> start!78142 m!846621))

(declare-fun m!846623 () Bool)

(assert (=> b!912002 m!846623))

(declare-fun m!846625 () Bool)

(assert (=> b!912000 m!846625))

(assert (=> b!912000 m!846625))

(declare-fun m!846627 () Bool)

(assert (=> b!912000 m!846627))

(declare-fun m!846629 () Bool)

(assert (=> mapNonEmpty!30331 m!846629))

(check-sat (not b!912000) (not b!912004) (not mapNonEmpty!30331) tp_is_empty!19071 b_and!27227 (not start!78142) (not b_next!16653) (not b!912002))
(check-sat b_and!27227 (not b_next!16653))
