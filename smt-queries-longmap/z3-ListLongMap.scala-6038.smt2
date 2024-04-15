; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78110 () Bool)

(assert start!78110)

(declare-fun b_free!16639 () Bool)

(declare-fun b_next!16639 () Bool)

(assert (=> start!78110 (= b_free!16639 (not b_next!16639))))

(declare-fun tp!58192 () Bool)

(declare-fun b_and!27187 () Bool)

(assert (=> start!78110 (= tp!58192 b_and!27187)))

(declare-fun res!615050 () Bool)

(declare-fun e!511302 () Bool)

(assert (=> start!78110 (=> (not res!615050) (not e!511302))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78110 (= res!615050 (validMask!0 mask!1756))))

(assert (=> start!78110 e!511302))

(declare-datatypes ((V!30375 0))(
  ( (V!30376 (val!9579 Int)) )
))
(declare-datatypes ((ValueCell!9047 0))(
  ( (ValueCellFull!9047 (v!12088 V!30375)) (EmptyCell!9047) )
))
(declare-datatypes ((array!54113 0))(
  ( (array!54114 (arr!26012 (Array (_ BitVec 32) ValueCell!9047)) (size!26473 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54113)

(declare-fun e!511303 () Bool)

(declare-fun array_inv!20398 (array!54113) Bool)

(assert (=> start!78110 (and (array_inv!20398 _values!1152) e!511303)))

(assert (=> start!78110 tp!58192))

(assert (=> start!78110 true))

(declare-fun tp_is_empty!19057 () Bool)

(assert (=> start!78110 tp_is_empty!19057))

(declare-datatypes ((array!54115 0))(
  ( (array!54116 (arr!26013 (Array (_ BitVec 32) (_ BitVec 64))) (size!26474 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54115)

(declare-fun array_inv!20399 (array!54115) Bool)

(assert (=> start!78110 (array_inv!20399 _keys!1386)))

(declare-fun mapNonEmpty!30310 () Bool)

(declare-fun mapRes!30310 () Bool)

(declare-fun tp!58191 () Bool)

(declare-fun e!511300 () Bool)

(assert (=> mapNonEmpty!30310 (= mapRes!30310 (and tp!58191 e!511300))))

(declare-fun mapValue!30310 () ValueCell!9047)

(declare-fun mapKey!30310 () (_ BitVec 32))

(declare-fun mapRest!30310 () (Array (_ BitVec 32) ValueCell!9047))

(assert (=> mapNonEmpty!30310 (= (arr!26012 _values!1152) (store mapRest!30310 mapKey!30310 mapValue!30310))))

(declare-fun b!911612 () Bool)

(declare-fun res!615051 () Bool)

(assert (=> b!911612 (=> (not res!615051) (not e!511302))))

(declare-datatypes ((List!18304 0))(
  ( (Nil!18301) (Cons!18300 (h!19446 (_ BitVec 64)) (t!25882 List!18304)) )
))
(declare-fun arrayNoDuplicates!0 (array!54115 (_ BitVec 32) List!18304) Bool)

(assert (=> b!911612 (= res!615051 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18301))))

(declare-fun b!911613 () Bool)

(declare-fun res!615049 () Bool)

(assert (=> b!911613 (=> (not res!615049) (not e!511302))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54115 (_ BitVec 32)) Bool)

(assert (=> b!911613 (= res!615049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!911614 () Bool)

(declare-fun res!615052 () Bool)

(assert (=> b!911614 (=> (not res!615052) (not e!511302))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!911614 (= res!615052 (and (= (size!26473 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26474 _keys!1386) (size!26473 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!911615 () Bool)

(declare-fun e!511301 () Bool)

(assert (=> b!911615 (= e!511301 tp_is_empty!19057)))

(declare-fun b!911616 () Bool)

(assert (=> b!911616 (= e!511300 tp_is_empty!19057)))

(declare-fun b!911617 () Bool)

(assert (=> b!911617 (= e!511303 (and e!511301 mapRes!30310))))

(declare-fun condMapEmpty!30310 () Bool)

(declare-fun mapDefault!30310 () ValueCell!9047)

(assert (=> b!911617 (= condMapEmpty!30310 (= (arr!26012 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9047)) mapDefault!30310)))))

(declare-fun b!911618 () Bool)

(assert (=> b!911618 (= e!511302 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30375)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!410283 () Bool)

(declare-fun minValue!1094 () V!30375)

(declare-datatypes ((tuple2!12522 0))(
  ( (tuple2!12523 (_1!6272 (_ BitVec 64)) (_2!6272 V!30375)) )
))
(declare-datatypes ((List!18305 0))(
  ( (Nil!18302) (Cons!18301 (h!19447 tuple2!12522) (t!25883 List!18305)) )
))
(declare-datatypes ((ListLongMap!11209 0))(
  ( (ListLongMap!11210 (toList!5620 List!18305)) )
))
(declare-fun contains!4622 (ListLongMap!11209 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2822 (array!54115 array!54113 (_ BitVec 32) (_ BitVec 32) V!30375 V!30375 (_ BitVec 32) Int) ListLongMap!11209)

(assert (=> b!911618 (= lt!410283 (contains!4622 (getCurrentListMap!2822 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapIsEmpty!30310 () Bool)

(assert (=> mapIsEmpty!30310 mapRes!30310))

(assert (= (and start!78110 res!615050) b!911614))

(assert (= (and b!911614 res!615052) b!911613))

(assert (= (and b!911613 res!615049) b!911612))

(assert (= (and b!911612 res!615051) b!911618))

(assert (= (and b!911617 condMapEmpty!30310) mapIsEmpty!30310))

(assert (= (and b!911617 (not condMapEmpty!30310)) mapNonEmpty!30310))

(get-info :version)

(assert (= (and mapNonEmpty!30310 ((_ is ValueCellFull!9047) mapValue!30310)) b!911616))

(assert (= (and b!911617 ((_ is ValueCellFull!9047) mapDefault!30310)) b!911615))

(assert (= start!78110 b!911617))

(declare-fun m!845745 () Bool)

(assert (=> b!911618 m!845745))

(assert (=> b!911618 m!845745))

(declare-fun m!845747 () Bool)

(assert (=> b!911618 m!845747))

(declare-fun m!845749 () Bool)

(assert (=> mapNonEmpty!30310 m!845749))

(declare-fun m!845751 () Bool)

(assert (=> b!911612 m!845751))

(declare-fun m!845753 () Bool)

(assert (=> start!78110 m!845753))

(declare-fun m!845755 () Bool)

(assert (=> start!78110 m!845755))

(declare-fun m!845757 () Bool)

(assert (=> start!78110 m!845757))

(declare-fun m!845759 () Bool)

(assert (=> b!911613 m!845759))

(check-sat (not start!78110) tp_is_empty!19057 (not b!911613) b_and!27187 (not b!911612) (not mapNonEmpty!30310) (not b_next!16639) (not b!911618))
(check-sat b_and!27187 (not b_next!16639))
