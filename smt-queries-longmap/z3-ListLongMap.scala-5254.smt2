; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70624 () Bool)

(assert start!70624)

(declare-fun b_free!12931 () Bool)

(declare-fun b_next!12931 () Bool)

(assert (=> start!70624 (= b_free!12931 (not b_next!12931))))

(declare-fun tp!45531 () Bool)

(declare-fun b_and!21759 () Bool)

(assert (=> start!70624 (= tp!45531 b_and!21759)))

(declare-fun b!820410 () Bool)

(declare-fun res!559804 () Bool)

(declare-fun e!455811 () Bool)

(assert (=> b!820410 (=> (not res!559804) (not e!455811))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24523 0))(
  ( (V!24524 (val!7368 Int)) )
))
(declare-datatypes ((ValueCell!6905 0))(
  ( (ValueCellFull!6905 (v!9793 V!24523)) (EmptyCell!6905) )
))
(declare-datatypes ((array!45451 0))(
  ( (array!45452 (arr!21778 (Array (_ BitVec 32) ValueCell!6905)) (size!22199 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45451)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((array!45453 0))(
  ( (array!45454 (arr!21779 (Array (_ BitVec 32) (_ BitVec 64))) (size!22200 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45453)

(assert (=> b!820410 (= res!559804 (and (= (size!22199 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22200 _keys!976) (size!22199 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!23566 () Bool)

(declare-fun mapRes!23566 () Bool)

(declare-fun tp!45532 () Bool)

(declare-fun e!455812 () Bool)

(assert (=> mapNonEmpty!23566 (= mapRes!23566 (and tp!45532 e!455812))))

(declare-fun mapValue!23566 () ValueCell!6905)

(declare-fun mapRest!23566 () (Array (_ BitVec 32) ValueCell!6905))

(declare-fun mapKey!23566 () (_ BitVec 32))

(assert (=> mapNonEmpty!23566 (= (arr!21778 _values!788) (store mapRest!23566 mapKey!23566 mapValue!23566))))

(declare-fun b!820411 () Bool)

(assert (=> b!820411 (= e!455811 (not true))))

(declare-datatypes ((tuple2!9722 0))(
  ( (tuple2!9723 (_1!4872 (_ BitVec 64)) (_2!4872 V!24523)) )
))
(declare-datatypes ((List!15538 0))(
  ( (Nil!15535) (Cons!15534 (h!16663 tuple2!9722) (t!21862 List!15538)) )
))
(declare-datatypes ((ListLongMap!8535 0))(
  ( (ListLongMap!8536 (toList!4283 List!15538)) )
))
(declare-fun lt!368617 () ListLongMap!8535)

(declare-fun lt!368615 () ListLongMap!8535)

(assert (=> b!820411 (= lt!368617 lt!368615)))

(declare-datatypes ((Unit!27995 0))(
  ( (Unit!27996) )
))
(declare-fun lt!368616 () Unit!27995)

(declare-fun zeroValueBefore!34 () V!24523)

(declare-fun zeroValueAfter!34 () V!24523)

(declare-fun minValue!754 () V!24523)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!428 (array!45453 array!45451 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24523 V!24523 V!24523 V!24523 (_ BitVec 32) Int) Unit!27995)

(assert (=> b!820411 (= lt!368616 (lemmaNoChangeToArrayThenSameMapNoExtras!428 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2335 (array!45453 array!45451 (_ BitVec 32) (_ BitVec 32) V!24523 V!24523 (_ BitVec 32) Int) ListLongMap!8535)

(assert (=> b!820411 (= lt!368615 (getCurrentListMapNoExtraKeys!2335 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820411 (= lt!368617 (getCurrentListMapNoExtraKeys!2335 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!559803 () Bool)

(assert (=> start!70624 (=> (not res!559803) (not e!455811))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70624 (= res!559803 (validMask!0 mask!1312))))

(assert (=> start!70624 e!455811))

(declare-fun tp_is_empty!14641 () Bool)

(assert (=> start!70624 tp_is_empty!14641))

(declare-fun array_inv!17473 (array!45453) Bool)

(assert (=> start!70624 (array_inv!17473 _keys!976)))

(assert (=> start!70624 true))

(declare-fun e!455808 () Bool)

(declare-fun array_inv!17474 (array!45451) Bool)

(assert (=> start!70624 (and (array_inv!17474 _values!788) e!455808)))

(assert (=> start!70624 tp!45531))

(declare-fun b!820412 () Bool)

(declare-fun e!455809 () Bool)

(assert (=> b!820412 (= e!455809 tp_is_empty!14641)))

(declare-fun b!820413 () Bool)

(assert (=> b!820413 (= e!455808 (and e!455809 mapRes!23566))))

(declare-fun condMapEmpty!23566 () Bool)

(declare-fun mapDefault!23566 () ValueCell!6905)

(assert (=> b!820413 (= condMapEmpty!23566 (= (arr!21778 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6905)) mapDefault!23566)))))

(declare-fun b!820414 () Bool)

(declare-fun res!559806 () Bool)

(assert (=> b!820414 (=> (not res!559806) (not e!455811))))

(declare-datatypes ((List!15539 0))(
  ( (Nil!15536) (Cons!15535 (h!16664 (_ BitVec 64)) (t!21863 List!15539)) )
))
(declare-fun arrayNoDuplicates!0 (array!45453 (_ BitVec 32) List!15539) Bool)

(assert (=> b!820414 (= res!559806 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15536))))

(declare-fun b!820415 () Bool)

(assert (=> b!820415 (= e!455812 tp_is_empty!14641)))

(declare-fun b!820416 () Bool)

(declare-fun res!559805 () Bool)

(assert (=> b!820416 (=> (not res!559805) (not e!455811))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45453 (_ BitVec 32)) Bool)

(assert (=> b!820416 (= res!559805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!23566 () Bool)

(assert (=> mapIsEmpty!23566 mapRes!23566))

(assert (= (and start!70624 res!559803) b!820410))

(assert (= (and b!820410 res!559804) b!820416))

(assert (= (and b!820416 res!559805) b!820414))

(assert (= (and b!820414 res!559806) b!820411))

(assert (= (and b!820413 condMapEmpty!23566) mapIsEmpty!23566))

(assert (= (and b!820413 (not condMapEmpty!23566)) mapNonEmpty!23566))

(get-info :version)

(assert (= (and mapNonEmpty!23566 ((_ is ValueCellFull!6905) mapValue!23566)) b!820415))

(assert (= (and b!820413 ((_ is ValueCellFull!6905) mapDefault!23566)) b!820412))

(assert (= start!70624 b!820413))

(declare-fun m!761827 () Bool)

(assert (=> start!70624 m!761827))

(declare-fun m!761829 () Bool)

(assert (=> start!70624 m!761829))

(declare-fun m!761831 () Bool)

(assert (=> start!70624 m!761831))

(declare-fun m!761833 () Bool)

(assert (=> mapNonEmpty!23566 m!761833))

(declare-fun m!761835 () Bool)

(assert (=> b!820416 m!761835))

(declare-fun m!761837 () Bool)

(assert (=> b!820414 m!761837))

(declare-fun m!761839 () Bool)

(assert (=> b!820411 m!761839))

(declare-fun m!761841 () Bool)

(assert (=> b!820411 m!761841))

(declare-fun m!761843 () Bool)

(assert (=> b!820411 m!761843))

(check-sat (not b!820411) (not b!820414) tp_is_empty!14641 (not b!820416) (not b_next!12931) (not start!70624) b_and!21759 (not mapNonEmpty!23566))
(check-sat b_and!21759 (not b_next!12931))
