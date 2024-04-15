; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73966 () Bool)

(assert start!73966)

(declare-fun b_free!14899 () Bool)

(declare-fun b_next!14899 () Bool)

(assert (=> start!73966 (= b_free!14899 (not b_next!14899))))

(declare-fun tp!52201 () Bool)

(declare-fun b_and!24625 () Bool)

(assert (=> start!73966 (= tp!52201 b_and!24625)))

(declare-fun mapNonEmpty!27152 () Bool)

(declare-fun mapRes!27152 () Bool)

(declare-fun tp!52202 () Bool)

(declare-fun e!484243 () Bool)

(assert (=> mapNonEmpty!27152 (= mapRes!27152 (and tp!52202 e!484243))))

(declare-datatypes ((V!27761 0))(
  ( (V!27762 (val!8565 Int)) )
))
(declare-datatypes ((ValueCell!8078 0))(
  ( (ValueCellFull!8078 (v!10984 V!27761)) (EmptyCell!8078) )
))
(declare-fun mapValue!27152 () ValueCell!8078)

(declare-fun mapRest!27152 () (Array (_ BitVec 32) ValueCell!8078))

(declare-fun mapKey!27152 () (_ BitVec 32))

(declare-datatypes ((array!50205 0))(
  ( (array!50206 (arr!24134 (Array (_ BitVec 32) ValueCell!8078)) (size!24576 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50205)

(assert (=> mapNonEmpty!27152 (= (arr!24134 _values!688) (store mapRest!27152 mapKey!27152 mapValue!27152))))

(declare-fun b!869596 () Bool)

(declare-fun e!484241 () Bool)

(assert (=> b!869596 (= e!484241 (not true))))

(declare-fun v!557 () V!27761)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!394697 () array!50205)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!50207 0))(
  ( (array!50208 (arr!24135 (Array (_ BitVec 32) (_ BitVec 64))) (size!24577 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50207)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!27761)

(declare-fun zeroValue!654 () V!27761)

(declare-datatypes ((tuple2!11392 0))(
  ( (tuple2!11393 (_1!5707 (_ BitVec 64)) (_2!5707 V!27761)) )
))
(declare-datatypes ((List!17174 0))(
  ( (Nil!17171) (Cons!17170 (h!18301 tuple2!11392) (t!24202 List!17174)) )
))
(declare-datatypes ((ListLongMap!10151 0))(
  ( (ListLongMap!10152 (toList!5091 List!17174)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3084 (array!50207 array!50205 (_ BitVec 32) (_ BitVec 32) V!27761 V!27761 (_ BitVec 32) Int) ListLongMap!10151)

(declare-fun +!2452 (ListLongMap!10151 tuple2!11392) ListLongMap!10151)

(assert (=> b!869596 (= (getCurrentListMapNoExtraKeys!3084 _keys!868 lt!394697 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2452 (getCurrentListMapNoExtraKeys!3084 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11393 k0!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29791 0))(
  ( (Unit!29792) )
))
(declare-fun lt!394699 () Unit!29791)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!620 (array!50207 array!50205 (_ BitVec 32) (_ BitVec 32) V!27761 V!27761 (_ BitVec 32) (_ BitVec 64) V!27761 (_ BitVec 32) Int) Unit!29791)

(assert (=> b!869596 (= lt!394699 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!620 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!869597 () Bool)

(declare-fun e!484242 () Bool)

(assert (=> b!869597 (= e!484242 e!484241)))

(declare-fun res!591048 () Bool)

(assert (=> b!869597 (=> (not res!591048) (not e!484241))))

(assert (=> b!869597 (= res!591048 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394700 () ListLongMap!10151)

(assert (=> b!869597 (= lt!394700 (getCurrentListMapNoExtraKeys!3084 _keys!868 lt!394697 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!869597 (= lt!394697 (array!50206 (store (arr!24134 _values!688) i!612 (ValueCellFull!8078 v!557)) (size!24576 _values!688)))))

(declare-fun lt!394698 () ListLongMap!10151)

(assert (=> b!869597 (= lt!394698 (getCurrentListMapNoExtraKeys!3084 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!869598 () Bool)

(declare-fun res!591043 () Bool)

(assert (=> b!869598 (=> (not res!591043) (not e!484242))))

(assert (=> b!869598 (= res!591043 (and (= (size!24576 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24577 _keys!868) (size!24576 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!869599 () Bool)

(declare-fun e!484245 () Bool)

(declare-fun e!484244 () Bool)

(assert (=> b!869599 (= e!484245 (and e!484244 mapRes!27152))))

(declare-fun condMapEmpty!27152 () Bool)

(declare-fun mapDefault!27152 () ValueCell!8078)

(assert (=> b!869599 (= condMapEmpty!27152 (= (arr!24134 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8078)) mapDefault!27152)))))

(declare-fun b!869600 () Bool)

(declare-fun res!591045 () Bool)

(assert (=> b!869600 (=> (not res!591045) (not e!484242))))

(assert (=> b!869600 (= res!591045 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24577 _keys!868))))))

(declare-fun b!869601 () Bool)

(declare-fun res!591042 () Bool)

(assert (=> b!869601 (=> (not res!591042) (not e!484242))))

(declare-datatypes ((List!17175 0))(
  ( (Nil!17172) (Cons!17171 (h!18302 (_ BitVec 64)) (t!24203 List!17175)) )
))
(declare-fun arrayNoDuplicates!0 (array!50207 (_ BitVec 32) List!17175) Bool)

(assert (=> b!869601 (= res!591042 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17172))))

(declare-fun b!869602 () Bool)

(declare-fun res!591044 () Bool)

(assert (=> b!869602 (=> (not res!591044) (not e!484242))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869602 (= res!591044 (validKeyInArray!0 k0!854))))

(declare-fun b!869603 () Bool)

(declare-fun res!591047 () Bool)

(assert (=> b!869603 (=> (not res!591047) (not e!484242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869603 (= res!591047 (validMask!0 mask!1196))))

(declare-fun b!869604 () Bool)

(declare-fun tp_is_empty!17035 () Bool)

(assert (=> b!869604 (= e!484243 tp_is_empty!17035)))

(declare-fun b!869606 () Bool)

(declare-fun res!591040 () Bool)

(assert (=> b!869606 (=> (not res!591040) (not e!484242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50207 (_ BitVec 32)) Bool)

(assert (=> b!869606 (= res!591040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!27152 () Bool)

(assert (=> mapIsEmpty!27152 mapRes!27152))

(declare-fun b!869607 () Bool)

(assert (=> b!869607 (= e!484244 tp_is_empty!17035)))

(declare-fun res!591041 () Bool)

(assert (=> start!73966 (=> (not res!591041) (not e!484242))))

(assert (=> start!73966 (= res!591041 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24577 _keys!868))))))

(assert (=> start!73966 e!484242))

(assert (=> start!73966 tp_is_empty!17035))

(assert (=> start!73966 true))

(assert (=> start!73966 tp!52201))

(declare-fun array_inv!19124 (array!50207) Bool)

(assert (=> start!73966 (array_inv!19124 _keys!868)))

(declare-fun array_inv!19125 (array!50205) Bool)

(assert (=> start!73966 (and (array_inv!19125 _values!688) e!484245)))

(declare-fun b!869605 () Bool)

(declare-fun res!591046 () Bool)

(assert (=> b!869605 (=> (not res!591046) (not e!484242))))

(assert (=> b!869605 (= res!591046 (and (= (select (arr!24135 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!73966 res!591041) b!869603))

(assert (= (and b!869603 res!591047) b!869598))

(assert (= (and b!869598 res!591043) b!869606))

(assert (= (and b!869606 res!591040) b!869601))

(assert (= (and b!869601 res!591042) b!869600))

(assert (= (and b!869600 res!591045) b!869602))

(assert (= (and b!869602 res!591044) b!869605))

(assert (= (and b!869605 res!591046) b!869597))

(assert (= (and b!869597 res!591048) b!869596))

(assert (= (and b!869599 condMapEmpty!27152) mapIsEmpty!27152))

(assert (= (and b!869599 (not condMapEmpty!27152)) mapNonEmpty!27152))

(get-info :version)

(assert (= (and mapNonEmpty!27152 ((_ is ValueCellFull!8078) mapValue!27152)) b!869604))

(assert (= (and b!869599 ((_ is ValueCellFull!8078) mapDefault!27152)) b!869607))

(assert (= start!73966 b!869599))

(declare-fun m!810549 () Bool)

(assert (=> mapNonEmpty!27152 m!810549))

(declare-fun m!810551 () Bool)

(assert (=> b!869606 m!810551))

(declare-fun m!810553 () Bool)

(assert (=> b!869601 m!810553))

(declare-fun m!810555 () Bool)

(assert (=> start!73966 m!810555))

(declare-fun m!810557 () Bool)

(assert (=> start!73966 m!810557))

(declare-fun m!810559 () Bool)

(assert (=> b!869597 m!810559))

(declare-fun m!810561 () Bool)

(assert (=> b!869597 m!810561))

(declare-fun m!810563 () Bool)

(assert (=> b!869597 m!810563))

(declare-fun m!810565 () Bool)

(assert (=> b!869596 m!810565))

(declare-fun m!810567 () Bool)

(assert (=> b!869596 m!810567))

(assert (=> b!869596 m!810567))

(declare-fun m!810569 () Bool)

(assert (=> b!869596 m!810569))

(declare-fun m!810571 () Bool)

(assert (=> b!869596 m!810571))

(declare-fun m!810573 () Bool)

(assert (=> b!869605 m!810573))

(declare-fun m!810575 () Bool)

(assert (=> b!869603 m!810575))

(declare-fun m!810577 () Bool)

(assert (=> b!869602 m!810577))

(check-sat b_and!24625 (not b!869601) (not b!869602) (not mapNonEmpty!27152) (not b_next!14899) (not b!869597) (not start!73966) (not b!869603) tp_is_empty!17035 (not b!869596) (not b!869606))
(check-sat b_and!24625 (not b_next!14899))
