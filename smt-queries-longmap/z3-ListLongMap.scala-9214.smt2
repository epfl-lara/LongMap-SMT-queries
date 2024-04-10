; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110634 () Bool)

(assert start!110634)

(declare-fun b_free!29469 () Bool)

(declare-fun b_next!29469 () Bool)

(assert (=> start!110634 (= b_free!29469 (not b_next!29469))))

(declare-fun tp!103728 () Bool)

(declare-fun b_and!47677 () Bool)

(assert (=> start!110634 (= tp!103728 b_and!47677)))

(declare-fun res!869024 () Bool)

(declare-fun e!746882 () Bool)

(assert (=> start!110634 (=> (not res!869024) (not e!746882))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110634 (= res!869024 (validMask!0 mask!2040))))

(assert (=> start!110634 e!746882))

(assert (=> start!110634 tp!103728))

(declare-datatypes ((array!87392 0))(
  ( (array!87393 (arr!42176 (Array (_ BitVec 32) (_ BitVec 64))) (size!42726 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87392)

(declare-fun array_inv!31877 (array!87392) Bool)

(assert (=> start!110634 (array_inv!31877 _keys!1628)))

(assert (=> start!110634 true))

(declare-fun tp_is_empty!35199 () Bool)

(assert (=> start!110634 tp_is_empty!35199))

(declare-datatypes ((V!52035 0))(
  ( (V!52036 (val!17674 Int)) )
))
(declare-datatypes ((ValueCell!16701 0))(
  ( (ValueCellFull!16701 (v!20301 V!52035)) (EmptyCell!16701) )
))
(declare-datatypes ((array!87394 0))(
  ( (array!87395 (arr!42177 (Array (_ BitVec 32) ValueCell!16701)) (size!42727 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87394)

(declare-fun e!746881 () Bool)

(declare-fun array_inv!31878 (array!87394) Bool)

(assert (=> start!110634 (and (array_inv!31878 _values!1354) e!746881)))

(declare-fun mapNonEmpty!54427 () Bool)

(declare-fun mapRes!54427 () Bool)

(declare-fun tp!103729 () Bool)

(declare-fun e!746878 () Bool)

(assert (=> mapNonEmpty!54427 (= mapRes!54427 (and tp!103729 e!746878))))

(declare-fun mapValue!54427 () ValueCell!16701)

(declare-fun mapRest!54427 () (Array (_ BitVec 32) ValueCell!16701))

(declare-fun mapKey!54427 () (_ BitVec 32))

(assert (=> mapNonEmpty!54427 (= (arr!42177 _values!1354) (store mapRest!54427 mapKey!54427 mapValue!54427))))

(declare-fun b!1309091 () Bool)

(assert (=> b!1309091 (= e!746878 tp_is_empty!35199)))

(declare-fun b!1309092 () Bool)

(declare-fun res!869027 () Bool)

(assert (=> b!1309092 (=> (not res!869027) (not e!746882))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1309092 (= res!869027 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42726 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1309093 () Bool)

(assert (=> b!1309093 (= e!746882 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52035)

(declare-fun lt!585222 () Bool)

(declare-fun zeroValue!1296 () V!52035)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22758 0))(
  ( (tuple2!22759 (_1!11390 (_ BitVec 64)) (_2!11390 V!52035)) )
))
(declare-datatypes ((List!29900 0))(
  ( (Nil!29897) (Cons!29896 (h!31105 tuple2!22758) (t!43506 List!29900)) )
))
(declare-datatypes ((ListLongMap!20415 0))(
  ( (ListLongMap!20416 (toList!10223 List!29900)) )
))
(declare-fun contains!8373 (ListLongMap!20415 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5236 (array!87392 array!87394 (_ BitVec 32) (_ BitVec 32) V!52035 V!52035 (_ BitVec 32) Int) ListLongMap!20415)

(assert (=> b!1309093 (= lt!585222 (contains!8373 (getCurrentListMap!5236 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1309094 () Bool)

(declare-fun e!746879 () Bool)

(assert (=> b!1309094 (= e!746879 tp_is_empty!35199)))

(declare-fun mapIsEmpty!54427 () Bool)

(assert (=> mapIsEmpty!54427 mapRes!54427))

(declare-fun b!1309095 () Bool)

(declare-fun res!869025 () Bool)

(assert (=> b!1309095 (=> (not res!869025) (not e!746882))))

(assert (=> b!1309095 (= res!869025 (and (= (size!42727 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42726 _keys!1628) (size!42727 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1309096 () Bool)

(assert (=> b!1309096 (= e!746881 (and e!746879 mapRes!54427))))

(declare-fun condMapEmpty!54427 () Bool)

(declare-fun mapDefault!54427 () ValueCell!16701)

(assert (=> b!1309096 (= condMapEmpty!54427 (= (arr!42177 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16701)) mapDefault!54427)))))

(declare-fun b!1309097 () Bool)

(declare-fun res!869028 () Bool)

(assert (=> b!1309097 (=> (not res!869028) (not e!746882))))

(declare-datatypes ((List!29901 0))(
  ( (Nil!29898) (Cons!29897 (h!31106 (_ BitVec 64)) (t!43507 List!29901)) )
))
(declare-fun arrayNoDuplicates!0 (array!87392 (_ BitVec 32) List!29901) Bool)

(assert (=> b!1309097 (= res!869028 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29898))))

(declare-fun b!1309098 () Bool)

(declare-fun res!869026 () Bool)

(assert (=> b!1309098 (=> (not res!869026) (not e!746882))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87392 (_ BitVec 32)) Bool)

(assert (=> b!1309098 (= res!869026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(assert (= (and start!110634 res!869024) b!1309095))

(assert (= (and b!1309095 res!869025) b!1309098))

(assert (= (and b!1309098 res!869026) b!1309097))

(assert (= (and b!1309097 res!869028) b!1309092))

(assert (= (and b!1309092 res!869027) b!1309093))

(assert (= (and b!1309096 condMapEmpty!54427) mapIsEmpty!54427))

(assert (= (and b!1309096 (not condMapEmpty!54427)) mapNonEmpty!54427))

(get-info :version)

(assert (= (and mapNonEmpty!54427 ((_ is ValueCellFull!16701) mapValue!54427)) b!1309091))

(assert (= (and b!1309096 ((_ is ValueCellFull!16701) mapDefault!54427)) b!1309094))

(assert (= start!110634 b!1309096))

(declare-fun m!1199287 () Bool)

(assert (=> b!1309093 m!1199287))

(assert (=> b!1309093 m!1199287))

(declare-fun m!1199289 () Bool)

(assert (=> b!1309093 m!1199289))

(declare-fun m!1199291 () Bool)

(assert (=> start!110634 m!1199291))

(declare-fun m!1199293 () Bool)

(assert (=> start!110634 m!1199293))

(declare-fun m!1199295 () Bool)

(assert (=> start!110634 m!1199295))

(declare-fun m!1199297 () Bool)

(assert (=> b!1309098 m!1199297))

(declare-fun m!1199299 () Bool)

(assert (=> b!1309097 m!1199299))

(declare-fun m!1199301 () Bool)

(assert (=> mapNonEmpty!54427 m!1199301))

(check-sat b_and!47677 (not b!1309093) (not b!1309098) tp_is_empty!35199 (not start!110634) (not b_next!29469) (not b!1309097) (not mapNonEmpty!54427))
(check-sat b_and!47677 (not b_next!29469))
