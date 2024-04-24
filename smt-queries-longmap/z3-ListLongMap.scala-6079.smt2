; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78750 () Bool)

(assert start!78750)

(declare-fun b_free!16795 () Bool)

(declare-fun b_next!16795 () Bool)

(assert (=> start!78750 (= b_free!16795 (not b_next!16795))))

(declare-fun tp!58826 () Bool)

(declare-fun b_and!27427 () Bool)

(assert (=> start!78750 (= tp!58826 b_and!27427)))

(declare-fun b!916936 () Bool)

(declare-fun res!617900 () Bool)

(declare-fun e!514767 () Bool)

(assert (=> b!916936 (=> (not res!617900) (not e!514767))))

(declare-datatypes ((array!54647 0))(
  ( (array!54648 (arr!26264 (Array (_ BitVec 32) (_ BitVec 64))) (size!26724 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54647)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54647 (_ BitVec 32)) Bool)

(assert (=> b!916936 (= res!617900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!916937 () Bool)

(declare-fun e!514768 () Bool)

(declare-fun tp_is_empty!19303 () Bool)

(assert (=> b!916937 (= e!514768 tp_is_empty!19303)))

(declare-fun b!916938 () Bool)

(assert (=> b!916938 (= e!514767 false)))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30703 0))(
  ( (V!30704 (val!9702 Int)) )
))
(declare-datatypes ((ValueCell!9170 0))(
  ( (ValueCellFull!9170 (v!12217 V!30703)) (EmptyCell!9170) )
))
(declare-datatypes ((array!54649 0))(
  ( (array!54650 (arr!26265 (Array (_ BitVec 32) ValueCell!9170)) (size!26725 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54649)

(declare-fun defaultEntry!1235 () Int)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!412106 () Bool)

(declare-fun zeroValue!1173 () V!30703)

(declare-fun minValue!1173 () V!30703)

(declare-datatypes ((tuple2!12550 0))(
  ( (tuple2!12551 (_1!6286 (_ BitVec 64)) (_2!6286 V!30703)) )
))
(declare-datatypes ((List!18383 0))(
  ( (Nil!18380) (Cons!18379 (h!19531 tuple2!12550) (t!25988 List!18383)) )
))
(declare-datatypes ((ListLongMap!11249 0))(
  ( (ListLongMap!11250 (toList!5640 List!18383)) )
))
(declare-fun contains!4702 (ListLongMap!11249 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2899 (array!54647 array!54649 (_ BitVec 32) (_ BitVec 32) V!30703 V!30703 (_ BitVec 32) Int) ListLongMap!11249)

(assert (=> b!916938 (= lt!412106 (contains!4702 (getCurrentListMap!2899 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) k0!1099))))

(declare-fun b!916939 () Bool)

(declare-fun res!617902 () Bool)

(assert (=> b!916939 (=> (not res!617902) (not e!514767))))

(declare-datatypes ((List!18384 0))(
  ( (Nil!18381) (Cons!18380 (h!19532 (_ BitVec 64)) (t!25989 List!18384)) )
))
(declare-fun arrayNoDuplicates!0 (array!54647 (_ BitVec 32) List!18384) Bool)

(assert (=> b!916939 (= res!617902 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18381))))

(declare-fun mapNonEmpty!30711 () Bool)

(declare-fun mapRes!30711 () Bool)

(declare-fun tp!58827 () Bool)

(declare-fun e!514764 () Bool)

(assert (=> mapNonEmpty!30711 (= mapRes!30711 (and tp!58827 e!514764))))

(declare-fun mapValue!30711 () ValueCell!9170)

(declare-fun mapKey!30711 () (_ BitVec 32))

(declare-fun mapRest!30711 () (Array (_ BitVec 32) ValueCell!9170))

(assert (=> mapNonEmpty!30711 (= (arr!26265 _values!1231) (store mapRest!30711 mapKey!30711 mapValue!30711))))

(declare-fun b!916940 () Bool)

(declare-fun res!617901 () Bool)

(assert (=> b!916940 (=> (not res!617901) (not e!514767))))

(assert (=> b!916940 (= res!617901 (and (= (size!26725 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26724 _keys!1487) (size!26725 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!916941 () Bool)

(assert (=> b!916941 (= e!514764 tp_is_empty!19303)))

(declare-fun res!617903 () Bool)

(assert (=> start!78750 (=> (not res!617903) (not e!514767))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78750 (= res!617903 (validMask!0 mask!1881))))

(assert (=> start!78750 e!514767))

(assert (=> start!78750 true))

(declare-fun e!514766 () Bool)

(declare-fun array_inv!20594 (array!54649) Bool)

(assert (=> start!78750 (and (array_inv!20594 _values!1231) e!514766)))

(assert (=> start!78750 tp!58826))

(declare-fun array_inv!20595 (array!54647) Bool)

(assert (=> start!78750 (array_inv!20595 _keys!1487)))

(assert (=> start!78750 tp_is_empty!19303))

(declare-fun mapIsEmpty!30711 () Bool)

(assert (=> mapIsEmpty!30711 mapRes!30711))

(declare-fun b!916942 () Bool)

(assert (=> b!916942 (= e!514766 (and e!514768 mapRes!30711))))

(declare-fun condMapEmpty!30711 () Bool)

(declare-fun mapDefault!30711 () ValueCell!9170)

(assert (=> b!916942 (= condMapEmpty!30711 (= (arr!26265 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9170)) mapDefault!30711)))))

(declare-fun b!916943 () Bool)

(declare-fun res!617904 () Bool)

(assert (=> b!916943 (=> (not res!617904) (not e!514767))))

(assert (=> b!916943 (= res!617904 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26724 _keys!1487))))))

(assert (= (and start!78750 res!617903) b!916940))

(assert (= (and b!916940 res!617901) b!916936))

(assert (= (and b!916936 res!617900) b!916939))

(assert (= (and b!916939 res!617902) b!916943))

(assert (= (and b!916943 res!617904) b!916938))

(assert (= (and b!916942 condMapEmpty!30711) mapIsEmpty!30711))

(assert (= (and b!916942 (not condMapEmpty!30711)) mapNonEmpty!30711))

(get-info :version)

(assert (= (and mapNonEmpty!30711 ((_ is ValueCellFull!9170) mapValue!30711)) b!916941))

(assert (= (and b!916942 ((_ is ValueCellFull!9170) mapDefault!30711)) b!916937))

(assert (= start!78750 b!916942))

(declare-fun m!851497 () Bool)

(assert (=> mapNonEmpty!30711 m!851497))

(declare-fun m!851499 () Bool)

(assert (=> b!916938 m!851499))

(assert (=> b!916938 m!851499))

(declare-fun m!851501 () Bool)

(assert (=> b!916938 m!851501))

(declare-fun m!851503 () Bool)

(assert (=> b!916936 m!851503))

(declare-fun m!851505 () Bool)

(assert (=> start!78750 m!851505))

(declare-fun m!851507 () Bool)

(assert (=> start!78750 m!851507))

(declare-fun m!851509 () Bool)

(assert (=> start!78750 m!851509))

(declare-fun m!851511 () Bool)

(assert (=> b!916939 m!851511))

(check-sat (not b_next!16795) (not mapNonEmpty!30711) (not b!916938) tp_is_empty!19303 (not start!78750) (not b!916939) (not b!916936) b_and!27427)
(check-sat b_and!27427 (not b_next!16795))
