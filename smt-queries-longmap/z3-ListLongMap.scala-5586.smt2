; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73282 () Bool)

(assert start!73282)

(declare-fun b_free!14215 () Bool)

(declare-fun b_next!14215 () Bool)

(assert (=> start!73282 (= b_free!14215 (not b_next!14215))))

(declare-fun tp!50150 () Bool)

(declare-fun b_and!23545 () Bool)

(assert (=> start!73282 (= tp!50150 b_and!23545)))

(declare-fun b!854834 () Bool)

(declare-fun res!580585 () Bool)

(declare-fun e!476609 () Bool)

(assert (=> b!854834 (=> (not res!580585) (not e!476609))))

(declare-datatypes ((array!48885 0))(
  ( (array!48886 (arr!23474 (Array (_ BitVec 32) (_ BitVec 64))) (size!23916 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48885)

(declare-datatypes ((List!16655 0))(
  ( (Nil!16652) (Cons!16651 (h!17782 (_ BitVec 64)) (t!23287 List!16655)) )
))
(declare-fun arrayNoDuplicates!0 (array!48885 (_ BitVec 32) List!16655) Bool)

(assert (=> b!854834 (= res!580585 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16652))))

(declare-fun b!854835 () Bool)

(declare-fun res!580580 () Bool)

(assert (=> b!854835 (=> (not res!580580) (not e!476609))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!854835 (= res!580580 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23916 _keys!868))))))

(declare-fun mapIsEmpty!26126 () Bool)

(declare-fun mapRes!26126 () Bool)

(assert (=> mapIsEmpty!26126 mapRes!26126))

(declare-fun res!580584 () Bool)

(assert (=> start!73282 (=> (not res!580584) (not e!476609))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73282 (= res!580584 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23916 _keys!868))))))

(assert (=> start!73282 e!476609))

(declare-fun tp_is_empty!16351 () Bool)

(assert (=> start!73282 tp_is_empty!16351))

(assert (=> start!73282 true))

(assert (=> start!73282 tp!50150))

(declare-fun array_inv!18678 (array!48885) Bool)

(assert (=> start!73282 (array_inv!18678 _keys!868)))

(declare-datatypes ((V!26849 0))(
  ( (V!26850 (val!8223 Int)) )
))
(declare-datatypes ((ValueCell!7736 0))(
  ( (ValueCellFull!7736 (v!10642 V!26849)) (EmptyCell!7736) )
))
(declare-datatypes ((array!48887 0))(
  ( (array!48888 (arr!23475 (Array (_ BitVec 32) ValueCell!7736)) (size!23917 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48887)

(declare-fun e!476607 () Bool)

(declare-fun array_inv!18679 (array!48887) Bool)

(assert (=> start!73282 (and (array_inv!18679 _values!688) e!476607)))

(declare-fun b!854836 () Bool)

(declare-fun e!476608 () Bool)

(assert (=> b!854836 (= e!476607 (and e!476608 mapRes!26126))))

(declare-fun condMapEmpty!26126 () Bool)

(declare-fun mapDefault!26126 () ValueCell!7736)

(assert (=> b!854836 (= condMapEmpty!26126 (= (arr!23475 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7736)) mapDefault!26126)))))

(declare-fun b!854837 () Bool)

(declare-fun res!580581 () Bool)

(assert (=> b!854837 (=> (not res!580581) (not e!476609))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!854837 (= res!580581 (validMask!0 mask!1196))))

(declare-fun b!854838 () Bool)

(declare-fun res!580582 () Bool)

(assert (=> b!854838 (=> (not res!580582) (not e!476609))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48885 (_ BitVec 32)) Bool)

(assert (=> b!854838 (= res!580582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!854839 () Bool)

(declare-fun e!476610 () Bool)

(assert (=> b!854839 (= e!476610 tp_is_empty!16351)))

(declare-fun b!854840 () Bool)

(assert (=> b!854840 (= e!476608 tp_is_empty!16351)))

(declare-fun b!854841 () Bool)

(declare-fun res!580586 () Bool)

(assert (=> b!854841 (=> (not res!580586) (not e!476609))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!854841 (= res!580586 (and (= (select (arr!23474 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!26126 () Bool)

(declare-fun tp!50149 () Bool)

(assert (=> mapNonEmpty!26126 (= mapRes!26126 (and tp!50149 e!476610))))

(declare-fun mapValue!26126 () ValueCell!7736)

(declare-fun mapKey!26126 () (_ BitVec 32))

(declare-fun mapRest!26126 () (Array (_ BitVec 32) ValueCell!7736))

(assert (=> mapNonEmpty!26126 (= (arr!23475 _values!688) (store mapRest!26126 mapKey!26126 mapValue!26126))))

(declare-fun b!854842 () Bool)

(declare-fun res!580583 () Bool)

(assert (=> b!854842 (=> (not res!580583) (not e!476609))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!854842 (= res!580583 (and (= (size!23917 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23916 _keys!868) (size!23917 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!854843 () Bool)

(declare-fun res!580587 () Bool)

(assert (=> b!854843 (=> (not res!580587) (not e!476609))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!854843 (= res!580587 (validKeyInArray!0 k0!854))))

(declare-fun b!854844 () Bool)

(assert (=> b!854844 (= e!476609 false)))

(declare-fun v!557 () V!26849)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!26849)

(declare-fun zeroValue!654 () V!26849)

(declare-datatypes ((tuple2!10844 0))(
  ( (tuple2!10845 (_1!5433 (_ BitVec 64)) (_2!5433 V!26849)) )
))
(declare-datatypes ((List!16656 0))(
  ( (Nil!16653) (Cons!16652 (h!17783 tuple2!10844) (t!23288 List!16656)) )
))
(declare-datatypes ((ListLongMap!9603 0))(
  ( (ListLongMap!9604 (toList!4817 List!16656)) )
))
(declare-fun lt!385397 () ListLongMap!9603)

(declare-fun getCurrentListMapNoExtraKeys!2824 (array!48885 array!48887 (_ BitVec 32) (_ BitVec 32) V!26849 V!26849 (_ BitVec 32) Int) ListLongMap!9603)

(assert (=> b!854844 (= lt!385397 (getCurrentListMapNoExtraKeys!2824 _keys!868 (array!48888 (store (arr!23475 _values!688) i!612 (ValueCellFull!7736 v!557)) (size!23917 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385396 () ListLongMap!9603)

(assert (=> b!854844 (= lt!385396 (getCurrentListMapNoExtraKeys!2824 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!73282 res!580584) b!854837))

(assert (= (and b!854837 res!580581) b!854842))

(assert (= (and b!854842 res!580583) b!854838))

(assert (= (and b!854838 res!580582) b!854834))

(assert (= (and b!854834 res!580585) b!854835))

(assert (= (and b!854835 res!580580) b!854843))

(assert (= (and b!854843 res!580587) b!854841))

(assert (= (and b!854841 res!580586) b!854844))

(assert (= (and b!854836 condMapEmpty!26126) mapIsEmpty!26126))

(assert (= (and b!854836 (not condMapEmpty!26126)) mapNonEmpty!26126))

(get-info :version)

(assert (= (and mapNonEmpty!26126 ((_ is ValueCellFull!7736) mapValue!26126)) b!854839))

(assert (= (and b!854836 ((_ is ValueCellFull!7736) mapDefault!26126)) b!854840))

(assert (= start!73282 b!854836))

(declare-fun m!795639 () Bool)

(assert (=> b!854837 m!795639))

(declare-fun m!795641 () Bool)

(assert (=> b!854841 m!795641))

(declare-fun m!795643 () Bool)

(assert (=> start!73282 m!795643))

(declare-fun m!795645 () Bool)

(assert (=> start!73282 m!795645))

(declare-fun m!795647 () Bool)

(assert (=> b!854843 m!795647))

(declare-fun m!795649 () Bool)

(assert (=> b!854834 m!795649))

(declare-fun m!795651 () Bool)

(assert (=> mapNonEmpty!26126 m!795651))

(declare-fun m!795653 () Bool)

(assert (=> b!854838 m!795653))

(declare-fun m!795655 () Bool)

(assert (=> b!854844 m!795655))

(declare-fun m!795657 () Bool)

(assert (=> b!854844 m!795657))

(declare-fun m!795659 () Bool)

(assert (=> b!854844 m!795659))

(check-sat (not b_next!14215) (not start!73282) (not b!854834) (not b!854843) tp_is_empty!16351 b_and!23545 (not mapNonEmpty!26126) (not b!854838) (not b!854837) (not b!854844))
(check-sat b_and!23545 (not b_next!14215))
