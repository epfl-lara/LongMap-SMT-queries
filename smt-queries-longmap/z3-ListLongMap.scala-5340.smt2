; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71346 () Bool)

(assert start!71346)

(declare-fun b_free!13447 () Bool)

(declare-fun b_next!13447 () Bool)

(assert (=> start!71346 (= b_free!13447 (not b_next!13447))))

(declare-fun tp!47115 () Bool)

(declare-fun b_and!22403 () Bool)

(assert (=> start!71346 (= tp!47115 b_and!22403)))

(declare-fun b!828566 () Bool)

(declare-datatypes ((V!25211 0))(
  ( (V!25212 (val!7626 Int)) )
))
(declare-datatypes ((tuple2!10120 0))(
  ( (tuple2!10121 (_1!5071 (_ BitVec 64)) (_2!5071 V!25211)) )
))
(declare-fun lt!375401 () tuple2!10120)

(declare-fun lt!375406 () tuple2!10120)

(declare-fun e!461734 () Bool)

(declare-datatypes ((List!15907 0))(
  ( (Nil!15904) (Cons!15903 (h!17032 tuple2!10120) (t!22255 List!15907)) )
))
(declare-datatypes ((ListLongMap!8933 0))(
  ( (ListLongMap!8934 (toList!4482 List!15907)) )
))
(declare-fun lt!375408 () ListLongMap!8933)

(declare-fun lt!375405 () ListLongMap!8933)

(declare-fun +!1993 (ListLongMap!8933 tuple2!10120) ListLongMap!8933)

(assert (=> b!828566 (= e!461734 (= lt!375408 (+!1993 (+!1993 lt!375405 lt!375401) lt!375406)))))

(declare-fun lt!375409 () ListLongMap!8933)

(declare-fun lt!375402 () ListLongMap!8933)

(assert (=> b!828566 (= (+!1993 lt!375409 lt!375406) (+!1993 lt!375402 lt!375406))))

(declare-fun zeroValueBefore!34 () V!25211)

(declare-datatypes ((Unit!28337 0))(
  ( (Unit!28338) )
))
(declare-fun lt!375407 () Unit!28337)

(declare-fun zeroValueAfter!34 () V!25211)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!245 (ListLongMap!8933 (_ BitVec 64) V!25211 V!25211) Unit!28337)

(assert (=> b!828566 (= lt!375407 (addSameAsAddTwiceSameKeyDiffValues!245 lt!375409 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!828566 (= lt!375406 (tuple2!10121 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!461737 () Bool)

(assert (=> b!828566 e!461737))

(declare-fun res!564585 () Bool)

(assert (=> b!828566 (=> (not res!564585) (not e!461737))))

(declare-fun lt!375404 () ListLongMap!8933)

(assert (=> b!828566 (= res!564585 (= lt!375404 lt!375402))))

(assert (=> b!828566 (= lt!375402 (+!1993 lt!375409 lt!375401))))

(assert (=> b!828566 (= lt!375401 (tuple2!10121 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((array!46453 0))(
  ( (array!46454 (arr!22267 (Array (_ BitVec 32) (_ BitVec 64))) (size!22688 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46453)

(declare-fun minValue!754 () V!25211)

(declare-datatypes ((ValueCell!7163 0))(
  ( (ValueCellFull!7163 (v!10058 V!25211)) (EmptyCell!7163) )
))
(declare-datatypes ((array!46455 0))(
  ( (array!46456 (arr!22268 (Array (_ BitVec 32) ValueCell!7163)) (size!22689 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46455)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2537 (array!46453 array!46455 (_ BitVec 32) (_ BitVec 32) V!25211 V!25211 (_ BitVec 32) Int) ListLongMap!8933)

(assert (=> b!828566 (= lt!375408 (getCurrentListMap!2537 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!828566 (= lt!375404 (getCurrentListMap!2537 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!24376 () Bool)

(declare-fun mapRes!24376 () Bool)

(assert (=> mapIsEmpty!24376 mapRes!24376))

(declare-fun b!828567 () Bool)

(declare-fun res!564583 () Bool)

(declare-fun e!461736 () Bool)

(assert (=> b!828567 (=> (not res!564583) (not e!461736))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46453 (_ BitVec 32)) Bool)

(assert (=> b!828567 (= res!564583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!828568 () Bool)

(declare-fun e!461738 () Bool)

(declare-fun tp_is_empty!15157 () Bool)

(assert (=> b!828568 (= e!461738 tp_is_empty!15157)))

(declare-fun mapNonEmpty!24376 () Bool)

(declare-fun tp!47116 () Bool)

(declare-fun e!461735 () Bool)

(assert (=> mapNonEmpty!24376 (= mapRes!24376 (and tp!47116 e!461735))))

(declare-fun mapRest!24376 () (Array (_ BitVec 32) ValueCell!7163))

(declare-fun mapKey!24376 () (_ BitVec 32))

(declare-fun mapValue!24376 () ValueCell!7163)

(assert (=> mapNonEmpty!24376 (= (arr!22268 _values!788) (store mapRest!24376 mapKey!24376 mapValue!24376))))

(declare-fun res!564584 () Bool)

(assert (=> start!71346 (=> (not res!564584) (not e!461736))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71346 (= res!564584 (validMask!0 mask!1312))))

(assert (=> start!71346 e!461736))

(assert (=> start!71346 tp_is_empty!15157))

(declare-fun array_inv!17799 (array!46453) Bool)

(assert (=> start!71346 (array_inv!17799 _keys!976)))

(assert (=> start!71346 true))

(declare-fun e!461739 () Bool)

(declare-fun array_inv!17800 (array!46455) Bool)

(assert (=> start!71346 (and (array_inv!17800 _values!788) e!461739)))

(assert (=> start!71346 tp!47115))

(declare-fun b!828569 () Bool)

(assert (=> b!828569 (= e!461739 (and e!461738 mapRes!24376))))

(declare-fun condMapEmpty!24376 () Bool)

(declare-fun mapDefault!24376 () ValueCell!7163)

(assert (=> b!828569 (= condMapEmpty!24376 (= (arr!22268 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7163)) mapDefault!24376)))))

(declare-fun b!828570 () Bool)

(assert (=> b!828570 (= e!461736 (not e!461734))))

(declare-fun res!564581 () Bool)

(assert (=> b!828570 (=> res!564581 e!461734)))

(assert (=> b!828570 (= res!564581 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!828570 (= lt!375409 lt!375405)))

(declare-fun lt!375403 () Unit!28337)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!582 (array!46453 array!46455 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25211 V!25211 V!25211 V!25211 (_ BitVec 32) Int) Unit!28337)

(assert (=> b!828570 (= lt!375403 (lemmaNoChangeToArrayThenSameMapNoExtras!582 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2512 (array!46453 array!46455 (_ BitVec 32) (_ BitVec 32) V!25211 V!25211 (_ BitVec 32) Int) ListLongMap!8933)

(assert (=> b!828570 (= lt!375405 (getCurrentListMapNoExtraKeys!2512 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!828570 (= lt!375409 (getCurrentListMapNoExtraKeys!2512 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!828571 () Bool)

(assert (=> b!828571 (= e!461737 (= lt!375408 (+!1993 lt!375405 (tuple2!10121 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!828572 () Bool)

(assert (=> b!828572 (= e!461735 tp_is_empty!15157)))

(declare-fun b!828573 () Bool)

(declare-fun res!564582 () Bool)

(assert (=> b!828573 (=> (not res!564582) (not e!461736))))

(assert (=> b!828573 (= res!564582 (and (= (size!22689 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22688 _keys!976) (size!22689 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!828574 () Bool)

(declare-fun res!564586 () Bool)

(assert (=> b!828574 (=> (not res!564586) (not e!461736))))

(declare-datatypes ((List!15908 0))(
  ( (Nil!15905) (Cons!15904 (h!17033 (_ BitVec 64)) (t!22256 List!15908)) )
))
(declare-fun arrayNoDuplicates!0 (array!46453 (_ BitVec 32) List!15908) Bool)

(assert (=> b!828574 (= res!564586 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15905))))

(assert (= (and start!71346 res!564584) b!828573))

(assert (= (and b!828573 res!564582) b!828567))

(assert (= (and b!828567 res!564583) b!828574))

(assert (= (and b!828574 res!564586) b!828570))

(assert (= (and b!828570 (not res!564581)) b!828566))

(assert (= (and b!828566 res!564585) b!828571))

(assert (= (and b!828569 condMapEmpty!24376) mapIsEmpty!24376))

(assert (= (and b!828569 (not condMapEmpty!24376)) mapNonEmpty!24376))

(get-info :version)

(assert (= (and mapNonEmpty!24376 ((_ is ValueCellFull!7163) mapValue!24376)) b!828572))

(assert (= (and b!828569 ((_ is ValueCellFull!7163) mapDefault!24376)) b!828568))

(assert (= start!71346 b!828569))

(declare-fun m!770991 () Bool)

(assert (=> b!828566 m!770991))

(declare-fun m!770993 () Bool)

(assert (=> b!828566 m!770993))

(declare-fun m!770995 () Bool)

(assert (=> b!828566 m!770995))

(declare-fun m!770997 () Bool)

(assert (=> b!828566 m!770997))

(assert (=> b!828566 m!770993))

(declare-fun m!770999 () Bool)

(assert (=> b!828566 m!770999))

(declare-fun m!771001 () Bool)

(assert (=> b!828566 m!771001))

(declare-fun m!771003 () Bool)

(assert (=> b!828566 m!771003))

(declare-fun m!771005 () Bool)

(assert (=> b!828566 m!771005))

(declare-fun m!771007 () Bool)

(assert (=> b!828567 m!771007))

(declare-fun m!771009 () Bool)

(assert (=> b!828574 m!771009))

(declare-fun m!771011 () Bool)

(assert (=> b!828571 m!771011))

(declare-fun m!771013 () Bool)

(assert (=> b!828570 m!771013))

(declare-fun m!771015 () Bool)

(assert (=> b!828570 m!771015))

(declare-fun m!771017 () Bool)

(assert (=> b!828570 m!771017))

(declare-fun m!771019 () Bool)

(assert (=> mapNonEmpty!24376 m!771019))

(declare-fun m!771021 () Bool)

(assert (=> start!71346 m!771021))

(declare-fun m!771023 () Bool)

(assert (=> start!71346 m!771023))

(declare-fun m!771025 () Bool)

(assert (=> start!71346 m!771025))

(check-sat b_and!22403 (not b!828570) (not b!828566) (not start!71346) (not b_next!13447) (not b!828571) tp_is_empty!15157 (not b!828574) (not mapNonEmpty!24376) (not b!828567))
(check-sat b_and!22403 (not b_next!13447))
