; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83652 () Bool)

(assert start!83652)

(declare-fun b_free!19471 () Bool)

(declare-fun b_next!19471 () Bool)

(assert (=> start!83652 (= b_free!19471 (not b_next!19471))))

(declare-fun tp!67701 () Bool)

(declare-fun b_and!31083 () Bool)

(assert (=> start!83652 (= tp!67701 b_and!31083)))

(declare-fun b!976120 () Bool)

(declare-fun e!550222 () Bool)

(declare-fun tp_is_empty!22375 () Bool)

(assert (=> b!976120 (= e!550222 tp_is_empty!22375)))

(declare-fun b!976122 () Bool)

(declare-fun e!550219 () Bool)

(assert (=> b!976122 (= e!550219 tp_is_empty!22375)))

(declare-fun b!976123 () Bool)

(declare-fun res!653168 () Bool)

(declare-fun e!550221 () Bool)

(assert (=> b!976123 (=> (not res!653168) (not e!550221))))

(declare-datatypes ((array!60818 0))(
  ( (array!60819 (arr!29268 (Array (_ BitVec 32) (_ BitVec 64))) (size!29748 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60818)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!976123 (= res!653168 (validKeyInArray!0 (select (arr!29268 _keys!1717) i!822)))))

(declare-fun b!976124 () Bool)

(declare-fun res!653171 () Bool)

(assert (=> b!976124 (=> (not res!653171) (not e!550221))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60818 (_ BitVec 32)) Bool)

(assert (=> b!976124 (= res!653171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapNonEmpty!35572 () Bool)

(declare-fun mapRes!35572 () Bool)

(declare-fun tp!67702 () Bool)

(assert (=> mapNonEmpty!35572 (= mapRes!35572 (and tp!67702 e!550222))))

(declare-datatypes ((V!34817 0))(
  ( (V!34818 (val!11238 Int)) )
))
(declare-datatypes ((ValueCell!10706 0))(
  ( (ValueCellFull!10706 (v!13794 V!34817)) (EmptyCell!10706) )
))
(declare-fun mapValue!35572 () ValueCell!10706)

(declare-datatypes ((array!60820 0))(
  ( (array!60821 (arr!29269 (Array (_ BitVec 32) ValueCell!10706)) (size!29749 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60820)

(declare-fun mapKey!35572 () (_ BitVec 32))

(declare-fun mapRest!35572 () (Array (_ BitVec 32) ValueCell!10706))

(assert (=> mapNonEmpty!35572 (= (arr!29269 _values!1425) (store mapRest!35572 mapKey!35572 mapValue!35572))))

(declare-fun b!976125 () Bool)

(declare-fun res!653169 () Bool)

(assert (=> b!976125 (=> (not res!653169) (not e!550221))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!976125 (= res!653169 (and (= (size!29749 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29748 _keys!1717) (size!29749 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!976126 () Bool)

(declare-fun res!653172 () Bool)

(assert (=> b!976126 (=> (not res!653172) (not e!550221))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!976126 (= res!653172 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29748 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29748 _keys!1717))))))

(declare-fun b!976127 () Bool)

(declare-fun res!653174 () Bool)

(assert (=> b!976127 (=> (not res!653174) (not e!550221))))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34817)

(declare-fun zeroValue!1367 () V!34817)

(declare-datatypes ((tuple2!14454 0))(
  ( (tuple2!14455 (_1!7238 (_ BitVec 64)) (_2!7238 V!34817)) )
))
(declare-datatypes ((List!20301 0))(
  ( (Nil!20298) (Cons!20297 (h!21465 tuple2!14454) (t!28770 List!20301)) )
))
(declare-datatypes ((ListLongMap!13153 0))(
  ( (ListLongMap!13154 (toList!6592 List!20301)) )
))
(declare-fun contains!5692 (ListLongMap!13153 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3825 (array!60818 array!60820 (_ BitVec 32) (_ BitVec 32) V!34817 V!34817 (_ BitVec 32) Int) ListLongMap!13153)

(assert (=> b!976127 (= res!653174 (contains!5692 (getCurrentListMap!3825 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29268 _keys!1717) i!822)))))

(declare-fun b!976128 () Bool)

(assert (=> b!976128 (= e!550221 false)))

(declare-fun lt!433203 () ListLongMap!13153)

(assert (=> b!976128 (= lt!433203 (getCurrentListMap!3825 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun res!653170 () Bool)

(assert (=> start!83652 (=> (not res!653170) (not e!550221))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83652 (= res!653170 (validMask!0 mask!2147))))

(assert (=> start!83652 e!550221))

(assert (=> start!83652 true))

(declare-fun e!550218 () Bool)

(declare-fun array_inv!22687 (array!60820) Bool)

(assert (=> start!83652 (and (array_inv!22687 _values!1425) e!550218)))

(assert (=> start!83652 tp_is_empty!22375))

(assert (=> start!83652 tp!67701))

(declare-fun array_inv!22688 (array!60818) Bool)

(assert (=> start!83652 (array_inv!22688 _keys!1717)))

(declare-fun b!976121 () Bool)

(declare-fun res!653173 () Bool)

(assert (=> b!976121 (=> (not res!653173) (not e!550221))))

(declare-datatypes ((List!20302 0))(
  ( (Nil!20299) (Cons!20298 (h!21466 (_ BitVec 64)) (t!28771 List!20302)) )
))
(declare-fun arrayNoDuplicates!0 (array!60818 (_ BitVec 32) List!20302) Bool)

(assert (=> b!976121 (= res!653173 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20299))))

(declare-fun mapIsEmpty!35572 () Bool)

(assert (=> mapIsEmpty!35572 mapRes!35572))

(declare-fun b!976129 () Bool)

(assert (=> b!976129 (= e!550218 (and e!550219 mapRes!35572))))

(declare-fun condMapEmpty!35572 () Bool)

(declare-fun mapDefault!35572 () ValueCell!10706)

(assert (=> b!976129 (= condMapEmpty!35572 (= (arr!29269 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10706)) mapDefault!35572)))))

(assert (= (and start!83652 res!653170) b!976125))

(assert (= (and b!976125 res!653169) b!976124))

(assert (= (and b!976124 res!653171) b!976121))

(assert (= (and b!976121 res!653173) b!976126))

(assert (= (and b!976126 res!653172) b!976123))

(assert (= (and b!976123 res!653168) b!976127))

(assert (= (and b!976127 res!653174) b!976128))

(assert (= (and b!976129 condMapEmpty!35572) mapIsEmpty!35572))

(assert (= (and b!976129 (not condMapEmpty!35572)) mapNonEmpty!35572))

(get-info :version)

(assert (= (and mapNonEmpty!35572 ((_ is ValueCellFull!10706) mapValue!35572)) b!976120))

(assert (= (and b!976129 ((_ is ValueCellFull!10706) mapDefault!35572)) b!976122))

(assert (= start!83652 b!976129))

(declare-fun m!903815 () Bool)

(assert (=> b!976127 m!903815))

(declare-fun m!903817 () Bool)

(assert (=> b!976127 m!903817))

(assert (=> b!976127 m!903815))

(assert (=> b!976127 m!903817))

(declare-fun m!903819 () Bool)

(assert (=> b!976127 m!903819))

(declare-fun m!903821 () Bool)

(assert (=> b!976121 m!903821))

(assert (=> b!976123 m!903817))

(assert (=> b!976123 m!903817))

(declare-fun m!903823 () Bool)

(assert (=> b!976123 m!903823))

(declare-fun m!903825 () Bool)

(assert (=> start!83652 m!903825))

(declare-fun m!903827 () Bool)

(assert (=> start!83652 m!903827))

(declare-fun m!903829 () Bool)

(assert (=> start!83652 m!903829))

(declare-fun m!903831 () Bool)

(assert (=> b!976124 m!903831))

(declare-fun m!903833 () Bool)

(assert (=> mapNonEmpty!35572 m!903833))

(declare-fun m!903835 () Bool)

(assert (=> b!976128 m!903835))

(check-sat (not b_next!19471) (not b!976121) (not b!976124) b_and!31083 (not mapNonEmpty!35572) tp_is_empty!22375 (not b!976127) (not start!83652) (not b!976128) (not b!976123))
(check-sat b_and!31083 (not b_next!19471))
