; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78166 () Bool)

(assert start!78166)

(declare-fun b_free!16525 () Bool)

(declare-fun b_next!16525 () Bool)

(assert (=> start!78166 (= b_free!16525 (not b_next!16525))))

(declare-fun tp!57847 () Bool)

(declare-fun b_and!27107 () Bool)

(assert (=> start!78166 (= tp!57847 b_and!27107)))

(declare-fun b!911430 () Bool)

(declare-fun res!614758 () Bool)

(declare-fun e!511107 () Bool)

(assert (=> b!911430 (=> (not res!614758) (not e!511107))))

(declare-datatypes ((V!30223 0))(
  ( (V!30224 (val!9522 Int)) )
))
(declare-datatypes ((ValueCell!8990 0))(
  ( (ValueCellFull!8990 (v!12028 V!30223)) (EmptyCell!8990) )
))
(declare-datatypes ((array!53957 0))(
  ( (array!53958 (arr!25930 (Array (_ BitVec 32) ValueCell!8990)) (size!26390 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53957)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53959 0))(
  ( (array!53960 (arr!25931 (Array (_ BitVec 32) (_ BitVec 64))) (size!26391 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53959)

(assert (=> b!911430 (= res!614758 (and (= (size!26390 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26391 _keys!1386) (size!26390 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!911431 () Bool)

(assert (=> b!911431 (= e!511107 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!410631 () Bool)

(declare-fun zeroValue!1094 () V!30223)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30223)

(declare-datatypes ((tuple2!12364 0))(
  ( (tuple2!12365 (_1!6193 (_ BitVec 64)) (_2!6193 V!30223)) )
))
(declare-datatypes ((List!18184 0))(
  ( (Nil!18181) (Cons!18180 (h!19332 tuple2!12364) (t!25761 List!18184)) )
))
(declare-datatypes ((ListLongMap!11063 0))(
  ( (ListLongMap!11064 (toList!5547 List!18184)) )
))
(declare-fun contains!4600 (ListLongMap!11063 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2808 (array!53959 array!53957 (_ BitVec 32) (_ BitVec 32) V!30223 V!30223 (_ BitVec 32) Int) ListLongMap!11063)

(assert (=> b!911431 (= lt!410631 (contains!4600 (getCurrentListMap!2808 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapIsEmpty!30136 () Bool)

(declare-fun mapRes!30136 () Bool)

(assert (=> mapIsEmpty!30136 mapRes!30136))

(declare-fun b!911432 () Bool)

(declare-fun e!511106 () Bool)

(declare-fun e!511103 () Bool)

(assert (=> b!911432 (= e!511106 (and e!511103 mapRes!30136))))

(declare-fun condMapEmpty!30136 () Bool)

(declare-fun mapDefault!30136 () ValueCell!8990)

(assert (=> b!911432 (= condMapEmpty!30136 (= (arr!25930 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8990)) mapDefault!30136)))))

(declare-fun mapNonEmpty!30136 () Bool)

(declare-fun tp!57846 () Bool)

(declare-fun e!511104 () Bool)

(assert (=> mapNonEmpty!30136 (= mapRes!30136 (and tp!57846 e!511104))))

(declare-fun mapValue!30136 () ValueCell!8990)

(declare-fun mapRest!30136 () (Array (_ BitVec 32) ValueCell!8990))

(declare-fun mapKey!30136 () (_ BitVec 32))

(assert (=> mapNonEmpty!30136 (= (arr!25930 _values!1152) (store mapRest!30136 mapKey!30136 mapValue!30136))))

(declare-fun b!911433 () Bool)

(declare-fun tp_is_empty!18943 () Bool)

(assert (=> b!911433 (= e!511104 tp_is_empty!18943)))

(declare-fun res!614756 () Bool)

(assert (=> start!78166 (=> (not res!614756) (not e!511107))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78166 (= res!614756 (validMask!0 mask!1756))))

(assert (=> start!78166 e!511107))

(declare-fun array_inv!20346 (array!53957) Bool)

(assert (=> start!78166 (and (array_inv!20346 _values!1152) e!511106)))

(assert (=> start!78166 tp!57847))

(assert (=> start!78166 true))

(assert (=> start!78166 tp_is_empty!18943))

(declare-fun array_inv!20347 (array!53959) Bool)

(assert (=> start!78166 (array_inv!20347 _keys!1386)))

(declare-fun b!911434 () Bool)

(declare-fun res!614757 () Bool)

(assert (=> b!911434 (=> (not res!614757) (not e!511107))))

(declare-datatypes ((List!18185 0))(
  ( (Nil!18182) (Cons!18181 (h!19333 (_ BitVec 64)) (t!25762 List!18185)) )
))
(declare-fun arrayNoDuplicates!0 (array!53959 (_ BitVec 32) List!18185) Bool)

(assert (=> b!911434 (= res!614757 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18182))))

(declare-fun b!911435 () Bool)

(declare-fun res!614759 () Bool)

(assert (=> b!911435 (=> (not res!614759) (not e!511107))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53959 (_ BitVec 32)) Bool)

(assert (=> b!911435 (= res!614759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!911436 () Bool)

(assert (=> b!911436 (= e!511103 tp_is_empty!18943)))

(assert (= (and start!78166 res!614756) b!911430))

(assert (= (and b!911430 res!614758) b!911435))

(assert (= (and b!911435 res!614759) b!911434))

(assert (= (and b!911434 res!614757) b!911431))

(assert (= (and b!911432 condMapEmpty!30136) mapIsEmpty!30136))

(assert (= (and b!911432 (not condMapEmpty!30136)) mapNonEmpty!30136))

(get-info :version)

(assert (= (and mapNonEmpty!30136 ((_ is ValueCellFull!8990) mapValue!30136)) b!911433))

(assert (= (and b!911432 ((_ is ValueCellFull!8990) mapDefault!30136)) b!911436))

(assert (= start!78166 b!911432))

(declare-fun m!846799 () Bool)

(assert (=> start!78166 m!846799))

(declare-fun m!846801 () Bool)

(assert (=> start!78166 m!846801))

(declare-fun m!846803 () Bool)

(assert (=> start!78166 m!846803))

(declare-fun m!846805 () Bool)

(assert (=> b!911435 m!846805))

(declare-fun m!846807 () Bool)

(assert (=> b!911431 m!846807))

(assert (=> b!911431 m!846807))

(declare-fun m!846809 () Bool)

(assert (=> b!911431 m!846809))

(declare-fun m!846811 () Bool)

(assert (=> b!911434 m!846811))

(declare-fun m!846813 () Bool)

(assert (=> mapNonEmpty!30136 m!846813))

(check-sat (not b!911435) (not start!78166) tp_is_empty!18943 (not b!911434) (not b_next!16525) (not b!911431) (not mapNonEmpty!30136) b_and!27107)
(check-sat b_and!27107 (not b_next!16525))
