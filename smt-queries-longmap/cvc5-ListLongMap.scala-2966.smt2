; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42052 () Bool)

(assert start!42052)

(declare-fun b_free!11605 () Bool)

(declare-fun b_next!11605 () Bool)

(assert (=> start!42052 (= b_free!11605 (not b_next!11605))))

(declare-fun tp!40833 () Bool)

(declare-fun b_and!20015 () Bool)

(assert (=> start!42052 (= tp!40833 b_and!20015)))

(declare-fun b!469493 () Bool)

(declare-fun e!274919 () Bool)

(declare-fun tp_is_empty!13033 () Bool)

(assert (=> b!469493 (= e!274919 tp_is_empty!13033)))

(declare-fun b!469494 () Bool)

(declare-fun res!280560 () Bool)

(declare-fun e!274918 () Bool)

(assert (=> b!469494 (=> (not res!280560) (not e!274918))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29839 0))(
  ( (array!29840 (arr!14344 (Array (_ BitVec 32) (_ BitVec 64))) (size!14696 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29839)

(declare-datatypes ((V!18483 0))(
  ( (V!18484 (val!6561 Int)) )
))
(declare-datatypes ((ValueCell!6173 0))(
  ( (ValueCellFull!6173 (v!8851 V!18483)) (EmptyCell!6173) )
))
(declare-datatypes ((array!29841 0))(
  ( (array!29842 (arr!14345 (Array (_ BitVec 32) ValueCell!6173)) (size!14697 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29841)

(assert (=> b!469494 (= res!280560 (and (= (size!14697 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14696 _keys!1025) (size!14697 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!469495 () Bool)

(declare-fun e!274920 () Bool)

(assert (=> b!469495 (= e!274920 tp_is_empty!13033)))

(declare-fun b!469496 () Bool)

(declare-fun e!274923 () Bool)

(assert (=> b!469496 (= e!274918 (not e!274923))))

(declare-fun res!280558 () Bool)

(assert (=> b!469496 (=> res!280558 e!274923)))

(assert (=> b!469496 (= res!280558 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8636 0))(
  ( (tuple2!8637 (_1!4329 (_ BitVec 64)) (_2!4329 V!18483)) )
))
(declare-datatypes ((List!8715 0))(
  ( (Nil!8712) (Cons!8711 (h!9567 tuple2!8636) (t!14675 List!8715)) )
))
(declare-datatypes ((ListLongMap!7549 0))(
  ( (ListLongMap!7550 (toList!3790 List!8715)) )
))
(declare-fun lt!212756 () ListLongMap!7549)

(declare-fun lt!212760 () ListLongMap!7549)

(assert (=> b!469496 (= lt!212756 lt!212760)))

(declare-datatypes ((Unit!13737 0))(
  ( (Unit!13738) )
))
(declare-fun lt!212762 () Unit!13737)

(declare-fun minValueBefore!38 () V!18483)

(declare-fun zeroValue!794 () V!18483)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18483)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!138 (array!29839 array!29841 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18483 V!18483 V!18483 V!18483 (_ BitVec 32) Int) Unit!13737)

(assert (=> b!469496 (= lt!212762 (lemmaNoChangeToArrayThenSameMapNoExtras!138 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1958 (array!29839 array!29841 (_ BitVec 32) (_ BitVec 32) V!18483 V!18483 (_ BitVec 32) Int) ListLongMap!7549)

(assert (=> b!469496 (= lt!212760 (getCurrentListMapNoExtraKeys!1958 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469496 (= lt!212756 (getCurrentListMapNoExtraKeys!1958 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21247 () Bool)

(declare-fun mapRes!21247 () Bool)

(assert (=> mapIsEmpty!21247 mapRes!21247))

(declare-fun b!469497 () Bool)

(declare-fun res!280561 () Bool)

(assert (=> b!469497 (=> (not res!280561) (not e!274918))))

(declare-datatypes ((List!8716 0))(
  ( (Nil!8713) (Cons!8712 (h!9568 (_ BitVec 64)) (t!14676 List!8716)) )
))
(declare-fun arrayNoDuplicates!0 (array!29839 (_ BitVec 32) List!8716) Bool)

(assert (=> b!469497 (= res!280561 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8713))))

(declare-fun mapNonEmpty!21247 () Bool)

(declare-fun tp!40834 () Bool)

(assert (=> mapNonEmpty!21247 (= mapRes!21247 (and tp!40834 e!274920))))

(declare-fun mapRest!21247 () (Array (_ BitVec 32) ValueCell!6173))

(declare-fun mapValue!21247 () ValueCell!6173)

(declare-fun mapKey!21247 () (_ BitVec 32))

(assert (=> mapNonEmpty!21247 (= (arr!14345 _values!833) (store mapRest!21247 mapKey!21247 mapValue!21247))))

(declare-fun b!469498 () Bool)

(declare-fun res!280557 () Bool)

(assert (=> b!469498 (=> (not res!280557) (not e!274918))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29839 (_ BitVec 32)) Bool)

(assert (=> b!469498 (= res!280557 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!469499 () Bool)

(assert (=> b!469499 (= e!274923 true)))

(declare-fun lt!212759 () tuple2!8636)

(declare-fun +!1698 (ListLongMap!7549 tuple2!8636) ListLongMap!7549)

(assert (=> b!469499 (= (+!1698 lt!212756 lt!212759) (+!1698 (+!1698 lt!212756 (tuple2!8637 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212759))))

(assert (=> b!469499 (= lt!212759 (tuple2!8637 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!212761 () Unit!13737)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!111 (ListLongMap!7549 (_ BitVec 64) V!18483 V!18483) Unit!13737)

(assert (=> b!469499 (= lt!212761 (addSameAsAddTwiceSameKeyDiffValues!111 lt!212756 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!212757 () ListLongMap!7549)

(declare-fun getCurrentListMap!2212 (array!29839 array!29841 (_ BitVec 32) (_ BitVec 32) V!18483 V!18483 (_ BitVec 32) Int) ListLongMap!7549)

(assert (=> b!469499 (= lt!212757 (getCurrentListMap!2212 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212758 () ListLongMap!7549)

(assert (=> b!469499 (= lt!212758 (getCurrentListMap!2212 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!280559 () Bool)

(assert (=> start!42052 (=> (not res!280559) (not e!274918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42052 (= res!280559 (validMask!0 mask!1365))))

(assert (=> start!42052 e!274918))

(assert (=> start!42052 tp_is_empty!13033))

(assert (=> start!42052 tp!40833))

(assert (=> start!42052 true))

(declare-fun array_inv!10352 (array!29839) Bool)

(assert (=> start!42052 (array_inv!10352 _keys!1025)))

(declare-fun e!274922 () Bool)

(declare-fun array_inv!10353 (array!29841) Bool)

(assert (=> start!42052 (and (array_inv!10353 _values!833) e!274922)))

(declare-fun b!469500 () Bool)

(assert (=> b!469500 (= e!274922 (and e!274919 mapRes!21247))))

(declare-fun condMapEmpty!21247 () Bool)

(declare-fun mapDefault!21247 () ValueCell!6173)

