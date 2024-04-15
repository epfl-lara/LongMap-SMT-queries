; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82250 () Bool)

(assert start!82250)

(declare-fun b_free!18541 () Bool)

(declare-fun b_next!18541 () Bool)

(assert (=> start!82250 (= b_free!18541 (not b_next!18541))))

(declare-fun tp!64585 () Bool)

(declare-fun b_and!30003 () Bool)

(assert (=> start!82250 (= tp!64585 b_and!30003)))

(declare-fun b!958763 () Bool)

(declare-fun e!540479 () Bool)

(declare-fun e!540480 () Bool)

(declare-fun mapRes!33850 () Bool)

(assert (=> b!958763 (= e!540479 (and e!540480 mapRes!33850))))

(declare-fun condMapEmpty!33850 () Bool)

(declare-datatypes ((V!33313 0))(
  ( (V!33314 (val!10674 Int)) )
))
(declare-datatypes ((ValueCell!10142 0))(
  ( (ValueCellFull!10142 (v!13230 V!33313)) (EmptyCell!10142) )
))
(declare-datatypes ((array!58524 0))(
  ( (array!58525 (arr!28136 (Array (_ BitVec 32) ValueCell!10142)) (size!28617 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58524)

(declare-fun mapDefault!33850 () ValueCell!10142)

(assert (=> b!958763 (= condMapEmpty!33850 (= (arr!28136 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10142)) mapDefault!33850)))))

(declare-fun b!958764 () Bool)

(declare-fun res!641821 () Bool)

(declare-fun e!540481 () Bool)

(assert (=> b!958764 (=> (not res!641821) (not e!540481))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58526 0))(
  ( (array!58527 (arr!28137 (Array (_ BitVec 32) (_ BitVec 64))) (size!28618 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58526)

(assert (=> b!958764 (= res!641821 (and (= (size!28617 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28618 _keys!1668) (size!28617 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!958765 () Bool)

(declare-fun res!641823 () Bool)

(assert (=> b!958765 (=> (not res!641823) (not e!540481))))

(declare-fun minValue!1328 () V!33313)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33313)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13812 0))(
  ( (tuple2!13813 (_1!6917 (_ BitVec 64)) (_2!6917 V!33313)) )
))
(declare-datatypes ((List!19595 0))(
  ( (Nil!19592) (Cons!19591 (h!20753 tuple2!13812) (t!27949 List!19595)) )
))
(declare-datatypes ((ListLongMap!12499 0))(
  ( (ListLongMap!12500 (toList!6265 List!19595)) )
))
(declare-fun contains!5311 (ListLongMap!12499 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3427 (array!58526 array!58524 (_ BitVec 32) (_ BitVec 32) V!33313 V!33313 (_ BitVec 32) Int) ListLongMap!12499)

(assert (=> b!958765 (= res!641823 (contains!5311 (getCurrentListMap!3427 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28137 _keys!1668) i!793)))))

(declare-fun b!958766 () Bool)

(declare-fun e!540482 () Bool)

(declare-fun tp_is_empty!21247 () Bool)

(assert (=> b!958766 (= e!540482 tp_is_empty!21247)))

(declare-fun b!958767 () Bool)

(assert (=> b!958767 (= e!540480 tp_is_empty!21247)))

(declare-fun b!958768 () Bool)

(declare-fun res!641820 () Bool)

(assert (=> b!958768 (=> (not res!641820) (not e!540481))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58526 (_ BitVec 32)) Bool)

(assert (=> b!958768 (= res!641820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun mapNonEmpty!33850 () Bool)

(declare-fun tp!64584 () Bool)

(assert (=> mapNonEmpty!33850 (= mapRes!33850 (and tp!64584 e!540482))))

(declare-fun mapValue!33850 () ValueCell!10142)

(declare-fun mapRest!33850 () (Array (_ BitVec 32) ValueCell!10142))

(declare-fun mapKey!33850 () (_ BitVec 32))

(assert (=> mapNonEmpty!33850 (= (arr!28136 _values!1386) (store mapRest!33850 mapKey!33850 mapValue!33850))))

(declare-fun mapIsEmpty!33850 () Bool)

(assert (=> mapIsEmpty!33850 mapRes!33850))

(declare-fun res!641817 () Bool)

(assert (=> start!82250 (=> (not res!641817) (not e!540481))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82250 (= res!641817 (validMask!0 mask!2088))))

(assert (=> start!82250 e!540481))

(assert (=> start!82250 true))

(assert (=> start!82250 tp_is_empty!21247))

(declare-fun array_inv!21875 (array!58526) Bool)

(assert (=> start!82250 (array_inv!21875 _keys!1668)))

(declare-fun array_inv!21876 (array!58524) Bool)

(assert (=> start!82250 (and (array_inv!21876 _values!1386) e!540479)))

(assert (=> start!82250 tp!64585))

(declare-fun b!958769 () Bool)

(declare-fun res!641818 () Bool)

(assert (=> b!958769 (=> (not res!641818) (not e!540481))))

(declare-datatypes ((List!19596 0))(
  ( (Nil!19593) (Cons!19592 (h!20754 (_ BitVec 64)) (t!27950 List!19596)) )
))
(declare-fun arrayNoDuplicates!0 (array!58526 (_ BitVec 32) List!19596) Bool)

(assert (=> b!958769 (= res!641818 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19593))))

(declare-fun b!958770 () Bool)

(declare-fun res!641822 () Bool)

(assert (=> b!958770 (=> (not res!641822) (not e!540481))))

(assert (=> b!958770 (= res!641822 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28618 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28618 _keys!1668))))))

(declare-fun b!958771 () Bool)

(declare-fun res!641819 () Bool)

(assert (=> b!958771 (=> (not res!641819) (not e!540481))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958771 (= res!641819 (validKeyInArray!0 (select (arr!28137 _keys!1668) i!793)))))

(declare-fun b!958772 () Bool)

(assert (=> b!958772 (= e!540481 (not true))))

(assert (=> b!958772 (contains!5311 (getCurrentListMap!3427 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28137 _keys!1668) i!793))))

(declare-datatypes ((Unit!32028 0))(
  ( (Unit!32029) )
))
(declare-fun lt!430267 () Unit!32028)

(declare-fun lemmaInListMapFromThenInFromSmaller!5 (array!58526 array!58524 (_ BitVec 32) (_ BitVec 32) V!33313 V!33313 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32028)

(assert (=> b!958772 (= lt!430267 (lemmaInListMapFromThenInFromSmaller!5 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(assert (= (and start!82250 res!641817) b!958764))

(assert (= (and b!958764 res!641821) b!958768))

(assert (= (and b!958768 res!641820) b!958769))

(assert (= (and b!958769 res!641818) b!958770))

(assert (= (and b!958770 res!641822) b!958771))

(assert (= (and b!958771 res!641819) b!958765))

(assert (= (and b!958765 res!641823) b!958772))

(assert (= (and b!958763 condMapEmpty!33850) mapIsEmpty!33850))

(assert (= (and b!958763 (not condMapEmpty!33850)) mapNonEmpty!33850))

(get-info :version)

(assert (= (and mapNonEmpty!33850 ((_ is ValueCellFull!10142) mapValue!33850)) b!958766))

(assert (= (and b!958763 ((_ is ValueCellFull!10142) mapDefault!33850)) b!958767))

(assert (= start!82250 b!958763))

(declare-fun m!888795 () Bool)

(assert (=> b!958769 m!888795))

(declare-fun m!888797 () Bool)

(assert (=> b!958772 m!888797))

(declare-fun m!888799 () Bool)

(assert (=> b!958772 m!888799))

(assert (=> b!958772 m!888797))

(assert (=> b!958772 m!888799))

(declare-fun m!888801 () Bool)

(assert (=> b!958772 m!888801))

(declare-fun m!888803 () Bool)

(assert (=> b!958772 m!888803))

(declare-fun m!888805 () Bool)

(assert (=> b!958768 m!888805))

(declare-fun m!888807 () Bool)

(assert (=> b!958765 m!888807))

(assert (=> b!958765 m!888799))

(assert (=> b!958765 m!888807))

(assert (=> b!958765 m!888799))

(declare-fun m!888809 () Bool)

(assert (=> b!958765 m!888809))

(assert (=> b!958771 m!888799))

(assert (=> b!958771 m!888799))

(declare-fun m!888811 () Bool)

(assert (=> b!958771 m!888811))

(declare-fun m!888813 () Bool)

(assert (=> mapNonEmpty!33850 m!888813))

(declare-fun m!888815 () Bool)

(assert (=> start!82250 m!888815))

(declare-fun m!888817 () Bool)

(assert (=> start!82250 m!888817))

(declare-fun m!888819 () Bool)

(assert (=> start!82250 m!888819))

(check-sat (not mapNonEmpty!33850) (not start!82250) (not b!958765) b_and!30003 (not b!958769) (not b_next!18541) (not b!958771) (not b!958768) (not b!958772) tp_is_empty!21247)
(check-sat b_and!30003 (not b_next!18541))
