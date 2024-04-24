; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95130 () Bool)

(assert start!95130)

(declare-fun b_free!22099 () Bool)

(declare-fun b_next!22099 () Bool)

(assert (=> start!95130 (= b_free!22099 (not b_next!22099))))

(declare-fun tp!77761 () Bool)

(declare-fun b_and!34963 () Bool)

(assert (=> start!95130 (= tp!77761 b_and!34963)))

(declare-fun mapNonEmpty!40576 () Bool)

(declare-fun mapRes!40576 () Bool)

(declare-fun tp!77762 () Bool)

(declare-fun e!613793 () Bool)

(assert (=> mapNonEmpty!40576 (= mapRes!40576 (and tp!77762 e!613793))))

(declare-datatypes ((V!39681 0))(
  ( (V!39682 (val!13005 Int)) )
))
(declare-datatypes ((ValueCell!12251 0))(
  ( (ValueCellFull!12251 (v!15619 V!39681)) (EmptyCell!12251) )
))
(declare-fun mapValue!40576 () ValueCell!12251)

(declare-datatypes ((array!68829 0))(
  ( (array!68830 (arr!33102 (Array (_ BitVec 32) ValueCell!12251)) (size!33639 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68829)

(declare-fun mapKey!40576 () (_ BitVec 32))

(declare-fun mapRest!40576 () (Array (_ BitVec 32) ValueCell!12251))

(assert (=> mapNonEmpty!40576 (= (arr!33102 _values!955) (store mapRest!40576 mapKey!40576 mapValue!40576))))

(declare-fun b!1074312 () Bool)

(declare-fun res!716203 () Bool)

(declare-fun e!613790 () Bool)

(assert (=> b!1074312 (=> (not res!716203) (not e!613790))))

(declare-datatypes ((array!68831 0))(
  ( (array!68832 (arr!33103 (Array (_ BitVec 32) (_ BitVec 64))) (size!33640 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68831)

(declare-datatypes ((List!23101 0))(
  ( (Nil!23098) (Cons!23097 (h!24315 (_ BitVec 64)) (t!32430 List!23101)) )
))
(declare-fun arrayNoDuplicates!0 (array!68831 (_ BitVec 32) List!23101) Bool)

(assert (=> b!1074312 (= res!716203 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23098))))

(declare-fun b!1074313 () Bool)

(assert (=> b!1074313 (= e!613790 false)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((tuple2!16546 0))(
  ( (tuple2!16547 (_1!8284 (_ BitVec 64)) (_2!8284 V!39681)) )
))
(declare-datatypes ((List!23102 0))(
  ( (Nil!23099) (Cons!23098 (h!24316 tuple2!16546) (t!32431 List!23102)) )
))
(declare-datatypes ((ListLongMap!14523 0))(
  ( (ListLongMap!14524 (toList!7277 List!23102)) )
))
(declare-fun lt!476432 () ListLongMap!14523)

(declare-fun minValue!907 () V!39681)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39681)

(declare-fun getCurrentListMapNoExtraKeys!3875 (array!68831 array!68829 (_ BitVec 32) (_ BitVec 32) V!39681 V!39681 (_ BitVec 32) Int) ListLongMap!14523)

(assert (=> b!1074313 (= lt!476432 (getCurrentListMapNoExtraKeys!3875 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39681)

(declare-fun lt!476433 () ListLongMap!14523)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1074313 (= lt!476433 (getCurrentListMapNoExtraKeys!3875 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40576 () Bool)

(assert (=> mapIsEmpty!40576 mapRes!40576))

(declare-fun b!1074314 () Bool)

(declare-fun e!613789 () Bool)

(declare-fun e!613792 () Bool)

(assert (=> b!1074314 (= e!613789 (and e!613792 mapRes!40576))))

(declare-fun condMapEmpty!40576 () Bool)

(declare-fun mapDefault!40576 () ValueCell!12251)

(assert (=> b!1074314 (= condMapEmpty!40576 (= (arr!33102 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12251)) mapDefault!40576)))))

(declare-fun b!1074315 () Bool)

(declare-fun tp_is_empty!25909 () Bool)

(assert (=> b!1074315 (= e!613793 tp_is_empty!25909)))

(declare-fun b!1074316 () Bool)

(assert (=> b!1074316 (= e!613792 tp_is_empty!25909)))

(declare-fun b!1074317 () Bool)

(declare-fun res!716205 () Bool)

(assert (=> b!1074317 (=> (not res!716205) (not e!613790))))

(assert (=> b!1074317 (= res!716205 (and (= (size!33639 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33640 _keys!1163) (size!33639 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!716206 () Bool)

(assert (=> start!95130 (=> (not res!716206) (not e!613790))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95130 (= res!716206 (validMask!0 mask!1515))))

(assert (=> start!95130 e!613790))

(assert (=> start!95130 true))

(assert (=> start!95130 tp_is_empty!25909))

(declare-fun array_inv!25620 (array!68829) Bool)

(assert (=> start!95130 (and (array_inv!25620 _values!955) e!613789)))

(assert (=> start!95130 tp!77761))

(declare-fun array_inv!25621 (array!68831) Bool)

(assert (=> start!95130 (array_inv!25621 _keys!1163)))

(declare-fun b!1074318 () Bool)

(declare-fun res!716204 () Bool)

(assert (=> b!1074318 (=> (not res!716204) (not e!613790))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68831 (_ BitVec 32)) Bool)

(assert (=> b!1074318 (= res!716204 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!95130 res!716206) b!1074317))

(assert (= (and b!1074317 res!716205) b!1074318))

(assert (= (and b!1074318 res!716204) b!1074312))

(assert (= (and b!1074312 res!716203) b!1074313))

(assert (= (and b!1074314 condMapEmpty!40576) mapIsEmpty!40576))

(assert (= (and b!1074314 (not condMapEmpty!40576)) mapNonEmpty!40576))

(get-info :version)

(assert (= (and mapNonEmpty!40576 ((_ is ValueCellFull!12251) mapValue!40576)) b!1074315))

(assert (= (and b!1074314 ((_ is ValueCellFull!12251) mapDefault!40576)) b!1074316))

(assert (= start!95130 b!1074314))

(declare-fun m!993751 () Bool)

(assert (=> mapNonEmpty!40576 m!993751))

(declare-fun m!993753 () Bool)

(assert (=> b!1074312 m!993753))

(declare-fun m!993755 () Bool)

(assert (=> b!1074313 m!993755))

(declare-fun m!993757 () Bool)

(assert (=> b!1074313 m!993757))

(declare-fun m!993759 () Bool)

(assert (=> start!95130 m!993759))

(declare-fun m!993761 () Bool)

(assert (=> start!95130 m!993761))

(declare-fun m!993763 () Bool)

(assert (=> start!95130 m!993763))

(declare-fun m!993765 () Bool)

(assert (=> b!1074318 m!993765))

(check-sat tp_is_empty!25909 (not mapNonEmpty!40576) (not b_next!22099) (not b!1074312) (not b!1074313) b_and!34963 (not b!1074318) (not start!95130))
(check-sat b_and!34963 (not b_next!22099))
