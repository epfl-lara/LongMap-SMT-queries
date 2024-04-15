; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109324 () Bool)

(assert start!109324)

(declare-fun b_free!28813 () Bool)

(declare-fun b_next!28813 () Bool)

(assert (=> start!109324 (= b_free!28813 (not b_next!28813))))

(declare-fun tp!101559 () Bool)

(declare-fun b_and!46885 () Bool)

(assert (=> start!109324 (= tp!101559 b_and!46885)))

(declare-fun b!1293772 () Bool)

(declare-fun res!859774 () Bool)

(declare-fun e!738346 () Bool)

(assert (=> b!1293772 (=> (not res!859774) (not e!738346))))

(declare-datatypes ((V!51041 0))(
  ( (V!51042 (val!17301 Int)) )
))
(declare-fun minValue!1387 () V!51041)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16328 0))(
  ( (ValueCellFull!16328 (v!19903 V!51041)) (EmptyCell!16328) )
))
(declare-datatypes ((array!85819 0))(
  ( (array!85820 (arr!41411 (Array (_ BitVec 32) ValueCell!16328)) (size!41963 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85819)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85821 0))(
  ( (array!85822 (arr!41412 (Array (_ BitVec 32) (_ BitVec 64))) (size!41964 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85821)

(declare-fun zeroValue!1387 () V!51041)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22308 0))(
  ( (tuple2!22309 (_1!11165 (_ BitVec 64)) (_2!11165 V!51041)) )
))
(declare-datatypes ((List!29452 0))(
  ( (Nil!29449) (Cons!29448 (h!30657 tuple2!22308) (t!43008 List!29452)) )
))
(declare-datatypes ((ListLongMap!19965 0))(
  ( (ListLongMap!19966 (toList!9998 List!29452)) )
))
(declare-fun contains!8046 (ListLongMap!19965 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4932 (array!85821 array!85819 (_ BitVec 32) (_ BitVec 32) V!51041 V!51041 (_ BitVec 32) Int) ListLongMap!19965)

(assert (=> b!1293772 (= res!859774 (contains!8046 (getCurrentListMap!4932 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1293773 () Bool)

(declare-fun res!859776 () Bool)

(assert (=> b!1293773 (=> (not res!859776) (not e!738346))))

(assert (=> b!1293773 (= res!859776 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41964 _keys!1741))))))

(declare-fun b!1293774 () Bool)

(declare-fun res!859772 () Bool)

(assert (=> b!1293774 (=> (not res!859772) (not e!738346))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1293774 (= res!859772 (not (validKeyInArray!0 (select (arr!41412 _keys!1741) from!2144))))))

(declare-fun b!1293775 () Bool)

(declare-fun e!738347 () Bool)

(declare-fun tp_is_empty!34453 () Bool)

(assert (=> b!1293775 (= e!738347 tp_is_empty!34453)))

(declare-fun b!1293776 () Bool)

(declare-fun e!738344 () Bool)

(declare-fun mapRes!53240 () Bool)

(assert (=> b!1293776 (= e!738344 (and e!738347 mapRes!53240))))

(declare-fun condMapEmpty!53240 () Bool)

(declare-fun mapDefault!53240 () ValueCell!16328)

(assert (=> b!1293776 (= condMapEmpty!53240 (= (arr!41411 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16328)) mapDefault!53240)))))

(declare-fun mapIsEmpty!53240 () Bool)

(assert (=> mapIsEmpty!53240 mapRes!53240))

(declare-fun b!1293777 () Bool)

(declare-fun res!859768 () Bool)

(assert (=> b!1293777 (=> (not res!859768) (not e!738346))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85821 (_ BitVec 32)) Bool)

(assert (=> b!1293777 (= res!859768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1293778 () Bool)

(declare-fun e!738348 () Bool)

(assert (=> b!1293778 (= e!738348 true)))

(declare-fun lt!579472 () ListLongMap!19965)

(declare-fun +!4442 (ListLongMap!19965 tuple2!22308) ListLongMap!19965)

(assert (=> b!1293778 (not (contains!8046 (+!4442 lt!579472 (tuple2!22309 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42672 0))(
  ( (Unit!42673) )
))
(declare-fun lt!579470 () Unit!42672)

(declare-fun addStillNotContains!419 (ListLongMap!19965 (_ BitVec 64) V!51041 (_ BitVec 64)) Unit!42672)

(assert (=> b!1293778 (= lt!579470 (addStillNotContains!419 lt!579472 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6074 (array!85821 array!85819 (_ BitVec 32) (_ BitVec 32) V!51041 V!51041 (_ BitVec 32) Int) ListLongMap!19965)

(assert (=> b!1293778 (= lt!579472 (getCurrentListMapNoExtraKeys!6074 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun res!859771 () Bool)

(assert (=> start!109324 (=> (not res!859771) (not e!738346))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109324 (= res!859771 (validMask!0 mask!2175))))

(assert (=> start!109324 e!738346))

(assert (=> start!109324 tp_is_empty!34453))

(assert (=> start!109324 true))

(declare-fun array_inv!31527 (array!85819) Bool)

(assert (=> start!109324 (and (array_inv!31527 _values!1445) e!738344)))

(declare-fun array_inv!31528 (array!85821) Bool)

(assert (=> start!109324 (array_inv!31528 _keys!1741)))

(assert (=> start!109324 tp!101559))

(declare-fun b!1293779 () Bool)

(declare-fun res!859773 () Bool)

(assert (=> b!1293779 (=> (not res!859773) (not e!738346))))

(declare-datatypes ((List!29453 0))(
  ( (Nil!29450) (Cons!29449 (h!30658 (_ BitVec 64)) (t!43009 List!29453)) )
))
(declare-fun arrayNoDuplicates!0 (array!85821 (_ BitVec 32) List!29453) Bool)

(assert (=> b!1293779 (= res!859773 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29450))))

(declare-fun b!1293780 () Bool)

(declare-fun e!738345 () Bool)

(assert (=> b!1293780 (= e!738345 tp_is_empty!34453)))

(declare-fun b!1293781 () Bool)

(declare-fun res!859769 () Bool)

(assert (=> b!1293781 (=> (not res!859769) (not e!738346))))

(assert (=> b!1293781 (= res!859769 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41964 _keys!1741))))))

(declare-fun b!1293782 () Bool)

(declare-fun res!859770 () Bool)

(assert (=> b!1293782 (=> (not res!859770) (not e!738346))))

(assert (=> b!1293782 (= res!859770 (and (= (size!41963 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41964 _keys!1741) (size!41963 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1293783 () Bool)

(assert (=> b!1293783 (= e!738346 (not e!738348))))

(declare-fun res!859775 () Bool)

(assert (=> b!1293783 (=> res!859775 e!738348)))

(assert (=> b!1293783 (= res!859775 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1293783 (not (contains!8046 (ListLongMap!19966 Nil!29449) k0!1205))))

(declare-fun lt!579471 () Unit!42672)

(declare-fun emptyContainsNothing!130 ((_ BitVec 64)) Unit!42672)

(assert (=> b!1293783 (= lt!579471 (emptyContainsNothing!130 k0!1205))))

(declare-fun mapNonEmpty!53240 () Bool)

(declare-fun tp!101558 () Bool)

(assert (=> mapNonEmpty!53240 (= mapRes!53240 (and tp!101558 e!738345))))

(declare-fun mapKey!53240 () (_ BitVec 32))

(declare-fun mapRest!53240 () (Array (_ BitVec 32) ValueCell!16328))

(declare-fun mapValue!53240 () ValueCell!16328)

(assert (=> mapNonEmpty!53240 (= (arr!41411 _values!1445) (store mapRest!53240 mapKey!53240 mapValue!53240))))

(assert (= (and start!109324 res!859771) b!1293782))

(assert (= (and b!1293782 res!859770) b!1293777))

(assert (= (and b!1293777 res!859768) b!1293779))

(assert (= (and b!1293779 res!859773) b!1293781))

(assert (= (and b!1293781 res!859769) b!1293772))

(assert (= (and b!1293772 res!859774) b!1293773))

(assert (= (and b!1293773 res!859776) b!1293774))

(assert (= (and b!1293774 res!859772) b!1293783))

(assert (= (and b!1293783 (not res!859775)) b!1293778))

(assert (= (and b!1293776 condMapEmpty!53240) mapIsEmpty!53240))

(assert (= (and b!1293776 (not condMapEmpty!53240)) mapNonEmpty!53240))

(get-info :version)

(assert (= (and mapNonEmpty!53240 ((_ is ValueCellFull!16328) mapValue!53240)) b!1293780))

(assert (= (and b!1293776 ((_ is ValueCellFull!16328) mapDefault!53240)) b!1293775))

(assert (= start!109324 b!1293776))

(declare-fun m!1185687 () Bool)

(assert (=> b!1293778 m!1185687))

(assert (=> b!1293778 m!1185687))

(declare-fun m!1185689 () Bool)

(assert (=> b!1293778 m!1185689))

(declare-fun m!1185691 () Bool)

(assert (=> b!1293778 m!1185691))

(declare-fun m!1185693 () Bool)

(assert (=> b!1293778 m!1185693))

(declare-fun m!1185695 () Bool)

(assert (=> start!109324 m!1185695))

(declare-fun m!1185697 () Bool)

(assert (=> start!109324 m!1185697))

(declare-fun m!1185699 () Bool)

(assert (=> start!109324 m!1185699))

(declare-fun m!1185701 () Bool)

(assert (=> b!1293774 m!1185701))

(assert (=> b!1293774 m!1185701))

(declare-fun m!1185703 () Bool)

(assert (=> b!1293774 m!1185703))

(declare-fun m!1185705 () Bool)

(assert (=> b!1293777 m!1185705))

(declare-fun m!1185707 () Bool)

(assert (=> b!1293772 m!1185707))

(assert (=> b!1293772 m!1185707))

(declare-fun m!1185709 () Bool)

(assert (=> b!1293772 m!1185709))

(declare-fun m!1185711 () Bool)

(assert (=> mapNonEmpty!53240 m!1185711))

(declare-fun m!1185713 () Bool)

(assert (=> b!1293783 m!1185713))

(declare-fun m!1185715 () Bool)

(assert (=> b!1293783 m!1185715))

(declare-fun m!1185717 () Bool)

(assert (=> b!1293779 m!1185717))

(check-sat (not mapNonEmpty!53240) (not b!1293778) (not b!1293783) (not b!1293779) (not b_next!28813) (not b!1293772) b_and!46885 tp_is_empty!34453 (not b!1293774) (not start!109324) (not b!1293777))
(check-sat b_and!46885 (not b_next!28813))
