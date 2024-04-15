; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35598 () Bool)

(assert start!35598)

(declare-fun b_free!7867 () Bool)

(declare-fun b_next!7867 () Bool)

(assert (=> start!35598 (= b_free!7867 (not b_next!7867))))

(declare-fun tp!27584 () Bool)

(declare-fun b_and!15083 () Bool)

(assert (=> start!35598 (= tp!27584 b_and!15083)))

(declare-fun res!198271 () Bool)

(declare-fun e!218613 () Bool)

(assert (=> start!35598 (=> (not res!198271) (not e!218613))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35598 (= res!198271 (validMask!0 mask!1842))))

(assert (=> start!35598 e!218613))

(declare-fun tp_is_empty!8065 () Bool)

(assert (=> start!35598 tp_is_empty!8065))

(assert (=> start!35598 true))

(assert (=> start!35598 tp!27584))

(declare-datatypes ((array!19685 0))(
  ( (array!19686 (arr!9336 (Array (_ BitVec 32) (_ BitVec 64))) (size!9689 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19685)

(declare-fun array_inv!6894 (array!19685) Bool)

(assert (=> start!35598 (array_inv!6894 _keys!1456)))

(declare-datatypes ((V!11731 0))(
  ( (V!11732 (val!4077 Int)) )
))
(declare-datatypes ((ValueCell!3689 0))(
  ( (ValueCellFull!3689 (v!6265 V!11731)) (EmptyCell!3689) )
))
(declare-datatypes ((array!19687 0))(
  ( (array!19688 (arr!9337 (Array (_ BitVec 32) ValueCell!3689)) (size!9690 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19687)

(declare-fun e!218608 () Bool)

(declare-fun array_inv!6895 (array!19687) Bool)

(assert (=> start!35598 (and (array_inv!6895 _values!1208) e!218608)))

(declare-fun b!357012 () Bool)

(declare-fun res!198272 () Bool)

(assert (=> b!357012 (=> (not res!198272) (not e!218613))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19685 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357012 (= res!198272 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!357013 () Bool)

(declare-fun res!198277 () Bool)

(assert (=> b!357013 (=> (not res!198277) (not e!218613))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19685 (_ BitVec 32)) Bool)

(assert (=> b!357013 (= res!198277 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!357014 () Bool)

(declare-fun res!198274 () Bool)

(assert (=> b!357014 (=> (not res!198274) (not e!218613))))

(assert (=> b!357014 (= res!198274 (not (= (select (arr!9336 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!357015 () Bool)

(declare-fun e!218610 () Bool)

(declare-fun mapRes!13605 () Bool)

(assert (=> b!357015 (= e!218608 (and e!218610 mapRes!13605))))

(declare-fun condMapEmpty!13605 () Bool)

(declare-fun mapDefault!13605 () ValueCell!3689)

(assert (=> b!357015 (= condMapEmpty!13605 (= (arr!9337 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3689)) mapDefault!13605)))))

(declare-fun b!357016 () Bool)

(declare-fun e!218609 () Bool)

(assert (=> b!357016 (= e!218613 (not e!218609))))

(declare-fun res!198275 () Bool)

(assert (=> b!357016 (=> res!198275 e!218609)))

(assert (=> b!357016 (= res!198275 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9689 _keys!1456))))))

(assert (=> b!357016 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!11731)

(declare-datatypes ((Unit!10992 0))(
  ( (Unit!10993) )
))
(declare-fun lt!165780 () Unit!10992)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11731)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!23 (array!19685 array!19687 (_ BitVec 32) (_ BitVec 32) V!11731 V!11731 (_ BitVec 64) (_ BitVec 32)) Unit!10992)

(assert (=> b!357016 (= lt!165780 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!23 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!357017 () Bool)

(assert (=> b!357017 (= e!218609 true)))

(declare-fun defaultEntry!1216 () Int)

(declare-datatypes ((tuple2!5668 0))(
  ( (tuple2!5669 (_1!2845 (_ BitVec 64)) (_2!2845 V!11731)) )
))
(declare-datatypes ((List!5353 0))(
  ( (Nil!5350) (Cons!5349 (h!6205 tuple2!5668) (t!10494 List!5353)) )
))
(declare-datatypes ((ListLongMap!4571 0))(
  ( (ListLongMap!4572 (toList!2301 List!5353)) )
))
(declare-fun contains!2391 (ListLongMap!4571 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1806 (array!19685 array!19687 (_ BitVec 32) (_ BitVec 32) V!11731 V!11731 (_ BitVec 32) Int) ListLongMap!4571)

(assert (=> b!357017 (contains!2391 (getCurrentListMap!1806 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) k0!1077)))

(declare-fun lt!165781 () Unit!10992)

(declare-fun lemmaArrayContainsKeyThenInListMap!339 (array!19685 array!19687 (_ BitVec 32) (_ BitVec 32) V!11731 V!11731 (_ BitVec 64) (_ BitVec 32) Int) Unit!10992)

(assert (=> b!357017 (= lt!165781 (lemmaArrayContainsKeyThenInListMap!339 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805) defaultEntry!1216))))

(declare-fun b!357018 () Bool)

(declare-fun res!198273 () Bool)

(assert (=> b!357018 (=> (not res!198273) (not e!218613))))

(assert (=> b!357018 (= res!198273 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9689 _keys!1456))))))

(declare-fun mapNonEmpty!13605 () Bool)

(declare-fun tp!27585 () Bool)

(declare-fun e!218611 () Bool)

(assert (=> mapNonEmpty!13605 (= mapRes!13605 (and tp!27585 e!218611))))

(declare-fun mapRest!13605 () (Array (_ BitVec 32) ValueCell!3689))

(declare-fun mapKey!13605 () (_ BitVec 32))

(declare-fun mapValue!13605 () ValueCell!3689)

(assert (=> mapNonEmpty!13605 (= (arr!9337 _values!1208) (store mapRest!13605 mapKey!13605 mapValue!13605))))

(declare-fun b!357019 () Bool)

(declare-fun res!198270 () Bool)

(assert (=> b!357019 (=> (not res!198270) (not e!218613))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357019 (= res!198270 (validKeyInArray!0 k0!1077))))

(declare-fun b!357020 () Bool)

(assert (=> b!357020 (= e!218610 tp_is_empty!8065)))

(declare-fun mapIsEmpty!13605 () Bool)

(assert (=> mapIsEmpty!13605 mapRes!13605))

(declare-fun b!357021 () Bool)

(declare-fun res!198269 () Bool)

(assert (=> b!357021 (=> (not res!198269) (not e!218613))))

(assert (=> b!357021 (= res!198269 (and (= (size!9690 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9689 _keys!1456) (size!9690 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!357022 () Bool)

(declare-fun res!198276 () Bool)

(assert (=> b!357022 (=> (not res!198276) (not e!218613))))

(declare-datatypes ((List!5354 0))(
  ( (Nil!5351) (Cons!5350 (h!6206 (_ BitVec 64)) (t!10495 List!5354)) )
))
(declare-fun arrayNoDuplicates!0 (array!19685 (_ BitVec 32) List!5354) Bool)

(assert (=> b!357022 (= res!198276 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5351))))

(declare-fun b!357023 () Bool)

(assert (=> b!357023 (= e!218611 tp_is_empty!8065)))

(assert (= (and start!35598 res!198271) b!357021))

(assert (= (and b!357021 res!198269) b!357013))

(assert (= (and b!357013 res!198277) b!357022))

(assert (= (and b!357022 res!198276) b!357019))

(assert (= (and b!357019 res!198270) b!357018))

(assert (= (and b!357018 res!198273) b!357012))

(assert (= (and b!357012 res!198272) b!357014))

(assert (= (and b!357014 res!198274) b!357016))

(assert (= (and b!357016 (not res!198275)) b!357017))

(assert (= (and b!357015 condMapEmpty!13605) mapIsEmpty!13605))

(assert (= (and b!357015 (not condMapEmpty!13605)) mapNonEmpty!13605))

(get-info :version)

(assert (= (and mapNonEmpty!13605 ((_ is ValueCellFull!3689) mapValue!13605)) b!357023))

(assert (= (and b!357015 ((_ is ValueCellFull!3689) mapDefault!13605)) b!357020))

(assert (= start!35598 b!357015))

(declare-fun m!354669 () Bool)

(assert (=> b!357014 m!354669))

(declare-fun m!354671 () Bool)

(assert (=> mapNonEmpty!13605 m!354671))

(declare-fun m!354673 () Bool)

(assert (=> start!35598 m!354673))

(declare-fun m!354675 () Bool)

(assert (=> start!35598 m!354675))

(declare-fun m!354677 () Bool)

(assert (=> start!35598 m!354677))

(declare-fun m!354679 () Bool)

(assert (=> b!357016 m!354679))

(declare-fun m!354681 () Bool)

(assert (=> b!357016 m!354681))

(declare-fun m!354683 () Bool)

(assert (=> b!357017 m!354683))

(assert (=> b!357017 m!354683))

(declare-fun m!354685 () Bool)

(assert (=> b!357017 m!354685))

(declare-fun m!354687 () Bool)

(assert (=> b!357017 m!354687))

(declare-fun m!354689 () Bool)

(assert (=> b!357013 m!354689))

(declare-fun m!354691 () Bool)

(assert (=> b!357012 m!354691))

(declare-fun m!354693 () Bool)

(assert (=> b!357019 m!354693))

(declare-fun m!354695 () Bool)

(assert (=> b!357022 m!354695))

(check-sat (not b!357019) (not start!35598) (not b!357022) tp_is_empty!8065 (not b!357017) (not b_next!7867) (not b!357016) (not b!357013) (not b!357012) b_and!15083 (not mapNonEmpty!13605))
(check-sat b_and!15083 (not b_next!7867))
