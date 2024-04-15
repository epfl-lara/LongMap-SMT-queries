; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70362 () Bool)

(assert start!70362)

(declare-fun b_free!12739 () Bool)

(declare-fun b_next!12739 () Bool)

(assert (=> start!70362 (= b_free!12739 (not b_next!12739))))

(declare-fun tp!44943 () Bool)

(declare-fun b_and!21525 () Bool)

(assert (=> start!70362 (= tp!44943 b_and!21525)))

(declare-fun b!817368 () Bool)

(declare-fun res!557975 () Bool)

(declare-fun e!453569 () Bool)

(assert (=> b!817368 (=> (not res!557975) (not e!453569))))

(declare-datatypes ((array!45075 0))(
  ( (array!45076 (arr!21594 (Array (_ BitVec 32) (_ BitVec 64))) (size!22015 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45075)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24267 0))(
  ( (V!24268 (val!7272 Int)) )
))
(declare-datatypes ((ValueCell!6809 0))(
  ( (ValueCellFull!6809 (v!9695 V!24267)) (EmptyCell!6809) )
))
(declare-datatypes ((array!45077 0))(
  ( (array!45078 (arr!21595 (Array (_ BitVec 32) ValueCell!6809)) (size!22016 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45077)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!817368 (= res!557975 (and (= (size!22016 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22015 _keys!976) (size!22016 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!817369 () Bool)

(declare-fun res!557973 () Bool)

(assert (=> b!817369 (=> (not res!557973) (not e!453569))))

(declare-datatypes ((List!15396 0))(
  ( (Nil!15393) (Cons!15392 (h!16521 (_ BitVec 64)) (t!21712 List!15396)) )
))
(declare-fun arrayNoDuplicates!0 (array!45075 (_ BitVec 32) List!15396) Bool)

(assert (=> b!817369 (= res!557973 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15393))))

(declare-fun b!817370 () Bool)

(declare-fun e!453568 () Bool)

(declare-fun e!453570 () Bool)

(declare-fun mapRes!23266 () Bool)

(assert (=> b!817370 (= e!453568 (and e!453570 mapRes!23266))))

(declare-fun condMapEmpty!23266 () Bool)

(declare-fun mapDefault!23266 () ValueCell!6809)

(assert (=> b!817370 (= condMapEmpty!23266 (= (arr!21595 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6809)) mapDefault!23266)))))

(declare-fun res!557976 () Bool)

(assert (=> start!70362 (=> (not res!557976) (not e!453569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70362 (= res!557976 (validMask!0 mask!1312))))

(assert (=> start!70362 e!453569))

(declare-fun tp_is_empty!14449 () Bool)

(assert (=> start!70362 tp_is_empty!14449))

(declare-fun array_inv!17339 (array!45075) Bool)

(assert (=> start!70362 (array_inv!17339 _keys!976)))

(assert (=> start!70362 true))

(declare-fun array_inv!17340 (array!45077) Bool)

(assert (=> start!70362 (and (array_inv!17340 _values!788) e!453568)))

(assert (=> start!70362 tp!44943))

(declare-fun b!817371 () Bool)

(assert (=> b!817371 (= e!453569 (not true))))

(declare-datatypes ((tuple2!9574 0))(
  ( (tuple2!9575 (_1!4798 (_ BitVec 64)) (_2!4798 V!24267)) )
))
(declare-datatypes ((List!15397 0))(
  ( (Nil!15394) (Cons!15393 (h!16522 tuple2!9574) (t!21713 List!15397)) )
))
(declare-datatypes ((ListLongMap!8387 0))(
  ( (ListLongMap!8388 (toList!4209 List!15397)) )
))
(declare-fun lt!366082 () ListLongMap!8387)

(declare-fun lt!366084 () ListLongMap!8387)

(assert (=> b!817371 (= lt!366082 lt!366084)))

(declare-fun zeroValueBefore!34 () V!24267)

(declare-fun zeroValueAfter!34 () V!24267)

(declare-fun minValue!754 () V!24267)

(declare-datatypes ((Unit!27846 0))(
  ( (Unit!27847) )
))
(declare-fun lt!366083 () Unit!27846)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!362 (array!45075 array!45077 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24267 V!24267 V!24267 V!24267 (_ BitVec 32) Int) Unit!27846)

(assert (=> b!817371 (= lt!366083 (lemmaNoChangeToArrayThenSameMapNoExtras!362 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2269 (array!45075 array!45077 (_ BitVec 32) (_ BitVec 32) V!24267 V!24267 (_ BitVec 32) Int) ListLongMap!8387)

(assert (=> b!817371 (= lt!366084 (getCurrentListMapNoExtraKeys!2269 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817371 (= lt!366082 (getCurrentListMapNoExtraKeys!2269 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23266 () Bool)

(declare-fun tp!44944 () Bool)

(declare-fun e!453567 () Bool)

(assert (=> mapNonEmpty!23266 (= mapRes!23266 (and tp!44944 e!453567))))

(declare-fun mapValue!23266 () ValueCell!6809)

(declare-fun mapRest!23266 () (Array (_ BitVec 32) ValueCell!6809))

(declare-fun mapKey!23266 () (_ BitVec 32))

(assert (=> mapNonEmpty!23266 (= (arr!21595 _values!788) (store mapRest!23266 mapKey!23266 mapValue!23266))))

(declare-fun mapIsEmpty!23266 () Bool)

(assert (=> mapIsEmpty!23266 mapRes!23266))

(declare-fun b!817372 () Bool)

(assert (=> b!817372 (= e!453567 tp_is_empty!14449)))

(declare-fun b!817373 () Bool)

(assert (=> b!817373 (= e!453570 tp_is_empty!14449)))

(declare-fun b!817374 () Bool)

(declare-fun res!557974 () Bool)

(assert (=> b!817374 (=> (not res!557974) (not e!453569))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45075 (_ BitVec 32)) Bool)

(assert (=> b!817374 (= res!557974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!70362 res!557976) b!817368))

(assert (= (and b!817368 res!557975) b!817374))

(assert (= (and b!817374 res!557974) b!817369))

(assert (= (and b!817369 res!557973) b!817371))

(assert (= (and b!817370 condMapEmpty!23266) mapIsEmpty!23266))

(assert (= (and b!817370 (not condMapEmpty!23266)) mapNonEmpty!23266))

(get-info :version)

(assert (= (and mapNonEmpty!23266 ((_ is ValueCellFull!6809) mapValue!23266)) b!817372))

(assert (= (and b!817370 ((_ is ValueCellFull!6809) mapDefault!23266)) b!817373))

(assert (= start!70362 b!817370))

(declare-fun m!758419 () Bool)

(assert (=> b!817374 m!758419))

(declare-fun m!758421 () Bool)

(assert (=> b!817371 m!758421))

(declare-fun m!758423 () Bool)

(assert (=> b!817371 m!758423))

(declare-fun m!758425 () Bool)

(assert (=> b!817371 m!758425))

(declare-fun m!758427 () Bool)

(assert (=> start!70362 m!758427))

(declare-fun m!758429 () Bool)

(assert (=> start!70362 m!758429))

(declare-fun m!758431 () Bool)

(assert (=> start!70362 m!758431))

(declare-fun m!758433 () Bool)

(assert (=> mapNonEmpty!23266 m!758433))

(declare-fun m!758435 () Bool)

(assert (=> b!817369 m!758435))

(check-sat (not b!817371) b_and!21525 (not b!817369) (not b!817374) (not b_next!12739) (not mapNonEmpty!23266) tp_is_empty!14449 (not start!70362))
(check-sat b_and!21525 (not b_next!12739))
