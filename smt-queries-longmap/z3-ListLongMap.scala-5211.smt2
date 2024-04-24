; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70464 () Bool)

(assert start!70464)

(declare-fun b_free!12673 () Bool)

(declare-fun b_next!12673 () Bool)

(assert (=> start!70464 (= b_free!12673 (not b_next!12673))))

(declare-fun tp!44742 () Bool)

(declare-fun b_and!21483 () Bool)

(assert (=> start!70464 (= tp!44742 b_and!21483)))

(declare-fun b!817597 () Bool)

(declare-fun e!453656 () Bool)

(declare-fun tp_is_empty!14383 () Bool)

(assert (=> b!817597 (= e!453656 tp_is_empty!14383)))

(declare-fun b!817598 () Bool)

(declare-fun e!453660 () Bool)

(assert (=> b!817598 (= e!453660 true)))

(declare-datatypes ((array!44967 0))(
  ( (array!44968 (arr!21536 (Array (_ BitVec 32) (_ BitVec 64))) (size!21956 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44967)

(declare-datatypes ((V!24179 0))(
  ( (V!24180 (val!7239 Int)) )
))
(declare-fun zeroValueAfter!34 () V!24179)

(declare-fun minValue!754 () V!24179)

(declare-datatypes ((ValueCell!6776 0))(
  ( (ValueCellFull!6776 (v!9667 V!24179)) (EmptyCell!6776) )
))
(declare-datatypes ((array!44969 0))(
  ( (array!44970 (arr!21537 (Array (_ BitVec 32) ValueCell!6776)) (size!21957 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44969)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((tuple2!9420 0))(
  ( (tuple2!9421 (_1!4721 (_ BitVec 64)) (_2!4721 V!24179)) )
))
(declare-datatypes ((List!15232 0))(
  ( (Nil!15229) (Cons!15228 (h!16363 tuple2!9420) (t!21547 List!15232)) )
))
(declare-datatypes ((ListLongMap!8245 0))(
  ( (ListLongMap!8246 (toList!4138 List!15232)) )
))
(declare-fun lt!366192 () ListLongMap!8245)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2355 (array!44967 array!44969 (_ BitVec 32) (_ BitVec 32) V!24179 V!24179 (_ BitVec 32) Int) ListLongMap!8245)

(assert (=> b!817598 (= lt!366192 (getCurrentListMap!2355 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24179)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!366195 () ListLongMap!8245)

(declare-fun +!1815 (ListLongMap!8245 tuple2!9420) ListLongMap!8245)

(assert (=> b!817598 (= lt!366195 (+!1815 (getCurrentListMap!2355 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9421 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!817599 () Bool)

(declare-fun res!557916 () Bool)

(declare-fun e!453657 () Bool)

(assert (=> b!817599 (=> (not res!557916) (not e!453657))))

(assert (=> b!817599 (= res!557916 (and (= (size!21957 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21956 _keys!976) (size!21957 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!817600 () Bool)

(declare-fun e!453658 () Bool)

(declare-fun e!453659 () Bool)

(declare-fun mapRes!23164 () Bool)

(assert (=> b!817600 (= e!453658 (and e!453659 mapRes!23164))))

(declare-fun condMapEmpty!23164 () Bool)

(declare-fun mapDefault!23164 () ValueCell!6776)

(assert (=> b!817600 (= condMapEmpty!23164 (= (arr!21537 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6776)) mapDefault!23164)))))

(declare-fun b!817601 () Bool)

(declare-fun res!557917 () Bool)

(assert (=> b!817601 (=> (not res!557917) (not e!453657))))

(declare-datatypes ((List!15233 0))(
  ( (Nil!15230) (Cons!15229 (h!16364 (_ BitVec 64)) (t!21548 List!15233)) )
))
(declare-fun arrayNoDuplicates!0 (array!44967 (_ BitVec 32) List!15233) Bool)

(assert (=> b!817601 (= res!557917 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15230))))

(declare-fun res!557914 () Bool)

(assert (=> start!70464 (=> (not res!557914) (not e!453657))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70464 (= res!557914 (validMask!0 mask!1312))))

(assert (=> start!70464 e!453657))

(assert (=> start!70464 tp_is_empty!14383))

(declare-fun array_inv!17261 (array!44967) Bool)

(assert (=> start!70464 (array_inv!17261 _keys!976)))

(assert (=> start!70464 true))

(declare-fun array_inv!17262 (array!44969) Bool)

(assert (=> start!70464 (and (array_inv!17262 _values!788) e!453658)))

(assert (=> start!70464 tp!44742))

(declare-fun b!817602 () Bool)

(assert (=> b!817602 (= e!453657 (not e!453660))))

(declare-fun res!557913 () Bool)

(assert (=> b!817602 (=> res!557913 e!453660)))

(assert (=> b!817602 (= res!557913 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!366194 () ListLongMap!8245)

(declare-fun lt!366196 () ListLongMap!8245)

(assert (=> b!817602 (= lt!366194 lt!366196)))

(declare-datatypes ((Unit!27835 0))(
  ( (Unit!27836) )
))
(declare-fun lt!366193 () Unit!27835)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!328 (array!44967 array!44969 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24179 V!24179 V!24179 V!24179 (_ BitVec 32) Int) Unit!27835)

(assert (=> b!817602 (= lt!366193 (lemmaNoChangeToArrayThenSameMapNoExtras!328 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2240 (array!44967 array!44969 (_ BitVec 32) (_ BitVec 32) V!24179 V!24179 (_ BitVec 32) Int) ListLongMap!8245)

(assert (=> b!817602 (= lt!366196 (getCurrentListMapNoExtraKeys!2240 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817602 (= lt!366194 (getCurrentListMapNoExtraKeys!2240 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23164 () Bool)

(assert (=> mapIsEmpty!23164 mapRes!23164))

(declare-fun b!817603 () Bool)

(assert (=> b!817603 (= e!453659 tp_is_empty!14383)))

(declare-fun b!817604 () Bool)

(declare-fun res!557915 () Bool)

(assert (=> b!817604 (=> (not res!557915) (not e!453657))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44967 (_ BitVec 32)) Bool)

(assert (=> b!817604 (= res!557915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!23164 () Bool)

(declare-fun tp!44743 () Bool)

(assert (=> mapNonEmpty!23164 (= mapRes!23164 (and tp!44743 e!453656))))

(declare-fun mapKey!23164 () (_ BitVec 32))

(declare-fun mapValue!23164 () ValueCell!6776)

(declare-fun mapRest!23164 () (Array (_ BitVec 32) ValueCell!6776))

(assert (=> mapNonEmpty!23164 (= (arr!21537 _values!788) (store mapRest!23164 mapKey!23164 mapValue!23164))))

(assert (= (and start!70464 res!557914) b!817599))

(assert (= (and b!817599 res!557916) b!817604))

(assert (= (and b!817604 res!557915) b!817601))

(assert (= (and b!817601 res!557917) b!817602))

(assert (= (and b!817602 (not res!557913)) b!817598))

(assert (= (and b!817600 condMapEmpty!23164) mapIsEmpty!23164))

(assert (= (and b!817600 (not condMapEmpty!23164)) mapNonEmpty!23164))

(get-info :version)

(assert (= (and mapNonEmpty!23164 ((_ is ValueCellFull!6776) mapValue!23164)) b!817597))

(assert (= (and b!817600 ((_ is ValueCellFull!6776) mapDefault!23164)) b!817603))

(assert (= start!70464 b!817600))

(declare-fun m!759617 () Bool)

(assert (=> b!817601 m!759617))

(declare-fun m!759619 () Bool)

(assert (=> b!817602 m!759619))

(declare-fun m!759621 () Bool)

(assert (=> b!817602 m!759621))

(declare-fun m!759623 () Bool)

(assert (=> b!817602 m!759623))

(declare-fun m!759625 () Bool)

(assert (=> mapNonEmpty!23164 m!759625))

(declare-fun m!759627 () Bool)

(assert (=> b!817604 m!759627))

(declare-fun m!759629 () Bool)

(assert (=> b!817598 m!759629))

(declare-fun m!759631 () Bool)

(assert (=> b!817598 m!759631))

(assert (=> b!817598 m!759631))

(declare-fun m!759633 () Bool)

(assert (=> b!817598 m!759633))

(declare-fun m!759635 () Bool)

(assert (=> start!70464 m!759635))

(declare-fun m!759637 () Bool)

(assert (=> start!70464 m!759637))

(declare-fun m!759639 () Bool)

(assert (=> start!70464 m!759639))

(check-sat (not mapNonEmpty!23164) (not b_next!12673) (not b!817604) (not b!817601) tp_is_empty!14383 b_and!21483 (not start!70464) (not b!817598) (not b!817602))
(check-sat b_and!21483 (not b_next!12673))
