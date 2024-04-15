; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78104 () Bool)

(assert start!78104)

(declare-fun b_free!16633 () Bool)

(declare-fun b_next!16633 () Bool)

(assert (=> start!78104 (= b_free!16633 (not b_next!16633))))

(declare-fun tp!58174 () Bool)

(declare-fun b_and!27181 () Bool)

(assert (=> start!78104 (= tp!58174 b_and!27181)))

(declare-fun b!911549 () Bool)

(declare-fun res!615014 () Bool)

(declare-fun e!511255 () Bool)

(assert (=> b!911549 (=> (not res!615014) (not e!511255))))

(declare-datatypes ((array!54101 0))(
  ( (array!54102 (arr!26006 (Array (_ BitVec 32) (_ BitVec 64))) (size!26467 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54101)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54101 (_ BitVec 32)) Bool)

(assert (=> b!911549 (= res!615014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!30301 () Bool)

(declare-fun mapRes!30301 () Bool)

(assert (=> mapIsEmpty!30301 mapRes!30301))

(declare-fun b!911550 () Bool)

(declare-fun e!511259 () Bool)

(declare-fun tp_is_empty!19051 () Bool)

(assert (=> b!911550 (= e!511259 tp_is_empty!19051)))

(declare-fun mapNonEmpty!30301 () Bool)

(declare-fun tp!58173 () Bool)

(assert (=> mapNonEmpty!30301 (= mapRes!30301 (and tp!58173 e!511259))))

(declare-datatypes ((V!30367 0))(
  ( (V!30368 (val!9576 Int)) )
))
(declare-datatypes ((ValueCell!9044 0))(
  ( (ValueCellFull!9044 (v!12085 V!30367)) (EmptyCell!9044) )
))
(declare-datatypes ((array!54103 0))(
  ( (array!54104 (arr!26007 (Array (_ BitVec 32) ValueCell!9044)) (size!26468 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54103)

(declare-fun mapKey!30301 () (_ BitVec 32))

(declare-fun mapValue!30301 () ValueCell!9044)

(declare-fun mapRest!30301 () (Array (_ BitVec 32) ValueCell!9044))

(assert (=> mapNonEmpty!30301 (= (arr!26007 _values!1152) (store mapRest!30301 mapKey!30301 mapValue!30301))))

(declare-fun b!911551 () Bool)

(declare-fun e!511256 () Bool)

(assert (=> b!911551 (= e!511256 tp_is_empty!19051)))

(declare-fun b!911552 () Bool)

(assert (=> b!911552 (= e!511255 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!410274 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30367)

(declare-fun zeroValue!1094 () V!30367)

(declare-datatypes ((tuple2!12516 0))(
  ( (tuple2!12517 (_1!6269 (_ BitVec 64)) (_2!6269 V!30367)) )
))
(declare-datatypes ((List!18298 0))(
  ( (Nil!18295) (Cons!18294 (h!19440 tuple2!12516) (t!25876 List!18298)) )
))
(declare-datatypes ((ListLongMap!11203 0))(
  ( (ListLongMap!11204 (toList!5617 List!18298)) )
))
(declare-fun contains!4619 (ListLongMap!11203 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2819 (array!54101 array!54103 (_ BitVec 32) (_ BitVec 32) V!30367 V!30367 (_ BitVec 32) Int) ListLongMap!11203)

(assert (=> b!911552 (= lt!410274 (contains!4619 (getCurrentListMap!2819 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!911553 () Bool)

(declare-fun res!615013 () Bool)

(assert (=> b!911553 (=> (not res!615013) (not e!511255))))

(declare-datatypes ((List!18299 0))(
  ( (Nil!18296) (Cons!18295 (h!19441 (_ BitVec 64)) (t!25877 List!18299)) )
))
(declare-fun arrayNoDuplicates!0 (array!54101 (_ BitVec 32) List!18299) Bool)

(assert (=> b!911553 (= res!615013 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18296))))

(declare-fun b!911554 () Bool)

(declare-fun res!615016 () Bool)

(assert (=> b!911554 (=> (not res!615016) (not e!511255))))

(assert (=> b!911554 (= res!615016 (and (= (size!26468 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26467 _keys!1386) (size!26468 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!615015 () Bool)

(assert (=> start!78104 (=> (not res!615015) (not e!511255))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78104 (= res!615015 (validMask!0 mask!1756))))

(assert (=> start!78104 e!511255))

(declare-fun e!511257 () Bool)

(declare-fun array_inv!20392 (array!54103) Bool)

(assert (=> start!78104 (and (array_inv!20392 _values!1152) e!511257)))

(assert (=> start!78104 tp!58174))

(assert (=> start!78104 true))

(assert (=> start!78104 tp_is_empty!19051))

(declare-fun array_inv!20393 (array!54101) Bool)

(assert (=> start!78104 (array_inv!20393 _keys!1386)))

(declare-fun b!911555 () Bool)

(assert (=> b!911555 (= e!511257 (and e!511256 mapRes!30301))))

(declare-fun condMapEmpty!30301 () Bool)

(declare-fun mapDefault!30301 () ValueCell!9044)

(assert (=> b!911555 (= condMapEmpty!30301 (= (arr!26007 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9044)) mapDefault!30301)))))

(assert (= (and start!78104 res!615015) b!911554))

(assert (= (and b!911554 res!615016) b!911549))

(assert (= (and b!911549 res!615014) b!911553))

(assert (= (and b!911553 res!615013) b!911552))

(assert (= (and b!911555 condMapEmpty!30301) mapIsEmpty!30301))

(assert (= (and b!911555 (not condMapEmpty!30301)) mapNonEmpty!30301))

(get-info :version)

(assert (= (and mapNonEmpty!30301 ((_ is ValueCellFull!9044) mapValue!30301)) b!911550))

(assert (= (and b!911555 ((_ is ValueCellFull!9044) mapDefault!30301)) b!911551))

(assert (= start!78104 b!911555))

(declare-fun m!845697 () Bool)

(assert (=> b!911549 m!845697))

(declare-fun m!845699 () Bool)

(assert (=> start!78104 m!845699))

(declare-fun m!845701 () Bool)

(assert (=> start!78104 m!845701))

(declare-fun m!845703 () Bool)

(assert (=> start!78104 m!845703))

(declare-fun m!845705 () Bool)

(assert (=> mapNonEmpty!30301 m!845705))

(declare-fun m!845707 () Bool)

(assert (=> b!911553 m!845707))

(declare-fun m!845709 () Bool)

(assert (=> b!911552 m!845709))

(assert (=> b!911552 m!845709))

(declare-fun m!845711 () Bool)

(assert (=> b!911552 m!845711))

(check-sat b_and!27181 (not b!911549) (not b!911552) (not mapNonEmpty!30301) (not b!911553) (not start!78104) tp_is_empty!19051 (not b_next!16633))
(check-sat b_and!27181 (not b_next!16633))
