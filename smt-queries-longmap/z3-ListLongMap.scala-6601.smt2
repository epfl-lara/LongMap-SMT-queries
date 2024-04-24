; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83658 () Bool)

(assert start!83658)

(declare-fun b_free!19477 () Bool)

(declare-fun b_next!19477 () Bool)

(assert (=> start!83658 (= b_free!19477 (not b_next!19477))))

(declare-fun tp!67719 () Bool)

(declare-fun b_and!31089 () Bool)

(assert (=> start!83658 (= tp!67719 b_and!31089)))

(declare-fun b!976210 () Bool)

(declare-fun res!653236 () Bool)

(declare-fun e!550267 () Bool)

(assert (=> b!976210 (=> (not res!653236) (not e!550267))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34825 0))(
  ( (V!34826 (val!11241 Int)) )
))
(declare-datatypes ((ValueCell!10709 0))(
  ( (ValueCellFull!10709 (v!13797 V!34825)) (EmptyCell!10709) )
))
(declare-datatypes ((array!60830 0))(
  ( (array!60831 (arr!29274 (Array (_ BitVec 32) ValueCell!10709)) (size!29754 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60830)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60832 0))(
  ( (array!60833 (arr!29275 (Array (_ BitVec 32) (_ BitVec 64))) (size!29755 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60832)

(assert (=> b!976210 (= res!653236 (and (= (size!29754 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29755 _keys!1717) (size!29754 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!976211 () Bool)

(declare-fun e!550266 () Bool)

(declare-fun e!550263 () Bool)

(declare-fun mapRes!35581 () Bool)

(assert (=> b!976211 (= e!550266 (and e!550263 mapRes!35581))))

(declare-fun condMapEmpty!35581 () Bool)

(declare-fun mapDefault!35581 () ValueCell!10709)

(assert (=> b!976211 (= condMapEmpty!35581 (= (arr!29274 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10709)) mapDefault!35581)))))

(declare-fun b!976212 () Bool)

(declare-fun res!653234 () Bool)

(assert (=> b!976212 (=> (not res!653234) (not e!550267))))

(declare-fun zeroValue!1367 () V!34825)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun minValue!1367 () V!34825)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-datatypes ((tuple2!14456 0))(
  ( (tuple2!14457 (_1!7239 (_ BitVec 64)) (_2!7239 V!34825)) )
))
(declare-datatypes ((List!20303 0))(
  ( (Nil!20300) (Cons!20299 (h!21467 tuple2!14456) (t!28772 List!20303)) )
))
(declare-datatypes ((ListLongMap!13155 0))(
  ( (ListLongMap!13156 (toList!6593 List!20303)) )
))
(declare-fun contains!5693 (ListLongMap!13155 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3826 (array!60832 array!60830 (_ BitVec 32) (_ BitVec 32) V!34825 V!34825 (_ BitVec 32) Int) ListLongMap!13155)

(assert (=> b!976212 (= res!653234 (contains!5693 (getCurrentListMap!3826 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29275 _keys!1717) i!822)))))

(declare-fun b!976214 () Bool)

(declare-fun tp_is_empty!22381 () Bool)

(assert (=> b!976214 (= e!550263 tp_is_empty!22381)))

(declare-fun mapNonEmpty!35581 () Bool)

(declare-fun tp!67720 () Bool)

(declare-fun e!550264 () Bool)

(assert (=> mapNonEmpty!35581 (= mapRes!35581 (and tp!67720 e!550264))))

(declare-fun mapValue!35581 () ValueCell!10709)

(declare-fun mapKey!35581 () (_ BitVec 32))

(declare-fun mapRest!35581 () (Array (_ BitVec 32) ValueCell!10709))

(assert (=> mapNonEmpty!35581 (= (arr!29274 _values!1425) (store mapRest!35581 mapKey!35581 mapValue!35581))))

(declare-fun b!976215 () Bool)

(declare-fun res!653233 () Bool)

(assert (=> b!976215 (=> (not res!653233) (not e!550267))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!976215 (= res!653233 (validKeyInArray!0 (select (arr!29275 _keys!1717) i!822)))))

(declare-fun b!976216 () Bool)

(declare-fun res!653231 () Bool)

(assert (=> b!976216 (=> (not res!653231) (not e!550267))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60832 (_ BitVec 32)) Bool)

(assert (=> b!976216 (= res!653231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!976217 () Bool)

(declare-fun res!653232 () Bool)

(assert (=> b!976217 (=> (not res!653232) (not e!550267))))

(assert (=> b!976217 (= res!653232 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29755 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29755 _keys!1717))))))

(declare-fun mapIsEmpty!35581 () Bool)

(assert (=> mapIsEmpty!35581 mapRes!35581))

(declare-fun b!976218 () Bool)

(assert (=> b!976218 (= e!550267 false)))

(declare-fun lt!433212 () ListLongMap!13155)

(assert (=> b!976218 (= lt!433212 (getCurrentListMap!3826 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!976219 () Bool)

(declare-fun res!653237 () Bool)

(assert (=> b!976219 (=> (not res!653237) (not e!550267))))

(declare-datatypes ((List!20304 0))(
  ( (Nil!20301) (Cons!20300 (h!21468 (_ BitVec 64)) (t!28773 List!20304)) )
))
(declare-fun arrayNoDuplicates!0 (array!60832 (_ BitVec 32) List!20304) Bool)

(assert (=> b!976219 (= res!653237 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20301))))

(declare-fun b!976213 () Bool)

(assert (=> b!976213 (= e!550264 tp_is_empty!22381)))

(declare-fun res!653235 () Bool)

(assert (=> start!83658 (=> (not res!653235) (not e!550267))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83658 (= res!653235 (validMask!0 mask!2147))))

(assert (=> start!83658 e!550267))

(assert (=> start!83658 true))

(declare-fun array_inv!22693 (array!60830) Bool)

(assert (=> start!83658 (and (array_inv!22693 _values!1425) e!550266)))

(assert (=> start!83658 tp_is_empty!22381))

(assert (=> start!83658 tp!67719))

(declare-fun array_inv!22694 (array!60832) Bool)

(assert (=> start!83658 (array_inv!22694 _keys!1717)))

(assert (= (and start!83658 res!653235) b!976210))

(assert (= (and b!976210 res!653236) b!976216))

(assert (= (and b!976216 res!653231) b!976219))

(assert (= (and b!976219 res!653237) b!976217))

(assert (= (and b!976217 res!653232) b!976215))

(assert (= (and b!976215 res!653233) b!976212))

(assert (= (and b!976212 res!653234) b!976218))

(assert (= (and b!976211 condMapEmpty!35581) mapIsEmpty!35581))

(assert (= (and b!976211 (not condMapEmpty!35581)) mapNonEmpty!35581))

(get-info :version)

(assert (= (and mapNonEmpty!35581 ((_ is ValueCellFull!10709) mapValue!35581)) b!976213))

(assert (= (and b!976211 ((_ is ValueCellFull!10709) mapDefault!35581)) b!976214))

(assert (= start!83658 b!976211))

(declare-fun m!903881 () Bool)

(assert (=> b!976215 m!903881))

(assert (=> b!976215 m!903881))

(declare-fun m!903883 () Bool)

(assert (=> b!976215 m!903883))

(declare-fun m!903885 () Bool)

(assert (=> b!976218 m!903885))

(declare-fun m!903887 () Bool)

(assert (=> b!976219 m!903887))

(declare-fun m!903889 () Bool)

(assert (=> b!976216 m!903889))

(declare-fun m!903891 () Bool)

(assert (=> start!83658 m!903891))

(declare-fun m!903893 () Bool)

(assert (=> start!83658 m!903893))

(declare-fun m!903895 () Bool)

(assert (=> start!83658 m!903895))

(declare-fun m!903897 () Bool)

(assert (=> b!976212 m!903897))

(assert (=> b!976212 m!903881))

(assert (=> b!976212 m!903897))

(assert (=> b!976212 m!903881))

(declare-fun m!903899 () Bool)

(assert (=> b!976212 m!903899))

(declare-fun m!903901 () Bool)

(assert (=> mapNonEmpty!35581 m!903901))

(check-sat (not b!976212) (not b!976219) tp_is_empty!22381 (not b!976218) (not b!976215) (not b!976216) b_and!31089 (not start!83658) (not b_next!19477) (not mapNonEmpty!35581))
(check-sat b_and!31089 (not b_next!19477))
