; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94518 () Bool)

(assert start!94518)

(declare-fun b_free!21829 () Bool)

(declare-fun b_next!21829 () Bool)

(assert (=> start!94518 (= b_free!21829 (not b_next!21829))))

(declare-fun tp!76936 () Bool)

(declare-fun b_and!34605 () Bool)

(assert (=> start!94518 (= tp!76936 b_and!34605)))

(declare-fun mapIsEmpty!40156 () Bool)

(declare-fun mapRes!40156 () Bool)

(assert (=> mapIsEmpty!40156 mapRes!40156))

(declare-fun b!1068696 () Bool)

(declare-fun e!609798 () Bool)

(declare-fun e!609799 () Bool)

(assert (=> b!1068696 (= e!609798 (not e!609799))))

(declare-fun res!713136 () Bool)

(assert (=> b!1068696 (=> res!713136 e!609799)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1068696 (= res!713136 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!39321 0))(
  ( (V!39322 (val!12870 Int)) )
))
(declare-datatypes ((tuple2!16402 0))(
  ( (tuple2!16403 (_1!8212 (_ BitVec 64)) (_2!8212 V!39321)) )
))
(declare-datatypes ((List!22941 0))(
  ( (Nil!22938) (Cons!22937 (h!24146 tuple2!16402) (t!32259 List!22941)) )
))
(declare-datatypes ((ListLongMap!14371 0))(
  ( (ListLongMap!14372 (toList!7201 List!22941)) )
))
(declare-fun lt!472055 () ListLongMap!14371)

(declare-fun lt!472053 () ListLongMap!14371)

(assert (=> b!1068696 (= lt!472055 lt!472053)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39321)

(declare-datatypes ((Unit!34992 0))(
  ( (Unit!34993) )
))
(declare-fun lt!472054 () Unit!34992)

(declare-datatypes ((ValueCell!12116 0))(
  ( (ValueCellFull!12116 (v!15484 V!39321)) (EmptyCell!12116) )
))
(declare-datatypes ((array!68200 0))(
  ( (array!68201 (arr!32799 (Array (_ BitVec 32) ValueCell!12116)) (size!33337 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68200)

(declare-fun minValue!907 () V!39321)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39321)

(declare-datatypes ((array!68202 0))(
  ( (array!68203 (arr!32800 (Array (_ BitVec 32) (_ BitVec 64))) (size!33338 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68202)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!787 (array!68202 array!68200 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39321 V!39321 V!39321 V!39321 (_ BitVec 32) Int) Unit!34992)

(assert (=> b!1068696 (= lt!472054 (lemmaNoChangeToArrayThenSameMapNoExtras!787 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3793 (array!68202 array!68200 (_ BitVec 32) (_ BitVec 32) V!39321 V!39321 (_ BitVec 32) Int) ListLongMap!14371)

(assert (=> b!1068696 (= lt!472053 (getCurrentListMapNoExtraKeys!3793 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068696 (= lt!472055 (getCurrentListMapNoExtraKeys!3793 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068697 () Bool)

(declare-fun e!609795 () Bool)

(declare-fun e!609797 () Bool)

(assert (=> b!1068697 (= e!609795 (and e!609797 mapRes!40156))))

(declare-fun condMapEmpty!40156 () Bool)

(declare-fun mapDefault!40156 () ValueCell!12116)

(assert (=> b!1068697 (= condMapEmpty!40156 (= (arr!32799 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12116)) mapDefault!40156)))))

(declare-fun b!1068698 () Bool)

(declare-fun res!713139 () Bool)

(assert (=> b!1068698 (=> (not res!713139) (not e!609798))))

(declare-datatypes ((List!22942 0))(
  ( (Nil!22939) (Cons!22938 (h!24147 (_ BitVec 64)) (t!32260 List!22942)) )
))
(declare-fun arrayNoDuplicates!0 (array!68202 (_ BitVec 32) List!22942) Bool)

(assert (=> b!1068698 (= res!713139 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22939))))

(declare-fun b!1068699 () Bool)

(declare-fun res!713135 () Bool)

(assert (=> b!1068699 (=> (not res!713135) (not e!609798))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68202 (_ BitVec 32)) Bool)

(assert (=> b!1068699 (= res!713135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1068700 () Bool)

(declare-fun e!609794 () Bool)

(assert (=> b!1068700 (= e!609799 e!609794)))

(declare-fun res!713140 () Bool)

(assert (=> b!1068700 (=> res!713140 e!609794)))

(declare-fun lt!472056 () ListLongMap!14371)

(declare-fun contains!6274 (ListLongMap!14371 (_ BitVec 64)) Bool)

(assert (=> b!1068700 (= res!713140 (contains!6274 lt!472056 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4042 (array!68202 array!68200 (_ BitVec 32) (_ BitVec 32) V!39321 V!39321 (_ BitVec 32) Int) ListLongMap!14371)

(assert (=> b!1068700 (= lt!472056 (getCurrentListMap!4042 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068701 () Bool)

(declare-fun res!713138 () Bool)

(assert (=> b!1068701 (=> (not res!713138) (not e!609798))))

(assert (=> b!1068701 (= res!713138 (and (= (size!33337 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33338 _keys!1163) (size!33337 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!713137 () Bool)

(assert (=> start!94518 (=> (not res!713137) (not e!609798))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94518 (= res!713137 (validMask!0 mask!1515))))

(assert (=> start!94518 e!609798))

(assert (=> start!94518 true))

(declare-fun tp_is_empty!25639 () Bool)

(assert (=> start!94518 tp_is_empty!25639))

(declare-fun array_inv!25386 (array!68200) Bool)

(assert (=> start!94518 (and (array_inv!25386 _values!955) e!609795)))

(assert (=> start!94518 tp!76936))

(declare-fun array_inv!25387 (array!68202) Bool)

(assert (=> start!94518 (array_inv!25387 _keys!1163)))

(declare-fun b!1068702 () Bool)

(declare-fun e!609800 () Bool)

(assert (=> b!1068702 (= e!609800 tp_is_empty!25639)))

(declare-fun b!1068703 () Bool)

(assert (=> b!1068703 (= e!609794 true)))

(declare-fun -!645 (ListLongMap!14371 (_ BitVec 64)) ListLongMap!14371)

(assert (=> b!1068703 (= (-!645 lt!472056 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472056)))

(declare-fun lt!472052 () Unit!34992)

(declare-fun removeNotPresentStillSame!62 (ListLongMap!14371 (_ BitVec 64)) Unit!34992)

(assert (=> b!1068703 (= lt!472052 (removeNotPresentStillSame!62 lt!472056 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1068704 () Bool)

(assert (=> b!1068704 (= e!609797 tp_is_empty!25639)))

(declare-fun mapNonEmpty!40156 () Bool)

(declare-fun tp!76937 () Bool)

(assert (=> mapNonEmpty!40156 (= mapRes!40156 (and tp!76937 e!609800))))

(declare-fun mapKey!40156 () (_ BitVec 32))

(declare-fun mapRest!40156 () (Array (_ BitVec 32) ValueCell!12116))

(declare-fun mapValue!40156 () ValueCell!12116)

(assert (=> mapNonEmpty!40156 (= (arr!32799 _values!955) (store mapRest!40156 mapKey!40156 mapValue!40156))))

(assert (= (and start!94518 res!713137) b!1068701))

(assert (= (and b!1068701 res!713138) b!1068699))

(assert (= (and b!1068699 res!713135) b!1068698))

(assert (= (and b!1068698 res!713139) b!1068696))

(assert (= (and b!1068696 (not res!713136)) b!1068700))

(assert (= (and b!1068700 (not res!713140)) b!1068703))

(assert (= (and b!1068697 condMapEmpty!40156) mapIsEmpty!40156))

(assert (= (and b!1068697 (not condMapEmpty!40156)) mapNonEmpty!40156))

(get-info :version)

(assert (= (and mapNonEmpty!40156 ((_ is ValueCellFull!12116) mapValue!40156)) b!1068702))

(assert (= (and b!1068697 ((_ is ValueCellFull!12116) mapDefault!40156)) b!1068704))

(assert (= start!94518 b!1068697))

(declare-fun m!986779 () Bool)

(assert (=> mapNonEmpty!40156 m!986779))

(declare-fun m!986781 () Bool)

(assert (=> b!1068700 m!986781))

(declare-fun m!986783 () Bool)

(assert (=> b!1068700 m!986783))

(declare-fun m!986785 () Bool)

(assert (=> b!1068698 m!986785))

(declare-fun m!986787 () Bool)

(assert (=> b!1068703 m!986787))

(declare-fun m!986789 () Bool)

(assert (=> b!1068703 m!986789))

(declare-fun m!986791 () Bool)

(assert (=> b!1068699 m!986791))

(declare-fun m!986793 () Bool)

(assert (=> start!94518 m!986793))

(declare-fun m!986795 () Bool)

(assert (=> start!94518 m!986795))

(declare-fun m!986797 () Bool)

(assert (=> start!94518 m!986797))

(declare-fun m!986799 () Bool)

(assert (=> b!1068696 m!986799))

(declare-fun m!986801 () Bool)

(assert (=> b!1068696 m!986801))

(declare-fun m!986803 () Bool)

(assert (=> b!1068696 m!986803))

(check-sat (not start!94518) (not b!1068703) (not b_next!21829) (not b!1068696) (not b!1068700) tp_is_empty!25639 (not b!1068698) (not b!1068699) b_and!34605 (not mapNonEmpty!40156))
(check-sat b_and!34605 (not b_next!21829))
