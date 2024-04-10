; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70590 () Bool)

(assert start!70590)

(declare-fun b_free!12897 () Bool)

(declare-fun b_next!12897 () Bool)

(assert (=> start!70590 (= b_free!12897 (not b_next!12897))))

(declare-fun tp!45426 () Bool)

(declare-fun b_and!21739 () Bool)

(assert (=> start!70590 (= tp!45426 b_and!21739)))

(declare-fun mapIsEmpty!23512 () Bool)

(declare-fun mapRes!23512 () Bool)

(assert (=> mapIsEmpty!23512 mapRes!23512))

(declare-fun b!820061 () Bool)

(declare-fun e!455541 () Bool)

(declare-fun tp_is_empty!14607 () Bool)

(assert (=> b!820061 (= e!455541 tp_is_empty!14607)))

(declare-fun b!820062 () Bool)

(declare-fun res!559571 () Bool)

(declare-fun e!455536 () Bool)

(assert (=> b!820062 (=> (not res!559571) (not e!455536))))

(declare-datatypes ((array!45408 0))(
  ( (array!45409 (arr!21757 (Array (_ BitVec 32) (_ BitVec 64))) (size!22178 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45408)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45408 (_ BitVec 32)) Bool)

(assert (=> b!820062 (= res!559571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!820063 () Bool)

(declare-fun e!455535 () Bool)

(assert (=> b!820063 (= e!455535 (and e!455541 mapRes!23512))))

(declare-fun condMapEmpty!23512 () Bool)

(declare-datatypes ((V!24477 0))(
  ( (V!24478 (val!7351 Int)) )
))
(declare-datatypes ((ValueCell!6888 0))(
  ( (ValueCellFull!6888 (v!9781 V!24477)) (EmptyCell!6888) )
))
(declare-datatypes ((array!45410 0))(
  ( (array!45411 (arr!21758 (Array (_ BitVec 32) ValueCell!6888)) (size!22179 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45410)

(declare-fun mapDefault!23512 () ValueCell!6888)

(assert (=> b!820063 (= condMapEmpty!23512 (= (arr!21758 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6888)) mapDefault!23512)))))

(declare-fun zeroValueAfter!34 () V!24477)

(declare-fun e!455537 () Bool)

(declare-datatypes ((tuple2!9680 0))(
  ( (tuple2!9681 (_1!4851 (_ BitVec 64)) (_2!4851 V!24477)) )
))
(declare-datatypes ((List!15503 0))(
  ( (Nil!15500) (Cons!15499 (h!16628 tuple2!9680) (t!21834 List!15503)) )
))
(declare-datatypes ((ListLongMap!8503 0))(
  ( (ListLongMap!8504 (toList!4267 List!15503)) )
))
(declare-fun lt!368406 () ListLongMap!8503)

(declare-fun lt!368402 () ListLongMap!8503)

(declare-fun b!820064 () Bool)

(declare-fun +!1862 (ListLongMap!8503 tuple2!9680) ListLongMap!8503)

(assert (=> b!820064 (= e!455537 (= lt!368406 (+!1862 lt!368402 (tuple2!9681 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun mapNonEmpty!23512 () Bool)

(declare-fun tp!45427 () Bool)

(declare-fun e!455539 () Bool)

(assert (=> mapNonEmpty!23512 (= mapRes!23512 (and tp!45427 e!455539))))

(declare-fun mapKey!23512 () (_ BitVec 32))

(declare-fun mapValue!23512 () ValueCell!6888)

(declare-fun mapRest!23512 () (Array (_ BitVec 32) ValueCell!6888))

(assert (=> mapNonEmpty!23512 (= (arr!21758 _values!788) (store mapRest!23512 mapKey!23512 mapValue!23512))))

(declare-fun b!820065 () Bool)

(declare-fun res!559569 () Bool)

(assert (=> b!820065 (=> (not res!559569) (not e!455536))))

(declare-datatypes ((List!15504 0))(
  ( (Nil!15501) (Cons!15500 (h!16629 (_ BitVec 64)) (t!21835 List!15504)) )
))
(declare-fun arrayNoDuplicates!0 (array!45408 (_ BitVec 32) List!15504) Bool)

(assert (=> b!820065 (= res!559569 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15501))))

(declare-fun b!820066 () Bool)

(assert (=> b!820066 (= e!455539 tp_is_empty!14607)))

(declare-fun b!820067 () Bool)

(declare-fun e!455540 () Bool)

(assert (=> b!820067 (= e!455540 true)))

(declare-fun lt!368404 () tuple2!9680)

(declare-fun lt!368399 () tuple2!9680)

(declare-fun lt!368401 () ListLongMap!8503)

(assert (=> b!820067 (= lt!368401 (+!1862 (+!1862 lt!368402 lt!368399) lt!368404))))

(declare-fun lt!368403 () ListLongMap!8503)

(declare-fun lt!368400 () ListLongMap!8503)

(assert (=> b!820067 (= (+!1862 lt!368403 lt!368404) (+!1862 lt!368400 lt!368404))))

(declare-fun zeroValueBefore!34 () V!24477)

(declare-datatypes ((Unit!28013 0))(
  ( (Unit!28014) )
))
(declare-fun lt!368398 () Unit!28013)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!199 (ListLongMap!8503 (_ BitVec 64) V!24477 V!24477) Unit!28013)

(assert (=> b!820067 (= lt!368398 (addSameAsAddTwiceSameKeyDiffValues!199 lt!368403 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!820067 (= lt!368404 (tuple2!9681 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!820067 e!455537))

(declare-fun res!559570 () Bool)

(assert (=> b!820067 (=> (not res!559570) (not e!455537))))

(declare-fun lt!368397 () ListLongMap!8503)

(assert (=> b!820067 (= res!559570 (= lt!368397 lt!368400))))

(assert (=> b!820067 (= lt!368400 (+!1862 lt!368403 lt!368399))))

(assert (=> b!820067 (= lt!368399 (tuple2!9681 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun minValue!754 () V!24477)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2465 (array!45408 array!45410 (_ BitVec 32) (_ BitVec 32) V!24477 V!24477 (_ BitVec 32) Int) ListLongMap!8503)

(assert (=> b!820067 (= lt!368406 (getCurrentListMap!2465 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!820067 (= lt!368397 (getCurrentListMap!2465 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!559573 () Bool)

(assert (=> start!70590 (=> (not res!559573) (not e!455536))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70590 (= res!559573 (validMask!0 mask!1312))))

(assert (=> start!70590 e!455536))

(assert (=> start!70590 tp_is_empty!14607))

(declare-fun array_inv!17391 (array!45408) Bool)

(assert (=> start!70590 (array_inv!17391 _keys!976)))

(assert (=> start!70590 true))

(declare-fun array_inv!17392 (array!45410) Bool)

(assert (=> start!70590 (and (array_inv!17392 _values!788) e!455535)))

(assert (=> start!70590 tp!45426))

(declare-fun b!820068 () Bool)

(declare-fun res!559572 () Bool)

(assert (=> b!820068 (=> (not res!559572) (not e!455536))))

(assert (=> b!820068 (= res!559572 (and (= (size!22179 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22178 _keys!976) (size!22179 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!820069 () Bool)

(assert (=> b!820069 (= e!455536 (not e!455540))))

(declare-fun res!559574 () Bool)

(assert (=> b!820069 (=> res!559574 e!455540)))

(assert (=> b!820069 (= res!559574 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!820069 (= lt!368403 lt!368402)))

(declare-fun lt!368405 () Unit!28013)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!405 (array!45408 array!45410 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24477 V!24477 V!24477 V!24477 (_ BitVec 32) Int) Unit!28013)

(assert (=> b!820069 (= lt!368405 (lemmaNoChangeToArrayThenSameMapNoExtras!405 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2295 (array!45408 array!45410 (_ BitVec 32) (_ BitVec 32) V!24477 V!24477 (_ BitVec 32) Int) ListLongMap!8503)

(assert (=> b!820069 (= lt!368402 (getCurrentListMapNoExtraKeys!2295 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820069 (= lt!368403 (getCurrentListMapNoExtraKeys!2295 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70590 res!559573) b!820068))

(assert (= (and b!820068 res!559572) b!820062))

(assert (= (and b!820062 res!559571) b!820065))

(assert (= (and b!820065 res!559569) b!820069))

(assert (= (and b!820069 (not res!559574)) b!820067))

(assert (= (and b!820067 res!559570) b!820064))

(assert (= (and b!820063 condMapEmpty!23512) mapIsEmpty!23512))

(assert (= (and b!820063 (not condMapEmpty!23512)) mapNonEmpty!23512))

(get-info :version)

(assert (= (and mapNonEmpty!23512 ((_ is ValueCellFull!6888) mapValue!23512)) b!820066))

(assert (= (and b!820063 ((_ is ValueCellFull!6888) mapDefault!23512)) b!820061))

(assert (= start!70590 b!820063))

(declare-fun m!761891 () Bool)

(assert (=> b!820062 m!761891))

(declare-fun m!761893 () Bool)

(assert (=> b!820067 m!761893))

(declare-fun m!761895 () Bool)

(assert (=> b!820067 m!761895))

(declare-fun m!761897 () Bool)

(assert (=> b!820067 m!761897))

(declare-fun m!761899 () Bool)

(assert (=> b!820067 m!761899))

(assert (=> b!820067 m!761897))

(declare-fun m!761901 () Bool)

(assert (=> b!820067 m!761901))

(declare-fun m!761903 () Bool)

(assert (=> b!820067 m!761903))

(declare-fun m!761905 () Bool)

(assert (=> b!820067 m!761905))

(declare-fun m!761907 () Bool)

(assert (=> b!820067 m!761907))

(declare-fun m!761909 () Bool)

(assert (=> b!820065 m!761909))

(declare-fun m!761911 () Bool)

(assert (=> b!820069 m!761911))

(declare-fun m!761913 () Bool)

(assert (=> b!820069 m!761913))

(declare-fun m!761915 () Bool)

(assert (=> b!820069 m!761915))

(declare-fun m!761917 () Bool)

(assert (=> mapNonEmpty!23512 m!761917))

(declare-fun m!761919 () Bool)

(assert (=> start!70590 m!761919))

(declare-fun m!761921 () Bool)

(assert (=> start!70590 m!761921))

(declare-fun m!761923 () Bool)

(assert (=> start!70590 m!761923))

(declare-fun m!761925 () Bool)

(assert (=> b!820064 m!761925))

(check-sat b_and!21739 (not b!820067) (not b!820064) tp_is_empty!14607 (not b!820062) (not mapNonEmpty!23512) (not b_next!12897) (not start!70590) (not b!820065) (not b!820069))
(check-sat b_and!21739 (not b_next!12897))
