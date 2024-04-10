; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41540 () Bool)

(assert start!41540)

(declare-fun b_free!11207 () Bool)

(declare-fun b_next!11207 () Bool)

(assert (=> start!41540 (= b_free!11207 (not b_next!11207))))

(declare-fun tp!39618 () Bool)

(declare-fun b_and!19547 () Bool)

(assert (=> start!41540 (= tp!39618 b_and!19547)))

(declare-fun b!464020 () Bool)

(declare-fun res!277433 () Bool)

(declare-fun e!271000 () Bool)

(assert (=> b!464020 (=> (not res!277433) (not e!271000))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29059 0))(
  ( (array!29060 (arr!13961 (Array (_ BitVec 32) (_ BitVec 64))) (size!14313 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29059)

(declare-datatypes ((V!17951 0))(
  ( (V!17952 (val!6362 Int)) )
))
(declare-datatypes ((ValueCell!5974 0))(
  ( (ValueCellFull!5974 (v!8649 V!17951)) (EmptyCell!5974) )
))
(declare-datatypes ((array!29061 0))(
  ( (array!29062 (arr!13962 (Array (_ BitVec 32) ValueCell!5974)) (size!14314 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29061)

(assert (=> b!464020 (= res!277433 (and (= (size!14314 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14313 _keys!1025) (size!14314 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!464021 () Bool)

(declare-fun e!271002 () Bool)

(declare-fun tp_is_empty!12635 () Bool)

(assert (=> b!464021 (= e!271002 tp_is_empty!12635)))

(declare-fun mapNonEmpty!20629 () Bool)

(declare-fun mapRes!20629 () Bool)

(declare-fun tp!39619 () Bool)

(assert (=> mapNonEmpty!20629 (= mapRes!20629 (and tp!39619 e!271002))))

(declare-fun mapRest!20629 () (Array (_ BitVec 32) ValueCell!5974))

(declare-fun mapKey!20629 () (_ BitVec 32))

(declare-fun mapValue!20629 () ValueCell!5974)

(assert (=> mapNonEmpty!20629 (= (arr!13962 _values!833) (store mapRest!20629 mapKey!20629 mapValue!20629))))

(declare-fun b!464023 () Bool)

(declare-fun e!270999 () Bool)

(declare-fun e!270998 () Bool)

(assert (=> b!464023 (= e!270999 (and e!270998 mapRes!20629))))

(declare-fun condMapEmpty!20629 () Bool)

(declare-fun mapDefault!20629 () ValueCell!5974)

