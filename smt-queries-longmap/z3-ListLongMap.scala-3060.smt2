; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43188 () Bool)

(assert start!43188)

(declare-fun b!478533 () Bool)

(declare-fun res!285520 () Bool)

(declare-fun e!281406 () Bool)

(assert (=> b!478533 (=> (not res!285520) (not e!281406))))

(declare-datatypes ((array!30851 0))(
  ( (array!30852 (arr!14833 (Array (_ BitVec 32) (_ BitVec 64))) (size!15192 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30851)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30851 (_ BitVec 32)) Bool)

(assert (=> b!478533 (= res!285520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun mapIsEmpty!22081 () Bool)

(declare-fun mapRes!22081 () Bool)

(assert (=> mapIsEmpty!22081 mapRes!22081))

(declare-fun b!478534 () Bool)

(assert (=> b!478534 (= e!281406 false)))

(declare-fun lt!217537 () Bool)

(declare-datatypes ((List!9114 0))(
  ( (Nil!9111) (Cons!9110 (h!9966 (_ BitVec 64)) (t!15311 List!9114)) )
))
(declare-fun arrayNoDuplicates!0 (array!30851 (_ BitVec 32) List!9114) Bool)

(assert (=> b!478534 (= lt!217537 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9111))))

(declare-fun b!478535 () Bool)

(declare-fun e!281409 () Bool)

(declare-fun tp_is_empty!13591 () Bool)

(assert (=> b!478535 (= e!281409 tp_is_empty!13591)))

(declare-fun res!285521 () Bool)

(assert (=> start!43188 (=> (not res!285521) (not e!281406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43188 (= res!285521 (validMask!0 mask!2352))))

(assert (=> start!43188 e!281406))

(assert (=> start!43188 true))

(declare-datatypes ((V!19193 0))(
  ( (V!19194 (val!6843 Int)) )
))
(declare-datatypes ((ValueCell!6434 0))(
  ( (ValueCellFull!6434 (v!9126 V!19193)) (EmptyCell!6434) )
))
(declare-datatypes ((array!30853 0))(
  ( (array!30854 (arr!14834 (Array (_ BitVec 32) ValueCell!6434)) (size!15193 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30853)

(declare-fun e!281405 () Bool)

(declare-fun array_inv!10792 (array!30853) Bool)

(assert (=> start!43188 (and (array_inv!10792 _values!1516) e!281405)))

(declare-fun array_inv!10793 (array!30851) Bool)

(assert (=> start!43188 (array_inv!10793 _keys!1874)))

(declare-fun b!478536 () Bool)

(declare-fun e!281408 () Bool)

(assert (=> b!478536 (= e!281408 tp_is_empty!13591)))

(declare-fun b!478537 () Bool)

(assert (=> b!478537 (= e!281405 (and e!281409 mapRes!22081))))

(declare-fun condMapEmpty!22081 () Bool)

(declare-fun mapDefault!22081 () ValueCell!6434)

(assert (=> b!478537 (= condMapEmpty!22081 (= (arr!14834 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6434)) mapDefault!22081)))))

(declare-fun mapNonEmpty!22081 () Bool)

(declare-fun tp!42556 () Bool)

(assert (=> mapNonEmpty!22081 (= mapRes!22081 (and tp!42556 e!281408))))

(declare-fun mapValue!22081 () ValueCell!6434)

(declare-fun mapKey!22081 () (_ BitVec 32))

(declare-fun mapRest!22081 () (Array (_ BitVec 32) ValueCell!6434))

(assert (=> mapNonEmpty!22081 (= (arr!14834 _values!1516) (store mapRest!22081 mapKey!22081 mapValue!22081))))

(declare-fun b!478538 () Bool)

(declare-fun res!285522 () Bool)

(assert (=> b!478538 (=> (not res!285522) (not e!281406))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478538 (= res!285522 (and (= (size!15193 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15192 _keys!1874) (size!15193 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(assert (= (and start!43188 res!285521) b!478538))

(assert (= (and b!478538 res!285522) b!478533))

(assert (= (and b!478533 res!285520) b!478534))

(assert (= (and b!478537 condMapEmpty!22081) mapIsEmpty!22081))

(assert (= (and b!478537 (not condMapEmpty!22081)) mapNonEmpty!22081))

(get-info :version)

(assert (= (and mapNonEmpty!22081 ((_ is ValueCellFull!6434) mapValue!22081)) b!478536))

(assert (= (and b!478537 ((_ is ValueCellFull!6434) mapDefault!22081)) b!478535))

(assert (= start!43188 b!478537))

(declare-fun m!460215 () Bool)

(assert (=> b!478533 m!460215))

(declare-fun m!460217 () Bool)

(assert (=> b!478534 m!460217))

(declare-fun m!460219 () Bool)

(assert (=> start!43188 m!460219))

(declare-fun m!460221 () Bool)

(assert (=> start!43188 m!460221))

(declare-fun m!460223 () Bool)

(assert (=> start!43188 m!460223))

(declare-fun m!460225 () Bool)

(assert (=> mapNonEmpty!22081 m!460225))

(check-sat (not b!478533) (not b!478534) tp_is_empty!13591 (not mapNonEmpty!22081) (not start!43188))
(check-sat)
