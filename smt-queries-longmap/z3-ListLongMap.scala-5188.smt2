; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70108 () Bool)

(assert start!70108)

(declare-fun b_free!12535 () Bool)

(declare-fun b_next!12535 () Bool)

(assert (=> start!70108 (= b_free!12535 (not b_next!12535))))

(declare-fun tp!44322 () Bool)

(declare-fun b_and!21289 () Bool)

(assert (=> start!70108 (= tp!44322 b_and!21289)))

(declare-fun b!814611 () Bool)

(declare-fun res!556393 () Bool)

(declare-fun e!451601 () Bool)

(assert (=> b!814611 (=> (not res!556393) (not e!451601))))

(declare-datatypes ((array!44685 0))(
  ( (array!44686 (arr!21402 (Array (_ BitVec 32) (_ BitVec 64))) (size!21823 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44685)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23995 0))(
  ( (V!23996 (val!7170 Int)) )
))
(declare-datatypes ((ValueCell!6707 0))(
  ( (ValueCellFull!6707 (v!9591 V!23995)) (EmptyCell!6707) )
))
(declare-datatypes ((array!44687 0))(
  ( (array!44688 (arr!21403 (Array (_ BitVec 32) ValueCell!6707)) (size!21824 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44687)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!814611 (= res!556393 (and (= (size!21824 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21823 _keys!976) (size!21824 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!814612 () Bool)

(declare-fun res!556394 () Bool)

(assert (=> b!814612 (=> (not res!556394) (not e!451601))))

(declare-datatypes ((List!15258 0))(
  ( (Nil!15255) (Cons!15254 (h!16383 (_ BitVec 64)) (t!21568 List!15258)) )
))
(declare-fun arrayNoDuplicates!0 (array!44685 (_ BitVec 32) List!15258) Bool)

(assert (=> b!814612 (= res!556394 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15255))))

(declare-fun b!814613 () Bool)

(declare-fun res!556395 () Bool)

(assert (=> b!814613 (=> (not res!556395) (not e!451601))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44685 (_ BitVec 32)) Bool)

(assert (=> b!814613 (= res!556395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!814614 () Bool)

(declare-fun e!451602 () Bool)

(declare-fun tp_is_empty!14245 () Bool)

(assert (=> b!814614 (= e!451602 tp_is_empty!14245)))

(declare-fun res!556392 () Bool)

(assert (=> start!70108 (=> (not res!556392) (not e!451601))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70108 (= res!556392 (validMask!0 mask!1312))))

(assert (=> start!70108 e!451601))

(assert (=> start!70108 tp_is_empty!14245))

(declare-fun array_inv!17205 (array!44685) Bool)

(assert (=> start!70108 (array_inv!17205 _keys!976)))

(assert (=> start!70108 true))

(declare-fun e!451600 () Bool)

(declare-fun array_inv!17206 (array!44687) Bool)

(assert (=> start!70108 (and (array_inv!17206 _values!788) e!451600)))

(assert (=> start!70108 tp!44322))

(declare-fun b!814615 () Bool)

(declare-fun mapRes!22951 () Bool)

(assert (=> b!814615 (= e!451600 (and e!451602 mapRes!22951))))

(declare-fun condMapEmpty!22951 () Bool)

(declare-fun mapDefault!22951 () ValueCell!6707)

(assert (=> b!814615 (= condMapEmpty!22951 (= (arr!21403 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6707)) mapDefault!22951)))))

(declare-fun b!814616 () Bool)

(declare-fun e!451599 () Bool)

(assert (=> b!814616 (= e!451599 tp_is_empty!14245)))

(declare-fun mapIsEmpty!22951 () Bool)

(assert (=> mapIsEmpty!22951 mapRes!22951))

(declare-fun b!814617 () Bool)

(assert (=> b!814617 (= e!451601 (not true))))

(declare-datatypes ((tuple2!9430 0))(
  ( (tuple2!9431 (_1!4726 (_ BitVec 64)) (_2!4726 V!23995)) )
))
(declare-datatypes ((List!15259 0))(
  ( (Nil!15256) (Cons!15255 (h!16384 tuple2!9430) (t!21569 List!15259)) )
))
(declare-datatypes ((ListLongMap!8243 0))(
  ( (ListLongMap!8244 (toList!4137 List!15259)) )
))
(declare-fun lt!364557 () ListLongMap!8243)

(declare-fun lt!364556 () ListLongMap!8243)

(assert (=> b!814617 (= lt!364557 lt!364556)))

(declare-datatypes ((Unit!27708 0))(
  ( (Unit!27709) )
))
(declare-fun lt!364558 () Unit!27708)

(declare-fun zeroValueBefore!34 () V!23995)

(declare-fun zeroValueAfter!34 () V!23995)

(declare-fun minValue!754 () V!23995)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!295 (array!44685 array!44687 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23995 V!23995 V!23995 V!23995 (_ BitVec 32) Int) Unit!27708)

(assert (=> b!814617 (= lt!364558 (lemmaNoChangeToArrayThenSameMapNoExtras!295 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2202 (array!44685 array!44687 (_ BitVec 32) (_ BitVec 32) V!23995 V!23995 (_ BitVec 32) Int) ListLongMap!8243)

(assert (=> b!814617 (= lt!364556 (getCurrentListMapNoExtraKeys!2202 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!814617 (= lt!364557 (getCurrentListMapNoExtraKeys!2202 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!22951 () Bool)

(declare-fun tp!44323 () Bool)

(assert (=> mapNonEmpty!22951 (= mapRes!22951 (and tp!44323 e!451599))))

(declare-fun mapKey!22951 () (_ BitVec 32))

(declare-fun mapRest!22951 () (Array (_ BitVec 32) ValueCell!6707))

(declare-fun mapValue!22951 () ValueCell!6707)

(assert (=> mapNonEmpty!22951 (= (arr!21403 _values!788) (store mapRest!22951 mapKey!22951 mapValue!22951))))

(assert (= (and start!70108 res!556392) b!814611))

(assert (= (and b!814611 res!556393) b!814613))

(assert (= (and b!814613 res!556395) b!814612))

(assert (= (and b!814612 res!556394) b!814617))

(assert (= (and b!814615 condMapEmpty!22951) mapIsEmpty!22951))

(assert (= (and b!814615 (not condMapEmpty!22951)) mapNonEmpty!22951))

(get-info :version)

(assert (= (and mapNonEmpty!22951 ((_ is ValueCellFull!6707) mapValue!22951)) b!814616))

(assert (= (and b!814615 ((_ is ValueCellFull!6707) mapDefault!22951)) b!814614))

(assert (= start!70108 b!814615))

(declare-fun m!755853 () Bool)

(assert (=> b!814613 m!755853))

(declare-fun m!755855 () Bool)

(assert (=> start!70108 m!755855))

(declare-fun m!755857 () Bool)

(assert (=> start!70108 m!755857))

(declare-fun m!755859 () Bool)

(assert (=> start!70108 m!755859))

(declare-fun m!755861 () Bool)

(assert (=> mapNonEmpty!22951 m!755861))

(declare-fun m!755863 () Bool)

(assert (=> b!814617 m!755863))

(declare-fun m!755865 () Bool)

(assert (=> b!814617 m!755865))

(declare-fun m!755867 () Bool)

(assert (=> b!814617 m!755867))

(declare-fun m!755869 () Bool)

(assert (=> b!814612 m!755869))

(check-sat tp_is_empty!14245 (not b!814612) (not mapNonEmpty!22951) b_and!21289 (not start!70108) (not b_next!12535) (not b!814613) (not b!814617))
(check-sat b_and!21289 (not b_next!12535))
