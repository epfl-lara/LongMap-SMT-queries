; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78016 () Bool)

(assert start!78016)

(declare-fun b_free!16561 () Bool)

(declare-fun b_next!16561 () Bool)

(assert (=> start!78016 (= b_free!16561 (not b_next!16561))))

(declare-fun tp!57954 () Bool)

(declare-fun b_and!27107 () Bool)

(assert (=> start!78016 (= tp!57954 b_and!27107)))

(declare-fun b!910666 () Bool)

(declare-fun res!614520 () Bool)

(declare-fun e!510645 () Bool)

(assert (=> b!910666 (=> (not res!614520) (not e!510645))))

(declare-datatypes ((V!30271 0))(
  ( (V!30272 (val!9540 Int)) )
))
(declare-datatypes ((ValueCell!9008 0))(
  ( (ValueCellFull!9008 (v!12048 V!30271)) (EmptyCell!9008) )
))
(declare-datatypes ((array!53963 0))(
  ( (array!53964 (arr!25938 (Array (_ BitVec 32) ValueCell!9008)) (size!26399 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53963)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53965 0))(
  ( (array!53966 (arr!25939 (Array (_ BitVec 32) (_ BitVec 64))) (size!26400 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53965)

(assert (=> b!910666 (= res!614520 (and (= (size!26399 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26400 _keys!1386) (size!26399 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910667 () Bool)

(declare-fun res!614521 () Bool)

(assert (=> b!910667 (=> (not res!614521) (not e!510645))))

(declare-datatypes ((List!18251 0))(
  ( (Nil!18248) (Cons!18247 (h!19393 (_ BitVec 64)) (t!25827 List!18251)) )
))
(declare-fun arrayNoDuplicates!0 (array!53965 (_ BitVec 32) List!18251) Bool)

(assert (=> b!910667 (= res!614521 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18248))))

(declare-fun mapIsEmpty!30190 () Bool)

(declare-fun mapRes!30190 () Bool)

(assert (=> mapIsEmpty!30190 mapRes!30190))

(declare-fun res!614518 () Bool)

(assert (=> start!78016 (=> (not res!614518) (not e!510645))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78016 (= res!614518 (validMask!0 mask!1756))))

(assert (=> start!78016 e!510645))

(declare-fun e!510643 () Bool)

(declare-fun array_inv!20336 (array!53963) Bool)

(assert (=> start!78016 (and (array_inv!20336 _values!1152) e!510643)))

(assert (=> start!78016 tp!57954))

(assert (=> start!78016 true))

(declare-fun tp_is_empty!18979 () Bool)

(assert (=> start!78016 tp_is_empty!18979))

(declare-fun array_inv!20337 (array!53965) Bool)

(assert (=> start!78016 (array_inv!20337 _keys!1386)))

(declare-fun b!910668 () Bool)

(declare-fun e!510647 () Bool)

(assert (=> b!910668 (= e!510647 tp_is_empty!18979)))

(declare-fun b!910669 () Bool)

(assert (=> b!910669 (= e!510645 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!410088 () Bool)

(declare-fun zeroValue!1094 () V!30271)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30271)

(declare-datatypes ((tuple2!12464 0))(
  ( (tuple2!12465 (_1!6243 (_ BitVec 64)) (_2!6243 V!30271)) )
))
(declare-datatypes ((List!18252 0))(
  ( (Nil!18249) (Cons!18248 (h!19394 tuple2!12464) (t!25828 List!18252)) )
))
(declare-datatypes ((ListLongMap!11151 0))(
  ( (ListLongMap!11152 (toList!5591 List!18252)) )
))
(declare-fun contains!4592 (ListLongMap!11151 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2793 (array!53965 array!53963 (_ BitVec 32) (_ BitVec 32) V!30271 V!30271 (_ BitVec 32) Int) ListLongMap!11151)

(assert (=> b!910669 (= lt!410088 (contains!4592 (getCurrentListMap!2793 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!910670 () Bool)

(declare-fun res!614519 () Bool)

(assert (=> b!910670 (=> (not res!614519) (not e!510645))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53965 (_ BitVec 32)) Bool)

(assert (=> b!910670 (= res!614519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!30190 () Bool)

(declare-fun tp!57955 () Bool)

(assert (=> mapNonEmpty!30190 (= mapRes!30190 (and tp!57955 e!510647))))

(declare-fun mapKey!30190 () (_ BitVec 32))

(declare-fun mapValue!30190 () ValueCell!9008)

(declare-fun mapRest!30190 () (Array (_ BitVec 32) ValueCell!9008))

(assert (=> mapNonEmpty!30190 (= (arr!25938 _values!1152) (store mapRest!30190 mapKey!30190 mapValue!30190))))

(declare-fun b!910671 () Bool)

(declare-fun e!510644 () Bool)

(assert (=> b!910671 (= e!510644 tp_is_empty!18979)))

(declare-fun b!910672 () Bool)

(assert (=> b!910672 (= e!510643 (and e!510644 mapRes!30190))))

(declare-fun condMapEmpty!30190 () Bool)

(declare-fun mapDefault!30190 () ValueCell!9008)

(assert (=> b!910672 (= condMapEmpty!30190 (= (arr!25938 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9008)) mapDefault!30190)))))

(assert (= (and start!78016 res!614518) b!910666))

(assert (= (and b!910666 res!614520) b!910670))

(assert (= (and b!910670 res!614519) b!910667))

(assert (= (and b!910667 res!614521) b!910669))

(assert (= (and b!910672 condMapEmpty!30190) mapIsEmpty!30190))

(assert (= (and b!910672 (not condMapEmpty!30190)) mapNonEmpty!30190))

(get-info :version)

(assert (= (and mapNonEmpty!30190 ((_ is ValueCellFull!9008) mapValue!30190)) b!910668))

(assert (= (and b!910672 ((_ is ValueCellFull!9008) mapDefault!30190)) b!910671))

(assert (= start!78016 b!910672))

(declare-fun m!845035 () Bool)

(assert (=> start!78016 m!845035))

(declare-fun m!845037 () Bool)

(assert (=> start!78016 m!845037))

(declare-fun m!845039 () Bool)

(assert (=> start!78016 m!845039))

(declare-fun m!845041 () Bool)

(assert (=> b!910667 m!845041))

(declare-fun m!845043 () Bool)

(assert (=> b!910670 m!845043))

(declare-fun m!845045 () Bool)

(assert (=> mapNonEmpty!30190 m!845045))

(declare-fun m!845047 () Bool)

(assert (=> b!910669 m!845047))

(assert (=> b!910669 m!845047))

(declare-fun m!845049 () Bool)

(assert (=> b!910669 m!845049))

(check-sat (not start!78016) (not b!910667) tp_is_empty!18979 (not b_next!16561) b_and!27107 (not mapNonEmpty!30190) (not b!910670) (not b!910669))
(check-sat b_and!27107 (not b_next!16561))
