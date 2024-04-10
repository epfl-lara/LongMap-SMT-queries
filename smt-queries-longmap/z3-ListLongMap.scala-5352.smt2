; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71688 () Bool)

(assert start!71688)

(declare-fun b_free!13521 () Bool)

(declare-fun b_next!13521 () Bool)

(assert (=> start!71688 (= b_free!13521 (not b_next!13521))))

(declare-fun tp!47359 () Bool)

(declare-fun b_and!22607 () Bool)

(assert (=> start!71688 (= tp!47359 b_and!22607)))

(declare-fun b!833705 () Bool)

(declare-fun e!465098 () Bool)

(declare-fun tp_is_empty!15231 () Bool)

(assert (=> b!833705 (= e!465098 tp_is_empty!15231)))

(declare-fun b!833706 () Bool)

(declare-fun res!566903 () Bool)

(declare-fun e!465103 () Bool)

(assert (=> b!833706 (=> (not res!566903) (not e!465103))))

(declare-datatypes ((array!46636 0))(
  ( (array!46637 (arr!22352 (Array (_ BitVec 32) (_ BitVec 64))) (size!22773 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46636)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46636 (_ BitVec 32)) Bool)

(assert (=> b!833706 (= res!566903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!833707 () Bool)

(declare-fun e!465101 () Bool)

(declare-fun mapRes!24509 () Bool)

(assert (=> b!833707 (= e!465101 (and e!465098 mapRes!24509))))

(declare-fun condMapEmpty!24509 () Bool)

(declare-datatypes ((V!25309 0))(
  ( (V!25310 (val!7663 Int)) )
))
(declare-datatypes ((ValueCell!7200 0))(
  ( (ValueCellFull!7200 (v!10111 V!25309)) (EmptyCell!7200) )
))
(declare-datatypes ((array!46638 0))(
  ( (array!46639 (arr!22353 (Array (_ BitVec 32) ValueCell!7200)) (size!22774 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46638)

(declare-fun mapDefault!24509 () ValueCell!7200)

(assert (=> b!833707 (= condMapEmpty!24509 (= (arr!22353 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7200)) mapDefault!24509)))))

(declare-datatypes ((tuple2!10174 0))(
  ( (tuple2!10175 (_1!5098 (_ BitVec 64)) (_2!5098 V!25309)) )
))
(declare-fun lt!378467 () tuple2!10174)

(declare-datatypes ((List!15965 0))(
  ( (Nil!15962) (Cons!15961 (h!17092 tuple2!10174) (t!22336 List!15965)) )
))
(declare-datatypes ((ListLongMap!8997 0))(
  ( (ListLongMap!8998 (toList!4514 List!15965)) )
))
(declare-fun lt!378472 () ListLongMap!8997)

(declare-fun lt!378469 () tuple2!10174)

(declare-fun lt!378474 () ListLongMap!8997)

(declare-fun e!465102 () Bool)

(declare-fun b!833708 () Bool)

(declare-fun +!1992 (ListLongMap!8997 tuple2!10174) ListLongMap!8997)

(assert (=> b!833708 (= e!465102 (= lt!378472 (+!1992 (+!1992 lt!378474 lt!378469) lt!378467)))))

(declare-fun lt!378473 () ListLongMap!8997)

(declare-fun lt!378466 () ListLongMap!8997)

(assert (=> b!833708 (and (= lt!378473 lt!378466) (= lt!378472 lt!378466) (= lt!378472 lt!378473))))

(declare-fun lt!378464 () ListLongMap!8997)

(assert (=> b!833708 (= lt!378466 (+!1992 lt!378464 lt!378469))))

(declare-fun lt!378471 () ListLongMap!8997)

(assert (=> b!833708 (= lt!378473 (+!1992 lt!378471 lt!378469))))

(declare-fun zeroValueBefore!34 () V!25309)

(declare-datatypes ((Unit!28571 0))(
  ( (Unit!28572) )
))
(declare-fun lt!378468 () Unit!28571)

(declare-fun zeroValueAfter!34 () V!25309)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!245 (ListLongMap!8997 (_ BitVec 64) V!25309 V!25309) Unit!28571)

(assert (=> b!833708 (= lt!378468 (addSameAsAddTwiceSameKeyDiffValues!245 lt!378471 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!465104 () Bool)

(assert (=> b!833708 e!465104))

(declare-fun res!566902 () Bool)

(assert (=> b!833708 (=> (not res!566902) (not e!465104))))

(declare-fun lt!378475 () ListLongMap!8997)

(assert (=> b!833708 (= res!566902 (= lt!378475 lt!378464))))

(declare-fun lt!378465 () tuple2!10174)

(assert (=> b!833708 (= lt!378464 (+!1992 lt!378471 lt!378465))))

(assert (=> b!833708 (= lt!378471 (+!1992 lt!378474 lt!378467))))

(assert (=> b!833708 (= lt!378469 (tuple2!10175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!465100 () Bool)

(assert (=> b!833708 e!465100))

(declare-fun res!566899 () Bool)

(assert (=> b!833708 (=> (not res!566899) (not e!465100))))

(assert (=> b!833708 (= res!566899 (= lt!378475 (+!1992 (+!1992 lt!378474 lt!378465) lt!378467)))))

(declare-fun minValue!754 () V!25309)

(assert (=> b!833708 (= lt!378467 (tuple2!10175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!833708 (= lt!378465 (tuple2!10175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2608 (array!46636 array!46638 (_ BitVec 32) (_ BitVec 32) V!25309 V!25309 (_ BitVec 32) Int) ListLongMap!8997)

(assert (=> b!833708 (= lt!378472 (getCurrentListMap!2608 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!833708 (= lt!378475 (getCurrentListMap!2608 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!833709 () Bool)

(declare-fun res!566900 () Bool)

(assert (=> b!833709 (=> (not res!566900) (not e!465103))))

(declare-datatypes ((List!15966 0))(
  ( (Nil!15963) (Cons!15962 (h!17093 (_ BitVec 64)) (t!22337 List!15966)) )
))
(declare-fun arrayNoDuplicates!0 (array!46636 (_ BitVec 32) List!15966) Bool)

(assert (=> b!833709 (= res!566900 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15963))))

(declare-fun b!833710 () Bool)

(declare-fun res!566898 () Bool)

(assert (=> b!833710 (=> (not res!566898) (not e!465103))))

(assert (=> b!833710 (= res!566898 (and (= (size!22774 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22773 _keys!976) (size!22774 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!833711 () Bool)

(assert (=> b!833711 (= e!465103 (not e!465102))))

(declare-fun res!566901 () Bool)

(assert (=> b!833711 (=> res!566901 e!465102)))

(assert (=> b!833711 (= res!566901 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!378463 () ListLongMap!8997)

(assert (=> b!833711 (= lt!378474 lt!378463)))

(declare-fun lt!378470 () Unit!28571)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!600 (array!46636 array!46638 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25309 V!25309 V!25309 V!25309 (_ BitVec 32) Int) Unit!28571)

(assert (=> b!833711 (= lt!378470 (lemmaNoChangeToArrayThenSameMapNoExtras!600 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2512 (array!46636 array!46638 (_ BitVec 32) (_ BitVec 32) V!25309 V!25309 (_ BitVec 32) Int) ListLongMap!8997)

(assert (=> b!833711 (= lt!378463 (getCurrentListMapNoExtraKeys!2512 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!833711 (= lt!378474 (getCurrentListMapNoExtraKeys!2512 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!833712 () Bool)

(assert (=> b!833712 (= e!465100 (= lt!378472 (+!1992 (+!1992 lt!378463 (tuple2!10175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!378467)))))

(declare-fun b!833713 () Bool)

(assert (=> b!833713 (= e!465104 (= lt!378472 (+!1992 (+!1992 lt!378463 lt!378467) lt!378469)))))

(declare-fun res!566897 () Bool)

(assert (=> start!71688 (=> (not res!566897) (not e!465103))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71688 (= res!566897 (validMask!0 mask!1312))))

(assert (=> start!71688 e!465103))

(assert (=> start!71688 tp_is_empty!15231))

(declare-fun array_inv!17805 (array!46636) Bool)

(assert (=> start!71688 (array_inv!17805 _keys!976)))

(assert (=> start!71688 true))

(declare-fun array_inv!17806 (array!46638) Bool)

(assert (=> start!71688 (and (array_inv!17806 _values!788) e!465101)))

(assert (=> start!71688 tp!47359))

(declare-fun mapIsEmpty!24509 () Bool)

(assert (=> mapIsEmpty!24509 mapRes!24509))

(declare-fun mapNonEmpty!24509 () Bool)

(declare-fun tp!47360 () Bool)

(declare-fun e!465105 () Bool)

(assert (=> mapNonEmpty!24509 (= mapRes!24509 (and tp!47360 e!465105))))

(declare-fun mapRest!24509 () (Array (_ BitVec 32) ValueCell!7200))

(declare-fun mapKey!24509 () (_ BitVec 32))

(declare-fun mapValue!24509 () ValueCell!7200)

(assert (=> mapNonEmpty!24509 (= (arr!22353 _values!788) (store mapRest!24509 mapKey!24509 mapValue!24509))))

(declare-fun b!833714 () Bool)

(assert (=> b!833714 (= e!465105 tp_is_empty!15231)))

(assert (= (and start!71688 res!566897) b!833710))

(assert (= (and b!833710 res!566898) b!833706))

(assert (= (and b!833706 res!566903) b!833709))

(assert (= (and b!833709 res!566900) b!833711))

(assert (= (and b!833711 (not res!566901)) b!833708))

(assert (= (and b!833708 res!566899) b!833712))

(assert (= (and b!833708 res!566902) b!833713))

(assert (= (and b!833707 condMapEmpty!24509) mapIsEmpty!24509))

(assert (= (and b!833707 (not condMapEmpty!24509)) mapNonEmpty!24509))

(get-info :version)

(assert (= (and mapNonEmpty!24509 ((_ is ValueCellFull!7200) mapValue!24509)) b!833714))

(assert (= (and b!833707 ((_ is ValueCellFull!7200) mapDefault!24509)) b!833705))

(assert (= start!71688 b!833707))

(declare-fun m!778591 () Bool)

(assert (=> b!833706 m!778591))

(declare-fun m!778593 () Bool)

(assert (=> b!833709 m!778593))

(declare-fun m!778595 () Bool)

(assert (=> b!833711 m!778595))

(declare-fun m!778597 () Bool)

(assert (=> b!833711 m!778597))

(declare-fun m!778599 () Bool)

(assert (=> b!833711 m!778599))

(declare-fun m!778601 () Bool)

(assert (=> start!71688 m!778601))

(declare-fun m!778603 () Bool)

(assert (=> start!71688 m!778603))

(declare-fun m!778605 () Bool)

(assert (=> start!71688 m!778605))

(declare-fun m!778607 () Bool)

(assert (=> b!833713 m!778607))

(assert (=> b!833713 m!778607))

(declare-fun m!778609 () Bool)

(assert (=> b!833713 m!778609))

(declare-fun m!778611 () Bool)

(assert (=> b!833708 m!778611))

(declare-fun m!778613 () Bool)

(assert (=> b!833708 m!778613))

(declare-fun m!778615 () Bool)

(assert (=> b!833708 m!778615))

(declare-fun m!778617 () Bool)

(assert (=> b!833708 m!778617))

(declare-fun m!778619 () Bool)

(assert (=> b!833708 m!778619))

(declare-fun m!778621 () Bool)

(assert (=> b!833708 m!778621))

(declare-fun m!778623 () Bool)

(assert (=> b!833708 m!778623))

(declare-fun m!778625 () Bool)

(assert (=> b!833708 m!778625))

(declare-fun m!778627 () Bool)

(assert (=> b!833708 m!778627))

(declare-fun m!778629 () Bool)

(assert (=> b!833708 m!778629))

(assert (=> b!833708 m!778625))

(declare-fun m!778631 () Bool)

(assert (=> b!833708 m!778631))

(assert (=> b!833708 m!778619))

(declare-fun m!778633 () Bool)

(assert (=> mapNonEmpty!24509 m!778633))

(declare-fun m!778635 () Bool)

(assert (=> b!833712 m!778635))

(assert (=> b!833712 m!778635))

(declare-fun m!778637 () Bool)

(assert (=> b!833712 m!778637))

(check-sat tp_is_empty!15231 (not b!833708) b_and!22607 (not b!833711) (not mapNonEmpty!24509) (not b!833706) (not b!833713) (not b!833709) (not b!833712) (not b_next!13521) (not start!71688))
(check-sat b_and!22607 (not b_next!13521))
