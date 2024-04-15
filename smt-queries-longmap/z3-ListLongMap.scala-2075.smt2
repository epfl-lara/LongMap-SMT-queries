; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35604 () Bool)

(assert start!35604)

(declare-fun b_free!7873 () Bool)

(declare-fun b_next!7873 () Bool)

(assert (=> start!35604 (= b_free!7873 (not b_next!7873))))

(declare-fun tp!27602 () Bool)

(declare-fun b_and!15089 () Bool)

(assert (=> start!35604 (= tp!27602 b_and!15089)))

(declare-fun res!198350 () Bool)

(declare-fun e!218663 () Bool)

(assert (=> start!35604 (=> (not res!198350) (not e!218663))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35604 (= res!198350 (validMask!0 mask!1842))))

(assert (=> start!35604 e!218663))

(declare-fun tp_is_empty!8071 () Bool)

(assert (=> start!35604 tp_is_empty!8071))

(assert (=> start!35604 true))

(assert (=> start!35604 tp!27602))

(declare-datatypes ((array!19697 0))(
  ( (array!19698 (arr!9342 (Array (_ BitVec 32) (_ BitVec 64))) (size!9695 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19697)

(declare-fun array_inv!6898 (array!19697) Bool)

(assert (=> start!35604 (array_inv!6898 _keys!1456)))

(declare-datatypes ((V!11739 0))(
  ( (V!11740 (val!4080 Int)) )
))
(declare-datatypes ((ValueCell!3692 0))(
  ( (ValueCellFull!3692 (v!6268 V!11739)) (EmptyCell!3692) )
))
(declare-datatypes ((array!19699 0))(
  ( (array!19700 (arr!9343 (Array (_ BitVec 32) ValueCell!3692)) (size!9696 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19699)

(declare-fun e!218664 () Bool)

(declare-fun array_inv!6899 (array!19699) Bool)

(assert (=> start!35604 (and (array_inv!6899 _values!1208) e!218664)))

(declare-fun b!357120 () Bool)

(declare-fun e!218667 () Bool)

(assert (=> b!357120 (= e!218667 tp_is_empty!8071)))

(declare-fun mapIsEmpty!13614 () Bool)

(declare-fun mapRes!13614 () Bool)

(assert (=> mapIsEmpty!13614 mapRes!13614))

(declare-fun b!357121 () Bool)

(declare-fun e!218662 () Bool)

(assert (=> b!357121 (= e!218662 tp_is_empty!8071)))

(declare-fun b!357122 () Bool)

(assert (=> b!357122 (= e!218664 (and e!218662 mapRes!13614))))

(declare-fun condMapEmpty!13614 () Bool)

(declare-fun mapDefault!13614 () ValueCell!3692)

(assert (=> b!357122 (= condMapEmpty!13614 (= (arr!9343 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3692)) mapDefault!13614)))))

(declare-fun b!357123 () Bool)

(declare-fun res!198355 () Bool)

(assert (=> b!357123 (=> (not res!198355) (not e!218663))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19697 (_ BitVec 32)) Bool)

(assert (=> b!357123 (= res!198355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!357124 () Bool)

(declare-fun res!198356 () Bool)

(assert (=> b!357124 (=> (not res!198356) (not e!218663))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(assert (=> b!357124 (= res!198356 (not (= (select (arr!9342 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!357125 () Bool)

(declare-fun e!218666 () Bool)

(assert (=> b!357125 (= e!218663 (not e!218666))))

(declare-fun res!198352 () Bool)

(assert (=> b!357125 (=> res!198352 e!218666)))

(assert (=> b!357125 (= res!198352 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9695 _keys!1456))))))

(declare-fun arrayContainsKey!0 (array!19697 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357125 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11739)

(declare-fun minValue!1150 () V!11739)

(declare-datatypes ((Unit!10998 0))(
  ( (Unit!10999) )
))
(declare-fun lt!165799 () Unit!10998)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!26 (array!19697 array!19699 (_ BitVec 32) (_ BitVec 32) V!11739 V!11739 (_ BitVec 64) (_ BitVec 32)) Unit!10998)

(assert (=> b!357125 (= lt!165799 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!26 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!357126 () Bool)

(declare-fun res!198353 () Bool)

(assert (=> b!357126 (=> (not res!198353) (not e!218663))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357126 (= res!198353 (validKeyInArray!0 k0!1077))))

(declare-fun b!357127 () Bool)

(declare-fun res!198354 () Bool)

(assert (=> b!357127 (=> (not res!198354) (not e!218663))))

(assert (=> b!357127 (= res!198354 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!357128 () Bool)

(declare-fun res!198351 () Bool)

(assert (=> b!357128 (=> (not res!198351) (not e!218663))))

(declare-datatypes ((List!5358 0))(
  ( (Nil!5355) (Cons!5354 (h!6210 (_ BitVec 64)) (t!10499 List!5358)) )
))
(declare-fun arrayNoDuplicates!0 (array!19697 (_ BitVec 32) List!5358) Bool)

(assert (=> b!357128 (= res!198351 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5355))))

(declare-fun mapNonEmpty!13614 () Bool)

(declare-fun tp!27603 () Bool)

(assert (=> mapNonEmpty!13614 (= mapRes!13614 (and tp!27603 e!218667))))

(declare-fun mapRest!13614 () (Array (_ BitVec 32) ValueCell!3692))

(declare-fun mapKey!13614 () (_ BitVec 32))

(declare-fun mapValue!13614 () ValueCell!3692)

(assert (=> mapNonEmpty!13614 (= (arr!9343 _values!1208) (store mapRest!13614 mapKey!13614 mapValue!13614))))

(declare-fun b!357129 () Bool)

(assert (=> b!357129 (= e!218666 true)))

(declare-fun defaultEntry!1216 () Int)

(declare-datatypes ((tuple2!5674 0))(
  ( (tuple2!5675 (_1!2848 (_ BitVec 64)) (_2!2848 V!11739)) )
))
(declare-datatypes ((List!5359 0))(
  ( (Nil!5356) (Cons!5355 (h!6211 tuple2!5674) (t!10500 List!5359)) )
))
(declare-datatypes ((ListLongMap!4577 0))(
  ( (ListLongMap!4578 (toList!2304 List!5359)) )
))
(declare-fun contains!2394 (ListLongMap!4577 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1809 (array!19697 array!19699 (_ BitVec 32) (_ BitVec 32) V!11739 V!11739 (_ BitVec 32) Int) ListLongMap!4577)

(assert (=> b!357129 (contains!2394 (getCurrentListMap!1809 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) k0!1077)))

(declare-fun lt!165798 () Unit!10998)

(declare-fun lemmaArrayContainsKeyThenInListMap!342 (array!19697 array!19699 (_ BitVec 32) (_ BitVec 32) V!11739 V!11739 (_ BitVec 64) (_ BitVec 32) Int) Unit!10998)

(assert (=> b!357129 (= lt!165798 (lemmaArrayContainsKeyThenInListMap!342 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805) defaultEntry!1216))))

(declare-fun b!357130 () Bool)

(declare-fun res!198357 () Bool)

(assert (=> b!357130 (=> (not res!198357) (not e!218663))))

(assert (=> b!357130 (= res!198357 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9695 _keys!1456))))))

(declare-fun b!357131 () Bool)

(declare-fun res!198358 () Bool)

(assert (=> b!357131 (=> (not res!198358) (not e!218663))))

(assert (=> b!357131 (= res!198358 (and (= (size!9696 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9695 _keys!1456) (size!9696 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(assert (= (and start!35604 res!198350) b!357131))

(assert (= (and b!357131 res!198358) b!357123))

(assert (= (and b!357123 res!198355) b!357128))

(assert (= (and b!357128 res!198351) b!357126))

(assert (= (and b!357126 res!198353) b!357130))

(assert (= (and b!357130 res!198357) b!357127))

(assert (= (and b!357127 res!198354) b!357124))

(assert (= (and b!357124 res!198356) b!357125))

(assert (= (and b!357125 (not res!198352)) b!357129))

(assert (= (and b!357122 condMapEmpty!13614) mapIsEmpty!13614))

(assert (= (and b!357122 (not condMapEmpty!13614)) mapNonEmpty!13614))

(get-info :version)

(assert (= (and mapNonEmpty!13614 ((_ is ValueCellFull!3692) mapValue!13614)) b!357120))

(assert (= (and b!357122 ((_ is ValueCellFull!3692) mapDefault!13614)) b!357121))

(assert (= start!35604 b!357122))

(declare-fun m!354753 () Bool)

(assert (=> b!357126 m!354753))

(declare-fun m!354755 () Bool)

(assert (=> mapNonEmpty!13614 m!354755))

(declare-fun m!354757 () Bool)

(assert (=> b!357124 m!354757))

(declare-fun m!354759 () Bool)

(assert (=> b!357128 m!354759))

(declare-fun m!354761 () Bool)

(assert (=> b!357123 m!354761))

(declare-fun m!354763 () Bool)

(assert (=> b!357127 m!354763))

(declare-fun m!354765 () Bool)

(assert (=> start!35604 m!354765))

(declare-fun m!354767 () Bool)

(assert (=> start!35604 m!354767))

(declare-fun m!354769 () Bool)

(assert (=> start!35604 m!354769))

(declare-fun m!354771 () Bool)

(assert (=> b!357129 m!354771))

(assert (=> b!357129 m!354771))

(declare-fun m!354773 () Bool)

(assert (=> b!357129 m!354773))

(declare-fun m!354775 () Bool)

(assert (=> b!357129 m!354775))

(declare-fun m!354777 () Bool)

(assert (=> b!357125 m!354777))

(declare-fun m!354779 () Bool)

(assert (=> b!357125 m!354779))

(check-sat (not start!35604) (not b_next!7873) b_and!15089 (not b!357126) (not b!357125) (not mapNonEmpty!13614) tp_is_empty!8071 (not b!357129) (not b!357127) (not b!357128) (not b!357123))
(check-sat b_and!15089 (not b_next!7873))
