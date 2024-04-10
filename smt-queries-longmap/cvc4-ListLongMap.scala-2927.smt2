; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41736 () Bool)

(assert start!41736)

(declare-fun b_free!11375 () Bool)

(declare-fun b_next!11375 () Bool)

(assert (=> start!41736 (= b_free!11375 (not b_next!11375))))

(declare-fun tp!40128 () Bool)

(declare-fun b_and!19731 () Bool)

(assert (=> start!41736 (= tp!40128 b_and!19731)))

(declare-fun b!466042 () Bool)

(declare-fun res!278595 () Bool)

(declare-fun e!272453 () Bool)

(assert (=> b!466042 (=> res!278595 e!272453)))

(declare-datatypes ((V!18175 0))(
  ( (V!18176 (val!6446 Int)) )
))
(declare-fun minValueBefore!38 () V!18175)

(declare-fun zeroValue!794 () V!18175)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29387 0))(
  ( (array!29388 (arr!14123 (Array (_ BitVec 32) (_ BitVec 64))) (size!14475 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29387)

(declare-datatypes ((ValueCell!6058 0))(
  ( (ValueCellFull!6058 (v!8733 V!18175)) (EmptyCell!6058) )
))
(declare-datatypes ((array!29389 0))(
  ( (array!29390 (arr!14124 (Array (_ BitVec 32) ValueCell!6058)) (size!14476 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29389)

(declare-fun minValueAfter!38 () V!18175)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-datatypes ((tuple2!8448 0))(
  ( (tuple2!8449 (_1!4235 (_ BitVec 64)) (_2!4235 V!18175)) )
))
(declare-datatypes ((List!8541 0))(
  ( (Nil!8538) (Cons!8537 (h!9393 tuple2!8448) (t!14491 List!8541)) )
))
(declare-datatypes ((ListLongMap!7361 0))(
  ( (ListLongMap!7362 (toList!3696 List!8541)) )
))
(declare-fun +!1654 (ListLongMap!7361 tuple2!8448) ListLongMap!7361)

(declare-fun getCurrentListMap!2148 (array!29387 array!29389 (_ BitVec 32) (_ BitVec 32) V!18175 V!18175 (_ BitVec 32) Int) ListLongMap!7361)

(assert (=> b!466042 (= res!278595 (not (= (+!1654 (getCurrentListMap!2148 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8449 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (getCurrentListMap!2148 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))))

(declare-fun mapIsEmpty!20887 () Bool)

(declare-fun mapRes!20887 () Bool)

(assert (=> mapIsEmpty!20887 mapRes!20887))

(declare-fun mapNonEmpty!20887 () Bool)

(declare-fun tp!40129 () Bool)

(declare-fun e!272449 () Bool)

(assert (=> mapNonEmpty!20887 (= mapRes!20887 (and tp!40129 e!272449))))

(declare-fun mapKey!20887 () (_ BitVec 32))

(declare-fun mapValue!20887 () ValueCell!6058)

(declare-fun mapRest!20887 () (Array (_ BitVec 32) ValueCell!6058))

(assert (=> mapNonEmpty!20887 (= (arr!14124 _values!833) (store mapRest!20887 mapKey!20887 mapValue!20887))))

(declare-fun b!466043 () Bool)

(declare-fun res!278591 () Bool)

(declare-fun e!272450 () Bool)

(assert (=> b!466043 (=> (not res!278591) (not e!272450))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29387 (_ BitVec 32)) Bool)

(assert (=> b!466043 (= res!278591 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!466044 () Bool)

(declare-fun tp_is_empty!12803 () Bool)

(assert (=> b!466044 (= e!272449 tp_is_empty!12803)))

(declare-fun res!278593 () Bool)

(assert (=> start!41736 (=> (not res!278593) (not e!272450))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41736 (= res!278593 (validMask!0 mask!1365))))

(assert (=> start!41736 e!272450))

(assert (=> start!41736 tp_is_empty!12803))

(assert (=> start!41736 tp!40128))

(assert (=> start!41736 true))

(declare-fun array_inv!10200 (array!29387) Bool)

(assert (=> start!41736 (array_inv!10200 _keys!1025)))

(declare-fun e!272452 () Bool)

(declare-fun array_inv!10201 (array!29389) Bool)

(assert (=> start!41736 (and (array_inv!10201 _values!833) e!272452)))

(declare-fun b!466045 () Bool)

(declare-fun e!272448 () Bool)

(assert (=> b!466045 (= e!272452 (and e!272448 mapRes!20887))))

(declare-fun condMapEmpty!20887 () Bool)

(declare-fun mapDefault!20887 () ValueCell!6058)

