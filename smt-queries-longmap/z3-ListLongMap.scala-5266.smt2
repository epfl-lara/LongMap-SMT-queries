; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70732 () Bool)

(assert start!70732)

(declare-fun b_free!13005 () Bool)

(declare-fun b_next!13005 () Bool)

(assert (=> start!70732 (= b_free!13005 (not b_next!13005))))

(declare-fun tp!45756 () Bool)

(declare-fun b_and!21867 () Bool)

(assert (=> start!70732 (= tp!45756 b_and!21867)))

(declare-fun b!821577 () Bool)

(declare-fun e!456630 () Bool)

(declare-fun tp_is_empty!14715 () Bool)

(assert (=> b!821577 (= e!456630 tp_is_empty!14715)))

(declare-fun mapIsEmpty!23680 () Bool)

(declare-fun mapRes!23680 () Bool)

(assert (=> mapIsEmpty!23680 mapRes!23680))

(declare-fun b!821578 () Bool)

(declare-fun res!560447 () Bool)

(declare-fun e!456629 () Bool)

(assert (=> b!821578 (=> (not res!560447) (not e!456629))))

(declare-datatypes ((array!45626 0))(
  ( (array!45627 (arr!21864 (Array (_ BitVec 32) (_ BitVec 64))) (size!22285 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45626)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45626 (_ BitVec 32)) Bool)

(assert (=> b!821578 (= res!560447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!821579 () Bool)

(declare-fun e!456627 () Bool)

(assert (=> b!821579 (= e!456629 (not e!456627))))

(declare-fun res!560445 () Bool)

(assert (=> b!821579 (=> res!560445 e!456627)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!821579 (= res!560445 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!24621 0))(
  ( (V!24622 (val!7405 Int)) )
))
(declare-datatypes ((tuple2!9772 0))(
  ( (tuple2!9773 (_1!4897 (_ BitVec 64)) (_2!4897 V!24621)) )
))
(declare-datatypes ((List!15588 0))(
  ( (Nil!15585) (Cons!15584 (h!16713 tuple2!9772) (t!21923 List!15588)) )
))
(declare-datatypes ((ListLongMap!8595 0))(
  ( (ListLongMap!8596 (toList!4313 List!15588)) )
))
(declare-fun lt!369290 () ListLongMap!8595)

(declare-fun lt!369292 () ListLongMap!8595)

(assert (=> b!821579 (= lt!369290 lt!369292)))

(declare-fun zeroValueBefore!34 () V!24621)

(declare-fun zeroValueAfter!34 () V!24621)

(declare-fun minValue!754 () V!24621)

(declare-datatypes ((ValueCell!6942 0))(
  ( (ValueCellFull!6942 (v!9836 V!24621)) (EmptyCell!6942) )
))
(declare-datatypes ((array!45628 0))(
  ( (array!45629 (arr!21865 (Array (_ BitVec 32) ValueCell!6942)) (size!22286 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45628)

(declare-fun defaultEntry!796 () Int)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28095 0))(
  ( (Unit!28096) )
))
(declare-fun lt!369291 () Unit!28095)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!445 (array!45626 array!45628 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24621 V!24621 V!24621 V!24621 (_ BitVec 32) Int) Unit!28095)

(assert (=> b!821579 (= lt!369291 (lemmaNoChangeToArrayThenSameMapNoExtras!445 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2335 (array!45626 array!45628 (_ BitVec 32) (_ BitVec 32) V!24621 V!24621 (_ BitVec 32) Int) ListLongMap!8595)

(assert (=> b!821579 (= lt!369292 (getCurrentListMapNoExtraKeys!2335 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821579 (= lt!369290 (getCurrentListMapNoExtraKeys!2335 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821580 () Bool)

(declare-fun e!456632 () Bool)

(declare-fun e!456631 () Bool)

(assert (=> b!821580 (= e!456632 (and e!456631 mapRes!23680))))

(declare-fun condMapEmpty!23680 () Bool)

(declare-fun mapDefault!23680 () ValueCell!6942)

(assert (=> b!821580 (= condMapEmpty!23680 (= (arr!21865 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6942)) mapDefault!23680)))))

(declare-fun b!821581 () Bool)

(declare-fun res!560443 () Bool)

(assert (=> b!821581 (=> (not res!560443) (not e!456629))))

(assert (=> b!821581 (= res!560443 (and (= (size!22286 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22285 _keys!976) (size!22286 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!560446 () Bool)

(assert (=> start!70732 (=> (not res!560446) (not e!456629))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70732 (= res!560446 (validMask!0 mask!1312))))

(assert (=> start!70732 e!456629))

(assert (=> start!70732 tp_is_empty!14715))

(declare-fun array_inv!17471 (array!45626) Bool)

(assert (=> start!70732 (array_inv!17471 _keys!976)))

(assert (=> start!70732 true))

(declare-fun array_inv!17472 (array!45628) Bool)

(assert (=> start!70732 (and (array_inv!17472 _values!788) e!456632)))

(assert (=> start!70732 tp!45756))

(declare-fun b!821582 () Bool)

(declare-fun res!560444 () Bool)

(assert (=> b!821582 (=> (not res!560444) (not e!456629))))

(declare-datatypes ((List!15589 0))(
  ( (Nil!15586) (Cons!15585 (h!16714 (_ BitVec 64)) (t!21924 List!15589)) )
))
(declare-fun arrayNoDuplicates!0 (array!45626 (_ BitVec 32) List!15589) Bool)

(assert (=> b!821582 (= res!560444 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15586))))

(declare-fun b!821583 () Bool)

(assert (=> b!821583 (= e!456631 tp_is_empty!14715)))

(declare-fun mapNonEmpty!23680 () Bool)

(declare-fun tp!45757 () Bool)

(assert (=> mapNonEmpty!23680 (= mapRes!23680 (and tp!45757 e!456630))))

(declare-fun mapValue!23680 () ValueCell!6942)

(declare-fun mapKey!23680 () (_ BitVec 32))

(declare-fun mapRest!23680 () (Array (_ BitVec 32) ValueCell!6942))

(assert (=> mapNonEmpty!23680 (= (arr!21865 _values!788) (store mapRest!23680 mapKey!23680 mapValue!23680))))

(declare-fun b!821584 () Bool)

(assert (=> b!821584 (= e!456627 true)))

(declare-fun lt!369293 () ListLongMap!8595)

(declare-fun getCurrentListMap!2482 (array!45626 array!45628 (_ BitVec 32) (_ BitVec 32) V!24621 V!24621 (_ BitVec 32) Int) ListLongMap!8595)

(assert (=> b!821584 (= lt!369293 (getCurrentListMap!2482 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70732 res!560446) b!821581))

(assert (= (and b!821581 res!560443) b!821578))

(assert (= (and b!821578 res!560447) b!821582))

(assert (= (and b!821582 res!560444) b!821579))

(assert (= (and b!821579 (not res!560445)) b!821584))

(assert (= (and b!821580 condMapEmpty!23680) mapIsEmpty!23680))

(assert (= (and b!821580 (not condMapEmpty!23680)) mapNonEmpty!23680))

(get-info :version)

(assert (= (and mapNonEmpty!23680 ((_ is ValueCellFull!6942) mapValue!23680)) b!821577))

(assert (= (and b!821580 ((_ is ValueCellFull!6942) mapDefault!23680)) b!821583))

(assert (= start!70732 b!821580))

(declare-fun m!763349 () Bool)

(assert (=> b!821582 m!763349))

(declare-fun m!763351 () Bool)

(assert (=> b!821579 m!763351))

(declare-fun m!763353 () Bool)

(assert (=> b!821579 m!763353))

(declare-fun m!763355 () Bool)

(assert (=> b!821579 m!763355))

(declare-fun m!763357 () Bool)

(assert (=> b!821578 m!763357))

(declare-fun m!763359 () Bool)

(assert (=> b!821584 m!763359))

(declare-fun m!763361 () Bool)

(assert (=> mapNonEmpty!23680 m!763361))

(declare-fun m!763363 () Bool)

(assert (=> start!70732 m!763363))

(declare-fun m!763365 () Bool)

(assert (=> start!70732 m!763365))

(declare-fun m!763367 () Bool)

(assert (=> start!70732 m!763367))

(check-sat tp_is_empty!14715 (not b_next!13005) (not start!70732) (not mapNonEmpty!23680) (not b!821584) (not b!821582) (not b!821578) b_and!21867 (not b!821579))
(check-sat b_and!21867 (not b_next!13005))
