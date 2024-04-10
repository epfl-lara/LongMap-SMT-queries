; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42088 () Bool)

(assert start!42088)

(declare-fun b_free!11641 () Bool)

(declare-fun b_next!11641 () Bool)

(assert (=> start!42088 (= b_free!11641 (not b_next!11641))))

(declare-fun tp!40941 () Bool)

(declare-fun b_and!20051 () Bool)

(assert (=> start!42088 (= tp!40941 b_and!20051)))

(declare-fun b!469925 () Bool)

(declare-fun res!280830 () Bool)

(declare-fun e!275246 () Bool)

(assert (=> b!469925 (=> (not res!280830) (not e!275246))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((array!29909 0))(
  ( (array!29910 (arr!14379 (Array (_ BitVec 32) (_ BitVec 64))) (size!14731 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29909)

(declare-datatypes ((V!18531 0))(
  ( (V!18532 (val!6579 Int)) )
))
(declare-datatypes ((ValueCell!6191 0))(
  ( (ValueCellFull!6191 (v!8869 V!18531)) (EmptyCell!6191) )
))
(declare-datatypes ((array!29911 0))(
  ( (array!29912 (arr!14380 (Array (_ BitVec 32) ValueCell!6191)) (size!14732 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29911)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!469925 (= res!280830 (and (= (size!14732 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14731 _keys!1025) (size!14732 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!21301 () Bool)

(declare-fun mapRes!21301 () Bool)

(declare-fun tp!40942 () Bool)

(declare-fun e!275243 () Bool)

(assert (=> mapNonEmpty!21301 (= mapRes!21301 (and tp!40942 e!275243))))

(declare-fun mapRest!21301 () (Array (_ BitVec 32) ValueCell!6191))

(declare-fun mapKey!21301 () (_ BitVec 32))

(declare-fun mapValue!21301 () ValueCell!6191)

(assert (=> mapNonEmpty!21301 (= (arr!14380 _values!833) (store mapRest!21301 mapKey!21301 mapValue!21301))))

(declare-fun b!469926 () Bool)

(declare-fun res!280827 () Bool)

(assert (=> b!469926 (=> (not res!280827) (not e!275246))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29909 (_ BitVec 32)) Bool)

(assert (=> b!469926 (= res!280827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!469927 () Bool)

(declare-fun e!275247 () Bool)

(declare-fun tp_is_empty!13069 () Bool)

(assert (=> b!469927 (= e!275247 tp_is_empty!13069)))

(declare-fun b!469928 () Bool)

(declare-fun e!275242 () Bool)

(assert (=> b!469928 (= e!275242 (bvsle #b00000000000000000000000000000000 (size!14731 _keys!1025)))))

(declare-datatypes ((tuple2!8664 0))(
  ( (tuple2!8665 (_1!4343 (_ BitVec 64)) (_2!4343 V!18531)) )
))
(declare-datatypes ((List!8741 0))(
  ( (Nil!8738) (Cons!8737 (h!9593 tuple2!8664) (t!14701 List!8741)) )
))
(declare-datatypes ((ListLongMap!7577 0))(
  ( (ListLongMap!7578 (toList!3804 List!8741)) )
))
(declare-fun lt!213140 () ListLongMap!7577)

(declare-fun lt!213137 () tuple2!8664)

(declare-fun minValueBefore!38 () V!18531)

(declare-fun +!1711 (ListLongMap!7577 tuple2!8664) ListLongMap!7577)

(assert (=> b!469928 (= (+!1711 lt!213140 lt!213137) (+!1711 (+!1711 lt!213140 (tuple2!8665 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!213137))))

(declare-fun minValueAfter!38 () V!18531)

(assert (=> b!469928 (= lt!213137 (tuple2!8665 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13765 0))(
  ( (Unit!13766) )
))
(declare-fun lt!213139 () Unit!13765)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!124 (ListLongMap!7577 (_ BitVec 64) V!18531 V!18531) Unit!13765)

(assert (=> b!469928 (= lt!213139 (addSameAsAddTwiceSameKeyDiffValues!124 lt!213140 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun zeroValue!794 () V!18531)

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!213135 () ListLongMap!7577)

(declare-fun getCurrentListMap!2225 (array!29909 array!29911 (_ BitVec 32) (_ BitVec 32) V!18531 V!18531 (_ BitVec 32) Int) ListLongMap!7577)

(assert (=> b!469928 (= lt!213135 (getCurrentListMap!2225 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!213134 () ListLongMap!7577)

(assert (=> b!469928 (= lt!213134 (getCurrentListMap!2225 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469929 () Bool)

(assert (=> b!469929 (= e!275243 tp_is_empty!13069)))

(declare-fun mapIsEmpty!21301 () Bool)

(assert (=> mapIsEmpty!21301 mapRes!21301))

(declare-fun b!469931 () Bool)

(declare-fun res!280828 () Bool)

(assert (=> b!469931 (=> (not res!280828) (not e!275246))))

(declare-datatypes ((List!8742 0))(
  ( (Nil!8739) (Cons!8738 (h!9594 (_ BitVec 64)) (t!14702 List!8742)) )
))
(declare-fun arrayNoDuplicates!0 (array!29909 (_ BitVec 32) List!8742) Bool)

(assert (=> b!469931 (= res!280828 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8739))))

(declare-fun b!469932 () Bool)

(declare-fun e!275245 () Bool)

(assert (=> b!469932 (= e!275245 (and e!275247 mapRes!21301))))

(declare-fun condMapEmpty!21301 () Bool)

(declare-fun mapDefault!21301 () ValueCell!6191)

