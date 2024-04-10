; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93764 () Bool)

(assert start!93764)

(declare-fun b_free!21237 () Bool)

(declare-fun b_next!21237 () Bool)

(assert (=> start!93764 (= b_free!21237 (not b_next!21237))))

(declare-fun tp!75133 () Bool)

(declare-fun b_and!33951 () Bool)

(assert (=> start!93764 (= tp!75133 b_and!33951)))

(declare-fun b!1060550 () Bool)

(declare-fun res!708313 () Bool)

(declare-fun e!603812 () Bool)

(assert (=> b!1060550 (=> (not res!708313) (not e!603812))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38531 0))(
  ( (V!38532 (val!12574 Int)) )
))
(declare-datatypes ((ValueCell!11820 0))(
  ( (ValueCellFull!11820 (v!15184 V!38531)) (EmptyCell!11820) )
))
(declare-datatypes ((array!67113 0))(
  ( (array!67114 (arr!32264 (Array (_ BitVec 32) ValueCell!11820)) (size!32800 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67113)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67115 0))(
  ( (array!67116 (arr!32265 (Array (_ BitVec 32) (_ BitVec 64))) (size!32801 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67115)

(assert (=> b!1060550 (= res!708313 (and (= (size!32800 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32801 _keys!1163) (size!32800 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1060551 () Bool)

(declare-fun e!603811 () Bool)

(declare-fun tp_is_empty!25047 () Bool)

(assert (=> b!1060551 (= e!603811 tp_is_empty!25047)))

(declare-fun b!1060552 () Bool)

(assert (=> b!1060552 (= e!603812 false)))

(declare-fun minValue!907 () V!38531)

(declare-datatypes ((tuple2!15892 0))(
  ( (tuple2!15893 (_1!7957 (_ BitVec 64)) (_2!7957 V!38531)) )
))
(declare-datatypes ((List!22478 0))(
  ( (Nil!22475) (Cons!22474 (h!23683 tuple2!15892) (t!31787 List!22478)) )
))
(declare-datatypes ((ListLongMap!13861 0))(
  ( (ListLongMap!13862 (toList!6946 List!22478)) )
))
(declare-fun lt!467310 () ListLongMap!13861)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38531)

(declare-fun getCurrentListMapNoExtraKeys!3548 (array!67115 array!67113 (_ BitVec 32) (_ BitVec 32) V!38531 V!38531 (_ BitVec 32) Int) ListLongMap!13861)

(assert (=> b!1060552 (= lt!467310 (getCurrentListMapNoExtraKeys!3548 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!38531)

(declare-fun lt!467311 () ListLongMap!13861)

(assert (=> b!1060552 (= lt!467311 (getCurrentListMapNoExtraKeys!3548 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1060553 () Bool)

(declare-fun res!708316 () Bool)

(assert (=> b!1060553 (=> (not res!708316) (not e!603812))))

(declare-datatypes ((List!22479 0))(
  ( (Nil!22476) (Cons!22475 (h!23684 (_ BitVec 64)) (t!31788 List!22479)) )
))
(declare-fun arrayNoDuplicates!0 (array!67115 (_ BitVec 32) List!22479) Bool)

(assert (=> b!1060553 (= res!708316 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22476))))

(declare-fun b!1060554 () Bool)

(declare-fun e!603810 () Bool)

(declare-fun mapRes!39241 () Bool)

(assert (=> b!1060554 (= e!603810 (and e!603811 mapRes!39241))))

(declare-fun condMapEmpty!39241 () Bool)

(declare-fun mapDefault!39241 () ValueCell!11820)

(assert (=> b!1060554 (= condMapEmpty!39241 (= (arr!32264 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11820)) mapDefault!39241)))))

(declare-fun b!1060555 () Bool)

(declare-fun res!708314 () Bool)

(assert (=> b!1060555 (=> (not res!708314) (not e!603812))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67115 (_ BitVec 32)) Bool)

(assert (=> b!1060555 (= res!708314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1060556 () Bool)

(declare-fun e!603813 () Bool)

(assert (=> b!1060556 (= e!603813 tp_is_empty!25047)))

(declare-fun mapNonEmpty!39241 () Bool)

(declare-fun tp!75134 () Bool)

(assert (=> mapNonEmpty!39241 (= mapRes!39241 (and tp!75134 e!603813))))

(declare-fun mapRest!39241 () (Array (_ BitVec 32) ValueCell!11820))

(declare-fun mapKey!39241 () (_ BitVec 32))

(declare-fun mapValue!39241 () ValueCell!11820)

(assert (=> mapNonEmpty!39241 (= (arr!32264 _values!955) (store mapRest!39241 mapKey!39241 mapValue!39241))))

(declare-fun mapIsEmpty!39241 () Bool)

(assert (=> mapIsEmpty!39241 mapRes!39241))

(declare-fun res!708315 () Bool)

(assert (=> start!93764 (=> (not res!708315) (not e!603812))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93764 (= res!708315 (validMask!0 mask!1515))))

(assert (=> start!93764 e!603812))

(assert (=> start!93764 true))

(assert (=> start!93764 tp_is_empty!25047))

(declare-fun array_inv!25000 (array!67113) Bool)

(assert (=> start!93764 (and (array_inv!25000 _values!955) e!603810)))

(assert (=> start!93764 tp!75133))

(declare-fun array_inv!25001 (array!67115) Bool)

(assert (=> start!93764 (array_inv!25001 _keys!1163)))

(assert (= (and start!93764 res!708315) b!1060550))

(assert (= (and b!1060550 res!708313) b!1060555))

(assert (= (and b!1060555 res!708314) b!1060553))

(assert (= (and b!1060553 res!708316) b!1060552))

(assert (= (and b!1060554 condMapEmpty!39241) mapIsEmpty!39241))

(assert (= (and b!1060554 (not condMapEmpty!39241)) mapNonEmpty!39241))

(get-info :version)

(assert (= (and mapNonEmpty!39241 ((_ is ValueCellFull!11820) mapValue!39241)) b!1060556))

(assert (= (and b!1060554 ((_ is ValueCellFull!11820) mapDefault!39241)) b!1060551))

(assert (= start!93764 b!1060554))

(declare-fun m!979591 () Bool)

(assert (=> b!1060553 m!979591))

(declare-fun m!979593 () Bool)

(assert (=> start!93764 m!979593))

(declare-fun m!979595 () Bool)

(assert (=> start!93764 m!979595))

(declare-fun m!979597 () Bool)

(assert (=> start!93764 m!979597))

(declare-fun m!979599 () Bool)

(assert (=> b!1060552 m!979599))

(declare-fun m!979601 () Bool)

(assert (=> b!1060552 m!979601))

(declare-fun m!979603 () Bool)

(assert (=> b!1060555 m!979603))

(declare-fun m!979605 () Bool)

(assert (=> mapNonEmpty!39241 m!979605))

(check-sat (not mapNonEmpty!39241) (not b_next!21237) (not b!1060555) b_and!33951 (not b!1060552) (not b!1060553) (not start!93764) tp_is_empty!25047)
(check-sat b_and!33951 (not b_next!21237))
