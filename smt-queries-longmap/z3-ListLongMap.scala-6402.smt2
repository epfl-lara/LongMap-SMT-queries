; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82210 () Bool)

(assert start!82210)

(declare-fun b_free!18483 () Bool)

(declare-fun b_next!18483 () Bool)

(assert (=> start!82210 (= b_free!18483 (not b_next!18483))))

(declare-fun tp!64410 () Bool)

(declare-fun b_and!29971 () Bool)

(assert (=> start!82210 (= tp!64410 b_and!29971)))

(declare-fun b!958199 () Bool)

(declare-fun res!641386 () Bool)

(declare-fun e!540191 () Bool)

(assert (=> b!958199 (=> (not res!641386) (not e!540191))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((array!58481 0))(
  ( (array!58482 (arr!28114 (Array (_ BitVec 32) (_ BitVec 64))) (size!28593 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58481)

(assert (=> b!958199 (= res!641386 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28593 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28593 _keys!1668))))))

(declare-fun b!958200 () Bool)

(declare-fun res!641390 () Bool)

(assert (=> b!958200 (=> (not res!641390) (not e!540191))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958200 (= res!641390 (validKeyInArray!0 (select (arr!28114 _keys!1668) i!793)))))

(declare-fun b!958201 () Bool)

(declare-fun res!641387 () Bool)

(assert (=> b!958201 (=> (not res!641387) (not e!540191))))

(declare-datatypes ((List!19544 0))(
  ( (Nil!19541) (Cons!19540 (h!20702 (_ BitVec 64)) (t!27907 List!19544)) )
))
(declare-fun arrayNoDuplicates!0 (array!58481 (_ BitVec 32) List!19544) Bool)

(assert (=> b!958201 (= res!641387 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19541))))

(declare-fun b!958202 () Bool)

(declare-fun e!540193 () Bool)

(declare-fun tp_is_empty!21189 () Bool)

(assert (=> b!958202 (= e!540193 tp_is_empty!21189)))

(declare-fun res!641389 () Bool)

(assert (=> start!82210 (=> (not res!641389) (not e!540191))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82210 (= res!641389 (validMask!0 mask!2088))))

(assert (=> start!82210 e!540191))

(assert (=> start!82210 true))

(assert (=> start!82210 tp_is_empty!21189))

(declare-fun array_inv!21807 (array!58481) Bool)

(assert (=> start!82210 (array_inv!21807 _keys!1668)))

(declare-datatypes ((V!33235 0))(
  ( (V!33236 (val!10645 Int)) )
))
(declare-datatypes ((ValueCell!10113 0))(
  ( (ValueCellFull!10113 (v!13202 V!33235)) (EmptyCell!10113) )
))
(declare-datatypes ((array!58483 0))(
  ( (array!58484 (arr!28115 (Array (_ BitVec 32) ValueCell!10113)) (size!28594 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58483)

(declare-fun e!540194 () Bool)

(declare-fun array_inv!21808 (array!58483) Bool)

(assert (=> start!82210 (and (array_inv!21808 _values!1386) e!540194)))

(assert (=> start!82210 tp!64410))

(declare-fun mapNonEmpty!33763 () Bool)

(declare-fun mapRes!33763 () Bool)

(declare-fun tp!64409 () Bool)

(declare-fun e!540195 () Bool)

(assert (=> mapNonEmpty!33763 (= mapRes!33763 (and tp!64409 e!540195))))

(declare-fun mapRest!33763 () (Array (_ BitVec 32) ValueCell!10113))

(declare-fun mapValue!33763 () ValueCell!10113)

(declare-fun mapKey!33763 () (_ BitVec 32))

(assert (=> mapNonEmpty!33763 (= (arr!28115 _values!1386) (store mapRest!33763 mapKey!33763 mapValue!33763))))

(declare-fun b!958203 () Bool)

(declare-fun res!641388 () Bool)

(assert (=> b!958203 (=> (not res!641388) (not e!540191))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58481 (_ BitVec 32)) Bool)

(assert (=> b!958203 (= res!641388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun mapIsEmpty!33763 () Bool)

(assert (=> mapIsEmpty!33763 mapRes!33763))

(declare-fun b!958204 () Bool)

(declare-fun res!641385 () Bool)

(assert (=> b!958204 (=> (not res!641385) (not e!540191))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!958204 (= res!641385 (and (= (size!28594 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28593 _keys!1668) (size!28594 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!958205 () Bool)

(assert (=> b!958205 (= e!540194 (and e!540193 mapRes!33763))))

(declare-fun condMapEmpty!33763 () Bool)

(declare-fun mapDefault!33763 () ValueCell!10113)

(assert (=> b!958205 (= condMapEmpty!33763 (= (arr!28115 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10113)) mapDefault!33763)))))

(declare-fun b!958206 () Bool)

(assert (=> b!958206 (= e!540191 false)))

(declare-fun minValue!1328 () V!33235)

(declare-fun lt!430416 () Bool)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33235)

(declare-datatypes ((tuple2!13722 0))(
  ( (tuple2!13723 (_1!6872 (_ BitVec 64)) (_2!6872 V!33235)) )
))
(declare-datatypes ((List!19545 0))(
  ( (Nil!19542) (Cons!19541 (h!20703 tuple2!13722) (t!27908 List!19545)) )
))
(declare-datatypes ((ListLongMap!12419 0))(
  ( (ListLongMap!12420 (toList!6225 List!19545)) )
))
(declare-fun contains!5326 (ListLongMap!12419 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3458 (array!58481 array!58483 (_ BitVec 32) (_ BitVec 32) V!33235 V!33235 (_ BitVec 32) Int) ListLongMap!12419)

(assert (=> b!958206 (= lt!430416 (contains!5326 (getCurrentListMap!3458 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28114 _keys!1668) i!793)))))

(declare-fun b!958207 () Bool)

(assert (=> b!958207 (= e!540195 tp_is_empty!21189)))

(assert (= (and start!82210 res!641389) b!958204))

(assert (= (and b!958204 res!641385) b!958203))

(assert (= (and b!958203 res!641388) b!958201))

(assert (= (and b!958201 res!641387) b!958199))

(assert (= (and b!958199 res!641386) b!958200))

(assert (= (and b!958200 res!641390) b!958206))

(assert (= (and b!958205 condMapEmpty!33763) mapIsEmpty!33763))

(assert (= (and b!958205 (not condMapEmpty!33763)) mapNonEmpty!33763))

(get-info :version)

(assert (= (and mapNonEmpty!33763 ((_ is ValueCellFull!10113) mapValue!33763)) b!958207))

(assert (= (and b!958205 ((_ is ValueCellFull!10113) mapDefault!33763)) b!958202))

(assert (= start!82210 b!958205))

(declare-fun m!888937 () Bool)

(assert (=> b!958200 m!888937))

(assert (=> b!958200 m!888937))

(declare-fun m!888939 () Bool)

(assert (=> b!958200 m!888939))

(declare-fun m!888941 () Bool)

(assert (=> b!958206 m!888941))

(assert (=> b!958206 m!888937))

(assert (=> b!958206 m!888941))

(assert (=> b!958206 m!888937))

(declare-fun m!888943 () Bool)

(assert (=> b!958206 m!888943))

(declare-fun m!888945 () Bool)

(assert (=> b!958203 m!888945))

(declare-fun m!888947 () Bool)

(assert (=> mapNonEmpty!33763 m!888947))

(declare-fun m!888949 () Bool)

(assert (=> b!958201 m!888949))

(declare-fun m!888951 () Bool)

(assert (=> start!82210 m!888951))

(declare-fun m!888953 () Bool)

(assert (=> start!82210 m!888953))

(declare-fun m!888955 () Bool)

(assert (=> start!82210 m!888955))

(check-sat tp_is_empty!21189 (not b!958203) (not start!82210) (not mapNonEmpty!33763) (not b_next!18483) (not b!958200) b_and!29971 (not b!958206) (not b!958201))
(check-sat b_and!29971 (not b_next!18483))
