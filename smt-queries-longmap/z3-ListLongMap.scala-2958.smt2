; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41970 () Bool)

(assert start!41970)

(declare-fun b_free!11557 () Bool)

(declare-fun b_next!11557 () Bool)

(assert (=> start!41970 (= b_free!11557 (not b_next!11557))))

(declare-fun tp!40686 () Bool)

(declare-fun b_and!19929 () Bool)

(assert (=> start!41970 (= tp!40686 b_and!19929)))

(declare-fun b!468467 () Bool)

(declare-fun res!279993 () Bool)

(declare-fun e!274203 () Bool)

(assert (=> b!468467 (=> (not res!279993) (not e!274203))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29731 0))(
  ( (array!29732 (arr!14291 (Array (_ BitVec 32) (_ BitVec 64))) (size!14644 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29731)

(declare-datatypes ((V!18419 0))(
  ( (V!18420 (val!6537 Int)) )
))
(declare-datatypes ((ValueCell!6149 0))(
  ( (ValueCellFull!6149 (v!8820 V!18419)) (EmptyCell!6149) )
))
(declare-datatypes ((array!29733 0))(
  ( (array!29734 (arr!14292 (Array (_ BitVec 32) ValueCell!6149)) (size!14645 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29733)

(assert (=> b!468467 (= res!279993 (and (= (size!14645 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14644 _keys!1025) (size!14645 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!468468 () Bool)

(declare-fun res!279994 () Bool)

(assert (=> b!468468 (=> (not res!279994) (not e!274203))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29731 (_ BitVec 32)) Bool)

(assert (=> b!468468 (= res!279994 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21172 () Bool)

(declare-fun mapRes!21172 () Bool)

(assert (=> mapIsEmpty!21172 mapRes!21172))

(declare-fun b!468469 () Bool)

(declare-fun e!274202 () Bool)

(assert (=> b!468469 (= e!274202 true)))

(declare-datatypes ((tuple2!8634 0))(
  ( (tuple2!8635 (_1!4328 (_ BitVec 64)) (_2!4328 V!18419)) )
))
(declare-datatypes ((List!8706 0))(
  ( (Nil!8703) (Cons!8702 (h!9558 tuple2!8634) (t!14655 List!8706)) )
))
(declare-datatypes ((ListLongMap!7537 0))(
  ( (ListLongMap!7538 (toList!3784 List!8706)) )
))
(declare-fun lt!211871 () ListLongMap!7537)

(declare-fun lt!211867 () tuple2!8634)

(declare-fun minValueBefore!38 () V!18419)

(declare-fun +!1715 (ListLongMap!7537 tuple2!8634) ListLongMap!7537)

(assert (=> b!468469 (= (+!1715 lt!211871 lt!211867) (+!1715 (+!1715 lt!211871 (tuple2!8635 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!211867))))

(declare-fun minValueAfter!38 () V!18419)

(assert (=> b!468469 (= lt!211867 (tuple2!8635 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13665 0))(
  ( (Unit!13666) )
))
(declare-fun lt!211873 () Unit!13665)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!98 (ListLongMap!7537 (_ BitVec 64) V!18419 V!18419) Unit!13665)

(assert (=> b!468469 (= lt!211873 (addSameAsAddTwiceSameKeyDiffValues!98 lt!211871 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun zeroValue!794 () V!18419)

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!211869 () ListLongMap!7537)

(declare-fun getCurrentListMap!2151 (array!29731 array!29733 (_ BitVec 32) (_ BitVec 32) V!18419 V!18419 (_ BitVec 32) Int) ListLongMap!7537)

(assert (=> b!468469 (= lt!211869 (getCurrentListMap!2151 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211872 () ListLongMap!7537)

(assert (=> b!468469 (= lt!211872 (getCurrentListMap!2151 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468470 () Bool)

(declare-fun e!274204 () Bool)

(declare-fun tp_is_empty!12985 () Bool)

(assert (=> b!468470 (= e!274204 tp_is_empty!12985)))

(declare-fun b!468471 () Bool)

(assert (=> b!468471 (= e!274203 (not e!274202))))

(declare-fun res!279995 () Bool)

(assert (=> b!468471 (=> res!279995 e!274202)))

(assert (=> b!468471 (= res!279995 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!211870 () ListLongMap!7537)

(assert (=> b!468471 (= lt!211871 lt!211870)))

(declare-fun lt!211868 () Unit!13665)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!121 (array!29731 array!29733 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18419 V!18419 V!18419 V!18419 (_ BitVec 32) Int) Unit!13665)

(assert (=> b!468471 (= lt!211868 (lemmaNoChangeToArrayThenSameMapNoExtras!121 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1964 (array!29731 array!29733 (_ BitVec 32) (_ BitVec 32) V!18419 V!18419 (_ BitVec 32) Int) ListLongMap!7537)

(assert (=> b!468471 (= lt!211870 (getCurrentListMapNoExtraKeys!1964 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468471 (= lt!211871 (getCurrentListMapNoExtraKeys!1964 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468472 () Bool)

(declare-fun res!279992 () Bool)

(assert (=> b!468472 (=> (not res!279992) (not e!274203))))

(declare-datatypes ((List!8707 0))(
  ( (Nil!8704) (Cons!8703 (h!9559 (_ BitVec 64)) (t!14656 List!8707)) )
))
(declare-fun arrayNoDuplicates!0 (array!29731 (_ BitVec 32) List!8707) Bool)

(assert (=> b!468472 (= res!279992 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8704))))

(declare-fun res!279991 () Bool)

(assert (=> start!41970 (=> (not res!279991) (not e!274203))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41970 (= res!279991 (validMask!0 mask!1365))))

(assert (=> start!41970 e!274203))

(assert (=> start!41970 tp_is_empty!12985))

(assert (=> start!41970 tp!40686))

(assert (=> start!41970 true))

(declare-fun array_inv!10400 (array!29731) Bool)

(assert (=> start!41970 (array_inv!10400 _keys!1025)))

(declare-fun e!274201 () Bool)

(declare-fun array_inv!10401 (array!29733) Bool)

(assert (=> start!41970 (and (array_inv!10401 _values!833) e!274201)))

(declare-fun b!468473 () Bool)

(declare-fun e!274200 () Bool)

(assert (=> b!468473 (= e!274200 tp_is_empty!12985)))

(declare-fun mapNonEmpty!21172 () Bool)

(declare-fun tp!40687 () Bool)

(assert (=> mapNonEmpty!21172 (= mapRes!21172 (and tp!40687 e!274204))))

(declare-fun mapRest!21172 () (Array (_ BitVec 32) ValueCell!6149))

(declare-fun mapKey!21172 () (_ BitVec 32))

(declare-fun mapValue!21172 () ValueCell!6149)

(assert (=> mapNonEmpty!21172 (= (arr!14292 _values!833) (store mapRest!21172 mapKey!21172 mapValue!21172))))

(declare-fun b!468474 () Bool)

(assert (=> b!468474 (= e!274201 (and e!274200 mapRes!21172))))

(declare-fun condMapEmpty!21172 () Bool)

(declare-fun mapDefault!21172 () ValueCell!6149)

(assert (=> b!468474 (= condMapEmpty!21172 (= (arr!14292 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6149)) mapDefault!21172)))))

(assert (= (and start!41970 res!279991) b!468467))

(assert (= (and b!468467 res!279993) b!468468))

(assert (= (and b!468468 res!279994) b!468472))

(assert (= (and b!468472 res!279992) b!468471))

(assert (= (and b!468471 (not res!279995)) b!468469))

(assert (= (and b!468474 condMapEmpty!21172) mapIsEmpty!21172))

(assert (= (and b!468474 (not condMapEmpty!21172)) mapNonEmpty!21172))

(get-info :version)

(assert (= (and mapNonEmpty!21172 ((_ is ValueCellFull!6149) mapValue!21172)) b!468470))

(assert (= (and b!468474 ((_ is ValueCellFull!6149) mapDefault!21172)) b!468473))

(assert (= start!41970 b!468474))

(declare-fun m!450017 () Bool)

(assert (=> mapNonEmpty!21172 m!450017))

(declare-fun m!450019 () Bool)

(assert (=> b!468472 m!450019))

(declare-fun m!450021 () Bool)

(assert (=> b!468471 m!450021))

(declare-fun m!450023 () Bool)

(assert (=> b!468471 m!450023))

(declare-fun m!450025 () Bool)

(assert (=> b!468471 m!450025))

(declare-fun m!450027 () Bool)

(assert (=> b!468469 m!450027))

(declare-fun m!450029 () Bool)

(assert (=> b!468469 m!450029))

(declare-fun m!450031 () Bool)

(assert (=> b!468469 m!450031))

(declare-fun m!450033 () Bool)

(assert (=> b!468469 m!450033))

(declare-fun m!450035 () Bool)

(assert (=> b!468469 m!450035))

(assert (=> b!468469 m!450031))

(declare-fun m!450037 () Bool)

(assert (=> b!468469 m!450037))

(declare-fun m!450039 () Bool)

(assert (=> start!41970 m!450039))

(declare-fun m!450041 () Bool)

(assert (=> start!41970 m!450041))

(declare-fun m!450043 () Bool)

(assert (=> start!41970 m!450043))

(declare-fun m!450045 () Bool)

(assert (=> b!468468 m!450045))

(check-sat (not b!468469) b_and!19929 (not b!468468) (not mapNonEmpty!21172) (not start!41970) tp_is_empty!12985 (not b!468472) (not b!468471) (not b_next!11557))
(check-sat b_and!19929 (not b_next!11557))
