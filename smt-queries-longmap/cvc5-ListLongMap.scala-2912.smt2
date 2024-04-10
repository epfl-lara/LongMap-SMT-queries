; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41628 () Bool)

(assert start!41628)

(declare-fun b_free!11281 () Bool)

(declare-fun b_next!11281 () Bool)

(assert (=> start!41628 (= b_free!11281 (not b_next!11281))))

(declare-fun tp!39843 () Bool)

(declare-fun b_and!19629 () Bool)

(assert (=> start!41628 (= tp!39843 b_and!19629)))

(declare-fun mapNonEmpty!20743 () Bool)

(declare-fun mapRes!20743 () Bool)

(declare-fun tp!39844 () Bool)

(declare-fun e!271608 () Bool)

(assert (=> mapNonEmpty!20743 (= mapRes!20743 (and tp!39844 e!271608))))

(declare-fun mapKey!20743 () (_ BitVec 32))

(declare-datatypes ((V!18051 0))(
  ( (V!18052 (val!6399 Int)) )
))
(declare-datatypes ((ValueCell!6011 0))(
  ( (ValueCellFull!6011 (v!8686 V!18051)) (EmptyCell!6011) )
))
(declare-datatypes ((array!29203 0))(
  ( (array!29204 (arr!14032 (Array (_ BitVec 32) ValueCell!6011)) (size!14384 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29203)

(declare-fun mapRest!20743 () (Array (_ BitVec 32) ValueCell!6011))

(declare-fun mapValue!20743 () ValueCell!6011)

(assert (=> mapNonEmpty!20743 (= (arr!14032 _values!833) (store mapRest!20743 mapKey!20743 mapValue!20743))))

(declare-fun b!464882 () Bool)

(declare-fun res!277908 () Bool)

(declare-fun e!271610 () Bool)

(assert (=> b!464882 (=> (not res!277908) (not e!271610))))

(declare-datatypes ((array!29205 0))(
  ( (array!29206 (arr!14033 (Array (_ BitVec 32) (_ BitVec 64))) (size!14385 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29205)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29205 (_ BitVec 32)) Bool)

(assert (=> b!464882 (= res!277908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!464883 () Bool)

(declare-fun res!277910 () Bool)

(assert (=> b!464883 (=> (not res!277910) (not e!271610))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!464883 (= res!277910 (and (= (size!14384 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14385 _keys!1025) (size!14384 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!277911 () Bool)

(assert (=> start!41628 (=> (not res!277911) (not e!271610))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41628 (= res!277911 (validMask!0 mask!1365))))

(assert (=> start!41628 e!271610))

(declare-fun tp_is_empty!12709 () Bool)

(assert (=> start!41628 tp_is_empty!12709))

(assert (=> start!41628 tp!39843))

(assert (=> start!41628 true))

(declare-fun array_inv!10134 (array!29205) Bool)

(assert (=> start!41628 (array_inv!10134 _keys!1025)))

(declare-fun e!271612 () Bool)

(declare-fun array_inv!10135 (array!29203) Bool)

(assert (=> start!41628 (and (array_inv!10135 _values!833) e!271612)))

(declare-fun b!464884 () Bool)

(declare-fun e!271609 () Bool)

(assert (=> b!464884 (= e!271609 tp_is_empty!12709)))

(declare-fun b!464885 () Bool)

(assert (=> b!464885 (= e!271610 (not true))))

(declare-datatypes ((tuple2!8384 0))(
  ( (tuple2!8385 (_1!4203 (_ BitVec 64)) (_2!4203 V!18051)) )
))
(declare-datatypes ((List!8475 0))(
  ( (Nil!8472) (Cons!8471 (h!9327 tuple2!8384) (t!14423 List!8475)) )
))
(declare-datatypes ((ListLongMap!7297 0))(
  ( (ListLongMap!7298 (toList!3664 List!8475)) )
))
(declare-fun lt!209908 () ListLongMap!7297)

(declare-fun lt!209910 () ListLongMap!7297)

(assert (=> b!464885 (= lt!209908 lt!209910)))

(declare-fun minValueBefore!38 () V!18051)

(declare-fun zeroValue!794 () V!18051)

(declare-datatypes ((Unit!13496 0))(
  ( (Unit!13497) )
))
(declare-fun lt!209909 () Unit!13496)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18051)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!24 (array!29205 array!29203 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18051 V!18051 V!18051 V!18051 (_ BitVec 32) Int) Unit!13496)

(assert (=> b!464885 (= lt!209909 (lemmaNoChangeToArrayThenSameMapNoExtras!24 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1844 (array!29205 array!29203 (_ BitVec 32) (_ BitVec 32) V!18051 V!18051 (_ BitVec 32) Int) ListLongMap!7297)

(assert (=> b!464885 (= lt!209910 (getCurrentListMapNoExtraKeys!1844 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464885 (= lt!209908 (getCurrentListMapNoExtraKeys!1844 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!20743 () Bool)

(assert (=> mapIsEmpty!20743 mapRes!20743))

(declare-fun b!464886 () Bool)

(declare-fun res!277909 () Bool)

(assert (=> b!464886 (=> (not res!277909) (not e!271610))))

(declare-datatypes ((List!8476 0))(
  ( (Nil!8473) (Cons!8472 (h!9328 (_ BitVec 64)) (t!14424 List!8476)) )
))
(declare-fun arrayNoDuplicates!0 (array!29205 (_ BitVec 32) List!8476) Bool)

(assert (=> b!464886 (= res!277909 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8473))))

(declare-fun b!464887 () Bool)

(assert (=> b!464887 (= e!271612 (and e!271609 mapRes!20743))))

(declare-fun condMapEmpty!20743 () Bool)

(declare-fun mapDefault!20743 () ValueCell!6011)

