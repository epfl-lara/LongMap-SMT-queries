; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70710 () Bool)

(assert start!70710)

(declare-fun b_free!13003 () Bool)

(declare-fun b_next!13003 () Bool)

(assert (=> start!70710 (= b_free!13003 (not b_next!13003))))

(declare-fun tp!45751 () Bool)

(declare-fun b_and!21839 () Bool)

(assert (=> start!70710 (= tp!45751 b_and!21839)))

(declare-fun b!821307 () Bool)

(declare-fun res!560325 () Bool)

(declare-fun e!456461 () Bool)

(assert (=> b!821307 (=> (not res!560325) (not e!456461))))

(declare-datatypes ((array!45589 0))(
  ( (array!45590 (arr!21846 (Array (_ BitVec 32) (_ BitVec 64))) (size!22267 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45589)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24619 0))(
  ( (V!24620 (val!7404 Int)) )
))
(declare-datatypes ((ValueCell!6941 0))(
  ( (ValueCellFull!6941 (v!9829 V!24619)) (EmptyCell!6941) )
))
(declare-datatypes ((array!45591 0))(
  ( (array!45592 (arr!21847 (Array (_ BitVec 32) ValueCell!6941)) (size!22268 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45591)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!821307 (= res!560325 (and (= (size!22268 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22267 _keys!976) (size!22268 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!821308 () Bool)

(declare-fun e!456459 () Bool)

(declare-fun tp_is_empty!14713 () Bool)

(assert (=> b!821308 (= e!456459 tp_is_empty!14713)))

(declare-fun b!821309 () Bool)

(declare-fun e!456460 () Bool)

(declare-fun mapRes!23677 () Bool)

(assert (=> b!821309 (= e!456460 (and e!456459 mapRes!23677))))

(declare-fun condMapEmpty!23677 () Bool)

(declare-fun mapDefault!23677 () ValueCell!6941)

(assert (=> b!821309 (= condMapEmpty!23677 (= (arr!21847 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6941)) mapDefault!23677)))))

(declare-fun b!821310 () Bool)

(declare-fun e!456464 () Bool)

(assert (=> b!821310 (= e!456461 (not e!456464))))

(declare-fun res!560322 () Bool)

(assert (=> b!821310 (=> res!560322 e!456464)))

(assert (=> b!821310 (= res!560322 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9780 0))(
  ( (tuple2!9781 (_1!4901 (_ BitVec 64)) (_2!4901 V!24619)) )
))
(declare-datatypes ((List!15590 0))(
  ( (Nil!15587) (Cons!15586 (h!16715 tuple2!9780) (t!21916 List!15590)) )
))
(declare-datatypes ((ListLongMap!8593 0))(
  ( (ListLongMap!8594 (toList!4312 List!15590)) )
))
(declare-fun lt!369038 () ListLongMap!8593)

(declare-fun lt!369037 () ListLongMap!8593)

(assert (=> b!821310 (= lt!369038 lt!369037)))

(declare-fun zeroValueBefore!34 () V!24619)

(declare-datatypes ((Unit!28045 0))(
  ( (Unit!28046) )
))
(declare-fun lt!369036 () Unit!28045)

(declare-fun zeroValueAfter!34 () V!24619)

(declare-fun minValue!754 () V!24619)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!453 (array!45589 array!45591 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24619 V!24619 V!24619 V!24619 (_ BitVec 32) Int) Unit!28045)

(assert (=> b!821310 (= lt!369036 (lemmaNoChangeToArrayThenSameMapNoExtras!453 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2360 (array!45589 array!45591 (_ BitVec 32) (_ BitVec 32) V!24619 V!24619 (_ BitVec 32) Int) ListLongMap!8593)

(assert (=> b!821310 (= lt!369037 (getCurrentListMapNoExtraKeys!2360 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821310 (= lt!369038 (getCurrentListMapNoExtraKeys!2360 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!560326 () Bool)

(assert (=> start!70710 (=> (not res!560326) (not e!456461))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70710 (= res!560326 (validMask!0 mask!1312))))

(assert (=> start!70710 e!456461))

(assert (=> start!70710 tp_is_empty!14713))

(declare-fun array_inv!17527 (array!45589) Bool)

(assert (=> start!70710 (array_inv!17527 _keys!976)))

(assert (=> start!70710 true))

(declare-fun array_inv!17528 (array!45591) Bool)

(assert (=> start!70710 (and (array_inv!17528 _values!788) e!456460)))

(assert (=> start!70710 tp!45751))

(declare-fun b!821311 () Bool)

(declare-fun res!560323 () Bool)

(assert (=> b!821311 (=> (not res!560323) (not e!456461))))

(declare-datatypes ((List!15591 0))(
  ( (Nil!15588) (Cons!15587 (h!16716 (_ BitVec 64)) (t!21917 List!15591)) )
))
(declare-fun arrayNoDuplicates!0 (array!45589 (_ BitVec 32) List!15591) Bool)

(assert (=> b!821311 (= res!560323 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15588))))

(declare-fun b!821312 () Bool)

(declare-fun e!456462 () Bool)

(assert (=> b!821312 (= e!456462 tp_is_empty!14713)))

(declare-fun b!821313 () Bool)

(assert (=> b!821313 (= e!456464 true)))

(declare-fun lt!369035 () ListLongMap!8593)

(declare-fun getCurrentListMap!2439 (array!45589 array!45591 (_ BitVec 32) (_ BitVec 32) V!24619 V!24619 (_ BitVec 32) Int) ListLongMap!8593)

(assert (=> b!821313 (= lt!369035 (getCurrentListMap!2439 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821314 () Bool)

(declare-fun res!560324 () Bool)

(assert (=> b!821314 (=> (not res!560324) (not e!456461))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45589 (_ BitVec 32)) Bool)

(assert (=> b!821314 (= res!560324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!23677 () Bool)

(assert (=> mapIsEmpty!23677 mapRes!23677))

(declare-fun mapNonEmpty!23677 () Bool)

(declare-fun tp!45750 () Bool)

(assert (=> mapNonEmpty!23677 (= mapRes!23677 (and tp!45750 e!456462))))

(declare-fun mapValue!23677 () ValueCell!6941)

(declare-fun mapRest!23677 () (Array (_ BitVec 32) ValueCell!6941))

(declare-fun mapKey!23677 () (_ BitVec 32))

(assert (=> mapNonEmpty!23677 (= (arr!21847 _values!788) (store mapRest!23677 mapKey!23677 mapValue!23677))))

(assert (= (and start!70710 res!560326) b!821307))

(assert (= (and b!821307 res!560325) b!821314))

(assert (= (and b!821314 res!560324) b!821311))

(assert (= (and b!821311 res!560323) b!821310))

(assert (= (and b!821310 (not res!560322)) b!821313))

(assert (= (and b!821309 condMapEmpty!23677) mapIsEmpty!23677))

(assert (= (and b!821309 (not condMapEmpty!23677)) mapNonEmpty!23677))

(get-info :version)

(assert (= (and mapNonEmpty!23677 ((_ is ValueCellFull!6941) mapValue!23677)) b!821312))

(assert (= (and b!821309 ((_ is ValueCellFull!6941) mapDefault!23677)) b!821308))

(assert (= start!70710 b!821309))

(declare-fun m!762577 () Bool)

(assert (=> b!821311 m!762577))

(declare-fun m!762579 () Bool)

(assert (=> b!821313 m!762579))

(declare-fun m!762581 () Bool)

(assert (=> b!821314 m!762581))

(declare-fun m!762583 () Bool)

(assert (=> b!821310 m!762583))

(declare-fun m!762585 () Bool)

(assert (=> b!821310 m!762585))

(declare-fun m!762587 () Bool)

(assert (=> b!821310 m!762587))

(declare-fun m!762589 () Bool)

(assert (=> start!70710 m!762589))

(declare-fun m!762591 () Bool)

(assert (=> start!70710 m!762591))

(declare-fun m!762593 () Bool)

(assert (=> start!70710 m!762593))

(declare-fun m!762595 () Bool)

(assert (=> mapNonEmpty!23677 m!762595))

(check-sat tp_is_empty!14713 (not mapNonEmpty!23677) (not b!821313) (not b!821314) (not b!821310) (not b_next!13003) (not b!821311) (not start!70710) b_and!21839)
(check-sat b_and!21839 (not b_next!13003))
