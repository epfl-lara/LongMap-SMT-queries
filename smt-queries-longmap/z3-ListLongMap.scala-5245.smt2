; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70572 () Bool)

(assert start!70572)

(declare-fun b_free!12879 () Bool)

(declare-fun b_next!12879 () Bool)

(assert (=> start!70572 (= b_free!12879 (not b_next!12879))))

(declare-fun tp!45373 () Bool)

(declare-fun b_and!21721 () Bool)

(assert (=> start!70572 (= tp!45373 b_and!21721)))

(declare-fun mapIsEmpty!23485 () Bool)

(declare-fun mapRes!23485 () Bool)

(assert (=> mapIsEmpty!23485 mapRes!23485))

(declare-fun b!819818 () Bool)

(declare-fun res!559411 () Bool)

(declare-fun e!455349 () Bool)

(assert (=> b!819818 (=> (not res!559411) (not e!455349))))

(declare-datatypes ((array!45374 0))(
  ( (array!45375 (arr!21740 (Array (_ BitVec 32) (_ BitVec 64))) (size!22161 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45374)

(declare-datatypes ((List!15490 0))(
  ( (Nil!15487) (Cons!15486 (h!16615 (_ BitVec 64)) (t!21821 List!15490)) )
))
(declare-fun arrayNoDuplicates!0 (array!45374 (_ BitVec 32) List!15490) Bool)

(assert (=> b!819818 (= res!559411 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15487))))

(declare-fun b!819819 () Bool)

(declare-fun e!455348 () Bool)

(assert (=> b!819819 (= e!455348 true)))

(declare-datatypes ((V!24453 0))(
  ( (V!24454 (val!7342 Int)) )
))
(declare-datatypes ((tuple2!9666 0))(
  ( (tuple2!9667 (_1!4844 (_ BitVec 64)) (_2!4844 V!24453)) )
))
(declare-datatypes ((List!15491 0))(
  ( (Nil!15488) (Cons!15487 (h!16616 tuple2!9666) (t!21822 List!15491)) )
))
(declare-datatypes ((ListLongMap!8489 0))(
  ( (ListLongMap!8490 (toList!4260 List!15491)) )
))
(declare-fun lt!368127 () ListLongMap!8489)

(declare-fun lt!368136 () ListLongMap!8489)

(declare-fun lt!368131 () tuple2!9666)

(declare-fun lt!368130 () tuple2!9666)

(declare-fun +!1855 (ListLongMap!8489 tuple2!9666) ListLongMap!8489)

(assert (=> b!819819 (= lt!368136 (+!1855 (+!1855 lt!368127 lt!368130) lt!368131))))

(declare-fun lt!368128 () ListLongMap!8489)

(declare-fun lt!368134 () ListLongMap!8489)

(assert (=> b!819819 (= (+!1855 lt!368128 lt!368131) (+!1855 lt!368134 lt!368131))))

(declare-fun zeroValueBefore!34 () V!24453)

(declare-fun zeroValueAfter!34 () V!24453)

(declare-datatypes ((Unit!27999 0))(
  ( (Unit!28000) )
))
(declare-fun lt!368129 () Unit!27999)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!193 (ListLongMap!8489 (_ BitVec 64) V!24453 V!24453) Unit!27999)

(assert (=> b!819819 (= lt!368129 (addSameAsAddTwiceSameKeyDiffValues!193 lt!368128 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!819819 (= lt!368131 (tuple2!9667 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!455347 () Bool)

(assert (=> b!819819 e!455347))

(declare-fun res!559409 () Bool)

(assert (=> b!819819 (=> (not res!559409) (not e!455347))))

(declare-fun lt!368133 () ListLongMap!8489)

(assert (=> b!819819 (= res!559409 (= lt!368133 lt!368134))))

(assert (=> b!819819 (= lt!368134 (+!1855 lt!368128 lt!368130))))

(assert (=> b!819819 (= lt!368130 (tuple2!9667 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun minValue!754 () V!24453)

(declare-datatypes ((ValueCell!6879 0))(
  ( (ValueCellFull!6879 (v!9772 V!24453)) (EmptyCell!6879) )
))
(declare-datatypes ((array!45376 0))(
  ( (array!45377 (arr!21741 (Array (_ BitVec 32) ValueCell!6879)) (size!22162 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45376)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun lt!368132 () ListLongMap!8489)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2459 (array!45374 array!45376 (_ BitVec 32) (_ BitVec 32) V!24453 V!24453 (_ BitVec 32) Int) ListLongMap!8489)

(assert (=> b!819819 (= lt!368132 (getCurrentListMap!2459 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!819819 (= lt!368133 (getCurrentListMap!2459 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819820 () Bool)

(declare-fun res!559408 () Bool)

(assert (=> b!819820 (=> (not res!559408) (not e!455349))))

(assert (=> b!819820 (= res!559408 (and (= (size!22162 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22161 _keys!976) (size!22162 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!819821 () Bool)

(declare-fun e!455352 () Bool)

(declare-fun e!455346 () Bool)

(assert (=> b!819821 (= e!455352 (and e!455346 mapRes!23485))))

(declare-fun condMapEmpty!23485 () Bool)

(declare-fun mapDefault!23485 () ValueCell!6879)

(assert (=> b!819821 (= condMapEmpty!23485 (= (arr!21741 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6879)) mapDefault!23485)))))

(declare-fun mapNonEmpty!23485 () Bool)

(declare-fun tp!45372 () Bool)

(declare-fun e!455351 () Bool)

(assert (=> mapNonEmpty!23485 (= mapRes!23485 (and tp!45372 e!455351))))

(declare-fun mapKey!23485 () (_ BitVec 32))

(declare-fun mapValue!23485 () ValueCell!6879)

(declare-fun mapRest!23485 () (Array (_ BitVec 32) ValueCell!6879))

(assert (=> mapNonEmpty!23485 (= (arr!21741 _values!788) (store mapRest!23485 mapKey!23485 mapValue!23485))))

(declare-fun b!819822 () Bool)

(declare-fun res!559407 () Bool)

(assert (=> b!819822 (=> (not res!559407) (not e!455349))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45374 (_ BitVec 32)) Bool)

(assert (=> b!819822 (= res!559407 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!819823 () Bool)

(assert (=> b!819823 (= e!455349 (not e!455348))))

(declare-fun res!559410 () Bool)

(assert (=> b!819823 (=> res!559410 e!455348)))

(assert (=> b!819823 (= res!559410 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!819823 (= lt!368128 lt!368127)))

(declare-fun lt!368135 () Unit!27999)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!400 (array!45374 array!45376 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24453 V!24453 V!24453 V!24453 (_ BitVec 32) Int) Unit!27999)

(assert (=> b!819823 (= lt!368135 (lemmaNoChangeToArrayThenSameMapNoExtras!400 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2290 (array!45374 array!45376 (_ BitVec 32) (_ BitVec 32) V!24453 V!24453 (_ BitVec 32) Int) ListLongMap!8489)

(assert (=> b!819823 (= lt!368127 (getCurrentListMapNoExtraKeys!2290 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819823 (= lt!368128 (getCurrentListMapNoExtraKeys!2290 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!559412 () Bool)

(assert (=> start!70572 (=> (not res!559412) (not e!455349))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70572 (= res!559412 (validMask!0 mask!1312))))

(assert (=> start!70572 e!455349))

(declare-fun tp_is_empty!14589 () Bool)

(assert (=> start!70572 tp_is_empty!14589))

(declare-fun array_inv!17377 (array!45374) Bool)

(assert (=> start!70572 (array_inv!17377 _keys!976)))

(assert (=> start!70572 true))

(declare-fun array_inv!17378 (array!45376) Bool)

(assert (=> start!70572 (and (array_inv!17378 _values!788) e!455352)))

(assert (=> start!70572 tp!45373))

(declare-fun b!819824 () Bool)

(assert (=> b!819824 (= e!455346 tp_is_empty!14589)))

(declare-fun b!819825 () Bool)

(assert (=> b!819825 (= e!455351 tp_is_empty!14589)))

(declare-fun b!819826 () Bool)

(assert (=> b!819826 (= e!455347 (= lt!368132 (+!1855 lt!368127 (tuple2!9667 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and start!70572 res!559412) b!819820))

(assert (= (and b!819820 res!559408) b!819822))

(assert (= (and b!819822 res!559407) b!819818))

(assert (= (and b!819818 res!559411) b!819823))

(assert (= (and b!819823 (not res!559410)) b!819819))

(assert (= (and b!819819 res!559409) b!819826))

(assert (= (and b!819821 condMapEmpty!23485) mapIsEmpty!23485))

(assert (= (and b!819821 (not condMapEmpty!23485)) mapNonEmpty!23485))

(get-info :version)

(assert (= (and mapNonEmpty!23485 ((_ is ValueCellFull!6879) mapValue!23485)) b!819825))

(assert (= (and b!819821 ((_ is ValueCellFull!6879) mapDefault!23485)) b!819824))

(assert (= start!70572 b!819821))

(declare-fun m!761567 () Bool)

(assert (=> b!819822 m!761567))

(declare-fun m!761569 () Bool)

(assert (=> b!819819 m!761569))

(declare-fun m!761571 () Bool)

(assert (=> b!819819 m!761571))

(declare-fun m!761573 () Bool)

(assert (=> b!819819 m!761573))

(declare-fun m!761575 () Bool)

(assert (=> b!819819 m!761575))

(declare-fun m!761577 () Bool)

(assert (=> b!819819 m!761577))

(declare-fun m!761579 () Bool)

(assert (=> b!819819 m!761579))

(declare-fun m!761581 () Bool)

(assert (=> b!819819 m!761581))

(declare-fun m!761583 () Bool)

(assert (=> b!819819 m!761583))

(assert (=> b!819819 m!761569))

(declare-fun m!761585 () Bool)

(assert (=> b!819818 m!761585))

(declare-fun m!761587 () Bool)

(assert (=> b!819826 m!761587))

(declare-fun m!761589 () Bool)

(assert (=> start!70572 m!761589))

(declare-fun m!761591 () Bool)

(assert (=> start!70572 m!761591))

(declare-fun m!761593 () Bool)

(assert (=> start!70572 m!761593))

(declare-fun m!761595 () Bool)

(assert (=> mapNonEmpty!23485 m!761595))

(declare-fun m!761597 () Bool)

(assert (=> b!819823 m!761597))

(declare-fun m!761599 () Bool)

(assert (=> b!819823 m!761599))

(declare-fun m!761601 () Bool)

(assert (=> b!819823 m!761601))

(check-sat (not b!819818) (not b!819823) (not start!70572) (not b!819826) (not mapNonEmpty!23485) (not b!819822) (not b!819819) b_and!21721 (not b_next!12879) tp_is_empty!14589)
(check-sat b_and!21721 (not b_next!12879))
