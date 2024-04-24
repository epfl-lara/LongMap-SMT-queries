; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41976 () Bool)

(assert start!41976)

(declare-fun b_free!11563 () Bool)

(declare-fun b_next!11563 () Bool)

(assert (=> start!41976 (= b_free!11563 (not b_next!11563))))

(declare-fun tp!40704 () Bool)

(declare-fun b_and!19971 () Bool)

(assert (=> start!41976 (= tp!40704 b_and!19971)))

(declare-fun mapNonEmpty!21181 () Bool)

(declare-fun mapRes!21181 () Bool)

(declare-fun tp!40705 () Bool)

(declare-fun e!274391 () Bool)

(assert (=> mapNonEmpty!21181 (= mapRes!21181 (and tp!40705 e!274391))))

(declare-datatypes ((V!18427 0))(
  ( (V!18428 (val!6540 Int)) )
))
(declare-datatypes ((ValueCell!6152 0))(
  ( (ValueCellFull!6152 (v!8830 V!18427)) (EmptyCell!6152) )
))
(declare-fun mapRest!21181 () (Array (_ BitVec 32) ValueCell!6152))

(declare-fun mapValue!21181 () ValueCell!6152)

(declare-fun mapKey!21181 () (_ BitVec 32))

(declare-datatypes ((array!29742 0))(
  ( (array!29743 (arr!14296 (Array (_ BitVec 32) ValueCell!6152)) (size!14648 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29742)

(assert (=> mapNonEmpty!21181 (= (arr!14296 _values!833) (store mapRest!21181 mapKey!21181 mapValue!21181))))

(declare-fun b!468749 () Bool)

(declare-fun e!274393 () Bool)

(declare-fun e!274392 () Bool)

(assert (=> b!468749 (= e!274393 (and e!274392 mapRes!21181))))

(declare-fun condMapEmpty!21181 () Bool)

(declare-fun mapDefault!21181 () ValueCell!6152)

(assert (=> b!468749 (= condMapEmpty!21181 (= (arr!14296 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6152)) mapDefault!21181)))))

(declare-fun b!468750 () Bool)

(declare-fun e!274390 () Bool)

(assert (=> b!468750 (= e!274390 true)))

(declare-datatypes ((tuple2!8518 0))(
  ( (tuple2!8519 (_1!4270 (_ BitVec 64)) (_2!4270 V!18427)) )
))
(declare-datatypes ((List!8594 0))(
  ( (Nil!8591) (Cons!8590 (h!9446 tuple2!8518) (t!14544 List!8594)) )
))
(declare-datatypes ((ListLongMap!7433 0))(
  ( (ListLongMap!7434 (toList!3732 List!8594)) )
))
(declare-fun lt!212181 () ListLongMap!7433)

(declare-fun lt!212182 () tuple2!8518)

(declare-fun minValueBefore!38 () V!18427)

(declare-fun +!1693 (ListLongMap!7433 tuple2!8518) ListLongMap!7433)

(assert (=> b!468750 (= (+!1693 lt!212181 lt!212182) (+!1693 (+!1693 lt!212181 (tuple2!8519 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212182))))

(declare-fun minValueAfter!38 () V!18427)

(assert (=> b!468750 (= lt!212182 (tuple2!8519 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13673 0))(
  ( (Unit!13674) )
))
(declare-fun lt!212179 () Unit!13673)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!99 (ListLongMap!7433 (_ BitVec 64) V!18427 V!18427) Unit!13673)

(assert (=> b!468750 (= lt!212179 (addSameAsAddTwiceSameKeyDiffValues!99 lt!212181 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun zeroValue!794 () V!18427)

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!212178 () ListLongMap!7433)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29744 0))(
  ( (array!29745 (arr!14297 (Array (_ BitVec 32) (_ BitVec 64))) (size!14649 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29744)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2159 (array!29744 array!29742 (_ BitVec 32) (_ BitVec 32) V!18427 V!18427 (_ BitVec 32) Int) ListLongMap!7433)

(assert (=> b!468750 (= lt!212178 (getCurrentListMap!2159 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!212180 () ListLongMap!7433)

(assert (=> b!468750 (= lt!212180 (getCurrentListMap!2159 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468751 () Bool)

(declare-fun tp_is_empty!12991 () Bool)

(assert (=> b!468751 (= e!274392 tp_is_empty!12991)))

(declare-fun b!468752 () Bool)

(declare-fun res!280162 () Bool)

(declare-fun e!274394 () Bool)

(assert (=> b!468752 (=> (not res!280162) (not e!274394))))

(assert (=> b!468752 (= res!280162 (and (= (size!14648 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14649 _keys!1025) (size!14648 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!468753 () Bool)

(declare-fun res!280158 () Bool)

(assert (=> b!468753 (=> (not res!280158) (not e!274394))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29744 (_ BitVec 32)) Bool)

(assert (=> b!468753 (= res!280158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!468754 () Bool)

(assert (=> b!468754 (= e!274391 tp_is_empty!12991)))

(declare-fun b!468755 () Bool)

(assert (=> b!468755 (= e!274394 (not e!274390))))

(declare-fun res!280161 () Bool)

(assert (=> b!468755 (=> res!280161 e!274390)))

(assert (=> b!468755 (= res!280161 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!212176 () ListLongMap!7433)

(assert (=> b!468755 (= lt!212181 lt!212176)))

(declare-fun lt!212177 () Unit!13673)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!111 (array!29744 array!29742 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18427 V!18427 V!18427 V!18427 (_ BitVec 32) Int) Unit!13673)

(assert (=> b!468755 (= lt!212177 (lemmaNoChangeToArrayThenSameMapNoExtras!111 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1951 (array!29744 array!29742 (_ BitVec 32) (_ BitVec 32) V!18427 V!18427 (_ BitVec 32) Int) ListLongMap!7433)

(assert (=> b!468755 (= lt!212176 (getCurrentListMapNoExtraKeys!1951 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468755 (= lt!212181 (getCurrentListMapNoExtraKeys!1951 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468756 () Bool)

(declare-fun res!280160 () Bool)

(assert (=> b!468756 (=> (not res!280160) (not e!274394))))

(declare-datatypes ((List!8595 0))(
  ( (Nil!8592) (Cons!8591 (h!9447 (_ BitVec 64)) (t!14545 List!8595)) )
))
(declare-fun arrayNoDuplicates!0 (array!29744 (_ BitVec 32) List!8595) Bool)

(assert (=> b!468756 (= res!280160 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8592))))

(declare-fun res!280159 () Bool)

(assert (=> start!41976 (=> (not res!280159) (not e!274394))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41976 (= res!280159 (validMask!0 mask!1365))))

(assert (=> start!41976 e!274394))

(assert (=> start!41976 tp_is_empty!12991))

(assert (=> start!41976 tp!40704))

(assert (=> start!41976 true))

(declare-fun array_inv!10410 (array!29744) Bool)

(assert (=> start!41976 (array_inv!10410 _keys!1025)))

(declare-fun array_inv!10411 (array!29742) Bool)

(assert (=> start!41976 (and (array_inv!10411 _values!833) e!274393)))

(declare-fun mapIsEmpty!21181 () Bool)

(assert (=> mapIsEmpty!21181 mapRes!21181))

(assert (= (and start!41976 res!280159) b!468752))

(assert (= (and b!468752 res!280162) b!468753))

(assert (= (and b!468753 res!280158) b!468756))

(assert (= (and b!468756 res!280160) b!468755))

(assert (= (and b!468755 (not res!280161)) b!468750))

(assert (= (and b!468749 condMapEmpty!21181) mapIsEmpty!21181))

(assert (= (and b!468749 (not condMapEmpty!21181)) mapNonEmpty!21181))

(get-info :version)

(assert (= (and mapNonEmpty!21181 ((_ is ValueCellFull!6152) mapValue!21181)) b!468754))

(assert (= (and b!468749 ((_ is ValueCellFull!6152) mapDefault!21181)) b!468751))

(assert (= start!41976 b!468749))

(declare-fun m!451023 () Bool)

(assert (=> mapNonEmpty!21181 m!451023))

(declare-fun m!451025 () Bool)

(assert (=> b!468756 m!451025))

(declare-fun m!451027 () Bool)

(assert (=> b!468755 m!451027))

(declare-fun m!451029 () Bool)

(assert (=> b!468755 m!451029))

(declare-fun m!451031 () Bool)

(assert (=> b!468755 m!451031))

(declare-fun m!451033 () Bool)

(assert (=> start!41976 m!451033))

(declare-fun m!451035 () Bool)

(assert (=> start!41976 m!451035))

(declare-fun m!451037 () Bool)

(assert (=> start!41976 m!451037))

(declare-fun m!451039 () Bool)

(assert (=> b!468750 m!451039))

(declare-fun m!451041 () Bool)

(assert (=> b!468750 m!451041))

(declare-fun m!451043 () Bool)

(assert (=> b!468750 m!451043))

(assert (=> b!468750 m!451039))

(declare-fun m!451045 () Bool)

(assert (=> b!468750 m!451045))

(declare-fun m!451047 () Bool)

(assert (=> b!468750 m!451047))

(declare-fun m!451049 () Bool)

(assert (=> b!468750 m!451049))

(declare-fun m!451051 () Bool)

(assert (=> b!468753 m!451051))

(check-sat (not b_next!11563) b_and!19971 (not b!468750) (not mapNonEmpty!21181) (not start!41976) tp_is_empty!12991 (not b!468753) (not b!468756) (not b!468755))
(check-sat b_and!19971 (not b_next!11563))
