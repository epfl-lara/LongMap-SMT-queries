; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93890 () Bool)

(assert start!93890)

(declare-fun b_free!21355 () Bool)

(declare-fun b_next!21355 () Bool)

(assert (=> start!93890 (= b_free!21355 (not b_next!21355))))

(declare-fun tp!75490 () Bool)

(declare-fun b_and!34051 () Bool)

(assert (=> start!93890 (= tp!75490 b_and!34051)))

(declare-fun b!1061723 () Bool)

(declare-fun res!708987 () Bool)

(declare-fun e!604659 () Bool)

(assert (=> b!1061723 (=> (not res!708987) (not e!604659))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38689 0))(
  ( (V!38690 (val!12633 Int)) )
))
(declare-datatypes ((ValueCell!11879 0))(
  ( (ValueCellFull!11879 (v!15242 V!38689)) (EmptyCell!11879) )
))
(declare-datatypes ((array!67282 0))(
  ( (array!67283 (arr!32348 (Array (_ BitVec 32) ValueCell!11879)) (size!32886 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67282)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67284 0))(
  ( (array!67285 (arr!32349 (Array (_ BitVec 32) (_ BitVec 64))) (size!32887 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67284)

(assert (=> b!1061723 (= res!708987 (and (= (size!32886 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32887 _keys!1163) (size!32886 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1061724 () Bool)

(declare-fun e!604662 () Bool)

(declare-fun tp_is_empty!25165 () Bool)

(assert (=> b!1061724 (= e!604662 tp_is_empty!25165)))

(declare-fun mapIsEmpty!39421 () Bool)

(declare-fun mapRes!39421 () Bool)

(assert (=> mapIsEmpty!39421 mapRes!39421))

(declare-fun b!1061725 () Bool)

(declare-fun e!604658 () Bool)

(assert (=> b!1061725 (= e!604658 true)))

(declare-fun zeroValueBefore!47 () V!38689)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38689)

(declare-fun lt!467591 () Bool)

(declare-datatypes ((tuple2!16040 0))(
  ( (tuple2!16041 (_1!8031 (_ BitVec 64)) (_2!8031 V!38689)) )
))
(declare-datatypes ((List!22595 0))(
  ( (Nil!22592) (Cons!22591 (h!23800 tuple2!16040) (t!31897 List!22595)) )
))
(declare-datatypes ((ListLongMap!14009 0))(
  ( (ListLongMap!14010 (toList!7020 List!22595)) )
))
(declare-fun contains!6190 (ListLongMap!14009 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3922 (array!67284 array!67282 (_ BitVec 32) (_ BitVec 32) V!38689 V!38689 (_ BitVec 32) Int) ListLongMap!14009)

(assert (=> b!1061725 (= lt!467591 (contains!6190 (getCurrentListMap!3922 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!708986 () Bool)

(assert (=> start!93890 (=> (not res!708986) (not e!604659))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93890 (= res!708986 (validMask!0 mask!1515))))

(assert (=> start!93890 e!604659))

(assert (=> start!93890 true))

(assert (=> start!93890 tp_is_empty!25165))

(declare-fun e!604661 () Bool)

(declare-fun array_inv!25060 (array!67282) Bool)

(assert (=> start!93890 (and (array_inv!25060 _values!955) e!604661)))

(assert (=> start!93890 tp!75490))

(declare-fun array_inv!25061 (array!67284) Bool)

(assert (=> start!93890 (array_inv!25061 _keys!1163)))

(declare-fun b!1061726 () Bool)

(assert (=> b!1061726 (= e!604661 (and e!604662 mapRes!39421))))

(declare-fun condMapEmpty!39421 () Bool)

(declare-fun mapDefault!39421 () ValueCell!11879)

(assert (=> b!1061726 (= condMapEmpty!39421 (= (arr!32348 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11879)) mapDefault!39421)))))

(declare-fun mapNonEmpty!39421 () Bool)

(declare-fun tp!75491 () Bool)

(declare-fun e!604663 () Bool)

(assert (=> mapNonEmpty!39421 (= mapRes!39421 (and tp!75491 e!604663))))

(declare-fun mapValue!39421 () ValueCell!11879)

(declare-fun mapKey!39421 () (_ BitVec 32))

(declare-fun mapRest!39421 () (Array (_ BitVec 32) ValueCell!11879))

(assert (=> mapNonEmpty!39421 (= (arr!32348 _values!955) (store mapRest!39421 mapKey!39421 mapValue!39421))))

(declare-fun b!1061727 () Bool)

(assert (=> b!1061727 (= e!604663 tp_is_empty!25165)))

(declare-fun b!1061728 () Bool)

(declare-fun res!708988 () Bool)

(assert (=> b!1061728 (=> (not res!708988) (not e!604659))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67284 (_ BitVec 32)) Bool)

(assert (=> b!1061728 (= res!708988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1061729 () Bool)

(declare-fun res!708985 () Bool)

(assert (=> b!1061729 (=> (not res!708985) (not e!604659))))

(declare-datatypes ((List!22596 0))(
  ( (Nil!22593) (Cons!22592 (h!23801 (_ BitVec 64)) (t!31898 List!22596)) )
))
(declare-fun arrayNoDuplicates!0 (array!67284 (_ BitVec 32) List!22596) Bool)

(assert (=> b!1061729 (= res!708985 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22593))))

(declare-fun b!1061730 () Bool)

(assert (=> b!1061730 (= e!604659 (not e!604658))))

(declare-fun res!708989 () Bool)

(assert (=> b!1061730 (=> res!708989 e!604658)))

(assert (=> b!1061730 (= res!708989 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!467590 () ListLongMap!14009)

(declare-fun lt!467589 () ListLongMap!14009)

(assert (=> b!1061730 (= lt!467590 lt!467589)))

(declare-datatypes ((Unit!34639 0))(
  ( (Unit!34640) )
))
(declare-fun lt!467592 () Unit!34639)

(declare-fun zeroValueAfter!47 () V!38689)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!631 (array!67284 array!67282 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38689 V!38689 V!38689 V!38689 (_ BitVec 32) Int) Unit!34639)

(assert (=> b!1061730 (= lt!467592 (lemmaNoChangeToArrayThenSameMapNoExtras!631 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3637 (array!67284 array!67282 (_ BitVec 32) (_ BitVec 32) V!38689 V!38689 (_ BitVec 32) Int) ListLongMap!14009)

(assert (=> b!1061730 (= lt!467589 (getCurrentListMapNoExtraKeys!3637 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1061730 (= lt!467590 (getCurrentListMapNoExtraKeys!3637 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!93890 res!708986) b!1061723))

(assert (= (and b!1061723 res!708987) b!1061728))

(assert (= (and b!1061728 res!708988) b!1061729))

(assert (= (and b!1061729 res!708985) b!1061730))

(assert (= (and b!1061730 (not res!708989)) b!1061725))

(assert (= (and b!1061726 condMapEmpty!39421) mapIsEmpty!39421))

(assert (= (and b!1061726 (not condMapEmpty!39421)) mapNonEmpty!39421))

(get-info :version)

(assert (= (and mapNonEmpty!39421 ((_ is ValueCellFull!11879) mapValue!39421)) b!1061727))

(assert (= (and b!1061726 ((_ is ValueCellFull!11879) mapDefault!39421)) b!1061724))

(assert (= start!93890 b!1061726))

(declare-fun m!980029 () Bool)

(assert (=> start!93890 m!980029))

(declare-fun m!980031 () Bool)

(assert (=> start!93890 m!980031))

(declare-fun m!980033 () Bool)

(assert (=> start!93890 m!980033))

(declare-fun m!980035 () Bool)

(assert (=> b!1061730 m!980035))

(declare-fun m!980037 () Bool)

(assert (=> b!1061730 m!980037))

(declare-fun m!980039 () Bool)

(assert (=> b!1061730 m!980039))

(declare-fun m!980041 () Bool)

(assert (=> b!1061728 m!980041))

(declare-fun m!980043 () Bool)

(assert (=> b!1061725 m!980043))

(assert (=> b!1061725 m!980043))

(declare-fun m!980045 () Bool)

(assert (=> b!1061725 m!980045))

(declare-fun m!980047 () Bool)

(assert (=> b!1061729 m!980047))

(declare-fun m!980049 () Bool)

(assert (=> mapNonEmpty!39421 m!980049))

(check-sat b_and!34051 (not b!1061725) (not b!1061729) tp_is_empty!25165 (not b_next!21355) (not start!93890) (not b!1061730) (not mapNonEmpty!39421) (not b!1061728))
(check-sat b_and!34051 (not b_next!21355))
