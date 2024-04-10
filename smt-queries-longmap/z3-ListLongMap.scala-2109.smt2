; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35824 () Bool)

(assert start!35824)

(declare-fun b!359919 () Bool)

(declare-fun res!200082 () Bool)

(declare-fun e!220453 () Bool)

(assert (=> b!359919 (=> (not res!200082) (not e!220453))))

(declare-datatypes ((array!20107 0))(
  ( (array!20108 (arr!9547 (Array (_ BitVec 32) (_ BitVec 64))) (size!9899 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20107)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(assert (=> b!359919 (= res!200082 (not (= (select (arr!9547 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!359920 () Bool)

(declare-fun res!200079 () Bool)

(assert (=> b!359920 (=> (not res!200079) (not e!220453))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!359920 (= res!200079 (validKeyInArray!0 k0!1077))))

(declare-fun b!359921 () Bool)

(assert (=> b!359921 (= e!220453 (not true))))

(declare-fun arrayContainsKey!0 (array!20107 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!359921 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((V!12013 0))(
  ( (V!12014 (val!4183 Int)) )
))
(declare-fun minValue!1150 () V!12013)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((Unit!11064 0))(
  ( (Unit!11065) )
))
(declare-fun lt!166403 () Unit!11064)

(declare-datatypes ((ValueCell!3795 0))(
  ( (ValueCellFull!3795 (v!6377 V!12013)) (EmptyCell!3795) )
))
(declare-datatypes ((array!20109 0))(
  ( (array!20110 (arr!9548 (Array (_ BitVec 32) ValueCell!3795)) (size!9900 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20109)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!12013)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!47 (array!20107 array!20109 (_ BitVec 32) (_ BitVec 32) V!12013 V!12013 (_ BitVec 64) (_ BitVec 32)) Unit!11064)

(assert (=> b!359921 (= lt!166403 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!47 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun res!200080 () Bool)

(assert (=> start!35824 (=> (not res!200080) (not e!220453))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35824 (= res!200080 (validMask!0 mask!1842))))

(assert (=> start!35824 e!220453))

(declare-fun tp_is_empty!8277 () Bool)

(assert (=> start!35824 tp_is_empty!8277))

(assert (=> start!35824 true))

(declare-fun array_inv!7024 (array!20107) Bool)

(assert (=> start!35824 (array_inv!7024 _keys!1456)))

(declare-fun e!220457 () Bool)

(declare-fun array_inv!7025 (array!20109) Bool)

(assert (=> start!35824 (and (array_inv!7025 _values!1208) e!220457)))

(declare-fun b!359922 () Bool)

(declare-fun e!220456 () Bool)

(declare-fun mapRes!13923 () Bool)

(assert (=> b!359922 (= e!220457 (and e!220456 mapRes!13923))))

(declare-fun condMapEmpty!13923 () Bool)

(declare-fun mapDefault!13923 () ValueCell!3795)

(assert (=> b!359922 (= condMapEmpty!13923 (= (arr!9548 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3795)) mapDefault!13923)))))

(declare-fun mapNonEmpty!13923 () Bool)

(declare-fun tp!27990 () Bool)

(declare-fun e!220454 () Bool)

(assert (=> mapNonEmpty!13923 (= mapRes!13923 (and tp!27990 e!220454))))

(declare-fun mapKey!13923 () (_ BitVec 32))

(declare-fun mapValue!13923 () ValueCell!3795)

(declare-fun mapRest!13923 () (Array (_ BitVec 32) ValueCell!3795))

(assert (=> mapNonEmpty!13923 (= (arr!9548 _values!1208) (store mapRest!13923 mapKey!13923 mapValue!13923))))

(declare-fun b!359923 () Bool)

(declare-fun res!200076 () Bool)

(assert (=> b!359923 (=> (not res!200076) (not e!220453))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20107 (_ BitVec 32)) Bool)

(assert (=> b!359923 (= res!200076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!359924 () Bool)

(declare-fun res!200083 () Bool)

(assert (=> b!359924 (=> (not res!200083) (not e!220453))))

(assert (=> b!359924 (= res!200083 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9899 _keys!1456))))))

(declare-fun mapIsEmpty!13923 () Bool)

(assert (=> mapIsEmpty!13923 mapRes!13923))

(declare-fun b!359925 () Bool)

(declare-fun res!200081 () Bool)

(assert (=> b!359925 (=> (not res!200081) (not e!220453))))

(assert (=> b!359925 (= res!200081 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!359926 () Bool)

(declare-fun res!200078 () Bool)

(assert (=> b!359926 (=> (not res!200078) (not e!220453))))

(declare-datatypes ((List!5481 0))(
  ( (Nil!5478) (Cons!5477 (h!6333 (_ BitVec 64)) (t!10631 List!5481)) )
))
(declare-fun arrayNoDuplicates!0 (array!20107 (_ BitVec 32) List!5481) Bool)

(assert (=> b!359926 (= res!200078 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5478))))

(declare-fun b!359927 () Bool)

(assert (=> b!359927 (= e!220456 tp_is_empty!8277)))

(declare-fun b!359928 () Bool)

(assert (=> b!359928 (= e!220454 tp_is_empty!8277)))

(declare-fun b!359929 () Bool)

(declare-fun res!200077 () Bool)

(assert (=> b!359929 (=> (not res!200077) (not e!220453))))

(assert (=> b!359929 (= res!200077 (and (= (size!9900 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9899 _keys!1456) (size!9900 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(assert (= (and start!35824 res!200080) b!359929))

(assert (= (and b!359929 res!200077) b!359923))

(assert (= (and b!359923 res!200076) b!359926))

(assert (= (and b!359926 res!200078) b!359920))

(assert (= (and b!359920 res!200079) b!359924))

(assert (= (and b!359924 res!200083) b!359925))

(assert (= (and b!359925 res!200081) b!359919))

(assert (= (and b!359919 res!200082) b!359921))

(assert (= (and b!359922 condMapEmpty!13923) mapIsEmpty!13923))

(assert (= (and b!359922 (not condMapEmpty!13923)) mapNonEmpty!13923))

(get-info :version)

(assert (= (and mapNonEmpty!13923 ((_ is ValueCellFull!3795) mapValue!13923)) b!359928))

(assert (= (and b!359922 ((_ is ValueCellFull!3795) mapDefault!13923)) b!359927))

(assert (= start!35824 b!359922))

(declare-fun m!357257 () Bool)

(assert (=> b!359921 m!357257))

(declare-fun m!357259 () Bool)

(assert (=> b!359921 m!357259))

(declare-fun m!357261 () Bool)

(assert (=> b!359920 m!357261))

(declare-fun m!357263 () Bool)

(assert (=> b!359923 m!357263))

(declare-fun m!357265 () Bool)

(assert (=> start!35824 m!357265))

(declare-fun m!357267 () Bool)

(assert (=> start!35824 m!357267))

(declare-fun m!357269 () Bool)

(assert (=> start!35824 m!357269))

(declare-fun m!357271 () Bool)

(assert (=> b!359926 m!357271))

(declare-fun m!357273 () Bool)

(assert (=> mapNonEmpty!13923 m!357273))

(declare-fun m!357275 () Bool)

(assert (=> b!359925 m!357275))

(declare-fun m!357277 () Bool)

(assert (=> b!359919 m!357277))

(check-sat (not b!359920) (not b!359926) (not b!359923) tp_is_empty!8277 (not mapNonEmpty!13923) (not start!35824) (not b!359925) (not b!359921))
(check-sat)
