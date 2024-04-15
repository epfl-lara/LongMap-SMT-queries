; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73300 () Bool)

(assert start!73300)

(declare-fun b_free!14233 () Bool)

(declare-fun b_next!14233 () Bool)

(assert (=> start!73300 (= b_free!14233 (not b_next!14233))))

(declare-fun tp!50203 () Bool)

(declare-fun b_and!23563 () Bool)

(assert (=> start!73300 (= tp!50203 b_and!23563)))

(declare-fun b!855131 () Bool)

(declare-fun res!580800 () Bool)

(declare-fun e!476742 () Bool)

(assert (=> b!855131 (=> (not res!580800) (not e!476742))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855131 (= res!580800 (validKeyInArray!0 k0!854))))

(declare-fun res!580799 () Bool)

(assert (=> start!73300 (=> (not res!580799) (not e!476742))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48921 0))(
  ( (array!48922 (arr!23492 (Array (_ BitVec 32) (_ BitVec 64))) (size!23934 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48921)

(assert (=> start!73300 (= res!580799 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23934 _keys!868))))))

(assert (=> start!73300 e!476742))

(declare-fun tp_is_empty!16369 () Bool)

(assert (=> start!73300 tp_is_empty!16369))

(assert (=> start!73300 true))

(assert (=> start!73300 tp!50203))

(declare-fun array_inv!18686 (array!48921) Bool)

(assert (=> start!73300 (array_inv!18686 _keys!868)))

(declare-datatypes ((V!26873 0))(
  ( (V!26874 (val!8232 Int)) )
))
(declare-datatypes ((ValueCell!7745 0))(
  ( (ValueCellFull!7745 (v!10651 V!26873)) (EmptyCell!7745) )
))
(declare-datatypes ((array!48923 0))(
  ( (array!48924 (arr!23493 (Array (_ BitVec 32) ValueCell!7745)) (size!23935 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48923)

(declare-fun e!476743 () Bool)

(declare-fun array_inv!18687 (array!48923) Bool)

(assert (=> start!73300 (and (array_inv!18687 _values!688) e!476743)))

(declare-fun mapNonEmpty!26153 () Bool)

(declare-fun mapRes!26153 () Bool)

(declare-fun tp!50204 () Bool)

(declare-fun e!476745 () Bool)

(assert (=> mapNonEmpty!26153 (= mapRes!26153 (and tp!50204 e!476745))))

(declare-fun mapKey!26153 () (_ BitVec 32))

(declare-fun mapValue!26153 () ValueCell!7745)

(declare-fun mapRest!26153 () (Array (_ BitVec 32) ValueCell!7745))

(assert (=> mapNonEmpty!26153 (= (arr!23493 _values!688) (store mapRest!26153 mapKey!26153 mapValue!26153))))

(declare-fun b!855132 () Bool)

(declare-fun res!580801 () Bool)

(assert (=> b!855132 (=> (not res!580801) (not e!476742))))

(declare-datatypes ((List!16668 0))(
  ( (Nil!16665) (Cons!16664 (h!17795 (_ BitVec 64)) (t!23300 List!16668)) )
))
(declare-fun arrayNoDuplicates!0 (array!48921 (_ BitVec 32) List!16668) Bool)

(assert (=> b!855132 (= res!580801 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16665))))

(declare-fun b!855133 () Bool)

(declare-fun res!580803 () Bool)

(assert (=> b!855133 (=> (not res!580803) (not e!476742))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855133 (= res!580803 (validMask!0 mask!1196))))

(declare-fun b!855134 () Bool)

(declare-fun res!580797 () Bool)

(assert (=> b!855134 (=> (not res!580797) (not e!476742))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!855134 (= res!580797 (and (= (select (arr!23492 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!26153 () Bool)

(assert (=> mapIsEmpty!26153 mapRes!26153))

(declare-fun b!855135 () Bool)

(declare-fun e!476741 () Bool)

(assert (=> b!855135 (= e!476741 tp_is_empty!16369)))

(declare-fun b!855136 () Bool)

(assert (=> b!855136 (= e!476742 false)))

(declare-datatypes ((tuple2!10858 0))(
  ( (tuple2!10859 (_1!5440 (_ BitVec 64)) (_2!5440 V!26873)) )
))
(declare-datatypes ((List!16669 0))(
  ( (Nil!16666) (Cons!16665 (h!17796 tuple2!10858) (t!23301 List!16669)) )
))
(declare-datatypes ((ListLongMap!9617 0))(
  ( (ListLongMap!9618 (toList!4824 List!16669)) )
))
(declare-fun lt!385450 () ListLongMap!9617)

(declare-fun v!557 () V!26873)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!26873)

(declare-fun zeroValue!654 () V!26873)

(declare-fun getCurrentListMapNoExtraKeys!2831 (array!48921 array!48923 (_ BitVec 32) (_ BitVec 32) V!26873 V!26873 (_ BitVec 32) Int) ListLongMap!9617)

(assert (=> b!855136 (= lt!385450 (getCurrentListMapNoExtraKeys!2831 _keys!868 (array!48924 (store (arr!23493 _values!688) i!612 (ValueCellFull!7745 v!557)) (size!23935 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385451 () ListLongMap!9617)

(assert (=> b!855136 (= lt!385451 (getCurrentListMapNoExtraKeys!2831 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!855137 () Bool)

(assert (=> b!855137 (= e!476743 (and e!476741 mapRes!26153))))

(declare-fun condMapEmpty!26153 () Bool)

(declare-fun mapDefault!26153 () ValueCell!7745)

(assert (=> b!855137 (= condMapEmpty!26153 (= (arr!23493 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7745)) mapDefault!26153)))))

(declare-fun b!855138 () Bool)

(assert (=> b!855138 (= e!476745 tp_is_empty!16369)))

(declare-fun b!855139 () Bool)

(declare-fun res!580802 () Bool)

(assert (=> b!855139 (=> (not res!580802) (not e!476742))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48921 (_ BitVec 32)) Bool)

(assert (=> b!855139 (= res!580802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!855140 () Bool)

(declare-fun res!580796 () Bool)

(assert (=> b!855140 (=> (not res!580796) (not e!476742))))

(assert (=> b!855140 (= res!580796 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23934 _keys!868))))))

(declare-fun b!855141 () Bool)

(declare-fun res!580798 () Bool)

(assert (=> b!855141 (=> (not res!580798) (not e!476742))))

(assert (=> b!855141 (= res!580798 (and (= (size!23935 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23934 _keys!868) (size!23935 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73300 res!580799) b!855133))

(assert (= (and b!855133 res!580803) b!855141))

(assert (= (and b!855141 res!580798) b!855139))

(assert (= (and b!855139 res!580802) b!855132))

(assert (= (and b!855132 res!580801) b!855140))

(assert (= (and b!855140 res!580796) b!855131))

(assert (= (and b!855131 res!580800) b!855134))

(assert (= (and b!855134 res!580797) b!855136))

(assert (= (and b!855137 condMapEmpty!26153) mapIsEmpty!26153))

(assert (= (and b!855137 (not condMapEmpty!26153)) mapNonEmpty!26153))

(get-info :version)

(assert (= (and mapNonEmpty!26153 ((_ is ValueCellFull!7745) mapValue!26153)) b!855138))

(assert (= (and b!855137 ((_ is ValueCellFull!7745) mapDefault!26153)) b!855135))

(assert (= start!73300 b!855137))

(declare-fun m!795837 () Bool)

(assert (=> b!855133 m!795837))

(declare-fun m!795839 () Bool)

(assert (=> b!855131 m!795839))

(declare-fun m!795841 () Bool)

(assert (=> mapNonEmpty!26153 m!795841))

(declare-fun m!795843 () Bool)

(assert (=> b!855139 m!795843))

(declare-fun m!795845 () Bool)

(assert (=> start!73300 m!795845))

(declare-fun m!795847 () Bool)

(assert (=> start!73300 m!795847))

(declare-fun m!795849 () Bool)

(assert (=> b!855134 m!795849))

(declare-fun m!795851 () Bool)

(assert (=> b!855136 m!795851))

(declare-fun m!795853 () Bool)

(assert (=> b!855136 m!795853))

(declare-fun m!795855 () Bool)

(assert (=> b!855136 m!795855))

(declare-fun m!795857 () Bool)

(assert (=> b!855132 m!795857))

(check-sat tp_is_empty!16369 (not b!855133) (not mapNonEmpty!26153) (not b!855139) (not b!855131) (not b!855132) b_and!23563 (not start!73300) (not b_next!14233) (not b!855136))
(check-sat b_and!23563 (not b_next!14233))
