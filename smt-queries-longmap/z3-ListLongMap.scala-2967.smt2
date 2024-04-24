; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42044 () Bool)

(assert start!42044)

(declare-fun b_free!11611 () Bool)

(declare-fun b_next!11611 () Bool)

(assert (=> start!42044 (= b_free!11611 (not b_next!11611))))

(declare-fun tp!40851 () Bool)

(declare-fun b_and!20031 () Bool)

(assert (=> start!42044 (= tp!40851 b_and!20031)))

(declare-fun b!469505 () Bool)

(declare-fun e!274938 () Bool)

(declare-fun e!274934 () Bool)

(assert (=> b!469505 (= e!274938 (not e!274934))))

(declare-fun res!280598 () Bool)

(assert (=> b!469505 (=> res!280598 e!274934)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!469505 (= res!280598 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18491 0))(
  ( (V!18492 (val!6564 Int)) )
))
(declare-datatypes ((tuple2!8562 0))(
  ( (tuple2!8563 (_1!4292 (_ BitVec 64)) (_2!4292 V!18491)) )
))
(declare-datatypes ((List!8637 0))(
  ( (Nil!8634) (Cons!8633 (h!9489 tuple2!8562) (t!14589 List!8637)) )
))
(declare-datatypes ((ListLongMap!7477 0))(
  ( (ListLongMap!7478 (toList!3754 List!8637)) )
))
(declare-fun lt!212832 () ListLongMap!7477)

(declare-fun lt!212831 () ListLongMap!7477)

(assert (=> b!469505 (= lt!212832 lt!212831)))

(declare-fun minValueBefore!38 () V!18491)

(declare-fun zeroValue!794 () V!18491)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((array!29838 0))(
  ( (array!29839 (arr!14343 (Array (_ BitVec 32) (_ BitVec 64))) (size!14695 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29838)

(declare-datatypes ((ValueCell!6176 0))(
  ( (ValueCellFull!6176 (v!8855 V!18491)) (EmptyCell!6176) )
))
(declare-datatypes ((array!29840 0))(
  ( (array!29841 (arr!14344 (Array (_ BitVec 32) ValueCell!6176)) (size!14696 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29840)

(declare-fun minValueAfter!38 () V!18491)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-datatypes ((Unit!13719 0))(
  ( (Unit!13720) )
))
(declare-fun lt!212834 () Unit!13719)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!132 (array!29838 array!29840 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18491 V!18491 V!18491 V!18491 (_ BitVec 32) Int) Unit!13719)

(assert (=> b!469505 (= lt!212834 (lemmaNoChangeToArrayThenSameMapNoExtras!132 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1972 (array!29838 array!29840 (_ BitVec 32) (_ BitVec 32) V!18491 V!18491 (_ BitVec 32) Int) ListLongMap!7477)

(assert (=> b!469505 (= lt!212831 (getCurrentListMapNoExtraKeys!1972 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469505 (= lt!212832 (getCurrentListMapNoExtraKeys!1972 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469506 () Bool)

(declare-fun res!280596 () Bool)

(assert (=> b!469506 (=> (not res!280596) (not e!274938))))

(declare-datatypes ((List!8638 0))(
  ( (Nil!8635) (Cons!8634 (h!9490 (_ BitVec 64)) (t!14590 List!8638)) )
))
(declare-fun arrayNoDuplicates!0 (array!29838 (_ BitVec 32) List!8638) Bool)

(assert (=> b!469506 (= res!280596 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8635))))

(declare-fun mapIsEmpty!21256 () Bool)

(declare-fun mapRes!21256 () Bool)

(assert (=> mapIsEmpty!21256 mapRes!21256))

(declare-fun b!469507 () Bool)

(declare-fun e!274937 () Bool)

(declare-fun tp_is_empty!13039 () Bool)

(assert (=> b!469507 (= e!274937 tp_is_empty!13039)))

(declare-fun b!469508 () Bool)

(declare-fun res!280595 () Bool)

(assert (=> b!469508 (=> (not res!280595) (not e!274938))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29838 (_ BitVec 32)) Bool)

(assert (=> b!469508 (= res!280595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!469509 () Bool)

(declare-fun e!274936 () Bool)

(assert (=> b!469509 (= e!274936 tp_is_empty!13039)))

(declare-fun b!469510 () Bool)

(declare-fun e!274935 () Bool)

(assert (=> b!469510 (= e!274935 (and e!274936 mapRes!21256))))

(declare-fun condMapEmpty!21256 () Bool)

(declare-fun mapDefault!21256 () ValueCell!6176)

(assert (=> b!469510 (= condMapEmpty!21256 (= (arr!14344 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6176)) mapDefault!21256)))))

(declare-fun mapNonEmpty!21256 () Bool)

(declare-fun tp!40852 () Bool)

(assert (=> mapNonEmpty!21256 (= mapRes!21256 (and tp!40852 e!274937))))

(declare-fun mapValue!21256 () ValueCell!6176)

(declare-fun mapRest!21256 () (Array (_ BitVec 32) ValueCell!6176))

(declare-fun mapKey!21256 () (_ BitVec 32))

(assert (=> mapNonEmpty!21256 (= (arr!14344 _values!833) (store mapRest!21256 mapKey!21256 mapValue!21256))))

(declare-fun b!469511 () Bool)

(declare-fun res!280599 () Bool)

(assert (=> b!469511 (=> (not res!280599) (not e!274938))))

(assert (=> b!469511 (= res!280599 (and (= (size!14696 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14695 _keys!1025) (size!14696 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!280597 () Bool)

(assert (=> start!42044 (=> (not res!280597) (not e!274938))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42044 (= res!280597 (validMask!0 mask!1365))))

(assert (=> start!42044 e!274938))

(assert (=> start!42044 tp_is_empty!13039))

(assert (=> start!42044 tp!40851))

(assert (=> start!42044 true))

(declare-fun array_inv!10446 (array!29838) Bool)

(assert (=> start!42044 (array_inv!10446 _keys!1025)))

(declare-fun array_inv!10447 (array!29840) Bool)

(assert (=> start!42044 (and (array_inv!10447 _values!833) e!274935)))

(declare-fun b!469504 () Bool)

(assert (=> b!469504 (= e!274934 true)))

(declare-fun lt!212835 () tuple2!8562)

(declare-fun +!1712 (ListLongMap!7477 tuple2!8562) ListLongMap!7477)

(assert (=> b!469504 (= (+!1712 lt!212832 lt!212835) (+!1712 (+!1712 lt!212832 (tuple2!8563 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212835))))

(assert (=> b!469504 (= lt!212835 (tuple2!8563 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!212833 () Unit!13719)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!118 (ListLongMap!7477 (_ BitVec 64) V!18491 V!18491) Unit!13719)

(assert (=> b!469504 (= lt!212833 (addSameAsAddTwiceSameKeyDiffValues!118 lt!212832 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!212836 () ListLongMap!7477)

(declare-fun getCurrentListMap!2178 (array!29838 array!29840 (_ BitVec 32) (_ BitVec 32) V!18491 V!18491 (_ BitVec 32) Int) ListLongMap!7477)

(assert (=> b!469504 (= lt!212836 (getCurrentListMap!2178 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212837 () ListLongMap!7477)

(assert (=> b!469504 (= lt!212837 (getCurrentListMap!2178 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!42044 res!280597) b!469511))

(assert (= (and b!469511 res!280599) b!469508))

(assert (= (and b!469508 res!280595) b!469506))

(assert (= (and b!469506 res!280596) b!469505))

(assert (= (and b!469505 (not res!280598)) b!469504))

(assert (= (and b!469510 condMapEmpty!21256) mapIsEmpty!21256))

(assert (= (and b!469510 (not condMapEmpty!21256)) mapNonEmpty!21256))

(get-info :version)

(assert (= (and mapNonEmpty!21256 ((_ is ValueCellFull!6176) mapValue!21256)) b!469507))

(assert (= (and b!469510 ((_ is ValueCellFull!6176) mapDefault!21256)) b!469509))

(assert (= start!42044 b!469510))

(declare-fun m!451943 () Bool)

(assert (=> b!469506 m!451943))

(declare-fun m!451945 () Bool)

(assert (=> start!42044 m!451945))

(declare-fun m!451947 () Bool)

(assert (=> start!42044 m!451947))

(declare-fun m!451949 () Bool)

(assert (=> start!42044 m!451949))

(declare-fun m!451951 () Bool)

(assert (=> mapNonEmpty!21256 m!451951))

(declare-fun m!451953 () Bool)

(assert (=> b!469505 m!451953))

(declare-fun m!451955 () Bool)

(assert (=> b!469505 m!451955))

(declare-fun m!451957 () Bool)

(assert (=> b!469505 m!451957))

(declare-fun m!451959 () Bool)

(assert (=> b!469504 m!451959))

(declare-fun m!451961 () Bool)

(assert (=> b!469504 m!451961))

(declare-fun m!451963 () Bool)

(assert (=> b!469504 m!451963))

(declare-fun m!451965 () Bool)

(assert (=> b!469504 m!451965))

(declare-fun m!451967 () Bool)

(assert (=> b!469504 m!451967))

(assert (=> b!469504 m!451961))

(declare-fun m!451969 () Bool)

(assert (=> b!469504 m!451969))

(declare-fun m!451971 () Bool)

(assert (=> b!469508 m!451971))

(check-sat tp_is_empty!13039 b_and!20031 (not b!469508) (not b_next!11611) (not b!469504) (not start!42044) (not b!469505) (not b!469506) (not mapNonEmpty!21256))
(check-sat b_and!20031 (not b_next!11611))
