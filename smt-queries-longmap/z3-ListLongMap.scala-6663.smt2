; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83952 () Bool)

(assert start!83952)

(declare-fun b!981079 () Bool)

(declare-fun e!553053 () Bool)

(assert (=> b!981079 (= e!553053 false)))

(declare-fun lt!435650 () Bool)

(declare-datatypes ((array!61507 0))(
  ( (array!61508 (arr!29611 (Array (_ BitVec 32) (_ BitVec 64))) (size!30090 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61507)

(declare-datatypes ((List!20514 0))(
  ( (Nil!20511) (Cons!20510 (h!21672 (_ BitVec 64)) (t!29197 List!20514)) )
))
(declare-fun arrayNoDuplicates!0 (array!61507 (_ BitVec 32) List!20514) Bool)

(assert (=> b!981079 (= lt!435650 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20511))))

(declare-fun mapNonEmpty!36161 () Bool)

(declare-fun mapRes!36161 () Bool)

(declare-fun tp!68674 () Bool)

(declare-fun e!553051 () Bool)

(assert (=> mapNonEmpty!36161 (= mapRes!36161 (and tp!68674 e!553051))))

(declare-datatypes ((V!35323 0))(
  ( (V!35324 (val!11428 Int)) )
))
(declare-datatypes ((ValueCell!10896 0))(
  ( (ValueCellFull!10896 (v!13990 V!35323)) (EmptyCell!10896) )
))
(declare-datatypes ((array!61509 0))(
  ( (array!61510 (arr!29612 (Array (_ BitVec 32) ValueCell!10896)) (size!30091 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61509)

(declare-fun mapKey!36161 () (_ BitVec 32))

(declare-fun mapValue!36161 () ValueCell!10896)

(declare-fun mapRest!36161 () (Array (_ BitVec 32) ValueCell!10896))

(assert (=> mapNonEmpty!36161 (= (arr!29612 _values!1278) (store mapRest!36161 mapKey!36161 mapValue!36161))))

(declare-fun b!981080 () Bool)

(declare-fun e!553050 () Bool)

(declare-fun tp_is_empty!22755 () Bool)

(assert (=> b!981080 (= e!553050 tp_is_empty!22755)))

(declare-fun b!981081 () Bool)

(declare-fun res!656532 () Bool)

(assert (=> b!981081 (=> (not res!656532) (not e!553053))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61507 (_ BitVec 32)) Bool)

(assert (=> b!981081 (= res!656532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!656533 () Bool)

(assert (=> start!83952 (=> (not res!656533) (not e!553053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83952 (= res!656533 (validMask!0 mask!1948))))

(assert (=> start!83952 e!553053))

(assert (=> start!83952 true))

(declare-fun e!553049 () Bool)

(declare-fun array_inv!22891 (array!61509) Bool)

(assert (=> start!83952 (and (array_inv!22891 _values!1278) e!553049)))

(declare-fun array_inv!22892 (array!61507) Bool)

(assert (=> start!83952 (array_inv!22892 _keys!1544)))

(declare-fun b!981082 () Bool)

(declare-fun res!656534 () Bool)

(assert (=> b!981082 (=> (not res!656534) (not e!553053))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!981082 (= res!656534 (and (= (size!30091 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30090 _keys!1544) (size!30091 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!981083 () Bool)

(assert (=> b!981083 (= e!553049 (and e!553050 mapRes!36161))))

(declare-fun condMapEmpty!36161 () Bool)

(declare-fun mapDefault!36161 () ValueCell!10896)

(assert (=> b!981083 (= condMapEmpty!36161 (= (arr!29612 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10896)) mapDefault!36161)))))

(declare-fun b!981084 () Bool)

(assert (=> b!981084 (= e!553051 tp_is_empty!22755)))

(declare-fun mapIsEmpty!36161 () Bool)

(assert (=> mapIsEmpty!36161 mapRes!36161))

(assert (= (and start!83952 res!656533) b!981082))

(assert (= (and b!981082 res!656534) b!981081))

(assert (= (and b!981081 res!656532) b!981079))

(assert (= (and b!981083 condMapEmpty!36161) mapIsEmpty!36161))

(assert (= (and b!981083 (not condMapEmpty!36161)) mapNonEmpty!36161))

(get-info :version)

(assert (= (and mapNonEmpty!36161 ((_ is ValueCellFull!10896) mapValue!36161)) b!981084))

(assert (= (and b!981083 ((_ is ValueCellFull!10896) mapDefault!36161)) b!981080))

(assert (= start!83952 b!981083))

(declare-fun m!908575 () Bool)

(assert (=> b!981079 m!908575))

(declare-fun m!908577 () Bool)

(assert (=> mapNonEmpty!36161 m!908577))

(declare-fun m!908579 () Bool)

(assert (=> b!981081 m!908579))

(declare-fun m!908581 () Bool)

(assert (=> start!83952 m!908581))

(declare-fun m!908583 () Bool)

(assert (=> start!83952 m!908583))

(declare-fun m!908585 () Bool)

(assert (=> start!83952 m!908585))

(check-sat tp_is_empty!22755 (not mapNonEmpty!36161) (not start!83952) (not b!981081) (not b!981079))
(check-sat)
