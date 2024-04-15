; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78570 () Bool)

(assert start!78570)

(declare-fun b_free!16801 () Bool)

(declare-fun b_next!16801 () Bool)

(assert (=> start!78570 (= b_free!16801 (not b_next!16801))))

(declare-fun tp!58844 () Bool)

(declare-fun b_and!27397 () Bool)

(assert (=> start!78570 (= tp!58844 b_and!27397)))

(declare-fun b!915866 () Bool)

(declare-fun res!617494 () Bool)

(declare-fun e!514081 () Bool)

(assert (=> b!915866 (=> (not res!617494) (not e!514081))))

(declare-datatypes ((array!54595 0))(
  ( (array!54596 (arr!26243 (Array (_ BitVec 32) (_ BitVec 64))) (size!26704 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54595)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54595 (_ BitVec 32)) Bool)

(assert (=> b!915866 (= res!617494 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!30720 () Bool)

(declare-fun mapRes!30720 () Bool)

(assert (=> mapIsEmpty!30720 mapRes!30720))

(declare-fun b!915867 () Bool)

(declare-fun e!514080 () Bool)

(declare-fun e!514079 () Bool)

(assert (=> b!915867 (= e!514080 (and e!514079 mapRes!30720))))

(declare-fun condMapEmpty!30720 () Bool)

(declare-datatypes ((V!30711 0))(
  ( (V!30712 (val!9705 Int)) )
))
(declare-datatypes ((ValueCell!9173 0))(
  ( (ValueCellFull!9173 (v!12222 V!30711)) (EmptyCell!9173) )
))
(declare-datatypes ((array!54597 0))(
  ( (array!54598 (arr!26244 (Array (_ BitVec 32) ValueCell!9173)) (size!26705 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54597)

(declare-fun mapDefault!30720 () ValueCell!9173)

(assert (=> b!915867 (= condMapEmpty!30720 (= (arr!26244 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9173)) mapDefault!30720)))))

(declare-fun mapNonEmpty!30720 () Bool)

(declare-fun tp!58845 () Bool)

(declare-fun e!514083 () Bool)

(assert (=> mapNonEmpty!30720 (= mapRes!30720 (and tp!58845 e!514083))))

(declare-fun mapRest!30720 () (Array (_ BitVec 32) ValueCell!9173))

(declare-fun mapKey!30720 () (_ BitVec 32))

(declare-fun mapValue!30720 () ValueCell!9173)

(assert (=> mapNonEmpty!30720 (= (arr!26244 _values!1231) (store mapRest!30720 mapKey!30720 mapValue!30720))))

(declare-fun res!617492 () Bool)

(assert (=> start!78570 (=> (not res!617492) (not e!514081))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78570 (= res!617492 (validMask!0 mask!1881))))

(assert (=> start!78570 e!514081))

(assert (=> start!78570 true))

(declare-fun array_inv!20558 (array!54597) Bool)

(assert (=> start!78570 (and (array_inv!20558 _values!1231) e!514080)))

(assert (=> start!78570 tp!58844))

(declare-fun array_inv!20559 (array!54595) Bool)

(assert (=> start!78570 (array_inv!20559 _keys!1487)))

(declare-fun tp_is_empty!19309 () Bool)

(assert (=> start!78570 tp_is_empty!19309))

(declare-fun b!915868 () Bool)

(declare-fun res!617491 () Bool)

(assert (=> b!915868 (=> (not res!617491) (not e!514081))))

(declare-datatypes ((List!18438 0))(
  ( (Nil!18435) (Cons!18434 (h!19580 (_ BitVec 64)) (t!26042 List!18438)) )
))
(declare-fun arrayNoDuplicates!0 (array!54595 (_ BitVec 32) List!18438) Bool)

(assert (=> b!915868 (= res!617491 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18435))))

(declare-fun b!915869 () Bool)

(assert (=> b!915869 (= e!514081 false)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun lt!411518 () Bool)

(declare-fun zeroValue!1173 () V!30711)

(declare-fun minValue!1173 () V!30711)

(declare-datatypes ((tuple2!12640 0))(
  ( (tuple2!12641 (_1!6331 (_ BitVec 64)) (_2!6331 V!30711)) )
))
(declare-datatypes ((List!18439 0))(
  ( (Nil!18436) (Cons!18435 (h!19581 tuple2!12640) (t!26043 List!18439)) )
))
(declare-datatypes ((ListLongMap!11327 0))(
  ( (ListLongMap!11328 (toList!5679 List!18439)) )
))
(declare-fun contains!4689 (ListLongMap!11327 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2878 (array!54595 array!54597 (_ BitVec 32) (_ BitVec 32) V!30711 V!30711 (_ BitVec 32) Int) ListLongMap!11327)

(assert (=> b!915869 (= lt!411518 (contains!4689 (getCurrentListMap!2878 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) k0!1099))))

(declare-fun b!915870 () Bool)

(declare-fun res!617495 () Bool)

(assert (=> b!915870 (=> (not res!617495) (not e!514081))))

(assert (=> b!915870 (= res!617495 (and (= (size!26705 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26704 _keys!1487) (size!26705 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!915871 () Bool)

(assert (=> b!915871 (= e!514079 tp_is_empty!19309)))

(declare-fun b!915872 () Bool)

(declare-fun res!617493 () Bool)

(assert (=> b!915872 (=> (not res!617493) (not e!514081))))

(assert (=> b!915872 (= res!617493 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26704 _keys!1487))))))

(declare-fun b!915873 () Bool)

(assert (=> b!915873 (= e!514083 tp_is_empty!19309)))

(assert (= (and start!78570 res!617492) b!915870))

(assert (= (and b!915870 res!617495) b!915866))

(assert (= (and b!915866 res!617494) b!915868))

(assert (= (and b!915868 res!617491) b!915872))

(assert (= (and b!915872 res!617493) b!915869))

(assert (= (and b!915867 condMapEmpty!30720) mapIsEmpty!30720))

(assert (= (and b!915867 (not condMapEmpty!30720)) mapNonEmpty!30720))

(get-info :version)

(assert (= (and mapNonEmpty!30720 ((_ is ValueCellFull!9173) mapValue!30720)) b!915873))

(assert (= (and b!915867 ((_ is ValueCellFull!9173) mapDefault!30720)) b!915871))

(assert (= start!78570 b!915867))

(declare-fun m!849493 () Bool)

(assert (=> start!78570 m!849493))

(declare-fun m!849495 () Bool)

(assert (=> start!78570 m!849495))

(declare-fun m!849497 () Bool)

(assert (=> start!78570 m!849497))

(declare-fun m!849499 () Bool)

(assert (=> b!915869 m!849499))

(assert (=> b!915869 m!849499))

(declare-fun m!849501 () Bool)

(assert (=> b!915869 m!849501))

(declare-fun m!849503 () Bool)

(assert (=> b!915868 m!849503))

(declare-fun m!849505 () Bool)

(assert (=> mapNonEmpty!30720 m!849505))

(declare-fun m!849507 () Bool)

(assert (=> b!915866 m!849507))

(check-sat b_and!27397 (not start!78570) (not b_next!16801) (not b!915869) (not mapNonEmpty!30720) (not b!915866) tp_is_empty!19309 (not b!915868))
(check-sat b_and!27397 (not b_next!16801))
