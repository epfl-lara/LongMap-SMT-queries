; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70542 () Bool)

(assert start!70542)

(declare-fun b_free!12733 () Bool)

(declare-fun b_next!12733 () Bool)

(assert (=> start!70542 (= b_free!12733 (not b_next!12733))))

(declare-fun tp!44925 () Bool)

(declare-fun b_and!21555 () Bool)

(assert (=> start!70542 (= tp!44925 b_and!21555)))

(declare-fun b!818445 () Bool)

(declare-fun res!558391 () Bool)

(declare-fun e!454249 () Bool)

(assert (=> b!818445 (=> (not res!558391) (not e!454249))))

(declare-datatypes ((array!45083 0))(
  ( (array!45084 (arr!21593 (Array (_ BitVec 32) (_ BitVec 64))) (size!22013 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45083)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45083 (_ BitVec 32)) Bool)

(assert (=> b!818445 (= res!558391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!23257 () Bool)

(declare-fun mapRes!23257 () Bool)

(declare-fun tp!44926 () Bool)

(declare-fun e!454253 () Bool)

(assert (=> mapNonEmpty!23257 (= mapRes!23257 (and tp!44926 e!454253))))

(declare-fun mapKey!23257 () (_ BitVec 32))

(declare-datatypes ((V!24259 0))(
  ( (V!24260 (val!7269 Int)) )
))
(declare-datatypes ((ValueCell!6806 0))(
  ( (ValueCellFull!6806 (v!9698 V!24259)) (EmptyCell!6806) )
))
(declare-datatypes ((array!45085 0))(
  ( (array!45086 (arr!21594 (Array (_ BitVec 32) ValueCell!6806)) (size!22014 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45085)

(declare-fun mapRest!23257 () (Array (_ BitVec 32) ValueCell!6806))

(declare-fun mapValue!23257 () ValueCell!6806)

(assert (=> mapNonEmpty!23257 (= (arr!21594 _values!788) (store mapRest!23257 mapKey!23257 mapValue!23257))))

(declare-fun mapIsEmpty!23257 () Bool)

(assert (=> mapIsEmpty!23257 mapRes!23257))

(declare-fun b!818446 () Bool)

(declare-fun e!454251 () Bool)

(declare-fun tp_is_empty!14443 () Bool)

(assert (=> b!818446 (= e!454251 tp_is_empty!14443)))

(declare-fun b!818447 () Bool)

(declare-fun e!454250 () Bool)

(assert (=> b!818447 (= e!454250 (and e!454251 mapRes!23257))))

(declare-fun condMapEmpty!23257 () Bool)

(declare-fun mapDefault!23257 () ValueCell!6806)

(assert (=> b!818447 (= condMapEmpty!23257 (= (arr!21594 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6806)) mapDefault!23257)))))

(declare-fun b!818448 () Bool)

(assert (=> b!818448 (= e!454249 (not true))))

(declare-datatypes ((tuple2!9458 0))(
  ( (tuple2!9459 (_1!4740 (_ BitVec 64)) (_2!4740 V!24259)) )
))
(declare-datatypes ((List!15270 0))(
  ( (Nil!15267) (Cons!15266 (h!16401 tuple2!9458) (t!21587 List!15270)) )
))
(declare-datatypes ((ListLongMap!8283 0))(
  ( (ListLongMap!8284 (toList!4157 List!15270)) )
))
(declare-fun lt!366652 () ListLongMap!8283)

(declare-fun lt!366654 () ListLongMap!8283)

(assert (=> b!818448 (= lt!366652 lt!366654)))

(declare-fun zeroValueBefore!34 () V!24259)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24259)

(declare-fun minValue!754 () V!24259)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27869 0))(
  ( (Unit!27870) )
))
(declare-fun lt!366653 () Unit!27869)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!344 (array!45083 array!45085 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24259 V!24259 V!24259 V!24259 (_ BitVec 32) Int) Unit!27869)

(assert (=> b!818448 (= lt!366653 (lemmaNoChangeToArrayThenSameMapNoExtras!344 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2256 (array!45083 array!45085 (_ BitVec 32) (_ BitVec 32) V!24259 V!24259 (_ BitVec 32) Int) ListLongMap!8283)

(assert (=> b!818448 (= lt!366654 (getCurrentListMapNoExtraKeys!2256 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818448 (= lt!366652 (getCurrentListMapNoExtraKeys!2256 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!558390 () Bool)

(assert (=> start!70542 (=> (not res!558390) (not e!454249))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70542 (= res!558390 (validMask!0 mask!1312))))

(assert (=> start!70542 e!454249))

(assert (=> start!70542 tp_is_empty!14443))

(declare-fun array_inv!17299 (array!45083) Bool)

(assert (=> start!70542 (array_inv!17299 _keys!976)))

(assert (=> start!70542 true))

(declare-fun array_inv!17300 (array!45085) Bool)

(assert (=> start!70542 (and (array_inv!17300 _values!788) e!454250)))

(assert (=> start!70542 tp!44925))

(declare-fun b!818449 () Bool)

(declare-fun res!558392 () Bool)

(assert (=> b!818449 (=> (not res!558392) (not e!454249))))

(declare-datatypes ((List!15271 0))(
  ( (Nil!15268) (Cons!15267 (h!16402 (_ BitVec 64)) (t!21588 List!15271)) )
))
(declare-fun arrayNoDuplicates!0 (array!45083 (_ BitVec 32) List!15271) Bool)

(assert (=> b!818449 (= res!558392 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15268))))

(declare-fun b!818450 () Bool)

(declare-fun res!558389 () Bool)

(assert (=> b!818450 (=> (not res!558389) (not e!454249))))

(assert (=> b!818450 (= res!558389 (and (= (size!22014 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22013 _keys!976) (size!22014 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!818451 () Bool)

(assert (=> b!818451 (= e!454253 tp_is_empty!14443)))

(assert (= (and start!70542 res!558390) b!818450))

(assert (= (and b!818450 res!558389) b!818445))

(assert (= (and b!818445 res!558391) b!818449))

(assert (= (and b!818449 res!558392) b!818448))

(assert (= (and b!818447 condMapEmpty!23257) mapIsEmpty!23257))

(assert (= (and b!818447 (not condMapEmpty!23257)) mapNonEmpty!23257))

(get-info :version)

(assert (= (and mapNonEmpty!23257 ((_ is ValueCellFull!6806) mapValue!23257)) b!818451))

(assert (= (and b!818447 ((_ is ValueCellFull!6806) mapDefault!23257)) b!818446))

(assert (= start!70542 b!818447))

(declare-fun m!760399 () Bool)

(assert (=> start!70542 m!760399))

(declare-fun m!760401 () Bool)

(assert (=> start!70542 m!760401))

(declare-fun m!760403 () Bool)

(assert (=> start!70542 m!760403))

(declare-fun m!760405 () Bool)

(assert (=> b!818449 m!760405))

(declare-fun m!760407 () Bool)

(assert (=> b!818448 m!760407))

(declare-fun m!760409 () Bool)

(assert (=> b!818448 m!760409))

(declare-fun m!760411 () Bool)

(assert (=> b!818448 m!760411))

(declare-fun m!760413 () Bool)

(assert (=> b!818445 m!760413))

(declare-fun m!760415 () Bool)

(assert (=> mapNonEmpty!23257 m!760415))

(check-sat (not mapNonEmpty!23257) (not b_next!12733) (not b!818449) (not b!818445) b_and!21555 (not start!70542) tp_is_empty!14443 (not b!818448))
(check-sat b_and!21555 (not b_next!12733))
