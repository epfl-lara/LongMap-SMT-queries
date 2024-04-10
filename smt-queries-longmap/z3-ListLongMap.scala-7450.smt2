; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94596 () Bool)

(assert start!94596)

(declare-fun b_free!21879 () Bool)

(declare-fun b_next!21879 () Bool)

(assert (=> start!94596 (= b_free!21879 (not b_next!21879))))

(declare-fun tp!77089 () Bool)

(declare-fun b_and!34691 () Bool)

(assert (=> start!94596 (= tp!77089 b_and!34691)))

(declare-fun b!1069617 () Bool)

(declare-fun res!713653 () Bool)

(declare-fun e!610450 () Bool)

(assert (=> b!1069617 (=> (not res!713653) (not e!610450))))

(declare-datatypes ((array!68355 0))(
  ( (array!68356 (arr!32875 (Array (_ BitVec 32) (_ BitVec 64))) (size!33411 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68355)

(declare-datatypes ((List!22933 0))(
  ( (Nil!22930) (Cons!22929 (h!24138 (_ BitVec 64)) (t!32262 List!22933)) )
))
(declare-fun arrayNoDuplicates!0 (array!68355 (_ BitVec 32) List!22933) Bool)

(assert (=> b!1069617 (= res!713653 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22930))))

(declare-fun mapIsEmpty!40234 () Bool)

(declare-fun mapRes!40234 () Bool)

(assert (=> mapIsEmpty!40234 mapRes!40234))

(declare-fun b!1069618 () Bool)

(declare-fun res!713652 () Bool)

(assert (=> b!1069618 (=> (not res!713652) (not e!610450))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39387 0))(
  ( (V!39388 (val!12895 Int)) )
))
(declare-datatypes ((ValueCell!12141 0))(
  ( (ValueCellFull!12141 (v!15511 V!39387)) (EmptyCell!12141) )
))
(declare-datatypes ((array!68357 0))(
  ( (array!68358 (arr!32876 (Array (_ BitVec 32) ValueCell!12141)) (size!33412 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68357)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1069618 (= res!713652 (and (= (size!33412 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33411 _keys!1163) (size!33412 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1069619 () Bool)

(declare-fun res!713651 () Bool)

(assert (=> b!1069619 (=> (not res!713651) (not e!610450))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68355 (_ BitVec 32)) Bool)

(assert (=> b!1069619 (= res!713651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1069620 () Bool)

(assert (=> b!1069620 (= e!610450 (not true))))

(declare-datatypes ((tuple2!16388 0))(
  ( (tuple2!16389 (_1!8205 (_ BitVec 64)) (_2!8205 V!39387)) )
))
(declare-datatypes ((List!22934 0))(
  ( (Nil!22931) (Cons!22930 (h!24139 tuple2!16388) (t!32263 List!22934)) )
))
(declare-datatypes ((ListLongMap!14357 0))(
  ( (ListLongMap!14358 (toList!7194 List!22934)) )
))
(declare-fun lt!472688 () ListLongMap!14357)

(declare-fun lt!472687 () ListLongMap!14357)

(assert (=> b!1069620 (= lt!472688 lt!472687)))

(declare-datatypes ((Unit!35187 0))(
  ( (Unit!35188) )
))
(declare-fun lt!472689 () Unit!35187)

(declare-fun zeroValueBefore!47 () V!39387)

(declare-fun minValue!907 () V!39387)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39387)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!807 (array!68355 array!68357 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39387 V!39387 V!39387 V!39387 (_ BitVec 32) Int) Unit!35187)

(assert (=> b!1069620 (= lt!472689 (lemmaNoChangeToArrayThenSameMapNoExtras!807 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3770 (array!68355 array!68357 (_ BitVec 32) (_ BitVec 32) V!39387 V!39387 (_ BitVec 32) Int) ListLongMap!14357)

(assert (=> b!1069620 (= lt!472687 (getCurrentListMapNoExtraKeys!3770 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069620 (= lt!472688 (getCurrentListMapNoExtraKeys!3770 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!713654 () Bool)

(assert (=> start!94596 (=> (not res!713654) (not e!610450))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94596 (= res!713654 (validMask!0 mask!1515))))

(assert (=> start!94596 e!610450))

(assert (=> start!94596 true))

(declare-fun tp_is_empty!25689 () Bool)

(assert (=> start!94596 tp_is_empty!25689))

(declare-fun e!610448 () Bool)

(declare-fun array_inv!25440 (array!68357) Bool)

(assert (=> start!94596 (and (array_inv!25440 _values!955) e!610448)))

(assert (=> start!94596 tp!77089))

(declare-fun array_inv!25441 (array!68355) Bool)

(assert (=> start!94596 (array_inv!25441 _keys!1163)))

(declare-fun b!1069621 () Bool)

(declare-fun e!610452 () Bool)

(assert (=> b!1069621 (= e!610452 tp_is_empty!25689)))

(declare-fun b!1069622 () Bool)

(declare-fun e!610449 () Bool)

(assert (=> b!1069622 (= e!610449 tp_is_empty!25689)))

(declare-fun mapNonEmpty!40234 () Bool)

(declare-fun tp!77090 () Bool)

(assert (=> mapNonEmpty!40234 (= mapRes!40234 (and tp!77090 e!610452))))

(declare-fun mapKey!40234 () (_ BitVec 32))

(declare-fun mapRest!40234 () (Array (_ BitVec 32) ValueCell!12141))

(declare-fun mapValue!40234 () ValueCell!12141)

(assert (=> mapNonEmpty!40234 (= (arr!32876 _values!955) (store mapRest!40234 mapKey!40234 mapValue!40234))))

(declare-fun b!1069623 () Bool)

(assert (=> b!1069623 (= e!610448 (and e!610449 mapRes!40234))))

(declare-fun condMapEmpty!40234 () Bool)

(declare-fun mapDefault!40234 () ValueCell!12141)

(assert (=> b!1069623 (= condMapEmpty!40234 (= (arr!32876 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12141)) mapDefault!40234)))))

(assert (= (and start!94596 res!713654) b!1069618))

(assert (= (and b!1069618 res!713652) b!1069619))

(assert (= (and b!1069619 res!713651) b!1069617))

(assert (= (and b!1069617 res!713653) b!1069620))

(assert (= (and b!1069623 condMapEmpty!40234) mapIsEmpty!40234))

(assert (= (and b!1069623 (not condMapEmpty!40234)) mapNonEmpty!40234))

(get-info :version)

(assert (= (and mapNonEmpty!40234 ((_ is ValueCellFull!12141) mapValue!40234)) b!1069621))

(assert (= (and b!1069623 ((_ is ValueCellFull!12141) mapDefault!40234)) b!1069622))

(assert (= start!94596 b!1069623))

(declare-fun m!988101 () Bool)

(assert (=> mapNonEmpty!40234 m!988101))

(declare-fun m!988103 () Bool)

(assert (=> b!1069619 m!988103))

(declare-fun m!988105 () Bool)

(assert (=> b!1069617 m!988105))

(declare-fun m!988107 () Bool)

(assert (=> b!1069620 m!988107))

(declare-fun m!988109 () Bool)

(assert (=> b!1069620 m!988109))

(declare-fun m!988111 () Bool)

(assert (=> b!1069620 m!988111))

(declare-fun m!988113 () Bool)

(assert (=> start!94596 m!988113))

(declare-fun m!988115 () Bool)

(assert (=> start!94596 m!988115))

(declare-fun m!988117 () Bool)

(assert (=> start!94596 m!988117))

(check-sat (not mapNonEmpty!40234) (not start!94596) tp_is_empty!25689 (not b_next!21879) (not b!1069617) b_and!34691 (not b!1069620) (not b!1069619))
(check-sat b_and!34691 (not b_next!21879))
