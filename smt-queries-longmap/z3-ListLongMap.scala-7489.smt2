; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95142 () Bool)

(assert start!95142)

(declare-fun b_free!22111 () Bool)

(declare-fun b_next!22111 () Bool)

(assert (=> start!95142 (= b_free!22111 (not b_next!22111))))

(declare-fun tp!77798 () Bool)

(declare-fun b_and!34975 () Bool)

(assert (=> start!95142 (= tp!77798 b_and!34975)))

(declare-fun b!1074438 () Bool)

(declare-fun res!716275 () Bool)

(declare-fun e!613882 () Bool)

(assert (=> b!1074438 (=> (not res!716275) (not e!613882))))

(declare-datatypes ((array!68853 0))(
  ( (array!68854 (arr!33114 (Array (_ BitVec 32) (_ BitVec 64))) (size!33651 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68853)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68853 (_ BitVec 32)) Bool)

(assert (=> b!1074438 (= res!716275 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!716276 () Bool)

(assert (=> start!95142 (=> (not res!716276) (not e!613882))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95142 (= res!716276 (validMask!0 mask!1515))))

(assert (=> start!95142 e!613882))

(assert (=> start!95142 true))

(declare-fun tp_is_empty!25921 () Bool)

(assert (=> start!95142 tp_is_empty!25921))

(declare-datatypes ((V!39697 0))(
  ( (V!39698 (val!13011 Int)) )
))
(declare-datatypes ((ValueCell!12257 0))(
  ( (ValueCellFull!12257 (v!15625 V!39697)) (EmptyCell!12257) )
))
(declare-datatypes ((array!68855 0))(
  ( (array!68856 (arr!33115 (Array (_ BitVec 32) ValueCell!12257)) (size!33652 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68855)

(declare-fun e!613881 () Bool)

(declare-fun array_inv!25632 (array!68855) Bool)

(assert (=> start!95142 (and (array_inv!25632 _values!955) e!613881)))

(assert (=> start!95142 tp!77798))

(declare-fun array_inv!25633 (array!68853) Bool)

(assert (=> start!95142 (array_inv!25633 _keys!1163)))

(declare-fun mapIsEmpty!40594 () Bool)

(declare-fun mapRes!40594 () Bool)

(assert (=> mapIsEmpty!40594 mapRes!40594))

(declare-fun b!1074439 () Bool)

(assert (=> b!1074439 (= e!613882 false)))

(declare-fun minValue!907 () V!39697)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!39697)

(declare-fun defaultEntry!963 () Int)

(declare-datatypes ((tuple2!16554 0))(
  ( (tuple2!16555 (_1!8288 (_ BitVec 64)) (_2!8288 V!39697)) )
))
(declare-datatypes ((List!23111 0))(
  ( (Nil!23108) (Cons!23107 (h!24325 tuple2!16554) (t!32440 List!23111)) )
))
(declare-datatypes ((ListLongMap!14531 0))(
  ( (ListLongMap!14532 (toList!7281 List!23111)) )
))
(declare-fun lt!476469 () ListLongMap!14531)

(declare-fun getCurrentListMapNoExtraKeys!3879 (array!68853 array!68855 (_ BitVec 32) (_ BitVec 32) V!39697 V!39697 (_ BitVec 32) Int) ListLongMap!14531)

(assert (=> b!1074439 (= lt!476469 (getCurrentListMapNoExtraKeys!3879 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39697)

(declare-fun lt!476468 () ListLongMap!14531)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1074439 (= lt!476468 (getCurrentListMapNoExtraKeys!3879 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40594 () Bool)

(declare-fun tp!77797 () Bool)

(declare-fun e!613879 () Bool)

(assert (=> mapNonEmpty!40594 (= mapRes!40594 (and tp!77797 e!613879))))

(declare-fun mapValue!40594 () ValueCell!12257)

(declare-fun mapKey!40594 () (_ BitVec 32))

(declare-fun mapRest!40594 () (Array (_ BitVec 32) ValueCell!12257))

(assert (=> mapNonEmpty!40594 (= (arr!33115 _values!955) (store mapRest!40594 mapKey!40594 mapValue!40594))))

(declare-fun b!1074440 () Bool)

(declare-fun e!613880 () Bool)

(assert (=> b!1074440 (= e!613880 tp_is_empty!25921)))

(declare-fun b!1074441 () Bool)

(assert (=> b!1074441 (= e!613879 tp_is_empty!25921)))

(declare-fun b!1074442 () Bool)

(assert (=> b!1074442 (= e!613881 (and e!613880 mapRes!40594))))

(declare-fun condMapEmpty!40594 () Bool)

(declare-fun mapDefault!40594 () ValueCell!12257)

(assert (=> b!1074442 (= condMapEmpty!40594 (= (arr!33115 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12257)) mapDefault!40594)))))

(declare-fun b!1074443 () Bool)

(declare-fun res!716277 () Bool)

(assert (=> b!1074443 (=> (not res!716277) (not e!613882))))

(declare-datatypes ((List!23112 0))(
  ( (Nil!23109) (Cons!23108 (h!24326 (_ BitVec 64)) (t!32441 List!23112)) )
))
(declare-fun arrayNoDuplicates!0 (array!68853 (_ BitVec 32) List!23112) Bool)

(assert (=> b!1074443 (= res!716277 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23109))))

(declare-fun b!1074444 () Bool)

(declare-fun res!716278 () Bool)

(assert (=> b!1074444 (=> (not res!716278) (not e!613882))))

(assert (=> b!1074444 (= res!716278 (and (= (size!33652 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33651 _keys!1163) (size!33652 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!95142 res!716276) b!1074444))

(assert (= (and b!1074444 res!716278) b!1074438))

(assert (= (and b!1074438 res!716275) b!1074443))

(assert (= (and b!1074443 res!716277) b!1074439))

(assert (= (and b!1074442 condMapEmpty!40594) mapIsEmpty!40594))

(assert (= (and b!1074442 (not condMapEmpty!40594)) mapNonEmpty!40594))

(get-info :version)

(assert (= (and mapNonEmpty!40594 ((_ is ValueCellFull!12257) mapValue!40594)) b!1074441))

(assert (= (and b!1074442 ((_ is ValueCellFull!12257) mapDefault!40594)) b!1074440))

(assert (= start!95142 b!1074442))

(declare-fun m!993847 () Bool)

(assert (=> b!1074438 m!993847))

(declare-fun m!993849 () Bool)

(assert (=> b!1074443 m!993849))

(declare-fun m!993851 () Bool)

(assert (=> mapNonEmpty!40594 m!993851))

(declare-fun m!993853 () Bool)

(assert (=> start!95142 m!993853))

(declare-fun m!993855 () Bool)

(assert (=> start!95142 m!993855))

(declare-fun m!993857 () Bool)

(assert (=> start!95142 m!993857))

(declare-fun m!993859 () Bool)

(assert (=> b!1074439 m!993859))

(declare-fun m!993861 () Bool)

(assert (=> b!1074439 m!993861))

(check-sat (not b_next!22111) b_and!34975 (not mapNonEmpty!40594) (not b!1074438) (not b!1074443) (not b!1074439) (not start!95142) tp_is_empty!25921)
(check-sat b_and!34975 (not b_next!22111))
