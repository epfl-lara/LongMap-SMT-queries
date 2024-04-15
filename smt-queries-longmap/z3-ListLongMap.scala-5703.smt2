; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73984 () Bool)

(assert start!73984)

(declare-fun b_free!14917 () Bool)

(declare-fun b_next!14917 () Bool)

(assert (=> start!73984 (= b_free!14917 (not b_next!14917))))

(declare-fun tp!52256 () Bool)

(declare-fun b_and!24643 () Bool)

(assert (=> start!73984 (= tp!52256 b_and!24643)))

(declare-fun b!869920 () Bool)

(declare-fun res!591289 () Bool)

(declare-fun e!484403 () Bool)

(assert (=> b!869920 (=> (not res!591289) (not e!484403))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50241 0))(
  ( (array!50242 (arr!24152 (Array (_ BitVec 32) (_ BitVec 64))) (size!24594 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50241)

(declare-datatypes ((V!27785 0))(
  ( (V!27786 (val!8574 Int)) )
))
(declare-datatypes ((ValueCell!8087 0))(
  ( (ValueCellFull!8087 (v!10993 V!27785)) (EmptyCell!8087) )
))
(declare-datatypes ((array!50243 0))(
  ( (array!50244 (arr!24153 (Array (_ BitVec 32) ValueCell!8087)) (size!24595 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50243)

(assert (=> b!869920 (= res!591289 (and (= (size!24595 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24594 _keys!868) (size!24595 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!27179 () Bool)

(declare-fun mapRes!27179 () Bool)

(declare-fun tp!52255 () Bool)

(declare-fun e!484407 () Bool)

(assert (=> mapNonEmpty!27179 (= mapRes!27179 (and tp!52255 e!484407))))

(declare-fun mapRest!27179 () (Array (_ BitVec 32) ValueCell!8087))

(declare-fun mapKey!27179 () (_ BitVec 32))

(declare-fun mapValue!27179 () ValueCell!8087)

(assert (=> mapNonEmpty!27179 (= (arr!24153 _values!688) (store mapRest!27179 mapKey!27179 mapValue!27179))))

(declare-fun res!591287 () Bool)

(assert (=> start!73984 (=> (not res!591287) (not e!484403))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73984 (= res!591287 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24594 _keys!868))))))

(assert (=> start!73984 e!484403))

(declare-fun tp_is_empty!17053 () Bool)

(assert (=> start!73984 tp_is_empty!17053))

(assert (=> start!73984 true))

(assert (=> start!73984 tp!52256))

(declare-fun array_inv!19138 (array!50241) Bool)

(assert (=> start!73984 (array_inv!19138 _keys!868)))

(declare-fun e!484405 () Bool)

(declare-fun array_inv!19139 (array!50243) Bool)

(assert (=> start!73984 (and (array_inv!19139 _values!688) e!484405)))

(declare-fun b!869921 () Bool)

(declare-fun res!591288 () Bool)

(assert (=> b!869921 (=> (not res!591288) (not e!484403))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869921 (= res!591288 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!27179 () Bool)

(assert (=> mapIsEmpty!27179 mapRes!27179))

(declare-fun b!869922 () Bool)

(declare-fun e!484404 () Bool)

(assert (=> b!869922 (= e!484404 tp_is_empty!17053)))

(declare-fun b!869923 () Bool)

(declare-fun res!591284 () Bool)

(assert (=> b!869923 (=> (not res!591284) (not e!484403))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!869923 (= res!591284 (and (= (select (arr!24152 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!869924 () Bool)

(assert (=> b!869924 (= e!484407 tp_is_empty!17053)))

(declare-fun b!869925 () Bool)

(declare-fun res!591291 () Bool)

(assert (=> b!869925 (=> (not res!591291) (not e!484403))))

(declare-datatypes ((List!17188 0))(
  ( (Nil!17185) (Cons!17184 (h!18315 (_ BitVec 64)) (t!24216 List!17188)) )
))
(declare-fun arrayNoDuplicates!0 (array!50241 (_ BitVec 32) List!17188) Bool)

(assert (=> b!869925 (= res!591291 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17185))))

(declare-fun b!869926 () Bool)

(declare-fun res!591290 () Bool)

(assert (=> b!869926 (=> (not res!591290) (not e!484403))))

(assert (=> b!869926 (= res!591290 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24594 _keys!868))))))

(declare-fun b!869927 () Bool)

(declare-fun e!484402 () Bool)

(assert (=> b!869927 (= e!484403 e!484402)))

(declare-fun res!591283 () Bool)

(assert (=> b!869927 (=> (not res!591283) (not e!484402))))

(assert (=> b!869927 (= res!591283 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394805 () array!50243)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!27785)

(declare-fun zeroValue!654 () V!27785)

(declare-datatypes ((tuple2!11408 0))(
  ( (tuple2!11409 (_1!5715 (_ BitVec 64)) (_2!5715 V!27785)) )
))
(declare-datatypes ((List!17189 0))(
  ( (Nil!17186) (Cons!17185 (h!18316 tuple2!11408) (t!24217 List!17189)) )
))
(declare-datatypes ((ListLongMap!10167 0))(
  ( (ListLongMap!10168 (toList!5099 List!17189)) )
))
(declare-fun lt!394807 () ListLongMap!10167)

(declare-fun getCurrentListMapNoExtraKeys!3092 (array!50241 array!50243 (_ BitVec 32) (_ BitVec 32) V!27785 V!27785 (_ BitVec 32) Int) ListLongMap!10167)

(assert (=> b!869927 (= lt!394807 (getCurrentListMapNoExtraKeys!3092 _keys!868 lt!394805 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27785)

(assert (=> b!869927 (= lt!394805 (array!50244 (store (arr!24153 _values!688) i!612 (ValueCellFull!8087 v!557)) (size!24595 _values!688)))))

(declare-fun lt!394808 () ListLongMap!10167)

(assert (=> b!869927 (= lt!394808 (getCurrentListMapNoExtraKeys!3092 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!869928 () Bool)

(declare-fun res!591286 () Bool)

(assert (=> b!869928 (=> (not res!591286) (not e!484403))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50241 (_ BitVec 32)) Bool)

(assert (=> b!869928 (= res!591286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!869929 () Bool)

(assert (=> b!869929 (= e!484405 (and e!484404 mapRes!27179))))

(declare-fun condMapEmpty!27179 () Bool)

(declare-fun mapDefault!27179 () ValueCell!8087)

(assert (=> b!869929 (= condMapEmpty!27179 (= (arr!24153 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8087)) mapDefault!27179)))))

(declare-fun b!869930 () Bool)

(declare-fun res!591285 () Bool)

(assert (=> b!869930 (=> (not res!591285) (not e!484403))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869930 (= res!591285 (validMask!0 mask!1196))))

(declare-fun b!869931 () Bool)

(assert (=> b!869931 (= e!484402 (not true))))

(declare-fun +!2460 (ListLongMap!10167 tuple2!11408) ListLongMap!10167)

(assert (=> b!869931 (= (getCurrentListMapNoExtraKeys!3092 _keys!868 lt!394805 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2460 (getCurrentListMapNoExtraKeys!3092 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11409 k0!854 v!557)))))

(declare-datatypes ((Unit!29807 0))(
  ( (Unit!29808) )
))
(declare-fun lt!394806 () Unit!29807)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!628 (array!50241 array!50243 (_ BitVec 32) (_ BitVec 32) V!27785 V!27785 (_ BitVec 32) (_ BitVec 64) V!27785 (_ BitVec 32) Int) Unit!29807)

(assert (=> b!869931 (= lt!394806 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!628 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73984 res!591287) b!869930))

(assert (= (and b!869930 res!591285) b!869920))

(assert (= (and b!869920 res!591289) b!869928))

(assert (= (and b!869928 res!591286) b!869925))

(assert (= (and b!869925 res!591291) b!869926))

(assert (= (and b!869926 res!591290) b!869921))

(assert (= (and b!869921 res!591288) b!869923))

(assert (= (and b!869923 res!591284) b!869927))

(assert (= (and b!869927 res!591283) b!869931))

(assert (= (and b!869929 condMapEmpty!27179) mapIsEmpty!27179))

(assert (= (and b!869929 (not condMapEmpty!27179)) mapNonEmpty!27179))

(get-info :version)

(assert (= (and mapNonEmpty!27179 ((_ is ValueCellFull!8087) mapValue!27179)) b!869924))

(assert (= (and b!869929 ((_ is ValueCellFull!8087) mapDefault!27179)) b!869922))

(assert (= start!73984 b!869929))

(declare-fun m!810819 () Bool)

(assert (=> b!869923 m!810819))

(declare-fun m!810821 () Bool)

(assert (=> mapNonEmpty!27179 m!810821))

(declare-fun m!810823 () Bool)

(assert (=> b!869928 m!810823))

(declare-fun m!810825 () Bool)

(assert (=> b!869930 m!810825))

(declare-fun m!810827 () Bool)

(assert (=> b!869925 m!810827))

(declare-fun m!810829 () Bool)

(assert (=> start!73984 m!810829))

(declare-fun m!810831 () Bool)

(assert (=> start!73984 m!810831))

(declare-fun m!810833 () Bool)

(assert (=> b!869931 m!810833))

(declare-fun m!810835 () Bool)

(assert (=> b!869931 m!810835))

(assert (=> b!869931 m!810835))

(declare-fun m!810837 () Bool)

(assert (=> b!869931 m!810837))

(declare-fun m!810839 () Bool)

(assert (=> b!869931 m!810839))

(declare-fun m!810841 () Bool)

(assert (=> b!869921 m!810841))

(declare-fun m!810843 () Bool)

(assert (=> b!869927 m!810843))

(declare-fun m!810845 () Bool)

(assert (=> b!869927 m!810845))

(declare-fun m!810847 () Bool)

(assert (=> b!869927 m!810847))

(check-sat (not b!869931) (not b!869921) tp_is_empty!17053 (not mapNonEmpty!27179) (not b!869927) (not b_next!14917) (not b!869930) (not b!869928) (not start!73984) (not b!869925) b_and!24643)
(check-sat b_and!24643 (not b_next!14917))
