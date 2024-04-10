; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74040 () Bool)

(assert start!74040)

(declare-fun b_free!14955 () Bool)

(declare-fun b_next!14955 () Bool)

(assert (=> start!74040 (= b_free!14955 (not b_next!14955))))

(declare-fun tp!52369 () Bool)

(declare-fun b_and!24707 () Bool)

(assert (=> start!74040 (= tp!52369 b_and!24707)))

(declare-fun b!870843 () Bool)

(declare-fun res!591913 () Bool)

(declare-fun e!484893 () Bool)

(assert (=> b!870843 (=> (not res!591913) (not e!484893))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27835 0))(
  ( (V!27836 (val!8593 Int)) )
))
(declare-datatypes ((ValueCell!8106 0))(
  ( (ValueCellFull!8106 (v!11018 V!27835)) (EmptyCell!8106) )
))
(declare-datatypes ((array!50326 0))(
  ( (array!50327 (arr!24194 (Array (_ BitVec 32) ValueCell!8106)) (size!24634 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50326)

(declare-datatypes ((array!50328 0))(
  ( (array!50329 (arr!24195 (Array (_ BitVec 32) (_ BitVec 64))) (size!24635 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50328)

(assert (=> b!870843 (= res!591913 (and (= (size!24634 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24635 _keys!868) (size!24634 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!870844 () Bool)

(declare-fun res!591911 () Bool)

(assert (=> b!870844 (=> (not res!591911) (not e!484893))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!870844 (= res!591911 (validKeyInArray!0 k0!854))))

(declare-fun b!870845 () Bool)

(declare-fun e!484892 () Bool)

(declare-fun e!484895 () Bool)

(declare-fun mapRes!27236 () Bool)

(assert (=> b!870845 (= e!484892 (and e!484895 mapRes!27236))))

(declare-fun condMapEmpty!27236 () Bool)

(declare-fun mapDefault!27236 () ValueCell!8106)

(assert (=> b!870845 (= condMapEmpty!27236 (= (arr!24194 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8106)) mapDefault!27236)))))

(declare-fun res!591907 () Bool)

(assert (=> start!74040 (=> (not res!591907) (not e!484893))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74040 (= res!591907 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24635 _keys!868))))))

(assert (=> start!74040 e!484893))

(declare-fun tp_is_empty!17091 () Bool)

(assert (=> start!74040 tp_is_empty!17091))

(assert (=> start!74040 true))

(assert (=> start!74040 tp!52369))

(declare-fun array_inv!19106 (array!50328) Bool)

(assert (=> start!74040 (array_inv!19106 _keys!868)))

(declare-fun array_inv!19107 (array!50326) Bool)

(assert (=> start!74040 (and (array_inv!19107 _values!688) e!484892)))

(declare-fun b!870846 () Bool)

(declare-fun e!484894 () Bool)

(assert (=> b!870846 (= e!484893 e!484894)))

(declare-fun res!591906 () Bool)

(assert (=> b!870846 (=> (not res!591906) (not e!484894))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!870846 (= res!591906 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((tuple2!11416 0))(
  ( (tuple2!11417 (_1!5719 (_ BitVec 64)) (_2!5719 V!27835)) )
))
(declare-datatypes ((List!17205 0))(
  ( (Nil!17202) (Cons!17201 (h!18332 tuple2!11416) (t!24242 List!17205)) )
))
(declare-datatypes ((ListLongMap!10185 0))(
  ( (ListLongMap!10186 (toList!5108 List!17205)) )
))
(declare-fun lt!395269 () ListLongMap!10185)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!395271 () array!50326)

(declare-fun minValue!654 () V!27835)

(declare-fun zeroValue!654 () V!27835)

(declare-fun getCurrentListMapNoExtraKeys!3077 (array!50328 array!50326 (_ BitVec 32) (_ BitVec 32) V!27835 V!27835 (_ BitVec 32) Int) ListLongMap!10185)

(assert (=> b!870846 (= lt!395269 (getCurrentListMapNoExtraKeys!3077 _keys!868 lt!395271 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27835)

(assert (=> b!870846 (= lt!395271 (array!50327 (store (arr!24194 _values!688) i!612 (ValueCellFull!8106 v!557)) (size!24634 _values!688)))))

(declare-fun lt!395270 () ListLongMap!10185)

(assert (=> b!870846 (= lt!395270 (getCurrentListMapNoExtraKeys!3077 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!870847 () Bool)

(declare-fun res!591910 () Bool)

(assert (=> b!870847 (=> (not res!591910) (not e!484893))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50328 (_ BitVec 32)) Bool)

(assert (=> b!870847 (= res!591910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!27236 () Bool)

(assert (=> mapIsEmpty!27236 mapRes!27236))

(declare-fun b!870848 () Bool)

(declare-fun res!591908 () Bool)

(assert (=> b!870848 (=> (not res!591908) (not e!484893))))

(declare-datatypes ((List!17206 0))(
  ( (Nil!17203) (Cons!17202 (h!18333 (_ BitVec 64)) (t!24243 List!17206)) )
))
(declare-fun arrayNoDuplicates!0 (array!50328 (_ BitVec 32) List!17206) Bool)

(assert (=> b!870848 (= res!591908 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17203))))

(declare-fun b!870849 () Bool)

(declare-fun e!484896 () Bool)

(assert (=> b!870849 (= e!484896 tp_is_empty!17091)))

(declare-fun b!870850 () Bool)

(declare-fun res!591912 () Bool)

(assert (=> b!870850 (=> (not res!591912) (not e!484893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!870850 (= res!591912 (validMask!0 mask!1196))))

(declare-fun b!870851 () Bool)

(assert (=> b!870851 (= e!484894 (not true))))

(declare-fun +!2445 (ListLongMap!10185 tuple2!11416) ListLongMap!10185)

(assert (=> b!870851 (= (getCurrentListMapNoExtraKeys!3077 _keys!868 lt!395271 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2445 (getCurrentListMapNoExtraKeys!3077 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11417 k0!854 v!557)))))

(declare-datatypes ((Unit!29888 0))(
  ( (Unit!29889) )
))
(declare-fun lt!395272 () Unit!29888)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!639 (array!50328 array!50326 (_ BitVec 32) (_ BitVec 32) V!27835 V!27835 (_ BitVec 32) (_ BitVec 64) V!27835 (_ BitVec 32) Int) Unit!29888)

(assert (=> b!870851 (= lt!395272 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!639 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!870852 () Bool)

(declare-fun res!591914 () Bool)

(assert (=> b!870852 (=> (not res!591914) (not e!484893))))

(assert (=> b!870852 (= res!591914 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24635 _keys!868))))))

(declare-fun b!870853 () Bool)

(assert (=> b!870853 (= e!484895 tp_is_empty!17091)))

(declare-fun mapNonEmpty!27236 () Bool)

(declare-fun tp!52368 () Bool)

(assert (=> mapNonEmpty!27236 (= mapRes!27236 (and tp!52368 e!484896))))

(declare-fun mapValue!27236 () ValueCell!8106)

(declare-fun mapRest!27236 () (Array (_ BitVec 32) ValueCell!8106))

(declare-fun mapKey!27236 () (_ BitVec 32))

(assert (=> mapNonEmpty!27236 (= (arr!24194 _values!688) (store mapRest!27236 mapKey!27236 mapValue!27236))))

(declare-fun b!870854 () Bool)

(declare-fun res!591909 () Bool)

(assert (=> b!870854 (=> (not res!591909) (not e!484893))))

(assert (=> b!870854 (= res!591909 (and (= (select (arr!24195 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!74040 res!591907) b!870850))

(assert (= (and b!870850 res!591912) b!870843))

(assert (= (and b!870843 res!591913) b!870847))

(assert (= (and b!870847 res!591910) b!870848))

(assert (= (and b!870848 res!591908) b!870852))

(assert (= (and b!870852 res!591914) b!870844))

(assert (= (and b!870844 res!591911) b!870854))

(assert (= (and b!870854 res!591909) b!870846))

(assert (= (and b!870846 res!591906) b!870851))

(assert (= (and b!870845 condMapEmpty!27236) mapIsEmpty!27236))

(assert (= (and b!870845 (not condMapEmpty!27236)) mapNonEmpty!27236))

(get-info :version)

(assert (= (and mapNonEmpty!27236 ((_ is ValueCellFull!8106) mapValue!27236)) b!870849))

(assert (= (and b!870845 ((_ is ValueCellFull!8106) mapDefault!27236)) b!870853))

(assert (= start!74040 b!870845))

(declare-fun m!812147 () Bool)

(assert (=> b!870847 m!812147))

(declare-fun m!812149 () Bool)

(assert (=> b!870844 m!812149))

(declare-fun m!812151 () Bool)

(assert (=> start!74040 m!812151))

(declare-fun m!812153 () Bool)

(assert (=> start!74040 m!812153))

(declare-fun m!812155 () Bool)

(assert (=> mapNonEmpty!27236 m!812155))

(declare-fun m!812157 () Bool)

(assert (=> b!870848 m!812157))

(declare-fun m!812159 () Bool)

(assert (=> b!870854 m!812159))

(declare-fun m!812161 () Bool)

(assert (=> b!870851 m!812161))

(declare-fun m!812163 () Bool)

(assert (=> b!870851 m!812163))

(assert (=> b!870851 m!812163))

(declare-fun m!812165 () Bool)

(assert (=> b!870851 m!812165))

(declare-fun m!812167 () Bool)

(assert (=> b!870851 m!812167))

(declare-fun m!812169 () Bool)

(assert (=> b!870846 m!812169))

(declare-fun m!812171 () Bool)

(assert (=> b!870846 m!812171))

(declare-fun m!812173 () Bool)

(assert (=> b!870846 m!812173))

(declare-fun m!812175 () Bool)

(assert (=> b!870850 m!812175))

(check-sat (not b!870848) (not start!74040) (not b!870844) (not b_next!14955) (not b!870846) b_and!24707 (not b!870847) (not b!870850) tp_is_empty!17091 (not b!870851) (not mapNonEmpty!27236))
(check-sat b_and!24707 (not b_next!14955))
