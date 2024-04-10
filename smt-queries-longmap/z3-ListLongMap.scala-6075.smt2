; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78560 () Bool)

(assert start!78560)

(declare-fun b_free!16773 () Bool)

(declare-fun b_next!16773 () Bool)

(assert (=> start!78560 (= b_free!16773 (not b_next!16773))))

(declare-fun tp!58760 () Bool)

(declare-fun b_and!27395 () Bool)

(assert (=> start!78560 (= tp!58760 b_and!27395)))

(declare-fun b!915769 () Bool)

(declare-fun res!617392 () Bool)

(declare-fun e!514018 () Bool)

(assert (=> b!915769 (=> (not res!617392) (not e!514018))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!54556 0))(
  ( (array!54557 (arr!26223 (Array (_ BitVec 32) (_ BitVec 64))) (size!26682 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54556)

(assert (=> b!915769 (= res!617392 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26682 _keys!1487))))))

(declare-fun b!915770 () Bool)

(declare-fun res!617395 () Bool)

(assert (=> b!915770 (=> (not res!617395) (not e!514018))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54556 (_ BitVec 32)) Bool)

(assert (=> b!915770 (= res!617395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!915771 () Bool)

(assert (=> b!915771 (= e!514018 false)))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30673 0))(
  ( (V!30674 (val!9691 Int)) )
))
(declare-datatypes ((ValueCell!9159 0))(
  ( (ValueCellFull!9159 (v!12209 V!30673)) (EmptyCell!9159) )
))
(declare-datatypes ((array!54558 0))(
  ( (array!54559 (arr!26224 (Array (_ BitVec 32) ValueCell!9159)) (size!26683 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54558)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun lt!411712 () Bool)

(declare-fun zeroValue!1173 () V!30673)

(declare-fun minValue!1173 () V!30673)

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((tuple2!12574 0))(
  ( (tuple2!12575 (_1!6298 (_ BitVec 64)) (_2!6298 V!30673)) )
))
(declare-datatypes ((List!18385 0))(
  ( (Nil!18382) (Cons!18381 (h!19527 tuple2!12574) (t!25998 List!18385)) )
))
(declare-datatypes ((ListLongMap!11271 0))(
  ( (ListLongMap!11272 (toList!5651 List!18385)) )
))
(declare-fun contains!4705 (ListLongMap!11271 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2912 (array!54556 array!54558 (_ BitVec 32) (_ BitVec 32) V!30673 V!30673 (_ BitVec 32) Int) ListLongMap!11271)

(assert (=> b!915771 (= lt!411712 (contains!4705 (getCurrentListMap!2912 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) k0!1099))))

(declare-fun b!915772 () Bool)

(declare-fun res!617391 () Bool)

(assert (=> b!915772 (=> (not res!617391) (not e!514018))))

(declare-datatypes ((List!18386 0))(
  ( (Nil!18383) (Cons!18382 (h!19528 (_ BitVec 64)) (t!25999 List!18386)) )
))
(declare-fun arrayNoDuplicates!0 (array!54556 (_ BitVec 32) List!18386) Bool)

(assert (=> b!915772 (= res!617391 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18383))))

(declare-fun b!915773 () Bool)

(declare-fun res!617393 () Bool)

(assert (=> b!915773 (=> (not res!617393) (not e!514018))))

(assert (=> b!915773 (= res!617393 (and (= (size!26683 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26682 _keys!1487) (size!26683 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30678 () Bool)

(declare-fun mapRes!30678 () Bool)

(declare-fun tp!58759 () Bool)

(declare-fun e!514021 () Bool)

(assert (=> mapNonEmpty!30678 (= mapRes!30678 (and tp!58759 e!514021))))

(declare-fun mapValue!30678 () ValueCell!9159)

(declare-fun mapKey!30678 () (_ BitVec 32))

(declare-fun mapRest!30678 () (Array (_ BitVec 32) ValueCell!9159))

(assert (=> mapNonEmpty!30678 (= (arr!26224 _values!1231) (store mapRest!30678 mapKey!30678 mapValue!30678))))

(declare-fun b!915774 () Bool)

(declare-fun e!514020 () Bool)

(declare-fun tp_is_empty!19281 () Bool)

(assert (=> b!915774 (= e!514020 tp_is_empty!19281)))

(declare-fun b!915775 () Bool)

(declare-fun e!514017 () Bool)

(assert (=> b!915775 (= e!514017 (and e!514020 mapRes!30678))))

(declare-fun condMapEmpty!30678 () Bool)

(declare-fun mapDefault!30678 () ValueCell!9159)

(assert (=> b!915775 (= condMapEmpty!30678 (= (arr!26224 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9159)) mapDefault!30678)))))

(declare-fun res!617394 () Bool)

(assert (=> start!78560 (=> (not res!617394) (not e!514018))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78560 (= res!617394 (validMask!0 mask!1881))))

(assert (=> start!78560 e!514018))

(assert (=> start!78560 true))

(declare-fun array_inv!20462 (array!54558) Bool)

(assert (=> start!78560 (and (array_inv!20462 _values!1231) e!514017)))

(assert (=> start!78560 tp!58760))

(declare-fun array_inv!20463 (array!54556) Bool)

(assert (=> start!78560 (array_inv!20463 _keys!1487)))

(assert (=> start!78560 tp_is_empty!19281))

(declare-fun b!915776 () Bool)

(assert (=> b!915776 (= e!514021 tp_is_empty!19281)))

(declare-fun mapIsEmpty!30678 () Bool)

(assert (=> mapIsEmpty!30678 mapRes!30678))

(assert (= (and start!78560 res!617394) b!915773))

(assert (= (and b!915773 res!617393) b!915770))

(assert (= (and b!915770 res!617395) b!915772))

(assert (= (and b!915772 res!617391) b!915769))

(assert (= (and b!915769 res!617392) b!915771))

(assert (= (and b!915775 condMapEmpty!30678) mapIsEmpty!30678))

(assert (= (and b!915775 (not condMapEmpty!30678)) mapNonEmpty!30678))

(get-info :version)

(assert (= (and mapNonEmpty!30678 ((_ is ValueCellFull!9159) mapValue!30678)) b!915776))

(assert (= (and b!915775 ((_ is ValueCellFull!9159) mapDefault!30678)) b!915774))

(assert (= start!78560 b!915775))

(declare-fun m!850027 () Bool)

(assert (=> b!915771 m!850027))

(assert (=> b!915771 m!850027))

(declare-fun m!850029 () Bool)

(assert (=> b!915771 m!850029))

(declare-fun m!850031 () Bool)

(assert (=> b!915772 m!850031))

(declare-fun m!850033 () Bool)

(assert (=> start!78560 m!850033))

(declare-fun m!850035 () Bool)

(assert (=> start!78560 m!850035))

(declare-fun m!850037 () Bool)

(assert (=> start!78560 m!850037))

(declare-fun m!850039 () Bool)

(assert (=> mapNonEmpty!30678 m!850039))

(declare-fun m!850041 () Bool)

(assert (=> b!915770 m!850041))

(check-sat b_and!27395 (not start!78560) (not b_next!16773) (not mapNonEmpty!30678) tp_is_empty!19281 (not b!915771) (not b!915772) (not b!915770))
(check-sat b_and!27395 (not b_next!16773))
