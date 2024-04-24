; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82370 () Bool)

(assert start!82370)

(declare-fun b_free!18475 () Bool)

(declare-fun b_next!18475 () Bool)

(assert (=> start!82370 (= b_free!18475 (not b_next!18475))))

(declare-fun tp!64386 () Bool)

(declare-fun b_and!29973 () Bool)

(assert (=> start!82370 (= tp!64386 b_and!29973)))

(declare-fun mapNonEmpty!33751 () Bool)

(declare-fun mapRes!33751 () Bool)

(declare-fun tp!64387 () Bool)

(declare-fun e!540717 () Bool)

(assert (=> mapNonEmpty!33751 (= mapRes!33751 (and tp!64387 e!540717))))

(declare-fun mapKey!33751 () (_ BitVec 32))

(declare-datatypes ((V!33225 0))(
  ( (V!33226 (val!10641 Int)) )
))
(declare-datatypes ((ValueCell!10109 0))(
  ( (ValueCellFull!10109 (v!13195 V!33225)) (EmptyCell!10109) )
))
(declare-datatypes ((array!58492 0))(
  ( (array!58493 (arr!28115 (Array (_ BitVec 32) ValueCell!10109)) (size!28595 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58492)

(declare-fun mapValue!33751 () ValueCell!10109)

(declare-fun mapRest!33751 () (Array (_ BitVec 32) ValueCell!10109))

(assert (=> mapNonEmpty!33751 (= (arr!28115 _values!1386) (store mapRest!33751 mapKey!33751 mapValue!33751))))

(declare-fun b!958994 () Bool)

(declare-fun res!641660 () Bool)

(declare-fun e!540715 () Bool)

(assert (=> b!958994 (=> (not res!641660) (not e!540715))))

(declare-datatypes ((array!58494 0))(
  ( (array!58495 (arr!28116 (Array (_ BitVec 32) (_ BitVec 64))) (size!28596 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58494)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58494 (_ BitVec 32)) Bool)

(assert (=> b!958994 (= res!641660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun res!641657 () Bool)

(assert (=> start!82370 (=> (not res!641657) (not e!540715))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82370 (= res!641657 (validMask!0 mask!2088))))

(assert (=> start!82370 e!540715))

(assert (=> start!82370 true))

(declare-fun tp_is_empty!21181 () Bool)

(assert (=> start!82370 tp_is_empty!21181))

(declare-fun array_inv!21881 (array!58494) Bool)

(assert (=> start!82370 (array_inv!21881 _keys!1668)))

(declare-fun e!540713 () Bool)

(declare-fun array_inv!21882 (array!58492) Bool)

(assert (=> start!82370 (and (array_inv!21882 _values!1386) e!540713)))

(assert (=> start!82370 tp!64386))

(declare-fun b!958995 () Bool)

(declare-fun e!540716 () Bool)

(assert (=> b!958995 (= e!540716 tp_is_empty!21181)))

(declare-fun b!958996 () Bool)

(assert (=> b!958996 (= e!540715 false)))

(declare-fun minValue!1328 () V!33225)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33225)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun lt!430765 () Bool)

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13700 0))(
  ( (tuple2!13701 (_1!6861 (_ BitVec 64)) (_2!6861 V!33225)) )
))
(declare-datatypes ((List!19532 0))(
  ( (Nil!19529) (Cons!19528 (h!20696 tuple2!13700) (t!27887 List!19532)) )
))
(declare-datatypes ((ListLongMap!12399 0))(
  ( (ListLongMap!12400 (toList!6215 List!19532)) )
))
(declare-fun contains!5329 (ListLongMap!12399 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3448 (array!58494 array!58492 (_ BitVec 32) (_ BitVec 32) V!33225 V!33225 (_ BitVec 32) Int) ListLongMap!12399)

(assert (=> b!958996 (= lt!430765 (contains!5329 (getCurrentListMap!3448 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28116 _keys!1668) i!793)))))

(declare-fun b!958997 () Bool)

(assert (=> b!958997 (= e!540717 tp_is_empty!21181)))

(declare-fun b!958998 () Bool)

(declare-fun res!641662 () Bool)

(assert (=> b!958998 (=> (not res!641662) (not e!540715))))

(assert (=> b!958998 (= res!641662 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28596 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28596 _keys!1668))))))

(declare-fun b!958999 () Bool)

(assert (=> b!958999 (= e!540713 (and e!540716 mapRes!33751))))

(declare-fun condMapEmpty!33751 () Bool)

(declare-fun mapDefault!33751 () ValueCell!10109)

(assert (=> b!958999 (= condMapEmpty!33751 (= (arr!28115 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10109)) mapDefault!33751)))))

(declare-fun b!959000 () Bool)

(declare-fun res!641658 () Bool)

(assert (=> b!959000 (=> (not res!641658) (not e!540715))))

(assert (=> b!959000 (= res!641658 (and (= (size!28595 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28596 _keys!1668) (size!28595 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!33751 () Bool)

(assert (=> mapIsEmpty!33751 mapRes!33751))

(declare-fun b!959001 () Bool)

(declare-fun res!641661 () Bool)

(assert (=> b!959001 (=> (not res!641661) (not e!540715))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959001 (= res!641661 (validKeyInArray!0 (select (arr!28116 _keys!1668) i!793)))))

(declare-fun b!959002 () Bool)

(declare-fun res!641659 () Bool)

(assert (=> b!959002 (=> (not res!641659) (not e!540715))))

(declare-datatypes ((List!19533 0))(
  ( (Nil!19530) (Cons!19529 (h!20697 (_ BitVec 64)) (t!27888 List!19533)) )
))
(declare-fun arrayNoDuplicates!0 (array!58494 (_ BitVec 32) List!19533) Bool)

(assert (=> b!959002 (= res!641659 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19530))))

(assert (= (and start!82370 res!641657) b!959000))

(assert (= (and b!959000 res!641658) b!958994))

(assert (= (and b!958994 res!641660) b!959002))

(assert (= (and b!959002 res!641659) b!958998))

(assert (= (and b!958998 res!641662) b!959001))

(assert (= (and b!959001 res!641661) b!958996))

(assert (= (and b!958999 condMapEmpty!33751) mapIsEmpty!33751))

(assert (= (and b!958999 (not condMapEmpty!33751)) mapNonEmpty!33751))

(get-info :version)

(assert (= (and mapNonEmpty!33751 ((_ is ValueCellFull!10109) mapValue!33751)) b!958997))

(assert (= (and b!958999 ((_ is ValueCellFull!10109) mapDefault!33751)) b!958995))

(assert (= start!82370 b!958999))

(declare-fun m!890151 () Bool)

(assert (=> b!959002 m!890151))

(declare-fun m!890153 () Bool)

(assert (=> mapNonEmpty!33751 m!890153))

(declare-fun m!890155 () Bool)

(assert (=> b!959001 m!890155))

(assert (=> b!959001 m!890155))

(declare-fun m!890157 () Bool)

(assert (=> b!959001 m!890157))

(declare-fun m!890159 () Bool)

(assert (=> start!82370 m!890159))

(declare-fun m!890161 () Bool)

(assert (=> start!82370 m!890161))

(declare-fun m!890163 () Bool)

(assert (=> start!82370 m!890163))

(declare-fun m!890165 () Bool)

(assert (=> b!958996 m!890165))

(assert (=> b!958996 m!890155))

(assert (=> b!958996 m!890165))

(assert (=> b!958996 m!890155))

(declare-fun m!890167 () Bool)

(assert (=> b!958996 m!890167))

(declare-fun m!890169 () Bool)

(assert (=> b!958994 m!890169))

(check-sat (not mapNonEmpty!33751) (not start!82370) (not b_next!18475) tp_is_empty!21181 (not b!959001) (not b!958996) (not b!958994) (not b!959002) b_and!29973)
(check-sat b_and!29973 (not b_next!18475))
