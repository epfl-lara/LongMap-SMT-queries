; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94992 () Bool)

(assert start!94992)

(declare-fun b_free!22009 () Bool)

(declare-fun b_next!22009 () Bool)

(assert (=> start!94992 (= b_free!22009 (not b_next!22009))))

(declare-fun tp!77486 () Bool)

(declare-fun b_and!34849 () Bool)

(assert (=> start!94992 (= tp!77486 b_and!34849)))

(declare-fun b!1072753 () Bool)

(declare-fun e!612643 () Bool)

(assert (=> b!1072753 (= e!612643 true)))

(declare-datatypes ((V!39561 0))(
  ( (V!39562 (val!12960 Int)) )
))
(declare-datatypes ((tuple2!16468 0))(
  ( (tuple2!16469 (_1!8245 (_ BitVec 64)) (_2!8245 V!39561)) )
))
(declare-datatypes ((List!23027 0))(
  ( (Nil!23024) (Cons!23023 (h!24241 tuple2!16468) (t!32352 List!23027)) )
))
(declare-datatypes ((ListLongMap!14445 0))(
  ( (ListLongMap!14446 (toList!7238 List!23027)) )
))
(declare-fun lt!474586 () ListLongMap!14445)

(declare-fun lt!474584 () ListLongMap!14445)

(declare-fun -!672 (ListLongMap!14445 (_ BitVec 64)) ListLongMap!14445)

(assert (=> b!1072753 (= lt!474586 (-!672 lt!474584 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!474581 () ListLongMap!14445)

(declare-fun lt!474576 () ListLongMap!14445)

(assert (=> b!1072753 (= lt!474581 lt!474576)))

(declare-fun zeroValueBefore!47 () V!39561)

(declare-datatypes ((Unit!35261 0))(
  ( (Unit!35262) )
))
(declare-fun lt!474582 () Unit!35261)

(declare-fun minValue!907 () V!39561)

(declare-fun lt!474580 () ListLongMap!14445)

(declare-fun addCommutativeForDiffKeys!729 (ListLongMap!14445 (_ BitVec 64) V!39561 (_ BitVec 64) V!39561) Unit!35261)

(assert (=> b!1072753 (= lt!474582 (addCommutativeForDiffKeys!729 lt!474580 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!474583 () ListLongMap!14445)

(assert (=> b!1072753 (= (-!672 lt!474576 #b0000000000000000000000000000000000000000000000000000000000000000) lt!474583)))

(declare-fun lt!474579 () tuple2!16468)

(declare-fun +!3201 (ListLongMap!14445 tuple2!16468) ListLongMap!14445)

(assert (=> b!1072753 (= lt!474576 (+!3201 lt!474583 lt!474579))))

(declare-fun lt!474577 () Unit!35261)

(declare-fun addThenRemoveForNewKeyIsSame!47 (ListLongMap!14445 (_ BitVec 64) V!39561) Unit!35261)

(assert (=> b!1072753 (= lt!474577 (addThenRemoveForNewKeyIsSame!47 lt!474583 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!474578 () tuple2!16468)

(assert (=> b!1072753 (= lt!474583 (+!3201 lt!474580 lt!474578))))

(declare-fun e!612642 () Bool)

(assert (=> b!1072753 e!612642))

(declare-fun res!715258 () Bool)

(assert (=> b!1072753 (=> (not res!715258) (not e!612642))))

(assert (=> b!1072753 (= res!715258 (= lt!474584 lt!474581))))

(assert (=> b!1072753 (= lt!474581 (+!3201 (+!3201 lt!474580 lt!474579) lt!474578))))

(assert (=> b!1072753 (= lt!474578 (tuple2!16469 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1072753 (= lt!474579 (tuple2!16469 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun lt!474585 () ListLongMap!14445)

(declare-datatypes ((ValueCell!12206 0))(
  ( (ValueCellFull!12206 (v!15572 V!39561)) (EmptyCell!12206) )
))
(declare-datatypes ((array!68651 0))(
  ( (array!68652 (arr!33015 (Array (_ BitVec 32) ValueCell!12206)) (size!33552 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68651)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39561)

(declare-datatypes ((array!68653 0))(
  ( (array!68654 (arr!33016 (Array (_ BitVec 32) (_ BitVec 64))) (size!33553 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68653)

(declare-fun getCurrentListMap!4133 (array!68653 array!68651 (_ BitVec 32) (_ BitVec 32) V!39561 V!39561 (_ BitVec 32) Int) ListLongMap!14445)

(assert (=> b!1072753 (= lt!474585 (getCurrentListMap!4133 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1072753 (= lt!474584 (getCurrentListMap!4133 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40435 () Bool)

(declare-fun mapRes!40435 () Bool)

(assert (=> mapIsEmpty!40435 mapRes!40435))

(declare-fun b!1072754 () Bool)

(declare-fun res!715255 () Bool)

(declare-fun e!612644 () Bool)

(assert (=> b!1072754 (=> (not res!715255) (not e!612644))))

(assert (=> b!1072754 (= res!715255 (and (= (size!33552 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33553 _keys!1163) (size!33552 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1072755 () Bool)

(declare-fun e!612638 () Bool)

(declare-fun tp_is_empty!25819 () Bool)

(assert (=> b!1072755 (= e!612638 tp_is_empty!25819)))

(declare-fun b!1072756 () Bool)

(declare-fun e!612641 () Bool)

(declare-fun e!612640 () Bool)

(assert (=> b!1072756 (= e!612641 (and e!612640 mapRes!40435))))

(declare-fun condMapEmpty!40435 () Bool)

(declare-fun mapDefault!40435 () ValueCell!12206)

(assert (=> b!1072756 (= condMapEmpty!40435 (= (arr!33015 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12206)) mapDefault!40435)))))

(declare-fun lt!474575 () ListLongMap!14445)

(declare-fun b!1072757 () Bool)

(assert (=> b!1072757 (= e!612642 (= lt!474585 (+!3201 lt!474575 lt!474578)))))

(declare-fun b!1072758 () Bool)

(assert (=> b!1072758 (= e!612644 (not e!612643))))

(declare-fun res!715253 () Bool)

(assert (=> b!1072758 (=> res!715253 e!612643)))

(assert (=> b!1072758 (= res!715253 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1072758 (= lt!474580 lt!474575)))

(declare-fun lt!474574 () Unit!35261)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!847 (array!68653 array!68651 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39561 V!39561 V!39561 V!39561 (_ BitVec 32) Int) Unit!35261)

(assert (=> b!1072758 (= lt!474574 (lemmaNoChangeToArrayThenSameMapNoExtras!847 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3844 (array!68653 array!68651 (_ BitVec 32) (_ BitVec 32) V!39561 V!39561 (_ BitVec 32) Int) ListLongMap!14445)

(assert (=> b!1072758 (= lt!474575 (getCurrentListMapNoExtraKeys!3844 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072758 (= lt!474580 (getCurrentListMapNoExtraKeys!3844 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40435 () Bool)

(declare-fun tp!77485 () Bool)

(assert (=> mapNonEmpty!40435 (= mapRes!40435 (and tp!77485 e!612638))))

(declare-fun mapKey!40435 () (_ BitVec 32))

(declare-fun mapRest!40435 () (Array (_ BitVec 32) ValueCell!12206))

(declare-fun mapValue!40435 () ValueCell!12206)

(assert (=> mapNonEmpty!40435 (= (arr!33015 _values!955) (store mapRest!40435 mapKey!40435 mapValue!40435))))

(declare-fun b!1072760 () Bool)

(declare-fun res!715254 () Bool)

(assert (=> b!1072760 (=> (not res!715254) (not e!612644))))

(declare-datatypes ((List!23028 0))(
  ( (Nil!23025) (Cons!23024 (h!24242 (_ BitVec 64)) (t!32353 List!23028)) )
))
(declare-fun arrayNoDuplicates!0 (array!68653 (_ BitVec 32) List!23028) Bool)

(assert (=> b!1072760 (= res!715254 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23025))))

(declare-fun b!1072761 () Bool)

(declare-fun res!715257 () Bool)

(assert (=> b!1072761 (=> (not res!715257) (not e!612644))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68653 (_ BitVec 32)) Bool)

(assert (=> b!1072761 (= res!715257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1072759 () Bool)

(assert (=> b!1072759 (= e!612640 tp_is_empty!25819)))

(declare-fun res!715256 () Bool)

(assert (=> start!94992 (=> (not res!715256) (not e!612644))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94992 (= res!715256 (validMask!0 mask!1515))))

(assert (=> start!94992 e!612644))

(assert (=> start!94992 true))

(assert (=> start!94992 tp_is_empty!25819))

(declare-fun array_inv!25558 (array!68651) Bool)

(assert (=> start!94992 (and (array_inv!25558 _values!955) e!612641)))

(assert (=> start!94992 tp!77486))

(declare-fun array_inv!25559 (array!68653) Bool)

(assert (=> start!94992 (array_inv!25559 _keys!1163)))

(assert (= (and start!94992 res!715256) b!1072754))

(assert (= (and b!1072754 res!715255) b!1072761))

(assert (= (and b!1072761 res!715257) b!1072760))

(assert (= (and b!1072760 res!715254) b!1072758))

(assert (= (and b!1072758 (not res!715253)) b!1072753))

(assert (= (and b!1072753 res!715258) b!1072757))

(assert (= (and b!1072756 condMapEmpty!40435) mapIsEmpty!40435))

(assert (= (and b!1072756 (not condMapEmpty!40435)) mapNonEmpty!40435))

(get-info :version)

(assert (= (and mapNonEmpty!40435 ((_ is ValueCellFull!12206) mapValue!40435)) b!1072755))

(assert (= (and b!1072756 ((_ is ValueCellFull!12206) mapDefault!40435)) b!1072759))

(assert (= start!94992 b!1072756))

(declare-fun m!991601 () Bool)

(assert (=> b!1072761 m!991601))

(declare-fun m!991603 () Bool)

(assert (=> b!1072753 m!991603))

(declare-fun m!991605 () Bool)

(assert (=> b!1072753 m!991605))

(declare-fun m!991607 () Bool)

(assert (=> b!1072753 m!991607))

(assert (=> b!1072753 m!991605))

(declare-fun m!991609 () Bool)

(assert (=> b!1072753 m!991609))

(declare-fun m!991611 () Bool)

(assert (=> b!1072753 m!991611))

(declare-fun m!991613 () Bool)

(assert (=> b!1072753 m!991613))

(declare-fun m!991615 () Bool)

(assert (=> b!1072753 m!991615))

(declare-fun m!991617 () Bool)

(assert (=> b!1072753 m!991617))

(declare-fun m!991619 () Bool)

(assert (=> b!1072753 m!991619))

(declare-fun m!991621 () Bool)

(assert (=> b!1072753 m!991621))

(declare-fun m!991623 () Bool)

(assert (=> mapNonEmpty!40435 m!991623))

(declare-fun m!991625 () Bool)

(assert (=> b!1072760 m!991625))

(declare-fun m!991627 () Bool)

(assert (=> b!1072758 m!991627))

(declare-fun m!991629 () Bool)

(assert (=> b!1072758 m!991629))

(declare-fun m!991631 () Bool)

(assert (=> b!1072758 m!991631))

(declare-fun m!991633 () Bool)

(assert (=> start!94992 m!991633))

(declare-fun m!991635 () Bool)

(assert (=> start!94992 m!991635))

(declare-fun m!991637 () Bool)

(assert (=> start!94992 m!991637))

(declare-fun m!991639 () Bool)

(assert (=> b!1072757 m!991639))

(check-sat (not b!1072753) (not b!1072760) (not b!1072758) (not b!1072761) (not b!1072757) b_and!34849 tp_is_empty!25819 (not start!94992) (not mapNonEmpty!40435) (not b_next!22009))
(check-sat b_and!34849 (not b_next!22009))
