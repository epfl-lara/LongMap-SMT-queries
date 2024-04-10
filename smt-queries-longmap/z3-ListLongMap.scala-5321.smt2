; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71168 () Bool)

(assert start!71168)

(declare-fun b_free!13335 () Bool)

(declare-fun b_next!13335 () Bool)

(assert (=> start!71168 (= b_free!13335 (not b_next!13335))))

(declare-fun tp!46764 () Bool)

(declare-fun b_and!22261 () Bool)

(assert (=> start!71168 (= tp!46764 b_and!22261)))

(declare-fun mapIsEmpty!24193 () Bool)

(declare-fun mapRes!24193 () Bool)

(assert (=> mapIsEmpty!24193 mapRes!24193))

(declare-fun b!826694 () Bool)

(declare-fun res!563539 () Bool)

(declare-fun e!460406 () Bool)

(assert (=> b!826694 (=> (not res!563539) (not e!460406))))

(declare-datatypes ((array!46268 0))(
  ( (array!46269 (arr!22179 (Array (_ BitVec 32) (_ BitVec 64))) (size!22600 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46268)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46268 (_ BitVec 32)) Bool)

(assert (=> b!826694 (= res!563539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!826695 () Bool)

(declare-fun res!563535 () Bool)

(assert (=> b!826695 (=> (not res!563535) (not e!460406))))

(declare-datatypes ((V!25061 0))(
  ( (V!25062 (val!7570 Int)) )
))
(declare-datatypes ((ValueCell!7107 0))(
  ( (ValueCellFull!7107 (v!10004 V!25061)) (EmptyCell!7107) )
))
(declare-datatypes ((array!46270 0))(
  ( (array!46271 (arr!22180 (Array (_ BitVec 32) ValueCell!7107)) (size!22601 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46270)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!826695 (= res!563535 (and (= (size!22601 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22600 _keys!976) (size!22601 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!826696 () Bool)

(declare-fun e!460404 () Bool)

(declare-fun e!460411 () Bool)

(assert (=> b!826696 (= e!460404 (and e!460411 mapRes!24193))))

(declare-fun condMapEmpty!24193 () Bool)

(declare-fun mapDefault!24193 () ValueCell!7107)

(assert (=> b!826696 (= condMapEmpty!24193 (= (arr!22180 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7107)) mapDefault!24193)))))

(declare-fun b!826697 () Bool)

(declare-fun res!563537 () Bool)

(assert (=> b!826697 (=> (not res!563537) (not e!460406))))

(declare-datatypes ((List!15829 0))(
  ( (Nil!15826) (Cons!15825 (h!16954 (_ BitVec 64)) (t!22176 List!15829)) )
))
(declare-fun arrayNoDuplicates!0 (array!46268 (_ BitVec 32) List!15829) Bool)

(assert (=> b!826697 (= res!563537 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15826))))

(declare-fun res!563540 () Bool)

(assert (=> start!71168 (=> (not res!563540) (not e!460406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71168 (= res!563540 (validMask!0 mask!1312))))

(assert (=> start!71168 e!460406))

(declare-fun tp_is_empty!15045 () Bool)

(assert (=> start!71168 tp_is_empty!15045))

(declare-fun array_inv!17679 (array!46268) Bool)

(assert (=> start!71168 (array_inv!17679 _keys!976)))

(assert (=> start!71168 true))

(declare-fun array_inv!17680 (array!46270) Bool)

(assert (=> start!71168 (and (array_inv!17680 _values!788) e!460404)))

(assert (=> start!71168 tp!46764))

(declare-fun b!826698 () Bool)

(declare-fun e!460410 () Bool)

(assert (=> b!826698 (= e!460410 tp_is_empty!15045)))

(declare-datatypes ((tuple2!10032 0))(
  ( (tuple2!10033 (_1!5027 (_ BitVec 64)) (_2!5027 V!25061)) )
))
(declare-fun lt!374321 () tuple2!10032)

(declare-fun lt!374320 () tuple2!10032)

(declare-fun e!460405 () Bool)

(declare-datatypes ((List!15830 0))(
  ( (Nil!15827) (Cons!15826 (h!16955 tuple2!10032) (t!22177 List!15830)) )
))
(declare-datatypes ((ListLongMap!8855 0))(
  ( (ListLongMap!8856 (toList!4443 List!15830)) )
))
(declare-fun lt!374322 () ListLongMap!8855)

(declare-fun b!826699 () Bool)

(declare-fun lt!374326 () ListLongMap!8855)

(declare-fun +!1950 (ListLongMap!8855 tuple2!10032) ListLongMap!8855)

(assert (=> b!826699 (= e!460405 (= lt!374322 (+!1950 (+!1950 lt!374326 lt!374321) lt!374320)))))

(declare-fun b!826700 () Bool)

(declare-fun e!460409 () Bool)

(assert (=> b!826700 (= e!460406 (not e!460409))))

(declare-fun res!563541 () Bool)

(assert (=> b!826700 (=> res!563541 e!460409)))

(assert (=> b!826700 (= res!563541 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!374324 () ListLongMap!8855)

(assert (=> b!826700 (= lt!374324 lt!374326)))

(declare-fun zeroValueBefore!34 () V!25061)

(declare-fun zeroValueAfter!34 () V!25061)

(declare-fun minValue!754 () V!25061)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28347 0))(
  ( (Unit!28348) )
))
(declare-fun lt!374319 () Unit!28347)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!558 (array!46268 array!46270 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25061 V!25061 V!25061 V!25061 (_ BitVec 32) Int) Unit!28347)

(assert (=> b!826700 (= lt!374319 (lemmaNoChangeToArrayThenSameMapNoExtras!558 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2448 (array!46268 array!46270 (_ BitVec 32) (_ BitVec 32) V!25061 V!25061 (_ BitVec 32) Int) ListLongMap!8855)

(assert (=> b!826700 (= lt!374326 (getCurrentListMapNoExtraKeys!2448 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826700 (= lt!374324 (getCurrentListMapNoExtraKeys!2448 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826701 () Bool)

(assert (=> b!826701 (= e!460411 tp_is_empty!15045)))

(declare-fun b!826702 () Bool)

(declare-fun e!460407 () Bool)

(assert (=> b!826702 (= e!460407 (= lt!374322 (+!1950 (+!1950 lt!374326 (tuple2!10033 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!374321)))))

(declare-fun mapNonEmpty!24193 () Bool)

(declare-fun tp!46765 () Bool)

(assert (=> mapNonEmpty!24193 (= mapRes!24193 (and tp!46765 e!460410))))

(declare-fun mapRest!24193 () (Array (_ BitVec 32) ValueCell!7107))

(declare-fun mapValue!24193 () ValueCell!7107)

(declare-fun mapKey!24193 () (_ BitVec 32))

(assert (=> mapNonEmpty!24193 (= (arr!22180 _values!788) (store mapRest!24193 mapKey!24193 mapValue!24193))))

(declare-fun b!826703 () Bool)

(assert (=> b!826703 (= e!460409 true)))

(declare-fun lt!374332 () ListLongMap!8855)

(assert (=> b!826703 (= lt!374332 (+!1950 (+!1950 lt!374324 lt!374320) lt!374321))))

(declare-fun lt!374328 () ListLongMap!8855)

(declare-fun lt!374323 () ListLongMap!8855)

(assert (=> b!826703 (and (= lt!374328 lt!374323) (= lt!374322 lt!374323) (= lt!374322 lt!374328))))

(declare-fun lt!374325 () ListLongMap!8855)

(assert (=> b!826703 (= lt!374323 (+!1950 lt!374325 lt!374320))))

(declare-fun lt!374329 () ListLongMap!8855)

(assert (=> b!826703 (= lt!374328 (+!1950 lt!374329 lt!374320))))

(declare-fun lt!374330 () Unit!28347)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!232 (ListLongMap!8855 (_ BitVec 64) V!25061 V!25061) Unit!28347)

(assert (=> b!826703 (= lt!374330 (addSameAsAddTwiceSameKeyDiffValues!232 lt!374329 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!826703 e!460405))

(declare-fun res!563536 () Bool)

(assert (=> b!826703 (=> (not res!563536) (not e!460405))))

(declare-fun lt!374331 () ListLongMap!8855)

(assert (=> b!826703 (= res!563536 (= lt!374331 lt!374325))))

(declare-fun lt!374327 () tuple2!10032)

(assert (=> b!826703 (= lt!374325 (+!1950 lt!374329 lt!374327))))

(assert (=> b!826703 (= lt!374329 (+!1950 lt!374324 lt!374321))))

(assert (=> b!826703 (= lt!374320 (tuple2!10033 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!826703 e!460407))

(declare-fun res!563538 () Bool)

(assert (=> b!826703 (=> (not res!563538) (not e!460407))))

(assert (=> b!826703 (= res!563538 (= lt!374331 (+!1950 (+!1950 lt!374324 lt!374327) lt!374321)))))

(assert (=> b!826703 (= lt!374321 (tuple2!10033 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!826703 (= lt!374327 (tuple2!10033 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2572 (array!46268 array!46270 (_ BitVec 32) (_ BitVec 32) V!25061 V!25061 (_ BitVec 32) Int) ListLongMap!8855)

(assert (=> b!826703 (= lt!374322 (getCurrentListMap!2572 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826703 (= lt!374331 (getCurrentListMap!2572 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!71168 res!563540) b!826695))

(assert (= (and b!826695 res!563535) b!826694))

(assert (= (and b!826694 res!563539) b!826697))

(assert (= (and b!826697 res!563537) b!826700))

(assert (= (and b!826700 (not res!563541)) b!826703))

(assert (= (and b!826703 res!563538) b!826702))

(assert (= (and b!826703 res!563536) b!826699))

(assert (= (and b!826696 condMapEmpty!24193) mapIsEmpty!24193))

(assert (= (and b!826696 (not condMapEmpty!24193)) mapNonEmpty!24193))

(get-info :version)

(assert (= (and mapNonEmpty!24193 ((_ is ValueCellFull!7107) mapValue!24193)) b!826698))

(assert (= (and b!826696 ((_ is ValueCellFull!7107) mapDefault!24193)) b!826701))

(assert (= start!71168 b!826696))

(declare-fun m!769587 () Bool)

(assert (=> b!826702 m!769587))

(assert (=> b!826702 m!769587))

(declare-fun m!769589 () Bool)

(assert (=> b!826702 m!769589))

(declare-fun m!769591 () Bool)

(assert (=> start!71168 m!769591))

(declare-fun m!769593 () Bool)

(assert (=> start!71168 m!769593))

(declare-fun m!769595 () Bool)

(assert (=> start!71168 m!769595))

(declare-fun m!769597 () Bool)

(assert (=> b!826700 m!769597))

(declare-fun m!769599 () Bool)

(assert (=> b!826700 m!769599))

(declare-fun m!769601 () Bool)

(assert (=> b!826700 m!769601))

(declare-fun m!769603 () Bool)

(assert (=> b!826699 m!769603))

(assert (=> b!826699 m!769603))

(declare-fun m!769605 () Bool)

(assert (=> b!826699 m!769605))

(declare-fun m!769607 () Bool)

(assert (=> mapNonEmpty!24193 m!769607))

(declare-fun m!769609 () Bool)

(assert (=> b!826694 m!769609))

(declare-fun m!769611 () Bool)

(assert (=> b!826697 m!769611))

(declare-fun m!769613 () Bool)

(assert (=> b!826703 m!769613))

(declare-fun m!769615 () Bool)

(assert (=> b!826703 m!769615))

(declare-fun m!769617 () Bool)

(assert (=> b!826703 m!769617))

(declare-fun m!769619 () Bool)

(assert (=> b!826703 m!769619))

(declare-fun m!769621 () Bool)

(assert (=> b!826703 m!769621))

(declare-fun m!769623 () Bool)

(assert (=> b!826703 m!769623))

(declare-fun m!769625 () Bool)

(assert (=> b!826703 m!769625))

(assert (=> b!826703 m!769625))

(declare-fun m!769627 () Bool)

(assert (=> b!826703 m!769627))

(declare-fun m!769629 () Bool)

(assert (=> b!826703 m!769629))

(declare-fun m!769631 () Bool)

(assert (=> b!826703 m!769631))

(declare-fun m!769633 () Bool)

(assert (=> b!826703 m!769633))

(assert (=> b!826703 m!769631))

(check-sat (not b!826702) tp_is_empty!15045 (not b!826694) (not b_next!13335) (not mapNonEmpty!24193) (not b!826703) (not b!826700) b_and!22261 (not b!826697) (not start!71168) (not b!826699))
(check-sat b_and!22261 (not b_next!13335))
