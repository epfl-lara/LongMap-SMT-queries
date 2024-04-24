; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70960 () Bool)

(assert start!70960)

(declare-fun b_free!13051 () Bool)

(declare-fun b_next!13051 () Bool)

(assert (=> start!70960 (= b_free!13051 (not b_next!13051))))

(declare-fun tp!45898 () Bool)

(declare-fun b_and!21933 () Bool)

(assert (=> start!70960 (= tp!45898 b_and!21933)))

(declare-fun b!823180 () Bool)

(declare-fun e!457727 () Bool)

(declare-fun tp_is_empty!14761 () Bool)

(assert (=> b!823180 (= e!457727 tp_is_empty!14761)))

(declare-fun b!823181 () Bool)

(declare-fun e!457723 () Bool)

(declare-fun e!457722 () Bool)

(assert (=> b!823181 (= e!457723 (not e!457722))))

(declare-fun res!561204 () Bool)

(assert (=> b!823181 (=> res!561204 e!457722)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!823181 (= res!561204 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!24683 0))(
  ( (V!24684 (val!7428 Int)) )
))
(declare-datatypes ((tuple2!9728 0))(
  ( (tuple2!9729 (_1!4875 (_ BitVec 64)) (_2!4875 V!24683)) )
))
(declare-datatypes ((List!15516 0))(
  ( (Nil!15513) (Cons!15512 (h!16647 tuple2!9728) (t!21845 List!15516)) )
))
(declare-datatypes ((ListLongMap!8553 0))(
  ( (ListLongMap!8554 (toList!4292 List!15516)) )
))
(declare-fun lt!370280 () ListLongMap!8553)

(declare-fun lt!370277 () ListLongMap!8553)

(assert (=> b!823181 (= lt!370280 lt!370277)))

(declare-fun zeroValueBefore!34 () V!24683)

(declare-datatypes ((array!45717 0))(
  ( (array!45718 (arr!21904 (Array (_ BitVec 32) (_ BitVec 64))) (size!22324 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45717)

(declare-fun zeroValueAfter!34 () V!24683)

(declare-fun minValue!754 () V!24683)

(declare-datatypes ((ValueCell!6965 0))(
  ( (ValueCellFull!6965 (v!9859 V!24683)) (EmptyCell!6965) )
))
(declare-datatypes ((array!45719 0))(
  ( (array!45720 (arr!21905 (Array (_ BitVec 32) ValueCell!6965)) (size!22325 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45719)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28133 0))(
  ( (Unit!28134) )
))
(declare-fun lt!370272 () Unit!28133)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!467 (array!45717 array!45719 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24683 V!24683 V!24683 V!24683 (_ BitVec 32) Int) Unit!28133)

(assert (=> b!823181 (= lt!370272 (lemmaNoChangeToArrayThenSameMapNoExtras!467 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2379 (array!45717 array!45719 (_ BitVec 32) (_ BitVec 32) V!24683 V!24683 (_ BitVec 32) Int) ListLongMap!8553)

(assert (=> b!823181 (= lt!370277 (getCurrentListMapNoExtraKeys!2379 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823181 (= lt!370280 (getCurrentListMapNoExtraKeys!2379 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823182 () Bool)

(assert (=> b!823182 (= e!457722 true)))

(declare-fun lt!370278 () ListLongMap!8553)

(declare-fun lt!370273 () ListLongMap!8553)

(declare-fun lt!370276 () tuple2!9728)

(declare-fun +!1882 (ListLongMap!8553 tuple2!9728) ListLongMap!8553)

(assert (=> b!823182 (= lt!370278 (+!1882 lt!370273 lt!370276))))

(declare-fun lt!370279 () Unit!28133)

(declare-fun addCommutativeForDiffKeys!440 (ListLongMap!8553 (_ BitVec 64) V!24683 (_ BitVec 64) V!24683) Unit!28133)

(assert (=> b!823182 (= lt!370279 (addCommutativeForDiffKeys!440 lt!370280 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370274 () ListLongMap!8553)

(assert (=> b!823182 (= lt!370274 lt!370278)))

(declare-fun lt!370281 () tuple2!9728)

(assert (=> b!823182 (= lt!370278 (+!1882 (+!1882 lt!370280 lt!370276) lt!370281))))

(assert (=> b!823182 (= lt!370276 (tuple2!9729 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370275 () ListLongMap!8553)

(assert (=> b!823182 (= lt!370275 lt!370273)))

(assert (=> b!823182 (= lt!370273 (+!1882 lt!370280 lt!370281))))

(assert (=> b!823182 (= lt!370281 (tuple2!9729 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2446 (array!45717 array!45719 (_ BitVec 32) (_ BitVec 32) V!24683 V!24683 (_ BitVec 32) Int) ListLongMap!8553)

(assert (=> b!823182 (= lt!370274 (getCurrentListMap!2446 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823182 (= lt!370275 (getCurrentListMap!2446 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23752 () Bool)

(declare-fun mapRes!23752 () Bool)

(assert (=> mapIsEmpty!23752 mapRes!23752))

(declare-fun res!561201 () Bool)

(assert (=> start!70960 (=> (not res!561201) (not e!457723))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70960 (= res!561201 (validMask!0 mask!1312))))

(assert (=> start!70960 e!457723))

(assert (=> start!70960 tp_is_empty!14761))

(declare-fun array_inv!17527 (array!45717) Bool)

(assert (=> start!70960 (array_inv!17527 _keys!976)))

(assert (=> start!70960 true))

(declare-fun e!457724 () Bool)

(declare-fun array_inv!17528 (array!45719) Bool)

(assert (=> start!70960 (and (array_inv!17528 _values!788) e!457724)))

(assert (=> start!70960 tp!45898))

(declare-fun b!823183 () Bool)

(declare-fun e!457725 () Bool)

(assert (=> b!823183 (= e!457725 tp_is_empty!14761)))

(declare-fun b!823184 () Bool)

(declare-fun res!561205 () Bool)

(assert (=> b!823184 (=> (not res!561205) (not e!457723))))

(declare-datatypes ((List!15517 0))(
  ( (Nil!15514) (Cons!15513 (h!16648 (_ BitVec 64)) (t!21846 List!15517)) )
))
(declare-fun arrayNoDuplicates!0 (array!45717 (_ BitVec 32) List!15517) Bool)

(assert (=> b!823184 (= res!561205 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15514))))

(declare-fun mapNonEmpty!23752 () Bool)

(declare-fun tp!45897 () Bool)

(assert (=> mapNonEmpty!23752 (= mapRes!23752 (and tp!45897 e!457725))))

(declare-fun mapValue!23752 () ValueCell!6965)

(declare-fun mapKey!23752 () (_ BitVec 32))

(declare-fun mapRest!23752 () (Array (_ BitVec 32) ValueCell!6965))

(assert (=> mapNonEmpty!23752 (= (arr!21905 _values!788) (store mapRest!23752 mapKey!23752 mapValue!23752))))

(declare-fun b!823185 () Bool)

(declare-fun res!561202 () Bool)

(assert (=> b!823185 (=> (not res!561202) (not e!457723))))

(assert (=> b!823185 (= res!561202 (and (= (size!22325 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22324 _keys!976) (size!22325 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!823186 () Bool)

(assert (=> b!823186 (= e!457724 (and e!457727 mapRes!23752))))

(declare-fun condMapEmpty!23752 () Bool)

(declare-fun mapDefault!23752 () ValueCell!6965)

(assert (=> b!823186 (= condMapEmpty!23752 (= (arr!21905 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6965)) mapDefault!23752)))))

(declare-fun b!823187 () Bool)

(declare-fun res!561203 () Bool)

(assert (=> b!823187 (=> (not res!561203) (not e!457723))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45717 (_ BitVec 32)) Bool)

(assert (=> b!823187 (= res!561203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!70960 res!561201) b!823185))

(assert (= (and b!823185 res!561202) b!823187))

(assert (= (and b!823187 res!561203) b!823184))

(assert (= (and b!823184 res!561205) b!823181))

(assert (= (and b!823181 (not res!561204)) b!823182))

(assert (= (and b!823186 condMapEmpty!23752) mapIsEmpty!23752))

(assert (= (and b!823186 (not condMapEmpty!23752)) mapNonEmpty!23752))

(get-info :version)

(assert (= (and mapNonEmpty!23752 ((_ is ValueCellFull!6965) mapValue!23752)) b!823183))

(assert (= (and b!823186 ((_ is ValueCellFull!6965) mapDefault!23752)) b!823180))

(assert (= start!70960 b!823186))

(declare-fun m!765371 () Bool)

(assert (=> b!823187 m!765371))

(declare-fun m!765373 () Bool)

(assert (=> b!823184 m!765373))

(declare-fun m!765375 () Bool)

(assert (=> b!823182 m!765375))

(declare-fun m!765377 () Bool)

(assert (=> b!823182 m!765377))

(declare-fun m!765379 () Bool)

(assert (=> b!823182 m!765379))

(declare-fun m!765381 () Bool)

(assert (=> b!823182 m!765381))

(declare-fun m!765383 () Bool)

(assert (=> b!823182 m!765383))

(declare-fun m!765385 () Bool)

(assert (=> b!823182 m!765385))

(assert (=> b!823182 m!765379))

(declare-fun m!765387 () Bool)

(assert (=> b!823182 m!765387))

(declare-fun m!765389 () Bool)

(assert (=> b!823181 m!765389))

(declare-fun m!765391 () Bool)

(assert (=> b!823181 m!765391))

(declare-fun m!765393 () Bool)

(assert (=> b!823181 m!765393))

(declare-fun m!765395 () Bool)

(assert (=> start!70960 m!765395))

(declare-fun m!765397 () Bool)

(assert (=> start!70960 m!765397))

(declare-fun m!765399 () Bool)

(assert (=> start!70960 m!765399))

(declare-fun m!765401 () Bool)

(assert (=> mapNonEmpty!23752 m!765401))

(check-sat (not b!823184) (not b!823182) (not start!70960) b_and!21933 (not b!823187) (not b_next!13051) (not mapNonEmpty!23752) (not b!823181) tp_is_empty!14761)
(check-sat b_and!21933 (not b_next!13051))
