; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78784 () Bool)

(assert start!78784)

(declare-fun b_free!16997 () Bool)

(declare-fun b_next!16997 () Bool)

(assert (=> start!78784 (= b_free!16997 (not b_next!16997))))

(declare-fun tp!59432 () Bool)

(declare-fun b_and!27731 () Bool)

(assert (=> start!78784 (= tp!59432 b_and!27731)))

(declare-fun b!919518 () Bool)

(declare-fun e!516133 () Bool)

(declare-fun e!516128 () Bool)

(assert (=> b!919518 (= e!516133 e!516128)))

(declare-fun res!620029 () Bool)

(assert (=> b!919518 (=> (not res!620029) (not e!516128))))

(declare-datatypes ((V!30971 0))(
  ( (V!30972 (val!9803 Int)) )
))
(declare-datatypes ((tuple2!12742 0))(
  ( (tuple2!12743 (_1!6382 (_ BitVec 64)) (_2!6382 V!30971)) )
))
(declare-datatypes ((List!18546 0))(
  ( (Nil!18543) (Cons!18542 (h!19688 tuple2!12742) (t!26273 List!18546)) )
))
(declare-datatypes ((ListLongMap!11439 0))(
  ( (ListLongMap!11440 (toList!5735 List!18546)) )
))
(declare-fun lt!412750 () ListLongMap!11439)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4781 (ListLongMap!11439 (_ BitVec 64)) Bool)

(assert (=> b!919518 (= res!620029 (contains!4781 lt!412750 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9271 0))(
  ( (ValueCellFull!9271 (v!12321 V!30971)) (EmptyCell!9271) )
))
(declare-datatypes ((array!54994 0))(
  ( (array!54995 (arr!26442 (Array (_ BitVec 32) ValueCell!9271)) (size!26901 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54994)

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((array!54996 0))(
  ( (array!54997 (arr!26443 (Array (_ BitVec 32) (_ BitVec 64))) (size!26902 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54996)

(declare-fun zeroValue!1173 () V!30971)

(declare-fun minValue!1173 () V!30971)

(declare-fun getCurrentListMap!2991 (array!54996 array!54994 (_ BitVec 32) (_ BitVec 32) V!30971 V!30971 (_ BitVec 32) Int) ListLongMap!11439)

(assert (=> b!919518 (= lt!412750 (getCurrentListMap!2991 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!919519 () Bool)

(declare-fun res!620024 () Bool)

(assert (=> b!919519 (=> (not res!620024) (not e!516128))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!919519 (= res!620024 (validKeyInArray!0 k!1099))))

(declare-fun mapNonEmpty!31014 () Bool)

(declare-fun mapRes!31014 () Bool)

(declare-fun tp!59431 () Bool)

(declare-fun e!516127 () Bool)

(assert (=> mapNonEmpty!31014 (= mapRes!31014 (and tp!59431 e!516127))))

(declare-fun mapRest!31014 () (Array (_ BitVec 32) ValueCell!9271))

(declare-fun mapValue!31014 () ValueCell!9271)

(declare-fun mapKey!31014 () (_ BitVec 32))

(assert (=> mapNonEmpty!31014 (= (arr!26442 _values!1231) (store mapRest!31014 mapKey!31014 mapValue!31014))))

(declare-fun res!620028 () Bool)

(assert (=> start!78784 (=> (not res!620028) (not e!516133))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78784 (= res!620028 (validMask!0 mask!1881))))

(assert (=> start!78784 e!516133))

(assert (=> start!78784 true))

(declare-fun tp_is_empty!19505 () Bool)

(assert (=> start!78784 tp_is_empty!19505))

(declare-fun e!516130 () Bool)

(declare-fun array_inv!20610 (array!54994) Bool)

(assert (=> start!78784 (and (array_inv!20610 _values!1231) e!516130)))

(assert (=> start!78784 tp!59432))

(declare-fun array_inv!20611 (array!54996) Bool)

(assert (=> start!78784 (array_inv!20611 _keys!1487)))

(declare-fun b!919520 () Bool)

(declare-fun e!516132 () Bool)

(assert (=> b!919520 (= e!516132 tp_is_empty!19505)))

(declare-fun b!919521 () Bool)

(declare-fun res!620026 () Bool)

(assert (=> b!919521 (=> (not res!620026) (not e!516133))))

(assert (=> b!919521 (= res!620026 (and (= (size!26901 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26902 _keys!1487) (size!26901 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!919522 () Bool)

(declare-fun res!620021 () Bool)

(assert (=> b!919522 (=> (not res!620021) (not e!516133))))

(declare-datatypes ((List!18547 0))(
  ( (Nil!18544) (Cons!18543 (h!19689 (_ BitVec 64)) (t!26274 List!18547)) )
))
(declare-fun arrayNoDuplicates!0 (array!54996 (_ BitVec 32) List!18547) Bool)

(assert (=> b!919522 (= res!620021 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18544))))

(declare-fun b!919523 () Bool)

(declare-fun res!620027 () Bool)

(assert (=> b!919523 (=> (not res!620027) (not e!516128))))

(assert (=> b!919523 (= res!620027 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!919524 () Bool)

(assert (=> b!919524 (= e!516130 (and e!516132 mapRes!31014))))

(declare-fun condMapEmpty!31014 () Bool)

(declare-fun mapDefault!31014 () ValueCell!9271)

