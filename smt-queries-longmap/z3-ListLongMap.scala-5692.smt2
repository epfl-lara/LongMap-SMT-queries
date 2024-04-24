; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74104 () Bool)

(assert start!74104)

(declare-fun b_free!14851 () Bool)

(declare-fun b_next!14851 () Bool)

(assert (=> start!74104 (= b_free!14851 (not b_next!14851))))

(declare-fun tp!52058 () Bool)

(declare-fun b_and!24613 () Bool)

(assert (=> start!74104 (= tp!52058 b_and!24613)))

(declare-fun b!869874 () Bool)

(declare-fun res!590851 () Bool)

(declare-fun e!484543 () Bool)

(assert (=> b!869874 (=> (not res!590851) (not e!484543))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!50183 0))(
  ( (array!50184 (arr!24118 (Array (_ BitVec 32) (_ BitVec 64))) (size!24559 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50183)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!869874 (= res!590851 (and (= (select (arr!24118 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!869875 () Bool)

(declare-fun res!590846 () Bool)

(assert (=> b!869875 (=> (not res!590846) (not e!484543))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869875 (= res!590846 (validKeyInArray!0 k0!854))))

(declare-fun b!869876 () Bool)

(declare-fun e!484541 () Bool)

(declare-fun tp_is_empty!16987 () Bool)

(assert (=> b!869876 (= e!484541 tp_is_empty!16987)))

(declare-fun b!869877 () Bool)

(declare-fun e!484540 () Bool)

(declare-fun mapRes!27080 () Bool)

(assert (=> b!869877 (= e!484540 (and e!484541 mapRes!27080))))

(declare-fun condMapEmpty!27080 () Bool)

(declare-datatypes ((V!27697 0))(
  ( (V!27698 (val!8541 Int)) )
))
(declare-datatypes ((ValueCell!8054 0))(
  ( (ValueCellFull!8054 (v!10966 V!27697)) (EmptyCell!8054) )
))
(declare-datatypes ((array!50185 0))(
  ( (array!50186 (arr!24119 (Array (_ BitVec 32) ValueCell!8054)) (size!24560 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50185)

(declare-fun mapDefault!27080 () ValueCell!8054)

(assert (=> b!869877 (= condMapEmpty!27080 (= (arr!24119 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8054)) mapDefault!27080)))))

(declare-fun b!869878 () Bool)

(declare-fun res!590853 () Bool)

(assert (=> b!869878 (=> (not res!590853) (not e!484543))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50183 (_ BitVec 32)) Bool)

(assert (=> b!869878 (= res!590853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!869879 () Bool)

(declare-fun e!484538 () Bool)

(assert (=> b!869879 (= e!484538 (not true))))

(declare-fun v!557 () V!27697)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!395008 () array!50185)

(declare-fun minValue!654 () V!27697)

(declare-fun zeroValue!654 () V!27697)

(declare-datatypes ((tuple2!11268 0))(
  ( (tuple2!11269 (_1!5645 (_ BitVec 64)) (_2!5645 V!27697)) )
))
(declare-datatypes ((List!17091 0))(
  ( (Nil!17088) (Cons!17087 (h!18224 tuple2!11268) (t!24120 List!17091)) )
))
(declare-datatypes ((ListLongMap!10039 0))(
  ( (ListLongMap!10040 (toList!5035 List!17091)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3079 (array!50183 array!50185 (_ BitVec 32) (_ BitVec 32) V!27697 V!27697 (_ BitVec 32) Int) ListLongMap!10039)

(declare-fun +!2431 (ListLongMap!10039 tuple2!11268) ListLongMap!10039)

(assert (=> b!869879 (= (getCurrentListMapNoExtraKeys!3079 _keys!868 lt!395008 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2431 (getCurrentListMapNoExtraKeys!3079 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11269 k0!854 v!557)))))

(declare-datatypes ((Unit!29812 0))(
  ( (Unit!29813) )
))
(declare-fun lt!395006 () Unit!29812)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!602 (array!50183 array!50185 (_ BitVec 32) (_ BitVec 32) V!27697 V!27697 (_ BitVec 32) (_ BitVec 64) V!27697 (_ BitVec 32) Int) Unit!29812)

(assert (=> b!869879 (= lt!395006 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!602 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!869880 () Bool)

(declare-fun res!590849 () Bool)

(assert (=> b!869880 (=> (not res!590849) (not e!484543))))

(declare-datatypes ((List!17092 0))(
  ( (Nil!17089) (Cons!17088 (h!18225 (_ BitVec 64)) (t!24121 List!17092)) )
))
(declare-fun arrayNoDuplicates!0 (array!50183 (_ BitVec 32) List!17092) Bool)

(assert (=> b!869880 (= res!590849 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17089))))

(declare-fun res!590847 () Bool)

(assert (=> start!74104 (=> (not res!590847) (not e!484543))))

(assert (=> start!74104 (= res!590847 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24559 _keys!868))))))

(assert (=> start!74104 e!484543))

(assert (=> start!74104 tp_is_empty!16987))

(assert (=> start!74104 true))

(assert (=> start!74104 tp!52058))

(declare-fun array_inv!19106 (array!50183) Bool)

(assert (=> start!74104 (array_inv!19106 _keys!868)))

(declare-fun array_inv!19107 (array!50185) Bool)

(assert (=> start!74104 (and (array_inv!19107 _values!688) e!484540)))

(declare-fun b!869881 () Bool)

(assert (=> b!869881 (= e!484543 e!484538)))

(declare-fun res!590850 () Bool)

(assert (=> b!869881 (=> (not res!590850) (not e!484538))))

(assert (=> b!869881 (= res!590850 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!395007 () ListLongMap!10039)

(assert (=> b!869881 (= lt!395007 (getCurrentListMapNoExtraKeys!3079 _keys!868 lt!395008 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!869881 (= lt!395008 (array!50186 (store (arr!24119 _values!688) i!612 (ValueCellFull!8054 v!557)) (size!24560 _values!688)))))

(declare-fun lt!395009 () ListLongMap!10039)

(assert (=> b!869881 (= lt!395009 (getCurrentListMapNoExtraKeys!3079 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!27080 () Bool)

(assert (=> mapIsEmpty!27080 mapRes!27080))

(declare-fun b!869882 () Bool)

(declare-fun res!590848 () Bool)

(assert (=> b!869882 (=> (not res!590848) (not e!484543))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869882 (= res!590848 (validMask!0 mask!1196))))

(declare-fun b!869883 () Bool)

(declare-fun res!590852 () Bool)

(assert (=> b!869883 (=> (not res!590852) (not e!484543))))

(assert (=> b!869883 (= res!590852 (and (= (size!24560 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24559 _keys!868) (size!24560 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!869884 () Bool)

(declare-fun res!590854 () Bool)

(assert (=> b!869884 (=> (not res!590854) (not e!484543))))

(assert (=> b!869884 (= res!590854 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24559 _keys!868))))))

(declare-fun b!869885 () Bool)

(declare-fun e!484539 () Bool)

(assert (=> b!869885 (= e!484539 tp_is_empty!16987)))

(declare-fun mapNonEmpty!27080 () Bool)

(declare-fun tp!52057 () Bool)

(assert (=> mapNonEmpty!27080 (= mapRes!27080 (and tp!52057 e!484539))))

(declare-fun mapRest!27080 () (Array (_ BitVec 32) ValueCell!8054))

(declare-fun mapKey!27080 () (_ BitVec 32))

(declare-fun mapValue!27080 () ValueCell!8054)

(assert (=> mapNonEmpty!27080 (= (arr!24119 _values!688) (store mapRest!27080 mapKey!27080 mapValue!27080))))

(assert (= (and start!74104 res!590847) b!869882))

(assert (= (and b!869882 res!590848) b!869883))

(assert (= (and b!869883 res!590852) b!869878))

(assert (= (and b!869878 res!590853) b!869880))

(assert (= (and b!869880 res!590849) b!869884))

(assert (= (and b!869884 res!590854) b!869875))

(assert (= (and b!869875 res!590846) b!869874))

(assert (= (and b!869874 res!590851) b!869881))

(assert (= (and b!869881 res!590850) b!869879))

(assert (= (and b!869877 condMapEmpty!27080) mapIsEmpty!27080))

(assert (= (and b!869877 (not condMapEmpty!27080)) mapNonEmpty!27080))

(get-info :version)

(assert (= (and mapNonEmpty!27080 ((_ is ValueCellFull!8054) mapValue!27080)) b!869885))

(assert (= (and b!869877 ((_ is ValueCellFull!8054) mapDefault!27080)) b!869876))

(assert (= start!74104 b!869877))

(declare-fun m!811877 () Bool)

(assert (=> b!869875 m!811877))

(declare-fun m!811879 () Bool)

(assert (=> b!869874 m!811879))

(declare-fun m!811881 () Bool)

(assert (=> b!869881 m!811881))

(declare-fun m!811883 () Bool)

(assert (=> b!869881 m!811883))

(declare-fun m!811885 () Bool)

(assert (=> b!869881 m!811885))

(declare-fun m!811887 () Bool)

(assert (=> b!869880 m!811887))

(declare-fun m!811889 () Bool)

(assert (=> mapNonEmpty!27080 m!811889))

(declare-fun m!811891 () Bool)

(assert (=> b!869878 m!811891))

(declare-fun m!811893 () Bool)

(assert (=> start!74104 m!811893))

(declare-fun m!811895 () Bool)

(assert (=> start!74104 m!811895))

(declare-fun m!811897 () Bool)

(assert (=> b!869882 m!811897))

(declare-fun m!811899 () Bool)

(assert (=> b!869879 m!811899))

(declare-fun m!811901 () Bool)

(assert (=> b!869879 m!811901))

(assert (=> b!869879 m!811901))

(declare-fun m!811903 () Bool)

(assert (=> b!869879 m!811903))

(declare-fun m!811905 () Bool)

(assert (=> b!869879 m!811905))

(check-sat (not b!869878) (not b_next!14851) (not b!869879) (not start!74104) tp_is_empty!16987 (not b!869882) b_and!24613 (not b!869880) (not b!869875) (not mapNonEmpty!27080) (not b!869881))
(check-sat b_and!24613 (not b_next!14851))
