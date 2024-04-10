; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73926 () Bool)

(assert start!73926)

(declare-fun b_free!14841 () Bool)

(declare-fun b_next!14841 () Bool)

(assert (=> start!73926 (= b_free!14841 (not b_next!14841))))

(declare-fun tp!52027 () Bool)

(declare-fun b_and!24593 () Bool)

(assert (=> start!73926 (= tp!52027 b_and!24593)))

(declare-fun b!868791 () Bool)

(declare-fun e!483868 () Bool)

(declare-fun tp_is_empty!16977 () Bool)

(assert (=> b!868791 (= e!483868 tp_is_empty!16977)))

(declare-fun b!868792 () Bool)

(declare-fun res!590373 () Bool)

(declare-fun e!483866 () Bool)

(assert (=> b!868792 (=> (not res!590373) (not e!483866))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50104 0))(
  ( (array!50105 (arr!24083 (Array (_ BitVec 32) (_ BitVec 64))) (size!24523 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50104)

(assert (=> b!868792 (= res!590373 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24523 _keys!868))))))

(declare-fun b!868793 () Bool)

(declare-fun res!590370 () Bool)

(assert (=> b!868793 (=> (not res!590370) (not e!483866))))

(declare-datatypes ((List!17127 0))(
  ( (Nil!17124) (Cons!17123 (h!18254 (_ BitVec 64)) (t!24164 List!17127)) )
))
(declare-fun arrayNoDuplicates!0 (array!50104 (_ BitVec 32) List!17127) Bool)

(assert (=> b!868793 (= res!590370 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17124))))

(declare-fun b!868794 () Bool)

(declare-fun e!483867 () Bool)

(declare-fun mapRes!27065 () Bool)

(assert (=> b!868794 (= e!483867 (and e!483868 mapRes!27065))))

(declare-fun condMapEmpty!27065 () Bool)

(declare-datatypes ((V!27683 0))(
  ( (V!27684 (val!8536 Int)) )
))
(declare-datatypes ((ValueCell!8049 0))(
  ( (ValueCellFull!8049 (v!10961 V!27683)) (EmptyCell!8049) )
))
(declare-datatypes ((array!50106 0))(
  ( (array!50107 (arr!24084 (Array (_ BitVec 32) ValueCell!8049)) (size!24524 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50106)

(declare-fun mapDefault!27065 () ValueCell!8049)

(assert (=> b!868794 (= condMapEmpty!27065 (= (arr!24084 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8049)) mapDefault!27065)))))

(declare-fun mapNonEmpty!27065 () Bool)

(declare-fun tp!52026 () Bool)

(declare-fun e!483871 () Bool)

(assert (=> mapNonEmpty!27065 (= mapRes!27065 (and tp!52026 e!483871))))

(declare-fun mapValue!27065 () ValueCell!8049)

(declare-fun mapRest!27065 () (Array (_ BitVec 32) ValueCell!8049))

(declare-fun mapKey!27065 () (_ BitVec 32))

(assert (=> mapNonEmpty!27065 (= (arr!24084 _values!688) (store mapRest!27065 mapKey!27065 mapValue!27065))))

(declare-fun b!868795 () Bool)

(declare-fun res!590368 () Bool)

(assert (=> b!868795 (=> (not res!590368) (not e!483866))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!868795 (= res!590368 (validKeyInArray!0 k0!854))))

(declare-fun res!590371 () Bool)

(assert (=> start!73926 (=> (not res!590371) (not e!483866))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73926 (= res!590371 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24523 _keys!868))))))

(assert (=> start!73926 e!483866))

(assert (=> start!73926 tp_is_empty!16977))

(assert (=> start!73926 true))

(assert (=> start!73926 tp!52027))

(declare-fun array_inv!19024 (array!50104) Bool)

(assert (=> start!73926 (array_inv!19024 _keys!868)))

(declare-fun array_inv!19025 (array!50106) Bool)

(assert (=> start!73926 (and (array_inv!19025 _values!688) e!483867)))

(declare-fun mapIsEmpty!27065 () Bool)

(assert (=> mapIsEmpty!27065 mapRes!27065))

(declare-fun b!868796 () Bool)

(declare-fun res!590375 () Bool)

(assert (=> b!868796 (=> (not res!590375) (not e!483866))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50104 (_ BitVec 32)) Bool)

(assert (=> b!868796 (= res!590375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!868797 () Bool)

(declare-fun res!590372 () Bool)

(assert (=> b!868797 (=> (not res!590372) (not e!483866))))

(assert (=> b!868797 (= res!590372 (and (= (select (arr!24083 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!868798 () Bool)

(declare-fun res!590367 () Bool)

(assert (=> b!868798 (=> (not res!590367) (not e!483866))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!868798 (= res!590367 (validMask!0 mask!1196))))

(declare-fun b!868799 () Bool)

(assert (=> b!868799 (= e!483871 tp_is_empty!16977)))

(declare-fun b!868800 () Bool)

(declare-fun e!483870 () Bool)

(assert (=> b!868800 (= e!483866 e!483870)))

(declare-fun res!590369 () Bool)

(assert (=> b!868800 (=> (not res!590369) (not e!483870))))

(assert (=> b!868800 (= res!590369 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394585 () array!50106)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11332 0))(
  ( (tuple2!11333 (_1!5677 (_ BitVec 64)) (_2!5677 V!27683)) )
))
(declare-datatypes ((List!17128 0))(
  ( (Nil!17125) (Cons!17124 (h!18255 tuple2!11332) (t!24165 List!17128)) )
))
(declare-datatypes ((ListLongMap!10101 0))(
  ( (ListLongMap!10102 (toList!5066 List!17128)) )
))
(declare-fun lt!394588 () ListLongMap!10101)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27683)

(declare-fun zeroValue!654 () V!27683)

(declare-fun getCurrentListMapNoExtraKeys!3035 (array!50104 array!50106 (_ BitVec 32) (_ BitVec 32) V!27683 V!27683 (_ BitVec 32) Int) ListLongMap!10101)

(assert (=> b!868800 (= lt!394588 (getCurrentListMapNoExtraKeys!3035 _keys!868 lt!394585 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27683)

(assert (=> b!868800 (= lt!394585 (array!50107 (store (arr!24084 _values!688) i!612 (ValueCellFull!8049 v!557)) (size!24524 _values!688)))))

(declare-fun lt!394587 () ListLongMap!10101)

(assert (=> b!868800 (= lt!394587 (getCurrentListMapNoExtraKeys!3035 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!868801 () Bool)

(assert (=> b!868801 (= e!483870 (not true))))

(declare-fun +!2407 (ListLongMap!10101 tuple2!11332) ListLongMap!10101)

(assert (=> b!868801 (= (getCurrentListMapNoExtraKeys!3035 _keys!868 lt!394585 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2407 (getCurrentListMapNoExtraKeys!3035 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11333 k0!854 v!557)))))

(declare-datatypes ((Unit!29812 0))(
  ( (Unit!29813) )
))
(declare-fun lt!394586 () Unit!29812)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!601 (array!50104 array!50106 (_ BitVec 32) (_ BitVec 32) V!27683 V!27683 (_ BitVec 32) (_ BitVec 64) V!27683 (_ BitVec 32) Int) Unit!29812)

(assert (=> b!868801 (= lt!394586 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!601 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!868802 () Bool)

(declare-fun res!590374 () Bool)

(assert (=> b!868802 (=> (not res!590374) (not e!483866))))

(assert (=> b!868802 (= res!590374 (and (= (size!24524 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24523 _keys!868) (size!24524 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73926 res!590371) b!868798))

(assert (= (and b!868798 res!590367) b!868802))

(assert (= (and b!868802 res!590374) b!868796))

(assert (= (and b!868796 res!590375) b!868793))

(assert (= (and b!868793 res!590370) b!868792))

(assert (= (and b!868792 res!590373) b!868795))

(assert (= (and b!868795 res!590368) b!868797))

(assert (= (and b!868797 res!590372) b!868800))

(assert (= (and b!868800 res!590369) b!868801))

(assert (= (and b!868794 condMapEmpty!27065) mapIsEmpty!27065))

(assert (= (and b!868794 (not condMapEmpty!27065)) mapNonEmpty!27065))

(get-info :version)

(assert (= (and mapNonEmpty!27065 ((_ is ValueCellFull!8049) mapValue!27065)) b!868799))

(assert (= (and b!868794 ((_ is ValueCellFull!8049) mapDefault!27065)) b!868791))

(assert (= start!73926 b!868794))

(declare-fun m!810437 () Bool)

(assert (=> b!868800 m!810437))

(declare-fun m!810439 () Bool)

(assert (=> b!868800 m!810439))

(declare-fun m!810441 () Bool)

(assert (=> b!868800 m!810441))

(declare-fun m!810443 () Bool)

(assert (=> start!73926 m!810443))

(declare-fun m!810445 () Bool)

(assert (=> start!73926 m!810445))

(declare-fun m!810447 () Bool)

(assert (=> mapNonEmpty!27065 m!810447))

(declare-fun m!810449 () Bool)

(assert (=> b!868795 m!810449))

(declare-fun m!810451 () Bool)

(assert (=> b!868793 m!810451))

(declare-fun m!810453 () Bool)

(assert (=> b!868798 m!810453))

(declare-fun m!810455 () Bool)

(assert (=> b!868797 m!810455))

(declare-fun m!810457 () Bool)

(assert (=> b!868796 m!810457))

(declare-fun m!810459 () Bool)

(assert (=> b!868801 m!810459))

(declare-fun m!810461 () Bool)

(assert (=> b!868801 m!810461))

(assert (=> b!868801 m!810461))

(declare-fun m!810463 () Bool)

(assert (=> b!868801 m!810463))

(declare-fun m!810465 () Bool)

(assert (=> b!868801 m!810465))

(check-sat (not b!868793) b_and!24593 (not mapNonEmpty!27065) (not b!868801) (not start!73926) (not b!868798) (not b_next!14841) tp_is_empty!16977 (not b!868795) (not b!868800) (not b!868796))
(check-sat b_and!24593 (not b_next!14841))
