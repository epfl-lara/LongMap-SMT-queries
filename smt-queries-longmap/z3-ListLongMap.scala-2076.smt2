; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35610 () Bool)

(assert start!35610)

(declare-fun b_free!7879 () Bool)

(declare-fun b_next!7879 () Bool)

(assert (=> start!35610 (= b_free!7879 (not b_next!7879))))

(declare-fun tp!27620 () Bool)

(declare-fun b_and!15135 () Bool)

(assert (=> start!35610 (= tp!27620 b_and!15135)))

(declare-fun b!357450 () Bool)

(declare-fun res!198565 () Bool)

(declare-fun e!218858 () Bool)

(assert (=> b!357450 (=> (not res!198565) (not e!218858))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((array!19704 0))(
  ( (array!19705 (arr!9345 (Array (_ BitVec 32) (_ BitVec 64))) (size!9697 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19704)

(assert (=> b!357450 (= res!198565 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9697 _keys!1456))))))

(declare-fun b!357451 () Bool)

(declare-fun e!218860 () Bool)

(assert (=> b!357451 (= e!218860 true)))

(declare-datatypes ((V!11747 0))(
  ( (V!11748 (val!4083 Int)) )
))
(declare-fun minValue!1150 () V!11747)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun defaultEntry!1216 () Int)

(declare-fun k0!1077 () (_ BitVec 64))

(declare-datatypes ((ValueCell!3695 0))(
  ( (ValueCellFull!3695 (v!6278 V!11747)) (EmptyCell!3695) )
))
(declare-datatypes ((array!19706 0))(
  ( (array!19707 (arr!9346 (Array (_ BitVec 32) ValueCell!3695)) (size!9698 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19706)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11747)

(declare-datatypes ((tuple2!5620 0))(
  ( (tuple2!5621 (_1!2821 (_ BitVec 64)) (_2!2821 V!11747)) )
))
(declare-datatypes ((List!5301 0))(
  ( (Nil!5298) (Cons!5297 (h!6153 tuple2!5620) (t!10443 List!5301)) )
))
(declare-datatypes ((ListLongMap!4535 0))(
  ( (ListLongMap!4536 (toList!2283 List!5301)) )
))
(declare-fun contains!2382 (ListLongMap!4535 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1811 (array!19704 array!19706 (_ BitVec 32) (_ BitVec 32) V!11747 V!11747 (_ BitVec 32) Int) ListLongMap!4535)

(assert (=> b!357451 (contains!2382 (getCurrentListMap!1811 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) k0!1077)))

(declare-datatypes ((Unit!11003 0))(
  ( (Unit!11004) )
))
(declare-fun lt!166070 () Unit!11003)

(declare-fun lemmaArrayContainsKeyThenInListMap!350 (array!19704 array!19706 (_ BitVec 32) (_ BitVec 32) V!11747 V!11747 (_ BitVec 64) (_ BitVec 32) Int) Unit!11003)

(assert (=> b!357451 (= lt!166070 (lemmaArrayContainsKeyThenInListMap!350 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805) defaultEntry!1216))))

(declare-fun b!357452 () Bool)

(declare-fun res!198558 () Bool)

(assert (=> b!357452 (=> (not res!198558) (not e!218858))))

(assert (=> b!357452 (= res!198558 (not (= (select (arr!9345 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!357453 () Bool)

(declare-fun e!218859 () Bool)

(declare-fun tp_is_empty!8077 () Bool)

(assert (=> b!357453 (= e!218859 tp_is_empty!8077)))

(declare-fun b!357454 () Bool)

(declare-fun e!218862 () Bool)

(declare-fun mapRes!13623 () Bool)

(assert (=> b!357454 (= e!218862 (and e!218859 mapRes!13623))))

(declare-fun condMapEmpty!13623 () Bool)

(declare-fun mapDefault!13623 () ValueCell!3695)

(assert (=> b!357454 (= condMapEmpty!13623 (= (arr!9346 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3695)) mapDefault!13623)))))

(declare-fun b!357455 () Bool)

(declare-fun e!218861 () Bool)

(assert (=> b!357455 (= e!218861 tp_is_empty!8077)))

(declare-fun b!357456 () Bool)

(declare-fun res!198564 () Bool)

(assert (=> b!357456 (=> (not res!198564) (not e!218858))))

(assert (=> b!357456 (= res!198564 (and (= (size!9698 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9697 _keys!1456) (size!9698 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!13623 () Bool)

(assert (=> mapIsEmpty!13623 mapRes!13623))

(declare-fun b!357457 () Bool)

(assert (=> b!357457 (= e!218858 (not e!218860))))

(declare-fun res!198562 () Bool)

(assert (=> b!357457 (=> res!198562 e!218860)))

(assert (=> b!357457 (= res!198562 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9697 _keys!1456))))))

(declare-fun arrayContainsKey!0 (array!19704 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357457 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun lt!166069 () Unit!11003)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!30 (array!19704 array!19706 (_ BitVec 32) (_ BitVec 32) V!11747 V!11747 (_ BitVec 64) (_ BitVec 32)) Unit!11003)

(assert (=> b!357457 (= lt!166069 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!30 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!357458 () Bool)

(declare-fun res!198563 () Bool)

(assert (=> b!357458 (=> (not res!198563) (not e!218858))))

(assert (=> b!357458 (= res!198563 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun res!198561 () Bool)

(assert (=> start!35610 (=> (not res!198561) (not e!218858))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35610 (= res!198561 (validMask!0 mask!1842))))

(assert (=> start!35610 e!218858))

(assert (=> start!35610 tp_is_empty!8077))

(assert (=> start!35610 true))

(assert (=> start!35610 tp!27620))

(declare-fun array_inv!6904 (array!19704) Bool)

(assert (=> start!35610 (array_inv!6904 _keys!1456)))

(declare-fun array_inv!6905 (array!19706) Bool)

(assert (=> start!35610 (and (array_inv!6905 _values!1208) e!218862)))

(declare-fun b!357459 () Bool)

(declare-fun res!198559 () Bool)

(assert (=> b!357459 (=> (not res!198559) (not e!218858))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357459 (= res!198559 (validKeyInArray!0 k0!1077))))

(declare-fun b!357460 () Bool)

(declare-fun res!198557 () Bool)

(assert (=> b!357460 (=> (not res!198557) (not e!218858))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19704 (_ BitVec 32)) Bool)

(assert (=> b!357460 (= res!198557 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapNonEmpty!13623 () Bool)

(declare-fun tp!27621 () Bool)

(assert (=> mapNonEmpty!13623 (= mapRes!13623 (and tp!27621 e!218861))))

(declare-fun mapValue!13623 () ValueCell!3695)

(declare-fun mapRest!13623 () (Array (_ BitVec 32) ValueCell!3695))

(declare-fun mapKey!13623 () (_ BitVec 32))

(assert (=> mapNonEmpty!13623 (= (arr!9346 _values!1208) (store mapRest!13623 mapKey!13623 mapValue!13623))))

(declare-fun b!357461 () Bool)

(declare-fun res!198560 () Bool)

(assert (=> b!357461 (=> (not res!198560) (not e!218858))))

(declare-datatypes ((List!5302 0))(
  ( (Nil!5299) (Cons!5298 (h!6154 (_ BitVec 64)) (t!10444 List!5302)) )
))
(declare-fun arrayNoDuplicates!0 (array!19704 (_ BitVec 32) List!5302) Bool)

(assert (=> b!357461 (= res!198560 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5299))))

(assert (= (and start!35610 res!198561) b!357456))

(assert (= (and b!357456 res!198564) b!357460))

(assert (= (and b!357460 res!198557) b!357461))

(assert (= (and b!357461 res!198560) b!357459))

(assert (= (and b!357459 res!198559) b!357450))

(assert (= (and b!357450 res!198565) b!357458))

(assert (= (and b!357458 res!198563) b!357452))

(assert (= (and b!357452 res!198558) b!357457))

(assert (= (and b!357457 (not res!198562)) b!357451))

(assert (= (and b!357454 condMapEmpty!13623) mapIsEmpty!13623))

(assert (= (and b!357454 (not condMapEmpty!13623)) mapNonEmpty!13623))

(get-info :version)

(assert (= (and mapNonEmpty!13623 ((_ is ValueCellFull!3695) mapValue!13623)) b!357455))

(assert (= (and b!357454 ((_ is ValueCellFull!3695) mapDefault!13623)) b!357453))

(assert (= start!35610 b!357454))

(declare-fun m!355791 () Bool)

(assert (=> mapNonEmpty!13623 m!355791))

(declare-fun m!355793 () Bool)

(assert (=> b!357452 m!355793))

(declare-fun m!355795 () Bool)

(assert (=> b!357457 m!355795))

(declare-fun m!355797 () Bool)

(assert (=> b!357457 m!355797))

(declare-fun m!355799 () Bool)

(assert (=> b!357460 m!355799))

(declare-fun m!355801 () Bool)

(assert (=> b!357461 m!355801))

(declare-fun m!355803 () Bool)

(assert (=> b!357458 m!355803))

(declare-fun m!355805 () Bool)

(assert (=> b!357459 m!355805))

(declare-fun m!355807 () Bool)

(assert (=> b!357451 m!355807))

(assert (=> b!357451 m!355807))

(declare-fun m!355809 () Bool)

(assert (=> b!357451 m!355809))

(declare-fun m!355811 () Bool)

(assert (=> b!357451 m!355811))

(declare-fun m!355813 () Bool)

(assert (=> start!35610 m!355813))

(declare-fun m!355815 () Bool)

(assert (=> start!35610 m!355815))

(declare-fun m!355817 () Bool)

(assert (=> start!35610 m!355817))

(check-sat (not start!35610) (not b!357460) (not b!357457) tp_is_empty!8077 (not b!357451) (not b_next!7879) b_and!15135 (not mapNonEmpty!13623) (not b!357461) (not b!357458) (not b!357459))
(check-sat b_and!15135 (not b_next!7879))
