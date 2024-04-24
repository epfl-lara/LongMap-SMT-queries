; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70452 () Bool)

(assert start!70452)

(declare-fun b_free!12661 () Bool)

(declare-fun b_next!12661 () Bool)

(assert (=> start!70452 (= b_free!12661 (not b_next!12661))))

(declare-fun tp!44706 () Bool)

(declare-fun b_and!21471 () Bool)

(assert (=> start!70452 (= tp!44706 b_and!21471)))

(declare-fun b!817453 () Bool)

(declare-fun res!557825 () Bool)

(declare-fun e!453547 () Bool)

(assert (=> b!817453 (=> (not res!557825) (not e!453547))))

(declare-datatypes ((array!44943 0))(
  ( (array!44944 (arr!21524 (Array (_ BitVec 32) (_ BitVec 64))) (size!21944 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44943)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44943 (_ BitVec 32)) Bool)

(assert (=> b!817453 (= res!557825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!817454 () Bool)

(declare-fun res!557823 () Bool)

(assert (=> b!817454 (=> (not res!557823) (not e!453547))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24163 0))(
  ( (V!24164 (val!7233 Int)) )
))
(declare-datatypes ((ValueCell!6770 0))(
  ( (ValueCellFull!6770 (v!9661 V!24163)) (EmptyCell!6770) )
))
(declare-datatypes ((array!44945 0))(
  ( (array!44946 (arr!21525 (Array (_ BitVec 32) ValueCell!6770)) (size!21945 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44945)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!817454 (= res!557823 (and (= (size!21945 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21944 _keys!976) (size!21945 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!817455 () Bool)

(declare-fun e!453552 () Bool)

(declare-fun tp_is_empty!14371 () Bool)

(assert (=> b!817455 (= e!453552 tp_is_empty!14371)))

(declare-fun b!817456 () Bool)

(declare-fun e!453551 () Bool)

(assert (=> b!817456 (= e!453551 tp_is_empty!14371)))

(declare-fun res!557827 () Bool)

(assert (=> start!70452 (=> (not res!557827) (not e!453547))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70452 (= res!557827 (validMask!0 mask!1312))))

(assert (=> start!70452 e!453547))

(assert (=> start!70452 tp_is_empty!14371))

(declare-fun array_inv!17253 (array!44943) Bool)

(assert (=> start!70452 (array_inv!17253 _keys!976)))

(assert (=> start!70452 true))

(declare-fun e!453548 () Bool)

(declare-fun array_inv!17254 (array!44945) Bool)

(assert (=> start!70452 (and (array_inv!17254 _values!788) e!453548)))

(assert (=> start!70452 tp!44706))

(declare-fun mapNonEmpty!23146 () Bool)

(declare-fun mapRes!23146 () Bool)

(declare-fun tp!44707 () Bool)

(assert (=> mapNonEmpty!23146 (= mapRes!23146 (and tp!44707 e!453551))))

(declare-fun mapValue!23146 () ValueCell!6770)

(declare-fun mapKey!23146 () (_ BitVec 32))

(declare-fun mapRest!23146 () (Array (_ BitVec 32) ValueCell!6770))

(assert (=> mapNonEmpty!23146 (= (arr!21525 _values!788) (store mapRest!23146 mapKey!23146 mapValue!23146))))

(declare-fun b!817457 () Bool)

(declare-fun e!453550 () Bool)

(assert (=> b!817457 (= e!453547 (not e!453550))))

(declare-fun res!557824 () Bool)

(assert (=> b!817457 (=> res!557824 e!453550)))

(assert (=> b!817457 (= res!557824 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9412 0))(
  ( (tuple2!9413 (_1!4717 (_ BitVec 64)) (_2!4717 V!24163)) )
))
(declare-datatypes ((List!15224 0))(
  ( (Nil!15221) (Cons!15220 (h!16355 tuple2!9412) (t!21539 List!15224)) )
))
(declare-datatypes ((ListLongMap!8237 0))(
  ( (ListLongMap!8238 (toList!4134 List!15224)) )
))
(declare-fun lt!366106 () ListLongMap!8237)

(declare-fun lt!366102 () ListLongMap!8237)

(assert (=> b!817457 (= lt!366106 lt!366102)))

(declare-fun zeroValueBefore!34 () V!24163)

(declare-fun zeroValueAfter!34 () V!24163)

(declare-fun minValue!754 () V!24163)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27827 0))(
  ( (Unit!27828) )
))
(declare-fun lt!366104 () Unit!27827)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!324 (array!44943 array!44945 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24163 V!24163 V!24163 V!24163 (_ BitVec 32) Int) Unit!27827)

(assert (=> b!817457 (= lt!366104 (lemmaNoChangeToArrayThenSameMapNoExtras!324 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2236 (array!44943 array!44945 (_ BitVec 32) (_ BitVec 32) V!24163 V!24163 (_ BitVec 32) Int) ListLongMap!8237)

(assert (=> b!817457 (= lt!366102 (getCurrentListMapNoExtraKeys!2236 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817457 (= lt!366106 (getCurrentListMapNoExtraKeys!2236 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!817458 () Bool)

(declare-fun res!557826 () Bool)

(assert (=> b!817458 (=> (not res!557826) (not e!453547))))

(declare-datatypes ((List!15225 0))(
  ( (Nil!15222) (Cons!15221 (h!16356 (_ BitVec 64)) (t!21540 List!15225)) )
))
(declare-fun arrayNoDuplicates!0 (array!44943 (_ BitVec 32) List!15225) Bool)

(assert (=> b!817458 (= res!557826 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15222))))

(declare-fun mapIsEmpty!23146 () Bool)

(assert (=> mapIsEmpty!23146 mapRes!23146))

(declare-fun b!817459 () Bool)

(assert (=> b!817459 (= e!453548 (and e!453552 mapRes!23146))))

(declare-fun condMapEmpty!23146 () Bool)

(declare-fun mapDefault!23146 () ValueCell!6770)

(assert (=> b!817459 (= condMapEmpty!23146 (= (arr!21525 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6770)) mapDefault!23146)))))

(declare-fun b!817460 () Bool)

(assert (=> b!817460 (= e!453550 true)))

(declare-fun lt!366103 () ListLongMap!8237)

(declare-fun getCurrentListMap!2352 (array!44943 array!44945 (_ BitVec 32) (_ BitVec 32) V!24163 V!24163 (_ BitVec 32) Int) ListLongMap!8237)

(assert (=> b!817460 (= lt!366103 (getCurrentListMap!2352 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!366105 () ListLongMap!8237)

(declare-fun +!1812 (ListLongMap!8237 tuple2!9412) ListLongMap!8237)

(assert (=> b!817460 (= lt!366105 (+!1812 (getCurrentListMap!2352 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9413 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and start!70452 res!557827) b!817454))

(assert (= (and b!817454 res!557823) b!817453))

(assert (= (and b!817453 res!557825) b!817458))

(assert (= (and b!817458 res!557826) b!817457))

(assert (= (and b!817457 (not res!557824)) b!817460))

(assert (= (and b!817459 condMapEmpty!23146) mapIsEmpty!23146))

(assert (= (and b!817459 (not condMapEmpty!23146)) mapNonEmpty!23146))

(get-info :version)

(assert (= (and mapNonEmpty!23146 ((_ is ValueCellFull!6770) mapValue!23146)) b!817456))

(assert (= (and b!817459 ((_ is ValueCellFull!6770) mapDefault!23146)) b!817455))

(assert (= start!70452 b!817459))

(declare-fun m!759473 () Bool)

(assert (=> b!817460 m!759473))

(declare-fun m!759475 () Bool)

(assert (=> b!817460 m!759475))

(assert (=> b!817460 m!759475))

(declare-fun m!759477 () Bool)

(assert (=> b!817460 m!759477))

(declare-fun m!759479 () Bool)

(assert (=> mapNonEmpty!23146 m!759479))

(declare-fun m!759481 () Bool)

(assert (=> b!817458 m!759481))

(declare-fun m!759483 () Bool)

(assert (=> b!817457 m!759483))

(declare-fun m!759485 () Bool)

(assert (=> b!817457 m!759485))

(declare-fun m!759487 () Bool)

(assert (=> b!817457 m!759487))

(declare-fun m!759489 () Bool)

(assert (=> b!817453 m!759489))

(declare-fun m!759491 () Bool)

(assert (=> start!70452 m!759491))

(declare-fun m!759493 () Bool)

(assert (=> start!70452 m!759493))

(declare-fun m!759495 () Bool)

(assert (=> start!70452 m!759495))

(check-sat tp_is_empty!14371 (not b!817460) (not b!817453) (not b_next!12661) (not mapNonEmpty!23146) (not b!817458) (not b!817457) b_and!21471 (not start!70452))
(check-sat b_and!21471 (not b_next!12661))
