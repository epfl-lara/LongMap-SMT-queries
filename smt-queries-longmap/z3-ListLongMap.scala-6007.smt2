; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78062 () Bool)

(assert start!78062)

(declare-fun b_free!16453 () Bool)

(declare-fun b_next!16453 () Bool)

(assert (=> start!78062 (= b_free!16453 (not b_next!16453))))

(declare-fun tp!57624 () Bool)

(declare-fun b_and!27031 () Bool)

(assert (=> start!78062 (= tp!57624 b_and!27031)))

(declare-fun b!910420 () Bool)

(declare-fun e!510422 () Bool)

(declare-fun tp_is_empty!18871 () Bool)

(assert (=> b!910420 (= e!510422 tp_is_empty!18871)))

(declare-fun b!910421 () Bool)

(declare-fun res!614200 () Bool)

(declare-fun e!510421 () Bool)

(assert (=> b!910421 (=> (not res!614200) (not e!510421))))

(declare-datatypes ((array!53817 0))(
  ( (array!53818 (arr!25862 (Array (_ BitVec 32) (_ BitVec 64))) (size!26322 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53817)

(declare-datatypes ((List!18139 0))(
  ( (Nil!18136) (Cons!18135 (h!19287 (_ BitVec 64)) (t!25712 List!18139)) )
))
(declare-fun arrayNoDuplicates!0 (array!53817 (_ BitVec 32) List!18139) Bool)

(assert (=> b!910421 (= res!614200 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18136))))

(declare-fun res!614199 () Bool)

(assert (=> start!78062 (=> (not res!614199) (not e!510421))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78062 (= res!614199 (validMask!0 mask!1756))))

(assert (=> start!78062 e!510421))

(declare-datatypes ((V!30127 0))(
  ( (V!30128 (val!9486 Int)) )
))
(declare-datatypes ((ValueCell!8954 0))(
  ( (ValueCellFull!8954 (v!11990 V!30127)) (EmptyCell!8954) )
))
(declare-datatypes ((array!53819 0))(
  ( (array!53820 (arr!25863 (Array (_ BitVec 32) ValueCell!8954)) (size!26323 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53819)

(declare-fun e!510423 () Bool)

(declare-fun array_inv!20298 (array!53819) Bool)

(assert (=> start!78062 (and (array_inv!20298 _values!1152) e!510423)))

(assert (=> start!78062 tp!57624))

(assert (=> start!78062 true))

(assert (=> start!78062 tp_is_empty!18871))

(declare-fun array_inv!20299 (array!53817) Bool)

(assert (=> start!78062 (array_inv!20299 _keys!1386)))

(declare-fun mapNonEmpty!30022 () Bool)

(declare-fun mapRes!30022 () Bool)

(declare-fun tp!57625 () Bool)

(assert (=> mapNonEmpty!30022 (= mapRes!30022 (and tp!57625 e!510422))))

(declare-fun mapValue!30022 () ValueCell!8954)

(declare-fun mapKey!30022 () (_ BitVec 32))

(declare-fun mapRest!30022 () (Array (_ BitVec 32) ValueCell!8954))

(assert (=> mapNonEmpty!30022 (= (arr!25863 _values!1152) (store mapRest!30022 mapKey!30022 mapValue!30022))))

(declare-fun b!910422 () Bool)

(declare-fun res!614201 () Bool)

(assert (=> b!910422 (=> (not res!614201) (not e!510421))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!910422 (= res!614201 (and (= (size!26323 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26322 _keys!1386) (size!26323 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910423 () Bool)

(declare-fun res!614198 () Bool)

(assert (=> b!910423 (=> (not res!614198) (not e!510421))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53817 (_ BitVec 32)) Bool)

(assert (=> b!910423 (= res!614198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!910424 () Bool)

(declare-fun e!510420 () Bool)

(assert (=> b!910424 (= e!510423 (and e!510420 mapRes!30022))))

(declare-fun condMapEmpty!30022 () Bool)

(declare-fun mapDefault!30022 () ValueCell!8954)

(assert (=> b!910424 (= condMapEmpty!30022 (= (arr!25863 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8954)) mapDefault!30022)))))

(declare-fun b!910425 () Bool)

(assert (=> b!910425 (= e!510420 tp_is_empty!18871)))

(declare-fun mapIsEmpty!30022 () Bool)

(assert (=> mapIsEmpty!30022 mapRes!30022))

(declare-fun b!910426 () Bool)

(assert (=> b!910426 (= e!510421 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30127)

(declare-fun lt!410367 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30127)

(declare-datatypes ((tuple2!12318 0))(
  ( (tuple2!12319 (_1!6170 (_ BitVec 64)) (_2!6170 V!30127)) )
))
(declare-datatypes ((List!18140 0))(
  ( (Nil!18137) (Cons!18136 (h!19288 tuple2!12318) (t!25713 List!18140)) )
))
(declare-datatypes ((ListLongMap!11017 0))(
  ( (ListLongMap!11018 (toList!5524 List!18140)) )
))
(declare-fun contains!4575 (ListLongMap!11017 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2785 (array!53817 array!53819 (_ BitVec 32) (_ BitVec 32) V!30127 V!30127 (_ BitVec 32) Int) ListLongMap!11017)

(assert (=> b!910426 (= lt!410367 (contains!4575 (getCurrentListMap!2785 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(assert (= (and start!78062 res!614199) b!910422))

(assert (= (and b!910422 res!614201) b!910423))

(assert (= (and b!910423 res!614198) b!910421))

(assert (= (and b!910421 res!614200) b!910426))

(assert (= (and b!910424 condMapEmpty!30022) mapIsEmpty!30022))

(assert (= (and b!910424 (not condMapEmpty!30022)) mapNonEmpty!30022))

(get-info :version)

(assert (= (and mapNonEmpty!30022 ((_ is ValueCellFull!8954) mapValue!30022)) b!910420))

(assert (= (and b!910424 ((_ is ValueCellFull!8954) mapDefault!30022)) b!910425))

(assert (= start!78062 b!910424))

(declare-fun m!846039 () Bool)

(assert (=> b!910426 m!846039))

(assert (=> b!910426 m!846039))

(declare-fun m!846041 () Bool)

(assert (=> b!910426 m!846041))

(declare-fun m!846043 () Bool)

(assert (=> b!910423 m!846043))

(declare-fun m!846045 () Bool)

(assert (=> mapNonEmpty!30022 m!846045))

(declare-fun m!846047 () Bool)

(assert (=> start!78062 m!846047))

(declare-fun m!846049 () Bool)

(assert (=> start!78062 m!846049))

(declare-fun m!846051 () Bool)

(assert (=> start!78062 m!846051))

(declare-fun m!846053 () Bool)

(assert (=> b!910421 m!846053))

(check-sat (not b!910426) b_and!27031 (not b!910423) (not start!78062) tp_is_empty!18871 (not b_next!16453) (not b!910421) (not mapNonEmpty!30022))
(check-sat b_and!27031 (not b_next!16453))
