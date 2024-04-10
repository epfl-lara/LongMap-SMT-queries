; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42288 () Bool)

(assert start!42288)

(declare-fun b_free!11793 () Bool)

(declare-fun b_next!11793 () Bool)

(assert (=> start!42288 (= b_free!11793 (not b_next!11793))))

(declare-fun tp!41406 () Bool)

(declare-fun b_and!20231 () Bool)

(assert (=> start!42288 (= tp!41406 b_and!20231)))

(declare-fun res!281885 () Bool)

(declare-fun e!276615 () Bool)

(assert (=> start!42288 (=> (not res!281885) (not e!276615))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42288 (= res!281885 (validMask!0 mask!1365))))

(assert (=> start!42288 e!276615))

(declare-fun tp_is_empty!13221 () Bool)

(assert (=> start!42288 tp_is_empty!13221))

(assert (=> start!42288 tp!41406))

(assert (=> start!42288 true))

(declare-datatypes ((array!30199 0))(
  ( (array!30200 (arr!14521 (Array (_ BitVec 32) (_ BitVec 64))) (size!14873 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30199)

(declare-fun array_inv!10466 (array!30199) Bool)

(assert (=> start!42288 (array_inv!10466 _keys!1025)))

(declare-datatypes ((V!18733 0))(
  ( (V!18734 (val!6655 Int)) )
))
(declare-datatypes ((ValueCell!6267 0))(
  ( (ValueCellFull!6267 (v!8946 V!18733)) (EmptyCell!6267) )
))
(declare-datatypes ((array!30201 0))(
  ( (array!30202 (arr!14522 (Array (_ BitVec 32) ValueCell!6267)) (size!14874 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30201)

(declare-fun e!276614 () Bool)

(declare-fun array_inv!10467 (array!30201) Bool)

(assert (=> start!42288 (and (array_inv!10467 _values!833) e!276614)))

(declare-fun b!471877 () Bool)

(declare-fun e!276612 () Bool)

(assert (=> b!471877 (= e!276612 tp_is_empty!13221)))

(declare-fun b!471878 () Bool)

(declare-fun res!281888 () Bool)

(assert (=> b!471878 (=> (not res!281888) (not e!276615))))

(declare-datatypes ((List!8841 0))(
  ( (Nil!8838) (Cons!8837 (h!9693 (_ BitVec 64)) (t!14807 List!8841)) )
))
(declare-fun arrayNoDuplicates!0 (array!30199 (_ BitVec 32) List!8841) Bool)

(assert (=> b!471878 (= res!281888 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8838))))

(declare-fun b!471879 () Bool)

(assert (=> b!471879 (= e!276615 (not true))))

(declare-datatypes ((tuple2!8758 0))(
  ( (tuple2!8759 (_1!4390 (_ BitVec 64)) (_2!4390 V!18733)) )
))
(declare-datatypes ((List!8842 0))(
  ( (Nil!8839) (Cons!8838 (h!9694 tuple2!8758) (t!14808 List!8842)) )
))
(declare-datatypes ((ListLongMap!7671 0))(
  ( (ListLongMap!7672 (toList!3851 List!8842)) )
))
(declare-fun lt!214078 () ListLongMap!7671)

(declare-fun lt!214077 () ListLongMap!7671)

(assert (=> b!471879 (= lt!214078 lt!214077)))

(declare-datatypes ((Unit!13861 0))(
  ( (Unit!13862) )
))
(declare-fun lt!214079 () Unit!13861)

(declare-fun minValueBefore!38 () V!18733)

(declare-fun zeroValue!794 () V!18733)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18733)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!194 (array!30199 array!30201 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18733 V!18733 V!18733 V!18733 (_ BitVec 32) Int) Unit!13861)

(assert (=> b!471879 (= lt!214079 (lemmaNoChangeToArrayThenSameMapNoExtras!194 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2014 (array!30199 array!30201 (_ BitVec 32) (_ BitVec 32) V!18733 V!18733 (_ BitVec 32) Int) ListLongMap!7671)

(assert (=> b!471879 (= lt!214077 (getCurrentListMapNoExtraKeys!2014 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471879 (= lt!214078 (getCurrentListMapNoExtraKeys!2014 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21538 () Bool)

(declare-fun mapRes!21538 () Bool)

(assert (=> mapIsEmpty!21538 mapRes!21538))

(declare-fun b!471880 () Bool)

(declare-fun res!281886 () Bool)

(assert (=> b!471880 (=> (not res!281886) (not e!276615))))

(assert (=> b!471880 (= res!281886 (and (= (size!14874 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14873 _keys!1025) (size!14874 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!471881 () Bool)

(declare-fun e!276611 () Bool)

(assert (=> b!471881 (= e!276614 (and e!276611 mapRes!21538))))

(declare-fun condMapEmpty!21538 () Bool)

(declare-fun mapDefault!21538 () ValueCell!6267)

(assert (=> b!471881 (= condMapEmpty!21538 (= (arr!14522 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6267)) mapDefault!21538)))))

(declare-fun b!471882 () Bool)

(assert (=> b!471882 (= e!276611 tp_is_empty!13221)))

(declare-fun mapNonEmpty!21538 () Bool)

(declare-fun tp!41407 () Bool)

(assert (=> mapNonEmpty!21538 (= mapRes!21538 (and tp!41407 e!276612))))

(declare-fun mapKey!21538 () (_ BitVec 32))

(declare-fun mapRest!21538 () (Array (_ BitVec 32) ValueCell!6267))

(declare-fun mapValue!21538 () ValueCell!6267)

(assert (=> mapNonEmpty!21538 (= (arr!14522 _values!833) (store mapRest!21538 mapKey!21538 mapValue!21538))))

(declare-fun b!471883 () Bool)

(declare-fun res!281887 () Bool)

(assert (=> b!471883 (=> (not res!281887) (not e!276615))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30199 (_ BitVec 32)) Bool)

(assert (=> b!471883 (= res!281887 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!42288 res!281885) b!471880))

(assert (= (and b!471880 res!281886) b!471883))

(assert (= (and b!471883 res!281887) b!471878))

(assert (= (and b!471878 res!281888) b!471879))

(assert (= (and b!471881 condMapEmpty!21538) mapIsEmpty!21538))

(assert (= (and b!471881 (not condMapEmpty!21538)) mapNonEmpty!21538))

(get-info :version)

(assert (= (and mapNonEmpty!21538 ((_ is ValueCellFull!6267) mapValue!21538)) b!471877))

(assert (= (and b!471881 ((_ is ValueCellFull!6267) mapDefault!21538)) b!471882))

(assert (= start!42288 b!471881))

(declare-fun m!453947 () Bool)

(assert (=> b!471883 m!453947))

(declare-fun m!453949 () Bool)

(assert (=> mapNonEmpty!21538 m!453949))

(declare-fun m!453951 () Bool)

(assert (=> start!42288 m!453951))

(declare-fun m!453953 () Bool)

(assert (=> start!42288 m!453953))

(declare-fun m!453955 () Bool)

(assert (=> start!42288 m!453955))

(declare-fun m!453957 () Bool)

(assert (=> b!471879 m!453957))

(declare-fun m!453959 () Bool)

(assert (=> b!471879 m!453959))

(declare-fun m!453961 () Bool)

(assert (=> b!471879 m!453961))

(declare-fun m!453963 () Bool)

(assert (=> b!471878 m!453963))

(check-sat (not b!471883) (not b!471878) tp_is_empty!13221 (not b!471879) (not b_next!11793) (not mapNonEmpty!21538) b_and!20231 (not start!42288))
(check-sat b_and!20231 (not b_next!11793))
