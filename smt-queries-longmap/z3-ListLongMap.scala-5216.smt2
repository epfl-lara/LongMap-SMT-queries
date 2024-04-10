; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70348 () Bool)

(assert start!70348)

(declare-fun b_free!12705 () Bool)

(declare-fun b_next!12705 () Bool)

(assert (=> start!70348 (= b_free!12705 (not b_next!12705))))

(declare-fun tp!44841 () Bool)

(declare-fun b_and!21517 () Bool)

(assert (=> start!70348 (= tp!44841 b_and!21517)))

(declare-fun b!817257 () Bool)

(declare-fun res!557877 () Bool)

(declare-fun e!453465 () Bool)

(assert (=> b!817257 (=> (not res!557877) (not e!453465))))

(declare-datatypes ((array!45030 0))(
  ( (array!45031 (arr!21571 (Array (_ BitVec 32) (_ BitVec 64))) (size!21992 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45030)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45030 (_ BitVec 32)) Bool)

(assert (=> b!817257 (= res!557877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!23215 () Bool)

(declare-fun mapRes!23215 () Bool)

(assert (=> mapIsEmpty!23215 mapRes!23215))

(declare-fun b!817258 () Bool)

(declare-fun e!453461 () Bool)

(declare-fun tp_is_empty!14415 () Bool)

(assert (=> b!817258 (= e!453461 tp_is_empty!14415)))

(declare-fun b!817259 () Bool)

(declare-fun e!453462 () Bool)

(assert (=> b!817259 (= e!453462 (and e!453461 mapRes!23215))))

(declare-fun condMapEmpty!23215 () Bool)

(declare-datatypes ((V!24221 0))(
  ( (V!24222 (val!7255 Int)) )
))
(declare-datatypes ((ValueCell!6792 0))(
  ( (ValueCellFull!6792 (v!9684 V!24221)) (EmptyCell!6792) )
))
(declare-datatypes ((array!45032 0))(
  ( (array!45033 (arr!21572 (Array (_ BitVec 32) ValueCell!6792)) (size!21993 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45032)

(declare-fun mapDefault!23215 () ValueCell!6792)

(assert (=> b!817259 (= condMapEmpty!23215 (= (arr!21572 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6792)) mapDefault!23215)))))

(declare-fun b!817260 () Bool)

(assert (=> b!817260 (= e!453465 (not true))))

(declare-datatypes ((tuple2!9534 0))(
  ( (tuple2!9535 (_1!4778 (_ BitVec 64)) (_2!4778 V!24221)) )
))
(declare-datatypes ((List!15363 0))(
  ( (Nil!15360) (Cons!15359 (h!16488 tuple2!9534) (t!21688 List!15363)) )
))
(declare-datatypes ((ListLongMap!8357 0))(
  ( (ListLongMap!8358 (toList!4194 List!15363)) )
))
(declare-fun lt!366172 () ListLongMap!8357)

(declare-fun lt!366174 () ListLongMap!8357)

(assert (=> b!817260 (= lt!366172 lt!366174)))

(declare-fun zeroValueBefore!34 () V!24221)

(declare-datatypes ((Unit!27872 0))(
  ( (Unit!27873) )
))
(declare-fun lt!366173 () Unit!27872)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24221)

(declare-fun minValue!754 () V!24221)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!345 (array!45030 array!45032 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24221 V!24221 V!24221 V!24221 (_ BitVec 32) Int) Unit!27872)

(assert (=> b!817260 (= lt!366173 (lemmaNoChangeToArrayThenSameMapNoExtras!345 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2235 (array!45030 array!45032 (_ BitVec 32) (_ BitVec 32) V!24221 V!24221 (_ BitVec 32) Int) ListLongMap!8357)

(assert (=> b!817260 (= lt!366174 (getCurrentListMapNoExtraKeys!2235 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817260 (= lt!366172 (getCurrentListMapNoExtraKeys!2235 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!557876 () Bool)

(assert (=> start!70348 (=> (not res!557876) (not e!453465))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70348 (= res!557876 (validMask!0 mask!1312))))

(assert (=> start!70348 e!453465))

(assert (=> start!70348 tp_is_empty!14415))

(declare-fun array_inv!17259 (array!45030) Bool)

(assert (=> start!70348 (array_inv!17259 _keys!976)))

(assert (=> start!70348 true))

(declare-fun array_inv!17260 (array!45032) Bool)

(assert (=> start!70348 (and (array_inv!17260 _values!788) e!453462)))

(assert (=> start!70348 tp!44841))

(declare-fun b!817261 () Bool)

(declare-fun e!453463 () Bool)

(assert (=> b!817261 (= e!453463 tp_is_empty!14415)))

(declare-fun b!817262 () Bool)

(declare-fun res!557875 () Bool)

(assert (=> b!817262 (=> (not res!557875) (not e!453465))))

(assert (=> b!817262 (= res!557875 (and (= (size!21993 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21992 _keys!976) (size!21993 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!23215 () Bool)

(declare-fun tp!44842 () Bool)

(assert (=> mapNonEmpty!23215 (= mapRes!23215 (and tp!44842 e!453463))))

(declare-fun mapRest!23215 () (Array (_ BitVec 32) ValueCell!6792))

(declare-fun mapKey!23215 () (_ BitVec 32))

(declare-fun mapValue!23215 () ValueCell!6792)

(assert (=> mapNonEmpty!23215 (= (arr!21572 _values!788) (store mapRest!23215 mapKey!23215 mapValue!23215))))

(declare-fun b!817263 () Bool)

(declare-fun res!557878 () Bool)

(assert (=> b!817263 (=> (not res!557878) (not e!453465))))

(declare-datatypes ((List!15364 0))(
  ( (Nil!15361) (Cons!15360 (h!16489 (_ BitVec 64)) (t!21689 List!15364)) )
))
(declare-fun arrayNoDuplicates!0 (array!45030 (_ BitVec 32) List!15364) Bool)

(assert (=> b!817263 (= res!557878 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15361))))

(assert (= (and start!70348 res!557876) b!817262))

(assert (= (and b!817262 res!557875) b!817257))

(assert (= (and b!817257 res!557877) b!817263))

(assert (= (and b!817263 res!557878) b!817260))

(assert (= (and b!817259 condMapEmpty!23215) mapIsEmpty!23215))

(assert (= (and b!817259 (not condMapEmpty!23215)) mapNonEmpty!23215))

(get-info :version)

(assert (= (and mapNonEmpty!23215 ((_ is ValueCellFull!6792) mapValue!23215)) b!817261))

(assert (= (and b!817259 ((_ is ValueCellFull!6792) mapDefault!23215)) b!817258))

(assert (= start!70348 b!817259))

(declare-fun m!758865 () Bool)

(assert (=> b!817260 m!758865))

(declare-fun m!758867 () Bool)

(assert (=> b!817260 m!758867))

(declare-fun m!758869 () Bool)

(assert (=> b!817260 m!758869))

(declare-fun m!758871 () Bool)

(assert (=> start!70348 m!758871))

(declare-fun m!758873 () Bool)

(assert (=> start!70348 m!758873))

(declare-fun m!758875 () Bool)

(assert (=> start!70348 m!758875))

(declare-fun m!758877 () Bool)

(assert (=> mapNonEmpty!23215 m!758877))

(declare-fun m!758879 () Bool)

(assert (=> b!817257 m!758879))

(declare-fun m!758881 () Bool)

(assert (=> b!817263 m!758881))

(check-sat tp_is_empty!14415 (not b_next!12705) b_and!21517 (not b!817257) (not mapNonEmpty!23215) (not start!70348) (not b!817263) (not b!817260))
(check-sat b_and!21517 (not b_next!12705))
