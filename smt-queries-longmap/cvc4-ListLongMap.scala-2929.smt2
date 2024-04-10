; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41766 () Bool)

(assert start!41766)

(declare-fun b_free!11387 () Bool)

(declare-fun b_next!11387 () Bool)

(assert (=> start!41766 (= b_free!11387 (not b_next!11387))))

(declare-fun tp!40168 () Bool)

(declare-fun b_and!19755 () Bool)

(assert (=> start!41766 (= tp!40168 b_and!19755)))

(declare-fun res!278757 () Bool)

(declare-fun e!272671 () Bool)

(assert (=> start!41766 (=> (not res!278757) (not e!272671))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41766 (= res!278757 (validMask!0 mask!1365))))

(assert (=> start!41766 e!272671))

(declare-fun tp_is_empty!12815 () Bool)

(assert (=> start!41766 tp_is_empty!12815))

(assert (=> start!41766 tp!40168))

(assert (=> start!41766 true))

(declare-datatypes ((array!29413 0))(
  ( (array!29414 (arr!14135 (Array (_ BitVec 32) (_ BitVec 64))) (size!14487 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29413)

(declare-fun array_inv!10206 (array!29413) Bool)

(assert (=> start!41766 (array_inv!10206 _keys!1025)))

(declare-datatypes ((V!18191 0))(
  ( (V!18192 (val!6452 Int)) )
))
(declare-datatypes ((ValueCell!6064 0))(
  ( (ValueCellFull!6064 (v!8740 V!18191)) (EmptyCell!6064) )
))
(declare-datatypes ((array!29415 0))(
  ( (array!29416 (arr!14136 (Array (_ BitVec 32) ValueCell!6064)) (size!14488 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29415)

(declare-fun e!272667 () Bool)

(declare-fun array_inv!10207 (array!29415) Bool)

(assert (=> start!41766 (and (array_inv!10207 _values!833) e!272667)))

(declare-fun b!466362 () Bool)

(declare-fun e!272666 () Bool)

(assert (=> b!466362 (= e!272666 true)))

(declare-datatypes ((tuple2!8458 0))(
  ( (tuple2!8459 (_1!4240 (_ BitVec 64)) (_2!4240 V!18191)) )
))
(declare-datatypes ((List!8550 0))(
  ( (Nil!8547) (Cons!8546 (h!9402 tuple2!8458) (t!14502 List!8550)) )
))
(declare-datatypes ((ListLongMap!7371 0))(
  ( (ListLongMap!7372 (toList!3701 List!8550)) )
))
(declare-fun lt!210747 () ListLongMap!7371)

(declare-fun zeroValue!794 () V!18191)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18191)

(declare-fun getCurrentListMap!2151 (array!29413 array!29415 (_ BitVec 32) (_ BitVec 32) V!18191 V!18191 (_ BitVec 32) Int) ListLongMap!7371)

(assert (=> b!466362 (= lt!210747 (getCurrentListMap!2151 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!18191)

(declare-fun lt!210745 () ListLongMap!7371)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun +!1657 (ListLongMap!7371 tuple2!8458) ListLongMap!7371)

(assert (=> b!466362 (= lt!210745 (+!1657 (getCurrentListMap!2151 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8459 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun mapNonEmpty!20908 () Bool)

(declare-fun mapRes!20908 () Bool)

(declare-fun tp!40167 () Bool)

(declare-fun e!272670 () Bool)

(assert (=> mapNonEmpty!20908 (= mapRes!20908 (and tp!40167 e!272670))))

(declare-fun mapRest!20908 () (Array (_ BitVec 32) ValueCell!6064))

(declare-fun mapValue!20908 () ValueCell!6064)

(declare-fun mapKey!20908 () (_ BitVec 32))

(assert (=> mapNonEmpty!20908 (= (arr!14136 _values!833) (store mapRest!20908 mapKey!20908 mapValue!20908))))

(declare-fun b!466363 () Bool)

(declare-fun e!272668 () Bool)

(assert (=> b!466363 (= e!272667 (and e!272668 mapRes!20908))))

(declare-fun condMapEmpty!20908 () Bool)

(declare-fun mapDefault!20908 () ValueCell!6064)

