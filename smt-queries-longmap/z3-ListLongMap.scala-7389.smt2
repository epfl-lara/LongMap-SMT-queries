; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94090 () Bool)

(assert start!94090)

(declare-fun b_free!21511 () Bool)

(declare-fun b_next!21511 () Bool)

(assert (=> start!94090 (= b_free!21511 (not b_next!21511))))

(declare-fun tp!75964 () Bool)

(declare-fun b_and!34227 () Bool)

(assert (=> start!94090 (= tp!75964 b_and!34227)))

(declare-fun res!710375 () Bool)

(declare-fun e!606359 () Bool)

(assert (=> start!94090 (=> (not res!710375) (not e!606359))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94090 (= res!710375 (validMask!0 mask!1515))))

(assert (=> start!94090 e!606359))

(assert (=> start!94090 true))

(declare-fun tp_is_empty!25321 () Bool)

(assert (=> start!94090 tp_is_empty!25321))

(declare-datatypes ((V!38897 0))(
  ( (V!38898 (val!12711 Int)) )
))
(declare-datatypes ((ValueCell!11957 0))(
  ( (ValueCellFull!11957 (v!15322 V!38897)) (EmptyCell!11957) )
))
(declare-datatypes ((array!67576 0))(
  ( (array!67577 (arr!32493 (Array (_ BitVec 32) ValueCell!11957)) (size!33031 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67576)

(declare-fun e!606361 () Bool)

(declare-fun array_inv!25166 (array!67576) Bool)

(assert (=> start!94090 (and (array_inv!25166 _values!955) e!606361)))

(assert (=> start!94090 tp!75964))

(declare-datatypes ((array!67578 0))(
  ( (array!67579 (arr!32494 (Array (_ BitVec 32) (_ BitVec 64))) (size!33032 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67578)

(declare-fun array_inv!25167 (array!67578) Bool)

(assert (=> start!94090 (array_inv!25167 _keys!1163)))

(declare-fun b!1064006 () Bool)

(assert (=> b!1064006 (= e!606359 (not true))))

(declare-datatypes ((tuple2!16154 0))(
  ( (tuple2!16155 (_1!8088 (_ BitVec 64)) (_2!8088 V!38897)) )
))
(declare-datatypes ((List!22704 0))(
  ( (Nil!22701) (Cons!22700 (h!23909 tuple2!16154) (t!32010 List!22704)) )
))
(declare-datatypes ((ListLongMap!14123 0))(
  ( (ListLongMap!14124 (toList!7077 List!22704)) )
))
(declare-fun lt!468871 () ListLongMap!14123)

(declare-fun lt!468872 () ListLongMap!14123)

(assert (=> b!1064006 (= lt!468871 lt!468872)))

(declare-fun zeroValueBefore!47 () V!38897)

(declare-datatypes ((Unit!34745 0))(
  ( (Unit!34746) )
))
(declare-fun lt!468870 () Unit!34745)

(declare-fun minValue!907 () V!38897)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38897)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!677 (array!67578 array!67576 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38897 V!38897 V!38897 V!38897 (_ BitVec 32) Int) Unit!34745)

(assert (=> b!1064006 (= lt!468870 (lemmaNoChangeToArrayThenSameMapNoExtras!677 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3683 (array!67578 array!67576 (_ BitVec 32) (_ BitVec 32) V!38897 V!38897 (_ BitVec 32) Int) ListLongMap!14123)

(assert (=> b!1064006 (= lt!468872 (getCurrentListMapNoExtraKeys!3683 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064006 (= lt!468871 (getCurrentListMapNoExtraKeys!3683 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39661 () Bool)

(declare-fun mapRes!39661 () Bool)

(assert (=> mapIsEmpty!39661 mapRes!39661))

(declare-fun b!1064007 () Bool)

(declare-fun res!710377 () Bool)

(assert (=> b!1064007 (=> (not res!710377) (not e!606359))))

(declare-datatypes ((List!22705 0))(
  ( (Nil!22702) (Cons!22701 (h!23910 (_ BitVec 64)) (t!32011 List!22705)) )
))
(declare-fun arrayNoDuplicates!0 (array!67578 (_ BitVec 32) List!22705) Bool)

(assert (=> b!1064007 (= res!710377 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22702))))

(declare-fun mapNonEmpty!39661 () Bool)

(declare-fun tp!75965 () Bool)

(declare-fun e!606363 () Bool)

(assert (=> mapNonEmpty!39661 (= mapRes!39661 (and tp!75965 e!606363))))

(declare-fun mapValue!39661 () ValueCell!11957)

(declare-fun mapKey!39661 () (_ BitVec 32))

(declare-fun mapRest!39661 () (Array (_ BitVec 32) ValueCell!11957))

(assert (=> mapNonEmpty!39661 (= (arr!32493 _values!955) (store mapRest!39661 mapKey!39661 mapValue!39661))))

(declare-fun b!1064008 () Bool)

(assert (=> b!1064008 (= e!606363 tp_is_empty!25321)))

(declare-fun b!1064009 () Bool)

(declare-fun e!606360 () Bool)

(assert (=> b!1064009 (= e!606360 tp_is_empty!25321)))

(declare-fun b!1064010 () Bool)

(assert (=> b!1064010 (= e!606361 (and e!606360 mapRes!39661))))

(declare-fun condMapEmpty!39661 () Bool)

(declare-fun mapDefault!39661 () ValueCell!11957)

(assert (=> b!1064010 (= condMapEmpty!39661 (= (arr!32493 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11957)) mapDefault!39661)))))

(declare-fun b!1064011 () Bool)

(declare-fun res!710376 () Bool)

(assert (=> b!1064011 (=> (not res!710376) (not e!606359))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67578 (_ BitVec 32)) Bool)

(assert (=> b!1064011 (= res!710376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1064012 () Bool)

(declare-fun res!710374 () Bool)

(assert (=> b!1064012 (=> (not res!710374) (not e!606359))))

(assert (=> b!1064012 (= res!710374 (and (= (size!33031 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33032 _keys!1163) (size!33031 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94090 res!710375) b!1064012))

(assert (= (and b!1064012 res!710374) b!1064011))

(assert (= (and b!1064011 res!710376) b!1064007))

(assert (= (and b!1064007 res!710377) b!1064006))

(assert (= (and b!1064010 condMapEmpty!39661) mapIsEmpty!39661))

(assert (= (and b!1064010 (not condMapEmpty!39661)) mapNonEmpty!39661))

(get-info :version)

(assert (= (and mapNonEmpty!39661 ((_ is ValueCellFull!11957) mapValue!39661)) b!1064008))

(assert (= (and b!1064010 ((_ is ValueCellFull!11957) mapDefault!39661)) b!1064009))

(assert (= start!94090 b!1064010))

(declare-fun m!982129 () Bool)

(assert (=> start!94090 m!982129))

(declare-fun m!982131 () Bool)

(assert (=> start!94090 m!982131))

(declare-fun m!982133 () Bool)

(assert (=> start!94090 m!982133))

(declare-fun m!982135 () Bool)

(assert (=> b!1064006 m!982135))

(declare-fun m!982137 () Bool)

(assert (=> b!1064006 m!982137))

(declare-fun m!982139 () Bool)

(assert (=> b!1064006 m!982139))

(declare-fun m!982141 () Bool)

(assert (=> b!1064011 m!982141))

(declare-fun m!982143 () Bool)

(assert (=> mapNonEmpty!39661 m!982143))

(declare-fun m!982145 () Bool)

(assert (=> b!1064007 m!982145))

(check-sat tp_is_empty!25321 (not b!1064011) (not b_next!21511) (not start!94090) (not b!1064006) b_and!34227 (not mapNonEmpty!39661) (not b!1064007))
(check-sat b_and!34227 (not b_next!21511))
