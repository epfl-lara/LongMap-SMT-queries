; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70366 () Bool)

(assert start!70366)

(declare-fun b_free!12723 () Bool)

(declare-fun b_next!12723 () Bool)

(assert (=> start!70366 (= b_free!12723 (not b_next!12723))))

(declare-fun tp!44895 () Bool)

(declare-fun b_and!21535 () Bool)

(assert (=> start!70366 (= tp!44895 b_and!21535)))

(declare-fun b!817446 () Bool)

(declare-fun e!453598 () Bool)

(assert (=> b!817446 (= e!453598 (not true))))

(declare-datatypes ((V!24245 0))(
  ( (V!24246 (val!7264 Int)) )
))
(declare-datatypes ((tuple2!9546 0))(
  ( (tuple2!9547 (_1!4784 (_ BitVec 64)) (_2!4784 V!24245)) )
))
(declare-datatypes ((List!15376 0))(
  ( (Nil!15373) (Cons!15372 (h!16501 tuple2!9546) (t!21701 List!15376)) )
))
(declare-datatypes ((ListLongMap!8369 0))(
  ( (ListLongMap!8370 (toList!4200 List!15376)) )
))
(declare-fun lt!366254 () ListLongMap!8369)

(declare-fun lt!366253 () ListLongMap!8369)

(assert (=> b!817446 (= lt!366254 lt!366253)))

(declare-fun zeroValueBefore!34 () V!24245)

(declare-datatypes ((array!45066 0))(
  ( (array!45067 (arr!21589 (Array (_ BitVec 32) (_ BitVec 64))) (size!22010 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45066)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24245)

(declare-fun minValue!754 () V!24245)

(declare-datatypes ((ValueCell!6801 0))(
  ( (ValueCellFull!6801 (v!9693 V!24245)) (EmptyCell!6801) )
))
(declare-datatypes ((array!45068 0))(
  ( (array!45069 (arr!21590 (Array (_ BitVec 32) ValueCell!6801)) (size!22011 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45068)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!27884 0))(
  ( (Unit!27885) )
))
(declare-fun lt!366255 () Unit!27884)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!351 (array!45066 array!45068 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24245 V!24245 V!24245 V!24245 (_ BitVec 32) Int) Unit!27884)

(assert (=> b!817446 (= lt!366255 (lemmaNoChangeToArrayThenSameMapNoExtras!351 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2241 (array!45066 array!45068 (_ BitVec 32) (_ BitVec 32) V!24245 V!24245 (_ BitVec 32) Int) ListLongMap!8369)

(assert (=> b!817446 (= lt!366253 (getCurrentListMapNoExtraKeys!2241 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817446 (= lt!366254 (getCurrentListMapNoExtraKeys!2241 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23242 () Bool)

(declare-fun mapRes!23242 () Bool)

(declare-fun tp!44896 () Bool)

(declare-fun e!453599 () Bool)

(assert (=> mapNonEmpty!23242 (= mapRes!23242 (and tp!44896 e!453599))))

(declare-fun mapValue!23242 () ValueCell!6801)

(declare-fun mapKey!23242 () (_ BitVec 32))

(declare-fun mapRest!23242 () (Array (_ BitVec 32) ValueCell!6801))

(assert (=> mapNonEmpty!23242 (= (arr!21590 _values!788) (store mapRest!23242 mapKey!23242 mapValue!23242))))

(declare-fun b!817447 () Bool)

(declare-fun res!557985 () Bool)

(assert (=> b!817447 (=> (not res!557985) (not e!453598))))

(declare-datatypes ((List!15377 0))(
  ( (Nil!15374) (Cons!15373 (h!16502 (_ BitVec 64)) (t!21702 List!15377)) )
))
(declare-fun arrayNoDuplicates!0 (array!45066 (_ BitVec 32) List!15377) Bool)

(assert (=> b!817447 (= res!557985 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15374))))

(declare-fun res!557983 () Bool)

(assert (=> start!70366 (=> (not res!557983) (not e!453598))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70366 (= res!557983 (validMask!0 mask!1312))))

(assert (=> start!70366 e!453598))

(declare-fun tp_is_empty!14433 () Bool)

(assert (=> start!70366 tp_is_empty!14433))

(declare-fun array_inv!17273 (array!45066) Bool)

(assert (=> start!70366 (array_inv!17273 _keys!976)))

(assert (=> start!70366 true))

(declare-fun e!453600 () Bool)

(declare-fun array_inv!17274 (array!45068) Bool)

(assert (=> start!70366 (and (array_inv!17274 _values!788) e!453600)))

(assert (=> start!70366 tp!44895))

(declare-fun b!817448 () Bool)

(assert (=> b!817448 (= e!453599 tp_is_empty!14433)))

(declare-fun b!817449 () Bool)

(declare-fun e!453597 () Bool)

(assert (=> b!817449 (= e!453597 tp_is_empty!14433)))

(declare-fun b!817450 () Bool)

(declare-fun res!557984 () Bool)

(assert (=> b!817450 (=> (not res!557984) (not e!453598))))

(assert (=> b!817450 (= res!557984 (and (= (size!22011 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22010 _keys!976) (size!22011 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!817451 () Bool)

(assert (=> b!817451 (= e!453600 (and e!453597 mapRes!23242))))

(declare-fun condMapEmpty!23242 () Bool)

(declare-fun mapDefault!23242 () ValueCell!6801)

(assert (=> b!817451 (= condMapEmpty!23242 (= (arr!21590 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6801)) mapDefault!23242)))))

(declare-fun mapIsEmpty!23242 () Bool)

(assert (=> mapIsEmpty!23242 mapRes!23242))

(declare-fun b!817452 () Bool)

(declare-fun res!557986 () Bool)

(assert (=> b!817452 (=> (not res!557986) (not e!453598))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45066 (_ BitVec 32)) Bool)

(assert (=> b!817452 (= res!557986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!70366 res!557983) b!817450))

(assert (= (and b!817450 res!557984) b!817452))

(assert (= (and b!817452 res!557986) b!817447))

(assert (= (and b!817447 res!557985) b!817446))

(assert (= (and b!817451 condMapEmpty!23242) mapIsEmpty!23242))

(assert (= (and b!817451 (not condMapEmpty!23242)) mapNonEmpty!23242))

(get-info :version)

(assert (= (and mapNonEmpty!23242 ((_ is ValueCellFull!6801) mapValue!23242)) b!817448))

(assert (= (and b!817451 ((_ is ValueCellFull!6801) mapDefault!23242)) b!817449))

(assert (= start!70366 b!817451))

(declare-fun m!759027 () Bool)

(assert (=> start!70366 m!759027))

(declare-fun m!759029 () Bool)

(assert (=> start!70366 m!759029))

(declare-fun m!759031 () Bool)

(assert (=> start!70366 m!759031))

(declare-fun m!759033 () Bool)

(assert (=> b!817446 m!759033))

(declare-fun m!759035 () Bool)

(assert (=> b!817446 m!759035))

(declare-fun m!759037 () Bool)

(assert (=> b!817446 m!759037))

(declare-fun m!759039 () Bool)

(assert (=> mapNonEmpty!23242 m!759039))

(declare-fun m!759041 () Bool)

(assert (=> b!817452 m!759041))

(declare-fun m!759043 () Bool)

(assert (=> b!817447 m!759043))

(check-sat b_and!21535 (not start!70366) tp_is_empty!14433 (not b_next!12723) (not b!817452) (not b!817446) (not b!817447) (not mapNonEmpty!23242))
(check-sat b_and!21535 (not b_next!12723))
