; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94702 () Bool)

(assert start!94702)

(declare-fun b_free!21793 () Bool)

(declare-fun b_next!21793 () Bool)

(assert (=> start!94702 (= b_free!21793 (not b_next!21793))))

(declare-fun tp!76825 () Bool)

(declare-fun b_and!34595 () Bool)

(assert (=> start!94702 (= tp!76825 b_and!34595)))

(declare-fun b!1069533 () Bool)

(declare-fun e!610268 () Bool)

(declare-fun tp_is_empty!25603 () Bool)

(assert (=> b!1069533 (= e!610268 tp_is_empty!25603)))

(declare-fun b!1069534 () Bool)

(declare-fun res!713341 () Bool)

(declare-fun e!610270 () Bool)

(assert (=> b!1069534 (=> (not res!713341) (not e!610270))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39273 0))(
  ( (V!39274 (val!12852 Int)) )
))
(declare-datatypes ((ValueCell!12098 0))(
  ( (ValueCellFull!12098 (v!15462 V!39273)) (EmptyCell!12098) )
))
(declare-datatypes ((array!68233 0))(
  ( (array!68234 (arr!32810 (Array (_ BitVec 32) ValueCell!12098)) (size!33347 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68233)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68235 0))(
  ( (array!68236 (arr!32811 (Array (_ BitVec 32) (_ BitVec 64))) (size!33348 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68235)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1069534 (= res!713341 (and (= (size!33347 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33348 _keys!1163) (size!33347 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1069535 () Bool)

(declare-fun res!713345 () Bool)

(assert (=> b!1069535 (=> (not res!713345) (not e!610270))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68235 (_ BitVec 32)) Bool)

(assert (=> b!1069535 (= res!713345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1069536 () Bool)

(declare-fun res!713342 () Bool)

(assert (=> b!1069536 (=> (not res!713342) (not e!610270))))

(declare-datatypes ((List!22869 0))(
  ( (Nil!22866) (Cons!22865 (h!24083 (_ BitVec 64)) (t!32186 List!22869)) )
))
(declare-fun arrayNoDuplicates!0 (array!68235 (_ BitVec 32) List!22869) Bool)

(assert (=> b!1069536 (= res!713342 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22866))))

(declare-fun res!713344 () Bool)

(assert (=> start!94702 (=> (not res!713344) (not e!610270))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94702 (= res!713344 (validMask!0 mask!1515))))

(assert (=> start!94702 e!610270))

(assert (=> start!94702 true))

(assert (=> start!94702 tp_is_empty!25603))

(declare-fun e!610267 () Bool)

(declare-fun array_inv!25420 (array!68233) Bool)

(assert (=> start!94702 (and (array_inv!25420 _values!955) e!610267)))

(assert (=> start!94702 tp!76825))

(declare-fun array_inv!25421 (array!68235) Bool)

(assert (=> start!94702 (array_inv!25421 _keys!1163)))

(declare-fun b!1069537 () Bool)

(declare-fun e!610266 () Bool)

(assert (=> b!1069537 (= e!610270 (not e!610266))))

(declare-fun res!713343 () Bool)

(assert (=> b!1069537 (=> res!713343 e!610266)))

(assert (=> b!1069537 (= res!713343 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!16300 0))(
  ( (tuple2!16301 (_1!8161 (_ BitVec 64)) (_2!8161 V!39273)) )
))
(declare-datatypes ((List!22870 0))(
  ( (Nil!22867) (Cons!22866 (h!24084 tuple2!16300) (t!32187 List!22870)) )
))
(declare-datatypes ((ListLongMap!14277 0))(
  ( (ListLongMap!14278 (toList!7154 List!22870)) )
))
(declare-fun lt!472376 () ListLongMap!14277)

(declare-fun lt!472373 () ListLongMap!14277)

(assert (=> b!1069537 (= lt!472376 lt!472373)))

(declare-fun zeroValueBefore!47 () V!39273)

(declare-fun minValue!907 () V!39273)

(declare-datatypes ((Unit!35102 0))(
  ( (Unit!35103) )
))
(declare-fun lt!472374 () Unit!35102)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39273)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!773 (array!68235 array!68233 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39273 V!39273 V!39273 V!39273 (_ BitVec 32) Int) Unit!35102)

(assert (=> b!1069537 (= lt!472374 (lemmaNoChangeToArrayThenSameMapNoExtras!773 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3770 (array!68235 array!68233 (_ BitVec 32) (_ BitVec 32) V!39273 V!39273 (_ BitVec 32) Int) ListLongMap!14277)

(assert (=> b!1069537 (= lt!472373 (getCurrentListMapNoExtraKeys!3770 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069537 (= lt!472376 (getCurrentListMapNoExtraKeys!3770 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069538 () Bool)

(declare-fun e!610264 () Bool)

(assert (=> b!1069538 (= e!610266 e!610264)))

(declare-fun res!713346 () Bool)

(assert (=> b!1069538 (=> res!713346 e!610264)))

(declare-fun lt!472375 () ListLongMap!14277)

(declare-fun contains!6315 (ListLongMap!14277 (_ BitVec 64)) Bool)

(assert (=> b!1069538 (= res!713346 (contains!6315 lt!472375 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4078 (array!68235 array!68233 (_ BitVec 32) (_ BitVec 32) V!39273 V!39273 (_ BitVec 32) Int) ListLongMap!14277)

(assert (=> b!1069538 (= lt!472375 (getCurrentListMap!4078 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069539 () Bool)

(declare-fun e!610269 () Bool)

(declare-fun mapRes!40099 () Bool)

(assert (=> b!1069539 (= e!610267 (and e!610269 mapRes!40099))))

(declare-fun condMapEmpty!40099 () Bool)

(declare-fun mapDefault!40099 () ValueCell!12098)

(assert (=> b!1069539 (= condMapEmpty!40099 (= (arr!32810 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12098)) mapDefault!40099)))))

(declare-fun b!1069540 () Bool)

(assert (=> b!1069540 (= e!610269 tp_is_empty!25603)))

(declare-fun b!1069541 () Bool)

(assert (=> b!1069541 (= e!610264 true)))

(declare-fun -!639 (ListLongMap!14277 (_ BitVec 64)) ListLongMap!14277)

(assert (=> b!1069541 (= (-!639 lt!472375 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472375)))

(declare-fun lt!472377 () Unit!35102)

(declare-fun removeNotPresentStillSame!56 (ListLongMap!14277 (_ BitVec 64)) Unit!35102)

(assert (=> b!1069541 (= lt!472377 (removeNotPresentStillSame!56 lt!472375 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!40099 () Bool)

(assert (=> mapIsEmpty!40099 mapRes!40099))

(declare-fun mapNonEmpty!40099 () Bool)

(declare-fun tp!76826 () Bool)

(assert (=> mapNonEmpty!40099 (= mapRes!40099 (and tp!76826 e!610268))))

(declare-fun mapKey!40099 () (_ BitVec 32))

(declare-fun mapValue!40099 () ValueCell!12098)

(declare-fun mapRest!40099 () (Array (_ BitVec 32) ValueCell!12098))

(assert (=> mapNonEmpty!40099 (= (arr!32810 _values!955) (store mapRest!40099 mapKey!40099 mapValue!40099))))

(assert (= (and start!94702 res!713344) b!1069534))

(assert (= (and b!1069534 res!713341) b!1069535))

(assert (= (and b!1069535 res!713345) b!1069536))

(assert (= (and b!1069536 res!713342) b!1069537))

(assert (= (and b!1069537 (not res!713343)) b!1069538))

(assert (= (and b!1069538 (not res!713346)) b!1069541))

(assert (= (and b!1069539 condMapEmpty!40099) mapIsEmpty!40099))

(assert (= (and b!1069539 (not condMapEmpty!40099)) mapNonEmpty!40099))

(get-info :version)

(assert (= (and mapNonEmpty!40099 ((_ is ValueCellFull!12098) mapValue!40099)) b!1069533))

(assert (= (and b!1069539 ((_ is ValueCellFull!12098) mapDefault!40099)) b!1069540))

(assert (= start!94702 b!1069539))

(declare-fun m!988483 () Bool)

(assert (=> mapNonEmpty!40099 m!988483))

(declare-fun m!988485 () Bool)

(assert (=> b!1069538 m!988485))

(declare-fun m!988487 () Bool)

(assert (=> b!1069538 m!988487))

(declare-fun m!988489 () Bool)

(assert (=> b!1069537 m!988489))

(declare-fun m!988491 () Bool)

(assert (=> b!1069537 m!988491))

(declare-fun m!988493 () Bool)

(assert (=> b!1069537 m!988493))

(declare-fun m!988495 () Bool)

(assert (=> start!94702 m!988495))

(declare-fun m!988497 () Bool)

(assert (=> start!94702 m!988497))

(declare-fun m!988499 () Bool)

(assert (=> start!94702 m!988499))

(declare-fun m!988501 () Bool)

(assert (=> b!1069536 m!988501))

(declare-fun m!988503 () Bool)

(assert (=> b!1069535 m!988503))

(declare-fun m!988505 () Bool)

(assert (=> b!1069541 m!988505))

(declare-fun m!988507 () Bool)

(assert (=> b!1069541 m!988507))

(check-sat tp_is_empty!25603 (not start!94702) (not mapNonEmpty!40099) (not b!1069538) (not b!1069536) (not b!1069535) (not b!1069537) b_and!34595 (not b!1069541) (not b_next!21793))
(check-sat b_and!34595 (not b_next!21793))
