; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77802 () Bool)

(assert start!77802)

(declare-fun b_free!16361 () Bool)

(declare-fun b_next!16361 () Bool)

(assert (=> start!77802 (= b_free!16361 (not b_next!16361))))

(declare-fun tp!57347 () Bool)

(declare-fun b_and!26879 () Bool)

(assert (=> start!77802 (= tp!57347 b_and!26879)))

(declare-fun b!908063 () Bool)

(declare-fun e!508932 () Bool)

(declare-fun tp_is_empty!18779 () Bool)

(assert (=> b!908063 (= e!508932 tp_is_empty!18779)))

(declare-fun mapNonEmpty!29884 () Bool)

(declare-fun mapRes!29884 () Bool)

(declare-fun tp!57348 () Bool)

(declare-fun e!508930 () Bool)

(assert (=> mapNonEmpty!29884 (= mapRes!29884 (and tp!57348 e!508930))))

(declare-datatypes ((V!30003 0))(
  ( (V!30004 (val!9440 Int)) )
))
(declare-datatypes ((ValueCell!8908 0))(
  ( (ValueCellFull!8908 (v!11947 V!30003)) (EmptyCell!8908) )
))
(declare-datatypes ((array!53592 0))(
  ( (array!53593 (arr!25754 (Array (_ BitVec 32) ValueCell!8908)) (size!26213 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53592)

(declare-fun mapKey!29884 () (_ BitVec 32))

(declare-fun mapValue!29884 () ValueCell!8908)

(declare-fun mapRest!29884 () (Array (_ BitVec 32) ValueCell!8908))

(assert (=> mapNonEmpty!29884 (= (arr!25754 _values!1152) (store mapRest!29884 mapKey!29884 mapValue!29884))))

(declare-fun b!908064 () Bool)

(declare-fun res!612873 () Bool)

(declare-fun e!508931 () Bool)

(assert (=> b!908064 (=> (not res!612873) (not e!508931))))

(declare-datatypes ((array!53594 0))(
  ( (array!53595 (arr!25755 (Array (_ BitVec 32) (_ BitVec 64))) (size!26214 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53594)

(declare-datatypes ((List!18094 0))(
  ( (Nil!18091) (Cons!18090 (h!19236 (_ BitVec 64)) (t!25627 List!18094)) )
))
(declare-fun arrayNoDuplicates!0 (array!53594 (_ BitVec 32) List!18094) Bool)

(assert (=> b!908064 (= res!612873 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18091))))

(declare-fun mapIsEmpty!29884 () Bool)

(assert (=> mapIsEmpty!29884 mapRes!29884))

(declare-fun b!908065 () Bool)

(declare-fun res!612871 () Bool)

(assert (=> b!908065 (=> (not res!612871) (not e!508931))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53594 (_ BitVec 32)) Bool)

(assert (=> b!908065 (= res!612871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!908066 () Bool)

(declare-fun res!612870 () Bool)

(declare-fun e!508933 () Bool)

(assert (=> b!908066 (=> res!612870 e!508933)))

(declare-datatypes ((tuple2!12296 0))(
  ( (tuple2!12297 (_1!6159 (_ BitVec 64)) (_2!6159 V!30003)) )
))
(declare-datatypes ((List!18095 0))(
  ( (Nil!18092) (Cons!18091 (h!19237 tuple2!12296) (t!25628 List!18095)) )
))
(declare-datatypes ((ListLongMap!10993 0))(
  ( (ListLongMap!10994 (toList!5512 List!18095)) )
))
(declare-fun lt!409576 () ListLongMap!10993)

(declare-fun lt!409578 () V!30003)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun apply!496 (ListLongMap!10993 (_ BitVec 64)) V!30003)

(assert (=> b!908066 (= res!612870 (not (= (apply!496 lt!409576 k!1033) lt!409578)))))

(declare-fun b!908067 () Bool)

(declare-fun res!612872 () Bool)

(assert (=> b!908067 (=> (not res!612872) (not e!508931))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!908067 (= res!612872 (and (= (size!26213 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26214 _keys!1386) (size!26213 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!908068 () Bool)

(declare-fun e!508934 () Bool)

(assert (=> b!908068 (= e!508934 (and e!508932 mapRes!29884))))

(declare-fun condMapEmpty!29884 () Bool)

(declare-fun mapDefault!29884 () ValueCell!8908)

