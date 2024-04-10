; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73974 () Bool)

(assert start!73974)

(declare-fun b_free!14889 () Bool)

(declare-fun b_next!14889 () Bool)

(assert (=> start!73974 (= b_free!14889 (not b_next!14889))))

(declare-fun tp!52170 () Bool)

(declare-fun b_and!24641 () Bool)

(assert (=> start!73974 (= tp!52170 b_and!24641)))

(declare-fun res!591018 () Bool)

(declare-fun e!484303 () Bool)

(assert (=> start!73974 (=> (not res!591018) (not e!484303))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50198 0))(
  ( (array!50199 (arr!24130 (Array (_ BitVec 32) (_ BitVec 64))) (size!24570 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50198)

(assert (=> start!73974 (= res!591018 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24570 _keys!868))))))

(assert (=> start!73974 e!484303))

(declare-fun tp_is_empty!17025 () Bool)

(assert (=> start!73974 tp_is_empty!17025))

(assert (=> start!73974 true))

(assert (=> start!73974 tp!52170))

(declare-fun array_inv!19062 (array!50198) Bool)

(assert (=> start!73974 (array_inv!19062 _keys!868)))

(declare-datatypes ((V!27747 0))(
  ( (V!27748 (val!8560 Int)) )
))
(declare-datatypes ((ValueCell!8073 0))(
  ( (ValueCellFull!8073 (v!10985 V!27747)) (EmptyCell!8073) )
))
(declare-datatypes ((array!50200 0))(
  ( (array!50201 (arr!24131 (Array (_ BitVec 32) ValueCell!8073)) (size!24571 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50200)

(declare-fun e!484300 () Bool)

(declare-fun array_inv!19063 (array!50200) Bool)

(assert (=> start!73974 (and (array_inv!19063 _values!688) e!484300)))

(declare-fun b!869655 () Bool)

(declare-fun e!484302 () Bool)

(assert (=> b!869655 (= e!484302 tp_is_empty!17025)))

(declare-fun b!869656 () Bool)

(declare-fun res!591016 () Bool)

(assert (=> b!869656 (=> (not res!591016) (not e!484303))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869656 (= res!591016 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27137 () Bool)

(declare-fun mapRes!27137 () Bool)

(declare-fun tp!52171 () Bool)

(assert (=> mapNonEmpty!27137 (= mapRes!27137 (and tp!52171 e!484302))))

(declare-fun mapRest!27137 () (Array (_ BitVec 32) ValueCell!8073))

(declare-fun mapKey!27137 () (_ BitVec 32))

(declare-fun mapValue!27137 () ValueCell!8073)

(assert (=> mapNonEmpty!27137 (= (arr!24131 _values!688) (store mapRest!27137 mapKey!27137 mapValue!27137))))

(declare-fun b!869657 () Bool)

(declare-fun res!591015 () Bool)

(assert (=> b!869657 (=> (not res!591015) (not e!484303))))

(declare-datatypes ((List!17164 0))(
  ( (Nil!17161) (Cons!17160 (h!18291 (_ BitVec 64)) (t!24201 List!17164)) )
))
(declare-fun arrayNoDuplicates!0 (array!50198 (_ BitVec 32) List!17164) Bool)

(assert (=> b!869657 (= res!591015 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17161))))

(declare-fun b!869658 () Bool)

(declare-fun res!591017 () Bool)

(assert (=> b!869658 (=> (not res!591017) (not e!484303))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!869658 (= res!591017 (and (= (size!24571 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24570 _keys!868) (size!24571 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!869659 () Bool)

(declare-fun e!484301 () Bool)

(assert (=> b!869659 (= e!484301 (not true))))

(declare-fun lt!394876 () array!50200)

(declare-fun v!557 () V!27747)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!27747)

(declare-fun zeroValue!654 () V!27747)

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((tuple2!11374 0))(
  ( (tuple2!11375 (_1!5698 (_ BitVec 64)) (_2!5698 V!27747)) )
))
(declare-datatypes ((List!17165 0))(
  ( (Nil!17162) (Cons!17161 (h!18292 tuple2!11374) (t!24202 List!17165)) )
))
(declare-datatypes ((ListLongMap!10143 0))(
  ( (ListLongMap!10144 (toList!5087 List!17165)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3056 (array!50198 array!50200 (_ BitVec 32) (_ BitVec 32) V!27747 V!27747 (_ BitVec 32) Int) ListLongMap!10143)

(declare-fun +!2427 (ListLongMap!10143 tuple2!11374) ListLongMap!10143)

(assert (=> b!869659 (= (getCurrentListMapNoExtraKeys!3056 _keys!868 lt!394876 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2427 (getCurrentListMapNoExtraKeys!3056 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11375 k0!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29852 0))(
  ( (Unit!29853) )
))
(declare-fun lt!394873 () Unit!29852)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!621 (array!50198 array!50200 (_ BitVec 32) (_ BitVec 32) V!27747 V!27747 (_ BitVec 32) (_ BitVec 64) V!27747 (_ BitVec 32) Int) Unit!29852)

(assert (=> b!869659 (= lt!394873 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!621 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!27137 () Bool)

(assert (=> mapIsEmpty!27137 mapRes!27137))

(declare-fun b!869660 () Bool)

(declare-fun res!591023 () Bool)

(assert (=> b!869660 (=> (not res!591023) (not e!484303))))

(assert (=> b!869660 (= res!591023 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24570 _keys!868))))))

(declare-fun b!869661 () Bool)

(assert (=> b!869661 (= e!484303 e!484301)))

(declare-fun res!591020 () Bool)

(assert (=> b!869661 (=> (not res!591020) (not e!484301))))

(assert (=> b!869661 (= res!591020 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394874 () ListLongMap!10143)

(assert (=> b!869661 (= lt!394874 (getCurrentListMapNoExtraKeys!3056 _keys!868 lt!394876 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!869661 (= lt!394876 (array!50201 (store (arr!24131 _values!688) i!612 (ValueCellFull!8073 v!557)) (size!24571 _values!688)))))

(declare-fun lt!394875 () ListLongMap!10143)

(assert (=> b!869661 (= lt!394875 (getCurrentListMapNoExtraKeys!3056 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!869662 () Bool)

(declare-fun res!591022 () Bool)

(assert (=> b!869662 (=> (not res!591022) (not e!484303))))

(assert (=> b!869662 (= res!591022 (and (= (select (arr!24130 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!869663 () Bool)

(declare-fun e!484299 () Bool)

(assert (=> b!869663 (= e!484299 tp_is_empty!17025)))

(declare-fun b!869664 () Bool)

(assert (=> b!869664 (= e!484300 (and e!484299 mapRes!27137))))

(declare-fun condMapEmpty!27137 () Bool)

(declare-fun mapDefault!27137 () ValueCell!8073)

(assert (=> b!869664 (= condMapEmpty!27137 (= (arr!24131 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8073)) mapDefault!27137)))))

(declare-fun b!869665 () Bool)

(declare-fun res!591021 () Bool)

(assert (=> b!869665 (=> (not res!591021) (not e!484303))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50198 (_ BitVec 32)) Bool)

(assert (=> b!869665 (= res!591021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!869666 () Bool)

(declare-fun res!591019 () Bool)

(assert (=> b!869666 (=> (not res!591019) (not e!484303))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869666 (= res!591019 (validKeyInArray!0 k0!854))))

(assert (= (and start!73974 res!591018) b!869656))

(assert (= (and b!869656 res!591016) b!869658))

(assert (= (and b!869658 res!591017) b!869665))

(assert (= (and b!869665 res!591021) b!869657))

(assert (= (and b!869657 res!591015) b!869660))

(assert (= (and b!869660 res!591023) b!869666))

(assert (= (and b!869666 res!591019) b!869662))

(assert (= (and b!869662 res!591022) b!869661))

(assert (= (and b!869661 res!591020) b!869659))

(assert (= (and b!869664 condMapEmpty!27137) mapIsEmpty!27137))

(assert (= (and b!869664 (not condMapEmpty!27137)) mapNonEmpty!27137))

(get-info :version)

(assert (= (and mapNonEmpty!27137 ((_ is ValueCellFull!8073) mapValue!27137)) b!869655))

(assert (= (and b!869664 ((_ is ValueCellFull!8073) mapDefault!27137)) b!869663))

(assert (= start!73974 b!869664))

(declare-fun m!811157 () Bool)

(assert (=> b!869656 m!811157))

(declare-fun m!811159 () Bool)

(assert (=> b!869661 m!811159))

(declare-fun m!811161 () Bool)

(assert (=> b!869661 m!811161))

(declare-fun m!811163 () Bool)

(assert (=> b!869661 m!811163))

(declare-fun m!811165 () Bool)

(assert (=> b!869665 m!811165))

(declare-fun m!811167 () Bool)

(assert (=> start!73974 m!811167))

(declare-fun m!811169 () Bool)

(assert (=> start!73974 m!811169))

(declare-fun m!811171 () Bool)

(assert (=> b!869666 m!811171))

(declare-fun m!811173 () Bool)

(assert (=> mapNonEmpty!27137 m!811173))

(declare-fun m!811175 () Bool)

(assert (=> b!869662 m!811175))

(declare-fun m!811177 () Bool)

(assert (=> b!869657 m!811177))

(declare-fun m!811179 () Bool)

(assert (=> b!869659 m!811179))

(declare-fun m!811181 () Bool)

(assert (=> b!869659 m!811181))

(assert (=> b!869659 m!811181))

(declare-fun m!811183 () Bool)

(assert (=> b!869659 m!811183))

(declare-fun m!811185 () Bool)

(assert (=> b!869659 m!811185))

(check-sat (not b!869657) (not b!869666) (not b_next!14889) (not b!869656) (not mapNonEmpty!27137) (not b!869659) tp_is_empty!17025 (not b!869665) (not start!73974) (not b!869661) b_and!24641)
(check-sat b_and!24641 (not b_next!14889))
