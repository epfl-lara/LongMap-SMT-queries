; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35628 () Bool)

(assert start!35628)

(declare-fun b_free!7897 () Bool)

(declare-fun b_next!7897 () Bool)

(assert (=> start!35628 (= b_free!7897 (not b_next!7897))))

(declare-fun tp!27674 () Bool)

(declare-fun b_and!15113 () Bool)

(assert (=> start!35628 (= tp!27674 b_and!15113)))

(declare-fun b!357552 () Bool)

(declare-fun res!198677 () Bool)

(declare-fun e!218880 () Bool)

(assert (=> b!357552 (=> (not res!198677) (not e!218880))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-datatypes ((array!19741 0))(
  ( (array!19742 (arr!9364 (Array (_ BitVec 32) (_ BitVec 64))) (size!9717 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19741)

(assert (=> b!357552 (= res!198677 (not (= (select (arr!9364 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!357553 () Bool)

(declare-fun e!218878 () Bool)

(declare-fun tp_is_empty!8095 () Bool)

(assert (=> b!357553 (= e!218878 tp_is_empty!8095)))

(declare-fun mapIsEmpty!13650 () Bool)

(declare-fun mapRes!13650 () Bool)

(assert (=> mapIsEmpty!13650 mapRes!13650))

(declare-fun b!357555 () Bool)

(declare-fun res!198682 () Bool)

(assert (=> b!357555 (=> (not res!198682) (not e!218880))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((V!11771 0))(
  ( (V!11772 (val!4092 Int)) )
))
(declare-datatypes ((ValueCell!3704 0))(
  ( (ValueCellFull!3704 (v!6280 V!11771)) (EmptyCell!3704) )
))
(declare-datatypes ((array!19743 0))(
  ( (array!19744 (arr!9365 (Array (_ BitVec 32) ValueCell!3704)) (size!9718 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19743)

(assert (=> b!357555 (= res!198682 (and (= (size!9718 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9717 _keys!1456) (size!9718 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!357556 () Bool)

(declare-fun e!218881 () Bool)

(assert (=> b!357556 (= e!218881 true)))

(declare-fun minValue!1150 () V!11771)

(declare-fun defaultEntry!1216 () Int)

(declare-fun zeroValue!1150 () V!11771)

(declare-datatypes ((tuple2!5688 0))(
  ( (tuple2!5689 (_1!2855 (_ BitVec 64)) (_2!2855 V!11771)) )
))
(declare-datatypes ((List!5374 0))(
  ( (Nil!5371) (Cons!5370 (h!6226 tuple2!5688) (t!10515 List!5374)) )
))
(declare-datatypes ((ListLongMap!4591 0))(
  ( (ListLongMap!4592 (toList!2311 List!5374)) )
))
(declare-fun contains!2401 (ListLongMap!4591 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1816 (array!19741 array!19743 (_ BitVec 32) (_ BitVec 32) V!11771 V!11771 (_ BitVec 32) Int) ListLongMap!4591)

(assert (=> b!357556 (contains!2401 (getCurrentListMap!1816 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) k0!1077)))

(declare-datatypes ((Unit!11014 0))(
  ( (Unit!11015) )
))
(declare-fun lt!165870 () Unit!11014)

(declare-fun lemmaArrayContainsKeyThenInListMap!349 (array!19741 array!19743 (_ BitVec 32) (_ BitVec 32) V!11771 V!11771 (_ BitVec 64) (_ BitVec 32) Int) Unit!11014)

(assert (=> b!357556 (= lt!165870 (lemmaArrayContainsKeyThenInListMap!349 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805) defaultEntry!1216))))

(declare-fun b!357557 () Bool)

(declare-fun e!218879 () Bool)

(assert (=> b!357557 (= e!218879 tp_is_empty!8095)))

(declare-fun b!357558 () Bool)

(declare-fun res!198675 () Bool)

(assert (=> b!357558 (=> (not res!198675) (not e!218880))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19741 (_ BitVec 32)) Bool)

(assert (=> b!357558 (= res!198675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapNonEmpty!13650 () Bool)

(declare-fun tp!27675 () Bool)

(assert (=> mapNonEmpty!13650 (= mapRes!13650 (and tp!27675 e!218879))))

(declare-fun mapRest!13650 () (Array (_ BitVec 32) ValueCell!3704))

(declare-fun mapKey!13650 () (_ BitVec 32))

(declare-fun mapValue!13650 () ValueCell!3704)

(assert (=> mapNonEmpty!13650 (= (arr!9365 _values!1208) (store mapRest!13650 mapKey!13650 mapValue!13650))))

(declare-fun res!198676 () Bool)

(assert (=> start!35628 (=> (not res!198676) (not e!218880))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35628 (= res!198676 (validMask!0 mask!1842))))

(assert (=> start!35628 e!218880))

(assert (=> start!35628 tp_is_empty!8095))

(assert (=> start!35628 true))

(assert (=> start!35628 tp!27674))

(declare-fun array_inv!6908 (array!19741) Bool)

(assert (=> start!35628 (array_inv!6908 _keys!1456)))

(declare-fun e!218882 () Bool)

(declare-fun array_inv!6909 (array!19743) Bool)

(assert (=> start!35628 (and (array_inv!6909 _values!1208) e!218882)))

(declare-fun b!357554 () Bool)

(declare-fun res!198680 () Bool)

(assert (=> b!357554 (=> (not res!198680) (not e!218880))))

(declare-fun arrayContainsKey!0 (array!19741 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357554 (= res!198680 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!357559 () Bool)

(declare-fun res!198681 () Bool)

(assert (=> b!357559 (=> (not res!198681) (not e!218880))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357559 (= res!198681 (validKeyInArray!0 k0!1077))))

(declare-fun b!357560 () Bool)

(declare-fun res!198679 () Bool)

(assert (=> b!357560 (=> (not res!198679) (not e!218880))))

(declare-datatypes ((List!5375 0))(
  ( (Nil!5372) (Cons!5371 (h!6227 (_ BitVec 64)) (t!10516 List!5375)) )
))
(declare-fun arrayNoDuplicates!0 (array!19741 (_ BitVec 32) List!5375) Bool)

(assert (=> b!357560 (= res!198679 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5372))))

(declare-fun b!357561 () Bool)

(declare-fun res!198674 () Bool)

(assert (=> b!357561 (=> (not res!198674) (not e!218880))))

(assert (=> b!357561 (= res!198674 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9717 _keys!1456))))))

(declare-fun b!357562 () Bool)

(assert (=> b!357562 (= e!218880 (not e!218881))))

(declare-fun res!198678 () Bool)

(assert (=> b!357562 (=> res!198678 e!218881)))

(assert (=> b!357562 (= res!198678 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9717 _keys!1456))))))

(assert (=> b!357562 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun lt!165871 () Unit!11014)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!34 (array!19741 array!19743 (_ BitVec 32) (_ BitVec 32) V!11771 V!11771 (_ BitVec 64) (_ BitVec 32)) Unit!11014)

(assert (=> b!357562 (= lt!165871 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!34 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!357563 () Bool)

(assert (=> b!357563 (= e!218882 (and e!218878 mapRes!13650))))

(declare-fun condMapEmpty!13650 () Bool)

(declare-fun mapDefault!13650 () ValueCell!3704)

(assert (=> b!357563 (= condMapEmpty!13650 (= (arr!9365 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3704)) mapDefault!13650)))))

(assert (= (and start!35628 res!198676) b!357555))

(assert (= (and b!357555 res!198682) b!357558))

(assert (= (and b!357558 res!198675) b!357560))

(assert (= (and b!357560 res!198679) b!357559))

(assert (= (and b!357559 res!198681) b!357561))

(assert (= (and b!357561 res!198674) b!357554))

(assert (= (and b!357554 res!198680) b!357552))

(assert (= (and b!357552 res!198677) b!357562))

(assert (= (and b!357562 (not res!198678)) b!357556))

(assert (= (and b!357563 condMapEmpty!13650) mapIsEmpty!13650))

(assert (= (and b!357563 (not condMapEmpty!13650)) mapNonEmpty!13650))

(get-info :version)

(assert (= (and mapNonEmpty!13650 ((_ is ValueCellFull!3704) mapValue!13650)) b!357557))

(assert (= (and b!357563 ((_ is ValueCellFull!3704) mapDefault!13650)) b!357553))

(assert (= start!35628 b!357563))

(declare-fun m!355089 () Bool)

(assert (=> start!35628 m!355089))

(declare-fun m!355091 () Bool)

(assert (=> start!35628 m!355091))

(declare-fun m!355093 () Bool)

(assert (=> start!35628 m!355093))

(declare-fun m!355095 () Bool)

(assert (=> b!357552 m!355095))

(declare-fun m!355097 () Bool)

(assert (=> mapNonEmpty!13650 m!355097))

(declare-fun m!355099 () Bool)

(assert (=> b!357562 m!355099))

(declare-fun m!355101 () Bool)

(assert (=> b!357562 m!355101))

(declare-fun m!355103 () Bool)

(assert (=> b!357554 m!355103))

(declare-fun m!355105 () Bool)

(assert (=> b!357560 m!355105))

(declare-fun m!355107 () Bool)

(assert (=> b!357556 m!355107))

(assert (=> b!357556 m!355107))

(declare-fun m!355109 () Bool)

(assert (=> b!357556 m!355109))

(declare-fun m!355111 () Bool)

(assert (=> b!357556 m!355111))

(declare-fun m!355113 () Bool)

(assert (=> b!357558 m!355113))

(declare-fun m!355115 () Bool)

(assert (=> b!357559 m!355115))

(check-sat (not b_next!7897) (not b!357559) (not b!357560) (not b!357556) (not b!357558) (not start!35628) (not mapNonEmpty!13650) (not b!357554) tp_is_empty!8095 (not b!357562) b_and!15113)
(check-sat b_and!15113 (not b_next!7897))
