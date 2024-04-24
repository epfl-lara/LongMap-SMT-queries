; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94760 () Bool)

(assert start!94760)

(declare-fun b_free!21829 () Bool)

(declare-fun b_next!21829 () Bool)

(assert (=> start!94760 (= b_free!21829 (not b_next!21829))))

(declare-fun tp!76936 () Bool)

(declare-fun b_and!34641 () Bool)

(assert (=> start!94760 (= tp!76936 b_and!34641)))

(declare-fun b!1070176 () Bool)

(declare-fun e!610743 () Bool)

(declare-fun tp_is_empty!25639 () Bool)

(assert (=> b!1070176 (= e!610743 tp_is_empty!25639)))

(declare-fun res!713729 () Bool)

(declare-fun e!610744 () Bool)

(assert (=> start!94760 (=> (not res!713729) (not e!610744))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94760 (= res!713729 (validMask!0 mask!1515))))

(assert (=> start!94760 e!610744))

(assert (=> start!94760 true))

(assert (=> start!94760 tp_is_empty!25639))

(declare-datatypes ((V!39321 0))(
  ( (V!39322 (val!12870 Int)) )
))
(declare-datatypes ((ValueCell!12116 0))(
  ( (ValueCellFull!12116 (v!15481 V!39321)) (EmptyCell!12116) )
))
(declare-datatypes ((array!68301 0))(
  ( (array!68302 (arr!32843 (Array (_ BitVec 32) ValueCell!12116)) (size!33380 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68301)

(declare-fun e!610747 () Bool)

(declare-fun array_inv!25440 (array!68301) Bool)

(assert (=> start!94760 (and (array_inv!25440 _values!955) e!610747)))

(assert (=> start!94760 tp!76936))

(declare-datatypes ((array!68303 0))(
  ( (array!68304 (arr!32844 (Array (_ BitVec 32) (_ BitVec 64))) (size!33381 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68303)

(declare-fun array_inv!25441 (array!68303) Bool)

(assert (=> start!94760 (array_inv!25441 _keys!1163)))

(declare-fun b!1070177 () Bool)

(declare-fun e!610742 () Bool)

(declare-fun mapRes!40156 () Bool)

(assert (=> b!1070177 (= e!610747 (and e!610742 mapRes!40156))))

(declare-fun condMapEmpty!40156 () Bool)

(declare-fun mapDefault!40156 () ValueCell!12116)

(assert (=> b!1070177 (= condMapEmpty!40156 (= (arr!32843 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12116)) mapDefault!40156)))))

(declare-fun b!1070178 () Bool)

(declare-fun e!610746 () Bool)

(declare-fun e!610745 () Bool)

(assert (=> b!1070178 (= e!610746 e!610745)))

(declare-fun res!713728 () Bool)

(assert (=> b!1070178 (=> res!713728 e!610745)))

(declare-datatypes ((tuple2!16328 0))(
  ( (tuple2!16329 (_1!8175 (_ BitVec 64)) (_2!8175 V!39321)) )
))
(declare-datatypes ((List!22895 0))(
  ( (Nil!22892) (Cons!22891 (h!24109 tuple2!16328) (t!32214 List!22895)) )
))
(declare-datatypes ((ListLongMap!14305 0))(
  ( (ListLongMap!14306 (toList!7168 List!22895)) )
))
(declare-fun lt!472771 () ListLongMap!14305)

(declare-fun contains!6329 (ListLongMap!14305 (_ BitVec 64)) Bool)

(assert (=> b!1070178 (= res!713728 (contains!6329 lt!472771 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!39321)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39321)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4091 (array!68303 array!68301 (_ BitVec 32) (_ BitVec 32) V!39321 V!39321 (_ BitVec 32) Int) ListLongMap!14305)

(assert (=> b!1070178 (= lt!472771 (getCurrentListMap!4091 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070179 () Bool)

(assert (=> b!1070179 (= e!610742 tp_is_empty!25639)))

(declare-fun b!1070180 () Bool)

(declare-fun res!713730 () Bool)

(assert (=> b!1070180 (=> (not res!713730) (not e!610744))))

(declare-datatypes ((List!22896 0))(
  ( (Nil!22893) (Cons!22892 (h!24110 (_ BitVec 64)) (t!32215 List!22896)) )
))
(declare-fun arrayNoDuplicates!0 (array!68303 (_ BitVec 32) List!22896) Bool)

(assert (=> b!1070180 (= res!713730 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22893))))

(declare-fun b!1070181 () Bool)

(declare-fun res!713727 () Bool)

(assert (=> b!1070181 (=> (not res!713727) (not e!610744))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68303 (_ BitVec 32)) Bool)

(assert (=> b!1070181 (= res!713727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!40156 () Bool)

(declare-fun tp!76937 () Bool)

(assert (=> mapNonEmpty!40156 (= mapRes!40156 (and tp!76937 e!610743))))

(declare-fun mapValue!40156 () ValueCell!12116)

(declare-fun mapKey!40156 () (_ BitVec 32))

(declare-fun mapRest!40156 () (Array (_ BitVec 32) ValueCell!12116))

(assert (=> mapNonEmpty!40156 (= (arr!32843 _values!955) (store mapRest!40156 mapKey!40156 mapValue!40156))))

(declare-fun b!1070182 () Bool)

(assert (=> b!1070182 (= e!610744 (not e!610746))))

(declare-fun res!713726 () Bool)

(assert (=> b!1070182 (=> res!713726 e!610746)))

(assert (=> b!1070182 (= res!713726 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!472768 () ListLongMap!14305)

(declare-fun lt!472769 () ListLongMap!14305)

(assert (=> b!1070182 (= lt!472768 lt!472769)))

(declare-datatypes ((Unit!35128 0))(
  ( (Unit!35129) )
))
(declare-fun lt!472767 () Unit!35128)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!39321)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!784 (array!68303 array!68301 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39321 V!39321 V!39321 V!39321 (_ BitVec 32) Int) Unit!35128)

(assert (=> b!1070182 (= lt!472767 (lemmaNoChangeToArrayThenSameMapNoExtras!784 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3781 (array!68303 array!68301 (_ BitVec 32) (_ BitVec 32) V!39321 V!39321 (_ BitVec 32) Int) ListLongMap!14305)

(assert (=> b!1070182 (= lt!472769 (getCurrentListMapNoExtraKeys!3781 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070182 (= lt!472768 (getCurrentListMapNoExtraKeys!3781 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070183 () Bool)

(assert (=> b!1070183 (= e!610745 true)))

(declare-fun -!650 (ListLongMap!14305 (_ BitVec 64)) ListLongMap!14305)

(assert (=> b!1070183 (= (-!650 lt!472771 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472771)))

(declare-fun lt!472770 () Unit!35128)

(declare-fun removeNotPresentStillSame!67 (ListLongMap!14305 (_ BitVec 64)) Unit!35128)

(assert (=> b!1070183 (= lt!472770 (removeNotPresentStillSame!67 lt!472771 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!40156 () Bool)

(assert (=> mapIsEmpty!40156 mapRes!40156))

(declare-fun b!1070184 () Bool)

(declare-fun res!713731 () Bool)

(assert (=> b!1070184 (=> (not res!713731) (not e!610744))))

(assert (=> b!1070184 (= res!713731 (and (= (size!33380 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33381 _keys!1163) (size!33380 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94760 res!713729) b!1070184))

(assert (= (and b!1070184 res!713731) b!1070181))

(assert (= (and b!1070181 res!713727) b!1070180))

(assert (= (and b!1070180 res!713730) b!1070182))

(assert (= (and b!1070182 (not res!713726)) b!1070178))

(assert (= (and b!1070178 (not res!713728)) b!1070183))

(assert (= (and b!1070177 condMapEmpty!40156) mapIsEmpty!40156))

(assert (= (and b!1070177 (not condMapEmpty!40156)) mapNonEmpty!40156))

(get-info :version)

(assert (= (and mapNonEmpty!40156 ((_ is ValueCellFull!12116) mapValue!40156)) b!1070176))

(assert (= (and b!1070177 ((_ is ValueCellFull!12116) mapDefault!40156)) b!1070179))

(assert (= start!94760 b!1070177))

(declare-fun m!989077 () Bool)

(assert (=> start!94760 m!989077))

(declare-fun m!989079 () Bool)

(assert (=> start!94760 m!989079))

(declare-fun m!989081 () Bool)

(assert (=> start!94760 m!989081))

(declare-fun m!989083 () Bool)

(assert (=> b!1070180 m!989083))

(declare-fun m!989085 () Bool)

(assert (=> b!1070182 m!989085))

(declare-fun m!989087 () Bool)

(assert (=> b!1070182 m!989087))

(declare-fun m!989089 () Bool)

(assert (=> b!1070182 m!989089))

(declare-fun m!989091 () Bool)

(assert (=> mapNonEmpty!40156 m!989091))

(declare-fun m!989093 () Bool)

(assert (=> b!1070178 m!989093))

(declare-fun m!989095 () Bool)

(assert (=> b!1070178 m!989095))

(declare-fun m!989097 () Bool)

(assert (=> b!1070181 m!989097))

(declare-fun m!989099 () Bool)

(assert (=> b!1070183 m!989099))

(declare-fun m!989101 () Bool)

(assert (=> b!1070183 m!989101))

(check-sat (not b!1070183) (not b!1070180) (not b_next!21829) (not mapNonEmpty!40156) (not start!94760) (not b!1070178) b_and!34641 tp_is_empty!25639 (not b!1070182) (not b!1070181))
(check-sat b_and!34641 (not b_next!21829))
