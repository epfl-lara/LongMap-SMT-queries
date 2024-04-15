; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70500 () Bool)

(assert start!70500)

(declare-fun b_free!12847 () Bool)

(declare-fun b_next!12847 () Bool)

(assert (=> start!70500 (= b_free!12847 (not b_next!12847))))

(declare-fun tp!45274 () Bool)

(declare-fun b_and!21651 () Bool)

(assert (=> start!70500 (= tp!45274 b_and!21651)))

(declare-fun b!818946 () Bool)

(declare-fun e!454741 () Bool)

(declare-fun e!454738 () Bool)

(assert (=> b!818946 (= e!454741 (not e!454738))))

(declare-fun res!558925 () Bool)

(assert (=> b!818946 (=> res!558925 e!454738)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!818946 (= res!558925 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!24411 0))(
  ( (V!24412 (val!7326 Int)) )
))
(declare-datatypes ((tuple2!9658 0))(
  ( (tuple2!9659 (_1!4840 (_ BitVec 64)) (_2!4840 V!24411)) )
))
(declare-datatypes ((List!15478 0))(
  ( (Nil!15475) (Cons!15474 (h!16603 tuple2!9658) (t!21798 List!15478)) )
))
(declare-datatypes ((ListLongMap!8471 0))(
  ( (ListLongMap!8472 (toList!4251 List!15478)) )
))
(declare-fun lt!367251 () ListLongMap!8471)

(declare-fun lt!367259 () ListLongMap!8471)

(assert (=> b!818946 (= lt!367251 lt!367259)))

(declare-datatypes ((Unit!27927 0))(
  ( (Unit!27928) )
))
(declare-fun lt!367253 () Unit!27927)

(declare-fun zeroValueBefore!34 () V!24411)

(declare-datatypes ((array!45285 0))(
  ( (array!45286 (arr!21697 (Array (_ BitVec 32) (_ BitVec 64))) (size!22118 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45285)

(declare-fun zeroValueAfter!34 () V!24411)

(declare-fun minValue!754 () V!24411)

(declare-datatypes ((ValueCell!6863 0))(
  ( (ValueCellFull!6863 (v!9749 V!24411)) (EmptyCell!6863) )
))
(declare-datatypes ((array!45287 0))(
  ( (array!45288 (arr!21698 (Array (_ BitVec 32) ValueCell!6863)) (size!22119 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45287)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!399 (array!45285 array!45287 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24411 V!24411 V!24411 V!24411 (_ BitVec 32) Int) Unit!27927)

(assert (=> b!818946 (= lt!367253 (lemmaNoChangeToArrayThenSameMapNoExtras!399 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2306 (array!45285 array!45287 (_ BitVec 32) (_ BitVec 32) V!24411 V!24411 (_ BitVec 32) Int) ListLongMap!8471)

(assert (=> b!818946 (= lt!367259 (getCurrentListMapNoExtraKeys!2306 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818946 (= lt!367251 (getCurrentListMapNoExtraKeys!2306 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!367258 () ListLongMap!8471)

(declare-fun b!818947 () Bool)

(declare-fun e!454742 () Bool)

(declare-fun +!1872 (ListLongMap!8471 tuple2!9658) ListLongMap!8471)

(assert (=> b!818947 (= e!454742 (= lt!367258 (+!1872 lt!367259 (tuple2!9659 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!818948 () Bool)

(declare-fun e!454736 () Bool)

(declare-fun tp_is_empty!14557 () Bool)

(assert (=> b!818948 (= e!454736 tp_is_empty!14557)))

(declare-fun b!818949 () Bool)

(assert (=> b!818949 (= e!454738 true)))

(declare-fun lt!367254 () tuple2!9658)

(declare-fun lt!367256 () tuple2!9658)

(declare-fun lt!367252 () ListLongMap!8471)

(assert (=> b!818949 (= lt!367252 (+!1872 (+!1872 lt!367259 lt!367256) lt!367254))))

(declare-fun lt!367257 () ListLongMap!8471)

(assert (=> b!818949 (= (+!1872 lt!367251 lt!367254) (+!1872 lt!367257 lt!367254))))

(declare-fun lt!367250 () Unit!27927)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!187 (ListLongMap!8471 (_ BitVec 64) V!24411 V!24411) Unit!27927)

(assert (=> b!818949 (= lt!367250 (addSameAsAddTwiceSameKeyDiffValues!187 lt!367251 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!818949 (= lt!367254 (tuple2!9659 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!818949 e!454742))

(declare-fun res!558923 () Bool)

(assert (=> b!818949 (=> (not res!558923) (not e!454742))))

(declare-fun lt!367255 () ListLongMap!8471)

(assert (=> b!818949 (= res!558923 (= lt!367255 lt!367257))))

(assert (=> b!818949 (= lt!367257 (+!1872 lt!367251 lt!367256))))

(assert (=> b!818949 (= lt!367256 (tuple2!9659 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2400 (array!45285 array!45287 (_ BitVec 32) (_ BitVec 32) V!24411 V!24411 (_ BitVec 32) Int) ListLongMap!8471)

(assert (=> b!818949 (= lt!367258 (getCurrentListMap!2400 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818949 (= lt!367255 (getCurrentListMap!2400 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818950 () Bool)

(declare-fun e!454737 () Bool)

(declare-fun mapRes!23434 () Bool)

(assert (=> b!818950 (= e!454737 (and e!454736 mapRes!23434))))

(declare-fun condMapEmpty!23434 () Bool)

(declare-fun mapDefault!23434 () ValueCell!6863)

(assert (=> b!818950 (= condMapEmpty!23434 (= (arr!21698 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6863)) mapDefault!23434)))))

(declare-fun b!818951 () Bool)

(declare-fun res!558924 () Bool)

(assert (=> b!818951 (=> (not res!558924) (not e!454741))))

(declare-datatypes ((List!15479 0))(
  ( (Nil!15476) (Cons!15475 (h!16604 (_ BitVec 64)) (t!21799 List!15479)) )
))
(declare-fun arrayNoDuplicates!0 (array!45285 (_ BitVec 32) List!15479) Bool)

(assert (=> b!818951 (= res!558924 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15476))))

(declare-fun mapNonEmpty!23434 () Bool)

(declare-fun tp!45273 () Bool)

(declare-fun e!454739 () Bool)

(assert (=> mapNonEmpty!23434 (= mapRes!23434 (and tp!45273 e!454739))))

(declare-fun mapRest!23434 () (Array (_ BitVec 32) ValueCell!6863))

(declare-fun mapValue!23434 () ValueCell!6863)

(declare-fun mapKey!23434 () (_ BitVec 32))

(assert (=> mapNonEmpty!23434 (= (arr!21698 _values!788) (store mapRest!23434 mapKey!23434 mapValue!23434))))

(declare-fun b!818952 () Bool)

(declare-fun res!558926 () Bool)

(assert (=> b!818952 (=> (not res!558926) (not e!454741))))

(assert (=> b!818952 (= res!558926 (and (= (size!22119 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22118 _keys!976) (size!22119 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!818953 () Bool)

(assert (=> b!818953 (= e!454739 tp_is_empty!14557)))

(declare-fun mapIsEmpty!23434 () Bool)

(assert (=> mapIsEmpty!23434 mapRes!23434))

(declare-fun res!558922 () Bool)

(assert (=> start!70500 (=> (not res!558922) (not e!454741))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70500 (= res!558922 (validMask!0 mask!1312))))

(assert (=> start!70500 e!454741))

(assert (=> start!70500 tp_is_empty!14557))

(declare-fun array_inv!17409 (array!45285) Bool)

(assert (=> start!70500 (array_inv!17409 _keys!976)))

(assert (=> start!70500 true))

(declare-fun array_inv!17410 (array!45287) Bool)

(assert (=> start!70500 (and (array_inv!17410 _values!788) e!454737)))

(assert (=> start!70500 tp!45274))

(declare-fun b!818954 () Bool)

(declare-fun res!558921 () Bool)

(assert (=> b!818954 (=> (not res!558921) (not e!454741))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45285 (_ BitVec 32)) Bool)

(assert (=> b!818954 (= res!558921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!70500 res!558922) b!818952))

(assert (= (and b!818952 res!558926) b!818954))

(assert (= (and b!818954 res!558921) b!818951))

(assert (= (and b!818951 res!558924) b!818946))

(assert (= (and b!818946 (not res!558925)) b!818949))

(assert (= (and b!818949 res!558923) b!818947))

(assert (= (and b!818950 condMapEmpty!23434) mapIsEmpty!23434))

(assert (= (and b!818950 (not condMapEmpty!23434)) mapNonEmpty!23434))

(get-info :version)

(assert (= (and mapNonEmpty!23434 ((_ is ValueCellFull!6863) mapValue!23434)) b!818953))

(assert (= (and b!818950 ((_ is ValueCellFull!6863) mapDefault!23434)) b!818948))

(assert (= start!70500 b!818950))

(declare-fun m!760001 () Bool)

(assert (=> b!818949 m!760001))

(declare-fun m!760003 () Bool)

(assert (=> b!818949 m!760003))

(declare-fun m!760005 () Bool)

(assert (=> b!818949 m!760005))

(declare-fun m!760007 () Bool)

(assert (=> b!818949 m!760007))

(declare-fun m!760009 () Bool)

(assert (=> b!818949 m!760009))

(assert (=> b!818949 m!760001))

(declare-fun m!760011 () Bool)

(assert (=> b!818949 m!760011))

(declare-fun m!760013 () Bool)

(assert (=> b!818949 m!760013))

(declare-fun m!760015 () Bool)

(assert (=> b!818949 m!760015))

(declare-fun m!760017 () Bool)

(assert (=> b!818954 m!760017))

(declare-fun m!760019 () Bool)

(assert (=> start!70500 m!760019))

(declare-fun m!760021 () Bool)

(assert (=> start!70500 m!760021))

(declare-fun m!760023 () Bool)

(assert (=> start!70500 m!760023))

(declare-fun m!760025 () Bool)

(assert (=> b!818947 m!760025))

(declare-fun m!760027 () Bool)

(assert (=> b!818951 m!760027))

(declare-fun m!760029 () Bool)

(assert (=> mapNonEmpty!23434 m!760029))

(declare-fun m!760031 () Bool)

(assert (=> b!818946 m!760031))

(declare-fun m!760033 () Bool)

(assert (=> b!818946 m!760033))

(declare-fun m!760035 () Bool)

(assert (=> b!818946 m!760035))

(check-sat (not b!818946) (not b!818949) (not b_next!12847) tp_is_empty!14557 (not mapNonEmpty!23434) (not b!818954) (not b!818951) (not b!818947) b_and!21651 (not start!70500))
(check-sat b_and!21651 (not b_next!12847))
