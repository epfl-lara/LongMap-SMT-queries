; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83202 () Bool)

(assert start!83202)

(declare-fun b_free!19213 () Bool)

(declare-fun b_next!19213 () Bool)

(assert (=> start!83202 (= b_free!19213 (not b_next!19213))))

(declare-fun tp!66918 () Bool)

(declare-fun b_and!30675 () Bool)

(assert (=> start!83202 (= tp!66918 b_and!30675)))

(declare-fun b!970760 () Bool)

(declare-fun res!649799 () Bool)

(declare-fun e!547250 () Bool)

(assert (=> b!970760 (=> (not res!649799) (not e!547250))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34465 0))(
  ( (V!34466 (val!11106 Int)) )
))
(declare-datatypes ((ValueCell!10574 0))(
  ( (ValueCellFull!10574 (v!13664 V!34465)) (EmptyCell!10574) )
))
(declare-datatypes ((array!60208 0))(
  ( (array!60209 (arr!28968 (Array (_ BitVec 32) ValueCell!10574)) (size!29449 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60208)

(declare-fun zeroValue!1367 () V!34465)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34465)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60210 0))(
  ( (array!60211 (arr!28969 (Array (_ BitVec 32) (_ BitVec 64))) (size!29450 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60210)

(declare-datatypes ((tuple2!14316 0))(
  ( (tuple2!14317 (_1!7169 (_ BitVec 64)) (_2!7169 V!34465)) )
))
(declare-datatypes ((List!20135 0))(
  ( (Nil!20132) (Cons!20131 (h!21293 tuple2!14316) (t!28489 List!20135)) )
))
(declare-datatypes ((ListLongMap!13003 0))(
  ( (ListLongMap!13004 (toList!6517 List!20135)) )
))
(declare-fun contains!5564 (ListLongMap!13003 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3679 (array!60210 array!60208 (_ BitVec 32) (_ BitVec 32) V!34465 V!34465 (_ BitVec 32) Int) ListLongMap!13003)

(assert (=> b!970760 (= res!649799 (contains!5564 (getCurrentListMap!3679 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28969 _keys!1717) i!822)))))

(declare-fun b!970761 () Bool)

(declare-fun res!649798 () Bool)

(assert (=> b!970761 (=> (not res!649798) (not e!547250))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970761 (= res!649798 (validKeyInArray!0 (select (arr!28969 _keys!1717) i!822)))))

(declare-fun b!970762 () Bool)

(declare-fun res!649804 () Bool)

(assert (=> b!970762 (=> (not res!649804) (not e!547250))))

(assert (=> b!970762 (= res!649804 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29450 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29450 _keys!1717))))))

(declare-fun mapIsEmpty!35176 () Bool)

(declare-fun mapRes!35176 () Bool)

(assert (=> mapIsEmpty!35176 mapRes!35176))

(declare-fun res!649800 () Bool)

(assert (=> start!83202 (=> (not res!649800) (not e!547250))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83202 (= res!649800 (validMask!0 mask!2147))))

(assert (=> start!83202 e!547250))

(assert (=> start!83202 true))

(declare-fun e!547249 () Bool)

(declare-fun array_inv!22483 (array!60208) Bool)

(assert (=> start!83202 (and (array_inv!22483 _values!1425) e!547249)))

(declare-fun tp_is_empty!22111 () Bool)

(assert (=> start!83202 tp_is_empty!22111))

(assert (=> start!83202 tp!66918))

(declare-fun array_inv!22484 (array!60210) Bool)

(assert (=> start!83202 (array_inv!22484 _keys!1717)))

(declare-fun b!970763 () Bool)

(declare-fun res!649803 () Bool)

(assert (=> b!970763 (=> (not res!649803) (not e!547250))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60210 (_ BitVec 32)) Bool)

(assert (=> b!970763 (= res!649803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!970764 () Bool)

(declare-fun e!547251 () Bool)

(assert (=> b!970764 (= e!547249 (and e!547251 mapRes!35176))))

(declare-fun condMapEmpty!35176 () Bool)

(declare-fun mapDefault!35176 () ValueCell!10574)

(assert (=> b!970764 (= condMapEmpty!35176 (= (arr!28968 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10574)) mapDefault!35176)))))

(declare-fun b!970765 () Bool)

(assert (=> b!970765 (= e!547250 false)))

(declare-fun lt!431553 () ListLongMap!13003)

(assert (=> b!970765 (= lt!431553 (getCurrentListMap!3679 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!970766 () Bool)

(assert (=> b!970766 (= e!547251 tp_is_empty!22111)))

(declare-fun b!970767 () Bool)

(declare-fun res!649801 () Bool)

(assert (=> b!970767 (=> (not res!649801) (not e!547250))))

(declare-datatypes ((List!20136 0))(
  ( (Nil!20133) (Cons!20132 (h!21294 (_ BitVec 64)) (t!28490 List!20136)) )
))
(declare-fun arrayNoDuplicates!0 (array!60210 (_ BitVec 32) List!20136) Bool)

(assert (=> b!970767 (= res!649801 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20133))))

(declare-fun mapNonEmpty!35176 () Bool)

(declare-fun tp!66919 () Bool)

(declare-fun e!547247 () Bool)

(assert (=> mapNonEmpty!35176 (= mapRes!35176 (and tp!66919 e!547247))))

(declare-fun mapKey!35176 () (_ BitVec 32))

(declare-fun mapValue!35176 () ValueCell!10574)

(declare-fun mapRest!35176 () (Array (_ BitVec 32) ValueCell!10574))

(assert (=> mapNonEmpty!35176 (= (arr!28968 _values!1425) (store mapRest!35176 mapKey!35176 mapValue!35176))))

(declare-fun b!970768 () Bool)

(declare-fun res!649802 () Bool)

(assert (=> b!970768 (=> (not res!649802) (not e!547250))))

(assert (=> b!970768 (= res!649802 (and (= (size!29449 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29450 _keys!1717) (size!29449 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!970769 () Bool)

(assert (=> b!970769 (= e!547247 tp_is_empty!22111)))

(assert (= (and start!83202 res!649800) b!970768))

(assert (= (and b!970768 res!649802) b!970763))

(assert (= (and b!970763 res!649803) b!970767))

(assert (= (and b!970767 res!649801) b!970762))

(assert (= (and b!970762 res!649804) b!970761))

(assert (= (and b!970761 res!649798) b!970760))

(assert (= (and b!970760 res!649799) b!970765))

(assert (= (and b!970764 condMapEmpty!35176) mapIsEmpty!35176))

(assert (= (and b!970764 (not condMapEmpty!35176)) mapNonEmpty!35176))

(get-info :version)

(assert (= (and mapNonEmpty!35176 ((_ is ValueCellFull!10574) mapValue!35176)) b!970769))

(assert (= (and b!970764 ((_ is ValueCellFull!10574) mapDefault!35176)) b!970766))

(assert (= start!83202 b!970764))

(declare-fun m!897815 () Bool)

(assert (=> b!970760 m!897815))

(declare-fun m!897817 () Bool)

(assert (=> b!970760 m!897817))

(assert (=> b!970760 m!897815))

(assert (=> b!970760 m!897817))

(declare-fun m!897819 () Bool)

(assert (=> b!970760 m!897819))

(declare-fun m!897821 () Bool)

(assert (=> b!970765 m!897821))

(assert (=> b!970761 m!897817))

(assert (=> b!970761 m!897817))

(declare-fun m!897823 () Bool)

(assert (=> b!970761 m!897823))

(declare-fun m!897825 () Bool)

(assert (=> mapNonEmpty!35176 m!897825))

(declare-fun m!897827 () Bool)

(assert (=> b!970763 m!897827))

(declare-fun m!897829 () Bool)

(assert (=> start!83202 m!897829))

(declare-fun m!897831 () Bool)

(assert (=> start!83202 m!897831))

(declare-fun m!897833 () Bool)

(assert (=> start!83202 m!897833))

(declare-fun m!897835 () Bool)

(assert (=> b!970767 m!897835))

(check-sat (not b!970765) (not mapNonEmpty!35176) (not b!970767) tp_is_empty!22111 (not b!970760) (not b!970761) (not b_next!19213) (not b!970763) b_and!30675 (not start!83202))
(check-sat b_and!30675 (not b_next!19213))
