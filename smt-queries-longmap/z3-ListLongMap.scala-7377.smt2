; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94004 () Bool)

(assert start!94004)

(declare-fun b_free!21441 () Bool)

(declare-fun b_next!21441 () Bool)

(assert (=> start!94004 (= b_free!21441 (not b_next!21441))))

(declare-fun tp!75752 () Bool)

(declare-fun b_and!34173 () Bool)

(assert (=> start!94004 (= tp!75752 b_and!34173)))

(declare-fun mapNonEmpty!39553 () Bool)

(declare-fun mapRes!39553 () Bool)

(declare-fun tp!75751 () Bool)

(declare-fun e!605747 () Bool)

(assert (=> mapNonEmpty!39553 (= mapRes!39553 (and tp!75751 e!605747))))

(declare-fun mapKey!39553 () (_ BitVec 32))

(declare-datatypes ((V!38803 0))(
  ( (V!38804 (val!12676 Int)) )
))
(declare-datatypes ((ValueCell!11922 0))(
  ( (ValueCellFull!11922 (v!15287 V!38803)) (EmptyCell!11922) )
))
(declare-fun mapValue!39553 () ValueCell!11922)

(declare-fun mapRest!39553 () (Array (_ BitVec 32) ValueCell!11922))

(declare-datatypes ((array!67501 0))(
  ( (array!67502 (arr!32456 (Array (_ BitVec 32) ValueCell!11922)) (size!32992 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67501)

(assert (=> mapNonEmpty!39553 (= (arr!32456 _values!955) (store mapRest!39553 mapKey!39553 mapValue!39553))))

(declare-fun b!1063187 () Bool)

(declare-fun res!709886 () Bool)

(declare-fun e!605749 () Bool)

(assert (=> b!1063187 (=> (not res!709886) (not e!605749))))

(declare-datatypes ((array!67503 0))(
  ( (array!67504 (arr!32457 (Array (_ BitVec 32) (_ BitVec 64))) (size!32993 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67503)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67503 (_ BitVec 32)) Bool)

(assert (=> b!1063187 (= res!709886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1063188 () Bool)

(declare-fun e!605751 () Bool)

(assert (=> b!1063188 (= e!605749 (not e!605751))))

(declare-fun res!709885 () Bool)

(assert (=> b!1063188 (=> res!709885 e!605751)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1063188 (= res!709885 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!16042 0))(
  ( (tuple2!16043 (_1!8032 (_ BitVec 64)) (_2!8032 V!38803)) )
))
(declare-datatypes ((List!22622 0))(
  ( (Nil!22619) (Cons!22618 (h!23827 tuple2!16042) (t!31935 List!22622)) )
))
(declare-datatypes ((ListLongMap!14011 0))(
  ( (ListLongMap!14012 (toList!7021 List!22622)) )
))
(declare-fun lt!468555 () ListLongMap!14011)

(declare-fun lt!468554 () ListLongMap!14011)

(assert (=> b!1063188 (= lt!468555 lt!468554)))

(declare-fun zeroValueBefore!47 () V!38803)

(declare-fun minValue!907 () V!38803)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-datatypes ((Unit!34840 0))(
  ( (Unit!34841) )
))
(declare-fun lt!468552 () Unit!34840)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38803)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!650 (array!67503 array!67501 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38803 V!38803 V!38803 V!38803 (_ BitVec 32) Int) Unit!34840)

(assert (=> b!1063188 (= lt!468552 (lemmaNoChangeToArrayThenSameMapNoExtras!650 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3613 (array!67503 array!67501 (_ BitVec 32) (_ BitVec 32) V!38803 V!38803 (_ BitVec 32) Int) ListLongMap!14011)

(assert (=> b!1063188 (= lt!468554 (getCurrentListMapNoExtraKeys!3613 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063188 (= lt!468555 (getCurrentListMapNoExtraKeys!3613 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063189 () Bool)

(declare-fun e!605752 () Bool)

(assert (=> b!1063189 (= e!605752 true)))

(declare-fun lt!468551 () ListLongMap!14011)

(declare-fun -!582 (ListLongMap!14011 (_ BitVec 64)) ListLongMap!14011)

(assert (=> b!1063189 (= (-!582 lt!468551 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468551)))

(declare-fun lt!468553 () Unit!34840)

(declare-fun removeNotPresentStillSame!29 (ListLongMap!14011 (_ BitVec 64)) Unit!34840)

(assert (=> b!1063189 (= lt!468553 (removeNotPresentStillSame!29 lt!468551 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!39553 () Bool)

(assert (=> mapIsEmpty!39553 mapRes!39553))

(declare-fun b!1063190 () Bool)

(declare-fun e!605748 () Bool)

(declare-fun tp_is_empty!25251 () Bool)

(assert (=> b!1063190 (= e!605748 tp_is_empty!25251)))

(declare-fun res!709883 () Bool)

(assert (=> start!94004 (=> (not res!709883) (not e!605749))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94004 (= res!709883 (validMask!0 mask!1515))))

(assert (=> start!94004 e!605749))

(assert (=> start!94004 true))

(assert (=> start!94004 tp_is_empty!25251))

(declare-fun e!605753 () Bool)

(declare-fun array_inv!25142 (array!67501) Bool)

(assert (=> start!94004 (and (array_inv!25142 _values!955) e!605753)))

(assert (=> start!94004 tp!75752))

(declare-fun array_inv!25143 (array!67503) Bool)

(assert (=> start!94004 (array_inv!25143 _keys!1163)))

(declare-fun b!1063191 () Bool)

(assert (=> b!1063191 (= e!605753 (and e!605748 mapRes!39553))))

(declare-fun condMapEmpty!39553 () Bool)

(declare-fun mapDefault!39553 () ValueCell!11922)

(assert (=> b!1063191 (= condMapEmpty!39553 (= (arr!32456 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11922)) mapDefault!39553)))))

(declare-fun b!1063192 () Bool)

(declare-fun res!709884 () Bool)

(assert (=> b!1063192 (=> (not res!709884) (not e!605749))))

(declare-datatypes ((List!22623 0))(
  ( (Nil!22620) (Cons!22619 (h!23828 (_ BitVec 64)) (t!31936 List!22623)) )
))
(declare-fun arrayNoDuplicates!0 (array!67503 (_ BitVec 32) List!22623) Bool)

(assert (=> b!1063192 (= res!709884 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22620))))

(declare-fun b!1063193 () Bool)

(assert (=> b!1063193 (= e!605747 tp_is_empty!25251)))

(declare-fun b!1063194 () Bool)

(assert (=> b!1063194 (= e!605751 e!605752)))

(declare-fun res!709882 () Bool)

(assert (=> b!1063194 (=> res!709882 e!605752)))

(declare-fun contains!6252 (ListLongMap!14011 (_ BitVec 64)) Bool)

(assert (=> b!1063194 (= res!709882 (contains!6252 lt!468551 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4004 (array!67503 array!67501 (_ BitVec 32) (_ BitVec 32) V!38803 V!38803 (_ BitVec 32) Int) ListLongMap!14011)

(assert (=> b!1063194 (= lt!468551 (getCurrentListMap!4004 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063195 () Bool)

(declare-fun res!709887 () Bool)

(assert (=> b!1063195 (=> (not res!709887) (not e!605749))))

(assert (=> b!1063195 (= res!709887 (and (= (size!32992 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32993 _keys!1163) (size!32992 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94004 res!709883) b!1063195))

(assert (= (and b!1063195 res!709887) b!1063187))

(assert (= (and b!1063187 res!709886) b!1063192))

(assert (= (and b!1063192 res!709884) b!1063188))

(assert (= (and b!1063188 (not res!709885)) b!1063194))

(assert (= (and b!1063194 (not res!709882)) b!1063189))

(assert (= (and b!1063191 condMapEmpty!39553) mapIsEmpty!39553))

(assert (= (and b!1063191 (not condMapEmpty!39553)) mapNonEmpty!39553))

(get-info :version)

(assert (= (and mapNonEmpty!39553 ((_ is ValueCellFull!11922) mapValue!39553)) b!1063193))

(assert (= (and b!1063191 ((_ is ValueCellFull!11922) mapDefault!39553)) b!1063190))

(assert (= start!94004 b!1063191))

(declare-fun m!981887 () Bool)

(assert (=> b!1063194 m!981887))

(declare-fun m!981889 () Bool)

(assert (=> b!1063194 m!981889))

(declare-fun m!981891 () Bool)

(assert (=> b!1063192 m!981891))

(declare-fun m!981893 () Bool)

(assert (=> b!1063187 m!981893))

(declare-fun m!981895 () Bool)

(assert (=> start!94004 m!981895))

(declare-fun m!981897 () Bool)

(assert (=> start!94004 m!981897))

(declare-fun m!981899 () Bool)

(assert (=> start!94004 m!981899))

(declare-fun m!981901 () Bool)

(assert (=> b!1063189 m!981901))

(declare-fun m!981903 () Bool)

(assert (=> b!1063189 m!981903))

(declare-fun m!981905 () Bool)

(assert (=> b!1063188 m!981905))

(declare-fun m!981907 () Bool)

(assert (=> b!1063188 m!981907))

(declare-fun m!981909 () Bool)

(assert (=> b!1063188 m!981909))

(declare-fun m!981911 () Bool)

(assert (=> mapNonEmpty!39553 m!981911))

(check-sat (not b!1063194) (not mapNonEmpty!39553) (not b!1063192) (not b!1063188) (not b!1063187) (not b!1063189) tp_is_empty!25251 b_and!34173 (not b_next!21441) (not start!94004))
(check-sat b_and!34173 (not b_next!21441))
