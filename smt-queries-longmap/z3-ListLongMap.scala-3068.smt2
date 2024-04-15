; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43246 () Bool)

(assert start!43246)

(declare-fun b_free!12127 () Bool)

(declare-fun b_next!12127 () Bool)

(assert (=> start!43246 (= b_free!12127 (not b_next!12127))))

(declare-fun tp!42652 () Bool)

(declare-fun b_and!20853 () Bool)

(assert (=> start!43246 (= tp!42652 b_and!20853)))

(declare-fun b!479029 () Bool)

(declare-fun res!285783 () Bool)

(declare-fun e!281792 () Bool)

(assert (=> b!479029 (=> (not res!285783) (not e!281792))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!30943 0))(
  ( (array!30944 (arr!14878 (Array (_ BitVec 32) (_ BitVec 64))) (size!15237 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30943)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19257 0))(
  ( (V!19258 (val!6867 Int)) )
))
(declare-datatypes ((ValueCell!6458 0))(
  ( (ValueCellFull!6458 (v!9150 V!19257)) (EmptyCell!6458) )
))
(declare-datatypes ((array!30945 0))(
  ( (array!30946 (arr!14879 (Array (_ BitVec 32) ValueCell!6458)) (size!15238 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30945)

(assert (=> b!479029 (= res!285783 (and (= (size!15238 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15237 _keys!1874) (size!15238 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!479030 () Bool)

(declare-fun res!285782 () Bool)

(assert (=> b!479030 (=> (not res!285782) (not e!281792))))

(declare-datatypes ((List!9134 0))(
  ( (Nil!9131) (Cons!9130 (h!9986 (_ BitVec 64)) (t!15331 List!9134)) )
))
(declare-fun arrayNoDuplicates!0 (array!30943 (_ BitVec 32) List!9134) Bool)

(assert (=> b!479030 (= res!285782 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9131))))

(declare-fun b!479031 () Bool)

(declare-fun e!281794 () Bool)

(declare-fun e!281796 () Bool)

(declare-fun mapRes!22156 () Bool)

(assert (=> b!479031 (= e!281794 (and e!281796 mapRes!22156))))

(declare-fun condMapEmpty!22156 () Bool)

(declare-fun mapDefault!22156 () ValueCell!6458)

(assert (=> b!479031 (= condMapEmpty!22156 (= (arr!14879 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6458)) mapDefault!22156)))))

(declare-fun b!479032 () Bool)

(declare-fun res!285780 () Bool)

(assert (=> b!479032 (=> (not res!285780) (not e!281792))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30943 (_ BitVec 32)) Bool)

(assert (=> b!479032 (= res!285780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!479033 () Bool)

(declare-fun e!281795 () Bool)

(declare-fun tp_is_empty!13639 () Bool)

(assert (=> b!479033 (= e!281795 tp_is_empty!13639)))

(declare-fun res!285781 () Bool)

(assert (=> start!43246 (=> (not res!285781) (not e!281792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43246 (= res!285781 (validMask!0 mask!2352))))

(assert (=> start!43246 e!281792))

(assert (=> start!43246 true))

(assert (=> start!43246 tp_is_empty!13639))

(declare-fun array_inv!10826 (array!30945) Bool)

(assert (=> start!43246 (and (array_inv!10826 _values!1516) e!281794)))

(assert (=> start!43246 tp!42652))

(declare-fun array_inv!10827 (array!30943) Bool)

(assert (=> start!43246 (array_inv!10827 _keys!1874)))

(declare-fun b!479034 () Bool)

(assert (=> b!479034 (= e!281796 tp_is_empty!13639)))

(declare-fun mapNonEmpty!22156 () Bool)

(declare-fun tp!42651 () Bool)

(assert (=> mapNonEmpty!22156 (= mapRes!22156 (and tp!42651 e!281795))))

(declare-fun mapValue!22156 () ValueCell!6458)

(declare-fun mapRest!22156 () (Array (_ BitVec 32) ValueCell!6458))

(declare-fun mapKey!22156 () (_ BitVec 32))

(assert (=> mapNonEmpty!22156 (= (arr!14879 _values!1516) (store mapRest!22156 mapKey!22156 mapValue!22156))))

(declare-fun mapIsEmpty!22156 () Bool)

(assert (=> mapIsEmpty!22156 mapRes!22156))

(declare-fun b!479035 () Bool)

(assert (=> b!479035 (= e!281792 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun lt!217609 () Bool)

(declare-fun zeroValue!1458 () V!19257)

(declare-fun minValue!1458 () V!19257)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9074 0))(
  ( (tuple2!9075 (_1!4548 (_ BitVec 64)) (_2!4548 V!19257)) )
))
(declare-datatypes ((List!9135 0))(
  ( (Nil!9132) (Cons!9131 (h!9987 tuple2!9074) (t!15332 List!9135)) )
))
(declare-datatypes ((ListLongMap!7977 0))(
  ( (ListLongMap!7978 (toList!4004 List!9135)) )
))
(declare-fun contains!2579 (ListLongMap!7977 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2257 (array!30943 array!30945 (_ BitVec 32) (_ BitVec 32) V!19257 V!19257 (_ BitVec 32) Int) ListLongMap!7977)

(assert (=> b!479035 (= lt!217609 (contains!2579 (getCurrentListMap!2257 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(assert (= (and start!43246 res!285781) b!479029))

(assert (= (and b!479029 res!285783) b!479032))

(assert (= (and b!479032 res!285780) b!479030))

(assert (= (and b!479030 res!285782) b!479035))

(assert (= (and b!479031 condMapEmpty!22156) mapIsEmpty!22156))

(assert (= (and b!479031 (not condMapEmpty!22156)) mapNonEmpty!22156))

(get-info :version)

(assert (= (and mapNonEmpty!22156 ((_ is ValueCellFull!6458) mapValue!22156)) b!479033))

(assert (= (and b!479031 ((_ is ValueCellFull!6458) mapDefault!22156)) b!479034))

(assert (= start!43246 b!479031))

(declare-fun m!460545 () Bool)

(assert (=> b!479032 m!460545))

(declare-fun m!460547 () Bool)

(assert (=> mapNonEmpty!22156 m!460547))

(declare-fun m!460549 () Bool)

(assert (=> start!43246 m!460549))

(declare-fun m!460551 () Bool)

(assert (=> start!43246 m!460551))

(declare-fun m!460553 () Bool)

(assert (=> start!43246 m!460553))

(declare-fun m!460555 () Bool)

(assert (=> b!479035 m!460555))

(assert (=> b!479035 m!460555))

(declare-fun m!460557 () Bool)

(assert (=> b!479035 m!460557))

(declare-fun m!460559 () Bool)

(assert (=> b!479030 m!460559))

(check-sat (not b!479030) (not b_next!12127) tp_is_empty!13639 (not mapNonEmpty!22156) (not b!479035) (not b!479032) b_and!20853 (not start!43246))
(check-sat b_and!20853 (not b_next!12127))
