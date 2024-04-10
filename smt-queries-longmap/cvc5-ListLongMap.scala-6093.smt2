; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78666 () Bool)

(assert start!78666)

(declare-fun b_free!16879 () Bool)

(declare-fun b_next!16879 () Bool)

(assert (=> start!78666 (= b_free!16879 (not b_next!16879))))

(declare-fun tp!59078 () Bool)

(declare-fun b_and!27501 () Bool)

(assert (=> start!78666 (= tp!59078 b_and!27501)))

(declare-fun b!917133 () Bool)

(declare-fun res!618278 () Bool)

(declare-fun e!514897 () Bool)

(assert (=> b!917133 (=> (not res!618278) (not e!514897))))

(declare-datatypes ((array!54760 0))(
  ( (array!54761 (arr!26325 (Array (_ BitVec 32) (_ BitVec 64))) (size!26784 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54760)

(declare-datatypes ((List!18461 0))(
  ( (Nil!18458) (Cons!18457 (h!19603 (_ BitVec 64)) (t!26074 List!18461)) )
))
(declare-fun arrayNoDuplicates!0 (array!54760 (_ BitVec 32) List!18461) Bool)

(assert (=> b!917133 (= res!618278 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18458))))

(declare-fun mapIsEmpty!30837 () Bool)

(declare-fun mapRes!30837 () Bool)

(assert (=> mapIsEmpty!30837 mapRes!30837))

(declare-fun b!917134 () Bool)

(declare-fun res!618279 () Bool)

(assert (=> b!917134 (=> (not res!618279) (not e!514897))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30815 0))(
  ( (V!30816 (val!9744 Int)) )
))
(declare-datatypes ((ValueCell!9212 0))(
  ( (ValueCellFull!9212 (v!12262 V!30815)) (EmptyCell!9212) )
))
(declare-datatypes ((array!54762 0))(
  ( (array!54763 (arr!26326 (Array (_ BitVec 32) ValueCell!9212)) (size!26785 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54762)

(assert (=> b!917134 (= res!618279 (and (= (size!26785 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26784 _keys!1487) (size!26785 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!917135 () Bool)

(declare-fun res!618283 () Bool)

(assert (=> b!917135 (=> (not res!618283) (not e!514897))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!917135 (= res!618283 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26784 _keys!1487))))))

(declare-fun b!917136 () Bool)

(declare-fun e!514899 () Bool)

(assert (=> b!917136 (= e!514899 false)))

(declare-fun lt!411946 () V!30815)

(declare-datatypes ((tuple2!12650 0))(
  ( (tuple2!12651 (_1!6336 (_ BitVec 64)) (_2!6336 V!30815)) )
))
(declare-datatypes ((List!18462 0))(
  ( (Nil!18459) (Cons!18458 (h!19604 tuple2!12650) (t!26075 List!18462)) )
))
(declare-datatypes ((ListLongMap!11347 0))(
  ( (ListLongMap!11348 (toList!5689 List!18462)) )
))
(declare-fun lt!411945 () ListLongMap!11347)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun apply!544 (ListLongMap!11347 (_ BitVec 64)) V!30815)

(assert (=> b!917136 (= lt!411946 (apply!544 lt!411945 k!1099))))

(declare-fun b!917137 () Bool)

(declare-fun e!514896 () Bool)

(declare-fun tp_is_empty!19387 () Bool)

(assert (=> b!917137 (= e!514896 tp_is_empty!19387)))

(declare-fun b!917138 () Bool)

(declare-fun res!618280 () Bool)

(assert (=> b!917138 (=> (not res!618280) (not e!514897))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54760 (_ BitVec 32)) Bool)

(assert (=> b!917138 (= res!618280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapNonEmpty!30837 () Bool)

(declare-fun tp!59077 () Bool)

(assert (=> mapNonEmpty!30837 (= mapRes!30837 (and tp!59077 e!514896))))

(declare-fun mapRest!30837 () (Array (_ BitVec 32) ValueCell!9212))

(declare-fun mapKey!30837 () (_ BitVec 32))

(declare-fun mapValue!30837 () ValueCell!9212)

(assert (=> mapNonEmpty!30837 (= (arr!26326 _values!1231) (store mapRest!30837 mapKey!30837 mapValue!30837))))

(declare-fun b!917140 () Bool)

(declare-fun e!514895 () Bool)

(assert (=> b!917140 (= e!514895 tp_is_empty!19387)))

(declare-fun b!917141 () Bool)

(assert (=> b!917141 (= e!514897 e!514899)))

(declare-fun res!618281 () Bool)

(assert (=> b!917141 (=> (not res!618281) (not e!514899))))

(declare-fun contains!4741 (ListLongMap!11347 (_ BitVec 64)) Bool)

(assert (=> b!917141 (= res!618281 (contains!4741 lt!411945 k!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30815)

(declare-fun minValue!1173 () V!30815)

(declare-fun getCurrentListMap!2948 (array!54760 array!54762 (_ BitVec 32) (_ BitVec 32) V!30815 V!30815 (_ BitVec 32) Int) ListLongMap!11347)

(assert (=> b!917141 (= lt!411945 (getCurrentListMap!2948 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!618282 () Bool)

(assert (=> start!78666 (=> (not res!618282) (not e!514897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78666 (= res!618282 (validMask!0 mask!1881))))

(assert (=> start!78666 e!514897))

(assert (=> start!78666 true))

(declare-fun e!514898 () Bool)

(declare-fun array_inv!20530 (array!54762) Bool)

(assert (=> start!78666 (and (array_inv!20530 _values!1231) e!514898)))

(assert (=> start!78666 tp!59078))

(declare-fun array_inv!20531 (array!54760) Bool)

(assert (=> start!78666 (array_inv!20531 _keys!1487)))

(assert (=> start!78666 tp_is_empty!19387))

(declare-fun b!917139 () Bool)

(assert (=> b!917139 (= e!514898 (and e!514895 mapRes!30837))))

(declare-fun condMapEmpty!30837 () Bool)

(declare-fun mapDefault!30837 () ValueCell!9212)

