; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83976 () Bool)

(assert start!83976)

(declare-fun b_free!19731 () Bool)

(declare-fun b_next!19731 () Bool)

(assert (=> start!83976 (= b_free!19731 (not b_next!19731))))

(declare-fun tp!68716 () Bool)

(declare-fun b_and!31549 () Bool)

(assert (=> start!83976 (= tp!68716 b_and!31549)))

(declare-fun b!981342 () Bool)

(declare-fun res!656691 () Bool)

(declare-fun e!553232 () Bool)

(assert (=> b!981342 (=> (not res!656691) (not e!553232))))

(declare-datatypes ((array!61555 0))(
  ( (array!61556 (arr!29635 (Array (_ BitVec 32) (_ BitVec 64))) (size!30114 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61555)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61555 (_ BitVec 32)) Bool)

(assert (=> b!981342 (= res!656691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!981343 () Bool)

(assert (=> b!981343 (= e!553232 false)))

(declare-datatypes ((V!35355 0))(
  ( (V!35356 (val!11440 Int)) )
))
(declare-fun minValue!1220 () V!35355)

(declare-datatypes ((ValueCell!10908 0))(
  ( (ValueCellFull!10908 (v!14002 V!35355)) (EmptyCell!10908) )
))
(declare-datatypes ((array!61557 0))(
  ( (array!61558 (arr!29636 (Array (_ BitVec 32) ValueCell!10908)) (size!30115 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61557)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((tuple2!14640 0))(
  ( (tuple2!14641 (_1!7331 (_ BitVec 64)) (_2!7331 V!35355)) )
))
(declare-datatypes ((List!20525 0))(
  ( (Nil!20522) (Cons!20521 (h!21683 tuple2!14640) (t!29208 List!20525)) )
))
(declare-datatypes ((ListLongMap!13337 0))(
  ( (ListLongMap!13338 (toList!6684 List!20525)) )
))
(declare-fun lt!435677 () ListLongMap!13337)

(declare-fun zeroValue!1220 () V!35355)

(declare-fun defaultEntry!1281 () Int)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3386 (array!61555 array!61557 (_ BitVec 32) (_ BitVec 32) V!35355 V!35355 (_ BitVec 32) Int) ListLongMap!13337)

(assert (=> b!981343 (= lt!435677 (getCurrentListMapNoExtraKeys!3386 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!981344 () Bool)

(declare-fun res!656690 () Bool)

(assert (=> b!981344 (=> (not res!656690) (not e!553232))))

(assert (=> b!981344 (= res!656690 (and (= (size!30115 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30114 _keys!1544) (size!30115 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!981345 () Bool)

(declare-fun res!656687 () Bool)

(assert (=> b!981345 (=> (not res!656687) (not e!553232))))

(assert (=> b!981345 (= res!656687 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!36197 () Bool)

(declare-fun mapRes!36197 () Bool)

(assert (=> mapIsEmpty!36197 mapRes!36197))

(declare-fun res!656689 () Bool)

(assert (=> start!83976 (=> (not res!656689) (not e!553232))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83976 (= res!656689 (validMask!0 mask!1948))))

(assert (=> start!83976 e!553232))

(assert (=> start!83976 true))

(declare-fun tp_is_empty!22779 () Bool)

(assert (=> start!83976 tp_is_empty!22779))

(declare-fun e!553233 () Bool)

(declare-fun array_inv!22913 (array!61557) Bool)

(assert (=> start!83976 (and (array_inv!22913 _values!1278) e!553233)))

(assert (=> start!83976 tp!68716))

(declare-fun array_inv!22914 (array!61555) Bool)

(assert (=> start!83976 (array_inv!22914 _keys!1544)))

(declare-fun b!981346 () Bool)

(declare-fun e!553230 () Bool)

(assert (=> b!981346 (= e!553230 tp_is_empty!22779)))

(declare-fun b!981347 () Bool)

(declare-fun res!656688 () Bool)

(assert (=> b!981347 (=> (not res!656688) (not e!553232))))

(declare-datatypes ((List!20526 0))(
  ( (Nil!20523) (Cons!20522 (h!21684 (_ BitVec 64)) (t!29209 List!20526)) )
))
(declare-fun arrayNoDuplicates!0 (array!61555 (_ BitVec 32) List!20526) Bool)

(assert (=> b!981347 (= res!656688 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20523))))

(declare-fun b!981348 () Bool)

(declare-fun res!656693 () Bool)

(assert (=> b!981348 (=> (not res!656693) (not e!553232))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!981348 (= res!656693 (validKeyInArray!0 (select (arr!29635 _keys!1544) from!1932)))))

(declare-fun b!981349 () Bool)

(declare-fun res!656692 () Bool)

(assert (=> b!981349 (=> (not res!656692) (not e!553232))))

(assert (=> b!981349 (= res!656692 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30114 _keys!1544))))))

(declare-fun b!981350 () Bool)

(declare-fun e!553231 () Bool)

(assert (=> b!981350 (= e!553231 tp_is_empty!22779)))

(declare-fun b!981351 () Bool)

(assert (=> b!981351 (= e!553233 (and e!553230 mapRes!36197))))

(declare-fun condMapEmpty!36197 () Bool)

(declare-fun mapDefault!36197 () ValueCell!10908)

(assert (=> b!981351 (= condMapEmpty!36197 (= (arr!29636 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10908)) mapDefault!36197)))))

(declare-fun mapNonEmpty!36197 () Bool)

(declare-fun tp!68715 () Bool)

(assert (=> mapNonEmpty!36197 (= mapRes!36197 (and tp!68715 e!553231))))

(declare-fun mapValue!36197 () ValueCell!10908)

(declare-fun mapRest!36197 () (Array (_ BitVec 32) ValueCell!10908))

(declare-fun mapKey!36197 () (_ BitVec 32))

(assert (=> mapNonEmpty!36197 (= (arr!29636 _values!1278) (store mapRest!36197 mapKey!36197 mapValue!36197))))

(assert (= (and start!83976 res!656689) b!981344))

(assert (= (and b!981344 res!656690) b!981342))

(assert (= (and b!981342 res!656691) b!981347))

(assert (= (and b!981347 res!656688) b!981349))

(assert (= (and b!981349 res!656692) b!981348))

(assert (= (and b!981348 res!656693) b!981345))

(assert (= (and b!981345 res!656687) b!981343))

(assert (= (and b!981351 condMapEmpty!36197) mapIsEmpty!36197))

(assert (= (and b!981351 (not condMapEmpty!36197)) mapNonEmpty!36197))

(get-info :version)

(assert (= (and mapNonEmpty!36197 ((_ is ValueCellFull!10908) mapValue!36197)) b!981350))

(assert (= (and b!981351 ((_ is ValueCellFull!10908) mapDefault!36197)) b!981346))

(assert (= start!83976 b!981351))

(declare-fun m!908737 () Bool)

(assert (=> start!83976 m!908737))

(declare-fun m!908739 () Bool)

(assert (=> start!83976 m!908739))

(declare-fun m!908741 () Bool)

(assert (=> start!83976 m!908741))

(declare-fun m!908743 () Bool)

(assert (=> mapNonEmpty!36197 m!908743))

(declare-fun m!908745 () Bool)

(assert (=> b!981347 m!908745))

(declare-fun m!908747 () Bool)

(assert (=> b!981343 m!908747))

(declare-fun m!908749 () Bool)

(assert (=> b!981342 m!908749))

(declare-fun m!908751 () Bool)

(assert (=> b!981348 m!908751))

(assert (=> b!981348 m!908751))

(declare-fun m!908753 () Bool)

(assert (=> b!981348 m!908753))

(check-sat b_and!31549 (not b_next!19731) (not b!981342) (not b!981347) tp_is_empty!22779 (not b!981343) (not mapNonEmpty!36197) (not b!981348) (not start!83976))
(check-sat b_and!31549 (not b_next!19731))
