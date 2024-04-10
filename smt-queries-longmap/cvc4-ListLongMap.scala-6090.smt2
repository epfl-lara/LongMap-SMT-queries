; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78652 () Bool)

(assert start!78652)

(declare-fun b_free!16865 () Bool)

(declare-fun b_next!16865 () Bool)

(assert (=> start!78652 (= b_free!16865 (not b_next!16865))))

(declare-fun tp!59035 () Bool)

(declare-fun b_and!27487 () Bool)

(assert (=> start!78652 (= tp!59035 b_and!27487)))

(declare-fun mapNonEmpty!30816 () Bool)

(declare-fun mapRes!30816 () Bool)

(declare-fun tp!59036 () Bool)

(declare-fun e!514773 () Bool)

(assert (=> mapNonEmpty!30816 (= mapRes!30816 (and tp!59036 e!514773))))

(declare-datatypes ((V!30795 0))(
  ( (V!30796 (val!9737 Int)) )
))
(declare-datatypes ((ValueCell!9205 0))(
  ( (ValueCellFull!9205 (v!12255 V!30795)) (EmptyCell!9205) )
))
(declare-fun mapRest!30816 () (Array (_ BitVec 32) ValueCell!9205))

(declare-fun mapValue!30816 () ValueCell!9205)

(declare-datatypes ((array!54732 0))(
  ( (array!54733 (arr!26311 (Array (_ BitVec 32) ValueCell!9205)) (size!26770 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54732)

(declare-fun mapKey!30816 () (_ BitVec 32))

(assert (=> mapNonEmpty!30816 (= (arr!26311 _values!1231) (store mapRest!30816 mapKey!30816 mapValue!30816))))

(declare-fun b!916944 () Bool)

(declare-fun e!514769 () Bool)

(declare-fun e!514774 () Bool)

(assert (=> b!916944 (= e!514769 e!514774)))

(declare-fun res!618155 () Bool)

(assert (=> b!916944 (=> (not res!618155) (not e!514774))))

(declare-datatypes ((tuple2!12638 0))(
  ( (tuple2!12639 (_1!6330 (_ BitVec 64)) (_2!6330 V!30795)) )
))
(declare-datatypes ((List!18449 0))(
  ( (Nil!18446) (Cons!18445 (h!19591 tuple2!12638) (t!26062 List!18449)) )
))
(declare-datatypes ((ListLongMap!11335 0))(
  ( (ListLongMap!11336 (toList!5683 List!18449)) )
))
(declare-fun lt!411903 () ListLongMap!11335)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4735 (ListLongMap!11335 (_ BitVec 64)) Bool)

(assert (=> b!916944 (= res!618155 (contains!4735 lt!411903 k!1099))))

(declare-datatypes ((array!54734 0))(
  ( (array!54735 (arr!26312 (Array (_ BitVec 32) (_ BitVec 64))) (size!26771 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54734)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30795)

(declare-fun minValue!1173 () V!30795)

(declare-fun getCurrentListMap!2942 (array!54734 array!54732 (_ BitVec 32) (_ BitVec 32) V!30795 V!30795 (_ BitVec 32) Int) ListLongMap!11335)

(assert (=> b!916944 (= lt!411903 (getCurrentListMap!2942 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!916945 () Bool)

(declare-fun res!618157 () Bool)

(assert (=> b!916945 (=> (not res!618157) (not e!514769))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54734 (_ BitVec 32)) Bool)

(assert (=> b!916945 (= res!618157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!916946 () Bool)

(declare-fun res!618156 () Bool)

(assert (=> b!916946 (=> (not res!618156) (not e!514769))))

(declare-datatypes ((List!18450 0))(
  ( (Nil!18447) (Cons!18446 (h!19592 (_ BitVec 64)) (t!26063 List!18450)) )
))
(declare-fun arrayNoDuplicates!0 (array!54734 (_ BitVec 32) List!18450) Bool)

(assert (=> b!916946 (= res!618156 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18447))))

(declare-fun b!916947 () Bool)

(declare-fun tp_is_empty!19373 () Bool)

(assert (=> b!916947 (= e!514773 tp_is_empty!19373)))

(declare-fun b!916948 () Bool)

(assert (=> b!916948 (= e!514774 false)))

(declare-fun lt!411904 () V!30795)

(declare-fun apply!538 (ListLongMap!11335 (_ BitVec 64)) V!30795)

(assert (=> b!916948 (= lt!411904 (apply!538 lt!411903 k!1099))))

(declare-fun res!618152 () Bool)

(assert (=> start!78652 (=> (not res!618152) (not e!514769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78652 (= res!618152 (validMask!0 mask!1881))))

(assert (=> start!78652 e!514769))

(assert (=> start!78652 true))

(declare-fun e!514772 () Bool)

(declare-fun array_inv!20516 (array!54732) Bool)

(assert (=> start!78652 (and (array_inv!20516 _values!1231) e!514772)))

(assert (=> start!78652 tp!59035))

(declare-fun array_inv!20517 (array!54734) Bool)

(assert (=> start!78652 (array_inv!20517 _keys!1487)))

(assert (=> start!78652 tp_is_empty!19373))

(declare-fun b!916949 () Bool)

(declare-fun e!514771 () Bool)

(assert (=> b!916949 (= e!514772 (and e!514771 mapRes!30816))))

(declare-fun condMapEmpty!30816 () Bool)

(declare-fun mapDefault!30816 () ValueCell!9205)

