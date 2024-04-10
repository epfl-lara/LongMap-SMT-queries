; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82198 () Bool)

(assert start!82198)

(declare-fun b_free!18471 () Bool)

(declare-fun b_next!18471 () Bool)

(assert (=> start!82198 (= b_free!18471 (not b_next!18471))))

(declare-fun tp!64374 () Bool)

(declare-fun b_and!29959 () Bool)

(assert (=> start!82198 (= tp!64374 b_and!29959)))

(declare-fun b!958037 () Bool)

(declare-fun e!540101 () Bool)

(declare-fun tp_is_empty!21177 () Bool)

(assert (=> b!958037 (= e!540101 tp_is_empty!21177)))

(declare-fun b!958039 () Bool)

(declare-fun res!641277 () Bool)

(declare-fun e!540105 () Bool)

(assert (=> b!958039 (=> (not res!641277) (not e!540105))))

(declare-datatypes ((array!58457 0))(
  ( (array!58458 (arr!28102 (Array (_ BitVec 32) (_ BitVec 64))) (size!28581 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58457)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958039 (= res!641277 (validKeyInArray!0 (select (arr!28102 _keys!1668) i!793)))))

(declare-fun b!958040 () Bool)

(assert (=> b!958040 (= e!540105 false)))

(declare-fun lt!430398 () Bool)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-datatypes ((V!33219 0))(
  ( (V!33220 (val!10639 Int)) )
))
(declare-fun minValue!1328 () V!33219)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10107 0))(
  ( (ValueCellFull!10107 (v!13196 V!33219)) (EmptyCell!10107) )
))
(declare-datatypes ((array!58459 0))(
  ( (array!58460 (arr!28103 (Array (_ BitVec 32) ValueCell!10107)) (size!28582 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58459)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33219)

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13714 0))(
  ( (tuple2!13715 (_1!6868 (_ BitVec 64)) (_2!6868 V!33219)) )
))
(declare-datatypes ((List!19536 0))(
  ( (Nil!19533) (Cons!19532 (h!20694 tuple2!13714) (t!27899 List!19536)) )
))
(declare-datatypes ((ListLongMap!12411 0))(
  ( (ListLongMap!12412 (toList!6221 List!19536)) )
))
(declare-fun contains!5322 (ListLongMap!12411 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3454 (array!58457 array!58459 (_ BitVec 32) (_ BitVec 32) V!33219 V!33219 (_ BitVec 32) Int) ListLongMap!12411)

(assert (=> b!958040 (= lt!430398 (contains!5322 (getCurrentListMap!3454 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28102 _keys!1668) i!793)))))

(declare-fun b!958041 () Bool)

(declare-fun res!641282 () Bool)

(assert (=> b!958041 (=> (not res!641282) (not e!540105))))

(assert (=> b!958041 (= res!641282 (and (= (size!28582 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28581 _keys!1668) (size!28582 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!958042 () Bool)

(declare-fun res!641278 () Bool)

(assert (=> b!958042 (=> (not res!641278) (not e!540105))))

(declare-datatypes ((List!19537 0))(
  ( (Nil!19534) (Cons!19533 (h!20695 (_ BitVec 64)) (t!27900 List!19537)) )
))
(declare-fun arrayNoDuplicates!0 (array!58457 (_ BitVec 32) List!19537) Bool)

(assert (=> b!958042 (= res!641278 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19534))))

(declare-fun mapNonEmpty!33745 () Bool)

(declare-fun mapRes!33745 () Bool)

(declare-fun tp!64373 () Bool)

(assert (=> mapNonEmpty!33745 (= mapRes!33745 (and tp!64373 e!540101))))

(declare-fun mapKey!33745 () (_ BitVec 32))

(declare-fun mapValue!33745 () ValueCell!10107)

(declare-fun mapRest!33745 () (Array (_ BitVec 32) ValueCell!10107))

(assert (=> mapNonEmpty!33745 (= (arr!28103 _values!1386) (store mapRest!33745 mapKey!33745 mapValue!33745))))

(declare-fun b!958043 () Bool)

(declare-fun res!641281 () Bool)

(assert (=> b!958043 (=> (not res!641281) (not e!540105))))

(assert (=> b!958043 (= res!641281 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28581 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28581 _keys!1668))))))

(declare-fun mapIsEmpty!33745 () Bool)

(assert (=> mapIsEmpty!33745 mapRes!33745))

(declare-fun b!958038 () Bool)

(declare-fun res!641280 () Bool)

(assert (=> b!958038 (=> (not res!641280) (not e!540105))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58457 (_ BitVec 32)) Bool)

(assert (=> b!958038 (= res!641280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun res!641279 () Bool)

(assert (=> start!82198 (=> (not res!641279) (not e!540105))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82198 (= res!641279 (validMask!0 mask!2088))))

(assert (=> start!82198 e!540105))

(assert (=> start!82198 true))

(assert (=> start!82198 tp_is_empty!21177))

(declare-fun array_inv!21799 (array!58457) Bool)

(assert (=> start!82198 (array_inv!21799 _keys!1668)))

(declare-fun e!540102 () Bool)

(declare-fun array_inv!21800 (array!58459) Bool)

(assert (=> start!82198 (and (array_inv!21800 _values!1386) e!540102)))

(assert (=> start!82198 tp!64374))

(declare-fun b!958044 () Bool)

(declare-fun e!540104 () Bool)

(assert (=> b!958044 (= e!540102 (and e!540104 mapRes!33745))))

(declare-fun condMapEmpty!33745 () Bool)

(declare-fun mapDefault!33745 () ValueCell!10107)

(assert (=> b!958044 (= condMapEmpty!33745 (= (arr!28103 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10107)) mapDefault!33745)))))

(declare-fun b!958045 () Bool)

(assert (=> b!958045 (= e!540104 tp_is_empty!21177)))

(assert (= (and start!82198 res!641279) b!958041))

(assert (= (and b!958041 res!641282) b!958038))

(assert (= (and b!958038 res!641280) b!958042))

(assert (= (and b!958042 res!641278) b!958043))

(assert (= (and b!958043 res!641281) b!958039))

(assert (= (and b!958039 res!641277) b!958040))

(assert (= (and b!958044 condMapEmpty!33745) mapIsEmpty!33745))

(assert (= (and b!958044 (not condMapEmpty!33745)) mapNonEmpty!33745))

(get-info :version)

(assert (= (and mapNonEmpty!33745 ((_ is ValueCellFull!10107) mapValue!33745)) b!958037))

(assert (= (and b!958044 ((_ is ValueCellFull!10107) mapDefault!33745)) b!958045))

(assert (= start!82198 b!958044))

(declare-fun m!888817 () Bool)

(assert (=> b!958042 m!888817))

(declare-fun m!888819 () Bool)

(assert (=> b!958040 m!888819))

(declare-fun m!888821 () Bool)

(assert (=> b!958040 m!888821))

(assert (=> b!958040 m!888819))

(assert (=> b!958040 m!888821))

(declare-fun m!888823 () Bool)

(assert (=> b!958040 m!888823))

(assert (=> b!958039 m!888821))

(assert (=> b!958039 m!888821))

(declare-fun m!888825 () Bool)

(assert (=> b!958039 m!888825))

(declare-fun m!888827 () Bool)

(assert (=> mapNonEmpty!33745 m!888827))

(declare-fun m!888829 () Bool)

(assert (=> start!82198 m!888829))

(declare-fun m!888831 () Bool)

(assert (=> start!82198 m!888831))

(declare-fun m!888833 () Bool)

(assert (=> start!82198 m!888833))

(declare-fun m!888835 () Bool)

(assert (=> b!958038 m!888835))

(check-sat (not b!958039) tp_is_empty!21177 (not b!958042) (not start!82198) b_and!29959 (not b!958038) (not b!958040) (not b_next!18471) (not mapNonEmpty!33745))
(check-sat b_and!29959 (not b_next!18471))
