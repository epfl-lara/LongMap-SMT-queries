; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73462 () Bool)

(assert start!73462)

(declare-fun b_free!14209 () Bool)

(declare-fun b_next!14209 () Bool)

(assert (=> start!73462 (= b_free!14209 (not b_next!14209))))

(declare-fun tp!50131 () Bool)

(declare-fun b_and!23575 () Bool)

(assert (=> start!73462 (= tp!50131 b_and!23575)))

(declare-fun b!855877 () Bool)

(declare-fun res!580966 () Bool)

(declare-fun e!477293 () Bool)

(assert (=> b!855877 (=> (not res!580966) (not e!477293))))

(declare-datatypes ((array!48935 0))(
  ( (array!48936 (arr!23494 (Array (_ BitVec 32) (_ BitVec 64))) (size!23935 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48935)

(declare-datatypes ((List!16598 0))(
  ( (Nil!16595) (Cons!16594 (h!17731 (_ BitVec 64)) (t!23231 List!16598)) )
))
(declare-fun arrayNoDuplicates!0 (array!48935 (_ BitVec 32) List!16598) Bool)

(assert (=> b!855877 (= res!580966 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16595))))

(declare-fun b!855878 () Bool)

(assert (=> b!855878 (= e!477293 false)))

(declare-datatypes ((V!26841 0))(
  ( (V!26842 (val!8220 Int)) )
))
(declare-fun v!557 () V!26841)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26841)

(declare-fun zeroValue!654 () V!26841)

(declare-datatypes ((tuple2!10754 0))(
  ( (tuple2!10755 (_1!5388 (_ BitVec 64)) (_2!5388 V!26841)) )
))
(declare-datatypes ((List!16599 0))(
  ( (Nil!16596) (Cons!16595 (h!17732 tuple2!10754) (t!23232 List!16599)) )
))
(declare-datatypes ((ListLongMap!9525 0))(
  ( (ListLongMap!9526 (toList!4778 List!16599)) )
))
(declare-fun lt!385976 () ListLongMap!9525)

(declare-datatypes ((ValueCell!7733 0))(
  ( (ValueCellFull!7733 (v!10645 V!26841)) (EmptyCell!7733) )
))
(declare-datatypes ((array!48937 0))(
  ( (array!48938 (arr!23495 (Array (_ BitVec 32) ValueCell!7733)) (size!23936 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48937)

(declare-fun getCurrentListMapNoExtraKeys!2834 (array!48935 array!48937 (_ BitVec 32) (_ BitVec 32) V!26841 V!26841 (_ BitVec 32) Int) ListLongMap!9525)

(assert (=> b!855878 (= lt!385976 (getCurrentListMapNoExtraKeys!2834 _keys!868 (array!48938 (store (arr!23495 _values!688) i!612 (ValueCellFull!7733 v!557)) (size!23936 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385975 () ListLongMap!9525)

(assert (=> b!855878 (= lt!385975 (getCurrentListMapNoExtraKeys!2834 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!855879 () Bool)

(declare-fun res!580965 () Bool)

(assert (=> b!855879 (=> (not res!580965) (not e!477293))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855879 (= res!580965 (validKeyInArray!0 k0!854))))

(declare-fun b!855880 () Bool)

(declare-fun e!477295 () Bool)

(declare-fun tp_is_empty!16345 () Bool)

(assert (=> b!855880 (= e!477295 tp_is_empty!16345)))

(declare-fun b!855881 () Bool)

(declare-fun res!580962 () Bool)

(assert (=> b!855881 (=> (not res!580962) (not e!477293))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855881 (= res!580962 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!26117 () Bool)

(declare-fun mapRes!26117 () Bool)

(assert (=> mapIsEmpty!26117 mapRes!26117))

(declare-fun b!855882 () Bool)

(declare-fun res!580967 () Bool)

(assert (=> b!855882 (=> (not res!580967) (not e!477293))))

(assert (=> b!855882 (= res!580967 (and (= (size!23936 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23935 _keys!868) (size!23936 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!580964 () Bool)

(assert (=> start!73462 (=> (not res!580964) (not e!477293))))

(assert (=> start!73462 (= res!580964 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23935 _keys!868))))))

(assert (=> start!73462 e!477293))

(assert (=> start!73462 tp_is_empty!16345))

(assert (=> start!73462 true))

(assert (=> start!73462 tp!50131))

(declare-fun array_inv!18668 (array!48935) Bool)

(assert (=> start!73462 (array_inv!18668 _keys!868)))

(declare-fun e!477292 () Bool)

(declare-fun array_inv!18669 (array!48937) Bool)

(assert (=> start!73462 (and (array_inv!18669 _values!688) e!477292)))

(declare-fun b!855883 () Bool)

(declare-fun res!580969 () Bool)

(assert (=> b!855883 (=> (not res!580969) (not e!477293))))

(assert (=> b!855883 (= res!580969 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23935 _keys!868))))))

(declare-fun mapNonEmpty!26117 () Bool)

(declare-fun tp!50132 () Bool)

(declare-fun e!477291 () Bool)

(assert (=> mapNonEmpty!26117 (= mapRes!26117 (and tp!50132 e!477291))))

(declare-fun mapKey!26117 () (_ BitVec 32))

(declare-fun mapRest!26117 () (Array (_ BitVec 32) ValueCell!7733))

(declare-fun mapValue!26117 () ValueCell!7733)

(assert (=> mapNonEmpty!26117 (= (arr!23495 _values!688) (store mapRest!26117 mapKey!26117 mapValue!26117))))

(declare-fun b!855884 () Bool)

(declare-fun res!580963 () Bool)

(assert (=> b!855884 (=> (not res!580963) (not e!477293))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48935 (_ BitVec 32)) Bool)

(assert (=> b!855884 (= res!580963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!855885 () Bool)

(assert (=> b!855885 (= e!477292 (and e!477295 mapRes!26117))))

(declare-fun condMapEmpty!26117 () Bool)

(declare-fun mapDefault!26117 () ValueCell!7733)

(assert (=> b!855885 (= condMapEmpty!26117 (= (arr!23495 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7733)) mapDefault!26117)))))

(declare-fun b!855886 () Bool)

(declare-fun res!580968 () Bool)

(assert (=> b!855886 (=> (not res!580968) (not e!477293))))

(assert (=> b!855886 (= res!580968 (and (= (select (arr!23494 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!855887 () Bool)

(assert (=> b!855887 (= e!477291 tp_is_empty!16345)))

(assert (= (and start!73462 res!580964) b!855881))

(assert (= (and b!855881 res!580962) b!855882))

(assert (= (and b!855882 res!580967) b!855884))

(assert (= (and b!855884 res!580963) b!855877))

(assert (= (and b!855877 res!580966) b!855883))

(assert (= (and b!855883 res!580969) b!855879))

(assert (= (and b!855879 res!580965) b!855886))

(assert (= (and b!855886 res!580968) b!855878))

(assert (= (and b!855885 condMapEmpty!26117) mapIsEmpty!26117))

(assert (= (and b!855885 (not condMapEmpty!26117)) mapNonEmpty!26117))

(get-info :version)

(assert (= (and mapNonEmpty!26117 ((_ is ValueCellFull!7733) mapValue!26117)) b!855887))

(assert (= (and b!855885 ((_ is ValueCellFull!7733) mapDefault!26117)) b!855880))

(assert (= start!73462 b!855885))

(declare-fun m!797621 () Bool)

(assert (=> b!855884 m!797621))

(declare-fun m!797623 () Bool)

(assert (=> b!855879 m!797623))

(declare-fun m!797625 () Bool)

(assert (=> mapNonEmpty!26117 m!797625))

(declare-fun m!797627 () Bool)

(assert (=> b!855877 m!797627))

(declare-fun m!797629 () Bool)

(assert (=> b!855881 m!797629))

(declare-fun m!797631 () Bool)

(assert (=> b!855886 m!797631))

(declare-fun m!797633 () Bool)

(assert (=> start!73462 m!797633))

(declare-fun m!797635 () Bool)

(assert (=> start!73462 m!797635))

(declare-fun m!797637 () Bool)

(assert (=> b!855878 m!797637))

(declare-fun m!797639 () Bool)

(assert (=> b!855878 m!797639))

(declare-fun m!797641 () Bool)

(assert (=> b!855878 m!797641))

(check-sat (not b!855884) (not b!855877) (not b!855881) (not b!855878) (not b!855879) (not b_next!14209) (not mapNonEmpty!26117) (not start!73462) b_and!23575 tp_is_empty!16345)
(check-sat b_and!23575 (not b_next!14209))
