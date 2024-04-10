; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42048 () Bool)

(assert start!42048)

(declare-fun b_free!11601 () Bool)

(declare-fun b_next!11601 () Bool)

(assert (=> start!42048 (= b_free!11601 (not b_next!11601))))

(declare-fun tp!40822 () Bool)

(declare-fun b_and!20011 () Bool)

(assert (=> start!42048 (= tp!40822 b_and!20011)))

(declare-fun b!469445 () Bool)

(declare-fun res!280530 () Bool)

(declare-fun e!274882 () Bool)

(assert (=> b!469445 (=> (not res!280530) (not e!274882))))

(declare-datatypes ((array!29831 0))(
  ( (array!29832 (arr!14340 (Array (_ BitVec 32) (_ BitVec 64))) (size!14692 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29831)

(declare-datatypes ((List!8711 0))(
  ( (Nil!8708) (Cons!8707 (h!9563 (_ BitVec 64)) (t!14671 List!8711)) )
))
(declare-fun arrayNoDuplicates!0 (array!29831 (_ BitVec 32) List!8711) Bool)

(assert (=> b!469445 (= res!280530 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8708))))

(declare-fun b!469446 () Bool)

(declare-fun e!274887 () Bool)

(declare-fun tp_is_empty!13029 () Bool)

(assert (=> b!469446 (= e!274887 tp_is_empty!13029)))

(declare-fun res!280531 () Bool)

(assert (=> start!42048 (=> (not res!280531) (not e!274882))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42048 (= res!280531 (validMask!0 mask!1365))))

(assert (=> start!42048 e!274882))

(assert (=> start!42048 tp_is_empty!13029))

(assert (=> start!42048 tp!40822))

(assert (=> start!42048 true))

(declare-fun array_inv!10348 (array!29831) Bool)

(assert (=> start!42048 (array_inv!10348 _keys!1025)))

(declare-datatypes ((V!18477 0))(
  ( (V!18478 (val!6559 Int)) )
))
(declare-datatypes ((ValueCell!6171 0))(
  ( (ValueCellFull!6171 (v!8849 V!18477)) (EmptyCell!6171) )
))
(declare-datatypes ((array!29833 0))(
  ( (array!29834 (arr!14341 (Array (_ BitVec 32) ValueCell!6171)) (size!14693 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29833)

(declare-fun e!274885 () Bool)

(declare-fun array_inv!10349 (array!29833) Bool)

(assert (=> start!42048 (and (array_inv!10349 _values!833) e!274885)))

(declare-fun b!469447 () Bool)

(declare-fun e!274886 () Bool)

(assert (=> b!469447 (= e!274886 true)))

(declare-datatypes ((tuple2!8632 0))(
  ( (tuple2!8633 (_1!4327 (_ BitVec 64)) (_2!4327 V!18477)) )
))
(declare-datatypes ((List!8712 0))(
  ( (Nil!8709) (Cons!8708 (h!9564 tuple2!8632) (t!14672 List!8712)) )
))
(declare-datatypes ((ListLongMap!7545 0))(
  ( (ListLongMap!7546 (toList!3788 List!8712)) )
))
(declare-fun lt!212715 () ListLongMap!7545)

(declare-fun lt!212717 () tuple2!8632)

(declare-fun minValueBefore!38 () V!18477)

(declare-fun +!1696 (ListLongMap!7545 tuple2!8632) ListLongMap!7545)

(assert (=> b!469447 (= (+!1696 lt!212715 lt!212717) (+!1696 (+!1696 lt!212715 (tuple2!8633 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212717))))

(declare-fun minValueAfter!38 () V!18477)

(assert (=> b!469447 (= lt!212717 (tuple2!8633 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13733 0))(
  ( (Unit!13734) )
))
(declare-fun lt!212718 () Unit!13733)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!109 (ListLongMap!7545 (_ BitVec 64) V!18477 V!18477) Unit!13733)

(assert (=> b!469447 (= lt!212718 (addSameAsAddTwiceSameKeyDiffValues!109 lt!212715 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!212714 () ListLongMap!7545)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun zeroValue!794 () V!18477)

(declare-fun getCurrentListMap!2210 (array!29831 array!29833 (_ BitVec 32) (_ BitVec 32) V!18477 V!18477 (_ BitVec 32) Int) ListLongMap!7545)

(assert (=> b!469447 (= lt!212714 (getCurrentListMap!2210 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!212716 () ListLongMap!7545)

(assert (=> b!469447 (= lt!212716 (getCurrentListMap!2210 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21241 () Bool)

(declare-fun mapRes!21241 () Bool)

(declare-fun tp!40821 () Bool)

(declare-fun e!274884 () Bool)

(assert (=> mapNonEmpty!21241 (= mapRes!21241 (and tp!40821 e!274884))))

(declare-fun mapRest!21241 () (Array (_ BitVec 32) ValueCell!6171))

(declare-fun mapKey!21241 () (_ BitVec 32))

(declare-fun mapValue!21241 () ValueCell!6171)

(assert (=> mapNonEmpty!21241 (= (arr!14341 _values!833) (store mapRest!21241 mapKey!21241 mapValue!21241))))

(declare-fun b!469448 () Bool)

(declare-fun res!280528 () Bool)

(assert (=> b!469448 (=> (not res!280528) (not e!274882))))

(assert (=> b!469448 (= res!280528 (and (= (size!14693 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14692 _keys!1025) (size!14693 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!469449 () Bool)

(assert (=> b!469449 (= e!274885 (and e!274887 mapRes!21241))))

(declare-fun condMapEmpty!21241 () Bool)

(declare-fun mapDefault!21241 () ValueCell!6171)

(assert (=> b!469449 (= condMapEmpty!21241 (= (arr!14341 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6171)) mapDefault!21241)))))

(declare-fun b!469450 () Bool)

(declare-fun res!280529 () Bool)

(assert (=> b!469450 (=> (not res!280529) (not e!274882))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29831 (_ BitVec 32)) Bool)

(assert (=> b!469450 (= res!280529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!469451 () Bool)

(assert (=> b!469451 (= e!274884 tp_is_empty!13029)))

(declare-fun b!469452 () Bool)

(assert (=> b!469452 (= e!274882 (not e!274886))))

(declare-fun res!280527 () Bool)

(assert (=> b!469452 (=> res!280527 e!274886)))

(assert (=> b!469452 (= res!280527 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!212720 () ListLongMap!7545)

(assert (=> b!469452 (= lt!212715 lt!212720)))

(declare-fun lt!212719 () Unit!13733)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!136 (array!29831 array!29833 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18477 V!18477 V!18477 V!18477 (_ BitVec 32) Int) Unit!13733)

(assert (=> b!469452 (= lt!212719 (lemmaNoChangeToArrayThenSameMapNoExtras!136 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1956 (array!29831 array!29833 (_ BitVec 32) (_ BitVec 32) V!18477 V!18477 (_ BitVec 32) Int) ListLongMap!7545)

(assert (=> b!469452 (= lt!212720 (getCurrentListMapNoExtraKeys!1956 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469452 (= lt!212715 (getCurrentListMapNoExtraKeys!1956 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21241 () Bool)

(assert (=> mapIsEmpty!21241 mapRes!21241))

(assert (= (and start!42048 res!280531) b!469448))

(assert (= (and b!469448 res!280528) b!469450))

(assert (= (and b!469450 res!280529) b!469445))

(assert (= (and b!469445 res!280530) b!469452))

(assert (= (and b!469452 (not res!280527)) b!469447))

(assert (= (and b!469449 condMapEmpty!21241) mapIsEmpty!21241))

(assert (= (and b!469449 (not condMapEmpty!21241)) mapNonEmpty!21241))

(get-info :version)

(assert (= (and mapNonEmpty!21241 ((_ is ValueCellFull!6171) mapValue!21241)) b!469451))

(assert (= (and b!469449 ((_ is ValueCellFull!6171) mapDefault!21241)) b!469446))

(assert (= start!42048 b!469449))

(declare-fun m!451611 () Bool)

(assert (=> start!42048 m!451611))

(declare-fun m!451613 () Bool)

(assert (=> start!42048 m!451613))

(declare-fun m!451615 () Bool)

(assert (=> start!42048 m!451615))

(declare-fun m!451617 () Bool)

(assert (=> b!469447 m!451617))

(declare-fun m!451619 () Bool)

(assert (=> b!469447 m!451619))

(declare-fun m!451621 () Bool)

(assert (=> b!469447 m!451621))

(assert (=> b!469447 m!451617))

(declare-fun m!451623 () Bool)

(assert (=> b!469447 m!451623))

(declare-fun m!451625 () Bool)

(assert (=> b!469447 m!451625))

(declare-fun m!451627 () Bool)

(assert (=> b!469447 m!451627))

(declare-fun m!451629 () Bool)

(assert (=> b!469445 m!451629))

(declare-fun m!451631 () Bool)

(assert (=> b!469452 m!451631))

(declare-fun m!451633 () Bool)

(assert (=> b!469452 m!451633))

(declare-fun m!451635 () Bool)

(assert (=> b!469452 m!451635))

(declare-fun m!451637 () Bool)

(assert (=> b!469450 m!451637))

(declare-fun m!451639 () Bool)

(assert (=> mapNonEmpty!21241 m!451639))

(check-sat (not start!42048) (not b!469450) (not b!469452) (not b!469447) (not mapNonEmpty!21241) (not b_next!11601) tp_is_empty!13029 b_and!20011 (not b!469445))
(check-sat b_and!20011 (not b_next!11601))
