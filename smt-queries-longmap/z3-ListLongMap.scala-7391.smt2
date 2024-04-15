; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94116 () Bool)

(assert start!94116)

(declare-fun b_free!21523 () Bool)

(declare-fun b_next!21523 () Bool)

(assert (=> start!94116 (= b_free!21523 (not b_next!21523))))

(declare-fun tp!76004 () Bool)

(declare-fun b_and!34247 () Bool)

(assert (=> start!94116 (= tp!76004 b_and!34247)))

(declare-fun b!1064219 () Bool)

(declare-fun e!606509 () Bool)

(declare-fun tp_is_empty!25333 () Bool)

(assert (=> b!1064219 (= e!606509 tp_is_empty!25333)))

(declare-fun res!710483 () Bool)

(declare-fun e!606507 () Bool)

(assert (=> start!94116 (=> (not res!710483) (not e!606507))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94116 (= res!710483 (validMask!0 mask!1515))))

(assert (=> start!94116 e!606507))

(assert (=> start!94116 true))

(assert (=> start!94116 tp_is_empty!25333))

(declare-datatypes ((V!38913 0))(
  ( (V!38914 (val!12717 Int)) )
))
(declare-datatypes ((ValueCell!11963 0))(
  ( (ValueCellFull!11963 (v!15328 V!38913)) (EmptyCell!11963) )
))
(declare-datatypes ((array!67602 0))(
  ( (array!67603 (arr!32505 (Array (_ BitVec 32) ValueCell!11963)) (size!33043 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67602)

(declare-fun e!606506 () Bool)

(declare-fun array_inv!25178 (array!67602) Bool)

(assert (=> start!94116 (and (array_inv!25178 _values!955) e!606506)))

(assert (=> start!94116 tp!76004))

(declare-datatypes ((array!67604 0))(
  ( (array!67605 (arr!32506 (Array (_ BitVec 32) (_ BitVec 64))) (size!33044 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67604)

(declare-fun array_inv!25179 (array!67604) Bool)

(assert (=> start!94116 (array_inv!25179 _keys!1163)))

(declare-fun b!1064220 () Bool)

(declare-fun res!710481 () Bool)

(assert (=> b!1064220 (=> (not res!710481) (not e!606507))))

(declare-datatypes ((List!22715 0))(
  ( (Nil!22712) (Cons!22711 (h!23920 (_ BitVec 64)) (t!32023 List!22715)) )
))
(declare-fun arrayNoDuplicates!0 (array!67604 (_ BitVec 32) List!22715) Bool)

(assert (=> b!1064220 (= res!710481 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22712))))

(declare-fun b!1064221 () Bool)

(declare-fun e!606510 () Bool)

(declare-fun mapRes!39682 () Bool)

(assert (=> b!1064221 (= e!606506 (and e!606510 mapRes!39682))))

(declare-fun condMapEmpty!39682 () Bool)

(declare-fun mapDefault!39682 () ValueCell!11963)

(assert (=> b!1064221 (= condMapEmpty!39682 (= (arr!32505 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11963)) mapDefault!39682)))))

(declare-fun b!1064222 () Bool)

(declare-fun res!710480 () Bool)

(assert (=> b!1064222 (=> (not res!710480) (not e!606507))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67604 (_ BitVec 32)) Bool)

(assert (=> b!1064222 (= res!710480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1064223 () Bool)

(declare-fun res!710482 () Bool)

(assert (=> b!1064223 (=> (not res!710482) (not e!606507))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1064223 (= res!710482 (and (= (size!33043 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33044 _keys!1163) (size!33043 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1064224 () Bool)

(declare-fun e!606511 () Bool)

(assert (=> b!1064224 (= e!606511 true)))

(declare-fun zeroValueBefore!47 () V!38913)

(declare-datatypes ((tuple2!16166 0))(
  ( (tuple2!16167 (_1!8094 (_ BitVec 64)) (_2!8094 V!38913)) )
))
(declare-datatypes ((List!22716 0))(
  ( (Nil!22713) (Cons!22712 (h!23921 tuple2!16166) (t!32024 List!22716)) )
))
(declare-datatypes ((ListLongMap!14135 0))(
  ( (ListLongMap!14136 (toList!7083 List!22716)) )
))
(declare-fun lt!468969 () ListLongMap!14135)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38913)

(declare-fun getCurrentListMap!3963 (array!67604 array!67602 (_ BitVec 32) (_ BitVec 32) V!38913 V!38913 (_ BitVec 32) Int) ListLongMap!14135)

(assert (=> b!1064224 (= lt!468969 (getCurrentListMap!3963 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39682 () Bool)

(assert (=> mapIsEmpty!39682 mapRes!39682))

(declare-fun b!1064225 () Bool)

(assert (=> b!1064225 (= e!606510 tp_is_empty!25333)))

(declare-fun mapNonEmpty!39682 () Bool)

(declare-fun tp!76003 () Bool)

(assert (=> mapNonEmpty!39682 (= mapRes!39682 (and tp!76003 e!606509))))

(declare-fun mapValue!39682 () ValueCell!11963)

(declare-fun mapKey!39682 () (_ BitVec 32))

(declare-fun mapRest!39682 () (Array (_ BitVec 32) ValueCell!11963))

(assert (=> mapNonEmpty!39682 (= (arr!32505 _values!955) (store mapRest!39682 mapKey!39682 mapValue!39682))))

(declare-fun b!1064226 () Bool)

(assert (=> b!1064226 (= e!606507 (not e!606511))))

(declare-fun res!710479 () Bool)

(assert (=> b!1064226 (=> res!710479 e!606511)))

(assert (=> b!1064226 (= res!710479 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!468968 () ListLongMap!14135)

(declare-fun lt!468967 () ListLongMap!14135)

(assert (=> b!1064226 (= lt!468968 lt!468967)))

(declare-datatypes ((Unit!34757 0))(
  ( (Unit!34758) )
))
(declare-fun lt!468966 () Unit!34757)

(declare-fun zeroValueAfter!47 () V!38913)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!683 (array!67604 array!67602 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38913 V!38913 V!38913 V!38913 (_ BitVec 32) Int) Unit!34757)

(assert (=> b!1064226 (= lt!468966 (lemmaNoChangeToArrayThenSameMapNoExtras!683 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3689 (array!67604 array!67602 (_ BitVec 32) (_ BitVec 32) V!38913 V!38913 (_ BitVec 32) Int) ListLongMap!14135)

(assert (=> b!1064226 (= lt!468967 (getCurrentListMapNoExtraKeys!3689 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064226 (= lt!468968 (getCurrentListMapNoExtraKeys!3689 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94116 res!710483) b!1064223))

(assert (= (and b!1064223 res!710482) b!1064222))

(assert (= (and b!1064222 res!710480) b!1064220))

(assert (= (and b!1064220 res!710481) b!1064226))

(assert (= (and b!1064226 (not res!710479)) b!1064224))

(assert (= (and b!1064221 condMapEmpty!39682) mapIsEmpty!39682))

(assert (= (and b!1064221 (not condMapEmpty!39682)) mapNonEmpty!39682))

(get-info :version)

(assert (= (and mapNonEmpty!39682 ((_ is ValueCellFull!11963) mapValue!39682)) b!1064219))

(assert (= (and b!1064221 ((_ is ValueCellFull!11963) mapDefault!39682)) b!1064225))

(assert (= start!94116 b!1064221))

(declare-fun m!982303 () Bool)

(assert (=> start!94116 m!982303))

(declare-fun m!982305 () Bool)

(assert (=> start!94116 m!982305))

(declare-fun m!982307 () Bool)

(assert (=> start!94116 m!982307))

(declare-fun m!982309 () Bool)

(assert (=> b!1064220 m!982309))

(declare-fun m!982311 () Bool)

(assert (=> b!1064226 m!982311))

(declare-fun m!982313 () Bool)

(assert (=> b!1064226 m!982313))

(declare-fun m!982315 () Bool)

(assert (=> b!1064226 m!982315))

(declare-fun m!982317 () Bool)

(assert (=> b!1064224 m!982317))

(declare-fun m!982319 () Bool)

(assert (=> b!1064222 m!982319))

(declare-fun m!982321 () Bool)

(assert (=> mapNonEmpty!39682 m!982321))

(check-sat (not b!1064220) (not b!1064226) tp_is_empty!25333 (not start!94116) (not mapNonEmpty!39682) b_and!34247 (not b_next!21523) (not b!1064222) (not b!1064224))
(check-sat b_and!34247 (not b_next!21523))
