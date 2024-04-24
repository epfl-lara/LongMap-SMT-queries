; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35628 () Bool)

(assert start!35628)

(declare-fun b_free!7897 () Bool)

(declare-fun b_next!7897 () Bool)

(assert (=> start!35628 (= b_free!7897 (not b_next!7897))))

(declare-fun tp!27674 () Bool)

(declare-fun b_and!15153 () Bool)

(assert (=> start!35628 (= tp!27674 b_and!15153)))

(declare-fun b!357774 () Bool)

(declare-fun e!219023 () Bool)

(declare-fun tp_is_empty!8095 () Bool)

(assert (=> b!357774 (= e!219023 tp_is_empty!8095)))

(declare-fun mapIsEmpty!13650 () Bool)

(declare-fun mapRes!13650 () Bool)

(assert (=> mapIsEmpty!13650 mapRes!13650))

(declare-fun b!357775 () Bool)

(declare-fun e!219022 () Bool)

(assert (=> b!357775 (= e!219022 true)))

(declare-datatypes ((V!11771 0))(
  ( (V!11772 (val!4092 Int)) )
))
(declare-fun minValue!1150 () V!11771)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun defaultEntry!1216 () Int)

(declare-datatypes ((array!19740 0))(
  ( (array!19741 (arr!9363 (Array (_ BitVec 32) (_ BitVec 64))) (size!9715 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19740)

(declare-fun k0!1077 () (_ BitVec 64))

(declare-datatypes ((ValueCell!3704 0))(
  ( (ValueCellFull!3704 (v!6287 V!11771)) (EmptyCell!3704) )
))
(declare-datatypes ((array!19742 0))(
  ( (array!19743 (arr!9364 (Array (_ BitVec 32) ValueCell!3704)) (size!9716 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19742)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11771)

(declare-datatypes ((tuple2!5632 0))(
  ( (tuple2!5633 (_1!2827 (_ BitVec 64)) (_2!2827 V!11771)) )
))
(declare-datatypes ((List!5315 0))(
  ( (Nil!5312) (Cons!5311 (h!6167 tuple2!5632) (t!10457 List!5315)) )
))
(declare-datatypes ((ListLongMap!4547 0))(
  ( (ListLongMap!4548 (toList!2289 List!5315)) )
))
(declare-fun contains!2388 (ListLongMap!4547 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1817 (array!19740 array!19742 (_ BitVec 32) (_ BitVec 32) V!11771 V!11771 (_ BitVec 32) Int) ListLongMap!4547)

(assert (=> b!357775 (contains!2388 (getCurrentListMap!1817 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) k0!1077)))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((Unit!11015 0))(
  ( (Unit!11016) )
))
(declare-fun lt!166124 () Unit!11015)

(declare-fun lemmaArrayContainsKeyThenInListMap!356 (array!19740 array!19742 (_ BitVec 32) (_ BitVec 32) V!11771 V!11771 (_ BitVec 64) (_ BitVec 32) Int) Unit!11015)

(assert (=> b!357775 (= lt!166124 (lemmaArrayContainsKeyThenInListMap!356 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805) defaultEntry!1216))))

(declare-fun b!357776 () Bool)

(declare-fun res!198805 () Bool)

(declare-fun e!219020 () Bool)

(assert (=> b!357776 (=> (not res!198805) (not e!219020))))

(declare-datatypes ((List!5316 0))(
  ( (Nil!5313) (Cons!5312 (h!6168 (_ BitVec 64)) (t!10458 List!5316)) )
))
(declare-fun arrayNoDuplicates!0 (array!19740 (_ BitVec 32) List!5316) Bool)

(assert (=> b!357776 (= res!198805 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5313))))

(declare-fun b!357777 () Bool)

(declare-fun res!198802 () Bool)

(assert (=> b!357777 (=> (not res!198802) (not e!219020))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19740 (_ BitVec 32)) Bool)

(assert (=> b!357777 (= res!198802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!357778 () Bool)

(assert (=> b!357778 (= e!219020 (not e!219022))))

(declare-fun res!198801 () Bool)

(assert (=> b!357778 (=> res!198801 e!219022)))

(assert (=> b!357778 (= res!198801 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9715 _keys!1456))))))

(declare-fun arrayContainsKey!0 (array!19740 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357778 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun lt!166123 () Unit!11015)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!35 (array!19740 array!19742 (_ BitVec 32) (_ BitVec 32) V!11771 V!11771 (_ BitVec 64) (_ BitVec 32)) Unit!11015)

(assert (=> b!357778 (= lt!166123 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!35 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!357779 () Bool)

(declare-fun res!198800 () Bool)

(assert (=> b!357779 (=> (not res!198800) (not e!219020))))

(assert (=> b!357779 (= res!198800 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9715 _keys!1456))))))

(declare-fun b!357780 () Bool)

(declare-fun res!198806 () Bool)

(assert (=> b!357780 (=> (not res!198806) (not e!219020))))

(assert (=> b!357780 (= res!198806 (not (= (select (arr!9363 _keys!1456) from!1805) k0!1077)))))

(declare-fun res!198804 () Bool)

(assert (=> start!35628 (=> (not res!198804) (not e!219020))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35628 (= res!198804 (validMask!0 mask!1842))))

(assert (=> start!35628 e!219020))

(assert (=> start!35628 tp_is_empty!8095))

(assert (=> start!35628 true))

(assert (=> start!35628 tp!27674))

(declare-fun array_inv!6918 (array!19740) Bool)

(assert (=> start!35628 (array_inv!6918 _keys!1456)))

(declare-fun e!219025 () Bool)

(declare-fun array_inv!6919 (array!19742) Bool)

(assert (=> start!35628 (and (array_inv!6919 _values!1208) e!219025)))

(declare-fun b!357781 () Bool)

(declare-fun res!198803 () Bool)

(assert (=> b!357781 (=> (not res!198803) (not e!219020))))

(assert (=> b!357781 (= res!198803 (and (= (size!9716 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9715 _keys!1456) (size!9716 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!357782 () Bool)

(assert (=> b!357782 (= e!219025 (and e!219023 mapRes!13650))))

(declare-fun condMapEmpty!13650 () Bool)

(declare-fun mapDefault!13650 () ValueCell!3704)

(assert (=> b!357782 (= condMapEmpty!13650 (= (arr!9364 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3704)) mapDefault!13650)))))

(declare-fun b!357783 () Bool)

(declare-fun res!198807 () Bool)

(assert (=> b!357783 (=> (not res!198807) (not e!219020))))

(assert (=> b!357783 (= res!198807 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!357784 () Bool)

(declare-fun res!198808 () Bool)

(assert (=> b!357784 (=> (not res!198808) (not e!219020))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357784 (= res!198808 (validKeyInArray!0 k0!1077))))

(declare-fun mapNonEmpty!13650 () Bool)

(declare-fun tp!27675 () Bool)

(declare-fun e!219024 () Bool)

(assert (=> mapNonEmpty!13650 (= mapRes!13650 (and tp!27675 e!219024))))

(declare-fun mapValue!13650 () ValueCell!3704)

(declare-fun mapKey!13650 () (_ BitVec 32))

(declare-fun mapRest!13650 () (Array (_ BitVec 32) ValueCell!3704))

(assert (=> mapNonEmpty!13650 (= (arr!9364 _values!1208) (store mapRest!13650 mapKey!13650 mapValue!13650))))

(declare-fun b!357785 () Bool)

(assert (=> b!357785 (= e!219024 tp_is_empty!8095)))

(assert (= (and start!35628 res!198804) b!357781))

(assert (= (and b!357781 res!198803) b!357777))

(assert (= (and b!357777 res!198802) b!357776))

(assert (= (and b!357776 res!198805) b!357784))

(assert (= (and b!357784 res!198808) b!357779))

(assert (= (and b!357779 res!198800) b!357783))

(assert (= (and b!357783 res!198807) b!357780))

(assert (= (and b!357780 res!198806) b!357778))

(assert (= (and b!357778 (not res!198801)) b!357775))

(assert (= (and b!357782 condMapEmpty!13650) mapIsEmpty!13650))

(assert (= (and b!357782 (not condMapEmpty!13650)) mapNonEmpty!13650))

(get-info :version)

(assert (= (and mapNonEmpty!13650 ((_ is ValueCellFull!3704) mapValue!13650)) b!357785))

(assert (= (and b!357782 ((_ is ValueCellFull!3704) mapDefault!13650)) b!357774))

(assert (= start!35628 b!357782))

(declare-fun m!356043 () Bool)

(assert (=> b!357776 m!356043))

(declare-fun m!356045 () Bool)

(assert (=> b!357783 m!356045))

(declare-fun m!356047 () Bool)

(assert (=> b!357777 m!356047))

(declare-fun m!356049 () Bool)

(assert (=> b!357784 m!356049))

(declare-fun m!356051 () Bool)

(assert (=> b!357780 m!356051))

(declare-fun m!356053 () Bool)

(assert (=> b!357778 m!356053))

(declare-fun m!356055 () Bool)

(assert (=> b!357778 m!356055))

(declare-fun m!356057 () Bool)

(assert (=> b!357775 m!356057))

(assert (=> b!357775 m!356057))

(declare-fun m!356059 () Bool)

(assert (=> b!357775 m!356059))

(declare-fun m!356061 () Bool)

(assert (=> b!357775 m!356061))

(declare-fun m!356063 () Bool)

(assert (=> start!35628 m!356063))

(declare-fun m!356065 () Bool)

(assert (=> start!35628 m!356065))

(declare-fun m!356067 () Bool)

(assert (=> start!35628 m!356067))

(declare-fun m!356069 () Bool)

(assert (=> mapNonEmpty!13650 m!356069))

(check-sat b_and!15153 (not start!35628) (not b_next!7897) (not b!357775) (not b!357777) (not b!357776) (not mapNonEmpty!13650) tp_is_empty!8095 (not b!357783) (not b!357784) (not b!357778))
(check-sat b_and!15153 (not b_next!7897))
