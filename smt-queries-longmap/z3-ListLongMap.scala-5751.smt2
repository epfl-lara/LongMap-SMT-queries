; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74502 () Bool)

(assert start!74502)

(declare-fun b_free!15097 () Bool)

(declare-fun b_next!15097 () Bool)

(assert (=> start!74502 (= b_free!15097 (not b_next!15097))))

(declare-fun tp!52967 () Bool)

(declare-fun b_and!24883 () Bool)

(assert (=> start!74502 (= tp!52967 b_and!24883)))

(declare-fun b!875678 () Bool)

(declare-fun res!594839 () Bool)

(declare-fun e!487605 () Bool)

(assert (=> b!875678 (=> (not res!594839) (not e!487605))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!875678 (= res!594839 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!27620 () Bool)

(declare-fun mapRes!27620 () Bool)

(assert (=> mapIsEmpty!27620 mapRes!27620))

(declare-fun b!875679 () Bool)

(declare-fun res!594838 () Bool)

(assert (=> b!875679 (=> (not res!594838) (not e!487605))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50861 0))(
  ( (array!50862 (arr!24454 (Array (_ BitVec 32) (_ BitVec 64))) (size!24895 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50861)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!875679 (= res!594838 (and (= (select (arr!24454 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!594840 () Bool)

(assert (=> start!74502 (=> (not res!594840) (not e!487605))))

(assert (=> start!74502 (= res!594840 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24895 _keys!868))))))

(assert (=> start!74502 e!487605))

(declare-fun tp_is_empty!17341 () Bool)

(assert (=> start!74502 tp_is_empty!17341))

(assert (=> start!74502 true))

(assert (=> start!74502 tp!52967))

(declare-fun array_inv!19340 (array!50861) Bool)

(assert (=> start!74502 (array_inv!19340 _keys!868)))

(declare-datatypes ((V!28169 0))(
  ( (V!28170 (val!8718 Int)) )
))
(declare-datatypes ((ValueCell!8231 0))(
  ( (ValueCellFull!8231 (v!11147 V!28169)) (EmptyCell!8231) )
))
(declare-datatypes ((array!50863 0))(
  ( (array!50864 (arr!24455 (Array (_ BitVec 32) ValueCell!8231)) (size!24896 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50863)

(declare-fun e!487604 () Bool)

(declare-fun array_inv!19341 (array!50863) Bool)

(assert (=> start!74502 (and (array_inv!19341 _values!688) e!487604)))

(declare-fun b!875680 () Bool)

(declare-fun e!487606 () Bool)

(assert (=> b!875680 (= e!487604 (and e!487606 mapRes!27620))))

(declare-fun condMapEmpty!27620 () Bool)

(declare-fun mapDefault!27620 () ValueCell!8231)

(assert (=> b!875680 (= condMapEmpty!27620 (= (arr!24455 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8231)) mapDefault!27620)))))

(declare-fun mapNonEmpty!27620 () Bool)

(declare-fun tp!52966 () Bool)

(declare-fun e!487603 () Bool)

(assert (=> mapNonEmpty!27620 (= mapRes!27620 (and tp!52966 e!487603))))

(declare-fun mapRest!27620 () (Array (_ BitVec 32) ValueCell!8231))

(declare-fun mapKey!27620 () (_ BitVec 32))

(declare-fun mapValue!27620 () ValueCell!8231)

(assert (=> mapNonEmpty!27620 (= (arr!24455 _values!688) (store mapRest!27620 mapKey!27620 mapValue!27620))))

(declare-fun b!875681 () Bool)

(assert (=> b!875681 (= e!487605 false)))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28169)

(declare-fun zeroValue!654 () V!28169)

(declare-fun v!557 () V!28169)

(declare-datatypes ((tuple2!11446 0))(
  ( (tuple2!11447 (_1!5734 (_ BitVec 64)) (_2!5734 V!28169)) )
))
(declare-datatypes ((List!17293 0))(
  ( (Nil!17290) (Cons!17289 (h!18426 tuple2!11446) (t!24326 List!17293)) )
))
(declare-datatypes ((ListLongMap!10217 0))(
  ( (ListLongMap!10218 (toList!5124 List!17293)) )
))
(declare-fun lt!396366 () ListLongMap!10217)

(declare-fun getCurrentListMapNoExtraKeys!3167 (array!50861 array!50863 (_ BitVec 32) (_ BitVec 32) V!28169 V!28169 (_ BitVec 32) Int) ListLongMap!10217)

(assert (=> b!875681 (= lt!396366 (getCurrentListMapNoExtraKeys!3167 _keys!868 (array!50864 (store (arr!24455 _values!688) i!612 (ValueCellFull!8231 v!557)) (size!24896 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!396365 () ListLongMap!10217)

(assert (=> b!875681 (= lt!396365 (getCurrentListMapNoExtraKeys!3167 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!875682 () Bool)

(assert (=> b!875682 (= e!487603 tp_is_empty!17341)))

(declare-fun b!875683 () Bool)

(declare-fun res!594837 () Bool)

(assert (=> b!875683 (=> (not res!594837) (not e!487605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!875683 (= res!594837 (validMask!0 mask!1196))))

(declare-fun b!875684 () Bool)

(declare-fun res!594835 () Bool)

(assert (=> b!875684 (=> (not res!594835) (not e!487605))))

(assert (=> b!875684 (= res!594835 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24895 _keys!868))))))

(declare-fun b!875685 () Bool)

(declare-fun res!594836 () Bool)

(assert (=> b!875685 (=> (not res!594836) (not e!487605))))

(assert (=> b!875685 (= res!594836 (and (= (size!24896 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24895 _keys!868) (size!24896 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!875686 () Bool)

(declare-fun res!594842 () Bool)

(assert (=> b!875686 (=> (not res!594842) (not e!487605))))

(declare-datatypes ((List!17294 0))(
  ( (Nil!17291) (Cons!17290 (h!18427 (_ BitVec 64)) (t!24327 List!17294)) )
))
(declare-fun arrayNoDuplicates!0 (array!50861 (_ BitVec 32) List!17294) Bool)

(assert (=> b!875686 (= res!594842 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17291))))

(declare-fun b!875687 () Bool)

(assert (=> b!875687 (= e!487606 tp_is_empty!17341)))

(declare-fun b!875688 () Bool)

(declare-fun res!594841 () Bool)

(assert (=> b!875688 (=> (not res!594841) (not e!487605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50861 (_ BitVec 32)) Bool)

(assert (=> b!875688 (= res!594841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!74502 res!594840) b!875683))

(assert (= (and b!875683 res!594837) b!875685))

(assert (= (and b!875685 res!594836) b!875688))

(assert (= (and b!875688 res!594841) b!875686))

(assert (= (and b!875686 res!594842) b!875684))

(assert (= (and b!875684 res!594835) b!875678))

(assert (= (and b!875678 res!594839) b!875679))

(assert (= (and b!875679 res!594838) b!875681))

(assert (= (and b!875680 condMapEmpty!27620) mapIsEmpty!27620))

(assert (= (and b!875680 (not condMapEmpty!27620)) mapNonEmpty!27620))

(get-info :version)

(assert (= (and mapNonEmpty!27620 ((_ is ValueCellFull!8231) mapValue!27620)) b!875682))

(assert (= (and b!875680 ((_ is ValueCellFull!8231) mapDefault!27620)) b!875687))

(assert (= start!74502 b!875680))

(declare-fun m!816121 () Bool)

(assert (=> b!875678 m!816121))

(declare-fun m!816123 () Bool)

(assert (=> b!875679 m!816123))

(declare-fun m!816125 () Bool)

(assert (=> mapNonEmpty!27620 m!816125))

(declare-fun m!816127 () Bool)

(assert (=> b!875683 m!816127))

(declare-fun m!816129 () Bool)

(assert (=> b!875688 m!816129))

(declare-fun m!816131 () Bool)

(assert (=> b!875686 m!816131))

(declare-fun m!816133 () Bool)

(assert (=> start!74502 m!816133))

(declare-fun m!816135 () Bool)

(assert (=> start!74502 m!816135))

(declare-fun m!816137 () Bool)

(assert (=> b!875681 m!816137))

(declare-fun m!816139 () Bool)

(assert (=> b!875681 m!816139))

(declare-fun m!816141 () Bool)

(assert (=> b!875681 m!816141))

(check-sat (not b!875681) b_and!24883 (not mapNonEmpty!27620) (not start!74502) (not b!875688) tp_is_empty!17341 (not b!875683) (not b_next!15097) (not b!875678) (not b!875686))
(check-sat b_and!24883 (not b_next!15097))
