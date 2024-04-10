; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78018 () Bool)

(assert start!78018)

(declare-fun b_free!16545 () Bool)

(declare-fun b_next!16545 () Bool)

(assert (=> start!78018 (= b_free!16545 (not b_next!16545))))

(declare-fun tp!57905 () Bool)

(declare-fun b_and!27117 () Bool)

(assert (=> start!78018 (= tp!57905 b_and!27117)))

(declare-fun mapNonEmpty!30166 () Bool)

(declare-fun mapRes!30166 () Bool)

(declare-fun tp!57906 () Bool)

(declare-fun e!510672 () Bool)

(assert (=> mapNonEmpty!30166 (= mapRes!30166 (and tp!57906 e!510672))))

(declare-datatypes ((V!30249 0))(
  ( (V!30250 (val!9532 Int)) )
))
(declare-datatypes ((ValueCell!9000 0))(
  ( (ValueCellFull!9000 (v!12041 V!30249)) (EmptyCell!9000) )
))
(declare-datatypes ((array!53938 0))(
  ( (array!53939 (arr!25925 (Array (_ BitVec 32) ValueCell!9000)) (size!26384 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53938)

(declare-fun mapValue!30166 () ValueCell!9000)

(declare-fun mapRest!30166 () (Array (_ BitVec 32) ValueCell!9000))

(declare-fun mapKey!30166 () (_ BitVec 32))

(assert (=> mapNonEmpty!30166 (= (arr!25925 _values!1152) (store mapRest!30166 mapKey!30166 mapValue!30166))))

(declare-fun b!910737 () Bool)

(declare-fun e!510675 () Bool)

(assert (=> b!910737 (= e!510675 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30249)

(declare-datatypes ((array!53940 0))(
  ( (array!53941 (arr!25926 (Array (_ BitVec 32) (_ BitVec 64))) (size!26385 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53940)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!410300 () Bool)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30249)

(declare-datatypes ((tuple2!12418 0))(
  ( (tuple2!12419 (_1!6220 (_ BitVec 64)) (_2!6220 V!30249)) )
))
(declare-datatypes ((List!18209 0))(
  ( (Nil!18206) (Cons!18205 (h!19351 tuple2!12418) (t!25794 List!18209)) )
))
(declare-datatypes ((ListLongMap!11115 0))(
  ( (ListLongMap!11116 (toList!5573 List!18209)) )
))
(declare-fun contains!4617 (ListLongMap!11115 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2835 (array!53940 array!53938 (_ BitVec 32) (_ BitVec 32) V!30249 V!30249 (_ BitVec 32) Int) ListLongMap!11115)

(assert (=> b!910737 (= lt!410300 (contains!4617 (getCurrentListMap!2835 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun res!614533 () Bool)

(assert (=> start!78018 (=> (not res!614533) (not e!510675))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78018 (= res!614533 (validMask!0 mask!1756))))

(assert (=> start!78018 e!510675))

(declare-fun e!510674 () Bool)

(declare-fun array_inv!20270 (array!53938) Bool)

(assert (=> start!78018 (and (array_inv!20270 _values!1152) e!510674)))

(assert (=> start!78018 tp!57905))

(assert (=> start!78018 true))

(declare-fun tp_is_empty!18963 () Bool)

(assert (=> start!78018 tp_is_empty!18963))

(declare-fun array_inv!20271 (array!53940) Bool)

(assert (=> start!78018 (array_inv!20271 _keys!1386)))

(declare-fun b!910738 () Bool)

(declare-fun e!510673 () Bool)

(assert (=> b!910738 (= e!510673 tp_is_empty!18963)))

(declare-fun b!910739 () Bool)

(declare-fun res!614534 () Bool)

(assert (=> b!910739 (=> (not res!614534) (not e!510675))))

(assert (=> b!910739 (= res!614534 (and (= (size!26384 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26385 _keys!1386) (size!26384 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910740 () Bool)

(assert (=> b!910740 (= e!510674 (and e!510673 mapRes!30166))))

(declare-fun condMapEmpty!30166 () Bool)

(declare-fun mapDefault!30166 () ValueCell!9000)

(assert (=> b!910740 (= condMapEmpty!30166 (= (arr!25925 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9000)) mapDefault!30166)))))

(declare-fun b!910741 () Bool)

(declare-fun res!614535 () Bool)

(assert (=> b!910741 (=> (not res!614535) (not e!510675))))

(declare-datatypes ((List!18210 0))(
  ( (Nil!18207) (Cons!18206 (h!19352 (_ BitVec 64)) (t!25795 List!18210)) )
))
(declare-fun arrayNoDuplicates!0 (array!53940 (_ BitVec 32) List!18210) Bool)

(assert (=> b!910741 (= res!614535 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18207))))

(declare-fun mapIsEmpty!30166 () Bool)

(assert (=> mapIsEmpty!30166 mapRes!30166))

(declare-fun b!910742 () Bool)

(assert (=> b!910742 (= e!510672 tp_is_empty!18963)))

(declare-fun b!910743 () Bool)

(declare-fun res!614532 () Bool)

(assert (=> b!910743 (=> (not res!614532) (not e!510675))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53940 (_ BitVec 32)) Bool)

(assert (=> b!910743 (= res!614532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(assert (= (and start!78018 res!614533) b!910739))

(assert (= (and b!910739 res!614534) b!910743))

(assert (= (and b!910743 res!614532) b!910741))

(assert (= (and b!910741 res!614535) b!910737))

(assert (= (and b!910740 condMapEmpty!30166) mapIsEmpty!30166))

(assert (= (and b!910740 (not condMapEmpty!30166)) mapNonEmpty!30166))

(get-info :version)

(assert (= (and mapNonEmpty!30166 ((_ is ValueCellFull!9000) mapValue!30166)) b!910742))

(assert (= (and b!910740 ((_ is ValueCellFull!9000) mapDefault!30166)) b!910738))

(assert (= start!78018 b!910740))

(declare-fun m!845665 () Bool)

(assert (=> b!910737 m!845665))

(assert (=> b!910737 m!845665))

(declare-fun m!845667 () Bool)

(assert (=> b!910737 m!845667))

(declare-fun m!845669 () Bool)

(assert (=> b!910741 m!845669))

(declare-fun m!845671 () Bool)

(assert (=> start!78018 m!845671))

(declare-fun m!845673 () Bool)

(assert (=> start!78018 m!845673))

(declare-fun m!845675 () Bool)

(assert (=> start!78018 m!845675))

(declare-fun m!845677 () Bool)

(assert (=> b!910743 m!845677))

(declare-fun m!845679 () Bool)

(assert (=> mapNonEmpty!30166 m!845679))

(check-sat (not start!78018) b_and!27117 (not b!910743) (not b_next!16545) (not b!910741) (not b!910737) tp_is_empty!18963 (not mapNonEmpty!30166))
(check-sat b_and!27117 (not b_next!16545))
