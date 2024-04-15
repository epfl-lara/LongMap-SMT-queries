; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70562 () Bool)

(assert start!70562)

(declare-fun b_free!12889 () Bool)

(declare-fun b_next!12889 () Bool)

(assert (=> start!70562 (= b_free!12889 (not b_next!12889))))

(declare-fun tp!45403 () Bool)

(declare-fun b_and!21705 () Bool)

(assert (=> start!70562 (= tp!45403 b_and!21705)))

(declare-fun b!819707 () Bool)

(declare-fun res!559396 () Bool)

(declare-fun e!455306 () Bool)

(assert (=> b!819707 (=> (not res!559396) (not e!455306))))

(declare-datatypes ((array!45369 0))(
  ( (array!45370 (arr!21738 (Array (_ BitVec 32) (_ BitVec 64))) (size!22159 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45369)

(declare-datatypes ((List!15512 0))(
  ( (Nil!15509) (Cons!15508 (h!16637 (_ BitVec 64)) (t!21834 List!15512)) )
))
(declare-fun arrayNoDuplicates!0 (array!45369 (_ BitVec 32) List!15512) Bool)

(assert (=> b!819707 (= res!559396 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15509))))

(declare-fun res!559395 () Bool)

(assert (=> start!70562 (=> (not res!559395) (not e!455306))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70562 (= res!559395 (validMask!0 mask!1312))))

(assert (=> start!70562 e!455306))

(declare-fun tp_is_empty!14599 () Bool)

(assert (=> start!70562 tp_is_empty!14599))

(declare-fun array_inv!17441 (array!45369) Bool)

(assert (=> start!70562 (array_inv!17441 _keys!976)))

(assert (=> start!70562 true))

(declare-datatypes ((V!24467 0))(
  ( (V!24468 (val!7347 Int)) )
))
(declare-datatypes ((ValueCell!6884 0))(
  ( (ValueCellFull!6884 (v!9771 V!24467)) (EmptyCell!6884) )
))
(declare-datatypes ((array!45371 0))(
  ( (array!45372 (arr!21739 (Array (_ BitVec 32) ValueCell!6884)) (size!22160 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45371)

(declare-fun e!455302 () Bool)

(declare-fun array_inv!17442 (array!45371) Bool)

(assert (=> start!70562 (and (array_inv!17442 _values!788) e!455302)))

(assert (=> start!70562 tp!45403))

(declare-fun b!819708 () Bool)

(declare-fun e!455301 () Bool)

(assert (=> b!819708 (= e!455306 (not e!455301))))

(declare-fun res!559392 () Bool)

(assert (=> b!819708 (=> res!559392 e!455301)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!819708 (= res!559392 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9694 0))(
  ( (tuple2!9695 (_1!4858 (_ BitVec 64)) (_2!4858 V!24467)) )
))
(declare-datatypes ((List!15513 0))(
  ( (Nil!15510) (Cons!15509 (h!16638 tuple2!9694) (t!21835 List!15513)) )
))
(declare-datatypes ((ListLongMap!8507 0))(
  ( (ListLongMap!8508 (toList!4269 List!15513)) )
))
(declare-fun lt!368039 () ListLongMap!8507)

(declare-fun lt!368038 () ListLongMap!8507)

(assert (=> b!819708 (= lt!368039 lt!368038)))

(declare-fun zeroValueBefore!34 () V!24467)

(declare-datatypes ((Unit!27965 0))(
  ( (Unit!27966) )
))
(declare-fun lt!368034 () Unit!27965)

(declare-fun zeroValueAfter!34 () V!24467)

(declare-fun minValue!754 () V!24467)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!416 (array!45369 array!45371 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24467 V!24467 V!24467 V!24467 (_ BitVec 32) Int) Unit!27965)

(assert (=> b!819708 (= lt!368034 (lemmaNoChangeToArrayThenSameMapNoExtras!416 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2323 (array!45369 array!45371 (_ BitVec 32) (_ BitVec 32) V!24467 V!24467 (_ BitVec 32) Int) ListLongMap!8507)

(assert (=> b!819708 (= lt!368038 (getCurrentListMapNoExtraKeys!2323 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819708 (= lt!368039 (getCurrentListMapNoExtraKeys!2323 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819709 () Bool)

(declare-fun res!559391 () Bool)

(assert (=> b!819709 (=> (not res!559391) (not e!455306))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45369 (_ BitVec 32)) Bool)

(assert (=> b!819709 (= res!559391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!819710 () Bool)

(declare-fun e!455303 () Bool)

(assert (=> b!819710 (= e!455303 tp_is_empty!14599)))

(declare-fun b!819711 () Bool)

(declare-fun res!559393 () Bool)

(assert (=> b!819711 (=> (not res!559393) (not e!455306))))

(assert (=> b!819711 (= res!559393 (and (= (size!22160 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22159 _keys!976) (size!22160 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!819712 () Bool)

(declare-fun e!455305 () Bool)

(assert (=> b!819712 (= e!455305 tp_is_empty!14599)))

(declare-fun mapNonEmpty!23500 () Bool)

(declare-fun mapRes!23500 () Bool)

(declare-fun tp!45402 () Bool)

(assert (=> mapNonEmpty!23500 (= mapRes!23500 (and tp!45402 e!455305))))

(declare-fun mapValue!23500 () ValueCell!6884)

(declare-fun mapRest!23500 () (Array (_ BitVec 32) ValueCell!6884))

(declare-fun mapKey!23500 () (_ BitVec 32))

(assert (=> mapNonEmpty!23500 (= (arr!21739 _values!788) (store mapRest!23500 mapKey!23500 mapValue!23500))))

(declare-fun e!455307 () Bool)

(declare-fun b!819713 () Bool)

(declare-fun lt!368040 () ListLongMap!8507)

(declare-fun +!1890 (ListLongMap!8507 tuple2!9694) ListLongMap!8507)

(assert (=> b!819713 (= e!455307 (= lt!368040 (+!1890 lt!368038 (tuple2!9695 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun mapIsEmpty!23500 () Bool)

(assert (=> mapIsEmpty!23500 mapRes!23500))

(declare-fun b!819714 () Bool)

(assert (=> b!819714 (= e!455302 (and e!455303 mapRes!23500))))

(declare-fun condMapEmpty!23500 () Bool)

(declare-fun mapDefault!23500 () ValueCell!6884)

(assert (=> b!819714 (= condMapEmpty!23500 (= (arr!21739 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6884)) mapDefault!23500)))))

(declare-fun b!819715 () Bool)

(assert (=> b!819715 (= e!455301 true)))

(declare-fun lt!368036 () tuple2!9694)

(declare-fun lt!368035 () ListLongMap!8507)

(declare-fun lt!368041 () tuple2!9694)

(assert (=> b!819715 (= lt!368035 (+!1890 (+!1890 lt!368038 lt!368041) lt!368036))))

(declare-fun lt!368043 () ListLongMap!8507)

(assert (=> b!819715 (= (+!1890 lt!368039 lt!368036) (+!1890 lt!368043 lt!368036))))

(declare-fun lt!368042 () Unit!27965)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!204 (ListLongMap!8507 (_ BitVec 64) V!24467 V!24467) Unit!27965)

(assert (=> b!819715 (= lt!368042 (addSameAsAddTwiceSameKeyDiffValues!204 lt!368039 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!819715 (= lt!368036 (tuple2!9695 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!819715 e!455307))

(declare-fun res!559394 () Bool)

(assert (=> b!819715 (=> (not res!559394) (not e!455307))))

(declare-fun lt!368037 () ListLongMap!8507)

(assert (=> b!819715 (= res!559394 (= lt!368037 lt!368043))))

(assert (=> b!819715 (= lt!368043 (+!1890 lt!368039 lt!368041))))

(assert (=> b!819715 (= lt!368041 (tuple2!9695 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2417 (array!45369 array!45371 (_ BitVec 32) (_ BitVec 32) V!24467 V!24467 (_ BitVec 32) Int) ListLongMap!8507)

(assert (=> b!819715 (= lt!368040 (getCurrentListMap!2417 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819715 (= lt!368037 (getCurrentListMap!2417 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70562 res!559395) b!819711))

(assert (= (and b!819711 res!559393) b!819709))

(assert (= (and b!819709 res!559391) b!819707))

(assert (= (and b!819707 res!559396) b!819708))

(assert (= (and b!819708 (not res!559392)) b!819715))

(assert (= (and b!819715 res!559394) b!819713))

(assert (= (and b!819714 condMapEmpty!23500) mapIsEmpty!23500))

(assert (= (and b!819714 (not condMapEmpty!23500)) mapNonEmpty!23500))

(get-info :version)

(assert (= (and mapNonEmpty!23500 ((_ is ValueCellFull!6884) mapValue!23500)) b!819712))

(assert (= (and b!819714 ((_ is ValueCellFull!6884) mapDefault!23500)) b!819710))

(assert (= start!70562 b!819714))

(declare-fun m!760995 () Bool)

(assert (=> b!819708 m!760995))

(declare-fun m!760997 () Bool)

(assert (=> b!819708 m!760997))

(declare-fun m!760999 () Bool)

(assert (=> b!819708 m!760999))

(declare-fun m!761001 () Bool)

(assert (=> b!819715 m!761001))

(declare-fun m!761003 () Bool)

(assert (=> b!819715 m!761003))

(declare-fun m!761005 () Bool)

(assert (=> b!819715 m!761005))

(declare-fun m!761007 () Bool)

(assert (=> b!819715 m!761007))

(declare-fun m!761009 () Bool)

(assert (=> b!819715 m!761009))

(declare-fun m!761011 () Bool)

(assert (=> b!819715 m!761011))

(assert (=> b!819715 m!761005))

(declare-fun m!761013 () Bool)

(assert (=> b!819715 m!761013))

(declare-fun m!761015 () Bool)

(assert (=> b!819715 m!761015))

(declare-fun m!761017 () Bool)

(assert (=> mapNonEmpty!23500 m!761017))

(declare-fun m!761019 () Bool)

(assert (=> start!70562 m!761019))

(declare-fun m!761021 () Bool)

(assert (=> start!70562 m!761021))

(declare-fun m!761023 () Bool)

(assert (=> start!70562 m!761023))

(declare-fun m!761025 () Bool)

(assert (=> b!819713 m!761025))

(declare-fun m!761027 () Bool)

(assert (=> b!819707 m!761027))

(declare-fun m!761029 () Bool)

(assert (=> b!819709 m!761029))

(check-sat (not b!819709) (not b!819715) (not b_next!12889) b_and!21705 (not b!819713) (not b!819707) (not b!819708) (not mapNonEmpty!23500) tp_is_empty!14599 (not start!70562))
(check-sat b_and!21705 (not b_next!12889))
