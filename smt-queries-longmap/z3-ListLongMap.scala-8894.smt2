; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108004 () Bool)

(assert start!108004)

(declare-fun mapNonEmpty!51443 () Bool)

(declare-fun mapRes!51443 () Bool)

(declare-fun tp!98202 () Bool)

(declare-fun e!728302 () Bool)

(assert (=> mapNonEmpty!51443 (= mapRes!51443 (and tp!98202 e!728302))))

(declare-fun mapKey!51443 () (_ BitVec 32))

(declare-datatypes ((V!49473 0))(
  ( (V!49474 (val!16713 Int)) )
))
(declare-datatypes ((ValueCell!15740 0))(
  ( (ValueCellFull!15740 (v!19309 V!49473)) (EmptyCell!15740) )
))
(declare-fun mapRest!51443 () (Array (_ BitVec 32) ValueCell!15740))

(declare-datatypes ((array!83561 0))(
  ( (array!83562 (arr!40293 (Array (_ BitVec 32) ValueCell!15740)) (size!40845 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83561)

(declare-fun mapValue!51443 () ValueCell!15740)

(assert (=> mapNonEmpty!51443 (= (arr!40293 _values!1187) (store mapRest!51443 mapKey!51443 mapValue!51443))))

(declare-fun mapIsEmpty!51443 () Bool)

(assert (=> mapIsEmpty!51443 mapRes!51443))

(declare-fun res!847883 () Bool)

(declare-fun e!728305 () Bool)

(assert (=> start!108004 (=> (not res!847883) (not e!728305))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108004 (= res!847883 (validMask!0 mask!1805))))

(assert (=> start!108004 e!728305))

(assert (=> start!108004 true))

(declare-fun e!728301 () Bool)

(declare-fun array_inv!30777 (array!83561) Bool)

(assert (=> start!108004 (and (array_inv!30777 _values!1187) e!728301)))

(declare-datatypes ((array!83563 0))(
  ( (array!83564 (arr!40294 (Array (_ BitVec 32) (_ BitVec 64))) (size!40846 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83563)

(declare-fun array_inv!30778 (array!83563) Bool)

(assert (=> start!108004 (array_inv!30778 _keys!1427)))

(declare-fun b!1275666 () Bool)

(declare-fun e!728303 () Bool)

(declare-fun tp_is_empty!33277 () Bool)

(assert (=> b!1275666 (= e!728303 tp_is_empty!33277)))

(declare-fun b!1275667 () Bool)

(assert (=> b!1275667 (= e!728305 false)))

(declare-fun lt!575205 () Bool)

(declare-datatypes ((List!28698 0))(
  ( (Nil!28695) (Cons!28694 (h!29903 (_ BitVec 64)) (t!42226 List!28698)) )
))
(declare-fun arrayNoDuplicates!0 (array!83563 (_ BitVec 32) List!28698) Bool)

(assert (=> b!1275667 (= lt!575205 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28695))))

(declare-fun b!1275668 () Bool)

(assert (=> b!1275668 (= e!728301 (and e!728303 mapRes!51443))))

(declare-fun condMapEmpty!51443 () Bool)

(declare-fun mapDefault!51443 () ValueCell!15740)

(assert (=> b!1275668 (= condMapEmpty!51443 (= (arr!40293 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15740)) mapDefault!51443)))))

(declare-fun b!1275669 () Bool)

(assert (=> b!1275669 (= e!728302 tp_is_empty!33277)))

(declare-fun b!1275670 () Bool)

(declare-fun res!847882 () Bool)

(assert (=> b!1275670 (=> (not res!847882) (not e!728305))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1275670 (= res!847882 (and (= (size!40845 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40846 _keys!1427) (size!40845 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1275671 () Bool)

(declare-fun res!847884 () Bool)

(assert (=> b!1275671 (=> (not res!847884) (not e!728305))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83563 (_ BitVec 32)) Bool)

(assert (=> b!1275671 (= res!847884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(assert (= (and start!108004 res!847883) b!1275670))

(assert (= (and b!1275670 res!847882) b!1275671))

(assert (= (and b!1275671 res!847884) b!1275667))

(assert (= (and b!1275668 condMapEmpty!51443) mapIsEmpty!51443))

(assert (= (and b!1275668 (not condMapEmpty!51443)) mapNonEmpty!51443))

(get-info :version)

(assert (= (and mapNonEmpty!51443 ((_ is ValueCellFull!15740) mapValue!51443)) b!1275669))

(assert (= (and b!1275668 ((_ is ValueCellFull!15740) mapDefault!51443)) b!1275666))

(assert (= start!108004 b!1275668))

(declare-fun m!1171371 () Bool)

(assert (=> mapNonEmpty!51443 m!1171371))

(declare-fun m!1171373 () Bool)

(assert (=> start!108004 m!1171373))

(declare-fun m!1171375 () Bool)

(assert (=> start!108004 m!1171375))

(declare-fun m!1171377 () Bool)

(assert (=> start!108004 m!1171377))

(declare-fun m!1171379 () Bool)

(assert (=> b!1275667 m!1171379))

(declare-fun m!1171381 () Bool)

(assert (=> b!1275671 m!1171381))

(check-sat (not b!1275667) (not mapNonEmpty!51443) (not b!1275671) tp_is_empty!33277 (not start!108004))
(check-sat)
