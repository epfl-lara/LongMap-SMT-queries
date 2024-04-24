; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74086 () Bool)

(assert start!74086)

(declare-fun b_free!14833 () Bool)

(declare-fun b_next!14833 () Bool)

(assert (=> start!74086 (= b_free!14833 (not b_next!14833))))

(declare-fun tp!52004 () Bool)

(declare-fun b_and!24595 () Bool)

(assert (=> start!74086 (= tp!52004 b_and!24595)))

(declare-fun b!869550 () Bool)

(declare-fun e!484378 () Bool)

(declare-fun e!484377 () Bool)

(assert (=> b!869550 (= e!484378 e!484377)))

(declare-fun res!590608 () Bool)

(assert (=> b!869550 (=> (not res!590608) (not e!484377))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!869550 (= res!590608 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50147 0))(
  ( (array!50148 (arr!24100 (Array (_ BitVec 32) (_ BitVec 64))) (size!24541 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50147)

(declare-datatypes ((V!27673 0))(
  ( (V!27674 (val!8532 Int)) )
))
(declare-fun minValue!654 () V!27673)

(declare-fun zeroValue!654 () V!27673)

(declare-datatypes ((tuple2!11256 0))(
  ( (tuple2!11257 (_1!5639 (_ BitVec 64)) (_2!5639 V!27673)) )
))
(declare-datatypes ((List!17078 0))(
  ( (Nil!17075) (Cons!17074 (h!18211 tuple2!11256) (t!24107 List!17078)) )
))
(declare-datatypes ((ListLongMap!10027 0))(
  ( (ListLongMap!10028 (toList!5029 List!17078)) )
))
(declare-fun lt!394901 () ListLongMap!10027)

(declare-datatypes ((ValueCell!8045 0))(
  ( (ValueCellFull!8045 (v!10957 V!27673)) (EmptyCell!8045) )
))
(declare-datatypes ((array!50149 0))(
  ( (array!50150 (arr!24101 (Array (_ BitVec 32) ValueCell!8045)) (size!24542 (_ BitVec 32))) )
))
(declare-fun lt!394900 () array!50149)

(declare-fun getCurrentListMapNoExtraKeys!3073 (array!50147 array!50149 (_ BitVec 32) (_ BitVec 32) V!27673 V!27673 (_ BitVec 32) Int) ListLongMap!10027)

(assert (=> b!869550 (= lt!394901 (getCurrentListMapNoExtraKeys!3073 _keys!868 lt!394900 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27673)

(declare-fun _values!688 () array!50149)

(assert (=> b!869550 (= lt!394900 (array!50150 (store (arr!24101 _values!688) i!612 (ValueCellFull!8045 v!557)) (size!24542 _values!688)))))

(declare-fun lt!394899 () ListLongMap!10027)

(assert (=> b!869550 (= lt!394899 (getCurrentListMapNoExtraKeys!3073 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!869551 () Bool)

(declare-fun res!590609 () Bool)

(assert (=> b!869551 (=> (not res!590609) (not e!484378))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869551 (= res!590609 (validMask!0 mask!1196))))

(declare-fun b!869552 () Bool)

(declare-fun res!590604 () Bool)

(assert (=> b!869552 (=> (not res!590604) (not e!484378))))

(assert (=> b!869552 (= res!590604 (and (= (size!24542 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24541 _keys!868) (size!24542 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!869553 () Bool)

(declare-fun res!590606 () Bool)

(assert (=> b!869553 (=> (not res!590606) (not e!484378))))

(declare-datatypes ((List!17079 0))(
  ( (Nil!17076) (Cons!17075 (h!18212 (_ BitVec 64)) (t!24108 List!17079)) )
))
(declare-fun arrayNoDuplicates!0 (array!50147 (_ BitVec 32) List!17079) Bool)

(assert (=> b!869553 (= res!590606 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17076))))

(declare-fun b!869554 () Bool)

(declare-fun res!590603 () Bool)

(assert (=> b!869554 (=> (not res!590603) (not e!484378))))

(assert (=> b!869554 (= res!590603 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24541 _keys!868))))))

(declare-fun b!869555 () Bool)

(declare-fun res!590611 () Bool)

(assert (=> b!869555 (=> (not res!590611) (not e!484378))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869555 (= res!590611 (validKeyInArray!0 k0!854))))

(declare-fun b!869556 () Bool)

(declare-fun res!590605 () Bool)

(assert (=> b!869556 (=> (not res!590605) (not e!484378))))

(assert (=> b!869556 (= res!590605 (and (= (select (arr!24100 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!590610 () Bool)

(assert (=> start!74086 (=> (not res!590610) (not e!484378))))

(assert (=> start!74086 (= res!590610 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24541 _keys!868))))))

(assert (=> start!74086 e!484378))

(declare-fun tp_is_empty!16969 () Bool)

(assert (=> start!74086 tp_is_empty!16969))

(assert (=> start!74086 true))

(assert (=> start!74086 tp!52004))

(declare-fun array_inv!19092 (array!50147) Bool)

(assert (=> start!74086 (array_inv!19092 _keys!868)))

(declare-fun e!484380 () Bool)

(declare-fun array_inv!19093 (array!50149) Bool)

(assert (=> start!74086 (and (array_inv!19093 _values!688) e!484380)))

(declare-fun b!869557 () Bool)

(assert (=> b!869557 (= e!484377 (not true))))

(declare-fun +!2425 (ListLongMap!10027 tuple2!11256) ListLongMap!10027)

(assert (=> b!869557 (= (getCurrentListMapNoExtraKeys!3073 _keys!868 lt!394900 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2425 (getCurrentListMapNoExtraKeys!3073 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11257 k0!854 v!557)))))

(declare-datatypes ((Unit!29800 0))(
  ( (Unit!29801) )
))
(declare-fun lt!394898 () Unit!29800)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!596 (array!50147 array!50149 (_ BitVec 32) (_ BitVec 32) V!27673 V!27673 (_ BitVec 32) (_ BitVec 64) V!27673 (_ BitVec 32) Int) Unit!29800)

(assert (=> b!869557 (= lt!394898 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!596 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!27053 () Bool)

(declare-fun mapRes!27053 () Bool)

(assert (=> mapIsEmpty!27053 mapRes!27053))

(declare-fun b!869558 () Bool)

(declare-fun e!484376 () Bool)

(assert (=> b!869558 (= e!484380 (and e!484376 mapRes!27053))))

(declare-fun condMapEmpty!27053 () Bool)

(declare-fun mapDefault!27053 () ValueCell!8045)

(assert (=> b!869558 (= condMapEmpty!27053 (= (arr!24101 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8045)) mapDefault!27053)))))

(declare-fun b!869559 () Bool)

(assert (=> b!869559 (= e!484376 tp_is_empty!16969)))

(declare-fun b!869560 () Bool)

(declare-fun res!590607 () Bool)

(assert (=> b!869560 (=> (not res!590607) (not e!484378))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50147 (_ BitVec 32)) Bool)

(assert (=> b!869560 (= res!590607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!27053 () Bool)

(declare-fun tp!52003 () Bool)

(declare-fun e!484381 () Bool)

(assert (=> mapNonEmpty!27053 (= mapRes!27053 (and tp!52003 e!484381))))

(declare-fun mapValue!27053 () ValueCell!8045)

(declare-fun mapKey!27053 () (_ BitVec 32))

(declare-fun mapRest!27053 () (Array (_ BitVec 32) ValueCell!8045))

(assert (=> mapNonEmpty!27053 (= (arr!24101 _values!688) (store mapRest!27053 mapKey!27053 mapValue!27053))))

(declare-fun b!869561 () Bool)

(assert (=> b!869561 (= e!484381 tp_is_empty!16969)))

(assert (= (and start!74086 res!590610) b!869551))

(assert (= (and b!869551 res!590609) b!869552))

(assert (= (and b!869552 res!590604) b!869560))

(assert (= (and b!869560 res!590607) b!869553))

(assert (= (and b!869553 res!590606) b!869554))

(assert (= (and b!869554 res!590603) b!869555))

(assert (= (and b!869555 res!590611) b!869556))

(assert (= (and b!869556 res!590605) b!869550))

(assert (= (and b!869550 res!590608) b!869557))

(assert (= (and b!869558 condMapEmpty!27053) mapIsEmpty!27053))

(assert (= (and b!869558 (not condMapEmpty!27053)) mapNonEmpty!27053))

(get-info :version)

(assert (= (and mapNonEmpty!27053 ((_ is ValueCellFull!8045) mapValue!27053)) b!869561))

(assert (= (and b!869558 ((_ is ValueCellFull!8045) mapDefault!27053)) b!869559))

(assert (= start!74086 b!869558))

(declare-fun m!811607 () Bool)

(assert (=> b!869551 m!811607))

(declare-fun m!811609 () Bool)

(assert (=> b!869557 m!811609))

(declare-fun m!811611 () Bool)

(assert (=> b!869557 m!811611))

(assert (=> b!869557 m!811611))

(declare-fun m!811613 () Bool)

(assert (=> b!869557 m!811613))

(declare-fun m!811615 () Bool)

(assert (=> b!869557 m!811615))

(declare-fun m!811617 () Bool)

(assert (=> start!74086 m!811617))

(declare-fun m!811619 () Bool)

(assert (=> start!74086 m!811619))

(declare-fun m!811621 () Bool)

(assert (=> b!869556 m!811621))

(declare-fun m!811623 () Bool)

(assert (=> b!869560 m!811623))

(declare-fun m!811625 () Bool)

(assert (=> b!869550 m!811625))

(declare-fun m!811627 () Bool)

(assert (=> b!869550 m!811627))

(declare-fun m!811629 () Bool)

(assert (=> b!869550 m!811629))

(declare-fun m!811631 () Bool)

(assert (=> b!869553 m!811631))

(declare-fun m!811633 () Bool)

(assert (=> mapNonEmpty!27053 m!811633))

(declare-fun m!811635 () Bool)

(assert (=> b!869555 m!811635))

(check-sat (not b!869553) (not start!74086) (not b!869550) (not b!869551) (not b!869560) (not b!869555) tp_is_empty!16969 b_and!24595 (not b_next!14833) (not mapNonEmpty!27053) (not b!869557))
(check-sat b_and!24595 (not b_next!14833))
