; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93996 () Bool)

(assert start!93996)

(declare-fun b_free!21439 () Bool)

(declare-fun b_next!21439 () Bool)

(assert (=> start!93996 (= b_free!21439 (not b_next!21439))))

(declare-fun tp!75745 () Bool)

(declare-fun b_and!34145 () Bool)

(assert (=> start!93996 (= tp!75745 b_and!34145)))

(declare-fun b!1063007 () Bool)

(declare-fun e!605633 () Bool)

(declare-fun tp_is_empty!25249 () Bool)

(assert (=> b!1063007 (= e!605633 tp_is_empty!25249)))

(declare-fun mapNonEmpty!39550 () Bool)

(declare-fun mapRes!39550 () Bool)

(declare-fun tp!75746 () Bool)

(assert (=> mapNonEmpty!39550 (= mapRes!39550 (and tp!75746 e!605633))))

(declare-datatypes ((V!38801 0))(
  ( (V!38802 (val!12675 Int)) )
))
(declare-datatypes ((ValueCell!11921 0))(
  ( (ValueCellFull!11921 (v!15285 V!38801)) (EmptyCell!11921) )
))
(declare-fun mapValue!39550 () ValueCell!11921)

(declare-fun mapKey!39550 () (_ BitVec 32))

(declare-fun mapRest!39550 () (Array (_ BitVec 32) ValueCell!11921))

(declare-datatypes ((array!67438 0))(
  ( (array!67439 (arr!32425 (Array (_ BitVec 32) ValueCell!11921)) (size!32963 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67438)

(assert (=> mapNonEmpty!39550 (= (arr!32425 _values!955) (store mapRest!39550 mapKey!39550 mapValue!39550))))

(declare-fun b!1063008 () Bool)

(declare-fun e!605637 () Bool)

(declare-fun e!605634 () Bool)

(assert (=> b!1063008 (= e!605637 (not e!605634))))

(declare-fun res!709798 () Bool)

(assert (=> b!1063008 (=> res!709798 e!605634)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1063008 (= res!709798 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!16106 0))(
  ( (tuple2!16107 (_1!8064 (_ BitVec 64)) (_2!8064 V!38801)) )
))
(declare-datatypes ((List!22656 0))(
  ( (Nil!22653) (Cons!22652 (h!23861 tuple2!16106) (t!31960 List!22656)) )
))
(declare-datatypes ((ListLongMap!14075 0))(
  ( (ListLongMap!14076 (toList!7053 List!22656)) )
))
(declare-fun lt!468338 () ListLongMap!14075)

(declare-fun lt!468336 () ListLongMap!14075)

(assert (=> b!1063008 (= lt!468338 lt!468336)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38801)

(declare-datatypes ((Unit!34697 0))(
  ( (Unit!34698) )
))
(declare-fun lt!468340 () Unit!34697)

(declare-fun minValue!907 () V!38801)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38801)

(declare-datatypes ((array!67440 0))(
  ( (array!67441 (arr!32426 (Array (_ BitVec 32) (_ BitVec 64))) (size!32964 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67440)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!655 (array!67440 array!67438 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38801 V!38801 V!38801 V!38801 (_ BitVec 32) Int) Unit!34697)

(assert (=> b!1063008 (= lt!468340 (lemmaNoChangeToArrayThenSameMapNoExtras!655 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3661 (array!67440 array!67438 (_ BitVec 32) (_ BitVec 32) V!38801 V!38801 (_ BitVec 32) Int) ListLongMap!14075)

(assert (=> b!1063008 (= lt!468336 (getCurrentListMapNoExtraKeys!3661 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063008 (= lt!468338 (getCurrentListMapNoExtraKeys!3661 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063010 () Bool)

(declare-fun e!605635 () Bool)

(assert (=> b!1063010 (= e!605634 e!605635)))

(declare-fun res!709795 () Bool)

(assert (=> b!1063010 (=> res!709795 e!605635)))

(declare-fun lt!468337 () ListLongMap!14075)

(declare-fun contains!6222 (ListLongMap!14075 (_ BitVec 64)) Bool)

(assert (=> b!1063010 (= res!709795 (contains!6222 lt!468337 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!3953 (array!67440 array!67438 (_ BitVec 32) (_ BitVec 32) V!38801 V!38801 (_ BitVec 32) Int) ListLongMap!14075)

(assert (=> b!1063010 (= lt!468337 (getCurrentListMap!3953 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063011 () Bool)

(declare-fun e!605639 () Bool)

(assert (=> b!1063011 (= e!605639 tp_is_empty!25249)))

(declare-fun b!1063012 () Bool)

(assert (=> b!1063012 (= e!605635 true)))

(declare-fun -!572 (ListLongMap!14075 (_ BitVec 64)) ListLongMap!14075)

(assert (=> b!1063012 (= (-!572 lt!468337 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468337)))

(declare-fun lt!468339 () Unit!34697)

(declare-fun removeNotPresentStillSame!24 (ListLongMap!14075 (_ BitVec 64)) Unit!34697)

(assert (=> b!1063012 (= lt!468339 (removeNotPresentStillSame!24 lt!468337 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!39550 () Bool)

(assert (=> mapIsEmpty!39550 mapRes!39550))

(declare-fun b!1063013 () Bool)

(declare-fun e!605636 () Bool)

(assert (=> b!1063013 (= e!605636 (and e!605639 mapRes!39550))))

(declare-fun condMapEmpty!39550 () Bool)

(declare-fun mapDefault!39550 () ValueCell!11921)

(assert (=> b!1063013 (= condMapEmpty!39550 (= (arr!32425 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11921)) mapDefault!39550)))))

(declare-fun b!1063009 () Bool)

(declare-fun res!709800 () Bool)

(assert (=> b!1063009 (=> (not res!709800) (not e!605637))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67440 (_ BitVec 32)) Bool)

(assert (=> b!1063009 (= res!709800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!709799 () Bool)

(assert (=> start!93996 (=> (not res!709799) (not e!605637))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93996 (= res!709799 (validMask!0 mask!1515))))

(assert (=> start!93996 e!605637))

(assert (=> start!93996 true))

(assert (=> start!93996 tp_is_empty!25249))

(declare-fun array_inv!25122 (array!67438) Bool)

(assert (=> start!93996 (and (array_inv!25122 _values!955) e!605636)))

(assert (=> start!93996 tp!75745))

(declare-fun array_inv!25123 (array!67440) Bool)

(assert (=> start!93996 (array_inv!25123 _keys!1163)))

(declare-fun b!1063014 () Bool)

(declare-fun res!709797 () Bool)

(assert (=> b!1063014 (=> (not res!709797) (not e!605637))))

(declare-datatypes ((List!22657 0))(
  ( (Nil!22654) (Cons!22653 (h!23862 (_ BitVec 64)) (t!31961 List!22657)) )
))
(declare-fun arrayNoDuplicates!0 (array!67440 (_ BitVec 32) List!22657) Bool)

(assert (=> b!1063014 (= res!709797 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22654))))

(declare-fun b!1063015 () Bool)

(declare-fun res!709796 () Bool)

(assert (=> b!1063015 (=> (not res!709796) (not e!605637))))

(assert (=> b!1063015 (= res!709796 (and (= (size!32963 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32964 _keys!1163) (size!32963 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!93996 res!709799) b!1063015))

(assert (= (and b!1063015 res!709796) b!1063009))

(assert (= (and b!1063009 res!709800) b!1063014))

(assert (= (and b!1063014 res!709797) b!1063008))

(assert (= (and b!1063008 (not res!709798)) b!1063010))

(assert (= (and b!1063010 (not res!709795)) b!1063012))

(assert (= (and b!1063013 condMapEmpty!39550) mapIsEmpty!39550))

(assert (= (and b!1063013 (not condMapEmpty!39550)) mapNonEmpty!39550))

(get-info :version)

(assert (= (and mapNonEmpty!39550 ((_ is ValueCellFull!11921) mapValue!39550)) b!1063007))

(assert (= (and b!1063013 ((_ is ValueCellFull!11921) mapDefault!39550)) b!1063011))

(assert (= start!93996 b!1063013))

(declare-fun m!981235 () Bool)

(assert (=> mapNonEmpty!39550 m!981235))

(declare-fun m!981237 () Bool)

(assert (=> b!1063009 m!981237))

(declare-fun m!981239 () Bool)

(assert (=> b!1063014 m!981239))

(declare-fun m!981241 () Bool)

(assert (=> b!1063008 m!981241))

(declare-fun m!981243 () Bool)

(assert (=> b!1063008 m!981243))

(declare-fun m!981245 () Bool)

(assert (=> b!1063008 m!981245))

(declare-fun m!981247 () Bool)

(assert (=> start!93996 m!981247))

(declare-fun m!981249 () Bool)

(assert (=> start!93996 m!981249))

(declare-fun m!981251 () Bool)

(assert (=> start!93996 m!981251))

(declare-fun m!981253 () Bool)

(assert (=> b!1063010 m!981253))

(declare-fun m!981255 () Bool)

(assert (=> b!1063010 m!981255))

(declare-fun m!981257 () Bool)

(assert (=> b!1063012 m!981257))

(declare-fun m!981259 () Bool)

(assert (=> b!1063012 m!981259))

(check-sat (not b!1063012) tp_is_empty!25249 (not start!93996) (not b!1063014) (not mapNonEmpty!39550) (not b!1063010) b_and!34145 (not b_next!21439) (not b!1063009) (not b!1063008))
(check-sat b_and!34145 (not b_next!21439))
