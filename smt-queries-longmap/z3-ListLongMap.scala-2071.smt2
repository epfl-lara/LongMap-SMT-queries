; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35596 () Bool)

(assert start!35596)

(declare-fun b!357021 () Bool)

(declare-fun res!198208 () Bool)

(declare-fun e!218664 () Bool)

(assert (=> b!357021 (=> (not res!198208) (not e!218664))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((array!19665 0))(
  ( (array!19666 (arr!9326 (Array (_ BitVec 32) (_ BitVec 64))) (size!9678 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19665)

(assert (=> b!357021 (= res!198208 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9678 _keys!1456))))))

(declare-fun b!357022 () Bool)

(declare-fun res!198205 () Bool)

(assert (=> b!357022 (=> (not res!198205) (not e!218664))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19665 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357022 (= res!198205 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!357023 () Bool)

(assert (=> b!357023 (= e!218664 (not true))))

(assert (=> b!357023 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((V!11709 0))(
  ( (V!11710 (val!4069 Int)) )
))
(declare-fun minValue!1150 () V!11709)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((ValueCell!3681 0))(
  ( (ValueCellFull!3681 (v!6263 V!11709)) (EmptyCell!3681) )
))
(declare-datatypes ((array!19667 0))(
  ( (array!19668 (arr!9327 (Array (_ BitVec 32) ValueCell!3681)) (size!9679 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19667)

(declare-datatypes ((Unit!10996 0))(
  ( (Unit!10997) )
))
(declare-fun lt!165989 () Unit!10996)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11709)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!17 (array!19665 array!19667 (_ BitVec 32) (_ BitVec 32) V!11709 V!11709 (_ BitVec 64) (_ BitVec 32)) Unit!10996)

(assert (=> b!357023 (= lt!165989 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!17 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!357024 () Bool)

(declare-fun res!198209 () Bool)

(assert (=> b!357024 (=> (not res!198209) (not e!218664))))

(assert (=> b!357024 (= res!198209 (not (= (select (arr!9326 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!357025 () Bool)

(declare-fun e!218662 () Bool)

(declare-fun tp_is_empty!8049 () Bool)

(assert (=> b!357025 (= e!218662 tp_is_empty!8049)))

(declare-fun b!357026 () Bool)

(declare-fun res!198206 () Bool)

(assert (=> b!357026 (=> (not res!198206) (not e!218664))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19665 (_ BitVec 32)) Bool)

(assert (=> b!357026 (= res!198206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapIsEmpty!13581 () Bool)

(declare-fun mapRes!13581 () Bool)

(assert (=> mapIsEmpty!13581 mapRes!13581))

(declare-fun b!357027 () Bool)

(declare-fun res!198211 () Bool)

(assert (=> b!357027 (=> (not res!198211) (not e!218664))))

(assert (=> b!357027 (= res!198211 (and (= (size!9679 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9678 _keys!1456) (size!9679 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!357028 () Bool)

(declare-fun e!218665 () Bool)

(assert (=> b!357028 (= e!218665 (and e!218662 mapRes!13581))))

(declare-fun condMapEmpty!13581 () Bool)

(declare-fun mapDefault!13581 () ValueCell!3681)

(assert (=> b!357028 (= condMapEmpty!13581 (= (arr!9327 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3681)) mapDefault!13581)))))

(declare-fun b!357029 () Bool)

(declare-fun res!198210 () Bool)

(assert (=> b!357029 (=> (not res!198210) (not e!218664))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357029 (= res!198210 (validKeyInArray!0 k0!1077))))

(declare-fun res!198207 () Bool)

(assert (=> start!35596 (=> (not res!198207) (not e!218664))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35596 (= res!198207 (validMask!0 mask!1842))))

(assert (=> start!35596 e!218664))

(assert (=> start!35596 tp_is_empty!8049))

(assert (=> start!35596 true))

(declare-fun array_inv!6856 (array!19665) Bool)

(assert (=> start!35596 (array_inv!6856 _keys!1456)))

(declare-fun array_inv!6857 (array!19667) Bool)

(assert (=> start!35596 (and (array_inv!6857 _values!1208) e!218665)))

(declare-fun b!357030 () Bool)

(declare-fun res!198204 () Bool)

(assert (=> b!357030 (=> (not res!198204) (not e!218664))))

(declare-datatypes ((List!5383 0))(
  ( (Nil!5380) (Cons!5379 (h!6235 (_ BitVec 64)) (t!10533 List!5383)) )
))
(declare-fun arrayNoDuplicates!0 (array!19665 (_ BitVec 32) List!5383) Bool)

(assert (=> b!357030 (= res!198204 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5380))))

(declare-fun mapNonEmpty!13581 () Bool)

(declare-fun tp!27558 () Bool)

(declare-fun e!218666 () Bool)

(assert (=> mapNonEmpty!13581 (= mapRes!13581 (and tp!27558 e!218666))))

(declare-fun mapRest!13581 () (Array (_ BitVec 32) ValueCell!3681))

(declare-fun mapKey!13581 () (_ BitVec 32))

(declare-fun mapValue!13581 () ValueCell!3681)

(assert (=> mapNonEmpty!13581 (= (arr!9327 _values!1208) (store mapRest!13581 mapKey!13581 mapValue!13581))))

(declare-fun b!357031 () Bool)

(assert (=> b!357031 (= e!218666 tp_is_empty!8049)))

(assert (= (and start!35596 res!198207) b!357027))

(assert (= (and b!357027 res!198211) b!357026))

(assert (= (and b!357026 res!198206) b!357030))

(assert (= (and b!357030 res!198204) b!357029))

(assert (= (and b!357029 res!198210) b!357021))

(assert (= (and b!357021 res!198208) b!357022))

(assert (= (and b!357022 res!198205) b!357024))

(assert (= (and b!357024 res!198209) b!357023))

(assert (= (and b!357028 condMapEmpty!13581) mapIsEmpty!13581))

(assert (= (and b!357028 (not condMapEmpty!13581)) mapNonEmpty!13581))

(get-info :version)

(assert (= (and mapNonEmpty!13581 ((_ is ValueCellFull!3681) mapValue!13581)) b!357031))

(assert (= (and b!357028 ((_ is ValueCellFull!3681) mapDefault!13581)) b!357025))

(assert (= start!35596 b!357028))

(declare-fun m!355223 () Bool)

(assert (=> b!357029 m!355223))

(declare-fun m!355225 () Bool)

(assert (=> start!35596 m!355225))

(declare-fun m!355227 () Bool)

(assert (=> start!35596 m!355227))

(declare-fun m!355229 () Bool)

(assert (=> start!35596 m!355229))

(declare-fun m!355231 () Bool)

(assert (=> b!357030 m!355231))

(declare-fun m!355233 () Bool)

(assert (=> b!357024 m!355233))

(declare-fun m!355235 () Bool)

(assert (=> b!357026 m!355235))

(declare-fun m!355237 () Bool)

(assert (=> b!357023 m!355237))

(declare-fun m!355239 () Bool)

(assert (=> b!357023 m!355239))

(declare-fun m!355241 () Bool)

(assert (=> b!357022 m!355241))

(declare-fun m!355243 () Bool)

(assert (=> mapNonEmpty!13581 m!355243))

(check-sat (not b!357030) tp_is_empty!8049 (not b!357022) (not mapNonEmpty!13581) (not b!357023) (not b!357029) (not start!35596) (not b!357026))
(check-sat)
