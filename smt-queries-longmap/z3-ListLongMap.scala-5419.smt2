; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72280 () Bool)

(assert start!72280)

(declare-fun mapNonEmpty!24623 () Bool)

(declare-fun mapRes!24623 () Bool)

(declare-fun tp!47618 () Bool)

(declare-fun e!467381 () Bool)

(assert (=> mapNonEmpty!24623 (= mapRes!24623 (and tp!47618 e!467381))))

(declare-fun mapKey!24623 () (_ BitVec 32))

(declare-datatypes ((V!25513 0))(
  ( (V!25514 (val!7722 Int)) )
))
(declare-datatypes ((ValueCell!7235 0))(
  ( (ValueCellFull!7235 (v!10141 V!25513)) (EmptyCell!7235) )
))
(declare-fun mapValue!24623 () ValueCell!7235)

(declare-fun mapRest!24623 () (Array (_ BitVec 32) ValueCell!7235))

(declare-datatypes ((array!46965 0))(
  ( (array!46966 (arr!22514 (Array (_ BitVec 32) ValueCell!7235)) (size!22956 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46965)

(assert (=> mapNonEmpty!24623 (= (arr!22514 _values!688) (store mapRest!24623 mapKey!24623 mapValue!24623))))

(declare-fun b!837412 () Bool)

(declare-fun res!569559 () Bool)

(declare-fun e!467382 () Bool)

(assert (=> b!837412 (=> (not res!569559) (not e!467382))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!46967 0))(
  ( (array!46968 (arr!22515 (Array (_ BitVec 32) (_ BitVec 64))) (size!22957 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46967)

(assert (=> b!837412 (= res!569559 (and (= (size!22956 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22957 _keys!868) (size!22956 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!837413 () Bool)

(declare-fun res!569558 () Bool)

(assert (=> b!837413 (=> (not res!569558) (not e!467382))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837413 (= res!569558 (validMask!0 mask!1196))))

(declare-fun b!837414 () Bool)

(declare-fun tp_is_empty!15349 () Bool)

(assert (=> b!837414 (= e!467381 tp_is_empty!15349)))

(declare-fun mapIsEmpty!24623 () Bool)

(assert (=> mapIsEmpty!24623 mapRes!24623))

(declare-fun b!837415 () Bool)

(declare-fun e!467384 () Bool)

(assert (=> b!837415 (= e!467384 tp_is_empty!15349)))

(declare-fun b!837411 () Bool)

(declare-fun res!569556 () Bool)

(assert (=> b!837411 (=> (not res!569556) (not e!467382))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46967 (_ BitVec 32)) Bool)

(assert (=> b!837411 (= res!569556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!569557 () Bool)

(assert (=> start!72280 (=> (not res!569557) (not e!467382))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72280 (= res!569557 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22957 _keys!868))))))

(assert (=> start!72280 e!467382))

(assert (=> start!72280 true))

(declare-fun array_inv!18010 (array!46967) Bool)

(assert (=> start!72280 (array_inv!18010 _keys!868)))

(declare-fun e!467385 () Bool)

(declare-fun array_inv!18011 (array!46965) Bool)

(assert (=> start!72280 (and (array_inv!18011 _values!688) e!467385)))

(declare-fun b!837416 () Bool)

(assert (=> b!837416 (= e!467382 false)))

(declare-fun lt!380354 () Bool)

(declare-datatypes ((List!16032 0))(
  ( (Nil!16029) (Cons!16028 (h!17159 (_ BitVec 64)) (t!22394 List!16032)) )
))
(declare-fun arrayNoDuplicates!0 (array!46967 (_ BitVec 32) List!16032) Bool)

(assert (=> b!837416 (= lt!380354 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16029))))

(declare-fun b!837417 () Bool)

(assert (=> b!837417 (= e!467385 (and e!467384 mapRes!24623))))

(declare-fun condMapEmpty!24623 () Bool)

(declare-fun mapDefault!24623 () ValueCell!7235)

(assert (=> b!837417 (= condMapEmpty!24623 (= (arr!22514 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7235)) mapDefault!24623)))))

(assert (= (and start!72280 res!569557) b!837413))

(assert (= (and b!837413 res!569558) b!837412))

(assert (= (and b!837412 res!569559) b!837411))

(assert (= (and b!837411 res!569556) b!837416))

(assert (= (and b!837417 condMapEmpty!24623) mapIsEmpty!24623))

(assert (= (and b!837417 (not condMapEmpty!24623)) mapNonEmpty!24623))

(get-info :version)

(assert (= (and mapNonEmpty!24623 ((_ is ValueCellFull!7235) mapValue!24623)) b!837414))

(assert (= (and b!837417 ((_ is ValueCellFull!7235) mapDefault!24623)) b!837415))

(assert (= start!72280 b!837417))

(declare-fun m!781655 () Bool)

(assert (=> start!72280 m!781655))

(declare-fun m!781657 () Bool)

(assert (=> start!72280 m!781657))

(declare-fun m!781659 () Bool)

(assert (=> b!837413 m!781659))

(declare-fun m!781661 () Bool)

(assert (=> mapNonEmpty!24623 m!781661))

(declare-fun m!781663 () Bool)

(assert (=> b!837416 m!781663))

(declare-fun m!781665 () Bool)

(assert (=> b!837411 m!781665))

(check-sat (not mapNonEmpty!24623) (not b!837411) (not b!837413) (not b!837416) (not start!72280) tp_is_empty!15349)
(check-sat)
