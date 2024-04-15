; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78058 () Bool)

(assert start!78058)

(declare-fun b_free!16603 () Bool)

(declare-fun b_next!16603 () Bool)

(assert (=> start!78058 (= b_free!16603 (not b_next!16603))))

(declare-fun tp!58081 () Bool)

(declare-fun b_and!27149 () Bool)

(assert (=> start!78058 (= tp!58081 b_and!27149)))

(declare-fun mapIsEmpty!30253 () Bool)

(declare-fun mapRes!30253 () Bool)

(assert (=> mapIsEmpty!30253 mapRes!30253))

(declare-fun b!911107 () Bool)

(declare-fun e!510959 () Bool)

(declare-fun e!510962 () Bool)

(assert (=> b!911107 (= e!510959 (and e!510962 mapRes!30253))))

(declare-fun condMapEmpty!30253 () Bool)

(declare-datatypes ((V!30327 0))(
  ( (V!30328 (val!9561 Int)) )
))
(declare-datatypes ((ValueCell!9029 0))(
  ( (ValueCellFull!9029 (v!12069 V!30327)) (EmptyCell!9029) )
))
(declare-datatypes ((array!54043 0))(
  ( (array!54044 (arr!25978 (Array (_ BitVec 32) ValueCell!9029)) (size!26439 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54043)

(declare-fun mapDefault!30253 () ValueCell!9029)

(assert (=> b!911107 (= condMapEmpty!30253 (= (arr!25978 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9029)) mapDefault!30253)))))

(declare-fun mapNonEmpty!30253 () Bool)

(declare-fun tp!58080 () Bool)

(declare-fun e!510960 () Bool)

(assert (=> mapNonEmpty!30253 (= mapRes!30253 (and tp!58080 e!510960))))

(declare-fun mapValue!30253 () ValueCell!9029)

(declare-fun mapKey!30253 () (_ BitVec 32))

(declare-fun mapRest!30253 () (Array (_ BitVec 32) ValueCell!9029))

(assert (=> mapNonEmpty!30253 (= (arr!25978 _values!1152) (store mapRest!30253 mapKey!30253 mapValue!30253))))

(declare-fun b!911108 () Bool)

(declare-fun e!510961 () Bool)

(assert (=> b!911108 (= e!510961 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30327)

(declare-datatypes ((array!54045 0))(
  ( (array!54046 (arr!25979 (Array (_ BitVec 32) (_ BitVec 64))) (size!26440 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54045)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30327)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun lt!410151 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-datatypes ((tuple2!12494 0))(
  ( (tuple2!12495 (_1!6258 (_ BitVec 64)) (_2!6258 V!30327)) )
))
(declare-datatypes ((List!18277 0))(
  ( (Nil!18274) (Cons!18273 (h!19419 tuple2!12494) (t!25853 List!18277)) )
))
(declare-datatypes ((ListLongMap!11181 0))(
  ( (ListLongMap!11182 (toList!5606 List!18277)) )
))
(declare-fun contains!4607 (ListLongMap!11181 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2808 (array!54045 array!54043 (_ BitVec 32) (_ BitVec 32) V!30327 V!30327 (_ BitVec 32) Int) ListLongMap!11181)

(assert (=> b!911108 (= lt!410151 (contains!4607 (getCurrentListMap!2808 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!911109 () Bool)

(declare-fun tp_is_empty!19021 () Bool)

(assert (=> b!911109 (= e!510962 tp_is_empty!19021)))

(declare-fun b!911110 () Bool)

(declare-fun res!614770 () Bool)

(assert (=> b!911110 (=> (not res!614770) (not e!510961))))

(declare-datatypes ((List!18278 0))(
  ( (Nil!18275) (Cons!18274 (h!19420 (_ BitVec 64)) (t!25854 List!18278)) )
))
(declare-fun arrayNoDuplicates!0 (array!54045 (_ BitVec 32) List!18278) Bool)

(assert (=> b!911110 (= res!614770 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18275))))

(declare-fun b!911111 () Bool)

(declare-fun res!614772 () Bool)

(assert (=> b!911111 (=> (not res!614772) (not e!510961))))

(assert (=> b!911111 (= res!614772 (and (= (size!26439 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26440 _keys!1386) (size!26439 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!614773 () Bool)

(assert (=> start!78058 (=> (not res!614773) (not e!510961))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78058 (= res!614773 (validMask!0 mask!1756))))

(assert (=> start!78058 e!510961))

(declare-fun array_inv!20368 (array!54043) Bool)

(assert (=> start!78058 (and (array_inv!20368 _values!1152) e!510959)))

(assert (=> start!78058 tp!58081))

(assert (=> start!78058 true))

(assert (=> start!78058 tp_is_empty!19021))

(declare-fun array_inv!20369 (array!54045) Bool)

(assert (=> start!78058 (array_inv!20369 _keys!1386)))

(declare-fun b!911112 () Bool)

(declare-fun res!614771 () Bool)

(assert (=> b!911112 (=> (not res!614771) (not e!510961))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54045 (_ BitVec 32)) Bool)

(assert (=> b!911112 (= res!614771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!911113 () Bool)

(assert (=> b!911113 (= e!510960 tp_is_empty!19021)))

(assert (= (and start!78058 res!614773) b!911111))

(assert (= (and b!911111 res!614772) b!911112))

(assert (= (and b!911112 res!614771) b!911110))

(assert (= (and b!911110 res!614770) b!911108))

(assert (= (and b!911107 condMapEmpty!30253) mapIsEmpty!30253))

(assert (= (and b!911107 (not condMapEmpty!30253)) mapNonEmpty!30253))

(get-info :version)

(assert (= (and mapNonEmpty!30253 ((_ is ValueCellFull!9029) mapValue!30253)) b!911113))

(assert (= (and b!911107 ((_ is ValueCellFull!9029) mapDefault!30253)) b!911109))

(assert (= start!78058 b!911107))

(declare-fun m!845371 () Bool)

(assert (=> b!911110 m!845371))

(declare-fun m!845373 () Bool)

(assert (=> start!78058 m!845373))

(declare-fun m!845375 () Bool)

(assert (=> start!78058 m!845375))

(declare-fun m!845377 () Bool)

(assert (=> start!78058 m!845377))

(declare-fun m!845379 () Bool)

(assert (=> b!911108 m!845379))

(assert (=> b!911108 m!845379))

(declare-fun m!845381 () Bool)

(assert (=> b!911108 m!845381))

(declare-fun m!845383 () Bool)

(assert (=> mapNonEmpty!30253 m!845383))

(declare-fun m!845385 () Bool)

(assert (=> b!911112 m!845385))

(check-sat (not b!911112) b_and!27149 (not mapNonEmpty!30253) (not b_next!16603) tp_is_empty!19021 (not b!911108) (not b!911110) (not start!78058))
(check-sat b_and!27149 (not b_next!16603))
