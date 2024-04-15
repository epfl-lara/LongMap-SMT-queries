; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82382 () Bool)

(assert start!82382)

(declare-fun b_free!18667 () Bool)

(declare-fun b_next!18667 () Bool)

(assert (=> start!82382 (= b_free!18667 (not b_next!18667))))

(declare-fun tp!64972 () Bool)

(declare-fun b_and!30129 () Bool)

(assert (=> start!82382 (= tp!64972 b_and!30129)))

(declare-fun b!960599 () Bool)

(declare-fun e!541468 () Bool)

(assert (=> b!960599 (= e!541468 (not true))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-datatypes ((V!33489 0))(
  ( (V!33490 (val!10740 Int)) )
))
(declare-fun minValue!1328 () V!33489)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58784 0))(
  ( (array!58785 (arr!28266 (Array (_ BitVec 32) (_ BitVec 64))) (size!28747 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58784)

(declare-datatypes ((ValueCell!10208 0))(
  ( (ValueCellFull!10208 (v!13296 V!33489)) (EmptyCell!10208) )
))
(declare-datatypes ((array!58786 0))(
  ( (array!58787 (arr!28267 (Array (_ BitVec 32) ValueCell!10208)) (size!28748 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58786)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33489)

(declare-fun i!793 () (_ BitVec 32))

(declare-datatypes ((tuple2!13908 0))(
  ( (tuple2!13909 (_1!6965 (_ BitVec 64)) (_2!6965 V!33489)) )
))
(declare-datatypes ((List!19691 0))(
  ( (Nil!19688) (Cons!19687 (h!20849 tuple2!13908) (t!28045 List!19691)) )
))
(declare-datatypes ((ListLongMap!12595 0))(
  ( (ListLongMap!12596 (toList!6313 List!19691)) )
))
(declare-fun contains!5356 (ListLongMap!12595 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3475 (array!58784 array!58786 (_ BitVec 32) (_ BitVec 32) V!33489 V!33489 (_ BitVec 32) Int) ListLongMap!12595)

(assert (=> b!960599 (contains!5356 (getCurrentListMap!3475 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28266 _keys!1668) i!793))))

(declare-datatypes ((Unit!32060 0))(
  ( (Unit!32061) )
))
(declare-fun lt!430456 () Unit!32060)

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun lemmaInListMapFromThenInFromSmaller!21 (array!58784 array!58786 (_ BitVec 32) (_ BitVec 32) V!33489 V!33489 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32060)

(assert (=> b!960599 (= lt!430456 (lemmaInListMapFromThenInFromSmaller!21 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun mapIsEmpty!34048 () Bool)

(declare-fun mapRes!34048 () Bool)

(assert (=> mapIsEmpty!34048 mapRes!34048))

(declare-fun b!960600 () Bool)

(declare-fun res!643063 () Bool)

(assert (=> b!960600 (=> (not res!643063) (not e!541468))))

(assert (=> b!960600 (= res!643063 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28747 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28747 _keys!1668))))))

(declare-fun b!960601 () Bool)

(declare-fun res!643059 () Bool)

(assert (=> b!960601 (=> (not res!643059) (not e!541468))))

(assert (=> b!960601 (= res!643059 (contains!5356 (getCurrentListMap!3475 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28266 _keys!1668) i!793)))))

(declare-fun b!960602 () Bool)

(declare-fun res!643060 () Bool)

(assert (=> b!960602 (=> (not res!643060) (not e!541468))))

(declare-datatypes ((List!19692 0))(
  ( (Nil!19689) (Cons!19688 (h!20850 (_ BitVec 64)) (t!28046 List!19692)) )
))
(declare-fun arrayNoDuplicates!0 (array!58784 (_ BitVec 32) List!19692) Bool)

(assert (=> b!960602 (= res!643060 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19689))))

(declare-fun res!643062 () Bool)

(assert (=> start!82382 (=> (not res!643062) (not e!541468))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82382 (= res!643062 (validMask!0 mask!2088))))

(assert (=> start!82382 e!541468))

(assert (=> start!82382 true))

(declare-fun tp_is_empty!21379 () Bool)

(assert (=> start!82382 tp_is_empty!21379))

(declare-fun array_inv!21961 (array!58784) Bool)

(assert (=> start!82382 (array_inv!21961 _keys!1668)))

(declare-fun e!541472 () Bool)

(declare-fun array_inv!21962 (array!58786) Bool)

(assert (=> start!82382 (and (array_inv!21962 _values!1386) e!541472)))

(assert (=> start!82382 tp!64972))

(declare-fun b!960603 () Bool)

(declare-fun res!643061 () Bool)

(assert (=> b!960603 (=> (not res!643061) (not e!541468))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58784 (_ BitVec 32)) Bool)

(assert (=> b!960603 (= res!643061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!960604 () Bool)

(declare-fun e!541470 () Bool)

(assert (=> b!960604 (= e!541470 tp_is_empty!21379)))

(declare-fun mapNonEmpty!34048 () Bool)

(declare-fun tp!64971 () Bool)

(assert (=> mapNonEmpty!34048 (= mapRes!34048 (and tp!64971 e!541470))))

(declare-fun mapValue!34048 () ValueCell!10208)

(declare-fun mapRest!34048 () (Array (_ BitVec 32) ValueCell!10208))

(declare-fun mapKey!34048 () (_ BitVec 32))

(assert (=> mapNonEmpty!34048 (= (arr!28267 _values!1386) (store mapRest!34048 mapKey!34048 mapValue!34048))))

(declare-fun b!960605 () Bool)

(declare-fun res!643064 () Bool)

(assert (=> b!960605 (=> (not res!643064) (not e!541468))))

(assert (=> b!960605 (= res!643064 (and (= (size!28748 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28747 _keys!1668) (size!28748 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!960606 () Bool)

(declare-fun e!541469 () Bool)

(assert (=> b!960606 (= e!541472 (and e!541469 mapRes!34048))))

(declare-fun condMapEmpty!34048 () Bool)

(declare-fun mapDefault!34048 () ValueCell!10208)

(assert (=> b!960606 (= condMapEmpty!34048 (= (arr!28267 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10208)) mapDefault!34048)))))

(declare-fun b!960607 () Bool)

(declare-fun res!643065 () Bool)

(assert (=> b!960607 (=> (not res!643065) (not e!541468))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960607 (= res!643065 (validKeyInArray!0 (select (arr!28266 _keys!1668) i!793)))))

(declare-fun b!960608 () Bool)

(assert (=> b!960608 (= e!541469 tp_is_empty!21379)))

(assert (= (and start!82382 res!643062) b!960605))

(assert (= (and b!960605 res!643064) b!960603))

(assert (= (and b!960603 res!643061) b!960602))

(assert (= (and b!960602 res!643060) b!960600))

(assert (= (and b!960600 res!643063) b!960607))

(assert (= (and b!960607 res!643065) b!960601))

(assert (= (and b!960601 res!643059) b!960599))

(assert (= (and b!960606 condMapEmpty!34048) mapIsEmpty!34048))

(assert (= (and b!960606 (not condMapEmpty!34048)) mapNonEmpty!34048))

(get-info :version)

(assert (= (and mapNonEmpty!34048 ((_ is ValueCellFull!10208) mapValue!34048)) b!960604))

(assert (= (and b!960606 ((_ is ValueCellFull!10208) mapDefault!34048)) b!960608))

(assert (= start!82382 b!960606))

(declare-fun m!890229 () Bool)

(assert (=> b!960599 m!890229))

(declare-fun m!890231 () Bool)

(assert (=> b!960599 m!890231))

(assert (=> b!960599 m!890229))

(assert (=> b!960599 m!890231))

(declare-fun m!890233 () Bool)

(assert (=> b!960599 m!890233))

(declare-fun m!890235 () Bool)

(assert (=> b!960599 m!890235))

(declare-fun m!890237 () Bool)

(assert (=> b!960603 m!890237))

(declare-fun m!890239 () Bool)

(assert (=> b!960602 m!890239))

(declare-fun m!890241 () Bool)

(assert (=> b!960601 m!890241))

(assert (=> b!960601 m!890231))

(assert (=> b!960601 m!890241))

(assert (=> b!960601 m!890231))

(declare-fun m!890243 () Bool)

(assert (=> b!960601 m!890243))

(declare-fun m!890245 () Bool)

(assert (=> mapNonEmpty!34048 m!890245))

(declare-fun m!890247 () Bool)

(assert (=> start!82382 m!890247))

(declare-fun m!890249 () Bool)

(assert (=> start!82382 m!890249))

(declare-fun m!890251 () Bool)

(assert (=> start!82382 m!890251))

(assert (=> b!960607 m!890231))

(assert (=> b!960607 m!890231))

(declare-fun m!890253 () Bool)

(assert (=> b!960607 m!890253))

(check-sat (not start!82382) (not b!960607) (not b!960599) tp_is_empty!21379 (not b!960603) (not b!960601) b_and!30129 (not b!960602) (not b_next!18667) (not mapNonEmpty!34048))
(check-sat b_and!30129 (not b_next!18667))
