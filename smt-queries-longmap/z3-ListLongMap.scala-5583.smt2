; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73450 () Bool)

(assert start!73450)

(declare-fun b_free!14197 () Bool)

(declare-fun b_next!14197 () Bool)

(assert (=> start!73450 (= b_free!14197 (not b_next!14197))))

(declare-fun tp!50096 () Bool)

(declare-fun b_and!23563 () Bool)

(assert (=> start!73450 (= tp!50096 b_and!23563)))

(declare-fun res!580820 () Bool)

(declare-fun e!477205 () Bool)

(assert (=> start!73450 (=> (not res!580820) (not e!477205))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48911 0))(
  ( (array!48912 (arr!23482 (Array (_ BitVec 32) (_ BitVec 64))) (size!23923 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48911)

(assert (=> start!73450 (= res!580820 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23923 _keys!868))))))

(assert (=> start!73450 e!477205))

(declare-fun tp_is_empty!16333 () Bool)

(assert (=> start!73450 tp_is_empty!16333))

(assert (=> start!73450 true))

(assert (=> start!73450 tp!50096))

(declare-fun array_inv!18660 (array!48911) Bool)

(assert (=> start!73450 (array_inv!18660 _keys!868)))

(declare-datatypes ((V!26825 0))(
  ( (V!26826 (val!8214 Int)) )
))
(declare-datatypes ((ValueCell!7727 0))(
  ( (ValueCellFull!7727 (v!10639 V!26825)) (EmptyCell!7727) )
))
(declare-datatypes ((array!48913 0))(
  ( (array!48914 (arr!23483 (Array (_ BitVec 32) ValueCell!7727)) (size!23924 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48913)

(declare-fun e!477204 () Bool)

(declare-fun array_inv!18661 (array!48913) Bool)

(assert (=> start!73450 (and (array_inv!18661 _values!688) e!477204)))

(declare-fun mapIsEmpty!26099 () Bool)

(declare-fun mapRes!26099 () Bool)

(assert (=> mapIsEmpty!26099 mapRes!26099))

(declare-fun b!855679 () Bool)

(declare-fun res!580818 () Bool)

(assert (=> b!855679 (=> (not res!580818) (not e!477205))))

(declare-datatypes ((List!16587 0))(
  ( (Nil!16584) (Cons!16583 (h!17720 (_ BitVec 64)) (t!23220 List!16587)) )
))
(declare-fun arrayNoDuplicates!0 (array!48911 (_ BitVec 32) List!16587) Bool)

(assert (=> b!855679 (= res!580818 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16584))))

(declare-fun b!855680 () Bool)

(declare-fun res!580823 () Bool)

(assert (=> b!855680 (=> (not res!580823) (not e!477205))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!855680 (= res!580823 (and (= (select (arr!23482 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!26099 () Bool)

(declare-fun tp!50095 () Bool)

(declare-fun e!477203 () Bool)

(assert (=> mapNonEmpty!26099 (= mapRes!26099 (and tp!50095 e!477203))))

(declare-fun mapValue!26099 () ValueCell!7727)

(declare-fun mapKey!26099 () (_ BitVec 32))

(declare-fun mapRest!26099 () (Array (_ BitVec 32) ValueCell!7727))

(assert (=> mapNonEmpty!26099 (= (arr!23483 _values!688) (store mapRest!26099 mapKey!26099 mapValue!26099))))

(declare-fun b!855681 () Bool)

(declare-fun res!580824 () Bool)

(assert (=> b!855681 (=> (not res!580824) (not e!477205))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855681 (= res!580824 (validMask!0 mask!1196))))

(declare-fun b!855682 () Bool)

(assert (=> b!855682 (= e!477203 tp_is_empty!16333)))

(declare-fun b!855683 () Bool)

(declare-fun res!580822 () Bool)

(assert (=> b!855683 (=> (not res!580822) (not e!477205))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48911 (_ BitVec 32)) Bool)

(assert (=> b!855683 (= res!580822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!855684 () Bool)

(declare-fun e!477202 () Bool)

(assert (=> b!855684 (= e!477204 (and e!477202 mapRes!26099))))

(declare-fun condMapEmpty!26099 () Bool)

(declare-fun mapDefault!26099 () ValueCell!7727)

(assert (=> b!855684 (= condMapEmpty!26099 (= (arr!23483 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7727)) mapDefault!26099)))))

(declare-fun b!855685 () Bool)

(declare-fun res!580825 () Bool)

(assert (=> b!855685 (=> (not res!580825) (not e!477205))))

(assert (=> b!855685 (= res!580825 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23923 _keys!868))))))

(declare-fun b!855686 () Bool)

(declare-fun res!580819 () Bool)

(assert (=> b!855686 (=> (not res!580819) (not e!477205))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855686 (= res!580819 (validKeyInArray!0 k0!854))))

(declare-fun b!855687 () Bool)

(assert (=> b!855687 (= e!477205 false)))

(declare-fun v!557 () V!26825)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10742 0))(
  ( (tuple2!10743 (_1!5382 (_ BitVec 64)) (_2!5382 V!26825)) )
))
(declare-datatypes ((List!16588 0))(
  ( (Nil!16585) (Cons!16584 (h!17721 tuple2!10742) (t!23221 List!16588)) )
))
(declare-datatypes ((ListLongMap!9513 0))(
  ( (ListLongMap!9514 (toList!4772 List!16588)) )
))
(declare-fun lt!385940 () ListLongMap!9513)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!26825)

(declare-fun zeroValue!654 () V!26825)

(declare-fun getCurrentListMapNoExtraKeys!2828 (array!48911 array!48913 (_ BitVec 32) (_ BitVec 32) V!26825 V!26825 (_ BitVec 32) Int) ListLongMap!9513)

(assert (=> b!855687 (= lt!385940 (getCurrentListMapNoExtraKeys!2828 _keys!868 (array!48914 (store (arr!23483 _values!688) i!612 (ValueCellFull!7727 v!557)) (size!23924 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385939 () ListLongMap!9513)

(assert (=> b!855687 (= lt!385939 (getCurrentListMapNoExtraKeys!2828 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!855688 () Bool)

(assert (=> b!855688 (= e!477202 tp_is_empty!16333)))

(declare-fun b!855689 () Bool)

(declare-fun res!580821 () Bool)

(assert (=> b!855689 (=> (not res!580821) (not e!477205))))

(assert (=> b!855689 (= res!580821 (and (= (size!23924 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23923 _keys!868) (size!23924 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73450 res!580820) b!855681))

(assert (= (and b!855681 res!580824) b!855689))

(assert (= (and b!855689 res!580821) b!855683))

(assert (= (and b!855683 res!580822) b!855679))

(assert (= (and b!855679 res!580818) b!855685))

(assert (= (and b!855685 res!580825) b!855686))

(assert (= (and b!855686 res!580819) b!855680))

(assert (= (and b!855680 res!580823) b!855687))

(assert (= (and b!855684 condMapEmpty!26099) mapIsEmpty!26099))

(assert (= (and b!855684 (not condMapEmpty!26099)) mapNonEmpty!26099))

(get-info :version)

(assert (= (and mapNonEmpty!26099 ((_ is ValueCellFull!7727) mapValue!26099)) b!855682))

(assert (= (and b!855684 ((_ is ValueCellFull!7727) mapDefault!26099)) b!855688))

(assert (= start!73450 b!855684))

(declare-fun m!797489 () Bool)

(assert (=> b!855686 m!797489))

(declare-fun m!797491 () Bool)

(assert (=> b!855683 m!797491))

(declare-fun m!797493 () Bool)

(assert (=> start!73450 m!797493))

(declare-fun m!797495 () Bool)

(assert (=> start!73450 m!797495))

(declare-fun m!797497 () Bool)

(assert (=> b!855681 m!797497))

(declare-fun m!797499 () Bool)

(assert (=> mapNonEmpty!26099 m!797499))

(declare-fun m!797501 () Bool)

(assert (=> b!855687 m!797501))

(declare-fun m!797503 () Bool)

(assert (=> b!855687 m!797503))

(declare-fun m!797505 () Bool)

(assert (=> b!855687 m!797505))

(declare-fun m!797507 () Bool)

(assert (=> b!855680 m!797507))

(declare-fun m!797509 () Bool)

(assert (=> b!855679 m!797509))

(check-sat tp_is_empty!16333 (not b!855679) (not b!855687) (not mapNonEmpty!26099) (not b!855681) (not b_next!14197) (not b!855686) (not b!855683) (not start!73450) b_and!23563)
(check-sat b_and!23563 (not b_next!14197))
