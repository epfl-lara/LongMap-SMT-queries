; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73876 () Bool)

(assert start!73876)

(declare-fun b_free!14809 () Bool)

(declare-fun b_next!14809 () Bool)

(assert (=> start!73876 (= b_free!14809 (not b_next!14809))))

(declare-fun tp!51932 () Bool)

(declare-fun b_and!24535 () Bool)

(assert (=> start!73876 (= tp!51932 b_and!24535)))

(declare-fun b!867976 () Bool)

(declare-fun res!589828 () Bool)

(declare-fun e!483431 () Bool)

(assert (=> b!867976 (=> (not res!589828) (not e!483431))))

(declare-datatypes ((array!50039 0))(
  ( (array!50040 (arr!24051 (Array (_ BitVec 32) (_ BitVec 64))) (size!24493 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50039)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50039 (_ BitVec 32)) Bool)

(assert (=> b!867976 (= res!589828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!867977 () Bool)

(declare-fun e!483434 () Bool)

(assert (=> b!867977 (= e!483434 (not true))))

(declare-datatypes ((V!27641 0))(
  ( (V!27642 (val!8520 Int)) )
))
(declare-fun v!557 () V!27641)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((ValueCell!8033 0))(
  ( (ValueCellFull!8033 (v!10939 V!27641)) (EmptyCell!8033) )
))
(declare-datatypes ((array!50041 0))(
  ( (array!50042 (arr!24052 (Array (_ BitVec 32) ValueCell!8033)) (size!24494 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50041)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!27641)

(declare-fun zeroValue!654 () V!27641)

(declare-fun lt!394159 () array!50041)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11332 0))(
  ( (tuple2!11333 (_1!5677 (_ BitVec 64)) (_2!5677 V!27641)) )
))
(declare-datatypes ((List!17118 0))(
  ( (Nil!17115) (Cons!17114 (h!18245 tuple2!11332) (t!24146 List!17118)) )
))
(declare-datatypes ((ListLongMap!10091 0))(
  ( (ListLongMap!10092 (toList!5061 List!17118)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3054 (array!50039 array!50041 (_ BitVec 32) (_ BitVec 32) V!27641 V!27641 (_ BitVec 32) Int) ListLongMap!10091)

(declare-fun +!2425 (ListLongMap!10091 tuple2!11332) ListLongMap!10091)

(assert (=> b!867977 (= (getCurrentListMapNoExtraKeys!3054 _keys!868 lt!394159 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2425 (getCurrentListMapNoExtraKeys!3054 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11333 k0!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29737 0))(
  ( (Unit!29738) )
))
(declare-fun lt!394160 () Unit!29737)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!593 (array!50039 array!50041 (_ BitVec 32) (_ BitVec 32) V!27641 V!27641 (_ BitVec 32) (_ BitVec 64) V!27641 (_ BitVec 32) Int) Unit!29737)

(assert (=> b!867977 (= lt!394160 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!593 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!589829 () Bool)

(assert (=> start!73876 (=> (not res!589829) (not e!483431))))

(assert (=> start!73876 (= res!589829 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24493 _keys!868))))))

(assert (=> start!73876 e!483431))

(declare-fun tp_is_empty!16945 () Bool)

(assert (=> start!73876 tp_is_empty!16945))

(assert (=> start!73876 true))

(assert (=> start!73876 tp!51932))

(declare-fun array_inv!19074 (array!50039) Bool)

(assert (=> start!73876 (array_inv!19074 _keys!868)))

(declare-fun e!483430 () Bool)

(declare-fun array_inv!19075 (array!50041) Bool)

(assert (=> start!73876 (and (array_inv!19075 _values!688) e!483430)))

(declare-fun b!867978 () Bool)

(declare-fun res!589833 () Bool)

(assert (=> b!867978 (=> (not res!589833) (not e!483431))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!867978 (= res!589833 (validMask!0 mask!1196))))

(declare-fun b!867979 () Bool)

(declare-fun e!483432 () Bool)

(assert (=> b!867979 (= e!483432 tp_is_empty!16945)))

(declare-fun b!867980 () Bool)

(declare-fun e!483435 () Bool)

(assert (=> b!867980 (= e!483435 tp_is_empty!16945)))

(declare-fun b!867981 () Bool)

(assert (=> b!867981 (= e!483431 e!483434)))

(declare-fun res!589832 () Bool)

(assert (=> b!867981 (=> (not res!589832) (not e!483434))))

(assert (=> b!867981 (= res!589832 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394157 () ListLongMap!10091)

(assert (=> b!867981 (= lt!394157 (getCurrentListMapNoExtraKeys!3054 _keys!868 lt!394159 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!867981 (= lt!394159 (array!50042 (store (arr!24052 _values!688) i!612 (ValueCellFull!8033 v!557)) (size!24494 _values!688)))))

(declare-fun lt!394158 () ListLongMap!10091)

(assert (=> b!867981 (= lt!394158 (getCurrentListMapNoExtraKeys!3054 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!27017 () Bool)

(declare-fun mapRes!27017 () Bool)

(declare-fun tp!51931 () Bool)

(assert (=> mapNonEmpty!27017 (= mapRes!27017 (and tp!51931 e!483435))))

(declare-fun mapRest!27017 () (Array (_ BitVec 32) ValueCell!8033))

(declare-fun mapKey!27017 () (_ BitVec 32))

(declare-fun mapValue!27017 () ValueCell!8033)

(assert (=> mapNonEmpty!27017 (= (arr!24052 _values!688) (store mapRest!27017 mapKey!27017 mapValue!27017))))

(declare-fun b!867982 () Bool)

(declare-fun res!589827 () Bool)

(assert (=> b!867982 (=> (not res!589827) (not e!483431))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!867982 (= res!589827 (validKeyInArray!0 k0!854))))

(declare-fun b!867983 () Bool)

(declare-fun res!589830 () Bool)

(assert (=> b!867983 (=> (not res!589830) (not e!483431))))

(declare-datatypes ((List!17119 0))(
  ( (Nil!17116) (Cons!17115 (h!18246 (_ BitVec 64)) (t!24147 List!17119)) )
))
(declare-fun arrayNoDuplicates!0 (array!50039 (_ BitVec 32) List!17119) Bool)

(assert (=> b!867983 (= res!589830 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17116))))

(declare-fun b!867984 () Bool)

(declare-fun res!589825 () Bool)

(assert (=> b!867984 (=> (not res!589825) (not e!483431))))

(assert (=> b!867984 (= res!589825 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24493 _keys!868))))))

(declare-fun b!867985 () Bool)

(assert (=> b!867985 (= e!483430 (and e!483432 mapRes!27017))))

(declare-fun condMapEmpty!27017 () Bool)

(declare-fun mapDefault!27017 () ValueCell!8033)

(assert (=> b!867985 (= condMapEmpty!27017 (= (arr!24052 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8033)) mapDefault!27017)))))

(declare-fun b!867986 () Bool)

(declare-fun res!589831 () Bool)

(assert (=> b!867986 (=> (not res!589831) (not e!483431))))

(assert (=> b!867986 (= res!589831 (and (= (size!24494 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24493 _keys!868) (size!24494 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!27017 () Bool)

(assert (=> mapIsEmpty!27017 mapRes!27017))

(declare-fun b!867987 () Bool)

(declare-fun res!589826 () Bool)

(assert (=> b!867987 (=> (not res!589826) (not e!483431))))

(assert (=> b!867987 (= res!589826 (and (= (select (arr!24051 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!73876 res!589829) b!867978))

(assert (= (and b!867978 res!589833) b!867986))

(assert (= (and b!867986 res!589831) b!867976))

(assert (= (and b!867976 res!589828) b!867983))

(assert (= (and b!867983 res!589830) b!867984))

(assert (= (and b!867984 res!589825) b!867982))

(assert (= (and b!867982 res!589827) b!867987))

(assert (= (and b!867987 res!589826) b!867981))

(assert (= (and b!867981 res!589832) b!867977))

(assert (= (and b!867985 condMapEmpty!27017) mapIsEmpty!27017))

(assert (= (and b!867985 (not condMapEmpty!27017)) mapNonEmpty!27017))

(get-info :version)

(assert (= (and mapNonEmpty!27017 ((_ is ValueCellFull!8033) mapValue!27017)) b!867980))

(assert (= (and b!867985 ((_ is ValueCellFull!8033) mapDefault!27017)) b!867979))

(assert (= start!73876 b!867985))

(declare-fun m!809199 () Bool)

(assert (=> b!867982 m!809199))

(declare-fun m!809201 () Bool)

(assert (=> b!867987 m!809201))

(declare-fun m!809203 () Bool)

(assert (=> b!867983 m!809203))

(declare-fun m!809205 () Bool)

(assert (=> b!867981 m!809205))

(declare-fun m!809207 () Bool)

(assert (=> b!867981 m!809207))

(declare-fun m!809209 () Bool)

(assert (=> b!867981 m!809209))

(declare-fun m!809211 () Bool)

(assert (=> start!73876 m!809211))

(declare-fun m!809213 () Bool)

(assert (=> start!73876 m!809213))

(declare-fun m!809215 () Bool)

(assert (=> b!867977 m!809215))

(declare-fun m!809217 () Bool)

(assert (=> b!867977 m!809217))

(assert (=> b!867977 m!809217))

(declare-fun m!809219 () Bool)

(assert (=> b!867977 m!809219))

(declare-fun m!809221 () Bool)

(assert (=> b!867977 m!809221))

(declare-fun m!809223 () Bool)

(assert (=> mapNonEmpty!27017 m!809223))

(declare-fun m!809225 () Bool)

(assert (=> b!867976 m!809225))

(declare-fun m!809227 () Bool)

(assert (=> b!867978 m!809227))

(check-sat (not b!867981) (not b!867977) tp_is_empty!16945 (not b!867983) (not mapNonEmpty!27017) (not b!867976) (not b!867982) (not start!73876) (not b_next!14809) (not b!867978) b_and!24535)
(check-sat b_and!24535 (not b_next!14809))
