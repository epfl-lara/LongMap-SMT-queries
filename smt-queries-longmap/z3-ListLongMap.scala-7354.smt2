; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93830 () Bool)

(assert start!93830)

(declare-fun b_free!21303 () Bool)

(declare-fun b_next!21303 () Bool)

(assert (=> start!93830 (= b_free!21303 (not b_next!21303))))

(declare-fun tp!75332 () Bool)

(declare-fun b_and!34017 () Bool)

(assert (=> start!93830 (= tp!75332 b_and!34017)))

(declare-fun b!1061243 () Bool)

(declare-fun e!604305 () Bool)

(assert (=> b!1061243 (= e!604305 (not true))))

(declare-datatypes ((V!38619 0))(
  ( (V!38620 (val!12607 Int)) )
))
(declare-datatypes ((tuple2!15930 0))(
  ( (tuple2!15931 (_1!7976 (_ BitVec 64)) (_2!7976 V!38619)) )
))
(declare-datatypes ((List!22516 0))(
  ( (Nil!22513) (Cons!22512 (h!23721 tuple2!15930) (t!31825 List!22516)) )
))
(declare-datatypes ((ListLongMap!13899 0))(
  ( (ListLongMap!13900 (toList!6965 List!22516)) )
))
(declare-fun lt!467515 () ListLongMap!13899)

(declare-fun lt!467513 () ListLongMap!13899)

(assert (=> b!1061243 (= lt!467515 lt!467513)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38619)

(declare-datatypes ((Unit!34732 0))(
  ( (Unit!34733) )
))
(declare-fun lt!467514 () Unit!34732)

(declare-fun minValue!907 () V!38619)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-datatypes ((ValueCell!11853 0))(
  ( (ValueCellFull!11853 (v!15217 V!38619)) (EmptyCell!11853) )
))
(declare-datatypes ((array!67229 0))(
  ( (array!67230 (arr!32322 (Array (_ BitVec 32) ValueCell!11853)) (size!32858 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67229)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38619)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67231 0))(
  ( (array!67232 (arr!32323 (Array (_ BitVec 32) (_ BitVec 64))) (size!32859 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67231)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!604 (array!67231 array!67229 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38619 V!38619 V!38619 V!38619 (_ BitVec 32) Int) Unit!34732)

(assert (=> b!1061243 (= lt!467514 (lemmaNoChangeToArrayThenSameMapNoExtras!604 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3567 (array!67231 array!67229 (_ BitVec 32) (_ BitVec 32) V!38619 V!38619 (_ BitVec 32) Int) ListLongMap!13899)

(assert (=> b!1061243 (= lt!467513 (getCurrentListMapNoExtraKeys!3567 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1061243 (= lt!467515 (getCurrentListMapNoExtraKeys!3567 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061244 () Bool)

(declare-fun e!604304 () Bool)

(declare-fun tp_is_empty!25113 () Bool)

(assert (=> b!1061244 (= e!604304 tp_is_empty!25113)))

(declare-fun b!1061246 () Bool)

(declare-fun e!604307 () Bool)

(declare-fun e!604306 () Bool)

(declare-fun mapRes!39340 () Bool)

(assert (=> b!1061246 (= e!604307 (and e!604306 mapRes!39340))))

(declare-fun condMapEmpty!39340 () Bool)

(declare-fun mapDefault!39340 () ValueCell!11853)

(assert (=> b!1061246 (= condMapEmpty!39340 (= (arr!32322 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11853)) mapDefault!39340)))))

(declare-fun b!1061247 () Bool)

(assert (=> b!1061247 (= e!604306 tp_is_empty!25113)))

(declare-fun b!1061248 () Bool)

(declare-fun res!708710 () Bool)

(assert (=> b!1061248 (=> (not res!708710) (not e!604305))))

(assert (=> b!1061248 (= res!708710 (and (= (size!32858 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32859 _keys!1163) (size!32858 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!39340 () Bool)

(assert (=> mapIsEmpty!39340 mapRes!39340))

(declare-fun res!708711 () Bool)

(assert (=> start!93830 (=> (not res!708711) (not e!604305))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93830 (= res!708711 (validMask!0 mask!1515))))

(assert (=> start!93830 e!604305))

(assert (=> start!93830 true))

(assert (=> start!93830 tp_is_empty!25113))

(declare-fun array_inv!25046 (array!67229) Bool)

(assert (=> start!93830 (and (array_inv!25046 _values!955) e!604307)))

(assert (=> start!93830 tp!75332))

(declare-fun array_inv!25047 (array!67231) Bool)

(assert (=> start!93830 (array_inv!25047 _keys!1163)))

(declare-fun b!1061245 () Bool)

(declare-fun res!708712 () Bool)

(assert (=> b!1061245 (=> (not res!708712) (not e!604305))))

(declare-datatypes ((List!22517 0))(
  ( (Nil!22514) (Cons!22513 (h!23722 (_ BitVec 64)) (t!31826 List!22517)) )
))
(declare-fun arrayNoDuplicates!0 (array!67231 (_ BitVec 32) List!22517) Bool)

(assert (=> b!1061245 (= res!708712 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22514))))

(declare-fun b!1061249 () Bool)

(declare-fun res!708709 () Bool)

(assert (=> b!1061249 (=> (not res!708709) (not e!604305))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67231 (_ BitVec 32)) Bool)

(assert (=> b!1061249 (= res!708709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39340 () Bool)

(declare-fun tp!75331 () Bool)

(assert (=> mapNonEmpty!39340 (= mapRes!39340 (and tp!75331 e!604304))))

(declare-fun mapValue!39340 () ValueCell!11853)

(declare-fun mapRest!39340 () (Array (_ BitVec 32) ValueCell!11853))

(declare-fun mapKey!39340 () (_ BitVec 32))

(assert (=> mapNonEmpty!39340 (= (arr!32322 _values!955) (store mapRest!39340 mapKey!39340 mapValue!39340))))

(assert (= (and start!93830 res!708711) b!1061248))

(assert (= (and b!1061248 res!708710) b!1061249))

(assert (= (and b!1061249 res!708709) b!1061245))

(assert (= (and b!1061245 res!708712) b!1061243))

(assert (= (and b!1061246 condMapEmpty!39340) mapIsEmpty!39340))

(assert (= (and b!1061246 (not condMapEmpty!39340)) mapNonEmpty!39340))

(get-info :version)

(assert (= (and mapNonEmpty!39340 ((_ is ValueCellFull!11853) mapValue!39340)) b!1061244))

(assert (= (and b!1061246 ((_ is ValueCellFull!11853) mapDefault!39340)) b!1061247))

(assert (= start!93830 b!1061246))

(declare-fun m!980121 () Bool)

(assert (=> b!1061245 m!980121))

(declare-fun m!980123 () Bool)

(assert (=> b!1061243 m!980123))

(declare-fun m!980125 () Bool)

(assert (=> b!1061243 m!980125))

(declare-fun m!980127 () Bool)

(assert (=> b!1061243 m!980127))

(declare-fun m!980129 () Bool)

(assert (=> b!1061249 m!980129))

(declare-fun m!980131 () Bool)

(assert (=> mapNonEmpty!39340 m!980131))

(declare-fun m!980133 () Bool)

(assert (=> start!93830 m!980133))

(declare-fun m!980135 () Bool)

(assert (=> start!93830 m!980135))

(declare-fun m!980137 () Bool)

(assert (=> start!93830 m!980137))

(check-sat (not start!93830) (not b!1061245) (not b!1061243) (not b_next!21303) b_and!34017 tp_is_empty!25113 (not mapNonEmpty!39340) (not b!1061249))
(check-sat b_and!34017 (not b_next!21303))
