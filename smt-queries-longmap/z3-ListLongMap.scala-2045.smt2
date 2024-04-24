; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35424 () Bool)

(assert start!35424)

(declare-fun b_free!7825 () Bool)

(declare-fun b_next!7825 () Bool)

(assert (=> start!35424 (= b_free!7825 (not b_next!7825))))

(declare-fun tp!27261 () Bool)

(declare-fun b_and!15081 () Bool)

(assert (=> start!35424 (= tp!27261 b_and!15081)))

(declare-fun b!354795 () Bool)

(declare-fun res!196743 () Bool)

(declare-fun e!217446 () Bool)

(assert (=> b!354795 (=> (not res!196743) (not e!217446))))

(declare-datatypes ((array!19352 0))(
  ( (array!19353 (arr!9169 (Array (_ BitVec 32) (_ BitVec 64))) (size!9521 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19352)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(assert (=> b!354795 (= res!196743 (= (select (arr!9169 _keys!1456) from!1805) k0!1077))))

(declare-fun b!354796 () Bool)

(declare-fun res!196739 () Bool)

(assert (=> b!354796 (=> (not res!196739) (not e!217446))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((V!11499 0))(
  ( (V!11500 (val!3990 Int)) )
))
(declare-datatypes ((ValueCell!3602 0))(
  ( (ValueCellFull!3602 (v!6185 V!11499)) (EmptyCell!3602) )
))
(declare-datatypes ((array!19354 0))(
  ( (array!19355 (arr!9170 (Array (_ BitVec 32) ValueCell!3602)) (size!9522 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19354)

(assert (=> b!354796 (= res!196739 (and (= (size!9522 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9521 _keys!1456) (size!9522 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!354797 () Bool)

(declare-fun res!196740 () Bool)

(assert (=> b!354797 (=> (not res!196740) (not e!217446))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!354797 (= res!196740 (validKeyInArray!0 (select (arr!9169 _keys!1456) from!1805)))))

(declare-fun res!196744 () Bool)

(assert (=> start!35424 (=> (not res!196744) (not e!217446))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35424 (= res!196744 (validMask!0 mask!1842))))

(assert (=> start!35424 e!217446))

(declare-fun tp_is_empty!7891 () Bool)

(assert (=> start!35424 tp_is_empty!7891))

(assert (=> start!35424 true))

(assert (=> start!35424 tp!27261))

(declare-fun array_inv!6776 (array!19352) Bool)

(assert (=> start!35424 (array_inv!6776 _keys!1456)))

(declare-fun e!217443 () Bool)

(declare-fun array_inv!6777 (array!19354) Bool)

(assert (=> start!35424 (and (array_inv!6777 _values!1208) e!217443)))

(declare-fun mapNonEmpty!13344 () Bool)

(declare-fun mapRes!13344 () Bool)

(declare-fun tp!27260 () Bool)

(declare-fun e!217444 () Bool)

(assert (=> mapNonEmpty!13344 (= mapRes!13344 (and tp!27260 e!217444))))

(declare-fun mapValue!13344 () ValueCell!3602)

(declare-fun mapKey!13344 () (_ BitVec 32))

(declare-fun mapRest!13344 () (Array (_ BitVec 32) ValueCell!3602))

(assert (=> mapNonEmpty!13344 (= (arr!9170 _values!1208) (store mapRest!13344 mapKey!13344 mapValue!13344))))

(declare-fun b!354798 () Bool)

(declare-fun res!196745 () Bool)

(assert (=> b!354798 (=> (not res!196745) (not e!217446))))

(assert (=> b!354798 (= res!196745 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9521 _keys!1456))))))

(declare-fun b!354799 () Bool)

(declare-fun e!217445 () Bool)

(assert (=> b!354799 (= e!217445 tp_is_empty!7891)))

(declare-fun b!354800 () Bool)

(declare-fun res!196747 () Bool)

(assert (=> b!354800 (=> (not res!196747) (not e!217446))))

(assert (=> b!354800 (= res!196747 (validKeyInArray!0 k0!1077))))

(declare-fun b!354801 () Bool)

(assert (=> b!354801 (= e!217443 (and e!217445 mapRes!13344))))

(declare-fun condMapEmpty!13344 () Bool)

(declare-fun mapDefault!13344 () ValueCell!3602)

(assert (=> b!354801 (= condMapEmpty!13344 (= (arr!9170 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3602)) mapDefault!13344)))))

(declare-fun b!354802 () Bool)

(assert (=> b!354802 (= e!217444 tp_is_empty!7891)))

(declare-fun b!354803 () Bool)

(declare-fun res!196742 () Bool)

(assert (=> b!354803 (=> (not res!196742) (not e!217446))))

(declare-fun arrayContainsKey!0 (array!19352 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!354803 (= res!196742 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!354804 () Bool)

(assert (=> b!354804 (= e!217446 (not true))))

(declare-fun minValue!1150 () V!11499)

(declare-fun zeroValue!1150 () V!11499)

(declare-fun defaultEntry!1216 () Int)

(declare-datatypes ((tuple2!5582 0))(
  ( (tuple2!5583 (_1!2802 (_ BitVec 64)) (_2!2802 V!11499)) )
))
(declare-datatypes ((List!5218 0))(
  ( (Nil!5215) (Cons!5214 (h!6070 tuple2!5582) (t!10360 List!5218)) )
))
(declare-datatypes ((ListLongMap!4497 0))(
  ( (ListLongMap!4498 (toList!2264 List!5218)) )
))
(declare-fun contains!2363 (ListLongMap!4497 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1792 (array!19352 array!19354 (_ BitVec 32) (_ BitVec 32) V!11499 V!11499 (_ BitVec 32) Int) ListLongMap!4497)

(assert (=> b!354804 (contains!2363 (getCurrentListMap!1792 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) (select (arr!9169 _keys!1456) from!1805))))

(declare-datatypes ((Unit!10913 0))(
  ( (Unit!10914) )
))
(declare-fun lt!165770 () Unit!10913)

(declare-fun lemmaValidKeyInArrayIsInListMap!182 (array!19352 array!19354 (_ BitVec 32) (_ BitVec 32) V!11499 V!11499 (_ BitVec 32) Int) Unit!10913)

(assert (=> b!354804 (= lt!165770 (lemmaValidKeyInArrayIsInListMap!182 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun mapIsEmpty!13344 () Bool)

(assert (=> mapIsEmpty!13344 mapRes!13344))

(declare-fun b!354805 () Bool)

(declare-fun res!196741 () Bool)

(assert (=> b!354805 (=> (not res!196741) (not e!217446))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19352 (_ BitVec 32)) Bool)

(assert (=> b!354805 (= res!196741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!354806 () Bool)

(declare-fun res!196746 () Bool)

(assert (=> b!354806 (=> (not res!196746) (not e!217446))))

(declare-datatypes ((List!5219 0))(
  ( (Nil!5216) (Cons!5215 (h!6071 (_ BitVec 64)) (t!10361 List!5219)) )
))
(declare-fun arrayNoDuplicates!0 (array!19352 (_ BitVec 32) List!5219) Bool)

(assert (=> b!354806 (= res!196746 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5216))))

(assert (= (and start!35424 res!196744) b!354796))

(assert (= (and b!354796 res!196739) b!354805))

(assert (= (and b!354805 res!196741) b!354806))

(assert (= (and b!354806 res!196746) b!354800))

(assert (= (and b!354800 res!196747) b!354798))

(assert (= (and b!354798 res!196745) b!354803))

(assert (= (and b!354803 res!196742) b!354795))

(assert (= (and b!354795 res!196743) b!354797))

(assert (= (and b!354797 res!196740) b!354804))

(assert (= (and b!354801 condMapEmpty!13344) mapIsEmpty!13344))

(assert (= (and b!354801 (not condMapEmpty!13344)) mapNonEmpty!13344))

(get-info :version)

(assert (= (and mapNonEmpty!13344 ((_ is ValueCellFull!3602) mapValue!13344)) b!354802))

(assert (= (and b!354801 ((_ is ValueCellFull!3602) mapDefault!13344)) b!354799))

(assert (= start!35424 b!354801))

(declare-fun m!353955 () Bool)

(assert (=> b!354804 m!353955))

(declare-fun m!353957 () Bool)

(assert (=> b!354804 m!353957))

(assert (=> b!354804 m!353955))

(assert (=> b!354804 m!353957))

(declare-fun m!353959 () Bool)

(assert (=> b!354804 m!353959))

(declare-fun m!353961 () Bool)

(assert (=> b!354804 m!353961))

(assert (=> b!354795 m!353957))

(declare-fun m!353963 () Bool)

(assert (=> b!354806 m!353963))

(declare-fun m!353965 () Bool)

(assert (=> b!354805 m!353965))

(declare-fun m!353967 () Bool)

(assert (=> mapNonEmpty!13344 m!353967))

(assert (=> b!354797 m!353957))

(assert (=> b!354797 m!353957))

(declare-fun m!353969 () Bool)

(assert (=> b!354797 m!353969))

(declare-fun m!353971 () Bool)

(assert (=> b!354803 m!353971))

(declare-fun m!353973 () Bool)

(assert (=> b!354800 m!353973))

(declare-fun m!353975 () Bool)

(assert (=> start!35424 m!353975))

(declare-fun m!353977 () Bool)

(assert (=> start!35424 m!353977))

(declare-fun m!353979 () Bool)

(assert (=> start!35424 m!353979))

(check-sat (not b!354800) (not b_next!7825) (not mapNonEmpty!13344) (not b!354804) b_and!15081 (not b!354806) (not b!354797) (not b!354803) (not start!35424) tp_is_empty!7891 (not b!354805))
(check-sat b_and!15081 (not b_next!7825))
