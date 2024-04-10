; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41782 () Bool)

(assert start!41782)

(declare-fun b_free!11403 () Bool)

(declare-fun b_next!11403 () Bool)

(assert (=> start!41782 (= b_free!11403 (not b_next!11403))))

(declare-fun tp!40216 () Bool)

(declare-fun b_and!19771 () Bool)

(assert (=> start!41782 (= tp!40216 b_and!19771)))

(declare-fun b!466554 () Bool)

(declare-fun res!278878 () Bool)

(declare-fun e!272814 () Bool)

(assert (=> b!466554 (=> (not res!278878) (not e!272814))))

(declare-datatypes ((array!29445 0))(
  ( (array!29446 (arr!14151 (Array (_ BitVec 32) (_ BitVec 64))) (size!14503 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29445)

(declare-datatypes ((List!8564 0))(
  ( (Nil!8561) (Cons!8560 (h!9416 (_ BitVec 64)) (t!14516 List!8564)) )
))
(declare-fun arrayNoDuplicates!0 (array!29445 (_ BitVec 32) List!8564) Bool)

(assert (=> b!466554 (= res!278878 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8561))))

(declare-fun b!466555 () Bool)

(declare-fun e!272815 () Bool)

(declare-fun e!272813 () Bool)

(declare-fun mapRes!20932 () Bool)

(assert (=> b!466555 (= e!272815 (and e!272813 mapRes!20932))))

(declare-fun condMapEmpty!20932 () Bool)

(declare-datatypes ((V!18213 0))(
  ( (V!18214 (val!6460 Int)) )
))
(declare-datatypes ((ValueCell!6072 0))(
  ( (ValueCellFull!6072 (v!8748 V!18213)) (EmptyCell!6072) )
))
(declare-datatypes ((array!29447 0))(
  ( (array!29448 (arr!14152 (Array (_ BitVec 32) ValueCell!6072)) (size!14504 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29447)

(declare-fun mapDefault!20932 () ValueCell!6072)

(assert (=> b!466555 (= condMapEmpty!20932 (= (arr!14152 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6072)) mapDefault!20932)))))

(declare-fun b!466556 () Bool)

(declare-fun res!278875 () Bool)

(assert (=> b!466556 (=> (not res!278875) (not e!272814))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29445 (_ BitVec 32)) Bool)

(assert (=> b!466556 (= res!278875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!20932 () Bool)

(assert (=> mapIsEmpty!20932 mapRes!20932))

(declare-fun b!466558 () Bool)

(declare-fun res!278877 () Bool)

(assert (=> b!466558 (=> (not res!278877) (not e!272814))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!466558 (= res!278877 (and (= (size!14504 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14503 _keys!1025) (size!14504 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!466559 () Bool)

(declare-fun tp_is_empty!12831 () Bool)

(assert (=> b!466559 (= e!272813 tp_is_empty!12831)))

(declare-fun mapNonEmpty!20932 () Bool)

(declare-fun tp!40215 () Bool)

(declare-fun e!272810 () Bool)

(assert (=> mapNonEmpty!20932 (= mapRes!20932 (and tp!40215 e!272810))))

(declare-fun mapValue!20932 () ValueCell!6072)

(declare-fun mapRest!20932 () (Array (_ BitVec 32) ValueCell!6072))

(declare-fun mapKey!20932 () (_ BitVec 32))

(assert (=> mapNonEmpty!20932 (= (arr!14152 _values!833) (store mapRest!20932 mapKey!20932 mapValue!20932))))

(declare-fun b!466557 () Bool)

(assert (=> b!466557 (= e!272810 tp_is_empty!12831)))

(declare-fun res!278876 () Bool)

(assert (=> start!41782 (=> (not res!278876) (not e!272814))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41782 (= res!278876 (validMask!0 mask!1365))))

(assert (=> start!41782 e!272814))

(assert (=> start!41782 tp_is_empty!12831))

(assert (=> start!41782 tp!40216))

(assert (=> start!41782 true))

(declare-fun array_inv!10218 (array!29445) Bool)

(assert (=> start!41782 (array_inv!10218 _keys!1025)))

(declare-fun array_inv!10219 (array!29447) Bool)

(assert (=> start!41782 (and (array_inv!10219 _values!833) e!272815)))

(declare-fun b!466560 () Bool)

(declare-fun e!272812 () Bool)

(assert (=> b!466560 (= e!272812 true)))

(declare-datatypes ((tuple2!8474 0))(
  ( (tuple2!8475 (_1!4248 (_ BitVec 64)) (_2!4248 V!18213)) )
))
(declare-datatypes ((List!8565 0))(
  ( (Nil!8562) (Cons!8561 (h!9417 tuple2!8474) (t!14517 List!8565)) )
))
(declare-datatypes ((ListLongMap!7387 0))(
  ( (ListLongMap!7388 (toList!3709 List!8565)) )
))
(declare-fun lt!210866 () ListLongMap!7387)

(declare-fun zeroValue!794 () V!18213)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18213)

(declare-fun getCurrentListMap!2159 (array!29445 array!29447 (_ BitVec 32) (_ BitVec 32) V!18213 V!18213 (_ BitVec 32) Int) ListLongMap!7387)

(assert (=> b!466560 (= lt!210866 (getCurrentListMap!2159 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210864 () ListLongMap!7387)

(declare-fun minValueBefore!38 () V!18213)

(declare-fun +!1665 (ListLongMap!7387 tuple2!8474) ListLongMap!7387)

(assert (=> b!466560 (= lt!210864 (+!1665 (getCurrentListMap!2159 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8475 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!466561 () Bool)

(assert (=> b!466561 (= e!272814 (not e!272812))))

(declare-fun res!278879 () Bool)

(assert (=> b!466561 (=> res!278879 e!272812)))

(assert (=> b!466561 (= res!278879 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!210863 () ListLongMap!7387)

(declare-fun lt!210865 () ListLongMap!7387)

(assert (=> b!466561 (= lt!210863 lt!210865)))

(declare-datatypes ((Unit!13580 0))(
  ( (Unit!13581) )
))
(declare-fun lt!210867 () Unit!13580)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!65 (array!29445 array!29447 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18213 V!18213 V!18213 V!18213 (_ BitVec 32) Int) Unit!13580)

(assert (=> b!466561 (= lt!210867 (lemmaNoChangeToArrayThenSameMapNoExtras!65 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1885 (array!29445 array!29447 (_ BitVec 32) (_ BitVec 32) V!18213 V!18213 (_ BitVec 32) Int) ListLongMap!7387)

(assert (=> b!466561 (= lt!210865 (getCurrentListMapNoExtraKeys!1885 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466561 (= lt!210863 (getCurrentListMapNoExtraKeys!1885 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!41782 res!278876) b!466558))

(assert (= (and b!466558 res!278877) b!466556))

(assert (= (and b!466556 res!278875) b!466554))

(assert (= (and b!466554 res!278878) b!466561))

(assert (= (and b!466561 (not res!278879)) b!466560))

(assert (= (and b!466555 condMapEmpty!20932) mapIsEmpty!20932))

(assert (= (and b!466555 (not condMapEmpty!20932)) mapNonEmpty!20932))

(get-info :version)

(assert (= (and mapNonEmpty!20932 ((_ is ValueCellFull!6072) mapValue!20932)) b!466557))

(assert (= (and b!466555 ((_ is ValueCellFull!6072) mapDefault!20932)) b!466559))

(assert (= start!41782 b!466555))

(declare-fun m!448771 () Bool)

(assert (=> start!41782 m!448771))

(declare-fun m!448773 () Bool)

(assert (=> start!41782 m!448773))

(declare-fun m!448775 () Bool)

(assert (=> start!41782 m!448775))

(declare-fun m!448777 () Bool)

(assert (=> b!466554 m!448777))

(declare-fun m!448779 () Bool)

(assert (=> b!466560 m!448779))

(declare-fun m!448781 () Bool)

(assert (=> b!466560 m!448781))

(assert (=> b!466560 m!448781))

(declare-fun m!448783 () Bool)

(assert (=> b!466560 m!448783))

(declare-fun m!448785 () Bool)

(assert (=> b!466556 m!448785))

(declare-fun m!448787 () Bool)

(assert (=> mapNonEmpty!20932 m!448787))

(declare-fun m!448789 () Bool)

(assert (=> b!466561 m!448789))

(declare-fun m!448791 () Bool)

(assert (=> b!466561 m!448791))

(declare-fun m!448793 () Bool)

(assert (=> b!466561 m!448793))

(check-sat (not mapNonEmpty!20932) (not b_next!11403) (not b!466554) (not b!466561) tp_is_empty!12831 (not start!41782) (not b!466560) b_and!19771 (not b!466556))
(check-sat b_and!19771 (not b_next!11403))
