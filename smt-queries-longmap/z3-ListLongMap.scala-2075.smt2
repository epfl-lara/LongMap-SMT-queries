; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35620 () Bool)

(assert start!35620)

(declare-fun b_free!7875 () Bool)

(declare-fun b_next!7875 () Bool)

(assert (=> start!35620 (= b_free!7875 (not b_next!7875))))

(declare-fun tp!27609 () Bool)

(declare-fun b_and!15117 () Bool)

(assert (=> start!35620 (= tp!27609 b_and!15117)))

(declare-fun b!357431 () Bool)

(declare-fun res!198506 () Bool)

(declare-fun e!218861 () Bool)

(assert (=> b!357431 (=> (not res!198506) (not e!218861))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357431 (= res!198506 (validKeyInArray!0 k0!1077))))

(declare-fun b!357432 () Bool)

(declare-fun res!198512 () Bool)

(assert (=> b!357432 (=> (not res!198512) (not e!218861))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((array!19713 0))(
  ( (array!19714 (arr!9350 (Array (_ BitVec 32) (_ BitVec 64))) (size!9702 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19713)

(declare-fun arrayContainsKey!0 (array!19713 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357432 (= res!198512 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!357433 () Bool)

(declare-fun res!198509 () Bool)

(assert (=> b!357433 (=> (not res!198509) (not e!218861))))

(assert (=> b!357433 (= res!198509 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9702 _keys!1456))))))

(declare-fun b!357434 () Bool)

(declare-fun e!218858 () Bool)

(assert (=> b!357434 (= e!218861 (not e!218858))))

(declare-fun res!198514 () Bool)

(assert (=> b!357434 (=> res!198514 e!218858)))

(assert (=> b!357434 (= res!198514 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9702 _keys!1456))))))

(assert (=> b!357434 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((V!11741 0))(
  ( (V!11742 (val!4081 Int)) )
))
(declare-fun minValue!1150 () V!11741)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((ValueCell!3693 0))(
  ( (ValueCellFull!3693 (v!6275 V!11741)) (EmptyCell!3693) )
))
(declare-datatypes ((array!19715 0))(
  ( (array!19716 (arr!9351 (Array (_ BitVec 32) ValueCell!3693)) (size!9703 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19715)

(declare-datatypes ((Unit!11014 0))(
  ( (Unit!11015) )
))
(declare-fun lt!166040 () Unit!11014)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11741)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!26 (array!19713 array!19715 (_ BitVec 32) (_ BitVec 32) V!11741 V!11741 (_ BitVec 64) (_ BitVec 32)) Unit!11014)

(assert (=> b!357434 (= lt!166040 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!26 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!357436 () Bool)

(declare-fun res!198513 () Bool)

(assert (=> b!357436 (=> (not res!198513) (not e!218861))))

(assert (=> b!357436 (= res!198513 (and (= (size!9703 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9702 _keys!1456) (size!9703 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!357437 () Bool)

(declare-fun res!198508 () Bool)

(assert (=> b!357437 (=> (not res!198508) (not e!218861))))

(assert (=> b!357437 (= res!198508 (not (= (select (arr!9350 _keys!1456) from!1805) k0!1077)))))

(declare-fun mapNonEmpty!13617 () Bool)

(declare-fun mapRes!13617 () Bool)

(declare-fun tp!27608 () Bool)

(declare-fun e!218859 () Bool)

(assert (=> mapNonEmpty!13617 (= mapRes!13617 (and tp!27608 e!218859))))

(declare-fun mapRest!13617 () (Array (_ BitVec 32) ValueCell!3693))

(declare-fun mapKey!13617 () (_ BitVec 32))

(declare-fun mapValue!13617 () ValueCell!3693)

(assert (=> mapNonEmpty!13617 (= (arr!9351 _values!1208) (store mapRest!13617 mapKey!13617 mapValue!13617))))

(declare-fun mapIsEmpty!13617 () Bool)

(assert (=> mapIsEmpty!13617 mapRes!13617))

(declare-fun b!357438 () Bool)

(declare-fun e!218860 () Bool)

(declare-fun tp_is_empty!8073 () Bool)

(assert (=> b!357438 (= e!218860 tp_is_empty!8073)))

(declare-fun b!357439 () Bool)

(assert (=> b!357439 (= e!218858 true)))

(declare-fun defaultEntry!1216 () Int)

(declare-datatypes ((tuple2!5702 0))(
  ( (tuple2!5703 (_1!2862 (_ BitVec 64)) (_2!2862 V!11741)) )
))
(declare-datatypes ((List!5394 0))(
  ( (Nil!5391) (Cons!5390 (h!6246 tuple2!5702) (t!10544 List!5394)) )
))
(declare-datatypes ((ListLongMap!4615 0))(
  ( (ListLongMap!4616 (toList!2323 List!5394)) )
))
(declare-fun contains!2403 (ListLongMap!4615 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1844 (array!19713 array!19715 (_ BitVec 32) (_ BitVec 32) V!11741 V!11741 (_ BitVec 32) Int) ListLongMap!4615)

(assert (=> b!357439 (contains!2403 (getCurrentListMap!1844 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) k0!1077)))

(declare-fun lt!166039 () Unit!11014)

(declare-fun lemmaArrayContainsKeyThenInListMap!339 (array!19713 array!19715 (_ BitVec 32) (_ BitVec 32) V!11741 V!11741 (_ BitVec 64) (_ BitVec 32) Int) Unit!11014)

(assert (=> b!357439 (= lt!166039 (lemmaArrayContainsKeyThenInListMap!339 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805) defaultEntry!1216))))

(declare-fun b!357440 () Bool)

(declare-fun res!198511 () Bool)

(assert (=> b!357440 (=> (not res!198511) (not e!218861))))

(declare-datatypes ((List!5395 0))(
  ( (Nil!5392) (Cons!5391 (h!6247 (_ BitVec 64)) (t!10545 List!5395)) )
))
(declare-fun arrayNoDuplicates!0 (array!19713 (_ BitVec 32) List!5395) Bool)

(assert (=> b!357440 (= res!198511 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5392))))

(declare-fun b!357441 () Bool)

(assert (=> b!357441 (= e!218859 tp_is_empty!8073)))

(declare-fun b!357442 () Bool)

(declare-fun res!198510 () Bool)

(assert (=> b!357442 (=> (not res!198510) (not e!218861))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19713 (_ BitVec 32)) Bool)

(assert (=> b!357442 (= res!198510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun res!198507 () Bool)

(assert (=> start!35620 (=> (not res!198507) (not e!218861))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35620 (= res!198507 (validMask!0 mask!1842))))

(assert (=> start!35620 e!218861))

(assert (=> start!35620 tp_is_empty!8073))

(assert (=> start!35620 true))

(assert (=> start!35620 tp!27609))

(declare-fun array_inv!6874 (array!19713) Bool)

(assert (=> start!35620 (array_inv!6874 _keys!1456)))

(declare-fun e!218857 () Bool)

(declare-fun array_inv!6875 (array!19715) Bool)

(assert (=> start!35620 (and (array_inv!6875 _values!1208) e!218857)))

(declare-fun b!357435 () Bool)

(assert (=> b!357435 (= e!218857 (and e!218860 mapRes!13617))))

(declare-fun condMapEmpty!13617 () Bool)

(declare-fun mapDefault!13617 () ValueCell!3693)

(assert (=> b!357435 (= condMapEmpty!13617 (= (arr!9351 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3693)) mapDefault!13617)))))

(assert (= (and start!35620 res!198507) b!357436))

(assert (= (and b!357436 res!198513) b!357442))

(assert (= (and b!357442 res!198510) b!357440))

(assert (= (and b!357440 res!198511) b!357431))

(assert (= (and b!357431 res!198506) b!357433))

(assert (= (and b!357433 res!198509) b!357432))

(assert (= (and b!357432 res!198512) b!357437))

(assert (= (and b!357437 res!198508) b!357434))

(assert (= (and b!357434 (not res!198514)) b!357439))

(assert (= (and b!357435 condMapEmpty!13617) mapIsEmpty!13617))

(assert (= (and b!357435 (not condMapEmpty!13617)) mapNonEmpty!13617))

(get-info :version)

(assert (= (and mapNonEmpty!13617 ((_ is ValueCellFull!3693) mapValue!13617)) b!357441))

(assert (= (and b!357435 ((_ is ValueCellFull!3693) mapDefault!13617)) b!357438))

(assert (= start!35620 b!357435))

(declare-fun m!355511 () Bool)

(assert (=> b!357439 m!355511))

(assert (=> b!357439 m!355511))

(declare-fun m!355513 () Bool)

(assert (=> b!357439 m!355513))

(declare-fun m!355515 () Bool)

(assert (=> b!357439 m!355515))

(declare-fun m!355517 () Bool)

(assert (=> b!357442 m!355517))

(declare-fun m!355519 () Bool)

(assert (=> b!357434 m!355519))

(declare-fun m!355521 () Bool)

(assert (=> b!357434 m!355521))

(declare-fun m!355523 () Bool)

(assert (=> mapNonEmpty!13617 m!355523))

(declare-fun m!355525 () Bool)

(assert (=> b!357432 m!355525))

(declare-fun m!355527 () Bool)

(assert (=> b!357431 m!355527))

(declare-fun m!355529 () Bool)

(assert (=> b!357437 m!355529))

(declare-fun m!355531 () Bool)

(assert (=> start!35620 m!355531))

(declare-fun m!355533 () Bool)

(assert (=> start!35620 m!355533))

(declare-fun m!355535 () Bool)

(assert (=> start!35620 m!355535))

(declare-fun m!355537 () Bool)

(assert (=> b!357440 m!355537))

(check-sat b_and!15117 (not b!357434) (not b!357439) (not b!357432) (not b_next!7875) tp_is_empty!8073 (not start!35620) (not b!357431) (not mapNonEmpty!13617) (not b!357442) (not b!357440))
(check-sat b_and!15117 (not b_next!7875))
