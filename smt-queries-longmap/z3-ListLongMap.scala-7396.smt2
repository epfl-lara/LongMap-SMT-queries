; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94146 () Bool)

(assert start!94146)

(declare-fun b_free!21553 () Bool)

(declare-fun b_next!21553 () Bool)

(assert (=> start!94146 (= b_free!21553 (not b_next!21553))))

(declare-fun tp!76094 () Bool)

(declare-fun b_and!34277 () Bool)

(assert (=> start!94146 (= tp!76094 b_and!34277)))

(declare-fun b!1064579 () Bool)

(declare-fun e!606779 () Bool)

(declare-fun tp_is_empty!25363 () Bool)

(assert (=> b!1064579 (= e!606779 tp_is_empty!25363)))

(declare-fun mapIsEmpty!39727 () Bool)

(declare-fun mapRes!39727 () Bool)

(assert (=> mapIsEmpty!39727 mapRes!39727))

(declare-fun b!1064580 () Bool)

(declare-fun res!710708 () Bool)

(declare-fun e!606776 () Bool)

(assert (=> b!1064580 (=> (not res!710708) (not e!606776))))

(declare-datatypes ((array!67660 0))(
  ( (array!67661 (arr!32534 (Array (_ BitVec 32) (_ BitVec 64))) (size!33072 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67660)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67660 (_ BitVec 32)) Bool)

(assert (=> b!1064580 (= res!710708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!710706 () Bool)

(assert (=> start!94146 (=> (not res!710706) (not e!606776))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94146 (= res!710706 (validMask!0 mask!1515))))

(assert (=> start!94146 e!606776))

(assert (=> start!94146 true))

(assert (=> start!94146 tp_is_empty!25363))

(declare-datatypes ((V!38953 0))(
  ( (V!38954 (val!12732 Int)) )
))
(declare-datatypes ((ValueCell!11978 0))(
  ( (ValueCellFull!11978 (v!15343 V!38953)) (EmptyCell!11978) )
))
(declare-datatypes ((array!67662 0))(
  ( (array!67663 (arr!32535 (Array (_ BitVec 32) ValueCell!11978)) (size!33073 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67662)

(declare-fun e!606777 () Bool)

(declare-fun array_inv!25198 (array!67662) Bool)

(assert (=> start!94146 (and (array_inv!25198 _values!955) e!606777)))

(assert (=> start!94146 tp!76094))

(declare-fun array_inv!25199 (array!67660) Bool)

(assert (=> start!94146 (array_inv!25199 _keys!1163)))

(declare-fun b!1064581 () Bool)

(declare-fun res!710705 () Bool)

(assert (=> b!1064581 (=> (not res!710705) (not e!606776))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1064581 (= res!710705 (and (= (size!33073 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33072 _keys!1163) (size!33073 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1064582 () Bool)

(assert (=> b!1064582 (= e!606777 (and e!606779 mapRes!39727))))

(declare-fun condMapEmpty!39727 () Bool)

(declare-fun mapDefault!39727 () ValueCell!11978)

(assert (=> b!1064582 (= condMapEmpty!39727 (= (arr!32535 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11978)) mapDefault!39727)))))

(declare-fun b!1064583 () Bool)

(declare-fun e!606778 () Bool)

(assert (=> b!1064583 (= e!606778 tp_is_empty!25363)))

(declare-fun b!1064584 () Bool)

(declare-fun e!606781 () Bool)

(assert (=> b!1064584 (= e!606776 (not e!606781))))

(declare-fun res!710704 () Bool)

(assert (=> b!1064584 (=> res!710704 e!606781)))

(assert (=> b!1064584 (= res!710704 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16188 0))(
  ( (tuple2!16189 (_1!8105 (_ BitVec 64)) (_2!8105 V!38953)) )
))
(declare-datatypes ((List!22738 0))(
  ( (Nil!22735) (Cons!22734 (h!23943 tuple2!16188) (t!32046 List!22738)) )
))
(declare-datatypes ((ListLongMap!14157 0))(
  ( (ListLongMap!14158 (toList!7094 List!22738)) )
))
(declare-fun lt!469146 () ListLongMap!14157)

(declare-fun lt!469149 () ListLongMap!14157)

(assert (=> b!1064584 (= lt!469146 lt!469149)))

(declare-fun zeroValueBefore!47 () V!38953)

(declare-fun minValue!907 () V!38953)

(declare-datatypes ((Unit!34779 0))(
  ( (Unit!34780) )
))
(declare-fun lt!469147 () Unit!34779)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38953)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!694 (array!67660 array!67662 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38953 V!38953 V!38953 V!38953 (_ BitVec 32) Int) Unit!34779)

(assert (=> b!1064584 (= lt!469147 (lemmaNoChangeToArrayThenSameMapNoExtras!694 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3700 (array!67660 array!67662 (_ BitVec 32) (_ BitVec 32) V!38953 V!38953 (_ BitVec 32) Int) ListLongMap!14157)

(assert (=> b!1064584 (= lt!469149 (getCurrentListMapNoExtraKeys!3700 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064584 (= lt!469146 (getCurrentListMapNoExtraKeys!3700 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39727 () Bool)

(declare-fun tp!76093 () Bool)

(assert (=> mapNonEmpty!39727 (= mapRes!39727 (and tp!76093 e!606778))))

(declare-fun mapValue!39727 () ValueCell!11978)

(declare-fun mapKey!39727 () (_ BitVec 32))

(declare-fun mapRest!39727 () (Array (_ BitVec 32) ValueCell!11978))

(assert (=> mapNonEmpty!39727 (= (arr!32535 _values!955) (store mapRest!39727 mapKey!39727 mapValue!39727))))

(declare-fun b!1064585 () Bool)

(declare-fun res!710707 () Bool)

(assert (=> b!1064585 (=> (not res!710707) (not e!606776))))

(declare-datatypes ((List!22739 0))(
  ( (Nil!22736) (Cons!22735 (h!23944 (_ BitVec 64)) (t!32047 List!22739)) )
))
(declare-fun arrayNoDuplicates!0 (array!67660 (_ BitVec 32) List!22739) Bool)

(assert (=> b!1064585 (= res!710707 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22736))))

(declare-fun b!1064586 () Bool)

(assert (=> b!1064586 (= e!606781 true)))

(declare-fun lt!469148 () ListLongMap!14157)

(declare-fun getCurrentListMap!3973 (array!67660 array!67662 (_ BitVec 32) (_ BitVec 32) V!38953 V!38953 (_ BitVec 32) Int) ListLongMap!14157)

(assert (=> b!1064586 (= lt!469148 (getCurrentListMap!3973 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94146 res!710706) b!1064581))

(assert (= (and b!1064581 res!710705) b!1064580))

(assert (= (and b!1064580 res!710708) b!1064585))

(assert (= (and b!1064585 res!710707) b!1064584))

(assert (= (and b!1064584 (not res!710704)) b!1064586))

(assert (= (and b!1064582 condMapEmpty!39727) mapIsEmpty!39727))

(assert (= (and b!1064582 (not condMapEmpty!39727)) mapNonEmpty!39727))

(get-info :version)

(assert (= (and mapNonEmpty!39727 ((_ is ValueCellFull!11978) mapValue!39727)) b!1064583))

(assert (= (and b!1064582 ((_ is ValueCellFull!11978) mapDefault!39727)) b!1064579))

(assert (= start!94146 b!1064582))

(declare-fun m!982603 () Bool)

(assert (=> b!1064580 m!982603))

(declare-fun m!982605 () Bool)

(assert (=> start!94146 m!982605))

(declare-fun m!982607 () Bool)

(assert (=> start!94146 m!982607))

(declare-fun m!982609 () Bool)

(assert (=> start!94146 m!982609))

(declare-fun m!982611 () Bool)

(assert (=> mapNonEmpty!39727 m!982611))

(declare-fun m!982613 () Bool)

(assert (=> b!1064584 m!982613))

(declare-fun m!982615 () Bool)

(assert (=> b!1064584 m!982615))

(declare-fun m!982617 () Bool)

(assert (=> b!1064584 m!982617))

(declare-fun m!982619 () Bool)

(assert (=> b!1064586 m!982619))

(declare-fun m!982621 () Bool)

(assert (=> b!1064585 m!982621))

(check-sat (not b!1064585) (not b_next!21553) (not b!1064580) (not mapNonEmpty!39727) (not b!1064584) b_and!34277 (not start!94146) (not b!1064586) tp_is_empty!25363)
(check-sat b_and!34277 (not b_next!21553))
