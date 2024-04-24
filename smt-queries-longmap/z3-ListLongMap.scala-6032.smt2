; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78244 () Bool)

(assert start!78244)

(declare-fun b_free!16603 () Bool)

(declare-fun b_next!16603 () Bool)

(assert (=> start!78244 (= b_free!16603 (not b_next!16603))))

(declare-fun tp!58080 () Bool)

(declare-fun b_and!27185 () Bool)

(assert (=> start!78244 (= tp!58080 b_and!27185)))

(declare-fun b!912249 () Bool)

(declare-fun e!511692 () Bool)

(declare-fun tp_is_empty!19021 () Bool)

(assert (=> b!912249 (= e!511692 tp_is_empty!19021)))

(declare-fun mapIsEmpty!30253 () Bool)

(declare-fun mapRes!30253 () Bool)

(assert (=> mapIsEmpty!30253 mapRes!30253))

(declare-fun res!615226 () Bool)

(declare-fun e!511689 () Bool)

(assert (=> start!78244 (=> (not res!615226) (not e!511689))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78244 (= res!615226 (validMask!0 mask!1756))))

(assert (=> start!78244 e!511689))

(declare-datatypes ((V!30327 0))(
  ( (V!30328 (val!9561 Int)) )
))
(declare-datatypes ((ValueCell!9029 0))(
  ( (ValueCellFull!9029 (v!12067 V!30327)) (EmptyCell!9029) )
))
(declare-datatypes ((array!54105 0))(
  ( (array!54106 (arr!26004 (Array (_ BitVec 32) ValueCell!9029)) (size!26464 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54105)

(declare-fun e!511691 () Bool)

(declare-fun array_inv!20406 (array!54105) Bool)

(assert (=> start!78244 (and (array_inv!20406 _values!1152) e!511691)))

(assert (=> start!78244 tp!58080))

(assert (=> start!78244 true))

(assert (=> start!78244 tp_is_empty!19021))

(declare-datatypes ((array!54107 0))(
  ( (array!54108 (arr!26005 (Array (_ BitVec 32) (_ BitVec 64))) (size!26465 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54107)

(declare-fun array_inv!20407 (array!54107) Bool)

(assert (=> start!78244 (array_inv!20407 _keys!1386)))

(declare-fun b!912250 () Bool)

(declare-fun e!511688 () Bool)

(assert (=> b!912250 (= e!511691 (and e!511688 mapRes!30253))))

(declare-fun condMapEmpty!30253 () Bool)

(declare-fun mapDefault!30253 () ValueCell!9029)

(assert (=> b!912250 (= condMapEmpty!30253 (= (arr!26004 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9029)) mapDefault!30253)))))

(declare-fun b!912251 () Bool)

(assert (=> b!912251 (= e!511689 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!410748 () Bool)

(declare-fun zeroValue!1094 () V!30327)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30327)

(declare-datatypes ((tuple2!12418 0))(
  ( (tuple2!12419 (_1!6220 (_ BitVec 64)) (_2!6220 V!30327)) )
))
(declare-datatypes ((List!18238 0))(
  ( (Nil!18235) (Cons!18234 (h!19386 tuple2!12418) (t!25815 List!18238)) )
))
(declare-datatypes ((ListLongMap!11117 0))(
  ( (ListLongMap!11118 (toList!5574 List!18238)) )
))
(declare-fun contains!4627 (ListLongMap!11117 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2835 (array!54107 array!54105 (_ BitVec 32) (_ BitVec 32) V!30327 V!30327 (_ BitVec 32) Int) ListLongMap!11117)

(assert (=> b!912251 (= lt!410748 (contains!4627 (getCurrentListMap!2835 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!912252 () Bool)

(assert (=> b!912252 (= e!511688 tp_is_empty!19021)))

(declare-fun mapNonEmpty!30253 () Bool)

(declare-fun tp!58081 () Bool)

(assert (=> mapNonEmpty!30253 (= mapRes!30253 (and tp!58081 e!511692))))

(declare-fun mapRest!30253 () (Array (_ BitVec 32) ValueCell!9029))

(declare-fun mapValue!30253 () ValueCell!9029)

(declare-fun mapKey!30253 () (_ BitVec 32))

(assert (=> mapNonEmpty!30253 (= (arr!26004 _values!1152) (store mapRest!30253 mapKey!30253 mapValue!30253))))

(declare-fun b!912253 () Bool)

(declare-fun res!615227 () Bool)

(assert (=> b!912253 (=> (not res!615227) (not e!511689))))

(declare-datatypes ((List!18239 0))(
  ( (Nil!18236) (Cons!18235 (h!19387 (_ BitVec 64)) (t!25816 List!18239)) )
))
(declare-fun arrayNoDuplicates!0 (array!54107 (_ BitVec 32) List!18239) Bool)

(assert (=> b!912253 (= res!615227 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18236))))

(declare-fun b!912254 () Bool)

(declare-fun res!615224 () Bool)

(assert (=> b!912254 (=> (not res!615224) (not e!511689))))

(assert (=> b!912254 (= res!615224 (and (= (size!26464 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26465 _keys!1386) (size!26464 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!912255 () Bool)

(declare-fun res!615225 () Bool)

(assert (=> b!912255 (=> (not res!615225) (not e!511689))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54107 (_ BitVec 32)) Bool)

(assert (=> b!912255 (= res!615225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(assert (= (and start!78244 res!615226) b!912254))

(assert (= (and b!912254 res!615224) b!912255))

(assert (= (and b!912255 res!615225) b!912253))

(assert (= (and b!912253 res!615227) b!912251))

(assert (= (and b!912250 condMapEmpty!30253) mapIsEmpty!30253))

(assert (= (and b!912250 (not condMapEmpty!30253)) mapNonEmpty!30253))

(get-info :version)

(assert (= (and mapNonEmpty!30253 ((_ is ValueCellFull!9029) mapValue!30253)) b!912249))

(assert (= (and b!912250 ((_ is ValueCellFull!9029) mapDefault!30253)) b!912252))

(assert (= start!78244 b!912250))

(declare-fun m!847423 () Bool)

(assert (=> mapNonEmpty!30253 m!847423))

(declare-fun m!847425 () Bool)

(assert (=> b!912255 m!847425))

(declare-fun m!847427 () Bool)

(assert (=> start!78244 m!847427))

(declare-fun m!847429 () Bool)

(assert (=> start!78244 m!847429))

(declare-fun m!847431 () Bool)

(assert (=> start!78244 m!847431))

(declare-fun m!847433 () Bool)

(assert (=> b!912251 m!847433))

(assert (=> b!912251 m!847433))

(declare-fun m!847435 () Bool)

(assert (=> b!912251 m!847435))

(declare-fun m!847437 () Bool)

(assert (=> b!912253 m!847437))

(check-sat (not b!912255) tp_is_empty!19021 (not b!912253) b_and!27185 (not mapNonEmpty!30253) (not b!912251) (not start!78244) (not b_next!16603))
(check-sat b_and!27185 (not b_next!16603))
