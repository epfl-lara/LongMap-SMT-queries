; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41542 () Bool)

(assert start!41542)

(declare-fun b_free!11209 () Bool)

(declare-fun b_next!11209 () Bool)

(assert (=> start!41542 (= b_free!11209 (not b_next!11209))))

(declare-fun tp!39624 () Bool)

(declare-fun b_and!19549 () Bool)

(assert (=> start!41542 (= tp!39624 b_and!19549)))

(declare-fun mapNonEmpty!20632 () Bool)

(declare-fun mapRes!20632 () Bool)

(declare-fun tp!39625 () Bool)

(declare-fun e!271016 () Bool)

(assert (=> mapNonEmpty!20632 (= mapRes!20632 (and tp!39625 e!271016))))

(declare-datatypes ((V!17955 0))(
  ( (V!17956 (val!6363 Int)) )
))
(declare-datatypes ((ValueCell!5975 0))(
  ( (ValueCellFull!5975 (v!8650 V!17955)) (EmptyCell!5975) )
))
(declare-datatypes ((array!29063 0))(
  ( (array!29064 (arr!13963 (Array (_ BitVec 32) ValueCell!5975)) (size!14315 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29063)

(declare-fun mapValue!20632 () ValueCell!5975)

(declare-fun mapKey!20632 () (_ BitVec 32))

(declare-fun mapRest!20632 () (Array (_ BitVec 32) ValueCell!5975))

(assert (=> mapNonEmpty!20632 (= (arr!13963 _values!833) (store mapRest!20632 mapKey!20632 mapValue!20632))))

(declare-fun b!464041 () Bool)

(declare-fun e!271014 () Bool)

(assert (=> b!464041 (= e!271014 false)))

(declare-fun zeroValue!794 () V!17955)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8334 0))(
  ( (tuple2!8335 (_1!4178 (_ BitVec 64)) (_2!4178 V!17955)) )
))
(declare-datatypes ((List!8429 0))(
  ( (Nil!8426) (Cons!8425 (h!9281 tuple2!8334) (t!14375 List!8429)) )
))
(declare-datatypes ((ListLongMap!7247 0))(
  ( (ListLongMap!7248 (toList!3639 List!8429)) )
))
(declare-fun lt!209551 () ListLongMap!7247)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29065 0))(
  ( (array!29066 (arr!13964 (Array (_ BitVec 32) (_ BitVec 64))) (size!14316 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29065)

(declare-fun minValueAfter!38 () V!17955)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1819 (array!29065 array!29063 (_ BitVec 32) (_ BitVec 32) V!17955 V!17955 (_ BitVec 32) Int) ListLongMap!7247)

(assert (=> b!464041 (= lt!209551 (getCurrentListMapNoExtraKeys!1819 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!209552 () ListLongMap!7247)

(declare-fun minValueBefore!38 () V!17955)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!464041 (= lt!209552 (getCurrentListMapNoExtraKeys!1819 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!464042 () Bool)

(declare-fun e!271013 () Bool)

(declare-fun e!271017 () Bool)

(assert (=> b!464042 (= e!271013 (and e!271017 mapRes!20632))))

(declare-fun condMapEmpty!20632 () Bool)

(declare-fun mapDefault!20632 () ValueCell!5975)

