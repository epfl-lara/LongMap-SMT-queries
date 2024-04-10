; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70354 () Bool)

(assert start!70354)

(declare-fun b_free!12711 () Bool)

(declare-fun b_next!12711 () Bool)

(assert (=> start!70354 (= b_free!12711 (not b_next!12711))))

(declare-fun tp!44859 () Bool)

(declare-fun b_and!21523 () Bool)

(assert (=> start!70354 (= tp!44859 b_and!21523)))

(declare-fun mapIsEmpty!23224 () Bool)

(declare-fun mapRes!23224 () Bool)

(assert (=> mapIsEmpty!23224 mapRes!23224))

(declare-fun mapNonEmpty!23224 () Bool)

(declare-fun tp!44860 () Bool)

(declare-fun e!453508 () Bool)

(assert (=> mapNonEmpty!23224 (= mapRes!23224 (and tp!44860 e!453508))))

(declare-datatypes ((V!24229 0))(
  ( (V!24230 (val!7258 Int)) )
))
(declare-datatypes ((ValueCell!6795 0))(
  ( (ValueCellFull!6795 (v!9687 V!24229)) (EmptyCell!6795) )
))
(declare-fun mapValue!23224 () ValueCell!6795)

(declare-fun mapKey!23224 () (_ BitVec 32))

(declare-datatypes ((array!45042 0))(
  ( (array!45043 (arr!21577 (Array (_ BitVec 32) ValueCell!6795)) (size!21998 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45042)

(declare-fun mapRest!23224 () (Array (_ BitVec 32) ValueCell!6795))

(assert (=> mapNonEmpty!23224 (= (arr!21577 _values!788) (store mapRest!23224 mapKey!23224 mapValue!23224))))

(declare-fun b!817320 () Bool)

(declare-fun e!453509 () Bool)

(declare-fun e!453506 () Bool)

(assert (=> b!817320 (= e!453509 (and e!453506 mapRes!23224))))

(declare-fun condMapEmpty!23224 () Bool)

(declare-fun mapDefault!23224 () ValueCell!6795)

(assert (=> b!817320 (= condMapEmpty!23224 (= (arr!21577 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6795)) mapDefault!23224)))))

(declare-fun b!817321 () Bool)

(declare-fun e!453510 () Bool)

(assert (=> b!817321 (= e!453510 (not true))))

(declare-datatypes ((tuple2!9536 0))(
  ( (tuple2!9537 (_1!4779 (_ BitVec 64)) (_2!4779 V!24229)) )
))
(declare-datatypes ((List!15365 0))(
  ( (Nil!15362) (Cons!15361 (h!16490 tuple2!9536) (t!21690 List!15365)) )
))
(declare-datatypes ((ListLongMap!8359 0))(
  ( (ListLongMap!8360 (toList!4195 List!15365)) )
))
(declare-fun lt!366199 () ListLongMap!8359)

(declare-fun lt!366201 () ListLongMap!8359)

(assert (=> b!817321 (= lt!366199 lt!366201)))

(declare-fun zeroValueBefore!34 () V!24229)

(declare-datatypes ((array!45044 0))(
  ( (array!45045 (arr!21578 (Array (_ BitVec 32) (_ BitVec 64))) (size!21999 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45044)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24229)

(declare-fun minValue!754 () V!24229)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27874 0))(
  ( (Unit!27875) )
))
(declare-fun lt!366200 () Unit!27874)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!346 (array!45044 array!45042 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24229 V!24229 V!24229 V!24229 (_ BitVec 32) Int) Unit!27874)

(assert (=> b!817321 (= lt!366200 (lemmaNoChangeToArrayThenSameMapNoExtras!346 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2236 (array!45044 array!45042 (_ BitVec 32) (_ BitVec 32) V!24229 V!24229 (_ BitVec 32) Int) ListLongMap!8359)

(assert (=> b!817321 (= lt!366201 (getCurrentListMapNoExtraKeys!2236 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817321 (= lt!366199 (getCurrentListMapNoExtraKeys!2236 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!817322 () Bool)

(declare-fun res!557912 () Bool)

(assert (=> b!817322 (=> (not res!557912) (not e!453510))))

(declare-datatypes ((List!15366 0))(
  ( (Nil!15363) (Cons!15362 (h!16491 (_ BitVec 64)) (t!21691 List!15366)) )
))
(declare-fun arrayNoDuplicates!0 (array!45044 (_ BitVec 32) List!15366) Bool)

(assert (=> b!817322 (= res!557912 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15363))))

(declare-fun b!817323 () Bool)

(declare-fun res!557911 () Bool)

(assert (=> b!817323 (=> (not res!557911) (not e!453510))))

(assert (=> b!817323 (= res!557911 (and (= (size!21998 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21999 _keys!976) (size!21998 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!557914 () Bool)

(assert (=> start!70354 (=> (not res!557914) (not e!453510))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70354 (= res!557914 (validMask!0 mask!1312))))

(assert (=> start!70354 e!453510))

(declare-fun tp_is_empty!14421 () Bool)

(assert (=> start!70354 tp_is_empty!14421))

(declare-fun array_inv!17265 (array!45044) Bool)

(assert (=> start!70354 (array_inv!17265 _keys!976)))

(assert (=> start!70354 true))

(declare-fun array_inv!17266 (array!45042) Bool)

(assert (=> start!70354 (and (array_inv!17266 _values!788) e!453509)))

(assert (=> start!70354 tp!44859))

(declare-fun b!817324 () Bool)

(assert (=> b!817324 (= e!453506 tp_is_empty!14421)))

(declare-fun b!817325 () Bool)

(declare-fun res!557913 () Bool)

(assert (=> b!817325 (=> (not res!557913) (not e!453510))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45044 (_ BitVec 32)) Bool)

(assert (=> b!817325 (= res!557913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!817326 () Bool)

(assert (=> b!817326 (= e!453508 tp_is_empty!14421)))

(assert (= (and start!70354 res!557914) b!817323))

(assert (= (and b!817323 res!557911) b!817325))

(assert (= (and b!817325 res!557913) b!817322))

(assert (= (and b!817322 res!557912) b!817321))

(assert (= (and b!817320 condMapEmpty!23224) mapIsEmpty!23224))

(assert (= (and b!817320 (not condMapEmpty!23224)) mapNonEmpty!23224))

(get-info :version)

(assert (= (and mapNonEmpty!23224 ((_ is ValueCellFull!6795) mapValue!23224)) b!817326))

(assert (= (and b!817320 ((_ is ValueCellFull!6795) mapDefault!23224)) b!817324))

(assert (= start!70354 b!817320))

(declare-fun m!758919 () Bool)

(assert (=> b!817325 m!758919))

(declare-fun m!758921 () Bool)

(assert (=> b!817321 m!758921))

(declare-fun m!758923 () Bool)

(assert (=> b!817321 m!758923))

(declare-fun m!758925 () Bool)

(assert (=> b!817321 m!758925))

(declare-fun m!758927 () Bool)

(assert (=> start!70354 m!758927))

(declare-fun m!758929 () Bool)

(assert (=> start!70354 m!758929))

(declare-fun m!758931 () Bool)

(assert (=> start!70354 m!758931))

(declare-fun m!758933 () Bool)

(assert (=> b!817322 m!758933))

(declare-fun m!758935 () Bool)

(assert (=> mapNonEmpty!23224 m!758935))

(check-sat (not b_next!12711) (not mapNonEmpty!23224) (not b!817322) (not start!70354) b_and!21523 (not b!817325) tp_is_empty!14421 (not b!817321))
(check-sat b_and!21523 (not b_next!12711))
