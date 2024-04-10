; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41616 () Bool)

(assert start!41616)

(declare-fun b_free!11269 () Bool)

(declare-fun b_next!11269 () Bool)

(assert (=> start!41616 (= b_free!11269 (not b_next!11269))))

(declare-fun tp!39808 () Bool)

(declare-fun b_and!19617 () Bool)

(assert (=> start!41616 (= tp!39808 b_and!19617)))

(declare-fun b!464756 () Bool)

(declare-fun e!271520 () Bool)

(declare-fun tp_is_empty!12697 () Bool)

(assert (=> b!464756 (= e!271520 tp_is_empty!12697)))

(declare-fun b!464757 () Bool)

(declare-fun res!277839 () Bool)

(declare-fun e!271518 () Bool)

(assert (=> b!464757 (=> (not res!277839) (not e!271518))))

(declare-datatypes ((array!29181 0))(
  ( (array!29182 (arr!14021 (Array (_ BitVec 32) (_ BitVec 64))) (size!14373 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29181)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29181 (_ BitVec 32)) Bool)

(assert (=> b!464757 (= res!277839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!464758 () Bool)

(declare-fun res!277836 () Bool)

(assert (=> b!464758 (=> (not res!277836) (not e!271518))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((V!18035 0))(
  ( (V!18036 (val!6393 Int)) )
))
(declare-datatypes ((ValueCell!6005 0))(
  ( (ValueCellFull!6005 (v!8680 V!18035)) (EmptyCell!6005) )
))
(declare-datatypes ((array!29183 0))(
  ( (array!29184 (arr!14022 (Array (_ BitVec 32) ValueCell!6005)) (size!14374 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29183)

(assert (=> b!464758 (= res!277836 (and (= (size!14374 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14373 _keys!1025) (size!14374 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!464759 () Bool)

(declare-fun e!271519 () Bool)

(assert (=> b!464759 (= e!271519 tp_is_empty!12697)))

(declare-fun mapIsEmpty!20725 () Bool)

(declare-fun mapRes!20725 () Bool)

(assert (=> mapIsEmpty!20725 mapRes!20725))

(declare-fun mapNonEmpty!20725 () Bool)

(declare-fun tp!39807 () Bool)

(assert (=> mapNonEmpty!20725 (= mapRes!20725 (and tp!39807 e!271520))))

(declare-fun mapKey!20725 () (_ BitVec 32))

(declare-fun mapRest!20725 () (Array (_ BitVec 32) ValueCell!6005))

(declare-fun mapValue!20725 () ValueCell!6005)

(assert (=> mapNonEmpty!20725 (= (arr!14022 _values!833) (store mapRest!20725 mapKey!20725 mapValue!20725))))

(declare-fun res!277838 () Bool)

(assert (=> start!41616 (=> (not res!277838) (not e!271518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41616 (= res!277838 (validMask!0 mask!1365))))

(assert (=> start!41616 e!271518))

(assert (=> start!41616 tp_is_empty!12697))

(assert (=> start!41616 tp!39808))

(assert (=> start!41616 true))

(declare-fun array_inv!10124 (array!29181) Bool)

(assert (=> start!41616 (array_inv!10124 _keys!1025)))

(declare-fun e!271521 () Bool)

(declare-fun array_inv!10125 (array!29183) Bool)

(assert (=> start!41616 (and (array_inv!10125 _values!833) e!271521)))

(declare-fun b!464760 () Bool)

(assert (=> b!464760 (= e!271518 (not true))))

(declare-datatypes ((tuple2!8374 0))(
  ( (tuple2!8375 (_1!4198 (_ BitVec 64)) (_2!4198 V!18035)) )
))
(declare-datatypes ((List!8467 0))(
  ( (Nil!8464) (Cons!8463 (h!9319 tuple2!8374) (t!14415 List!8467)) )
))
(declare-datatypes ((ListLongMap!7287 0))(
  ( (ListLongMap!7288 (toList!3659 List!8467)) )
))
(declare-fun lt!209855 () ListLongMap!7287)

(declare-fun lt!209856 () ListLongMap!7287)

(assert (=> b!464760 (= lt!209855 lt!209856)))

(declare-datatypes ((Unit!13486 0))(
  ( (Unit!13487) )
))
(declare-fun lt!209854 () Unit!13486)

(declare-fun minValueBefore!38 () V!18035)

(declare-fun zeroValue!794 () V!18035)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18035)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!19 (array!29181 array!29183 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18035 V!18035 V!18035 V!18035 (_ BitVec 32) Int) Unit!13486)

(assert (=> b!464760 (= lt!209854 (lemmaNoChangeToArrayThenSameMapNoExtras!19 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1839 (array!29181 array!29183 (_ BitVec 32) (_ BitVec 32) V!18035 V!18035 (_ BitVec 32) Int) ListLongMap!7287)

(assert (=> b!464760 (= lt!209856 (getCurrentListMapNoExtraKeys!1839 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464760 (= lt!209855 (getCurrentListMapNoExtraKeys!1839 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!464761 () Bool)

(declare-fun res!277837 () Bool)

(assert (=> b!464761 (=> (not res!277837) (not e!271518))))

(declare-datatypes ((List!8468 0))(
  ( (Nil!8465) (Cons!8464 (h!9320 (_ BitVec 64)) (t!14416 List!8468)) )
))
(declare-fun arrayNoDuplicates!0 (array!29181 (_ BitVec 32) List!8468) Bool)

(assert (=> b!464761 (= res!277837 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8465))))

(declare-fun b!464762 () Bool)

(assert (=> b!464762 (= e!271521 (and e!271519 mapRes!20725))))

(declare-fun condMapEmpty!20725 () Bool)

(declare-fun mapDefault!20725 () ValueCell!6005)

