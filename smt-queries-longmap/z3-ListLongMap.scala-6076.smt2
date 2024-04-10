; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78566 () Bool)

(assert start!78566)

(declare-fun b_free!16779 () Bool)

(declare-fun b_next!16779 () Bool)

(assert (=> start!78566 (= b_free!16779 (not b_next!16779))))

(declare-fun tp!58778 () Bool)

(declare-fun b_and!27401 () Bool)

(assert (=> start!78566 (= tp!58778 b_and!27401)))

(declare-fun b!915841 () Bool)

(declare-fun e!514065 () Bool)

(assert (=> b!915841 (= e!514065 false)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun lt!411721 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30681 0))(
  ( (V!30682 (val!9694 Int)) )
))
(declare-datatypes ((ValueCell!9162 0))(
  ( (ValueCellFull!9162 (v!12212 V!30681)) (EmptyCell!9162) )
))
(declare-datatypes ((array!54568 0))(
  ( (array!54569 (arr!26229 (Array (_ BitVec 32) ValueCell!9162)) (size!26688 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54568)

(declare-fun defaultEntry!1235 () Int)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((array!54570 0))(
  ( (array!54571 (arr!26230 (Array (_ BitVec 32) (_ BitVec 64))) (size!26689 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54570)

(declare-fun zeroValue!1173 () V!30681)

(declare-fun minValue!1173 () V!30681)

(declare-datatypes ((tuple2!12578 0))(
  ( (tuple2!12579 (_1!6300 (_ BitVec 64)) (_2!6300 V!30681)) )
))
(declare-datatypes ((List!18389 0))(
  ( (Nil!18386) (Cons!18385 (h!19531 tuple2!12578) (t!26002 List!18389)) )
))
(declare-datatypes ((ListLongMap!11275 0))(
  ( (ListLongMap!11276 (toList!5653 List!18389)) )
))
(declare-fun contains!4707 (ListLongMap!11275 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2914 (array!54570 array!54568 (_ BitVec 32) (_ BitVec 32) V!30681 V!30681 (_ BitVec 32) Int) ListLongMap!11275)

(assert (=> b!915841 (= lt!411721 (contains!4707 (getCurrentListMap!2914 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) k0!1099))))

(declare-fun mapNonEmpty!30687 () Bool)

(declare-fun mapRes!30687 () Bool)

(declare-fun tp!58777 () Bool)

(declare-fun e!514066 () Bool)

(assert (=> mapNonEmpty!30687 (= mapRes!30687 (and tp!58777 e!514066))))

(declare-fun mapValue!30687 () ValueCell!9162)

(declare-fun mapKey!30687 () (_ BitVec 32))

(declare-fun mapRest!30687 () (Array (_ BitVec 32) ValueCell!9162))

(assert (=> mapNonEmpty!30687 (= (arr!26229 _values!1231) (store mapRest!30687 mapKey!30687 mapValue!30687))))

(declare-fun b!915842 () Bool)

(declare-fun e!514062 () Bool)

(declare-fun e!514064 () Bool)

(assert (=> b!915842 (= e!514062 (and e!514064 mapRes!30687))))

(declare-fun condMapEmpty!30687 () Bool)

(declare-fun mapDefault!30687 () ValueCell!9162)

(assert (=> b!915842 (= condMapEmpty!30687 (= (arr!26229 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9162)) mapDefault!30687)))))

(declare-fun b!915843 () Bool)

(declare-fun res!617437 () Bool)

(assert (=> b!915843 (=> (not res!617437) (not e!514065))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54570 (_ BitVec 32)) Bool)

(assert (=> b!915843 (= res!617437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!617439 () Bool)

(assert (=> start!78566 (=> (not res!617439) (not e!514065))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78566 (= res!617439 (validMask!0 mask!1881))))

(assert (=> start!78566 e!514065))

(assert (=> start!78566 true))

(declare-fun array_inv!20464 (array!54568) Bool)

(assert (=> start!78566 (and (array_inv!20464 _values!1231) e!514062)))

(assert (=> start!78566 tp!58778))

(declare-fun array_inv!20465 (array!54570) Bool)

(assert (=> start!78566 (array_inv!20465 _keys!1487)))

(declare-fun tp_is_empty!19287 () Bool)

(assert (=> start!78566 tp_is_empty!19287))

(declare-fun b!915844 () Bool)

(declare-fun res!617436 () Bool)

(assert (=> b!915844 (=> (not res!617436) (not e!514065))))

(assert (=> b!915844 (= res!617436 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26689 _keys!1487))))))

(declare-fun b!915845 () Bool)

(declare-fun res!617438 () Bool)

(assert (=> b!915845 (=> (not res!617438) (not e!514065))))

(declare-datatypes ((List!18390 0))(
  ( (Nil!18387) (Cons!18386 (h!19532 (_ BitVec 64)) (t!26003 List!18390)) )
))
(declare-fun arrayNoDuplicates!0 (array!54570 (_ BitVec 32) List!18390) Bool)

(assert (=> b!915845 (= res!617438 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18387))))

(declare-fun b!915846 () Bool)

(assert (=> b!915846 (= e!514066 tp_is_empty!19287)))

(declare-fun mapIsEmpty!30687 () Bool)

(assert (=> mapIsEmpty!30687 mapRes!30687))

(declare-fun b!915847 () Bool)

(declare-fun res!617440 () Bool)

(assert (=> b!915847 (=> (not res!617440) (not e!514065))))

(assert (=> b!915847 (= res!617440 (and (= (size!26688 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26689 _keys!1487) (size!26688 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!915848 () Bool)

(assert (=> b!915848 (= e!514064 tp_is_empty!19287)))

(assert (= (and start!78566 res!617439) b!915847))

(assert (= (and b!915847 res!617440) b!915843))

(assert (= (and b!915843 res!617437) b!915845))

(assert (= (and b!915845 res!617438) b!915844))

(assert (= (and b!915844 res!617436) b!915841))

(assert (= (and b!915842 condMapEmpty!30687) mapIsEmpty!30687))

(assert (= (and b!915842 (not condMapEmpty!30687)) mapNonEmpty!30687))

(get-info :version)

(assert (= (and mapNonEmpty!30687 ((_ is ValueCellFull!9162) mapValue!30687)) b!915846))

(assert (= (and b!915842 ((_ is ValueCellFull!9162) mapDefault!30687)) b!915848))

(assert (= start!78566 b!915842))

(declare-fun m!850075 () Bool)

(assert (=> b!915843 m!850075))

(declare-fun m!850077 () Bool)

(assert (=> b!915845 m!850077))

(declare-fun m!850079 () Bool)

(assert (=> b!915841 m!850079))

(assert (=> b!915841 m!850079))

(declare-fun m!850081 () Bool)

(assert (=> b!915841 m!850081))

(declare-fun m!850083 () Bool)

(assert (=> mapNonEmpty!30687 m!850083))

(declare-fun m!850085 () Bool)

(assert (=> start!78566 m!850085))

(declare-fun m!850087 () Bool)

(assert (=> start!78566 m!850087))

(declare-fun m!850089 () Bool)

(assert (=> start!78566 m!850089))

(check-sat b_and!27401 (not start!78566) (not b!915843) (not b_next!16779) (not b!915841) (not b!915845) (not mapNonEmpty!30687) tp_is_empty!19287)
(check-sat b_and!27401 (not b_next!16779))
