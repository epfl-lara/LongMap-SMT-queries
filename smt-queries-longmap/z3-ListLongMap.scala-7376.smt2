; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93990 () Bool)

(assert start!93990)

(declare-fun b_free!21433 () Bool)

(declare-fun b_next!21433 () Bool)

(assert (=> start!93990 (= b_free!21433 (not b_next!21433))))

(declare-fun tp!75727 () Bool)

(declare-fun b_and!34139 () Bool)

(assert (=> start!93990 (= tp!75727 b_and!34139)))

(declare-fun res!709742 () Bool)

(declare-fun e!605576 () Bool)

(assert (=> start!93990 (=> (not res!709742) (not e!605576))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93990 (= res!709742 (validMask!0 mask!1515))))

(assert (=> start!93990 e!605576))

(assert (=> start!93990 true))

(declare-fun tp_is_empty!25243 () Bool)

(assert (=> start!93990 tp_is_empty!25243))

(declare-datatypes ((V!38793 0))(
  ( (V!38794 (val!12672 Int)) )
))
(declare-datatypes ((ValueCell!11918 0))(
  ( (ValueCellFull!11918 (v!15282 V!38793)) (EmptyCell!11918) )
))
(declare-datatypes ((array!67430 0))(
  ( (array!67431 (arr!32421 (Array (_ BitVec 32) ValueCell!11918)) (size!32959 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67430)

(declare-fun e!605574 () Bool)

(declare-fun array_inv!25120 (array!67430) Bool)

(assert (=> start!93990 (and (array_inv!25120 _values!955) e!605574)))

(assert (=> start!93990 tp!75727))

(declare-datatypes ((array!67432 0))(
  ( (array!67433 (arr!32422 (Array (_ BitVec 32) (_ BitVec 64))) (size!32960 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67432)

(declare-fun array_inv!25121 (array!67432) Bool)

(assert (=> start!93990 (array_inv!25121 _keys!1163)))

(declare-fun b!1062926 () Bool)

(declare-fun res!709741 () Bool)

(assert (=> b!1062926 (=> (not res!709741) (not e!605576))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1062926 (= res!709741 (and (= (size!32959 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32960 _keys!1163) (size!32959 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1062927 () Bool)

(declare-fun e!605572 () Bool)

(assert (=> b!1062927 (= e!605572 true)))

(declare-datatypes ((tuple2!16104 0))(
  ( (tuple2!16105 (_1!8063 (_ BitVec 64)) (_2!8063 V!38793)) )
))
(declare-datatypes ((List!22654 0))(
  ( (Nil!22651) (Cons!22650 (h!23859 tuple2!16104) (t!31958 List!22654)) )
))
(declare-datatypes ((ListLongMap!14073 0))(
  ( (ListLongMap!14074 (toList!7052 List!22654)) )
))
(declare-fun lt!468294 () ListLongMap!14073)

(declare-fun -!571 (ListLongMap!14073 (_ BitVec 64)) ListLongMap!14073)

(assert (=> b!1062927 (= (-!571 lt!468294 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468294)))

(declare-datatypes ((Unit!34695 0))(
  ( (Unit!34696) )
))
(declare-fun lt!468291 () Unit!34695)

(declare-fun removeNotPresentStillSame!23 (ListLongMap!14073 (_ BitVec 64)) Unit!34695)

(assert (=> b!1062927 (= lt!468291 (removeNotPresentStillSame!23 lt!468294 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1062928 () Bool)

(declare-fun e!605571 () Bool)

(assert (=> b!1062928 (= e!605571 tp_is_empty!25243)))

(declare-fun mapNonEmpty!39541 () Bool)

(declare-fun mapRes!39541 () Bool)

(declare-fun tp!75728 () Bool)

(declare-fun e!605573 () Bool)

(assert (=> mapNonEmpty!39541 (= mapRes!39541 (and tp!75728 e!605573))))

(declare-fun mapValue!39541 () ValueCell!11918)

(declare-fun mapRest!39541 () (Array (_ BitVec 32) ValueCell!11918))

(declare-fun mapKey!39541 () (_ BitVec 32))

(assert (=> mapNonEmpty!39541 (= (arr!32421 _values!955) (store mapRest!39541 mapKey!39541 mapValue!39541))))

(declare-fun mapIsEmpty!39541 () Bool)

(assert (=> mapIsEmpty!39541 mapRes!39541))

(declare-fun b!1062929 () Bool)

(declare-fun e!605570 () Bool)

(assert (=> b!1062929 (= e!605570 e!605572)))

(declare-fun res!709746 () Bool)

(assert (=> b!1062929 (=> res!709746 e!605572)))

(declare-fun contains!6221 (ListLongMap!14073 (_ BitVec 64)) Bool)

(assert (=> b!1062929 (= res!709746 (contains!6221 lt!468294 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!38793)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38793)

(declare-fun getCurrentListMap!3952 (array!67432 array!67430 (_ BitVec 32) (_ BitVec 32) V!38793 V!38793 (_ BitVec 32) Int) ListLongMap!14073)

(assert (=> b!1062929 (= lt!468294 (getCurrentListMap!3952 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062930 () Bool)

(declare-fun res!709743 () Bool)

(assert (=> b!1062930 (=> (not res!709743) (not e!605576))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67432 (_ BitVec 32)) Bool)

(assert (=> b!1062930 (= res!709743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1062931 () Bool)

(assert (=> b!1062931 (= e!605576 (not e!605570))))

(declare-fun res!709745 () Bool)

(assert (=> b!1062931 (=> res!709745 e!605570)))

(assert (=> b!1062931 (= res!709745 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!468292 () ListLongMap!14073)

(declare-fun lt!468295 () ListLongMap!14073)

(assert (=> b!1062931 (= lt!468292 lt!468295)))

(declare-fun lt!468293 () Unit!34695)

(declare-fun zeroValueAfter!47 () V!38793)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!654 (array!67432 array!67430 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38793 V!38793 V!38793 V!38793 (_ BitVec 32) Int) Unit!34695)

(assert (=> b!1062931 (= lt!468293 (lemmaNoChangeToArrayThenSameMapNoExtras!654 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3660 (array!67432 array!67430 (_ BitVec 32) (_ BitVec 32) V!38793 V!38793 (_ BitVec 32) Int) ListLongMap!14073)

(assert (=> b!1062931 (= lt!468295 (getCurrentListMapNoExtraKeys!3660 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1062931 (= lt!468292 (getCurrentListMapNoExtraKeys!3660 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062932 () Bool)

(assert (=> b!1062932 (= e!605574 (and e!605571 mapRes!39541))))

(declare-fun condMapEmpty!39541 () Bool)

(declare-fun mapDefault!39541 () ValueCell!11918)

(assert (=> b!1062932 (= condMapEmpty!39541 (= (arr!32421 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11918)) mapDefault!39541)))))

(declare-fun b!1062933 () Bool)

(assert (=> b!1062933 (= e!605573 tp_is_empty!25243)))

(declare-fun b!1062934 () Bool)

(declare-fun res!709744 () Bool)

(assert (=> b!1062934 (=> (not res!709744) (not e!605576))))

(declare-datatypes ((List!22655 0))(
  ( (Nil!22652) (Cons!22651 (h!23860 (_ BitVec 64)) (t!31959 List!22655)) )
))
(declare-fun arrayNoDuplicates!0 (array!67432 (_ BitVec 32) List!22655) Bool)

(assert (=> b!1062934 (= res!709744 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22652))))

(assert (= (and start!93990 res!709742) b!1062926))

(assert (= (and b!1062926 res!709741) b!1062930))

(assert (= (and b!1062930 res!709743) b!1062934))

(assert (= (and b!1062934 res!709744) b!1062931))

(assert (= (and b!1062931 (not res!709745)) b!1062929))

(assert (= (and b!1062929 (not res!709746)) b!1062927))

(assert (= (and b!1062932 condMapEmpty!39541) mapIsEmpty!39541))

(assert (= (and b!1062932 (not condMapEmpty!39541)) mapNonEmpty!39541))

(get-info :version)

(assert (= (and mapNonEmpty!39541 ((_ is ValueCellFull!11918) mapValue!39541)) b!1062933))

(assert (= (and b!1062932 ((_ is ValueCellFull!11918) mapDefault!39541)) b!1062928))

(assert (= start!93990 b!1062932))

(declare-fun m!981157 () Bool)

(assert (=> mapNonEmpty!39541 m!981157))

(declare-fun m!981159 () Bool)

(assert (=> b!1062931 m!981159))

(declare-fun m!981161 () Bool)

(assert (=> b!1062931 m!981161))

(declare-fun m!981163 () Bool)

(assert (=> b!1062931 m!981163))

(declare-fun m!981165 () Bool)

(assert (=> b!1062929 m!981165))

(declare-fun m!981167 () Bool)

(assert (=> b!1062929 m!981167))

(declare-fun m!981169 () Bool)

(assert (=> b!1062934 m!981169))

(declare-fun m!981171 () Bool)

(assert (=> b!1062930 m!981171))

(declare-fun m!981173 () Bool)

(assert (=> start!93990 m!981173))

(declare-fun m!981175 () Bool)

(assert (=> start!93990 m!981175))

(declare-fun m!981177 () Bool)

(assert (=> start!93990 m!981177))

(declare-fun m!981179 () Bool)

(assert (=> b!1062927 m!981179))

(declare-fun m!981181 () Bool)

(assert (=> b!1062927 m!981181))

(check-sat (not b!1062934) (not mapNonEmpty!39541) (not start!93990) (not b!1062927) (not b!1062929) (not b_next!21433) tp_is_empty!25243 b_and!34139 (not b!1062930) (not b!1062931))
(check-sat b_and!34139 (not b_next!21433))
