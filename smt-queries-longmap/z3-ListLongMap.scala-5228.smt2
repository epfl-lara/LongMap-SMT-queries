; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70412 () Bool)

(assert start!70412)

(declare-fun b_free!12775 () Bool)

(declare-fun b_next!12775 () Bool)

(assert (=> start!70412 (= b_free!12775 (not b_next!12775))))

(declare-fun tp!45055 () Bool)

(declare-fun b_and!21569 () Bool)

(assert (=> start!70412 (= tp!45055 b_and!21569)))

(declare-fun mapNonEmpty!23323 () Bool)

(declare-fun mapRes!23323 () Bool)

(declare-fun tp!45054 () Bool)

(declare-fun e!453933 () Bool)

(assert (=> mapNonEmpty!23323 (= mapRes!23323 (and tp!45054 e!453933))))

(declare-datatypes ((V!24315 0))(
  ( (V!24316 (val!7290 Int)) )
))
(declare-datatypes ((ValueCell!6827 0))(
  ( (ValueCellFull!6827 (v!9713 V!24315)) (EmptyCell!6827) )
))
(declare-fun mapValue!23323 () ValueCell!6827)

(declare-datatypes ((array!45147 0))(
  ( (array!45148 (arr!21629 (Array (_ BitVec 32) ValueCell!6827)) (size!22050 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45147)

(declare-fun mapRest!23323 () (Array (_ BitVec 32) ValueCell!6827))

(declare-fun mapKey!23323 () (_ BitVec 32))

(assert (=> mapNonEmpty!23323 (= (arr!21629 _values!788) (store mapRest!23323 mapKey!23323 mapValue!23323))))

(declare-fun b!817869 () Bool)

(declare-fun e!453934 () Bool)

(declare-fun e!453929 () Bool)

(assert (=> b!817869 (= e!453934 (and e!453929 mapRes!23323))))

(declare-fun condMapEmpty!23323 () Bool)

(declare-fun mapDefault!23323 () ValueCell!6827)

(assert (=> b!817869 (= condMapEmpty!23323 (= (arr!21629 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6827)) mapDefault!23323)))))

(declare-fun b!817870 () Bool)

(declare-fun res!558262 () Bool)

(declare-fun e!453931 () Bool)

(assert (=> b!817870 (=> (not res!558262) (not e!453931))))

(declare-datatypes ((array!45149 0))(
  ( (array!45150 (arr!21630 (Array (_ BitVec 32) (_ BitVec 64))) (size!22051 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45149)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45149 (_ BitVec 32)) Bool)

(assert (=> b!817870 (= res!558262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!558259 () Bool)

(assert (=> start!70412 (=> (not res!558259) (not e!453931))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70412 (= res!558259 (validMask!0 mask!1312))))

(assert (=> start!70412 e!453931))

(declare-fun tp_is_empty!14485 () Bool)

(assert (=> start!70412 tp_is_empty!14485))

(declare-fun array_inv!17365 (array!45149) Bool)

(assert (=> start!70412 (array_inv!17365 _keys!976)))

(assert (=> start!70412 true))

(declare-fun array_inv!17366 (array!45147) Bool)

(assert (=> start!70412 (and (array_inv!17366 _values!788) e!453934)))

(assert (=> start!70412 tp!45055))

(declare-fun b!817871 () Bool)

(declare-fun res!558260 () Bool)

(assert (=> b!817871 (=> (not res!558260) (not e!453931))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!817871 (= res!558260 (and (= (size!22050 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22051 _keys!976) (size!22050 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!817872 () Bool)

(assert (=> b!817872 (= e!453933 tp_is_empty!14485)))

(declare-fun b!817873 () Bool)

(declare-fun res!558258 () Bool)

(assert (=> b!817873 (=> (not res!558258) (not e!453931))))

(declare-datatypes ((List!15426 0))(
  ( (Nil!15423) (Cons!15422 (h!16551 (_ BitVec 64)) (t!21744 List!15426)) )
))
(declare-fun arrayNoDuplicates!0 (array!45149 (_ BitVec 32) List!15426) Bool)

(assert (=> b!817873 (= res!558258 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15423))))

(declare-fun mapIsEmpty!23323 () Bool)

(assert (=> mapIsEmpty!23323 mapRes!23323))

(declare-fun b!817874 () Bool)

(declare-fun e!453932 () Bool)

(assert (=> b!817874 (= e!453932 true)))

(declare-fun zeroValueBefore!34 () V!24315)

(declare-datatypes ((tuple2!9602 0))(
  ( (tuple2!9603 (_1!4812 (_ BitVec 64)) (_2!4812 V!24315)) )
))
(declare-datatypes ((List!15427 0))(
  ( (Nil!15424) (Cons!15423 (h!16552 tuple2!9602) (t!21745 List!15427)) )
))
(declare-datatypes ((ListLongMap!8415 0))(
  ( (ListLongMap!8416 (toList!4223 List!15427)) )
))
(declare-fun lt!366324 () ListLongMap!8415)

(declare-fun minValue!754 () V!24315)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2376 (array!45149 array!45147 (_ BitVec 32) (_ BitVec 32) V!24315 V!24315 (_ BitVec 32) Int) ListLongMap!8415)

(assert (=> b!817874 (= lt!366324 (getCurrentListMap!2376 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!817875 () Bool)

(assert (=> b!817875 (= e!453931 (not e!453932))))

(declare-fun res!558261 () Bool)

(assert (=> b!817875 (=> res!558261 e!453932)))

(assert (=> b!817875 (= res!558261 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!366322 () ListLongMap!8415)

(declare-fun lt!366325 () ListLongMap!8415)

(assert (=> b!817875 (= lt!366322 lt!366325)))

(declare-fun zeroValueAfter!34 () V!24315)

(declare-datatypes ((Unit!27870 0))(
  ( (Unit!27871) )
))
(declare-fun lt!366323 () Unit!27870)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!374 (array!45149 array!45147 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24315 V!24315 V!24315 V!24315 (_ BitVec 32) Int) Unit!27870)

(assert (=> b!817875 (= lt!366323 (lemmaNoChangeToArrayThenSameMapNoExtras!374 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2281 (array!45149 array!45147 (_ BitVec 32) (_ BitVec 32) V!24315 V!24315 (_ BitVec 32) Int) ListLongMap!8415)

(assert (=> b!817875 (= lt!366325 (getCurrentListMapNoExtraKeys!2281 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817875 (= lt!366322 (getCurrentListMapNoExtraKeys!2281 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!817876 () Bool)

(assert (=> b!817876 (= e!453929 tp_is_empty!14485)))

(assert (= (and start!70412 res!558259) b!817871))

(assert (= (and b!817871 res!558260) b!817870))

(assert (= (and b!817870 res!558262) b!817873))

(assert (= (and b!817873 res!558258) b!817875))

(assert (= (and b!817875 (not res!558261)) b!817874))

(assert (= (and b!817869 condMapEmpty!23323) mapIsEmpty!23323))

(assert (= (and b!817869 (not condMapEmpty!23323)) mapNonEmpty!23323))

(get-info :version)

(assert (= (and mapNonEmpty!23323 ((_ is ValueCellFull!6827) mapValue!23323)) b!817872))

(assert (= (and b!817869 ((_ is ValueCellFull!6827) mapDefault!23323)) b!817876))

(assert (= start!70412 b!817869))

(declare-fun m!758833 () Bool)

(assert (=> b!817874 m!758833))

(declare-fun m!758835 () Bool)

(assert (=> b!817875 m!758835))

(declare-fun m!758837 () Bool)

(assert (=> b!817875 m!758837))

(declare-fun m!758839 () Bool)

(assert (=> b!817875 m!758839))

(declare-fun m!758841 () Bool)

(assert (=> mapNonEmpty!23323 m!758841))

(declare-fun m!758843 () Bool)

(assert (=> start!70412 m!758843))

(declare-fun m!758845 () Bool)

(assert (=> start!70412 m!758845))

(declare-fun m!758847 () Bool)

(assert (=> start!70412 m!758847))

(declare-fun m!758849 () Bool)

(assert (=> b!817873 m!758849))

(declare-fun m!758851 () Bool)

(assert (=> b!817870 m!758851))

(check-sat tp_is_empty!14485 (not b!817874) (not start!70412) (not b!817875) (not b!817870) b_and!21569 (not mapNonEmpty!23323) (not b_next!12775) (not b!817873))
(check-sat b_and!21569 (not b_next!12775))
