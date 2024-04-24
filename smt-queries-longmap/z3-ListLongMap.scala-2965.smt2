; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42032 () Bool)

(assert start!42032)

(declare-fun b_free!11599 () Bool)

(declare-fun b_next!11599 () Bool)

(assert (=> start!42032 (= b_free!11599 (not b_next!11599))))

(declare-fun tp!40816 () Bool)

(declare-fun b_and!20019 () Bool)

(assert (=> start!42032 (= tp!40816 b_and!20019)))

(declare-fun b!469360 () Bool)

(declare-fun e!274826 () Bool)

(assert (=> b!469360 (= e!274826 true)))

(declare-datatypes ((V!18475 0))(
  ( (V!18476 (val!6558 Int)) )
))
(declare-datatypes ((tuple2!8552 0))(
  ( (tuple2!8553 (_1!4287 (_ BitVec 64)) (_2!4287 V!18475)) )
))
(declare-datatypes ((List!8628 0))(
  ( (Nil!8625) (Cons!8624 (h!9480 tuple2!8552) (t!14580 List!8628)) )
))
(declare-datatypes ((ListLongMap!7467 0))(
  ( (ListLongMap!7468 (toList!3749 List!8628)) )
))
(declare-fun lt!212709 () ListLongMap!7467)

(declare-fun lt!212708 () tuple2!8552)

(declare-fun minValueBefore!38 () V!18475)

(declare-fun +!1708 (ListLongMap!7467 tuple2!8552) ListLongMap!7467)

(assert (=> b!469360 (= (+!1708 lt!212709 lt!212708) (+!1708 (+!1708 lt!212709 (tuple2!8553 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212708))))

(declare-fun minValueAfter!38 () V!18475)

(assert (=> b!469360 (= lt!212708 (tuple2!8553 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13709 0))(
  ( (Unit!13710) )
))
(declare-fun lt!212706 () Unit!13709)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!114 (ListLongMap!7467 (_ BitVec 64) V!18475 V!18475) Unit!13709)

(assert (=> b!469360 (= lt!212706 (addSameAsAddTwiceSameKeyDiffValues!114 lt!212709 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun zeroValue!794 () V!18475)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29814 0))(
  ( (array!29815 (arr!14331 (Array (_ BitVec 32) (_ BitVec 64))) (size!14683 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29814)

(declare-datatypes ((ValueCell!6170 0))(
  ( (ValueCellFull!6170 (v!8849 V!18475)) (EmptyCell!6170) )
))
(declare-datatypes ((array!29816 0))(
  ( (array!29817 (arr!14332 (Array (_ BitVec 32) ValueCell!6170)) (size!14684 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29816)

(declare-fun lt!212707 () ListLongMap!7467)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2174 (array!29814 array!29816 (_ BitVec 32) (_ BitVec 32) V!18475 V!18475 (_ BitVec 32) Int) ListLongMap!7467)

(assert (=> b!469360 (= lt!212707 (getCurrentListMap!2174 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!212710 () ListLongMap!7467)

(assert (=> b!469360 (= lt!212710 (getCurrentListMap!2174 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469362 () Bool)

(declare-fun res!280508 () Bool)

(declare-fun e!274827 () Bool)

(assert (=> b!469362 (=> (not res!280508) (not e!274827))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29814 (_ BitVec 32)) Bool)

(assert (=> b!469362 (= res!280508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!469363 () Bool)

(declare-fun res!280506 () Bool)

(assert (=> b!469363 (=> (not res!280506) (not e!274827))))

(assert (=> b!469363 (= res!280506 (and (= (size!14684 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14683 _keys!1025) (size!14684 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!21238 () Bool)

(declare-fun mapRes!21238 () Bool)

(declare-fun tp!40815 () Bool)

(declare-fun e!274830 () Bool)

(assert (=> mapNonEmpty!21238 (= mapRes!21238 (and tp!40815 e!274830))))

(declare-fun mapRest!21238 () (Array (_ BitVec 32) ValueCell!6170))

(declare-fun mapKey!21238 () (_ BitVec 32))

(declare-fun mapValue!21238 () ValueCell!6170)

(assert (=> mapNonEmpty!21238 (= (arr!14332 _values!833) (store mapRest!21238 mapKey!21238 mapValue!21238))))

(declare-fun b!469364 () Bool)

(declare-fun res!280505 () Bool)

(assert (=> b!469364 (=> (not res!280505) (not e!274827))))

(declare-datatypes ((List!8629 0))(
  ( (Nil!8626) (Cons!8625 (h!9481 (_ BitVec 64)) (t!14581 List!8629)) )
))
(declare-fun arrayNoDuplicates!0 (array!29814 (_ BitVec 32) List!8629) Bool)

(assert (=> b!469364 (= res!280505 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8626))))

(declare-fun b!469365 () Bool)

(declare-fun tp_is_empty!13027 () Bool)

(assert (=> b!469365 (= e!274830 tp_is_empty!13027)))

(declare-fun b!469366 () Bool)

(assert (=> b!469366 (= e!274827 (not e!274826))))

(declare-fun res!280507 () Bool)

(assert (=> b!469366 (=> res!280507 e!274826)))

(assert (=> b!469366 (= res!280507 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!212705 () ListLongMap!7467)

(assert (=> b!469366 (= lt!212709 lt!212705)))

(declare-fun lt!212711 () Unit!13709)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!127 (array!29814 array!29816 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18475 V!18475 V!18475 V!18475 (_ BitVec 32) Int) Unit!13709)

(assert (=> b!469366 (= lt!212711 (lemmaNoChangeToArrayThenSameMapNoExtras!127 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1967 (array!29814 array!29816 (_ BitVec 32) (_ BitVec 32) V!18475 V!18475 (_ BitVec 32) Int) ListLongMap!7467)

(assert (=> b!469366 (= lt!212705 (getCurrentListMapNoExtraKeys!1967 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469366 (= lt!212709 (getCurrentListMapNoExtraKeys!1967 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!280509 () Bool)

(assert (=> start!42032 (=> (not res!280509) (not e!274827))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42032 (= res!280509 (validMask!0 mask!1365))))

(assert (=> start!42032 e!274827))

(assert (=> start!42032 tp_is_empty!13027))

(assert (=> start!42032 tp!40816))

(assert (=> start!42032 true))

(declare-fun array_inv!10436 (array!29814) Bool)

(assert (=> start!42032 (array_inv!10436 _keys!1025)))

(declare-fun e!274828 () Bool)

(declare-fun array_inv!10437 (array!29816) Bool)

(assert (=> start!42032 (and (array_inv!10437 _values!833) e!274828)))

(declare-fun b!469361 () Bool)

(declare-fun e!274829 () Bool)

(assert (=> b!469361 (= e!274828 (and e!274829 mapRes!21238))))

(declare-fun condMapEmpty!21238 () Bool)

(declare-fun mapDefault!21238 () ValueCell!6170)

(assert (=> b!469361 (= condMapEmpty!21238 (= (arr!14332 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6170)) mapDefault!21238)))))

(declare-fun mapIsEmpty!21238 () Bool)

(assert (=> mapIsEmpty!21238 mapRes!21238))

(declare-fun b!469367 () Bool)

(assert (=> b!469367 (= e!274829 tp_is_empty!13027)))

(assert (= (and start!42032 res!280509) b!469363))

(assert (= (and b!469363 res!280506) b!469362))

(assert (= (and b!469362 res!280508) b!469364))

(assert (= (and b!469364 res!280505) b!469366))

(assert (= (and b!469366 (not res!280507)) b!469360))

(assert (= (and b!469361 condMapEmpty!21238) mapIsEmpty!21238))

(assert (= (and b!469361 (not condMapEmpty!21238)) mapNonEmpty!21238))

(get-info :version)

(assert (= (and mapNonEmpty!21238 ((_ is ValueCellFull!6170) mapValue!21238)) b!469365))

(assert (= (and b!469361 ((_ is ValueCellFull!6170) mapDefault!21238)) b!469367))

(assert (= start!42032 b!469361))

(declare-fun m!451763 () Bool)

(assert (=> b!469360 m!451763))

(declare-fun m!451765 () Bool)

(assert (=> b!469360 m!451765))

(declare-fun m!451767 () Bool)

(assert (=> b!469360 m!451767))

(assert (=> b!469360 m!451767))

(declare-fun m!451769 () Bool)

(assert (=> b!469360 m!451769))

(declare-fun m!451771 () Bool)

(assert (=> b!469360 m!451771))

(declare-fun m!451773 () Bool)

(assert (=> b!469360 m!451773))

(declare-fun m!451775 () Bool)

(assert (=> b!469366 m!451775))

(declare-fun m!451777 () Bool)

(assert (=> b!469366 m!451777))

(declare-fun m!451779 () Bool)

(assert (=> b!469366 m!451779))

(declare-fun m!451781 () Bool)

(assert (=> start!42032 m!451781))

(declare-fun m!451783 () Bool)

(assert (=> start!42032 m!451783))

(declare-fun m!451785 () Bool)

(assert (=> start!42032 m!451785))

(declare-fun m!451787 () Bool)

(assert (=> b!469362 m!451787))

(declare-fun m!451789 () Bool)

(assert (=> mapNonEmpty!21238 m!451789))

(declare-fun m!451791 () Bool)

(assert (=> b!469364 m!451791))

(check-sat b_and!20019 (not b!469362) (not mapNonEmpty!21238) (not start!42032) tp_is_empty!13027 (not b!469360) (not b_next!11599) (not b!469364) (not b!469366))
(check-sat b_and!20019 (not b_next!11599))
