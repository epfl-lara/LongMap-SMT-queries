; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77858 () Bool)

(assert start!77858)

(declare-fun b_free!16417 () Bool)

(declare-fun b_next!16417 () Bool)

(assert (=> start!77858 (= b_free!16417 (not b_next!16417))))

(declare-fun tp!57516 () Bool)

(declare-fun b_and!26985 () Bool)

(assert (=> start!77858 (= tp!57516 b_and!26985)))

(declare-fun b!909139 () Bool)

(declare-fun e!509567 () Bool)

(assert (=> b!909139 (= e!509567 false)))

(declare-datatypes ((V!30079 0))(
  ( (V!30080 (val!9468 Int)) )
))
(declare-datatypes ((ValueCell!8936 0))(
  ( (ValueCellFull!8936 (v!11975 V!30079)) (EmptyCell!8936) )
))
(declare-datatypes ((array!53698 0))(
  ( (array!53699 (arr!25807 (Array (_ BitVec 32) ValueCell!8936)) (size!26266 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53698)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30079)

(declare-datatypes ((array!53700 0))(
  ( (array!53701 (arr!25808 (Array (_ BitVec 32) (_ BitVec 64))) (size!26267 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53700)

(declare-fun lt!409952 () Bool)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30079)

(declare-datatypes ((tuple2!12342 0))(
  ( (tuple2!12343 (_1!6182 (_ BitVec 64)) (_2!6182 V!30079)) )
))
(declare-datatypes ((List!18134 0))(
  ( (Nil!18131) (Cons!18130 (h!19276 tuple2!12342) (t!25715 List!18134)) )
))
(declare-datatypes ((ListLongMap!11039 0))(
  ( (ListLongMap!11040 (toList!5535 List!18134)) )
))
(declare-fun contains!4577 (ListLongMap!11039 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2797 (array!53700 array!53698 (_ BitVec 32) (_ BitVec 32) V!30079 V!30079 (_ BitVec 32) Int) ListLongMap!11039)

(assert (=> b!909139 (= lt!409952 (contains!4577 (getCurrentListMap!2797 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun res!613640 () Bool)

(assert (=> start!77858 (=> (not res!613640) (not e!509567))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77858 (= res!613640 (validMask!0 mask!1756))))

(assert (=> start!77858 e!509567))

(declare-fun e!509568 () Bool)

(declare-fun array_inv!20196 (array!53698) Bool)

(assert (=> start!77858 (and (array_inv!20196 _values!1152) e!509568)))

(assert (=> start!77858 tp!57516))

(assert (=> start!77858 true))

(declare-fun tp_is_empty!18835 () Bool)

(assert (=> start!77858 tp_is_empty!18835))

(declare-fun array_inv!20197 (array!53700) Bool)

(assert (=> start!77858 (array_inv!20197 _keys!1386)))

(declare-fun b!909140 () Bool)

(declare-fun e!509571 () Bool)

(assert (=> b!909140 (= e!509571 tp_is_empty!18835)))

(declare-fun b!909141 () Bool)

(declare-fun res!613641 () Bool)

(assert (=> b!909141 (=> (not res!613641) (not e!509567))))

(assert (=> b!909141 (= res!613641 (and (= (size!26266 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26267 _keys!1386) (size!26266 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!29968 () Bool)

(declare-fun mapRes!29968 () Bool)

(declare-fun tp!57515 () Bool)

(assert (=> mapNonEmpty!29968 (= mapRes!29968 (and tp!57515 e!509571))))

(declare-fun mapRest!29968 () (Array (_ BitVec 32) ValueCell!8936))

(declare-fun mapKey!29968 () (_ BitVec 32))

(declare-fun mapValue!29968 () ValueCell!8936)

(assert (=> mapNonEmpty!29968 (= (arr!25807 _values!1152) (store mapRest!29968 mapKey!29968 mapValue!29968))))

(declare-fun b!909142 () Bool)

(declare-fun e!509569 () Bool)

(assert (=> b!909142 (= e!509569 tp_is_empty!18835)))

(declare-fun b!909143 () Bool)

(assert (=> b!909143 (= e!509568 (and e!509569 mapRes!29968))))

(declare-fun condMapEmpty!29968 () Bool)

(declare-fun mapDefault!29968 () ValueCell!8936)

