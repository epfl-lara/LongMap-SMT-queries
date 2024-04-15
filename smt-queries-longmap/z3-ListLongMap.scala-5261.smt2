; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70680 () Bool)

(assert start!70680)

(declare-fun b_free!12973 () Bool)

(declare-fun b_next!12973 () Bool)

(assert (=> start!70680 (= b_free!12973 (not b_next!12973))))

(declare-fun tp!45661 () Bool)

(declare-fun b_and!21809 () Bool)

(assert (=> start!70680 (= tp!45661 b_and!21809)))

(declare-fun mapNonEmpty!23632 () Bool)

(declare-fun mapRes!23632 () Bool)

(declare-fun tp!45660 () Bool)

(declare-fun e!456194 () Bool)

(assert (=> mapNonEmpty!23632 (= mapRes!23632 (and tp!45660 e!456194))))

(declare-datatypes ((V!24579 0))(
  ( (V!24580 (val!7389 Int)) )
))
(declare-datatypes ((ValueCell!6926 0))(
  ( (ValueCellFull!6926 (v!9814 V!24579)) (EmptyCell!6926) )
))
(declare-fun mapValue!23632 () ValueCell!6926)

(declare-fun mapKey!23632 () (_ BitVec 32))

(declare-datatypes ((array!45533 0))(
  ( (array!45534 (arr!21818 (Array (_ BitVec 32) ValueCell!6926)) (size!22239 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45533)

(declare-fun mapRest!23632 () (Array (_ BitVec 32) ValueCell!6926))

(assert (=> mapNonEmpty!23632 (= (arr!21818 _values!788) (store mapRest!23632 mapKey!23632 mapValue!23632))))

(declare-fun b!820947 () Bool)

(declare-fun e!456189 () Bool)

(declare-fun e!456192 () Bool)

(assert (=> b!820947 (= e!456189 (and e!456192 mapRes!23632))))

(declare-fun condMapEmpty!23632 () Bool)

(declare-fun mapDefault!23632 () ValueCell!6926)

(assert (=> b!820947 (= condMapEmpty!23632 (= (arr!21818 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6926)) mapDefault!23632)))))

(declare-fun b!820948 () Bool)

(declare-fun res!560101 () Bool)

(declare-fun e!456190 () Bool)

(assert (=> b!820948 (=> (not res!560101) (not e!456190))))

(declare-datatypes ((array!45535 0))(
  ( (array!45536 (arr!21819 (Array (_ BitVec 32) (_ BitVec 64))) (size!22240 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45535)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!820948 (= res!560101 (and (= (size!22239 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22240 _keys!976) (size!22239 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!560100 () Bool)

(assert (=> start!70680 (=> (not res!560100) (not e!456190))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70680 (= res!560100 (validMask!0 mask!1312))))

(assert (=> start!70680 e!456190))

(declare-fun tp_is_empty!14683 () Bool)

(assert (=> start!70680 tp_is_empty!14683))

(declare-fun array_inv!17505 (array!45535) Bool)

(assert (=> start!70680 (array_inv!17505 _keys!976)))

(assert (=> start!70680 true))

(declare-fun array_inv!17506 (array!45533) Bool)

(assert (=> start!70680 (and (array_inv!17506 _values!788) e!456189)))

(assert (=> start!70680 tp!45661))

(declare-fun b!820949 () Bool)

(declare-fun res!560097 () Bool)

(assert (=> b!820949 (=> (not res!560097) (not e!456190))))

(declare-datatypes ((List!15566 0))(
  ( (Nil!15563) (Cons!15562 (h!16691 (_ BitVec 64)) (t!21892 List!15566)) )
))
(declare-fun arrayNoDuplicates!0 (array!45535 (_ BitVec 32) List!15566) Bool)

(assert (=> b!820949 (= res!560097 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15563))))

(declare-fun b!820950 () Bool)

(declare-fun e!456193 () Bool)

(assert (=> b!820950 (= e!456190 (not e!456193))))

(declare-fun res!560098 () Bool)

(assert (=> b!820950 (=> res!560098 e!456193)))

(assert (=> b!820950 (= res!560098 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9756 0))(
  ( (tuple2!9757 (_1!4889 (_ BitVec 64)) (_2!4889 V!24579)) )
))
(declare-datatypes ((List!15567 0))(
  ( (Nil!15564) (Cons!15563 (h!16692 tuple2!9756) (t!21893 List!15567)) )
))
(declare-datatypes ((ListLongMap!8569 0))(
  ( (ListLongMap!8570 (toList!4300 List!15567)) )
))
(declare-fun lt!368857 () ListLongMap!8569)

(declare-fun lt!368858 () ListLongMap!8569)

(assert (=> b!820950 (= lt!368857 lt!368858)))

(declare-fun zeroValueBefore!34 () V!24579)

(declare-fun zeroValueAfter!34 () V!24579)

(declare-fun minValue!754 () V!24579)

(declare-datatypes ((Unit!28027 0))(
  ( (Unit!28028) )
))
(declare-fun lt!368855 () Unit!28027)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!444 (array!45535 array!45533 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24579 V!24579 V!24579 V!24579 (_ BitVec 32) Int) Unit!28027)

(assert (=> b!820950 (= lt!368855 (lemmaNoChangeToArrayThenSameMapNoExtras!444 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2351 (array!45535 array!45533 (_ BitVec 32) (_ BitVec 32) V!24579 V!24579 (_ BitVec 32) Int) ListLongMap!8569)

(assert (=> b!820950 (= lt!368858 (getCurrentListMapNoExtraKeys!2351 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820950 (= lt!368857 (getCurrentListMapNoExtraKeys!2351 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23632 () Bool)

(assert (=> mapIsEmpty!23632 mapRes!23632))

(declare-fun b!820951 () Bool)

(assert (=> b!820951 (= e!456193 true)))

(declare-fun lt!368856 () ListLongMap!8569)

(declare-fun getCurrentListMap!2428 (array!45535 array!45533 (_ BitVec 32) (_ BitVec 32) V!24579 V!24579 (_ BitVec 32) Int) ListLongMap!8569)

(assert (=> b!820951 (= lt!368856 (getCurrentListMap!2428 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820952 () Bool)

(declare-fun res!560099 () Bool)

(assert (=> b!820952 (=> (not res!560099) (not e!456190))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45535 (_ BitVec 32)) Bool)

(assert (=> b!820952 (= res!560099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!820953 () Bool)

(assert (=> b!820953 (= e!456194 tp_is_empty!14683)))

(declare-fun b!820954 () Bool)

(assert (=> b!820954 (= e!456192 tp_is_empty!14683)))

(assert (= (and start!70680 res!560100) b!820948))

(assert (= (and b!820948 res!560101) b!820952))

(assert (= (and b!820952 res!560099) b!820949))

(assert (= (and b!820949 res!560097) b!820950))

(assert (= (and b!820950 (not res!560098)) b!820951))

(assert (= (and b!820947 condMapEmpty!23632) mapIsEmpty!23632))

(assert (= (and b!820947 (not condMapEmpty!23632)) mapNonEmpty!23632))

(get-info :version)

(assert (= (and mapNonEmpty!23632 ((_ is ValueCellFull!6926) mapValue!23632)) b!820953))

(assert (= (and b!820947 ((_ is ValueCellFull!6926) mapDefault!23632)) b!820954))

(assert (= start!70680 b!820947))

(declare-fun m!762277 () Bool)

(assert (=> b!820952 m!762277))

(declare-fun m!762279 () Bool)

(assert (=> start!70680 m!762279))

(declare-fun m!762281 () Bool)

(assert (=> start!70680 m!762281))

(declare-fun m!762283 () Bool)

(assert (=> start!70680 m!762283))

(declare-fun m!762285 () Bool)

(assert (=> b!820951 m!762285))

(declare-fun m!762287 () Bool)

(assert (=> mapNonEmpty!23632 m!762287))

(declare-fun m!762289 () Bool)

(assert (=> b!820950 m!762289))

(declare-fun m!762291 () Bool)

(assert (=> b!820950 m!762291))

(declare-fun m!762293 () Bool)

(assert (=> b!820950 m!762293))

(declare-fun m!762295 () Bool)

(assert (=> b!820949 m!762295))

(check-sat (not b!820949) b_and!21809 (not mapNonEmpty!23632) (not b_next!12973) tp_is_empty!14683 (not start!70680) (not b!820951) (not b!820950) (not b!820952))
(check-sat b_and!21809 (not b_next!12973))
