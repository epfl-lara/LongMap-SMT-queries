; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73888 () Bool)

(assert start!73888)

(declare-fun b_free!14821 () Bool)

(declare-fun b_next!14821 () Bool)

(assert (=> start!73888 (= b_free!14821 (not b_next!14821))))

(declare-fun tp!51968 () Bool)

(declare-fun b_and!24547 () Bool)

(assert (=> start!73888 (= tp!51968 b_and!24547)))

(declare-fun b!868192 () Bool)

(declare-fun res!589994 () Bool)

(declare-fun e!483539 () Bool)

(assert (=> b!868192 (=> (not res!589994) (not e!483539))))

(declare-datatypes ((array!50061 0))(
  ( (array!50062 (arr!24062 (Array (_ BitVec 32) (_ BitVec 64))) (size!24504 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50061)

(declare-datatypes ((List!17127 0))(
  ( (Nil!17124) (Cons!17123 (h!18254 (_ BitVec 64)) (t!24155 List!17127)) )
))
(declare-fun arrayNoDuplicates!0 (array!50061 (_ BitVec 32) List!17127) Bool)

(assert (=> b!868192 (= res!589994 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17124))))

(declare-fun b!868193 () Bool)

(declare-fun e!483538 () Bool)

(assert (=> b!868193 (= e!483538 (not true))))

(declare-datatypes ((V!27657 0))(
  ( (V!27658 (val!8526 Int)) )
))
(declare-fun v!557 () V!27657)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8039 0))(
  ( (ValueCellFull!8039 (v!10945 V!27657)) (EmptyCell!8039) )
))
(declare-datatypes ((array!50063 0))(
  ( (array!50064 (arr!24063 (Array (_ BitVec 32) ValueCell!8039)) (size!24505 (_ BitVec 32))) )
))
(declare-fun lt!394229 () array!50063)

(declare-fun _values!688 () array!50063)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!27657)

(declare-fun zeroValue!654 () V!27657)

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((tuple2!11342 0))(
  ( (tuple2!11343 (_1!5682 (_ BitVec 64)) (_2!5682 V!27657)) )
))
(declare-datatypes ((List!17128 0))(
  ( (Nil!17125) (Cons!17124 (h!18255 tuple2!11342) (t!24156 List!17128)) )
))
(declare-datatypes ((ListLongMap!10101 0))(
  ( (ListLongMap!10102 (toList!5066 List!17128)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3059 (array!50061 array!50063 (_ BitVec 32) (_ BitVec 32) V!27657 V!27657 (_ BitVec 32) Int) ListLongMap!10101)

(declare-fun +!2429 (ListLongMap!10101 tuple2!11342) ListLongMap!10101)

(assert (=> b!868193 (= (getCurrentListMapNoExtraKeys!3059 _keys!868 lt!394229 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2429 (getCurrentListMapNoExtraKeys!3059 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11343 k0!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29745 0))(
  ( (Unit!29746) )
))
(declare-fun lt!394231 () Unit!29745)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!597 (array!50061 array!50063 (_ BitVec 32) (_ BitVec 32) V!27657 V!27657 (_ BitVec 32) (_ BitVec 64) V!27657 (_ BitVec 32) Int) Unit!29745)

(assert (=> b!868193 (= lt!394231 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!597 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!868194 () Bool)

(declare-fun res!589989 () Bool)

(assert (=> b!868194 (=> (not res!589989) (not e!483539))))

(assert (=> b!868194 (= res!589989 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24504 _keys!868))))))

(declare-fun mapIsEmpty!27035 () Bool)

(declare-fun mapRes!27035 () Bool)

(assert (=> mapIsEmpty!27035 mapRes!27035))

(declare-fun b!868195 () Bool)

(declare-fun res!589991 () Bool)

(assert (=> b!868195 (=> (not res!589991) (not e!483539))))

(assert (=> b!868195 (= res!589991 (and (= (select (arr!24062 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!589995 () Bool)

(assert (=> start!73888 (=> (not res!589995) (not e!483539))))

(assert (=> start!73888 (= res!589995 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24504 _keys!868))))))

(assert (=> start!73888 e!483539))

(declare-fun tp_is_empty!16957 () Bool)

(assert (=> start!73888 tp_is_empty!16957))

(assert (=> start!73888 true))

(assert (=> start!73888 tp!51968))

(declare-fun array_inv!19082 (array!50061) Bool)

(assert (=> start!73888 (array_inv!19082 _keys!868)))

(declare-fun e!483541 () Bool)

(declare-fun array_inv!19083 (array!50063) Bool)

(assert (=> start!73888 (and (array_inv!19083 _values!688) e!483541)))

(declare-fun b!868196 () Bool)

(declare-fun e!483540 () Bool)

(assert (=> b!868196 (= e!483540 tp_is_empty!16957)))

(declare-fun b!868197 () Bool)

(declare-fun res!589992 () Bool)

(assert (=> b!868197 (=> (not res!589992) (not e!483539))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50061 (_ BitVec 32)) Bool)

(assert (=> b!868197 (= res!589992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!27035 () Bool)

(declare-fun tp!51967 () Bool)

(assert (=> mapNonEmpty!27035 (= mapRes!27035 (and tp!51967 e!483540))))

(declare-fun mapValue!27035 () ValueCell!8039)

(declare-fun mapRest!27035 () (Array (_ BitVec 32) ValueCell!8039))

(declare-fun mapKey!27035 () (_ BitVec 32))

(assert (=> mapNonEmpty!27035 (= (arr!24063 _values!688) (store mapRest!27035 mapKey!27035 mapValue!27035))))

(declare-fun b!868198 () Bool)

(declare-fun res!589993 () Bool)

(assert (=> b!868198 (=> (not res!589993) (not e!483539))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!868198 (= res!589993 (validMask!0 mask!1196))))

(declare-fun b!868199 () Bool)

(declare-fun res!589988 () Bool)

(assert (=> b!868199 (=> (not res!589988) (not e!483539))))

(assert (=> b!868199 (= res!589988 (and (= (size!24505 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24504 _keys!868) (size!24505 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!868200 () Bool)

(declare-fun res!589990 () Bool)

(assert (=> b!868200 (=> (not res!589990) (not e!483539))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!868200 (= res!589990 (validKeyInArray!0 k0!854))))

(declare-fun b!868201 () Bool)

(declare-fun e!483542 () Bool)

(assert (=> b!868201 (= e!483542 tp_is_empty!16957)))

(declare-fun b!868202 () Bool)

(assert (=> b!868202 (= e!483541 (and e!483542 mapRes!27035))))

(declare-fun condMapEmpty!27035 () Bool)

(declare-fun mapDefault!27035 () ValueCell!8039)

(assert (=> b!868202 (= condMapEmpty!27035 (= (arr!24063 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8039)) mapDefault!27035)))))

(declare-fun b!868203 () Bool)

(assert (=> b!868203 (= e!483539 e!483538)))

(declare-fun res!589987 () Bool)

(assert (=> b!868203 (=> (not res!589987) (not e!483538))))

(assert (=> b!868203 (= res!589987 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394232 () ListLongMap!10101)

(assert (=> b!868203 (= lt!394232 (getCurrentListMapNoExtraKeys!3059 _keys!868 lt!394229 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!868203 (= lt!394229 (array!50064 (store (arr!24063 _values!688) i!612 (ValueCellFull!8039 v!557)) (size!24505 _values!688)))))

(declare-fun lt!394230 () ListLongMap!10101)

(assert (=> b!868203 (= lt!394230 (getCurrentListMapNoExtraKeys!3059 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!73888 res!589995) b!868198))

(assert (= (and b!868198 res!589993) b!868199))

(assert (= (and b!868199 res!589988) b!868197))

(assert (= (and b!868197 res!589992) b!868192))

(assert (= (and b!868192 res!589994) b!868194))

(assert (= (and b!868194 res!589989) b!868200))

(assert (= (and b!868200 res!589990) b!868195))

(assert (= (and b!868195 res!589991) b!868203))

(assert (= (and b!868203 res!589987) b!868193))

(assert (= (and b!868202 condMapEmpty!27035) mapIsEmpty!27035))

(assert (= (and b!868202 (not condMapEmpty!27035)) mapNonEmpty!27035))

(get-info :version)

(assert (= (and mapNonEmpty!27035 ((_ is ValueCellFull!8039) mapValue!27035)) b!868196))

(assert (= (and b!868202 ((_ is ValueCellFull!8039) mapDefault!27035)) b!868201))

(assert (= start!73888 b!868202))

(declare-fun m!809379 () Bool)

(assert (=> b!868198 m!809379))

(declare-fun m!809381 () Bool)

(assert (=> start!73888 m!809381))

(declare-fun m!809383 () Bool)

(assert (=> start!73888 m!809383))

(declare-fun m!809385 () Bool)

(assert (=> b!868193 m!809385))

(declare-fun m!809387 () Bool)

(assert (=> b!868193 m!809387))

(assert (=> b!868193 m!809387))

(declare-fun m!809389 () Bool)

(assert (=> b!868193 m!809389))

(declare-fun m!809391 () Bool)

(assert (=> b!868193 m!809391))

(declare-fun m!809393 () Bool)

(assert (=> b!868192 m!809393))

(declare-fun m!809395 () Bool)

(assert (=> b!868195 m!809395))

(declare-fun m!809397 () Bool)

(assert (=> b!868200 m!809397))

(declare-fun m!809399 () Bool)

(assert (=> mapNonEmpty!27035 m!809399))

(declare-fun m!809401 () Bool)

(assert (=> b!868203 m!809401))

(declare-fun m!809403 () Bool)

(assert (=> b!868203 m!809403))

(declare-fun m!809405 () Bool)

(assert (=> b!868203 m!809405))

(declare-fun m!809407 () Bool)

(assert (=> b!868197 m!809407))

(check-sat (not b!868193) (not b!868203) (not b_next!14821) b_and!24547 (not b!868192) (not mapNonEmpty!27035) tp_is_empty!16957 (not b!868197) (not b!868198) (not b!868200) (not start!73888))
(check-sat b_and!24547 (not b_next!14821))
