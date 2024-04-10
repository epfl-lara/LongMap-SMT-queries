; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93716 () Bool)

(assert start!93716)

(declare-fun b_free!21201 () Bool)

(declare-fun b_next!21201 () Bool)

(assert (=> start!93716 (= b_free!21201 (not b_next!21201))))

(declare-fun tp!75023 () Bool)

(declare-fun b_and!33911 () Bool)

(assert (=> start!93716 (= tp!75023 b_and!33911)))

(declare-fun b!1060099 () Bool)

(declare-fun res!708070 () Bool)

(declare-fun e!603491 () Bool)

(assert (=> b!1060099 (=> (not res!708070) (not e!603491))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38483 0))(
  ( (V!38484 (val!12556 Int)) )
))
(declare-datatypes ((ValueCell!11802 0))(
  ( (ValueCellFull!11802 (v!15166 V!38483)) (EmptyCell!11802) )
))
(declare-datatypes ((array!67045 0))(
  ( (array!67046 (arr!32231 (Array (_ BitVec 32) ValueCell!11802)) (size!32767 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67045)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67047 0))(
  ( (array!67048 (arr!32232 (Array (_ BitVec 32) (_ BitVec 64))) (size!32768 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67047)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1060099 (= res!708070 (and (= (size!32767 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32768 _keys!1163) (size!32767 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!708072 () Bool)

(assert (=> start!93716 (=> (not res!708072) (not e!603491))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93716 (= res!708072 (validMask!0 mask!1515))))

(assert (=> start!93716 e!603491))

(assert (=> start!93716 true))

(declare-fun tp_is_empty!25011 () Bool)

(assert (=> start!93716 tp_is_empty!25011))

(declare-fun e!603492 () Bool)

(declare-fun array_inv!24980 (array!67045) Bool)

(assert (=> start!93716 (and (array_inv!24980 _values!955) e!603492)))

(assert (=> start!93716 tp!75023))

(declare-fun array_inv!24981 (array!67047) Bool)

(assert (=> start!93716 (array_inv!24981 _keys!1163)))

(declare-fun b!1060100 () Bool)

(declare-fun res!708071 () Bool)

(assert (=> b!1060100 (=> (not res!708071) (not e!603491))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67047 (_ BitVec 32)) Bool)

(assert (=> b!1060100 (= res!708071 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1060101 () Bool)

(declare-fun e!603495 () Bool)

(assert (=> b!1060101 (= e!603495 tp_is_empty!25011)))

(declare-fun b!1060102 () Bool)

(assert (=> b!1060102 (= e!603491 false)))

(declare-fun zeroValueBefore!47 () V!38483)

(declare-datatypes ((tuple2!15872 0))(
  ( (tuple2!15873 (_1!7947 (_ BitVec 64)) (_2!7947 V!38483)) )
))
(declare-datatypes ((List!22458 0))(
  ( (Nil!22455) (Cons!22454 (h!23663 tuple2!15872) (t!31765 List!22458)) )
))
(declare-datatypes ((ListLongMap!13841 0))(
  ( (ListLongMap!13842 (toList!6936 List!22458)) )
))
(declare-fun lt!467221 () ListLongMap!13841)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38483)

(declare-fun getCurrentListMapNoExtraKeys!3538 (array!67047 array!67045 (_ BitVec 32) (_ BitVec 32) V!38483 V!38483 (_ BitVec 32) Int) ListLongMap!13841)

(assert (=> b!1060102 (= lt!467221 (getCurrentListMapNoExtraKeys!3538 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39184 () Bool)

(declare-fun mapRes!39184 () Bool)

(assert (=> mapIsEmpty!39184 mapRes!39184))

(declare-fun b!1060103 () Bool)

(declare-fun e!603494 () Bool)

(assert (=> b!1060103 (= e!603494 tp_is_empty!25011)))

(declare-fun b!1060104 () Bool)

(declare-fun res!708073 () Bool)

(assert (=> b!1060104 (=> (not res!708073) (not e!603491))))

(declare-datatypes ((List!22459 0))(
  ( (Nil!22456) (Cons!22455 (h!23664 (_ BitVec 64)) (t!31766 List!22459)) )
))
(declare-fun arrayNoDuplicates!0 (array!67047 (_ BitVec 32) List!22459) Bool)

(assert (=> b!1060104 (= res!708073 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22456))))

(declare-fun mapNonEmpty!39184 () Bool)

(declare-fun tp!75022 () Bool)

(assert (=> mapNonEmpty!39184 (= mapRes!39184 (and tp!75022 e!603494))))

(declare-fun mapKey!39184 () (_ BitVec 32))

(declare-fun mapRest!39184 () (Array (_ BitVec 32) ValueCell!11802))

(declare-fun mapValue!39184 () ValueCell!11802)

(assert (=> mapNonEmpty!39184 (= (arr!32231 _values!955) (store mapRest!39184 mapKey!39184 mapValue!39184))))

(declare-fun b!1060105 () Bool)

(assert (=> b!1060105 (= e!603492 (and e!603495 mapRes!39184))))

(declare-fun condMapEmpty!39184 () Bool)

(declare-fun mapDefault!39184 () ValueCell!11802)

(assert (=> b!1060105 (= condMapEmpty!39184 (= (arr!32231 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11802)) mapDefault!39184)))))

(assert (= (and start!93716 res!708072) b!1060099))

(assert (= (and b!1060099 res!708070) b!1060100))

(assert (= (and b!1060100 res!708071) b!1060104))

(assert (= (and b!1060104 res!708073) b!1060102))

(assert (= (and b!1060105 condMapEmpty!39184) mapIsEmpty!39184))

(assert (= (and b!1060105 (not condMapEmpty!39184)) mapNonEmpty!39184))

(get-info :version)

(assert (= (and mapNonEmpty!39184 ((_ is ValueCellFull!11802) mapValue!39184)) b!1060103))

(assert (= (and b!1060105 ((_ is ValueCellFull!11802) mapDefault!39184)) b!1060101))

(assert (= start!93716 b!1060105))

(declare-fun m!979293 () Bool)

(assert (=> mapNonEmpty!39184 m!979293))

(declare-fun m!979295 () Bool)

(assert (=> b!1060104 m!979295))

(declare-fun m!979297 () Bool)

(assert (=> start!93716 m!979297))

(declare-fun m!979299 () Bool)

(assert (=> start!93716 m!979299))

(declare-fun m!979301 () Bool)

(assert (=> start!93716 m!979301))

(declare-fun m!979303 () Bool)

(assert (=> b!1060102 m!979303))

(declare-fun m!979305 () Bool)

(assert (=> b!1060100 m!979305))

(check-sat (not b!1060102) (not b!1060100) (not start!93716) (not b!1060104) b_and!33911 (not mapNonEmpty!39184) (not b_next!21201) tp_is_empty!25011)
(check-sat b_and!33911 (not b_next!21201))
