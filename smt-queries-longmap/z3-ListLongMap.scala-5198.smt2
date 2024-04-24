; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70368 () Bool)

(assert start!70368)

(declare-fun b_free!12595 () Bool)

(declare-fun b_next!12595 () Bool)

(assert (=> start!70368 (= b_free!12595 (not b_next!12595))))

(declare-fun tp!44506 () Bool)

(declare-fun b_and!21393 () Bool)

(assert (=> start!70368 (= tp!44506 b_and!21393)))

(declare-fun b!816477 () Bool)

(declare-fun res!557249 () Bool)

(declare-fun e!452844 () Bool)

(assert (=> b!816477 (=> (not res!557249) (not e!452844))))

(declare-datatypes ((array!44811 0))(
  ( (array!44812 (arr!21459 (Array (_ BitVec 32) (_ BitVec 64))) (size!21879 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44811)

(declare-datatypes ((List!15179 0))(
  ( (Nil!15176) (Cons!15175 (h!16310 (_ BitVec 64)) (t!21492 List!15179)) )
))
(declare-fun arrayNoDuplicates!0 (array!44811 (_ BitVec 32) List!15179) Bool)

(assert (=> b!816477 (= res!557249 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15176))))

(declare-fun b!816478 () Bool)

(declare-fun e!452848 () Bool)

(declare-fun e!452847 () Bool)

(declare-fun mapRes!23044 () Bool)

(assert (=> b!816478 (= e!452848 (and e!452847 mapRes!23044))))

(declare-fun condMapEmpty!23044 () Bool)

(declare-datatypes ((V!24075 0))(
  ( (V!24076 (val!7200 Int)) )
))
(declare-datatypes ((ValueCell!6737 0))(
  ( (ValueCellFull!6737 (v!9627 V!24075)) (EmptyCell!6737) )
))
(declare-datatypes ((array!44813 0))(
  ( (array!44814 (arr!21460 (Array (_ BitVec 32) ValueCell!6737)) (size!21880 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44813)

(declare-fun mapDefault!23044 () ValueCell!6737)

(assert (=> b!816478 (= condMapEmpty!23044 (= (arr!21460 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6737)) mapDefault!23044)))))

(declare-fun b!816479 () Bool)

(declare-fun res!557247 () Bool)

(assert (=> b!816479 (=> (not res!557247) (not e!452844))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!816479 (= res!557247 (and (= (size!21880 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21879 _keys!976) (size!21880 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23044 () Bool)

(assert (=> mapIsEmpty!23044 mapRes!23044))

(declare-fun b!816480 () Bool)

(declare-fun e!452843 () Bool)

(assert (=> b!816480 (= e!452843 true)))

(declare-fun zeroValueAfter!34 () V!24075)

(declare-fun minValue!754 () V!24075)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9364 0))(
  ( (tuple2!9365 (_1!4693 (_ BitVec 64)) (_2!4693 V!24075)) )
))
(declare-datatypes ((List!15180 0))(
  ( (Nil!15177) (Cons!15176 (h!16311 tuple2!9364) (t!21493 List!15180)) )
))
(declare-datatypes ((ListLongMap!8189 0))(
  ( (ListLongMap!8190 (toList!4110 List!15180)) )
))
(declare-fun lt!365486 () ListLongMap!8189)

(declare-fun getCurrentListMap!2331 (array!44811 array!44813 (_ BitVec 32) (_ BitVec 32) V!24075 V!24075 (_ BitVec 32) Int) ListLongMap!8189)

(assert (=> b!816480 (= lt!365486 (getCurrentListMap!2331 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24075)

(declare-fun lt!365487 () ListLongMap!8189)

(declare-fun +!1791 (ListLongMap!8189 tuple2!9364) ListLongMap!8189)

(assert (=> b!816480 (= lt!365487 (+!1791 (getCurrentListMap!2331 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9365 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!816481 () Bool)

(declare-fun res!557246 () Bool)

(assert (=> b!816481 (=> (not res!557246) (not e!452844))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44811 (_ BitVec 32)) Bool)

(assert (=> b!816481 (= res!557246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!816482 () Bool)

(declare-fun tp_is_empty!14305 () Bool)

(assert (=> b!816482 (= e!452847 tp_is_empty!14305)))

(declare-fun mapNonEmpty!23044 () Bool)

(declare-fun tp!44505 () Bool)

(declare-fun e!452846 () Bool)

(assert (=> mapNonEmpty!23044 (= mapRes!23044 (and tp!44505 e!452846))))

(declare-fun mapRest!23044 () (Array (_ BitVec 32) ValueCell!6737))

(declare-fun mapValue!23044 () ValueCell!6737)

(declare-fun mapKey!23044 () (_ BitVec 32))

(assert (=> mapNonEmpty!23044 (= (arr!21460 _values!788) (store mapRest!23044 mapKey!23044 mapValue!23044))))

(declare-fun res!557250 () Bool)

(assert (=> start!70368 (=> (not res!557250) (not e!452844))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70368 (= res!557250 (validMask!0 mask!1312))))

(assert (=> start!70368 e!452844))

(assert (=> start!70368 tp_is_empty!14305))

(declare-fun array_inv!17211 (array!44811) Bool)

(assert (=> start!70368 (array_inv!17211 _keys!976)))

(assert (=> start!70368 true))

(declare-fun array_inv!17212 (array!44813) Bool)

(assert (=> start!70368 (and (array_inv!17212 _values!788) e!452848)))

(assert (=> start!70368 tp!44506))

(declare-fun b!816483 () Bool)

(assert (=> b!816483 (= e!452846 tp_is_empty!14305)))

(declare-fun b!816484 () Bool)

(assert (=> b!816484 (= e!452844 (not e!452843))))

(declare-fun res!557248 () Bool)

(assert (=> b!816484 (=> res!557248 e!452843)))

(assert (=> b!816484 (= res!557248 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!365485 () ListLongMap!8189)

(declare-fun lt!365489 () ListLongMap!8189)

(assert (=> b!816484 (= lt!365485 lt!365489)))

(declare-datatypes ((Unit!27787 0))(
  ( (Unit!27788) )
))
(declare-fun lt!365488 () Unit!27787)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!305 (array!44811 array!44813 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24075 V!24075 V!24075 V!24075 (_ BitVec 32) Int) Unit!27787)

(assert (=> b!816484 (= lt!365488 (lemmaNoChangeToArrayThenSameMapNoExtras!305 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2217 (array!44811 array!44813 (_ BitVec 32) (_ BitVec 32) V!24075 V!24075 (_ BitVec 32) Int) ListLongMap!8189)

(assert (=> b!816484 (= lt!365489 (getCurrentListMapNoExtraKeys!2217 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816484 (= lt!365485 (getCurrentListMapNoExtraKeys!2217 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70368 res!557250) b!816479))

(assert (= (and b!816479 res!557247) b!816481))

(assert (= (and b!816481 res!557246) b!816477))

(assert (= (and b!816477 res!557249) b!816484))

(assert (= (and b!816484 (not res!557248)) b!816480))

(assert (= (and b!816478 condMapEmpty!23044) mapIsEmpty!23044))

(assert (= (and b!816478 (not condMapEmpty!23044)) mapNonEmpty!23044))

(get-info :version)

(assert (= (and mapNonEmpty!23044 ((_ is ValueCellFull!6737) mapValue!23044)) b!816483))

(assert (= (and b!816478 ((_ is ValueCellFull!6737) mapDefault!23044)) b!816482))

(assert (= start!70368 b!816478))

(declare-fun m!758511 () Bool)

(assert (=> b!816484 m!758511))

(declare-fun m!758513 () Bool)

(assert (=> b!816484 m!758513))

(declare-fun m!758515 () Bool)

(assert (=> b!816484 m!758515))

(declare-fun m!758517 () Bool)

(assert (=> start!70368 m!758517))

(declare-fun m!758519 () Bool)

(assert (=> start!70368 m!758519))

(declare-fun m!758521 () Bool)

(assert (=> start!70368 m!758521))

(declare-fun m!758523 () Bool)

(assert (=> b!816480 m!758523))

(declare-fun m!758525 () Bool)

(assert (=> b!816480 m!758525))

(assert (=> b!816480 m!758525))

(declare-fun m!758527 () Bool)

(assert (=> b!816480 m!758527))

(declare-fun m!758529 () Bool)

(assert (=> mapNonEmpty!23044 m!758529))

(declare-fun m!758531 () Bool)

(assert (=> b!816481 m!758531))

(declare-fun m!758533 () Bool)

(assert (=> b!816477 m!758533))

(check-sat (not b!816477) (not b!816480) (not b!816484) (not b_next!12595) (not start!70368) b_and!21393 (not b!816481) (not mapNonEmpty!23044) tp_is_empty!14305)
(check-sat b_and!21393 (not b_next!12595))
