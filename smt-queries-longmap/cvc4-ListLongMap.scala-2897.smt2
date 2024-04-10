; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41528 () Bool)

(assert start!41528)

(declare-fun b_free!11195 () Bool)

(declare-fun b_next!11195 () Bool)

(assert (=> start!41528 (= b_free!11195 (not b_next!11195))))

(declare-fun tp!39583 () Bool)

(declare-fun b_and!19535 () Bool)

(assert (=> start!41528 (= tp!39583 b_and!19535)))

(declare-fun b!463894 () Bool)

(declare-fun res!277364 () Bool)

(declare-fun e!270911 () Bool)

(assert (=> b!463894 (=> (not res!277364) (not e!270911))))

(declare-datatypes ((array!29035 0))(
  ( (array!29036 (arr!13949 (Array (_ BitVec 32) (_ BitVec 64))) (size!14301 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29035)

(declare-datatypes ((List!8420 0))(
  ( (Nil!8417) (Cons!8416 (h!9272 (_ BitVec 64)) (t!14366 List!8420)) )
))
(declare-fun arrayNoDuplicates!0 (array!29035 (_ BitVec 32) List!8420) Bool)

(assert (=> b!463894 (= res!277364 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8417))))

(declare-fun b!463895 () Bool)

(declare-fun e!270910 () Bool)

(declare-fun tp_is_empty!12623 () Bool)

(assert (=> b!463895 (= e!270910 tp_is_empty!12623)))

(declare-fun b!463896 () Bool)

(declare-fun res!277361 () Bool)

(assert (=> b!463896 (=> (not res!277361) (not e!270911))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29035 (_ BitVec 32)) Bool)

(assert (=> b!463896 (= res!277361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!277363 () Bool)

(assert (=> start!41528 (=> (not res!277363) (not e!270911))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41528 (= res!277363 (validMask!0 mask!1365))))

(assert (=> start!41528 e!270911))

(assert (=> start!41528 tp_is_empty!12623))

(assert (=> start!41528 tp!39583))

(assert (=> start!41528 true))

(declare-fun array_inv!10082 (array!29035) Bool)

(assert (=> start!41528 (array_inv!10082 _keys!1025)))

(declare-datatypes ((V!17935 0))(
  ( (V!17936 (val!6356 Int)) )
))
(declare-datatypes ((ValueCell!5968 0))(
  ( (ValueCellFull!5968 (v!8643 V!17935)) (EmptyCell!5968) )
))
(declare-datatypes ((array!29037 0))(
  ( (array!29038 (arr!13950 (Array (_ BitVec 32) ValueCell!5968)) (size!14302 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29037)

(declare-fun e!270908 () Bool)

(declare-fun array_inv!10083 (array!29037) Bool)

(assert (=> start!41528 (and (array_inv!10083 _values!833) e!270908)))

(declare-fun b!463897 () Bool)

(declare-fun e!270912 () Bool)

(assert (=> b!463897 (= e!270912 tp_is_empty!12623)))

(declare-fun mapNonEmpty!20611 () Bool)

(declare-fun mapRes!20611 () Bool)

(declare-fun tp!39582 () Bool)

(assert (=> mapNonEmpty!20611 (= mapRes!20611 (and tp!39582 e!270910))))

(declare-fun mapValue!20611 () ValueCell!5968)

(declare-fun mapKey!20611 () (_ BitVec 32))

(declare-fun mapRest!20611 () (Array (_ BitVec 32) ValueCell!5968))

(assert (=> mapNonEmpty!20611 (= (arr!13950 _values!833) (store mapRest!20611 mapKey!20611 mapValue!20611))))

(declare-fun b!463898 () Bool)

(assert (=> b!463898 (= e!270908 (and e!270912 mapRes!20611))))

(declare-fun condMapEmpty!20611 () Bool)

(declare-fun mapDefault!20611 () ValueCell!5968)

