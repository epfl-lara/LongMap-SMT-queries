; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73480 () Bool)

(assert start!73480)

(declare-fun b_free!14227 () Bool)

(declare-fun b_next!14227 () Bool)

(assert (=> start!73480 (= b_free!14227 (not b_next!14227))))

(declare-fun tp!50186 () Bool)

(declare-fun b_and!23593 () Bool)

(assert (=> start!73480 (= tp!50186 b_and!23593)))

(declare-fun b!856174 () Bool)

(declare-fun res!581181 () Bool)

(declare-fun e!477428 () Bool)

(assert (=> b!856174 (=> (not res!581181) (not e!477428))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!48969 0))(
  ( (array!48970 (arr!23511 (Array (_ BitVec 32) (_ BitVec 64))) (size!23952 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48969)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!856174 (= res!581181 (and (= (select (arr!23511 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!26144 () Bool)

(declare-fun mapRes!26144 () Bool)

(assert (=> mapIsEmpty!26144 mapRes!26144))

(declare-fun b!856175 () Bool)

(declare-fun res!581184 () Bool)

(assert (=> b!856175 (=> (not res!581184) (not e!477428))))

(declare-datatypes ((List!16610 0))(
  ( (Nil!16607) (Cons!16606 (h!17743 (_ BitVec 64)) (t!23243 List!16610)) )
))
(declare-fun arrayNoDuplicates!0 (array!48969 (_ BitVec 32) List!16610) Bool)

(assert (=> b!856175 (= res!581184 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16607))))

(declare-fun b!856176 () Bool)

(declare-fun res!581179 () Bool)

(assert (=> b!856176 (=> (not res!581179) (not e!477428))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48969 (_ BitVec 32)) Bool)

(assert (=> b!856176 (= res!581179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!856177 () Bool)

(declare-fun e!477429 () Bool)

(declare-fun e!477426 () Bool)

(assert (=> b!856177 (= e!477429 (and e!477426 mapRes!26144))))

(declare-fun condMapEmpty!26144 () Bool)

(declare-datatypes ((V!26865 0))(
  ( (V!26866 (val!8229 Int)) )
))
(declare-datatypes ((ValueCell!7742 0))(
  ( (ValueCellFull!7742 (v!10654 V!26865)) (EmptyCell!7742) )
))
(declare-datatypes ((array!48971 0))(
  ( (array!48972 (arr!23512 (Array (_ BitVec 32) ValueCell!7742)) (size!23953 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48971)

(declare-fun mapDefault!26144 () ValueCell!7742)

(assert (=> b!856177 (= condMapEmpty!26144 (= (arr!23512 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7742)) mapDefault!26144)))))

(declare-fun res!581178 () Bool)

(assert (=> start!73480 (=> (not res!581178) (not e!477428))))

(assert (=> start!73480 (= res!581178 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23952 _keys!868))))))

(assert (=> start!73480 e!477428))

(declare-fun tp_is_empty!16363 () Bool)

(assert (=> start!73480 tp_is_empty!16363))

(assert (=> start!73480 true))

(assert (=> start!73480 tp!50186))

(declare-fun array_inv!18680 (array!48969) Bool)

(assert (=> start!73480 (array_inv!18680 _keys!868)))

(declare-fun array_inv!18681 (array!48971) Bool)

(assert (=> start!73480 (and (array_inv!18681 _values!688) e!477429)))

(declare-fun b!856178 () Bool)

(declare-fun res!581183 () Bool)

(assert (=> b!856178 (=> (not res!581183) (not e!477428))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856178 (= res!581183 (validMask!0 mask!1196))))

(declare-fun b!856179 () Bool)

(declare-fun e!477430 () Bool)

(assert (=> b!856179 (= e!477430 tp_is_empty!16363)))

(declare-fun mapNonEmpty!26144 () Bool)

(declare-fun tp!50185 () Bool)

(assert (=> mapNonEmpty!26144 (= mapRes!26144 (and tp!50185 e!477430))))

(declare-fun mapValue!26144 () ValueCell!7742)

(declare-fun mapKey!26144 () (_ BitVec 32))

(declare-fun mapRest!26144 () (Array (_ BitVec 32) ValueCell!7742))

(assert (=> mapNonEmpty!26144 (= (arr!23512 _values!688) (store mapRest!26144 mapKey!26144 mapValue!26144))))

(declare-fun b!856180 () Bool)

(declare-fun res!581182 () Bool)

(assert (=> b!856180 (=> (not res!581182) (not e!477428))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!856180 (= res!581182 (and (= (size!23953 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23952 _keys!868) (size!23953 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!856181 () Bool)

(assert (=> b!856181 (= e!477428 false)))

(declare-fun v!557 () V!26865)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!26865)

(declare-fun zeroValue!654 () V!26865)

(declare-datatypes ((tuple2!10766 0))(
  ( (tuple2!10767 (_1!5394 (_ BitVec 64)) (_2!5394 V!26865)) )
))
(declare-datatypes ((List!16611 0))(
  ( (Nil!16608) (Cons!16607 (h!17744 tuple2!10766) (t!23244 List!16611)) )
))
(declare-datatypes ((ListLongMap!9537 0))(
  ( (ListLongMap!9538 (toList!4784 List!16611)) )
))
(declare-fun lt!386030 () ListLongMap!9537)

(declare-fun getCurrentListMapNoExtraKeys!2840 (array!48969 array!48971 (_ BitVec 32) (_ BitVec 32) V!26865 V!26865 (_ BitVec 32) Int) ListLongMap!9537)

(assert (=> b!856181 (= lt!386030 (getCurrentListMapNoExtraKeys!2840 _keys!868 (array!48972 (store (arr!23512 _values!688) i!612 (ValueCellFull!7742 v!557)) (size!23953 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!386029 () ListLongMap!9537)

(assert (=> b!856181 (= lt!386029 (getCurrentListMapNoExtraKeys!2840 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!856182 () Bool)

(assert (=> b!856182 (= e!477426 tp_is_empty!16363)))

(declare-fun b!856183 () Bool)

(declare-fun res!581185 () Bool)

(assert (=> b!856183 (=> (not res!581185) (not e!477428))))

(assert (=> b!856183 (= res!581185 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23952 _keys!868))))))

(declare-fun b!856184 () Bool)

(declare-fun res!581180 () Bool)

(assert (=> b!856184 (=> (not res!581180) (not e!477428))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!856184 (= res!581180 (validKeyInArray!0 k0!854))))

(assert (= (and start!73480 res!581178) b!856178))

(assert (= (and b!856178 res!581183) b!856180))

(assert (= (and b!856180 res!581182) b!856176))

(assert (= (and b!856176 res!581179) b!856175))

(assert (= (and b!856175 res!581184) b!856183))

(assert (= (and b!856183 res!581185) b!856184))

(assert (= (and b!856184 res!581180) b!856174))

(assert (= (and b!856174 res!581181) b!856181))

(assert (= (and b!856177 condMapEmpty!26144) mapIsEmpty!26144))

(assert (= (and b!856177 (not condMapEmpty!26144)) mapNonEmpty!26144))

(get-info :version)

(assert (= (and mapNonEmpty!26144 ((_ is ValueCellFull!7742) mapValue!26144)) b!856179))

(assert (= (and b!856177 ((_ is ValueCellFull!7742) mapDefault!26144)) b!856182))

(assert (= start!73480 b!856177))

(declare-fun m!797819 () Bool)

(assert (=> mapNonEmpty!26144 m!797819))

(declare-fun m!797821 () Bool)

(assert (=> b!856184 m!797821))

(declare-fun m!797823 () Bool)

(assert (=> b!856174 m!797823))

(declare-fun m!797825 () Bool)

(assert (=> b!856175 m!797825))

(declare-fun m!797827 () Bool)

(assert (=> start!73480 m!797827))

(declare-fun m!797829 () Bool)

(assert (=> start!73480 m!797829))

(declare-fun m!797831 () Bool)

(assert (=> b!856176 m!797831))

(declare-fun m!797833 () Bool)

(assert (=> b!856181 m!797833))

(declare-fun m!797835 () Bool)

(assert (=> b!856181 m!797835))

(declare-fun m!797837 () Bool)

(assert (=> b!856181 m!797837))

(declare-fun m!797839 () Bool)

(assert (=> b!856178 m!797839))

(check-sat (not mapNonEmpty!26144) (not b!856181) b_and!23593 (not b!856184) (not b!856178) (not start!73480) (not b_next!14227) (not b!856175) (not b!856176) tp_is_empty!16363)
(check-sat b_and!23593 (not b_next!14227))
