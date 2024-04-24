; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74708 () Bool)

(assert start!74708)

(declare-fun b_free!15229 () Bool)

(declare-fun b_next!15229 () Bool)

(assert (=> start!74708 (= b_free!15229 (not b_next!15229))))

(declare-fun tp!53370 () Bool)

(declare-fun b_and!25115 () Bool)

(assert (=> start!74708 (= tp!53370 b_and!25115)))

(declare-fun mapNonEmpty!27825 () Bool)

(declare-fun mapRes!27825 () Bool)

(declare-fun tp!53369 () Bool)

(declare-fun e!489337 () Bool)

(assert (=> mapNonEmpty!27825 (= mapRes!27825 (and tp!53369 e!489337))))

(declare-datatypes ((V!28345 0))(
  ( (V!28346 (val!8784 Int)) )
))
(declare-datatypes ((ValueCell!8297 0))(
  ( (ValueCellFull!8297 (v!11224 V!28345)) (EmptyCell!8297) )
))
(declare-datatypes ((array!51115 0))(
  ( (array!51116 (arr!24579 (Array (_ BitVec 32) ValueCell!8297)) (size!25020 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51115)

(declare-fun mapKey!27825 () (_ BitVec 32))

(declare-fun mapRest!27825 () (Array (_ BitVec 32) ValueCell!8297))

(declare-fun mapValue!27825 () ValueCell!8297)

(assert (=> mapNonEmpty!27825 (= (arr!24579 _values!688) (store mapRest!27825 mapKey!27825 mapValue!27825))))

(declare-fun b!879017 () Bool)

(declare-fun res!596892 () Bool)

(declare-fun e!489336 () Bool)

(assert (=> b!879017 (=> (not res!596892) (not e!489336))))

(declare-datatypes ((array!51117 0))(
  ( (array!51118 (arr!24580 (Array (_ BitVec 32) (_ BitVec 64))) (size!25021 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51117)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51117 (_ BitVec 32)) Bool)

(assert (=> b!879017 (= res!596892 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!879018 () Bool)

(declare-fun e!489335 () Bool)

(declare-fun tp_is_empty!17473 () Bool)

(assert (=> b!879018 (= e!489335 tp_is_empty!17473)))

(declare-fun b!879019 () Bool)

(declare-fun res!596895 () Bool)

(assert (=> b!879019 (=> (not res!596895) (not e!489336))))

(declare-datatypes ((List!17388 0))(
  ( (Nil!17385) (Cons!17384 (h!18521 (_ BitVec 64)) (t!24469 List!17388)) )
))
(declare-fun arrayNoDuplicates!0 (array!51117 (_ BitVec 32) List!17388) Bool)

(assert (=> b!879019 (= res!596895 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17385))))

(declare-fun b!879020 () Bool)

(assert (=> b!879020 (= e!489337 tp_is_empty!17473)))

(declare-fun b!879021 () Bool)

(assert (=> b!879021 (= e!489336 false)))

(declare-datatypes ((tuple2!11554 0))(
  ( (tuple2!11555 (_1!5788 (_ BitVec 64)) (_2!5788 V!28345)) )
))
(declare-datatypes ((List!17389 0))(
  ( (Nil!17386) (Cons!17385 (h!18522 tuple2!11554) (t!24470 List!17389)) )
))
(declare-datatypes ((ListLongMap!10325 0))(
  ( (ListLongMap!10326 (toList!5178 List!17389)) )
))
(declare-fun lt!397558 () ListLongMap!10325)

(declare-fun v!557 () V!28345)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!28345)

(declare-fun zeroValue!654 () V!28345)

(declare-fun getCurrentListMapNoExtraKeys!3220 (array!51117 array!51115 (_ BitVec 32) (_ BitVec 32) V!28345 V!28345 (_ BitVec 32) Int) ListLongMap!10325)

(assert (=> b!879021 (= lt!397558 (getCurrentListMapNoExtraKeys!3220 _keys!868 (array!51116 (store (arr!24579 _values!688) i!612 (ValueCellFull!8297 v!557)) (size!25020 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397557 () ListLongMap!10325)

(assert (=> b!879021 (= lt!397557 (getCurrentListMapNoExtraKeys!3220 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!879022 () Bool)

(declare-fun res!596890 () Bool)

(assert (=> b!879022 (=> (not res!596890) (not e!489336))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!879022 (= res!596890 (validMask!0 mask!1196))))

(declare-fun res!596891 () Bool)

(assert (=> start!74708 (=> (not res!596891) (not e!489336))))

(assert (=> start!74708 (= res!596891 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25021 _keys!868))))))

(assert (=> start!74708 e!489336))

(assert (=> start!74708 tp_is_empty!17473))

(assert (=> start!74708 true))

(assert (=> start!74708 tp!53370))

(declare-fun array_inv!19418 (array!51117) Bool)

(assert (=> start!74708 (array_inv!19418 _keys!868)))

(declare-fun e!489333 () Bool)

(declare-fun array_inv!19419 (array!51115) Bool)

(assert (=> start!74708 (and (array_inv!19419 _values!688) e!489333)))

(declare-fun mapIsEmpty!27825 () Bool)

(assert (=> mapIsEmpty!27825 mapRes!27825))

(declare-fun b!879023 () Bool)

(declare-fun res!596896 () Bool)

(assert (=> b!879023 (=> (not res!596896) (not e!489336))))

(assert (=> b!879023 (= res!596896 (and (= (size!25020 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25021 _keys!868) (size!25020 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!879024 () Bool)

(assert (=> b!879024 (= e!489333 (and e!489335 mapRes!27825))))

(declare-fun condMapEmpty!27825 () Bool)

(declare-fun mapDefault!27825 () ValueCell!8297)

(assert (=> b!879024 (= condMapEmpty!27825 (= (arr!24579 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8297)) mapDefault!27825)))))

(declare-fun b!879025 () Bool)

(declare-fun res!596889 () Bool)

(assert (=> b!879025 (=> (not res!596889) (not e!489336))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!879025 (= res!596889 (and (= (select (arr!24580 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!879026 () Bool)

(declare-fun res!596893 () Bool)

(assert (=> b!879026 (=> (not res!596893) (not e!489336))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!879026 (= res!596893 (validKeyInArray!0 k0!854))))

(declare-fun b!879027 () Bool)

(declare-fun res!596894 () Bool)

(assert (=> b!879027 (=> (not res!596894) (not e!489336))))

(assert (=> b!879027 (= res!596894 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25021 _keys!868))))))

(assert (= (and start!74708 res!596891) b!879022))

(assert (= (and b!879022 res!596890) b!879023))

(assert (= (and b!879023 res!596896) b!879017))

(assert (= (and b!879017 res!596892) b!879019))

(assert (= (and b!879019 res!596895) b!879027))

(assert (= (and b!879027 res!596894) b!879026))

(assert (= (and b!879026 res!596893) b!879025))

(assert (= (and b!879025 res!596889) b!879021))

(assert (= (and b!879024 condMapEmpty!27825) mapIsEmpty!27825))

(assert (= (and b!879024 (not condMapEmpty!27825)) mapNonEmpty!27825))

(get-info :version)

(assert (= (and mapNonEmpty!27825 ((_ is ValueCellFull!8297) mapValue!27825)) b!879020))

(assert (= (and b!879024 ((_ is ValueCellFull!8297) mapDefault!27825)) b!879018))

(assert (= start!74708 b!879024))

(declare-fun m!819387 () Bool)

(assert (=> b!879025 m!819387))

(declare-fun m!819389 () Bool)

(assert (=> b!879019 m!819389))

(declare-fun m!819391 () Bool)

(assert (=> mapNonEmpty!27825 m!819391))

(declare-fun m!819393 () Bool)

(assert (=> b!879026 m!819393))

(declare-fun m!819395 () Bool)

(assert (=> b!879022 m!819395))

(declare-fun m!819397 () Bool)

(assert (=> b!879021 m!819397))

(declare-fun m!819399 () Bool)

(assert (=> b!879021 m!819399))

(declare-fun m!819401 () Bool)

(assert (=> b!879021 m!819401))

(declare-fun m!819403 () Bool)

(assert (=> b!879017 m!819403))

(declare-fun m!819405 () Bool)

(assert (=> start!74708 m!819405))

(declare-fun m!819407 () Bool)

(assert (=> start!74708 m!819407))

(check-sat (not b!879017) tp_is_empty!17473 (not b_next!15229) (not b!879026) (not b!879019) (not b!879022) b_and!25115 (not start!74708) (not mapNonEmpty!27825) (not b!879021))
(check-sat b_and!25115 (not b_next!15229))
