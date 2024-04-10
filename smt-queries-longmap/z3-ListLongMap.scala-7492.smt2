; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94926 () Bool)

(assert start!94926)

(declare-fun b_free!22131 () Bool)

(declare-fun b_next!22131 () Bool)

(assert (=> start!94926 (= b_free!22131 (not b_next!22131))))

(declare-fun tp!77857 () Bool)

(declare-fun b_and!34985 () Bool)

(assert (=> start!94926 (= tp!77857 b_and!34985)))

(declare-fun b!1073321 () Bool)

(declare-fun res!715874 () Bool)

(declare-fun e!613178 () Bool)

(assert (=> b!1073321 (=> (not res!715874) (not e!613178))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39723 0))(
  ( (V!39724 (val!13021 Int)) )
))
(declare-datatypes ((ValueCell!12267 0))(
  ( (ValueCellFull!12267 (v!15639 V!39723)) (EmptyCell!12267) )
))
(declare-datatypes ((array!68845 0))(
  ( (array!68846 (arr!33116 (Array (_ BitVec 32) ValueCell!12267)) (size!33652 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68845)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68847 0))(
  ( (array!68848 (arr!33117 (Array (_ BitVec 32) (_ BitVec 64))) (size!33653 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68847)

(assert (=> b!1073321 (= res!715874 (and (= (size!33652 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33653 _keys!1163) (size!33652 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!40624 () Bool)

(declare-fun mapRes!40624 () Bool)

(assert (=> mapIsEmpty!40624 mapRes!40624))

(declare-fun res!715875 () Bool)

(assert (=> start!94926 (=> (not res!715875) (not e!613178))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94926 (= res!715875 (validMask!0 mask!1515))))

(assert (=> start!94926 e!613178))

(assert (=> start!94926 true))

(declare-fun tp_is_empty!25941 () Bool)

(assert (=> start!94926 tp_is_empty!25941))

(declare-fun e!613174 () Bool)

(declare-fun array_inv!25594 (array!68845) Bool)

(assert (=> start!94926 (and (array_inv!25594 _values!955) e!613174)))

(assert (=> start!94926 tp!77857))

(declare-fun array_inv!25595 (array!68847) Bool)

(assert (=> start!94926 (array_inv!25595 _keys!1163)))

(declare-fun b!1073322 () Bool)

(declare-fun e!613175 () Bool)

(assert (=> b!1073322 (= e!613175 tp_is_empty!25941)))

(declare-fun b!1073323 () Bool)

(assert (=> b!1073323 (= e!613178 false)))

(declare-fun minValue!907 () V!39723)

(declare-datatypes ((tuple2!16578 0))(
  ( (tuple2!16579 (_1!8300 (_ BitVec 64)) (_2!8300 V!39723)) )
))
(declare-datatypes ((List!23116 0))(
  ( (Nil!23113) (Cons!23112 (h!24321 tuple2!16578) (t!32453 List!23116)) )
))
(declare-datatypes ((ListLongMap!14547 0))(
  ( (ListLongMap!14548 (toList!7289 List!23116)) )
))
(declare-fun lt!476014 () ListLongMap!14547)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39723)

(declare-fun getCurrentListMapNoExtraKeys!3853 (array!68847 array!68845 (_ BitVec 32) (_ BitVec 32) V!39723 V!39723 (_ BitVec 32) Int) ListLongMap!14547)

(assert (=> b!1073323 (= lt!476014 (getCurrentListMapNoExtraKeys!3853 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39723)

(declare-fun lt!476013 () ListLongMap!14547)

(assert (=> b!1073323 (= lt!476013 (getCurrentListMapNoExtraKeys!3853 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073324 () Bool)

(assert (=> b!1073324 (= e!613174 (and e!613175 mapRes!40624))))

(declare-fun condMapEmpty!40624 () Bool)

(declare-fun mapDefault!40624 () ValueCell!12267)

(assert (=> b!1073324 (= condMapEmpty!40624 (= (arr!33116 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12267)) mapDefault!40624)))))

(declare-fun mapNonEmpty!40624 () Bool)

(declare-fun tp!77858 () Bool)

(declare-fun e!613177 () Bool)

(assert (=> mapNonEmpty!40624 (= mapRes!40624 (and tp!77858 e!613177))))

(declare-fun mapValue!40624 () ValueCell!12267)

(declare-fun mapKey!40624 () (_ BitVec 32))

(declare-fun mapRest!40624 () (Array (_ BitVec 32) ValueCell!12267))

(assert (=> mapNonEmpty!40624 (= (arr!33116 _values!955) (store mapRest!40624 mapKey!40624 mapValue!40624))))

(declare-fun b!1073325 () Bool)

(declare-fun res!715873 () Bool)

(assert (=> b!1073325 (=> (not res!715873) (not e!613178))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68847 (_ BitVec 32)) Bool)

(assert (=> b!1073325 (= res!715873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1073326 () Bool)

(declare-fun res!715876 () Bool)

(assert (=> b!1073326 (=> (not res!715876) (not e!613178))))

(declare-datatypes ((List!23117 0))(
  ( (Nil!23114) (Cons!23113 (h!24322 (_ BitVec 64)) (t!32454 List!23117)) )
))
(declare-fun arrayNoDuplicates!0 (array!68847 (_ BitVec 32) List!23117) Bool)

(assert (=> b!1073326 (= res!715876 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23114))))

(declare-fun b!1073327 () Bool)

(assert (=> b!1073327 (= e!613177 tp_is_empty!25941)))

(assert (= (and start!94926 res!715875) b!1073321))

(assert (= (and b!1073321 res!715874) b!1073325))

(assert (= (and b!1073325 res!715873) b!1073326))

(assert (= (and b!1073326 res!715876) b!1073323))

(assert (= (and b!1073324 condMapEmpty!40624) mapIsEmpty!40624))

(assert (= (and b!1073324 (not condMapEmpty!40624)) mapNonEmpty!40624))

(get-info :version)

(assert (= (and mapNonEmpty!40624 ((_ is ValueCellFull!12267) mapValue!40624)) b!1073327))

(assert (= (and b!1073324 ((_ is ValueCellFull!12267) mapDefault!40624)) b!1073322))

(assert (= start!94926 b!1073324))

(declare-fun m!992335 () Bool)

(assert (=> mapNonEmpty!40624 m!992335))

(declare-fun m!992337 () Bool)

(assert (=> start!94926 m!992337))

(declare-fun m!992339 () Bool)

(assert (=> start!94926 m!992339))

(declare-fun m!992341 () Bool)

(assert (=> start!94926 m!992341))

(declare-fun m!992343 () Bool)

(assert (=> b!1073326 m!992343))

(declare-fun m!992345 () Bool)

(assert (=> b!1073323 m!992345))

(declare-fun m!992347 () Bool)

(assert (=> b!1073323 m!992347))

(declare-fun m!992349 () Bool)

(assert (=> b!1073325 m!992349))

(check-sat b_and!34985 (not b!1073326) (not b_next!22131) (not b!1073323) tp_is_empty!25941 (not b!1073325) (not mapNonEmpty!40624) (not start!94926))
(check-sat b_and!34985 (not b_next!22131))
