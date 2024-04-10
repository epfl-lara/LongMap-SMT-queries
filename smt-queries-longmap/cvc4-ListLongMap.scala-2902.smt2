; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41558 () Bool)

(assert start!41558)

(declare-fun b_free!11225 () Bool)

(declare-fun b_next!11225 () Bool)

(assert (=> start!41558 (= b_free!11225 (not b_next!11225))))

(declare-fun tp!39672 () Bool)

(declare-fun b_and!19565 () Bool)

(assert (=> start!41558 (= tp!39672 b_and!19565)))

(declare-fun b!464209 () Bool)

(declare-fun e!271137 () Bool)

(declare-fun tp_is_empty!12653 () Bool)

(assert (=> b!464209 (= e!271137 tp_is_empty!12653)))

(declare-fun b!464210 () Bool)

(declare-fun res!277542 () Bool)

(declare-fun e!271136 () Bool)

(assert (=> b!464210 (=> (not res!277542) (not e!271136))))

(declare-datatypes ((array!29095 0))(
  ( (array!29096 (arr!13979 (Array (_ BitVec 32) (_ BitVec 64))) (size!14331 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29095)

(declare-datatypes ((List!8440 0))(
  ( (Nil!8437) (Cons!8436 (h!9292 (_ BitVec 64)) (t!14386 List!8440)) )
))
(declare-fun arrayNoDuplicates!0 (array!29095 (_ BitVec 32) List!8440) Bool)

(assert (=> b!464210 (= res!277542 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8437))))

(declare-fun b!464211 () Bool)

(assert (=> b!464211 (= e!271136 (not true))))

(declare-datatypes ((V!17975 0))(
  ( (V!17976 (val!6371 Int)) )
))
(declare-datatypes ((tuple2!8346 0))(
  ( (tuple2!8347 (_1!4184 (_ BitVec 64)) (_2!4184 V!17975)) )
))
(declare-datatypes ((List!8441 0))(
  ( (Nil!8438) (Cons!8437 (h!9293 tuple2!8346) (t!14387 List!8441)) )
))
(declare-datatypes ((ListLongMap!7259 0))(
  ( (ListLongMap!7260 (toList!3645 List!8441)) )
))
(declare-fun lt!209617 () ListLongMap!7259)

(declare-fun lt!209616 () ListLongMap!7259)

(assert (=> b!464211 (= lt!209617 lt!209616)))

(declare-fun minValueBefore!38 () V!17975)

(declare-fun zeroValue!794 () V!17975)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13458 0))(
  ( (Unit!13459) )
))
(declare-fun lt!209618 () Unit!13458)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5983 0))(
  ( (ValueCellFull!5983 (v!8658 V!17975)) (EmptyCell!5983) )
))
(declare-datatypes ((array!29097 0))(
  ( (array!29098 (arr!13980 (Array (_ BitVec 32) ValueCell!5983)) (size!14332 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29097)

(declare-fun minValueAfter!38 () V!17975)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!5 (array!29095 array!29097 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!17975 V!17975 V!17975 V!17975 (_ BitVec 32) Int) Unit!13458)

(assert (=> b!464211 (= lt!209618 (lemmaNoChangeToArrayThenSameMapNoExtras!5 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1825 (array!29095 array!29097 (_ BitVec 32) (_ BitVec 32) V!17975 V!17975 (_ BitVec 32) Int) ListLongMap!7259)

(assert (=> b!464211 (= lt!209616 (getCurrentListMapNoExtraKeys!1825 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464211 (= lt!209617 (getCurrentListMapNoExtraKeys!1825 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!20656 () Bool)

(declare-fun mapRes!20656 () Bool)

(assert (=> mapIsEmpty!20656 mapRes!20656))

(declare-fun mapNonEmpty!20656 () Bool)

(declare-fun tp!39673 () Bool)

(declare-fun e!271134 () Bool)

(assert (=> mapNonEmpty!20656 (= mapRes!20656 (and tp!39673 e!271134))))

(declare-fun mapRest!20656 () (Array (_ BitVec 32) ValueCell!5983))

(declare-fun mapValue!20656 () ValueCell!5983)

(declare-fun mapKey!20656 () (_ BitVec 32))

(assert (=> mapNonEmpty!20656 (= (arr!13980 _values!833) (store mapRest!20656 mapKey!20656 mapValue!20656))))

(declare-fun b!464213 () Bool)

(declare-fun e!271135 () Bool)

(assert (=> b!464213 (= e!271135 (and e!271137 mapRes!20656))))

(declare-fun condMapEmpty!20656 () Bool)

(declare-fun mapDefault!20656 () ValueCell!5983)

