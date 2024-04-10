; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41650 () Bool)

(assert start!41650)

(declare-fun b_free!11303 () Bool)

(declare-fun b_next!11303 () Bool)

(assert (=> start!41650 (= b_free!11303 (not b_next!11303))))

(declare-fun tp!39910 () Bool)

(declare-fun b_and!19651 () Bool)

(assert (=> start!41650 (= tp!39910 b_and!19651)))

(declare-fun b!465113 () Bool)

(declare-fun e!271773 () Bool)

(assert (=> b!465113 (= e!271773 (not true))))

(declare-datatypes ((V!18079 0))(
  ( (V!18080 (val!6410 Int)) )
))
(declare-datatypes ((tuple2!8400 0))(
  ( (tuple2!8401 (_1!4211 (_ BitVec 64)) (_2!4211 V!18079)) )
))
(declare-datatypes ((List!8492 0))(
  ( (Nil!8489) (Cons!8488 (h!9344 tuple2!8400) (t!14440 List!8492)) )
))
(declare-datatypes ((ListLongMap!7313 0))(
  ( (ListLongMap!7314 (toList!3672 List!8492)) )
))
(declare-fun lt!210009 () ListLongMap!7313)

(declare-fun lt!210007 () ListLongMap!7313)

(assert (=> b!465113 (= lt!210009 lt!210007)))

(declare-datatypes ((Unit!13512 0))(
  ( (Unit!13513) )
))
(declare-fun lt!210008 () Unit!13512)

(declare-fun minValueBefore!38 () V!18079)

(declare-fun zeroValue!794 () V!18079)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29247 0))(
  ( (array!29248 (arr!14054 (Array (_ BitVec 32) (_ BitVec 64))) (size!14406 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29247)

(declare-datatypes ((ValueCell!6022 0))(
  ( (ValueCellFull!6022 (v!8697 V!18079)) (EmptyCell!6022) )
))
(declare-datatypes ((array!29249 0))(
  ( (array!29250 (arr!14055 (Array (_ BitVec 32) ValueCell!6022)) (size!14407 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29249)

(declare-fun minValueAfter!38 () V!18079)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!32 (array!29247 array!29249 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18079 V!18079 V!18079 V!18079 (_ BitVec 32) Int) Unit!13512)

(assert (=> b!465113 (= lt!210008 (lemmaNoChangeToArrayThenSameMapNoExtras!32 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1852 (array!29247 array!29249 (_ BitVec 32) (_ BitVec 32) V!18079 V!18079 (_ BitVec 32) Int) ListLongMap!7313)

(assert (=> b!465113 (= lt!210007 (getCurrentListMapNoExtraKeys!1852 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465113 (= lt!210009 (getCurrentListMapNoExtraKeys!1852 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!465114 () Bool)

(declare-fun res!278042 () Bool)

(assert (=> b!465114 (=> (not res!278042) (not e!271773))))

(declare-datatypes ((List!8493 0))(
  ( (Nil!8490) (Cons!8489 (h!9345 (_ BitVec 64)) (t!14441 List!8493)) )
))
(declare-fun arrayNoDuplicates!0 (array!29247 (_ BitVec 32) List!8493) Bool)

(assert (=> b!465114 (= res!278042 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8490))))

(declare-fun b!465115 () Bool)

(declare-fun res!278040 () Bool)

(assert (=> b!465115 (=> (not res!278040) (not e!271773))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29247 (_ BitVec 32)) Bool)

(assert (=> b!465115 (= res!278040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!20776 () Bool)

(declare-fun mapRes!20776 () Bool)

(declare-fun tp!39909 () Bool)

(declare-fun e!271777 () Bool)

(assert (=> mapNonEmpty!20776 (= mapRes!20776 (and tp!39909 e!271777))))

(declare-fun mapRest!20776 () (Array (_ BitVec 32) ValueCell!6022))

(declare-fun mapValue!20776 () ValueCell!6022)

(declare-fun mapKey!20776 () (_ BitVec 32))

(assert (=> mapNonEmpty!20776 (= (arr!14055 _values!833) (store mapRest!20776 mapKey!20776 mapValue!20776))))

(declare-fun b!465116 () Bool)

(declare-fun res!278041 () Bool)

(assert (=> b!465116 (=> (not res!278041) (not e!271773))))

(assert (=> b!465116 (= res!278041 (and (= (size!14407 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14406 _keys!1025) (size!14407 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!278043 () Bool)

(assert (=> start!41650 (=> (not res!278043) (not e!271773))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41650 (= res!278043 (validMask!0 mask!1365))))

(assert (=> start!41650 e!271773))

(declare-fun tp_is_empty!12731 () Bool)

(assert (=> start!41650 tp_is_empty!12731))

(assert (=> start!41650 tp!39910))

(assert (=> start!41650 true))

(declare-fun array_inv!10156 (array!29247) Bool)

(assert (=> start!41650 (array_inv!10156 _keys!1025)))

(declare-fun e!271776 () Bool)

(declare-fun array_inv!10157 (array!29249) Bool)

(assert (=> start!41650 (and (array_inv!10157 _values!833) e!271776)))

(declare-fun b!465117 () Bool)

(declare-fun e!271775 () Bool)

(assert (=> b!465117 (= e!271775 tp_is_empty!12731)))

(declare-fun b!465118 () Bool)

(assert (=> b!465118 (= e!271776 (and e!271775 mapRes!20776))))

(declare-fun condMapEmpty!20776 () Bool)

(declare-fun mapDefault!20776 () ValueCell!6022)

