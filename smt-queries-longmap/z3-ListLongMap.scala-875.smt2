; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20348 () Bool)

(assert start!20348)

(declare-fun b_free!5007 () Bool)

(declare-fun b_next!5007 () Bool)

(assert (=> start!20348 (= b_free!5007 (not b_next!5007))))

(declare-fun tp!18053 () Bool)

(declare-fun b_and!11753 () Bool)

(assert (=> start!20348 (= tp!18053 b_and!11753)))

(declare-fun mapNonEmpty!8363 () Bool)

(declare-fun mapRes!8363 () Bool)

(declare-fun tp!18052 () Bool)

(declare-fun e!131623 () Bool)

(assert (=> mapNonEmpty!8363 (= mapRes!8363 (and tp!18052 e!131623))))

(declare-fun mapKey!8363 () (_ BitVec 32))

(declare-datatypes ((V!6131 0))(
  ( (V!6132 (val!2476 Int)) )
))
(declare-datatypes ((ValueCell!2088 0))(
  ( (ValueCellFull!2088 (v!4446 V!6131)) (EmptyCell!2088) )
))
(declare-fun mapValue!8363 () ValueCell!2088)

(declare-datatypes ((array!8957 0))(
  ( (array!8958 (arr!4229 (Array (_ BitVec 32) ValueCell!2088)) (size!4554 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8957)

(declare-fun mapRest!8363 () (Array (_ BitVec 32) ValueCell!2088))

(assert (=> mapNonEmpty!8363 (= (arr!4229 _values!649) (store mapRest!8363 mapKey!8363 mapValue!8363))))

(declare-fun b!200754 () Bool)

(declare-fun res!95745 () Bool)

(declare-fun e!131621 () Bool)

(assert (=> b!200754 (=> (not res!95745) (not e!131621))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!200754 (= res!95745 (validKeyInArray!0 k0!843))))

(declare-fun b!200755 () Bool)

(declare-fun res!95741 () Bool)

(assert (=> b!200755 (=> (not res!95741) (not e!131621))))

(declare-datatypes ((array!8959 0))(
  ( (array!8960 (arr!4230 (Array (_ BitVec 32) (_ BitVec 64))) (size!4555 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8959)

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!200755 (= res!95741 (= (select (arr!4230 _keys!825) i!601) k0!843))))

(declare-fun b!200756 () Bool)

(declare-fun res!95740 () Bool)

(assert (=> b!200756 (=> (not res!95740) (not e!131621))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8959 (_ BitVec 32)) Bool)

(assert (=> b!200756 (= res!95740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!8363 () Bool)

(assert (=> mapIsEmpty!8363 mapRes!8363))

(declare-fun b!200757 () Bool)

(declare-fun e!131622 () Bool)

(declare-fun e!131624 () Bool)

(assert (=> b!200757 (= e!131622 e!131624)))

(declare-fun res!95746 () Bool)

(assert (=> b!200757 (=> res!95746 e!131624)))

(assert (=> b!200757 (= res!95746 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3744 0))(
  ( (tuple2!3745 (_1!1883 (_ BitVec 64)) (_2!1883 V!6131)) )
))
(declare-datatypes ((List!2660 0))(
  ( (Nil!2657) (Cons!2656 (h!3298 tuple2!3744) (t!7591 List!2660)) )
))
(declare-datatypes ((ListLongMap!2657 0))(
  ( (ListLongMap!2658 (toList!1344 List!2660)) )
))
(declare-fun lt!99464 () ListLongMap!2657)

(declare-fun lt!99465 () ListLongMap!2657)

(assert (=> b!200757 (= lt!99464 lt!99465)))

(declare-fun lt!99462 () ListLongMap!2657)

(declare-fun lt!99461 () tuple2!3744)

(declare-fun +!371 (ListLongMap!2657 tuple2!3744) ListLongMap!2657)

(assert (=> b!200757 (= lt!99465 (+!371 lt!99462 lt!99461))))

(declare-fun lt!99459 () ListLongMap!2657)

(declare-fun v!520 () V!6131)

(declare-fun zeroValue!615 () V!6131)

(declare-datatypes ((Unit!6042 0))(
  ( (Unit!6043) )
))
(declare-fun lt!99456 () Unit!6042)

(declare-fun addCommutativeForDiffKeys!92 (ListLongMap!2657 (_ BitVec 64) V!6131 (_ BitVec 64) V!6131) Unit!6042)

(assert (=> b!200757 (= lt!99456 (addCommutativeForDiffKeys!92 lt!99459 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!99471 () ListLongMap!2657)

(declare-fun lt!99470 () tuple2!3744)

(assert (=> b!200757 (= lt!99471 (+!371 lt!99464 lt!99470))))

(declare-fun lt!99468 () ListLongMap!2657)

(declare-fun lt!99467 () tuple2!3744)

(assert (=> b!200757 (= lt!99464 (+!371 lt!99468 lt!99467))))

(declare-fun lt!99469 () ListLongMap!2657)

(declare-fun lt!99460 () ListLongMap!2657)

(assert (=> b!200757 (= lt!99469 lt!99460)))

(assert (=> b!200757 (= lt!99460 (+!371 lt!99462 lt!99470))))

(assert (=> b!200757 (= lt!99462 (+!371 lt!99459 lt!99467))))

(declare-fun lt!99458 () ListLongMap!2657)

(assert (=> b!200757 (= lt!99471 (+!371 (+!371 lt!99458 lt!99467) lt!99470))))

(declare-fun minValue!615 () V!6131)

(assert (=> b!200757 (= lt!99470 (tuple2!3745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!200757 (= lt!99467 (tuple2!3745 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!200759 () Bool)

(declare-fun tp_is_empty!4863 () Bool)

(assert (=> b!200759 (= e!131623 tp_is_empty!4863)))

(declare-fun b!200760 () Bool)

(assert (=> b!200760 (= e!131621 (not e!131622))))

(declare-fun res!95743 () Bool)

(assert (=> b!200760 (=> res!95743 e!131622)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!200760 (= res!95743 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!933 (array!8959 array!8957 (_ BitVec 32) (_ BitVec 32) V!6131 V!6131 (_ BitVec 32) Int) ListLongMap!2657)

(assert (=> b!200760 (= lt!99469 (getCurrentListMap!933 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99463 () array!8957)

(assert (=> b!200760 (= lt!99471 (getCurrentListMap!933 _keys!825 lt!99463 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200760 (and (= lt!99458 lt!99468) (= lt!99468 lt!99458))))

(assert (=> b!200760 (= lt!99468 (+!371 lt!99459 lt!99461))))

(assert (=> b!200760 (= lt!99461 (tuple2!3745 k0!843 v!520))))

(declare-fun lt!99457 () Unit!6042)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!46 (array!8959 array!8957 (_ BitVec 32) (_ BitVec 32) V!6131 V!6131 (_ BitVec 32) (_ BitVec 64) V!6131 (_ BitVec 32) Int) Unit!6042)

(assert (=> b!200760 (= lt!99457 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!46 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!307 (array!8959 array!8957 (_ BitVec 32) (_ BitVec 32) V!6131 V!6131 (_ BitVec 32) Int) ListLongMap!2657)

(assert (=> b!200760 (= lt!99458 (getCurrentListMapNoExtraKeys!307 _keys!825 lt!99463 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200760 (= lt!99463 (array!8958 (store (arr!4229 _values!649) i!601 (ValueCellFull!2088 v!520)) (size!4554 _values!649)))))

(assert (=> b!200760 (= lt!99459 (getCurrentListMapNoExtraKeys!307 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!200761 () Bool)

(declare-fun res!95739 () Bool)

(assert (=> b!200761 (=> (not res!95739) (not e!131621))))

(assert (=> b!200761 (= res!95739 (and (= (size!4554 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4555 _keys!825) (size!4554 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!200762 () Bool)

(declare-fun res!95744 () Bool)

(assert (=> b!200762 (=> (not res!95744) (not e!131621))))

(assert (=> b!200762 (= res!95744 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4555 _keys!825))))))

(declare-fun b!200763 () Bool)

(declare-fun e!131626 () Bool)

(assert (=> b!200763 (= e!131626 tp_is_empty!4863)))

(declare-fun res!95738 () Bool)

(assert (=> start!20348 (=> (not res!95738) (not e!131621))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20348 (= res!95738 (validMask!0 mask!1149))))

(assert (=> start!20348 e!131621))

(declare-fun e!131627 () Bool)

(declare-fun array_inv!2781 (array!8957) Bool)

(assert (=> start!20348 (and (array_inv!2781 _values!649) e!131627)))

(assert (=> start!20348 true))

(assert (=> start!20348 tp_is_empty!4863))

(declare-fun array_inv!2782 (array!8959) Bool)

(assert (=> start!20348 (array_inv!2782 _keys!825)))

(assert (=> start!20348 tp!18053))

(declare-fun b!200758 () Bool)

(assert (=> b!200758 (= e!131624 true)))

(assert (=> b!200758 (= (+!371 lt!99465 lt!99470) (+!371 lt!99460 lt!99461))))

(declare-fun lt!99466 () Unit!6042)

(assert (=> b!200758 (= lt!99466 (addCommutativeForDiffKeys!92 lt!99462 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!200764 () Bool)

(declare-fun res!95742 () Bool)

(assert (=> b!200764 (=> (not res!95742) (not e!131621))))

(declare-datatypes ((List!2661 0))(
  ( (Nil!2658) (Cons!2657 (h!3299 (_ BitVec 64)) (t!7592 List!2661)) )
))
(declare-fun arrayNoDuplicates!0 (array!8959 (_ BitVec 32) List!2661) Bool)

(assert (=> b!200764 (= res!95742 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2658))))

(declare-fun b!200765 () Bool)

(assert (=> b!200765 (= e!131627 (and e!131626 mapRes!8363))))

(declare-fun condMapEmpty!8363 () Bool)

(declare-fun mapDefault!8363 () ValueCell!2088)

(assert (=> b!200765 (= condMapEmpty!8363 (= (arr!4229 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2088)) mapDefault!8363)))))

(assert (= (and start!20348 res!95738) b!200761))

(assert (= (and b!200761 res!95739) b!200756))

(assert (= (and b!200756 res!95740) b!200764))

(assert (= (and b!200764 res!95742) b!200762))

(assert (= (and b!200762 res!95744) b!200754))

(assert (= (and b!200754 res!95745) b!200755))

(assert (= (and b!200755 res!95741) b!200760))

(assert (= (and b!200760 (not res!95743)) b!200757))

(assert (= (and b!200757 (not res!95746)) b!200758))

(assert (= (and b!200765 condMapEmpty!8363) mapIsEmpty!8363))

(assert (= (and b!200765 (not condMapEmpty!8363)) mapNonEmpty!8363))

(get-info :version)

(assert (= (and mapNonEmpty!8363 ((_ is ValueCellFull!2088) mapValue!8363)) b!200759))

(assert (= (and b!200765 ((_ is ValueCellFull!2088) mapDefault!8363)) b!200763))

(assert (= start!20348 b!200765))

(declare-fun m!227375 () Bool)

(assert (=> b!200758 m!227375))

(declare-fun m!227377 () Bool)

(assert (=> b!200758 m!227377))

(declare-fun m!227379 () Bool)

(assert (=> b!200758 m!227379))

(declare-fun m!227381 () Bool)

(assert (=> start!20348 m!227381))

(declare-fun m!227383 () Bool)

(assert (=> start!20348 m!227383))

(declare-fun m!227385 () Bool)

(assert (=> start!20348 m!227385))

(declare-fun m!227387 () Bool)

(assert (=> mapNonEmpty!8363 m!227387))

(declare-fun m!227389 () Bool)

(assert (=> b!200757 m!227389))

(declare-fun m!227391 () Bool)

(assert (=> b!200757 m!227391))

(declare-fun m!227393 () Bool)

(assert (=> b!200757 m!227393))

(declare-fun m!227395 () Bool)

(assert (=> b!200757 m!227395))

(declare-fun m!227397 () Bool)

(assert (=> b!200757 m!227397))

(declare-fun m!227399 () Bool)

(assert (=> b!200757 m!227399))

(declare-fun m!227401 () Bool)

(assert (=> b!200757 m!227401))

(assert (=> b!200757 m!227393))

(declare-fun m!227403 () Bool)

(assert (=> b!200757 m!227403))

(declare-fun m!227405 () Bool)

(assert (=> b!200754 m!227405))

(declare-fun m!227407 () Bool)

(assert (=> b!200756 m!227407))

(declare-fun m!227409 () Bool)

(assert (=> b!200760 m!227409))

(declare-fun m!227411 () Bool)

(assert (=> b!200760 m!227411))

(declare-fun m!227413 () Bool)

(assert (=> b!200760 m!227413))

(declare-fun m!227415 () Bool)

(assert (=> b!200760 m!227415))

(declare-fun m!227417 () Bool)

(assert (=> b!200760 m!227417))

(declare-fun m!227419 () Bool)

(assert (=> b!200760 m!227419))

(declare-fun m!227421 () Bool)

(assert (=> b!200760 m!227421))

(declare-fun m!227423 () Bool)

(assert (=> b!200755 m!227423))

(declare-fun m!227425 () Bool)

(assert (=> b!200764 m!227425))

(check-sat tp_is_empty!4863 (not b_next!5007) (not b!200756) (not b!200764) (not b!200758) (not b!200760) (not mapNonEmpty!8363) (not start!20348) (not b!200757) (not b!200754) b_and!11753)
(check-sat b_and!11753 (not b_next!5007))
