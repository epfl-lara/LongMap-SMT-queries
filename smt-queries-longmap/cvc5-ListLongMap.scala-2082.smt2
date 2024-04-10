; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35660 () Bool)

(assert start!35660)

(declare-fun b_free!7915 () Bool)

(declare-fun b_next!7915 () Bool)

(assert (=> start!35660 (= b_free!7915 (not b_next!7915))))

(declare-fun tp!27728 () Bool)

(declare-fun b_and!15157 () Bool)

(assert (=> start!35660 (= tp!27728 b_and!15157)))

(declare-fun b!358151 () Bool)

(declare-fun res!199050 () Bool)

(declare-fun e!219218 () Bool)

(assert (=> b!358151 (=> (not res!199050) (not e!219218))))

(declare-datatypes ((array!19793 0))(
  ( (array!19794 (arr!9390 (Array (_ BitVec 32) (_ BitVec 64))) (size!9742 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19793)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k!1077 () (_ BitVec 64))

(assert (=> b!358151 (= res!199050 (not (= (select (arr!9390 _keys!1456) from!1805) k!1077)))))

(declare-fun res!199046 () Bool)

(assert (=> start!35660 (=> (not res!199046) (not e!219218))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35660 (= res!199046 (validMask!0 mask!1842))))

(assert (=> start!35660 e!219218))

(declare-fun tp_is_empty!8113 () Bool)

(assert (=> start!35660 tp_is_empty!8113))

(assert (=> start!35660 true))

(assert (=> start!35660 tp!27728))

(declare-fun array_inv!6902 (array!19793) Bool)

(assert (=> start!35660 (array_inv!6902 _keys!1456)))

(declare-datatypes ((V!11795 0))(
  ( (V!11796 (val!4101 Int)) )
))
(declare-datatypes ((ValueCell!3713 0))(
  ( (ValueCellFull!3713 (v!6295 V!11795)) (EmptyCell!3713) )
))
(declare-datatypes ((array!19795 0))(
  ( (array!19796 (arr!9391 (Array (_ BitVec 32) ValueCell!3713)) (size!9743 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19795)

(declare-fun e!219219 () Bool)

(declare-fun array_inv!6903 (array!19795) Bool)

(assert (=> start!35660 (and (array_inv!6903 _values!1208) e!219219)))

(declare-fun mapNonEmpty!13677 () Bool)

(declare-fun mapRes!13677 () Bool)

(declare-fun tp!27729 () Bool)

(declare-fun e!219217 () Bool)

(assert (=> mapNonEmpty!13677 (= mapRes!13677 (and tp!27729 e!219217))))

(declare-fun mapRest!13677 () (Array (_ BitVec 32) ValueCell!3713))

(declare-fun mapValue!13677 () ValueCell!3713)

(declare-fun mapKey!13677 () (_ BitVec 32))

(assert (=> mapNonEmpty!13677 (= (arr!9391 _values!1208) (store mapRest!13677 mapKey!13677 mapValue!13677))))

(declare-fun b!358152 () Bool)

(declare-fun e!219221 () Bool)

(assert (=> b!358152 (= e!219218 (not e!219221))))

(declare-fun res!199048 () Bool)

(assert (=> b!358152 (=> res!199048 e!219221)))

(assert (=> b!358152 (= res!199048 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9742 _keys!1456))))))

(declare-fun arrayContainsKey!0 (array!19793 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!358152 (arrayContainsKey!0 _keys!1456 k!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!11795)

(declare-datatypes ((Unit!11046 0))(
  ( (Unit!11047) )
))
(declare-fun lt!166159 () Unit!11046)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11795)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!40 (array!19793 array!19795 (_ BitVec 32) (_ BitVec 32) V!11795 V!11795 (_ BitVec 64) (_ BitVec 32)) Unit!11046)

(assert (=> b!358152 (= lt!166159 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!40 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 from!1805))))

(declare-fun b!358153 () Bool)

(declare-fun res!199053 () Bool)

(assert (=> b!358153 (=> (not res!199053) (not e!219218))))

(assert (=> b!358153 (= res!199053 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9742 _keys!1456))))))

(declare-fun b!358154 () Bool)

(declare-fun res!199052 () Bool)

(assert (=> b!358154 (=> (not res!199052) (not e!219218))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19793 (_ BitVec 32)) Bool)

(assert (=> b!358154 (= res!199052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!358155 () Bool)

(declare-fun res!199051 () Bool)

(assert (=> b!358155 (=> (not res!199051) (not e!219218))))

(assert (=> b!358155 (= res!199051 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun b!358156 () Bool)

(declare-fun res!199054 () Bool)

(assert (=> b!358156 (=> (not res!199054) (not e!219218))))

(declare-datatypes ((List!5421 0))(
  ( (Nil!5418) (Cons!5417 (h!6273 (_ BitVec 64)) (t!10571 List!5421)) )
))
(declare-fun arrayNoDuplicates!0 (array!19793 (_ BitVec 32) List!5421) Bool)

(assert (=> b!358156 (= res!199054 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5418))))

(declare-fun b!358157 () Bool)

(declare-fun res!199047 () Bool)

(assert (=> b!358157 (=> (not res!199047) (not e!219218))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!358157 (= res!199047 (validKeyInArray!0 k!1077))))

(declare-fun b!358158 () Bool)

(declare-fun e!219216 () Bool)

(assert (=> b!358158 (= e!219216 tp_is_empty!8113)))

(declare-fun b!358159 () Bool)

(assert (=> b!358159 (= e!219221 (bvsle #b00000000000000000000000000000000 (size!9742 _keys!1456)))))

(declare-fun defaultEntry!1216 () Int)

(declare-datatypes ((tuple2!5726 0))(
  ( (tuple2!5727 (_1!2874 (_ BitVec 64)) (_2!2874 V!11795)) )
))
(declare-datatypes ((List!5422 0))(
  ( (Nil!5419) (Cons!5418 (h!6274 tuple2!5726) (t!10572 List!5422)) )
))
(declare-datatypes ((ListLongMap!4639 0))(
  ( (ListLongMap!4640 (toList!2335 List!5422)) )
))
(declare-fun contains!2415 (ListLongMap!4639 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1856 (array!19793 array!19795 (_ BitVec 32) (_ BitVec 32) V!11795 V!11795 (_ BitVec 32) Int) ListLongMap!4639)

(assert (=> b!358159 (contains!2415 (getCurrentListMap!1856 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) k!1077)))

(declare-fun lt!166160 () Unit!11046)

(declare-fun lemmaArrayContainsKeyThenInListMap!351 (array!19793 array!19795 (_ BitVec 32) (_ BitVec 32) V!11795 V!11795 (_ BitVec 64) (_ BitVec 32) Int) Unit!11046)

(assert (=> b!358159 (= lt!166160 (lemmaArrayContainsKeyThenInListMap!351 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 (bvadd #b00000000000000000000000000000001 from!1805) defaultEntry!1216))))

(declare-fun b!358160 () Bool)

(declare-fun res!199049 () Bool)

(assert (=> b!358160 (=> (not res!199049) (not e!219218))))

(assert (=> b!358160 (= res!199049 (and (= (size!9743 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9742 _keys!1456) (size!9743 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!358161 () Bool)

(assert (=> b!358161 (= e!219217 tp_is_empty!8113)))

(declare-fun mapIsEmpty!13677 () Bool)

(assert (=> mapIsEmpty!13677 mapRes!13677))

(declare-fun b!358162 () Bool)

(assert (=> b!358162 (= e!219219 (and e!219216 mapRes!13677))))

(declare-fun condMapEmpty!13677 () Bool)

(declare-fun mapDefault!13677 () ValueCell!3713)

