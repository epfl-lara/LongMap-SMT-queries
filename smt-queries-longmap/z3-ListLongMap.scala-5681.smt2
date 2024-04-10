; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73872 () Bool)

(assert start!73872)

(declare-fun b_free!14787 () Bool)

(declare-fun b_next!14787 () Bool)

(assert (=> start!73872 (= b_free!14787 (not b_next!14787))))

(declare-fun tp!51865 () Bool)

(declare-fun b_and!24539 () Bool)

(assert (=> start!73872 (= tp!51865 b_and!24539)))

(declare-fun b!867819 () Bool)

(declare-fun res!589641 () Bool)

(declare-fun e!483381 () Bool)

(assert (=> b!867819 (=> (not res!589641) (not e!483381))))

(declare-datatypes ((array!50006 0))(
  ( (array!50007 (arr!24034 (Array (_ BitVec 32) (_ BitVec 64))) (size!24474 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50006)

(declare-datatypes ((List!17090 0))(
  ( (Nil!17087) (Cons!17086 (h!18217 (_ BitVec 64)) (t!24127 List!17090)) )
))
(declare-fun arrayNoDuplicates!0 (array!50006 (_ BitVec 32) List!17090) Bool)

(assert (=> b!867819 (= res!589641 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17087))))

(declare-fun b!867820 () Bool)

(declare-fun e!483384 () Bool)

(assert (=> b!867820 (= e!483384 (not true))))

(declare-datatypes ((V!27611 0))(
  ( (V!27612 (val!8509 Int)) )
))
(declare-fun v!557 () V!27611)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((ValueCell!8022 0))(
  ( (ValueCellFull!8022 (v!10934 V!27611)) (EmptyCell!8022) )
))
(declare-datatypes ((array!50008 0))(
  ( (array!50009 (arr!24035 (Array (_ BitVec 32) ValueCell!8022)) (size!24475 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50008)

(declare-fun minValue!654 () V!27611)

(declare-fun zeroValue!654 () V!27611)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lt!394261 () array!50008)

(declare-datatypes ((tuple2!11290 0))(
  ( (tuple2!11291 (_1!5656 (_ BitVec 64)) (_2!5656 V!27611)) )
))
(declare-datatypes ((List!17091 0))(
  ( (Nil!17088) (Cons!17087 (h!18218 tuple2!11290) (t!24128 List!17091)) )
))
(declare-datatypes ((ListLongMap!10059 0))(
  ( (ListLongMap!10060 (toList!5045 List!17091)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3014 (array!50006 array!50008 (_ BitVec 32) (_ BitVec 32) V!27611 V!27611 (_ BitVec 32) Int) ListLongMap!10059)

(declare-fun +!2390 (ListLongMap!10059 tuple2!11290) ListLongMap!10059)

(assert (=> b!867820 (= (getCurrentListMapNoExtraKeys!3014 _keys!868 lt!394261 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2390 (getCurrentListMapNoExtraKeys!3014 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11291 k0!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29778 0))(
  ( (Unit!29779) )
))
(declare-fun lt!394262 () Unit!29778)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!584 (array!50006 array!50008 (_ BitVec 32) (_ BitVec 32) V!27611 V!27611 (_ BitVec 32) (_ BitVec 64) V!27611 (_ BitVec 32) Int) Unit!29778)

(assert (=> b!867820 (= lt!394262 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!584 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!26984 () Bool)

(declare-fun mapRes!26984 () Bool)

(assert (=> mapIsEmpty!26984 mapRes!26984))

(declare-fun b!867821 () Bool)

(declare-fun res!589642 () Bool)

(assert (=> b!867821 (=> (not res!589642) (not e!483381))))

(assert (=> b!867821 (= res!589642 (and (= (select (arr!24034 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!589638 () Bool)

(assert (=> start!73872 (=> (not res!589638) (not e!483381))))

(assert (=> start!73872 (= res!589638 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24474 _keys!868))))))

(assert (=> start!73872 e!483381))

(declare-fun tp_is_empty!16923 () Bool)

(assert (=> start!73872 tp_is_empty!16923))

(assert (=> start!73872 true))

(assert (=> start!73872 tp!51865))

(declare-fun array_inv!18990 (array!50006) Bool)

(assert (=> start!73872 (array_inv!18990 _keys!868)))

(declare-fun e!483380 () Bool)

(declare-fun array_inv!18991 (array!50008) Bool)

(assert (=> start!73872 (and (array_inv!18991 _values!688) e!483380)))

(declare-fun b!867822 () Bool)

(declare-fun res!589643 () Bool)

(assert (=> b!867822 (=> (not res!589643) (not e!483381))))

(assert (=> b!867822 (= res!589643 (and (= (size!24475 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24474 _keys!868) (size!24475 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!26984 () Bool)

(declare-fun tp!51864 () Bool)

(declare-fun e!483382 () Bool)

(assert (=> mapNonEmpty!26984 (= mapRes!26984 (and tp!51864 e!483382))))

(declare-fun mapKey!26984 () (_ BitVec 32))

(declare-fun mapRest!26984 () (Array (_ BitVec 32) ValueCell!8022))

(declare-fun mapValue!26984 () ValueCell!8022)

(assert (=> mapNonEmpty!26984 (= (arr!24035 _values!688) (store mapRest!26984 mapKey!26984 mapValue!26984))))

(declare-fun b!867823 () Bool)

(declare-fun res!589644 () Bool)

(assert (=> b!867823 (=> (not res!589644) (not e!483381))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50006 (_ BitVec 32)) Bool)

(assert (=> b!867823 (= res!589644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!867824 () Bool)

(declare-fun res!589640 () Bool)

(assert (=> b!867824 (=> (not res!589640) (not e!483381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!867824 (= res!589640 (validMask!0 mask!1196))))

(declare-fun b!867825 () Bool)

(assert (=> b!867825 (= e!483381 e!483384)))

(declare-fun res!589645 () Bool)

(assert (=> b!867825 (=> (not res!589645) (not e!483384))))

(assert (=> b!867825 (= res!589645 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394264 () ListLongMap!10059)

(assert (=> b!867825 (= lt!394264 (getCurrentListMapNoExtraKeys!3014 _keys!868 lt!394261 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!867825 (= lt!394261 (array!50009 (store (arr!24035 _values!688) i!612 (ValueCellFull!8022 v!557)) (size!24475 _values!688)))))

(declare-fun lt!394263 () ListLongMap!10059)

(assert (=> b!867825 (= lt!394263 (getCurrentListMapNoExtraKeys!3014 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!867826 () Bool)

(declare-fun e!483385 () Bool)

(assert (=> b!867826 (= e!483385 tp_is_empty!16923)))

(declare-fun b!867827 () Bool)

(declare-fun res!589639 () Bool)

(assert (=> b!867827 (=> (not res!589639) (not e!483381))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!867827 (= res!589639 (validKeyInArray!0 k0!854))))

(declare-fun b!867828 () Bool)

(assert (=> b!867828 (= e!483382 tp_is_empty!16923)))

(declare-fun b!867829 () Bool)

(assert (=> b!867829 (= e!483380 (and e!483385 mapRes!26984))))

(declare-fun condMapEmpty!26984 () Bool)

(declare-fun mapDefault!26984 () ValueCell!8022)

(assert (=> b!867829 (= condMapEmpty!26984 (= (arr!24035 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8022)) mapDefault!26984)))))

(declare-fun b!867830 () Bool)

(declare-fun res!589646 () Bool)

(assert (=> b!867830 (=> (not res!589646) (not e!483381))))

(assert (=> b!867830 (= res!589646 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24474 _keys!868))))))

(assert (= (and start!73872 res!589638) b!867824))

(assert (= (and b!867824 res!589640) b!867822))

(assert (= (and b!867822 res!589643) b!867823))

(assert (= (and b!867823 res!589644) b!867819))

(assert (= (and b!867819 res!589641) b!867830))

(assert (= (and b!867830 res!589646) b!867827))

(assert (= (and b!867827 res!589639) b!867821))

(assert (= (and b!867821 res!589642) b!867825))

(assert (= (and b!867825 res!589645) b!867820))

(assert (= (and b!867829 condMapEmpty!26984) mapIsEmpty!26984))

(assert (= (and b!867829 (not condMapEmpty!26984)) mapNonEmpty!26984))

(get-info :version)

(assert (= (and mapNonEmpty!26984 ((_ is ValueCellFull!8022) mapValue!26984)) b!867828))

(assert (= (and b!867829 ((_ is ValueCellFull!8022) mapDefault!26984)) b!867826))

(assert (= start!73872 b!867829))

(declare-fun m!809627 () Bool)

(assert (=> mapNonEmpty!26984 m!809627))

(declare-fun m!809629 () Bool)

(assert (=> start!73872 m!809629))

(declare-fun m!809631 () Bool)

(assert (=> start!73872 m!809631))

(declare-fun m!809633 () Bool)

(assert (=> b!867819 m!809633))

(declare-fun m!809635 () Bool)

(assert (=> b!867823 m!809635))

(declare-fun m!809637 () Bool)

(assert (=> b!867825 m!809637))

(declare-fun m!809639 () Bool)

(assert (=> b!867825 m!809639))

(declare-fun m!809641 () Bool)

(assert (=> b!867825 m!809641))

(declare-fun m!809643 () Bool)

(assert (=> b!867827 m!809643))

(declare-fun m!809645 () Bool)

(assert (=> b!867824 m!809645))

(declare-fun m!809647 () Bool)

(assert (=> b!867821 m!809647))

(declare-fun m!809649 () Bool)

(assert (=> b!867820 m!809649))

(declare-fun m!809651 () Bool)

(assert (=> b!867820 m!809651))

(assert (=> b!867820 m!809651))

(declare-fun m!809653 () Bool)

(assert (=> b!867820 m!809653))

(declare-fun m!809655 () Bool)

(assert (=> b!867820 m!809655))

(check-sat (not b_next!14787) (not b!867819) b_and!24539 (not start!73872) (not b!867825) (not b!867820) (not b!867823) (not b!867824) (not b!867827) tp_is_empty!16923 (not mapNonEmpty!26984))
(check-sat b_and!24539 (not b_next!14787))
