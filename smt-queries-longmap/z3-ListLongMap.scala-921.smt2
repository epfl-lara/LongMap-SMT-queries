; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20626 () Bool)

(assert start!20626)

(declare-fun b_free!5281 () Bool)

(declare-fun b_next!5281 () Bool)

(assert (=> start!20626 (= b_free!5281 (not b_next!5281))))

(declare-fun tp!18874 () Bool)

(declare-fun b_and!12001 () Bool)

(assert (=> start!20626 (= tp!18874 b_and!12001)))

(declare-fun b!205557 () Bool)

(declare-fun e!134397 () Bool)

(declare-fun e!134403 () Bool)

(assert (=> b!205557 (= e!134397 (not e!134403))))

(declare-fun res!99366 () Bool)

(assert (=> b!205557 (=> res!99366 e!134403)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!205557 (= res!99366 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6497 0))(
  ( (V!6498 (val!2613 Int)) )
))
(declare-datatypes ((tuple2!3946 0))(
  ( (tuple2!3947 (_1!1984 (_ BitVec 64)) (_2!1984 V!6497)) )
))
(declare-datatypes ((List!2848 0))(
  ( (Nil!2845) (Cons!2844 (h!3486 tuple2!3946) (t!7770 List!2848)) )
))
(declare-datatypes ((ListLongMap!2849 0))(
  ( (ListLongMap!2850 (toList!1440 List!2848)) )
))
(declare-fun lt!104658 () ListLongMap!2849)

(declare-datatypes ((ValueCell!2225 0))(
  ( (ValueCellFull!2225 (v!4577 V!6497)) (EmptyCell!2225) )
))
(declare-datatypes ((array!9471 0))(
  ( (array!9472 (arr!4485 (Array (_ BitVec 32) ValueCell!2225)) (size!4811 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9471)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6497)

(declare-datatypes ((array!9473 0))(
  ( (array!9474 (arr!4486 (Array (_ BitVec 32) (_ BitVec 64))) (size!4812 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9473)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6497)

(declare-fun getCurrentListMap!985 (array!9473 array!9471 (_ BitVec 32) (_ BitVec 32) V!6497 V!6497 (_ BitVec 32) Int) ListLongMap!2849)

(assert (=> b!205557 (= lt!104658 (getCurrentListMap!985 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104656 () array!9471)

(declare-fun lt!104660 () ListLongMap!2849)

(assert (=> b!205557 (= lt!104660 (getCurrentListMap!985 _keys!825 lt!104656 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104662 () ListLongMap!2849)

(declare-fun lt!104665 () ListLongMap!2849)

(assert (=> b!205557 (and (= lt!104662 lt!104665) (= lt!104665 lt!104662))))

(declare-fun lt!104657 () ListLongMap!2849)

(declare-fun lt!104655 () tuple2!3946)

(declare-fun +!489 (ListLongMap!2849 tuple2!3946) ListLongMap!2849)

(assert (=> b!205557 (= lt!104665 (+!489 lt!104657 lt!104655))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6497)

(assert (=> b!205557 (= lt!104655 (tuple2!3947 k0!843 v!520))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6220 0))(
  ( (Unit!6221) )
))
(declare-fun lt!104659 () Unit!6220)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!144 (array!9473 array!9471 (_ BitVec 32) (_ BitVec 32) V!6497 V!6497 (_ BitVec 32) (_ BitVec 64) V!6497 (_ BitVec 32) Int) Unit!6220)

(assert (=> b!205557 (= lt!104659 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!144 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!395 (array!9473 array!9471 (_ BitVec 32) (_ BitVec 32) V!6497 V!6497 (_ BitVec 32) Int) ListLongMap!2849)

(assert (=> b!205557 (= lt!104662 (getCurrentListMapNoExtraKeys!395 _keys!825 lt!104656 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205557 (= lt!104656 (array!9472 (store (arr!4485 _values!649) i!601 (ValueCellFull!2225 v!520)) (size!4811 _values!649)))))

(assert (=> b!205557 (= lt!104657 (getCurrentListMapNoExtraKeys!395 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!205558 () Bool)

(declare-fun e!134399 () Bool)

(assert (=> b!205558 (= e!134403 e!134399)))

(declare-fun res!99365 () Bool)

(assert (=> b!205558 (=> res!99365 e!134399)))

(assert (=> b!205558 (= res!99365 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!104666 () ListLongMap!2849)

(assert (=> b!205558 (= lt!104658 lt!104666)))

(declare-fun lt!104661 () tuple2!3946)

(assert (=> b!205558 (= lt!104666 (+!489 lt!104657 lt!104661))))

(declare-fun lt!104663 () ListLongMap!2849)

(assert (=> b!205558 (= lt!104660 lt!104663)))

(assert (=> b!205558 (= lt!104663 (+!489 lt!104665 lt!104661))))

(assert (=> b!205558 (= lt!104660 (+!489 lt!104662 lt!104661))))

(assert (=> b!205558 (= lt!104661 (tuple2!3947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205560 () Bool)

(declare-fun e!134402 () Bool)

(declare-fun e!134401 () Bool)

(declare-fun mapRes!8774 () Bool)

(assert (=> b!205560 (= e!134402 (and e!134401 mapRes!8774))))

(declare-fun condMapEmpty!8774 () Bool)

(declare-fun mapDefault!8774 () ValueCell!2225)

(assert (=> b!205560 (= condMapEmpty!8774 (= (arr!4485 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2225)) mapDefault!8774)))))

(declare-fun b!205561 () Bool)

(assert (=> b!205561 (= e!134399 true)))

(assert (=> b!205561 (= lt!104663 (+!489 lt!104666 lt!104655))))

(declare-fun lt!104664 () Unit!6220)

(declare-fun addCommutativeForDiffKeys!177 (ListLongMap!2849 (_ BitVec 64) V!6497 (_ BitVec 64) V!6497) Unit!6220)

(assert (=> b!205561 (= lt!104664 (addCommutativeForDiffKeys!177 lt!104657 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205562 () Bool)

(declare-fun res!99363 () Bool)

(assert (=> b!205562 (=> (not res!99363) (not e!134397))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205562 (= res!99363 (validKeyInArray!0 k0!843))))

(declare-fun b!205563 () Bool)

(declare-fun res!99362 () Bool)

(assert (=> b!205563 (=> (not res!99362) (not e!134397))))

(assert (=> b!205563 (= res!99362 (= (select (arr!4486 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!8774 () Bool)

(declare-fun tp!18875 () Bool)

(declare-fun e!134398 () Bool)

(assert (=> mapNonEmpty!8774 (= mapRes!8774 (and tp!18875 e!134398))))

(declare-fun mapValue!8774 () ValueCell!2225)

(declare-fun mapKey!8774 () (_ BitVec 32))

(declare-fun mapRest!8774 () (Array (_ BitVec 32) ValueCell!2225))

(assert (=> mapNonEmpty!8774 (= (arr!4485 _values!649) (store mapRest!8774 mapKey!8774 mapValue!8774))))

(declare-fun b!205564 () Bool)

(declare-fun res!99361 () Bool)

(assert (=> b!205564 (=> (not res!99361) (not e!134397))))

(declare-datatypes ((List!2849 0))(
  ( (Nil!2846) (Cons!2845 (h!3487 (_ BitVec 64)) (t!7771 List!2849)) )
))
(declare-fun arrayNoDuplicates!0 (array!9473 (_ BitVec 32) List!2849) Bool)

(assert (=> b!205564 (= res!99361 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2846))))

(declare-fun b!205565 () Bool)

(declare-fun res!99364 () Bool)

(assert (=> b!205565 (=> (not res!99364) (not e!134397))))

(assert (=> b!205565 (= res!99364 (and (= (size!4811 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4812 _keys!825) (size!4811 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!205566 () Bool)

(declare-fun tp_is_empty!5137 () Bool)

(assert (=> b!205566 (= e!134401 tp_is_empty!5137)))

(declare-fun b!205567 () Bool)

(assert (=> b!205567 (= e!134398 tp_is_empty!5137)))

(declare-fun b!205559 () Bool)

(declare-fun res!99368 () Bool)

(assert (=> b!205559 (=> (not res!99368) (not e!134397))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9473 (_ BitVec 32)) Bool)

(assert (=> b!205559 (= res!99368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun res!99367 () Bool)

(assert (=> start!20626 (=> (not res!99367) (not e!134397))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20626 (= res!99367 (validMask!0 mask!1149))))

(assert (=> start!20626 e!134397))

(declare-fun array_inv!2949 (array!9471) Bool)

(assert (=> start!20626 (and (array_inv!2949 _values!649) e!134402)))

(assert (=> start!20626 true))

(assert (=> start!20626 tp_is_empty!5137))

(declare-fun array_inv!2950 (array!9473) Bool)

(assert (=> start!20626 (array_inv!2950 _keys!825)))

(assert (=> start!20626 tp!18874))

(declare-fun mapIsEmpty!8774 () Bool)

(assert (=> mapIsEmpty!8774 mapRes!8774))

(declare-fun b!205568 () Bool)

(declare-fun res!99360 () Bool)

(assert (=> b!205568 (=> (not res!99360) (not e!134397))))

(assert (=> b!205568 (= res!99360 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4812 _keys!825))))))

(assert (= (and start!20626 res!99367) b!205565))

(assert (= (and b!205565 res!99364) b!205559))

(assert (= (and b!205559 res!99368) b!205564))

(assert (= (and b!205564 res!99361) b!205568))

(assert (= (and b!205568 res!99360) b!205562))

(assert (= (and b!205562 res!99363) b!205563))

(assert (= (and b!205563 res!99362) b!205557))

(assert (= (and b!205557 (not res!99366)) b!205558))

(assert (= (and b!205558 (not res!99365)) b!205561))

(assert (= (and b!205560 condMapEmpty!8774) mapIsEmpty!8774))

(assert (= (and b!205560 (not condMapEmpty!8774)) mapNonEmpty!8774))

(get-info :version)

(assert (= (and mapNonEmpty!8774 ((_ is ValueCellFull!2225) mapValue!8774)) b!205567))

(assert (= (and b!205560 ((_ is ValueCellFull!2225) mapDefault!8774)) b!205566))

(assert (= start!20626 b!205560))

(declare-fun m!232743 () Bool)

(assert (=> b!205557 m!232743))

(declare-fun m!232745 () Bool)

(assert (=> b!205557 m!232745))

(declare-fun m!232747 () Bool)

(assert (=> b!205557 m!232747))

(declare-fun m!232749 () Bool)

(assert (=> b!205557 m!232749))

(declare-fun m!232751 () Bool)

(assert (=> b!205557 m!232751))

(declare-fun m!232753 () Bool)

(assert (=> b!205557 m!232753))

(declare-fun m!232755 () Bool)

(assert (=> b!205557 m!232755))

(declare-fun m!232757 () Bool)

(assert (=> b!205564 m!232757))

(declare-fun m!232759 () Bool)

(assert (=> b!205561 m!232759))

(declare-fun m!232761 () Bool)

(assert (=> b!205561 m!232761))

(declare-fun m!232763 () Bool)

(assert (=> start!20626 m!232763))

(declare-fun m!232765 () Bool)

(assert (=> start!20626 m!232765))

(declare-fun m!232767 () Bool)

(assert (=> start!20626 m!232767))

(declare-fun m!232769 () Bool)

(assert (=> b!205559 m!232769))

(declare-fun m!232771 () Bool)

(assert (=> b!205558 m!232771))

(declare-fun m!232773 () Bool)

(assert (=> b!205558 m!232773))

(declare-fun m!232775 () Bool)

(assert (=> b!205558 m!232775))

(declare-fun m!232777 () Bool)

(assert (=> b!205563 m!232777))

(declare-fun m!232779 () Bool)

(assert (=> mapNonEmpty!8774 m!232779))

(declare-fun m!232781 () Bool)

(assert (=> b!205562 m!232781))

(check-sat (not b!205557) (not start!20626) b_and!12001 (not b!205561) (not mapNonEmpty!8774) (not b!205559) (not b!205558) tp_is_empty!5137 (not b!205564) (not b!205562) (not b_next!5281))
(check-sat b_and!12001 (not b_next!5281))
