; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41620 () Bool)

(assert start!41620)

(declare-fun b_free!11287 () Bool)

(declare-fun b_next!11287 () Bool)

(assert (=> start!41620 (= b_free!11287 (not b_next!11287))))

(declare-fun tp!39862 () Bool)

(declare-fun b_and!19645 () Bool)

(assert (=> start!41620 (= tp!39862 b_and!19645)))

(declare-fun b!464884 () Bool)

(declare-fun e!271615 () Bool)

(declare-fun e!271617 () Bool)

(declare-fun mapRes!20752 () Bool)

(assert (=> b!464884 (= e!271615 (and e!271617 mapRes!20752))))

(declare-fun condMapEmpty!20752 () Bool)

(declare-datatypes ((V!18059 0))(
  ( (V!18060 (val!6402 Int)) )
))
(declare-datatypes ((ValueCell!6014 0))(
  ( (ValueCellFull!6014 (v!8690 V!18059)) (EmptyCell!6014) )
))
(declare-datatypes ((array!29212 0))(
  ( (array!29213 (arr!14036 (Array (_ BitVec 32) ValueCell!6014)) (size!14388 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29212)

(declare-fun mapDefault!20752 () ValueCell!6014)

(assert (=> b!464884 (= condMapEmpty!20752 (= (arr!14036 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6014)) mapDefault!20752)))))

(declare-fun b!464885 () Bool)

(declare-fun res!277938 () Bool)

(declare-fun e!271614 () Bool)

(assert (=> b!464885 (=> (not res!277938) (not e!271614))))

(declare-datatypes ((array!29214 0))(
  ( (array!29215 (arr!14037 (Array (_ BitVec 32) (_ BitVec 64))) (size!14389 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29214)

(declare-datatypes ((List!8412 0))(
  ( (Nil!8409) (Cons!8408 (h!9264 (_ BitVec 64)) (t!14352 List!8412)) )
))
(declare-fun arrayNoDuplicates!0 (array!29214 (_ BitVec 32) List!8412) Bool)

(assert (=> b!464885 (= res!277938 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8409))))

(declare-fun b!464886 () Bool)

(declare-fun res!277937 () Bool)

(assert (=> b!464886 (=> (not res!277937) (not e!271614))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29214 (_ BitVec 32)) Bool)

(assert (=> b!464886 (= res!277937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!464887 () Bool)

(declare-fun e!271616 () Bool)

(declare-fun tp_is_empty!12715 () Bool)

(assert (=> b!464887 (= e!271616 tp_is_empty!12715)))

(declare-fun res!277940 () Bool)

(assert (=> start!41620 (=> (not res!277940) (not e!271614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41620 (= res!277940 (validMask!0 mask!1365))))

(assert (=> start!41620 e!271614))

(assert (=> start!41620 tp_is_empty!12715))

(assert (=> start!41620 tp!39862))

(assert (=> start!41620 true))

(declare-fun array_inv!10220 (array!29214) Bool)

(assert (=> start!41620 (array_inv!10220 _keys!1025)))

(declare-fun array_inv!10221 (array!29212) Bool)

(assert (=> start!41620 (and (array_inv!10221 _values!833) e!271615)))

(declare-fun mapIsEmpty!20752 () Bool)

(assert (=> mapIsEmpty!20752 mapRes!20752))

(declare-fun b!464888 () Bool)

(declare-fun res!277939 () Bool)

(assert (=> b!464888 (=> (not res!277939) (not e!271614))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!464888 (= res!277939 (and (= (size!14388 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14389 _keys!1025) (size!14388 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!464889 () Bool)

(assert (=> b!464889 (= e!271614 (not true))))

(declare-datatypes ((tuple2!8326 0))(
  ( (tuple2!8327 (_1!4174 (_ BitVec 64)) (_2!4174 V!18059)) )
))
(declare-datatypes ((List!8413 0))(
  ( (Nil!8410) (Cons!8409 (h!9265 tuple2!8326) (t!14353 List!8413)) )
))
(declare-datatypes ((ListLongMap!7241 0))(
  ( (ListLongMap!7242 (toList!3636 List!8413)) )
))
(declare-fun lt!209948 () ListLongMap!7241)

(declare-fun lt!209949 () ListLongMap!7241)

(assert (=> b!464889 (= lt!209948 lt!209949)))

(declare-fun minValueBefore!38 () V!18059)

(declare-fun zeroValue!794 () V!18059)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13490 0))(
  ( (Unit!13491) )
))
(declare-fun lt!209947 () Unit!13490)

(declare-fun minValueAfter!38 () V!18059)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!23 (array!29214 array!29212 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18059 V!18059 V!18059 V!18059 (_ BitVec 32) Int) Unit!13490)

(assert (=> b!464889 (= lt!209947 (lemmaNoChangeToArrayThenSameMapNoExtras!23 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1863 (array!29214 array!29212 (_ BitVec 32) (_ BitVec 32) V!18059 V!18059 (_ BitVec 32) Int) ListLongMap!7241)

(assert (=> b!464889 (= lt!209949 (getCurrentListMapNoExtraKeys!1863 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464889 (= lt!209948 (getCurrentListMapNoExtraKeys!1863 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!464890 () Bool)

(assert (=> b!464890 (= e!271617 tp_is_empty!12715)))

(declare-fun mapNonEmpty!20752 () Bool)

(declare-fun tp!39861 () Bool)

(assert (=> mapNonEmpty!20752 (= mapRes!20752 (and tp!39861 e!271616))))

(declare-fun mapRest!20752 () (Array (_ BitVec 32) ValueCell!6014))

(declare-fun mapKey!20752 () (_ BitVec 32))

(declare-fun mapValue!20752 () ValueCell!6014)

(assert (=> mapNonEmpty!20752 (= (arr!14036 _values!833) (store mapRest!20752 mapKey!20752 mapValue!20752))))

(assert (= (and start!41620 res!277940) b!464888))

(assert (= (and b!464888 res!277939) b!464886))

(assert (= (and b!464886 res!277937) b!464885))

(assert (= (and b!464885 res!277938) b!464889))

(assert (= (and b!464884 condMapEmpty!20752) mapIsEmpty!20752))

(assert (= (and b!464884 (not condMapEmpty!20752)) mapNonEmpty!20752))

(get-info :version)

(assert (= (and mapNonEmpty!20752 ((_ is ValueCellFull!6014) mapValue!20752)) b!464887))

(assert (= (and b!464884 ((_ is ValueCellFull!6014) mapDefault!20752)) b!464890))

(assert (= start!41620 b!464884))

(declare-fun m!447433 () Bool)

(assert (=> mapNonEmpty!20752 m!447433))

(declare-fun m!447435 () Bool)

(assert (=> b!464885 m!447435))

(declare-fun m!447437 () Bool)

(assert (=> b!464889 m!447437))

(declare-fun m!447439 () Bool)

(assert (=> b!464889 m!447439))

(declare-fun m!447441 () Bool)

(assert (=> b!464889 m!447441))

(declare-fun m!447443 () Bool)

(assert (=> b!464886 m!447443))

(declare-fun m!447445 () Bool)

(assert (=> start!41620 m!447445))

(declare-fun m!447447 () Bool)

(assert (=> start!41620 m!447447))

(declare-fun m!447449 () Bool)

(assert (=> start!41620 m!447449))

(check-sat (not start!41620) b_and!19645 (not b!464886) (not b!464889) (not b!464885) (not mapNonEmpty!20752) (not b_next!11287) tp_is_empty!12715)
(check-sat b_and!19645 (not b_next!11287))
