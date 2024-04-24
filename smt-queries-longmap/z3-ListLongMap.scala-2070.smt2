; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35574 () Bool)

(assert start!35574)

(declare-fun b!356836 () Bool)

(declare-fun e!218571 () Bool)

(declare-fun tp_is_empty!8041 () Bool)

(assert (=> b!356836 (= e!218571 tp_is_empty!8041)))

(declare-fun b!356837 () Bool)

(declare-fun e!218569 () Bool)

(assert (=> b!356837 (= e!218569 (not true))))

(declare-datatypes ((array!19634 0))(
  ( (array!19635 (arr!9310 (Array (_ BitVec 32) (_ BitVec 64))) (size!9662 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19634)

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!19634 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!356837 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((V!11699 0))(
  ( (V!11700 (val!4065 Int)) )
))
(declare-fun minValue!1150 () V!11699)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((Unit!10977 0))(
  ( (Unit!10978) )
))
(declare-fun lt!165995 () Unit!10977)

(declare-datatypes ((ValueCell!3677 0))(
  ( (ValueCellFull!3677 (v!6260 V!11699)) (EmptyCell!3677) )
))
(declare-datatypes ((array!19636 0))(
  ( (array!19637 (arr!9311 (Array (_ BitVec 32) ValueCell!3677)) (size!9663 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19636)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11699)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!17 (array!19634 array!19636 (_ BitVec 32) (_ BitVec 32) V!11699 V!11699 (_ BitVec 64) (_ BitVec 32)) Unit!10977)

(assert (=> b!356837 (= lt!165995 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!17 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!356838 () Bool)

(declare-fun res!198109 () Bool)

(assert (=> b!356838 (=> (not res!198109) (not e!218569))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19634 (_ BitVec 32)) Bool)

(assert (=> b!356838 (= res!198109 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!356839 () Bool)

(declare-fun res!198106 () Bool)

(assert (=> b!356839 (=> (not res!198106) (not e!218569))))

(declare-datatypes ((List!5288 0))(
  ( (Nil!5285) (Cons!5284 (h!6140 (_ BitVec 64)) (t!10430 List!5288)) )
))
(declare-fun arrayNoDuplicates!0 (array!19634 (_ BitVec 32) List!5288) Bool)

(assert (=> b!356839 (= res!198106 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5285))))

(declare-fun res!198107 () Bool)

(assert (=> start!35574 (=> (not res!198107) (not e!218569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35574 (= res!198107 (validMask!0 mask!1842))))

(assert (=> start!35574 e!218569))

(assert (=> start!35574 tp_is_empty!8041))

(assert (=> start!35574 true))

(declare-fun array_inv!6878 (array!19634) Bool)

(assert (=> start!35574 (array_inv!6878 _keys!1456)))

(declare-fun e!218568 () Bool)

(declare-fun array_inv!6879 (array!19636) Bool)

(assert (=> start!35574 (and (array_inv!6879 _values!1208) e!218568)))

(declare-fun b!356840 () Bool)

(declare-fun res!198108 () Bool)

(assert (=> b!356840 (=> (not res!198108) (not e!218569))))

(assert (=> b!356840 (= res!198108 (not (= (select (arr!9310 _keys!1456) from!1805) k0!1077)))))

(declare-fun mapNonEmpty!13569 () Bool)

(declare-fun mapRes!13569 () Bool)

(declare-fun tp!27546 () Bool)

(declare-fun e!218570 () Bool)

(assert (=> mapNonEmpty!13569 (= mapRes!13569 (and tp!27546 e!218570))))

(declare-fun mapValue!13569 () ValueCell!3677)

(declare-fun mapKey!13569 () (_ BitVec 32))

(declare-fun mapRest!13569 () (Array (_ BitVec 32) ValueCell!3677))

(assert (=> mapNonEmpty!13569 (= (arr!9311 _values!1208) (store mapRest!13569 mapKey!13569 mapValue!13569))))

(declare-fun b!356841 () Bool)

(declare-fun res!198105 () Bool)

(assert (=> b!356841 (=> (not res!198105) (not e!218569))))

(assert (=> b!356841 (= res!198105 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!356842 () Bool)

(assert (=> b!356842 (= e!218570 tp_is_empty!8041)))

(declare-fun b!356843 () Bool)

(declare-fun res!198112 () Bool)

(assert (=> b!356843 (=> (not res!198112) (not e!218569))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!356843 (= res!198112 (validKeyInArray!0 k0!1077))))

(declare-fun b!356844 () Bool)

(declare-fun res!198110 () Bool)

(assert (=> b!356844 (=> (not res!198110) (not e!218569))))

(assert (=> b!356844 (= res!198110 (and (= (size!9663 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9662 _keys!1456) (size!9663 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!13569 () Bool)

(assert (=> mapIsEmpty!13569 mapRes!13569))

(declare-fun b!356845 () Bool)

(assert (=> b!356845 (= e!218568 (and e!218571 mapRes!13569))))

(declare-fun condMapEmpty!13569 () Bool)

(declare-fun mapDefault!13569 () ValueCell!3677)

(assert (=> b!356845 (= condMapEmpty!13569 (= (arr!9311 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3677)) mapDefault!13569)))))

(declare-fun b!356846 () Bool)

(declare-fun res!198111 () Bool)

(assert (=> b!356846 (=> (not res!198111) (not e!218569))))

(assert (=> b!356846 (= res!198111 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9662 _keys!1456))))))

(assert (= (and start!35574 res!198107) b!356844))

(assert (= (and b!356844 res!198110) b!356838))

(assert (= (and b!356838 res!198109) b!356839))

(assert (= (and b!356839 res!198106) b!356843))

(assert (= (and b!356843 res!198112) b!356846))

(assert (= (and b!356846 res!198111) b!356841))

(assert (= (and b!356841 res!198105) b!356840))

(assert (= (and b!356840 res!198108) b!356837))

(assert (= (and b!356845 condMapEmpty!13569) mapIsEmpty!13569))

(assert (= (and b!356845 (not condMapEmpty!13569)) mapNonEmpty!13569))

(get-info :version)

(assert (= (and mapNonEmpty!13569 ((_ is ValueCellFull!3677) mapValue!13569)) b!356842))

(assert (= (and b!356845 ((_ is ValueCellFull!3677) mapDefault!13569)) b!356836))

(assert (= start!35574 b!356845))

(declare-fun m!355359 () Bool)

(assert (=> start!35574 m!355359))

(declare-fun m!355361 () Bool)

(assert (=> start!35574 m!355361))

(declare-fun m!355363 () Bool)

(assert (=> start!35574 m!355363))

(declare-fun m!355365 () Bool)

(assert (=> b!356838 m!355365))

(declare-fun m!355367 () Bool)

(assert (=> mapNonEmpty!13569 m!355367))

(declare-fun m!355369 () Bool)

(assert (=> b!356837 m!355369))

(declare-fun m!355371 () Bool)

(assert (=> b!356837 m!355371))

(declare-fun m!355373 () Bool)

(assert (=> b!356841 m!355373))

(declare-fun m!355375 () Bool)

(assert (=> b!356839 m!355375))

(declare-fun m!355377 () Bool)

(assert (=> b!356843 m!355377))

(declare-fun m!355379 () Bool)

(assert (=> b!356840 m!355379))

(check-sat (not b!356837) (not b!356839) tp_is_empty!8041 (not b!356843) (not start!35574) (not mapNonEmpty!13569) (not b!356841) (not b!356838))
(check-sat)
