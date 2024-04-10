; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20768 () Bool)

(assert start!20768)

(declare-fun b_free!5427 () Bool)

(declare-fun b_next!5427 () Bool)

(assert (=> start!20768 (= b_free!5427 (not b_next!5427))))

(declare-fun tp!19312 () Bool)

(declare-fun b_and!12173 () Bool)

(assert (=> start!20768 (= tp!19312 b_and!12173)))

(declare-fun b!208016 () Bool)

(declare-fun res!101114 () Bool)

(declare-fun e!135716 () Bool)

(assert (=> b!208016 (=> (not res!101114) (not e!135716))))

(declare-datatypes ((array!9771 0))(
  ( (array!9772 (arr!4636 (Array (_ BitVec 32) (_ BitVec 64))) (size!4961 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9771)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!208016 (= res!101114 (= (select (arr!4636 _keys!825) i!601) k0!843))))

(declare-fun b!208018 () Bool)

(declare-fun e!135717 () Bool)

(declare-fun e!135718 () Bool)

(declare-fun mapRes!8993 () Bool)

(assert (=> b!208018 (= e!135717 (and e!135718 mapRes!8993))))

(declare-fun condMapEmpty!8993 () Bool)

(declare-datatypes ((V!6691 0))(
  ( (V!6692 (val!2686 Int)) )
))
(declare-datatypes ((ValueCell!2298 0))(
  ( (ValueCellFull!2298 (v!4656 V!6691)) (EmptyCell!2298) )
))
(declare-datatypes ((array!9773 0))(
  ( (array!9774 (arr!4637 (Array (_ BitVec 32) ValueCell!2298)) (size!4962 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9773)

(declare-fun mapDefault!8993 () ValueCell!2298)

(assert (=> b!208018 (= condMapEmpty!8993 (= (arr!4637 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2298)) mapDefault!8993)))))

(declare-fun b!208019 () Bool)

(declare-fun res!101113 () Bool)

(assert (=> b!208019 (=> (not res!101113) (not e!135716))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9771 (_ BitVec 32)) Bool)

(assert (=> b!208019 (= res!101113 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!208020 () Bool)

(declare-fun e!135715 () Bool)

(declare-fun tp_is_empty!5283 () Bool)

(assert (=> b!208020 (= e!135715 tp_is_empty!5283)))

(declare-fun b!208021 () Bool)

(declare-fun res!101115 () Bool)

(assert (=> b!208021 (=> (not res!101115) (not e!135716))))

(declare-datatypes ((List!2968 0))(
  ( (Nil!2965) (Cons!2964 (h!3606 (_ BitVec 64)) (t!7899 List!2968)) )
))
(declare-fun arrayNoDuplicates!0 (array!9771 (_ BitVec 32) List!2968) Bool)

(assert (=> b!208021 (= res!101115 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2965))))

(declare-fun mapIsEmpty!8993 () Bool)

(assert (=> mapIsEmpty!8993 mapRes!8993))

(declare-fun b!208022 () Bool)

(declare-fun res!101110 () Bool)

(assert (=> b!208022 (=> (not res!101110) (not e!135716))))

(assert (=> b!208022 (= res!101110 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4961 _keys!825))))))

(declare-fun b!208023 () Bool)

(assert (=> b!208023 (= e!135718 tp_is_empty!5283)))

(declare-fun b!208024 () Bool)

(declare-fun res!101116 () Bool)

(assert (=> b!208024 (=> (not res!101116) (not e!135716))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!208024 (= res!101116 (and (= (size!4962 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4961 _keys!825) (size!4962 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208017 () Bool)

(declare-fun res!101111 () Bool)

(assert (=> b!208017 (=> (not res!101111) (not e!135716))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208017 (= res!101111 (validKeyInArray!0 k0!843))))

(declare-fun res!101112 () Bool)

(assert (=> start!20768 (=> (not res!101112) (not e!135716))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20768 (= res!101112 (validMask!0 mask!1149))))

(assert (=> start!20768 e!135716))

(declare-fun array_inv!3073 (array!9773) Bool)

(assert (=> start!20768 (and (array_inv!3073 _values!649) e!135717)))

(assert (=> start!20768 true))

(assert (=> start!20768 tp_is_empty!5283))

(declare-fun array_inv!3074 (array!9771) Bool)

(assert (=> start!20768 (array_inv!3074 _keys!825)))

(assert (=> start!20768 tp!19312))

(declare-fun mapNonEmpty!8993 () Bool)

(declare-fun tp!19313 () Bool)

(assert (=> mapNonEmpty!8993 (= mapRes!8993 (and tp!19313 e!135715))))

(declare-fun mapRest!8993 () (Array (_ BitVec 32) ValueCell!2298))

(declare-fun mapKey!8993 () (_ BitVec 32))

(declare-fun mapValue!8993 () ValueCell!2298)

(assert (=> mapNonEmpty!8993 (= (arr!4637 _values!649) (store mapRest!8993 mapKey!8993 mapValue!8993))))

(declare-fun lt!106689 () Bool)

(declare-datatypes ((tuple2!4076 0))(
  ( (tuple2!4077 (_1!2049 (_ BitVec 64)) (_2!2049 V!6691)) )
))
(declare-datatypes ((List!2969 0))(
  ( (Nil!2966) (Cons!2965 (h!3607 tuple2!4076) (t!7900 List!2969)) )
))
(declare-datatypes ((ListLongMap!2989 0))(
  ( (ListLongMap!2990 (toList!1510 List!2969)) )
))
(declare-fun lt!106690 () ListLongMap!2989)

(declare-fun b!208025 () Bool)

(declare-fun lt!106693 () ListLongMap!2989)

(assert (=> b!208025 (= e!135716 (not (or (and (not lt!106689) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!106689) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!106689) (not (= lt!106693 lt!106690)) (bvsle #b00000000000000000000000000000000 (size!4961 _keys!825)))))))

(assert (=> b!208025 (= lt!106689 (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!106695 () ListLongMap!2989)

(declare-fun zeroValue!615 () V!6691)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6691)

(declare-fun getCurrentListMap!1077 (array!9771 array!9773 (_ BitVec 32) (_ BitVec 32) V!6691 V!6691 (_ BitVec 32) Int) ListLongMap!2989)

(assert (=> b!208025 (= lt!106695 (getCurrentListMap!1077 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106691 () array!9773)

(assert (=> b!208025 (= lt!106693 (getCurrentListMap!1077 _keys!825 lt!106691 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106688 () ListLongMap!2989)

(assert (=> b!208025 (and (= lt!106690 lt!106688) (= lt!106688 lt!106690))))

(declare-fun lt!106694 () ListLongMap!2989)

(declare-fun v!520 () V!6691)

(declare-fun +!537 (ListLongMap!2989 tuple2!4076) ListLongMap!2989)

(assert (=> b!208025 (= lt!106688 (+!537 lt!106694 (tuple2!4077 k0!843 v!520)))))

(declare-datatypes ((Unit!6362 0))(
  ( (Unit!6363) )
))
(declare-fun lt!106692 () Unit!6362)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!190 (array!9771 array!9773 (_ BitVec 32) (_ BitVec 32) V!6691 V!6691 (_ BitVec 32) (_ BitVec 64) V!6691 (_ BitVec 32) Int) Unit!6362)

(assert (=> b!208025 (= lt!106692 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!190 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!451 (array!9771 array!9773 (_ BitVec 32) (_ BitVec 32) V!6691 V!6691 (_ BitVec 32) Int) ListLongMap!2989)

(assert (=> b!208025 (= lt!106690 (getCurrentListMapNoExtraKeys!451 _keys!825 lt!106691 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!208025 (= lt!106691 (array!9774 (store (arr!4637 _values!649) i!601 (ValueCellFull!2298 v!520)) (size!4962 _values!649)))))

(assert (=> b!208025 (= lt!106694 (getCurrentListMapNoExtraKeys!451 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and start!20768 res!101112) b!208024))

(assert (= (and b!208024 res!101116) b!208019))

(assert (= (and b!208019 res!101113) b!208021))

(assert (= (and b!208021 res!101115) b!208022))

(assert (= (and b!208022 res!101110) b!208017))

(assert (= (and b!208017 res!101111) b!208016))

(assert (= (and b!208016 res!101114) b!208025))

(assert (= (and b!208018 condMapEmpty!8993) mapIsEmpty!8993))

(assert (= (and b!208018 (not condMapEmpty!8993)) mapNonEmpty!8993))

(get-info :version)

(assert (= (and mapNonEmpty!8993 ((_ is ValueCellFull!2298) mapValue!8993)) b!208020))

(assert (= (and b!208018 ((_ is ValueCellFull!2298) mapDefault!8993)) b!208023))

(assert (= start!20768 b!208018))

(declare-fun m!235759 () Bool)

(assert (=> b!208021 m!235759))

(declare-fun m!235761 () Bool)

(assert (=> b!208017 m!235761))

(declare-fun m!235763 () Bool)

(assert (=> b!208025 m!235763))

(declare-fun m!235765 () Bool)

(assert (=> b!208025 m!235765))

(declare-fun m!235767 () Bool)

(assert (=> b!208025 m!235767))

(declare-fun m!235769 () Bool)

(assert (=> b!208025 m!235769))

(declare-fun m!235771 () Bool)

(assert (=> b!208025 m!235771))

(declare-fun m!235773 () Bool)

(assert (=> b!208025 m!235773))

(declare-fun m!235775 () Bool)

(assert (=> b!208025 m!235775))

(declare-fun m!235777 () Bool)

(assert (=> b!208019 m!235777))

(declare-fun m!235779 () Bool)

(assert (=> b!208016 m!235779))

(declare-fun m!235781 () Bool)

(assert (=> mapNonEmpty!8993 m!235781))

(declare-fun m!235783 () Bool)

(assert (=> start!20768 m!235783))

(declare-fun m!235785 () Bool)

(assert (=> start!20768 m!235785))

(declare-fun m!235787 () Bool)

(assert (=> start!20768 m!235787))

(check-sat (not mapNonEmpty!8993) (not b_next!5427) tp_is_empty!5283 (not b!208025) (not b!208017) (not b!208021) b_and!12173 (not start!20768) (not b!208019))
(check-sat b_and!12173 (not b_next!5427))
