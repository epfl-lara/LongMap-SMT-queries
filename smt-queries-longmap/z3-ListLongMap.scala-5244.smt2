; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70544 () Bool)

(assert start!70544)

(declare-fun b_free!12871 () Bool)

(declare-fun b_next!12871 () Bool)

(assert (=> start!70544 (= b_free!12871 (not b_next!12871))))

(declare-fun tp!45348 () Bool)

(declare-fun b_and!21687 () Bool)

(assert (=> start!70544 (= tp!45348 b_and!21687)))

(declare-fun b!819464 () Bool)

(declare-fun e!455114 () Bool)

(declare-fun tp_is_empty!14581 () Bool)

(assert (=> b!819464 (= e!455114 tp_is_empty!14581)))

(declare-fun b!819465 () Bool)

(declare-fun e!455116 () Bool)

(assert (=> b!819465 (= e!455116 tp_is_empty!14581)))

(declare-fun mapNonEmpty!23473 () Bool)

(declare-fun mapRes!23473 () Bool)

(declare-fun tp!45349 () Bool)

(assert (=> mapNonEmpty!23473 (= mapRes!23473 (and tp!45349 e!455114))))

(declare-datatypes ((V!24443 0))(
  ( (V!24444 (val!7338 Int)) )
))
(declare-datatypes ((ValueCell!6875 0))(
  ( (ValueCellFull!6875 (v!9762 V!24443)) (EmptyCell!6875) )
))
(declare-fun mapRest!23473 () (Array (_ BitVec 32) ValueCell!6875))

(declare-fun mapKey!23473 () (_ BitVec 32))

(declare-fun mapValue!23473 () ValueCell!6875)

(declare-datatypes ((array!45335 0))(
  ( (array!45336 (arr!21721 (Array (_ BitVec 32) ValueCell!6875)) (size!22142 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45335)

(assert (=> mapNonEmpty!23473 (= (arr!21721 _values!788) (store mapRest!23473 mapKey!23473 mapValue!23473))))

(declare-fun b!819466 () Bool)

(declare-fun res!559233 () Bool)

(declare-fun e!455117 () Bool)

(assert (=> b!819466 (=> (not res!559233) (not e!455117))))

(declare-datatypes ((array!45337 0))(
  ( (array!45338 (arr!21722 (Array (_ BitVec 32) (_ BitVec 64))) (size!22143 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45337)

(declare-datatypes ((List!15497 0))(
  ( (Nil!15494) (Cons!15493 (h!16622 (_ BitVec 64)) (t!21819 List!15497)) )
))
(declare-fun arrayNoDuplicates!0 (array!45337 (_ BitVec 32) List!15497) Bool)

(assert (=> b!819466 (= res!559233 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15494))))

(declare-fun mapIsEmpty!23473 () Bool)

(assert (=> mapIsEmpty!23473 mapRes!23473))

(declare-fun b!819467 () Bool)

(declare-fun e!455115 () Bool)

(assert (=> b!819467 (= e!455115 (and e!455116 mapRes!23473))))

(declare-fun condMapEmpty!23473 () Bool)

(declare-fun mapDefault!23473 () ValueCell!6875)

(assert (=> b!819467 (= condMapEmpty!23473 (= (arr!21721 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6875)) mapDefault!23473)))))

(declare-fun b!819468 () Bool)

(declare-fun res!559231 () Bool)

(assert (=> b!819468 (=> (not res!559231) (not e!455117))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(assert (=> b!819468 (= res!559231 (and (= (size!22142 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22143 _keys!976) (size!22142 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!559232 () Bool)

(assert (=> start!70544 (=> (not res!559232) (not e!455117))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70544 (= res!559232 (validMask!0 mask!1312))))

(assert (=> start!70544 e!455117))

(assert (=> start!70544 tp_is_empty!14581))

(declare-fun array_inv!17429 (array!45337) Bool)

(assert (=> start!70544 (array_inv!17429 _keys!976)))

(assert (=> start!70544 true))

(declare-fun array_inv!17430 (array!45335) Bool)

(assert (=> start!70544 (and (array_inv!17430 _values!788) e!455115)))

(assert (=> start!70544 tp!45348))

(declare-fun b!819469 () Bool)

(declare-fun e!455113 () Bool)

(assert (=> b!819469 (= e!455117 (not e!455113))))

(declare-fun res!559234 () Bool)

(assert (=> b!819469 (=> res!559234 e!455113)))

(assert (=> b!819469 (= res!559234 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9678 0))(
  ( (tuple2!9679 (_1!4850 (_ BitVec 64)) (_2!4850 V!24443)) )
))
(declare-datatypes ((List!15498 0))(
  ( (Nil!15495) (Cons!15494 (h!16623 tuple2!9678) (t!21820 List!15498)) )
))
(declare-datatypes ((ListLongMap!8491 0))(
  ( (ListLongMap!8492 (toList!4261 List!15498)) )
))
(declare-fun lt!367767 () ListLongMap!8491)

(declare-fun lt!367772 () ListLongMap!8491)

(assert (=> b!819469 (= lt!367767 lt!367772)))

(declare-fun zeroValueBefore!34 () V!24443)

(declare-datatypes ((Unit!27949 0))(
  ( (Unit!27950) )
))
(declare-fun lt!367770 () Unit!27949)

(declare-fun zeroValueAfter!34 () V!24443)

(declare-fun minValue!754 () V!24443)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!408 (array!45337 array!45335 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24443 V!24443 V!24443 V!24443 (_ BitVec 32) Int) Unit!27949)

(assert (=> b!819469 (= lt!367770 (lemmaNoChangeToArrayThenSameMapNoExtras!408 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2315 (array!45337 array!45335 (_ BitVec 32) (_ BitVec 32) V!24443 V!24443 (_ BitVec 32) Int) ListLongMap!8491)

(assert (=> b!819469 (= lt!367772 (getCurrentListMapNoExtraKeys!2315 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819469 (= lt!367767 (getCurrentListMapNoExtraKeys!2315 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun e!455112 () Bool)

(declare-fun b!819470 () Bool)

(declare-fun lt!367765 () ListLongMap!8491)

(declare-fun +!1882 (ListLongMap!8491 tuple2!9678) ListLongMap!8491)

(assert (=> b!819470 (= e!455112 (= lt!367765 (+!1882 lt!367772 (tuple2!9679 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!819471 () Bool)

(assert (=> b!819471 (= e!455113 true)))

(declare-fun lt!367773 () tuple2!9678)

(declare-fun lt!367771 () ListLongMap!8491)

(declare-fun lt!367768 () tuple2!9678)

(assert (=> b!819471 (= lt!367771 (+!1882 (+!1882 lt!367772 lt!367768) lt!367773))))

(declare-fun lt!367766 () ListLongMap!8491)

(assert (=> b!819471 (= (+!1882 lt!367767 lt!367773) (+!1882 lt!367766 lt!367773))))

(declare-fun lt!367769 () Unit!27949)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!197 (ListLongMap!8491 (_ BitVec 64) V!24443 V!24443) Unit!27949)

(assert (=> b!819471 (= lt!367769 (addSameAsAddTwiceSameKeyDiffValues!197 lt!367767 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!819471 (= lt!367773 (tuple2!9679 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!819471 e!455112))

(declare-fun res!559230 () Bool)

(assert (=> b!819471 (=> (not res!559230) (not e!455112))))

(declare-fun lt!367764 () ListLongMap!8491)

(assert (=> b!819471 (= res!559230 (= lt!367764 lt!367766))))

(assert (=> b!819471 (= lt!367766 (+!1882 lt!367767 lt!367768))))

(assert (=> b!819471 (= lt!367768 (tuple2!9679 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2410 (array!45337 array!45335 (_ BitVec 32) (_ BitVec 32) V!24443 V!24443 (_ BitVec 32) Int) ListLongMap!8491)

(assert (=> b!819471 (= lt!367765 (getCurrentListMap!2410 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819471 (= lt!367764 (getCurrentListMap!2410 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819472 () Bool)

(declare-fun res!559229 () Bool)

(assert (=> b!819472 (=> (not res!559229) (not e!455117))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45337 (_ BitVec 32)) Bool)

(assert (=> b!819472 (= res!559229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!70544 res!559232) b!819468))

(assert (= (and b!819468 res!559231) b!819472))

(assert (= (and b!819472 res!559229) b!819466))

(assert (= (and b!819466 res!559233) b!819469))

(assert (= (and b!819469 (not res!559234)) b!819471))

(assert (= (and b!819471 res!559230) b!819470))

(assert (= (and b!819467 condMapEmpty!23473) mapIsEmpty!23473))

(assert (= (and b!819467 (not condMapEmpty!23473)) mapNonEmpty!23473))

(get-info :version)

(assert (= (and mapNonEmpty!23473 ((_ is ValueCellFull!6875) mapValue!23473)) b!819464))

(assert (= (and b!819467 ((_ is ValueCellFull!6875) mapDefault!23473)) b!819465))

(assert (= start!70544 b!819467))

(declare-fun m!760671 () Bool)

(assert (=> b!819470 m!760671))

(declare-fun m!760673 () Bool)

(assert (=> b!819471 m!760673))

(declare-fun m!760675 () Bool)

(assert (=> b!819471 m!760675))

(declare-fun m!760677 () Bool)

(assert (=> b!819471 m!760677))

(declare-fun m!760679 () Bool)

(assert (=> b!819471 m!760679))

(declare-fun m!760681 () Bool)

(assert (=> b!819471 m!760681))

(declare-fun m!760683 () Bool)

(assert (=> b!819471 m!760683))

(declare-fun m!760685 () Bool)

(assert (=> b!819471 m!760685))

(declare-fun m!760687 () Bool)

(assert (=> b!819471 m!760687))

(assert (=> b!819471 m!760675))

(declare-fun m!760689 () Bool)

(assert (=> b!819466 m!760689))

(declare-fun m!760691 () Bool)

(assert (=> b!819472 m!760691))

(declare-fun m!760693 () Bool)

(assert (=> b!819469 m!760693))

(declare-fun m!760695 () Bool)

(assert (=> b!819469 m!760695))

(declare-fun m!760697 () Bool)

(assert (=> b!819469 m!760697))

(declare-fun m!760699 () Bool)

(assert (=> start!70544 m!760699))

(declare-fun m!760701 () Bool)

(assert (=> start!70544 m!760701))

(declare-fun m!760703 () Bool)

(assert (=> start!70544 m!760703))

(declare-fun m!760705 () Bool)

(assert (=> mapNonEmpty!23473 m!760705))

(check-sat (not b!819472) tp_is_empty!14581 (not start!70544) (not b!819469) (not b_next!12871) b_and!21687 (not b!819471) (not mapNonEmpty!23473) (not b!819470) (not b!819466))
(check-sat b_and!21687 (not b_next!12871))
