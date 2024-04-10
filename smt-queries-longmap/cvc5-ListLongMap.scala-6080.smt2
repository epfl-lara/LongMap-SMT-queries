; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78588 () Bool)

(assert start!78588)

(declare-fun b_free!16801 () Bool)

(declare-fun b_next!16801 () Bool)

(assert (=> start!78588 (= b_free!16801 (not b_next!16801))))

(declare-fun tp!58843 () Bool)

(declare-fun b_and!27423 () Bool)

(assert (=> start!78588 (= tp!58843 b_and!27423)))

(declare-fun b!916105 () Bool)

(declare-fun res!617602 () Bool)

(declare-fun e!514228 () Bool)

(assert (=> b!916105 (=> (not res!617602) (not e!514228))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30711 0))(
  ( (V!30712 (val!9705 Int)) )
))
(declare-datatypes ((ValueCell!9173 0))(
  ( (ValueCellFull!9173 (v!12223 V!30711)) (EmptyCell!9173) )
))
(declare-datatypes ((array!54610 0))(
  ( (array!54611 (arr!26250 (Array (_ BitVec 32) ValueCell!9173)) (size!26709 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54610)

(declare-datatypes ((array!54612 0))(
  ( (array!54613 (arr!26251 (Array (_ BitVec 32) (_ BitVec 64))) (size!26710 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54612)

(assert (=> b!916105 (= res!617602 (and (= (size!26709 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26710 _keys!1487) (size!26709 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!916106 () Bool)

(declare-fun res!617604 () Bool)

(assert (=> b!916106 (=> (not res!617604) (not e!514228))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!916106 (= res!617604 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26710 _keys!1487))))))

(declare-fun res!617603 () Bool)

(assert (=> start!78588 (=> (not res!617603) (not e!514228))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78588 (= res!617603 (validMask!0 mask!1881))))

(assert (=> start!78588 e!514228))

(assert (=> start!78588 true))

(declare-fun e!514231 () Bool)

(declare-fun array_inv!20476 (array!54610) Bool)

(assert (=> start!78588 (and (array_inv!20476 _values!1231) e!514231)))

(assert (=> start!78588 tp!58843))

(declare-fun array_inv!20477 (array!54612) Bool)

(assert (=> start!78588 (array_inv!20477 _keys!1487)))

(declare-fun tp_is_empty!19309 () Bool)

(assert (=> start!78588 tp_is_empty!19309))

(declare-fun b!916107 () Bool)

(assert (=> b!916107 (= e!514228 false)))

(declare-fun lt!411754 () Bool)

(declare-fun defaultEntry!1235 () Int)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun zeroValue!1173 () V!30711)

(declare-fun minValue!1173 () V!30711)

(declare-datatypes ((tuple2!12590 0))(
  ( (tuple2!12591 (_1!6306 (_ BitVec 64)) (_2!6306 V!30711)) )
))
(declare-datatypes ((List!18403 0))(
  ( (Nil!18400) (Cons!18399 (h!19545 tuple2!12590) (t!26016 List!18403)) )
))
(declare-datatypes ((ListLongMap!11287 0))(
  ( (ListLongMap!11288 (toList!5659 List!18403)) )
))
(declare-fun contains!4713 (ListLongMap!11287 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2920 (array!54612 array!54610 (_ BitVec 32) (_ BitVec 32) V!30711 V!30711 (_ BitVec 32) Int) ListLongMap!11287)

(assert (=> b!916107 (= lt!411754 (contains!4713 (getCurrentListMap!2920 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) k!1099))))

(declare-fun b!916108 () Bool)

(declare-fun e!514230 () Bool)

(assert (=> b!916108 (= e!514230 tp_is_empty!19309)))

(declare-fun mapIsEmpty!30720 () Bool)

(declare-fun mapRes!30720 () Bool)

(assert (=> mapIsEmpty!30720 mapRes!30720))

(declare-fun b!916109 () Bool)

(declare-fun res!617605 () Bool)

(assert (=> b!916109 (=> (not res!617605) (not e!514228))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54612 (_ BitVec 32)) Bool)

(assert (=> b!916109 (= res!617605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!916110 () Bool)

(declare-fun res!617601 () Bool)

(assert (=> b!916110 (=> (not res!617601) (not e!514228))))

(declare-datatypes ((List!18404 0))(
  ( (Nil!18401) (Cons!18400 (h!19546 (_ BitVec 64)) (t!26017 List!18404)) )
))
(declare-fun arrayNoDuplicates!0 (array!54612 (_ BitVec 32) List!18404) Bool)

(assert (=> b!916110 (= res!617601 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18401))))

(declare-fun b!916111 () Bool)

(assert (=> b!916111 (= e!514231 (and e!514230 mapRes!30720))))

(declare-fun condMapEmpty!30720 () Bool)

(declare-fun mapDefault!30720 () ValueCell!9173)

