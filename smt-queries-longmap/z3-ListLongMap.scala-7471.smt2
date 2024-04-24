; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94986 () Bool)

(assert start!94986)

(declare-fun b_free!22003 () Bool)

(declare-fun b_next!22003 () Bool)

(assert (=> start!94986 (= b_free!22003 (not b_next!22003))))

(declare-fun tp!77468 () Bool)

(declare-fun b_and!34843 () Bool)

(assert (=> start!94986 (= tp!77468 b_and!34843)))

(declare-fun b!1072672 () Bool)

(declare-fun res!715201 () Bool)

(declare-fun e!612579 () Bool)

(assert (=> b!1072672 (=> (not res!715201) (not e!612579))))

(declare-datatypes ((array!68639 0))(
  ( (array!68640 (arr!33009 (Array (_ BitVec 32) (_ BitVec 64))) (size!33546 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68639)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68639 (_ BitVec 32)) Bool)

(assert (=> b!1072672 (= res!715201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1072673 () Bool)

(declare-fun res!715204 () Bool)

(assert (=> b!1072673 (=> (not res!715204) (not e!612579))))

(declare-datatypes ((List!23021 0))(
  ( (Nil!23018) (Cons!23017 (h!24235 (_ BitVec 64)) (t!32346 List!23021)) )
))
(declare-fun arrayNoDuplicates!0 (array!68639 (_ BitVec 32) List!23021) Bool)

(assert (=> b!1072673 (= res!715204 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23018))))

(declare-fun b!1072674 () Bool)

(declare-fun e!612575 () Bool)

(assert (=> b!1072674 (= e!612575 true)))

(declare-datatypes ((V!39553 0))(
  ( (V!39554 (val!12957 Int)) )
))
(declare-datatypes ((tuple2!16462 0))(
  ( (tuple2!16463 (_1!8242 (_ BitVec 64)) (_2!8242 V!39553)) )
))
(declare-datatypes ((List!23022 0))(
  ( (Nil!23019) (Cons!23018 (h!24236 tuple2!16462) (t!32347 List!23022)) )
))
(declare-datatypes ((ListLongMap!14439 0))(
  ( (ListLongMap!14440 (toList!7235 List!23022)) )
))
(declare-fun lt!474460 () ListLongMap!14439)

(declare-fun lt!474466 () ListLongMap!14439)

(declare-fun -!670 (ListLongMap!14439 (_ BitVec 64)) ListLongMap!14439)

(assert (=> b!1072674 (= lt!474460 (-!670 lt!474466 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!474457 () ListLongMap!14439)

(declare-fun lt!474467 () ListLongMap!14439)

(assert (=> b!1072674 (= lt!474457 lt!474467)))

(declare-fun zeroValueBefore!47 () V!39553)

(declare-datatypes ((Unit!35257 0))(
  ( (Unit!35258) )
))
(declare-fun lt!474465 () Unit!35257)

(declare-fun minValue!907 () V!39553)

(declare-fun lt!474468 () ListLongMap!14439)

(declare-fun addCommutativeForDiffKeys!727 (ListLongMap!14439 (_ BitVec 64) V!39553 (_ BitVec 64) V!39553) Unit!35257)

(assert (=> b!1072674 (= lt!474465 (addCommutativeForDiffKeys!727 lt!474468 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!474463 () ListLongMap!14439)

(assert (=> b!1072674 (= (-!670 lt!474467 #b0000000000000000000000000000000000000000000000000000000000000000) lt!474463)))

(declare-fun lt!474461 () tuple2!16462)

(declare-fun +!3198 (ListLongMap!14439 tuple2!16462) ListLongMap!14439)

(assert (=> b!1072674 (= lt!474467 (+!3198 lt!474463 lt!474461))))

(declare-fun lt!474469 () Unit!35257)

(declare-fun addThenRemoveForNewKeyIsSame!45 (ListLongMap!14439 (_ BitVec 64) V!39553) Unit!35257)

(assert (=> b!1072674 (= lt!474469 (addThenRemoveForNewKeyIsSame!45 lt!474463 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!474464 () tuple2!16462)

(assert (=> b!1072674 (= lt!474463 (+!3198 lt!474468 lt!474464))))

(declare-fun e!612577 () Bool)

(assert (=> b!1072674 e!612577))

(declare-fun res!715200 () Bool)

(assert (=> b!1072674 (=> (not res!715200) (not e!612577))))

(assert (=> b!1072674 (= res!715200 (= lt!474466 lt!474457))))

(assert (=> b!1072674 (= lt!474457 (+!3198 (+!3198 lt!474468 lt!474461) lt!474464))))

(assert (=> b!1072674 (= lt!474464 (tuple2!16463 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1072674 (= lt!474461 (tuple2!16463 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!474462 () ListLongMap!14439)

(declare-datatypes ((ValueCell!12203 0))(
  ( (ValueCellFull!12203 (v!15569 V!39553)) (EmptyCell!12203) )
))
(declare-datatypes ((array!68641 0))(
  ( (array!68642 (arr!33010 (Array (_ BitVec 32) ValueCell!12203)) (size!33547 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68641)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39553)

(declare-fun getCurrentListMap!4131 (array!68639 array!68641 (_ BitVec 32) (_ BitVec 32) V!39553 V!39553 (_ BitVec 32) Int) ListLongMap!14439)

(assert (=> b!1072674 (= lt!474462 (getCurrentListMap!4131 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1072674 (= lt!474466 (getCurrentListMap!4131 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!474458 () ListLongMap!14439)

(declare-fun b!1072675 () Bool)

(assert (=> b!1072675 (= e!612577 (= lt!474462 (+!3198 lt!474458 lt!474464)))))

(declare-fun b!1072676 () Bool)

(declare-fun res!715199 () Bool)

(assert (=> b!1072676 (=> (not res!715199) (not e!612579))))

(assert (=> b!1072676 (= res!715199 (and (= (size!33547 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33546 _keys!1163) (size!33547 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1072677 () Bool)

(declare-fun e!612580 () Bool)

(declare-fun e!612576 () Bool)

(declare-fun mapRes!40426 () Bool)

(assert (=> b!1072677 (= e!612580 (and e!612576 mapRes!40426))))

(declare-fun condMapEmpty!40426 () Bool)

(declare-fun mapDefault!40426 () ValueCell!12203)

(assert (=> b!1072677 (= condMapEmpty!40426 (= (arr!33010 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12203)) mapDefault!40426)))))

(declare-fun mapIsEmpty!40426 () Bool)

(assert (=> mapIsEmpty!40426 mapRes!40426))

(declare-fun b!1072678 () Bool)

(declare-fun tp_is_empty!25813 () Bool)

(assert (=> b!1072678 (= e!612576 tp_is_empty!25813)))

(declare-fun res!715202 () Bool)

(assert (=> start!94986 (=> (not res!715202) (not e!612579))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94986 (= res!715202 (validMask!0 mask!1515))))

(assert (=> start!94986 e!612579))

(assert (=> start!94986 true))

(assert (=> start!94986 tp_is_empty!25813))

(declare-fun array_inv!25554 (array!68641) Bool)

(assert (=> start!94986 (and (array_inv!25554 _values!955) e!612580)))

(assert (=> start!94986 tp!77468))

(declare-fun array_inv!25555 (array!68639) Bool)

(assert (=> start!94986 (array_inv!25555 _keys!1163)))

(declare-fun mapNonEmpty!40426 () Bool)

(declare-fun tp!77467 () Bool)

(declare-fun e!612578 () Bool)

(assert (=> mapNonEmpty!40426 (= mapRes!40426 (and tp!77467 e!612578))))

(declare-fun mapRest!40426 () (Array (_ BitVec 32) ValueCell!12203))

(declare-fun mapValue!40426 () ValueCell!12203)

(declare-fun mapKey!40426 () (_ BitVec 32))

(assert (=> mapNonEmpty!40426 (= (arr!33010 _values!955) (store mapRest!40426 mapKey!40426 mapValue!40426))))

(declare-fun b!1072679 () Bool)

(assert (=> b!1072679 (= e!612579 (not e!612575))))

(declare-fun res!715203 () Bool)

(assert (=> b!1072679 (=> res!715203 e!612575)))

(assert (=> b!1072679 (= res!715203 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1072679 (= lt!474468 lt!474458)))

(declare-fun lt!474459 () Unit!35257)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!845 (array!68639 array!68641 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39553 V!39553 V!39553 V!39553 (_ BitVec 32) Int) Unit!35257)

(assert (=> b!1072679 (= lt!474459 (lemmaNoChangeToArrayThenSameMapNoExtras!845 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3842 (array!68639 array!68641 (_ BitVec 32) (_ BitVec 32) V!39553 V!39553 (_ BitVec 32) Int) ListLongMap!14439)

(assert (=> b!1072679 (= lt!474458 (getCurrentListMapNoExtraKeys!3842 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072679 (= lt!474468 (getCurrentListMapNoExtraKeys!3842 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072680 () Bool)

(assert (=> b!1072680 (= e!612578 tp_is_empty!25813)))

(assert (= (and start!94986 res!715202) b!1072676))

(assert (= (and b!1072676 res!715199) b!1072672))

(assert (= (and b!1072672 res!715201) b!1072673))

(assert (= (and b!1072673 res!715204) b!1072679))

(assert (= (and b!1072679 (not res!715203)) b!1072674))

(assert (= (and b!1072674 res!715200) b!1072675))

(assert (= (and b!1072677 condMapEmpty!40426) mapIsEmpty!40426))

(assert (= (and b!1072677 (not condMapEmpty!40426)) mapNonEmpty!40426))

(get-info :version)

(assert (= (and mapNonEmpty!40426 ((_ is ValueCellFull!12203) mapValue!40426)) b!1072680))

(assert (= (and b!1072677 ((_ is ValueCellFull!12203) mapDefault!40426)) b!1072678))

(assert (= start!94986 b!1072677))

(declare-fun m!991481 () Bool)

(assert (=> mapNonEmpty!40426 m!991481))

(declare-fun m!991483 () Bool)

(assert (=> b!1072679 m!991483))

(declare-fun m!991485 () Bool)

(assert (=> b!1072679 m!991485))

(declare-fun m!991487 () Bool)

(assert (=> b!1072679 m!991487))

(declare-fun m!991489 () Bool)

(assert (=> b!1072673 m!991489))

(declare-fun m!991491 () Bool)

(assert (=> b!1072674 m!991491))

(declare-fun m!991493 () Bool)

(assert (=> b!1072674 m!991493))

(declare-fun m!991495 () Bool)

(assert (=> b!1072674 m!991495))

(declare-fun m!991497 () Bool)

(assert (=> b!1072674 m!991497))

(declare-fun m!991499 () Bool)

(assert (=> b!1072674 m!991499))

(declare-fun m!991501 () Bool)

(assert (=> b!1072674 m!991501))

(assert (=> b!1072674 m!991493))

(declare-fun m!991503 () Bool)

(assert (=> b!1072674 m!991503))

(declare-fun m!991505 () Bool)

(assert (=> b!1072674 m!991505))

(declare-fun m!991507 () Bool)

(assert (=> b!1072674 m!991507))

(declare-fun m!991509 () Bool)

(assert (=> b!1072674 m!991509))

(declare-fun m!991511 () Bool)

(assert (=> start!94986 m!991511))

(declare-fun m!991513 () Bool)

(assert (=> start!94986 m!991513))

(declare-fun m!991515 () Bool)

(assert (=> start!94986 m!991515))

(declare-fun m!991517 () Bool)

(assert (=> b!1072675 m!991517))

(declare-fun m!991519 () Bool)

(assert (=> b!1072672 m!991519))

(check-sat (not b!1072674) (not b_next!22003) (not mapNonEmpty!40426) b_and!34843 (not b!1072672) (not b!1072675) (not b!1072679) tp_is_empty!25813 (not start!94986) (not b!1072673))
(check-sat b_and!34843 (not b_next!22003))
