; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35662 () Bool)

(assert start!35662)

(declare-fun b_free!7917 () Bool)

(declare-fun b_next!7917 () Bool)

(assert (=> start!35662 (= b_free!7917 (not b_next!7917))))

(declare-fun tp!27735 () Bool)

(declare-fun b_and!15159 () Bool)

(assert (=> start!35662 (= tp!27735 b_and!15159)))

(declare-fun b!358187 () Bool)

(declare-fun e!219234 () Bool)

(declare-datatypes ((array!19797 0))(
  ( (array!19798 (arr!9392 (Array (_ BitVec 32) (_ BitVec 64))) (size!9744 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19797)

(assert (=> b!358187 (= e!219234 (bvsle #b00000000000000000000000000000000 (size!9744 _keys!1456)))))

(declare-datatypes ((V!11797 0))(
  ( (V!11798 (val!4102 Int)) )
))
(declare-fun minValue!1150 () V!11797)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun defaultEntry!1216 () Int)

(declare-fun k0!1077 () (_ BitVec 64))

(declare-datatypes ((ValueCell!3714 0))(
  ( (ValueCellFull!3714 (v!6296 V!11797)) (EmptyCell!3714) )
))
(declare-datatypes ((array!19799 0))(
  ( (array!19800 (arr!9393 (Array (_ BitVec 32) ValueCell!3714)) (size!9745 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19799)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11797)

(declare-datatypes ((tuple2!5728 0))(
  ( (tuple2!5729 (_1!2875 (_ BitVec 64)) (_2!2875 V!11797)) )
))
(declare-datatypes ((List!5423 0))(
  ( (Nil!5420) (Cons!5419 (h!6275 tuple2!5728) (t!10573 List!5423)) )
))
(declare-datatypes ((ListLongMap!4641 0))(
  ( (ListLongMap!4642 (toList!2336 List!5423)) )
))
(declare-fun contains!2416 (ListLongMap!4641 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1857 (array!19797 array!19799 (_ BitVec 32) (_ BitVec 32) V!11797 V!11797 (_ BitVec 32) Int) ListLongMap!4641)

(assert (=> b!358187 (contains!2416 (getCurrentListMap!1857 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) k0!1077)))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((Unit!11048 0))(
  ( (Unit!11049) )
))
(declare-fun lt!166166 () Unit!11048)

(declare-fun lemmaArrayContainsKeyThenInListMap!352 (array!19797 array!19799 (_ BitVec 32) (_ BitVec 32) V!11797 V!11797 (_ BitVec 64) (_ BitVec 32) Int) Unit!11048)

(assert (=> b!358187 (= lt!166166 (lemmaArrayContainsKeyThenInListMap!352 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805) defaultEntry!1216))))

(declare-fun res!199079 () Bool)

(declare-fun e!219235 () Bool)

(assert (=> start!35662 (=> (not res!199079) (not e!219235))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35662 (= res!199079 (validMask!0 mask!1842))))

(assert (=> start!35662 e!219235))

(declare-fun tp_is_empty!8115 () Bool)

(assert (=> start!35662 tp_is_empty!8115))

(assert (=> start!35662 true))

(assert (=> start!35662 tp!27735))

(declare-fun array_inv!6904 (array!19797) Bool)

(assert (=> start!35662 (array_inv!6904 _keys!1456)))

(declare-fun e!219239 () Bool)

(declare-fun array_inv!6905 (array!19799) Bool)

(assert (=> start!35662 (and (array_inv!6905 _values!1208) e!219239)))

(declare-fun b!358188 () Bool)

(declare-fun res!199073 () Bool)

(assert (=> b!358188 (=> (not res!199073) (not e!219235))))

(assert (=> b!358188 (= res!199073 (and (= (size!9745 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9744 _keys!1456) (size!9745 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!358189 () Bool)

(declare-fun e!219237 () Bool)

(declare-fun mapRes!13680 () Bool)

(assert (=> b!358189 (= e!219239 (and e!219237 mapRes!13680))))

(declare-fun condMapEmpty!13680 () Bool)

(declare-fun mapDefault!13680 () ValueCell!3714)

(assert (=> b!358189 (= condMapEmpty!13680 (= (arr!9393 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3714)) mapDefault!13680)))))

(declare-fun b!358190 () Bool)

(declare-fun res!199076 () Bool)

(assert (=> b!358190 (=> (not res!199076) (not e!219235))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19797 (_ BitVec 32)) Bool)

(assert (=> b!358190 (= res!199076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!358191 () Bool)

(assert (=> b!358191 (= e!219237 tp_is_empty!8115)))

(declare-fun b!358192 () Bool)

(declare-fun res!199080 () Bool)

(assert (=> b!358192 (=> (not res!199080) (not e!219235))))

(assert (=> b!358192 (= res!199080 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9744 _keys!1456))))))

(declare-fun b!358193 () Bool)

(declare-fun e!219238 () Bool)

(assert (=> b!358193 (= e!219238 tp_is_empty!8115)))

(declare-fun mapIsEmpty!13680 () Bool)

(assert (=> mapIsEmpty!13680 mapRes!13680))

(declare-fun b!358194 () Bool)

(declare-fun res!199075 () Bool)

(assert (=> b!358194 (=> (not res!199075) (not e!219235))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!358194 (= res!199075 (validKeyInArray!0 k0!1077))))

(declare-fun b!358195 () Bool)

(assert (=> b!358195 (= e!219235 (not e!219234))))

(declare-fun res!199078 () Bool)

(assert (=> b!358195 (=> res!199078 e!219234)))

(assert (=> b!358195 (= res!199078 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9744 _keys!1456))))))

(declare-fun arrayContainsKey!0 (array!19797 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!358195 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun lt!166165 () Unit!11048)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!41 (array!19797 array!19799 (_ BitVec 32) (_ BitVec 32) V!11797 V!11797 (_ BitVec 64) (_ BitVec 32)) Unit!11048)

(assert (=> b!358195 (= lt!166165 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!41 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!358196 () Bool)

(declare-fun res!199074 () Bool)

(assert (=> b!358196 (=> (not res!199074) (not e!219235))))

(assert (=> b!358196 (= res!199074 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!358197 () Bool)

(declare-fun res!199077 () Bool)

(assert (=> b!358197 (=> (not res!199077) (not e!219235))))

(declare-datatypes ((List!5424 0))(
  ( (Nil!5421) (Cons!5420 (h!6276 (_ BitVec 64)) (t!10574 List!5424)) )
))
(declare-fun arrayNoDuplicates!0 (array!19797 (_ BitVec 32) List!5424) Bool)

(assert (=> b!358197 (= res!199077 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5421))))

(declare-fun mapNonEmpty!13680 () Bool)

(declare-fun tp!27734 () Bool)

(assert (=> mapNonEmpty!13680 (= mapRes!13680 (and tp!27734 e!219238))))

(declare-fun mapRest!13680 () (Array (_ BitVec 32) ValueCell!3714))

(declare-fun mapValue!13680 () ValueCell!3714)

(declare-fun mapKey!13680 () (_ BitVec 32))

(assert (=> mapNonEmpty!13680 (= (arr!9393 _values!1208) (store mapRest!13680 mapKey!13680 mapValue!13680))))

(declare-fun b!358198 () Bool)

(declare-fun res!199081 () Bool)

(assert (=> b!358198 (=> (not res!199081) (not e!219235))))

(assert (=> b!358198 (= res!199081 (not (= (select (arr!9392 _keys!1456) from!1805) k0!1077)))))

(assert (= (and start!35662 res!199079) b!358188))

(assert (= (and b!358188 res!199073) b!358190))

(assert (= (and b!358190 res!199076) b!358197))

(assert (= (and b!358197 res!199077) b!358194))

(assert (= (and b!358194 res!199075) b!358192))

(assert (= (and b!358192 res!199080) b!358196))

(assert (= (and b!358196 res!199074) b!358198))

(assert (= (and b!358198 res!199081) b!358195))

(assert (= (and b!358195 (not res!199078)) b!358187))

(assert (= (and b!358189 condMapEmpty!13680) mapIsEmpty!13680))

(assert (= (and b!358189 (not condMapEmpty!13680)) mapNonEmpty!13680))

(get-info :version)

(assert (= (and mapNonEmpty!13680 ((_ is ValueCellFull!3714) mapValue!13680)) b!358193))

(assert (= (and b!358189 ((_ is ValueCellFull!3714) mapDefault!13680)) b!358191))

(assert (= start!35662 b!358189))

(declare-fun m!356099 () Bool)

(assert (=> b!358198 m!356099))

(declare-fun m!356101 () Bool)

(assert (=> b!358194 m!356101))

(declare-fun m!356103 () Bool)

(assert (=> b!358190 m!356103))

(declare-fun m!356105 () Bool)

(assert (=> b!358197 m!356105))

(declare-fun m!356107 () Bool)

(assert (=> mapNonEmpty!13680 m!356107))

(declare-fun m!356109 () Bool)

(assert (=> b!358195 m!356109))

(declare-fun m!356111 () Bool)

(assert (=> b!358195 m!356111))

(declare-fun m!356113 () Bool)

(assert (=> start!35662 m!356113))

(declare-fun m!356115 () Bool)

(assert (=> start!35662 m!356115))

(declare-fun m!356117 () Bool)

(assert (=> start!35662 m!356117))

(declare-fun m!356119 () Bool)

(assert (=> b!358187 m!356119))

(assert (=> b!358187 m!356119))

(declare-fun m!356121 () Bool)

(assert (=> b!358187 m!356121))

(declare-fun m!356123 () Bool)

(assert (=> b!358187 m!356123))

(declare-fun m!356125 () Bool)

(assert (=> b!358196 m!356125))

(check-sat b_and!15159 (not mapNonEmpty!13680) (not b!358190) (not b!358197) (not b!358196) (not b_next!7917) (not b!358195) (not start!35662) tp_is_empty!8115 (not b!358187) (not b!358194))
(check-sat b_and!15159 (not b_next!7917))
