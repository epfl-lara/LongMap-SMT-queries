; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70498 () Bool)

(assert start!70498)

(declare-fun b_free!12825 () Bool)

(declare-fun b_next!12825 () Bool)

(assert (=> start!70498 (= b_free!12825 (not b_next!12825))))

(declare-fun tp!45207 () Bool)

(declare-fun b_and!21655 () Bool)

(assert (=> start!70498 (= tp!45207 b_and!21655)))

(declare-fun b!818895 () Bool)

(declare-fun e!454657 () Bool)

(assert (=> b!818895 (= e!454657 true)))

(declare-datatypes ((V!24381 0))(
  ( (V!24382 (val!7315 Int)) )
))
(declare-datatypes ((tuple2!9618 0))(
  ( (tuple2!9619 (_1!4820 (_ BitVec 64)) (_2!4820 V!24381)) )
))
(declare-fun lt!367166 () tuple2!9618)

(declare-fun lt!367170 () tuple2!9618)

(declare-datatypes ((List!15449 0))(
  ( (Nil!15446) (Cons!15445 (h!16574 tuple2!9618) (t!21778 List!15449)) )
))
(declare-datatypes ((ListLongMap!8441 0))(
  ( (ListLongMap!8442 (toList!4236 List!15449)) )
))
(declare-fun lt!367165 () ListLongMap!8441)

(declare-fun lt!367168 () ListLongMap!8441)

(declare-fun +!1833 (ListLongMap!8441 tuple2!9618) ListLongMap!8441)

(assert (=> b!818895 (= lt!367168 (+!1833 (+!1833 lt!367165 lt!367166) lt!367170))))

(declare-fun lt!367164 () ListLongMap!8441)

(declare-fun lt!367169 () ListLongMap!8441)

(assert (=> b!818895 (= (+!1833 lt!367164 lt!367170) (+!1833 lt!367169 lt!367170))))

(declare-fun zeroValueBefore!34 () V!24381)

(declare-fun zeroValueAfter!34 () V!24381)

(declare-datatypes ((Unit!27953 0))(
  ( (Unit!27954) )
))
(declare-fun lt!367171 () Unit!27953)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!174 (ListLongMap!8441 (_ BitVec 64) V!24381 V!24381) Unit!27953)

(assert (=> b!818895 (= lt!367171 (addSameAsAddTwiceSameKeyDiffValues!174 lt!367164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!818895 (= lt!367170 (tuple2!9619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!454656 () Bool)

(assert (=> b!818895 e!454656))

(declare-fun res!558829 () Bool)

(assert (=> b!818895 (=> (not res!558829) (not e!454656))))

(declare-fun lt!367163 () ListLongMap!8441)

(assert (=> b!818895 (= res!558829 (= lt!367163 lt!367169))))

(assert (=> b!818895 (= lt!367169 (+!1833 lt!367164 lt!367166))))

(assert (=> b!818895 (= lt!367166 (tuple2!9619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((array!45268 0))(
  ( (array!45269 (arr!21688 (Array (_ BitVec 32) (_ BitVec 64))) (size!22109 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45268)

(declare-fun minValue!754 () V!24381)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((ValueCell!6852 0))(
  ( (ValueCellFull!6852 (v!9744 V!24381)) (EmptyCell!6852) )
))
(declare-datatypes ((array!45270 0))(
  ( (array!45271 (arr!21689 (Array (_ BitVec 32) ValueCell!6852)) (size!22110 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45270)

(declare-fun lt!367167 () ListLongMap!8441)

(declare-fun getCurrentListMap!2440 (array!45268 array!45270 (_ BitVec 32) (_ BitVec 32) V!24381 V!24381 (_ BitVec 32) Int) ListLongMap!8441)

(assert (=> b!818895 (= lt!367167 (getCurrentListMap!2440 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!818895 (= lt!367163 (getCurrentListMap!2440 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23401 () Bool)

(declare-fun mapRes!23401 () Bool)

(assert (=> mapIsEmpty!23401 mapRes!23401))

(declare-fun b!818896 () Bool)

(declare-fun res!558834 () Bool)

(declare-fun e!454661 () Bool)

(assert (=> b!818896 (=> (not res!558834) (not e!454661))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45268 (_ BitVec 32)) Bool)

(assert (=> b!818896 (= res!558834 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!818897 () Bool)

(assert (=> b!818897 (= e!454656 (= lt!367167 (+!1833 lt!367165 (tuple2!9619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!818898 () Bool)

(declare-fun e!454659 () Bool)

(declare-fun tp_is_empty!14535 () Bool)

(assert (=> b!818898 (= e!454659 tp_is_empty!14535)))

(declare-fun b!818899 () Bool)

(assert (=> b!818899 (= e!454661 (not e!454657))))

(declare-fun res!558831 () Bool)

(assert (=> b!818899 (=> res!558831 e!454657)))

(assert (=> b!818899 (= res!558831 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!818899 (= lt!367164 lt!367165)))

(declare-fun lt!367172 () Unit!27953)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!382 (array!45268 array!45270 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24381 V!24381 V!24381 V!24381 (_ BitVec 32) Int) Unit!27953)

(assert (=> b!818899 (= lt!367172 (lemmaNoChangeToArrayThenSameMapNoExtras!382 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2272 (array!45268 array!45270 (_ BitVec 32) (_ BitVec 32) V!24381 V!24381 (_ BitVec 32) Int) ListLongMap!8441)

(assert (=> b!818899 (= lt!367165 (getCurrentListMapNoExtraKeys!2272 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818899 (= lt!367164 (getCurrentListMapNoExtraKeys!2272 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23401 () Bool)

(declare-fun tp!45208 () Bool)

(declare-fun e!454655 () Bool)

(assert (=> mapNonEmpty!23401 (= mapRes!23401 (and tp!45208 e!454655))))

(declare-fun mapValue!23401 () ValueCell!6852)

(declare-fun mapKey!23401 () (_ BitVec 32))

(declare-fun mapRest!23401 () (Array (_ BitVec 32) ValueCell!6852))

(assert (=> mapNonEmpty!23401 (= (arr!21689 _values!788) (store mapRest!23401 mapKey!23401 mapValue!23401))))

(declare-fun res!558832 () Bool)

(assert (=> start!70498 (=> (not res!558832) (not e!454661))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70498 (= res!558832 (validMask!0 mask!1312))))

(assert (=> start!70498 e!454661))

(assert (=> start!70498 tp_is_empty!14535))

(declare-fun array_inv!17341 (array!45268) Bool)

(assert (=> start!70498 (array_inv!17341 _keys!976)))

(assert (=> start!70498 true))

(declare-fun e!454660 () Bool)

(declare-fun array_inv!17342 (array!45270) Bool)

(assert (=> start!70498 (and (array_inv!17342 _values!788) e!454660)))

(assert (=> start!70498 tp!45207))

(declare-fun b!818900 () Bool)

(declare-fun res!558830 () Bool)

(assert (=> b!818900 (=> (not res!558830) (not e!454661))))

(assert (=> b!818900 (= res!558830 (and (= (size!22110 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22109 _keys!976) (size!22110 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!818901 () Bool)

(assert (=> b!818901 (= e!454655 tp_is_empty!14535)))

(declare-fun b!818902 () Bool)

(assert (=> b!818902 (= e!454660 (and e!454659 mapRes!23401))))

(declare-fun condMapEmpty!23401 () Bool)

(declare-fun mapDefault!23401 () ValueCell!6852)

(assert (=> b!818902 (= condMapEmpty!23401 (= (arr!21689 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6852)) mapDefault!23401)))))

(declare-fun b!818903 () Bool)

(declare-fun res!558833 () Bool)

(assert (=> b!818903 (=> (not res!558833) (not e!454661))))

(declare-datatypes ((List!15450 0))(
  ( (Nil!15447) (Cons!15446 (h!16575 (_ BitVec 64)) (t!21779 List!15450)) )
))
(declare-fun arrayNoDuplicates!0 (array!45268 (_ BitVec 32) List!15450) Bool)

(assert (=> b!818903 (= res!558833 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15447))))

(assert (= (and start!70498 res!558832) b!818900))

(assert (= (and b!818900 res!558830) b!818896))

(assert (= (and b!818896 res!558834) b!818903))

(assert (= (and b!818903 res!558833) b!818899))

(assert (= (and b!818899 (not res!558831)) b!818895))

(assert (= (and b!818895 res!558829) b!818897))

(assert (= (and b!818902 condMapEmpty!23401) mapIsEmpty!23401))

(assert (= (and b!818902 (not condMapEmpty!23401)) mapNonEmpty!23401))

(get-info :version)

(assert (= (and mapNonEmpty!23401 ((_ is ValueCellFull!6852) mapValue!23401)) b!818901))

(assert (= (and b!818902 ((_ is ValueCellFull!6852) mapDefault!23401)) b!818898))

(assert (= start!70498 b!818902))

(declare-fun m!760357 () Bool)

(assert (=> b!818895 m!760357))

(declare-fun m!760359 () Bool)

(assert (=> b!818895 m!760359))

(assert (=> b!818895 m!760359))

(declare-fun m!760361 () Bool)

(assert (=> b!818895 m!760361))

(declare-fun m!760363 () Bool)

(assert (=> b!818895 m!760363))

(declare-fun m!760365 () Bool)

(assert (=> b!818895 m!760365))

(declare-fun m!760367 () Bool)

(assert (=> b!818895 m!760367))

(declare-fun m!760369 () Bool)

(assert (=> b!818895 m!760369))

(declare-fun m!760371 () Bool)

(assert (=> b!818895 m!760371))

(declare-fun m!760373 () Bool)

(assert (=> b!818896 m!760373))

(declare-fun m!760375 () Bool)

(assert (=> b!818897 m!760375))

(declare-fun m!760377 () Bool)

(assert (=> b!818903 m!760377))

(declare-fun m!760379 () Bool)

(assert (=> mapNonEmpty!23401 m!760379))

(declare-fun m!760381 () Bool)

(assert (=> start!70498 m!760381))

(declare-fun m!760383 () Bool)

(assert (=> start!70498 m!760383))

(declare-fun m!760385 () Bool)

(assert (=> start!70498 m!760385))

(declare-fun m!760387 () Bool)

(assert (=> b!818899 m!760387))

(declare-fun m!760389 () Bool)

(assert (=> b!818899 m!760389))

(declare-fun m!760391 () Bool)

(assert (=> b!818899 m!760391))

(check-sat (not b!818899) (not mapNonEmpty!23401) (not start!70498) (not b_next!12825) tp_is_empty!14535 (not b!818897) b_and!21655 (not b!818903) (not b!818896) (not b!818895))
(check-sat b_and!21655 (not b_next!12825))
