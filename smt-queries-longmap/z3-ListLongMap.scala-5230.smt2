; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70424 () Bool)

(assert start!70424)

(declare-fun b_free!12787 () Bool)

(declare-fun b_next!12787 () Bool)

(assert (=> start!70424 (= b_free!12787 (not b_next!12787))))

(declare-fun tp!45090 () Bool)

(declare-fun b_and!21581 () Bool)

(assert (=> start!70424 (= tp!45090 b_and!21581)))

(declare-fun b!818013 () Bool)

(declare-fun e!454040 () Bool)

(declare-fun e!454041 () Bool)

(declare-fun mapRes!23341 () Bool)

(assert (=> b!818013 (= e!454040 (and e!454041 mapRes!23341))))

(declare-fun condMapEmpty!23341 () Bool)

(declare-datatypes ((V!24331 0))(
  ( (V!24332 (val!7296 Int)) )
))
(declare-datatypes ((ValueCell!6833 0))(
  ( (ValueCellFull!6833 (v!9719 V!24331)) (EmptyCell!6833) )
))
(declare-datatypes ((array!45169 0))(
  ( (array!45170 (arr!21640 (Array (_ BitVec 32) ValueCell!6833)) (size!22061 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45169)

(declare-fun mapDefault!23341 () ValueCell!6833)

(assert (=> b!818013 (= condMapEmpty!23341 (= (arr!21640 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6833)) mapDefault!23341)))))

(declare-fun b!818014 () Bool)

(declare-fun res!558352 () Bool)

(declare-fun e!454037 () Bool)

(assert (=> b!818014 (=> (not res!558352) (not e!454037))))

(declare-datatypes ((array!45171 0))(
  ( (array!45172 (arr!21641 (Array (_ BitVec 32) (_ BitVec 64))) (size!22062 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45171)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45171 (_ BitVec 32)) Bool)

(assert (=> b!818014 (= res!558352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!558348 () Bool)

(assert (=> start!70424 (=> (not res!558348) (not e!454037))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70424 (= res!558348 (validMask!0 mask!1312))))

(assert (=> start!70424 e!454037))

(declare-fun tp_is_empty!14497 () Bool)

(assert (=> start!70424 tp_is_empty!14497))

(declare-fun array_inv!17375 (array!45171) Bool)

(assert (=> start!70424 (array_inv!17375 _keys!976)))

(assert (=> start!70424 true))

(declare-fun array_inv!17376 (array!45169) Bool)

(assert (=> start!70424 (and (array_inv!17376 _values!788) e!454040)))

(assert (=> start!70424 tp!45090))

(declare-fun b!818015 () Bool)

(declare-fun e!454042 () Bool)

(assert (=> b!818015 (= e!454042 true)))

(declare-fun zeroValueBefore!34 () V!24331)

(declare-datatypes ((tuple2!9610 0))(
  ( (tuple2!9611 (_1!4816 (_ BitVec 64)) (_2!4816 V!24331)) )
))
(declare-datatypes ((List!15434 0))(
  ( (Nil!15431) (Cons!15430 (h!16559 tuple2!9610) (t!21752 List!15434)) )
))
(declare-datatypes ((ListLongMap!8423 0))(
  ( (ListLongMap!8424 (toList!4227 List!15434)) )
))
(declare-fun lt!366395 () ListLongMap!8423)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!24331)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2380 (array!45171 array!45169 (_ BitVec 32) (_ BitVec 32) V!24331 V!24331 (_ BitVec 32) Int) ListLongMap!8423)

(assert (=> b!818015 (= lt!366395 (getCurrentListMap!2380 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818016 () Bool)

(declare-fun res!558350 () Bool)

(assert (=> b!818016 (=> (not res!558350) (not e!454037))))

(declare-datatypes ((List!15435 0))(
  ( (Nil!15432) (Cons!15431 (h!16560 (_ BitVec 64)) (t!21753 List!15435)) )
))
(declare-fun arrayNoDuplicates!0 (array!45171 (_ BitVec 32) List!15435) Bool)

(assert (=> b!818016 (= res!558350 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15432))))

(declare-fun b!818017 () Bool)

(assert (=> b!818017 (= e!454041 tp_is_empty!14497)))

(declare-fun b!818018 () Bool)

(declare-fun e!454038 () Bool)

(assert (=> b!818018 (= e!454038 tp_is_empty!14497)))

(declare-fun mapIsEmpty!23341 () Bool)

(assert (=> mapIsEmpty!23341 mapRes!23341))

(declare-fun b!818019 () Bool)

(declare-fun res!558351 () Bool)

(assert (=> b!818019 (=> (not res!558351) (not e!454037))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!818019 (= res!558351 (and (= (size!22061 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22062 _keys!976) (size!22061 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!818020 () Bool)

(assert (=> b!818020 (= e!454037 (not e!454042))))

(declare-fun res!558349 () Bool)

(assert (=> b!818020 (=> res!558349 e!454042)))

(assert (=> b!818020 (= res!558349 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!366394 () ListLongMap!8423)

(declare-fun lt!366396 () ListLongMap!8423)

(assert (=> b!818020 (= lt!366394 lt!366396)))

(declare-fun zeroValueAfter!34 () V!24331)

(declare-datatypes ((Unit!27878 0))(
  ( (Unit!27879) )
))
(declare-fun lt!366397 () Unit!27878)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!378 (array!45171 array!45169 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24331 V!24331 V!24331 V!24331 (_ BitVec 32) Int) Unit!27878)

(assert (=> b!818020 (= lt!366397 (lemmaNoChangeToArrayThenSameMapNoExtras!378 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2285 (array!45171 array!45169 (_ BitVec 32) (_ BitVec 32) V!24331 V!24331 (_ BitVec 32) Int) ListLongMap!8423)

(assert (=> b!818020 (= lt!366396 (getCurrentListMapNoExtraKeys!2285 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818020 (= lt!366394 (getCurrentListMapNoExtraKeys!2285 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23341 () Bool)

(declare-fun tp!45091 () Bool)

(assert (=> mapNonEmpty!23341 (= mapRes!23341 (and tp!45091 e!454038))))

(declare-fun mapValue!23341 () ValueCell!6833)

(declare-fun mapRest!23341 () (Array (_ BitVec 32) ValueCell!6833))

(declare-fun mapKey!23341 () (_ BitVec 32))

(assert (=> mapNonEmpty!23341 (= (arr!21640 _values!788) (store mapRest!23341 mapKey!23341 mapValue!23341))))

(assert (= (and start!70424 res!558348) b!818019))

(assert (= (and b!818019 res!558351) b!818014))

(assert (= (and b!818014 res!558352) b!818016))

(assert (= (and b!818016 res!558350) b!818020))

(assert (= (and b!818020 (not res!558349)) b!818015))

(assert (= (and b!818013 condMapEmpty!23341) mapIsEmpty!23341))

(assert (= (and b!818013 (not condMapEmpty!23341)) mapNonEmpty!23341))

(get-info :version)

(assert (= (and mapNonEmpty!23341 ((_ is ValueCellFull!6833) mapValue!23341)) b!818018))

(assert (= (and b!818013 ((_ is ValueCellFull!6833) mapDefault!23341)) b!818017))

(assert (= start!70424 b!818013))

(declare-fun m!758953 () Bool)

(assert (=> start!70424 m!758953))

(declare-fun m!758955 () Bool)

(assert (=> start!70424 m!758955))

(declare-fun m!758957 () Bool)

(assert (=> start!70424 m!758957))

(declare-fun m!758959 () Bool)

(assert (=> b!818015 m!758959))

(declare-fun m!758961 () Bool)

(assert (=> mapNonEmpty!23341 m!758961))

(declare-fun m!758963 () Bool)

(assert (=> b!818016 m!758963))

(declare-fun m!758965 () Bool)

(assert (=> b!818020 m!758965))

(declare-fun m!758967 () Bool)

(assert (=> b!818020 m!758967))

(declare-fun m!758969 () Bool)

(assert (=> b!818020 m!758969))

(declare-fun m!758971 () Bool)

(assert (=> b!818014 m!758971))

(check-sat b_and!21581 (not start!70424) tp_is_empty!14497 (not b!818016) (not b_next!12787) (not mapNonEmpty!23341) (not b!818014) (not b!818020) (not b!818015))
(check-sat b_and!21581 (not b_next!12787))
