; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70948 () Bool)

(assert start!70948)

(declare-fun b_free!13039 () Bool)

(declare-fun b_next!13039 () Bool)

(assert (=> start!70948 (= b_free!13039 (not b_next!13039))))

(declare-fun tp!45862 () Bool)

(declare-fun b_and!21921 () Bool)

(assert (=> start!70948 (= tp!45862 b_and!21921)))

(declare-fun b!823036 () Bool)

(declare-fun e!457616 () Bool)

(declare-fun e!457615 () Bool)

(assert (=> b!823036 (= e!457616 (not e!457615))))

(declare-fun res!561113 () Bool)

(assert (=> b!823036 (=> res!561113 e!457615)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!823036 (= res!561113 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!24667 0))(
  ( (V!24668 (val!7422 Int)) )
))
(declare-datatypes ((tuple2!9716 0))(
  ( (tuple2!9717 (_1!4869 (_ BitVec 64)) (_2!4869 V!24667)) )
))
(declare-datatypes ((List!15505 0))(
  ( (Nil!15502) (Cons!15501 (h!16636 tuple2!9716) (t!21834 List!15505)) )
))
(declare-datatypes ((ListLongMap!8541 0))(
  ( (ListLongMap!8542 (toList!4286 List!15505)) )
))
(declare-fun lt!370094 () ListLongMap!8541)

(declare-fun lt!370098 () ListLongMap!8541)

(assert (=> b!823036 (= lt!370094 lt!370098)))

(declare-datatypes ((array!45693 0))(
  ( (array!45694 (arr!21892 (Array (_ BitVec 32) (_ BitVec 64))) (size!22312 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45693)

(declare-fun zeroValueAfter!34 () V!24667)

(declare-fun minValue!754 () V!24667)

(declare-datatypes ((ValueCell!6959 0))(
  ( (ValueCellFull!6959 (v!9853 V!24667)) (EmptyCell!6959) )
))
(declare-datatypes ((array!45695 0))(
  ( (array!45696 (arr!21893 (Array (_ BitVec 32) ValueCell!6959)) (size!22313 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45695)

(declare-datatypes ((Unit!28121 0))(
  ( (Unit!28122) )
))
(declare-fun lt!370095 () Unit!28121)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun zeroValueBefore!34 () V!24667)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!461 (array!45693 array!45695 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24667 V!24667 V!24667 V!24667 (_ BitVec 32) Int) Unit!28121)

(assert (=> b!823036 (= lt!370095 (lemmaNoChangeToArrayThenSameMapNoExtras!461 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2373 (array!45693 array!45695 (_ BitVec 32) (_ BitVec 32) V!24667 V!24667 (_ BitVec 32) Int) ListLongMap!8541)

(assert (=> b!823036 (= lt!370098 (getCurrentListMapNoExtraKeys!2373 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823036 (= lt!370094 (getCurrentListMapNoExtraKeys!2373 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823037 () Bool)

(declare-fun res!561114 () Bool)

(assert (=> b!823037 (=> (not res!561114) (not e!457616))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45693 (_ BitVec 32)) Bool)

(assert (=> b!823037 (= res!561114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!823039 () Bool)

(assert (=> b!823039 (= e!457615 true)))

(declare-fun lt!370101 () ListLongMap!8541)

(declare-fun lt!370093 () ListLongMap!8541)

(declare-fun lt!370092 () tuple2!9716)

(declare-fun +!1876 (ListLongMap!8541 tuple2!9716) ListLongMap!8541)

(assert (=> b!823039 (= lt!370101 (+!1876 lt!370093 lt!370092))))

(declare-fun lt!370096 () Unit!28121)

(declare-fun addCommutativeForDiffKeys!434 (ListLongMap!8541 (_ BitVec 64) V!24667 (_ BitVec 64) V!24667) Unit!28121)

(assert (=> b!823039 (= lt!370096 (addCommutativeForDiffKeys!434 lt!370094 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370100 () ListLongMap!8541)

(assert (=> b!823039 (= lt!370100 lt!370101)))

(declare-fun lt!370099 () tuple2!9716)

(assert (=> b!823039 (= lt!370101 (+!1876 (+!1876 lt!370094 lt!370092) lt!370099))))

(assert (=> b!823039 (= lt!370092 (tuple2!9717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370097 () ListLongMap!8541)

(assert (=> b!823039 (= lt!370097 lt!370093)))

(assert (=> b!823039 (= lt!370093 (+!1876 lt!370094 lt!370099))))

(assert (=> b!823039 (= lt!370099 (tuple2!9717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2440 (array!45693 array!45695 (_ BitVec 32) (_ BitVec 32) V!24667 V!24667 (_ BitVec 32) Int) ListLongMap!8541)

(assert (=> b!823039 (= lt!370100 (getCurrentListMap!2440 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823039 (= lt!370097 (getCurrentListMap!2440 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823040 () Bool)

(declare-fun res!561112 () Bool)

(assert (=> b!823040 (=> (not res!561112) (not e!457616))))

(declare-datatypes ((List!15506 0))(
  ( (Nil!15503) (Cons!15502 (h!16637 (_ BitVec 64)) (t!21835 List!15506)) )
))
(declare-fun arrayNoDuplicates!0 (array!45693 (_ BitVec 32) List!15506) Bool)

(assert (=> b!823040 (= res!561112 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15503))))

(declare-fun b!823041 () Bool)

(declare-fun res!561115 () Bool)

(assert (=> b!823041 (=> (not res!561115) (not e!457616))))

(assert (=> b!823041 (= res!561115 (and (= (size!22313 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22312 _keys!976) (size!22313 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!23734 () Bool)

(declare-fun mapRes!23734 () Bool)

(declare-fun tp!45861 () Bool)

(declare-fun e!457614 () Bool)

(assert (=> mapNonEmpty!23734 (= mapRes!23734 (and tp!45861 e!457614))))

(declare-fun mapValue!23734 () ValueCell!6959)

(declare-fun mapKey!23734 () (_ BitVec 32))

(declare-fun mapRest!23734 () (Array (_ BitVec 32) ValueCell!6959))

(assert (=> mapNonEmpty!23734 (= (arr!21893 _values!788) (store mapRest!23734 mapKey!23734 mapValue!23734))))

(declare-fun b!823042 () Bool)

(declare-fun tp_is_empty!14749 () Bool)

(assert (=> b!823042 (= e!457614 tp_is_empty!14749)))

(declare-fun res!561111 () Bool)

(assert (=> start!70948 (=> (not res!561111) (not e!457616))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70948 (= res!561111 (validMask!0 mask!1312))))

(assert (=> start!70948 e!457616))

(assert (=> start!70948 tp_is_empty!14749))

(declare-fun array_inv!17517 (array!45693) Bool)

(assert (=> start!70948 (array_inv!17517 _keys!976)))

(assert (=> start!70948 true))

(declare-fun e!457617 () Bool)

(declare-fun array_inv!17518 (array!45695) Bool)

(assert (=> start!70948 (and (array_inv!17518 _values!788) e!457617)))

(assert (=> start!70948 tp!45862))

(declare-fun b!823038 () Bool)

(declare-fun e!457618 () Bool)

(assert (=> b!823038 (= e!457617 (and e!457618 mapRes!23734))))

(declare-fun condMapEmpty!23734 () Bool)

(declare-fun mapDefault!23734 () ValueCell!6959)

(assert (=> b!823038 (= condMapEmpty!23734 (= (arr!21893 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6959)) mapDefault!23734)))))

(declare-fun b!823043 () Bool)

(assert (=> b!823043 (= e!457618 tp_is_empty!14749)))

(declare-fun mapIsEmpty!23734 () Bool)

(assert (=> mapIsEmpty!23734 mapRes!23734))

(assert (= (and start!70948 res!561111) b!823041))

(assert (= (and b!823041 res!561115) b!823037))

(assert (= (and b!823037 res!561114) b!823040))

(assert (= (and b!823040 res!561112) b!823036))

(assert (= (and b!823036 (not res!561113)) b!823039))

(assert (= (and b!823038 condMapEmpty!23734) mapIsEmpty!23734))

(assert (= (and b!823038 (not condMapEmpty!23734)) mapNonEmpty!23734))

(get-info :version)

(assert (= (and mapNonEmpty!23734 ((_ is ValueCellFull!6959) mapValue!23734)) b!823042))

(assert (= (and b!823038 ((_ is ValueCellFull!6959) mapDefault!23734)) b!823043))

(assert (= start!70948 b!823038))

(declare-fun m!765179 () Bool)

(assert (=> b!823040 m!765179))

(declare-fun m!765181 () Bool)

(assert (=> b!823037 m!765181))

(declare-fun m!765183 () Bool)

(assert (=> mapNonEmpty!23734 m!765183))

(declare-fun m!765185 () Bool)

(assert (=> start!70948 m!765185))

(declare-fun m!765187 () Bool)

(assert (=> start!70948 m!765187))

(declare-fun m!765189 () Bool)

(assert (=> start!70948 m!765189))

(declare-fun m!765191 () Bool)

(assert (=> b!823036 m!765191))

(declare-fun m!765193 () Bool)

(assert (=> b!823036 m!765193))

(declare-fun m!765195 () Bool)

(assert (=> b!823036 m!765195))

(declare-fun m!765197 () Bool)

(assert (=> b!823039 m!765197))

(declare-fun m!765199 () Bool)

(assert (=> b!823039 m!765199))

(declare-fun m!765201 () Bool)

(assert (=> b!823039 m!765201))

(declare-fun m!765203 () Bool)

(assert (=> b!823039 m!765203))

(declare-fun m!765205 () Bool)

(assert (=> b!823039 m!765205))

(declare-fun m!765207 () Bool)

(assert (=> b!823039 m!765207))

(assert (=> b!823039 m!765201))

(declare-fun m!765209 () Bool)

(assert (=> b!823039 m!765209))

(check-sat tp_is_empty!14749 (not start!70948) (not b!823040) b_and!21921 (not mapNonEmpty!23734) (not b!823036) (not b!823039) (not b!823037) (not b_next!13039))
(check-sat b_and!21921 (not b_next!13039))
