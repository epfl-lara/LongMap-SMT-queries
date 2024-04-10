; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94544 () Bool)

(assert start!94544)

(declare-fun b_free!21849 () Bool)

(declare-fun b_next!21849 () Bool)

(assert (=> start!94544 (= b_free!21849 (not b_next!21849))))

(declare-fun tp!76996 () Bool)

(declare-fun b_and!34651 () Bool)

(assert (=> start!94544 (= tp!76996 b_and!34651)))

(declare-fun b!1069119 () Bool)

(declare-fun e!610100 () Bool)

(assert (=> b!1069119 (= e!610100 true)))

(declare-datatypes ((V!39347 0))(
  ( (V!39348 (val!12880 Int)) )
))
(declare-datatypes ((tuple2!16368 0))(
  ( (tuple2!16369 (_1!8195 (_ BitVec 64)) (_2!8195 V!39347)) )
))
(declare-datatypes ((List!22914 0))(
  ( (Nil!22911) (Cons!22910 (h!24119 tuple2!16368) (t!32241 List!22914)) )
))
(declare-datatypes ((ListLongMap!14337 0))(
  ( (ListLongMap!14338 (toList!7184 List!22914)) )
))
(declare-fun lt!472402 () ListLongMap!14337)

(declare-fun -!663 (ListLongMap!14337 (_ BitVec 64)) ListLongMap!14337)

(assert (=> b!1069119 (= (-!663 lt!472402 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472402)))

(declare-datatypes ((Unit!35165 0))(
  ( (Unit!35166) )
))
(declare-fun lt!472406 () Unit!35165)

(declare-fun removeNotPresentStillSame!73 (ListLongMap!14337 (_ BitVec 64)) Unit!35165)

(assert (=> b!1069119 (= lt!472406 (removeNotPresentStillSame!73 lt!472402 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1069120 () Bool)

(declare-fun res!713386 () Bool)

(declare-fun e!610102 () Bool)

(assert (=> b!1069120 (=> (not res!713386) (not e!610102))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12126 0))(
  ( (ValueCellFull!12126 (v!15495 V!39347)) (EmptyCell!12126) )
))
(declare-datatypes ((array!68295 0))(
  ( (array!68296 (arr!32846 (Array (_ BitVec 32) ValueCell!12126)) (size!33382 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68295)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68297 0))(
  ( (array!68298 (arr!32847 (Array (_ BitVec 32) (_ BitVec 64))) (size!33383 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68297)

(assert (=> b!1069120 (= res!713386 (and (= (size!33382 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33383 _keys!1163) (size!33382 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1069122 () Bool)

(declare-fun res!713388 () Bool)

(assert (=> b!1069122 (=> (not res!713388) (not e!610102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68297 (_ BitVec 32)) Bool)

(assert (=> b!1069122 (= res!713388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1069123 () Bool)

(declare-fun e!610103 () Bool)

(declare-fun e!610098 () Bool)

(declare-fun mapRes!40186 () Bool)

(assert (=> b!1069123 (= e!610103 (and e!610098 mapRes!40186))))

(declare-fun condMapEmpty!40186 () Bool)

(declare-fun mapDefault!40186 () ValueCell!12126)

(assert (=> b!1069123 (= condMapEmpty!40186 (= (arr!32846 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12126)) mapDefault!40186)))))

(declare-fun mapIsEmpty!40186 () Bool)

(assert (=> mapIsEmpty!40186 mapRes!40186))

(declare-fun b!1069124 () Bool)

(declare-fun e!610101 () Bool)

(assert (=> b!1069124 (= e!610101 e!610100)))

(declare-fun res!713385 () Bool)

(assert (=> b!1069124 (=> res!713385 e!610100)))

(declare-fun contains!6312 (ListLongMap!14337 (_ BitVec 64)) Bool)

(assert (=> b!1069124 (= res!713385 (contains!6312 lt!472402 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39347)

(declare-fun zeroValueBefore!47 () V!39347)

(declare-fun getCurrentListMap!4108 (array!68297 array!68295 (_ BitVec 32) (_ BitVec 32) V!39347 V!39347 (_ BitVec 32) Int) ListLongMap!14337)

(assert (=> b!1069124 (= lt!472402 (getCurrentListMap!4108 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069121 () Bool)

(declare-fun tp_is_empty!25659 () Bool)

(assert (=> b!1069121 (= e!610098 tp_is_empty!25659)))

(declare-fun res!713387 () Bool)

(assert (=> start!94544 (=> (not res!713387) (not e!610102))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94544 (= res!713387 (validMask!0 mask!1515))))

(assert (=> start!94544 e!610102))

(assert (=> start!94544 true))

(assert (=> start!94544 tp_is_empty!25659))

(declare-fun array_inv!25422 (array!68295) Bool)

(assert (=> start!94544 (and (array_inv!25422 _values!955) e!610103)))

(assert (=> start!94544 tp!76996))

(declare-fun array_inv!25423 (array!68297) Bool)

(assert (=> start!94544 (array_inv!25423 _keys!1163)))

(declare-fun mapNonEmpty!40186 () Bool)

(declare-fun tp!76997 () Bool)

(declare-fun e!610099 () Bool)

(assert (=> mapNonEmpty!40186 (= mapRes!40186 (and tp!76997 e!610099))))

(declare-fun mapRest!40186 () (Array (_ BitVec 32) ValueCell!12126))

(declare-fun mapKey!40186 () (_ BitVec 32))

(declare-fun mapValue!40186 () ValueCell!12126)

(assert (=> mapNonEmpty!40186 (= (arr!32846 _values!955) (store mapRest!40186 mapKey!40186 mapValue!40186))))

(declare-fun b!1069125 () Bool)

(assert (=> b!1069125 (= e!610099 tp_is_empty!25659)))

(declare-fun b!1069126 () Bool)

(assert (=> b!1069126 (= e!610102 (not e!610101))))

(declare-fun res!713389 () Bool)

(assert (=> b!1069126 (=> res!713389 e!610101)))

(assert (=> b!1069126 (= res!713389 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!472404 () ListLongMap!14337)

(declare-fun lt!472405 () ListLongMap!14337)

(assert (=> b!1069126 (= lt!472404 lt!472405)))

(declare-fun lt!472403 () Unit!35165)

(declare-fun zeroValueAfter!47 () V!39347)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!797 (array!68297 array!68295 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39347 V!39347 V!39347 V!39347 (_ BitVec 32) Int) Unit!35165)

(assert (=> b!1069126 (= lt!472403 (lemmaNoChangeToArrayThenSameMapNoExtras!797 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3760 (array!68297 array!68295 (_ BitVec 32) (_ BitVec 32) V!39347 V!39347 (_ BitVec 32) Int) ListLongMap!14337)

(assert (=> b!1069126 (= lt!472405 (getCurrentListMapNoExtraKeys!3760 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069126 (= lt!472404 (getCurrentListMapNoExtraKeys!3760 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069127 () Bool)

(declare-fun res!713384 () Bool)

(assert (=> b!1069127 (=> (not res!713384) (not e!610102))))

(declare-datatypes ((List!22915 0))(
  ( (Nil!22912) (Cons!22911 (h!24120 (_ BitVec 64)) (t!32242 List!22915)) )
))
(declare-fun arrayNoDuplicates!0 (array!68297 (_ BitVec 32) List!22915) Bool)

(assert (=> b!1069127 (= res!713384 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22912))))

(assert (= (and start!94544 res!713387) b!1069120))

(assert (= (and b!1069120 res!713386) b!1069122))

(assert (= (and b!1069122 res!713388) b!1069127))

(assert (= (and b!1069127 res!713384) b!1069126))

(assert (= (and b!1069126 (not res!713389)) b!1069124))

(assert (= (and b!1069124 (not res!713385)) b!1069119))

(assert (= (and b!1069123 condMapEmpty!40186) mapIsEmpty!40186))

(assert (= (and b!1069123 (not condMapEmpty!40186)) mapNonEmpty!40186))

(get-info :version)

(assert (= (and mapNonEmpty!40186 ((_ is ValueCellFull!12126) mapValue!40186)) b!1069125))

(assert (= (and b!1069123 ((_ is ValueCellFull!12126) mapDefault!40186)) b!1069121))

(assert (= start!94544 b!1069123))

(declare-fun m!987665 () Bool)

(assert (=> b!1069127 m!987665))

(declare-fun m!987667 () Bool)

(assert (=> b!1069124 m!987667))

(declare-fun m!987669 () Bool)

(assert (=> b!1069124 m!987669))

(declare-fun m!987671 () Bool)

(assert (=> b!1069122 m!987671))

(declare-fun m!987673 () Bool)

(assert (=> b!1069126 m!987673))

(declare-fun m!987675 () Bool)

(assert (=> b!1069126 m!987675))

(declare-fun m!987677 () Bool)

(assert (=> b!1069126 m!987677))

(declare-fun m!987679 () Bool)

(assert (=> mapNonEmpty!40186 m!987679))

(declare-fun m!987681 () Bool)

(assert (=> b!1069119 m!987681))

(declare-fun m!987683 () Bool)

(assert (=> b!1069119 m!987683))

(declare-fun m!987685 () Bool)

(assert (=> start!94544 m!987685))

(declare-fun m!987687 () Bool)

(assert (=> start!94544 m!987687))

(declare-fun m!987689 () Bool)

(assert (=> start!94544 m!987689))

(check-sat (not start!94544) (not b_next!21849) (not b!1069126) tp_is_empty!25659 (not b!1069127) (not b!1069122) (not mapNonEmpty!40186) (not b!1069119) b_and!34651 (not b!1069124))
(check-sat b_and!34651 (not b_next!21849))
