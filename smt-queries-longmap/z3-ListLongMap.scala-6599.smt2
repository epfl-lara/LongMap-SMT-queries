; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83646 () Bool)

(assert start!83646)

(declare-fun b_free!19465 () Bool)

(declare-fun b_next!19465 () Bool)

(assert (=> start!83646 (= b_free!19465 (not b_next!19465))))

(declare-fun tp!67684 () Bool)

(declare-fun b_and!31077 () Bool)

(assert (=> start!83646 (= tp!67684 b_and!31077)))

(declare-fun res!653106 () Bool)

(declare-fun e!550176 () Bool)

(assert (=> start!83646 (=> (not res!653106) (not e!550176))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83646 (= res!653106 (validMask!0 mask!2147))))

(assert (=> start!83646 e!550176))

(assert (=> start!83646 true))

(declare-datatypes ((V!34809 0))(
  ( (V!34810 (val!11235 Int)) )
))
(declare-datatypes ((ValueCell!10703 0))(
  ( (ValueCellFull!10703 (v!13791 V!34809)) (EmptyCell!10703) )
))
(declare-datatypes ((array!60806 0))(
  ( (array!60807 (arr!29262 (Array (_ BitVec 32) ValueCell!10703)) (size!29742 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60806)

(declare-fun e!550177 () Bool)

(declare-fun array_inv!22683 (array!60806) Bool)

(assert (=> start!83646 (and (array_inv!22683 _values!1425) e!550177)))

(declare-fun tp_is_empty!22369 () Bool)

(assert (=> start!83646 tp_is_empty!22369))

(assert (=> start!83646 tp!67684))

(declare-datatypes ((array!60808 0))(
  ( (array!60809 (arr!29263 (Array (_ BitVec 32) (_ BitVec 64))) (size!29743 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60808)

(declare-fun array_inv!22684 (array!60808) Bool)

(assert (=> start!83646 (array_inv!22684 _keys!1717)))

(declare-fun b!976030 () Bool)

(declare-fun res!653109 () Bool)

(assert (=> b!976030 (=> (not res!653109) (not e!550176))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!976030 (= res!653109 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29743 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29743 _keys!1717))))))

(declare-fun b!976031 () Bool)

(declare-fun e!550174 () Bool)

(assert (=> b!976031 (= e!550174 tp_is_empty!22369)))

(declare-fun b!976032 () Bool)

(declare-fun e!550173 () Bool)

(assert (=> b!976032 (= e!550173 tp_is_empty!22369)))

(declare-fun mapIsEmpty!35563 () Bool)

(declare-fun mapRes!35563 () Bool)

(assert (=> mapIsEmpty!35563 mapRes!35563))

(declare-fun b!976033 () Bool)

(assert (=> b!976033 (= e!550176 false)))

(declare-fun zeroValue!1367 () V!34809)

(declare-fun minValue!1367 () V!34809)

(declare-datatypes ((tuple2!14450 0))(
  ( (tuple2!14451 (_1!7236 (_ BitVec 64)) (_2!7236 V!34809)) )
))
(declare-datatypes ((List!20297 0))(
  ( (Nil!20294) (Cons!20293 (h!21461 tuple2!14450) (t!28766 List!20297)) )
))
(declare-datatypes ((ListLongMap!13149 0))(
  ( (ListLongMap!13150 (toList!6590 List!20297)) )
))
(declare-fun lt!433194 () ListLongMap!13149)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun getCurrentListMap!3823 (array!60808 array!60806 (_ BitVec 32) (_ BitVec 32) V!34809 V!34809 (_ BitVec 32) Int) ListLongMap!13149)

(assert (=> b!976033 (= lt!433194 (getCurrentListMap!3823 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapNonEmpty!35563 () Bool)

(declare-fun tp!67683 () Bool)

(assert (=> mapNonEmpty!35563 (= mapRes!35563 (and tp!67683 e!550174))))

(declare-fun mapValue!35563 () ValueCell!10703)

(declare-fun mapKey!35563 () (_ BitVec 32))

(declare-fun mapRest!35563 () (Array (_ BitVec 32) ValueCell!10703))

(assert (=> mapNonEmpty!35563 (= (arr!29262 _values!1425) (store mapRest!35563 mapKey!35563 mapValue!35563))))

(declare-fun b!976034 () Bool)

(declare-fun res!653105 () Bool)

(assert (=> b!976034 (=> (not res!653105) (not e!550176))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!976034 (= res!653105 (validKeyInArray!0 (select (arr!29263 _keys!1717) i!822)))))

(declare-fun b!976035 () Bool)

(declare-fun res!653108 () Bool)

(assert (=> b!976035 (=> (not res!653108) (not e!550176))))

(declare-datatypes ((List!20298 0))(
  ( (Nil!20295) (Cons!20294 (h!21462 (_ BitVec 64)) (t!28767 List!20298)) )
))
(declare-fun arrayNoDuplicates!0 (array!60808 (_ BitVec 32) List!20298) Bool)

(assert (=> b!976035 (= res!653108 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20295))))

(declare-fun b!976036 () Bool)

(assert (=> b!976036 (= e!550177 (and e!550173 mapRes!35563))))

(declare-fun condMapEmpty!35563 () Bool)

(declare-fun mapDefault!35563 () ValueCell!10703)

(assert (=> b!976036 (= condMapEmpty!35563 (= (arr!29262 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10703)) mapDefault!35563)))))

(declare-fun b!976037 () Bool)

(declare-fun res!653111 () Bool)

(assert (=> b!976037 (=> (not res!653111) (not e!550176))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60808 (_ BitVec 32)) Bool)

(assert (=> b!976037 (= res!653111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!976038 () Bool)

(declare-fun res!653110 () Bool)

(assert (=> b!976038 (=> (not res!653110) (not e!550176))))

(declare-fun contains!5690 (ListLongMap!13149 (_ BitVec 64)) Bool)

(assert (=> b!976038 (= res!653110 (contains!5690 (getCurrentListMap!3823 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29263 _keys!1717) i!822)))))

(declare-fun b!976039 () Bool)

(declare-fun res!653107 () Bool)

(assert (=> b!976039 (=> (not res!653107) (not e!550176))))

(assert (=> b!976039 (= res!653107 (and (= (size!29742 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29743 _keys!1717) (size!29742 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(assert (= (and start!83646 res!653106) b!976039))

(assert (= (and b!976039 res!653107) b!976037))

(assert (= (and b!976037 res!653111) b!976035))

(assert (= (and b!976035 res!653108) b!976030))

(assert (= (and b!976030 res!653109) b!976034))

(assert (= (and b!976034 res!653105) b!976038))

(assert (= (and b!976038 res!653110) b!976033))

(assert (= (and b!976036 condMapEmpty!35563) mapIsEmpty!35563))

(assert (= (and b!976036 (not condMapEmpty!35563)) mapNonEmpty!35563))

(get-info :version)

(assert (= (and mapNonEmpty!35563 ((_ is ValueCellFull!10703) mapValue!35563)) b!976031))

(assert (= (and b!976036 ((_ is ValueCellFull!10703) mapDefault!35563)) b!976032))

(assert (= start!83646 b!976036))

(declare-fun m!903749 () Bool)

(assert (=> start!83646 m!903749))

(declare-fun m!903751 () Bool)

(assert (=> start!83646 m!903751))

(declare-fun m!903753 () Bool)

(assert (=> start!83646 m!903753))

(declare-fun m!903755 () Bool)

(assert (=> b!976034 m!903755))

(assert (=> b!976034 m!903755))

(declare-fun m!903757 () Bool)

(assert (=> b!976034 m!903757))

(declare-fun m!903759 () Bool)

(assert (=> b!976035 m!903759))

(declare-fun m!903761 () Bool)

(assert (=> mapNonEmpty!35563 m!903761))

(declare-fun m!903763 () Bool)

(assert (=> b!976033 m!903763))

(declare-fun m!903765 () Bool)

(assert (=> b!976037 m!903765))

(declare-fun m!903767 () Bool)

(assert (=> b!976038 m!903767))

(assert (=> b!976038 m!903755))

(assert (=> b!976038 m!903767))

(assert (=> b!976038 m!903755))

(declare-fun m!903769 () Bool)

(assert (=> b!976038 m!903769))

(check-sat (not b!976034) (not mapNonEmpty!35563) tp_is_empty!22369 (not b!976033) (not b!976038) (not b_next!19465) b_and!31077 (not b!976035) (not start!83646) (not b!976037))
(check-sat b_and!31077 (not b_next!19465))
