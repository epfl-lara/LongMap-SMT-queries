; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71320 () Bool)

(assert start!71320)

(declare-fun b_free!13321 () Bool)

(declare-fun b_next!13321 () Bool)

(assert (=> start!71320 (= b_free!13321 (not b_next!13321))))

(declare-fun tp!46722 () Bool)

(declare-fun b_and!22257 () Bool)

(assert (=> start!71320 (= tp!46722 b_and!22257)))

(declare-fun b!827378 () Bool)

(declare-fun res!563734 () Bool)

(declare-fun e!460815 () Bool)

(assert (=> b!827378 (=> (not res!563734) (not e!460815))))

(declare-datatypes ((array!46243 0))(
  ( (array!46244 (arr!22162 (Array (_ BitVec 32) (_ BitVec 64))) (size!22582 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46243)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46243 (_ BitVec 32)) Bool)

(assert (=> b!827378 (= res!563734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!563738 () Bool)

(assert (=> start!71320 (=> (not res!563738) (not e!460815))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71320 (= res!563738 (validMask!0 mask!1312))))

(assert (=> start!71320 e!460815))

(declare-fun tp_is_empty!15031 () Bool)

(assert (=> start!71320 tp_is_empty!15031))

(declare-fun array_inv!17707 (array!46243) Bool)

(assert (=> start!71320 (array_inv!17707 _keys!976)))

(assert (=> start!71320 true))

(declare-datatypes ((V!25043 0))(
  ( (V!25044 (val!7563 Int)) )
))
(declare-datatypes ((ValueCell!7100 0))(
  ( (ValueCellFull!7100 (v!9997 V!25043)) (EmptyCell!7100) )
))
(declare-datatypes ((array!46245 0))(
  ( (array!46246 (arr!22163 (Array (_ BitVec 32) ValueCell!7100)) (size!22583 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46245)

(declare-fun e!460818 () Bool)

(declare-fun array_inv!17708 (array!46245) Bool)

(assert (=> start!71320 (and (array_inv!17708 _values!788) e!460818)))

(assert (=> start!71320 tp!46722))

(declare-fun mapIsEmpty!24172 () Bool)

(declare-fun mapRes!24172 () Bool)

(assert (=> mapIsEmpty!24172 mapRes!24172))

(declare-fun b!827379 () Bool)

(declare-fun e!460816 () Bool)

(assert (=> b!827379 (= e!460815 (not e!460816))))

(declare-fun res!563735 () Bool)

(assert (=> b!827379 (=> res!563735 e!460816)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!827379 (= res!563735 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9946 0))(
  ( (tuple2!9947 (_1!4984 (_ BitVec 64)) (_2!4984 V!25043)) )
))
(declare-datatypes ((List!15723 0))(
  ( (Nil!15720) (Cons!15719 (h!16854 tuple2!9946) (t!22062 List!15723)) )
))
(declare-datatypes ((ListLongMap!8771 0))(
  ( (ListLongMap!8772 (toList!4401 List!15723)) )
))
(declare-fun lt!374391 () ListLongMap!8771)

(declare-fun lt!374380 () ListLongMap!8771)

(assert (=> b!827379 (= lt!374391 lt!374380)))

(declare-fun zeroValueAfter!34 () V!25043)

(declare-fun minValue!754 () V!25043)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28354 0))(
  ( (Unit!28355) )
))
(declare-fun lt!374385 () Unit!28354)

(declare-fun zeroValueBefore!34 () V!25043)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!567 (array!46243 array!46245 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25043 V!25043 V!25043 V!25043 (_ BitVec 32) Int) Unit!28354)

(assert (=> b!827379 (= lt!374385 (lemmaNoChangeToArrayThenSameMapNoExtras!567 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2479 (array!46243 array!46245 (_ BitVec 32) (_ BitVec 32) V!25043 V!25043 (_ BitVec 32) Int) ListLongMap!8771)

(assert (=> b!827379 (= lt!374380 (getCurrentListMapNoExtraKeys!2479 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!827379 (= lt!374391 (getCurrentListMapNoExtraKeys!2479 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!827380 () Bool)

(declare-fun res!563737 () Bool)

(assert (=> b!827380 (=> (not res!563737) (not e!460815))))

(assert (=> b!827380 (= res!563737 (and (= (size!22583 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22582 _keys!976) (size!22583 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun e!460819 () Bool)

(declare-fun lt!374381 () tuple2!9946)

(declare-fun b!827381 () Bool)

(declare-fun lt!374392 () ListLongMap!8771)

(declare-fun +!1947 (ListLongMap!8771 tuple2!9946) ListLongMap!8771)

(assert (=> b!827381 (= e!460819 (= lt!374392 (+!1947 (+!1947 lt!374380 (tuple2!9947 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!374381)))))

(declare-fun b!827382 () Bool)

(declare-fun res!563736 () Bool)

(assert (=> b!827382 (=> (not res!563736) (not e!460815))))

(declare-datatypes ((List!15724 0))(
  ( (Nil!15721) (Cons!15720 (h!16855 (_ BitVec 64)) (t!22063 List!15724)) )
))
(declare-fun arrayNoDuplicates!0 (array!46243 (_ BitVec 32) List!15724) Bool)

(assert (=> b!827382 (= res!563736 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15721))))

(declare-fun b!827383 () Bool)

(declare-fun e!460821 () Bool)

(assert (=> b!827383 (= e!460821 tp_is_empty!15031)))

(declare-fun b!827384 () Bool)

(declare-fun e!460814 () Bool)

(assert (=> b!827384 (= e!460818 (and e!460814 mapRes!24172))))

(declare-fun condMapEmpty!24172 () Bool)

(declare-fun mapDefault!24172 () ValueCell!7100)

(assert (=> b!827384 (= condMapEmpty!24172 (= (arr!22163 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7100)) mapDefault!24172)))))

(declare-fun b!827385 () Bool)

(declare-fun lt!374390 () tuple2!9946)

(declare-fun e!460820 () Bool)

(assert (=> b!827385 (= e!460820 (= lt!374392 (+!1947 (+!1947 lt!374380 lt!374381) lt!374390)))))

(declare-fun b!827386 () Bool)

(assert (=> b!827386 (= e!460816 true)))

(declare-fun lt!374389 () ListLongMap!8771)

(assert (=> b!827386 (= lt!374389 (+!1947 (+!1947 lt!374391 lt!374390) lt!374381))))

(declare-fun lt!374383 () ListLongMap!8771)

(declare-fun lt!374387 () ListLongMap!8771)

(assert (=> b!827386 (and (= lt!374383 lt!374387) (= lt!374392 lt!374387) (= lt!374392 lt!374383))))

(declare-fun lt!374388 () ListLongMap!8771)

(assert (=> b!827386 (= lt!374387 (+!1947 lt!374388 lt!374390))))

(declare-fun lt!374382 () ListLongMap!8771)

(assert (=> b!827386 (= lt!374383 (+!1947 lt!374382 lt!374390))))

(declare-fun lt!374384 () Unit!28354)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!231 (ListLongMap!8771 (_ BitVec 64) V!25043 V!25043) Unit!28354)

(assert (=> b!827386 (= lt!374384 (addSameAsAddTwiceSameKeyDiffValues!231 lt!374382 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!827386 e!460820))

(declare-fun res!563740 () Bool)

(assert (=> b!827386 (=> (not res!563740) (not e!460820))))

(declare-fun lt!374379 () ListLongMap!8771)

(assert (=> b!827386 (= res!563740 (= lt!374379 lt!374388))))

(declare-fun lt!374386 () tuple2!9946)

(assert (=> b!827386 (= lt!374388 (+!1947 lt!374382 lt!374386))))

(assert (=> b!827386 (= lt!374382 (+!1947 lt!374391 lt!374381))))

(assert (=> b!827386 (= lt!374390 (tuple2!9947 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!827386 e!460819))

(declare-fun res!563739 () Bool)

(assert (=> b!827386 (=> (not res!563739) (not e!460819))))

(assert (=> b!827386 (= res!563739 (= lt!374379 (+!1947 (+!1947 lt!374391 lt!374386) lt!374381)))))

(assert (=> b!827386 (= lt!374381 (tuple2!9947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!827386 (= lt!374386 (tuple2!9947 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2522 (array!46243 array!46245 (_ BitVec 32) (_ BitVec 32) V!25043 V!25043 (_ BitVec 32) Int) ListLongMap!8771)

(assert (=> b!827386 (= lt!374392 (getCurrentListMap!2522 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!827386 (= lt!374379 (getCurrentListMap!2522 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!24172 () Bool)

(declare-fun tp!46723 () Bool)

(assert (=> mapNonEmpty!24172 (= mapRes!24172 (and tp!46723 e!460821))))

(declare-fun mapRest!24172 () (Array (_ BitVec 32) ValueCell!7100))

(declare-fun mapKey!24172 () (_ BitVec 32))

(declare-fun mapValue!24172 () ValueCell!7100)

(assert (=> mapNonEmpty!24172 (= (arr!22163 _values!788) (store mapRest!24172 mapKey!24172 mapValue!24172))))

(declare-fun b!827387 () Bool)

(assert (=> b!827387 (= e!460814 tp_is_empty!15031)))

(assert (= (and start!71320 res!563738) b!827380))

(assert (= (and b!827380 res!563737) b!827378))

(assert (= (and b!827378 res!563734) b!827382))

(assert (= (and b!827382 res!563736) b!827379))

(assert (= (and b!827379 (not res!563735)) b!827386))

(assert (= (and b!827386 res!563739) b!827381))

(assert (= (and b!827386 res!563740) b!827385))

(assert (= (and b!827384 condMapEmpty!24172) mapIsEmpty!24172))

(assert (= (and b!827384 (not condMapEmpty!24172)) mapNonEmpty!24172))

(get-info :version)

(assert (= (and mapNonEmpty!24172 ((_ is ValueCellFull!7100) mapValue!24172)) b!827383))

(assert (= (and b!827384 ((_ is ValueCellFull!7100) mapDefault!24172)) b!827387))

(assert (= start!71320 b!827384))

(declare-fun m!770533 () Bool)

(assert (=> b!827378 m!770533))

(declare-fun m!770535 () Bool)

(assert (=> b!827382 m!770535))

(declare-fun m!770537 () Bool)

(assert (=> b!827381 m!770537))

(assert (=> b!827381 m!770537))

(declare-fun m!770539 () Bool)

(assert (=> b!827381 m!770539))

(declare-fun m!770541 () Bool)

(assert (=> b!827386 m!770541))

(declare-fun m!770543 () Bool)

(assert (=> b!827386 m!770543))

(declare-fun m!770545 () Bool)

(assert (=> b!827386 m!770545))

(declare-fun m!770547 () Bool)

(assert (=> b!827386 m!770547))

(declare-fun m!770549 () Bool)

(assert (=> b!827386 m!770549))

(declare-fun m!770551 () Bool)

(assert (=> b!827386 m!770551))

(declare-fun m!770553 () Bool)

(assert (=> b!827386 m!770553))

(declare-fun m!770555 () Bool)

(assert (=> b!827386 m!770555))

(assert (=> b!827386 m!770549))

(declare-fun m!770557 () Bool)

(assert (=> b!827386 m!770557))

(declare-fun m!770559 () Bool)

(assert (=> b!827386 m!770559))

(declare-fun m!770561 () Bool)

(assert (=> b!827386 m!770561))

(assert (=> b!827386 m!770541))

(declare-fun m!770563 () Bool)

(assert (=> mapNonEmpty!24172 m!770563))

(declare-fun m!770565 () Bool)

(assert (=> b!827379 m!770565))

(declare-fun m!770567 () Bool)

(assert (=> b!827379 m!770567))

(declare-fun m!770569 () Bool)

(assert (=> b!827379 m!770569))

(declare-fun m!770571 () Bool)

(assert (=> start!71320 m!770571))

(declare-fun m!770573 () Bool)

(assert (=> start!71320 m!770573))

(declare-fun m!770575 () Bool)

(assert (=> start!71320 m!770575))

(declare-fun m!770577 () Bool)

(assert (=> b!827385 m!770577))

(assert (=> b!827385 m!770577))

(declare-fun m!770579 () Bool)

(assert (=> b!827385 m!770579))

(check-sat (not b!827379) (not b!827386) b_and!22257 (not b!827385) (not b_next!13321) (not mapNonEmpty!24172) tp_is_empty!15031 (not b!827382) (not b!827381) (not b!827378) (not start!71320))
(check-sat b_and!22257 (not b_next!13321))
