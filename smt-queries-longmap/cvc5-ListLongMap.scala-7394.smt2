; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94140 () Bool)

(assert start!94140)

(declare-fun b_free!21541 () Bool)

(declare-fun b_next!21541 () Bool)

(assert (=> start!94140 (= b_free!21541 (not b_next!21541))))

(declare-fun tp!76058 () Bool)

(declare-fun b_and!34291 () Bool)

(assert (=> start!94140 (= tp!76058 b_and!34291)))

(declare-fun b!1064588 () Bool)

(declare-fun res!710686 () Bool)

(declare-fun e!606763 () Bool)

(assert (=> b!1064588 (=> (not res!710686) (not e!606763))))

(declare-datatypes ((array!67691 0))(
  ( (array!67692 (arr!32549 (Array (_ BitVec 32) (_ BitVec 64))) (size!33085 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67691)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67691 (_ BitVec 32)) Bool)

(assert (=> b!1064588 (= res!710686 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39709 () Bool)

(declare-fun mapRes!39709 () Bool)

(declare-fun tp!76057 () Bool)

(declare-fun e!606764 () Bool)

(assert (=> mapNonEmpty!39709 (= mapRes!39709 (and tp!76057 e!606764))))

(declare-datatypes ((V!38937 0))(
  ( (V!38938 (val!12726 Int)) )
))
(declare-datatypes ((ValueCell!11972 0))(
  ( (ValueCellFull!11972 (v!15338 V!38937)) (EmptyCell!11972) )
))
(declare-fun mapValue!39709 () ValueCell!11972)

(declare-fun mapRest!39709 () (Array (_ BitVec 32) ValueCell!11972))

(declare-fun mapKey!39709 () (_ BitVec 32))

(declare-datatypes ((array!67693 0))(
  ( (array!67694 (arr!32550 (Array (_ BitVec 32) ValueCell!11972)) (size!33086 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67693)

(assert (=> mapNonEmpty!39709 (= (arr!32550 _values!955) (store mapRest!39709 mapKey!39709 mapValue!39709))))

(declare-fun b!1064589 () Bool)

(declare-fun res!710685 () Bool)

(assert (=> b!1064589 (=> (not res!710685) (not e!606763))))

(declare-datatypes ((List!22690 0))(
  ( (Nil!22687) (Cons!22686 (h!23895 (_ BitVec 64)) (t!32007 List!22690)) )
))
(declare-fun arrayNoDuplicates!0 (array!67691 (_ BitVec 32) List!22690) Bool)

(assert (=> b!1064589 (= res!710685 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22687))))

(declare-fun b!1064590 () Bool)

(declare-fun res!710687 () Bool)

(assert (=> b!1064590 (=> (not res!710687) (not e!606763))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1064590 (= res!710687 (and (= (size!33086 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33085 _keys!1163) (size!33086 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!39709 () Bool)

(assert (=> mapIsEmpty!39709 mapRes!39709))

(declare-fun res!710683 () Bool)

(assert (=> start!94140 (=> (not res!710683) (not e!606763))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94140 (= res!710683 (validMask!0 mask!1515))))

(assert (=> start!94140 e!606763))

(assert (=> start!94140 true))

(declare-fun tp_is_empty!25351 () Bool)

(assert (=> start!94140 tp_is_empty!25351))

(declare-fun e!606761 () Bool)

(declare-fun array_inv!25204 (array!67693) Bool)

(assert (=> start!94140 (and (array_inv!25204 _values!955) e!606761)))

(assert (=> start!94140 tp!76058))

(declare-fun array_inv!25205 (array!67691) Bool)

(assert (=> start!94140 (array_inv!25205 _keys!1163)))

(declare-fun b!1064591 () Bool)

(declare-fun e!606765 () Bool)

(assert (=> b!1064591 (= e!606765 tp_is_empty!25351)))

(declare-fun b!1064592 () Bool)

(declare-fun e!606766 () Bool)

(assert (=> b!1064592 (= e!606766 true)))

(declare-fun zeroValueBefore!47 () V!38937)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38937)

(declare-datatypes ((tuple2!16118 0))(
  ( (tuple2!16119 (_1!8070 (_ BitVec 64)) (_2!8070 V!38937)) )
))
(declare-datatypes ((List!22691 0))(
  ( (Nil!22688) (Cons!22687 (h!23896 tuple2!16118) (t!32008 List!22691)) )
))
(declare-datatypes ((ListLongMap!14087 0))(
  ( (ListLongMap!14088 (toList!7059 List!22691)) )
))
(declare-fun lt!469276 () ListLongMap!14087)

(declare-fun getCurrentListMap!4019 (array!67691 array!67693 (_ BitVec 32) (_ BitVec 32) V!38937 V!38937 (_ BitVec 32) Int) ListLongMap!14087)

(assert (=> b!1064592 (= lt!469276 (getCurrentListMap!4019 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064593 () Bool)

(assert (=> b!1064593 (= e!606763 (not e!606766))))

(declare-fun res!710684 () Bool)

(assert (=> b!1064593 (=> res!710684 e!606766)))

(assert (=> b!1064593 (= res!710684 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!469274 () ListLongMap!14087)

(declare-fun lt!469277 () ListLongMap!14087)

(assert (=> b!1064593 (= lt!469274 lt!469277)))

(declare-datatypes ((Unit!34916 0))(
  ( (Unit!34917) )
))
(declare-fun lt!469275 () Unit!34916)

(declare-fun zeroValueAfter!47 () V!38937)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!687 (array!67691 array!67693 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38937 V!38937 V!38937 V!38937 (_ BitVec 32) Int) Unit!34916)

(assert (=> b!1064593 (= lt!469275 (lemmaNoChangeToArrayThenSameMapNoExtras!687 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3650 (array!67691 array!67693 (_ BitVec 32) (_ BitVec 32) V!38937 V!38937 (_ BitVec 32) Int) ListLongMap!14087)

(assert (=> b!1064593 (= lt!469277 (getCurrentListMapNoExtraKeys!3650 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064593 (= lt!469274 (getCurrentListMapNoExtraKeys!3650 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064594 () Bool)

(assert (=> b!1064594 (= e!606761 (and e!606765 mapRes!39709))))

(declare-fun condMapEmpty!39709 () Bool)

(declare-fun mapDefault!39709 () ValueCell!11972)

