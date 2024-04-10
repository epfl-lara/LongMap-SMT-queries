; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70516 () Bool)

(assert start!70516)

(declare-fun b_free!12843 () Bool)

(declare-fun b_next!12843 () Bool)

(assert (=> start!70516 (= b_free!12843 (not b_next!12843))))

(declare-fun tp!45261 () Bool)

(declare-fun b_and!21673 () Bool)

(assert (=> start!70516 (= tp!45261 b_and!21673)))

(declare-fun b!819138 () Bool)

(declare-fun e!454846 () Bool)

(declare-fun tp_is_empty!14553 () Bool)

(assert (=> b!819138 (= e!454846 tp_is_empty!14553)))

(declare-fun mapNonEmpty!23428 () Bool)

(declare-fun mapRes!23428 () Bool)

(declare-fun tp!45262 () Bool)

(declare-fun e!454850 () Bool)

(assert (=> mapNonEmpty!23428 (= mapRes!23428 (and tp!45262 e!454850))))

(declare-datatypes ((V!24405 0))(
  ( (V!24406 (val!7324 Int)) )
))
(declare-datatypes ((ValueCell!6861 0))(
  ( (ValueCellFull!6861 (v!9753 V!24405)) (EmptyCell!6861) )
))
(declare-datatypes ((array!45302 0))(
  ( (array!45303 (arr!21705 (Array (_ BitVec 32) ValueCell!6861)) (size!22126 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45302)

(declare-fun mapRest!23428 () (Array (_ BitVec 32) ValueCell!6861))

(declare-fun mapKey!23428 () (_ BitVec 32))

(declare-fun mapValue!23428 () ValueCell!6861)

(assert (=> mapNonEmpty!23428 (= (arr!21705 _values!788) (store mapRest!23428 mapKey!23428 mapValue!23428))))

(declare-fun b!819139 () Bool)

(declare-fun res!558996 () Bool)

(declare-fun e!454849 () Bool)

(assert (=> b!819139 (=> (not res!558996) (not e!454849))))

(declare-datatypes ((array!45304 0))(
  ( (array!45305 (arr!21706 (Array (_ BitVec 32) (_ BitVec 64))) (size!22127 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45304)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45304 (_ BitVec 32)) Bool)

(assert (=> b!819139 (= res!558996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!819140 () Bool)

(declare-fun res!558995 () Bool)

(assert (=> b!819140 (=> (not res!558995) (not e!454849))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!819140 (= res!558995 (and (= (size!22126 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22127 _keys!976) (size!22126 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23428 () Bool)

(assert (=> mapIsEmpty!23428 mapRes!23428))

(declare-fun b!819141 () Bool)

(declare-fun res!558992 () Bool)

(assert (=> b!819141 (=> (not res!558992) (not e!454849))))

(declare-datatypes ((List!15462 0))(
  ( (Nil!15459) (Cons!15458 (h!16587 (_ BitVec 64)) (t!21791 List!15462)) )
))
(declare-fun arrayNoDuplicates!0 (array!45304 (_ BitVec 32) List!15462) Bool)

(assert (=> b!819141 (= res!558992 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15459))))

(declare-fun b!819142 () Bool)

(assert (=> b!819142 (= e!454850 tp_is_empty!14553)))

(declare-fun e!454847 () Bool)

(declare-fun zeroValueAfter!34 () V!24405)

(declare-datatypes ((tuple2!9632 0))(
  ( (tuple2!9633 (_1!4827 (_ BitVec 64)) (_2!4827 V!24405)) )
))
(declare-datatypes ((List!15463 0))(
  ( (Nil!15460) (Cons!15459 (h!16588 tuple2!9632) (t!21792 List!15463)) )
))
(declare-datatypes ((ListLongMap!8455 0))(
  ( (ListLongMap!8456 (toList!4243 List!15463)) )
))
(declare-fun lt!367442 () ListLongMap!8455)

(declare-fun b!819143 () Bool)

(declare-fun lt!367439 () ListLongMap!8455)

(declare-fun +!1840 (ListLongMap!8455 tuple2!9632) ListLongMap!8455)

(assert (=> b!819143 (= e!454847 (= lt!367439 (+!1840 lt!367442 (tuple2!9633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!819144 () Bool)

(declare-fun e!454845 () Bool)

(assert (=> b!819144 (= e!454849 (not e!454845))))

(declare-fun res!558991 () Bool)

(assert (=> b!819144 (=> res!558991 e!454845)))

(assert (=> b!819144 (= res!558991 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!367441 () ListLongMap!8455)

(assert (=> b!819144 (= lt!367441 lt!367442)))

(declare-fun zeroValueBefore!34 () V!24405)

(declare-fun minValue!754 () V!24405)

(declare-datatypes ((Unit!27965 0))(
  ( (Unit!27966) )
))
(declare-fun lt!367438 () Unit!27965)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!387 (array!45304 array!45302 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24405 V!24405 V!24405 V!24405 (_ BitVec 32) Int) Unit!27965)

(assert (=> b!819144 (= lt!367438 (lemmaNoChangeToArrayThenSameMapNoExtras!387 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2277 (array!45304 array!45302 (_ BitVec 32) (_ BitVec 32) V!24405 V!24405 (_ BitVec 32) Int) ListLongMap!8455)

(assert (=> b!819144 (= lt!367442 (getCurrentListMapNoExtraKeys!2277 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819144 (= lt!367441 (getCurrentListMapNoExtraKeys!2277 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819145 () Bool)

(assert (=> b!819145 (= e!454845 true)))

(declare-fun lt!367437 () tuple2!9632)

(declare-fun lt!367440 () tuple2!9632)

(declare-fun lt!367436 () ListLongMap!8455)

(assert (=> b!819145 (= lt!367436 (+!1840 (+!1840 lt!367442 lt!367437) lt!367440))))

(declare-fun lt!367434 () ListLongMap!8455)

(assert (=> b!819145 (= (+!1840 lt!367441 lt!367440) (+!1840 lt!367434 lt!367440))))

(declare-fun lt!367433 () Unit!27965)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!180 (ListLongMap!8455 (_ BitVec 64) V!24405 V!24405) Unit!27965)

(assert (=> b!819145 (= lt!367433 (addSameAsAddTwiceSameKeyDiffValues!180 lt!367441 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!819145 (= lt!367440 (tuple2!9633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!819145 e!454847))

(declare-fun res!558994 () Bool)

(assert (=> b!819145 (=> (not res!558994) (not e!454847))))

(declare-fun lt!367435 () ListLongMap!8455)

(assert (=> b!819145 (= res!558994 (= lt!367435 lt!367434))))

(assert (=> b!819145 (= lt!367434 (+!1840 lt!367441 lt!367437))))

(assert (=> b!819145 (= lt!367437 (tuple2!9633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2446 (array!45304 array!45302 (_ BitVec 32) (_ BitVec 32) V!24405 V!24405 (_ BitVec 32) Int) ListLongMap!8455)

(assert (=> b!819145 (= lt!367439 (getCurrentListMap!2446 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819145 (= lt!367435 (getCurrentListMap!2446 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!558993 () Bool)

(assert (=> start!70516 (=> (not res!558993) (not e!454849))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70516 (= res!558993 (validMask!0 mask!1312))))

(assert (=> start!70516 e!454849))

(assert (=> start!70516 tp_is_empty!14553))

(declare-fun array_inv!17351 (array!45304) Bool)

(assert (=> start!70516 (array_inv!17351 _keys!976)))

(assert (=> start!70516 true))

(declare-fun e!454848 () Bool)

(declare-fun array_inv!17352 (array!45302) Bool)

(assert (=> start!70516 (and (array_inv!17352 _values!788) e!454848)))

(assert (=> start!70516 tp!45261))

(declare-fun b!819146 () Bool)

(assert (=> b!819146 (= e!454848 (and e!454846 mapRes!23428))))

(declare-fun condMapEmpty!23428 () Bool)

(declare-fun mapDefault!23428 () ValueCell!6861)

(assert (=> b!819146 (= condMapEmpty!23428 (= (arr!21705 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6861)) mapDefault!23428)))))

(assert (= (and start!70516 res!558993) b!819140))

(assert (= (and b!819140 res!558995) b!819139))

(assert (= (and b!819139 res!558996) b!819141))

(assert (= (and b!819141 res!558992) b!819144))

(assert (= (and b!819144 (not res!558991)) b!819145))

(assert (= (and b!819145 res!558994) b!819143))

(assert (= (and b!819146 condMapEmpty!23428) mapIsEmpty!23428))

(assert (= (and b!819146 (not condMapEmpty!23428)) mapNonEmpty!23428))

(get-info :version)

(assert (= (and mapNonEmpty!23428 ((_ is ValueCellFull!6861) mapValue!23428)) b!819142))

(assert (= (and b!819146 ((_ is ValueCellFull!6861) mapDefault!23428)) b!819138))

(assert (= start!70516 b!819146))

(declare-fun m!760681 () Bool)

(assert (=> b!819141 m!760681))

(declare-fun m!760683 () Bool)

(assert (=> b!819144 m!760683))

(declare-fun m!760685 () Bool)

(assert (=> b!819144 m!760685))

(declare-fun m!760687 () Bool)

(assert (=> b!819144 m!760687))

(declare-fun m!760689 () Bool)

(assert (=> mapNonEmpty!23428 m!760689))

(declare-fun m!760691 () Bool)

(assert (=> b!819145 m!760691))

(declare-fun m!760693 () Bool)

(assert (=> b!819145 m!760693))

(declare-fun m!760695 () Bool)

(assert (=> b!819145 m!760695))

(declare-fun m!760697 () Bool)

(assert (=> b!819145 m!760697))

(declare-fun m!760699 () Bool)

(assert (=> b!819145 m!760699))

(declare-fun m!760701 () Bool)

(assert (=> b!819145 m!760701))

(declare-fun m!760703 () Bool)

(assert (=> b!819145 m!760703))

(declare-fun m!760705 () Bool)

(assert (=> b!819145 m!760705))

(assert (=> b!819145 m!760699))

(declare-fun m!760707 () Bool)

(assert (=> b!819143 m!760707))

(declare-fun m!760709 () Bool)

(assert (=> start!70516 m!760709))

(declare-fun m!760711 () Bool)

(assert (=> start!70516 m!760711))

(declare-fun m!760713 () Bool)

(assert (=> start!70516 m!760713))

(declare-fun m!760715 () Bool)

(assert (=> b!819139 m!760715))

(check-sat b_and!21673 (not b!819144) (not mapNonEmpty!23428) tp_is_empty!14553 (not b!819143) (not start!70516) (not b!819141) (not b_next!12843) (not b!819145) (not b!819139))
(check-sat b_and!21673 (not b_next!12843))
