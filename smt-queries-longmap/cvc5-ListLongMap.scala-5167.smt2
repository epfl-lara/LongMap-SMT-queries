; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69976 () Bool)

(assert start!69976)

(declare-fun b_free!12409 () Bool)

(declare-fun b_next!12409 () Bool)

(assert (=> start!69976 (= b_free!12409 (not b_next!12409))))

(declare-fun tp!43939 () Bool)

(declare-fun b_and!21177 () Bool)

(assert (=> start!69976 (= tp!43939 b_and!21177)))

(declare-fun b!813376 () Bool)

(declare-fun res!555686 () Bool)

(declare-fun e!450701 () Bool)

(assert (=> b!813376 (=> (not res!555686) (not e!450701))))

(declare-datatypes ((array!44446 0))(
  ( (array!44447 (arr!21284 (Array (_ BitVec 32) (_ BitVec 64))) (size!21705 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44446)

(declare-datatypes ((List!15137 0))(
  ( (Nil!15134) (Cons!15133 (h!16262 (_ BitVec 64)) (t!21452 List!15137)) )
))
(declare-fun arrayNoDuplicates!0 (array!44446 (_ BitVec 32) List!15137) Bool)

(assert (=> b!813376 (= res!555686 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15134))))

(declare-fun b!813377 () Bool)

(declare-fun e!450705 () Bool)

(declare-fun tp_is_empty!14119 () Bool)

(assert (=> b!813377 (= e!450705 tp_is_empty!14119)))

(declare-fun mapIsEmpty!22756 () Bool)

(declare-fun mapRes!22756 () Bool)

(assert (=> mapIsEmpty!22756 mapRes!22756))

(declare-fun b!813378 () Bool)

(declare-fun e!450704 () Bool)

(assert (=> b!813378 (= e!450704 tp_is_empty!14119)))

(declare-fun b!813379 () Bool)

(assert (=> b!813379 (= e!450701 (bvsgt #b00000000000000000000000000000000 (size!21705 _keys!976)))))

(declare-datatypes ((V!23827 0))(
  ( (V!23828 (val!7107 Int)) )
))
(declare-fun zeroValueBefore!34 () V!23827)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!23827)

(declare-datatypes ((ValueCell!6644 0))(
  ( (ValueCellFull!6644 (v!9534 V!23827)) (EmptyCell!6644) )
))
(declare-datatypes ((array!44448 0))(
  ( (array!44449 (arr!21285 (Array (_ BitVec 32) ValueCell!6644)) (size!21706 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44448)

(declare-fun defaultEntry!796 () Int)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-datatypes ((tuple2!9304 0))(
  ( (tuple2!9305 (_1!4663 (_ BitVec 64)) (_2!4663 V!23827)) )
))
(declare-datatypes ((List!15138 0))(
  ( (Nil!15135) (Cons!15134 (h!16263 tuple2!9304) (t!21453 List!15138)) )
))
(declare-datatypes ((ListLongMap!8127 0))(
  ( (ListLongMap!8128 (toList!4079 List!15138)) )
))
(declare-fun lt!364275 () ListLongMap!8127)

(declare-fun getCurrentListMapNoExtraKeys!2129 (array!44446 array!44448 (_ BitVec 32) (_ BitVec 32) V!23827 V!23827 (_ BitVec 32) Int) ListLongMap!8127)

(assert (=> b!813379 (= lt!364275 (getCurrentListMapNoExtraKeys!2129 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!22756 () Bool)

(declare-fun tp!43938 () Bool)

(assert (=> mapNonEmpty!22756 (= mapRes!22756 (and tp!43938 e!450705))))

(declare-fun mapValue!22756 () ValueCell!6644)

(declare-fun mapRest!22756 () (Array (_ BitVec 32) ValueCell!6644))

(declare-fun mapKey!22756 () (_ BitVec 32))

(assert (=> mapNonEmpty!22756 (= (arr!21285 _values!788) (store mapRest!22756 mapKey!22756 mapValue!22756))))

(declare-fun res!555687 () Bool)

(assert (=> start!69976 (=> (not res!555687) (not e!450701))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69976 (= res!555687 (validMask!0 mask!1312))))

(assert (=> start!69976 e!450701))

(assert (=> start!69976 tp_is_empty!14119))

(declare-fun array_inv!17045 (array!44446) Bool)

(assert (=> start!69976 (array_inv!17045 _keys!976)))

(assert (=> start!69976 true))

(declare-fun e!450702 () Bool)

(declare-fun array_inv!17046 (array!44448) Bool)

(assert (=> start!69976 (and (array_inv!17046 _values!788) e!450702)))

(assert (=> start!69976 tp!43939))

(declare-fun b!813380 () Bool)

(assert (=> b!813380 (= e!450702 (and e!450704 mapRes!22756))))

(declare-fun condMapEmpty!22756 () Bool)

(declare-fun mapDefault!22756 () ValueCell!6644)

