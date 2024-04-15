; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70272 () Bool)

(assert start!70272)

(declare-fun b_free!12667 () Bool)

(declare-fun b_next!12667 () Bool)

(assert (=> start!70272 (= b_free!12667 (not b_next!12667))))

(declare-fun tp!44724 () Bool)

(declare-fun b_and!21441 () Bool)

(assert (=> start!70272 (= tp!44724 b_and!21441)))

(declare-fun b!816385 () Bool)

(declare-fun e!452874 () Bool)

(declare-fun tp_is_empty!14377 () Bool)

(assert (=> b!816385 (= e!452874 tp_is_empty!14377)))

(declare-fun res!557417 () Bool)

(declare-fun e!452878 () Bool)

(assert (=> start!70272 (=> (not res!557417) (not e!452878))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70272 (= res!557417 (validMask!0 mask!1312))))

(assert (=> start!70272 e!452878))

(assert (=> start!70272 tp_is_empty!14377))

(declare-datatypes ((array!44933 0))(
  ( (array!44934 (arr!21524 (Array (_ BitVec 32) (_ BitVec 64))) (size!21945 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44933)

(declare-fun array_inv!17297 (array!44933) Bool)

(assert (=> start!70272 (array_inv!17297 _keys!976)))

(assert (=> start!70272 true))

(declare-datatypes ((V!24171 0))(
  ( (V!24172 (val!7236 Int)) )
))
(declare-datatypes ((ValueCell!6773 0))(
  ( (ValueCellFull!6773 (v!9658 V!24171)) (EmptyCell!6773) )
))
(declare-datatypes ((array!44935 0))(
  ( (array!44936 (arr!21525 (Array (_ BitVec 32) ValueCell!6773)) (size!21946 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44935)

(declare-fun e!452877 () Bool)

(declare-fun array_inv!17298 (array!44935) Bool)

(assert (=> start!70272 (and (array_inv!17298 _values!788) e!452877)))

(assert (=> start!70272 tp!44724))

(declare-fun b!816386 () Bool)

(declare-fun res!557418 () Bool)

(assert (=> b!816386 (=> (not res!557418) (not e!452878))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!816386 (= res!557418 (and (= (size!21946 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21945 _keys!976) (size!21946 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!816387 () Bool)

(declare-fun e!452873 () Bool)

(assert (=> b!816387 (= e!452878 (not e!452873))))

(declare-fun res!557416 () Bool)

(assert (=> b!816387 (=> res!557416 e!452873)))

(assert (=> b!816387 (= res!557416 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9522 0))(
  ( (tuple2!9523 (_1!4772 (_ BitVec 64)) (_2!4772 V!24171)) )
))
(declare-datatypes ((List!15346 0))(
  ( (Nil!15343) (Cons!15342 (h!16471 tuple2!9522) (t!21660 List!15346)) )
))
(declare-datatypes ((ListLongMap!8335 0))(
  ( (ListLongMap!8336 (toList!4183 List!15346)) )
))
(declare-fun lt!365551 () ListLongMap!8335)

(declare-fun lt!365554 () ListLongMap!8335)

(assert (=> b!816387 (= lt!365551 lt!365554)))

(declare-fun zeroValueBefore!34 () V!24171)

(declare-fun zeroValueAfter!34 () V!24171)

(declare-fun minValue!754 () V!24171)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27794 0))(
  ( (Unit!27795) )
))
(declare-fun lt!365552 () Unit!27794)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!337 (array!44933 array!44935 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24171 V!24171 V!24171 V!24171 (_ BitVec 32) Int) Unit!27794)

(assert (=> b!816387 (= lt!365552 (lemmaNoChangeToArrayThenSameMapNoExtras!337 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2244 (array!44933 array!44935 (_ BitVec 32) (_ BitVec 32) V!24171 V!24171 (_ BitVec 32) Int) ListLongMap!8335)

(assert (=> b!816387 (= lt!365554 (getCurrentListMapNoExtraKeys!2244 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816387 (= lt!365551 (getCurrentListMapNoExtraKeys!2244 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!816388 () Bool)

(declare-fun res!557419 () Bool)

(assert (=> b!816388 (=> (not res!557419) (not e!452878))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44933 (_ BitVec 32)) Bool)

(assert (=> b!816388 (= res!557419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!816389 () Bool)

(declare-fun e!452875 () Bool)

(assert (=> b!816389 (= e!452875 tp_is_empty!14377)))

(declare-fun mapIsEmpty!23155 () Bool)

(declare-fun mapRes!23155 () Bool)

(assert (=> mapIsEmpty!23155 mapRes!23155))

(declare-fun mapNonEmpty!23155 () Bool)

(declare-fun tp!44725 () Bool)

(assert (=> mapNonEmpty!23155 (= mapRes!23155 (and tp!44725 e!452874))))

(declare-fun mapValue!23155 () ValueCell!6773)

(declare-fun mapRest!23155 () (Array (_ BitVec 32) ValueCell!6773))

(declare-fun mapKey!23155 () (_ BitVec 32))

(assert (=> mapNonEmpty!23155 (= (arr!21525 _values!788) (store mapRest!23155 mapKey!23155 mapValue!23155))))

(declare-fun b!816390 () Bool)

(declare-fun res!557420 () Bool)

(assert (=> b!816390 (=> (not res!557420) (not e!452878))))

(declare-datatypes ((List!15347 0))(
  ( (Nil!15344) (Cons!15343 (h!16472 (_ BitVec 64)) (t!21661 List!15347)) )
))
(declare-fun arrayNoDuplicates!0 (array!44933 (_ BitVec 32) List!15347) Bool)

(assert (=> b!816390 (= res!557420 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15344))))

(declare-fun b!816391 () Bool)

(assert (=> b!816391 (= e!452873 true)))

(declare-fun lt!365550 () ListLongMap!8335)

(declare-fun getCurrentListMap!2356 (array!44933 array!44935 (_ BitVec 32) (_ BitVec 32) V!24171 V!24171 (_ BitVec 32) Int) ListLongMap!8335)

(assert (=> b!816391 (= lt!365550 (getCurrentListMap!2356 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365553 () ListLongMap!8335)

(declare-fun +!1844 (ListLongMap!8335 tuple2!9522) ListLongMap!8335)

(assert (=> b!816391 (= lt!365553 (+!1844 (getCurrentListMap!2356 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!816392 () Bool)

(assert (=> b!816392 (= e!452877 (and e!452875 mapRes!23155))))

(declare-fun condMapEmpty!23155 () Bool)

(declare-fun mapDefault!23155 () ValueCell!6773)

(assert (=> b!816392 (= condMapEmpty!23155 (= (arr!21525 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6773)) mapDefault!23155)))))

(assert (= (and start!70272 res!557417) b!816386))

(assert (= (and b!816386 res!557418) b!816388))

(assert (= (and b!816388 res!557419) b!816390))

(assert (= (and b!816390 res!557420) b!816387))

(assert (= (and b!816387 (not res!557416)) b!816391))

(assert (= (and b!816392 condMapEmpty!23155) mapIsEmpty!23155))

(assert (= (and b!816392 (not condMapEmpty!23155)) mapNonEmpty!23155))

(get-info :version)

(assert (= (and mapNonEmpty!23155 ((_ is ValueCellFull!6773) mapValue!23155)) b!816385))

(assert (= (and b!816392 ((_ is ValueCellFull!6773) mapDefault!23155)) b!816389))

(assert (= start!70272 b!816392))

(declare-fun m!757511 () Bool)

(assert (=> b!816391 m!757511))

(declare-fun m!757513 () Bool)

(assert (=> b!816391 m!757513))

(assert (=> b!816391 m!757513))

(declare-fun m!757515 () Bool)

(assert (=> b!816391 m!757515))

(declare-fun m!757517 () Bool)

(assert (=> start!70272 m!757517))

(declare-fun m!757519 () Bool)

(assert (=> start!70272 m!757519))

(declare-fun m!757521 () Bool)

(assert (=> start!70272 m!757521))

(declare-fun m!757523 () Bool)

(assert (=> b!816390 m!757523))

(declare-fun m!757525 () Bool)

(assert (=> mapNonEmpty!23155 m!757525))

(declare-fun m!757527 () Bool)

(assert (=> b!816387 m!757527))

(declare-fun m!757529 () Bool)

(assert (=> b!816387 m!757529))

(declare-fun m!757531 () Bool)

(assert (=> b!816387 m!757531))

(declare-fun m!757533 () Bool)

(assert (=> b!816388 m!757533))

(check-sat (not b!816387) b_and!21441 (not start!70272) (not mapNonEmpty!23155) (not b!816388) tp_is_empty!14377 (not b!816390) (not b!816391) (not b_next!12667))
(check-sat b_and!21441 (not b_next!12667))
