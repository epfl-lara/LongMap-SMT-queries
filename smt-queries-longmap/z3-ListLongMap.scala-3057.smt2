; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43186 () Bool)

(assert start!43186)

(declare-fun res!285579 () Bool)

(declare-fun e!281462 () Bool)

(assert (=> start!43186 (=> (not res!285579) (not e!281462))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43186 (= res!285579 (validMask!0 mask!2352))))

(assert (=> start!43186 e!281462))

(assert (=> start!43186 true))

(declare-datatypes ((V!19171 0))(
  ( (V!19172 (val!6835 Int)) )
))
(declare-datatypes ((ValueCell!6426 0))(
  ( (ValueCellFull!6426 (v!9124 V!19171)) (EmptyCell!6426) )
))
(declare-datatypes ((array!30827 0))(
  ( (array!30828 (arr!14821 (Array (_ BitVec 32) ValueCell!6426)) (size!15179 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30827)

(declare-fun e!281461 () Bool)

(declare-fun array_inv!10692 (array!30827) Bool)

(assert (=> start!43186 (and (array_inv!10692 _values!1516) e!281461)))

(declare-datatypes ((array!30829 0))(
  ( (array!30830 (arr!14822 (Array (_ BitVec 32) (_ BitVec 64))) (size!15180 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30829)

(declare-fun array_inv!10693 (array!30829) Bool)

(assert (=> start!43186 (array_inv!10693 _keys!1874)))

(declare-fun b!478660 () Bool)

(declare-fun e!281463 () Bool)

(declare-fun tp_is_empty!13575 () Bool)

(assert (=> b!478660 (= e!281463 tp_is_empty!13575)))

(declare-fun b!478661 () Bool)

(assert (=> b!478661 (= e!281462 false)))

(declare-fun lt!217747 () Bool)

(declare-datatypes ((List!9064 0))(
  ( (Nil!9061) (Cons!9060 (h!9916 (_ BitVec 64)) (t!15270 List!9064)) )
))
(declare-fun arrayNoDuplicates!0 (array!30829 (_ BitVec 32) List!9064) Bool)

(assert (=> b!478661 (= lt!217747 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9061))))

(declare-fun b!478662 () Bool)

(declare-fun e!281459 () Bool)

(declare-fun mapRes!22057 () Bool)

(assert (=> b!478662 (= e!281461 (and e!281459 mapRes!22057))))

(declare-fun condMapEmpty!22057 () Bool)

(declare-fun mapDefault!22057 () ValueCell!6426)

(assert (=> b!478662 (= condMapEmpty!22057 (= (arr!14821 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6426)) mapDefault!22057)))))

(declare-fun b!478663 () Bool)

(assert (=> b!478663 (= e!281459 tp_is_empty!13575)))

(declare-fun mapIsEmpty!22057 () Bool)

(assert (=> mapIsEmpty!22057 mapRes!22057))

(declare-fun mapNonEmpty!22057 () Bool)

(declare-fun tp!42532 () Bool)

(assert (=> mapNonEmpty!22057 (= mapRes!22057 (and tp!42532 e!281463))))

(declare-fun mapRest!22057 () (Array (_ BitVec 32) ValueCell!6426))

(declare-fun mapKey!22057 () (_ BitVec 32))

(declare-fun mapValue!22057 () ValueCell!6426)

(assert (=> mapNonEmpty!22057 (= (arr!14821 _values!1516) (store mapRest!22057 mapKey!22057 mapValue!22057))))

(declare-fun b!478664 () Bool)

(declare-fun res!285577 () Bool)

(assert (=> b!478664 (=> (not res!285577) (not e!281462))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30829 (_ BitVec 32)) Bool)

(assert (=> b!478664 (= res!285577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!478665 () Bool)

(declare-fun res!285578 () Bool)

(assert (=> b!478665 (=> (not res!285578) (not e!281462))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478665 (= res!285578 (and (= (size!15179 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15180 _keys!1874) (size!15179 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(assert (= (and start!43186 res!285579) b!478665))

(assert (= (and b!478665 res!285578) b!478664))

(assert (= (and b!478664 res!285577) b!478661))

(assert (= (and b!478662 condMapEmpty!22057) mapIsEmpty!22057))

(assert (= (and b!478662 (not condMapEmpty!22057)) mapNonEmpty!22057))

(get-info :version)

(assert (= (and mapNonEmpty!22057 ((_ is ValueCellFull!6426) mapValue!22057)) b!478660))

(assert (= (and b!478662 ((_ is ValueCellFull!6426) mapDefault!22057)) b!478663))

(assert (= start!43186 b!478662))

(declare-fun m!460853 () Bool)

(assert (=> start!43186 m!460853))

(declare-fun m!460855 () Bool)

(assert (=> start!43186 m!460855))

(declare-fun m!460857 () Bool)

(assert (=> start!43186 m!460857))

(declare-fun m!460859 () Bool)

(assert (=> b!478661 m!460859))

(declare-fun m!460861 () Bool)

(assert (=> mapNonEmpty!22057 m!460861))

(declare-fun m!460863 () Bool)

(assert (=> b!478664 m!460863))

(check-sat tp_is_empty!13575 (not b!478661) (not b!478664) (not start!43186) (not mapNonEmpty!22057))
(check-sat)
