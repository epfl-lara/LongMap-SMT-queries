; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41808 () Bool)

(assert start!41808)

(declare-fun b_free!11429 () Bool)

(declare-fun b_next!11429 () Bool)

(assert (=> start!41808 (= b_free!11429 (not b_next!11429))))

(declare-fun tp!40293 () Bool)

(declare-fun b_and!19797 () Bool)

(assert (=> start!41808 (= tp!40293 b_and!19797)))

(declare-fun b!466875 () Bool)

(declare-fun e!273049 () Bool)

(declare-fun tp_is_empty!12857 () Bool)

(assert (=> b!466875 (= e!273049 tp_is_empty!12857)))

(declare-fun b!466876 () Bool)

(declare-fun e!273048 () Bool)

(declare-datatypes ((array!29495 0))(
  ( (array!29496 (arr!14176 (Array (_ BitVec 32) (_ BitVec 64))) (size!14528 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29495)

(assert (=> b!466876 (= e!273048 (bvsle #b00000000000000000000000000000000 (size!14528 _keys!1025)))))

(declare-fun mapIsEmpty!20971 () Bool)

(declare-fun mapRes!20971 () Bool)

(assert (=> mapIsEmpty!20971 mapRes!20971))

(declare-fun mapNonEmpty!20971 () Bool)

(declare-fun tp!40294 () Bool)

(assert (=> mapNonEmpty!20971 (= mapRes!20971 (and tp!40294 e!273049))))

(declare-datatypes ((V!18247 0))(
  ( (V!18248 (val!6473 Int)) )
))
(declare-datatypes ((ValueCell!6085 0))(
  ( (ValueCellFull!6085 (v!8761 V!18247)) (EmptyCell!6085) )
))
(declare-fun mapValue!20971 () ValueCell!6085)

(declare-datatypes ((array!29497 0))(
  ( (array!29498 (arr!14177 (Array (_ BitVec 32) ValueCell!6085)) (size!14529 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29497)

(declare-fun mapKey!20971 () (_ BitVec 32))

(declare-fun mapRest!20971 () (Array (_ BitVec 32) ValueCell!6085))

(assert (=> mapNonEmpty!20971 (= (arr!14177 _values!833) (store mapRest!20971 mapKey!20971 mapValue!20971))))

(declare-fun b!466877 () Bool)

(declare-fun res!279083 () Bool)

(assert (=> b!466877 (=> res!279083 e!273048)))

(declare-fun minValueBefore!38 () V!18247)

(declare-fun zeroValue!794 () V!18247)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18247)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((tuple2!8492 0))(
  ( (tuple2!8493 (_1!4257 (_ BitVec 64)) (_2!4257 V!18247)) )
))
(declare-datatypes ((List!8582 0))(
  ( (Nil!8579) (Cons!8578 (h!9434 tuple2!8492) (t!14534 List!8582)) )
))
(declare-datatypes ((ListLongMap!7405 0))(
  ( (ListLongMap!7406 (toList!3718 List!8582)) )
))
(declare-fun +!1672 (ListLongMap!7405 tuple2!8492) ListLongMap!7405)

(declare-fun getCurrentListMap!2166 (array!29495 array!29497 (_ BitVec 32) (_ BitVec 32) V!18247 V!18247 (_ BitVec 32) Int) ListLongMap!7405)

(assert (=> b!466877 (= res!279083 (not (= (+!1672 (getCurrentListMap!2166 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8493 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (getCurrentListMap!2166 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))))

(declare-fun b!466878 () Bool)

(declare-fun e!273047 () Bool)

(declare-fun e!273046 () Bool)

(assert (=> b!466878 (= e!273047 (and e!273046 mapRes!20971))))

(declare-fun condMapEmpty!20971 () Bool)

(declare-fun mapDefault!20971 () ValueCell!6085)

