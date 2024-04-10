; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43250 () Bool)

(assert start!43250)

(declare-fun b_free!12117 () Bool)

(declare-fun b_next!12117 () Bool)

(assert (=> start!43250 (= b_free!12117 (not b_next!12117))))

(declare-fun tp!42622 () Bool)

(declare-fun b_and!20869 () Bool)

(assert (=> start!43250 (= tp!42622 b_and!20869)))

(declare-fun b!479195 () Bool)

(declare-fun e!281895 () Bool)

(assert (=> b!479195 (= e!281895 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((V!19243 0))(
  ( (V!19244 (val!6862 Int)) )
))
(declare-fun minValue!1458 () V!19243)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19243)

(declare-datatypes ((ValueCell!6453 0))(
  ( (ValueCellFull!6453 (v!9151 V!19243)) (EmptyCell!6453) )
))
(declare-datatypes ((array!30931 0))(
  ( (array!30932 (arr!14872 (Array (_ BitVec 32) ValueCell!6453)) (size!15230 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30931)

(declare-fun lt!217828 () Bool)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((array!30933 0))(
  ( (array!30934 (arr!14873 (Array (_ BitVec 32) (_ BitVec 64))) (size!15231 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30933)

(declare-datatypes ((tuple2!9004 0))(
  ( (tuple2!9005 (_1!4513 (_ BitVec 64)) (_2!4513 V!19243)) )
))
(declare-datatypes ((List!9083 0))(
  ( (Nil!9080) (Cons!9079 (h!9935 tuple2!9004) (t!15289 List!9083)) )
))
(declare-datatypes ((ListLongMap!7917 0))(
  ( (ListLongMap!7918 (toList!3974 List!9083)) )
))
(declare-fun contains!2584 (ListLongMap!7917 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2293 (array!30933 array!30931 (_ BitVec 32) (_ BitVec 32) V!19243 V!19243 (_ BitVec 32) Int) ListLongMap!7917)

(assert (=> b!479195 (= lt!217828 (contains!2584 (getCurrentListMap!2293 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun mapIsEmpty!22141 () Bool)

(declare-fun mapRes!22141 () Bool)

(assert (=> mapIsEmpty!22141 mapRes!22141))

(declare-fun res!285851 () Bool)

(assert (=> start!43250 (=> (not res!285851) (not e!281895))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43250 (= res!285851 (validMask!0 mask!2352))))

(assert (=> start!43250 e!281895))

(assert (=> start!43250 true))

(declare-fun tp_is_empty!13629 () Bool)

(assert (=> start!43250 tp_is_empty!13629))

(declare-fun e!281894 () Bool)

(declare-fun array_inv!10730 (array!30931) Bool)

(assert (=> start!43250 (and (array_inv!10730 _values!1516) e!281894)))

(assert (=> start!43250 tp!42622))

(declare-fun array_inv!10731 (array!30933) Bool)

(assert (=> start!43250 (array_inv!10731 _keys!1874)))

(declare-fun mapNonEmpty!22141 () Bool)

(declare-fun tp!42621 () Bool)

(declare-fun e!281893 () Bool)

(assert (=> mapNonEmpty!22141 (= mapRes!22141 (and tp!42621 e!281893))))

(declare-fun mapRest!22141 () (Array (_ BitVec 32) ValueCell!6453))

(declare-fun mapValue!22141 () ValueCell!6453)

(declare-fun mapKey!22141 () (_ BitVec 32))

(assert (=> mapNonEmpty!22141 (= (arr!14872 _values!1516) (store mapRest!22141 mapKey!22141 mapValue!22141))))

(declare-fun b!479196 () Bool)

(declare-fun e!281891 () Bool)

(assert (=> b!479196 (= e!281891 tp_is_empty!13629)))

(declare-fun b!479197 () Bool)

(declare-fun res!285850 () Bool)

(assert (=> b!479197 (=> (not res!285850) (not e!281895))))

(declare-datatypes ((List!9084 0))(
  ( (Nil!9081) (Cons!9080 (h!9936 (_ BitVec 64)) (t!15290 List!9084)) )
))
(declare-fun arrayNoDuplicates!0 (array!30933 (_ BitVec 32) List!9084) Bool)

(assert (=> b!479197 (= res!285850 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9081))))

(declare-fun b!479198 () Bool)

(declare-fun res!285849 () Bool)

(assert (=> b!479198 (=> (not res!285849) (not e!281895))))

(assert (=> b!479198 (= res!285849 (and (= (size!15230 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15231 _keys!1874) (size!15230 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!479199 () Bool)

(declare-fun res!285852 () Bool)

(assert (=> b!479199 (=> (not res!285852) (not e!281895))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30933 (_ BitVec 32)) Bool)

(assert (=> b!479199 (= res!285852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!479200 () Bool)

(assert (=> b!479200 (= e!281894 (and e!281891 mapRes!22141))))

(declare-fun condMapEmpty!22141 () Bool)

(declare-fun mapDefault!22141 () ValueCell!6453)

(assert (=> b!479200 (= condMapEmpty!22141 (= (arr!14872 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6453)) mapDefault!22141)))))

(declare-fun b!479201 () Bool)

(assert (=> b!479201 (= e!281893 tp_is_empty!13629)))

(assert (= (and start!43250 res!285851) b!479198))

(assert (= (and b!479198 res!285849) b!479199))

(assert (= (and b!479199 res!285852) b!479197))

(assert (= (and b!479197 res!285850) b!479195))

(assert (= (and b!479200 condMapEmpty!22141) mapIsEmpty!22141))

(assert (= (and b!479200 (not condMapEmpty!22141)) mapNonEmpty!22141))

(get-info :version)

(assert (= (and mapNonEmpty!22141 ((_ is ValueCellFull!6453) mapValue!22141)) b!479201))

(assert (= (and b!479200 ((_ is ValueCellFull!6453) mapDefault!22141)) b!479196))

(assert (= start!43250 b!479200))

(declare-fun m!461199 () Bool)

(assert (=> b!479197 m!461199))

(declare-fun m!461201 () Bool)

(assert (=> start!43250 m!461201))

(declare-fun m!461203 () Bool)

(assert (=> start!43250 m!461203))

(declare-fun m!461205 () Bool)

(assert (=> start!43250 m!461205))

(declare-fun m!461207 () Bool)

(assert (=> mapNonEmpty!22141 m!461207))

(declare-fun m!461209 () Bool)

(assert (=> b!479195 m!461209))

(assert (=> b!479195 m!461209))

(declare-fun m!461211 () Bool)

(assert (=> b!479195 m!461211))

(declare-fun m!461213 () Bool)

(assert (=> b!479199 m!461213))

(check-sat tp_is_empty!13629 (not b_next!12117) b_and!20869 (not b!479195) (not b!479197) (not mapNonEmpty!22141) (not start!43250) (not b!479199))
(check-sat b_and!20869 (not b_next!12117))
