; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70698 () Bool)

(assert start!70698)

(declare-fun b_free!12991 () Bool)

(declare-fun b_next!12991 () Bool)

(assert (=> start!70698 (= b_free!12991 (not b_next!12991))))

(declare-fun tp!45715 () Bool)

(declare-fun b_and!21827 () Bool)

(assert (=> start!70698 (= tp!45715 b_and!21827)))

(declare-fun mapIsEmpty!23659 () Bool)

(declare-fun mapRes!23659 () Bool)

(assert (=> mapIsEmpty!23659 mapRes!23659))

(declare-fun mapNonEmpty!23659 () Bool)

(declare-fun tp!45714 () Bool)

(declare-fun e!456353 () Bool)

(assert (=> mapNonEmpty!23659 (= mapRes!23659 (and tp!45714 e!456353))))

(declare-datatypes ((V!24603 0))(
  ( (V!24604 (val!7398 Int)) )
))
(declare-datatypes ((ValueCell!6935 0))(
  ( (ValueCellFull!6935 (v!9823 V!24603)) (EmptyCell!6935) )
))
(declare-datatypes ((array!45567 0))(
  ( (array!45568 (arr!21835 (Array (_ BitVec 32) ValueCell!6935)) (size!22256 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45567)

(declare-fun mapRest!23659 () (Array (_ BitVec 32) ValueCell!6935))

(declare-fun mapKey!23659 () (_ BitVec 32))

(declare-fun mapValue!23659 () ValueCell!6935)

(assert (=> mapNonEmpty!23659 (= (arr!21835 _values!788) (store mapRest!23659 mapKey!23659 mapValue!23659))))

(declare-fun b!821163 () Bool)

(declare-fun e!456352 () Bool)

(declare-fun tp_is_empty!14701 () Bool)

(assert (=> b!821163 (= e!456352 tp_is_empty!14701)))

(declare-fun b!821164 () Bool)

(declare-fun res!560232 () Bool)

(declare-fun e!456355 () Bool)

(assert (=> b!821164 (=> (not res!560232) (not e!456355))))

(declare-datatypes ((array!45569 0))(
  ( (array!45570 (arr!21836 (Array (_ BitVec 32) (_ BitVec 64))) (size!22257 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45569)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!821164 (= res!560232 (and (= (size!22256 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22257 _keys!976) (size!22256 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!821165 () Bool)

(assert (=> b!821165 (= e!456353 tp_is_empty!14701)))

(declare-fun res!560236 () Bool)

(assert (=> start!70698 (=> (not res!560236) (not e!456355))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70698 (= res!560236 (validMask!0 mask!1312))))

(assert (=> start!70698 e!456355))

(assert (=> start!70698 tp_is_empty!14701))

(declare-fun array_inv!17521 (array!45569) Bool)

(assert (=> start!70698 (array_inv!17521 _keys!976)))

(assert (=> start!70698 true))

(declare-fun e!456354 () Bool)

(declare-fun array_inv!17522 (array!45567) Bool)

(assert (=> start!70698 (and (array_inv!17522 _values!788) e!456354)))

(assert (=> start!70698 tp!45715))

(declare-fun b!821166 () Bool)

(declare-fun res!560234 () Bool)

(assert (=> b!821166 (=> (not res!560234) (not e!456355))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45569 (_ BitVec 32)) Bool)

(assert (=> b!821166 (= res!560234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!821167 () Bool)

(declare-fun res!560235 () Bool)

(assert (=> b!821167 (=> (not res!560235) (not e!456355))))

(declare-datatypes ((List!15582 0))(
  ( (Nil!15579) (Cons!15578 (h!16707 (_ BitVec 64)) (t!21908 List!15582)) )
))
(declare-fun arrayNoDuplicates!0 (array!45569 (_ BitVec 32) List!15582) Bool)

(assert (=> b!821167 (= res!560235 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15579))))

(declare-fun b!821168 () Bool)

(declare-fun e!456356 () Bool)

(assert (=> b!821168 (= e!456355 (not e!456356))))

(declare-fun res!560233 () Bool)

(assert (=> b!821168 (=> res!560233 e!456356)))

(assert (=> b!821168 (= res!560233 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9772 0))(
  ( (tuple2!9773 (_1!4897 (_ BitVec 64)) (_2!4897 V!24603)) )
))
(declare-datatypes ((List!15583 0))(
  ( (Nil!15580) (Cons!15579 (h!16708 tuple2!9772) (t!21909 List!15583)) )
))
(declare-datatypes ((ListLongMap!8585 0))(
  ( (ListLongMap!8586 (toList!4308 List!15583)) )
))
(declare-fun lt!368964 () ListLongMap!8585)

(declare-fun lt!368966 () ListLongMap!8585)

(assert (=> b!821168 (= lt!368964 lt!368966)))

(declare-fun zeroValueBefore!34 () V!24603)

(declare-fun zeroValueAfter!34 () V!24603)

(declare-fun defaultEntry!796 () Int)

(declare-fun minValue!754 () V!24603)

(declare-datatypes ((Unit!28037 0))(
  ( (Unit!28038) )
))
(declare-fun lt!368963 () Unit!28037)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!449 (array!45569 array!45567 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24603 V!24603 V!24603 V!24603 (_ BitVec 32) Int) Unit!28037)

(assert (=> b!821168 (= lt!368963 (lemmaNoChangeToArrayThenSameMapNoExtras!449 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2356 (array!45569 array!45567 (_ BitVec 32) (_ BitVec 32) V!24603 V!24603 (_ BitVec 32) Int) ListLongMap!8585)

(assert (=> b!821168 (= lt!368966 (getCurrentListMapNoExtraKeys!2356 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821168 (= lt!368964 (getCurrentListMapNoExtraKeys!2356 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821169 () Bool)

(assert (=> b!821169 (= e!456356 true)))

(declare-fun lt!368965 () ListLongMap!8585)

(declare-fun getCurrentListMap!2436 (array!45569 array!45567 (_ BitVec 32) (_ BitVec 32) V!24603 V!24603 (_ BitVec 32) Int) ListLongMap!8585)

(assert (=> b!821169 (= lt!368965 (getCurrentListMap!2436 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821170 () Bool)

(assert (=> b!821170 (= e!456354 (and e!456352 mapRes!23659))))

(declare-fun condMapEmpty!23659 () Bool)

(declare-fun mapDefault!23659 () ValueCell!6935)

(assert (=> b!821170 (= condMapEmpty!23659 (= (arr!21835 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6935)) mapDefault!23659)))))

(assert (= (and start!70698 res!560236) b!821164))

(assert (= (and b!821164 res!560232) b!821166))

(assert (= (and b!821166 res!560234) b!821167))

(assert (= (and b!821167 res!560235) b!821168))

(assert (= (and b!821168 (not res!560233)) b!821169))

(assert (= (and b!821170 condMapEmpty!23659) mapIsEmpty!23659))

(assert (= (and b!821170 (not condMapEmpty!23659)) mapNonEmpty!23659))

(get-info :version)

(assert (= (and mapNonEmpty!23659 ((_ is ValueCellFull!6935) mapValue!23659)) b!821165))

(assert (= (and b!821170 ((_ is ValueCellFull!6935) mapDefault!23659)) b!821163))

(assert (= start!70698 b!821170))

(declare-fun m!762457 () Bool)

(assert (=> mapNonEmpty!23659 m!762457))

(declare-fun m!762459 () Bool)

(assert (=> b!821167 m!762459))

(declare-fun m!762461 () Bool)

(assert (=> b!821166 m!762461))

(declare-fun m!762463 () Bool)

(assert (=> b!821169 m!762463))

(declare-fun m!762465 () Bool)

(assert (=> b!821168 m!762465))

(declare-fun m!762467 () Bool)

(assert (=> b!821168 m!762467))

(declare-fun m!762469 () Bool)

(assert (=> b!821168 m!762469))

(declare-fun m!762471 () Bool)

(assert (=> start!70698 m!762471))

(declare-fun m!762473 () Bool)

(assert (=> start!70698 m!762473))

(declare-fun m!762475 () Bool)

(assert (=> start!70698 m!762475))

(check-sat b_and!21827 (not b_next!12991) (not start!70698) (not b!821166) (not mapNonEmpty!23659) (not b!821168) (not b!821167) (not b!821169) tp_is_empty!14701)
(check-sat b_and!21827 (not b_next!12991))
