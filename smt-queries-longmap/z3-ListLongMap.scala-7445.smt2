; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94778 () Bool)

(assert start!94778)

(declare-fun b_free!21847 () Bool)

(declare-fun b_next!21847 () Bool)

(assert (=> start!94778 (= b_free!21847 (not b_next!21847))))

(declare-fun tp!76990 () Bool)

(declare-fun b_and!34659 () Bool)

(assert (=> start!94778 (= tp!76990 b_and!34659)))

(declare-fun b!1070419 () Bool)

(declare-fun e!610937 () Bool)

(declare-fun e!610936 () Bool)

(assert (=> b!1070419 (= e!610937 e!610936)))

(declare-fun res!713892 () Bool)

(assert (=> b!1070419 (=> res!713892 e!610936)))

(declare-datatypes ((V!39345 0))(
  ( (V!39346 (val!12879 Int)) )
))
(declare-datatypes ((tuple2!16346 0))(
  ( (tuple2!16347 (_1!8184 (_ BitVec 64)) (_2!8184 V!39345)) )
))
(declare-datatypes ((List!22912 0))(
  ( (Nil!22909) (Cons!22908 (h!24126 tuple2!16346) (t!32231 List!22912)) )
))
(declare-datatypes ((ListLongMap!14323 0))(
  ( (ListLongMap!14324 (toList!7177 List!22912)) )
))
(declare-fun lt!472904 () ListLongMap!14323)

(declare-fun contains!6336 (ListLongMap!14323 (_ BitVec 64)) Bool)

(assert (=> b!1070419 (= res!713892 (contains!6336 lt!472904 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39345)

(declare-datatypes ((ValueCell!12125 0))(
  ( (ValueCellFull!12125 (v!15490 V!39345)) (EmptyCell!12125) )
))
(declare-datatypes ((array!68337 0))(
  ( (array!68338 (arr!32861 (Array (_ BitVec 32) ValueCell!12125)) (size!33398 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68337)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39345)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68339 0))(
  ( (array!68340 (arr!32862 (Array (_ BitVec 32) (_ BitVec 64))) (size!33399 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68339)

(declare-fun getCurrentListMap!4098 (array!68339 array!68337 (_ BitVec 32) (_ BitVec 32) V!39345 V!39345 (_ BitVec 32) Int) ListLongMap!14323)

(assert (=> b!1070419 (= lt!472904 (getCurrentListMap!4098 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070420 () Bool)

(declare-fun res!713893 () Bool)

(declare-fun e!610934 () Bool)

(assert (=> b!1070420 (=> (not res!713893) (not e!610934))))

(declare-datatypes ((List!22913 0))(
  ( (Nil!22910) (Cons!22909 (h!24127 (_ BitVec 64)) (t!32232 List!22913)) )
))
(declare-fun arrayNoDuplicates!0 (array!68339 (_ BitVec 32) List!22913) Bool)

(assert (=> b!1070420 (= res!713893 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22910))))

(declare-fun b!1070421 () Bool)

(declare-fun res!713889 () Bool)

(assert (=> b!1070421 (=> (not res!713889) (not e!610934))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1070421 (= res!713889 (and (= (size!33398 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33399 _keys!1163) (size!33398 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1070422 () Bool)

(declare-fun res!713890 () Bool)

(assert (=> b!1070422 (=> (not res!713890) (not e!610934))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68339 (_ BitVec 32)) Bool)

(assert (=> b!1070422 (= res!713890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!713891 () Bool)

(assert (=> start!94778 (=> (not res!713891) (not e!610934))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94778 (= res!713891 (validMask!0 mask!1515))))

(assert (=> start!94778 e!610934))

(assert (=> start!94778 true))

(declare-fun tp_is_empty!25657 () Bool)

(assert (=> start!94778 tp_is_empty!25657))

(declare-fun e!610931 () Bool)

(declare-fun array_inv!25456 (array!68337) Bool)

(assert (=> start!94778 (and (array_inv!25456 _values!955) e!610931)))

(assert (=> start!94778 tp!76990))

(declare-fun array_inv!25457 (array!68339) Bool)

(assert (=> start!94778 (array_inv!25457 _keys!1163)))

(declare-fun mapNonEmpty!40183 () Bool)

(declare-fun mapRes!40183 () Bool)

(declare-fun tp!76991 () Bool)

(declare-fun e!610932 () Bool)

(assert (=> mapNonEmpty!40183 (= mapRes!40183 (and tp!76991 e!610932))))

(declare-fun mapRest!40183 () (Array (_ BitVec 32) ValueCell!12125))

(declare-fun mapKey!40183 () (_ BitVec 32))

(declare-fun mapValue!40183 () ValueCell!12125)

(assert (=> mapNonEmpty!40183 (= (arr!32861 _values!955) (store mapRest!40183 mapKey!40183 mapValue!40183))))

(declare-fun mapIsEmpty!40183 () Bool)

(assert (=> mapIsEmpty!40183 mapRes!40183))

(declare-fun b!1070423 () Bool)

(declare-fun e!610933 () Bool)

(assert (=> b!1070423 (= e!610933 tp_is_empty!25657)))

(declare-fun b!1070424 () Bool)

(assert (=> b!1070424 (= e!610934 (not e!610937))))

(declare-fun res!713888 () Bool)

(assert (=> b!1070424 (=> res!713888 e!610937)))

(assert (=> b!1070424 (= res!713888 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!472902 () ListLongMap!14323)

(declare-fun lt!472903 () ListLongMap!14323)

(assert (=> b!1070424 (= lt!472902 lt!472903)))

(declare-datatypes ((Unit!35146 0))(
  ( (Unit!35147) )
))
(declare-fun lt!472906 () Unit!35146)

(declare-fun zeroValueAfter!47 () V!39345)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!792 (array!68339 array!68337 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39345 V!39345 V!39345 V!39345 (_ BitVec 32) Int) Unit!35146)

(assert (=> b!1070424 (= lt!472906 (lemmaNoChangeToArrayThenSameMapNoExtras!792 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3789 (array!68339 array!68337 (_ BitVec 32) (_ BitVec 32) V!39345 V!39345 (_ BitVec 32) Int) ListLongMap!14323)

(assert (=> b!1070424 (= lt!472903 (getCurrentListMapNoExtraKeys!3789 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070424 (= lt!472902 (getCurrentListMapNoExtraKeys!3789 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070425 () Bool)

(assert (=> b!1070425 (= e!610936 true)))

(declare-fun -!658 (ListLongMap!14323 (_ BitVec 64)) ListLongMap!14323)

(assert (=> b!1070425 (= (-!658 lt!472904 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472904)))

(declare-fun lt!472905 () Unit!35146)

(declare-fun removeNotPresentStillSame!75 (ListLongMap!14323 (_ BitVec 64)) Unit!35146)

(assert (=> b!1070425 (= lt!472905 (removeNotPresentStillSame!75 lt!472904 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1070426 () Bool)

(assert (=> b!1070426 (= e!610931 (and e!610933 mapRes!40183))))

(declare-fun condMapEmpty!40183 () Bool)

(declare-fun mapDefault!40183 () ValueCell!12125)

(assert (=> b!1070426 (= condMapEmpty!40183 (= (arr!32861 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12125)) mapDefault!40183)))))

(declare-fun b!1070427 () Bool)

(assert (=> b!1070427 (= e!610932 tp_is_empty!25657)))

(assert (= (and start!94778 res!713891) b!1070421))

(assert (= (and b!1070421 res!713889) b!1070422))

(assert (= (and b!1070422 res!713890) b!1070420))

(assert (= (and b!1070420 res!713893) b!1070424))

(assert (= (and b!1070424 (not res!713888)) b!1070419))

(assert (= (and b!1070419 (not res!713892)) b!1070425))

(assert (= (and b!1070426 condMapEmpty!40183) mapIsEmpty!40183))

(assert (= (and b!1070426 (not condMapEmpty!40183)) mapNonEmpty!40183))

(get-info :version)

(assert (= (and mapNonEmpty!40183 ((_ is ValueCellFull!12125) mapValue!40183)) b!1070427))

(assert (= (and b!1070426 ((_ is ValueCellFull!12125) mapDefault!40183)) b!1070423))

(assert (= start!94778 b!1070426))

(declare-fun m!989311 () Bool)

(assert (=> b!1070422 m!989311))

(declare-fun m!989313 () Bool)

(assert (=> b!1070420 m!989313))

(declare-fun m!989315 () Bool)

(assert (=> start!94778 m!989315))

(declare-fun m!989317 () Bool)

(assert (=> start!94778 m!989317))

(declare-fun m!989319 () Bool)

(assert (=> start!94778 m!989319))

(declare-fun m!989321 () Bool)

(assert (=> mapNonEmpty!40183 m!989321))

(declare-fun m!989323 () Bool)

(assert (=> b!1070419 m!989323))

(declare-fun m!989325 () Bool)

(assert (=> b!1070419 m!989325))

(declare-fun m!989327 () Bool)

(assert (=> b!1070425 m!989327))

(declare-fun m!989329 () Bool)

(assert (=> b!1070425 m!989329))

(declare-fun m!989331 () Bool)

(assert (=> b!1070424 m!989331))

(declare-fun m!989333 () Bool)

(assert (=> b!1070424 m!989333))

(declare-fun m!989335 () Bool)

(assert (=> b!1070424 m!989335))

(check-sat (not mapNonEmpty!40183) b_and!34659 (not b!1070425) (not start!94778) (not b_next!21847) (not b!1070419) (not b!1070420) tp_is_empty!25657 (not b!1070424) (not b!1070422))
(check-sat b_and!34659 (not b_next!21847))
