; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94842 () Bool)

(assert start!94842)

(declare-fun b_free!22071 () Bool)

(declare-fun b_next!22071 () Bool)

(assert (=> start!94842 (= b_free!22071 (not b_next!22071))))

(declare-fun tp!77675 () Bool)

(declare-fun b_and!34913 () Bool)

(assert (=> start!94842 (= tp!77675 b_and!34913)))

(declare-datatypes ((V!39643 0))(
  ( (V!39644 (val!12991 Int)) )
))
(declare-datatypes ((tuple2!16546 0))(
  ( (tuple2!16547 (_1!8284 (_ BitVec 64)) (_2!8284 V!39643)) )
))
(declare-fun lt!475426 () tuple2!16546)

(declare-fun e!612558 () Bool)

(declare-datatypes ((List!23080 0))(
  ( (Nil!23077) (Cons!23076 (h!24285 tuple2!16546) (t!32415 List!23080)) )
))
(declare-datatypes ((ListLongMap!14515 0))(
  ( (ListLongMap!14516 (toList!7273 List!23080)) )
))
(declare-fun lt!475430 () ListLongMap!14515)

(declare-fun b!1072455 () Bool)

(declare-fun lt!475429 () ListLongMap!14515)

(declare-fun +!3207 (ListLongMap!14515 tuple2!16546) ListLongMap!14515)

(assert (=> b!1072455 (= e!612558 (= lt!475429 (+!3207 lt!475430 lt!475426)))))

(declare-fun b!1072456 () Bool)

(declare-fun res!715382 () Bool)

(declare-fun e!612559 () Bool)

(assert (=> b!1072456 (=> (not res!715382) (not e!612559))))

(declare-datatypes ((array!68731 0))(
  ( (array!68732 (arr!33060 (Array (_ BitVec 32) (_ BitVec 64))) (size!33596 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68731)

(declare-datatypes ((List!23081 0))(
  ( (Nil!23078) (Cons!23077 (h!24286 (_ BitVec 64)) (t!32416 List!23081)) )
))
(declare-fun arrayNoDuplicates!0 (array!68731 (_ BitVec 32) List!23081) Bool)

(assert (=> b!1072456 (= res!715382 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23078))))

(declare-fun b!1072457 () Bool)

(declare-fun e!612561 () Bool)

(declare-fun e!612560 () Bool)

(declare-fun mapRes!40531 () Bool)

(assert (=> b!1072457 (= e!612561 (and e!612560 mapRes!40531))))

(declare-fun condMapEmpty!40531 () Bool)

(declare-datatypes ((ValueCell!12237 0))(
  ( (ValueCellFull!12237 (v!15608 V!39643)) (EmptyCell!12237) )
))
(declare-datatypes ((array!68733 0))(
  ( (array!68734 (arr!33061 (Array (_ BitVec 32) ValueCell!12237)) (size!33597 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68733)

(declare-fun mapDefault!40531 () ValueCell!12237)

(assert (=> b!1072457 (= condMapEmpty!40531 (= (arr!33061 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12237)) mapDefault!40531)))))

(declare-fun mapNonEmpty!40531 () Bool)

(declare-fun tp!77674 () Bool)

(declare-fun e!612562 () Bool)

(assert (=> mapNonEmpty!40531 (= mapRes!40531 (and tp!77674 e!612562))))

(declare-fun mapKey!40531 () (_ BitVec 32))

(declare-fun mapRest!40531 () (Array (_ BitVec 32) ValueCell!12237))

(declare-fun mapValue!40531 () ValueCell!12237)

(assert (=> mapNonEmpty!40531 (= (arr!33061 _values!955) (store mapRest!40531 mapKey!40531 mapValue!40531))))

(declare-fun res!715383 () Bool)

(assert (=> start!94842 (=> (not res!715383) (not e!612559))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94842 (= res!715383 (validMask!0 mask!1515))))

(assert (=> start!94842 e!612559))

(assert (=> start!94842 true))

(declare-fun tp_is_empty!25881 () Bool)

(assert (=> start!94842 tp_is_empty!25881))

(declare-fun array_inv!25558 (array!68733) Bool)

(assert (=> start!94842 (and (array_inv!25558 _values!955) e!612561)))

(assert (=> start!94842 tp!77675))

(declare-fun array_inv!25559 (array!68731) Bool)

(assert (=> start!94842 (array_inv!25559 _keys!1163)))

(declare-fun b!1072458 () Bool)

(declare-fun e!612557 () Bool)

(assert (=> b!1072458 (= e!612557 true)))

(declare-fun lt!475431 () ListLongMap!14515)

(declare-fun lt!475432 () ListLongMap!14515)

(declare-fun -!701 (ListLongMap!14515 (_ BitVec 64)) ListLongMap!14515)

(assert (=> b!1072458 (= lt!475431 (-!701 lt!475432 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!475428 () ListLongMap!14515)

(declare-fun lt!475427 () ListLongMap!14515)

(assert (=> b!1072458 (= lt!475428 lt!475427)))

(declare-fun lt!475434 () ListLongMap!14515)

(declare-fun zeroValueBefore!47 () V!39643)

(declare-datatypes ((Unit!35340 0))(
  ( (Unit!35341) )
))
(declare-fun lt!475436 () Unit!35340)

(declare-fun minValue!907 () V!39643)

(declare-fun addCommutativeForDiffKeys!746 (ListLongMap!14515 (_ BitVec 64) V!39643 (_ BitVec 64) V!39643) Unit!35340)

(assert (=> b!1072458 (= lt!475436 (addCommutativeForDiffKeys!746 lt!475434 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!475425 () ListLongMap!14515)

(assert (=> b!1072458 (= (-!701 lt!475427 #b0000000000000000000000000000000000000000000000000000000000000000) lt!475425)))

(declare-fun lt!475435 () tuple2!16546)

(assert (=> b!1072458 (= lt!475427 (+!3207 lt!475425 lt!475435))))

(declare-fun lt!475437 () Unit!35340)

(declare-fun addThenRemoveForNewKeyIsSame!71 (ListLongMap!14515 (_ BitVec 64) V!39643) Unit!35340)

(assert (=> b!1072458 (= lt!475437 (addThenRemoveForNewKeyIsSame!71 lt!475425 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1072458 (= lt!475425 (+!3207 lt!475434 lt!475426))))

(assert (=> b!1072458 e!612558))

(declare-fun res!715384 () Bool)

(assert (=> b!1072458 (=> (not res!715384) (not e!612558))))

(assert (=> b!1072458 (= res!715384 (= lt!475432 lt!475428))))

(assert (=> b!1072458 (= lt!475428 (+!3207 (+!3207 lt!475434 lt!475435) lt!475426))))

(assert (=> b!1072458 (= lt!475426 (tuple2!16547 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1072458 (= lt!475435 (tuple2!16547 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39643)

(declare-fun getCurrentListMap!4167 (array!68731 array!68733 (_ BitVec 32) (_ BitVec 32) V!39643 V!39643 (_ BitVec 32) Int) ListLongMap!14515)

(assert (=> b!1072458 (= lt!475429 (getCurrentListMap!4167 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1072458 (= lt!475432 (getCurrentListMap!4167 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072459 () Bool)

(assert (=> b!1072459 (= e!612560 tp_is_empty!25881)))

(declare-fun mapIsEmpty!40531 () Bool)

(assert (=> mapIsEmpty!40531 mapRes!40531))

(declare-fun b!1072460 () Bool)

(assert (=> b!1072460 (= e!612562 tp_is_empty!25881)))

(declare-fun b!1072461 () Bool)

(assert (=> b!1072461 (= e!612559 (not e!612557))))

(declare-fun res!715379 () Bool)

(assert (=> b!1072461 (=> res!715379 e!612557)))

(assert (=> b!1072461 (= res!715379 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1072461 (= lt!475434 lt!475430)))

(declare-fun lt!475433 () Unit!35340)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!874 (array!68731 array!68733 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39643 V!39643 V!39643 V!39643 (_ BitVec 32) Int) Unit!35340)

(assert (=> b!1072461 (= lt!475433 (lemmaNoChangeToArrayThenSameMapNoExtras!874 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3837 (array!68731 array!68733 (_ BitVec 32) (_ BitVec 32) V!39643 V!39643 (_ BitVec 32) Int) ListLongMap!14515)

(assert (=> b!1072461 (= lt!475430 (getCurrentListMapNoExtraKeys!3837 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072461 (= lt!475434 (getCurrentListMapNoExtraKeys!3837 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072462 () Bool)

(declare-fun res!715380 () Bool)

(assert (=> b!1072462 (=> (not res!715380) (not e!612559))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68731 (_ BitVec 32)) Bool)

(assert (=> b!1072462 (= res!715380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1072463 () Bool)

(declare-fun res!715381 () Bool)

(assert (=> b!1072463 (=> (not res!715381) (not e!612559))))

(assert (=> b!1072463 (= res!715381 (and (= (size!33597 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33596 _keys!1163) (size!33597 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94842 res!715383) b!1072463))

(assert (= (and b!1072463 res!715381) b!1072462))

(assert (= (and b!1072462 res!715380) b!1072456))

(assert (= (and b!1072456 res!715382) b!1072461))

(assert (= (and b!1072461 (not res!715379)) b!1072458))

(assert (= (and b!1072458 res!715384) b!1072455))

(assert (= (and b!1072457 condMapEmpty!40531) mapIsEmpty!40531))

(assert (= (and b!1072457 (not condMapEmpty!40531)) mapNonEmpty!40531))

(get-info :version)

(assert (= (and mapNonEmpty!40531 ((_ is ValueCellFull!12237) mapValue!40531)) b!1072460))

(assert (= (and b!1072457 ((_ is ValueCellFull!12237) mapDefault!40531)) b!1072459))

(assert (= start!94842 b!1072457))

(declare-fun m!991413 () Bool)

(assert (=> start!94842 m!991413))

(declare-fun m!991415 () Bool)

(assert (=> start!94842 m!991415))

(declare-fun m!991417 () Bool)

(assert (=> start!94842 m!991417))

(declare-fun m!991419 () Bool)

(assert (=> mapNonEmpty!40531 m!991419))

(declare-fun m!991421 () Bool)

(assert (=> b!1072456 m!991421))

(declare-fun m!991423 () Bool)

(assert (=> b!1072461 m!991423))

(declare-fun m!991425 () Bool)

(assert (=> b!1072461 m!991425))

(declare-fun m!991427 () Bool)

(assert (=> b!1072461 m!991427))

(declare-fun m!991429 () Bool)

(assert (=> b!1072458 m!991429))

(declare-fun m!991431 () Bool)

(assert (=> b!1072458 m!991431))

(declare-fun m!991433 () Bool)

(assert (=> b!1072458 m!991433))

(assert (=> b!1072458 m!991429))

(declare-fun m!991435 () Bool)

(assert (=> b!1072458 m!991435))

(declare-fun m!991437 () Bool)

(assert (=> b!1072458 m!991437))

(declare-fun m!991439 () Bool)

(assert (=> b!1072458 m!991439))

(declare-fun m!991441 () Bool)

(assert (=> b!1072458 m!991441))

(declare-fun m!991443 () Bool)

(assert (=> b!1072458 m!991443))

(declare-fun m!991445 () Bool)

(assert (=> b!1072458 m!991445))

(declare-fun m!991447 () Bool)

(assert (=> b!1072458 m!991447))

(declare-fun m!991449 () Bool)

(assert (=> b!1072462 m!991449))

(declare-fun m!991451 () Bool)

(assert (=> b!1072455 m!991451))

(check-sat (not b!1072456) (not b!1072455) (not b!1072462) (not b_next!22071) tp_is_empty!25881 (not mapNonEmpty!40531) b_and!34913 (not b!1072461) (not start!94842) (not b!1072458))
(check-sat b_and!34913 (not b_next!22071))
