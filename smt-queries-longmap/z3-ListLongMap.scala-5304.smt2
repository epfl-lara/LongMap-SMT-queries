; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71030 () Bool)

(assert start!71030)

(declare-fun b_free!13233 () Bool)

(declare-fun b_next!13233 () Bool)

(assert (=> start!71030 (= b_free!13233 (not b_next!13233))))

(declare-fun tp!46453 () Bool)

(declare-fun b_and!22137 () Bool)

(assert (=> start!71030 (= tp!46453 b_and!22137)))

(declare-fun b!824836 () Bool)

(declare-fun res!562329 () Bool)

(declare-fun e!458982 () Bool)

(assert (=> b!824836 (=> (not res!562329) (not e!458982))))

(declare-datatypes ((array!46074 0))(
  ( (array!46075 (arr!22084 (Array (_ BitVec 32) (_ BitVec 64))) (size!22505 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46074)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46074 (_ BitVec 32)) Bool)

(assert (=> b!824836 (= res!562329 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!824838 () Bool)

(declare-fun res!562328 () Bool)

(assert (=> b!824838 (=> (not res!562328) (not e!458982))))

(declare-datatypes ((List!15760 0))(
  ( (Nil!15757) (Cons!15756 (h!16885 (_ BitVec 64)) (t!22103 List!15760)) )
))
(declare-fun arrayNoDuplicates!0 (array!46074 (_ BitVec 32) List!15760) Bool)

(assert (=> b!824838 (= res!562328 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15757))))

(declare-fun mapIsEmpty!24034 () Bool)

(declare-fun mapRes!24034 () Bool)

(assert (=> mapIsEmpty!24034 mapRes!24034))

(declare-fun b!824839 () Bool)

(declare-fun e!458984 () Bool)

(declare-fun e!458985 () Bool)

(assert (=> b!824839 (= e!458984 (and e!458985 mapRes!24034))))

(declare-fun condMapEmpty!24034 () Bool)

(declare-datatypes ((V!24925 0))(
  ( (V!24926 (val!7519 Int)) )
))
(declare-datatypes ((ValueCell!7056 0))(
  ( (ValueCellFull!7056 (v!9952 V!24925)) (EmptyCell!7056) )
))
(declare-datatypes ((array!46076 0))(
  ( (array!46077 (arr!22085 (Array (_ BitVec 32) ValueCell!7056)) (size!22506 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46076)

(declare-fun mapDefault!24034 () ValueCell!7056)

(assert (=> b!824839 (= condMapEmpty!24034 (= (arr!22085 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7056)) mapDefault!24034)))))

(declare-fun b!824840 () Bool)

(declare-fun e!458986 () Bool)

(assert (=> b!824840 (= e!458982 (not e!458986))))

(declare-fun res!562330 () Bool)

(assert (=> b!824840 (=> res!562330 e!458986)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!824840 (= res!562330 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9954 0))(
  ( (tuple2!9955 (_1!4988 (_ BitVec 64)) (_2!4988 V!24925)) )
))
(declare-datatypes ((List!15761 0))(
  ( (Nil!15758) (Cons!15757 (h!16886 tuple2!9954) (t!22104 List!15761)) )
))
(declare-datatypes ((ListLongMap!8777 0))(
  ( (ListLongMap!8778 (toList!4404 List!15761)) )
))
(declare-fun lt!372024 () ListLongMap!8777)

(declare-fun lt!372025 () ListLongMap!8777)

(assert (=> b!824840 (= lt!372024 lt!372025)))

(declare-fun zeroValueBefore!34 () V!24925)

(declare-datatypes ((Unit!28272 0))(
  ( (Unit!28273) )
))
(declare-fun lt!372023 () Unit!28272)

(declare-fun zeroValueAfter!34 () V!24925)

(declare-fun minValue!754 () V!24925)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!527 (array!46074 array!46076 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24925 V!24925 V!24925 V!24925 (_ BitVec 32) Int) Unit!28272)

(assert (=> b!824840 (= lt!372023 (lemmaNoChangeToArrayThenSameMapNoExtras!527 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2417 (array!46074 array!46076 (_ BitVec 32) (_ BitVec 32) V!24925 V!24925 (_ BitVec 32) Int) ListLongMap!8777)

(assert (=> b!824840 (= lt!372025 (getCurrentListMapNoExtraKeys!2417 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824840 (= lt!372024 (getCurrentListMapNoExtraKeys!2417 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824841 () Bool)

(declare-fun res!562332 () Bool)

(assert (=> b!824841 (=> (not res!562332) (not e!458982))))

(assert (=> b!824841 (= res!562332 (and (= (size!22506 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22505 _keys!976) (size!22506 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!824842 () Bool)

(declare-fun tp_is_empty!14943 () Bool)

(assert (=> b!824842 (= e!458985 tp_is_empty!14943)))

(declare-fun mapNonEmpty!24034 () Bool)

(declare-fun tp!46452 () Bool)

(declare-fun e!458987 () Bool)

(assert (=> mapNonEmpty!24034 (= mapRes!24034 (and tp!46452 e!458987))))

(declare-fun mapKey!24034 () (_ BitVec 32))

(declare-fun mapValue!24034 () ValueCell!7056)

(declare-fun mapRest!24034 () (Array (_ BitVec 32) ValueCell!7056))

(assert (=> mapNonEmpty!24034 (= (arr!22085 _values!788) (store mapRest!24034 mapKey!24034 mapValue!24034))))

(declare-fun b!824843 () Bool)

(assert (=> b!824843 (= e!458986 true)))

(declare-fun lt!372026 () ListLongMap!8777)

(declare-fun getCurrentListMap!2542 (array!46074 array!46076 (_ BitVec 32) (_ BitVec 32) V!24925 V!24925 (_ BitVec 32) Int) ListLongMap!8777)

(assert (=> b!824843 (= lt!372026 (getCurrentListMap!2542 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824837 () Bool)

(assert (=> b!824837 (= e!458987 tp_is_empty!14943)))

(declare-fun res!562331 () Bool)

(assert (=> start!71030 (=> (not res!562331) (not e!458982))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71030 (= res!562331 (validMask!0 mask!1312))))

(assert (=> start!71030 e!458982))

(assert (=> start!71030 tp_is_empty!14943))

(declare-fun array_inv!17615 (array!46074) Bool)

(assert (=> start!71030 (array_inv!17615 _keys!976)))

(assert (=> start!71030 true))

(declare-fun array_inv!17616 (array!46076) Bool)

(assert (=> start!71030 (and (array_inv!17616 _values!788) e!458984)))

(assert (=> start!71030 tp!46453))

(assert (= (and start!71030 res!562331) b!824841))

(assert (= (and b!824841 res!562332) b!824836))

(assert (= (and b!824836 res!562329) b!824838))

(assert (= (and b!824838 res!562328) b!824840))

(assert (= (and b!824840 (not res!562330)) b!824843))

(assert (= (and b!824839 condMapEmpty!24034) mapIsEmpty!24034))

(assert (= (and b!824839 (not condMapEmpty!24034)) mapNonEmpty!24034))

(get-info :version)

(assert (= (and mapNonEmpty!24034 ((_ is ValueCellFull!7056) mapValue!24034)) b!824837))

(assert (= (and b!824839 ((_ is ValueCellFull!7056) mapDefault!24034)) b!824842))

(assert (= start!71030 b!824839))

(declare-fun m!766857 () Bool)

(assert (=> b!824840 m!766857))

(declare-fun m!766859 () Bool)

(assert (=> b!824840 m!766859))

(declare-fun m!766861 () Bool)

(assert (=> b!824840 m!766861))

(declare-fun m!766863 () Bool)

(assert (=> b!824836 m!766863))

(declare-fun m!766865 () Bool)

(assert (=> b!824838 m!766865))

(declare-fun m!766867 () Bool)

(assert (=> mapNonEmpty!24034 m!766867))

(declare-fun m!766869 () Bool)

(assert (=> start!71030 m!766869))

(declare-fun m!766871 () Bool)

(assert (=> start!71030 m!766871))

(declare-fun m!766873 () Bool)

(assert (=> start!71030 m!766873))

(declare-fun m!766875 () Bool)

(assert (=> b!824843 m!766875))

(check-sat (not b_next!13233) (not b!824838) tp_is_empty!14943 (not start!71030) (not b!824840) (not b!824843) b_and!22137 (not mapNonEmpty!24034) (not b!824836))
(check-sat b_and!22137 (not b_next!13233))
